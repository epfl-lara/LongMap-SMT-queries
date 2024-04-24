; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42796 () Bool)

(assert start!42796)

(declare-fun b_free!12097 () Bool)

(declare-fun b_next!12097 () Bool)

(assert (=> start!42796 (= b_free!12097 (not b_next!12097))))

(declare-fun tp!42367 () Bool)

(declare-fun b_and!20691 () Bool)

(assert (=> start!42796 (= tp!42367 b_and!20691)))

(declare-fun b!476665 () Bool)

(declare-fun res!284575 () Bool)

(declare-fun e!279999 () Bool)

(assert (=> b!476665 (=> (not res!284575) (not e!279999))))

(declare-datatypes ((B!1046 0))(
  ( (B!1047 (val!6807 Int)) )
))
(declare-fun b!85 () B!1046)

(declare-fun p!166 () Int)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((tuple2!8910 0))(
  ( (tuple2!8911 (_1!4466 (_ BitVec 64)) (_2!4466 B!1046)) )
))
(declare-fun dynLambda!938 (Int tuple2!8910) Bool)

(assert (=> b!476665 (= res!284575 (dynLambda!938 p!166 (tuple2!8911 a!501 b!85)))))

(declare-fun b!476666 () Bool)

(declare-fun e!279998 () Bool)

(assert (=> b!476666 (= e!279999 e!279998)))

(declare-fun res!284574 () Bool)

(assert (=> b!476666 (=> (not res!284574) (not e!279998))))

(declare-datatypes ((List!8959 0))(
  ( (Nil!8956) (Cons!8955 (h!9811 tuple2!8910) (t!14985 List!8959)) )
))
(declare-datatypes ((ListLongMap!7825 0))(
  ( (ListLongMap!7826 (toList!3928 List!8959)) )
))
(declare-fun lt!217323 () ListLongMap!7825)

(declare-fun forall!194 (List!8959 Int) Bool)

(assert (=> b!476666 (= res!284574 (forall!194 (toList!3928 lt!217323) p!166))))

(declare-fun lm!215 () ListLongMap!7825)

(declare-fun tail!119 (ListLongMap!7825) ListLongMap!7825)

(assert (=> b!476666 (= lt!217323 (tail!119 lm!215))))

(declare-fun b!476667 () Bool)

(declare-fun size!15134 (List!8959) Int)

(assert (=> b!476667 (= e!279998 (>= (size!15134 (toList!3928 lt!217323)) (size!15134 (toList!3928 lm!215))))))

(declare-fun b!476668 () Bool)

(declare-fun res!284577 () Bool)

(assert (=> b!476668 (=> (not res!284577) (not e!279999))))

(declare-fun isEmpty!601 (ListLongMap!7825) Bool)

(assert (=> b!476668 (= res!284577 (not (isEmpty!601 lm!215)))))

(declare-fun b!476669 () Bool)

(declare-fun e!280000 () Bool)

(declare-fun tp!42366 () Bool)

(assert (=> b!476669 (= e!280000 tp!42366)))

(declare-fun res!284576 () Bool)

(assert (=> start!42796 (=> (not res!284576) (not e!279999))))

(assert (=> start!42796 (= res!284576 (forall!194 (toList!3928 lm!215) p!166))))

(assert (=> start!42796 e!279999))

(declare-fun inv!15487 (ListLongMap!7825) Bool)

(assert (=> start!42796 (and (inv!15487 lm!215) e!280000)))

(assert (=> start!42796 tp!42367))

(assert (=> start!42796 true))

(declare-fun tp_is_empty!13519 () Bool)

(assert (=> start!42796 tp_is_empty!13519))

(assert (= (and start!42796 res!284576) b!476665))

(assert (= (and b!476665 res!284575) b!476668))

(assert (= (and b!476668 res!284577) b!476666))

(assert (= (and b!476666 res!284574) b!476667))

(assert (= start!42796 b!476669))

(declare-fun b_lambda!10469 () Bool)

(assert (=> (not b_lambda!10469) (not b!476665)))

(declare-fun t!14984 () Bool)

(declare-fun tb!3983 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!14984) tb!3983))

(declare-fun result!7539 () Bool)

(assert (=> tb!3983 (= result!7539 true)))

(assert (=> b!476665 t!14984))

(declare-fun b_and!20693 () Bool)

(assert (= b_and!20691 (and (=> t!14984 result!7539) b_and!20693)))

(declare-fun m!459177 () Bool)

(assert (=> b!476666 m!459177))

(declare-fun m!459179 () Bool)

(assert (=> b!476666 m!459179))

