; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103882 () Bool)

(assert start!103882)

(declare-fun b!1243291 () Bool)

(declare-fun res!829076 () Bool)

(declare-fun e!704893 () Bool)

(assert (=> b!1243291 (=> (not res!829076) (not e!704893))))

(declare-datatypes ((List!27383 0))(
  ( (Nil!27380) (Cons!27379 (h!28588 (_ BitVec 64)) (t!40852 List!27383)) )
))
(declare-fun lt!562349 () List!27383)

(declare-fun noDuplicate!1982 (List!27383) Bool)

(assert (=> b!1243291 (= res!829076 (noDuplicate!1982 lt!562349))))

(declare-fun b!1243292 () Bool)

(declare-fun res!829068 () Bool)

(assert (=> b!1243292 (=> (not res!829068) (not e!704893))))

(declare-fun contains!7404 (List!27383 (_ BitVec 64)) Bool)

(assert (=> b!1243292 (= res!829068 (not (contains!7404 Nil!27380 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243293 () Bool)

(declare-fun res!829078 () Bool)

(assert (=> b!1243293 (=> (not res!829078) (not e!704893))))

(assert (=> b!1243293 (= res!829078 (not (contains!7404 lt!562349 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243294 () Bool)

(declare-fun res!829077 () Bool)

(assert (=> b!1243294 (=> (not res!829077) (not e!704893))))

(assert (=> b!1243294 (= res!829077 (not (contains!7404 lt!562349 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243295 () Bool)

(declare-fun res!829070 () Bool)

(assert (=> b!1243295 (=> (not res!829070) (not e!704893))))

(assert (=> b!1243295 (= res!829070 (not (contains!7404 Nil!27380 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243296 () Bool)

(declare-fun res!829071 () Bool)

(declare-fun e!704895 () Bool)

(assert (=> b!1243296 (=> (not res!829071) (not e!704895))))

(declare-datatypes ((array!79974 0))(
  ( (array!79975 (arr!38580 (Array (_ BitVec 32) (_ BitVec 64))) (size!39116 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79974)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243296 (= res!829071 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39116 a!3892)) (not (= newFrom!287 (size!39116 a!3892)))))))

(declare-fun b!1243297 () Bool)

(assert (=> b!1243297 (= e!704895 e!704893)))

(declare-fun res!829069 () Bool)

(assert (=> b!1243297 (=> (not res!829069) (not e!704893))))

(assert (=> b!1243297 (= res!829069 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243297 (= lt!562349 (Cons!27379 (select (arr!38580 a!3892) from!3270) Nil!27380))))

(declare-fun b!1243298 () Bool)

(assert (=> b!1243298 (= e!704893 false)))

(declare-fun lt!562348 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79974 (_ BitVec 32) List!27383) Bool)

(assert (=> b!1243298 (= lt!562348 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562349))))

(declare-datatypes ((Unit!41269 0))(
  ( (Unit!41270) )
))
(declare-fun lt!562347 () Unit!41269)

(declare-fun noDuplicateSubseq!84 (List!27383 List!27383) Unit!41269)

(assert (=> b!1243298 (= lt!562347 (noDuplicateSubseq!84 Nil!27380 lt!562349))))

(declare-fun res!829073 () Bool)

(assert (=> start!103882 (=> (not res!829073) (not e!704895))))

(assert (=> start!103882 (= res!829073 (and (bvslt (size!39116 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39116 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39116 a!3892))))))

(assert (=> start!103882 e!704895))

(declare-fun array_inv!29428 (array!79974) Bool)

(assert (=> start!103882 (array_inv!29428 a!3892)))

(assert (=> start!103882 true))

(declare-fun b!1243299 () Bool)

(declare-fun res!829074 () Bool)

(assert (=> b!1243299 (=> (not res!829074) (not e!704895))))

(assert (=> b!1243299 (= res!829074 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27380))))

(declare-fun b!1243300 () Bool)

(declare-fun res!829072 () Bool)

(assert (=> b!1243300 (=> (not res!829072) (not e!704895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243300 (= res!829072 (validKeyInArray!0 (select (arr!38580 a!3892) from!3270)))))

(declare-fun b!1243301 () Bool)

(declare-fun res!829075 () Bool)

(assert (=> b!1243301 (=> (not res!829075) (not e!704893))))

(declare-fun subseq!630 (List!27383 List!27383) Bool)

(assert (=> b!1243301 (= res!829075 (subseq!630 Nil!27380 lt!562349))))

(assert (= (and start!103882 res!829073) b!1243299))

(assert (= (and b!1243299 res!829074) b!1243296))

(assert (= (and b!1243296 res!829071) b!1243300))

(assert (= (and b!1243300 res!829072) b!1243297))

(assert (= (and b!1243297 res!829069) b!1243291))

(assert (= (and b!1243291 res!829076) b!1243294))

(assert (= (and b!1243294 res!829077) b!1243293))

(assert (= (and b!1243293 res!829078) b!1243292))

(assert (= (and b!1243292 res!829068) b!1243295))

(assert (= (and b!1243295 res!829070) b!1243301))

(assert (= (and b!1243301 res!829075) b!1243298))

(declare-fun m!1145891 () Bool)

(assert (=> b!1243291 m!1145891))

(declare-fun m!1145893 () Bool)

(assert (=> b!1243297 m!1145893))

(declare-fun m!1145895 () Bool)

(assert (=> b!1243294 m!1145895))

(declare-fun m!1145897 () Bool)

(assert (=> b!1243301 m!1145897))

(declare-fun m!1145899 () Bool)

(assert (=> start!103882 m!1145899))

(declare-fun m!1145901 () Bool)

(assert (=> b!1243299 m!1145901))

(declare-fun m!1145903 () Bool)

(assert (=> b!1243293 m!1145903))

(declare-fun m!1145905 () Bool)

(assert (=> b!1243298 m!1145905))

(declare-fun m!1145907 () Bool)

(assert (=> b!1243298 m!1145907))

(declare-fun m!1145909 () Bool)

(assert (=> b!1243292 m!1145909))

(declare-fun m!1145911 () Bool)

(assert (=> b!1243295 m!1145911))

(assert (=> b!1243300 m!1145893))

(assert (=> b!1243300 m!1145893))

(declare-fun m!1145913 () Bool)

(assert (=> b!1243300 m!1145913))

(check-sat (not b!1243291) (not b!1243294) (not b!1243295) (not b!1243298) (not b!1243301) (not b!1243293) (not b!1243292) (not b!1243299) (not start!103882) (not b!1243300))
(check-sat)
