; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89188 () Bool)

(assert start!89188)

(declare-fun b!1021825 () Bool)

(declare-fun res!684514 () Bool)

(declare-fun e!575284 () Bool)

(assert (=> b!1021825 (=> (not res!684514) (not e!575284))))

(declare-datatypes ((B!1736 0))(
  ( (B!1737 (val!11952 Int)) )
))
(declare-datatypes ((tuple2!15454 0))(
  ( (tuple2!15455 (_1!7738 (_ BitVec 64)) (_2!7738 B!1736)) )
))
(declare-datatypes ((List!21629 0))(
  ( (Nil!21626) (Cons!21625 (h!22832 tuple2!15454) (t!30631 List!21629)) )
))
(declare-fun l!1367 () List!21629)

(declare-fun lt!450389 () tuple2!15454)

(declare-fun contains!5954 (List!21629 tuple2!15454) Bool)

(assert (=> b!1021825 (= res!684514 (contains!5954 (t!30631 l!1367) lt!450389))))

(declare-fun res!684518 () Bool)

(declare-fun e!575285 () Bool)

(assert (=> start!89188 (=> (not res!684518) (not e!575285))))

(declare-fun isStrictlySorted!693 (List!21629) Bool)

(assert (=> start!89188 (= res!684518 (isStrictlySorted!693 l!1367))))

(assert (=> start!89188 e!575285))

(declare-fun e!575286 () Bool)

(assert (=> start!89188 e!575286))

(assert (=> start!89188 true))

(declare-fun tp_is_empty!23803 () Bool)

(assert (=> start!89188 tp_is_empty!23803))

(declare-fun b!1021826 () Bool)

(assert (=> b!1021826 (= e!575285 e!575284)))

(declare-fun res!684517 () Bool)

(assert (=> b!1021826 (=> (not res!684517) (not e!575284))))

