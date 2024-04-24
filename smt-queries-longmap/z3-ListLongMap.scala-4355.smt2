; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60216 () Bool)

(assert start!60216)

(declare-fun b!672018 () Bool)

(declare-fun res!438592 () Bool)

(declare-fun e!384018 () Bool)

(assert (=> b!672018 (=> (not res!438592) (not e!384018))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39201 0))(
  ( (array!39202 (arr!18790 (Array (_ BitVec 32) (_ BitVec 64))) (size!19154 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39201)

(assert (=> b!672018 (= res!438592 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19154 a!3626))))))

(declare-fun b!672019 () Bool)

(declare-fun res!438599 () Bool)

(assert (=> b!672019 (=> (not res!438599) (not e!384018))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672019 (= res!438599 (validKeyInArray!0 k0!2843))))

(declare-fun b!672020 () Bool)

(declare-fun res!438587 () Bool)

(declare-fun e!384016 () Bool)

(assert (=> b!672020 (=> (not res!438587) (not e!384016))))

(declare-fun e!384008 () Bool)

(assert (=> b!672020 (= res!438587 e!384008)))

(declare-fun res!438598 () Bool)

(assert (=> b!672020 (=> res!438598 e!384008)))

(declare-fun e!384014 () Bool)

(assert (=> b!672020 (= res!438598 e!384014)))

(declare-fun res!438602 () Bool)

