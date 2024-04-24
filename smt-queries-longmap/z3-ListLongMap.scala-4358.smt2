; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60234 () Bool)

(assert start!60234)

(declare-fun b!672720 () Bool)

(declare-fun res!439247 () Bool)

(declare-fun e!384314 () Bool)

(assert (=> b!672720 (=> (not res!439247) (not e!384314))))

(declare-datatypes ((List!12747 0))(
  ( (Nil!12744) (Cons!12743 (h!13791 (_ BitVec 64)) (t!18967 List!12747)) )
))
(declare-fun acc!681 () List!12747)

(declare-fun contains!3399 (List!12747 (_ BitVec 64)) Bool)

(assert (=> b!672720 (= res!439247 (not (contains!3399 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672721 () Bool)

(declare-fun res!439240 () Bool)

(assert (=> b!672721 (=> (not res!439240) (not e!384314))))

(declare-datatypes ((array!39219 0))(
  ( (array!39220 (arr!18799 (Array (_ BitVec 32) (_ BitVec 64))) (size!19163 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39219)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672721 (= res!439240 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672722 () Bool)

(declare-fun e!384305 () Bool)

(declare-fun e!384308 () Bool)

(assert (=> b!672722 (= e!384305 e!384308)))

(declare-fun res!439239 () Bool)

(assert (=> b!672722 (=> (not res!439239) (not e!384308))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672722 (= res!439239 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!312422 () List!12747)

(declare-fun $colon$colon!269 (List!12747 (_ BitVec 64)) List!12747)

(assert (=> b!672722 (= lt!312422 ($colon$colon!269 acc!681 (select (arr!18799 a!3626) from!3004)))))

(declare-fun b!672723 () Bool)

(assert (=> b!672723 (= e!384314 e!384305)))

(declare-fun res!439243 () Bool)

(assert (=> b!672723 (=> (not res!439243) (not e!384305))))

(assert (=> b!672723 (= res!439243 (not (= (select (arr!18799 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!23607 0))(
  ( (Unit!23608) )
))
(declare-fun lt!312421 () Unit!23607)

(declare-fun e!384310 () Unit!23607)

(assert (=> b!672723 (= lt!312421 e!384310)))

(declare-fun c!77114 () Bool)

(assert (=> b!672723 (= c!77114 (= (select (arr!18799 a!3626) from!3004) k0!2843))))

(declare-fun b!672724 () Bool)

(declare-fun res!439241 () Bool)

(assert (=> b!672724 (=> (not res!439241) (not e!384314))))

(declare-fun arrayNoDuplicates!0 (array!39219 (_ BitVec 32) List!12747) Bool)

(assert (=> b!672724 (= res!439241 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12744))))

(declare-fun b!672725 () Bool)

(declare-fun res!439235 () Bool)

(assert (=> b!672725 (=> (not res!439235) (not e!384314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672725 (= res!439235 (validKeyInArray!0 (select (arr!18799 a!3626) from!3004)))))

(declare-fun b!672726 () Bool)

(declare-fun res!439231 () Bool)

(assert (=> b!672726 (=> (not res!439231) (not e!384314))))

(declare-fun e!384311 () Bool)

(assert (=> b!672726 (= res!439231 e!384311)))

(declare-fun res!439242 () Bool)

(assert (=> b!672726 (=> res!439242 e!384311)))

(declare-fun e!384307 () Bool)

(assert (=> b!672726 (= res!439242 e!384307)))

(declare-fun res!439251 () Bool)

(assert (=> b!672726 (=> (not res!439251) (not e!384307))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672726 (= res!439251 (bvsgt from!3004 i!1382))))

(declare-fun b!672727 () Bool)

(declare-fun res!439234 () Bool)

(assert (=> b!672727 (=> (not res!439234) (not e!384308))))

(assert (=> b!672727 (= res!439234 (not (contains!3399 lt!312422 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672728 () Bool)

(assert (=> b!672728 (= e!384307 (contains!3399 acc!681 k0!2843))))

(declare-fun b!672729 () Bool)

(declare-fun Unit!23609 () Unit!23607)

(assert (=> b!672729 (= e!384310 Unit!23609)))

(declare-fun b!672730 () Bool)

(declare-fun res!439232 () Bool)

(assert (=> b!672730 (=> (not res!439232) (not e!384308))))

(assert (=> b!672730 (= res!439232 (not (contains!3399 lt!312422 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!439237 () Bool)

(assert (=> start!60234 (=> (not res!439237) (not e!384314))))

(assert (=> start!60234 (= res!439237 (and (bvslt (size!19163 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19163 a!3626))))))

(assert (=> start!60234 e!384314))

(assert (=> start!60234 true))

(declare-fun array_inv!14658 (array!39219) Bool)

(assert (=> start!60234 (array_inv!14658 a!3626)))

(declare-fun b!672731 () Bool)

(declare-fun e!384306 () Bool)

(assert (=> b!672731 (= e!384306 (not (contains!3399 acc!681 k0!2843)))))

(declare-fun b!672732 () Bool)

(declare-fun res!439250 () Bool)

(assert (=> b!672732 (=> (not res!439250) (not e!384314))))

(assert (=> b!672732 (= res!439250 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672733 () Bool)

(declare-fun e!384313 () Bool)

(assert (=> b!672733 (= e!384313 (contains!3399 lt!312422 k0!2843))))

(declare-fun b!672734 () Bool)

(declare-fun res!439238 () Bool)

(assert (=> b!672734 (=> (not res!439238) (not e!384314))))

(assert (=> b!672734 (= res!439238 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19163 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672735 () Bool)

(declare-fun res!439249 () Bool)

(assert (=> b!672735 (=> (not res!439249) (not e!384314))))

(assert (=> b!672735 (= res!439249 (not (contains!3399 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672736 () Bool)

(declare-fun e!384312 () Bool)

(declare-fun e!384315 () Bool)

(assert (=> b!672736 (= e!384312 e!384315)))

(declare-fun res!439252 () Bool)

(assert (=> b!672736 (=> (not res!439252) (not e!384315))))

(assert (=> b!672736 (= res!439252 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672737 () Bool)

(declare-fun res!439229 () Bool)

(assert (=> b!672737 (=> (not res!439229) (not e!384308))))

(declare-fun noDuplicate!673 (List!12747) Bool)

(assert (=> b!672737 (= res!439229 (noDuplicate!673 lt!312422))))

(declare-fun b!672738 () Bool)

(assert (=> b!672738 (= e!384311 e!384306)))

(declare-fun res!439248 () Bool)

(assert (=> b!672738 (=> (not res!439248) (not e!384306))))

(assert (=> b!672738 (= res!439248 (bvsle from!3004 i!1382))))

(declare-fun b!672739 () Bool)

(assert (=> b!672739 (= e!384315 (not (contains!3399 lt!312422 k0!2843)))))

(declare-fun b!672740 () Bool)

(declare-fun res!439245 () Bool)

(assert (=> b!672740 (=> (not res!439245) (not e!384314))))

(assert (=> b!672740 (= res!439245 (validKeyInArray!0 k0!2843))))

(declare-fun b!672741 () Bool)

(declare-fun res!439246 () Bool)

(assert (=> b!672741 (=> (not res!439246) (not e!384314))))

(assert (=> b!672741 (= res!439246 (noDuplicate!673 acc!681))))

(declare-fun b!672742 () Bool)

(declare-fun res!439233 () Bool)

(assert (=> b!672742 (=> (not res!439233) (not e!384308))))

(assert (=> b!672742 (= res!439233 e!384312)))

(declare-fun res!439236 () Bool)

(assert (=> b!672742 (=> res!439236 e!384312)))

(assert (=> b!672742 (= res!439236 e!384313)))

(declare-fun res!439244 () Bool)

(assert (=> b!672742 (=> (not res!439244) (not e!384313))))

(assert (=> b!672742 (= res!439244 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672743 () Bool)

(declare-fun Unit!23610 () Unit!23607)

(assert (=> b!672743 (= e!384310 Unit!23610)))

(assert (=> b!672743 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312424 () Unit!23607)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39219 (_ BitVec 64) (_ BitVec 32)) Unit!23607)

(assert (=> b!672743 (= lt!312424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672743 false))

(declare-fun b!672744 () Bool)

(declare-fun res!439230 () Bool)

(assert (=> b!672744 (=> (not res!439230) (not e!384314))))

(assert (=> b!672744 (= res!439230 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19163 a!3626))))))

(declare-fun b!672745 () Bool)

(assert (=> b!672745 (= e!384308 false)))

(declare-fun lt!312423 () Bool)

(assert (=> b!672745 (= lt!312423 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312422))))

(assert (= (and start!60234 res!439237) b!672741))

(assert (= (and b!672741 res!439246) b!672720))

(assert (= (and b!672720 res!439247) b!672735))

(assert (= (and b!672735 res!439249) b!672726))

(assert (= (and b!672726 res!439251) b!672728))

(assert (= (and b!672726 (not res!439242)) b!672738))

(assert (= (and b!672738 res!439248) b!672731))

(assert (= (and b!672726 res!439231) b!672724))

(assert (= (and b!672724 res!439241) b!672732))

(assert (= (and b!672732 res!439250) b!672744))

(assert (= (and b!672744 res!439230) b!672740))

(assert (= (and b!672740 res!439245) b!672721))

(assert (= (and b!672721 res!439240) b!672734))

(assert (= (and b!672734 res!439238) b!672725))

(assert (= (and b!672725 res!439235) b!672723))

(assert (= (and b!672723 c!77114) b!672743))

(assert (= (and b!672723 (not c!77114)) b!672729))

(assert (= (and b!672723 res!439243) b!672722))

(assert (= (and b!672722 res!439239) b!672737))

(assert (= (and b!672737 res!439229) b!672727))

(assert (= (and b!672727 res!439234) b!672730))

(assert (= (and b!672730 res!439232) b!672742))

(assert (= (and b!672742 res!439244) b!672733))

(assert (= (and b!672742 (not res!439236)) b!672736))

(assert (= (and b!672736 res!439252) b!672739))

(assert (= (and b!672742 res!439233) b!672745))

(declare-fun m!642127 () Bool)

(assert (=> b!672720 m!642127))

(declare-fun m!642129 () Bool)

(assert (=> b!672735 m!642129))

(declare-fun m!642131 () Bool)

(assert (=> b!672732 m!642131))

(declare-fun m!642133 () Bool)

(assert (=> b!672725 m!642133))

(assert (=> b!672725 m!642133))

(declare-fun m!642135 () Bool)

(assert (=> b!672725 m!642135))

(declare-fun m!642137 () Bool)

(assert (=> b!672727 m!642137))

(declare-fun m!642139 () Bool)

(assert (=> b!672743 m!642139))

(declare-fun m!642141 () Bool)

(assert (=> b!672743 m!642141))

(declare-fun m!642143 () Bool)

(assert (=> b!672737 m!642143))

(declare-fun m!642145 () Bool)

(assert (=> b!672745 m!642145))

(declare-fun m!642147 () Bool)

(assert (=> b!672739 m!642147))

(declare-fun m!642149 () Bool)

(assert (=> b!672721 m!642149))

(assert (=> b!672733 m!642147))

(declare-fun m!642151 () Bool)

(assert (=> b!672724 m!642151))

(declare-fun m!642153 () Bool)

(assert (=> start!60234 m!642153))

(assert (=> b!672722 m!642133))

(assert (=> b!672722 m!642133))

(declare-fun m!642155 () Bool)

(assert (=> b!672722 m!642155))

(declare-fun m!642157 () Bool)

(assert (=> b!672731 m!642157))

(assert (=> b!672723 m!642133))

(declare-fun m!642159 () Bool)

(assert (=> b!672740 m!642159))

(declare-fun m!642161 () Bool)

(assert (=> b!672730 m!642161))

(assert (=> b!672728 m!642157))

(declare-fun m!642163 () Bool)

(assert (=> b!672741 m!642163))

(check-sat (not b!672722) (not b!672720) (not b!672724) (not b!672725) (not b!672740) (not b!672731) (not b!672743) (not b!672727) (not b!672739) (not b!672735) (not b!672721) (not start!60234) (not b!672730) (not b!672733) (not b!672732) (not b!672728) (not b!672745) (not b!672741) (not b!672737))
(check-sat)
