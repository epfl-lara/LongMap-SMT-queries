; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102372 () Bool)

(assert start!102372)

(declare-fun b!1231638 () Bool)

(declare-fun res!820060 () Bool)

(declare-fun e!698675 () Bool)

(assert (=> b!1231638 (=> (not res!820060) (not e!698675))))

(declare-datatypes ((array!79442 0))(
  ( (array!79443 (arr!38336 (Array (_ BitVec 32) (_ BitVec 64))) (size!38872 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79442)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231638 (= res!820060 (validKeyInArray!0 (select (arr!38336 a!3806) from!3184)))))

(declare-fun b!1231639 () Bool)

(declare-fun res!820056 () Bool)

(assert (=> b!1231639 (=> (not res!820056) (not e!698675))))

(declare-datatypes ((List!27109 0))(
  ( (Nil!27106) (Cons!27105 (h!28314 (_ BitVec 64)) (t!40572 List!27109)) )
))
(declare-fun acc!823 () List!27109)

(declare-fun contains!7171 (List!27109 (_ BitVec 64)) Bool)

(assert (=> b!1231639 (= res!820056 (not (contains!7171 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231640 () Bool)

(declare-fun res!820054 () Bool)

(assert (=> b!1231640 (=> (not res!820054) (not e!698675))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1231640 (= res!820054 (validKeyInArray!0 k!2913))))

(declare-fun b!1231641 () Bool)

(declare-fun res!820058 () Bool)

(assert (=> b!1231641 (=> (not res!820058) (not e!698675))))

(assert (=> b!1231641 (= res!820058 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38872 a!3806)) (bvslt from!3184 (size!38872 a!3806))))))

(declare-fun b!1231642 () Bool)

(assert (=> b!1231642 (= e!698675 (not true))))

(declare-fun arrayNoDuplicates!0 (array!79442 (_ BitVec 32) List!27109) Bool)

(assert (=> b!1231642 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27106)))

(declare-datatypes ((Unit!40778 0))(
  ( (Unit!40779) )
))
(declare-fun lt!559430 () Unit!40778)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79442 List!27109 List!27109 (_ BitVec 32)) Unit!40778)

(assert (=> b!1231642 (= lt!559430 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27106 from!3184))))

(assert (=> b!1231642 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27105 (select (arr!38336 a!3806) from!3184) acc!823))))

(declare-fun res!820059 () Bool)

(assert (=> start!102372 (=> (not res!820059) (not e!698675))))

(assert (=> start!102372 (= res!820059 (bvslt (size!38872 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102372 e!698675))

(declare-fun array_inv!29184 (array!79442) Bool)

(assert (=> start!102372 (array_inv!29184 a!3806)))

(assert (=> start!102372 true))

(declare-fun b!1231643 () Bool)

(declare-fun res!820052 () Bool)

(assert (=> b!1231643 (=> (not res!820052) (not e!698675))))

(declare-fun arrayContainsKey!0 (array!79442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231643 (= res!820052 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231644 () Bool)

(declare-fun res!820053 () Bool)

(assert (=> b!1231644 (=> (not res!820053) (not e!698675))))

(declare-fun noDuplicate!1768 (List!27109) Bool)

(assert (=> b!1231644 (= res!820053 (noDuplicate!1768 acc!823))))

(declare-fun b!1231645 () Bool)

(declare-fun res!820057 () Bool)

(assert (=> b!1231645 (=> (not res!820057) (not e!698675))))

(assert (=> b!1231645 (= res!820057 (not (contains!7171 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231646 () Bool)

(declare-fun res!820055 () Bool)

(assert (=> b!1231646 (=> (not res!820055) (not e!698675))))

(assert (=> b!1231646 (= res!820055 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102372 res!820059) b!1231640))

(assert (= (and b!1231640 res!820054) b!1231641))

(assert (= (and b!1231641 res!820058) b!1231644))

(assert (= (and b!1231644 res!820053) b!1231645))

(assert (= (and b!1231645 res!820057) b!1231639))

(assert (= (and b!1231639 res!820056) b!1231643))

(assert (= (and b!1231643 res!820052) b!1231646))

(assert (= (and b!1231646 res!820055) b!1231638))

(assert (= (and b!1231638 res!820060) b!1231642))

(declare-fun m!1135741 () Bool)

(assert (=> start!102372 m!1135741))

(declare-fun m!1135743 () Bool)

(assert (=> b!1231645 m!1135743))

(declare-fun m!1135745 () Bool)

(assert (=> b!1231640 m!1135745))

(declare-fun m!1135747 () Bool)

(assert (=> b!1231638 m!1135747))

(assert (=> b!1231638 m!1135747))

(declare-fun m!1135749 () Bool)

(assert (=> b!1231638 m!1135749))

(declare-fun m!1135751 () Bool)

(assert (=> b!1231644 m!1135751))

(declare-fun m!1135753 () Bool)

(assert (=> b!1231642 m!1135753))

(declare-fun m!1135755 () Bool)

(assert (=> b!1231642 m!1135755))

(assert (=> b!1231642 m!1135747))

(declare-fun m!1135757 () Bool)

(assert (=> b!1231642 m!1135757))

(declare-fun m!1135759 () Bool)

(assert (=> b!1231646 m!1135759))

(declare-fun m!1135761 () Bool)

(assert (=> b!1231643 m!1135761))

(declare-fun m!1135763 () Bool)

(assert (=> b!1231639 m!1135763))

(push 1)

(assert (not b!1231640))

(assert (not b!1231646))

(assert (not b!1231645))

(assert (not b!1231643))

(assert (not b!1231642))

(assert (not b!1231638))

(assert (not start!102372))

(assert (not b!1231644))

(assert (not b!1231639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