(declare-fun m!459181 () Bool)

(assert (=> b!476665 m!459181))

(declare-fun m!459183 () Bool)

(assert (=> b!476668 m!459183))

(declare-fun m!459185 () Bool)

(assert (=> b!476667 m!459185))

(declare-fun m!459187 () Bool)

(assert (=> b!476667 m!459187))

(declare-fun m!459189 () Bool)

(assert (=> start!42796 m!459189))

(declare-fun m!459191 () Bool)

(assert (=> start!42796 m!459191))

(check-sat b_and!20693 (not start!42796) (not b!476669) (not b_lambda!10469) (not b!476668) (not b!476666) (not b!476667) (not b_next!12097) tp_is_empty!13519)
(check-sat b_and!20693 (not b_next!12097))
(get-model)

(declare-fun b_lambda!10475 () Bool)

(assert (= b_lambda!10469 (or (and start!42796 b_free!12097) b_lambda!10475)))

(check-sat b_and!20693 (not b_lambda!10475) (not start!42796) (not b!476669) (not b!476668) (not b!476666) (not b!476667) (not b_next!12097) tp_is_empty!13519)
(check-sat b_and!20693 (not b_next!12097))
(get-model)

(declare-fun d!75853 () Bool)

(declare-fun isEmpty!605 (List!8959) Bool)

(assert (=> d!75853 (= (isEmpty!601 lm!215) (isEmpty!605 (toList!3928 lm!215)))))

(declare-fun bs!15164 () Bool)

(assert (= bs!15164 d!75853))

(declare-fun m!459227 () Bool)

(assert (=> bs!15164 m!459227))

(assert (=> b!476668 d!75853))

(declare-fun d!75859 () Bool)

(declare-fun lt!217335 () Int)

(assert (=> d!75859 (>= lt!217335 0)))

(declare-fun e!280028 () Int)

(assert (=> d!75859 (= lt!217335 e!280028)))

(declare-fun c!57334 () Bool)

(get-info :version)

(assert (=> d!75859 (= c!57334 ((_ is Nil!8956) (toList!3928 lt!217323)))))

(assert (=> d!75859 (= (size!15134 (toList!3928 lt!217323)) lt!217335)))

(declare-fun b!476714 () Bool)

(assert (=> b!476714 (= e!280028 0)))

(declare-fun b!476715 () Bool)

(assert (=> b!476715 (= e!280028 (+ 1 (size!15134 (t!14985 (toList!3928 lt!217323)))))))

(assert (= (and d!75859 c!57334) b!476714))

(assert (= (and d!75859 (not c!57334)) b!476715))

(declare-fun m!459233 () Bool)

(assert (=> b!476715 m!459233))

(assert (=> b!476667 d!75859))

(declare-fun d!75865 () Bool)

(declare-fun lt!217337 () Int)

(assert (=> d!75865 (>= lt!217337 0)))

(declare-fun e!280030 () Int)

(assert (=> d!75865 (= lt!217337 e!280030)))

(declare-fun c!57336 () Bool)

(assert (=> d!75865 (= c!57336 ((_ is Nil!8956) (toList!3928 lm!215)))))

(assert (=> d!75865 (= (size!15134 (toList!3928 lm!215)) lt!217337)))

(declare-fun b!476718 () Bool)

(assert (=> b!476718 (= e!280030 0)))

(declare-fun b!476719 () Bool)

(assert (=> b!476719 (= e!280030 (+ 1 (size!15134 (t!14985 (toList!3928 lm!215)))))))

(assert (= (and d!75865 c!57336) b!476718))

(assert (= (and d!75865 (not c!57336)) b!476719))

(declare-fun m!459237 () Bool)

(assert (=> b!476719 m!459237))

(assert (=> b!476667 d!75865))

(declare-fun d!75869 () Bool)

(declare-fun res!284618 () Bool)

(declare-fun e!280043 () Bool)

(assert (=> d!75869 (=> res!284618 e!280043)))

(assert (=> d!75869 (= res!284618 ((_ is Nil!8956) (toList!3928 lt!217323)))))

(assert (=> d!75869 (= (forall!194 (toList!3928 lt!217323) p!166) e!280043)))

(declare-fun b!476732 () Bool)

(declare-fun e!280044 () Bool)

(assert (=> b!476732 (= e!280043 e!280044)))

(declare-fun res!284619 () Bool)

(assert (=> b!476732 (=> (not res!284619) (not e!280044))))

(assert (=> b!476732 (= res!284619 (dynLambda!938 p!166 (h!9811 (toList!3928 lt!217323))))))

(declare-fun b!476733 () Bool)

