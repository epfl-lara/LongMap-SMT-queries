; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42812 () Bool)

(assert start!42812)

(declare-fun b_free!12099 () Bool)

(declare-fun b_next!12099 () Bool)

(assert (=> start!42812 (= b_free!12099 (not b_next!12099))))

(declare-fun tp!42373 () Bool)

(declare-fun b_and!20685 () Bool)

(assert (=> start!42812 (= tp!42373 b_and!20685)))

(declare-fun res!284594 () Bool)

(declare-fun e!280046 () Bool)

(assert (=> start!42812 (=> (not res!284594) (not e!280046))))

(declare-datatypes ((B!1048 0))(
  ( (B!1049 (val!6808 Int)) )
))
(declare-datatypes ((tuple2!8988 0))(
  ( (tuple2!8989 (_1!4505 (_ BitVec 64)) (_2!4505 B!1048)) )
))
(declare-datatypes ((List!9051 0))(
  ( (Nil!9048) (Cons!9047 (h!9903 tuple2!8988) (t!15087 List!9051)) )
))
(declare-datatypes ((ListLongMap!7901 0))(
  ( (ListLongMap!7902 (toList!3966 List!9051)) )
))
(declare-fun lm!215 () ListLongMap!7901)

(declare-fun p!166 () Int)

(declare-fun forall!195 (List!9051 Int) Bool)

(assert (=> start!42812 (= res!284594 (forall!195 (toList!3966 lm!215) p!166))))

(assert (=> start!42812 e!280046))

(declare-fun e!280047 () Bool)

(declare-fun inv!15488 (ListLongMap!7901) Bool)

(assert (=> start!42812 (and (inv!15488 lm!215) e!280047)))

(assert (=> start!42812 tp!42373))

(assert (=> start!42812 true))

(declare-fun tp_is_empty!13521 () Bool)

(assert (=> start!42812 tp_is_empty!13521))

(declare-fun b!476741 () Bool)

(declare-fun res!284593 () Bool)

(assert (=> b!476741 (=> (not res!284593) (not e!280046))))

(declare-fun b!85 () B!1048)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!942 (Int tuple2!8988) Bool)

(assert (=> b!476741 (= res!284593 (dynLambda!942 p!166 (tuple2!8989 a!501 b!85)))))

(declare-fun b!476742 () Bool)

(declare-fun e!280048 () Bool)

(declare-fun lt!217314 () ListLongMap!7901)

(declare-fun size!15141 (List!9051) Int)

(assert (=> b!476742 (= e!280048 (>= (size!15141 (toList!3966 lt!217314)) (size!15141 (toList!3966 lm!215))))))

(declare-fun b!476743 () Bool)

(assert (=> b!476743 (= e!280046 e!280048)))

(declare-fun res!284595 () Bool)

(assert (=> b!476743 (=> (not res!284595) (not e!280048))))

(assert (=> b!476743 (= res!284595 (forall!195 (toList!3966 lt!217314) p!166))))

(declare-fun tail!120 (ListLongMap!7901) ListLongMap!7901)

(assert (=> b!476743 (= lt!217314 (tail!120 lm!215))))

(declare-fun b!476744 () Bool)

(declare-fun res!284596 () Bool)

(assert (=> b!476744 (=> (not res!284596) (not e!280046))))

(declare-fun isEmpty!596 (ListLongMap!7901) Bool)

(assert (=> b!476744 (= res!284596 (not (isEmpty!596 lm!215)))))

(declare-fun b!476745 () Bool)

(declare-fun tp!42372 () Bool)

(assert (=> b!476745 (= e!280047 tp!42372)))

(assert (= (and start!42812 res!284594) b!476741))

(assert (= (and b!476741 res!284593) b!476744))

(assert (= (and b!476744 res!284596) b!476743))

(assert (= (and b!476743 res!284595) b!476742))

(assert (= start!42812 b!476745))

