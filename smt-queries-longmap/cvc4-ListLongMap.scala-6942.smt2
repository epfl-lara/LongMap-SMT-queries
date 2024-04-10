; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87418 () Bool)

(assert start!87418)

(declare-fun b!1012828 () Bool)

(assert (=> b!1012828 true))

(assert (=> b!1012828 true))

(declare-fun b!1012824 () Bool)

(declare-fun res!680181 () Bool)

(declare-fun e!569736 () Bool)

(assert (=> b!1012824 (=> (not res!680181) (not e!569736))))

(declare-datatypes ((B!1362 0))(
  ( (B!1363 (val!11765 Int)) )
))
(declare-datatypes ((tuple2!15076 0))(
  ( (tuple2!15077 (_1!7549 (_ BitVec 64)) (_2!7549 B!1362)) )
))
(declare-datatypes ((List!21377 0))(
  ( (Nil!21374) (Cons!21373 (h!22571 tuple2!15076) (t!30378 List!21377)) )
))
(declare-fun l!412 () List!21377)

(declare-fun head!928 (List!21377) tuple2!15076)

(assert (=> b!1012824 (= res!680181 (bvslt (_1!7549 (h!22571 l!412)) (_1!7549 (head!928 (t!30378 l!412)))))))

(declare-fun b!1012825 () Bool)

(declare-datatypes ((List!21378 0))(
  ( (Nil!21375) (Cons!21374 (h!22572 (_ BitVec 64)) (t!30379 List!21378)) )
))
(declare-fun lt!447702 () List!21378)

(declare-fun lambda!416 () Int)

(declare-fun forall!220 (List!21378 Int) Bool)

(assert (=> b!1012825 (= e!569736 (not (forall!220 lt!447702 lambda!416)))))

(declare-fun b!1012826 () Bool)

(declare-fun e!569735 () Bool)

(assert (=> b!1012826 (= e!569735 e!569736)))

(declare-fun res!680177 () Bool)

(assert (=> b!1012826 (=> (not res!680177) (not e!569736))))

(declare-fun isEmpty!802 (List!21378) Bool)

(assert (=> b!1012826 (= res!680177 (not (isEmpty!802 lt!447702)))))

(declare-fun value!115 () B!1362)

(declare-fun getKeysOf!27 (List!21377 B!1362) List!21378)

(assert (=> b!1012826 (= lt!447702 (getKeysOf!27 (t!30378 l!412) value!115))))

(declare-fun b!1012827 () Bool)

(declare-fun res!680179 () Bool)

(assert (=> b!1012827 (=> (not res!680179) (not e!569736))))

(declare-fun isStrictlySorted!545 (List!21377) Bool)

(assert (=> b!1012827 (= res!680179 (isStrictlySorted!545 (t!30378 l!412)))))

(declare-fun res!680180 () Bool)

(assert (=> b!1012828 (=> (not res!680180) (not e!569736))))

(assert (=> b!1012828 (= res!680180 (forall!220 lt!447702 lambda!416))))

(declare-fun res!680175 () Bool)

(assert (=> start!87418 (=> (not res!680175) (not e!569735))))

(assert (=> start!87418 (= res!680175 (isStrictlySorted!545 l!412))))

(assert (=> start!87418 e!569735))

(declare-fun e!569737 () Bool)

(assert (=> start!87418 e!569737))

(declare-fun tp_is_empty!23429 () Bool)

(assert (=> start!87418 tp_is_empty!23429))

(declare-fun b!1012829 () Bool)

(declare-fun tp!70343 () Bool)

(assert (=> b!1012829 (= e!569737 (and tp_is_empty!23429 tp!70343))))

(declare-fun b!1012830 () Bool)

(declare-fun res!680176 () Bool)

(assert (=> b!1012830 (=> (not res!680176) (not e!569735))))

(assert (=> b!1012830 (= res!680176 (and (not (= (_2!7549 (h!22571 l!412)) value!115)) (is-Cons!21373 l!412)))))

(declare-fun b!1012831 () Bool)

(declare-fun res!680178 () Bool)

(assert (=> b!1012831 (=> (not res!680178) (not e!569736))))

(declare-fun isEmpty!803 (List!21377) Bool)

(assert (=> b!1012831 (= res!680178 (not (isEmpty!803 (t!30378 l!412))))))

(assert (= (and start!87418 res!680175) b!1012830))

(assert (= (and b!1012830 res!680176) b!1012826))

(assert (= (and b!1012826 res!680177) b!1012827))

(assert (= (and b!1012827 res!680179) b!1012831))

(assert (= (and b!1012831 res!680178) b!1012828))

(assert (= (and b!1012828 res!680180) b!1012824))

(assert (= (and b!1012824 res!680181) b!1012825))

(assert (= (and start!87418 (is-Cons!21373 l!412)) b!1012829))

(declare-fun m!936139 () Bool)

(assert (=> start!87418 m!936139))

(declare-fun m!936141 () Bool)

(assert (=> b!1012824 m!936141))

(declare-fun m!936143 () Bool)

(assert (=> b!1012831 m!936143))

(declare-fun m!936145 () Bool)

(assert (=> b!1012828 m!936145))

(declare-fun m!936147 () Bool)

(assert (=> b!1012826 m!936147))

(declare-fun m!936149 () Bool)

(assert (=> b!1012826 m!936149))

(declare-fun m!936151 () Bool)

(assert (=> b!1012827 m!936151))

(assert (=> b!1012825 m!936145))

(push 1)

(assert (not start!87418))

(assert tp_is_empty!23429)

(assert (not b!1012826))

(assert (not b!1012828))

