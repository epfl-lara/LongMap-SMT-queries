; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60000 () Bool)

(assert start!60000)

(declare-fun b!666578 () Bool)

(declare-fun res!433929 () Bool)

(declare-fun e!381729 () Bool)

(assert (=> b!666578 (=> (not res!433929) (not e!381729))))

(declare-datatypes ((List!12757 0))(
  ( (Nil!12754) (Cons!12753 (h!13798 (_ BitVec 64)) (t!18985 List!12757)) )
))
(declare-fun acc!681 () List!12757)

(declare-fun contains!3334 (List!12757 (_ BitVec 64)) Bool)

(assert (=> b!666578 (= res!433929 (not (contains!3334 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666579 () Bool)

(declare-datatypes ((Unit!23305 0))(
  ( (Unit!23306) )
))
(declare-fun e!381723 () Unit!23305)

(declare-fun Unit!23307 () Unit!23305)

(assert (=> b!666579 (= e!381723 Unit!23307)))

(declare-fun lt!310482 () Unit!23305)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39047 0))(
  ( (array!39048 (arr!18716 (Array (_ BitVec 32) (_ BitVec 64))) (size!19080 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39047 (_ BitVec 64) (_ BitVec 32)) Unit!23305)

(assert (=> b!666579 (= lt!310482 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666579 false))

(declare-fun b!666580 () Bool)

(declare-fun Unit!23308 () Unit!23305)

(assert (=> b!666580 (= e!381723 Unit!23308)))

(declare-fun b!666581 () Bool)

(declare-fun res!433933 () Bool)

(assert (=> b!666581 (=> (not res!433933) (not e!381729))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666581 (= res!433933 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19080 a!3626))))))

(declare-fun b!666582 () Bool)

(declare-fun res!433943 () Bool)

(declare-fun e!381728 () Bool)

(assert (=> b!666582 (=> res!433943 e!381728)))

(declare-fun lt!310475 () List!12757)

(assert (=> b!666582 (= res!433943 (contains!3334 lt!310475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666583 () Bool)

(assert (=> b!666583 (= e!381728 true)))

(declare-fun lt!310476 () Bool)

(assert (=> b!666583 (= lt!310476 (contains!3334 lt!310475 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666584 () Bool)

(declare-fun res!433936 () Bool)

(assert (=> b!666584 (=> (not res!433936) (not e!381729))))

(declare-fun e!381727 () Bool)

(assert (=> b!666584 (= res!433936 e!381727)))

(declare-fun res!433939 () Bool)

(assert (=> b!666584 (=> res!433939 e!381727)))

(declare-fun e!381722 () Bool)

(assert (=> b!666584 (= res!433939 e!381722)))

(declare-fun res!433942 () Bool)

(assert (=> b!666584 (=> (not res!433942) (not e!381722))))

(assert (=> b!666584 (= res!433942 (bvsgt from!3004 i!1382))))

(declare-fun b!666585 () Bool)

(declare-fun res!433938 () Bool)

(assert (=> b!666585 (=> (not res!433938) (not e!381729))))

(assert (=> b!666585 (= res!433938 (not (contains!3334 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666586 () Bool)

(assert (=> b!666586 (= e!381722 (contains!3334 acc!681 k!2843))))

(declare-fun b!666587 () Bool)

(declare-fun res!433946 () Bool)

(assert (=> b!666587 (=> res!433946 e!381728)))

(declare-fun noDuplicate!581 (List!12757) Bool)

(assert (=> b!666587 (= res!433946 (not (noDuplicate!581 lt!310475)))))

(declare-fun b!666588 () Bool)

(declare-fun res!433935 () Bool)

(assert (=> b!666588 (=> (not res!433935) (not e!381729))))

(declare-fun arrayNoDuplicates!0 (array!39047 (_ BitVec 32) List!12757) Bool)

(assert (=> b!666588 (= res!433935 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12754))))

(declare-fun b!666589 () Bool)

(declare-fun res!433941 () Bool)

(assert (=> b!666589 (=> res!433941 e!381728)))

(assert (=> b!666589 (= res!433941 (not (contains!3334 lt!310475 k!2843)))))

(declare-fun b!666590 () Bool)

(declare-fun res!433937 () Bool)

(assert (=> b!666590 (=> res!433937 e!381728)))

(declare-fun subseq!73 (List!12757 List!12757) Bool)

(assert (=> b!666590 (= res!433937 (not (subseq!73 acc!681 lt!310475)))))

(declare-fun b!666591 () Bool)

(assert (=> b!666591 (= e!381729 (not e!381728))))

(declare-fun res!433940 () Bool)

(assert (=> b!666591 (=> res!433940 e!381728)))

(assert (=> b!666591 (= res!433940 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!71 (List!12757 (_ BitVec 64)) List!12757)

(assert (=> b!666591 (= (-!71 lt!310475 k!2843) acc!681)))

(declare-fun $colon$colon!205 (List!12757 (_ BitVec 64)) List!12757)

(assert (=> b!666591 (= lt!310475 ($colon$colon!205 acc!681 k!2843))))

(declare-fun lt!310474 () Unit!23305)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12757) Unit!23305)

(assert (=> b!666591 (= lt!310474 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666591 (subseq!73 acc!681 acc!681)))

(declare-fun lt!310477 () Unit!23305)

(declare-fun lemmaListSubSeqRefl!0 (List!12757) Unit!23305)

(assert (=> b!666591 (= lt!310477 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666591 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310483 () Unit!23305)

(declare-fun e!381724 () Unit!23305)

(assert (=> b!666591 (= lt!310483 e!381724)))

(declare-fun c!76694 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666591 (= c!76694 (validKeyInArray!0 (select (arr!18716 a!3626) from!3004)))))

(declare-fun lt!310478 () Unit!23305)

(assert (=> b!666591 (= lt!310478 e!381723)))

(declare-fun c!76693 () Bool)

(declare-fun lt!310479 () Bool)

(assert (=> b!666591 (= c!76693 lt!310479)))

(declare-fun arrayContainsKey!0 (array!39047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666591 (= lt!310479 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666591 (arrayContainsKey!0 (array!39048 (store (arr!18716 a!3626) i!1382 k!2843) (size!19080 a!3626)) k!2843 from!3004)))

(declare-fun b!666592 () Bool)

(declare-fun lt!310480 () Unit!23305)

(assert (=> b!666592 (= e!381724 lt!310480)))

(declare-fun lt!310481 () Unit!23305)

(assert (=> b!666592 (= lt!310481 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666592 (subseq!73 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39047 List!12757 List!12757 (_ BitVec 32)) Unit!23305)

(assert (=> b!666592 (= lt!310480 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!205 acc!681 (select (arr!18716 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666592 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666594 () Bool)

(declare-fun e!381725 () Bool)

(assert (=> b!666594 (= e!381727 e!381725)))

(declare-fun res!433927 () Bool)

(assert (=> b!666594 (=> (not res!433927) (not e!381725))))

(assert (=> b!666594 (= res!433927 (bvsle from!3004 i!1382))))

(declare-fun b!666595 () Bool)

(declare-fun res!433931 () Bool)

(assert (=> b!666595 (=> (not res!433931) (not e!381729))))

(assert (=> b!666595 (= res!433931 (validKeyInArray!0 k!2843))))

(declare-fun b!666596 () Bool)

(declare-fun res!433934 () Bool)

(assert (=> b!666596 (=> (not res!433934) (not e!381729))))

(assert (=> b!666596 (= res!433934 (noDuplicate!581 acc!681))))

(declare-fun b!666597 () Bool)

(declare-fun res!433928 () Bool)

(assert (=> b!666597 (=> res!433928 e!381728)))

(assert (=> b!666597 (= res!433928 (contains!3334 acc!681 k!2843))))

(declare-fun b!666598 () Bool)

(declare-fun res!433926 () Bool)

(assert (=> b!666598 (=> res!433926 e!381728)))

(assert (=> b!666598 (= res!433926 lt!310479)))

(declare-fun b!666599 () Bool)

(declare-fun Unit!23309 () Unit!23305)

(assert (=> b!666599 (= e!381724 Unit!23309)))

(declare-fun b!666600 () Bool)

(assert (=> b!666600 (= e!381725 (not (contains!3334 acc!681 k!2843)))))

(declare-fun b!666601 () Bool)

(declare-fun res!433945 () Bool)

(assert (=> b!666601 (=> (not res!433945) (not e!381729))))

(assert (=> b!666601 (= res!433945 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666602 () Bool)

(declare-fun res!433930 () Bool)

(assert (=> b!666602 (=> (not res!433930) (not e!381729))))

(assert (=> b!666602 (= res!433930 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666593 () Bool)

(declare-fun res!433932 () Bool)

(assert (=> b!666593 (=> (not res!433932) (not e!381729))))

(assert (=> b!666593 (= res!433932 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19080 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!433944 () Bool)

(assert (=> start!60000 (=> (not res!433944) (not e!381729))))

(assert (=> start!60000 (= res!433944 (and (bvslt (size!19080 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19080 a!3626))))))

(assert (=> start!60000 e!381729))

(assert (=> start!60000 true))

(declare-fun array_inv!14512 (array!39047) Bool)

(assert (=> start!60000 (array_inv!14512 a!3626)))

(assert (= (and start!60000 res!433944) b!666596))

(assert (= (and b!666596 res!433934) b!666585))

(assert (= (and b!666585 res!433938) b!666578))

(assert (= (and b!666578 res!433929) b!666584))

(assert (= (and b!666584 res!433942) b!666586))

(assert (= (and b!666584 (not res!433939)) b!666594))

(assert (= (and b!666594 res!433927) b!666600))

(assert (= (and b!666584 res!433936) b!666588))

(assert (= (and b!666588 res!433935) b!666602))

(assert (= (and b!666602 res!433930) b!666581))

(assert (= (and b!666581 res!433933) b!666595))

(assert (= (and b!666595 res!433931) b!666601))

(assert (= (and b!666601 res!433945) b!666593))

(assert (= (and b!666593 res!433932) b!666591))

(assert (= (and b!666591 c!76693) b!666579))

(assert (= (and b!666591 (not c!76693)) b!666580))

(assert (= (and b!666591 c!76694) b!666592))

(assert (= (and b!666591 (not c!76694)) b!666599))

(assert (= (and b!666591 (not res!433940)) b!666587))

(assert (= (and b!666587 (not res!433946)) b!666598))

(assert (= (and b!666598 (not res!433926)) b!666597))

(assert (= (and b!666597 (not res!433928)) b!666590))

(assert (= (and b!666590 (not res!433937)) b!666589))

(assert (= (and b!666589 (not res!433941)) b!666582))

(assert (= (and b!666582 (not res!433943)) b!666583))

(declare-fun m!637341 () Bool)

(assert (=> b!666586 m!637341))

(declare-fun m!637343 () Bool)

(assert (=> b!666601 m!637343))

(declare-fun m!637345 () Bool)

(assert (=> b!666602 m!637345))

(declare-fun m!637347 () Bool)

(assert (=> b!666579 m!637347))

(declare-fun m!637349 () Bool)

(assert (=> b!666590 m!637349))

(declare-fun m!637351 () Bool)

(assert (=> start!60000 m!637351))

(declare-fun m!637353 () Bool)

(assert (=> b!666591 m!637353))

(declare-fun m!637355 () Bool)

(assert (=> b!666591 m!637355))

(declare-fun m!637357 () Bool)

(assert (=> b!666591 m!637357))

(declare-fun m!637359 () Bool)

(assert (=> b!666591 m!637359))

(declare-fun m!637361 () Bool)

(assert (=> b!666591 m!637361))

(declare-fun m!637363 () Bool)

(assert (=> b!666591 m!637363))

(declare-fun m!637365 () Bool)

(assert (=> b!666591 m!637365))

(declare-fun m!637367 () Bool)

(assert (=> b!666591 m!637367))

(assert (=> b!666591 m!637355))

(declare-fun m!637369 () Bool)

(assert (=> b!666591 m!637369))

(declare-fun m!637371 () Bool)

(assert (=> b!666591 m!637371))

(declare-fun m!637373 () Bool)

(assert (=> b!666591 m!637373))

(declare-fun m!637375 () Bool)

(assert (=> b!666578 m!637375))

(assert (=> b!666592 m!637353))

(assert (=> b!666592 m!637355))

(declare-fun m!637377 () Bool)

(assert (=> b!666592 m!637377))

(declare-fun m!637379 () Bool)

(assert (=> b!666592 m!637379))

(assert (=> b!666592 m!637355))

(assert (=> b!666592 m!637377))

(assert (=> b!666592 m!637363))

(assert (=> b!666592 m!637373))

(declare-fun m!637381 () Bool)

(assert (=> b!666595 m!637381))

(assert (=> b!666600 m!637341))

(declare-fun m!637383 () Bool)

(assert (=> b!666596 m!637383))

(declare-fun m!637385 () Bool)

(assert (=> b!666588 m!637385))

(declare-fun m!637387 () Bool)

(assert (=> b!666589 m!637387))

(declare-fun m!637389 () Bool)

(assert (=> b!666583 m!637389))

(declare-fun m!637391 () Bool)

(assert (=> b!666587 m!637391))

(assert (=> b!666597 m!637341))

(declare-fun m!637393 () Bool)

(assert (=> b!666582 m!637393))

(declare-fun m!637395 () Bool)

(assert (=> b!666585 m!637395))

(push 1)

(assert (not b!666587))

(assert (not b!666601))

(assert (not b!666585))

(assert (not b!666597))

(assert (not b!666582))

(assert (not b!666590))

(assert (not b!666586))

(assert (not b!666588))

(assert (not b!666578))

(assert (not start!60000))

(assert (not b!666595))

(assert (not b!666589))

(assert (not b!666596))

(assert (not b!666592))

(assert (not b!666583))

(assert (not b!666579))

(assert (not b!666602))

(assert (not b!666591))

(assert (not b!666600))

(check-sat)

