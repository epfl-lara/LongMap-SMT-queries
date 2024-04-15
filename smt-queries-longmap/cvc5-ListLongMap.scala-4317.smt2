; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59922 () Bool)

(assert start!59922)

(declare-fun b!663814 () Bool)

(declare-fun e!380745 () Bool)

(declare-fun e!380744 () Bool)

(assert (=> b!663814 (= e!380745 e!380744)))

(declare-fun res!431729 () Bool)

(assert (=> b!663814 (=> (not res!431729) (not e!380744))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!663814 (= res!431729 (bvsle from!3004 i!1382))))

(declare-fun b!663815 () Bool)

(declare-fun res!431719 () Bool)

(declare-fun e!380746 () Bool)

(assert (=> b!663815 (=> (not res!431719) (not e!380746))))

(declare-datatypes ((List!12762 0))(
  ( (Nil!12759) (Cons!12758 (h!13803 (_ BitVec 64)) (t!18981 List!12762)) )
))
(declare-fun acc!681 () List!12762)

(declare-fun contains!3284 (List!12762 (_ BitVec 64)) Bool)

(assert (=> b!663815 (= res!431719 (not (contains!3284 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663816 () Bool)

(declare-fun res!431723 () Bool)

(assert (=> b!663816 (=> (not res!431723) (not e!380746))))

(declare-datatypes ((array!38980 0))(
  ( (array!38981 (arr!18682 (Array (_ BitVec 32) (_ BitVec 64))) (size!19047 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38980)

(assert (=> b!663816 (= res!431723 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19047 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663817 () Bool)

(declare-datatypes ((Unit!23118 0))(
  ( (Unit!23119) )
))
(declare-fun e!380742 () Unit!23118)

(declare-fun Unit!23120 () Unit!23118)

(assert (=> b!663817 (= e!380742 Unit!23120)))

(declare-fun b!663818 () Bool)

(declare-fun res!431724 () Bool)

(assert (=> b!663818 (=> (not res!431724) (not e!380746))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663818 (= res!431724 (validKeyInArray!0 k!2843))))

(declare-fun b!663819 () Bool)

(assert (=> b!663819 (= e!380746 (not true))))

(declare-fun lt!309237 () Bool)

(assert (=> b!663819 (= lt!309237 (contains!3284 acc!681 k!2843))))

(declare-fun subseq!40 (List!12762 List!12762) Bool)

(assert (=> b!663819 (subseq!40 acc!681 acc!681)))

(declare-fun lt!309234 () Unit!23118)

(declare-fun lemmaListSubSeqRefl!0 (List!12762) Unit!23118)

(assert (=> b!663819 (= lt!309234 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38980 (_ BitVec 32) List!12762) Bool)

(assert (=> b!663819 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309233 () Unit!23118)

(declare-fun e!380741 () Unit!23118)

(assert (=> b!663819 (= lt!309233 e!380741)))

(declare-fun c!76416 () Bool)

(assert (=> b!663819 (= c!76416 (validKeyInArray!0 (select (arr!18682 a!3626) from!3004)))))

(declare-fun lt!309232 () Unit!23118)

(assert (=> b!663819 (= lt!309232 e!380742)))

(declare-fun c!76415 () Bool)

(declare-fun arrayContainsKey!0 (array!38980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663819 (= c!76415 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663819 (arrayContainsKey!0 (array!38981 (store (arr!18682 a!3626) i!1382 k!2843) (size!19047 a!3626)) k!2843 from!3004)))

(declare-fun b!663820 () Bool)

(declare-fun res!431722 () Bool)

(assert (=> b!663820 (=> (not res!431722) (not e!380746))))

(assert (=> b!663820 (= res!431722 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12759))))

(declare-fun b!663821 () Bool)

(declare-fun e!380747 () Bool)

(assert (=> b!663821 (= e!380747 (contains!3284 acc!681 k!2843))))

(declare-fun res!431727 () Bool)

(assert (=> start!59922 (=> (not res!431727) (not e!380746))))

(assert (=> start!59922 (= res!431727 (and (bvslt (size!19047 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19047 a!3626))))))

(assert (=> start!59922 e!380746))

(assert (=> start!59922 true))

(declare-fun array_inv!14565 (array!38980) Bool)

(assert (=> start!59922 (array_inv!14565 a!3626)))

(declare-fun b!663822 () Bool)

(declare-fun res!431728 () Bool)

(assert (=> b!663822 (=> (not res!431728) (not e!380746))))

(assert (=> b!663822 (= res!431728 (not (contains!3284 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663823 () Bool)

(assert (=> b!663823 (= e!380744 (not (contains!3284 acc!681 k!2843)))))

(declare-fun b!663824 () Bool)

(declare-fun res!431718 () Bool)

(assert (=> b!663824 (=> (not res!431718) (not e!380746))))

(assert (=> b!663824 (= res!431718 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663825 () Bool)

(declare-fun res!431731 () Bool)

(assert (=> b!663825 (=> (not res!431731) (not e!380746))))

(declare-fun noDuplicate!553 (List!12762) Bool)

(assert (=> b!663825 (= res!431731 (noDuplicate!553 acc!681))))

(declare-fun b!663826 () Bool)

(declare-fun res!431721 () Bool)

(assert (=> b!663826 (=> (not res!431721) (not e!380746))))

(assert (=> b!663826 (= res!431721 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663827 () Bool)

(declare-fun Unit!23121 () Unit!23118)

(assert (=> b!663827 (= e!380742 Unit!23121)))

(declare-fun lt!309236 () Unit!23118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38980 (_ BitVec 64) (_ BitVec 32)) Unit!23118)

(assert (=> b!663827 (= lt!309236 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663827 false))

(declare-fun b!663828 () Bool)

(declare-fun res!431725 () Bool)

(assert (=> b!663828 (=> (not res!431725) (not e!380746))))

(assert (=> b!663828 (= res!431725 e!380745)))

(declare-fun res!431720 () Bool)

(assert (=> b!663828 (=> res!431720 e!380745)))

(assert (=> b!663828 (= res!431720 e!380747)))

(declare-fun res!431730 () Bool)

(assert (=> b!663828 (=> (not res!431730) (not e!380747))))

(assert (=> b!663828 (= res!431730 (bvsgt from!3004 i!1382))))

(declare-fun b!663829 () Bool)

(declare-fun res!431726 () Bool)

(assert (=> b!663829 (=> (not res!431726) (not e!380746))))

(assert (=> b!663829 (= res!431726 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19047 a!3626))))))

(declare-fun b!663830 () Bool)

(declare-fun lt!309231 () Unit!23118)

(assert (=> b!663830 (= e!380741 lt!309231)))

(declare-fun lt!309235 () Unit!23118)

(assert (=> b!663830 (= lt!309235 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!663830 (subseq!40 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38980 List!12762 List!12762 (_ BitVec 32)) Unit!23118)

(declare-fun $colon$colon!171 (List!12762 (_ BitVec 64)) List!12762)

(assert (=> b!663830 (= lt!309231 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!171 acc!681 (select (arr!18682 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663830 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663831 () Bool)

(declare-fun Unit!23122 () Unit!23118)

(assert (=> b!663831 (= e!380741 Unit!23122)))

(assert (= (and start!59922 res!431727) b!663825))

(assert (= (and b!663825 res!431731) b!663815))

(assert (= (and b!663815 res!431719) b!663822))

(assert (= (and b!663822 res!431728) b!663828))

(assert (= (and b!663828 res!431730) b!663821))

(assert (= (and b!663828 (not res!431720)) b!663814))

(assert (= (and b!663814 res!431729) b!663823))

(assert (= (and b!663828 res!431725) b!663820))

(assert (= (and b!663820 res!431722) b!663826))

(assert (= (and b!663826 res!431721) b!663829))

(assert (= (and b!663829 res!431726) b!663818))

(assert (= (and b!663818 res!431724) b!663824))

(assert (= (and b!663824 res!431718) b!663816))

(assert (= (and b!663816 res!431723) b!663819))

(assert (= (and b!663819 c!76415) b!663827))

(assert (= (and b!663819 (not c!76415)) b!663817))

(assert (= (and b!663819 c!76416) b!663830))

(assert (= (and b!663819 (not c!76416)) b!663831))

(declare-fun m!634727 () Bool)

(assert (=> b!663827 m!634727))

(declare-fun m!634729 () Bool)

(assert (=> b!663824 m!634729))

(declare-fun m!634731 () Bool)

(assert (=> b!663821 m!634731))

(declare-fun m!634733 () Bool)

(assert (=> b!663820 m!634733))

(declare-fun m!634735 () Bool)

(assert (=> b!663826 m!634735))

(assert (=> b!663823 m!634731))

(declare-fun m!634737 () Bool)

(assert (=> b!663818 m!634737))

(declare-fun m!634739 () Bool)

(assert (=> b!663825 m!634739))

(declare-fun m!634741 () Bool)

(assert (=> b!663819 m!634741))

(declare-fun m!634743 () Bool)

(assert (=> b!663819 m!634743))

(assert (=> b!663819 m!634731))

(declare-fun m!634745 () Bool)

(assert (=> b!663819 m!634745))

(declare-fun m!634747 () Bool)

(assert (=> b!663819 m!634747))

(declare-fun m!634749 () Bool)

(assert (=> b!663819 m!634749))

(assert (=> b!663819 m!634743))

(declare-fun m!634751 () Bool)

(assert (=> b!663819 m!634751))

(declare-fun m!634753 () Bool)

(assert (=> b!663819 m!634753))

(declare-fun m!634755 () Bool)

(assert (=> b!663819 m!634755))

(declare-fun m!634757 () Bool)

(assert (=> b!663822 m!634757))

(declare-fun m!634759 () Bool)

(assert (=> b!663815 m!634759))

(declare-fun m!634761 () Bool)

(assert (=> start!59922 m!634761))

(assert (=> b!663830 m!634741))

(assert (=> b!663830 m!634743))

(declare-fun m!634763 () Bool)

(assert (=> b!663830 m!634763))

(declare-fun m!634765 () Bool)

(assert (=> b!663830 m!634765))

(assert (=> b!663830 m!634743))

(assert (=> b!663830 m!634763))

(assert (=> b!663830 m!634747))

(assert (=> b!663830 m!634755))

(push 1)

(assert (not b!663824))

(assert (not b!663830))

(assert (not b!663826))

(assert (not b!663819))

(assert (not b!663818))

(assert (not b!663822))

(assert (not b!663820))

(assert (not b!663823))

(assert (not b!663825))

(assert (not b!663827))

(assert (not start!59922))

(assert (not b!663821))

(assert (not b!663815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