(assert (=> b!476733 (= e!280044 (forall!194 (t!14985 (toList!3928 lt!217323)) p!166))))

(assert (= (and d!75869 (not res!284618)) b!476732))

(assert (= (and b!476732 res!284619) b!476733))

(declare-fun b_lambda!10485 () Bool)

(assert (=> (not b_lambda!10485) (not b!476732)))

(declare-fun t!14997 () Bool)

(declare-fun tb!3993 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!14997) tb!3993))

(declare-fun result!7549 () Bool)

(assert (=> tb!3993 (= result!7549 true)))

(assert (=> b!476732 t!14997))

(declare-fun b_and!20707 () Bool)

(assert (= b_and!20693 (and (=> t!14997 result!7549) b_and!20707)))

(declare-fun m!459249 () Bool)

(assert (=> b!476732 m!459249))

(declare-fun m!459251 () Bool)

(assert (=> b!476733 m!459251))

(assert (=> b!476666 d!75869))

(declare-fun d!75877 () Bool)

(declare-fun tail!123 (List!8959) List!8959)

(assert (=> d!75877 (= (tail!119 lm!215) (ListLongMap!7826 (tail!123 (toList!3928 lm!215))))))

(declare-fun bs!15168 () Bool)

(assert (= bs!15168 d!75877))

(declare-fun m!459255 () Bool)

(assert (=> bs!15168 m!459255))

(assert (=> b!476666 d!75877))

(declare-fun d!75881 () Bool)

(declare-fun res!284622 () Bool)

(declare-fun e!280050 () Bool)

(assert (=> d!75881 (=> res!284622 e!280050)))

(assert (=> d!75881 (= res!284622 ((_ is Nil!8956) (toList!3928 lm!215)))))

(assert (=> d!75881 (= (forall!194 (toList!3928 lm!215) p!166) e!280050)))

(declare-fun b!476742 () Bool)

(declare-fun e!280051 () Bool)

(assert (=> b!476742 (= e!280050 e!280051)))

(declare-fun res!284623 () Bool)

(assert (=> b!476742 (=> (not res!284623) (not e!280051))))

(assert (=> b!476742 (= res!284623 (dynLambda!938 p!166 (h!9811 (toList!3928 lm!215))))))

(declare-fun b!476743 () Bool)

(assert (=> b!476743 (= e!280051 (forall!194 (t!14985 (toList!3928 lm!215)) p!166))))

(assert (= (and d!75881 (not res!284622)) b!476742))

(assert (= (and b!476742 res!284623) b!476743))

(declare-fun b_lambda!10489 () Bool)

(assert (=> (not b_lambda!10489) (not b!476742)))

(declare-fun t!15001 () Bool)

(declare-fun tb!3997 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15001) tb!3997))

(declare-fun result!7553 () Bool)

(assert (=> tb!3997 (= result!7553 true)))

(assert (=> b!476742 t!15001))

(declare-fun b_and!20711 () Bool)

(assert (= b_and!20707 (and (=> t!15001 result!7553) b_and!20711)))

(declare-fun m!459265 () Bool)

(assert (=> b!476742 m!459265))

(declare-fun m!459267 () Bool)

(assert (=> b!476743 m!459267))

(assert (=> start!42796 d!75881))

(declare-fun d!75889 () Bool)

(declare-fun isStrictlySorted!372 (List!8959) Bool)

(assert (=> d!75889 (= (inv!15487 lm!215) (isStrictlySorted!372 (toList!3928 lm!215)))))

(declare-fun bs!15170 () Bool)

(assert (= bs!15170 d!75889))

(declare-fun m!459275 () Bool)

(assert (=> bs!15170 m!459275))

(assert (=> start!42796 d!75889))

(declare-fun b!476757 () Bool)

(declare-fun e!280060 () Bool)

(declare-fun tp!42385 () Bool)

(assert (=> b!476757 (= e!280060 (and tp_is_empty!13519 tp!42385))))

(assert (=> b!476669 (= tp!42366 e!280060)))

(assert (= (and b!476669 ((_ is Cons!8955) (toList!3928 lm!215))) b!476757))

(declare-fun b_lambda!10493 () Bool)

(assert (= b_lambda!10489 (or (and start!42796 b_free!12097) b_lambda!10493)))

(declare-fun b_lambda!10497 () Bool)

(assert (= b_lambda!10485 (or (and start!42796 b_free!12097) b_lambda!10497)))

