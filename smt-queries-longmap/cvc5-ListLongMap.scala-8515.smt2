; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103886 () Bool)

(assert start!103886)

(declare-fun res!829135 () Bool)

(declare-fun e!704911 () Bool)

(assert (=> start!103886 (=> (not res!829135) (not e!704911))))

(declare-datatypes ((array!79978 0))(
  ( (array!79979 (arr!38582 (Array (_ BitVec 32) (_ BitVec 64))) (size!39118 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79978)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103886 (= res!829135 (and (bvslt (size!39118 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39118 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39118 a!3892))))))

(assert (=> start!103886 e!704911))

(declare-fun array_inv!29430 (array!79978) Bool)

(assert (=> start!103886 (array_inv!29430 a!3892)))

(assert (=> start!103886 true))

(declare-fun b!1243357 () Bool)

(declare-fun res!829137 () Bool)

(assert (=> b!1243357 (=> (not res!829137) (not e!704911))))

(declare-datatypes ((List!27385 0))(
  ( (Nil!27382) (Cons!27381 (h!28590 (_ BitVec 64)) (t!40854 List!27385)) )
))
(declare-fun arrayNoDuplicates!0 (array!79978 (_ BitVec 32) List!27385) Bool)

(assert (=> b!1243357 (= res!829137 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27382))))

(declare-fun b!1243358 () Bool)

(declare-fun res!829143 () Bool)

(declare-fun e!704912 () Bool)

(assert (=> b!1243358 (=> (not res!829143) (not e!704912))))

(declare-fun lt!562366 () List!27385)

(declare-fun subseq!632 (List!27385 List!27385) Bool)

(assert (=> b!1243358 (= res!829143 (subseq!632 Nil!27382 lt!562366))))

(declare-fun b!1243359 () Bool)

(declare-fun res!829136 () Bool)

(assert (=> b!1243359 (=> (not res!829136) (not e!704912))))

(declare-fun contains!7406 (List!27385 (_ BitVec 64)) Bool)

(assert (=> b!1243359 (= res!829136 (not (contains!7406 lt!562366 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243360 () Bool)

(declare-fun res!829144 () Bool)

(assert (=> b!1243360 (=> (not res!829144) (not e!704912))))

(declare-fun noDuplicate!1984 (List!27385) Bool)

(assert (=> b!1243360 (= res!829144 (noDuplicate!1984 lt!562366))))

(declare-fun b!1243361 () Bool)

(declare-fun res!829141 () Bool)

(assert (=> b!1243361 (=> (not res!829141) (not e!704912))))

(assert (=> b!1243361 (= res!829141 (not (contains!7406 Nil!27382 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243362 () Bool)

(assert (=> b!1243362 (= e!704912 false)))

(declare-fun lt!562365 () Bool)

(assert (=> b!1243362 (= lt!562365 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562366))))

(declare-datatypes ((Unit!41273 0))(
  ( (Unit!41274) )
))
(declare-fun lt!562367 () Unit!41273)

(declare-fun noDuplicateSubseq!86 (List!27385 List!27385) Unit!41273)

(assert (=> b!1243362 (= lt!562367 (noDuplicateSubseq!86 Nil!27382 lt!562366))))

(declare-fun b!1243363 () Bool)

(declare-fun res!829134 () Bool)

(assert (=> b!1243363 (=> (not res!829134) (not e!704912))))

(assert (=> b!1243363 (= res!829134 (not (contains!7406 Nil!27382 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243364 () Bool)

(declare-fun res!829140 () Bool)

(assert (=> b!1243364 (=> (not res!829140) (not e!704911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243364 (= res!829140 (validKeyInArray!0 (select (arr!38582 a!3892) from!3270)))))

(declare-fun b!1243365 () Bool)

(declare-fun res!829138 () Bool)

(assert (=> b!1243365 (=> (not res!829138) (not e!704912))))

(assert (=> b!1243365 (= res!829138 (not (contains!7406 lt!562366 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243366 () Bool)

(assert (=> b!1243366 (= e!704911 e!704912)))

(declare-fun res!829139 () Bool)

(assert (=> b!1243366 (=> (not res!829139) (not e!704912))))

(assert (=> b!1243366 (= res!829139 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243366 (= lt!562366 (Cons!27381 (select (arr!38582 a!3892) from!3270) Nil!27382))))

(declare-fun b!1243367 () Bool)

(declare-fun res!829142 () Bool)

(assert (=> b!1243367 (=> (not res!829142) (not e!704911))))

(assert (=> b!1243367 (= res!829142 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39118 a!3892)) (not (= newFrom!287 (size!39118 a!3892)))))))

(assert (= (and start!103886 res!829135) b!1243357))

(assert (= (and b!1243357 res!829137) b!1243367))

(assert (= (and b!1243367 res!829142) b!1243364))

(assert (= (and b!1243364 res!829140) b!1243366))

(assert (= (and b!1243366 res!829139) b!1243360))

(assert (= (and b!1243360 res!829144) b!1243359))

(assert (= (and b!1243359 res!829136) b!1243365))

(assert (= (and b!1243365 res!829138) b!1243363))

(assert (= (and b!1243363 res!829134) b!1243361))

(assert (= (and b!1243361 res!829141) b!1243358))

(assert (= (and b!1243358 res!829143) b!1243362))

(declare-fun m!1145939 () Bool)

(assert (=> b!1243363 m!1145939))

(declare-fun m!1145941 () Bool)

(assert (=> b!1243362 m!1145941))

(declare-fun m!1145943 () Bool)

(assert (=> b!1243362 m!1145943))

(declare-fun m!1145945 () Bool)

(assert (=> b!1243357 m!1145945))

(declare-fun m!1145947 () Bool)

(assert (=> b!1243359 m!1145947))

(declare-fun m!1145949 () Bool)

(assert (=> b!1243364 m!1145949))

(assert (=> b!1243364 m!1145949))

(declare-fun m!1145951 () Bool)

(assert (=> b!1243364 m!1145951))

(declare-fun m!1145953 () Bool)

(assert (=> start!103886 m!1145953))

(declare-fun m!1145955 () Bool)

(assert (=> b!1243358 m!1145955))

(declare-fun m!1145957 () Bool)

(assert (=> b!1243365 m!1145957))

(declare-fun m!1145959 () Bool)

(assert (=> b!1243361 m!1145959))

(declare-fun m!1145961 () Bool)

(assert (=> b!1243360 m!1145961))

(assert (=> b!1243366 m!1145949))

(push 1)

