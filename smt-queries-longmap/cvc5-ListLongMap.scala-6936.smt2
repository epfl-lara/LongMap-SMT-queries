; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87312 () Bool)

(assert start!87312)

(declare-fun b!1012028 () Bool)

(assert (=> b!1012028 true))

(assert (=> b!1012028 true))

(declare-fun b!1012021 () Bool)

(declare-fun e!569316 () Bool)

(declare-fun e!569315 () Bool)

(assert (=> b!1012021 (= e!569316 e!569315)))

(declare-fun res!679835 () Bool)

(assert (=> b!1012021 (=> (not res!679835) (not e!569315))))

(declare-datatypes ((List!21340 0))(
  ( (Nil!21337) (Cons!21336 (h!22534 (_ BitVec 64)) (t!30341 List!21340)) )
))
(declare-fun lt!447291 () List!21340)

(declare-fun isEmpty!777 (List!21340) Bool)

(assert (=> b!1012021 (= res!679835 (not (isEmpty!777 lt!447291)))))

(declare-datatypes ((B!1322 0))(
  ( (B!1323 (val!11745 Int)) )
))
(declare-datatypes ((tuple2!15036 0))(
  ( (tuple2!15037 (_1!7529 (_ BitVec 64)) (_2!7529 B!1322)) )
))
(declare-datatypes ((List!21341 0))(
  ( (Nil!21338) (Cons!21337 (h!22535 tuple2!15036) (t!30342 List!21341)) )
))
(declare-fun l!412 () List!21341)

(declare-fun value!115 () B!1322)

(declare-fun getKeysOf!10 (List!21341 B!1322) List!21340)

(assert (=> b!1012021 (= lt!447291 (getKeysOf!10 (t!30342 l!412) value!115))))

(declare-fun b!1012022 () Bool)

(declare-fun res!679831 () Bool)

(assert (=> b!1012022 (=> (not res!679831) (not e!569315))))

(declare-fun head!920 (List!21341) tuple2!15036)

(assert (=> b!1012022 (= res!679831 (bvslt (_1!7529 (h!22535 l!412)) (_1!7529 (head!920 (t!30342 l!412)))))))

(declare-fun res!679832 () Bool)

(assert (=> start!87312 (=> (not res!679832) (not e!569316))))

(declare-fun isStrictlySorted!525 (List!21341) Bool)

(assert (=> start!87312 (= res!679832 (isStrictlySorted!525 l!412))))

(assert (=> start!87312 e!569316))

(declare-fun e!569317 () Bool)

(assert (=> start!87312 e!569317))

(declare-fun tp_is_empty!23389 () Bool)

(assert (=> start!87312 tp_is_empty!23389))

(declare-fun b!1012023 () Bool)

(declare-fun res!679833 () Bool)

(assert (=> b!1012023 (=> (not res!679833) (not e!569315))))

(declare-fun isEmpty!778 (List!21341) Bool)

(assert (=> b!1012023 (= res!679833 (not (isEmpty!778 (t!30342 l!412))))))

(declare-fun b!1012024 () Bool)

(declare-fun tp!70247 () Bool)

(assert (=> b!1012024 (= e!569317 (and tp_is_empty!23389 tp!70247))))

(declare-fun b!1012025 () Bool)

(declare-fun res!679836 () Bool)

(assert (=> b!1012025 (=> (not res!679836) (not e!569315))))

(assert (=> b!1012025 (= res!679836 (isStrictlySorted!525 (t!30342 l!412)))))

(declare-fun b!1012026 () Bool)

(declare-fun lambda!274 () Int)

(declare-fun forall!204 (List!21340 Int) Bool)

(assert (=> b!1012026 (= e!569315 (not (forall!204 lt!447291 lambda!274)))))

(declare-fun b!1012027 () Bool)

(declare-fun res!679834 () Bool)

(assert (=> b!1012027 (=> (not res!679834) (not e!569316))))

(assert (=> b!1012027 (= res!679834 (and (is-Cons!21337 l!412) (= (_2!7529 (h!22535 l!412)) value!115)))))

(declare-fun res!679830 () Bool)

(assert (=> b!1012028 (=> (not res!679830) (not e!569315))))

(assert (=> b!1012028 (= res!679830 (forall!204 lt!447291 lambda!274))))

(assert (= (and start!87312 res!679832) b!1012027))

(assert (= (and b!1012027 res!679834) b!1012021))

(assert (= (and b!1012021 res!679835) b!1012025))

(assert (= (and b!1012025 res!679836) b!1012023))

(assert (= (and b!1012023 res!679833) b!1012028))

(assert (= (and b!1012028 res!679830) b!1012022))

(assert (= (and b!1012022 res!679831) b!1012026))

(assert (= (and start!87312 (is-Cons!21337 l!412)) b!1012024))

(declare-fun m!935797 () Bool)

(assert (=> b!1012026 m!935797))

(declare-fun m!935799 () Bool)

(assert (=> b!1012023 m!935799))

(declare-fun m!935801 () Bool)

(assert (=> b!1012022 m!935801))

(declare-fun m!935803 () Bool)

(assert (=> b!1012021 m!935803))

(declare-fun m!935805 () Bool)

(assert (=> b!1012021 m!935805))

(assert (=> b!1012028 m!935797))

(declare-fun m!935807 () Bool)

(assert (=> start!87312 m!935807))

(declare-fun m!935809 () Bool)

(assert (=> b!1012025 m!935809))

(push 1)