(assert (=> b!672020 (=> (not res!438602) (not e!384014))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!672020 (= res!438602 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672021 () Bool)

(declare-fun e!384013 () Bool)

(declare-datatypes ((List!12738 0))(
  ( (Nil!12735) (Cons!12734 (h!13782 (_ BitVec 64)) (t!18958 List!12738)) )
))
(declare-fun acc!681 () List!12738)

(declare-fun contains!3390 (List!12738 (_ BitVec 64)) Bool)

(assert (=> b!672021 (= e!384013 (not (contains!3390 acc!681 k0!2843)))))

(declare-fun b!672022 () Bool)

(declare-fun e!384015 () Bool)

(declare-fun lt!312316 () List!12738)

(assert (=> b!672022 (= e!384015 (not (contains!3390 lt!312316 k0!2843)))))

(declare-fun b!672024 () Bool)

(declare-fun res!438595 () Bool)

(assert (=> b!672024 (=> (not res!438595) (not e!384018))))

(assert (=> b!672024 (= res!438595 (not (contains!3390 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672025 () Bool)

(declare-fun res!438593 () Bool)

(assert (=> b!672025 (=> (not res!438593) (not e!384018))))

(assert (=> b!672025 (= res!438593 (validKeyInArray!0 (select (arr!18790 a!3626) from!3004)))))

(declare-fun b!672026 () Bool)

(declare-fun res!438588 () Bool)

(assert (=> b!672026 (=> (not res!438588) (not e!384018))))

(assert (=> b!672026 (= res!438588 (not (contains!3390 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672027 () Bool)

(declare-fun res!438596 () Bool)

(assert (=> b!672027 (=> (not res!438596) (not e!384018))))

(declare-fun arrayContainsKey!0 (array!39201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672027 (= res!438596 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672028 () Bool)

(declare-fun res!438582 () Bool)

(assert (=> b!672028 (=> (not res!438582) (not e!384016))))

(assert (=> b!672028 (= res!438582 (not (contains!3390 lt!312316 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672029 () Bool)

(declare-fun res!438584 () Bool)

(assert (=> b!672029 (=> (not res!438584) (not e!384018))))

(declare-fun arrayNoDuplicates!0 (array!39201 (_ BitVec 32) List!12738) Bool)

(assert (=> b!672029 (= res!438584 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672030 () Bool)

(declare-fun res!438586 () Bool)

(assert (=> b!672030 (=> (not res!438586) (not e!384018))))

(declare-fun noDuplicate!664 (List!12738) Bool)

(assert (=> b!672030 (= res!438586 (noDuplicate!664 acc!681))))

(declare-fun b!672031 () Bool)

(declare-datatypes ((Unit!23571 0))(
  ( (Unit!23572) )
))
(declare-fun e!384011 () Unit!23571)

(declare-fun Unit!23573 () Unit!23571)

(assert (=> b!672031 (= e!384011 Unit!23573)))

(assert (=> b!672031 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312315 () Unit!23571)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39201 (_ BitVec 64) (_ BitVec 32)) Unit!23571)

(assert (=> b!672031 (= lt!312315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672031 false))

(declare-fun b!672032 () Bool)

(declare-fun res!438600 () Bool)

(assert (=> b!672032 (=> (not res!438600) (not e!384018))))

(assert (=> b!672032 (= res!438600 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19154 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672033 () Bool)

(declare-fun res!438581 () Bool)

(assert (=> b!672033 (=> (not res!438581) (not e!384018))))

(declare-fun e!384017 () Bool)

(assert (=> b!672033 (= res!438581 e!384017)))

(declare-fun res!438589 () Bool)

(assert (=> b!672033 (=> res!438589 e!384017)))

(declare-fun e!384009 () Bool)

(assert (=> b!672033 (= res!438589 e!384009)))

(declare-fun res!438594 () Bool)

(assert (=> b!672033 (=> (not res!438594) (not e!384009))))

(assert (=> b!672033 (= res!438594 (bvsgt from!3004 i!1382))))

(declare-fun b!672034 () Bool)

(assert (=> b!672034 (= e!384008 e!384015)))

(declare-fun res!438590 () Bool)

(assert (=> b!672034 (=> (not res!438590) (not e!384015))))

(assert (=> b!672034 (= res!438590 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672035 () Bool)

(assert (=> b!672035 (= e!384016 false)))

(declare-fun lt!312314 () Bool)

(assert (=> b!672035 (= lt!312314 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312316))))

(declare-fun b!672036 () Bool)

(declare-fun res!438591 () Bool)

(assert (=> b!672036 (=> (not res!438591) (not e!384018))))

(assert (=> b!672036 (= res!438591 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12735))))

(declare-fun b!672037 () Bool)

(declare-fun res!438585 () Bool)

(assert (=> b!672037 (=> (not res!438585) (not e!384016))))

(assert (=> b!672037 (= res!438585 (noDuplicate!664 lt!312316))))

(declare-fun b!672038 () Bool)

(assert (=> b!672038 (= e!384009 (contains!3390 acc!681 k0!2843))))

(declare-fun b!672039 () Bool)

(assert (=> b!672039 (= e!384017 e!384013)))

(declare-fun res!438604 () Bool)

(assert (=> b!672039 (=> (not res!438604) (not e!384013))))

(assert (=> b!672039 (= res!438604 (bvsle from!3004 i!1382))))

(declare-fun b!672040 () Bool)

(declare-fun res!438601 () Bool)

(assert (=> b!672040 (=> (not res!438601) (not e!384016))))

(assert (=> b!672040 (= res!438601 (not (contains!3390 lt!312316 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672023 () Bool)

(declare-fun Unit!23574 () Unit!23571)

(assert (=> b!672023 (= e!384011 Unit!23574)))

(declare-fun res!438603 () Bool)

(assert (=> start!60216 (=> (not res!438603) (not e!384018))))

(assert (=> start!60216 (= res!438603 (and (bvslt (size!19154 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19154 a!3626))))))

(assert (=> start!60216 e!384018))

(assert (=> start!60216 true))

(declare-fun array_inv!14649 (array!39201) Bool)

(assert (=> start!60216 (array_inv!14649 a!3626)))

(declare-fun b!672041 () Bool)

(declare-fun e!384010 () Bool)

(assert (=> b!672041 (= e!384010 e!384016)))

(declare-fun res!438583 () Bool)

(assert (=> b!672041 (=> (not res!438583) (not e!384016))))

(assert (=> b!672041 (= res!438583 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!260 (List!12738 (_ BitVec 64)) List!12738)

(assert (=> b!672041 (= lt!312316 ($colon$colon!260 acc!681 (select (arr!18790 a!3626) from!3004)))))

(declare-fun b!672042 () Bool)

(assert (=> b!672042 (= e!384018 e!384010)))

(declare-fun res!438597 () Bool)

(assert (=> b!672042 (=> (not res!438597) (not e!384010))))

(assert (=> b!672042 (= res!438597 (not (= (select (arr!18790 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312313 () Unit!23571)

(assert (=> b!672042 (= lt!312313 e!384011)))

(declare-fun c!77087 () Bool)

(assert (=> b!672042 (= c!77087 (= (select (arr!18790 a!3626) from!3004) k0!2843))))

(declare-fun b!672043 () Bool)

(assert (=> b!672043 (= e!384014 (contains!3390 lt!312316 k0!2843))))

(assert (= (and start!60216 res!438603) b!672030))

(assert (= (and b!672030 res!438586) b!672026))

(assert (= (and b!672026 res!438588) b!672024))

(assert (= (and b!672024 res!438595) b!672033))

(assert (= (and b!672033 res!438594) b!672038))

(assert (= (and b!672033 (not res!438589)) b!672039))

(assert (= (and b!672039 res!438604) b!672021))

(assert (= (and b!672033 res!438581) b!672036))

(assert (= (and b!672036 res!438591) b!672029))

(assert (= (and b!672029 res!438584) b!672018))

(assert (= (and b!672018 res!438592) b!672019))

(assert (= (and b!672019 res!438599) b!672027))

(assert (= (and b!672027 res!438596) b!672032))

(assert (= (and b!672032 res!438600) b!672025))

(assert (= (and b!672025 res!438593) b!672042))

(assert (= (and b!672042 c!77087) b!672031))

(assert (= (and b!672042 (not c!77087)) b!672023))

(assert (= (and b!672042 res!438597) b!672041))

(assert (= (and b!672041 res!438583) b!672037))

(assert (= (and b!672037 res!438585) b!672040))

(assert (= (and b!672040 res!438601) b!672028))

(assert (= (and b!672028 res!438582) b!672020))

(assert (= (and b!672020 res!438602) b!672043))

(assert (= (and b!672020 (not res!438598)) b!672034))

(assert (= (and b!672034 res!438590) b!672022))

(assert (= (and b!672020 res!438587) b!672035))

(declare-fun m!641785 () Bool)

(assert (=> b!672030 m!641785))

(declare-fun m!641787 () Bool)

(assert (=> b!672031 m!641787))

(declare-fun m!641789 () Bool)

(assert (=> b!672031 m!641789))

(declare-fun m!641791 () Bool)

(assert (=> b!672040 m!641791))

(declare-fun m!641793 () Bool)

(assert (=> b!672042 m!641793))

(declare-fun m!641795 () Bool)

(assert (=> b!672038 m!641795))

(declare-fun m!641797 () Bool)

(assert (=> b!672043 m!641797))

(declare-fun m!641799 () Bool)

(assert (=> b!672035 m!641799))

(declare-fun m!641801 () Bool)

(assert (=> b!672028 m!641801))

(declare-fun m!641803 () Bool)

(assert (=> b!672029 m!641803))

(declare-fun m!641805 () Bool)

(assert (=> start!60216 m!641805))

(declare-fun m!641807 () Bool)

(assert (=> b!672024 m!641807))

(assert (=> b!672022 m!641797))

(assert (=> b!672021 m!641795))

(declare-fun m!641809 () Bool)

(assert (=> b!672026 m!641809))

(declare-fun m!641811 () Bool)

(assert (=> b!672037 m!641811))

(assert (=> b!672025 m!641793))

(assert (=> b!672025 m!641793))

(declare-fun m!641813 () Bool)

(assert (=> b!672025 m!641813))

(declare-fun m!641815 () Bool)

(assert (=> b!672027 m!641815))

(declare-fun m!641817 () Bool)

(assert (=> b!672036 m!641817))

(declare-fun m!641819 () Bool)

(assert (=> b!672019 m!641819))

(assert (=> b!672041 m!641793))

(assert (=> b!672041 m!641793))

(declare-fun m!641821 () Bool)

(assert (=> b!672041 m!641821))

(check-sat (not b!672038) (not b!672026) (not b!672041) (not b!672021) (not b!672024) (not b!672028) (not b!672037) (not b!672043) (not start!60216) (not b!672022) (not b!672027) (not b!672019) (not b!672036) (not b!672040) (not b!672025) (not b!672031) (not b!672030) (not b!672029) (not b!672035))
(check-sat)
