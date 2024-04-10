; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60164 () Bool)

(assert start!60164)

(declare-fun res!438697 () Bool)

(declare-fun e!383966 () Bool)

(assert (=> start!60164 (=> (not res!438697) (not e!383966))))

(declare-datatypes ((array!39211 0))(
  ( (array!39212 (arr!18798 (Array (_ BitVec 32) (_ BitVec 64))) (size!19162 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39211)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60164 (= res!438697 (and (bvslt (size!19162 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19162 a!3626))))))

(assert (=> start!60164 e!383966))

(assert (=> start!60164 true))

(declare-fun array_inv!14594 (array!39211) Bool)

(assert (=> start!60164 (array_inv!14594 a!3626)))

(declare-fun b!672028 () Bool)

(declare-fun e!383967 () Bool)

(declare-datatypes ((List!12839 0))(
  ( (Nil!12836) (Cons!12835 (h!13880 (_ BitVec 64)) (t!19067 List!12839)) )
))
(declare-fun lt!312247 () List!12839)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3416 (List!12839 (_ BitVec 64)) Bool)

(assert (=> b!672028 (= e!383967 (contains!3416 lt!312247 k!2843))))

(declare-fun b!672029 () Bool)

(declare-fun res!438694 () Bool)

(assert (=> b!672029 (=> (not res!438694) (not e!383966))))

(declare-fun arrayNoDuplicates!0 (array!39211 (_ BitVec 32) List!12839) Bool)

(assert (=> b!672029 (= res!438694 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12836))))

(declare-fun b!672030 () Bool)

(declare-fun res!438688 () Bool)

(declare-fun e!383975 () Bool)

(assert (=> b!672030 (=> (not res!438688) (not e!383975))))

