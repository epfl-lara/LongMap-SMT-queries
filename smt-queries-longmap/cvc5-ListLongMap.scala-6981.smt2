; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88450 () Bool)

(assert start!88450)

(declare-fun b!1017610 () Bool)

(declare-fun e!572525 () Bool)

(declare-fun e!572526 () Bool)

(assert (=> b!1017610 (= e!572525 e!572526)))

(declare-fun res!682484 () Bool)

(assert (=> b!1017610 (=> res!682484 e!572526)))

(declare-datatypes ((B!1592 0))(
  ( (B!1593 (val!11880 Int)) )
))
(declare-datatypes ((tuple2!15306 0))(
  ( (tuple2!15307 (_1!7664 (_ BitVec 64)) (_2!7664 B!1592)) )
))
(declare-datatypes ((List!21568 0))(
  ( (Nil!21565) (Cons!21564 (h!22762 tuple2!15306) (t!30569 List!21568)) )
))
(declare-fun l!1036 () List!21568)

(declare-fun isStrictlySorted!639 (List!21568) Bool)

(assert (=> b!1017610 (= res!682484 (not (isStrictlySorted!639 (t!30569 l!1036))))))

(declare-fun b!1017611 () Bool)

(declare-fun res!682487 () Bool)

(assert (=> b!1017611 (=> (not res!682487) (not e!572525))))

(declare-fun key!271 () (_ BitVec 64))

(assert (=> b!1017611 (= res!682487 (and (is-Cons!21564 l!1036) (not (= (_1!7664 (h!22762 l!1036)) key!271))))))

(declare-fun b!1017612 () Bool)

(declare-fun res!682486 () Bool)

(assert (=> b!1017612 (=> (not res!682486) (not e!572525))))

(declare-datatypes ((Option!623 0))(
  ( (Some!622 (v!14473 B!1592)) (None!621) )
))
(declare-fun isDefined!419 (Option!623) Bool)

(declare-fun getValueByKey!572 (List!21568 (_ BitVec 64)) Option!623)

(assert (=> b!1017612 (= res!682486 (isDefined!419 (getValueByKey!572 l!1036 key!271)))))

(declare-fun b!1017613 () Bool)

(assert (=> b!1017613 (= e!572526 (not (isDefined!419 (getValueByKey!572 (t!30569 l!1036) key!271))))))

(declare-fun res!682485 () Bool)

(assert (=> start!88450 (=> (not res!682485) (not e!572525))))

(assert (=> start!88450 (= res!682485 (isStrictlySorted!639 l!1036))))

(assert (=> start!88450 e!572525))

(declare-fun e!572524 () Bool)

(assert (=> start!88450 e!572524))

(assert (=> start!88450 true))

(declare-fun b!1017614 () Bool)

(declare-fun tp_is_empty!23659 () Bool)

(declare-fun tp!70918 () Bool)

(assert (=> b!1017614 (= e!572524 (and tp_is_empty!23659 tp!70918))))

(assert (= (and start!88450 res!682485) b!1017612))

(assert (= (and b!1017612 res!682486) b!1017611))

(assert (= (and b!1017611 res!682487) b!1017610))

(assert (= (and b!1017610 (not res!682484)) b!1017613))

(assert (= (and start!88450 (is-Cons!21564 l!1036)) b!1017614))

(declare-fun m!938881 () Bool)

(assert (=> b!1017610 m!938881))

(declare-fun m!938883 () Bool)

(assert (=> b!1017612 m!938883))

(assert (=> b!1017612 m!938883))

(declare-fun m!938885 () Bool)

(assert (=> b!1017612 m!938885))

(declare-fun m!938887 () Bool)

(assert (=> b!1017613 m!938887))

(assert (=> b!1017613 m!938887))

(declare-fun m!938889 () Bool)

(assert (=> b!1017613 m!938889))

(declare-fun m!938891 () Bool)

(assert (=> start!88450 m!938891))

(push 1)

(assert (not start!88450))

(assert (not b!1017612))

(assert (not b!1017610))

(assert tp_is_empty!23659)

(assert (not b!1017614))

