; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60876 () Bool)

(assert start!60876)

(declare-fun b!682839 () Bool)

(declare-datatypes ((Unit!23977 0))(
  ( (Unit!23978) )
))
(declare-fun e!389023 () Unit!23977)

(declare-fun Unit!23979 () Unit!23977)

(assert (=> b!682839 (= e!389023 Unit!23979)))

(declare-fun lt!313670 () Unit!23977)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39560 0))(
  ( (array!39561 (arr!18962 (Array (_ BitVec 32) (_ BitVec 64))) (size!19326 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39560 (_ BitVec 64) (_ BitVec 32)) Unit!23977)

(assert (=> b!682839 (= lt!313670 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682839 false))

(declare-fun res!448747 () Bool)

(declare-fun e!389025 () Bool)

(assert (=> start!60876 (=> (not res!448747) (not e!389025))))

(assert (=> start!60876 (= res!448747 (and (bvslt (size!19326 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19326 a!3626))))))

(assert (=> start!60876 e!389025))

(assert (=> start!60876 true))

(declare-fun array_inv!14758 (array!39560) Bool)

(assert (=> start!60876 (array_inv!14758 a!3626)))

(declare-fun b!682840 () Bool)

(declare-fun Unit!23980 () Unit!23977)

(assert (=> b!682840 (= e!389023 Unit!23980)))

(declare-fun b!682841 () Bool)

(declare-fun e!389026 () Bool)

(declare-datatypes ((List!13003 0))(
  ( (Nil!13000) (Cons!12999 (h!14044 (_ BitVec 64)) (t!19246 List!13003)) )
))
(declare-fun acc!681 () List!13003)

(declare-fun contains!3580 (List!13003 (_ BitVec 64)) Bool)

(assert (=> b!682841 (= e!389026 (not (contains!3580 acc!681 k!2843)))))

(declare-fun b!682842 () Bool)

(declare-fun res!448753 () Bool)

(assert (=> b!682842 (=> (not res!448753) (not e!389025))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682842 (= res!448753 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19326 a!3626))))))

(declare-fun b!682843 () Bool)

(declare-fun e!389027 () Unit!23977)

(declare-fun lt!313669 () Unit!23977)

(assert (=> b!682843 (= e!389027 lt!313669)))

(declare-fun lt!313671 () Unit!23977)

(declare-fun lemmaListSubSeqRefl!0 (List!13003) Unit!23977)