(assert (=> b!1021826 (= res!684517 (contains!5954 l!1367 lt!450389))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1736)

(assert (=> b!1021826 (= lt!450389 (tuple2!15455 key!393 value!188))))

(declare-fun b!1021827 () Bool)

(declare-fun res!684516 () Bool)

(assert (=> b!1021827 (=> (not res!684516) (not e!575284))))

(get-info :version)

(assert (=> b!1021827 (= res!684516 (and ((_ is Cons!21625) l!1367) (not (= (h!22832 l!1367) lt!450389))))))

(declare-fun b!1021828 () Bool)

(declare-fun ListPrimitiveSize!142 (List!21629) Int)

(assert (=> b!1021828 (= e!575284 (>= (ListPrimitiveSize!142 (t!30631 l!1367)) (ListPrimitiveSize!142 l!1367)))))

(declare-fun b!1021829 () Bool)

(declare-fun res!684515 () Bool)

(assert (=> b!1021829 (=> (not res!684515) (not e!575284))))

(assert (=> b!1021829 (= res!684515 (isStrictlySorted!693 (t!30631 l!1367)))))

(declare-fun b!1021830 () Bool)

(declare-fun tp!71272 () Bool)

(assert (=> b!1021830 (= e!575286 (and tp_is_empty!23803 tp!71272))))

(assert (= (and start!89188 res!684518) b!1021826))

(assert (= (and b!1021826 res!684517) b!1021827))

(assert (= (and b!1021827 res!684516) b!1021829))

(assert (= (and b!1021829 res!684515) b!1021825))

(assert (= (and b!1021825 res!684514) b!1021828))

(assert (= (and start!89188 ((_ is Cons!21625) l!1367)) b!1021830))

(declare-fun m!942075 () Bool)

(assert (=> b!1021825 m!942075))

(declare-fun m!942077 () Bool)

(assert (=> b!1021829 m!942077))

(declare-fun m!942079 () Bool)

(assert (=> b!1021828 m!942079))

(declare-fun m!942081 () Bool)

(assert (=> b!1021828 m!942081))

(declare-fun m!942083 () Bool)

(assert (=> start!89188 m!942083))

(declare-fun m!942085 () Bool)

(assert (=> b!1021826 m!942085))

(check-sat (not start!89188) (not b!1021828) (not b!1021830) (not b!1021829) tp_is_empty!23803 (not b!1021825) (not b!1021826))
(check-sat)
(get-model)

(declare-fun d!122837 () Bool)

(declare-fun lt!450400 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!502 (List!21629) (InoxSet tuple2!15454))

(assert (=> d!122837 (= lt!450400 (select (content!502 l!1367) lt!450389))))

(declare-fun e!575317 () Bool)

(assert (=> d!122837 (= lt!450400 e!575317)))

(declare-fun res!684561 () Bool)

(assert (=> d!122837 (=> (not res!684561) (not e!575317))))

(assert (=> d!122837 (= res!684561 ((_ is Cons!21625) l!1367))))

(assert (=> d!122837 (= (contains!5954 l!1367 lt!450389) lt!450400)))

(declare-fun b!1021879 () Bool)

(declare-fun e!575318 () Bool)

(assert (=> b!1021879 (= e!575317 e!575318)))

(declare-fun res!684562 () Bool)

(assert (=> b!1021879 (=> res!684562 e!575318)))

(assert (=> b!1021879 (= res!684562 (= (h!22832 l!1367) lt!450389))))

(declare-fun b!1021880 () Bool)

(assert (=> b!1021880 (= e!575318 (contains!5954 (t!30631 l!1367) lt!450389))))

(assert (= (and d!122837 res!684561) b!1021879))

(assert (= (and b!1021879 (not res!684562)) b!1021880))

(declare-fun m!942113 () Bool)

(assert (=> d!122837 m!942113))

(declare-fun m!942116 () Bool)

(assert (=> d!122837 m!942116))

(assert (=> b!1021880 m!942075))

(assert (=> b!1021826 d!122837))

(declare-fun d!122843 () Bool)

(declare-fun lt!450402 () Bool)

(assert (=> d!122843 (= lt!450402 (select (content!502 (t!30631 l!1367)) lt!450389))))

(declare-fun e!575323 () Bool)

(assert (=> d!122843 (= lt!450402 e!575323)))

(declare-fun res!684567 () Bool)

(assert (=> d!122843 (=> (not res!684567) (not e!575323))))

(assert (=> d!122843 (= res!684567 ((_ is Cons!21625) (t!30631 l!1367)))))

(assert (=> d!122843 (= (contains!5954 (t!30631 l!1367) lt!450389) lt!450402)))

(declare-fun b!1021885 () Bool)

(declare-fun e!575324 () Bool)

(assert (=> b!1021885 (= e!575323 e!575324)))

(declare-fun res!684568 () Bool)

(assert (=> b!1021885 (=> res!684568 e!575324)))

(assert (=> b!1021885 (= res!684568 (= (h!22832 (t!30631 l!1367)) lt!450389))))

(declare-fun b!1021886 () Bool)

(assert (=> b!1021886 (= e!575324 (contains!5954 (t!30631 (t!30631 l!1367)) lt!450389))))

(assert (= (and d!122843 res!684567) b!1021885))

(assert (= (and b!1021885 (not res!684568)) b!1021886))

(declare-fun m!942123 () Bool)

(assert (=> d!122843 m!942123))

(declare-fun m!942125 () Bool)

(assert (=> d!122843 m!942125))

(declare-fun m!942127 () Bool)

(assert (=> b!1021886 m!942127))

(assert (=> b!1021825 d!122843))

(declare-fun d!122849 () Bool)

(declare-fun res!684579 () Bool)

(declare-fun e!575339 () Bool)

(assert (=> d!122849 (=> res!684579 e!575339)))

(assert (=> d!122849 (= res!684579 (or ((_ is Nil!21626) (t!30631 l!1367)) ((_ is Nil!21626) (t!30631 (t!30631 l!1367)))))))

(assert (=> d!122849 (= (isStrictlySorted!693 (t!30631 l!1367)) e!575339)))

(declare-fun b!1021905 () Bool)

(declare-fun e!575340 () Bool)

(assert (=> b!1021905 (= e!575339 e!575340)))

(declare-fun res!684580 () Bool)

(assert (=> b!1021905 (=> (not res!684580) (not e!575340))))

(assert (=> b!1021905 (= res!684580 (bvslt (_1!7738 (h!22832 (t!30631 l!1367))) (_1!7738 (h!22832 (t!30631 (t!30631 l!1367))))))))

(declare-fun b!1021906 () Bool)

(assert (=> b!1021906 (= e!575340 (isStrictlySorted!693 (t!30631 (t!30631 l!1367))))))

(assert (= (and d!122849 (not res!684579)) b!1021905))

(assert (= (and b!1021905 res!684580) b!1021906))

(declare-fun m!942131 () Bool)

(assert (=> b!1021906 m!942131))

(assert (=> b!1021829 d!122849))

(declare-fun d!122857 () Bool)

(declare-fun lt!450413 () Int)

(assert (=> d!122857 (>= lt!450413 0)))

(declare-fun e!575353 () Int)

(assert (=> d!122857 (= lt!450413 e!575353)))

(declare-fun c!103921 () Bool)

(assert (=> d!122857 (= c!103921 ((_ is Nil!21626) (t!30631 l!1367)))))

(assert (=> d!122857 (= (ListPrimitiveSize!142 (t!30631 l!1367)) lt!450413)))

(declare-fun b!1021921 () Bool)

(assert (=> b!1021921 (= e!575353 0)))

(declare-fun b!1021922 () Bool)

(assert (=> b!1021922 (= e!575353 (+ 1 (ListPrimitiveSize!142 (t!30631 (t!30631 l!1367)))))))

(assert (= (and d!122857 c!103921) b!1021921))

(assert (= (and d!122857 (not c!103921)) b!1021922))

(declare-fun m!942143 () Bool)

(assert (=> b!1021922 m!942143))

(assert (=> b!1021828 d!122857))

(declare-fun d!122865 () Bool)

(declare-fun lt!450415 () Int)

(assert (=> d!122865 (>= lt!450415 0)))

(declare-fun e!575356 () Int)

(assert (=> d!122865 (= lt!450415 e!575356)))

(declare-fun c!103922 () Bool)

(assert (=> d!122865 (= c!103922 ((_ is Nil!21626) l!1367))))

(assert (=> d!122865 (= (ListPrimitiveSize!142 l!1367) lt!450415)))

(declare-fun b!1021925 () Bool)

(assert (=> b!1021925 (= e!575356 0)))

(declare-fun b!1021926 () Bool)

(assert (=> b!1021926 (= e!575356 (+ 1 (ListPrimitiveSize!142 (t!30631 l!1367))))))

(assert (= (and d!122865 c!103922) b!1021925))

(assert (= (and d!122865 (not c!103922)) b!1021926))

(assert (=> b!1021926 m!942079))

(assert (=> b!1021828 d!122865))

(declare-fun d!122867 () Bool)

(declare-fun res!684593 () Bool)

(declare-fun e!575359 () Bool)

(assert (=> d!122867 (=> res!684593 e!575359)))

(assert (=> d!122867 (= res!684593 (or ((_ is Nil!21626) l!1367) ((_ is Nil!21626) (t!30631 l!1367))))))

(assert (=> d!122867 (= (isStrictlySorted!693 l!1367) e!575359)))

(declare-fun b!1021931 () Bool)

(declare-fun e!575360 () Bool)

(assert (=> b!1021931 (= e!575359 e!575360)))

(declare-fun res!684594 () Bool)

(assert (=> b!1021931 (=> (not res!684594) (not e!575360))))

(assert (=> b!1021931 (= res!684594 (bvslt (_1!7738 (h!22832 l!1367)) (_1!7738 (h!22832 (t!30631 l!1367)))))))

(declare-fun b!1021932 () Bool)

(assert (=> b!1021932 (= e!575360 (isStrictlySorted!693 (t!30631 l!1367)))))

(assert (= (and d!122867 (not res!684593)) b!1021931))

(assert (= (and b!1021931 res!684594) b!1021932))

(assert (=> b!1021932 m!942077))

(assert (=> start!89188 d!122867))

(declare-fun b!1021943 () Bool)

(declare-fun e!575367 () Bool)

(declare-fun tp!71283 () Bool)

(assert (=> b!1021943 (= e!575367 (and tp_is_empty!23803 tp!71283))))

(assert (=> b!1021830 (= tp!71272 e!575367)))

(assert (= (and b!1021830 ((_ is Cons!21625) (t!30631 l!1367))) b!1021943))

(check-sat (not d!122843) (not d!122837) (not b!1021926) (not b!1021880) (not b!1021922) (not b!1021906) tp_is_empty!23803 (not b!1021943) (not b!1021886) (not b!1021932))
(check-sat)
