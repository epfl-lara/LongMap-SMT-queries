; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115660 () Bool)

(assert start!115660)

(declare-fun b!1366321 () Bool)

(declare-fun res!909115 () Bool)

(declare-fun e!774957 () Bool)

(assert (=> b!1366321 (=> (not res!909115) (not e!774957))))

(declare-datatypes ((List!31915 0))(
  ( (Nil!31912) (Cons!31911 (h!33129 (_ BitVec 64)) (t!46601 List!31915)) )
))
(declare-fun acc!866 () List!31915)

(declare-fun contains!9600 (List!31915 (_ BitVec 64)) Bool)

(assert (=> b!1366321 (= res!909115 (not (contains!9600 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366322 () Bool)

(assert (=> b!1366322 (= e!774957 false)))

(declare-datatypes ((Unit!44990 0))(
  ( (Unit!44991) )
))
(declare-fun lt!601653 () Unit!44990)

(declare-fun newAcc!98 () List!31915)

(declare-fun noDuplicateSubseq!146 (List!31915 List!31915) Unit!44990)

(assert (=> b!1366322 (= lt!601653 (noDuplicateSubseq!146 newAcc!98 acc!866))))

(declare-fun b!1366323 () Bool)

(declare-fun res!909117 () Bool)

(assert (=> b!1366323 (=> (not res!909117) (not e!774957))))

(assert (=> b!1366323 (= res!909117 (not (contains!9600 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366324 () Bool)

(declare-fun res!909119 () Bool)

(assert (=> b!1366324 (=> (not res!909119) (not e!774957))))

(assert (=> b!1366324 (= res!909119 (not (contains!9600 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1366326 () Bool)

(declare-fun res!909120 () Bool)

(assert (=> b!1366326 (=> (not res!909120) (not e!774957))))

(declare-fun noDuplicate!2431 (List!31915) Bool)

(assert (=> b!1366326 (= res!909120 (noDuplicate!2431 acc!866))))

(declare-fun b!1366327 () Bool)

(declare-fun res!909114 () Bool)

(assert (=> b!1366327 (=> (not res!909114) (not e!774957))))

(declare-fun subseq!959 (List!31915 List!31915) Bool)

(assert (=> b!1366327 (= res!909114 (subseq!959 newAcc!98 acc!866))))

(declare-fun res!909116 () Bool)

(assert (=> start!115660 (=> (not res!909116) (not e!774957))))

(declare-datatypes ((array!92872 0))(
  ( (array!92873 (arr!44860 (Array (_ BitVec 32) (_ BitVec 64))) (size!45411 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92872)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115660 (= res!909116 (and (bvslt (size!45411 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45411 a!3861))))))

(assert (=> start!115660 e!774957))

(declare-fun array_inv!34141 (array!92872) Bool)

(assert (=> start!115660 (array_inv!34141 a!3861)))

(assert (=> start!115660 true))

(declare-fun b!1366325 () Bool)

(declare-fun res!909118 () Bool)

(assert (=> b!1366325 (=> (not res!909118) (not e!774957))))

(assert (=> b!1366325 (= res!909118 (not (contains!9600 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115660 res!909116) b!1366326))

(assert (= (and b!1366326 res!909120) b!1366323))

(assert (= (and b!1366323 res!909117) b!1366321))

(assert (= (and b!1366321 res!909115) b!1366324))

(assert (= (and b!1366324 res!909119) b!1366325))

(assert (= (and b!1366325 res!909118) b!1366327))

(assert (= (and b!1366327 res!909114) b!1366322))

(declare-fun m!1251289 () Bool)

(assert (=> b!1366321 m!1251289))

(declare-fun m!1251291 () Bool)

(assert (=> b!1366325 m!1251291))

(declare-fun m!1251293 () Bool)

(assert (=> b!1366323 m!1251293))

(declare-fun m!1251295 () Bool)

(assert (=> b!1366322 m!1251295))

(declare-fun m!1251297 () Bool)

(assert (=> b!1366326 m!1251297))

(declare-fun m!1251299 () Bool)

(assert (=> start!115660 m!1251299))

(declare-fun m!1251301 () Bool)

(assert (=> b!1366324 m!1251301))

(declare-fun m!1251303 () Bool)

(assert (=> b!1366327 m!1251303))

(check-sat (not b!1366322) (not b!1366326) (not b!1366323) (not start!115660) (not b!1366324) (not b!1366321) (not b!1366325) (not b!1366327))
(check-sat)
