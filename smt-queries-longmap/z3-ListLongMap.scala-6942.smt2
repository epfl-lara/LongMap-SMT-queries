; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87652 () Bool)

(assert start!87652)

(declare-fun b!1014102 () Bool)

(assert (=> b!1014102 true))

(assert (=> b!1014102 true))

(declare-fun res!680654 () Bool)

(declare-fun e!570575 () Bool)

(assert (=> b!1014102 (=> (not res!680654) (not e!570575))))

(declare-datatypes ((List!21362 0))(
  ( (Nil!21359) (Cons!21358 (h!22565 (_ BitVec 64)) (t!30355 List!21362)) )
))
(declare-fun lt!448211 () List!21362)

(declare-fun lambda!406 () Int)

(declare-fun forall!219 (List!21362 Int) Bool)

(assert (=> b!1014102 (= res!680654 (forall!219 lt!448211 lambda!406))))

(declare-fun b!1014103 () Bool)

(assert (=> b!1014103 (= e!570575 (not (forall!219 lt!448211 lambda!406)))))

(declare-fun res!680657 () Bool)

(declare-fun e!570576 () Bool)

(assert (=> start!87652 (=> (not res!680657) (not e!570576))))

(declare-datatypes ((B!1358 0))(
  ( (B!1359 (val!11763 Int)) )
))
(declare-datatypes ((tuple2!15076 0))(
  ( (tuple2!15077 (_1!7549 (_ BitVec 64)) (_2!7549 B!1358)) )
))
(declare-datatypes ((List!21363 0))(
  ( (Nil!21360) (Cons!21359 (h!22566 tuple2!15076) (t!30356 List!21363)) )
))
(declare-fun l!412 () List!21363)

(declare-fun isStrictlySorted!531 (List!21363) Bool)

(assert (=> start!87652 (= res!680657 (isStrictlySorted!531 l!412))))

(assert (=> start!87652 e!570576))

(declare-fun e!570574 () Bool)

(assert (=> start!87652 e!570574))

(declare-fun tp_is_empty!23425 () Bool)

(assert (=> start!87652 tp_is_empty!23425))

(declare-fun b!1014104 () Bool)

(declare-fun res!680652 () Bool)

(assert (=> b!1014104 (=> (not res!680652) (not e!570576))))

(declare-fun value!115 () B!1358)

(get-info :version)

(assert (=> b!1014104 (= res!680652 (and (not (= (_2!7549 (h!22566 l!412)) value!115)) ((_ is Cons!21359) l!412)))))

(declare-fun b!1014105 () Bool)

(declare-fun res!680651 () Bool)

(assert (=> b!1014105 (=> (not res!680651) (not e!570575))))

(declare-fun head!924 (List!21363) tuple2!15076)

(assert (=> b!1014105 (= res!680651 (bvslt (_1!7549 (h!22566 l!412)) (_1!7549 (head!924 (t!30356 l!412)))))))

(declare-fun b!1014106 () Bool)

(declare-fun res!680655 () Bool)

(assert (=> b!1014106 (=> (not res!680655) (not e!570575))))

(declare-fun isEmpty!803 (List!21363) Bool)

(assert (=> b!1014106 (= res!680655 (not (isEmpty!803 (t!30356 l!412))))))

(declare-fun b!1014107 () Bool)

(assert (=> b!1014107 (= e!570576 e!570575)))

(declare-fun res!680653 () Bool)

(assert (=> b!1014107 (=> (not res!680653) (not e!570575))))

(declare-fun isEmpty!804 (List!21362) Bool)

(assert (=> b!1014107 (= res!680653 (not (isEmpty!804 lt!448211)))))

(declare-fun getKeysOf!25 (List!21363 B!1358) List!21362)

(assert (=> b!1014107 (= lt!448211 (getKeysOf!25 (t!30356 l!412) value!115))))

(declare-fun b!1014108 () Bool)

(declare-fun tp!70338 () Bool)

(assert (=> b!1014108 (= e!570574 (and tp_is_empty!23425 tp!70338))))

(declare-fun b!1014109 () Bool)

(declare-fun res!680656 () Bool)

(assert (=> b!1014109 (=> (not res!680656) (not e!570575))))

(assert (=> b!1014109 (= res!680656 (isStrictlySorted!531 (t!30356 l!412)))))

(assert (= (and start!87652 res!680657) b!1014104))

(assert (= (and b!1014104 res!680652) b!1014107))

(assert (= (and b!1014107 res!680653) b!1014109))

(assert (= (and b!1014109 res!680656) b!1014106))

(assert (= (and b!1014106 res!680655) b!1014102))

(assert (= (and b!1014102 res!680654) b!1014105))

(assert (= (and b!1014105 res!680651) b!1014103))

(assert (= (and start!87652 ((_ is Cons!21359) l!412)) b!1014108))

(declare-fun m!937787 () Bool)

(assert (=> b!1014103 m!937787))

(declare-fun m!937789 () Bool)

(assert (=> start!87652 m!937789))

(assert (=> b!1014102 m!937787))

(declare-fun m!937791 () Bool)

(assert (=> b!1014105 m!937791))

(declare-fun m!937793 () Bool)

(assert (=> b!1014107 m!937793))

(declare-fun m!937795 () Bool)

(assert (=> b!1014107 m!937795))

(declare-fun m!937797 () Bool)

(assert (=> b!1014106 m!937797))

(declare-fun m!937799 () Bool)

(assert (=> b!1014109 m!937799))

(check-sat (not b!1014106) tp_is_empty!23425 (not start!87652) (not b!1014109) (not b!1014105) (not b!1014102) (not b!1014103) (not b!1014107) (not b!1014108))
(check-sat)
