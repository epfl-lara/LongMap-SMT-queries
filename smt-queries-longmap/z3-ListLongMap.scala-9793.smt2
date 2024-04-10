; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116284 () Bool)

(assert start!116284)

(declare-fun b!1372816 () Bool)

(declare-fun res!916087 () Bool)

(declare-fun e!777700 () Bool)

(assert (=> b!1372816 (=> (not res!916087) (not e!777700))))

(declare-datatypes ((List!32029 0))(
  ( (Nil!32026) (Cons!32025 (h!33234 (_ BitVec 64)) (t!46723 List!32029)) )
))
(declare-fun acc!866 () List!32029)

(declare-fun contains!9711 (List!32029 (_ BitVec 64)) Bool)

(assert (=> b!1372816 (= res!916087 (not (contains!9711 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372817 () Bool)

(declare-fun res!916084 () Bool)

(assert (=> b!1372817 (=> (not res!916084) (not e!777700))))

(assert (=> b!1372817 (= res!916084 (not (contains!9711 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372818 () Bool)

(declare-fun res!916088 () Bool)

(assert (=> b!1372818 (=> (not res!916088) (not e!777700))))

(declare-fun noDuplicate!2568 (List!32029) Bool)

(assert (=> b!1372818 (= res!916088 (noDuplicate!2568 acc!866))))

(declare-fun b!1372819 () Bool)

(declare-fun res!916089 () Bool)

(assert (=> b!1372819 (=> (not res!916089) (not e!777700))))

(declare-fun newAcc!98 () List!32029)

(assert (=> b!1372819 (= res!916089 (not (contains!9711 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!916090 () Bool)

(assert (=> start!116284 (=> (not res!916090) (not e!777700))))

(declare-datatypes ((array!93101 0))(
  ( (array!93102 (arr!44961 (Array (_ BitVec 32) (_ BitVec 64))) (size!45511 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93101)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116284 (= res!916090 (and (bvslt (size!45511 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45511 a!3861))))))

(assert (=> start!116284 e!777700))

(declare-fun array_inv!33989 (array!93101) Bool)

(assert (=> start!116284 (array_inv!33989 a!3861)))

(assert (=> start!116284 true))

(declare-fun b!1372820 () Bool)

(declare-fun res!916086 () Bool)

(assert (=> b!1372820 (=> (not res!916086) (not e!777700))))

(declare-fun subseq!1113 (List!32029 List!32029) Bool)

(assert (=> b!1372820 (= res!916086 (subseq!1113 newAcc!98 acc!866))))

(declare-fun b!1372821 () Bool)

(declare-fun res!916085 () Bool)

(assert (=> b!1372821 (=> (not res!916085) (not e!777700))))

(assert (=> b!1372821 (= res!916085 (not (contains!9711 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372822 () Bool)

(assert (=> b!1372822 (= e!777700 false)))

(declare-fun lt!602946 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93101 (_ BitVec 32) List!32029) Bool)

(assert (=> b!1372822 (= lt!602946 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45359 0))(
  ( (Unit!45360) )
))
(declare-fun lt!602947 () Unit!45359)

(declare-fun noDuplicateSubseq!300 (List!32029 List!32029) Unit!45359)

(assert (=> b!1372822 (= lt!602947 (noDuplicateSubseq!300 newAcc!98 acc!866))))

(assert (= (and start!116284 res!916090) b!1372818))

(assert (= (and b!1372818 res!916088) b!1372817))

(assert (= (and b!1372817 res!916084) b!1372816))

(assert (= (and b!1372816 res!916087) b!1372821))

(assert (= (and b!1372821 res!916085) b!1372819))

(assert (= (and b!1372819 res!916089) b!1372820))

(assert (= (and b!1372820 res!916086) b!1372822))

(declare-fun m!1256197 () Bool)

(assert (=> start!116284 m!1256197))

(declare-fun m!1256199 () Bool)

(assert (=> b!1372822 m!1256199))

(declare-fun m!1256201 () Bool)

(assert (=> b!1372822 m!1256201))

(declare-fun m!1256203 () Bool)

(assert (=> b!1372817 m!1256203))

(declare-fun m!1256205 () Bool)

(assert (=> b!1372816 m!1256205))

(declare-fun m!1256207 () Bool)

(assert (=> b!1372820 m!1256207))

(declare-fun m!1256209 () Bool)

(assert (=> b!1372819 m!1256209))

(declare-fun m!1256211 () Bool)

(assert (=> b!1372821 m!1256211))

(declare-fun m!1256213 () Bool)

(assert (=> b!1372818 m!1256213))

(check-sat (not b!1372820) (not b!1372818) (not b!1372816) (not b!1372819) (not start!116284) (not b!1372821) (not b!1372817) (not b!1372822))
(check-sat)
