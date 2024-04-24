; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61234 () Bool)

(assert start!61234)

(declare-fun b!685833 () Bool)

(declare-fun res!451038 () Bool)

(declare-fun e!390603 () Bool)

(assert (=> b!685833 (=> res!451038 e!390603)))

(declare-datatypes ((List!12938 0))(
  ( (Nil!12935) (Cons!12934 (h!13982 (_ BitVec 64)) (t!19182 List!12938)) )
))
(declare-fun acc!681 () List!12938)

(declare-fun lt!314830 () List!12938)

(declare-fun subseq!199 (List!12938 List!12938) Bool)

(assert (=> b!685833 (= res!451038 (not (subseq!199 acc!681 lt!314830)))))

(declare-fun b!685834 () Bool)

(declare-fun res!451045 () Bool)

(assert (=> b!685834 (=> res!451045 e!390603)))

(declare-fun noDuplicate!864 (List!12938) Bool)

(assert (=> b!685834 (= res!451045 (not (noDuplicate!864 lt!314830)))))

(declare-fun b!685835 () Bool)

(declare-fun res!451040 () Bool)

(declare-fun e!390597 () Bool)

(assert (=> b!685835 (=> (not res!451040) (not e!390597))))

(declare-datatypes ((array!39631 0))(
  ( (array!39632 (arr!18990 (Array (_ BitVec 32) (_ BitVec 64))) (size!19362 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39631)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685835 (= res!451040 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685836 () Bool)

(declare-fun res!451037 () Bool)

(assert (=> b!685836 (=> res!451037 e!390603)))

(declare-fun lt!314825 () Bool)

(assert (=> b!685836 (= res!451037 lt!314825)))

(declare-fun b!685837 () Bool)

(declare-fun res!451054 () Bool)

(assert (=> b!685837 (=> res!451054 e!390603)))

(declare-fun contains!3590 (List!12938 (_ BitVec 64)) Bool)

(assert (=> b!685837 (= res!451054 (contains!3590 acc!681 k!2843))))

(declare-fun b!685838 () Bool)

(declare-datatypes ((Unit!24121 0))(
  ( (Unit!24122) )
))
(declare-fun e!390598 () Unit!24121)

(declare-fun Unit!24123 () Unit!24121)

(assert (=> b!685838 (= e!390598 Unit!24123)))

(declare-fun b!685839 () Bool)

(assert (=> b!685839 (= e!390597 (not e!390603))))

(declare-fun res!451052 () Bool)

(assert (=> b!685839 (=> res!451052 e!390603)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!685839 (= res!451052 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!163 (List!12938 (_ BitVec 64)) List!12938)

(assert (=> b!685839 (= (-!163 lt!314830 k!2843) acc!681)))

(declare-fun $colon$colon!361 (List!12938 (_ BitVec 64)) List!12938)

(assert (=> b!685839 (= lt!314830 ($colon$colon!361 acc!681 k!2843))))

(declare-fun lt!314828 () Unit!24121)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12938) Unit!24121)

(assert (=> b!685839 (= lt!314828 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685839 (subseq!199 acc!681 acc!681)))

(declare-fun lt!314824 () Unit!24121)

(declare-fun lemmaListSubSeqRefl!0 (List!12938) Unit!24121)

(assert (=> b!685839 (= lt!314824 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39631 (_ BitVec 32) List!12938) Bool)

(assert (=> b!685839 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314833 () Unit!24121)

(assert (=> b!685839 (= lt!314833 e!390598)))

(declare-fun c!77767 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685839 (= c!77767 (validKeyInArray!0 (select (arr!18990 a!3626) from!3004)))))

(declare-fun lt!314829 () Unit!24121)

(declare-fun e!390602 () Unit!24121)

(assert (=> b!685839 (= lt!314829 e!390602)))

(declare-fun c!77768 () Bool)

(assert (=> b!685839 (= c!77768 lt!314825)))

(assert (=> b!685839 (= lt!314825 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685839 (arrayContainsKey!0 (array!39632 (store (arr!18990 a!3626) i!1382 k!2843) (size!19362 a!3626)) k!2843 from!3004)))

(declare-fun b!685840 () Bool)

(assert (=> b!685840 (= e!390603 true)))

(declare-fun lt!314831 () Bool)

(assert (=> b!685840 (= lt!314831 (contains!3590 lt!314830 k!2843))))

(declare-fun b!685841 () Bool)

(declare-fun lt!314827 () Unit!24121)

(assert (=> b!685841 (= e!390598 lt!314827)))

(declare-fun lt!314832 () Unit!24121)

(assert (=> b!685841 (= lt!314832 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685841 (subseq!199 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39631 List!12938 List!12938 (_ BitVec 32)) Unit!24121)

(assert (=> b!685841 (= lt!314827 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!361 acc!681 (select (arr!18990 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685841 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685842 () Bool)

(declare-fun res!451049 () Bool)

(assert (=> b!685842 (=> (not res!451049) (not e!390597))))

(assert (=> b!685842 (= res!451049 (validKeyInArray!0 k!2843))))

(declare-fun b!685843 () Bool)

(declare-fun res!451050 () Bool)

(assert (=> b!685843 (=> (not res!451050) (not e!390597))))

(assert (=> b!685843 (= res!451050 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19362 a!3626))))))

(declare-fun b!685844 () Bool)

(declare-fun res!451051 () Bool)

(assert (=> b!685844 (=> (not res!451051) (not e!390597))))

(declare-fun e!390601 () Bool)

(assert (=> b!685844 (= res!451051 e!390601)))

(declare-fun res!451053 () Bool)

(assert (=> b!685844 (=> res!451053 e!390601)))

(declare-fun e!390600 () Bool)

(assert (=> b!685844 (= res!451053 e!390600)))

(declare-fun res!451048 () Bool)

(assert (=> b!685844 (=> (not res!451048) (not e!390600))))

(assert (=> b!685844 (= res!451048 (bvsgt from!3004 i!1382))))

(declare-fun b!685845 () Bool)

(declare-fun res!451041 () Bool)

(assert (=> b!685845 (=> (not res!451041) (not e!390597))))

(assert (=> b!685845 (= res!451041 (not (contains!3590 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685846 () Bool)

(declare-fun Unit!24124 () Unit!24121)

(assert (=> b!685846 (= e!390602 Unit!24124)))

(declare-fun b!685848 () Bool)

(declare-fun Unit!24125 () Unit!24121)

(assert (=> b!685848 (= e!390602 Unit!24125)))

(declare-fun lt!314826 () Unit!24121)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39631 (_ BitVec 64) (_ BitVec 32)) Unit!24121)

(assert (=> b!685848 (= lt!314826 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685848 false))

(declare-fun b!685849 () Bool)

(declare-fun res!451044 () Bool)

(assert (=> b!685849 (=> (not res!451044) (not e!390597))))

(assert (=> b!685849 (= res!451044 (not (contains!3590 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685850 () Bool)

(declare-fun e!390596 () Bool)

(assert (=> b!685850 (= e!390596 (not (contains!3590 acc!681 k!2843)))))

(declare-fun b!685851 () Bool)

(declare-fun res!451042 () Bool)

(assert (=> b!685851 (=> (not res!451042) (not e!390597))))

(assert (=> b!685851 (= res!451042 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685852 () Bool)

(declare-fun res!451047 () Bool)

(assert (=> b!685852 (=> (not res!451047) (not e!390597))))

(assert (=> b!685852 (= res!451047 (noDuplicate!864 acc!681))))

(declare-fun b!685853 () Bool)

(assert (=> b!685853 (= e!390601 e!390596)))

(declare-fun res!451043 () Bool)

(assert (=> b!685853 (=> (not res!451043) (not e!390596))))

(assert (=> b!685853 (= res!451043 (bvsle from!3004 i!1382))))

(declare-fun b!685854 () Bool)

(declare-fun res!451036 () Bool)

(assert (=> b!685854 (=> (not res!451036) (not e!390597))))

(assert (=> b!685854 (= res!451036 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19362 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685855 () Bool)

(declare-fun res!451039 () Bool)

(assert (=> b!685855 (=> (not res!451039) (not e!390597))))

(assert (=> b!685855 (= res!451039 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12935))))

(declare-fun b!685847 () Bool)

(assert (=> b!685847 (= e!390600 (contains!3590 acc!681 k!2843))))

(declare-fun res!451046 () Bool)

(assert (=> start!61234 (=> (not res!451046) (not e!390597))))

(assert (=> start!61234 (= res!451046 (and (bvslt (size!19362 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19362 a!3626))))))

(assert (=> start!61234 e!390597))

(assert (=> start!61234 true))

(declare-fun array_inv!14849 (array!39631) Bool)

(assert (=> start!61234 (array_inv!14849 a!3626)))

(assert (= (and start!61234 res!451046) b!685852))

(assert (= (and b!685852 res!451047) b!685849))

(assert (= (and b!685849 res!451044) b!685845))

(assert (= (and b!685845 res!451041) b!685844))

(assert (= (and b!685844 res!451048) b!685847))

(assert (= (and b!685844 (not res!451053)) b!685853))

(assert (= (and b!685853 res!451043) b!685850))

(assert (= (and b!685844 res!451051) b!685855))

(assert (= (and b!685855 res!451039) b!685851))

(assert (= (and b!685851 res!451042) b!685843))

(assert (= (and b!685843 res!451050) b!685842))

(assert (= (and b!685842 res!451049) b!685835))

(assert (= (and b!685835 res!451040) b!685854))

(assert (= (and b!685854 res!451036) b!685839))

(assert (= (and b!685839 c!77768) b!685848))

(assert (= (and b!685839 (not c!77768)) b!685846))

(assert (= (and b!685839 c!77767) b!685841))

(assert (= (and b!685839 (not c!77767)) b!685838))

(assert (= (and b!685839 (not res!451052)) b!685834))

(assert (= (and b!685834 (not res!451045)) b!685836))

(assert (= (and b!685836 (not res!451037)) b!685837))

(assert (= (and b!685837 (not res!451054)) b!685833))

(assert (= (and b!685833 (not res!451038)) b!685840))

(declare-fun m!650481 () Bool)

(assert (=> b!685840 m!650481))

(declare-fun m!650483 () Bool)

(assert (=> b!685842 m!650483))

(declare-fun m!650485 () Bool)

(assert (=> b!685848 m!650485))

(declare-fun m!650487 () Bool)

(assert (=> b!685839 m!650487))

(declare-fun m!650489 () Bool)

(assert (=> b!685839 m!650489))

(declare-fun m!650491 () Bool)

(assert (=> b!685839 m!650491))

(declare-fun m!650493 () Bool)

(assert (=> b!685839 m!650493))

(declare-fun m!650495 () Bool)

(assert (=> b!685839 m!650495))

(declare-fun m!650497 () Bool)

(assert (=> b!685839 m!650497))

(assert (=> b!685839 m!650489))

(declare-fun m!650499 () Bool)

(assert (=> b!685839 m!650499))

(declare-fun m!650501 () Bool)

(assert (=> b!685839 m!650501))

(declare-fun m!650503 () Bool)

(assert (=> b!685839 m!650503))

(declare-fun m!650505 () Bool)

(assert (=> b!685839 m!650505))

(declare-fun m!650507 () Bool)

(assert (=> b!685839 m!650507))

(declare-fun m!650509 () Bool)

(assert (=> b!685852 m!650509))

(declare-fun m!650511 () Bool)

(assert (=> b!685855 m!650511))

(assert (=> b!685841 m!650487))

(assert (=> b!685841 m!650489))

(declare-fun m!650513 () Bool)

(assert (=> b!685841 m!650513))

(declare-fun m!650515 () Bool)

(assert (=> b!685841 m!650515))

(assert (=> b!685841 m!650489))

(assert (=> b!685841 m!650513))

(assert (=> b!685841 m!650495))

(assert (=> b!685841 m!650507))

(declare-fun m!650517 () Bool)

(assert (=> b!685847 m!650517))

(assert (=> b!685850 m!650517))

(declare-fun m!650519 () Bool)

(assert (=> b!685849 m!650519))

(declare-fun m!650521 () Bool)

(assert (=> b!685851 m!650521))

(declare-fun m!650523 () Bool)

(assert (=> b!685834 m!650523))

(declare-fun m!650525 () Bool)

(assert (=> b!685833 m!650525))

(declare-fun m!650527 () Bool)

(assert (=> b!685845 m!650527))

(declare-fun m!650529 () Bool)

(assert (=> start!61234 m!650529))

(assert (=> b!685837 m!650517))

(declare-fun m!650531 () Bool)

(assert (=> b!685835 m!650531))

(push 1)

(assert (not b!685845))

(assert (not b!685851))

(assert (not b!685835))

(assert (not b!685841))

(assert (not b!685848))

(assert (not b!685849))

(assert (not b!685834))

(assert (not b!685852))

(assert (not b!685839))

(assert (not b!685842))

(assert (not b!685833))

(assert (not b!685837))

(assert (not b!685855))

(assert (not b!685847))

(assert (not start!61234))

(assert (not b!685840))

(assert (not b!685850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