(assert (=> b!672030 (= res!438688 (not (contains!3416 lt!312247 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672031 () Bool)

(declare-fun e!383976 () Bool)

(assert (=> b!672031 (= e!383976 (not (contains!3416 lt!312247 k!2843)))))

(declare-fun b!672032 () Bool)

(declare-fun res!438704 () Bool)

(assert (=> b!672032 (=> (not res!438704) (not e!383966))))

(declare-fun acc!681 () List!12839)

(assert (=> b!672032 (= res!438704 (not (contains!3416 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672033 () Bool)

(declare-fun res!438689 () Bool)

(assert (=> b!672033 (=> (not res!438689) (not e!383966))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672033 (= res!438689 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19162 a!3626))))))

(declare-fun b!672034 () Bool)

(declare-fun res!438702 () Bool)

(assert (=> b!672034 (=> (not res!438702) (not e!383966))))

(assert (=> b!672034 (= res!438702 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672035 () Bool)

(declare-fun res!438700 () Bool)

(assert (=> b!672035 (=> (not res!438700) (not e!383966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672035 (= res!438700 (validKeyInArray!0 k!2843))))

(declare-fun b!672036 () Bool)

(declare-fun e!383969 () Bool)

(assert (=> b!672036 (= e!383969 e!383976)))

(declare-fun res!438699 () Bool)

(assert (=> b!672036 (=> (not res!438699) (not e!383976))))

(assert (=> b!672036 (= res!438699 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672037 () Bool)

(declare-fun e!383973 () Bool)

(assert (=> b!672037 (= e!383973 (contains!3416 acc!681 k!2843))))

(declare-fun b!672038 () Bool)

(declare-fun res!438696 () Bool)

(assert (=> b!672038 (=> (not res!438696) (not e!383966))))

(assert (=> b!672038 (= res!438696 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19162 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672039 () Bool)

(declare-fun e!383972 () Bool)

(assert (=> b!672039 (= e!383972 e!383975)))

(declare-fun res!438684 () Bool)

(assert (=> b!672039 (=> (not res!438684) (not e!383975))))

(assert (=> b!672039 (= res!438684 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!266 (List!12839 (_ BitVec 64)) List!12839)

(assert (=> b!672039 (= lt!312247 ($colon$colon!266 acc!681 (select (arr!18798 a!3626) from!3004)))))

(declare-fun b!672040 () Bool)

(declare-fun res!438693 () Bool)

(assert (=> b!672040 (=> (not res!438693) (not e!383975))))

(assert (=> b!672040 (= res!438693 (not (contains!3416 lt!312247 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672041 () Bool)

(declare-fun res!438701 () Bool)

(assert (=> b!672041 (=> (not res!438701) (not e!383975))))

(declare-fun noDuplicate!663 (List!12839) Bool)

(assert (=> b!672041 (= res!438701 (noDuplicate!663 lt!312247))))

(declare-fun b!672042 () Bool)

(declare-datatypes ((Unit!23604 0))(
  ( (Unit!23605) )
))
(declare-fun e!383974 () Unit!23604)

(declare-fun Unit!23606 () Unit!23604)

(assert (=> b!672042 (= e!383974 Unit!23606)))

(declare-fun b!672043 () Bool)

(assert (=> b!672043 (= e!383975 false)))

(declare-fun lt!312250 () Bool)

(assert (=> b!672043 (= lt!312250 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312247))))

(declare-fun b!672044 () Bool)

(declare-fun res!438685 () Bool)

(assert (=> b!672044 (=> (not res!438685) (not e!383966))))

(assert (=> b!672044 (= res!438685 (not (contains!3416 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672045 () Bool)

(assert (=> b!672045 (= e!383966 e!383972)))

(declare-fun res!438695 () Bool)

(assert (=> b!672045 (=> (not res!438695) (not e!383972))))

(assert (=> b!672045 (= res!438695 (not (= (select (arr!18798 a!3626) from!3004) k!2843)))))

(declare-fun lt!312249 () Unit!23604)

(assert (=> b!672045 (= lt!312249 e!383974)))

(declare-fun c!77039 () Bool)

(assert (=> b!672045 (= c!77039 (= (select (arr!18798 a!3626) from!3004) k!2843))))

(declare-fun b!672046 () Bool)

(declare-fun Unit!23607 () Unit!23604)

(assert (=> b!672046 (= e!383974 Unit!23607)))

(declare-fun arrayContainsKey!0 (array!39211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672046 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312248 () Unit!23604)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39211 (_ BitVec 64) (_ BitVec 32)) Unit!23604)

(assert (=> b!672046 (= lt!312248 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!672046 false))

(declare-fun b!672047 () Bool)

(declare-fun e!383971 () Bool)

(declare-fun e!383970 () Bool)

(assert (=> b!672047 (= e!383971 e!383970)))

(declare-fun res!438703 () Bool)

(assert (=> b!672047 (=> (not res!438703) (not e!383970))))

(assert (=> b!672047 (= res!438703 (bvsle from!3004 i!1382))))

(declare-fun b!672048 () Bool)

(assert (=> b!672048 (= e!383970 (not (contains!3416 acc!681 k!2843)))))

(declare-fun b!672049 () Bool)

(declare-fun res!438692 () Bool)

(assert (=> b!672049 (=> (not res!438692) (not e!383966))))

(assert (=> b!672049 (= res!438692 e!383971)))

(declare-fun res!438698 () Bool)

(assert (=> b!672049 (=> res!438698 e!383971)))

(assert (=> b!672049 (= res!438698 e!383973)))

(declare-fun res!438687 () Bool)

(assert (=> b!672049 (=> (not res!438687) (not e!383973))))

(assert (=> b!672049 (= res!438687 (bvsgt from!3004 i!1382))))

(declare-fun b!672050 () Bool)

(declare-fun res!438706 () Bool)

(assert (=> b!672050 (=> (not res!438706) (not e!383966))))

(assert (=> b!672050 (= res!438706 (validKeyInArray!0 (select (arr!18798 a!3626) from!3004)))))

(declare-fun b!672051 () Bool)

(declare-fun res!438691 () Bool)

(assert (=> b!672051 (=> (not res!438691) (not e!383966))))

(assert (=> b!672051 (= res!438691 (noDuplicate!663 acc!681))))

(declare-fun b!672052 () Bool)

(declare-fun res!438690 () Bool)

(assert (=> b!672052 (=> (not res!438690) (not e!383975))))

(assert (=> b!672052 (= res!438690 e!383969)))

(declare-fun res!438707 () Bool)

(assert (=> b!672052 (=> res!438707 e!383969)))

(assert (=> b!672052 (= res!438707 e!383967)))

(declare-fun res!438686 () Bool)

(assert (=> b!672052 (=> (not res!438686) (not e!383967))))

(assert (=> b!672052 (= res!438686 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672053 () Bool)

(declare-fun res!438705 () Bool)

(assert (=> b!672053 (=> (not res!438705) (not e!383966))))

(assert (=> b!672053 (= res!438705 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60164 res!438697) b!672051))

(assert (= (and b!672051 res!438691) b!672032))

(assert (= (and b!672032 res!438704) b!672044))

(assert (= (and b!672044 res!438685) b!672049))

(assert (= (and b!672049 res!438687) b!672037))

(assert (= (and b!672049 (not res!438698)) b!672047))

(assert (= (and b!672047 res!438703) b!672048))

(assert (= (and b!672049 res!438692) b!672029))

(assert (= (and b!672029 res!438694) b!672034))

(assert (= (and b!672034 res!438702) b!672033))

(assert (= (and b!672033 res!438689) b!672035))

(assert (= (and b!672035 res!438700) b!672053))

(assert (= (and b!672053 res!438705) b!672038))

(assert (= (and b!672038 res!438696) b!672050))

(assert (= (and b!672050 res!438706) b!672045))

(assert (= (and b!672045 c!77039) b!672046))

(assert (= (and b!672045 (not c!77039)) b!672042))

(assert (= (and b!672045 res!438695) b!672039))

(assert (= (and b!672039 res!438684) b!672041))

(assert (= (and b!672041 res!438701) b!672040))

(assert (= (and b!672040 res!438693) b!672030))

(assert (= (and b!672030 res!438688) b!672052))

(assert (= (and b!672052 res!438686) b!672028))

(assert (= (and b!672052 (not res!438707)) b!672036))

(assert (= (and b!672036 res!438699) b!672031))

(assert (= (and b!672052 res!438690) b!672043))

(declare-fun m!641201 () Bool)

(assert (=> b!672040 m!641201))

(declare-fun m!641203 () Bool)

(assert (=> b!672043 m!641203))

(declare-fun m!641205 () Bool)

(assert (=> b!672044 m!641205))

(declare-fun m!641207 () Bool)

(assert (=> b!672048 m!641207))

(declare-fun m!641209 () Bool)

(assert (=> b!672034 m!641209))

(declare-fun m!641211 () Bool)

(assert (=> start!60164 m!641211))

(declare-fun m!641213 () Bool)

(assert (=> b!672053 m!641213))

(declare-fun m!641215 () Bool)

(assert (=> b!672028 m!641215))

(assert (=> b!672031 m!641215))

(declare-fun m!641217 () Bool)

(assert (=> b!672050 m!641217))

(assert (=> b!672050 m!641217))

(declare-fun m!641219 () Bool)

(assert (=> b!672050 m!641219))

(declare-fun m!641221 () Bool)

(assert (=> b!672051 m!641221))

(declare-fun m!641223 () Bool)

(assert (=> b!672029 m!641223))

(declare-fun m!641225 () Bool)

(assert (=> b!672030 m!641225))

(declare-fun m!641227 () Bool)

(assert (=> b!672032 m!641227))

(assert (=> b!672045 m!641217))

(declare-fun m!641229 () Bool)

(assert (=> b!672046 m!641229))

(declare-fun m!641231 () Bool)

(assert (=> b!672046 m!641231))

(declare-fun m!641233 () Bool)

(assert (=> b!672035 m!641233))

(declare-fun m!641235 () Bool)

(assert (=> b!672041 m!641235))

(assert (=> b!672039 m!641217))

(assert (=> b!672039 m!641217))

(declare-fun m!641237 () Bool)

(assert (=> b!672039 m!641237))

(assert (=> b!672037 m!641207))

(push 1)

