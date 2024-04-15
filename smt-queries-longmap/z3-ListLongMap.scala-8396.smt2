; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102154 () Bool)

(assert start!102154)

(declare-fun b!1229576 () Bool)

(declare-fun res!818108 () Bool)

(declare-fun e!697839 () Bool)

(assert (=> b!1229576 (=> res!818108 e!697839)))

(declare-datatypes ((List!27120 0))(
  ( (Nil!27117) (Cons!27116 (h!28325 (_ BitVec 64)) (t!40574 List!27120)) )
))
(declare-fun lt!559051 () List!27120)

(declare-fun contains!7092 (List!27120 (_ BitVec 64)) Bool)

(assert (=> b!1229576 (= res!818108 (contains!7092 lt!559051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229577 () Bool)

(declare-fun res!818104 () Bool)

(declare-fun e!697840 () Bool)

(assert (=> b!1229577 (=> (not res!818104) (not e!697840))))

(declare-fun acc!823 () List!27120)

(assert (=> b!1229577 (= res!818104 (not (contains!7092 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!818107 () Bool)

(assert (=> start!102154 (=> (not res!818107) (not e!697840))))

(declare-datatypes ((array!79252 0))(
  ( (array!79253 (arr!38246 (Array (_ BitVec 32) (_ BitVec 64))) (size!38784 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79252)

(assert (=> start!102154 (= res!818107 (bvslt (size!38784 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102154 e!697840))

(declare-fun array_inv!29229 (array!79252) Bool)

(assert (=> start!102154 (array_inv!29229 a!3806)))

(assert (=> start!102154 true))

(declare-fun b!1229578 () Bool)

(assert (=> b!1229578 (= e!697839 true)))

(declare-fun lt!559050 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1229578 (= lt!559050 (contains!7092 lt!559051 (select (arr!38246 a!3806) from!3184)))))

(declare-fun b!1229579 () Bool)

(declare-fun e!697841 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79252 (_ BitVec 32) List!27120) Bool)

(assert (=> b!1229579 (= e!697841 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27116 (select (arr!38246 a!3806) from!3184) Nil!27117)))))

(declare-fun b!1229580 () Bool)

(declare-fun res!818101 () Bool)

(assert (=> b!1229580 (=> (not res!818101) (not e!697840))))

(assert (=> b!1229580 (= res!818101 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229581 () Bool)

(assert (=> b!1229581 (= e!697840 (not e!697839))))

(declare-fun res!818111 () Bool)

(assert (=> b!1229581 (=> res!818111 e!697839)))

(assert (=> b!1229581 (= res!818111 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229581 (= lt!559051 (Cons!27116 (select (arr!38246 a!3806) from!3184) Nil!27117))))

(assert (=> b!1229581 e!697841))

(declare-fun res!818110 () Bool)

(assert (=> b!1229581 (=> (not res!818110) (not e!697841))))

(assert (=> b!1229581 (= res!818110 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27117))))

(declare-datatypes ((Unit!40583 0))(
  ( (Unit!40584) )
))
(declare-fun lt!559052 () Unit!40583)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79252 List!27120 List!27120 (_ BitVec 32)) Unit!40583)

(assert (=> b!1229581 (= lt!559052 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27117 from!3184))))

(assert (=> b!1229581 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27116 (select (arr!38246 a!3806) from!3184) acc!823))))

(declare-fun b!1229582 () Bool)

(declare-fun res!818106 () Bool)

(assert (=> b!1229582 (=> (not res!818106) (not e!697840))))

(assert (=> b!1229582 (= res!818106 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38784 a!3806)) (bvslt from!3184 (size!38784 a!3806))))))

(declare-fun b!1229583 () Bool)

(declare-fun res!818105 () Bool)

(assert (=> b!1229583 (=> res!818105 e!697839)))

(declare-fun noDuplicate!1735 (List!27120) Bool)

(assert (=> b!1229583 (= res!818105 (not (noDuplicate!1735 lt!559051)))))

(declare-fun b!1229584 () Bool)

(declare-fun res!818100 () Bool)

(assert (=> b!1229584 (=> res!818100 e!697839)))

(assert (=> b!1229584 (= res!818100 (contains!7092 lt!559051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229585 () Bool)

(declare-fun res!818099 () Bool)

(assert (=> b!1229585 (=> (not res!818099) (not e!697840))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229585 (= res!818099 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229586 () Bool)

(declare-fun res!818102 () Bool)

(assert (=> b!1229586 (=> (not res!818102) (not e!697840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229586 (= res!818102 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229587 () Bool)

(declare-fun res!818103 () Bool)

(assert (=> b!1229587 (=> (not res!818103) (not e!697840))))

(assert (=> b!1229587 (= res!818103 (noDuplicate!1735 acc!823))))

(declare-fun b!1229588 () Bool)

(declare-fun res!818098 () Bool)

(assert (=> b!1229588 (=> (not res!818098) (not e!697840))))

(assert (=> b!1229588 (= res!818098 (not (contains!7092 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229589 () Bool)

(declare-fun res!818109 () Bool)

(assert (=> b!1229589 (=> (not res!818109) (not e!697840))))

(assert (=> b!1229589 (= res!818109 (validKeyInArray!0 (select (arr!38246 a!3806) from!3184)))))

(assert (= (and start!102154 res!818107) b!1229586))

(assert (= (and b!1229586 res!818102) b!1229582))

(assert (= (and b!1229582 res!818106) b!1229587))

(assert (= (and b!1229587 res!818103) b!1229577))

(assert (= (and b!1229577 res!818104) b!1229588))

(assert (= (and b!1229588 res!818098) b!1229585))

(assert (= (and b!1229585 res!818099) b!1229580))

(assert (= (and b!1229580 res!818101) b!1229589))

(assert (= (and b!1229589 res!818109) b!1229581))

(assert (= (and b!1229581 res!818110) b!1229579))

(assert (= (and b!1229581 (not res!818111)) b!1229583))

(assert (= (and b!1229583 (not res!818105)) b!1229576))

(assert (= (and b!1229576 (not res!818108)) b!1229584))

(assert (= (and b!1229584 (not res!818100)) b!1229578))

(declare-fun m!1133667 () Bool)

(assert (=> b!1229586 m!1133667))

(declare-fun m!1133669 () Bool)

(assert (=> b!1229576 m!1133669))

(declare-fun m!1133671 () Bool)

(assert (=> b!1229578 m!1133671))

(assert (=> b!1229578 m!1133671))

(declare-fun m!1133673 () Bool)

(assert (=> b!1229578 m!1133673))

(assert (=> b!1229579 m!1133671))

(declare-fun m!1133675 () Bool)

(assert (=> b!1229579 m!1133675))

(declare-fun m!1133677 () Bool)

(assert (=> start!102154 m!1133677))

(declare-fun m!1133679 () Bool)

(assert (=> b!1229587 m!1133679))

(declare-fun m!1133681 () Bool)

(assert (=> b!1229583 m!1133681))

(assert (=> b!1229589 m!1133671))

(assert (=> b!1229589 m!1133671))

(declare-fun m!1133683 () Bool)

(assert (=> b!1229589 m!1133683))

(declare-fun m!1133685 () Bool)

(assert (=> b!1229585 m!1133685))

(declare-fun m!1133687 () Bool)

(assert (=> b!1229584 m!1133687))

(assert (=> b!1229581 m!1133671))

(declare-fun m!1133689 () Bool)

(assert (=> b!1229581 m!1133689))

(declare-fun m!1133691 () Bool)

(assert (=> b!1229581 m!1133691))

(declare-fun m!1133693 () Bool)

(assert (=> b!1229581 m!1133693))

(declare-fun m!1133695 () Bool)

(assert (=> b!1229580 m!1133695))

(declare-fun m!1133697 () Bool)

(assert (=> b!1229588 m!1133697))

(declare-fun m!1133699 () Bool)

(assert (=> b!1229577 m!1133699))

(check-sat (not b!1229577) (not b!1229576) (not b!1229581) (not b!1229580) (not b!1229588) (not b!1229585) (not b!1229578) (not b!1229579) (not start!102154) (not b!1229587) (not b!1229586) (not b!1229589) (not b!1229584) (not b!1229583))
(check-sat)
