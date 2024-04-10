; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103286 () Bool)

(assert start!103286)

(declare-fun b!1239490 () Bool)

(declare-datatypes ((Unit!41186 0))(
  ( (Unit!41187) )
))
(declare-fun e!702432 () Unit!41186)

(declare-fun Unit!41188 () Unit!41186)

(assert (=> b!1239490 (= e!702432 Unit!41188)))

(declare-fun b!1239491 () Bool)

(declare-fun res!826926 () Bool)

(declare-fun e!702429 () Bool)

(assert (=> b!1239491 (=> (not res!826926) (not e!702429))))

(declare-datatypes ((array!79870 0))(
  ( (array!79871 (arr!38535 (Array (_ BitVec 32) (_ BitVec 64))) (size!39071 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79870)

(declare-datatypes ((List!27308 0))(
  ( (Nil!27305) (Cons!27304 (h!28513 (_ BitVec 64)) (t!40771 List!27308)) )
))
(declare-fun acc!846 () List!27308)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79870 (_ BitVec 32) List!27308) Bool)

(assert (=> b!1239491 (= res!826926 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun res!826924 () Bool)

(declare-fun e!702431 () Bool)

(assert (=> start!103286 (=> (not res!826924) (not e!702431))))

(assert (=> start!103286 (= res!826924 (and (bvslt (size!39071 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39071 a!3835))))))

(assert (=> start!103286 e!702431))

(declare-fun array_inv!29383 (array!79870) Bool)

(assert (=> start!103286 (array_inv!29383 a!3835)))

(assert (=> start!103286 true))

(declare-fun b!1239492 () Bool)

(declare-fun res!826927 () Bool)

(assert (=> b!1239492 (=> (not res!826927) (not e!702431))))

(declare-fun noDuplicate!1967 (List!27308) Bool)

(assert (=> b!1239492 (= res!826927 (noDuplicate!1967 acc!846))))

(declare-fun b!1239493 () Bool)

(declare-fun lt!561735 () Unit!41186)

(assert (=> b!1239493 (= e!702432 lt!561735)))

(declare-fun lt!561733 () List!27308)

(assert (=> b!1239493 (= lt!561733 (Cons!27304 (select (arr!38535 a!3835) from!3213) acc!846))))

(declare-fun lt!561734 () Unit!41186)

(declare-fun lemmaListSubSeqRefl!0 (List!27308) Unit!41186)

(assert (=> b!1239493 (= lt!561734 (lemmaListSubSeqRefl!0 lt!561733))))

(declare-fun subseq!624 (List!27308 List!27308) Bool)

(assert (=> b!1239493 (subseq!624 lt!561733 lt!561733)))

(declare-fun lt!561736 () Unit!41186)

(declare-fun subseqTail!111 (List!27308 List!27308) Unit!41186)

(assert (=> b!1239493 (= lt!561736 (subseqTail!111 lt!561733 lt!561733))))

(assert (=> b!1239493 (subseq!624 acc!846 lt!561733)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79870 List!27308 List!27308 (_ BitVec 32)) Unit!41186)

(assert (=> b!1239493 (= lt!561735 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561733 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1239493 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239494 () Bool)

(declare-fun res!826930 () Bool)

(assert (=> b!1239494 (=> (not res!826930) (not e!702431))))

(assert (=> b!1239494 (= res!826930 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239495 () Bool)

(declare-fun res!826925 () Bool)

(assert (=> b!1239495 (=> (not res!826925) (not e!702431))))

(assert (=> b!1239495 (= res!826925 (not (= from!3213 (bvsub (size!39071 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239496 () Bool)

(declare-fun res!826928 () Bool)

(assert (=> b!1239496 (=> (not res!826928) (not e!702431))))

(declare-fun contains!7370 (List!27308 (_ BitVec 64)) Bool)

(assert (=> b!1239496 (= res!826928 (not (contains!7370 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239497 () Bool)

(declare-fun res!826929 () Bool)

(assert (=> b!1239497 (=> (not res!826929) (not e!702431))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1239497 (= res!826929 (contains!7370 acc!846 k0!2925))))

(declare-fun b!1239498 () Bool)

(assert (=> b!1239498 (= e!702429 (bvsge (bvsub (size!39071 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) (bvsub (size!39071 a!3835) from!3213)))))

(declare-fun b!1239499 () Bool)

(assert (=> b!1239499 (= e!702431 e!702429)))

(declare-fun res!826923 () Bool)

(assert (=> b!1239499 (=> (not res!826923) (not e!702429))))

(assert (=> b!1239499 (= res!826923 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39071 a!3835))))))

(declare-fun lt!561737 () Unit!41186)

(assert (=> b!1239499 (= lt!561737 e!702432)))

(declare-fun c!121144 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239499 (= c!121144 (validKeyInArray!0 (select (arr!38535 a!3835) from!3213)))))

(declare-fun b!1239500 () Bool)

(declare-fun res!826922 () Bool)

(assert (=> b!1239500 (=> (not res!826922) (not e!702431))))

(assert (=> b!1239500 (= res!826922 (not (contains!7370 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103286 res!826924) b!1239492))

(assert (= (and b!1239492 res!826927) b!1239496))

(assert (= (and b!1239496 res!826928) b!1239500))

(assert (= (and b!1239500 res!826922) b!1239494))

(assert (= (and b!1239494 res!826930) b!1239497))

(assert (= (and b!1239497 res!826929) b!1239495))

(assert (= (and b!1239495 res!826925) b!1239499))

(assert (= (and b!1239499 c!121144) b!1239493))

(assert (= (and b!1239499 (not c!121144)) b!1239490))

(assert (= (and b!1239499 res!826923) b!1239491))

(assert (= (and b!1239491 res!826926) b!1239498))

(declare-fun m!1142927 () Bool)

(assert (=> b!1239494 m!1142927))

(declare-fun m!1142929 () Bool)

(assert (=> start!103286 m!1142929))

(declare-fun m!1142931 () Bool)

(assert (=> b!1239500 m!1142931))

(declare-fun m!1142933 () Bool)

(assert (=> b!1239496 m!1142933))

(declare-fun m!1142935 () Bool)

(assert (=> b!1239492 m!1142935))

(declare-fun m!1142937 () Bool)

(assert (=> b!1239493 m!1142937))

(declare-fun m!1142939 () Bool)

(assert (=> b!1239493 m!1142939))

(declare-fun m!1142941 () Bool)

(assert (=> b!1239493 m!1142941))

(declare-fun m!1142943 () Bool)

(assert (=> b!1239493 m!1142943))

(declare-fun m!1142945 () Bool)

(assert (=> b!1239493 m!1142945))

(declare-fun m!1142947 () Bool)

(assert (=> b!1239493 m!1142947))

(declare-fun m!1142949 () Bool)

(assert (=> b!1239493 m!1142949))

(assert (=> b!1239499 m!1142949))

(assert (=> b!1239499 m!1142949))

(declare-fun m!1142951 () Bool)

(assert (=> b!1239499 m!1142951))

(assert (=> b!1239491 m!1142945))

(declare-fun m!1142953 () Bool)

(assert (=> b!1239497 m!1142953))

(check-sat (not b!1239493) (not b!1239491) (not b!1239500) (not b!1239497) (not b!1239496) (not start!103286) (not b!1239492) (not b!1239499) (not b!1239494))
(check-sat)
