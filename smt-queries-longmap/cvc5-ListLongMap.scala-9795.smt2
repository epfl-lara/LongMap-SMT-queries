; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116522 () Bool)

(assert start!116522)

(declare-fun b!1374262 () Bool)

(declare-fun res!916755 () Bool)

(declare-fun e!778585 () Bool)

(assert (=> b!1374262 (=> (not res!916755) (not e!778585))))

(declare-datatypes ((List!32076 0))(
  ( (Nil!32073) (Cons!32072 (h!33290 (_ BitVec 64)) (t!46762 List!32076)) )
))
(declare-fun acc!866 () List!32076)

(declare-fun contains!9761 (List!32076 (_ BitVec 64)) Bool)

(assert (=> b!1374262 (= res!916755 (not (contains!9761 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374263 () Bool)

(declare-fun res!916750 () Bool)

(assert (=> b!1374263 (=> (not res!916750) (not e!778585))))

(declare-fun newAcc!98 () List!32076)

(assert (=> b!1374263 (= res!916750 (not (contains!9761 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374264 () Bool)

(assert (=> b!1374264 (= e!778585 false)))

(declare-datatypes ((array!93230 0))(
  ( (array!93231 (arr!45021 (Array (_ BitVec 32) (_ BitVec 64))) (size!45572 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93230)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!603464 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93230 (_ BitVec 32) List!32076) Bool)

(assert (=> b!1374264 (= lt!603464 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45312 0))(
  ( (Unit!45313) )
))
(declare-fun lt!603465 () Unit!45312)

(declare-fun noDuplicateSubseq!307 (List!32076 List!32076) Unit!45312)

(assert (=> b!1374264 (= lt!603465 (noDuplicateSubseq!307 newAcc!98 acc!866))))

(declare-fun b!1374265 () Bool)

(declare-fun res!916749 () Bool)

(assert (=> b!1374265 (=> (not res!916749) (not e!778585))))

(declare-fun noDuplicate!2592 (List!32076) Bool)

(assert (=> b!1374265 (= res!916749 (noDuplicate!2592 acc!866))))

(declare-fun res!916752 () Bool)

(assert (=> start!116522 (=> (not res!916752) (not e!778585))))

(assert (=> start!116522 (= res!916752 (and (bvslt (size!45572 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45572 a!3861))))))

(assert (=> start!116522 e!778585))

(declare-fun array_inv!34302 (array!93230) Bool)

(assert (=> start!116522 (array_inv!34302 a!3861)))

(assert (=> start!116522 true))

(declare-fun b!1374266 () Bool)

(declare-fun res!916754 () Bool)

(assert (=> b!1374266 (=> (not res!916754) (not e!778585))))

(declare-fun subseq!1120 (List!32076 List!32076) Bool)

(assert (=> b!1374266 (= res!916754 (subseq!1120 newAcc!98 acc!866))))

(declare-fun b!1374267 () Bool)

(declare-fun res!916753 () Bool)

(assert (=> b!1374267 (=> (not res!916753) (not e!778585))))

(assert (=> b!1374267 (= res!916753 (not (contains!9761 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374268 () Bool)

(declare-fun res!916751 () Bool)

(assert (=> b!1374268 (=> (not res!916751) (not e!778585))))

(assert (=> b!1374268 (= res!916751 (not (contains!9761 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!116522 res!916752) b!1374265))

(assert (= (and b!1374265 res!916749) b!1374262))

(assert (= (and b!1374262 res!916755) b!1374268))

(assert (= (and b!1374268 res!916751) b!1374267))

(assert (= (and b!1374267 res!916753) b!1374263))

(assert (= (and b!1374263 res!916750) b!1374266))

(assert (= (and b!1374266 res!916754) b!1374264))

(declare-fun m!1257919 () Bool)

(assert (=> start!116522 m!1257919))

(declare-fun m!1257921 () Bool)

(assert (=> b!1374262 m!1257921))

(declare-fun m!1257923 () Bool)

(assert (=> b!1374264 m!1257923))

(declare-fun m!1257925 () Bool)

(assert (=> b!1374264 m!1257925))

(declare-fun m!1257927 () Bool)

(assert (=> b!1374265 m!1257927))

(declare-fun m!1257929 () Bool)

(assert (=> b!1374266 m!1257929))

(declare-fun m!1257931 () Bool)

(assert (=> b!1374268 m!1257931))

(declare-fun m!1257933 () Bool)

(assert (=> b!1374267 m!1257933))

(declare-fun m!1257935 () Bool)

(assert (=> b!1374263 m!1257935))

(push 1)

(assert (not b!1374267))

(assert (not b!1374265))

(assert (not b!1374266))

(assert (not b!1374263))

(assert (not b!1374268))

(assert (not start!116522))

(assert (not b!1374264))

(assert (not b!1374262))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

