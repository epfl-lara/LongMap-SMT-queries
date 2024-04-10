; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42810 () Bool)

(assert start!42810)

(declare-fun b_free!12097 () Bool)

(declare-fun b_next!12097 () Bool)

(assert (=> start!42810 (= b_free!12097 (not b_next!12097))))

(declare-fun tp!42366 () Bool)

(declare-fun b_and!20681 () Bool)

(assert (=> start!42810 (= tp!42366 b_and!20681)))

(declare-fun b!476726 () Bool)

(declare-fun res!284582 () Bool)

(declare-fun e!280039 () Bool)

(assert (=> b!476726 (=> (not res!284582) (not e!280039))))

(declare-datatypes ((B!1046 0))(
  ( (B!1047 (val!6807 Int)) )
))
(declare-fun b!85 () B!1046)

(declare-fun p!166 () Int)

(declare-fun a!501 () (_ BitVec 64))

(declare-datatypes ((tuple2!8986 0))(
  ( (tuple2!8987 (_1!4504 (_ BitVec 64)) (_2!4504 B!1046)) )
))
(declare-fun dynLambda!941 (Int tuple2!8986) Bool)

(assert (=> b!476726 (= res!284582 (dynLambda!941 p!166 (tuple2!8987 a!501 b!85)))))

(declare-fun b!476727 () Bool)

(declare-fun e!280037 () Bool)

(declare-datatypes ((List!9050 0))(
  ( (Nil!9047) (Cons!9046 (h!9902 tuple2!8986) (t!15084 List!9050)) )
))
(declare-datatypes ((ListLongMap!7899 0))(
  ( (ListLongMap!7900 (toList!3965 List!9050)) )
))
(declare-fun lt!217311 () ListLongMap!7899)

(declare-fun lm!215 () ListLongMap!7899)

(declare-fun size!15140 (List!9050) Int)

(assert (=> b!476727 (= e!280037 (>= (size!15140 (toList!3965 lt!217311)) (size!15140 (toList!3965 lm!215))))))

(declare-fun b!476728 () Bool)

(assert (=> b!476728 (= e!280039 e!280037)))

(declare-fun res!284581 () Bool)

(assert (=> b!476728 (=> (not res!284581) (not e!280037))))

(declare-fun forall!194 (List!9050 Int) Bool)

(assert (=> b!476728 (= res!284581 (forall!194 (toList!3965 lt!217311) p!166))))

(declare-fun tail!119 (ListLongMap!7899) ListLongMap!7899)

(assert (=> b!476728 (= lt!217311 (tail!119 lm!215))))

(declare-fun res!284584 () Bool)

(assert (=> start!42810 (=> (not res!284584) (not e!280039))))

(assert (=> start!42810 (= res!284584 (forall!194 (toList!3965 lm!215) p!166))))

(assert (=> start!42810 e!280039))

(declare-fun e!280038 () Bool)

(declare-fun inv!15487 (ListLongMap!7899) Bool)

(assert (=> start!42810 (and (inv!15487 lm!215) e!280038)))

(assert (=> start!42810 tp!42366))

(assert (=> start!42810 true))

(declare-fun tp_is_empty!13519 () Bool)

(assert (=> start!42810 tp_is_empty!13519))

(declare-fun b!476729 () Bool)

(declare-fun res!284583 () Bool)

(assert (=> b!476729 (=> (not res!284583) (not e!280039))))

(declare-fun isEmpty!595 (ListLongMap!7899) Bool)

(assert (=> b!476729 (= res!284583 (not (isEmpty!595 lm!215)))))

(declare-fun b!476730 () Bool)

(declare-fun tp!42367 () Bool)

(assert (=> b!476730 (= e!280038 tp!42367)))

(assert (= (and start!42810 res!284584) b!476726))

(assert (= (and b!476726 res!284582) b!476729))

(assert (= (and b!476729 res!284583) b!476728))

(assert (= (and b!476728 res!284581) b!476727))

(assert (= start!42810 b!476730))

(declare-fun b_lambda!10455 () Bool)

(assert (=> (not b_lambda!10455) (not b!476726)))

(declare-fun t!15083 () Bool)

(declare-fun tb!3991 () Bool)

(assert (=> (and start!42810 (= p!166 p!166) t!15083) tb!3991))

(declare-fun result!7547 () Bool)

(assert (=> tb!3991 (= result!7547 true)))

(assert (=> b!476726 t!15083))

(declare-fun b_and!20683 () Bool)

(assert (= b_and!20681 (and (=> t!15083 result!7547) b_and!20683)))

(declare-fun m!458995 () Bool)

(assert (=> b!476726 m!458995))