(declare-fun b_lambda!10457 () Bool)

(assert (=> (not b_lambda!10457) (not b!476741)))

(declare-fun t!15086 () Bool)

(declare-fun tb!3993 () Bool)

(assert (=> (and start!42812 (= p!166 p!166) t!15086) tb!3993))

(declare-fun result!7549 () Bool)

(assert (=> tb!3993 (= result!7549 true)))

(assert (=> b!476741 t!15086))

(declare-fun b_and!20687 () Bool)

(assert (= b_and!20685 (and (=> t!15086 result!7549) b_and!20687)))

(declare-fun m!459011 () Bool)

(assert (=> start!42812 m!459011))

(declare-fun m!459013 () Bool)

(assert (=> start!42812 m!459013))

(declare-fun m!459015 () Bool)

(assert (=> b!476744 m!459015))

(declare-fun m!459017 () Bool)

(assert (=> b!476743 m!459017))

(declare-fun m!459019 () Bool)

(assert (=> b!476743 m!459019))

(declare-fun m!459021 () Bool)

(assert (=> b!476742 m!459021))

(declare-fun m!459023 () Bool)

(assert (=> b!476742 m!459023))

(declare-fun m!459025 () Bool)

(assert (=> b!476741 m!459025))

(check-sat (not b!476743) (not b!476742) b_and!20687 (not b!476744) tp_is_empty!13521 (not b!476745) (not b_next!12099) (not start!42812) (not b_lambda!10457))
(check-sat b_and!20687 (not b_next!12099))
(get-model)

(declare-fun b_lambda!10462 () Bool)

(assert (= b_lambda!10457 (or (and start!42812 b_free!12099) b_lambda!10462)))

(check-sat (not b!476743) (not b!476742) b_and!20687 (not b!476744) tp_is_empty!13521 (not b!476745) (not b_next!12099) (not start!42812) (not b_lambda!10462))
(check-sat b_and!20687 (not b_next!12099))
(get-model)

(declare-fun d!75825 () Bool)

(declare-fun lt!217320 () Int)

(assert (=> d!75825 (>= lt!217320 0)))

(declare-fun e!280070 () Int)

(assert (=> d!75825 (= lt!217320 e!280070)))

(declare-fun c!57358 () Bool)

(get-info :version)

(assert (=> d!75825 (= c!57358 ((_ is Nil!9048) (toList!3966 lt!217314)))))

(assert (=> d!75825 (= (size!15141 (toList!3966 lt!217314)) lt!217320)))

(declare-fun b!476775 () Bool)

(assert (=> b!476775 (= e!280070 0)))

(declare-fun b!476776 () Bool)

(assert (=> b!476776 (= e!280070 (+ 1 (size!15141 (t!15087 (toList!3966 lt!217314)))))))

(assert (= (and d!75825 c!57358) b!476775))

(assert (= (and d!75825 (not c!57358)) b!476776))

(declare-fun m!459049 () Bool)

(assert (=> b!476776 m!459049))

(assert (=> b!476742 d!75825))

(declare-fun d!75833 () Bool)

(declare-fun lt!217321 () Int)

(assert (=> d!75833 (>= lt!217321 0)))

(declare-fun e!280071 () Int)

(assert (=> d!75833 (= lt!217321 e!280071)))

(declare-fun c!57359 () Bool)

(assert (=> d!75833 (= c!57359 ((_ is Nil!9048) (toList!3966 lm!215)))))

(assert (=> d!75833 (= (size!15141 (toList!3966 lm!215)) lt!217321)))

(declare-fun b!476777 () Bool)

(assert (=> b!476777 (= e!280071 0)))

(declare-fun b!476778 () Bool)

(assert (=> b!476778 (= e!280071 (+ 1 (size!15141 (t!15087 (toList!3966 lm!215)))))))

(assert (= (and d!75833 c!57359) b!476777))

