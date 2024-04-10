; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103880 () Bool)

(assert start!103880)

(declare-fun b!1243258 () Bool)

(declare-fun res!829038 () Bool)

(declare-fun e!704885 () Bool)

(assert (=> b!1243258 (=> (not res!829038) (not e!704885))))

(declare-datatypes ((List!27382 0))(
  ( (Nil!27379) (Cons!27378 (h!28587 (_ BitVec 64)) (t!40851 List!27382)) )
))
(declare-fun contains!7403 (List!27382 (_ BitVec 64)) Bool)

(assert (=> b!1243258 (= res!829038 (not (contains!7403 Nil!27379 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243259 () Bool)

(declare-fun e!704886 () Bool)

(assert (=> b!1243259 (= e!704886 e!704885)))

(declare-fun res!829039 () Bool)

(assert (=> b!1243259 (=> (not res!829039) (not e!704885))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243259 (= res!829039 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-fun lt!562338 () List!27382)

(declare-datatypes ((array!79972 0))(
  ( (array!79973 (arr!38579 (Array (_ BitVec 32) (_ BitVec 64))) (size!39115 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79972)

(assert (=> b!1243259 (= lt!562338 (Cons!27378 (select (arr!38579 a!3892) from!3270) Nil!27379))))

(declare-fun b!1243260 () Bool)

(declare-fun res!829040 () Bool)

(assert (=> b!1243260 (=> (not res!829040) (not e!704886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243260 (= res!829040 (validKeyInArray!0 (select (arr!38579 a!3892) from!3270)))))

(declare-fun b!1243262 () Bool)

(declare-fun res!829043 () Bool)

(assert (=> b!1243262 (=> (not res!829043) (not e!704885))))

(declare-fun noDuplicate!1981 (List!27382) Bool)

(assert (=> b!1243262 (= res!829043 (noDuplicate!1981 lt!562338))))

(declare-fun b!1243263 () Bool)

(declare-fun res!829042 () Bool)

(assert (=> b!1243263 (=> (not res!829042) (not e!704886))))

(declare-fun arrayNoDuplicates!0 (array!79972 (_ BitVec 32) List!27382) Bool)

(assert (=> b!1243263 (= res!829042 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27379))))

(declare-fun b!1243264 () Bool)

(declare-fun res!829044 () Bool)

(assert (=> b!1243264 (=> (not res!829044) (not e!704886))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243264 (= res!829044 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39115 a!3892)) (not (= newFrom!287 (size!39115 a!3892)))))))

(declare-fun res!829045 () Bool)

(assert (=> start!103880 (=> (not res!829045) (not e!704886))))

(assert (=> start!103880 (= res!829045 (and (bvslt (size!39115 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39115 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39115 a!3892))))))

(assert (=> start!103880 e!704886))

(declare-fun array_inv!29427 (array!79972) Bool)

(assert (=> start!103880 (array_inv!29427 a!3892)))

(assert (=> start!103880 true))

(declare-fun b!1243261 () Bool)

(declare-fun res!829035 () Bool)

(assert (=> b!1243261 (=> (not res!829035) (not e!704885))))

(assert (=> b!1243261 (= res!829035 (not (contains!7403 lt!562338 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243265 () Bool)

(assert (=> b!1243265 (= e!704885 false)))

(declare-fun lt!562339 () Bool)

(assert (=> b!1243265 (= lt!562339 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562338))))

(declare-datatypes ((Unit!41267 0))(
  ( (Unit!41268) )
))
(declare-fun lt!562340 () Unit!41267)

(declare-fun noDuplicateSubseq!83 (List!27382 List!27382) Unit!41267)

(assert (=> b!1243265 (= lt!562340 (noDuplicateSubseq!83 Nil!27379 lt!562338))))

(declare-fun b!1243266 () Bool)

(declare-fun res!829036 () Bool)

(assert (=> b!1243266 (=> (not res!829036) (not e!704885))))

(assert (=> b!1243266 (= res!829036 (not (contains!7403 lt!562338 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243267 () Bool)

(declare-fun res!829037 () Bool)

(assert (=> b!1243267 (=> (not res!829037) (not e!704885))))

(assert (=> b!1243267 (= res!829037 (not (contains!7403 Nil!27379 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243268 () Bool)

(declare-fun res!829041 () Bool)

(assert (=> b!1243268 (=> (not res!829041) (not e!704885))))

(declare-fun subseq!629 (List!27382 List!27382) Bool)

(assert (=> b!1243268 (= res!829041 (subseq!629 Nil!27379 lt!562338))))

(assert (= (and start!103880 res!829045) b!1243263))

(assert (= (and b!1243263 res!829042) b!1243264))

(assert (= (and b!1243264 res!829044) b!1243260))

(assert (= (and b!1243260 res!829040) b!1243259))

(assert (= (and b!1243259 res!829039) b!1243262))

(assert (= (and b!1243262 res!829043) b!1243261))

(assert (= (and b!1243261 res!829035) b!1243266))

(assert (= (and b!1243266 res!829036) b!1243258))

(assert (= (and b!1243258 res!829038) b!1243267))

(assert (= (and b!1243267 res!829037) b!1243268))

(assert (= (and b!1243268 res!829041) b!1243265))

(declare-fun m!1145867 () Bool)

(assert (=> b!1243258 m!1145867))

(declare-fun m!1145869 () Bool)

(assert (=> b!1243262 m!1145869))

(declare-fun m!1145871 () Bool)

(assert (=> b!1243260 m!1145871))

(assert (=> b!1243260 m!1145871))

(declare-fun m!1145873 () Bool)

(assert (=> b!1243260 m!1145873))

(assert (=> b!1243259 m!1145871))

(declare-fun m!1145875 () Bool)

(assert (=> start!103880 m!1145875))

(declare-fun m!1145877 () Bool)

(assert (=> b!1243261 m!1145877))

(declare-fun m!1145879 () Bool)

(assert (=> b!1243268 m!1145879))

(declare-fun m!1145881 () Bool)

(assert (=> b!1243265 m!1145881))

(declare-fun m!1145883 () Bool)

(assert (=> b!1243265 m!1145883))

(declare-fun m!1145885 () Bool)

(assert (=> b!1243267 m!1145885))

(declare-fun m!1145887 () Bool)

(assert (=> b!1243263 m!1145887))

(declare-fun m!1145889 () Bool)

(assert (=> b!1243266 m!1145889))

(push 1)

