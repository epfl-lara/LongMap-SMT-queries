; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87316 () Bool)

(assert start!87316)

(declare-fun b!1012077 () Bool)

(assert (=> b!1012077 true))

(assert (=> b!1012077 true))

(declare-fun res!679877 () Bool)

(declare-fun e!569334 () Bool)

(assert (=> b!1012077 (=> (not res!679877) (not e!569334))))

(declare-datatypes ((List!21344 0))(
  ( (Nil!21341) (Cons!21340 (h!22538 (_ BitVec 64)) (t!30345 List!21344)) )
))
(declare-fun lt!447297 () List!21344)

(declare-fun lambda!284 () Int)

(declare-fun forall!206 (List!21344 Int) Bool)

(assert (=> b!1012077 (= res!679877 (forall!206 lt!447297 lambda!284))))

(declare-fun b!1012078 () Bool)

(declare-fun res!679873 () Bool)

(declare-fun e!569335 () Bool)

(assert (=> b!1012078 (=> (not res!679873) (not e!569335))))

(declare-datatypes ((B!1326 0))(
  ( (B!1327 (val!11747 Int)) )
))
(declare-datatypes ((tuple2!15040 0))(
  ( (tuple2!15041 (_1!7531 (_ BitVec 64)) (_2!7531 B!1326)) )
))
(declare-datatypes ((List!21345 0))(
  ( (Nil!21342) (Cons!21341 (h!22539 tuple2!15040) (t!30346 List!21345)) )
))
(declare-fun l!412 () List!21345)

(declare-fun value!115 () B!1326)

(assert (=> b!1012078 (= res!679873 (and (is-Cons!21341 l!412) (= (_2!7531 (h!22539 l!412)) value!115)))))

(declare-fun b!1012079 () Bool)

(declare-fun res!679872 () Bool)

(assert (=> b!1012079 (=> (not res!679872) (not e!569334))))

(declare-fun head!922 (List!21345) tuple2!15040)

(assert (=> b!1012079 (= res!679872 (bvslt (_1!7531 (h!22539 l!412)) (_1!7531 (head!922 (t!30346 l!412)))))))

(declare-fun b!1012080 () Bool)

(declare-fun res!679878 () Bool)

(assert (=> b!1012080 (=> (not res!679878) (not e!569334))))

(declare-fun isEmpty!781 (List!21345) Bool)

(assert (=> b!1012080 (= res!679878 (not (isEmpty!781 (t!30346 l!412))))))

(declare-fun res!679874 () Bool)

(assert (=> start!87316 (=> (not res!679874) (not e!569335))))

(declare-fun isStrictlySorted!527 (List!21345) Bool)

(assert (=> start!87316 (= res!679874 (isStrictlySorted!527 l!412))))

(assert (=> start!87316 e!569335))

(declare-fun e!569333 () Bool)

(assert (=> start!87316 e!569333))

(declare-fun tp_is_empty!23393 () Bool)

(assert (=> start!87316 tp_is_empty!23393))

(declare-fun b!1012081 () Bool)

(assert (=> b!1012081 (= e!569335 e!569334)))

(declare-fun res!679876 () Bool)

(assert (=> b!1012081 (=> (not res!679876) (not e!569334))))

(declare-fun isEmpty!782 (List!21344) Bool)

(assert (=> b!1012081 (= res!679876 (not (isEmpty!782 lt!447297)))))

(declare-fun getKeysOf!12 (List!21345 B!1326) List!21344)

(assert (=> b!1012081 (= lt!447297 (getKeysOf!12 (t!30346 l!412) value!115))))

(declare-fun b!1012082 () Bool)

(assert (=> b!1012082 (= e!569334 (not (forall!206 lt!447297 lambda!284)))))

(declare-fun b!1012083 () Bool)

(declare-fun res!679875 () Bool)

(assert (=> b!1012083 (=> (not res!679875) (not e!569334))))

(assert (=> b!1012083 (= res!679875 (isStrictlySorted!527 (t!30346 l!412)))))

(declare-fun b!1012084 () Bool)

(declare-fun tp!70253 () Bool)

(assert (=> b!1012084 (= e!569333 (and tp_is_empty!23393 tp!70253))))

(assert (= (and start!87316 res!679874) b!1012078))

(assert (= (and b!1012078 res!679873) b!1012081))

(assert (= (and b!1012081 res!679876) b!1012083))

(assert (= (and b!1012083 res!679875) b!1012080))

(assert (= (and b!1012080 res!679878) b!1012077))

(assert (= (and b!1012077 res!679877) b!1012079))

(assert (= (and b!1012079 res!679872) b!1012082))

(assert (= (and start!87316 (is-Cons!21341 l!412)) b!1012084))

(declare-fun m!935825 () Bool)

(assert (=> b!1012082 m!935825))

(declare-fun m!935827 () Bool)

(assert (=> start!87316 m!935827))

(declare-fun m!935829 () Bool)

(assert (=> b!1012083 m!935829))

(declare-fun m!935831 () Bool)

(assert (=> b!1012081 m!935831))

(declare-fun m!935833 () Bool)

(assert (=> b!1012081 m!935833))

(declare-fun m!935835 () Bool)

(assert (=> b!1012079 m!935835))

(declare-fun m!935837 () Bool)

(assert (=> b!1012080 m!935837))

(assert (=> b!1012077 m!935825))

(push 1)