(assert (= (and d!75833 (not c!57359)) b!476778))

(declare-fun m!459051 () Bool)

(assert (=> b!476778 m!459051))

(assert (=> b!476742 d!75833))

(declare-fun d!75835 () Bool)

(declare-fun res!284626 () Bool)

(declare-fun e!280083 () Bool)

(assert (=> d!75835 (=> res!284626 e!280083)))

(assert (=> d!75835 (= res!284626 ((_ is Nil!9048) (toList!3966 lt!217314)))))

(assert (=> d!75835 (= (forall!195 (toList!3966 lt!217314) p!166) e!280083)))

(declare-fun b!476794 () Bool)

(declare-fun e!280085 () Bool)

(assert (=> b!476794 (= e!280083 e!280085)))

(declare-fun res!284628 () Bool)

(assert (=> b!476794 (=> (not res!284628) (not e!280085))))

(assert (=> b!476794 (= res!284628 (dynLambda!942 p!166 (h!9903 (toList!3966 lt!217314))))))

(declare-fun b!476796 () Bool)

(assert (=> b!476796 (= e!280085 (forall!195 (t!15087 (toList!3966 lt!217314)) p!166))))

(assert (= (and d!75835 (not res!284626)) b!476794))

(assert (= (and b!476794 res!284628) b!476796))

(declare-fun b_lambda!10472 () Bool)

(assert (=> (not b_lambda!10472) (not b!476794)))

(declare-fun t!15098 () Bool)

(declare-fun tb!4003 () Bool)

(assert (=> (and start!42812 (= p!166 p!166) t!15098) tb!4003))

(declare-fun result!7559 () Bool)

(assert (=> tb!4003 (= result!7559 true)))

(assert (=> b!476794 t!15098))

(declare-fun b_and!20699 () Bool)

(assert (= b_and!20687 (and (=> t!15098 result!7559) b_and!20699)))

(declare-fun m!459065 () Bool)

(assert (=> b!476794 m!459065))

(declare-fun m!459069 () Bool)

(assert (=> b!476796 m!459069))

(assert (=> b!476743 d!75835))

(declare-fun d!75847 () Bool)

(declare-fun tail!123 (List!9051) List!9051)

(assert (=> d!75847 (= (tail!120 lm!215) (ListLongMap!7902 (tail!123 (toList!3966 lm!215))))))

(declare-fun bs!15150 () Bool)

(assert (= bs!15150 d!75847))

(declare-fun m!459077 () Bool)

(assert (=> bs!15150 m!459077))

(assert (=> b!476743 d!75847))

(declare-fun d!75853 () Bool)

(declare-fun res!284631 () Bool)

(declare-fun e!280088 () Bool)

(assert (=> d!75853 (=> res!284631 e!280088)))

(assert (=> d!75853 (= res!284631 ((_ is Nil!9048) (toList!3966 lm!215)))))

(assert (=> d!75853 (= (forall!195 (toList!3966 lm!215) p!166) e!280088)))

(declare-fun b!476799 () Bool)

(declare-fun e!280089 () Bool)

(assert (=> b!476799 (= e!280088 e!280089)))

(declare-fun res!284632 () Bool)

(assert (=> b!476799 (=> (not res!284632) (not e!280089))))

(assert (=> b!476799 (= res!284632 (dynLambda!942 p!166 (h!9903 (toList!3966 lm!215))))))

(declare-fun b!476800 () Bool)

(assert (=> b!476800 (= e!280089 (forall!195 (t!15087 (toList!3966 lm!215)) p!166))))

(assert (= (and d!75853 (not res!284631)) b!476799))

(assert (= (and b!476799 res!284632) b!476800))

(declare-fun b_lambda!10477 () Bool)

(assert (=> (not b_lambda!10477) (not b!476799)))

(declare-fun t!15102 () Bool)

(declare-fun tb!4007 () Bool)