(declare-fun m!458997 () Bool)

(assert (=> b!476729 m!458997))

(declare-fun m!458999 () Bool)

(assert (=> start!42810 m!458999))

(declare-fun m!459001 () Bool)

(assert (=> start!42810 m!459001))

(declare-fun m!459003 () Bool)

(assert (=> b!476727 m!459003))

(declare-fun m!459005 () Bool)

(assert (=> b!476727 m!459005))

(declare-fun m!459007 () Bool)

(assert (=> b!476728 m!459007))

(declare-fun m!459009 () Bool)

(assert (=> b!476728 m!459009))

(push 1)

(assert (not b_lambda!10455))

(assert (not b!476729))

(assert (not b!476727))

(assert (not b!476730))

(assert tp_is_empty!13519)

(assert (not b!476728))

(assert (not b_next!12097))

(assert (not start!42810))

(assert b_and!20683)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20683)

(assert (not b_next!12097))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10463 () Bool)

(assert (= b_lambda!10455 (or (and start!42810 b_free!12097) b_lambda!10463)))

(push 1)

(assert (not b!476729))

(assert (not b!476727))

(assert (not b!476730))

(assert tp_is_empty!13519)

(assert (not b_lambda!10463))

(assert (not b!476728))

(assert (not b_next!12097))

(assert (not start!42810))

(assert b_and!20683)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20683)

(assert (not b_next!12097))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75823 () Bool)

(declare-fun res!284613 () Bool)

(declare-fun e!280062 () Bool)

(assert (=> d!75823 (=> res!284613 e!280062)))

(assert (=> d!75823 (= res!284613 (is-Nil!9047 (toList!3965 lt!217311)))))

(assert (=> d!75823 (= (forall!194 (toList!3965 lt!217311) p!166) e!280062)))

(declare-fun b!476765 () Bool)

(declare-fun e!280063 () Bool)

(assert (=> b!476765 (= e!280062 e!280063)))

(declare-fun res!284614 () Bool)

(assert (=> b!476765 (=> (not res!284614) (not e!280063))))

(assert (=> b!476765 (= res!284614 (dynLambda!941 p!166 (h!9902 (toList!3965 lt!217311))))))

(declare-fun b!476766 () Bool)

(assert (=> b!476766 (= e!280063 (forall!194 (t!15084 (toList!3965 lt!217311)) p!166))))

(assert (= (and d!75823 (not res!284613)) b!476765))

(assert (= (and b!476765 res!284614) b!476766))

(declare-fun b_lambda!10467 () Bool)

(assert (=> (not b_lambda!10467) (not b!476765)))

(declare-fun t!15092 () Bool)

(declare-fun tb!3997 () Bool)

(assert (=> (and start!42810 (= p!166 p!166) t!15092) tb!3997))

(declare-fun result!7553 () Bool)

(assert (=> tb!3997 (= result!7553 true)))

(assert (=> b!476765 t!15092))

(declare-fun b_and!20693 () Bool)

(assert (= b_and!20683 (and (=> t!15092 result!7553) b_and!20693)))

(declare-fun m!459043 () Bool)

(assert (=> b!476765 m!459043))

(declare-fun m!459045 () Bool)

(assert (=> b!476766 m!459045))

(assert (=> b!476728 d!75823))

(declare-fun d!75829 () Bool)

(declare-fun tail!122 (List!9050) List!9050)

(assert (=> d!75829 (= (tail!119 lm!215) (ListLongMap!7900 (tail!122 (toList!3965 lm!215))))))

(declare-fun bs!15147 () Bool)

(assert (= bs!15147 d!75829))

(declare-fun m!459047 () Bool)

(assert (=> bs!15147 m!459047))

(assert (=> b!476728 d!75829))

(declare-fun d!75831 () Bool)

(declare-fun lt!217324 () Int)

(assert (=> d!75831 (>= lt!217324 0)))

(declare-fun e!280080 () Int)

(assert (=> d!75831 (= lt!217324 e!280080)))

(declare-fun c!57362 () Bool)

(assert (=> d!75831 (= c!57362 (is-Nil!9047 (toList!3965 lt!217311)))))

(assert (=> d!75831 (= (size!15140 (toList!3965 lt!217311)) lt!217324)))

(declare-fun b!476789 () Bool)

(assert (=> b!476789 (= e!280080 0)))

(declare-fun b!476790 () Bool)

(assert (=> b!476790 (= e!280080 (+ 1 (size!15140 (t!15084 (toList!3965 lt!217311)))))))

(assert (= (and d!75831 c!57362) b!476789))

(assert (= (and d!75831 (not c!57362)) b!476790))

