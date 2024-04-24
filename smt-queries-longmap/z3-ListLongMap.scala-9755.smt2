; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115834 () Bool)

(assert start!115834)

(declare-fun b!1368450 () Bool)

(declare-fun res!911200 () Bool)

(declare-fun e!775717 () Bool)

(assert (=> b!1368450 (=> (not res!911200) (not e!775717))))

(declare-datatypes ((List!31954 0))(
  ( (Nil!31951) (Cons!31950 (h!33168 (_ BitVec 64)) (t!46640 List!31954)) )
))
(declare-fun newAcc!98 () List!31954)

(declare-fun acc!866 () List!31954)

(declare-fun subseq!998 (List!31954 List!31954) Bool)

(assert (=> b!1368450 (= res!911200 (subseq!998 newAcc!98 acc!866))))

(declare-fun b!1368451 () Bool)

(declare-fun res!911199 () Bool)

(assert (=> b!1368451 (=> (not res!911199) (not e!775717))))

(declare-fun contains!9639 (List!31954 (_ BitVec 64)) Bool)

(assert (=> b!1368451 (= res!911199 (not (contains!9639 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368453 () Bool)

(declare-fun e!775715 () Bool)

(assert (=> b!1368453 (= e!775715 (not true))))

(declare-fun lt!602286 () Bool)

(declare-fun noDuplicate!2470 (List!31954) Bool)

(assert (=> b!1368453 (= lt!602286 (noDuplicate!2470 newAcc!98))))

(declare-datatypes ((Unit!45068 0))(
  ( (Unit!45069) )
))
(declare-fun lt!602287 () Unit!45068)

(declare-fun lt!602284 () List!31954)

(declare-fun lt!602289 () List!31954)

(declare-fun noDuplicateSubseq!185 (List!31954 List!31954) Unit!45068)

(assert (=> b!1368453 (= lt!602287 (noDuplicateSubseq!185 lt!602284 lt!602289))))

(declare-datatypes ((array!92956 0))(
  ( (array!92957 (arr!44899 (Array (_ BitVec 32) (_ BitVec 64))) (size!45450 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92956)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92956 (_ BitVec 32) List!31954) Bool)

(assert (=> b!1368453 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602284)))

(declare-fun lt!602285 () Unit!45068)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92956 List!31954 List!31954 (_ BitVec 32)) Unit!45068)

(assert (=> b!1368453 (= lt!602285 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602289 lt!602284 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1368453 (= lt!602284 (Cons!31950 (select (arr!44899 a!3861) from!3239) newAcc!98))))

(assert (=> b!1368453 (= lt!602289 (Cons!31950 (select (arr!44899 a!3861) from!3239) acc!866))))

(declare-fun b!1368454 () Bool)

(declare-fun res!911201 () Bool)

(assert (=> b!1368454 (=> (not res!911201) (not e!775715))))

(assert (=> b!1368454 (= res!911201 (not (contains!9639 acc!866 (select (arr!44899 a!3861) from!3239))))))

(declare-fun b!1368455 () Bool)

(declare-fun res!911202 () Bool)

(assert (=> b!1368455 (=> (not res!911202) (not e!775717))))

(assert (=> b!1368455 (= res!911202 (not (contains!9639 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368456 () Bool)

(declare-fun res!911205 () Bool)

(assert (=> b!1368456 (=> (not res!911205) (not e!775717))))

(assert (=> b!1368456 (= res!911205 (not (contains!9639 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368457 () Bool)

(declare-fun res!911197 () Bool)

(assert (=> b!1368457 (=> (not res!911197) (not e!775715))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368457 (= res!911197 (validKeyInArray!0 (select (arr!44899 a!3861) from!3239)))))

(declare-fun b!1368458 () Bool)

(declare-fun res!911195 () Bool)

(assert (=> b!1368458 (=> (not res!911195) (not e!775717))))

(assert (=> b!1368458 (= res!911195 (not (contains!9639 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368459 () Bool)

(declare-fun res!911203 () Bool)

(assert (=> b!1368459 (=> (not res!911203) (not e!775717))))

(assert (=> b!1368459 (= res!911203 (noDuplicate!2470 acc!866))))

(declare-fun b!1368460 () Bool)

(declare-fun res!911196 () Bool)

(assert (=> b!1368460 (=> (not res!911196) (not e!775715))))

(assert (=> b!1368460 (= res!911196 (bvslt from!3239 (size!45450 a!3861)))))

(declare-fun res!911204 () Bool)

(assert (=> start!115834 (=> (not res!911204) (not e!775717))))

(assert (=> start!115834 (= res!911204 (and (bvslt (size!45450 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45450 a!3861))))))

(assert (=> start!115834 e!775717))

(declare-fun array_inv!34180 (array!92956) Bool)

(assert (=> start!115834 (array_inv!34180 a!3861)))

(assert (=> start!115834 true))

(declare-fun b!1368452 () Bool)

(assert (=> b!1368452 (= e!775717 e!775715)))

(declare-fun res!911198 () Bool)

(assert (=> b!1368452 (=> (not res!911198) (not e!775715))))

(assert (=> b!1368452 (= res!911198 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602288 () Unit!45068)

(assert (=> b!1368452 (= lt!602288 (noDuplicateSubseq!185 newAcc!98 acc!866))))

(assert (= (and start!115834 res!911204) b!1368459))

(assert (= (and b!1368459 res!911203) b!1368456))

(assert (= (and b!1368456 res!911205) b!1368458))

(assert (= (and b!1368458 res!911195) b!1368451))

(assert (= (and b!1368451 res!911199) b!1368455))

(assert (= (and b!1368455 res!911202) b!1368450))

(assert (= (and b!1368450 res!911200) b!1368452))

(assert (= (and b!1368452 res!911198) b!1368460))

(assert (= (and b!1368460 res!911196) b!1368457))

(assert (= (and b!1368457 res!911197) b!1368454))

(assert (= (and b!1368454 res!911201) b!1368453))

(declare-fun m!1253011 () Bool)

(assert (=> b!1368455 m!1253011))

(declare-fun m!1253013 () Bool)

(assert (=> b!1368452 m!1253013))

(declare-fun m!1253015 () Bool)

(assert (=> b!1368452 m!1253015))

(declare-fun m!1253017 () Bool)

(assert (=> b!1368456 m!1253017))

(declare-fun m!1253019 () Bool)

(assert (=> b!1368450 m!1253019))

(declare-fun m!1253021 () Bool)

(assert (=> b!1368458 m!1253021))

(declare-fun m!1253023 () Bool)

(assert (=> start!115834 m!1253023))

(declare-fun m!1253025 () Bool)

(assert (=> b!1368459 m!1253025))

(declare-fun m!1253027 () Bool)

(assert (=> b!1368451 m!1253027))

(declare-fun m!1253029 () Bool)

(assert (=> b!1368454 m!1253029))

(assert (=> b!1368454 m!1253029))

(declare-fun m!1253031 () Bool)

(assert (=> b!1368454 m!1253031))

(declare-fun m!1253033 () Bool)

(assert (=> b!1368453 m!1253033))

(declare-fun m!1253035 () Bool)

(assert (=> b!1368453 m!1253035))

(declare-fun m!1253037 () Bool)

(assert (=> b!1368453 m!1253037))

(assert (=> b!1368453 m!1253029))

(declare-fun m!1253039 () Bool)

(assert (=> b!1368453 m!1253039))

(assert (=> b!1368457 m!1253029))

(assert (=> b!1368457 m!1253029))

(declare-fun m!1253041 () Bool)

(assert (=> b!1368457 m!1253041))

(check-sat (not b!1368452) (not b!1368450) (not b!1368454) (not b!1368455) (not b!1368459) (not start!115834) (not b!1368453) (not b!1368456) (not b!1368451) (not b!1368457) (not b!1368458))
(check-sat)
