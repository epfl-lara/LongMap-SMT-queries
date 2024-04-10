; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102632 () Bool)

(assert start!102632)

(declare-fun b!1233695 () Bool)

(declare-fun res!821877 () Bool)

(declare-fun e!699849 () Bool)

(assert (=> b!1233695 (=> (not res!821877) (not e!699849))))

(declare-datatypes ((List!27143 0))(
  ( (Nil!27140) (Cons!27139 (h!28348 (_ BitVec 64)) (t!40606 List!27143)) )
))
(declare-fun acc!823 () List!27143)

(declare-fun contains!7205 (List!27143 (_ BitVec 64)) Bool)

(assert (=> b!1233695 (= res!821877 (not (contains!7205 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233696 () Bool)

(declare-fun res!821882 () Bool)

(assert (=> b!1233696 (=> (not res!821882) (not e!699849))))

(assert (=> b!1233696 (= res!821882 (not (contains!7205 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233697 () Bool)

(declare-fun res!821883 () Bool)

(assert (=> b!1233697 (=> (not res!821883) (not e!699849))))

(declare-datatypes ((array!79522 0))(
  ( (array!79523 (arr!38370 (Array (_ BitVec 32) (_ BitVec 64))) (size!38906 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79522)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79522 (_ BitVec 32) List!27143) Bool)

(assert (=> b!1233697 (= res!821883 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!821878 () Bool)

(assert (=> start!102632 (=> (not res!821878) (not e!699849))))

(assert (=> start!102632 (= res!821878 (bvslt (size!38906 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102632 e!699849))

(declare-fun array_inv!29218 (array!79522) Bool)

(assert (=> start!102632 (array_inv!29218 a!3806)))

(assert (=> start!102632 true))

(declare-fun b!1233698 () Bool)

(declare-fun res!821884 () Bool)

(assert (=> b!1233698 (=> (not res!821884) (not e!699849))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233698 (= res!821884 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233699 () Bool)

(assert (=> b!1233699 (= e!699849 (not true))))

(declare-fun arrayContainsKey!0 (array!79522 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233699 (not (arrayContainsKey!0 a!3806 (select (arr!38370 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40846 0))(
  ( (Unit!40847) )
))
(declare-fun lt!559727 () Unit!40846)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79522 (_ BitVec 32) (_ BitVec 64) List!27143) Unit!40846)

(assert (=> b!1233699 (= lt!559727 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38370 a!3806) from!3184) (Cons!27139 (select (arr!38370 a!3806) from!3184) Nil!27140)))))

(declare-fun e!699848 () Bool)

(assert (=> b!1233699 e!699848))

(declare-fun res!821875 () Bool)

(assert (=> b!1233699 (=> (not res!821875) (not e!699848))))

(assert (=> b!1233699 (= res!821875 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27140))))

(declare-fun lt!559726 () Unit!40846)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79522 List!27143 List!27143 (_ BitVec 32)) Unit!40846)

(assert (=> b!1233699 (= lt!559726 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27140 from!3184))))

(assert (=> b!1233699 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27139 (select (arr!38370 a!3806) from!3184) acc!823))))

(declare-fun b!1233700 () Bool)

(declare-fun res!821876 () Bool)

(assert (=> b!1233700 (=> (not res!821876) (not e!699849))))

(declare-fun noDuplicate!1802 (List!27143) Bool)

(assert (=> b!1233700 (= res!821876 (noDuplicate!1802 acc!823))))

(declare-fun b!1233701 () Bool)

(declare-fun res!821881 () Bool)

(assert (=> b!1233701 (=> (not res!821881) (not e!699849))))

(assert (=> b!1233701 (= res!821881 (validKeyInArray!0 (select (arr!38370 a!3806) from!3184)))))

(declare-fun b!1233702 () Bool)

(assert (=> b!1233702 (= e!699848 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27139 (select (arr!38370 a!3806) from!3184) Nil!27140)))))

(declare-fun b!1233703 () Bool)

(declare-fun res!821879 () Bool)

(assert (=> b!1233703 (=> (not res!821879) (not e!699849))))

(assert (=> b!1233703 (= res!821879 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38906 a!3806)) (bvslt from!3184 (size!38906 a!3806))))))

(declare-fun b!1233704 () Bool)

(declare-fun res!821880 () Bool)

(assert (=> b!1233704 (=> (not res!821880) (not e!699849))))

(assert (=> b!1233704 (= res!821880 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102632 res!821878) b!1233698))

(assert (= (and b!1233698 res!821884) b!1233703))

(assert (= (and b!1233703 res!821879) b!1233700))

(assert (= (and b!1233700 res!821876) b!1233696))

(assert (= (and b!1233696 res!821882) b!1233695))

(assert (= (and b!1233695 res!821877) b!1233704))

(assert (= (and b!1233704 res!821880) b!1233697))

(assert (= (and b!1233697 res!821883) b!1233701))

(assert (= (and b!1233701 res!821881) b!1233699))

(assert (= (and b!1233699 res!821875) b!1233702))

(declare-fun m!1137751 () Bool)

(assert (=> b!1233697 m!1137751))

(declare-fun m!1137753 () Bool)

(assert (=> b!1233696 m!1137753))

(declare-fun m!1137755 () Bool)

(assert (=> b!1233702 m!1137755))

(declare-fun m!1137757 () Bool)

(assert (=> b!1233702 m!1137757))

(declare-fun m!1137759 () Bool)

(assert (=> b!1233704 m!1137759))

(declare-fun m!1137761 () Bool)

(assert (=> b!1233695 m!1137761))

(declare-fun m!1137763 () Bool)

(assert (=> b!1233699 m!1137763))

(declare-fun m!1137765 () Bool)

(assert (=> b!1233699 m!1137765))

(assert (=> b!1233699 m!1137755))

(declare-fun m!1137767 () Bool)

(assert (=> b!1233699 m!1137767))

(assert (=> b!1233699 m!1137755))

(declare-fun m!1137769 () Bool)

(assert (=> b!1233699 m!1137769))

(assert (=> b!1233699 m!1137755))

(declare-fun m!1137771 () Bool)

(assert (=> b!1233699 m!1137771))

(declare-fun m!1137773 () Bool)

(assert (=> start!102632 m!1137773))

(declare-fun m!1137775 () Bool)

(assert (=> b!1233700 m!1137775))

(declare-fun m!1137777 () Bool)

(assert (=> b!1233698 m!1137777))

(assert (=> b!1233701 m!1137755))

(assert (=> b!1233701 m!1137755))

(declare-fun m!1137779 () Bool)

(assert (=> b!1233701 m!1137779))

(check-sat (not b!1233704) (not b!1233700) (not b!1233701) (not b!1233699) (not b!1233697) (not b!1233702) (not b!1233696) (not start!102632) (not b!1233695) (not b!1233698))
(check-sat)
