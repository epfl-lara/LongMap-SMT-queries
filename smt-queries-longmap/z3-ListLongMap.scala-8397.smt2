; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102160 () Bool)

(assert start!102160)

(declare-fun b!1229702 () Bool)

(declare-fun res!818227 () Bool)

(declare-fun e!697877 () Bool)

(assert (=> b!1229702 (=> res!818227 e!697877)))

(declare-datatypes ((List!27123 0))(
  ( (Nil!27120) (Cons!27119 (h!28328 (_ BitVec 64)) (t!40577 List!27123)) )
))
(declare-fun lt!559077 () List!27123)

(declare-fun contains!7095 (List!27123 (_ BitVec 64)) Bool)

(assert (=> b!1229702 (= res!818227 (contains!7095 lt!559077 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229703 () Bool)

(declare-fun e!697874 () Bool)

(declare-datatypes ((array!79258 0))(
  ( (array!79259 (arr!38249 (Array (_ BitVec 32) (_ BitVec 64))) (size!38787 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79258)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79258 (_ BitVec 32) List!27123) Bool)

(assert (=> b!1229703 (= e!697874 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27119 (select (arr!38249 a!3806) from!3184) Nil!27120)))))

(declare-fun b!1229704 () Bool)

(declare-fun res!818228 () Bool)

(declare-fun e!697875 () Bool)

(assert (=> b!1229704 (=> (not res!818228) (not e!697875))))

(declare-fun acc!823 () List!27123)

(assert (=> b!1229704 (= res!818228 (not (contains!7095 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229705 () Bool)

(assert (=> b!1229705 (= e!697877 true)))

(declare-fun lt!559079 () Bool)

(assert (=> b!1229705 (= lt!559079 (contains!7095 lt!559077 (select (arr!38249 a!3806) from!3184)))))

(declare-fun b!1229706 () Bool)

(declare-fun res!818224 () Bool)

(assert (=> b!1229706 (=> (not res!818224) (not e!697875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229706 (= res!818224 (validKeyInArray!0 (select (arr!38249 a!3806) from!3184)))))

(declare-fun b!1229707 () Bool)

(declare-fun res!818225 () Bool)

(assert (=> b!1229707 (=> (not res!818225) (not e!697875))))

(assert (=> b!1229707 (= res!818225 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38787 a!3806)) (bvslt from!3184 (size!38787 a!3806))))))

(declare-fun b!1229708 () Bool)

(assert (=> b!1229708 (= e!697875 (not e!697877))))

(declare-fun res!818233 () Bool)

(assert (=> b!1229708 (=> res!818233 e!697877)))

(assert (=> b!1229708 (= res!818233 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1229708 (= lt!559077 (Cons!27119 (select (arr!38249 a!3806) from!3184) Nil!27120))))

(assert (=> b!1229708 e!697874))

(declare-fun res!818237 () Bool)

(assert (=> b!1229708 (=> (not res!818237) (not e!697874))))

(assert (=> b!1229708 (= res!818237 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27120))))

(declare-datatypes ((Unit!40589 0))(
  ( (Unit!40590) )
))
(declare-fun lt!559078 () Unit!40589)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79258 List!27123 List!27123 (_ BitVec 32)) Unit!40589)

(assert (=> b!1229708 (= lt!559078 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27120 from!3184))))

(assert (=> b!1229708 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27119 (select (arr!38249 a!3806) from!3184) acc!823))))

(declare-fun b!1229709 () Bool)

(declare-fun res!818235 () Bool)

(assert (=> b!1229709 (=> (not res!818235) (not e!697875))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1229709 (= res!818235 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229710 () Bool)

(declare-fun res!818236 () Bool)

(assert (=> b!1229710 (=> (not res!818236) (not e!697875))))

(declare-fun arrayContainsKey!0 (array!79258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229710 (= res!818236 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1229711 () Bool)

(declare-fun res!818226 () Bool)

(assert (=> b!1229711 (=> (not res!818226) (not e!697875))))

(assert (=> b!1229711 (= res!818226 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229713 () Bool)

(declare-fun res!818229 () Bool)

(assert (=> b!1229713 (=> res!818229 e!697877)))

(declare-fun noDuplicate!1738 (List!27123) Bool)

(assert (=> b!1229713 (= res!818229 (not (noDuplicate!1738 lt!559077)))))

(declare-fun b!1229714 () Bool)

(declare-fun res!818231 () Bool)

(assert (=> b!1229714 (=> (not res!818231) (not e!697875))))

(assert (=> b!1229714 (= res!818231 (not (contains!7095 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229715 () Bool)

(declare-fun res!818234 () Bool)

(assert (=> b!1229715 (=> res!818234 e!697877)))

(assert (=> b!1229715 (= res!818234 (contains!7095 lt!559077 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1229712 () Bool)

(declare-fun res!818232 () Bool)

(assert (=> b!1229712 (=> (not res!818232) (not e!697875))))

(assert (=> b!1229712 (= res!818232 (noDuplicate!1738 acc!823))))

(declare-fun res!818230 () Bool)

(assert (=> start!102160 (=> (not res!818230) (not e!697875))))

(assert (=> start!102160 (= res!818230 (bvslt (size!38787 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102160 e!697875))

(declare-fun array_inv!29232 (array!79258) Bool)

(assert (=> start!102160 (array_inv!29232 a!3806)))

(assert (=> start!102160 true))

(assert (= (and start!102160 res!818230) b!1229709))

(assert (= (and b!1229709 res!818235) b!1229707))

(assert (= (and b!1229707 res!818225) b!1229712))

(assert (= (and b!1229712 res!818232) b!1229704))

(assert (= (and b!1229704 res!818228) b!1229714))

(assert (= (and b!1229714 res!818231) b!1229710))

(assert (= (and b!1229710 res!818236) b!1229711))

(assert (= (and b!1229711 res!818226) b!1229706))

(assert (= (and b!1229706 res!818224) b!1229708))

(assert (= (and b!1229708 res!818237) b!1229703))

(assert (= (and b!1229708 (not res!818233)) b!1229713))

(assert (= (and b!1229713 (not res!818229)) b!1229715))

(assert (= (and b!1229715 (not res!818234)) b!1229702))

(assert (= (and b!1229702 (not res!818227)) b!1229705))

(declare-fun m!1133769 () Bool)

(assert (=> b!1229705 m!1133769))

(assert (=> b!1229705 m!1133769))

(declare-fun m!1133771 () Bool)

(assert (=> b!1229705 m!1133771))

(assert (=> b!1229708 m!1133769))

(declare-fun m!1133773 () Bool)

(assert (=> b!1229708 m!1133773))

(declare-fun m!1133775 () Bool)

(assert (=> b!1229708 m!1133775))

(declare-fun m!1133777 () Bool)

(assert (=> b!1229708 m!1133777))

(declare-fun m!1133779 () Bool)

(assert (=> b!1229709 m!1133779))

(declare-fun m!1133781 () Bool)

(assert (=> b!1229711 m!1133781))

(assert (=> b!1229706 m!1133769))

(assert (=> b!1229706 m!1133769))

(declare-fun m!1133783 () Bool)

(assert (=> b!1229706 m!1133783))

(declare-fun m!1133785 () Bool)

(assert (=> b!1229715 m!1133785))

(declare-fun m!1133787 () Bool)

(assert (=> b!1229704 m!1133787))

(declare-fun m!1133789 () Bool)

(assert (=> b!1229702 m!1133789))

(declare-fun m!1133791 () Bool)

(assert (=> b!1229713 m!1133791))

(declare-fun m!1133793 () Bool)

(assert (=> b!1229710 m!1133793))

(declare-fun m!1133795 () Bool)

(assert (=> b!1229712 m!1133795))

(declare-fun m!1133797 () Bool)

(assert (=> b!1229714 m!1133797))

(declare-fun m!1133799 () Bool)

(assert (=> start!102160 m!1133799))

(assert (=> b!1229703 m!1133769))

(declare-fun m!1133801 () Bool)

(assert (=> b!1229703 m!1133801))

(check-sat (not b!1229712) (not b!1229711) (not b!1229708) (not b!1229713) (not b!1229702) (not b!1229709) (not start!102160) (not b!1229715) (not b!1229706) (not b!1229704) (not b!1229703) (not b!1229705) (not b!1229714) (not b!1229710))
(check-sat)