(assert (=> (and start!42812 (= p!166 p!166) t!15102) tb!4007))

(declare-fun result!7563 () Bool)

(assert (=> tb!4007 (= result!7563 true)))

(assert (=> b!476799 t!15102))

(declare-fun b_and!20703 () Bool)

(assert (= b_and!20699 (and (=> t!15102 result!7563) b_and!20703)))

(declare-fun m!459081 () Bool)

(assert (=> b!476799 m!459081))

(declare-fun m!459083 () Bool)

(assert (=> b!476800 m!459083))

(assert (=> start!42812 d!75853))

(declare-fun d!75857 () Bool)

(declare-fun isStrictlySorted!386 (List!9051) Bool)

(assert (=> d!75857 (= (inv!15488 lm!215) (isStrictlySorted!386 (toList!3966 lm!215)))))

(declare-fun bs!15154 () Bool)

(assert (= bs!15154 d!75857))

(declare-fun m!459089 () Bool)

(assert (=> bs!15154 m!459089))

(assert (=> start!42812 d!75857))

(declare-fun d!75861 () Bool)

(declare-fun isEmpty!599 (List!9051) Bool)

(assert (=> d!75861 (= (isEmpty!596 lm!215) (isEmpty!599 (toList!3966 lm!215)))))

(declare-fun bs!15155 () Bool)

(assert (= bs!15155 d!75861))

(declare-fun m!459091 () Bool)

(assert (=> bs!15155 m!459091))

(assert (=> b!476744 d!75861))

(declare-fun b!476822 () Bool)

(declare-fun e!280101 () Bool)

(declare-fun tp!42387 () Bool)

(assert (=> b!476822 (= e!280101 (and tp_is_empty!13521 tp!42387))))

(assert (=> b!476745 (= tp!42372 e!280101)))

(assert (= (and b!476745 ((_ is Cons!9047) (toList!3966 lm!215))) b!476822))

(declare-fun b_lambda!10483 () Bool)

(assert (= b_lambda!10472 (or (and start!42812 b_free!12099) b_lambda!10483)))

(declare-fun b_lambda!10485 () Bool)

(assert (= b_lambda!10477 (or (and start!42812 b_free!12099) b_lambda!10485)))

(check-sat (not d!75857) (not b!476796) tp_is_empty!13521 (not b_lambda!10462) (not b!476800) (not b_lambda!10485) (not b!476776) (not b_next!12099) (not b!476778) (not d!75861) (not b!476822) (not b_lambda!10483) (not d!75847) b_and!20703)
(check-sat b_and!20703 (not b_next!12099))
(get-model)

(declare-fun d!75867 () Bool)

(declare-fun lt!217331 () Int)

(assert (=> d!75867 (>= lt!217331 0)))

(declare-fun e!280104 () Int)

(assert (=> d!75867 (= lt!217331 e!280104)))

(declare-fun c!57369 () Bool)

(assert (=> d!75867 (= c!57369 ((_ is Nil!9048) (t!15087 (toList!3966 lt!217314))))))

(assert (=> d!75867 (= (size!15141 (t!15087 (toList!3966 lt!217314))) lt!217331)))

(declare-fun b!476826 () Bool)

(assert (=> b!476826 (= e!280104 0)))

(declare-fun b!476827 () Bool)

(assert (=> b!476827 (= e!280104 (+ 1 (size!15141 (t!15087 (t!15087 (toList!3966 lt!217314))))))))

(assert (= (and d!75867 c!57369) b!476826))

(assert (= (and d!75867 (not c!57369)) b!476827))

(declare-fun m!459099 () Bool)

(assert (=> b!476827 m!459099))

(assert (=> b!476776 d!75867))

(declare-fun d!75871 () Bool)

(assert (=> d!75871 (= (tail!123 (toList!3966 lm!215)) (t!15087 (toList!3966 lm!215)))))

(assert (=> d!75847 d!75871))

