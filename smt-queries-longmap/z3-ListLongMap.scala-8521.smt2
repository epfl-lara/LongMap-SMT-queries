; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103916 () Bool)

(assert start!103916)

(declare-fun b!1243869 () Bool)

(declare-fun res!829690 () Bool)

(declare-fun e!705029 () Bool)

(assert (=> b!1243869 (=> (not res!829690) (not e!705029))))

(declare-datatypes ((List!27465 0))(
  ( (Nil!27462) (Cons!27461 (h!28670 (_ BitVec 64)) (t!40925 List!27465)) )
))
(declare-fun lt!562348 () List!27465)

(declare-fun subseq!650 (List!27465 List!27465) Bool)

(assert (=> b!1243869 (= res!829690 (subseq!650 Nil!27462 lt!562348))))

(declare-fun b!1243870 () Bool)

(declare-fun res!829696 () Bool)

(assert (=> b!1243870 (=> (not res!829696) (not e!705029))))

(declare-fun noDuplicate!2020 (List!27465) Bool)

(assert (=> b!1243870 (= res!829696 (noDuplicate!2020 lt!562348))))

(declare-fun res!829694 () Bool)

(declare-fun e!705030 () Bool)

(assert (=> start!103916 (=> (not res!829694) (not e!705030))))

(declare-datatypes ((array!79934 0))(
  ( (array!79935 (arr!38561 (Array (_ BitVec 32) (_ BitVec 64))) (size!39099 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79934)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103916 (= res!829694 (and (bvslt (size!39099 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39099 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39099 a!3892))))))

(assert (=> start!103916 e!705030))

(declare-fun array_inv!29544 (array!79934) Bool)

(assert (=> start!103916 (array_inv!29544 a!3892)))

(assert (=> start!103916 true))

(declare-fun b!1243871 () Bool)

(declare-fun res!829697 () Bool)

(assert (=> b!1243871 (=> (not res!829697) (not e!705029))))

(declare-fun contains!7395 (List!27465 (_ BitVec 64)) Bool)

(assert (=> b!1243871 (= res!829697 (not (contains!7395 Nil!27462 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243872 () Bool)

(declare-fun res!829688 () Bool)

(assert (=> b!1243872 (=> (not res!829688) (not e!705029))))

(assert (=> b!1243872 (= res!829688 (not (contains!7395 lt!562348 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243873 () Bool)

(declare-fun res!829689 () Bool)

(assert (=> b!1243873 (=> (not res!829689) (not e!705030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243873 (= res!829689 (validKeyInArray!0 (select (arr!38561 a!3892) from!3270)))))

(declare-fun b!1243874 () Bool)

(declare-fun res!829695 () Bool)

(assert (=> b!1243874 (=> (not res!829695) (not e!705029))))

(assert (=> b!1243874 (= res!829695 (not (contains!7395 Nil!27462 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243875 () Bool)

(declare-fun res!829698 () Bool)

(assert (=> b!1243875 (=> (not res!829698) (not e!705029))))

(assert (=> b!1243875 (= res!829698 (not (contains!7395 lt!562348 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243876 () Bool)

(assert (=> b!1243876 (= e!705029 false)))

(declare-fun lt!562349 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79934 (_ BitVec 32) List!27465) Bool)

(assert (=> b!1243876 (= lt!562349 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562348))))

(declare-datatypes ((Unit!41154 0))(
  ( (Unit!41155) )
))
(declare-fun lt!562350 () Unit!41154)

(declare-fun noDuplicateSubseq!104 (List!27465 List!27465) Unit!41154)

(assert (=> b!1243876 (= lt!562350 (noDuplicateSubseq!104 Nil!27462 lt!562348))))

(declare-fun b!1243877 () Bool)

(declare-fun res!829693 () Bool)

(assert (=> b!1243877 (=> (not res!829693) (not e!705030))))

(assert (=> b!1243877 (= res!829693 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27462))))

(declare-fun b!1243878 () Bool)

(assert (=> b!1243878 (= e!705030 e!705029)))

(declare-fun res!829691 () Bool)

(assert (=> b!1243878 (=> (not res!829691) (not e!705029))))

(assert (=> b!1243878 (= res!829691 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243878 (= lt!562348 (Cons!27461 (select (arr!38561 a!3892) from!3270) Nil!27462))))

(declare-fun b!1243879 () Bool)

(declare-fun res!829692 () Bool)

(assert (=> b!1243879 (=> (not res!829692) (not e!705030))))

(assert (=> b!1243879 (= res!829692 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39099 a!3892)) (not (= newFrom!287 (size!39099 a!3892)))))))

(assert (= (and start!103916 res!829694) b!1243877))

(assert (= (and b!1243877 res!829693) b!1243879))

(assert (= (and b!1243879 res!829692) b!1243873))

(assert (= (and b!1243873 res!829689) b!1243878))

(assert (= (and b!1243878 res!829691) b!1243870))

(assert (= (and b!1243870 res!829696) b!1243875))

(assert (= (and b!1243875 res!829698) b!1243872))

(assert (= (and b!1243872 res!829688) b!1243874))

(assert (= (and b!1243874 res!829695) b!1243871))

(assert (= (and b!1243871 res!829697) b!1243869))

(assert (= (and b!1243869 res!829690) b!1243876))

(declare-fun m!1145841 () Bool)

(assert (=> b!1243877 m!1145841))

(declare-fun m!1145843 () Bool)

(assert (=> b!1243869 m!1145843))

(declare-fun m!1145845 () Bool)

(assert (=> b!1243870 m!1145845))

(declare-fun m!1145847 () Bool)

(assert (=> b!1243875 m!1145847))

(declare-fun m!1145849 () Bool)

(assert (=> b!1243876 m!1145849))

(declare-fun m!1145851 () Bool)

(assert (=> b!1243876 m!1145851))

(declare-fun m!1145853 () Bool)

(assert (=> b!1243871 m!1145853))

(declare-fun m!1145855 () Bool)

(assert (=> b!1243874 m!1145855))

(declare-fun m!1145857 () Bool)

(assert (=> b!1243873 m!1145857))

(assert (=> b!1243873 m!1145857))

(declare-fun m!1145859 () Bool)

(assert (=> b!1243873 m!1145859))

(declare-fun m!1145861 () Bool)

(assert (=> start!103916 m!1145861))

(declare-fun m!1145863 () Bool)

(assert (=> b!1243872 m!1145863))

(assert (=> b!1243878 m!1145857))

(check-sat (not b!1243869) (not b!1243873) (not b!1243871) (not b!1243874) (not b!1243872) (not b!1243876) (not b!1243875) (not b!1243870) (not start!103916) (not b!1243877))
(check-sat)
