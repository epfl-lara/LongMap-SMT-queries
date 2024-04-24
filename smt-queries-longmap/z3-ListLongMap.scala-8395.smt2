; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102390 () Bool)

(assert start!102390)

(declare-fun b!1230846 () Bool)

(declare-fun res!818539 () Bool)

(declare-fun e!698704 () Bool)

(assert (=> b!1230846 (=> res!818539 e!698704)))

(declare-datatypes ((List!27080 0))(
  ( (Nil!27077) (Cons!27076 (h!28294 (_ BitVec 64)) (t!40535 List!27080)) )
))
(declare-fun lt!559686 () List!27080)

(declare-fun noDuplicate!1732 (List!27080) Bool)

(assert (=> b!1230846 (= res!818539 (not (noDuplicate!1732 lt!559686)))))

(declare-fun b!1230847 () Bool)

(declare-fun res!818548 () Bool)

(declare-fun e!698705 () Bool)

(assert (=> b!1230847 (=> (not res!818548) (not e!698705))))

(declare-datatypes ((array!79361 0))(
  ( (array!79362 (arr!38294 (Array (_ BitVec 32) (_ BitVec 64))) (size!38831 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79361)

(declare-fun acc!823 () List!27080)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79361 (_ BitVec 32) List!27080) Bool)

(assert (=> b!1230847 (= res!818548 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230848 () Bool)

(declare-fun res!818552 () Bool)

(assert (=> b!1230848 (=> (not res!818552) (not e!698705))))

(assert (=> b!1230848 (= res!818552 (noDuplicate!1732 acc!823))))

(declare-fun b!1230850 () Bool)

(declare-fun res!818545 () Bool)

(assert (=> b!1230850 (=> (not res!818545) (not e!698705))))

(assert (=> b!1230850 (= res!818545 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38831 a!3806)) (bvslt from!3184 (size!38831 a!3806))))))

(declare-fun b!1230851 () Bool)

(declare-fun res!818549 () Bool)

(assert (=> b!1230851 (=> res!818549 e!698704)))

(declare-fun contains!7151 (List!27080 (_ BitVec 64)) Bool)

(assert (=> b!1230851 (= res!818549 (contains!7151 lt!559686 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230852 () Bool)

(declare-fun res!818542 () Bool)

(assert (=> b!1230852 (=> (not res!818542) (not e!698705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230852 (= res!818542 (validKeyInArray!0 (select (arr!38294 a!3806) from!3184)))))

(declare-fun b!1230853 () Bool)

(declare-fun res!818543 () Bool)

(assert (=> b!1230853 (=> (not res!818543) (not e!698705))))

(assert (=> b!1230853 (= res!818543 (not (contains!7151 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230854 () Bool)

(declare-fun res!818550 () Bool)

(assert (=> b!1230854 (=> (not res!818550) (not e!698705))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230854 (= res!818550 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230855 () Bool)

(assert (=> b!1230855 (= e!698704 true)))

(declare-fun lt!559684 () Bool)

(assert (=> b!1230855 (= lt!559684 (contains!7151 lt!559686 (select (arr!38294 a!3806) from!3184)))))

(declare-fun b!1230849 () Bool)

(assert (=> b!1230849 (= e!698705 (not e!698704))))

(declare-fun res!818551 () Bool)

(assert (=> b!1230849 (=> res!818551 e!698704)))

(assert (=> b!1230849 (= res!818551 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1230849 (= lt!559686 (Cons!27076 (select (arr!38294 a!3806) from!3184) Nil!27077))))

(declare-fun e!698702 () Bool)

(assert (=> b!1230849 e!698702))

(declare-fun res!818546 () Bool)

(assert (=> b!1230849 (=> (not res!818546) (not e!698702))))

(assert (=> b!1230849 (= res!818546 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27077))))

(declare-datatypes ((Unit!40703 0))(
  ( (Unit!40704) )
))
(declare-fun lt!559685 () Unit!40703)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79361 List!27080 List!27080 (_ BitVec 32)) Unit!40703)

(assert (=> b!1230849 (= lt!559685 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27077 from!3184))))

(assert (=> b!1230849 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27076 (select (arr!38294 a!3806) from!3184) acc!823))))

(declare-fun res!818540 () Bool)

(assert (=> start!102390 (=> (not res!818540) (not e!698705))))

(assert (=> start!102390 (= res!818540 (bvslt (size!38831 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102390 e!698705))

(declare-fun array_inv!29232 (array!79361) Bool)

(assert (=> start!102390 (array_inv!29232 a!3806)))

(assert (=> start!102390 true))

(declare-fun b!1230856 () Bool)

(assert (=> b!1230856 (= e!698702 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27076 (select (arr!38294 a!3806) from!3184) Nil!27077)))))

(declare-fun b!1230857 () Bool)

(declare-fun res!818547 () Bool)

(assert (=> b!1230857 (=> (not res!818547) (not e!698705))))

(assert (=> b!1230857 (= res!818547 (validKeyInArray!0 k0!2913))))

(declare-fun b!1230858 () Bool)

(declare-fun res!818544 () Bool)

(assert (=> b!1230858 (=> res!818544 e!698704)))

(assert (=> b!1230858 (= res!818544 (contains!7151 lt!559686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1230859 () Bool)

(declare-fun res!818541 () Bool)

(assert (=> b!1230859 (=> (not res!818541) (not e!698705))))

(assert (=> b!1230859 (= res!818541 (not (contains!7151 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102390 res!818540) b!1230857))

(assert (= (and b!1230857 res!818547) b!1230850))

(assert (= (and b!1230850 res!818545) b!1230848))

(assert (= (and b!1230848 res!818552) b!1230853))

(assert (= (and b!1230853 res!818543) b!1230859))

(assert (= (and b!1230859 res!818541) b!1230854))

(assert (= (and b!1230854 res!818550) b!1230847))

(assert (= (and b!1230847 res!818548) b!1230852))

(assert (= (and b!1230852 res!818542) b!1230849))

(assert (= (and b!1230849 res!818546) b!1230856))

(assert (= (and b!1230849 (not res!818551)) b!1230846))

(assert (= (and b!1230846 (not res!818539)) b!1230858))

(assert (= (and b!1230858 (not res!818544)) b!1230851))

(assert (= (and b!1230851 (not res!818549)) b!1230855))

(declare-fun m!1135719 () Bool)

(assert (=> b!1230857 m!1135719))

(declare-fun m!1135721 () Bool)

(assert (=> b!1230848 m!1135721))

(declare-fun m!1135723 () Bool)

(assert (=> b!1230846 m!1135723))

(declare-fun m!1135725 () Bool)

(assert (=> b!1230859 m!1135725))

(declare-fun m!1135727 () Bool)

(assert (=> b!1230856 m!1135727))

(declare-fun m!1135729 () Bool)

(assert (=> b!1230856 m!1135729))

(declare-fun m!1135731 () Bool)

(assert (=> b!1230851 m!1135731))

(declare-fun m!1135733 () Bool)

(assert (=> b!1230847 m!1135733))

(declare-fun m!1135735 () Bool)

(assert (=> b!1230854 m!1135735))

(declare-fun m!1135737 () Bool)

(assert (=> b!1230853 m!1135737))

(assert (=> b!1230849 m!1135727))

(declare-fun m!1135739 () Bool)

(assert (=> b!1230849 m!1135739))

(declare-fun m!1135741 () Bool)

(assert (=> b!1230849 m!1135741))

(declare-fun m!1135743 () Bool)

(assert (=> b!1230849 m!1135743))

(declare-fun m!1135745 () Bool)

(assert (=> start!102390 m!1135745))

(assert (=> b!1230855 m!1135727))

(assert (=> b!1230855 m!1135727))

(declare-fun m!1135747 () Bool)

(assert (=> b!1230855 m!1135747))

(assert (=> b!1230852 m!1135727))

(assert (=> b!1230852 m!1135727))

(declare-fun m!1135749 () Bool)

(assert (=> b!1230852 m!1135749))

(declare-fun m!1135751 () Bool)

(assert (=> b!1230858 m!1135751))

(check-sat (not b!1230857) (not b!1230859) (not start!102390) (not b!1230852) (not b!1230853) (not b!1230846) (not b!1230849) (not b!1230847) (not b!1230856) (not b!1230848) (not b!1230858) (not b!1230851) (not b!1230854) (not b!1230855))
(check-sat)
