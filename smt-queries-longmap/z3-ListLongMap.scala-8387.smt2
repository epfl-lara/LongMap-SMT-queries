; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102000 () Bool)

(assert start!102000)

(declare-fun b!1228183 () Bool)

(declare-fun res!816797 () Bool)

(declare-fun e!697156 () Bool)

(assert (=> b!1228183 (=> (not res!816797) (not e!697156))))

(declare-datatypes ((List!27032 0))(
  ( (Nil!27029) (Cons!27028 (h!28237 (_ BitVec 64)) (t!40495 List!27032)) )
))
(declare-fun acc!823 () List!27032)

(declare-fun contains!7094 (List!27032 (_ BitVec 64)) Bool)

(assert (=> b!1228183 (= res!816797 (not (contains!7094 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228184 () Bool)

(declare-fun res!816795 () Bool)

(declare-fun e!697155 () Bool)

(assert (=> b!1228184 (=> res!816795 e!697155)))

(assert (=> b!1228184 (= res!816795 (contains!7094 Nil!27029 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228185 () Bool)

(declare-fun res!816796 () Bool)

(assert (=> b!1228185 (=> (not res!816796) (not e!697156))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228185 (= res!816796 (validKeyInArray!0 k0!2913))))

(declare-fun res!816798 () Bool)

(assert (=> start!102000 (=> (not res!816798) (not e!697156))))

(declare-datatypes ((array!79273 0))(
  ( (array!79274 (arr!38259 (Array (_ BitVec 32) (_ BitVec 64))) (size!38795 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79273)

(assert (=> start!102000 (= res!816798 (bvslt (size!38795 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102000 e!697156))

(declare-fun array_inv!29107 (array!79273) Bool)

(assert (=> start!102000 (array_inv!29107 a!3806)))

(assert (=> start!102000 true))

(declare-fun b!1228186 () Bool)

(declare-fun res!816804 () Bool)

(assert (=> b!1228186 (=> (not res!816804) (not e!697156))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228186 (= res!816804 (validKeyInArray!0 (select (arr!38259 a!3806) from!3184)))))

(declare-fun b!1228187 () Bool)

(assert (=> b!1228187 (= e!697156 (not e!697155))))

(declare-fun res!816800 () Bool)

(assert (=> b!1228187 (=> res!816800 e!697155)))

(assert (=> b!1228187 (= res!816800 (bvsgt from!3184 (size!38795 a!3806)))))

(declare-fun arrayNoDuplicates!0 (array!79273 (_ BitVec 32) List!27032) Bool)

(assert (=> b!1228187 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27028 (select (arr!38259 a!3806) from!3184) acc!823))))

(declare-fun b!1228188 () Bool)

(declare-fun res!816799 () Bool)

(assert (=> b!1228188 (=> (not res!816799) (not e!697156))))

(assert (=> b!1228188 (= res!816799 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228189 () Bool)

(declare-fun res!816803 () Bool)

(assert (=> b!1228189 (=> (not res!816803) (not e!697156))))

(assert (=> b!1228189 (= res!816803 (not (contains!7094 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228190 () Bool)

(declare-fun res!816801 () Bool)

(assert (=> b!1228190 (=> (not res!816801) (not e!697156))))

(declare-fun arrayContainsKey!0 (array!79273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228190 (= res!816801 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228191 () Bool)

(declare-fun res!816807 () Bool)

(assert (=> b!1228191 (=> res!816807 e!697155)))

(declare-fun subseq!498 (List!27032 List!27032) Bool)

(assert (=> b!1228191 (= res!816807 (not (subseq!498 Nil!27029 acc!823)))))

(declare-fun b!1228192 () Bool)

(assert (=> b!1228192 (= e!697155 true)))

(declare-datatypes ((Unit!40684 0))(
  ( (Unit!40685) )
))
(declare-fun lt!558972 () Unit!40684)

(declare-fun noDuplicateSubseq!51 (List!27032 List!27032) Unit!40684)

(assert (=> b!1228192 (= lt!558972 (noDuplicateSubseq!51 Nil!27029 acc!823))))

(declare-fun b!1228193 () Bool)

(declare-fun res!816806 () Bool)

(assert (=> b!1228193 (=> res!816806 e!697155)))

(assert (=> b!1228193 (= res!816806 (contains!7094 Nil!27029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228194 () Bool)

(declare-fun res!816802 () Bool)

(assert (=> b!1228194 (=> (not res!816802) (not e!697156))))

(declare-fun noDuplicate!1691 (List!27032) Bool)

(assert (=> b!1228194 (= res!816802 (noDuplicate!1691 acc!823))))

(declare-fun b!1228195 () Bool)

(declare-fun res!816805 () Bool)

(assert (=> b!1228195 (=> (not res!816805) (not e!697156))))

(assert (=> b!1228195 (= res!816805 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38795 a!3806)) (bvslt from!3184 (size!38795 a!3806))))))

(assert (= (and start!102000 res!816798) b!1228185))

(assert (= (and b!1228185 res!816796) b!1228195))

(assert (= (and b!1228195 res!816805) b!1228194))

(assert (= (and b!1228194 res!816802) b!1228183))

(assert (= (and b!1228183 res!816797) b!1228189))

(assert (= (and b!1228189 res!816803) b!1228190))

(assert (= (and b!1228190 res!816801) b!1228188))

(assert (= (and b!1228188 res!816799) b!1228186))

(assert (= (and b!1228186 res!816804) b!1228187))

(assert (= (and b!1228187 (not res!816800)) b!1228193))

(assert (= (and b!1228193 (not res!816806)) b!1228184))

(assert (= (and b!1228184 (not res!816795)) b!1228191))

(assert (= (and b!1228191 (not res!816807)) b!1228192))

(declare-fun m!1132759 () Bool)

(assert (=> b!1228185 m!1132759))

(declare-fun m!1132761 () Bool)

(assert (=> b!1228188 m!1132761))

(declare-fun m!1132763 () Bool)

(assert (=> b!1228189 m!1132763))

(declare-fun m!1132765 () Bool)

(assert (=> b!1228193 m!1132765))

(declare-fun m!1132767 () Bool)

(assert (=> b!1228183 m!1132767))

(declare-fun m!1132769 () Bool)

(assert (=> b!1228191 m!1132769))

(declare-fun m!1132771 () Bool)

(assert (=> start!102000 m!1132771))

(declare-fun m!1132773 () Bool)

(assert (=> b!1228190 m!1132773))

(declare-fun m!1132775 () Bool)

(assert (=> b!1228192 m!1132775))

(declare-fun m!1132777 () Bool)

(assert (=> b!1228194 m!1132777))

(declare-fun m!1132779 () Bool)

(assert (=> b!1228187 m!1132779))

(declare-fun m!1132781 () Bool)

(assert (=> b!1228187 m!1132781))

(assert (=> b!1228186 m!1132779))

(assert (=> b!1228186 m!1132779))

(declare-fun m!1132783 () Bool)

(assert (=> b!1228186 m!1132783))

(declare-fun m!1132785 () Bool)

(assert (=> b!1228184 m!1132785))

(check-sat (not b!1228187) (not b!1228192) (not b!1228193) (not b!1228189) (not start!102000) (not b!1228194) (not b!1228185) (not b!1228191) (not b!1228188) (not b!1228183) (not b!1228190) (not b!1228184) (not b!1228186))
