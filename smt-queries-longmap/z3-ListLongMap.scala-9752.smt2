; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115534 () Bool)

(assert start!115534)

(declare-fun res!910206 () Bool)

(declare-fun e!774597 () Bool)

(assert (=> start!115534 (=> (not res!910206) (not e!774597))))

(declare-datatypes ((array!92769 0))(
  ( (array!92770 (arr!44812 (Array (_ BitVec 32) (_ BitVec 64))) (size!45364 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92769)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115534 (= res!910206 (and (bvslt (size!45364 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45364 a!3861))))))

(assert (=> start!115534 e!774597))

(declare-fun array_inv!34045 (array!92769) Bool)

(assert (=> start!115534 (array_inv!34045 a!3861)))

(assert (=> start!115534 true))

(declare-fun b!1366608 () Bool)

(declare-fun res!910211 () Bool)

(declare-fun e!774596 () Bool)

(assert (=> b!1366608 (=> (not res!910211) (not e!774596))))

(assert (=> b!1366608 (= res!910211 (bvslt from!3239 (size!45364 a!3861)))))

(declare-fun b!1366609 () Bool)

(declare-fun res!910203 () Bool)

(assert (=> b!1366609 (=> (not res!910203) (not e!774597))))

(declare-datatypes ((List!31958 0))(
  ( (Nil!31955) (Cons!31954 (h!33163 (_ BitVec 64)) (t!46644 List!31958)) )
))
(declare-fun newAcc!98 () List!31958)

(declare-fun contains!9551 (List!31958 (_ BitVec 64)) Bool)

(assert (=> b!1366609 (= res!910203 (not (contains!9551 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366610 () Bool)

(declare-fun res!910208 () Bool)

(assert (=> b!1366610 (=> (not res!910208) (not e!774597))))

(declare-fun acc!866 () List!31958)

(assert (=> b!1366610 (= res!910208 (not (contains!9551 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366611 () Bool)

(assert (=> b!1366611 (= e!774596 (not true))))

(declare-datatypes ((Unit!44952 0))(
  ( (Unit!44953) )
))
(declare-fun lt!601446 () Unit!44952)

(declare-fun lt!601444 () List!31958)

(declare-fun lt!601445 () List!31958)

(declare-fun noDuplicateSubseq!176 (List!31958 List!31958) Unit!44952)

(assert (=> b!1366611 (= lt!601446 (noDuplicateSubseq!176 lt!601444 lt!601445))))

(declare-fun arrayNoDuplicates!0 (array!92769 (_ BitVec 32) List!31958) Bool)

(assert (=> b!1366611 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601444)))

(declare-fun lt!601443 () Unit!44952)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92769 List!31958 List!31958 (_ BitVec 32)) Unit!44952)

(assert (=> b!1366611 (= lt!601443 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601445 lt!601444 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1366611 (= lt!601444 (Cons!31954 (select (arr!44812 a!3861) from!3239) newAcc!98))))

(assert (=> b!1366611 (= lt!601445 (Cons!31954 (select (arr!44812 a!3861) from!3239) acc!866))))

(declare-fun b!1366612 () Bool)

(declare-fun res!910201 () Bool)

(assert (=> b!1366612 (=> (not res!910201) (not e!774597))))

(declare-fun noDuplicate!2466 (List!31958) Bool)

(assert (=> b!1366612 (= res!910201 (noDuplicate!2466 acc!866))))

(declare-fun b!1366613 () Bool)

(assert (=> b!1366613 (= e!774597 e!774596)))

(declare-fun res!910207 () Bool)

(assert (=> b!1366613 (=> (not res!910207) (not e!774596))))

(assert (=> b!1366613 (= res!910207 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601442 () Unit!44952)

(assert (=> b!1366613 (= lt!601442 (noDuplicateSubseq!176 newAcc!98 acc!866))))

(declare-fun b!1366614 () Bool)

(declare-fun res!910202 () Bool)

(assert (=> b!1366614 (=> (not res!910202) (not e!774597))))

(declare-fun subseq!989 (List!31958 List!31958) Bool)

(assert (=> b!1366614 (= res!910202 (subseq!989 newAcc!98 acc!866))))

(declare-fun b!1366615 () Bool)

(declare-fun res!910204 () Bool)

(assert (=> b!1366615 (=> (not res!910204) (not e!774597))))

(assert (=> b!1366615 (= res!910204 (not (contains!9551 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366616 () Bool)

(declare-fun res!910205 () Bool)

(assert (=> b!1366616 (=> (not res!910205) (not e!774597))))

(assert (=> b!1366616 (= res!910205 (not (contains!9551 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366617 () Bool)

(declare-fun res!910209 () Bool)

(assert (=> b!1366617 (=> (not res!910209) (not e!774596))))

(assert (=> b!1366617 (= res!910209 (not (contains!9551 acc!866 (select (arr!44812 a!3861) from!3239))))))

(declare-fun b!1366618 () Bool)

(declare-fun res!910210 () Bool)

(assert (=> b!1366618 (=> (not res!910210) (not e!774596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1366618 (= res!910210 (validKeyInArray!0 (select (arr!44812 a!3861) from!3239)))))

(assert (= (and start!115534 res!910206) b!1366612))

(assert (= (and b!1366612 res!910201) b!1366610))

(assert (= (and b!1366610 res!910208) b!1366616))

(assert (= (and b!1366616 res!910205) b!1366615))

(assert (= (and b!1366615 res!910204) b!1366609))

(assert (= (and b!1366609 res!910203) b!1366614))

(assert (= (and b!1366614 res!910202) b!1366613))

(assert (= (and b!1366613 res!910207) b!1366608))

(assert (= (and b!1366608 res!910211) b!1366618))

(assert (= (and b!1366618 res!910210) b!1366617))

(assert (= (and b!1366617 res!910209) b!1366611))

(declare-fun m!1250439 () Bool)

(assert (=> b!1366615 m!1250439))

(declare-fun m!1250441 () Bool)

(assert (=> b!1366616 m!1250441))

(declare-fun m!1250443 () Bool)

(assert (=> b!1366618 m!1250443))

(assert (=> b!1366618 m!1250443))

(declare-fun m!1250445 () Bool)

(assert (=> b!1366618 m!1250445))

(assert (=> b!1366617 m!1250443))

(assert (=> b!1366617 m!1250443))

(declare-fun m!1250447 () Bool)

(assert (=> b!1366617 m!1250447))

(declare-fun m!1250449 () Bool)

(assert (=> b!1366612 m!1250449))

(declare-fun m!1250451 () Bool)

(assert (=> b!1366613 m!1250451))

(declare-fun m!1250453 () Bool)

(assert (=> b!1366613 m!1250453))

(declare-fun m!1250455 () Bool)

(assert (=> start!115534 m!1250455))

(declare-fun m!1250457 () Bool)

(assert (=> b!1366609 m!1250457))

(declare-fun m!1250459 () Bool)

(assert (=> b!1366611 m!1250459))

(declare-fun m!1250461 () Bool)

(assert (=> b!1366611 m!1250461))

(declare-fun m!1250463 () Bool)

(assert (=> b!1366611 m!1250463))

(assert (=> b!1366611 m!1250443))

(declare-fun m!1250465 () Bool)

(assert (=> b!1366614 m!1250465))

(declare-fun m!1250467 () Bool)

(assert (=> b!1366610 m!1250467))

(check-sat (not b!1366613) (not b!1366617) (not b!1366610) (not b!1366618) (not start!115534) (not b!1366614) (not b!1366615) (not b!1366609) (not b!1366616) (not b!1366612) (not b!1366611))
(check-sat)