(declare-fun m!459057 () Bool)

(assert (=> b!476790 m!459057))

(assert (=> b!476727 d!75831))

(declare-fun d!75839 () Bool)

(declare-fun lt!217325 () Int)

(assert (=> d!75839 (>= lt!217325 0)))

(declare-fun e!280081 () Int)

(assert (=> d!75839 (= lt!217325 e!280081)))

(declare-fun c!57363 () Bool)

(assert (=> d!75839 (= c!57363 (is-Nil!9047 (toList!3965 lm!215)))))

(assert (=> d!75839 (= (size!15140 (toList!3965 lm!215)) lt!217325)))

(declare-fun b!476791 () Bool)

(assert (=> b!476791 (= e!280081 0)))

(declare-fun b!476792 () Bool)

(assert (=> b!476792 (= e!280081 (+ 1 (size!15140 (t!15084 (toList!3965 lm!215)))))))

(assert (= (and d!75839 c!57363) b!476791))

(assert (= (and d!75839 (not c!57363)) b!476792))

(declare-fun m!459061 () Bool)

(assert (=> b!476792 m!459061))

(assert (=> b!476727 d!75839))

(declare-fun d!75843 () Bool)

(declare-fun res!284629 () Bool)

(declare-fun e!280086 () Bool)

(assert (=> d!75843 (=> res!284629 e!280086)))

(assert (=> d!75843 (= res!284629 (is-Nil!9047 (toList!3965 lm!215)))))

(assert (=> d!75843 (= (forall!194 (toList!3965 lm!215) p!166) e!280086)))

(declare-fun b!476797 () Bool)

(declare-fun e!280087 () Bool)

(assert (=> b!476797 (= e!280086 e!280087)))

(declare-fun res!284630 () Bool)

(assert (=> b!476797 (=> (not res!284630) (not e!280087))))

(assert (=> b!476797 (= res!284630 (dynLambda!941 p!166 (h!9902 (toList!3965 lm!215))))))

(declare-fun b!476798 () Bool)

(assert (=> b!476798 (= e!280087 (forall!194 (t!15084 (toList!3965 lm!215)) p!166))))

(assert (= (and d!75843 (not res!284629)) b!476797))

(assert (= (and b!476797 res!284630) b!476798))

(declare-fun b_lambda!10475 () Bool)

(assert (=> (not b_lambda!10475) (not b!476797)))

(declare-fun t!15100 () Bool)

(declare-fun tb!4005 () Bool)

(assert (=> (and start!42810 (= p!166 p!166) t!15100) tb!4005))

(declare-fun result!7561 () Bool)

(assert (=> tb!4005 (= result!7561 true)))

(assert (=> b!476797 t!15100))

(declare-fun b_and!20701 () Bool)

(assert (= b_and!20693 (and (=> t!15100 result!7561) b_and!20701)))

(declare-fun m!459071 () Bool)

(assert (=> b!476797 m!459071))

(declare-fun m!459073 () Bool)

(assert (=> b!476798 m!459073))

(assert (=> start!42810 d!75843))

(declare-fun d!75849 () Bool)

(declare-fun isStrictlySorted!385 (List!9050) Bool)

(assert (=> d!75849 (= (inv!15487 lm!215) (isStrictlySorted!385 (toList!3965 lm!215)))))

(declare-fun bs!15151 () Bool)

(assert (= bs!15151 d!75849))

(declare-fun m!459079 () Bool)

(assert (=> bs!15151 m!459079))

(assert (=> start!42810 d!75849))

(declare-fun d!75855 () Bool)

(declare-fun isEmpty!598 (List!9050) Bool)

(assert (=> d!75855 (= (isEmpty!595 lm!215) (isEmpty!598 (toList!3965 lm!215)))))

(declare-fun bs!15153 () Bool)

(assert (= bs!15153 d!75855))

(declare-fun m!459087 () Bool)

(assert (=> bs!15153 m!459087))

(assert (=> b!476729 d!75855))

(declare-fun b!476809 () Bool)

(declare-fun e!280094 () Bool)

(declare-fun tp!42382 () Bool)

(assert (=> b!476809 (= e!280094 (and tp_is_empty!13519 tp!42382))))

(assert (=> b!476730 (= tp!42367 e!280094)))

(assert (= (and b!476730 (is-Cons!9046 (toList!3965 lm!215))) b!476809))

(declare-fun b_lambda!10479 () Bool)

(assert (= b_lambda!10467 (or (and start!42810 b_free!12097) b_lambda!10479)))

(declare-fun b_lambda!10481 () Bool)

(assert (= b_lambda!10475 (or (and start!42810 b_free!12097) b_lambda!10481)))

