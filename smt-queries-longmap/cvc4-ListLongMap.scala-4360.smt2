; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60192 () Bool)

(assert start!60192)

(declare-fun b!673120 () Bool)

(declare-fun e!384430 () Bool)

(declare-datatypes ((List!12853 0))(
  ( (Nil!12850) (Cons!12849 (h!13894 (_ BitVec 64)) (t!19081 List!12853)) )
))
(declare-fun acc!681 () List!12853)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3430 (List!12853 (_ BitVec 64)) Bool)

(assert (=> b!673120 (= e!384430 (not (contains!3430 acc!681 k!2843)))))

(declare-fun b!673121 () Bool)

(declare-fun res!439705 () Bool)

(declare-fun e!384429 () Bool)

(assert (=> b!673121 (=> (not res!439705) (not e!384429))))

(declare-fun e!384428 () Bool)

(assert (=> b!673121 (= res!439705 e!384428)))

(declare-fun res!439704 () Bool)

(assert (=> b!673121 (=> res!439704 e!384428)))

(declare-fun e!384436 () Bool)

(assert (=> b!673121 (= res!439704 e!384436)))

(declare-fun res!439701 () Bool)

(assert (=> b!673121 (=> (not res!439701) (not e!384436))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673121 (= res!439701 (bvsgt from!3004 i!1382))))

(declare-fun b!673122 () Bool)

(declare-fun res!439700 () Bool)

(declare-fun e!384432 () Bool)

(assert (=> b!673122 (=> (not res!439700) (not e!384432))))

(declare-fun lt!312416 () List!12853)

