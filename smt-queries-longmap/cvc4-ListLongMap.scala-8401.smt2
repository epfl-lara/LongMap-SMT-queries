; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102190 () Bool)

(assert start!102190)

(declare-fun b!1230254 () Bool)

(declare-fun res!818746 () Bool)

(declare-fun e!698051 () Bool)

(assert (=> b!1230254 (=> (not res!818746) (not e!698051))))

(declare-datatypes ((array!79365 0))(
  ( (array!79366 (arr!38302 (Array (_ BitVec 32) (_ BitVec 64))) (size!38838 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79365)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230254 (= res!818746 (validKeyInArray!0 (select (arr!38302 a!3806) from!3184)))))

(declare-fun b!1230255 () Bool)

(declare-fun res!818748 () Bool)

(assert (=> b!1230255 (=> (not res!818748) (not e!698051))))

(assert (=> b!1230255 (= res!818748 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38838 a!3806)) (bvslt from!3184 (size!38838 a!3806))))))

(declare-fun b!1230256 () Bool)

(declare-fun res!818740 () Bool)

(assert (=> b!1230256 (=> (not res!818740) (not e!698051))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230256 (= res!818740 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230257 () Bool)

(declare-fun res!818747 () Bool)

(assert (=> b!1230257 (=> (not res!818747) (not e!698051))))

(declare-datatypes ((List!27075 0))(
  ( (Nil!27072) (Cons!27071 (h!28280 (_ BitVec 64)) (t!40538 List!27075)) )
))
(declare-fun acc!823 () List!27075)

(declare-fun noDuplicate!1734 (List!27075) Bool)

(assert (=> b!1230257 (= res!818747 (noDuplicate!1734 acc!823))))

(declare-fun b!1230258 () Bool)

(declare-fun res!818749 () Bool)

(assert (=> b!1230258 (=> (not res!818749) (not e!698051))))

(assert (=> b!1230258 (= res!818749 (validKeyInArray!0 k!2913))))

(declare-fun b!1230259 () Bool)

(declare-fun res!818741 () Bool)

(assert (=> b!1230259 (=> (not res!818741) (not e!698051))))

(declare-fun contains!7137 (List!27075 (_ BitVec 64)) Bool)

(assert (=> b!1230259 (= res!818741 (not (contains!7137 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230260 () Bool)

(declare-fun res!818744 () Bool)

(assert (=> b!1230260 (=> (not res!818744) (not e!698051))))

(declare-fun arrayNoDuplicates!0 (array!79365 (_ BitVec 32) List!27075) Bool)

(assert (=> b!1230260 (= res!818744 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!818745 () Bool)

(assert (=> start!102190 (=> (not res!818745) (not e!698051))))

(assert (=> start!102190 (= res!818745 (bvslt (size!38838 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102190 e!698051))

(declare-fun array_inv!29150 (array!79365) Bool)

(assert (=> start!102190 (array_inv!29150 a!3806)))

(assert (=> start!102190 true))

(declare-fun b!1230261 () Bool)

(assert (=> b!1230261 (= e!698051 (not true))))

(assert (=> b!1230261 (not (arrayContainsKey!0 a!3806 (select (arr!38302 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40770 0))(
  ( (Unit!40771) )
))
(declare-fun lt!559351 () Unit!40770)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79365 (_ BitVec 32) (_ BitVec 64) List!27075) Unit!40770)

(assert (=> b!1230261 (= lt!559351 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38302 a!3806) from!3184) (Cons!27071 (select (arr!38302 a!3806) from!3184) Nil!27072)))))

(declare-fun e!698052 () Bool)

(assert (=> b!1230261 e!698052))

(declare-fun res!818742 () Bool)

(assert (=> b!1230261 (=> (not res!818742) (not e!698052))))

(assert (=> b!1230261 (= res!818742 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27072))))

(declare-fun lt!559352 () Unit!40770)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79365 List!27075 List!27075 (_ BitVec 32)) Unit!40770)

(assert (=> b!1230261 (= lt!559352 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27072 from!3184))))

(assert (=> b!1230261 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27071 (select (arr!38302 a!3806) from!3184) acc!823))))

(declare-fun b!1230262 () Bool)

(declare-fun res!818743 () Bool)

(assert (=> b!1230262 (=> (not res!818743) (not e!698051))))

(assert (=> b!1230262 (= res!818743 (not (contains!7137 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230263 () Bool)

(assert (=> b!1230263 (= e!698052 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27071 (select (arr!38302 a!3806) from!3184) Nil!27072)))))

(assert (= (and start!102190 res!818745) b!1230258))

(assert (= (and b!1230258 res!818749) b!1230255))

(assert (= (and b!1230255 res!818748) b!1230257))

(assert (= (and b!1230257 res!818747) b!1230262))

(assert (= (and b!1230262 res!818743) b!1230259))

(assert (= (and b!1230259 res!818741) b!1230256))

(assert (= (and b!1230256 res!818740) b!1230260))

(assert (= (and b!1230260 res!818744) b!1230254))

(assert (= (and b!1230254 res!818746) b!1230261))

(assert (= (and b!1230261 res!818742) b!1230263))

(declare-fun m!1134709 () Bool)

(assert (=> b!1230262 m!1134709))

(declare-fun m!1134711 () Bool)

(assert (=> b!1230263 m!1134711))

(declare-fun m!1134713 () Bool)

(assert (=> b!1230263 m!1134713))

(declare-fun m!1134715 () Bool)

(assert (=> b!1230261 m!1134715))

(declare-fun m!1134717 () Bool)

(assert (=> b!1230261 m!1134717))

(assert (=> b!1230261 m!1134711))

(declare-fun m!1134719 () Bool)

(assert (=> b!1230261 m!1134719))

(assert (=> b!1230261 m!1134711))

(declare-fun m!1134721 () Bool)

(assert (=> b!1230261 m!1134721))

(assert (=> b!1230261 m!1134711))

(declare-fun m!1134723 () Bool)

(assert (=> b!1230261 m!1134723))

(assert (=> b!1230254 m!1134711))

(assert (=> b!1230254 m!1134711))

(declare-fun m!1134725 () Bool)

(assert (=> b!1230254 m!1134725))

(declare-fun m!1134727 () Bool)

(assert (=> b!1230257 m!1134727))

(declare-fun m!1134729 () Bool)

(assert (=> b!1230256 m!1134729))

(declare-fun m!1134731 () Bool)

(assert (=> b!1230258 m!1134731))

(declare-fun m!1134733 () Bool)

(assert (=> b!1230259 m!1134733))

(declare-fun m!1134735 () Bool)

(assert (=> b!1230260 m!1134735))

(declare-fun m!1134737 () Bool)

(assert (=> start!102190 m!1134737))

(push 1)

(assert (not b!1230261))

(assert (not b!1230262))

(assert (not b!1230259))

(assert (not b!1230257))

(assert (not b!1230263))

(assert (not b!1230260))

(assert (not start!102190))

(assert (not b!1230256))

(assert (not b!1230254))

(assert (not b!1230258))

(check-sat)

