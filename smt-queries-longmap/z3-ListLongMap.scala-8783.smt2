; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106830 () Bool)

(assert start!106830)

(declare-fun b!1267670 () Bool)

(declare-fun res!843858 () Bool)

(declare-fun e!722177 () Bool)

(assert (=> b!1267670 (=> (not res!843858) (not e!722177))))

(declare-datatypes ((B!2092 0))(
  ( (B!2093 (val!16381 Int)) )
))
(declare-datatypes ((tuple2!21280 0))(
  ( (tuple2!21281 (_1!10651 (_ BitVec 64)) (_2!10651 B!2092)) )
))
(declare-datatypes ((List!28373 0))(
  ( (Nil!28370) (Cons!28369 (h!29578 tuple2!21280) (t!41900 List!28373)) )
))
(declare-fun l!874 () List!28373)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!689 (List!28373 (_ BitVec 64)) Bool)

(assert (=> b!1267670 (= res!843858 (not (containsKey!689 (t!41900 l!874) key!235)))))

(declare-fun b!1267671 () Bool)

(declare-fun res!843855 () Bool)

(assert (=> b!1267671 (=> (not res!843855) (not e!722177))))

(get-info :version)

(assert (=> b!1267671 (= res!843855 ((_ is Cons!28369) l!874))))

(declare-fun b!1267672 () Bool)

(declare-fun e!722176 () Bool)

(declare-fun tp_is_empty!32613 () Bool)

(declare-fun tp!96644 () Bool)

(assert (=> b!1267672 (= e!722176 (and tp_is_empty!32613 tp!96644))))

(declare-fun b!1267673 () Bool)

(declare-fun res!843856 () Bool)

(assert (=> b!1267673 (=> (not res!843856) (not e!722177))))

(declare-fun isStrictlySorted!830 (List!28373) Bool)

(assert (=> b!1267673 (= res!843856 (isStrictlySorted!830 (t!41900 l!874)))))

(declare-fun b!1267674 () Bool)

(declare-fun res!843859 () Bool)

(assert (=> b!1267674 (=> (not res!843859) (not e!722177))))

(assert (=> b!1267674 (= res!843859 (not (containsKey!689 l!874 key!235)))))

(declare-fun res!843857 () Bool)

(assert (=> start!106830 (=> (not res!843857) (not e!722177))))

(assert (=> start!106830 (= res!843857 (isStrictlySorted!830 l!874))))

(assert (=> start!106830 e!722177))

(assert (=> start!106830 e!722176))

(assert (=> start!106830 true))

(declare-fun b!1267675 () Bool)

(declare-fun removeStrictlySorted!168 (List!28373 (_ BitVec 64)) List!28373)

(assert (=> b!1267675 (= e!722177 (not (= (removeStrictlySorted!168 l!874 key!235) l!874)))))

(assert (=> b!1267675 (= (removeStrictlySorted!168 (t!41900 l!874) key!235) (t!41900 l!874))))

(declare-datatypes ((Unit!42224 0))(
  ( (Unit!42225) )
))
(declare-fun lt!574347 () Unit!42224)

(declare-fun lemmaRemoveStrictlySortedNotPresentPreserves!8 (List!28373 (_ BitVec 64)) Unit!42224)

(assert (=> b!1267675 (= lt!574347 (lemmaRemoveStrictlySortedNotPresentPreserves!8 (t!41900 l!874) key!235))))

(assert (= (and start!106830 res!843857) b!1267674))

(assert (= (and b!1267674 res!843859) b!1267671))

(assert (= (and b!1267671 res!843855) b!1267673))

(assert (= (and b!1267673 res!843856) b!1267670))

(assert (= (and b!1267670 res!843858) b!1267675))

(assert (= (and start!106830 ((_ is Cons!28369) l!874)) b!1267672))

(declare-fun m!1166825 () Bool)

(assert (=> start!106830 m!1166825))

(declare-fun m!1166827 () Bool)

(assert (=> b!1267674 m!1166827))

(declare-fun m!1166829 () Bool)

(assert (=> b!1267670 m!1166829))

(declare-fun m!1166831 () Bool)

(assert (=> b!1267673 m!1166831))

(declare-fun m!1166833 () Bool)

(assert (=> b!1267675 m!1166833))

(declare-fun m!1166835 () Bool)

(assert (=> b!1267675 m!1166835))

(declare-fun m!1166837 () Bool)

(assert (=> b!1267675 m!1166837))

