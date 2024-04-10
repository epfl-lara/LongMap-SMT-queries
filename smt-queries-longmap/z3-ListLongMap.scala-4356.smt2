; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60166 () Bool)

(assert start!60166)

(declare-fun b!672106 () Bool)

(declare-fun res!438770 () Bool)

(declare-fun e!384005 () Bool)

(assert (=> b!672106 (=> (not res!438770) (not e!384005))))

(declare-datatypes ((array!39213 0))(
  ( (array!39214 (arr!18799 (Array (_ BitVec 32) (_ BitVec 64))) (size!19163 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39213)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672106 (= res!438770 (validKeyInArray!0 (select (arr!18799 a!3626) from!3004)))))

(declare-fun b!672107 () Bool)

(declare-fun e!384009 () Bool)

(assert (=> b!672107 (= e!384009 false)))

(declare-datatypes ((List!12840 0))(
  ( (Nil!12837) (Cons!12836 (h!13881 (_ BitVec 64)) (t!19068 List!12840)) )
))
(declare-fun lt!312259 () List!12840)

(declare-fun lt!312260 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39213 (_ BitVec 32) List!12840) Bool)

(assert (=> b!672107 (= lt!312260 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312259))))

(declare-fun b!672108 () Bool)

(declare-fun res!438766 () Bool)

(assert (=> b!672108 (=> (not res!438766) (not e!384005))))

(declare-fun acc!681 () List!12840)

(declare-fun contains!3417 (List!12840 (_ BitVec 64)) Bool)

