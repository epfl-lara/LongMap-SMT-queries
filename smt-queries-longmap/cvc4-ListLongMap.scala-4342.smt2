; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60084 () Bool)

(assert start!60084)

(declare-fun b!669728 () Bool)

(declare-fun e!383034 () Bool)

(declare-datatypes ((List!12799 0))(
  ( (Nil!12796) (Cons!12795 (h!13840 (_ BitVec 64)) (t!19027 List!12799)) )
))
(declare-fun acc!681 () List!12799)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3376 (List!12799 (_ BitVec 64)) Bool)

(assert (=> b!669728 (= e!383034 (contains!3376 acc!681 k!2843))))

(declare-fun b!669729 () Bool)

(declare-fun res!436588 () Bool)

(declare-fun e!383027 () Bool)

(assert (=> b!669729 (=> res!436588 e!383027)))

(declare-fun lt!311737 () List!12799)

(assert (=> b!669729 (= res!436588 (contains!3376 lt!311737 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669730 () Bool)

(declare-fun res!436579 () Bool)

(declare-fun e!383033 () Bool)

(assert (=> b!669730 (=> (not res!436579) (not e!383033))))

(declare-datatypes ((array!39131 0))(
  ( (array!39132 (arr!18758 (Array (_ BitVec 32) (_ BitVec 64))) (size!19122 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39131)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39131 (_ BitVec 32) List!12799) Bool)

(assert (=> b!669730 (= res!436579 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669731 () Bool)

(declare-fun res!436574 () Bool)

(assert (=> b!669731 (=> res!436574 e!383027)))

(assert (=> b!669731 (= res!436574 (contains!3376 lt!311737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669732 () Bool)

(assert (=> b!669732 (= e!383033 (not e!383027))))

(declare-fun res!436580 () Bool)

(assert (=> b!669732 (=> res!436580 e!383027)))

(assert (=> b!669732 (= res!436580 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669732 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311737)))

(declare-datatypes ((Unit!23515 0))(
  ( (Unit!23516) )
))
(declare-fun lt!311741 () Unit!23515)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39131 (_ BitVec 64) (_ BitVec 32) List!12799 List!12799) Unit!23515)

(assert (=> b!669732 (= lt!311741 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311737))))

(declare-fun -!113 (List!12799 (_ BitVec 64)) List!12799)

(assert (=> b!669732 (= (-!113 lt!311737 k!2843) acc!681)))

(declare-fun $colon$colon!247 (List!12799 (_ BitVec 64)) List!12799)

(assert (=> b!669732 (= lt!311737 ($colon$colon!247 acc!681 k!2843))))

(declare-fun lt!311739 () Unit!23515)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12799) Unit!23515)

(assert (=> b!669732 (= lt!311739 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!115 (List!12799 List!12799) Bool)

(assert (=> b!669732 (subseq!115 acc!681 acc!681)))

(declare-fun lt!311740 () Unit!23515)

(declare-fun lemmaListSubSeqRefl!0 (List!12799) Unit!23515)

(assert (=> b!669732 (= lt!311740 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669732 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311742 () Unit!23515)

(declare-fun e!383031 () Unit!23515)

(assert (=> b!669732 (= lt!311742 e!383031)))

(declare-fun c!76946 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669732 (= c!76946 (validKeyInArray!0 (select (arr!18758 a!3626) from!3004)))))

(declare-fun lt!311743 () Unit!23515)

(declare-fun e!383029 () Unit!23515)

(assert (=> b!669732 (= lt!311743 e!383029)))

(declare-fun c!76945 () Bool)

(declare-fun arrayContainsKey!0 (array!39131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669732 (= c!76945 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669732 (arrayContainsKey!0 (array!39132 (store (arr!18758 a!3626) i!1382 k!2843) (size!19122 a!3626)) k!2843 from!3004)))

(declare-fun b!669733 () Bool)

(declare-fun res!436583 () Bool)

(assert (=> b!669733 (=> (not res!436583) (not e!383033))))

(assert (=> b!669733 (= res!436583 (not (contains!3376 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669735 () Bool)

(declare-fun Unit!23517 () Unit!23515)

(assert (=> b!669735 (= e!383031 Unit!23517)))

(declare-fun b!669736 () Bool)

(declare-fun res!436572 () Bool)

(assert (=> b!669736 (=> (not res!436572) (not e!383033))))

(assert (=> b!669736 (= res!436572 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19122 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669737 () Bool)

(declare-fun e!383032 () Bool)

(assert (=> b!669737 (= e!383032 (not (contains!3376 acc!681 k!2843)))))

(declare-fun b!669738 () Bool)

(declare-fun res!436578 () Bool)

(assert (=> b!669738 (=> (not res!436578) (not e!383033))))

(declare-fun e!383028 () Bool)

(assert (=> b!669738 (= res!436578 e!383028)))

(declare-fun res!436585 () Bool)

(assert (=> b!669738 (=> res!436585 e!383028)))

(assert (=> b!669738 (= res!436585 e!383034)))

(declare-fun res!436587 () Bool)

(assert (=> b!669738 (=> (not res!436587) (not e!383034))))

(assert (=> b!669738 (= res!436587 (bvsgt from!3004 i!1382))))

(declare-fun b!669739 () Bool)

(declare-fun Unit!23518 () Unit!23515)

(assert (=> b!669739 (= e!383029 Unit!23518)))

(declare-fun b!669740 () Bool)

(declare-fun res!436586 () Bool)

(assert (=> b!669740 (=> (not res!436586) (not e!383033))))

(assert (=> b!669740 (= res!436586 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669741 () Bool)

(assert (=> b!669741 (= e!383027 true)))

(declare-fun lt!311736 () Bool)

(declare-fun e!383030 () Bool)

(assert (=> b!669741 (= lt!311736 e!383030)))

(declare-fun res!436576 () Bool)

(assert (=> b!669741 (=> res!436576 e!383030)))

(declare-fun e!383024 () Bool)

(assert (=> b!669741 (= res!436576 e!383024)))

(declare-fun res!436582 () Bool)

(assert (=> b!669741 (=> (not res!436582) (not e!383024))))

(assert (=> b!669741 (= res!436582 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669742 () Bool)

(assert (=> b!669742 (= e!383028 e!383032)))

(declare-fun res!436577 () Bool)

(assert (=> b!669742 (=> (not res!436577) (not e!383032))))

(assert (=> b!669742 (= res!436577 (bvsle from!3004 i!1382))))

(declare-fun b!669743 () Bool)

(declare-fun e!383026 () Bool)

(assert (=> b!669743 (= e!383026 (not (contains!3376 lt!311737 k!2843)))))

(declare-fun b!669744 () Bool)

(declare-fun lt!311738 () Unit!23515)

(assert (=> b!669744 (= e!383031 lt!311738)))

(declare-fun lt!311734 () Unit!23515)

(assert (=> b!669744 (= lt!311734 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669744 (subseq!115 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39131 List!12799 List!12799 (_ BitVec 32)) Unit!23515)

(assert (=> b!669744 (= lt!311738 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!247 acc!681 (select (arr!18758 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669744 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669745 () Bool)

(declare-fun res!436589 () Bool)

(assert (=> b!669745 (=> (not res!436589) (not e!383033))))

(assert (=> b!669745 (= res!436589 (validKeyInArray!0 k!2843))))

(declare-fun b!669746 () Bool)

(declare-fun res!436581 () Bool)

(assert (=> b!669746 (=> (not res!436581) (not e!383033))))

(assert (=> b!669746 (= res!436581 (not (contains!3376 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669747 () Bool)

(declare-fun Unit!23519 () Unit!23515)

(assert (=> b!669747 (= e!383029 Unit!23519)))

(declare-fun lt!311735 () Unit!23515)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39131 (_ BitVec 64) (_ BitVec 32)) Unit!23515)

(assert (=> b!669747 (= lt!311735 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669747 false))

(declare-fun b!669748 () Bool)

(declare-fun res!436592 () Bool)

(assert (=> b!669748 (=> res!436592 e!383027)))

(declare-fun noDuplicate!623 (List!12799) Bool)

(assert (=> b!669748 (= res!436592 (not (noDuplicate!623 lt!311737)))))

(declare-fun b!669749 () Bool)

(assert (=> b!669749 (= e!383030 e!383026)))

(declare-fun res!436573 () Bool)

(assert (=> b!669749 (=> (not res!436573) (not e!383026))))

(assert (=> b!669749 (= res!436573 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669750 () Bool)

(declare-fun res!436575 () Bool)

(assert (=> b!669750 (=> (not res!436575) (not e!383033))))

(assert (=> b!669750 (= res!436575 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19122 a!3626))))))

(declare-fun res!436584 () Bool)

(assert (=> start!60084 (=> (not res!436584) (not e!383033))))

(assert (=> start!60084 (= res!436584 (and (bvslt (size!19122 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19122 a!3626))))))

(assert (=> start!60084 e!383033))

(assert (=> start!60084 true))

(declare-fun array_inv!14554 (array!39131) Bool)

(assert (=> start!60084 (array_inv!14554 a!3626)))

(declare-fun b!669734 () Bool)

(assert (=> b!669734 (= e!383024 (contains!3376 lt!311737 k!2843))))

(declare-fun b!669751 () Bool)

(declare-fun res!436591 () Bool)

(assert (=> b!669751 (=> (not res!436591) (not e!383033))))

(assert (=> b!669751 (= res!436591 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12796))))

(declare-fun b!669752 () Bool)

(declare-fun res!436590 () Bool)

(assert (=> b!669752 (=> (not res!436590) (not e!383033))))

(assert (=> b!669752 (= res!436590 (noDuplicate!623 acc!681))))

(assert (= (and start!60084 res!436584) b!669752))

(assert (= (and b!669752 res!436590) b!669733))

(assert (= (and b!669733 res!436583) b!669746))

(assert (= (and b!669746 res!436581) b!669738))

(assert (= (and b!669738 res!436587) b!669728))

(assert (= (and b!669738 (not res!436585)) b!669742))

(assert (= (and b!669742 res!436577) b!669737))

(assert (= (and b!669738 res!436578) b!669751))

(assert (= (and b!669751 res!436591) b!669730))

(assert (= (and b!669730 res!436579) b!669750))

(assert (= (and b!669750 res!436575) b!669745))

(assert (= (and b!669745 res!436589) b!669740))

(assert (= (and b!669740 res!436586) b!669736))

(assert (= (and b!669736 res!436572) b!669732))

(assert (= (and b!669732 c!76945) b!669747))

(assert (= (and b!669732 (not c!76945)) b!669739))

(assert (= (and b!669732 c!76946) b!669744))

(assert (= (and b!669732 (not c!76946)) b!669735))

(assert (= (and b!669732 (not res!436580)) b!669748))

(assert (= (and b!669748 (not res!436592)) b!669731))

(assert (= (and b!669731 (not res!436574)) b!669729))

(assert (= (and b!669729 (not res!436588)) b!669741))

(assert (= (and b!669741 res!436582) b!669734))

(assert (= (and b!669741 (not res!436576)) b!669749))

(assert (= (and b!669749 res!436573) b!669743))

(declare-fun m!639757 () Bool)

(assert (=> b!669730 m!639757))

(declare-fun m!639759 () Bool)

(assert (=> b!669731 m!639759))

(declare-fun m!639761 () Bool)

(assert (=> b!669752 m!639761))

(declare-fun m!639763 () Bool)

(assert (=> b!669747 m!639763))

(declare-fun m!639765 () Bool)

(assert (=> b!669734 m!639765))

(declare-fun m!639767 () Bool)

(assert (=> b!669728 m!639767))

(declare-fun m!639769 () Bool)

(assert (=> b!669740 m!639769))

(declare-fun m!639771 () Bool)

(assert (=> b!669746 m!639771))

(declare-fun m!639773 () Bool)

(assert (=> b!669733 m!639773))

(declare-fun m!639775 () Bool)

(assert (=> b!669729 m!639775))

(declare-fun m!639777 () Bool)

(assert (=> b!669745 m!639777))

(declare-fun m!639779 () Bool)

(assert (=> start!60084 m!639779))

(declare-fun m!639781 () Bool)

(assert (=> b!669748 m!639781))

(declare-fun m!639783 () Bool)

(assert (=> b!669744 m!639783))

(declare-fun m!639785 () Bool)

(assert (=> b!669744 m!639785))

(declare-fun m!639787 () Bool)

(assert (=> b!669744 m!639787))

(declare-fun m!639789 () Bool)

(assert (=> b!669744 m!639789))

(assert (=> b!669744 m!639785))

(assert (=> b!669744 m!639787))

(declare-fun m!639791 () Bool)

(assert (=> b!669744 m!639791))

(declare-fun m!639793 () Bool)

(assert (=> b!669744 m!639793))

(assert (=> b!669732 m!639783))

(assert (=> b!669732 m!639785))

(declare-fun m!639795 () Bool)

(assert (=> b!669732 m!639795))

(declare-fun m!639797 () Bool)

(assert (=> b!669732 m!639797))

(assert (=> b!669732 m!639785))

(declare-fun m!639799 () Bool)

(assert (=> b!669732 m!639799))

(declare-fun m!639801 () Bool)

(assert (=> b!669732 m!639801))

(declare-fun m!639803 () Bool)

(assert (=> b!669732 m!639803))

(declare-fun m!639805 () Bool)

(assert (=> b!669732 m!639805))

(assert (=> b!669732 m!639791))

(declare-fun m!639807 () Bool)

(assert (=> b!669732 m!639807))

(declare-fun m!639809 () Bool)

(assert (=> b!669732 m!639809))

(declare-fun m!639811 () Bool)

(assert (=> b!669732 m!639811))

(assert (=> b!669732 m!639793))

(declare-fun m!639813 () Bool)

(assert (=> b!669751 m!639813))

(assert (=> b!669737 m!639767))

(assert (=> b!669743 m!639765))

(push 1)

(assert (not b!669731))

(assert (not b!669740))

(assert (not b!669746))

(assert (not b!669728))

(assert (not b!669744))

(assert (not b!669751))

(assert (not b!669730))

(assert (not b!669752))

(assert (not b!669743))

(assert (not b!669748))

(assert (not start!60084))

(assert (not b!669737))

(assert (not b!669733))

(assert (not b!669747))

(assert (not b!669734))

(assert (not b!669729))

(assert (not b!669745))

(assert (not b!669732))

(check-sat)

(pop 1)