(check-sat (not b!1267674) (not b!1267673) (not b!1267670) (not start!106830) (not b!1267675) tp_is_empty!32613 (not b!1267672))
(check-sat)
(get-model)

(declare-fun d!139531 () Bool)

(declare-fun res!843891 () Bool)

(declare-fun e!722208 () Bool)

(assert (=> d!139531 (=> res!843891 e!722208)))

(assert (=> d!139531 (= res!843891 (and ((_ is Cons!28369) l!874) (= (_1!10651 (h!29578 l!874)) key!235)))))

(assert (=> d!139531 (= (containsKey!689 l!874 key!235) e!722208)))

(declare-fun b!1267726 () Bool)

(declare-fun e!722209 () Bool)

(assert (=> b!1267726 (= e!722208 e!722209)))

(declare-fun res!843892 () Bool)

(assert (=> b!1267726 (=> (not res!843892) (not e!722209))))

(assert (=> b!1267726 (= res!843892 (and (or (not ((_ is Cons!28369) l!874)) (bvsle (_1!10651 (h!29578 l!874)) key!235)) ((_ is Cons!28369) l!874) (bvslt (_1!10651 (h!29578 l!874)) key!235)))))

(declare-fun b!1267727 () Bool)

(assert (=> b!1267727 (= e!722209 (containsKey!689 (t!41900 l!874) key!235))))

(assert (= (and d!139531 (not res!843891)) b!1267726))

(assert (= (and b!1267726 res!843892) b!1267727))

(assert (=> b!1267727 m!1166829))

(assert (=> b!1267674 d!139531))

(declare-fun d!139539 () Bool)

(declare-fun res!843903 () Bool)

(declare-fun e!722224 () Bool)

(assert (=> d!139539 (=> res!843903 e!722224)))

(assert (=> d!139539 (= res!843903 (or ((_ is Nil!28370) (t!41900 l!874)) ((_ is Nil!28370) (t!41900 (t!41900 l!874)))))))

(assert (=> d!139539 (= (isStrictlySorted!830 (t!41900 l!874)) e!722224)))

(declare-fun b!1267746 () Bool)

(declare-fun e!722225 () Bool)

(assert (=> b!1267746 (= e!722224 e!722225)))

(declare-fun res!843904 () Bool)

(assert (=> b!1267746 (=> (not res!843904) (not e!722225))))

(assert (=> b!1267746 (= res!843904 (bvslt (_1!10651 (h!29578 (t!41900 l!874))) (_1!10651 (h!29578 (t!41900 (t!41900 l!874))))))))

(declare-fun b!1267747 () Bool)

(assert (=> b!1267747 (= e!722225 (isStrictlySorted!830 (t!41900 (t!41900 l!874))))))

(assert (= (and d!139539 (not res!843903)) b!1267746))

(assert (= (and b!1267746 res!843904) b!1267747))

(declare-fun m!1166871 () Bool)

(assert (=> b!1267747 m!1166871))

(assert (=> b!1267673 d!139539))

(declare-fun d!139543 () Bool)

(declare-fun res!843905 () Bool)

(declare-fun e!722226 () Bool)

(assert (=> d!139543 (=> res!843905 e!722226)))

(assert (=> d!139543 (= res!843905 (or ((_ is Nil!28370) l!874) ((_ is Nil!28370) (t!41900 l!874))))))

(assert (=> d!139543 (= (isStrictlySorted!830 l!874) e!722226)))

(declare-fun b!1267748 () Bool)

(declare-fun e!722227 () Bool)

(assert (=> b!1267748 (= e!722226 e!722227)))

(declare-fun res!843906 () Bool)

(assert (=> b!1267748 (=> (not res!843906) (not e!722227))))

(assert (=> b!1267748 (= res!843906 (bvslt (_1!10651 (h!29578 l!874)) (_1!10651 (h!29578 (t!41900 l!874)))))))

(declare-fun b!1267749 () Bool)

(assert (=> b!1267749 (= e!722227 (isStrictlySorted!830 (t!41900 l!874)))))

(assert (= (and d!139543 (not res!843905)) b!1267748))

(assert (= (and b!1267748 res!843906) b!1267749))

(assert (=> b!1267749 m!1166831))

(assert (=> start!106830 d!139543))

(declare-fun d!139545 () Bool)

(declare-fun res!843907 () Bool)

(declare-fun e!722228 () Bool)

(assert (=> d!139545 (=> res!843907 e!722228)))