(declare-fun d!75873 () Bool)

(declare-fun lt!217332 () Int)

(assert (=> d!75873 (>= lt!217332 0)))

(declare-fun e!280107 () Int)

(assert (=> d!75873 (= lt!217332 e!280107)))

(declare-fun c!57370 () Bool)

(assert (=> d!75873 (= c!57370 ((_ is Nil!9048) (t!15087 (toList!3966 lm!215))))))

(assert (=> d!75873 (= (size!15141 (t!15087 (toList!3966 lm!215))) lt!217332)))

(declare-fun b!476830 () Bool)

(assert (=> b!476830 (= e!280107 0)))

(declare-fun b!476831 () Bool)

(assert (=> b!476831 (= e!280107 (+ 1 (size!15141 (t!15087 (t!15087 (toList!3966 lm!215))))))))

(assert (= (and d!75873 c!57370) b!476830))

(assert (= (and d!75873 (not c!57370)) b!476831))

(declare-fun m!459105 () Bool)

(assert (=> b!476831 m!459105))

(assert (=> b!476778 d!75873))

(declare-fun d!75877 () Bool)

(assert (=> d!75877 (= (isEmpty!599 (toList!3966 lm!215)) ((_ is Nil!9048) (toList!3966 lm!215)))))

(assert (=> d!75861 d!75877))

(declare-fun d!75882 () Bool)

(declare-fun res!284643 () Bool)

(declare-fun e!280117 () Bool)

(assert (=> d!75882 (=> res!284643 e!280117)))

(assert (=> d!75882 (= res!284643 (or ((_ is Nil!9048) (toList!3966 lm!215)) ((_ is Nil!9048) (t!15087 (toList!3966 lm!215)))))))

(assert (=> d!75882 (= (isStrictlySorted!386 (toList!3966 lm!215)) e!280117)))

(declare-fun b!476842 () Bool)

(declare-fun e!280118 () Bool)

(assert (=> b!476842 (= e!280117 e!280118)))

(declare-fun res!284644 () Bool)

(assert (=> b!476842 (=> (not res!284644) (not e!280118))))

(assert (=> b!476842 (= res!284644 (bvslt (_1!4505 (h!9903 (toList!3966 lm!215))) (_1!4505 (h!9903 (t!15087 (toList!3966 lm!215))))))))

(declare-fun b!476843 () Bool)

(assert (=> b!476843 (= e!280118 (isStrictlySorted!386 (t!15087 (toList!3966 lm!215))))))

(assert (= (and d!75882 (not res!284643)) b!476842))

(assert (= (and b!476842 res!284644) b!476843))

(declare-fun m!459109 () Bool)

(assert (=> b!476843 m!459109))

(assert (=> d!75857 d!75882))

(declare-fun d!75887 () Bool)

(declare-fun res!284645 () Bool)

(declare-fun e!280119 () Bool)

(assert (=> d!75887 (=> res!284645 e!280119)))

(assert (=> d!75887 (= res!284645 ((_ is Nil!9048) (t!15087 (toList!3966 lm!215))))))

(assert (=> d!75887 (= (forall!195 (t!15087 (toList!3966 lm!215)) p!166) e!280119)))

(declare-fun b!476844 () Bool)

(declare-fun e!280120 () Bool)

(assert (=> b!476844 (= e!280119 e!280120)))

(declare-fun res!284646 () Bool)

(assert (=> b!476844 (=> (not res!284646) (not e!280120))))

(assert (=> b!476844 (= res!284646 (dynLambda!942 p!166 (h!9903 (t!15087 (toList!3966 lm!215)))))))

(declare-fun b!476845 () Bool)

(assert (=> b!476845 (= e!280120 (forall!195 (t!15087 (t!15087 (toList!3966 lm!215))) p!166))))

(assert (= (and d!75887 (not res!284645)) b!476844))

(assert (= (and b!476844 res!284646) b!476845))

