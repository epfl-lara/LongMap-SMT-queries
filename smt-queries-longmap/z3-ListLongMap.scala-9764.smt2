; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115708 () Bool)

(assert start!115708)

(declare-fun b!1368213 () Bool)

(declare-fun res!911731 () Bool)

(declare-fun e!775272 () Bool)

(assert (=> b!1368213 (=> (not res!911731) (not e!775272))))

(declare-datatypes ((array!92900 0))(
  ( (array!92901 (arr!44874 (Array (_ BitVec 32) (_ BitVec 64))) (size!45424 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92900)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368213 (= res!911731 (not (validKeyInArray!0 (select (arr!44874 a!3861) from!3239))))))

(declare-fun b!1368214 () Bool)

(declare-fun res!911721 () Bool)

(declare-fun e!775271 () Bool)

(assert (=> b!1368214 (=> (not res!911721) (not e!775271))))

(declare-datatypes ((List!31942 0))(
  ( (Nil!31939) (Cons!31938 (h!33147 (_ BitVec 64)) (t!46636 List!31942)) )
))
(declare-fun acc!866 () List!31942)

(declare-fun contains!9624 (List!31942 (_ BitVec 64)) Bool)

(assert (=> b!1368214 (= res!911721 (not (contains!9624 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368215 () Bool)

(declare-fun res!911726 () Bool)

(assert (=> b!1368215 (=> (not res!911726) (not e!775272))))

(assert (=> b!1368215 (= res!911726 (bvslt from!3239 (size!45424 a!3861)))))

(declare-fun res!911723 () Bool)

(assert (=> start!115708 (=> (not res!911723) (not e!775271))))

(assert (=> start!115708 (= res!911723 (and (bvslt (size!45424 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45424 a!3861))))))

(assert (=> start!115708 e!775271))

(declare-fun array_inv!33902 (array!92900) Bool)

(assert (=> start!115708 (array_inv!33902 a!3861)))

(assert (=> start!115708 true))

(declare-fun b!1368216 () Bool)

(assert (=> b!1368216 (= e!775271 e!775272)))

(declare-fun res!911727 () Bool)

(assert (=> b!1368216 (=> (not res!911727) (not e!775272))))

(declare-fun arrayNoDuplicates!0 (array!92900 (_ BitVec 32) List!31942) Bool)

(assert (=> b!1368216 (= res!911727 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45185 0))(
  ( (Unit!45186) )
))
(declare-fun lt!602025 () Unit!45185)

(declare-fun newAcc!98 () List!31942)

(declare-fun noDuplicateSubseq!213 (List!31942 List!31942) Unit!45185)

(assert (=> b!1368216 (= lt!602025 (noDuplicateSubseq!213 newAcc!98 acc!866))))

(declare-fun b!1368217 () Bool)

(declare-fun res!911730 () Bool)

(assert (=> b!1368217 (=> (not res!911730) (not e!775271))))

(declare-fun noDuplicate!2481 (List!31942) Bool)

(assert (=> b!1368217 (= res!911730 (noDuplicate!2481 acc!866))))

(declare-fun b!1368218 () Bool)

(assert (=> b!1368218 (= e!775272 false)))

(declare-fun lt!602026 () Bool)

(assert (=> b!1368218 (= lt!602026 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368219 () Bool)

(declare-fun res!911725 () Bool)

(assert (=> b!1368219 (=> (not res!911725) (not e!775271))))

(assert (=> b!1368219 (= res!911725 (not (contains!9624 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368220 () Bool)

(declare-fun res!911722 () Bool)

(assert (=> b!1368220 (=> (not res!911722) (not e!775271))))

(declare-fun subseq!1026 (List!31942 List!31942) Bool)

(assert (=> b!1368220 (= res!911722 (subseq!1026 newAcc!98 acc!866))))

(declare-fun b!1368221 () Bool)

(declare-fun res!911724 () Bool)

(assert (=> b!1368221 (=> (not res!911724) (not e!775271))))

(assert (=> b!1368221 (= res!911724 (not (contains!9624 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368222 () Bool)

(declare-fun res!911728 () Bool)

(assert (=> b!1368222 (=> (not res!911728) (not e!775271))))

(assert (=> b!1368222 (= res!911728 (not (contains!9624 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368223 () Bool)

(declare-fun res!911729 () Bool)

(assert (=> b!1368223 (=> (not res!911729) (not e!775272))))

(assert (=> b!1368223 (= res!911729 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (= (and start!115708 res!911723) b!1368217))

(assert (= (and b!1368217 res!911730) b!1368214))

(assert (= (and b!1368214 res!911721) b!1368221))

(assert (= (and b!1368221 res!911724) b!1368219))

(assert (= (and b!1368219 res!911725) b!1368222))

(assert (= (and b!1368222 res!911728) b!1368220))

(assert (= (and b!1368220 res!911722) b!1368216))

(assert (= (and b!1368216 res!911727) b!1368215))

(assert (= (and b!1368215 res!911726) b!1368213))

(assert (= (and b!1368213 res!911731) b!1368223))

(assert (= (and b!1368223 res!911729) b!1368218))

(declare-fun m!1252243 () Bool)

(assert (=> b!1368218 m!1252243))

(declare-fun m!1252245 () Bool)

(assert (=> b!1368221 m!1252245))

(declare-fun m!1252247 () Bool)

(assert (=> b!1368219 m!1252247))

(declare-fun m!1252249 () Bool)

(assert (=> b!1368213 m!1252249))

(assert (=> b!1368213 m!1252249))

(declare-fun m!1252251 () Bool)

(assert (=> b!1368213 m!1252251))

(declare-fun m!1252253 () Bool)

(assert (=> b!1368220 m!1252253))

(declare-fun m!1252255 () Bool)

(assert (=> start!115708 m!1252255))

(declare-fun m!1252257 () Bool)

(assert (=> b!1368216 m!1252257))

(declare-fun m!1252259 () Bool)

(assert (=> b!1368216 m!1252259))

(declare-fun m!1252261 () Bool)

(assert (=> b!1368222 m!1252261))

(declare-fun m!1252263 () Bool)

(assert (=> b!1368217 m!1252263))

(declare-fun m!1252265 () Bool)

(assert (=> b!1368214 m!1252265))

(check-sat (not b!1368217) (not b!1368219) (not b!1368216) (not b!1368220) (not b!1368222) (not start!115708) (not b!1368214) (not b!1368218) (not b!1368221) (not b!1368213))
(check-sat)