(push 1)

(assert (not b!476766))

(assert (not d!75855))

(assert (not b!476790))

(assert (not b_lambda!10479))

(assert (not b_lambda!10481))

(assert tp_is_empty!13519)

(assert (not b!476809))

(assert (not b_lambda!10463))

(assert (not d!75829))

(assert (not b_next!12097))

(assert (not d!75849))

(assert b_and!20701)

(assert (not b!476798))

(assert (not b!476792))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20701)

(assert (not b_next!12097))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75865 () Bool)

(declare-fun lt!217330 () Int)

(assert (=> d!75865 (>= lt!217330 0)))

(declare-fun e!280103 () Int)

(assert (=> d!75865 (= lt!217330 e!280103)))

(declare-fun c!57368 () Bool)

(assert (=> d!75865 (= c!57368 (is-Nil!9047 (t!15084 (toList!3965 lm!215))))))

(assert (=> d!75865 (= (size!15140 (t!15084 (toList!3965 lm!215))) lt!217330)))

(declare-fun b!476824 () Bool)

(assert (=> b!476824 (= e!280103 0)))

(declare-fun b!476825 () Bool)

(assert (=> b!476825 (= e!280103 (+ 1 (size!15140 (t!15084 (t!15084 (toList!3965 lm!215))))))))

(assert (= (and d!75865 c!57368) b!476824))

(assert (= (and d!75865 (not c!57368)) b!476825))

(declare-fun m!459097 () Bool)

(assert (=> b!476825 m!459097))

(assert (=> b!476792 d!75865))

(declare-fun d!75869 () Bool)

(declare-fun res!284633 () Bool)

(declare-fun e!280105 () Bool)

(assert (=> d!75869 (=> res!284633 e!280105)))

(assert (=> d!75869 (= res!284633 (is-Nil!9047 (t!15084 (toList!3965 lt!217311))))))

(assert (=> d!75869 (= (forall!194 (t!15084 (toList!3965 lt!217311)) p!166) e!280105)))

(declare-fun b!476828 () Bool)

(declare-fun e!280106 () Bool)

(assert (=> b!476828 (= e!280105 e!280106)))

(declare-fun res!284634 () Bool)

(assert (=> b!476828 (=> (not res!284634) (not e!280106))))

(assert (=> b!476828 (= res!284634 (dynLambda!941 p!166 (h!9902 (t!15084 (toList!3965 lt!217311)))))))

(declare-fun b!476829 () Bool)

(assert (=> b!476829 (= e!280106 (forall!194 (t!15084 (t!15084 (toList!3965 lt!217311))) p!166))))

(assert (= (and d!75869 (not res!284633)) b!476828))

(assert (= (and b!476828 res!284634) b!476829))

(declare-fun b_lambda!10491 () Bool)

(assert (=> (not b_lambda!10491) (not b!476828)))

(declare-fun t!15104 () Bool)

(declare-fun tb!4009 () Bool)

(assert (=> (and start!42810 (= p!166 p!166) t!15104) tb!4009))

(declare-fun result!7571 () Bool)

(assert (=> tb!4009 (= result!7571 true)))

(assert (=> b!476828 t!15104))

(declare-fun b_and!20705 () Bool)

(assert (= b_and!20701 (and (=> t!15104 result!7571) b_and!20705)))

(declare-fun m!459101 () Bool)

(assert (=> b!476828 m!459101))

(declare-fun m!459103 () Bool)

(assert (=> b!476829 m!459103))

(assert (=> b!476766 d!75869))

(declare-fun d!75875 () Bool)

(assert (=> d!75875 (= (tail!122 (toList!3965 lm!215)) (t!15084 (toList!3965 lm!215)))))

(assert (=> d!75829 d!75875))

(declare-fun d!75879 () Bool)

(declare-fun lt!217333 () Int)

(assert (=> d!75879 (>= lt!217333 0)))

(declare-fun e!280108 () Int)

(assert (=> d!75879 (= lt!217333 e!280108)))

(declare-fun c!57371 () Bool)

(assert (=> d!75879 (= c!57371 (is-Nil!9047 (t!15084 (toList!3965 lt!217311))))))

(assert (=> d!75879 (= (size!15140 (t!15084 (toList!3965 lt!217311))) lt!217333)))

(declare-fun b!476832 () Bool)

(assert (=> b!476832 (= e!280108 0)))

(declare-fun b!476833 () Bool)

(assert (=> b!476833 (= e!280108 (+ 1 (size!15140 (t!15084 (t!15084 (toList!3965 lt!217311))))))))

(assert (= (and d!75879 c!57371) b!476832))

