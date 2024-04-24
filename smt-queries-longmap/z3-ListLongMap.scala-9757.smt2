; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115846 () Bool)

(assert start!115846)

(declare-fun b!1368637 () Bool)

(declare-fun res!911389 () Bool)

(declare-fun e!775771 () Bool)

(assert (=> b!1368637 (=> (not res!911389) (not e!775771))))

(declare-datatypes ((List!31960 0))(
  ( (Nil!31957) (Cons!31956 (h!33174 (_ BitVec 64)) (t!46646 List!31960)) )
))
(declare-fun newAcc!98 () List!31960)

(declare-fun contains!9645 (List!31960 (_ BitVec 64)) Bool)

(assert (=> b!1368637 (= res!911389 (not (contains!9645 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368638 () Bool)

(declare-fun res!911390 () Bool)

(declare-fun e!775769 () Bool)

(assert (=> b!1368638 (=> (not res!911390) (not e!775769))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92968 0))(
  ( (array!92969 (arr!44905 (Array (_ BitVec 32) (_ BitVec 64))) (size!45456 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92968)

(assert (=> b!1368638 (= res!911390 (bvslt from!3239 (size!45456 a!3861)))))

(declare-fun res!911385 () Bool)

(assert (=> start!115846 (=> (not res!911385) (not e!775771))))

(assert (=> start!115846 (= res!911385 (and (bvslt (size!45456 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45456 a!3861))))))

(assert (=> start!115846 e!775771))

(declare-fun array_inv!34186 (array!92968) Bool)

(assert (=> start!115846 (array_inv!34186 a!3861)))

(assert (=> start!115846 true))

(declare-fun b!1368639 () Bool)

(declare-fun res!911383 () Bool)

(assert (=> b!1368639 (=> (not res!911383) (not e!775771))))

(declare-fun acc!866 () List!31960)

(assert (=> b!1368639 (= res!911383 (not (contains!9645 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368640 () Bool)

(declare-fun res!911382 () Bool)

(assert (=> b!1368640 (=> (not res!911382) (not e!775771))))

(declare-fun subseq!1004 (List!31960 List!31960) Bool)

(assert (=> b!1368640 (= res!911382 (subseq!1004 newAcc!98 acc!866))))

(declare-fun b!1368641 () Bool)

(declare-fun res!911386 () Bool)

(assert (=> b!1368641 (=> (not res!911386) (not e!775769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368641 (= res!911386 (validKeyInArray!0 (select (arr!44905 a!3861) from!3239)))))

(declare-fun b!1368642 () Bool)

(assert (=> b!1368642 (= e!775771 e!775769)))

(declare-fun res!911387 () Bool)

(assert (=> b!1368642 (=> (not res!911387) (not e!775769))))

(declare-fun arrayNoDuplicates!0 (array!92968 (_ BitVec 32) List!31960) Bool)

(assert (=> b!1368642 (= res!911387 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45080 0))(
  ( (Unit!45081) )
))
(declare-fun lt!602348 () Unit!45080)

(declare-fun noDuplicateSubseq!191 (List!31960 List!31960) Unit!45080)

(assert (=> b!1368642 (= lt!602348 (noDuplicateSubseq!191 newAcc!98 acc!866))))

(declare-fun b!1368643 () Bool)

(declare-fun res!911391 () Bool)

(assert (=> b!1368643 (=> (not res!911391) (not e!775771))))

(assert (=> b!1368643 (= res!911391 (not (contains!9645 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368644 () Bool)

(declare-fun res!911388 () Bool)

(assert (=> b!1368644 (=> (not res!911388) (not e!775771))))

(declare-fun noDuplicate!2476 (List!31960) Bool)

(assert (=> b!1368644 (= res!911388 (noDuplicate!2476 acc!866))))

(declare-fun b!1368645 () Bool)

(declare-fun res!911384 () Bool)

(assert (=> b!1368645 (=> (not res!911384) (not e!775771))))

(assert (=> b!1368645 (= res!911384 (not (contains!9645 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368646 () Bool)

(assert (=> b!1368646 (= e!775769 false)))

(declare-fun lt!602349 () Bool)

(assert (=> b!1368646 (= lt!602349 (contains!9645 acc!866 (select (arr!44905 a!3861) from!3239)))))

(assert (= (and start!115846 res!911385) b!1368644))

(assert (= (and b!1368644 res!911388) b!1368645))

(assert (= (and b!1368645 res!911384) b!1368639))

(assert (= (and b!1368639 res!911383) b!1368643))

(assert (= (and b!1368643 res!911391) b!1368637))

(assert (= (and b!1368637 res!911389) b!1368640))

(assert (= (and b!1368640 res!911382) b!1368642))

(assert (= (and b!1368642 res!911387) b!1368638))

(assert (= (and b!1368638 res!911390) b!1368641))

(assert (= (and b!1368641 res!911386) b!1368646))

(declare-fun m!1253179 () Bool)

(assert (=> b!1368642 m!1253179))

(declare-fun m!1253181 () Bool)

(assert (=> b!1368642 m!1253181))

(declare-fun m!1253183 () Bool)

(assert (=> b!1368639 m!1253183))

(declare-fun m!1253185 () Bool)

(assert (=> b!1368646 m!1253185))

(assert (=> b!1368646 m!1253185))

(declare-fun m!1253187 () Bool)

(assert (=> b!1368646 m!1253187))

(declare-fun m!1253189 () Bool)

(assert (=> b!1368645 m!1253189))

(declare-fun m!1253191 () Bool)

(assert (=> b!1368640 m!1253191))

(declare-fun m!1253193 () Bool)

(assert (=> b!1368644 m!1253193))

(assert (=> b!1368641 m!1253185))

(assert (=> b!1368641 m!1253185))

(declare-fun m!1253195 () Bool)

(assert (=> b!1368641 m!1253195))

(declare-fun m!1253197 () Bool)

(assert (=> start!115846 m!1253197))

(declare-fun m!1253199 () Bool)

(assert (=> b!1368637 m!1253199))

(declare-fun m!1253201 () Bool)

(assert (=> b!1368643 m!1253201))

(check-sat (not b!1368645) (not b!1368646) (not start!115846) (not b!1368643) (not b!1368641) (not b!1368640) (not b!1368644) (not b!1368637) (not b!1368642) (not b!1368639))
(check-sat)
