; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61568 () Bool)

(assert start!61568)

(declare-fun b!688718 () Bool)

(declare-fun res!453393 () Bool)

(declare-fun e!392238 () Bool)

(assert (=> b!688718 (=> (not res!453393) (not e!392238))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688718 (= res!453393 (validKeyInArray!0 k!2843))))

(declare-fun b!688719 () Bool)

(declare-datatypes ((Unit!24297 0))(
  ( (Unit!24298) )
))
(declare-fun e!392239 () Unit!24297)

(declare-fun Unit!24299 () Unit!24297)

(assert (=> b!688719 (= e!392239 Unit!24299)))

(declare-fun b!688720 () Bool)

(declare-fun e!392236 () Bool)

(assert (=> b!688720 (= e!392236 true)))

(declare-fun lt!315887 () Bool)

(declare-fun e!392235 () Bool)

(assert (=> b!688720 (= lt!315887 e!392235)))

(declare-fun res!453384 () Bool)

(assert (=> b!688720 (=> res!453384 e!392235)))

(declare-fun e!392240 () Bool)

(assert (=> b!688720 (= res!453384 e!392240)))

(declare-fun res!453395 () Bool)

(assert (=> b!688720 (=> (not res!453395) (not e!392240))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688720 (= res!453395 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688721 () Bool)

(declare-fun e!392231 () Bool)

(assert (=> b!688721 (= e!392235 e!392231)))

(declare-fun res!453385 () Bool)

(assert (=> b!688721 (=> (not res!453385) (not e!392231))))

(assert (=> b!688721 (= res!453385 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688722 () Bool)

(assert (=> b!688722 (= e!392238 (not e!392236))))

(declare-fun res!453380 () Bool)

(assert (=> b!688722 (=> res!453380 e!392236)))

(assert (=> b!688722 (= res!453380 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39709 0))(
  ( (array!39710 (arr!19026 (Array (_ BitVec 32) (_ BitVec 64))) (size!19408 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39709)

(declare-datatypes ((List!13067 0))(
  ( (Nil!13064) (Cons!13063 (h!14108 (_ BitVec 64)) (t!19331 List!13067)) )
))
(declare-fun lt!315881 () List!13067)

(declare-fun arrayNoDuplicates!0 (array!39709 (_ BitVec 32) List!13067) Bool)

(assert (=> b!688722 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315881)))

(declare-fun acc!681 () List!13067)

(declare-fun lt!315885 () Unit!24297)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39709 (_ BitVec 64) (_ BitVec 32) List!13067 List!13067) Unit!24297)

(assert (=> b!688722 (= lt!315885 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315881))))

(declare-fun -!195 (List!13067 (_ BitVec 64)) List!13067)

(assert (=> b!688722 (= (-!195 lt!315881 k!2843) acc!681)))

(declare-fun $colon$colon!395 (List!13067 (_ BitVec 64)) List!13067)

(assert (=> b!688722 (= lt!315881 ($colon$colon!395 acc!681 k!2843))))

(declare-fun lt!315884 () Unit!24297)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13067) Unit!24297)

(assert (=> b!688722 (= lt!315884 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!230 (List!13067 List!13067) Bool)

(assert (=> b!688722 (subseq!230 acc!681 acc!681)))

(declare-fun lt!315889 () Unit!24297)

(declare-fun lemmaListSubSeqRefl!0 (List!13067) Unit!24297)

(assert (=> b!688722 (= lt!315889 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688722 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315888 () Unit!24297)

(declare-fun e!392234 () Unit!24297)

(assert (=> b!688722 (= lt!315888 e!392234)))

(declare-fun c!78037 () Bool)

(assert (=> b!688722 (= c!78037 (validKeyInArray!0 (select (arr!19026 a!3626) from!3004)))))

(declare-fun lt!315880 () Unit!24297)

(assert (=> b!688722 (= lt!315880 e!392239)))

(declare-fun c!78038 () Bool)

(declare-fun arrayContainsKey!0 (array!39709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688722 (= c!78038 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688722 (arrayContainsKey!0 (array!39710 (store (arr!19026 a!3626) i!1382 k!2843) (size!19408 a!3626)) k!2843 from!3004)))

(declare-fun b!688723 () Bool)

(declare-fun res!453387 () Bool)

(assert (=> b!688723 (=> (not res!453387) (not e!392238))))

(assert (=> b!688723 (= res!453387 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13064))))

(declare-fun b!688725 () Bool)

(declare-fun res!453397 () Bool)

(assert (=> b!688725 (=> (not res!453397) (not e!392238))))

(declare-fun contains!3644 (List!13067 (_ BitVec 64)) Bool)

(assert (=> b!688725 (= res!453397 (not (contains!3644 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688726 () Bool)

(declare-fun res!453398 () Bool)

(assert (=> b!688726 (=> res!453398 e!392236)))

(declare-fun noDuplicate!891 (List!13067) Bool)

(assert (=> b!688726 (= res!453398 (not (noDuplicate!891 lt!315881)))))

(declare-fun b!688727 () Bool)

(declare-fun res!453378 () Bool)

(assert (=> b!688727 (=> (not res!453378) (not e!392238))))

(assert (=> b!688727 (= res!453378 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19408 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688728 () Bool)

(declare-fun e!392241 () Bool)

(assert (=> b!688728 (= e!392241 (contains!3644 acc!681 k!2843))))

(declare-fun b!688729 () Bool)

(declare-fun e!392233 () Bool)

(assert (=> b!688729 (= e!392233 (not (contains!3644 acc!681 k!2843)))))

(declare-fun b!688730 () Bool)

(declare-fun res!453390 () Bool)

(assert (=> b!688730 (=> res!453390 e!392236)))

(assert (=> b!688730 (= res!453390 (contains!3644 lt!315881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688731 () Bool)

(assert (=> b!688731 (= e!392231 (not (contains!3644 lt!315881 k!2843)))))

(declare-fun b!688732 () Bool)

(declare-fun res!453386 () Bool)

(assert (=> b!688732 (=> (not res!453386) (not e!392238))))

(declare-fun e!392237 () Bool)

(assert (=> b!688732 (= res!453386 e!392237)))

(declare-fun res!453392 () Bool)

(assert (=> b!688732 (=> res!453392 e!392237)))

(assert (=> b!688732 (= res!453392 e!392241)))

(declare-fun res!453391 () Bool)

(assert (=> b!688732 (=> (not res!453391) (not e!392241))))

(assert (=> b!688732 (= res!453391 (bvsgt from!3004 i!1382))))

(declare-fun b!688733 () Bool)

(declare-fun res!453382 () Bool)

(assert (=> b!688733 (=> (not res!453382) (not e!392238))))

(assert (=> b!688733 (= res!453382 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688734 () Bool)

(declare-fun res!453381 () Bool)

(assert (=> b!688734 (=> (not res!453381) (not e!392238))))

(assert (=> b!688734 (= res!453381 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19408 a!3626))))))

(declare-fun b!688735 () Bool)

(declare-fun res!453394 () Bool)

(assert (=> b!688735 (=> res!453394 e!392236)))

(assert (=> b!688735 (= res!453394 (contains!3644 lt!315881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688736 () Bool)

(declare-fun res!453396 () Bool)

(assert (=> b!688736 (=> (not res!453396) (not e!392238))))

(assert (=> b!688736 (= res!453396 (noDuplicate!891 acc!681))))

(declare-fun b!688737 () Bool)

(declare-fun Unit!24300 () Unit!24297)

(assert (=> b!688737 (= e!392239 Unit!24300)))

(declare-fun lt!315886 () Unit!24297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39709 (_ BitVec 64) (_ BitVec 32)) Unit!24297)

(assert (=> b!688737 (= lt!315886 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688737 false))

(declare-fun b!688738 () Bool)

(assert (=> b!688738 (= e!392240 (contains!3644 lt!315881 k!2843))))

(declare-fun res!453379 () Bool)

(assert (=> start!61568 (=> (not res!453379) (not e!392238))))

(assert (=> start!61568 (= res!453379 (and (bvslt (size!19408 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19408 a!3626))))))

(assert (=> start!61568 e!392238))

(assert (=> start!61568 true))

(declare-fun array_inv!14822 (array!39709) Bool)

(assert (=> start!61568 (array_inv!14822 a!3626)))

(declare-fun b!688724 () Bool)

(declare-fun res!453388 () Bool)

(assert (=> b!688724 (=> (not res!453388) (not e!392238))))

(assert (=> b!688724 (= res!453388 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688739 () Bool)

(declare-fun Unit!24301 () Unit!24297)

(assert (=> b!688739 (= e!392234 Unit!24301)))

(declare-fun b!688740 () Bool)

(declare-fun lt!315882 () Unit!24297)

(assert (=> b!688740 (= e!392234 lt!315882)))

(declare-fun lt!315883 () Unit!24297)

(assert (=> b!688740 (= lt!315883 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688740 (subseq!230 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39709 List!13067 List!13067 (_ BitVec 32)) Unit!24297)

(assert (=> b!688740 (= lt!315882 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!395 acc!681 (select (arr!19026 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688740 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688741 () Bool)

(declare-fun res!453389 () Bool)

(assert (=> b!688741 (=> (not res!453389) (not e!392238))))

(assert (=> b!688741 (= res!453389 (not (contains!3644 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688742 () Bool)

(assert (=> b!688742 (= e!392237 e!392233)))

(declare-fun res!453383 () Bool)

(assert (=> b!688742 (=> (not res!453383) (not e!392233))))

(assert (=> b!688742 (= res!453383 (bvsle from!3004 i!1382))))

(assert (= (and start!61568 res!453379) b!688736))

(assert (= (and b!688736 res!453396) b!688725))

(assert (= (and b!688725 res!453397) b!688741))

(assert (= (and b!688741 res!453389) b!688732))

(assert (= (and b!688732 res!453391) b!688728))

(assert (= (and b!688732 (not res!453392)) b!688742))

(assert (= (and b!688742 res!453383) b!688729))

(assert (= (and b!688732 res!453386) b!688723))

(assert (= (and b!688723 res!453387) b!688724))

(assert (= (and b!688724 res!453388) b!688734))

(assert (= (and b!688734 res!453381) b!688718))

(assert (= (and b!688718 res!453393) b!688733))

(assert (= (and b!688733 res!453382) b!688727))

(assert (= (and b!688727 res!453378) b!688722))

(assert (= (and b!688722 c!78038) b!688737))

(assert (= (and b!688722 (not c!78038)) b!688719))

(assert (= (and b!688722 c!78037) b!688740))

(assert (= (and b!688722 (not c!78037)) b!688739))

(assert (= (and b!688722 (not res!453380)) b!688726))

(assert (= (and b!688726 (not res!453398)) b!688730))

(assert (= (and b!688730 (not res!453390)) b!688735))

(assert (= (and b!688735 (not res!453394)) b!688720))

(assert (= (and b!688720 res!453395) b!688738))

(assert (= (and b!688720 (not res!453384)) b!688721))

(assert (= (and b!688721 res!453385) b!688731))

(declare-fun m!652547 () Bool)

(assert (=> b!688733 m!652547))

(declare-fun m!652549 () Bool)

(assert (=> b!688730 m!652549))

(declare-fun m!652551 () Bool)

(assert (=> b!688728 m!652551))

(declare-fun m!652553 () Bool)

(assert (=> b!688731 m!652553))

(declare-fun m!652555 () Bool)

(assert (=> b!688740 m!652555))

(declare-fun m!652557 () Bool)

(assert (=> b!688740 m!652557))

(declare-fun m!652559 () Bool)

(assert (=> b!688740 m!652559))

(declare-fun m!652561 () Bool)

(assert (=> b!688740 m!652561))

(assert (=> b!688740 m!652557))

(assert (=> b!688740 m!652559))

(declare-fun m!652563 () Bool)

(assert (=> b!688740 m!652563))

(declare-fun m!652565 () Bool)

(assert (=> b!688740 m!652565))

(declare-fun m!652567 () Bool)

(assert (=> b!688723 m!652567))

(declare-fun m!652569 () Bool)

(assert (=> start!61568 m!652569))

(declare-fun m!652571 () Bool)

(assert (=> b!688741 m!652571))

(assert (=> b!688729 m!652551))

(declare-fun m!652573 () Bool)

(assert (=> b!688718 m!652573))

(declare-fun m!652575 () Bool)

(assert (=> b!688737 m!652575))

(declare-fun m!652577 () Bool)

(assert (=> b!688736 m!652577))

(declare-fun m!652579 () Bool)

(assert (=> b!688735 m!652579))

(declare-fun m!652581 () Bool)

(assert (=> b!688722 m!652581))

(assert (=> b!688722 m!652557))

(declare-fun m!652583 () Bool)

(assert (=> b!688722 m!652583))

(declare-fun m!652585 () Bool)

(assert (=> b!688722 m!652585))

(declare-fun m!652587 () Bool)

(assert (=> b!688722 m!652587))

(assert (=> b!688722 m!652563))

(declare-fun m!652589 () Bool)

(assert (=> b!688722 m!652589))

(declare-fun m!652591 () Bool)

(assert (=> b!688722 m!652591))

(assert (=> b!688722 m!652557))

(declare-fun m!652593 () Bool)

(assert (=> b!688722 m!652593))

(declare-fun m!652595 () Bool)

(assert (=> b!688722 m!652595))

(assert (=> b!688722 m!652555))

(declare-fun m!652597 () Bool)

(assert (=> b!688722 m!652597))

(assert (=> b!688722 m!652565))

(declare-fun m!652599 () Bool)

(assert (=> b!688725 m!652599))

(assert (=> b!688738 m!652553))

(declare-fun m!652601 () Bool)

(assert (=> b!688724 m!652601))

(declare-fun m!652603 () Bool)

(assert (=> b!688726 m!652603))

(push 1)

(assert (not b!688723))

(assert (not b!688737))

(assert (not b!688718))

(assert (not b!688730))

(assert (not b!688725))

(assert (not b!688731))

(assert (not b!688724))

(assert (not b!688736))

(assert (not start!61568))

(assert (not b!688729))

(assert (not b!688728))

(assert (not b!688740))

(assert (not b!688735))

(assert (not b!688738))

(assert (not b!688741))

(assert (not b!688726))

(assert (not b!688733))

(assert (not b!688722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