(check-sat b_and!20711 (not b_lambda!10475) (not b!476715) (not b!476757) (not b_lambda!10497) (not b!476719) (not d!75853) (not d!75889) (not b_next!12097) tp_is_empty!13519 (not d!75877) (not b_lambda!10493) (not b!476743) (not b!476733))
(check-sat b_and!20711 (not b_next!12097))
(get-model)

(declare-fun d!75893 () Bool)

(assert (=> d!75893 (= (tail!123 (toList!3928 lm!215)) (t!14985 (toList!3928 lm!215)))))

(assert (=> d!75877 d!75893))

(declare-fun d!75895 () Bool)

(declare-fun res!284630 () Bool)

(declare-fun e!280068 () Bool)

(assert (=> d!75895 (=> res!284630 e!280068)))

(assert (=> d!75895 (= res!284630 (or ((_ is Nil!8956) (toList!3928 lm!215)) ((_ is Nil!8956) (t!14985 (toList!3928 lm!215)))))))

(assert (=> d!75895 (= (isStrictlySorted!372 (toList!3928 lm!215)) e!280068)))

(declare-fun b!476767 () Bool)

(declare-fun e!280069 () Bool)

(assert (=> b!476767 (= e!280068 e!280069)))

(declare-fun res!284631 () Bool)

(assert (=> b!476767 (=> (not res!284631) (not e!280069))))

(assert (=> b!476767 (= res!284631 (bvslt (_1!4466 (h!9811 (toList!3928 lm!215))) (_1!4466 (h!9811 (t!14985 (toList!3928 lm!215))))))))

(declare-fun b!476768 () Bool)

(assert (=> b!476768 (= e!280069 (isStrictlySorted!372 (t!14985 (toList!3928 lm!215))))))

(assert (= (and d!75895 (not res!284630)) b!476767))

(assert (= (and b!476767 res!284631) b!476768))

(declare-fun m!459279 () Bool)

(assert (=> b!476768 m!459279))

(assert (=> d!75889 d!75895))

(declare-fun d!75897 () Bool)

(declare-fun lt!217342 () Int)

(assert (=> d!75897 (>= lt!217342 0)))

(declare-fun e!280070 () Int)

(assert (=> d!75897 (= lt!217342 e!280070)))

(declare-fun c!57341 () Bool)

(assert (=> d!75897 (= c!57341 ((_ is Nil!8956) (t!14985 (toList!3928 lt!217323))))))

(assert (=> d!75897 (= (size!15134 (t!14985 (toList!3928 lt!217323))) lt!217342)))

(declare-fun b!476769 () Bool)

(assert (=> b!476769 (= e!280070 0)))

(declare-fun b!476770 () Bool)

(assert (=> b!476770 (= e!280070 (+ 1 (size!15134 (t!14985 (t!14985 (toList!3928 lt!217323))))))))

(assert (= (and d!75897 c!57341) b!476769))

(assert (= (and d!75897 (not c!57341)) b!476770))

(declare-fun m!459281 () Bool)

(assert (=> b!476770 m!459281))

(assert (=> b!476715 d!75897))

(declare-fun d!75899 () Bool)

(declare-fun res!284632 () Bool)

(declare-fun e!280071 () Bool)

(assert (=> d!75899 (=> res!284632 e!280071)))

(assert (=> d!75899 (= res!284632 ((_ is Nil!8956) (t!14985 (toList!3928 lt!217323))))))

(assert (=> d!75899 (= (forall!194 (t!14985 (toList!3928 lt!217323)) p!166) e!280071)))

(declare-fun b!476771 () Bool)

(declare-fun e!280072 () Bool)

(assert (=> b!476771 (= e!280071 e!280072)))

(declare-fun res!284633 () Bool)

(assert (=> b!476771 (=> (not res!284633) (not e!280072))))

(assert (=> b!476771 (= res!284633 (dynLambda!938 p!166 (h!9811 (t!14985 (toList!3928 lt!217323)))))))

(declare-fun b!476772 () Bool)

(assert (=> b!476772 (= e!280072 (forall!194 (t!14985 (t!14985 (toList!3928 lt!217323))) p!166))))

(assert (= (and d!75899 (not res!284632)) b!476771))

(assert (= (and b!476771 res!284633) b!476772))

(declare-fun b_lambda!10505 () Bool)

(assert (=> (not b_lambda!10505) (not b!476771)))

(declare-fun t!15005 () Bool)

(declare-fun tb!4001 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15005) tb!4001))

(declare-fun result!7563 () Bool)

(assert (=> tb!4001 (= result!7563 true)))

(assert (=> b!476771 t!15005))

(declare-fun b_and!20715 () Bool)

(assert (= b_and!20711 (and (=> t!15005 result!7563) b_and!20715)))

