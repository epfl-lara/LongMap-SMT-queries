; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104146 () Bool)

(assert start!104146)

(declare-fun b!1245077 () Bool)

(declare-fun res!830065 () Bool)

(declare-fun e!705883 () Bool)

(assert (=> b!1245077 (=> (not res!830065) (not e!705883))))

(declare-datatypes ((List!27422 0))(
  ( (Nil!27419) (Cons!27418 (h!28636 (_ BitVec 64)) (t!40883 List!27422)) )
))
(declare-fun lt!562959 () List!27422)

(declare-fun noDuplicate!2014 (List!27422) Bool)

(assert (=> b!1245077 (= res!830065 (noDuplicate!2014 lt!562959))))

(declare-fun b!1245078 () Bool)

(declare-fun res!830069 () Bool)

(assert (=> b!1245078 (=> (not res!830069) (not e!705883))))

(declare-fun contains!7452 (List!27422 (_ BitVec 64)) Bool)

(assert (=> b!1245078 (= res!830069 (not (contains!7452 Nil!27419 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245079 () Bool)

(declare-fun e!705884 () Bool)

(assert (=> b!1245079 (= e!705884 e!705883)))

(declare-fun res!830064 () Bool)

(assert (=> b!1245079 (=> (not res!830064) (not e!705883))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1245079 (= res!830064 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!80037 0))(
  ( (array!80038 (arr!38606 (Array (_ BitVec 32) (_ BitVec 64))) (size!39143 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80037)

(assert (=> b!1245079 (= lt!562959 (Cons!27418 (select (arr!38606 a!3892) from!3270) Nil!27419))))

(declare-fun b!1245080 () Bool)

(declare-fun res!830073 () Bool)

(assert (=> b!1245080 (=> (not res!830073) (not e!705883))))

(assert (=> b!1245080 (= res!830073 (not (contains!7452 lt!562959 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245081 () Bool)

(declare-fun res!830063 () Bool)

(assert (=> b!1245081 (=> (not res!830063) (not e!705884))))

(declare-fun arrayNoDuplicates!0 (array!80037 (_ BitVec 32) List!27422) Bool)

(assert (=> b!1245081 (= res!830063 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27419))))

(declare-fun b!1245082 () Bool)

(declare-fun res!830070 () Bool)

(assert (=> b!1245082 (=> (not res!830070) (not e!705883))))

(assert (=> b!1245082 (= res!830070 (not (contains!7452 Nil!27419 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245083 () Bool)

(declare-fun res!830071 () Bool)

(assert (=> b!1245083 (=> (not res!830071) (not e!705884))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245083 (= res!830071 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39143 a!3892)) (not (= newFrom!287 (size!39143 a!3892)))))))

(declare-fun b!1245084 () Bool)

(assert (=> b!1245084 (= e!705883 false)))

(declare-fun lt!562960 () Bool)

(assert (=> b!1245084 (= lt!562960 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562959))))

(declare-datatypes ((Unit!41270 0))(
  ( (Unit!41271) )
))
(declare-fun lt!562961 () Unit!41270)

(declare-fun noDuplicateSubseq!98 (List!27422 List!27422) Unit!41270)

(assert (=> b!1245084 (= lt!562961 (noDuplicateSubseq!98 Nil!27419 lt!562959))))

(declare-fun res!830068 () Bool)

(assert (=> start!104146 (=> (not res!830068) (not e!705884))))

(assert (=> start!104146 (= res!830068 (and (bvslt (size!39143 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39143 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39143 a!3892))))))

(assert (=> start!104146 e!705884))

(declare-fun array_inv!29544 (array!80037) Bool)

(assert (=> start!104146 (array_inv!29544 a!3892)))

(assert (=> start!104146 true))

(declare-fun b!1245085 () Bool)

(declare-fun res!830066 () Bool)

(assert (=> b!1245085 (=> (not res!830066) (not e!705883))))

(assert (=> b!1245085 (= res!830066 (not (contains!7452 lt!562959 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245086 () Bool)

(declare-fun res!830072 () Bool)

(assert (=> b!1245086 (=> (not res!830072) (not e!705884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245086 (= res!830072 (validKeyInArray!0 (select (arr!38606 a!3892) from!3270)))))

(declare-fun b!1245087 () Bool)

(declare-fun res!830067 () Bool)

(assert (=> b!1245087 (=> (not res!830067) (not e!705883))))

(declare-fun subseq!644 (List!27422 List!27422) Bool)

(assert (=> b!1245087 (= res!830067 (subseq!644 Nil!27419 lt!562959))))

(assert (= (and start!104146 res!830068) b!1245081))

(assert (= (and b!1245081 res!830063) b!1245083))

(assert (= (and b!1245083 res!830071) b!1245086))

(assert (= (and b!1245086 res!830072) b!1245079))

(assert (= (and b!1245079 res!830064) b!1245077))

(assert (= (and b!1245077 res!830065) b!1245085))

(assert (= (and b!1245085 res!830066) b!1245080))

(assert (= (and b!1245080 res!830073) b!1245082))

(assert (= (and b!1245082 res!830070) b!1245078))

(assert (= (and b!1245078 res!830069) b!1245087))

(assert (= (and b!1245087 res!830067) b!1245084))

(declare-fun m!1147867 () Bool)

(assert (=> b!1245079 m!1147867))

(declare-fun m!1147869 () Bool)

(assert (=> b!1245077 m!1147869))

(assert (=> b!1245086 m!1147867))

(assert (=> b!1245086 m!1147867))

(declare-fun m!1147871 () Bool)

(assert (=> b!1245086 m!1147871))

(declare-fun m!1147873 () Bool)

(assert (=> b!1245082 m!1147873))

(declare-fun m!1147875 () Bool)

(assert (=> b!1245084 m!1147875))

(declare-fun m!1147877 () Bool)

(assert (=> b!1245084 m!1147877))

(declare-fun m!1147879 () Bool)

(assert (=> b!1245078 m!1147879))

(declare-fun m!1147881 () Bool)

(assert (=> b!1245081 m!1147881))

(declare-fun m!1147883 () Bool)

(assert (=> b!1245080 m!1147883))

(declare-fun m!1147885 () Bool)

(assert (=> b!1245085 m!1147885))

(declare-fun m!1147887 () Bool)

(assert (=> start!104146 m!1147887))

(declare-fun m!1147889 () Bool)

(assert (=> b!1245087 m!1147889))

(check-sat (not b!1245081) (not b!1245087) (not b!1245080) (not b!1245077) (not b!1245084) (not start!104146) (not b!1245085) (not b!1245082) (not b!1245078) (not b!1245086))
(check-sat)