(assert (=> d!139545 (= res!843907 (and ((_ is Cons!28369) (t!41900 l!874)) (= (_1!10651 (h!29578 (t!41900 l!874))) key!235)))))

(assert (=> d!139545 (= (containsKey!689 (t!41900 l!874) key!235) e!722228)))

(declare-fun b!1267750 () Bool)

(declare-fun e!722229 () Bool)

(assert (=> b!1267750 (= e!722228 e!722229)))

(declare-fun res!843908 () Bool)

(assert (=> b!1267750 (=> (not res!843908) (not e!722229))))

(assert (=> b!1267750 (= res!843908 (and (or (not ((_ is Cons!28369) (t!41900 l!874))) (bvsle (_1!10651 (h!29578 (t!41900 l!874))) key!235)) ((_ is Cons!28369) (t!41900 l!874)) (bvslt (_1!10651 (h!29578 (t!41900 l!874))) key!235)))))

(declare-fun b!1267751 () Bool)

(assert (=> b!1267751 (= e!722229 (containsKey!689 (t!41900 (t!41900 l!874)) key!235))))

(assert (= (and d!139545 (not res!843907)) b!1267750))

(assert (= (and b!1267750 res!843908) b!1267751))

(declare-fun m!1166875 () Bool)

(assert (=> b!1267751 m!1166875))

(assert (=> b!1267670 d!139545))

(declare-fun b!1267785 () Bool)

(declare-fun e!722253 () List!28373)

(assert (=> b!1267785 (= e!722253 (t!41900 l!874))))

(declare-fun b!1267786 () Bool)

(declare-fun e!722255 () Bool)

(declare-fun lt!574367 () List!28373)

(assert (=> b!1267786 (= e!722255 (not (containsKey!689 lt!574367 key!235)))))

(declare-fun b!1267787 () Bool)

(declare-fun e!722254 () List!28373)

(assert (=> b!1267787 (= e!722254 Nil!28370)))

(declare-fun d!139549 () Bool)

(assert (=> d!139549 e!722255))

(declare-fun res!843921 () Bool)

(assert (=> d!139549 (=> (not res!843921) (not e!722255))))

(assert (=> d!139549 (= res!843921 (isStrictlySorted!830 lt!574367))))

(assert (=> d!139549 (= lt!574367 e!722253)))

(declare-fun c!123595 () Bool)

(assert (=> d!139549 (= c!123595 (and ((_ is Cons!28369) l!874) (= (_1!10651 (h!29578 l!874)) key!235)))))

(assert (=> d!139549 (isStrictlySorted!830 l!874)))

(assert (=> d!139549 (= (removeStrictlySorted!168 l!874 key!235) lt!574367)))

(declare-fun b!1267788 () Bool)

(assert (=> b!1267788 (= e!722253 e!722254)))

(declare-fun c!123596 () Bool)

(assert (=> b!1267788 (= c!123596 (and ((_ is Cons!28369) l!874) (not (= (_1!10651 (h!29578 l!874)) key!235))))))

(declare-fun b!1267789 () Bool)

(declare-fun $colon$colon!652 (List!28373 tuple2!21280) List!28373)

(assert (=> b!1267789 (= e!722254 ($colon$colon!652 (removeStrictlySorted!168 (t!41900 l!874) key!235) (h!29578 l!874)))))

(assert (= (and d!139549 c!123595) b!1267785))

(assert (= (and d!139549 (not c!123595)) b!1267788))

(assert (= (and b!1267788 c!123596) b!1267789))

(assert (= (and b!1267788 (not c!123596)) b!1267787))

(assert (= (and d!139549 res!843921) b!1267786))

(declare-fun m!1166893 () Bool)

(assert (=> b!1267786 m!1166893))

(declare-fun m!1166895 () Bool)

(assert (=> d!139549 m!1166895))

(assert (=> d!139549 m!1166825))

(assert (=> b!1267789 m!1166835))

(assert (=> b!1267789 m!1166835))

(declare-fun m!1166897 () Bool)

(assert (=> b!1267789 m!1166897))

(assert (=> b!1267675 d!139549))

(declare-fun b!1267792 () Bool)

(declare-fun e!722258 () List!28373)

(assert (=> b!1267792 (= e!722258 (t!41900 (t!41900 l!874)))))

(declare-fun b!1267793 () Bool)

(declare-fun e!722260 () Bool)

(declare-fun lt!574368 () List!28373)

(assert (=> b!1267793 (= e!722260 (not (containsKey!689 lt!574368 key!235)))))