(assert (=> b!672108 (= res!438766 (not (contains!3417 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672109 () Bool)

(declare-fun res!438759 () Bool)

(assert (=> b!672109 (=> (not res!438759) (not e!384009))))

(assert (=> b!672109 (= res!438759 (not (contains!3417 lt!312259 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672110 () Bool)

(declare-fun res!438778 () Bool)

(assert (=> b!672110 (=> (not res!438778) (not e!384005))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672110 (= res!438778 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19163 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672111 () Bool)

(declare-fun res!438777 () Bool)

(assert (=> b!672111 (=> (not res!438777) (not e!384009))))

(declare-fun noDuplicate!664 (List!12840) Bool)

(assert (=> b!672111 (= res!438777 (noDuplicate!664 lt!312259))))

(declare-fun b!672113 () Bool)

(declare-fun e!383999 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!672113 (= e!383999 (not (contains!3417 acc!681 k0!2843)))))

(declare-fun b!672114 () Bool)

(declare-fun res!438771 () Bool)

(assert (=> b!672114 (=> (not res!438771) (not e!384005))))

(assert (=> b!672114 (= res!438771 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672115 () Bool)

(declare-datatypes ((Unit!23608 0))(
  ( (Unit!23609) )
))
(declare-fun e!384003 () Unit!23608)

(declare-fun Unit!23610 () Unit!23608)

(assert (=> b!672115 (= e!384003 Unit!23610)))

(declare-fun arrayContainsKey!0 (array!39213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672115 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312261 () Unit!23608)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39213 (_ BitVec 64) (_ BitVec 32)) Unit!23608)

(assert (=> b!672115 (= lt!312261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672115 false))

(declare-fun b!672116 () Bool)

(declare-fun e!384004 () Bool)

(assert (=> b!672116 (= e!384004 (not (contains!3417 lt!312259 k0!2843)))))

(declare-fun b!672117 () Bool)

(declare-fun Unit!23611 () Unit!23608)

(assert (=> b!672117 (= e!384003 Unit!23611)))

(declare-fun b!672118 () Bool)

(declare-fun res!438756 () Bool)

(assert (=> b!672118 (=> (not res!438756) (not e!384005))))

(declare-fun e!384000 () Bool)

(assert (=> b!672118 (= res!438756 e!384000)))

(declare-fun res!438757 () Bool)

(assert (=> b!672118 (=> res!438757 e!384000)))

(declare-fun e!384006 () Bool)

(assert (=> b!672118 (= res!438757 e!384006)))

(declare-fun res!438760 () Bool)

(assert (=> b!672118 (=> (not res!438760) (not e!384006))))

(assert (=> b!672118 (= res!438760 (bvsgt from!3004 i!1382))))

(declare-fun b!672119 () Bool)

(assert (=> b!672119 (= e!384006 (contains!3417 acc!681 k0!2843))))

(declare-fun b!672120 () Bool)

(declare-fun res!438775 () Bool)

(assert (=> b!672120 (=> (not res!438775) (not e!384005))))

(assert (=> b!672120 (= res!438775 (validKeyInArray!0 k0!2843))))

(declare-fun b!672121 () Bool)

(declare-fun e!384007 () Bool)

(assert (=> b!672121 (= e!384007 e!384004)))

(declare-fun res!438773 () Bool)

(assert (=> b!672121 (=> (not res!438773) (not e!384004))))

(assert (=> b!672121 (= res!438773 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672122 () Bool)

(declare-fun res!438765 () Bool)

(assert (=> b!672122 (=> (not res!438765) (not e!384009))))

(assert (=> b!672122 (= res!438765 e!384007)))

(declare-fun res!438763 () Bool)

(assert (=> b!672122 (=> res!438763 e!384007)))

(declare-fun e!384008 () Bool)

(assert (=> b!672122 (= res!438763 e!384008)))

(declare-fun res!438767 () Bool)

(assert (=> b!672122 (=> (not res!438767) (not e!384008))))

(assert (=> b!672122 (= res!438767 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672123 () Bool)

(declare-fun res!438779 () Bool)

(assert (=> b!672123 (=> (not res!438779) (not e!384005))))

(assert (=> b!672123 (= res!438779 (noDuplicate!664 acc!681))))

(declare-fun b!672124 () Bool)

(assert (=> b!672124 (= e!384008 (contains!3417 lt!312259 k0!2843))))

(declare-fun res!438772 () Bool)

(assert (=> start!60166 (=> (not res!438772) (not e!384005))))

(assert (=> start!60166 (= res!438772 (and (bvslt (size!19163 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19163 a!3626))))))

(assert (=> start!60166 e!384005))

(assert (=> start!60166 true))

(declare-fun array_inv!14595 (array!39213) Bool)

(assert (=> start!60166 (array_inv!14595 a!3626)))

(declare-fun b!672112 () Bool)

(declare-fun res!438762 () Bool)

(assert (=> b!672112 (=> (not res!438762) (not e!384005))))

(assert (=> b!672112 (= res!438762 (not (contains!3417 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672125 () Bool)

(assert (=> b!672125 (= e!384000 e!383999)))

(declare-fun res!438758 () Bool)

(assert (=> b!672125 (=> (not res!438758) (not e!383999))))

(assert (=> b!672125 (= res!438758 (bvsle from!3004 i!1382))))

(declare-fun b!672126 () Bool)

(declare-fun res!438764 () Bool)

(assert (=> b!672126 (=> (not res!438764) (not e!384005))))

(assert (=> b!672126 (= res!438764 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672127 () Bool)

(declare-fun res!438761 () Bool)

(assert (=> b!672127 (=> (not res!438761) (not e!384009))))

(assert (=> b!672127 (= res!438761 (not (contains!3417 lt!312259 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672128 () Bool)

(declare-fun e!384001 () Bool)

(assert (=> b!672128 (= e!384005 e!384001)))

(declare-fun res!438774 () Bool)

(assert (=> b!672128 (=> (not res!438774) (not e!384001))))

(assert (=> b!672128 (= res!438774 (not (= (select (arr!18799 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312262 () Unit!23608)

(assert (=> b!672128 (= lt!312262 e!384003)))

(declare-fun c!77042 () Bool)

(assert (=> b!672128 (= c!77042 (= (select (arr!18799 a!3626) from!3004) k0!2843))))

(declare-fun b!672129 () Bool)

(declare-fun res!438776 () Bool)

(assert (=> b!672129 (=> (not res!438776) (not e!384005))))

(assert (=> b!672129 (= res!438776 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12837))))

(declare-fun b!672130 () Bool)

(declare-fun res!438769 () Bool)

(assert (=> b!672130 (=> (not res!438769) (not e!384005))))

(assert (=> b!672130 (= res!438769 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19163 a!3626))))))

(declare-fun b!672131 () Bool)

(assert (=> b!672131 (= e!384001 e!384009)))

(declare-fun res!438768 () Bool)

(assert (=> b!672131 (=> (not res!438768) (not e!384009))))

(assert (=> b!672131 (= res!438768 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!267 (List!12840 (_ BitVec 64)) List!12840)

(assert (=> b!672131 (= lt!312259 ($colon$colon!267 acc!681 (select (arr!18799 a!3626) from!3004)))))

(assert (= (and start!60166 res!438772) b!672123))

(assert (= (and b!672123 res!438779) b!672108))

(assert (= (and b!672108 res!438766) b!672112))

(assert (= (and b!672112 res!438762) b!672118))

(assert (= (and b!672118 res!438760) b!672119))

(assert (= (and b!672118 (not res!438757)) b!672125))

(assert (= (and b!672125 res!438758) b!672113))

(assert (= (and b!672118 res!438756) b!672129))

(assert (= (and b!672129 res!438776) b!672114))

(assert (= (and b!672114 res!438771) b!672130))

(assert (= (and b!672130 res!438769) b!672120))

(assert (= (and b!672120 res!438775) b!672126))

(assert (= (and b!672126 res!438764) b!672110))

(assert (= (and b!672110 res!438778) b!672106))

(assert (= (and b!672106 res!438770) b!672128))

(assert (= (and b!672128 c!77042) b!672115))

(assert (= (and b!672128 (not c!77042)) b!672117))

(assert (= (and b!672128 res!438774) b!672131))

(assert (= (and b!672131 res!438768) b!672111))

(assert (= (and b!672111 res!438777) b!672127))

(assert (= (and b!672127 res!438761) b!672109))

(assert (= (and b!672109 res!438759) b!672122))

(assert (= (and b!672122 res!438767) b!672124))

(assert (= (and b!672122 (not res!438763)) b!672121))

(assert (= (and b!672121 res!438773) b!672116))

(assert (= (and b!672122 res!438765) b!672107))

(declare-fun m!641239 () Bool)

(assert (=> b!672129 m!641239))

(declare-fun m!641241 () Bool)

(assert (=> b!672116 m!641241))

(declare-fun m!641243 () Bool)

(assert (=> b!672131 m!641243))

(assert (=> b!672131 m!641243))

(declare-fun m!641245 () Bool)

(assert (=> b!672131 m!641245))

(declare-fun m!641247 () Bool)

(assert (=> b!672114 m!641247))

(declare-fun m!641249 () Bool)

(assert (=> b!672126 m!641249))

(declare-fun m!641251 () Bool)

(assert (=> b!672113 m!641251))

(assert (=> b!672119 m!641251))

(declare-fun m!641253 () Bool)

(assert (=> b!672120 m!641253))

(assert (=> b!672124 m!641241))

(declare-fun m!641255 () Bool)

(assert (=> b!672127 m!641255))

(declare-fun m!641257 () Bool)

(assert (=> b!672109 m!641257))

(declare-fun m!641259 () Bool)

(assert (=> start!60166 m!641259))

(assert (=> b!672128 m!641243))

(declare-fun m!641261 () Bool)

(assert (=> b!672123 m!641261))

(assert (=> b!672106 m!641243))

(assert (=> b!672106 m!641243))

(declare-fun m!641263 () Bool)

(assert (=> b!672106 m!641263))

(declare-fun m!641265 () Bool)

(assert (=> b!672108 m!641265))

(declare-fun m!641267 () Bool)

(assert (=> b!672111 m!641267))

(declare-fun m!641269 () Bool)

(assert (=> b!672115 m!641269))

(declare-fun m!641271 () Bool)

(assert (=> b!672115 m!641271))

(declare-fun m!641273 () Bool)

(assert (=> b!672107 m!641273))

(declare-fun m!641275 () Bool)

(assert (=> b!672112 m!641275))

(check-sat (not b!672120) (not b!672129) (not b!672106) (not b!672123) (not b!672113) (not b!672116) (not b!672107) (not b!672114) (not b!672127) (not b!672115) (not b!672111) (not b!672131) (not b!672112) (not b!672119) (not b!672108) (not start!60166) (not b!672109) (not b!672126) (not b!672124))
(check-sat)
