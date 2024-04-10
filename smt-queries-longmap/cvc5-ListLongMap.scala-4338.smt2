; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60056 () Bool)

(assert start!60056)

(declare-fun b!668678 () Bool)

(declare-fun res!435698 () Bool)

(declare-fun e!382571 () Bool)

(assert (=> b!668678 (=> (not res!435698) (not e!382571))))

(declare-datatypes ((List!12785 0))(
  ( (Nil!12782) (Cons!12781 (h!13826 (_ BitVec 64)) (t!19013 List!12785)) )
))
(declare-fun acc!681 () List!12785)

(declare-fun contains!3362 (List!12785 (_ BitVec 64)) Bool)

(assert (=> b!668678 (= res!435698 (not (contains!3362 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668679 () Bool)

(declare-fun e!382566 () Bool)

(declare-fun e!382567 () Bool)

(assert (=> b!668679 (= e!382566 e!382567)))

(declare-fun res!435699 () Bool)

(assert (=> b!668679 (=> (not res!435699) (not e!382567))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668679 (= res!435699 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668680 () Bool)

(declare-fun res!435701 () Bool)

(assert (=> b!668680 (=> (not res!435701) (not e!382571))))

(declare-datatypes ((array!39103 0))(
  ( (array!39104 (arr!18744 (Array (_ BitVec 32) (_ BitVec 64))) (size!19108 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39103)

(declare-fun arrayNoDuplicates!0 (array!39103 (_ BitVec 32) List!12785) Bool)

(assert (=> b!668680 (= res!435701 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12782))))

(declare-fun b!668681 () Bool)

(declare-fun res!435695 () Bool)

(assert (=> b!668681 (=> (not res!435695) (not e!382571))))

(declare-fun noDuplicate!609 (List!12785) Bool)

(assert (=> b!668681 (= res!435695 (noDuplicate!609 acc!681))))

(declare-fun b!668682 () Bool)

(declare-datatypes ((Unit!23445 0))(
  ( (Unit!23446) )
))
(declare-fun e!382570 () Unit!23445)

(declare-fun Unit!23447 () Unit!23445)

(assert (=> b!668682 (= e!382570 Unit!23447)))

(declare-fun b!668683 () Bool)

(declare-fun e!382569 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!668683 (= e!382569 (not (contains!3362 acc!681 k!2843)))))

(declare-fun b!668684 () Bool)

(declare-fun e!382572 () Bool)

(assert (=> b!668684 (= e!382572 (contains!3362 acc!681 k!2843))))

(declare-fun b!668685 () Bool)

(declare-fun res!435709 () Bool)

(assert (=> b!668685 (=> (not res!435709) (not e!382571))))

(declare-fun arrayContainsKey!0 (array!39103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668685 (= res!435709 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668687 () Bool)

(declare-fun res!435710 () Bool)

(assert (=> b!668687 (=> (not res!435710) (not e!382571))))

(assert (=> b!668687 (= res!435710 (not (contains!3362 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668688 () Bool)

(declare-fun e!382562 () Bool)

(assert (=> b!668688 (= e!382571 (not e!382562))))

(declare-fun res!435707 () Bool)

(assert (=> b!668688 (=> res!435707 e!382562)))

(assert (=> b!668688 (= res!435707 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!311317 () List!12785)

(assert (=> b!668688 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311317)))

(declare-fun lt!311320 () Unit!23445)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39103 (_ BitVec 64) (_ BitVec 32) List!12785 List!12785) Unit!23445)

(assert (=> b!668688 (= lt!311320 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311317))))

(declare-fun -!99 (List!12785 (_ BitVec 64)) List!12785)

(assert (=> b!668688 (= (-!99 lt!311317 k!2843) acc!681)))

(declare-fun $colon$colon!233 (List!12785 (_ BitVec 64)) List!12785)

(assert (=> b!668688 (= lt!311317 ($colon$colon!233 acc!681 k!2843))))

(declare-fun lt!311321 () Unit!23445)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12785) Unit!23445)

(assert (=> b!668688 (= lt!311321 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!101 (List!12785 List!12785) Bool)

(assert (=> b!668688 (subseq!101 acc!681 acc!681)))

(declare-fun lt!311316 () Unit!23445)

(declare-fun lemmaListSubSeqRefl!0 (List!12785) Unit!23445)

(assert (=> b!668688 (= lt!311316 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668688 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311318 () Unit!23445)

(declare-fun e!382564 () Unit!23445)

(assert (=> b!668688 (= lt!311318 e!382564)))

(declare-fun c!76862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668688 (= c!76862 (validKeyInArray!0 (select (arr!18744 a!3626) from!3004)))))

(declare-fun lt!311322 () Unit!23445)

(assert (=> b!668688 (= lt!311322 e!382570)))

(declare-fun c!76861 () Bool)

(assert (=> b!668688 (= c!76861 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668688 (arrayContainsKey!0 (array!39104 (store (arr!18744 a!3626) i!1382 k!2843) (size!19108 a!3626)) k!2843 from!3004)))

(declare-fun b!668689 () Bool)

(declare-fun res!435696 () Bool)

(assert (=> b!668689 (=> (not res!435696) (not e!382571))))

(assert (=> b!668689 (= res!435696 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668690 () Bool)

(declare-fun Unit!23448 () Unit!23445)

(assert (=> b!668690 (= e!382564 Unit!23448)))

(declare-fun b!668691 () Bool)

(declare-fun res!435700 () Bool)

(assert (=> b!668691 (=> (not res!435700) (not e!382571))))

(declare-fun e!382568 () Bool)

(assert (=> b!668691 (= res!435700 e!382568)))

(declare-fun res!435708 () Bool)

(assert (=> b!668691 (=> res!435708 e!382568)))

(assert (=> b!668691 (= res!435708 e!382572)))

(declare-fun res!435703 () Bool)

(assert (=> b!668691 (=> (not res!435703) (not e!382572))))

(assert (=> b!668691 (= res!435703 (bvsgt from!3004 i!1382))))

(declare-fun b!668692 () Bool)

(declare-fun res!435706 () Bool)

(assert (=> b!668692 (=> (not res!435706) (not e!382571))))

(assert (=> b!668692 (= res!435706 (validKeyInArray!0 k!2843))))

(declare-fun b!668693 () Bool)

(assert (=> b!668693 (= e!382567 (not (contains!3362 lt!311317 k!2843)))))

(declare-fun b!668694 () Bool)

(declare-fun Unit!23449 () Unit!23445)

(assert (=> b!668694 (= e!382570 Unit!23449)))

(declare-fun lt!311315 () Unit!23445)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39103 (_ BitVec 64) (_ BitVec 32)) Unit!23445)

(assert (=> b!668694 (= lt!311315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!668694 false))

(declare-fun res!435693 () Bool)

(assert (=> start!60056 (=> (not res!435693) (not e!382571))))

(assert (=> start!60056 (= res!435693 (and (bvslt (size!19108 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19108 a!3626))))))

(assert (=> start!60056 e!382571))

(assert (=> start!60056 true))

(declare-fun array_inv!14540 (array!39103) Bool)

(assert (=> start!60056 (array_inv!14540 a!3626)))

(declare-fun b!668686 () Bool)

(declare-fun res!435694 () Bool)

(assert (=> b!668686 (=> (not res!435694) (not e!382571))))

(assert (=> b!668686 (= res!435694 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19108 a!3626))))))

(declare-fun b!668695 () Bool)

(declare-fun res!435690 () Bool)

(assert (=> b!668695 (=> res!435690 e!382562)))

(assert (=> b!668695 (= res!435690 (not (noDuplicate!609 lt!311317)))))

(declare-fun b!668696 () Bool)

(declare-fun e!382563 () Bool)

(assert (=> b!668696 (= e!382563 (contains!3362 lt!311317 k!2843))))

(declare-fun b!668697 () Bool)

(declare-fun lt!311323 () Unit!23445)

(assert (=> b!668697 (= e!382564 lt!311323)))

(declare-fun lt!311314 () Unit!23445)

(assert (=> b!668697 (= lt!311314 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668697 (subseq!101 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39103 List!12785 List!12785 (_ BitVec 32)) Unit!23445)

(assert (=> b!668697 (= lt!311323 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!233 acc!681 (select (arr!18744 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668697 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668698 () Bool)

(declare-fun res!435691 () Bool)

(assert (=> b!668698 (=> res!435691 e!382562)))

(assert (=> b!668698 (= res!435691 (contains!3362 lt!311317 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668699 () Bool)

(declare-fun res!435697 () Bool)

(assert (=> b!668699 (=> res!435697 e!382562)))

(assert (=> b!668699 (= res!435697 (contains!3362 lt!311317 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668700 () Bool)

(assert (=> b!668700 (= e!382568 e!382569)))

(declare-fun res!435704 () Bool)

(assert (=> b!668700 (=> (not res!435704) (not e!382569))))

(assert (=> b!668700 (= res!435704 (bvsle from!3004 i!1382))))

(declare-fun b!668701 () Bool)

(assert (=> b!668701 (= e!382562 true)))

(declare-fun lt!311319 () Bool)

(assert (=> b!668701 (= lt!311319 e!382566)))

(declare-fun res!435692 () Bool)

(assert (=> b!668701 (=> res!435692 e!382566)))

(assert (=> b!668701 (= res!435692 e!382563)))

(declare-fun res!435705 () Bool)

(assert (=> b!668701 (=> (not res!435705) (not e!382563))))

(assert (=> b!668701 (= res!435705 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668702 () Bool)

(declare-fun res!435702 () Bool)

(assert (=> b!668702 (=> (not res!435702) (not e!382571))))

(assert (=> b!668702 (= res!435702 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19108 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60056 res!435693) b!668681))

(assert (= (and b!668681 res!435695) b!668687))

(assert (= (and b!668687 res!435710) b!668678))

(assert (= (and b!668678 res!435698) b!668691))

(assert (= (and b!668691 res!435703) b!668684))

(assert (= (and b!668691 (not res!435708)) b!668700))

(assert (= (and b!668700 res!435704) b!668683))

(assert (= (and b!668691 res!435700) b!668680))

(assert (= (and b!668680 res!435701) b!668689))

(assert (= (and b!668689 res!435696) b!668686))

(assert (= (and b!668686 res!435694) b!668692))

(assert (= (and b!668692 res!435706) b!668685))

(assert (= (and b!668685 res!435709) b!668702))

(assert (= (and b!668702 res!435702) b!668688))

(assert (= (and b!668688 c!76861) b!668694))

(assert (= (and b!668688 (not c!76861)) b!668682))

(assert (= (and b!668688 c!76862) b!668697))

(assert (= (and b!668688 (not c!76862)) b!668690))

(assert (= (and b!668688 (not res!435707)) b!668695))

(assert (= (and b!668695 (not res!435690)) b!668699))

(assert (= (and b!668699 (not res!435697)) b!668698))

(assert (= (and b!668698 (not res!435691)) b!668701))

(assert (= (and b!668701 res!435705) b!668696))

(assert (= (and b!668701 (not res!435692)) b!668679))

(assert (= (and b!668679 res!435699) b!668693))

(declare-fun m!638945 () Bool)

(assert (=> b!668681 m!638945))

(declare-fun m!638947 () Bool)

(assert (=> b!668693 m!638947))

(declare-fun m!638949 () Bool)

(assert (=> b!668699 m!638949))

(declare-fun m!638951 () Bool)

(assert (=> b!668685 m!638951))

(declare-fun m!638953 () Bool)

(assert (=> b!668689 m!638953))

(declare-fun m!638955 () Bool)

(assert (=> b!668698 m!638955))

(declare-fun m!638957 () Bool)

(assert (=> b!668678 m!638957))

(declare-fun m!638959 () Bool)

(assert (=> b!668697 m!638959))

(declare-fun m!638961 () Bool)

(assert (=> b!668697 m!638961))

(declare-fun m!638963 () Bool)

(assert (=> b!668697 m!638963))

(declare-fun m!638965 () Bool)

(assert (=> b!668697 m!638965))

(assert (=> b!668697 m!638961))

(assert (=> b!668697 m!638963))

(declare-fun m!638967 () Bool)

(assert (=> b!668697 m!638967))

(declare-fun m!638969 () Bool)

(assert (=> b!668697 m!638969))

(assert (=> b!668696 m!638947))

(declare-fun m!638971 () Bool)

(assert (=> start!60056 m!638971))

(declare-fun m!638973 () Bool)

(assert (=> b!668694 m!638973))

(declare-fun m!638975 () Bool)

(assert (=> b!668695 m!638975))

(declare-fun m!638977 () Bool)

(assert (=> b!668692 m!638977))

(declare-fun m!638979 () Bool)

(assert (=> b!668684 m!638979))

(assert (=> b!668688 m!638961))

(declare-fun m!638981 () Bool)

(assert (=> b!668688 m!638981))

(declare-fun m!638983 () Bool)

(assert (=> b!668688 m!638983))

(assert (=> b!668688 m!638967))

(declare-fun m!638985 () Bool)

(assert (=> b!668688 m!638985))

(declare-fun m!638987 () Bool)

(assert (=> b!668688 m!638987))

(assert (=> b!668688 m!638961))

(declare-fun m!638989 () Bool)

(assert (=> b!668688 m!638989))

(assert (=> b!668688 m!638959))

(declare-fun m!638991 () Bool)

(assert (=> b!668688 m!638991))

(declare-fun m!638993 () Bool)

(assert (=> b!668688 m!638993))

(declare-fun m!638995 () Bool)

(assert (=> b!668688 m!638995))

(declare-fun m!638997 () Bool)

(assert (=> b!668688 m!638997))

(assert (=> b!668688 m!638969))

(assert (=> b!668683 m!638979))

(declare-fun m!638999 () Bool)

(assert (=> b!668687 m!638999))

(declare-fun m!639001 () Bool)

(assert (=> b!668680 m!639001))

(push 1)

(assert (not b!668689))

(assert (not b!668692))

(assert (not b!668695))

(assert (not b!668684))

(assert (not start!60056))

(assert (not b!668680))

(assert (not b!668678))

(assert (not b!668694))

(assert (not b!668683))

(assert (not b!668693))

(assert (not b!668696))

(assert (not b!668687))

(assert (not b!668699))

(assert (not b!668685))

(assert (not b!668681))

(assert (not b!668688))

(assert (not b!668697))

(assert (not b!668698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

