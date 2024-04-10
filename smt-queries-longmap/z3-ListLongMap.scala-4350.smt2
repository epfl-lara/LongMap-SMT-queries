; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60130 () Bool)

(assert start!60130)

(declare-fun b!671012 () Bool)

(declare-fun e!383591 () Bool)

(assert (=> b!671012 (= e!383591 (not true))))

(declare-datatypes ((array!39177 0))(
  ( (array!39178 (arr!18781 (Array (_ BitVec 32) (_ BitVec 64))) (size!19145 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39177)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!39177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671012 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun b!671013 () Bool)

(declare-fun res!437714 () Bool)

(assert (=> b!671013 (=> (not res!437714) (not e!383591))))

(assert (=> b!671013 (= res!437714 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671014 () Bool)

(declare-fun res!437719 () Bool)

(assert (=> b!671014 (=> (not res!437719) (not e!383591))))

(declare-datatypes ((List!12822 0))(
  ( (Nil!12819) (Cons!12818 (h!13863 (_ BitVec 64)) (t!19050 List!12822)) )
))
(declare-fun arrayNoDuplicates!0 (array!39177 (_ BitVec 32) List!12822) Bool)

(assert (=> b!671014 (= res!437719 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12819))))

(declare-fun b!671015 () Bool)

(declare-fun e!383593 () Bool)

(declare-fun acc!681 () List!12822)

(declare-fun contains!3399 (List!12822 (_ BitVec 64)) Bool)

(assert (=> b!671015 (= e!383593 (contains!3399 acc!681 k0!2843))))

(declare-fun b!671016 () Bool)

(declare-fun res!437711 () Bool)

(assert (=> b!671016 (=> (not res!437711) (not e!383591))))

(assert (=> b!671016 (= res!437711 (not (contains!3399 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671017 () Bool)

(declare-fun res!437709 () Bool)

(assert (=> b!671017 (=> (not res!437709) (not e!383591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671017 (= res!437709 (validKeyInArray!0 k0!2843))))

(declare-fun b!671018 () Bool)

(declare-fun res!437716 () Bool)

(assert (=> b!671018 (=> (not res!437716) (not e!383591))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671018 (= res!437716 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19145 a!3626))))))

(declare-fun b!671019 () Bool)

(declare-fun res!437713 () Bool)

(assert (=> b!671019 (=> (not res!437713) (not e!383591))))

(assert (=> b!671019 (= res!437713 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437710 () Bool)

(assert (=> start!60130 (=> (not res!437710) (not e!383591))))

(assert (=> start!60130 (= res!437710 (and (bvslt (size!19145 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19145 a!3626))))))

(assert (=> start!60130 e!383591))

(assert (=> start!60130 true))

(declare-fun array_inv!14577 (array!39177) Bool)

(assert (=> start!60130 (array_inv!14577 a!3626)))

(declare-fun b!671020 () Bool)

(declare-fun res!437708 () Bool)

(assert (=> b!671020 (=> (not res!437708) (not e!383591))))

(assert (=> b!671020 (= res!437708 (= (select (arr!18781 a!3626) from!3004) k0!2843))))

(declare-fun b!671021 () Bool)

(declare-fun e!383592 () Bool)

(assert (=> b!671021 (= e!383592 (not (contains!3399 acc!681 k0!2843)))))

(declare-fun b!671022 () Bool)

(declare-fun res!437722 () Bool)

(assert (=> b!671022 (=> (not res!437722) (not e!383591))))

(assert (=> b!671022 (= res!437722 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19145 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671023 () Bool)

(declare-fun res!437720 () Bool)

(assert (=> b!671023 (=> (not res!437720) (not e!383591))))

(assert (=> b!671023 (= res!437720 (not (contains!3399 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671024 () Bool)

(declare-fun res!437723 () Bool)

(assert (=> b!671024 (=> (not res!437723) (not e!383591))))

(assert (=> b!671024 (= res!437723 (validKeyInArray!0 (select (arr!18781 a!3626) from!3004)))))

(declare-fun b!671025 () Bool)

(declare-fun e!383595 () Bool)

(assert (=> b!671025 (= e!383595 e!383592)))

(declare-fun res!437712 () Bool)

(assert (=> b!671025 (=> (not res!437712) (not e!383592))))

(assert (=> b!671025 (= res!437712 (bvsle from!3004 i!1382))))

(declare-fun b!671026 () Bool)

(declare-fun res!437717 () Bool)

(assert (=> b!671026 (=> (not res!437717) (not e!383591))))

(declare-fun noDuplicate!646 (List!12822) Bool)

(assert (=> b!671026 (= res!437717 (noDuplicate!646 acc!681))))

(declare-fun b!671027 () Bool)

(declare-fun res!437718 () Bool)

(assert (=> b!671027 (=> (not res!437718) (not e!383591))))

(assert (=> b!671027 (= res!437718 e!383595)))

(declare-fun res!437715 () Bool)

(assert (=> b!671027 (=> res!437715 e!383595)))

(assert (=> b!671027 (= res!437715 e!383593)))

(declare-fun res!437721 () Bool)

(assert (=> b!671027 (=> (not res!437721) (not e!383593))))

(assert (=> b!671027 (= res!437721 (bvsgt from!3004 i!1382))))

(assert (= (and start!60130 res!437710) b!671026))

(assert (= (and b!671026 res!437717) b!671016))

(assert (= (and b!671016 res!437711) b!671023))

(assert (= (and b!671023 res!437720) b!671027))

(assert (= (and b!671027 res!437721) b!671015))

(assert (= (and b!671027 (not res!437715)) b!671025))

(assert (= (and b!671025 res!437712) b!671021))

(assert (= (and b!671027 res!437718) b!671014))

(assert (= (and b!671014 res!437719) b!671019))

(assert (= (and b!671019 res!437713) b!671018))

(assert (= (and b!671018 res!437716) b!671017))

(assert (= (and b!671017 res!437709) b!671013))

(assert (= (and b!671013 res!437714) b!671022))

(assert (= (and b!671022 res!437722) b!671024))

(assert (= (and b!671024 res!437723) b!671020))

(assert (= (and b!671020 res!437708) b!671012))

(declare-fun m!640709 () Bool)

(assert (=> b!671023 m!640709))

(declare-fun m!640711 () Bool)

(assert (=> b!671016 m!640711))

(declare-fun m!640713 () Bool)

(assert (=> b!671014 m!640713))

(declare-fun m!640715 () Bool)

(assert (=> b!671026 m!640715))

(declare-fun m!640717 () Bool)

(assert (=> b!671020 m!640717))

(declare-fun m!640719 () Bool)

(assert (=> start!60130 m!640719))

(declare-fun m!640721 () Bool)

(assert (=> b!671012 m!640721))

(declare-fun m!640723 () Bool)

(assert (=> b!671013 m!640723))

(declare-fun m!640725 () Bool)

(assert (=> b!671019 m!640725))

(declare-fun m!640727 () Bool)

(assert (=> b!671015 m!640727))

(assert (=> b!671021 m!640727))

(assert (=> b!671024 m!640717))

(assert (=> b!671024 m!640717))

(declare-fun m!640729 () Bool)

(assert (=> b!671024 m!640729))

(declare-fun m!640731 () Bool)

(assert (=> b!671017 m!640731))

(check-sat (not b!671013) (not b!671016) (not b!671017) (not b!671015) (not b!671024) (not b!671026) (not start!60130) (not b!671019) (not b!671021) (not b!671012) (not b!671014) (not b!671023))
(check-sat)