(declare-fun b!1267794 () Bool)

(declare-fun e!722259 () List!28373)

(assert (=> b!1267794 (= e!722259 Nil!28370)))

(declare-fun d!139559 () Bool)

(assert (=> d!139559 e!722260))

(declare-fun res!843924 () Bool)

(assert (=> d!139559 (=> (not res!843924) (not e!722260))))

(assert (=> d!139559 (= res!843924 (isStrictlySorted!830 lt!574368))))

(assert (=> d!139559 (= lt!574368 e!722258)))

(declare-fun c!123597 () Bool)

(assert (=> d!139559 (= c!123597 (and ((_ is Cons!28369) (t!41900 l!874)) (= (_1!10651 (h!29578 (t!41900 l!874))) key!235)))))

(assert (=> d!139559 (isStrictlySorted!830 (t!41900 l!874))))

(assert (=> d!139559 (= (removeStrictlySorted!168 (t!41900 l!874) key!235) lt!574368)))

(declare-fun b!1267795 () Bool)

(assert (=> b!1267795 (= e!722258 e!722259)))

(declare-fun c!123598 () Bool)

(assert (=> b!1267795 (= c!123598 (and ((_ is Cons!28369) (t!41900 l!874)) (not (= (_1!10651 (h!29578 (t!41900 l!874))) key!235))))))

(declare-fun b!1267796 () Bool)

(assert (=> b!1267796 (= e!722259 ($colon$colon!652 (removeStrictlySorted!168 (t!41900 (t!41900 l!874)) key!235) (h!29578 (t!41900 l!874))))))

(assert (= (and d!139559 c!123597) b!1267792))

(assert (= (and d!139559 (not c!123597)) b!1267795))

(assert (= (and b!1267795 c!123598) b!1267796))

(assert (= (and b!1267795 (not c!123598)) b!1267794))

(assert (= (and d!139559 res!843924) b!1267793))

(declare-fun m!1166899 () Bool)

(assert (=> b!1267793 m!1166899))

(declare-fun m!1166901 () Bool)

(assert (=> d!139559 m!1166901))

(assert (=> d!139559 m!1166831))

(declare-fun m!1166903 () Bool)

(assert (=> b!1267796 m!1166903))

(assert (=> b!1267796 m!1166903))

(declare-fun m!1166905 () Bool)

(assert (=> b!1267796 m!1166905))

(assert (=> b!1267675 d!139559))

(declare-fun d!139561 () Bool)

(assert (=> d!139561 (= (removeStrictlySorted!168 (t!41900 l!874) key!235) (t!41900 l!874))))

(declare-fun lt!574371 () Unit!42224)

(declare-fun choose!1894 (List!28373 (_ BitVec 64)) Unit!42224)

(assert (=> d!139561 (= lt!574371 (choose!1894 (t!41900 l!874) key!235))))

(assert (=> d!139561 (isStrictlySorted!830 (t!41900 l!874))))

(assert (=> d!139561 (= (lemmaRemoveStrictlySortedNotPresentPreserves!8 (t!41900 l!874) key!235) lt!574371)))

(declare-fun bs!35905 () Bool)

(assert (= bs!35905 d!139561))

(assert (=> bs!35905 m!1166835))

(declare-fun m!1166907 () Bool)

(assert (=> bs!35905 m!1166907))

(assert (=> bs!35905 m!1166831))

(assert (=> b!1267675 d!139561))

(declare-fun b!1267811 () Bool)

(declare-fun e!722273 () Bool)

(declare-fun tp!96653 () Bool)

(assert (=> b!1267811 (= e!722273 (and tp_is_empty!32613 tp!96653))))

(assert (=> b!1267672 (= tp!96644 e!722273)))

(assert (= (and b!1267672 ((_ is Cons!28369) (t!41900 l!874))) b!1267811))

(check-sat (not d!139549) (not d!139559) (not b!1267747) (not b!1267751) (not d!139561) (not b!1267786) tp_is_empty!32613 (not b!1267749) (not b!1267789) (not b!1267793) (not b!1267796) (not b!1267811) (not b!1267727))
(check-sat)
(get-model)

(declare-fun d!139587 () Bool)

(assert (=> d!139587 (= ($colon$colon!652 (removeStrictlySorted!168 (t!41900 l!874) key!235) (h!29578 l!874)) (Cons!28369 (h!29578 l!874) (removeStrictlySorted!168 (t!41900 l!874) key!235)))))

(assert (=> b!1267789 d!139587))

