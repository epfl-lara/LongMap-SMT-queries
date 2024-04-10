; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60210 () Bool)

(assert start!60210)

(declare-fun b!673822 () Bool)

(declare-fun res!440350 () Bool)

(declare-fun e!384734 () Bool)

(assert (=> b!673822 (=> (not res!440350) (not e!384734))))

(declare-datatypes ((List!12862 0))(
  ( (Nil!12859) (Cons!12858 (h!13903 (_ BitVec 64)) (t!19090 List!12862)) )
))
(declare-fun acc!681 () List!12862)

(declare-fun contains!3439 (List!12862 (_ BitVec 64)) Bool)

(assert (=> b!673822 (= res!440350 (not (contains!3439 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673823 () Bool)

(declare-fun e!384729 () Bool)

(declare-fun e!384731 () Bool)

(assert (=> b!673823 (= e!384729 e!384731)))

(declare-fun res!440347 () Bool)

(assert (=> b!673823 (=> (not res!440347) (not e!384731))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!673823 (= res!440347 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39257 0))(
  ( (array!39258 (arr!18821 (Array (_ BitVec 32) (_ BitVec 64))) (size!19185 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39257)

(declare-fun lt!312526 () List!12862)

(declare-fun $colon$colon!289 (List!12862 (_ BitVec 64)) List!12862)

(assert (=> b!673823 (= lt!312526 ($colon$colon!289 acc!681 (select (arr!18821 a!3626) from!3004)))))

(declare-fun b!673824 () Bool)

(declare-datatypes ((Unit!23696 0))(
  ( (Unit!23697) )
))
(declare-fun e!384726 () Unit!23696)

(declare-fun Unit!23698 () Unit!23696)

(assert (=> b!673824 (= e!384726 Unit!23698)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673824 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312525 () Unit!23696)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39257 (_ BitVec 64) (_ BitVec 32)) Unit!23696)

(assert (=> b!673824 (= lt!312525 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673824 false))

(declare-fun b!673825 () Bool)

(declare-fun res!440361 () Bool)

(assert (=> b!673825 (=> (not res!440361) (not e!384734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673825 (= res!440361 (validKeyInArray!0 (select (arr!18821 a!3626) from!3004)))))

(declare-fun b!673826 () Bool)

(declare-fun e!384730 () Bool)

(assert (=> b!673826 (= e!384730 (contains!3439 acc!681 k!2843))))

(declare-fun b!673827 () Bool)

(declare-fun res!440342 () Bool)

(assert (=> b!673827 (=> (not res!440342) (not e!384734))))

(assert (=> b!673827 (= res!440342 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673828 () Bool)

(declare-fun e!384725 () Bool)

(assert (=> b!673828 (= e!384725 (not (contains!3439 acc!681 k!2843)))))

(declare-fun b!673829 () Bool)

(declare-fun e!384733 () Bool)

(declare-fun e!384732 () Bool)

(assert (=> b!673829 (= e!384733 e!384732)))

(declare-fun res!440348 () Bool)

(assert (=> b!673829 (=> (not res!440348) (not e!384732))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673829 (= res!440348 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673830 () Bool)

(assert (=> b!673830 (= e!384731 false)))

(declare-fun lt!312523 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39257 (_ BitVec 32) List!12862) Bool)

(assert (=> b!673830 (= lt!312523 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312526))))

(declare-fun b!673831 () Bool)

(declare-fun res!440357 () Bool)

(assert (=> b!673831 (=> (not res!440357) (not e!384734))))

(assert (=> b!673831 (= res!440357 (validKeyInArray!0 k!2843))))

(declare-fun b!673832 () Bool)

(declare-fun e!384727 () Bool)

(assert (=> b!673832 (= e!384727 (contains!3439 lt!312526 k!2843))))

(declare-fun b!673833 () Bool)

(assert (=> b!673833 (= e!384732 (not (contains!3439 lt!312526 k!2843)))))

(declare-fun b!673834 () Bool)

(declare-fun res!440359 () Bool)

(assert (=> b!673834 (=> (not res!440359) (not e!384734))))

(declare-fun e!384735 () Bool)

(assert (=> b!673834 (= res!440359 e!384735)))

(declare-fun res!440352 () Bool)

(assert (=> b!673834 (=> res!440352 e!384735)))

(assert (=> b!673834 (= res!440352 e!384730)))

(declare-fun res!440355 () Bool)

(assert (=> b!673834 (=> (not res!440355) (not e!384730))))

(assert (=> b!673834 (= res!440355 (bvsgt from!3004 i!1382))))

(declare-fun b!673835 () Bool)

(declare-fun res!440346 () Bool)

(assert (=> b!673835 (=> (not res!440346) (not e!384734))))

(assert (=> b!673835 (= res!440346 (not (contains!3439 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673836 () Bool)

(declare-fun res!440343 () Bool)

(assert (=> b!673836 (=> (not res!440343) (not e!384731))))

(assert (=> b!673836 (= res!440343 (not (contains!3439 lt!312526 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673837 () Bool)

(declare-fun res!440358 () Bool)

(assert (=> b!673837 (=> (not res!440358) (not e!384734))))

(assert (=> b!673837 (= res!440358 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19185 a!3626))))))

(declare-fun b!673838 () Bool)

(assert (=> b!673838 (= e!384734 e!384729)))

(declare-fun res!440360 () Bool)

(assert (=> b!673838 (=> (not res!440360) (not e!384729))))

(assert (=> b!673838 (= res!440360 (not (= (select (arr!18821 a!3626) from!3004) k!2843)))))

(declare-fun lt!312524 () Unit!23696)

(assert (=> b!673838 (= lt!312524 e!384726)))

(declare-fun c!77108 () Bool)

(assert (=> b!673838 (= c!77108 (= (select (arr!18821 a!3626) from!3004) k!2843))))

(declare-fun b!673839 () Bool)

(declare-fun Unit!23699 () Unit!23696)

(assert (=> b!673839 (= e!384726 Unit!23699)))

(declare-fun b!673840 () Bool)

(declare-fun res!440353 () Bool)

(assert (=> b!673840 (=> (not res!440353) (not e!384734))))

(assert (=> b!673840 (= res!440353 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673841 () Bool)

(declare-fun res!440351 () Bool)

(assert (=> b!673841 (=> (not res!440351) (not e!384734))))

(declare-fun noDuplicate!686 (List!12862) Bool)

(assert (=> b!673841 (= res!440351 (noDuplicate!686 acc!681))))

(declare-fun b!673842 () Bool)

(declare-fun res!440341 () Bool)

(assert (=> b!673842 (=> (not res!440341) (not e!384731))))

(assert (=> b!673842 (= res!440341 (not (contains!3439 lt!312526 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673843 () Bool)

(declare-fun res!440349 () Bool)

(assert (=> b!673843 (=> (not res!440349) (not e!384734))))

(assert (=> b!673843 (= res!440349 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19185 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673845 () Bool)

(declare-fun res!440340 () Bool)

(assert (=> b!673845 (=> (not res!440340) (not e!384731))))

(assert (=> b!673845 (= res!440340 e!384733)))

(declare-fun res!440344 () Bool)

(assert (=> b!673845 (=> res!440344 e!384733)))

(assert (=> b!673845 (= res!440344 e!384727)))

(declare-fun res!440356 () Bool)

(assert (=> b!673845 (=> (not res!440356) (not e!384727))))

(assert (=> b!673845 (= res!440356 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!440363 () Bool)

(assert (=> start!60210 (=> (not res!440363) (not e!384734))))

(assert (=> start!60210 (= res!440363 (and (bvslt (size!19185 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19185 a!3626))))))

(assert (=> start!60210 e!384734))

(assert (=> start!60210 true))

(declare-fun array_inv!14617 (array!39257) Bool)

(assert (=> start!60210 (array_inv!14617 a!3626)))

(declare-fun b!673844 () Bool)

(assert (=> b!673844 (= e!384735 e!384725)))

(declare-fun res!440362 () Bool)

(assert (=> b!673844 (=> (not res!440362) (not e!384725))))

(assert (=> b!673844 (= res!440362 (bvsle from!3004 i!1382))))

(declare-fun b!673846 () Bool)

(declare-fun res!440345 () Bool)

(assert (=> b!673846 (=> (not res!440345) (not e!384731))))

(assert (=> b!673846 (= res!440345 (noDuplicate!686 lt!312526))))

(declare-fun b!673847 () Bool)

(declare-fun res!440354 () Bool)

(assert (=> b!673847 (=> (not res!440354) (not e!384734))))

(assert (=> b!673847 (= res!440354 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12859))))

(assert (= (and start!60210 res!440363) b!673841))

(assert (= (and b!673841 res!440351) b!673835))

(assert (= (and b!673835 res!440346) b!673822))

(assert (= (and b!673822 res!440350) b!673834))

(assert (= (and b!673834 res!440355) b!673826))

(assert (= (and b!673834 (not res!440352)) b!673844))

(assert (= (and b!673844 res!440362) b!673828))

(assert (= (and b!673834 res!440359) b!673847))

(assert (= (and b!673847 res!440354) b!673840))

(assert (= (and b!673840 res!440353) b!673837))

(assert (= (and b!673837 res!440358) b!673831))

(assert (= (and b!673831 res!440357) b!673827))

(assert (= (and b!673827 res!440342) b!673843))

(assert (= (and b!673843 res!440349) b!673825))

(assert (= (and b!673825 res!440361) b!673838))

(assert (= (and b!673838 c!77108) b!673824))

(assert (= (and b!673838 (not c!77108)) b!673839))

(assert (= (and b!673838 res!440360) b!673823))

(assert (= (and b!673823 res!440347) b!673846))

(assert (= (and b!673846 res!440345) b!673842))

(assert (= (and b!673842 res!440341) b!673836))

(assert (= (and b!673836 res!440343) b!673845))

(assert (= (and b!673845 res!440356) b!673832))

(assert (= (and b!673845 (not res!440344)) b!673829))

(assert (= (and b!673829 res!440348) b!673833))

(assert (= (and b!673845 res!440340) b!673830))

(declare-fun m!642075 () Bool)

(assert (=> b!673833 m!642075))

(declare-fun m!642077 () Bool)

(assert (=> b!673842 m!642077))

(declare-fun m!642079 () Bool)

(assert (=> b!673846 m!642079))

(declare-fun m!642081 () Bool)

(assert (=> b!673836 m!642081))

(assert (=> b!673832 m!642075))

(declare-fun m!642083 () Bool)

(assert (=> b!673823 m!642083))

(assert (=> b!673823 m!642083))

(declare-fun m!642085 () Bool)

(assert (=> b!673823 m!642085))

(declare-fun m!642087 () Bool)

(assert (=> b!673824 m!642087))

(declare-fun m!642089 () Bool)

(assert (=> b!673824 m!642089))

(declare-fun m!642091 () Bool)

(assert (=> b!673840 m!642091))

(declare-fun m!642093 () Bool)

(assert (=> b!673847 m!642093))

(declare-fun m!642095 () Bool)

(assert (=> b!673828 m!642095))

(assert (=> b!673838 m!642083))

(declare-fun m!642097 () Bool)

(assert (=> b!673827 m!642097))

(declare-fun m!642099 () Bool)

(assert (=> b!673835 m!642099))

(assert (=> b!673825 m!642083))

(assert (=> b!673825 m!642083))

(declare-fun m!642101 () Bool)

(assert (=> b!673825 m!642101))

(declare-fun m!642103 () Bool)

(assert (=> b!673822 m!642103))

(declare-fun m!642105 () Bool)

(assert (=> b!673841 m!642105))

(declare-fun m!642107 () Bool)

(assert (=> b!673831 m!642107))

(declare-fun m!642109 () Bool)

(assert (=> b!673830 m!642109))

(declare-fun m!642111 () Bool)

(assert (=> start!60210 m!642111))

(assert (=> b!673826 m!642095))

(push 1)

