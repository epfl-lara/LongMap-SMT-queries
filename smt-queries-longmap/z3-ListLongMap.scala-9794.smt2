; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116512 () Bool)

(assert start!116512)

(declare-fun b!1374157 () Bool)

(declare-fun res!916646 () Bool)

(declare-fun e!778555 () Bool)

(assert (=> b!1374157 (=> (not res!916646) (not e!778555))))

(declare-datatypes ((List!32071 0))(
  ( (Nil!32068) (Cons!32067 (h!33285 (_ BitVec 64)) (t!46757 List!32071)) )
))
(declare-fun acc!866 () List!32071)

(declare-fun contains!9756 (List!32071 (_ BitVec 64)) Bool)

(assert (=> b!1374157 (= res!916646 (not (contains!9756 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374158 () Bool)

(declare-fun res!916645 () Bool)

(assert (=> b!1374158 (=> (not res!916645) (not e!778555))))

(declare-fun noDuplicate!2587 (List!32071) Bool)

(assert (=> b!1374158 (= res!916645 (noDuplicate!2587 acc!866))))

(declare-fun b!1374159 () Bool)

(assert (=> b!1374159 (= e!778555 false)))

(declare-datatypes ((array!93220 0))(
  ( (array!93221 (arr!45016 (Array (_ BitVec 32) (_ BitVec 64))) (size!45567 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93220)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!603434 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93220 (_ BitVec 32) List!32071) Bool)

(assert (=> b!1374159 (= lt!603434 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45302 0))(
  ( (Unit!45303) )
))
(declare-fun lt!603435 () Unit!45302)

(declare-fun newAcc!98 () List!32071)

(declare-fun noDuplicateSubseq!302 (List!32071 List!32071) Unit!45302)

(assert (=> b!1374159 (= lt!603435 (noDuplicateSubseq!302 newAcc!98 acc!866))))

(declare-fun b!1374160 () Bool)

(declare-fun res!916648 () Bool)

(assert (=> b!1374160 (=> (not res!916648) (not e!778555))))

(assert (=> b!1374160 (= res!916648 (not (contains!9756 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374161 () Bool)

(declare-fun res!916647 () Bool)

(assert (=> b!1374161 (=> (not res!916647) (not e!778555))))

(assert (=> b!1374161 (= res!916647 (not (contains!9756 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374162 () Bool)

(declare-fun res!916644 () Bool)

(assert (=> b!1374162 (=> (not res!916644) (not e!778555))))

(declare-fun subseq!1115 (List!32071 List!32071) Bool)

(assert (=> b!1374162 (= res!916644 (subseq!1115 newAcc!98 acc!866))))

(declare-fun b!1374163 () Bool)

(declare-fun res!916650 () Bool)

(assert (=> b!1374163 (=> (not res!916650) (not e!778555))))

(assert (=> b!1374163 (= res!916650 (not (contains!9756 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916649 () Bool)

(assert (=> start!116512 (=> (not res!916649) (not e!778555))))

(assert (=> start!116512 (= res!916649 (and (bvslt (size!45567 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45567 a!3861))))))

(assert (=> start!116512 e!778555))

(declare-fun array_inv!34297 (array!93220) Bool)

(assert (=> start!116512 (array_inv!34297 a!3861)))

(assert (=> start!116512 true))

(assert (= (and start!116512 res!916649) b!1374158))

(assert (= (and b!1374158 res!916645) b!1374161))

(assert (= (and b!1374161 res!916647) b!1374157))

(assert (= (and b!1374157 res!916646) b!1374163))

(assert (= (and b!1374163 res!916650) b!1374160))

(assert (= (and b!1374160 res!916648) b!1374162))

(assert (= (and b!1374162 res!916644) b!1374159))

(declare-fun m!1257829 () Bool)

(assert (=> b!1374163 m!1257829))

(declare-fun m!1257831 () Bool)

(assert (=> b!1374159 m!1257831))

(declare-fun m!1257833 () Bool)

(assert (=> b!1374159 m!1257833))

(declare-fun m!1257835 () Bool)

(assert (=> start!116512 m!1257835))

(declare-fun m!1257837 () Bool)

(assert (=> b!1374160 m!1257837))

(declare-fun m!1257839 () Bool)

(assert (=> b!1374157 m!1257839))

(declare-fun m!1257841 () Bool)

(assert (=> b!1374161 m!1257841))

(declare-fun m!1257843 () Bool)

(assert (=> b!1374158 m!1257843))

(declare-fun m!1257845 () Bool)

(assert (=> b!1374162 m!1257845))

(check-sat (not start!116512) (not b!1374161) (not b!1374160) (not b!1374162) (not b!1374158) (not b!1374163) (not b!1374159) (not b!1374157))
(check-sat)