(assert (=> b!682843 (= lt!313671 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!166 (List!13003 List!13003) Bool)

(assert (=> b!682843 (subseq!166 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39560 List!13003 List!13003 (_ BitVec 32)) Unit!23977)

(declare-fun $colon$colon!331 (List!13003 (_ BitVec 64)) List!13003)

(assert (=> b!682843 (= lt!313669 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!331 acc!681 (select (arr!18962 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39560 (_ BitVec 32) List!13003) Bool)

(assert (=> b!682843 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682844 () Bool)

(declare-fun e!389024 () Bool)

(assert (=> b!682844 (= e!389024 e!389026)))

(declare-fun res!448755 () Bool)

(assert (=> b!682844 (=> (not res!448755) (not e!389026))))

(assert (=> b!682844 (= res!448755 (bvsle from!3004 i!1382))))

(declare-fun b!682845 () Bool)

(declare-fun Unit!23981 () Unit!23977)

(assert (=> b!682845 (= e!389027 Unit!23981)))

(declare-fun b!682846 () Bool)

(assert (=> b!682846 (= e!389025 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun -!131 (List!13003 (_ BitVec 64)) List!13003)

(assert (=> b!682846 (= (-!131 ($colon$colon!331 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313674 () Unit!23977)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13003) Unit!23977)

(assert (=> b!682846 (= lt!313674 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!682846 (subseq!166 acc!681 acc!681)))

(declare-fun lt!313673 () Unit!23977)

(assert (=> b!682846 (= lt!313673 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682846 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313672 () Unit!23977)

(assert (=> b!682846 (= lt!313672 e!389027)))

(declare-fun c!77414 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682846 (= c!77414 (validKeyInArray!0 (select (arr!18962 a!3626) from!3004)))))

(declare-fun lt!313675 () Unit!23977)

(assert (=> b!682846 (= lt!313675 e!389023)))

(declare-fun c!77413 () Bool)

(declare-fun arrayContainsKey!0 (array!39560 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682846 (= c!77413 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682846 (arrayContainsKey!0 (array!39561 (store (arr!18962 a!3626) i!1382 k!2843) (size!19326 a!3626)) k!2843 from!3004)))

(declare-fun b!682847 () Bool)

(declare-fun res!448756 () Bool)

(assert (=> b!682847 (=> (not res!448756) (not e!389025))))

(assert (=> b!682847 (= res!448756 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19326 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682848 () Bool)

(declare-fun res!448751 () Bool)

(assert (=> b!682848 (=> (not res!448751) (not e!389025))))

(assert (=> b!682848 (= res!448751 e!389024)))

(declare-fun res!448760 () Bool)

(assert (=> b!682848 (=> res!448760 e!389024)))

(declare-fun e!389022 () Bool)

(assert (=> b!682848 (= res!448760 e!389022)))

(declare-fun res!448754 () Bool)

(assert (=> b!682848 (=> (not res!448754) (not e!389022))))

(assert (=> b!682848 (= res!448754 (bvsgt from!3004 i!1382))))

(declare-fun b!682849 () Bool)

(assert (=> b!682849 (= e!389022 (contains!3580 acc!681 k!2843))))

(declare-fun b!682850 () Bool)

(declare-fun res!448757 () Bool)

(assert (=> b!682850 (=> (not res!448757) (not e!389025))))

(assert (=> b!682850 (= res!448757 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682851 () Bool)

(declare-fun res!448752 () Bool)

(assert (=> b!682851 (=> (not res!448752) (not e!389025))))

(assert (=> b!682851 (= res!448752 (validKeyInArray!0 k!2843))))

(declare-fun b!682852 () Bool)

(declare-fun res!448750 () Bool)

(assert (=> b!682852 (=> (not res!448750) (not e!389025))))

(assert (=> b!682852 (= res!448750 (not (contains!3580 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682853 () Bool)

(declare-fun res!448749 () Bool)

(assert (=> b!682853 (=> (not res!448749) (not e!389025))))

(assert (=> b!682853 (= res!448749 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13000))))

(declare-fun b!682854 () Bool)

(declare-fun res!448759 () Bool)

(assert (=> b!682854 (=> (not res!448759) (not e!389025))))

(declare-fun noDuplicate!827 (List!13003) Bool)

(assert (=> b!682854 (= res!448759 (noDuplicate!827 acc!681))))

(declare-fun b!682855 () Bool)

(declare-fun res!448748 () Bool)

(assert (=> b!682855 (=> (not res!448748) (not e!389025))))

(assert (=> b!682855 (= res!448748 (not (contains!3580 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682856 () Bool)

(declare-fun res!448758 () Bool)

(assert (=> b!682856 (=> (not res!448758) (not e!389025))))

(assert (=> b!682856 (= res!448758 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!60876 res!448747) b!682854))

(assert (= (and b!682854 res!448759) b!682855))

(assert (= (and b!682855 res!448748) b!682852))

(assert (= (and b!682852 res!448750) b!682848))

(assert (= (and b!682848 res!448754) b!682849))

(assert (= (and b!682848 (not res!448760)) b!682844))

(assert (= (and b!682844 res!448755) b!682841))

(assert (= (and b!682848 res!448751) b!682853))

(assert (= (and b!682853 res!448749) b!682850))

(assert (= (and b!682850 res!448757) b!682842))

(assert (= (and b!682842 res!448753) b!682851))

(assert (= (and b!682851 res!448752) b!682856))

(assert (= (and b!682856 res!448758) b!682847))

(assert (= (and b!682847 res!448756) b!682846))

(assert (= (and b!682846 c!77413) b!682839))

(assert (= (and b!682846 (not c!77413)) b!682840))

(assert (= (and b!682846 c!77414) b!682843))

(assert (= (and b!682846 (not c!77414)) b!682845))

(declare-fun m!647467 () Bool)

(assert (=> b!682841 m!647467))

(declare-fun m!647469 () Bool)

(assert (=> b!682852 m!647469))

(declare-fun m!647471 () Bool)

(assert (=> b!682850 m!647471))

(declare-fun m!647473 () Bool)

(assert (=> start!60876 m!647473))

(declare-fun m!647475 () Bool)

(assert (=> b!682855 m!647475))

(declare-fun m!647477 () Bool)

(assert (=> b!682843 m!647477))

(declare-fun m!647479 () Bool)

(assert (=> b!682843 m!647479))

(declare-fun m!647481 () Bool)

(assert (=> b!682843 m!647481))

(declare-fun m!647483 () Bool)

(assert (=> b!682843 m!647483))

(assert (=> b!682843 m!647479))

(assert (=> b!682843 m!647481))

(declare-fun m!647485 () Bool)

(assert (=> b!682843 m!647485))

(declare-fun m!647487 () Bool)

(assert (=> b!682843 m!647487))

(declare-fun m!647489 () Bool)

(assert (=> b!682846 m!647489))

(declare-fun m!647491 () Bool)

(assert (=> b!682846 m!647491))

(assert (=> b!682846 m!647477))

(assert (=> b!682846 m!647479))

(declare-fun m!647493 () Bool)

(assert (=> b!682846 m!647493))

(declare-fun m!647495 () Bool)

(assert (=> b!682846 m!647495))

(assert (=> b!682846 m!647485))

(declare-fun m!647497 () Bool)

(assert (=> b!682846 m!647497))

(assert (=> b!682846 m!647489))

(assert (=> b!682846 m!647479))

(declare-fun m!647499 () Bool)

(assert (=> b!682846 m!647499))

(declare-fun m!647501 () Bool)

(assert (=> b!682846 m!647501))

(assert (=> b!682846 m!647487))

(declare-fun m!647503 () Bool)

(assert (=> b!682839 m!647503))

(declare-fun m!647505 () Bool)

(assert (=> b!682853 m!647505))

(assert (=> b!682849 m!647467))

(declare-fun m!647507 () Bool)

(assert (=> b!682851 m!647507))

(declare-fun m!647509 () Bool)

(assert (=> b!682856 m!647509))

(declare-fun m!647511 () Bool)

(assert (=> b!682854 m!647511))

(push 1)