(assert (= (and d!75879 (not c!57371)) b!476833))

(declare-fun m!459107 () Bool)

(assert (=> b!476833 m!459107))

(assert (=> b!476790 d!75879))

(declare-fun d!75883 () Bool)

(assert (=> d!75883 (= (isEmpty!598 (toList!3965 lm!215)) (is-Nil!9047 (toList!3965 lm!215)))))

(assert (=> d!75855 d!75883))

(declare-fun d!75885 () Bool)

(declare-fun res!284647 () Bool)

(declare-fun e!280121 () Bool)

(assert (=> d!75885 (=> res!284647 e!280121)))

(assert (=> d!75885 (= res!284647 (or (is-Nil!9047 (toList!3965 lm!215)) (is-Nil!9047 (t!15084 (toList!3965 lm!215)))))))

(assert (=> d!75885 (= (isStrictlySorted!385 (toList!3965 lm!215)) e!280121)))

(declare-fun b!476846 () Bool)

(declare-fun e!280122 () Bool)

(assert (=> b!476846 (= e!280121 e!280122)))

(declare-fun res!284648 () Bool)

(assert (=> b!476846 (=> (not res!284648) (not e!280122))))

(assert (=> b!476846 (= res!284648 (bvslt (_1!4504 (h!9902 (toList!3965 lm!215))) (_1!4504 (h!9902 (t!15084 (toList!3965 lm!215))))))))

(declare-fun b!476847 () Bool)

(assert (=> b!476847 (= e!280122 (isStrictlySorted!385 (t!15084 (toList!3965 lm!215))))))

(assert (= (and d!75885 (not res!284647)) b!476846))

(assert (= (and b!476846 res!284648) b!476847))

(declare-fun m!459111 () Bool)

(assert (=> b!476847 m!459111))

(assert (=> d!75849 d!75885))

(declare-fun d!75889 () Bool)

(declare-fun res!284649 () Bool)

(declare-fun e!280123 () Bool)

(assert (=> d!75889 (=> res!284649 e!280123)))

(assert (=> d!75889 (= res!284649 (is-Nil!9047 (t!15084 (toList!3965 lm!215))))))

(assert (=> d!75889 (= (forall!194 (t!15084 (toList!3965 lm!215)) p!166) e!280123)))

(declare-fun b!476848 () Bool)

(declare-fun e!280124 () Bool)

(assert (=> b!476848 (= e!280123 e!280124)))

(declare-fun res!284650 () Bool)

(assert (=> b!476848 (=> (not res!284650) (not e!280124))))

(assert (=> b!476848 (= res!284650 (dynLambda!941 p!166 (h!9902 (t!15084 (toList!3965 lm!215)))))))

(declare-fun b!476849 () Bool)

(assert (=> b!476849 (= e!280124 (forall!194 (t!15084 (t!15084 (toList!3965 lm!215))) p!166))))

(assert (= (and d!75889 (not res!284649)) b!476848))

(assert (= (and b!476848 res!284650) b!476849))

(declare-fun b_lambda!10495 () Bool)

(assert (=> (not b_lambda!10495) (not b!476848)))

(declare-fun t!15108 () Bool)

(declare-fun tb!4013 () Bool)

(assert (=> (and start!42810 (= p!166 p!166) t!15108) tb!4013))

(declare-fun result!7575 () Bool)

(assert (=> tb!4013 (= result!7575 true)))

(assert (=> b!476848 t!15108))

(declare-fun b_and!20709 () Bool)

(assert (= b_and!20705 (and (=> t!15108 result!7575) b_and!20709)))

(declare-fun m!459117 () Bool)

(assert (=> b!476848 m!459117))

(declare-fun m!459119 () Bool)

(assert (=> b!476849 m!459119))

(assert (=> b!476798 d!75889))

(declare-fun b!476852 () Bool)

(declare-fun e!280127 () Bool)

(declare-fun tp!42389 () Bool)

(assert (=> b!476852 (= e!280127 (and tp_is_empty!13519 tp!42389))))

(assert (=> b!476809 (= tp!42382 e!280127)))

(assert (= (and b!476809 (is-Cons!9046 (t!15084 (toList!3965 lm!215)))) b!476852))

(declare-fun b_lambda!10499 () Bool)

(assert (= b_lambda!10495 (or (and start!42810 b_free!12097) b_lambda!10499)))

(declare-fun b_lambda!10501 () Bool)

(assert (= b_lambda!10491 (or (and start!42810 b_free!12097) b_lambda!10501)))

(push 1)

(assert (not b!476852))

(assert (not b_lambda!10481))

(assert tp_is_empty!13519)

