; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61820 () Bool)

(assert start!61820)

(declare-fun b!691306 () Bool)

(declare-fun res!455589 () Bool)

(declare-fun e!393535 () Bool)

(assert (=> b!691306 (=> (not res!455589) (not e!393535))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13003 0))(
  ( (Nil!13000) (Cons!12999 (h!14047 (_ BitVec 64)) (t!19262 List!13003)) )
))
(declare-fun acc!681 () List!13003)

(declare-datatypes ((array!39779 0))(
  ( (array!39780 (arr!19055 (Array (_ BitVec 32) (_ BitVec 64))) (size!19438 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39779)

(declare-fun arrayNoDuplicates!0 (array!39779 (_ BitVec 32) List!13003) Bool)

(assert (=> b!691306 (= res!455589 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691307 () Bool)

(declare-fun e!393537 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3655 (List!13003 (_ BitVec 64)) Bool)

(assert (=> b!691307 (= e!393537 (not (contains!3655 acc!681 k!2843)))))

(declare-fun b!691308 () Bool)

(declare-fun res!455585 () Bool)

(assert (=> b!691308 (=> (not res!455585) (not e!393535))))

(declare-fun e!393534 () Bool)

(assert (=> b!691308 (= res!455585 e!393534)))

(declare-fun res!455580 () Bool)

(assert (=> b!691308 (=> res!455580 e!393534)))

(declare-fun e!393536 () Bool)

(assert (=> b!691308 (= res!455580 e!393536)))

(declare-fun res!455583 () Bool)

(assert (=> b!691308 (=> (not res!455583) (not e!393536))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691308 (= res!455583 (bvsgt from!3004 i!1382))))

(declare-fun b!691309 () Bool)

(declare-fun res!455588 () Bool)

(assert (=> b!691309 (=> (not res!455588) (not e!393535))))

(declare-fun arrayContainsKey!0 (array!39779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691309 (= res!455588 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691310 () Bool)

(declare-fun res!455577 () Bool)

(assert (=> b!691310 (=> (not res!455577) (not e!393535))))

(assert (=> b!691310 (= res!455577 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19438 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691311 () Bool)

(declare-fun res!455586 () Bool)

(assert (=> b!691311 (=> (not res!455586) (not e!393535))))

(assert (=> b!691311 (= res!455586 (= (select (arr!19055 a!3626) from!3004) k!2843))))

(declare-fun b!691312 () Bool)

(declare-fun res!455590 () Bool)

(assert (=> b!691312 (=> (not res!455590) (not e!393535))))

(assert (=> b!691312 (= res!455590 (not (contains!3655 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691313 () Bool)

(declare-fun res!455576 () Bool)

(assert (=> b!691313 (=> (not res!455576) (not e!393535))))

(assert (=> b!691313 (= res!455576 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13000))))

(declare-fun b!691314 () Bool)

(declare-fun res!455581 () Bool)

(assert (=> b!691314 (=> (not res!455581) (not e!393535))))

(declare-fun noDuplicate!929 (List!13003) Bool)

(assert (=> b!691314 (= res!455581 (noDuplicate!929 acc!681))))

(declare-fun b!691315 () Bool)

(declare-fun res!455575 () Bool)

(assert (=> b!691315 (=> (not res!455575) (not e!393535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691315 (= res!455575 (validKeyInArray!0 (select (arr!19055 a!3626) from!3004)))))

(declare-fun b!691316 () Bool)

(assert (=> b!691316 (= e!393535 (not true))))

(assert (=> b!691316 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun res!455582 () Bool)

(assert (=> start!61820 (=> (not res!455582) (not e!393535))))

(assert (=> start!61820 (= res!455582 (and (bvslt (size!19438 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19438 a!3626))))))

(assert (=> start!61820 e!393535))

(assert (=> start!61820 true))

(declare-fun array_inv!14914 (array!39779) Bool)

(assert (=> start!61820 (array_inv!14914 a!3626)))

(declare-fun b!691317 () Bool)

(declare-fun res!455578 () Bool)

(assert (=> b!691317 (=> (not res!455578) (not e!393535))))

(assert (=> b!691317 (= res!455578 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19438 a!3626))))))

(declare-fun b!691318 () Bool)

(declare-fun res!455579 () Bool)

(assert (=> b!691318 (=> (not res!455579) (not e!393535))))

(assert (=> b!691318 (= res!455579 (validKeyInArray!0 k!2843))))

(declare-fun b!691319 () Bool)

(assert (=> b!691319 (= e!393534 e!393537)))

(declare-fun res!455584 () Bool)

(assert (=> b!691319 (=> (not res!455584) (not e!393537))))

(assert (=> b!691319 (= res!455584 (bvsle from!3004 i!1382))))

(declare-fun b!691320 () Bool)

(declare-fun res!455587 () Bool)

(assert (=> b!691320 (=> (not res!455587) (not e!393535))))

(assert (=> b!691320 (= res!455587 (not (contains!3655 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691321 () Bool)

(assert (=> b!691321 (= e!393536 (contains!3655 acc!681 k!2843))))

(assert (= (and start!61820 res!455582) b!691314))

(assert (= (and b!691314 res!455581) b!691320))

(assert (= (and b!691320 res!455587) b!691312))

(assert (= (and b!691312 res!455590) b!691308))

(assert (= (and b!691308 res!455583) b!691321))

(assert (= (and b!691308 (not res!455580)) b!691319))

(assert (= (and b!691319 res!455584) b!691307))

(assert (= (and b!691308 res!455585) b!691313))

(assert (= (and b!691313 res!455576) b!691306))

(assert (= (and b!691306 res!455589) b!691317))

(assert (= (and b!691317 res!455578) b!691318))

(assert (= (and b!691318 res!455579) b!691309))

(assert (= (and b!691309 res!455588) b!691310))

(assert (= (and b!691310 res!455577) b!691315))

(assert (= (and b!691315 res!455575) b!691311))

(assert (= (and b!691311 res!455586) b!691316))

(declare-fun m!654979 () Bool)

(assert (=> b!691309 m!654979))

(declare-fun m!654981 () Bool)

(assert (=> b!691318 m!654981))

(declare-fun m!654983 () Bool)

(assert (=> b!691320 m!654983))

(declare-fun m!654985 () Bool)

(assert (=> b!691315 m!654985))

(assert (=> b!691315 m!654985))

(declare-fun m!654987 () Bool)

(assert (=> b!691315 m!654987))

(declare-fun m!654989 () Bool)

(assert (=> start!61820 m!654989))

(declare-fun m!654991 () Bool)

(assert (=> b!691321 m!654991))

(declare-fun m!654993 () Bool)

(assert (=> b!691306 m!654993))

(assert (=> b!691307 m!654991))

(assert (=> b!691311 m!654985))

(declare-fun m!654995 () Bool)

(assert (=> b!691312 m!654995))

(declare-fun m!654997 () Bool)

(assert (=> b!691313 m!654997))

(declare-fun m!654999 () Bool)

(assert (=> b!691314 m!654999))

(declare-fun m!655001 () Bool)

(assert (=> b!691316 m!655001))

(push 1)

(assert (not start!61820))

(assert (not b!691318))

(assert (not b!691312))

(assert (not b!691321))

(assert (not b!691309))

(assert (not b!691320))

(assert (not b!691307))

(assert (not b!691306))

(assert (not b!691314))

(assert (not b!691316))

(assert (not b!691313))

(assert (not b!691315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

