import { useState } from 'react';
import { Home, Sparkles, Brain } from 'lucide-react';
import { LandingPage } from './components/LandingPage';
import { RecommendedPage } from './components/RecommendedPage';
import { AdaptivePage } from './components/AdaptivePage';

type TabType = 'home' | 'recommended' | 'adaptive';

export default function App() {
  const [activeTab, setActiveTab] = useState<TabType>('home');

  const tabs = [
    { id: 'home' as TabType, label: 'Home', icon: Home },
    { id: 'recommended' as TabType, label: 'Recommended', icon: Sparkles },
    { id: 'adaptive' as TabType, label: 'Adaptive', icon: Brain }
  ];

  const renderPage = () => {
    switch (activeTab) {
      case 'home':
        return <LandingPage />;
      case 'recommended':
        return <RecommendedPage />;
      case 'adaptive':
        return <AdaptivePage />;
      default:
        return <LandingPage />;
    }
  };

  return (
    <div className="min-h-screen bg-gray-bg max-w-md mx-auto relative">
      {/* Main Content */}
      <main className="relative">
        {renderPage()}
      </main>

      {/* Bottom Navigation */}
      <nav className="fixed bottom-0 left-1/2 -translate-x-1/2 w-full max-w-md bg-white border-t border-border z-50">
        <div className="px-2">
          <div className="flex items-center justify-around">
            {tabs.map((tab) => {
              const Icon = tab.icon;
              const isActive = activeTab === tab.id;
              
              return (
                <button
                  key={tab.id}
                  onClick={() => setActiveTab(tab.id)}
                  className={`flex flex-col items-center gap-1 py-2.5 px-6 transition-all relative ${
                    isActive ? 'text-mint' : 'text-muted-foreground'
                  }`}
                >
                  {isActive && (
                    <div className="absolute top-0 left-1/2 -translate-x-1/2 w-16 h-1 bg-mint rounded-b-full" />
                  )}
                  <div className={`${isActive ? 'bg-mint/10' : ''} p-2 rounded-xl transition-all`}>
                    <Icon className={`w-5 h-5 ${isActive ? 'text-mint' : ''}`} />
                  </div>
                  <span className={`${isActive ? 'text-mint' : ''}`}>
                    {tab.label}
                  </span>
                </button>
              );
            })}
          </div>
        </div>
      </nav>
    </div>
  );
}