(assert (not b!1017613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121657 () Bool)

(declare-fun res!682530 () Bool)

(declare-fun e!572571 () Bool)

(assert (=> d!121657 (=> res!682530 e!572571)))

(assert (=> d!121657 (= res!682530 (or (is-Nil!21565 (t!30569 l!1036)) (is-Nil!21565 (t!30569 (t!30569 l!1036)))))))

(assert (=> d!121657 (= (isStrictlySorted!639 (t!30569 l!1036)) e!572571)))

(declare-fun b!1017679 () Bool)

(declare-fun e!572572 () Bool)

(assert (=> b!1017679 (= e!572571 e!572572)))

(declare-fun res!682531 () Bool)

(assert (=> b!1017679 (=> (not res!682531) (not e!572572))))

(assert (=> b!1017679 (= res!682531 (bvslt (_1!7664 (h!22762 (t!30569 l!1036))) (_1!7664 (h!22762 (t!30569 (t!30569 l!1036))))))))

(declare-fun b!1017680 () Bool)

(assert (=> b!1017680 (= e!572572 (isStrictlySorted!639 (t!30569 (t!30569 l!1036))))))

(assert (= (and d!121657 (not res!682530)) b!1017679))

(assert (= (and b!1017679 res!682531) b!1017680))

(declare-fun m!938923 () Bool)

(assert (=> b!1017680 m!938923))

(assert (=> b!1017610 d!121657))

(declare-fun d!121665 () Bool)

(declare-fun res!682532 () Bool)

(declare-fun e!572573 () Bool)

(assert (=> d!121665 (=> res!682532 e!572573)))

(assert (=> d!121665 (= res!682532 (or (is-Nil!21565 l!1036) (is-Nil!21565 (t!30569 l!1036))))))

(assert (=> d!121665 (= (isStrictlySorted!639 l!1036) e!572573)))

(declare-fun b!1017681 () Bool)

(declare-fun e!572574 () Bool)

(assert (=> b!1017681 (= e!572573 e!572574)))

(declare-fun res!682533 () Bool)

(assert (=> b!1017681 (=> (not res!682533) (not e!572574))))

(assert (=> b!1017681 (= res!682533 (bvslt (_1!7664 (h!22762 l!1036)) (_1!7664 (h!22762 (t!30569 l!1036)))))))

(declare-fun b!1017682 () Bool)

(assert (=> b!1017682 (= e!572574 (isStrictlySorted!639 (t!30569 l!1036)))))

(assert (= (and d!121665 (not res!682532)) b!1017681))

(assert (= (and b!1017681 res!682533) b!1017682))

(assert (=> b!1017682 m!938881))

(assert (=> start!88450 d!121665))

(declare-fun d!121667 () Bool)

(declare-fun isEmpty!912 (Option!623) Bool)

(assert (=> d!121667 (= (isDefined!419 (getValueByKey!572 l!1036 key!271)) (not (isEmpty!912 (getValueByKey!572 l!1036 key!271))))))

(declare-fun bs!29619 () Bool)

(assert (= bs!29619 d!121667))

(assert (=> bs!29619 m!938883))

(declare-fun m!938925 () Bool)

(assert (=> bs!29619 m!938925))

(assert (=> b!1017612 d!121667))

(declare-fun b!1017719 () Bool)

(declare-fun e!572595 () Option!623)

(assert (=> b!1017719 (= e!572595 (Some!622 (_2!7664 (h!22762 l!1036))))))

(declare-fun b!1017721 () Bool)

(declare-fun e!572596 () Option!623)

(assert (=> b!1017721 (= e!572596 (getValueByKey!572 (t!30569 l!1036) key!271))))

(declare-fun b!1017720 () Bool)

(assert (=> b!1017720 (= e!572595 e!572596)))

(declare-fun c!103055 () Bool)

(assert (=> b!1017720 (= c!103055 (and (is-Cons!21564 l!1036) (not (= (_1!7664 (h!22762 l!1036)) key!271))))))

(declare-fun d!121669 () Bool)

(declare-fun c!103054 () Bool)

(assert (=> d!121669 (= c!103054 (and (is-Cons!21564 l!1036) (= (_1!7664 (h!22762 l!1036)) key!271)))))

(assert (=> d!121669 (= (getValueByKey!572 l!1036 key!271) e!572595)))

(declare-fun b!1017722 () Bool)

(assert (=> b!1017722 (= e!572596 None!621)))

(assert (= (and d!121669 c!103054) b!1017719))

(assert (= (and d!121669 (not c!103054)) b!1017720))

(assert (= (and b!1017720 c!103055) b!1017721))

(assert (= (and b!1017720 (not c!103055)) b!1017722))

(assert (=> b!1017721 m!938887))

(assert (=> b!1017612 d!121669))

(declare-fun d!121681 () Bool)

(assert (=> d!121681 (= (isDefined!419 (getValueByKey!572 (t!30569 l!1036) key!271)) (not (isEmpty!912 (getValueByKey!572 (t!30569 l!1036) key!271))))))

(declare-fun bs!29622 () Bool)

(assert (= bs!29622 d!121681))

(assert (=> bs!29622 m!938887))

(declare-fun m!938937 () Bool)

(assert (=> bs!29622 m!938937))

(assert (=> b!1017613 d!121681))

(declare-fun b!1017723 () Bool)

(declare-fun e!572597 () Option!623)

(assert (=> b!1017723 (= e!572597 (Some!622 (_2!7664 (h!22762 (t!30569 l!1036)))))))

(declare-fun b!1017725 () Bool)

(declare-fun e!572598 () Option!623)

(assert (=> b!1017725 (= e!572598 (getValueByKey!572 (t!30569 (t!30569 l!1036)) key!271))))

(declare-fun b!1017724 () Bool)

(assert (=> b!1017724 (= e!572597 e!572598)))

(declare-fun c!103057 () Bool)

(assert (=> b!1017724 (= c!103057 (and (is-Cons!21564 (t!30569 l!1036)) (not (= (_1!7664 (h!22762 (t!30569 l!1036))) key!271))))))

(declare-fun d!121683 () Bool)

(declare-fun c!103056 () Bool)

(assert (=> d!121683 (= c!103056 (and (is-Cons!21564 (t!30569 l!1036)) (= (_1!7664 (h!22762 (t!30569 l!1036))) key!271)))))

(assert (=> d!121683 (= (getValueByKey!572 (t!30569 l!1036) key!271) e!572597)))

(declare-fun b!1017726 () Bool)

(assert (=> b!1017726 (= e!572598 None!621)))

(assert (= (and d!121683 c!103056) b!1017723))

(assert (= (and d!121683 (not c!103056)) b!1017724))

(assert (= (and b!1017724 c!103057) b!1017725))