(assert (=> b!1267789 d!139559))

(declare-fun d!139589 () Bool)

(declare-fun res!843948 () Bool)

(declare-fun e!722293 () Bool)

(assert (=> d!139589 (=> res!843948 e!722293)))

(assert (=> d!139589 (= res!843948 (or ((_ is Nil!28370) (t!41900 (t!41900 l!874))) ((_ is Nil!28370) (t!41900 (t!41900 (t!41900 l!874))))))))

(assert (=> d!139589 (= (isStrictlySorted!830 (t!41900 (t!41900 l!874))) e!722293)))

(declare-fun b!1267835 () Bool)

(declare-fun e!722294 () Bool)

(assert (=> b!1267835 (= e!722293 e!722294)))

(declare-fun res!843949 () Bool)

(assert (=> b!1267835 (=> (not res!843949) (not e!722294))))

(assert (=> b!1267835 (= res!843949 (bvslt (_1!10651 (h!29578 (t!41900 (t!41900 l!874)))) (_1!10651 (h!29578 (t!41900 (t!41900 (t!41900 l!874)))))))))

(declare-fun b!1267836 () Bool)

(assert (=> b!1267836 (= e!722294 (isStrictlySorted!830 (t!41900 (t!41900 (t!41900 l!874)))))))

(assert (= (and d!139589 (not res!843948)) b!1267835))

(assert (= (and b!1267835 res!843949) b!1267836))

(declare-fun m!1166933 () Bool)

(assert (=> b!1267836 m!1166933))

(assert (=> b!1267747 d!139589))

(declare-fun d!139591 () Bool)

(declare-fun res!843950 () Bool)

(declare-fun e!722295 () Bool)

(assert (=> d!139591 (=> res!843950 e!722295)))

(assert (=> d!139591 (= res!843950 (and ((_ is Cons!28369) lt!574367) (= (_1!10651 (h!29578 lt!574367)) key!235)))))

(assert (=> d!139591 (= (containsKey!689 lt!574367 key!235) e!722295)))

(declare-fun b!1267837 () Bool)

(declare-fun e!722296 () Bool)

(assert (=> b!1267837 (= e!722295 e!722296)))

(declare-fun res!843951 () Bool)

(assert (=> b!1267837 (=> (not res!843951) (not e!722296))))

(assert (=> b!1267837 (= res!843951 (and (or (not ((_ is Cons!28369) lt!574367)) (bvsle (_1!10651 (h!29578 lt!574367)) key!235)) ((_ is Cons!28369) lt!574367) (bvslt (_1!10651 (h!29578 lt!574367)) key!235)))))

(declare-fun b!1267838 () Bool)

(assert (=> b!1267838 (= e!722296 (containsKey!689 (t!41900 lt!574367) key!235))))

(assert (= (and d!139591 (not res!843950)) b!1267837))

(assert (= (and b!1267837 res!843951) b!1267838))

(declare-fun m!1166935 () Bool)

(assert (=> b!1267838 m!1166935))

(assert (=> b!1267786 d!139591))

(assert (=> b!1267749 d!139539))

(declare-fun d!139593 () Bool)

(declare-fun res!843952 () Bool)

(declare-fun e!722297 () Bool)

(assert (=> d!139593 (=> res!843952 e!722297)))

(assert (=> d!139593 (= res!843952 (and ((_ is Cons!28369) (t!41900 (t!41900 l!874))) (= (_1!10651 (h!29578 (t!41900 (t!41900 l!874)))) key!235)))))

(assert (=> d!139593 (= (containsKey!689 (t!41900 (t!41900 l!874)) key!235) e!722297)))

(declare-fun b!1267839 () Bool)

(declare-fun e!722298 () Bool)

(assert (=> b!1267839 (= e!722297 e!722298)))

(declare-fun res!843953 () Bool)

(assert (=> b!1267839 (=> (not res!843953) (not e!722298))))

(assert (=> b!1267839 (= res!843953 (and (or (not ((_ is Cons!28369) (t!41900 (t!41900 l!874)))) (bvsle (_1!10651 (h!29578 (t!41900 (t!41900 l!874)))) key!235)) ((_ is Cons!28369) (t!41900 (t!41900 l!874))) (bvslt (_1!10651 (h!29578 (t!41900 (t!41900 l!874)))) key!235)))))

(declare-fun b!1267840 () Bool)

(assert (=> b!1267840 (= e!722298 (containsKey!689 (t!41900 (t!41900 (t!41900 l!874))) key!235))))

