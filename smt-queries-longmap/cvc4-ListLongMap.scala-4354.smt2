; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60156 () Bool)

(assert start!60156)

(declare-fun b!671716 () Bool)

(declare-fun e!383837 () Bool)

(declare-fun e!383839 () Bool)

(assert (=> b!671716 (= e!383837 e!383839)))

(declare-fun res!438411 () Bool)

(assert (=> b!671716 (=> (not res!438411) (not e!383839))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!671716 (= res!438411 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12835 0))(
  ( (Nil!12832) (Cons!12831 (h!13876 (_ BitVec 64)) (t!19063 List!12835)) )
))
(declare-fun lt!312199 () List!12835)

(declare-datatypes ((array!39203 0))(
  ( (array!39204 (arr!18794 (Array (_ BitVec 32) (_ BitVec 64))) (size!19158 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39203)

(declare-fun acc!681 () List!12835)

(declare-fun $colon$colon!262 (List!12835 (_ BitVec 64)) List!12835)

(assert (=> b!671716 (= lt!312199 ($colon$colon!262 acc!681 (select (arr!18794 a!3626) from!3004)))))

(declare-fun b!671717 () Bool)

(declare-datatypes ((Unit!23588 0))(
  ( (Unit!23589) )
))
(declare-fun e!383842 () Unit!23588)

(declare-fun Unit!23590 () Unit!23588)

(assert (=> b!671717 (= e!383842 Unit!23590)))

(declare-fun b!671718 () Bool)

(declare-fun res!438404 () Bool)

(assert (=> b!671718 (=> (not res!438404) (not e!383839))))

(declare-fun contains!3412 (List!12835 (_ BitVec 64)) Bool)

(assert (=> b!671718 (= res!438404 (not (contains!3412 lt!312199 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671719 () Bool)

(assert (=> b!671719 (= e!383839 false)))

(declare-fun lt!312200 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39203 (_ BitVec 32) List!12835) Bool)

(assert (=> b!671719 (= lt!312200 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312199))))

(declare-fun b!671720 () Bool)

(declare-fun res!438398 () Bool)

(declare-fun e!383836 () Bool)

(assert (=> b!671720 (=> (not res!438398) (not e!383836))))

(declare-fun noDuplicate!659 (List!12835) Bool)

(assert (=> b!671720 (= res!438398 (noDuplicate!659 acc!681))))

(declare-fun b!671721 () Bool)

(declare-fun res!438401 () Bool)

(assert (=> b!671721 (=> (not res!438401) (not e!383836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671721 (= res!438401 (validKeyInArray!0 (select (arr!18794 a!3626) from!3004)))))

(declare-fun b!671722 () Bool)

(declare-fun e!383834 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!671722 (= e!383834 (not (contains!3412 lt!312199 k!2843)))))

(declare-fun b!671723 () Bool)

(declare-fun e!383841 () Bool)

(assert (=> b!671723 (= e!383841 (contains!3412 acc!681 k!2843))))

(declare-fun b!671724 () Bool)

(declare-fun res!438402 () Bool)

(assert (=> b!671724 (=> (not res!438402) (not e!383836))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671724 (= res!438402 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19158 a!3626))))))

(declare-fun b!671725 () Bool)

(declare-fun res!438409 () Bool)

(assert (=> b!671725 (=> (not res!438409) (not e!383836))))

(assert (=> b!671725 (= res!438409 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19158 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671726 () Bool)

(declare-fun res!438400 () Bool)

(assert (=> b!671726 (=> (not res!438400) (not e!383839))))

(assert (=> b!671726 (= res!438400 (noDuplicate!659 lt!312199))))

(declare-fun b!671727 () Bool)

(declare-fun Unit!23591 () Unit!23588)

(assert (=> b!671727 (= e!383842 Unit!23591)))

(declare-fun arrayContainsKey!0 (array!39203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671727 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312202 () Unit!23588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39203 (_ BitVec 64) (_ BitVec 32)) Unit!23588)

(assert (=> b!671727 (= lt!312202 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!671727 false))

(declare-fun b!671728 () Bool)

(assert (=> b!671728 (= e!383836 e!383837)))

(declare-fun res!438407 () Bool)

(assert (=> b!671728 (=> (not res!438407) (not e!383837))))

(assert (=> b!671728 (= res!438407 (not (= (select (arr!18794 a!3626) from!3004) k!2843)))))

(declare-fun lt!312201 () Unit!23588)

(assert (=> b!671728 (= lt!312201 e!383842)))

(declare-fun c!77027 () Bool)

(assert (=> b!671728 (= c!77027 (= (select (arr!18794 a!3626) from!3004) k!2843))))

(declare-fun b!671729 () Bool)

(declare-fun e!383844 () Bool)

(assert (=> b!671729 (= e!383844 (contains!3412 lt!312199 k!2843))))

(declare-fun b!671730 () Bool)

(declare-fun res!438415 () Bool)

(assert (=> b!671730 (=> (not res!438415) (not e!383836))))

(assert (=> b!671730 (= res!438415 (validKeyInArray!0 k!2843))))

(declare-fun b!671731 () Bool)

(declare-fun res!438396 () Bool)

(assert (=> b!671731 (=> (not res!438396) (not e!383839))))

(declare-fun e!383838 () Bool)

(assert (=> b!671731 (= res!438396 e!383838)))

(declare-fun res!438403 () Bool)

(assert (=> b!671731 (=> res!438403 e!383838)))

(assert (=> b!671731 (= res!438403 e!383844)))

(declare-fun res!438399 () Bool)

(assert (=> b!671731 (=> (not res!438399) (not e!383844))))

(assert (=> b!671731 (= res!438399 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671732 () Bool)

(declare-fun e!383843 () Bool)

(declare-fun e!383840 () Bool)

(assert (=> b!671732 (= e!383843 e!383840)))

(declare-fun res!438417 () Bool)

(assert (=> b!671732 (=> (not res!438417) (not e!383840))))

(assert (=> b!671732 (= res!438417 (bvsle from!3004 i!1382))))

(declare-fun b!671733 () Bool)

(declare-fun res!438397 () Bool)

(assert (=> b!671733 (=> (not res!438397) (not e!383836))))

(assert (=> b!671733 (= res!438397 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12832))))

(declare-fun b!671734 () Bool)

(assert (=> b!671734 (= e!383840 (not (contains!3412 acc!681 k!2843)))))

(declare-fun b!671735 () Bool)

(declare-fun res!438410 () Bool)

(assert (=> b!671735 (=> (not res!438410) (not e!383839))))

(assert (=> b!671735 (= res!438410 (not (contains!3412 lt!312199 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671736 () Bool)

(declare-fun res!438412 () Bool)

(assert (=> b!671736 (=> (not res!438412) (not e!383836))))

(assert (=> b!671736 (= res!438412 (not (contains!3412 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!438413 () Bool)

(assert (=> start!60156 (=> (not res!438413) (not e!383836))))

(assert (=> start!60156 (= res!438413 (and (bvslt (size!19158 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19158 a!3626))))))

(assert (=> start!60156 e!383836))

(assert (=> start!60156 true))

(declare-fun array_inv!14590 (array!39203) Bool)

(assert (=> start!60156 (array_inv!14590 a!3626)))

(declare-fun b!671737 () Bool)

(assert (=> b!671737 (= e!383838 e!383834)))

(declare-fun res!438418 () Bool)

(assert (=> b!671737 (=> (not res!438418) (not e!383834))))

(assert (=> b!671737 (= res!438418 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!671738 () Bool)

(declare-fun res!438416 () Bool)

(assert (=> b!671738 (=> (not res!438416) (not e!383836))))

(assert (=> b!671738 (= res!438416 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671739 () Bool)

(declare-fun res!438419 () Bool)

(assert (=> b!671739 (=> (not res!438419) (not e!383836))))

(assert (=> b!671739 (= res!438419 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671740 () Bool)

(declare-fun res!438408 () Bool)

(assert (=> b!671740 (=> (not res!438408) (not e!383836))))

(assert (=> b!671740 (= res!438408 e!383843)))

(declare-fun res!438405 () Bool)

(assert (=> b!671740 (=> res!438405 e!383843)))

(assert (=> b!671740 (= res!438405 e!383841)))

(declare-fun res!438414 () Bool)

(assert (=> b!671740 (=> (not res!438414) (not e!383841))))

(assert (=> b!671740 (= res!438414 (bvsgt from!3004 i!1382))))

(declare-fun b!671741 () Bool)

(declare-fun res!438406 () Bool)

(assert (=> b!671741 (=> (not res!438406) (not e!383836))))

(assert (=> b!671741 (= res!438406 (not (contains!3412 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60156 res!438413) b!671720))

(assert (= (and b!671720 res!438398) b!671736))

(assert (= (and b!671736 res!438412) b!671741))

(assert (= (and b!671741 res!438406) b!671740))

(assert (= (and b!671740 res!438414) b!671723))

(assert (= (and b!671740 (not res!438405)) b!671732))

(assert (= (and b!671732 res!438417) b!671734))

(assert (= (and b!671740 res!438408) b!671733))

(assert (= (and b!671733 res!438397) b!671738))

(assert (= (and b!671738 res!438416) b!671724))

(assert (= (and b!671724 res!438402) b!671730))

(assert (= (and b!671730 res!438415) b!671739))

(assert (= (and b!671739 res!438419) b!671725))

(assert (= (and b!671725 res!438409) b!671721))

(assert (= (and b!671721 res!438401) b!671728))

(assert (= (and b!671728 c!77027) b!671727))

(assert (= (and b!671728 (not c!77027)) b!671717))

(assert (= (and b!671728 res!438407) b!671716))

(assert (= (and b!671716 res!438411) b!671726))

(assert (= (and b!671726 res!438400) b!671718))

(assert (= (and b!671718 res!438404) b!671735))

(assert (= (and b!671735 res!438410) b!671731))

(assert (= (and b!671731 res!438399) b!671729))

(assert (= (and b!671731 (not res!438403)) b!671737))

(assert (= (and b!671737 res!438418) b!671722))

(assert (= (and b!671731 res!438396) b!671719))

(declare-fun m!641049 () Bool)

(assert (=> b!671735 m!641049))

(declare-fun m!641051 () Bool)

(assert (=> b!671720 m!641051))

(declare-fun m!641053 () Bool)

(assert (=> b!671721 m!641053))

(assert (=> b!671721 m!641053))

(declare-fun m!641055 () Bool)

(assert (=> b!671721 m!641055))

(declare-fun m!641057 () Bool)

(assert (=> b!671738 m!641057))

(declare-fun m!641059 () Bool)

(assert (=> b!671719 m!641059))

(declare-fun m!641061 () Bool)

(assert (=> b!671739 m!641061))

(declare-fun m!641063 () Bool)

(assert (=> b!671730 m!641063))

(assert (=> b!671716 m!641053))

(assert (=> b!671716 m!641053))

(declare-fun m!641065 () Bool)

(assert (=> b!671716 m!641065))

(declare-fun m!641067 () Bool)

(assert (=> b!671734 m!641067))

(declare-fun m!641069 () Bool)

(assert (=> b!671733 m!641069))

(declare-fun m!641071 () Bool)

(assert (=> b!671736 m!641071))

(declare-fun m!641073 () Bool)

(assert (=> b!671718 m!641073))

(declare-fun m!641075 () Bool)

(assert (=> b!671722 m!641075))

(assert (=> b!671729 m!641075))

(declare-fun m!641077 () Bool)

(assert (=> start!60156 m!641077))

(assert (=> b!671728 m!641053))

(declare-fun m!641079 () Bool)

(assert (=> b!671741 m!641079))

(declare-fun m!641081 () Bool)

(assert (=> b!671727 m!641081))

(declare-fun m!641083 () Bool)

(assert (=> b!671727 m!641083))

(assert (=> b!671723 m!641067))

(declare-fun m!641085 () Bool)

(assert (=> b!671726 m!641085))

(push 1)

