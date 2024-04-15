; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88934 () Bool)

(assert start!88934)

(declare-fun b!1020249 () Bool)

(declare-fun res!683851 () Bool)

(declare-fun e!574259 () Bool)

(assert (=> b!1020249 (=> (not res!683851) (not e!574259))))

(declare-datatypes ((B!1730 0))(
  ( (B!1731 (val!11949 Int)) )
))
(declare-datatypes ((tuple2!15524 0))(
  ( (tuple2!15525 (_1!7773 (_ BitVec 64)) (_2!7773 B!1730)) )
))
(declare-datatypes ((List!21672 0))(
  ( (Nil!21669) (Cons!21668 (h!22866 tuple2!15524) (t!30673 List!21672)) )
))
(declare-fun l!1367 () List!21672)

(declare-fun lt!449653 () tuple2!15524)

(get-info :version)

(assert (=> b!1020249 (= res!683851 (and ((_ is Cons!21668) l!1367) (not (= (h!22866 l!1367) lt!449653))))))

(declare-fun b!1020250 () Bool)

(declare-fun e!574260 () Bool)

(assert (=> b!1020250 (= e!574260 e!574259)))

(declare-fun res!683854 () Bool)

(assert (=> b!1020250 (=> (not res!683854) (not e!574259))))

(declare-fun contains!5904 (List!21672 tuple2!15524) Bool)