(assert (=> b!673122 (= res!439700 (not (contains!3430 lt!312416 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673123 () Bool)

(declare-fun e!384437 () Bool)

(declare-fun e!384438 () Bool)

(assert (=> b!673123 (= e!384437 e!384438)))

(declare-fun res!439712 () Bool)

(assert (=> b!673123 (=> (not res!439712) (not e!384438))))

(assert (=> b!673123 (= res!439712 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673124 () Bool)

(assert (=> b!673124 (= e!384428 e!384430)))

(declare-fun res!439699 () Bool)

(assert (=> b!673124 (=> (not res!439699) (not e!384430))))

(assert (=> b!673124 (= res!439699 (bvsle from!3004 i!1382))))

(declare-fun b!673125 () Bool)

(declare-fun res!439703 () Bool)

(assert (=> b!673125 (=> (not res!439703) (not e!384429))))

(assert (=> b!673125 (= res!439703 (not (contains!3430 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673126 () Bool)

(declare-fun res!439709 () Bool)

(assert (=> b!673126 (=> (not res!439709) (not e!384429))))

(declare-datatypes ((array!39239 0))(
  ( (array!39240 (arr!18812 (Array (_ BitVec 32) (_ BitVec 64))) (size!19176 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39239)

(declare-fun arrayContainsKey!0 (array!39239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673126 (= res!439709 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673127 () Bool)

(declare-fun e!384434 () Bool)

(assert (=> b!673127 (= e!384429 e!384434)))

(declare-fun res!439715 () Bool)

(assert (=> b!673127 (=> (not res!439715) (not e!384434))))

(assert (=> b!673127 (= res!439715 (not (= (select (arr!18812 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23660 0))(
  ( (Unit!23661) )
))
(declare-fun lt!312415 () Unit!23660)

(declare-fun e!384431 () Unit!23660)

(assert (=> b!673127 (= lt!312415 e!384431)))

(declare-fun c!77081 () Bool)

(assert (=> b!673127 (= c!77081 (= (select (arr!18812 a!3626) from!3004) k!2843))))

(declare-fun res!439702 () Bool)

(assert (=> start!60192 (=> (not res!439702) (not e!384429))))

(assert (=> start!60192 (= res!439702 (and (bvslt (size!19176 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19176 a!3626))))))

(assert (=> start!60192 e!384429))

(assert (=> start!60192 true))

(declare-fun array_inv!14608 (array!39239) Bool)

(assert (=> start!60192 (array_inv!14608 a!3626)))

(declare-fun b!673128 () Bool)

(declare-fun res!439711 () Bool)

(assert (=> b!673128 (=> (not res!439711) (not e!384429))))

(declare-fun arrayNoDuplicates!0 (array!39239 (_ BitVec 32) List!12853) Bool)

(assert (=> b!673128 (= res!439711 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673129 () Bool)

(declare-fun e!384433 () Bool)

(assert (=> b!673129 (= e!384433 (contains!3430 lt!312416 k!2843))))

(declare-fun b!673130 () Bool)

(assert (=> b!673130 (= e!384436 (contains!3430 acc!681 k!2843))))

(declare-fun b!673131 () Bool)

(declare-fun res!439708 () Bool)

(assert (=> b!673131 (=> (not res!439708) (not e!384429))))

(assert (=> b!673131 (= res!439708 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19176 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673132 () Bool)

(declare-fun res!439693 () Bool)

(assert (=> b!673132 (=> (not res!439693) (not e!384432))))

(assert (=> b!673132 (= res!439693 (not (contains!3430 lt!312416 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673133 () Bool)

(declare-fun res!439694 () Bool)

(assert (=> b!673133 (=> (not res!439694) (not e!384432))))

(assert (=> b!673133 (= res!439694 e!384437)))

(declare-fun res!439706 () Bool)

(assert (=> b!673133 (=> res!439706 e!384437)))

(assert (=> b!673133 (= res!439706 e!384433)))

(declare-fun res!439696 () Bool)

(assert (=> b!673133 (=> (not res!439696) (not e!384433))))

(assert (=> b!673133 (= res!439696 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673134 () Bool)

(declare-fun res!439698 () Bool)

(assert (=> b!673134 (=> (not res!439698) (not e!384429))))

(assert (=> b!673134 (= res!439698 (not (contains!3430 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673135 () Bool)

(declare-fun res!439697 () Bool)

(assert (=> b!673135 (=> (not res!439697) (not e!384429))))

(assert (=> b!673135 (= res!439697 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19176 a!3626))))))

(declare-fun b!673136 () Bool)

(assert (=> b!673136 (= e!384432 false)))

(declare-fun lt!312418 () Bool)

(assert (=> b!673136 (= lt!312418 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312416))))

(declare-fun b!673137 () Bool)

(declare-fun res!439695 () Bool)

(assert (=> b!673137 (=> (not res!439695) (not e!384429))))

(declare-fun noDuplicate!677 (List!12853) Bool)

(assert (=> b!673137 (= res!439695 (noDuplicate!677 acc!681))))

(declare-fun b!673138 () Bool)

(declare-fun res!439714 () Bool)

(assert (=> b!673138 (=> (not res!439714) (not e!384429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673138 (= res!439714 (validKeyInArray!0 (select (arr!18812 a!3626) from!3004)))))

(declare-fun b!673139 () Bool)

(declare-fun res!439713 () Bool)

(assert (=> b!673139 (=> (not res!439713) (not e!384429))))

(assert (=> b!673139 (= res!439713 (validKeyInArray!0 k!2843))))

(declare-fun b!673140 () Bool)

(assert (=> b!673140 (= e!384434 e!384432)))

(declare-fun res!439710 () Bool)

(assert (=> b!673140 (=> (not res!439710) (not e!384432))))

(assert (=> b!673140 (= res!439710 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!280 (List!12853 (_ BitVec 64)) List!12853)

(assert (=> b!673140 (= lt!312416 ($colon$colon!280 acc!681 (select (arr!18812 a!3626) from!3004)))))

(declare-fun b!673141 () Bool)

(declare-fun Unit!23662 () Unit!23660)

(assert (=> b!673141 (= e!384431 Unit!23662)))

(declare-fun b!673142 () Bool)

(declare-fun res!439707 () Bool)

(assert (=> b!673142 (=> (not res!439707) (not e!384429))))

(assert (=> b!673142 (= res!439707 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12850))))

(declare-fun b!673143 () Bool)

(assert (=> b!673143 (= e!384438 (not (contains!3430 lt!312416 k!2843)))))

(declare-fun b!673144 () Bool)

(declare-fun Unit!23663 () Unit!23660)

(assert (=> b!673144 (= e!384431 Unit!23663)))

(assert (=> b!673144 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312417 () Unit!23660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39239 (_ BitVec 64) (_ BitVec 32)) Unit!23660)

(assert (=> b!673144 (= lt!312417 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673144 false))

(declare-fun b!673145 () Bool)

(declare-fun res!439692 () Bool)

(assert (=> b!673145 (=> (not res!439692) (not e!384432))))

(assert (=> b!673145 (= res!439692 (noDuplicate!677 lt!312416))))

(assert (= (and start!60192 res!439702) b!673137))

(assert (= (and b!673137 res!439695) b!673125))

(assert (= (and b!673125 res!439703) b!673134))

(assert (= (and b!673134 res!439698) b!673121))

(assert (= (and b!673121 res!439701) b!673130))

(assert (= (and b!673121 (not res!439704)) b!673124))

(assert (= (and b!673124 res!439699) b!673120))

(assert (= (and b!673121 res!439705) b!673142))

(assert (= (and b!673142 res!439707) b!673128))

(assert (= (and b!673128 res!439711) b!673135))

(assert (= (and b!673135 res!439697) b!673139))

(assert (= (and b!673139 res!439713) b!673126))

(assert (= (and b!673126 res!439709) b!673131))

(assert (= (and b!673131 res!439708) b!673138))

(assert (= (and b!673138 res!439714) b!673127))

(assert (= (and b!673127 c!77081) b!673144))

(assert (= (and b!673127 (not c!77081)) b!673141))

(assert (= (and b!673127 res!439715) b!673140))

(assert (= (and b!673140 res!439710) b!673145))

(assert (= (and b!673145 res!439692) b!673132))

(assert (= (and b!673132 res!439693) b!673122))

(assert (= (and b!673122 res!439700) b!673133))

(assert (= (and b!673133 res!439696) b!673129))

(assert (= (and b!673133 (not res!439706)) b!673123))

(assert (= (and b!673123 res!439712) b!673143))

(assert (= (and b!673133 res!439694) b!673136))

(declare-fun m!641733 () Bool)

(assert (=> b!673136 m!641733))

(declare-fun m!641735 () Bool)

(assert (=> b!673130 m!641735))

(declare-fun m!641737 () Bool)

(assert (=> start!60192 m!641737))

(declare-fun m!641739 () Bool)

(assert (=> b!673128 m!641739))

(declare-fun m!641741 () Bool)

(assert (=> b!673125 m!641741))

(declare-fun m!641743 () Bool)

(assert (=> b!673127 m!641743))

(declare-fun m!641745 () Bool)

(assert (=> b!673129 m!641745))

(declare-fun m!641747 () Bool)

(assert (=> b!673142 m!641747))

(declare-fun m!641749 () Bool)

(assert (=> b!673145 m!641749))

(declare-fun m!641751 () Bool)

(assert (=> b!673144 m!641751))

(declare-fun m!641753 () Bool)

(assert (=> b!673144 m!641753))

(declare-fun m!641755 () Bool)

(assert (=> b!673132 m!641755))

(assert (=> b!673120 m!641735))

(assert (=> b!673143 m!641745))

(declare-fun m!641757 () Bool)

(assert (=> b!673137 m!641757))

(assert (=> b!673138 m!641743))

(assert (=> b!673138 m!641743))

(declare-fun m!641759 () Bool)

(assert (=> b!673138 m!641759))

(declare-fun m!641761 () Bool)

(assert (=> b!673122 m!641761))

(declare-fun m!641763 () Bool)

(assert (=> b!673139 m!641763))

(declare-fun m!641765 () Bool)

(assert (=> b!673134 m!641765))

(declare-fun m!641767 () Bool)

(assert (=> b!673126 m!641767))

(assert (=> b!673140 m!641743))

(assert (=> b!673140 m!641743))

(declare-fun m!641769 () Bool)

(assert (=> b!673140 m!641769))

(push 1)

