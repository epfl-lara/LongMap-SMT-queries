; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60022 () Bool)

(assert start!60022)

(declare-fun b!667403 () Bool)

(declare-fun res!434635 () Bool)

(declare-fun e!382002 () Bool)

(assert (=> b!667403 (=> res!434635 e!382002)))

(declare-datatypes ((List!12768 0))(
  ( (Nil!12765) (Cons!12764 (h!13809 (_ BitVec 64)) (t!18996 List!12768)) )
))
(declare-fun lt!310810 () List!12768)

(declare-fun contains!3345 (List!12768 (_ BitVec 64)) Bool)

(assert (=> b!667403 (= res!434635 (contains!3345 lt!310810 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667405 () Bool)

(declare-fun res!434621 () Bool)

(declare-fun e!382009 () Bool)

(assert (=> b!667405 (=> (not res!434621) (not e!382009))))

(declare-fun acc!681 () List!12768)

(assert (=> b!667405 (= res!434621 (not (contains!3345 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667406 () Bool)

(assert (=> b!667406 (= e!382002 true)))

(declare-fun lt!310812 () Bool)

(declare-fun e!382004 () Bool)

(assert (=> b!667406 (= lt!310812 e!382004)))

(declare-fun res!434633 () Bool)

(assert (=> b!667406 (=> res!434633 e!382004)))

(declare-fun e!382010 () Bool)

(assert (=> b!667406 (= res!434633 e!382010)))

(declare-fun res!434638 () Bool)

(assert (=> b!667406 (=> (not res!434638) (not e!382010))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667406 (= res!434638 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667407 () Bool)

(declare-fun res!434636 () Bool)

(assert (=> b!667407 (=> (not res!434636) (not e!382009))))

(declare-datatypes ((array!39069 0))(
  ( (array!39070 (arr!18727 (Array (_ BitVec 32) (_ BitVec 64))) (size!19091 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39069)

(assert (=> b!667407 (= res!434636 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19091 a!3626))))))

(declare-fun b!667408 () Bool)

(declare-fun res!434627 () Bool)

(assert (=> b!667408 (=> (not res!434627) (not e!382009))))

(declare-fun arrayNoDuplicates!0 (array!39069 (_ BitVec 32) List!12768) Bool)

(assert (=> b!667408 (= res!434627 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667409 () Bool)

(declare-fun res!434632 () Bool)

(assert (=> b!667409 (=> res!434632 e!382002)))

(declare-fun noDuplicate!592 (List!12768) Bool)

(assert (=> b!667409 (= res!434632 (not (noDuplicate!592 lt!310810)))))

(declare-fun b!667410 () Bool)

(declare-fun res!434634 () Bool)

(assert (=> b!667410 (=> (not res!434634) (not e!382009))))

(assert (=> b!667410 (= res!434634 (not (contains!3345 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667411 () Bool)

(declare-fun res!434626 () Bool)

(assert (=> b!667411 (=> (not res!434626) (not e!382009))))

(assert (=> b!667411 (= res!434626 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12765))))

(declare-fun b!667412 () Bool)

(declare-datatypes ((Unit!23360 0))(
  ( (Unit!23361) )
))
(declare-fun e!382006 () Unit!23360)

(declare-fun Unit!23362 () Unit!23360)

(assert (=> b!667412 (= e!382006 Unit!23362)))

(declare-fun lt!310813 () Unit!23360)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39069 (_ BitVec 64) (_ BitVec 32)) Unit!23360)

(assert (=> b!667412 (= lt!310813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!667412 false))

(declare-fun b!667413 () Bool)

(declare-fun e!382003 () Bool)

(assert (=> b!667413 (= e!382003 (contains!3345 acc!681 k0!2843))))

(declare-fun b!667414 () Bool)

(declare-fun res!434624 () Bool)

(assert (=> b!667414 (=> res!434624 e!382002)))

(assert (=> b!667414 (= res!434624 (contains!3345 lt!310810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667415 () Bool)

(declare-fun res!434622 () Bool)

(assert (=> b!667415 (=> (not res!434622) (not e!382009))))

(assert (=> b!667415 (= res!434622 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19091 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667416 () Bool)

(assert (=> b!667416 (= e!382009 (not e!382002))))

(declare-fun res!434631 () Bool)

(assert (=> b!667416 (=> res!434631 e!382002)))

(assert (=> b!667416 (= res!434631 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667416 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310810)))

(declare-fun lt!310808 () Unit!23360)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39069 (_ BitVec 64) (_ BitVec 32) List!12768 List!12768) Unit!23360)

(assert (=> b!667416 (= lt!310808 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310810))))

(declare-fun -!82 (List!12768 (_ BitVec 64)) List!12768)

(assert (=> b!667416 (= (-!82 lt!310810 k0!2843) acc!681)))

(declare-fun $colon$colon!216 (List!12768 (_ BitVec 64)) List!12768)

(assert (=> b!667416 (= lt!310810 ($colon$colon!216 acc!681 k0!2843))))

(declare-fun lt!310805 () Unit!23360)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12768) Unit!23360)

(assert (=> b!667416 (= lt!310805 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!84 (List!12768 List!12768) Bool)

(assert (=> b!667416 (subseq!84 acc!681 acc!681)))

(declare-fun lt!310804 () Unit!23360)

(declare-fun lemmaListSubSeqRefl!0 (List!12768) Unit!23360)

(assert (=> b!667416 (= lt!310804 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667416 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310806 () Unit!23360)

(declare-fun e!382007 () Unit!23360)

(assert (=> b!667416 (= lt!310806 e!382007)))

(declare-fun c!76759 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667416 (= c!76759 (validKeyInArray!0 (select (arr!18727 a!3626) from!3004)))))

(declare-fun lt!310809 () Unit!23360)

(assert (=> b!667416 (= lt!310809 e!382006)))

(declare-fun c!76760 () Bool)

(declare-fun arrayContainsKey!0 (array!39069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667416 (= c!76760 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667416 (arrayContainsKey!0 (array!39070 (store (arr!18727 a!3626) i!1382 k0!2843) (size!19091 a!3626)) k0!2843 from!3004)))

(declare-fun b!667404 () Bool)

(declare-fun res!434639 () Bool)

(assert (=> b!667404 (=> (not res!434639) (not e!382009))))

(assert (=> b!667404 (= res!434639 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!434637 () Bool)

(assert (=> start!60022 (=> (not res!434637) (not e!382009))))

(assert (=> start!60022 (= res!434637 (and (bvslt (size!19091 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19091 a!3626))))))

(assert (=> start!60022 e!382009))

(assert (=> start!60022 true))

(declare-fun array_inv!14523 (array!39069) Bool)

(assert (=> start!60022 (array_inv!14523 a!3626)))

(declare-fun b!667417 () Bool)

(declare-fun res!434620 () Bool)

(assert (=> b!667417 (=> (not res!434620) (not e!382009))))

(assert (=> b!667417 (= res!434620 (noDuplicate!592 acc!681))))

(declare-fun b!667418 () Bool)

(declare-fun e!382011 () Bool)

(assert (=> b!667418 (= e!382011 (not (contains!3345 lt!310810 k0!2843)))))

(declare-fun b!667419 () Bool)

(declare-fun Unit!23363 () Unit!23360)

(assert (=> b!667419 (= e!382006 Unit!23363)))

(declare-fun b!667420 () Bool)

(declare-fun res!434629 () Bool)

(assert (=> b!667420 (=> (not res!434629) (not e!382009))))

(declare-fun e!382001 () Bool)

(assert (=> b!667420 (= res!434629 e!382001)))

(declare-fun res!434623 () Bool)

(assert (=> b!667420 (=> res!434623 e!382001)))

(assert (=> b!667420 (= res!434623 e!382003)))

(declare-fun res!434628 () Bool)

(assert (=> b!667420 (=> (not res!434628) (not e!382003))))

(assert (=> b!667420 (= res!434628 (bvsgt from!3004 i!1382))))

(declare-fun b!667421 () Bool)

(declare-fun e!382008 () Bool)

(assert (=> b!667421 (= e!382001 e!382008)))

(declare-fun res!434625 () Bool)

(assert (=> b!667421 (=> (not res!434625) (not e!382008))))

(assert (=> b!667421 (= res!434625 (bvsle from!3004 i!1382))))

(declare-fun b!667422 () Bool)

(assert (=> b!667422 (= e!382010 (contains!3345 lt!310810 k0!2843))))

(declare-fun b!667423 () Bool)

(assert (=> b!667423 (= e!382008 (not (contains!3345 acc!681 k0!2843)))))

(declare-fun b!667424 () Bool)

(declare-fun res!434630 () Bool)

(assert (=> b!667424 (=> (not res!434630) (not e!382009))))

(assert (=> b!667424 (= res!434630 (validKeyInArray!0 k0!2843))))

(declare-fun b!667425 () Bool)

(declare-fun Unit!23364 () Unit!23360)

(assert (=> b!667425 (= e!382007 Unit!23364)))

(declare-fun b!667426 () Bool)

(assert (=> b!667426 (= e!382004 e!382011)))

(declare-fun res!434619 () Bool)

(assert (=> b!667426 (=> (not res!434619) (not e!382011))))

(assert (=> b!667426 (= res!434619 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667427 () Bool)

(declare-fun lt!310807 () Unit!23360)

(assert (=> b!667427 (= e!382007 lt!310807)))

(declare-fun lt!310811 () Unit!23360)

(assert (=> b!667427 (= lt!310811 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667427 (subseq!84 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39069 List!12768 List!12768 (_ BitVec 32)) Unit!23360)

(assert (=> b!667427 (= lt!310807 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!216 acc!681 (select (arr!18727 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667427 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!60022 res!434637) b!667417))

(assert (= (and b!667417 res!434620) b!667405))

(assert (= (and b!667405 res!434621) b!667410))

(assert (= (and b!667410 res!434634) b!667420))

(assert (= (and b!667420 res!434628) b!667413))

(assert (= (and b!667420 (not res!434623)) b!667421))

(assert (= (and b!667421 res!434625) b!667423))

(assert (= (and b!667420 res!434629) b!667411))

(assert (= (and b!667411 res!434626) b!667408))

(assert (= (and b!667408 res!434627) b!667407))

(assert (= (and b!667407 res!434636) b!667424))

(assert (= (and b!667424 res!434630) b!667404))

(assert (= (and b!667404 res!434639) b!667415))

(assert (= (and b!667415 res!434622) b!667416))

(assert (= (and b!667416 c!76760) b!667412))

(assert (= (and b!667416 (not c!76760)) b!667419))

(assert (= (and b!667416 c!76759) b!667427))

(assert (= (and b!667416 (not c!76759)) b!667425))

(assert (= (and b!667416 (not res!434631)) b!667409))

(assert (= (and b!667409 (not res!434632)) b!667414))

(assert (= (and b!667414 (not res!434624)) b!667403))

(assert (= (and b!667403 (not res!434635)) b!667406))

(assert (= (and b!667406 res!434638) b!667422))

(assert (= (and b!667406 (not res!434633)) b!667426))

(assert (= (and b!667426 res!434619) b!667418))

(declare-fun m!637959 () Bool)

(assert (=> b!667423 m!637959))

(declare-fun m!637961 () Bool)

(assert (=> b!667422 m!637961))

(declare-fun m!637963 () Bool)

(assert (=> b!667404 m!637963))

(declare-fun m!637965 () Bool)

(assert (=> start!60022 m!637965))

(declare-fun m!637967 () Bool)

(assert (=> b!667403 m!637967))

(assert (=> b!667413 m!637959))

(declare-fun m!637969 () Bool)

(assert (=> b!667409 m!637969))

(declare-fun m!637971 () Bool)

(assert (=> b!667405 m!637971))

(declare-fun m!637973 () Bool)

(assert (=> b!667427 m!637973))

(declare-fun m!637975 () Bool)

(assert (=> b!667427 m!637975))

(declare-fun m!637977 () Bool)

(assert (=> b!667427 m!637977))

(declare-fun m!637979 () Bool)

(assert (=> b!667427 m!637979))

(assert (=> b!667427 m!637975))

(assert (=> b!667427 m!637977))

(declare-fun m!637981 () Bool)

(assert (=> b!667427 m!637981))

(declare-fun m!637983 () Bool)

(assert (=> b!667427 m!637983))

(declare-fun m!637985 () Bool)

(assert (=> b!667414 m!637985))

(declare-fun m!637987 () Bool)

(assert (=> b!667417 m!637987))

(declare-fun m!637989 () Bool)

(assert (=> b!667412 m!637989))

(assert (=> b!667418 m!637961))

(declare-fun m!637991 () Bool)

(assert (=> b!667424 m!637991))

(declare-fun m!637993 () Bool)

(assert (=> b!667416 m!637993))

(assert (=> b!667416 m!637973))

(assert (=> b!667416 m!637975))

(declare-fun m!637995 () Bool)

(assert (=> b!667416 m!637995))

(declare-fun m!637997 () Bool)

(assert (=> b!667416 m!637997))

(declare-fun m!637999 () Bool)

(assert (=> b!667416 m!637999))

(declare-fun m!638001 () Bool)

(assert (=> b!667416 m!638001))

(declare-fun m!638003 () Bool)

(assert (=> b!667416 m!638003))

(assert (=> b!667416 m!637981))

(declare-fun m!638005 () Bool)

(assert (=> b!667416 m!638005))

(assert (=> b!667416 m!637975))

(declare-fun m!638007 () Bool)

(assert (=> b!667416 m!638007))

(declare-fun m!638009 () Bool)

(assert (=> b!667416 m!638009))

(assert (=> b!667416 m!637983))

(declare-fun m!638011 () Bool)

(assert (=> b!667411 m!638011))

(declare-fun m!638013 () Bool)

(assert (=> b!667410 m!638013))

(declare-fun m!638015 () Bool)

(assert (=> b!667408 m!638015))

(check-sat (not b!667404) (not b!667422) (not b!667412) (not b!667423) (not b!667403) (not b!667413) (not b!667418) (not b!667410) (not start!60022) (not b!667416) (not b!667427) (not b!667409) (not b!667405) (not b!667424) (not b!667411) (not b!667417) (not b!667408) (not b!667414))
(check-sat)