(assert (=> b!1020250 (= res!683854 (contains!5904 l!1367 lt!449653))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1730)

(assert (=> b!1020250 (= lt!449653 (tuple2!15525 key!393 value!188))))

(declare-fun b!1020251 () Bool)

(declare-fun e!574262 () Bool)

(assert (=> b!1020251 (= e!574262 (not (contains!5904 (t!30673 l!1367) lt!449653)))))

(declare-fun b!1020252 () Bool)

(declare-fun e!574261 () Bool)

(declare-fun tp_is_empty!23797 () Bool)

(declare-fun tp!71254 () Bool)

(assert (=> b!1020252 (= e!574261 (and tp_is_empty!23797 tp!71254))))

(declare-fun res!683853 () Bool)

(assert (=> start!88934 (=> (not res!683853) (not e!574260))))

(declare-fun isStrictlySorted!698 (List!21672) Bool)

(assert (=> start!88934 (= res!683853 (isStrictlySorted!698 l!1367))))

(assert (=> start!88934 e!574260))

(assert (=> start!88934 e!574261))

(assert (=> start!88934 true))

(assert (=> start!88934 tp_is_empty!23797))

(declare-fun b!1020253 () Bool)

(assert (=> b!1020253 (= e!574259 e!574262)))

(declare-fun res!683852 () Bool)

(assert (=> b!1020253 (=> res!683852 e!574262)))

(assert (=> b!1020253 (= res!683852 (not (isStrictlySorted!698 (t!30673 l!1367))))))

(assert (= (and start!88934 res!683853) b!1020250))

(assert (= (and b!1020250 res!683854) b!1020249))

(assert (= (and b!1020249 res!683851) b!1020253))

(assert (= (and b!1020253 (not res!683852)) b!1020251))

(assert (= (and start!88934 ((_ is Cons!21668) l!1367)) b!1020252))

(declare-fun m!939731 () Bool)

(assert (=> b!1020250 m!939731))

(declare-fun m!939733 () Bool)

(assert (=> b!1020251 m!939733))

(declare-fun m!939735 () Bool)

(assert (=> start!88934 m!939735))

(declare-fun m!939737 () Bool)

(assert (=> b!1020253 m!939737))

(check-sat (not b!1020253) (not b!1020251) (not b!1020250) tp_is_empty!23797 (not b!1020252) (not start!88934))
(check-sat)
(get-model)

(declare-fun d!122201 () Bool)

(declare-fun res!683891 () Bool)

(declare-fun e!574299 () Bool)

(assert (=> d!122201 (=> res!683891 e!574299)))

(assert (=> d!122201 (= res!683891 (or ((_ is Nil!21669) l!1367) ((_ is Nil!21669) (t!30673 l!1367))))))

(assert (=> d!122201 (= (isStrictlySorted!698 l!1367) e!574299)))

(declare-fun b!1020296 () Bool)

(declare-fun e!574300 () Bool)

(assert (=> b!1020296 (= e!574299 e!574300)))

(declare-fun res!683892 () Bool)

(assert (=> b!1020296 (=> (not res!683892) (not e!574300))))

(assert (=> b!1020296 (= res!683892 (bvslt (_1!7773 (h!22866 l!1367)) (_1!7773 (h!22866 (t!30673 l!1367)))))))

(declare-fun b!1020297 () Bool)

(assert (=> b!1020297 (= e!574300 (isStrictlySorted!698 (t!30673 l!1367)))))

(assert (= (and d!122201 (not res!683891)) b!1020296))

(assert (= (and b!1020296 res!683892) b!1020297))

(assert (=> b!1020297 m!939737))

(assert (=> start!88934 d!122201))

(declare-fun d!122205 () Bool)

(declare-fun res!683893 () Bool)

(declare-fun e!574301 () Bool)

(assert (=> d!122205 (=> res!683893 e!574301)))

(assert (=> d!122205 (= res!683893 (or ((_ is Nil!21669) (t!30673 l!1367)) ((_ is Nil!21669) (t!30673 (t!30673 l!1367)))))))

(assert (=> d!122205 (= (isStrictlySorted!698 (t!30673 l!1367)) e!574301)))

(declare-fun b!1020298 () Bool)

(declare-fun e!574302 () Bool)

(assert (=> b!1020298 (= e!574301 e!574302)))

(declare-fun res!683894 () Bool)

(assert (=> b!1020298 (=> (not res!683894) (not e!574302))))

(assert (=> b!1020298 (= res!683894 (bvslt (_1!7773 (h!22866 (t!30673 l!1367))) (_1!7773 (h!22866 (t!30673 (t!30673 l!1367))))))))

(declare-fun b!1020299 () Bool)

(assert (=> b!1020299 (= e!574302 (isStrictlySorted!698 (t!30673 (t!30673 l!1367))))))

(assert (= (and d!122205 (not res!683893)) b!1020298))

(assert (= (and b!1020298 res!683894) b!1020299))

(declare-fun m!939755 () Bool)

(assert (=> b!1020299 m!939755))

(assert (=> b!1020253 d!122205))

(declare-fun d!122207 () Bool)

(declare-fun lt!449669 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!498 (List!21672) (InoxSet tuple2!15524))

(assert (=> d!122207 (= lt!449669 (select (content!498 (t!30673 l!1367)) lt!449653))))

(declare-fun e!574324 () Bool)

(assert (=> d!122207 (= lt!449669 e!574324)))

(declare-fun res!683915 () Bool)

(assert (=> d!122207 (=> (not res!683915) (not e!574324))))

(assert (=> d!122207 (= res!683915 ((_ is Cons!21668) (t!30673 l!1367)))))

(assert (=> d!122207 (= (contains!5904 (t!30673 l!1367) lt!449653) lt!449669)))

(declare-fun b!1020320 () Bool)

(declare-fun e!574323 () Bool)

(assert (=> b!1020320 (= e!574324 e!574323)))

(declare-fun res!683916 () Bool)

(assert (=> b!1020320 (=> res!683916 e!574323)))

(assert (=> b!1020320 (= res!683916 (= (h!22866 (t!30673 l!1367)) lt!449653))))

(declare-fun b!1020321 () Bool)

(assert (=> b!1020321 (= e!574323 (contains!5904 (t!30673 (t!30673 l!1367)) lt!449653))))

(assert (= (and d!122207 res!683915) b!1020320))

(assert (= (and b!1020320 (not res!683916)) b!1020321))

(declare-fun m!939771 () Bool)

(assert (=> d!122207 m!939771))

(declare-fun m!939777 () Bool)

(assert (=> d!122207 m!939777))

(declare-fun m!939779 () Bool)

(assert (=> b!1020321 m!939779))

(assert (=> b!1020251 d!122207))

(declare-fun d!122219 () Bool)

(declare-fun lt!449670 () Bool)

(assert (=> d!122219 (= lt!449670 (select (content!498 l!1367) lt!449653))))

(declare-fun e!574332 () Bool)

(assert (=> d!122219 (= lt!449670 e!574332)))

(declare-fun res!683922 () Bool)

(assert (=> d!122219 (=> (not res!683922) (not e!574332))))

(assert (=> d!122219 (= res!683922 ((_ is Cons!21668) l!1367))))

(assert (=> d!122219 (= (contains!5904 l!1367 lt!449653) lt!449670)))

(declare-fun b!1020326 () Bool)

(declare-fun e!574330 () Bool)

(assert (=> b!1020326 (= e!574332 e!574330)))

(declare-fun res!683924 () Bool)

(assert (=> b!1020326 (=> res!683924 e!574330)))

(assert (=> b!1020326 (= res!683924 (= (h!22866 l!1367) lt!449653))))

(declare-fun b!1020328 () Bool)

(assert (=> b!1020328 (= e!574330 (contains!5904 (t!30673 l!1367) lt!449653))))

(assert (= (and d!122219 res!683922) b!1020326))

(assert (= (and b!1020326 (not res!683924)) b!1020328))

(declare-fun m!939781 () Bool)

(assert (=> d!122219 m!939781))

(declare-fun m!939785 () Bool)

(assert (=> d!122219 m!939785))

(assert (=> b!1020328 m!939733))

(assert (=> b!1020250 d!122219))

(declare-fun b!1020345 () Bool)

(declare-fun e!574342 () Bool)

(declare-fun tp!71268 () Bool)

(assert (=> b!1020345 (= e!574342 (and tp_is_empty!23797 tp!71268))))

(assert (=> b!1020252 (= tp!71254 e!574342)))

(assert (= (and b!1020252 ((_ is Cons!21668) (t!30673 l!1367))) b!1020345))

(check-sat tp_is_empty!23797 (not b!1020297) (not d!122207) (not b!1020321) (not b!1020345) (not d!122219) (not b!1020328) (not b!1020299))
(check-sat)