(declare-fun b_lambda!10493 () Bool)

(assert (=> (not b_lambda!10493) (not b!476844)))

(declare-fun t!15106 () Bool)

(declare-fun tb!4011 () Bool)

(assert (=> (and start!42812 (= p!166 p!166) t!15106) tb!4011))

(declare-fun result!7573 () Bool)

(assert (=> tb!4011 (= result!7573 true)))

(assert (=> b!476844 t!15106))

(declare-fun b_and!20707 () Bool)

(assert (= b_and!20703 (and (=> t!15106 result!7573) b_and!20707)))

(declare-fun m!459113 () Bool)

(assert (=> b!476844 m!459113))

(declare-fun m!459115 () Bool)

(assert (=> b!476845 m!459115))

(assert (=> b!476800 d!75887))

(declare-fun d!75891 () Bool)

(declare-fun res!284651 () Bool)

(declare-fun e!280125 () Bool)

(assert (=> d!75891 (=> res!284651 e!280125)))

(assert (=> d!75891 (= res!284651 ((_ is Nil!9048) (t!15087 (toList!3966 lt!217314))))))

(assert (=> d!75891 (= (forall!195 (t!15087 (toList!3966 lt!217314)) p!166) e!280125)))

(declare-fun b!476850 () Bool)

(declare-fun e!280126 () Bool)

(assert (=> b!476850 (= e!280125 e!280126)))

(declare-fun res!284652 () Bool)

(assert (=> b!476850 (=> (not res!284652) (not e!280126))))

(assert (=> b!476850 (= res!284652 (dynLambda!942 p!166 (h!9903 (t!15087 (toList!3966 lt!217314)))))))

(declare-fun b!476851 () Bool)

(assert (=> b!476851 (= e!280126 (forall!195 (t!15087 (t!15087 (toList!3966 lt!217314))) p!166))))

(assert (= (and d!75891 (not res!284651)) b!476850))

(assert (= (and b!476850 res!284652) b!476851))

(declare-fun b_lambda!10497 () Bool)

(assert (=> (not b_lambda!10497) (not b!476850)))

(declare-fun t!15110 () Bool)

(declare-fun tb!4015 () Bool)

(assert (=> (and start!42812 (= p!166 p!166) t!15110) tb!4015))

(declare-fun result!7577 () Bool)

(assert (=> tb!4015 (= result!7577 true)))

(assert (=> b!476850 t!15110))

(declare-fun b_and!20711 () Bool)

(assert (= b_and!20707 (and (=> t!15110 result!7577) b_and!20711)))

(declare-fun m!459121 () Bool)

(assert (=> b!476850 m!459121))

(declare-fun m!459123 () Bool)

(assert (=> b!476851 m!459123))

(assert (=> b!476796 d!75891))

(declare-fun b!476853 () Bool)

(declare-fun e!280128 () Bool)

(declare-fun tp!42390 () Bool)

(assert (=> b!476853 (= e!280128 (and tp_is_empty!13521 tp!42390))))

(assert (=> b!476822 (= tp!42387 e!280128)))

(assert (= (and b!476822 ((_ is Cons!9047) (t!15087 (toList!3966 lm!215)))) b!476853))

(declare-fun b_lambda!10503 () Bool)

(assert (= b_lambda!10493 (or (and start!42812 b_free!12099) b_lambda!10503)))

(declare-fun b_lambda!10505 () Bool)

(assert (= b_lambda!10497 (or (and start!42812 b_free!12099) b_lambda!10505)))

(check-sat (not b_lambda!10483) (not b!476845) tp_is_empty!13521 (not b_lambda!10462) (not b_lambda!10505) (not b!476831) (not b_lambda!10485) b_and!20711 (not b_next!12099) (not b!476827) (not b!476843) (not b_lambda!10503) (not b!476851) (not b!476853))
(check-sat b_and!20711 (not b_next!12099))
