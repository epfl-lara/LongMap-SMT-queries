; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103884 () Bool)

(assert start!103884)

(declare-fun b!1243324 () Bool)

(declare-fun res!829109 () Bool)

(declare-fun e!704902 () Bool)

(assert (=> b!1243324 (=> (not res!829109) (not e!704902))))

(declare-datatypes ((List!27384 0))(
  ( (Nil!27381) (Cons!27380 (h!28589 (_ BitVec 64)) (t!40853 List!27384)) )
))
(declare-fun contains!7405 (List!27384 (_ BitVec 64)) Bool)

(assert (=> b!1243324 (= res!829109 (not (contains!7405 Nil!27381 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243325 () Bool)

(declare-fun res!829101 () Bool)

(assert (=> b!1243325 (=> (not res!829101) (not e!704902))))

(declare-fun lt!562357 () List!27384)

(assert (=> b!1243325 (= res!829101 (not (contains!7405 lt!562357 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243326 () Bool)

(declare-fun res!829110 () Bool)

(declare-fun e!704903 () Bool)

(assert (=> b!1243326 (=> (not res!829110) (not e!704903))))

(declare-datatypes ((array!79976 0))(
  ( (array!79977 (arr!38581 (Array (_ BitVec 32) (_ BitVec 64))) (size!39117 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79976)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243326 (= res!829110 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39117 a!3892)) (not (= newFrom!287 (size!39117 a!3892)))))))

(declare-fun b!1243327 () Bool)

(declare-fun res!829104 () Bool)

(assert (=> b!1243327 (=> (not res!829104) (not e!704903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243327 (= res!829104 (validKeyInArray!0 (select (arr!38581 a!3892) from!3270)))))

(declare-fun b!1243328 () Bool)

(assert (=> b!1243328 (= e!704903 e!704902)))

(declare-fun res!829102 () Bool)

(assert (=> b!1243328 (=> (not res!829102) (not e!704902))))

(assert (=> b!1243328 (= res!829102 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243328 (= lt!562357 (Cons!27380 (select (arr!38581 a!3892) from!3270) Nil!27381))))

(declare-fun b!1243329 () Bool)

(declare-fun res!829106 () Bool)

(assert (=> b!1243329 (=> (not res!829106) (not e!704902))))

(declare-fun subseq!631 (List!27384 List!27384) Bool)

(assert (=> b!1243329 (= res!829106 (subseq!631 Nil!27381 lt!562357))))

(declare-fun b!1243330 () Bool)

(declare-fun res!829111 () Bool)

(assert (=> b!1243330 (=> (not res!829111) (not e!704902))))

(assert (=> b!1243330 (= res!829111 (not (contains!7405 lt!562357 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243331 () Bool)

(assert (=> b!1243331 (= e!704902 false)))

(declare-fun lt!562358 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79976 (_ BitVec 32) List!27384) Bool)

(assert (=> b!1243331 (= lt!562358 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562357))))

(declare-datatypes ((Unit!41271 0))(
  ( (Unit!41272) )
))
(declare-fun lt!562356 () Unit!41271)

(declare-fun noDuplicateSubseq!85 (List!27384 List!27384) Unit!41271)

(assert (=> b!1243331 (= lt!562356 (noDuplicateSubseq!85 Nil!27381 lt!562357))))

(declare-fun b!1243332 () Bool)

(declare-fun res!829105 () Bool)

(assert (=> b!1243332 (=> (not res!829105) (not e!704902))))

(assert (=> b!1243332 (= res!829105 (not (contains!7405 Nil!27381 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829107 () Bool)

(assert (=> start!103884 (=> (not res!829107) (not e!704903))))

(assert (=> start!103884 (= res!829107 (and (bvslt (size!39117 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39117 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39117 a!3892))))))

(assert (=> start!103884 e!704903))

(declare-fun array_inv!29429 (array!79976) Bool)

(assert (=> start!103884 (array_inv!29429 a!3892)))

(assert (=> start!103884 true))

(declare-fun b!1243333 () Bool)

(declare-fun res!829103 () Bool)

(assert (=> b!1243333 (=> (not res!829103) (not e!704903))))

(assert (=> b!1243333 (= res!829103 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27381))))

(declare-fun b!1243334 () Bool)

(declare-fun res!829108 () Bool)

(assert (=> b!1243334 (=> (not res!829108) (not e!704902))))

(declare-fun noDuplicate!1983 (List!27384) Bool)

(assert (=> b!1243334 (= res!829108 (noDuplicate!1983 lt!562357))))

(assert (= (and start!103884 res!829107) b!1243333))

(assert (= (and b!1243333 res!829103) b!1243326))

(assert (= (and b!1243326 res!829110) b!1243327))

(assert (= (and b!1243327 res!829104) b!1243328))

(assert (= (and b!1243328 res!829102) b!1243334))

(assert (= (and b!1243334 res!829108) b!1243330))

(assert (= (and b!1243330 res!829111) b!1243325))

(assert (= (and b!1243325 res!829101) b!1243324))

(assert (= (and b!1243324 res!829109) b!1243332))

(assert (= (and b!1243332 res!829105) b!1243329))

(assert (= (and b!1243329 res!829106) b!1243331))

(declare-fun m!1145915 () Bool)

(assert (=> b!1243332 m!1145915))

(declare-fun m!1145917 () Bool)

(assert (=> b!1243328 m!1145917))

(declare-fun m!1145919 () Bool)

(assert (=> b!1243325 m!1145919))

(assert (=> b!1243327 m!1145917))

(assert (=> b!1243327 m!1145917))

(declare-fun m!1145921 () Bool)

(assert (=> b!1243327 m!1145921))

(declare-fun m!1145923 () Bool)

(assert (=> b!1243331 m!1145923))

(declare-fun m!1145925 () Bool)

(assert (=> b!1243331 m!1145925))

(declare-fun m!1145927 () Bool)

(assert (=> b!1243334 m!1145927))

(declare-fun m!1145929 () Bool)

(assert (=> b!1243329 m!1145929))

(declare-fun m!1145931 () Bool)

(assert (=> start!103884 m!1145931))

(declare-fun m!1145933 () Bool)

(assert (=> b!1243330 m!1145933))

(declare-fun m!1145935 () Bool)

(assert (=> b!1243333 m!1145935))

(declare-fun m!1145937 () Bool)

(assert (=> b!1243324 m!1145937))

(push 1)

(assert (not b!1243325))

(assert (not b!1243327))

(assert (not b!1243331))

(assert (not b!1243334))

(assert (not b!1243324))

(assert (not start!103884))

(assert (not b!1243330))

(assert (not b!1243329))

(assert (not b!1243332))

