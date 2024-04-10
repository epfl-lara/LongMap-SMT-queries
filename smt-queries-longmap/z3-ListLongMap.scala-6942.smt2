; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87416 () Bool)

(assert start!87416)

(declare-fun b!1012803 () Bool)

(assert (=> b!1012803 true))

(assert (=> b!1012803 true))

(declare-fun b!1012796 () Bool)

(declare-fun e!569727 () Bool)

(declare-datatypes ((List!21375 0))(
  ( (Nil!21372) (Cons!21371 (h!22569 (_ BitVec 64)) (t!30376 List!21375)) )
))
(declare-fun lt!447699 () List!21375)

(declare-fun lambda!411 () Int)

(declare-fun forall!219 (List!21375 Int) Bool)

(assert (=> b!1012796 (= e!569727 (not (forall!219 lt!447699 lambda!411)))))

(declare-fun b!1012797 () Bool)

(declare-fun res!680159 () Bool)

(assert (=> b!1012797 (=> (not res!680159) (not e!569727))))

(declare-datatypes ((B!1360 0))(
  ( (B!1361 (val!11764 Int)) )
))
(declare-datatypes ((tuple2!15074 0))(
  ( (tuple2!15075 (_1!7548 (_ BitVec 64)) (_2!7548 B!1360)) )
))
(declare-datatypes ((List!21376 0))(
  ( (Nil!21373) (Cons!21372 (h!22570 tuple2!15074) (t!30377 List!21376)) )
))
(declare-fun l!412 () List!21376)

(declare-fun head!927 (List!21376) tuple2!15074)

(assert (=> b!1012797 (= res!680159 (bvslt (_1!7548 (h!22570 l!412)) (_1!7548 (head!927 (t!30377 l!412)))))))

(declare-fun b!1012798 () Bool)

(declare-fun res!680160 () Bool)

(declare-fun e!569728 () Bool)

(assert (=> b!1012798 (=> (not res!680160) (not e!569728))))

(declare-fun value!115 () B!1360)

(get-info :version)

(assert (=> b!1012798 (= res!680160 (and (not (= (_2!7548 (h!22570 l!412)) value!115)) ((_ is Cons!21372) l!412)))))

(declare-fun b!1012799 () Bool)

(declare-fun res!680157 () Bool)

(assert (=> b!1012799 (=> (not res!680157) (not e!569727))))

(declare-fun isEmpty!800 (List!21376) Bool)

(assert (=> b!1012799 (= res!680157 (not (isEmpty!800 (t!30377 l!412))))))

(declare-fun res!680154 () Bool)

(assert (=> start!87416 (=> (not res!680154) (not e!569728))))

(declare-fun isStrictlySorted!544 (List!21376) Bool)

(assert (=> start!87416 (= res!680154 (isStrictlySorted!544 l!412))))

(assert (=> start!87416 e!569728))

(declare-fun e!569726 () Bool)

(assert (=> start!87416 e!569726))

(declare-fun tp_is_empty!23427 () Bool)

(assert (=> start!87416 tp_is_empty!23427))

(declare-fun b!1012800 () Bool)

(declare-fun tp!70340 () Bool)

(assert (=> b!1012800 (= e!569726 (and tp_is_empty!23427 tp!70340))))

(declare-fun b!1012801 () Bool)

(assert (=> b!1012801 (= e!569728 e!569727)))

(declare-fun res!680155 () Bool)

(assert (=> b!1012801 (=> (not res!680155) (not e!569727))))

(declare-fun isEmpty!801 (List!21375) Bool)

(assert (=> b!1012801 (= res!680155 (not (isEmpty!801 lt!447699)))))

(declare-fun getKeysOf!26 (List!21376 B!1360) List!21375)

(assert (=> b!1012801 (= lt!447699 (getKeysOf!26 (t!30377 l!412) value!115))))

(declare-fun b!1012802 () Bool)

(declare-fun res!680158 () Bool)

(assert (=> b!1012802 (=> (not res!680158) (not e!569727))))

(assert (=> b!1012802 (= res!680158 (isStrictlySorted!544 (t!30377 l!412)))))

(declare-fun res!680156 () Bool)

(assert (=> b!1012803 (=> (not res!680156) (not e!569727))))

(assert (=> b!1012803 (= res!680156 (forall!219 lt!447699 lambda!411))))

(assert (= (and start!87416 res!680154) b!1012798))

(assert (= (and b!1012798 res!680160) b!1012801))

(assert (= (and b!1012801 res!680155) b!1012802))

(assert (= (and b!1012802 res!680158) b!1012799))

(assert (= (and b!1012799 res!680157) b!1012803))

(assert (= (and b!1012803 res!680156) b!1012797))

(assert (= (and b!1012797 res!680159) b!1012796))

(assert (= (and start!87416 ((_ is Cons!21372) l!412)) b!1012800))

(declare-fun m!936125 () Bool)

(assert (=> b!1012802 m!936125))

(declare-fun m!936127 () Bool)

(assert (=> start!87416 m!936127))

(declare-fun m!936129 () Bool)

(assert (=> b!1012799 m!936129))

(declare-fun m!936131 () Bool)

(assert (=> b!1012797 m!936131))

(declare-fun m!936133 () Bool)

(assert (=> b!1012803 m!936133))

(assert (=> b!1012796 m!936133))

(declare-fun m!936135 () Bool)

(assert (=> b!1012801 m!936135))

(declare-fun m!936137 () Bool)

(assert (=> b!1012801 m!936137))

(check-sat (not b!1012801) tp_is_empty!23427 (not b!1012800) (not b!1012799) (not b!1012796) (not b!1012802) (not start!87416) (not b!1012797) (not b!1012803))
(check-sat)
