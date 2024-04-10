; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60190 () Bool)

(assert start!60190)

(declare-fun b!673042 () Bool)

(declare-fun e!384404 () Bool)

(declare-datatypes ((List!12852 0))(
  ( (Nil!12849) (Cons!12848 (h!13893 (_ BitVec 64)) (t!19080 List!12852)) )
))
(declare-fun lt!312405 () List!12852)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3429 (List!12852 (_ BitVec 64)) Bool)

(assert (=> b!673042 (= e!384404 (contains!3429 lt!312405 k0!2843))))

(declare-fun b!673043 () Bool)

(declare-fun res!439638 () Bool)

(declare-fun e!384399 () Bool)

(assert (=> b!673043 (=> (not res!439638) (not e!384399))))

(assert (=> b!673043 (= res!439638 (not (contains!3429 lt!312405 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673044 () Bool)

(declare-datatypes ((Unit!23656 0))(
  ( (Unit!23657) )
))
(declare-fun e!384396 () Unit!23656)

(declare-fun Unit!23658 () Unit!23656)

(assert (=> b!673044 (= e!384396 Unit!23658)))

(declare-datatypes ((array!39237 0))(
  ( (array!39238 (arr!18811 (Array (_ BitVec 32) (_ BitVec 64))) (size!19175 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39237)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673044 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312404 () Unit!23656)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39237 (_ BitVec 64) (_ BitVec 32)) Unit!23656)

(assert (=> b!673044 (= lt!312404 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!673044 false))

(declare-fun b!673045 () Bool)

(declare-fun res!439643 () Bool)

(declare-fun e!384400 () Bool)

(assert (=> b!673045 (=> (not res!439643) (not e!384400))))

(declare-fun acc!681 () List!12852)

(declare-fun arrayNoDuplicates!0 (array!39237 (_ BitVec 32) List!12852) Bool)

(assert (=> b!673045 (= res!439643 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673046 () Bool)

(declare-fun e!384398 () Bool)

(assert (=> b!673046 (= e!384398 (contains!3429 acc!681 k0!2843))))

(declare-fun b!673047 () Bool)

(declare-fun res!439631 () Bool)

(assert (=> b!673047 (=> (not res!439631) (not e!384400))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673047 (= res!439631 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19175 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673048 () Bool)

(declare-fun res!439635 () Bool)

(assert (=> b!673048 (=> (not res!439635) (not e!384400))))

(declare-fun e!384397 () Bool)

(assert (=> b!673048 (= res!439635 e!384397)))

(declare-fun res!439621 () Bool)

(assert (=> b!673048 (=> res!439621 e!384397)))

(assert (=> b!673048 (= res!439621 e!384398)))

(declare-fun res!439633 () Bool)

(assert (=> b!673048 (=> (not res!439633) (not e!384398))))

(assert (=> b!673048 (= res!439633 (bvsgt from!3004 i!1382))))

(declare-fun b!673049 () Bool)

(declare-fun res!439637 () Bool)

(assert (=> b!673049 (=> (not res!439637) (not e!384400))))

(assert (=> b!673049 (= res!439637 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19175 a!3626))))))

(declare-fun b!673050 () Bool)

(declare-fun e!384401 () Bool)

(assert (=> b!673050 (= e!384397 e!384401)))

(declare-fun res!439620 () Bool)

(assert (=> b!673050 (=> (not res!439620) (not e!384401))))

(assert (=> b!673050 (= res!439620 (bvsle from!3004 i!1382))))

(declare-fun b!673051 () Bool)

(declare-fun res!439622 () Bool)

(assert (=> b!673051 (=> (not res!439622) (not e!384400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673051 (= res!439622 (validKeyInArray!0 (select (arr!18811 a!3626) from!3004)))))

(declare-fun b!673052 () Bool)

(declare-fun res!439628 () Bool)

(assert (=> b!673052 (=> (not res!439628) (not e!384400))))

(declare-fun noDuplicate!676 (List!12852) Bool)

(assert (=> b!673052 (= res!439628 (noDuplicate!676 acc!681))))

(declare-fun b!673053 () Bool)

(assert (=> b!673053 (= e!384401 (not (contains!3429 acc!681 k0!2843)))))

(declare-fun b!673054 () Bool)

(declare-fun e!384395 () Bool)

(assert (=> b!673054 (= e!384395 (not (contains!3429 lt!312405 k0!2843)))))

(declare-fun b!673055 () Bool)

(declare-fun res!439629 () Bool)

(assert (=> b!673055 (=> (not res!439629) (not e!384399))))

(assert (=> b!673055 (= res!439629 (noDuplicate!676 lt!312405))))

(declare-fun b!673056 () Bool)

(declare-fun res!439636 () Bool)

(assert (=> b!673056 (=> (not res!439636) (not e!384400))))

(assert (=> b!673056 (= res!439636 (validKeyInArray!0 k0!2843))))

(declare-fun b!673057 () Bool)

(declare-fun res!439642 () Bool)

(assert (=> b!673057 (=> (not res!439642) (not e!384400))))

(assert (=> b!673057 (= res!439642 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673058 () Bool)

(declare-fun res!439627 () Bool)

(assert (=> b!673058 (=> (not res!439627) (not e!384400))))

(assert (=> b!673058 (= res!439627 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12849))))

(declare-fun b!673059 () Bool)

(declare-fun e!384403 () Bool)

(assert (=> b!673059 (= e!384400 e!384403)))

(declare-fun res!439623 () Bool)

(assert (=> b!673059 (=> (not res!439623) (not e!384403))))

(assert (=> b!673059 (= res!439623 (not (= (select (arr!18811 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312403 () Unit!23656)

(assert (=> b!673059 (= lt!312403 e!384396)))

(declare-fun c!77078 () Bool)

(assert (=> b!673059 (= c!77078 (= (select (arr!18811 a!3626) from!3004) k0!2843))))

(declare-fun res!439641 () Bool)

(assert (=> start!60190 (=> (not res!439641) (not e!384400))))

(assert (=> start!60190 (= res!439641 (and (bvslt (size!19175 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19175 a!3626))))))

(assert (=> start!60190 e!384400))

(assert (=> start!60190 true))

(declare-fun array_inv!14607 (array!39237) Bool)

(assert (=> start!60190 (array_inv!14607 a!3626)))

(declare-fun b!673060 () Bool)

(declare-fun res!439632 () Bool)

(assert (=> b!673060 (=> (not res!439632) (not e!384399))))

(declare-fun e!384402 () Bool)

(assert (=> b!673060 (= res!439632 e!384402)))

(declare-fun res!439639 () Bool)

(assert (=> b!673060 (=> res!439639 e!384402)))

(assert (=> b!673060 (= res!439639 e!384404)))

(declare-fun res!439624 () Bool)

(assert (=> b!673060 (=> (not res!439624) (not e!384404))))

(assert (=> b!673060 (= res!439624 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673061 () Bool)

(assert (=> b!673061 (= e!384403 e!384399)))

(declare-fun res!439634 () Bool)

(assert (=> b!673061 (=> (not res!439634) (not e!384399))))

(assert (=> b!673061 (= res!439634 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!279 (List!12852 (_ BitVec 64)) List!12852)

(assert (=> b!673061 (= lt!312405 ($colon$colon!279 acc!681 (select (arr!18811 a!3626) from!3004)))))

(declare-fun b!673062 () Bool)

(declare-fun Unit!23659 () Unit!23656)

(assert (=> b!673062 (= e!384396 Unit!23659)))

(declare-fun b!673063 () Bool)

(declare-fun res!439625 () Bool)

(assert (=> b!673063 (=> (not res!439625) (not e!384400))))

(assert (=> b!673063 (= res!439625 (not (contains!3429 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673064 () Bool)

(assert (=> b!673064 (= e!384399 false)))

(declare-fun lt!312406 () Bool)

(assert (=> b!673064 (= lt!312406 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312405))))

(declare-fun b!673065 () Bool)

(declare-fun res!439630 () Bool)

(assert (=> b!673065 (=> (not res!439630) (not e!384400))))

(assert (=> b!673065 (= res!439630 (not (contains!3429 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673066 () Bool)

(declare-fun res!439626 () Bool)

(assert (=> b!673066 (=> (not res!439626) (not e!384399))))

(assert (=> b!673066 (= res!439626 (not (contains!3429 lt!312405 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673067 () Bool)

(assert (=> b!673067 (= e!384402 e!384395)))

(declare-fun res!439640 () Bool)

(assert (=> b!673067 (=> (not res!439640) (not e!384395))))

(assert (=> b!673067 (= res!439640 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60190 res!439641) b!673052))

(assert (= (and b!673052 res!439628) b!673065))

(assert (= (and b!673065 res!439630) b!673063))

(assert (= (and b!673063 res!439625) b!673048))

(assert (= (and b!673048 res!439633) b!673046))

(assert (= (and b!673048 (not res!439621)) b!673050))

(assert (= (and b!673050 res!439620) b!673053))

(assert (= (and b!673048 res!439635) b!673058))

(assert (= (and b!673058 res!439627) b!673045))

(assert (= (and b!673045 res!439643) b!673049))

(assert (= (and b!673049 res!439637) b!673056))

(assert (= (and b!673056 res!439636) b!673057))

(assert (= (and b!673057 res!439642) b!673047))

(assert (= (and b!673047 res!439631) b!673051))

(assert (= (and b!673051 res!439622) b!673059))

(assert (= (and b!673059 c!77078) b!673044))

(assert (= (and b!673059 (not c!77078)) b!673062))

(assert (= (and b!673059 res!439623) b!673061))

(assert (= (and b!673061 res!439634) b!673055))

(assert (= (and b!673055 res!439629) b!673043))

(assert (= (and b!673043 res!439638) b!673066))

(assert (= (and b!673066 res!439626) b!673060))

(assert (= (and b!673060 res!439624) b!673042))

(assert (= (and b!673060 (not res!439639)) b!673067))

(assert (= (and b!673067 res!439640) b!673054))

(assert (= (and b!673060 res!439632) b!673064))

(declare-fun m!641695 () Bool)

(assert (=> start!60190 m!641695))

(declare-fun m!641697 () Bool)

(assert (=> b!673061 m!641697))

(assert (=> b!673061 m!641697))

(declare-fun m!641699 () Bool)

(assert (=> b!673061 m!641699))

(assert (=> b!673059 m!641697))

(assert (=> b!673051 m!641697))

(assert (=> b!673051 m!641697))

(declare-fun m!641701 () Bool)

(assert (=> b!673051 m!641701))

(declare-fun m!641703 () Bool)

(assert (=> b!673043 m!641703))

(declare-fun m!641705 () Bool)

(assert (=> b!673065 m!641705))

(declare-fun m!641707 () Bool)

(assert (=> b!673066 m!641707))

(declare-fun m!641709 () Bool)

(assert (=> b!673064 m!641709))

(declare-fun m!641711 () Bool)

(assert (=> b!673046 m!641711))

(declare-fun m!641713 () Bool)

(assert (=> b!673055 m!641713))

(declare-fun m!641715 () Bool)

(assert (=> b!673042 m!641715))

(assert (=> b!673054 m!641715))

(declare-fun m!641717 () Bool)

(assert (=> b!673056 m!641717))

(declare-fun m!641719 () Bool)

(assert (=> b!673044 m!641719))

(declare-fun m!641721 () Bool)

(assert (=> b!673044 m!641721))

(assert (=> b!673053 m!641711))

(declare-fun m!641723 () Bool)

(assert (=> b!673063 m!641723))

(declare-fun m!641725 () Bool)

(assert (=> b!673045 m!641725))

(declare-fun m!641727 () Bool)

(assert (=> b!673052 m!641727))

(declare-fun m!641729 () Bool)

(assert (=> b!673058 m!641729))

(declare-fun m!641731 () Bool)

(assert (=> b!673057 m!641731))

(check-sat (not b!673045) (not b!673053) (not b!673052) (not b!673043) (not b!673051) (not b!673046) (not b!673042) (not b!673054) (not b!673065) (not b!673064) (not b!673063) (not b!673044) (not b!673056) (not b!673057) (not b!673058) (not b!673061) (not b!673066) (not b!673055) (not start!60190))
(check-sat)