(declare-fun m!459283 () Bool)

(assert (=> b!476771 m!459283))

(declare-fun m!459285 () Bool)

(assert (=> b!476772 m!459285))

(assert (=> b!476733 d!75899))

(declare-fun d!75901 () Bool)

(declare-fun res!284634 () Bool)

(declare-fun e!280073 () Bool)

(assert (=> d!75901 (=> res!284634 e!280073)))

(assert (=> d!75901 (= res!284634 ((_ is Nil!8956) (t!14985 (toList!3928 lm!215))))))

(assert (=> d!75901 (= (forall!194 (t!14985 (toList!3928 lm!215)) p!166) e!280073)))

(declare-fun b!476773 () Bool)

(declare-fun e!280074 () Bool)

(assert (=> b!476773 (= e!280073 e!280074)))

(declare-fun res!284635 () Bool)

(assert (=> b!476773 (=> (not res!284635) (not e!280074))))

(assert (=> b!476773 (= res!284635 (dynLambda!938 p!166 (h!9811 (t!14985 (toList!3928 lm!215)))))))

(declare-fun b!476774 () Bool)

(assert (=> b!476774 (= e!280074 (forall!194 (t!14985 (t!14985 (toList!3928 lm!215))) p!166))))

(assert (= (and d!75901 (not res!284634)) b!476773))

(assert (= (and b!476773 res!284635) b!476774))

(declare-fun b_lambda!10507 () Bool)

(assert (=> (not b_lambda!10507) (not b!476773)))

(declare-fun t!15007 () Bool)

(declare-fun tb!4003 () Bool)

(assert (=> (and start!42796 (= p!166 p!166) t!15007) tb!4003))

(declare-fun result!7565 () Bool)

(assert (=> tb!4003 (= result!7565 true)))

(assert (=> b!476773 t!15007))

(declare-fun b_and!20717 () Bool)

(assert (= b_and!20715 (and (=> t!15007 result!7565) b_and!20717)))

(declare-fun m!459287 () Bool)

(assert (=> b!476773 m!459287))

(declare-fun m!459289 () Bool)

(assert (=> b!476774 m!459289))

(assert (=> b!476743 d!75901))

(declare-fun d!75903 () Bool)

(declare-fun lt!217343 () Int)

(assert (=> d!75903 (>= lt!217343 0)))

(declare-fun e!280075 () Int)

(assert (=> d!75903 (= lt!217343 e!280075)))

(declare-fun c!57342 () Bool)

(assert (=> d!75903 (= c!57342 ((_ is Nil!8956) (t!14985 (toList!3928 lm!215))))))

(assert (=> d!75903 (= (size!15134 (t!14985 (toList!3928 lm!215))) lt!217343)))

(declare-fun b!476775 () Bool)

(assert (=> b!476775 (= e!280075 0)))

(declare-fun b!476776 () Bool)

(assert (=> b!476776 (= e!280075 (+ 1 (size!15134 (t!14985 (t!14985 (toList!3928 lm!215))))))))

(assert (= (and d!75903 c!57342) b!476775))

(assert (= (and d!75903 (not c!57342)) b!476776))

(declare-fun m!459291 () Bool)

(assert (=> b!476776 m!459291))

(assert (=> b!476719 d!75903))

(declare-fun d!75905 () Bool)

(assert (=> d!75905 (= (isEmpty!605 (toList!3928 lm!215)) ((_ is Nil!8956) (toList!3928 lm!215)))))

(assert (=> d!75853 d!75905))

(declare-fun b!476777 () Bool)

(declare-fun e!280076 () Bool)

(declare-fun tp!42389 () Bool)

(assert (=> b!476777 (= e!280076 (and tp_is_empty!13519 tp!42389))))

(assert (=> b!476757 (= tp!42385 e!280076)))

(assert (= (and b!476757 ((_ is Cons!8955) (t!14985 (toList!3928 lm!215)))) b!476777))

(declare-fun b_lambda!10509 () Bool)

(assert (= b_lambda!10507 (or (and start!42796 b_free!12097) b_lambda!10509)))

(declare-fun b_lambda!10511 () Bool)

(assert (= b_lambda!10505 (or (and start!42796 b_free!12097) b_lambda!10511)))

(check-sat (not b_lambda!10475) (not b_lambda!10493) (not b!476770) (not b_lambda!10511) (not b!476777) (not b!476774) (not b!476772) (not b_lambda!10497) (not b!476776) (not b!476768) b_and!20717 (not b_lambda!10509) (not b_next!12097) tp_is_empty!13519)
(check-sat b_and!20717 (not b_next!12097))
