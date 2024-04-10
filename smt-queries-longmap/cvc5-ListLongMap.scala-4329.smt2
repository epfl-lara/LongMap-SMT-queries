; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60002 () Bool)

(assert start!60002)

(declare-fun b!666654 () Bool)

(declare-fun res!434006 () Bool)

(declare-fun e!381749 () Bool)

(assert (=> b!666654 (=> (not res!434006) (not e!381749))))

(declare-datatypes ((List!12758 0))(
  ( (Nil!12755) (Cons!12754 (h!13799 (_ BitVec 64)) (t!18986 List!12758)) )
))
(declare-fun acc!681 () List!12758)

(declare-fun contains!3335 (List!12758 (_ BitVec 64)) Bool)

(assert (=> b!666654 (= res!434006 (not (contains!3335 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666655 () Bool)

(declare-fun e!381747 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!666655 (= e!381747 (contains!3335 acc!681 k!2843))))

(declare-fun b!666656 () Bool)

(declare-fun res!433989 () Bool)

(declare-fun e!381750 () Bool)

(assert (=> b!666656 (=> res!433989 e!381750)))

(declare-fun lt!310510 () Bool)

(assert (=> b!666656 (= res!433989 lt!310510)))

(declare-fun b!666657 () Bool)

(declare-fun e!381746 () Bool)

(assert (=> b!666657 (= e!381746 (not (contains!3335 acc!681 k!2843)))))

(declare-fun b!666658 () Bool)

(declare-fun res!433998 () Bool)

(assert (=> b!666658 (=> (not res!433998) (not e!381749))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39049 0))(
  ( (array!39050 (arr!18717 (Array (_ BitVec 32) (_ BitVec 64))) (size!19081 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39049)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!666658 (= res!433998 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19081 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666659 () Bool)

(declare-fun res!433990 () Bool)

(assert (=> b!666659 (=> (not res!433990) (not e!381749))))

(assert (=> b!666659 (= res!433990 (not (contains!3335 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666660 () Bool)

(declare-datatypes ((Unit!23310 0))(
  ( (Unit!23311) )
))
(declare-fun e!381751 () Unit!23310)

(declare-fun Unit!23312 () Unit!23310)

(assert (=> b!666660 (= e!381751 Unit!23312)))

(declare-fun b!666661 () Bool)

(declare-fun res!434007 () Bool)

(assert (=> b!666661 (=> (not res!434007) (not e!381749))))

(declare-fun arrayNoDuplicates!0 (array!39049 (_ BitVec 32) List!12758) Bool)

(assert (=> b!666661 (= res!434007 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12755))))

(declare-fun b!666662 () Bool)

(declare-fun res!434004 () Bool)

(assert (=> b!666662 (=> res!434004 e!381750)))

(declare-fun lt!310504 () List!12758)

(assert (=> b!666662 (= res!434004 (not (contains!3335 lt!310504 k!2843)))))

(declare-fun b!666663 () Bool)

(assert (=> b!666663 (= e!381750 true)))

(declare-fun lt!310511 () Bool)

(assert (=> b!666663 (= lt!310511 (contains!3335 lt!310504 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!434008 () Bool)

(assert (=> start!60002 (=> (not res!434008) (not e!381749))))

(assert (=> start!60002 (= res!434008 (and (bvslt (size!19081 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19081 a!3626))))))

(assert (=> start!60002 e!381749))

(assert (=> start!60002 true))

(declare-fun array_inv!14513 (array!39049) Bool)

(assert (=> start!60002 (array_inv!14513 a!3626)))

(declare-fun b!666653 () Bool)

(declare-fun e!381753 () Bool)

(assert (=> b!666653 (= e!381753 e!381746)))

(declare-fun res!433993 () Bool)

(assert (=> b!666653 (=> (not res!433993) (not e!381746))))

(assert (=> b!666653 (= res!433993 (bvsle from!3004 i!1382))))

(declare-fun b!666664 () Bool)

(declare-fun res!433992 () Bool)

(assert (=> b!666664 (=> res!433992 e!381750)))

(assert (=> b!666664 (= res!433992 (contains!3335 acc!681 k!2843))))

(declare-fun b!666665 () Bool)

(declare-fun e!381748 () Unit!23310)

(declare-fun Unit!23313 () Unit!23310)

(assert (=> b!666665 (= e!381748 Unit!23313)))

(declare-fun b!666666 () Bool)

(declare-fun res!433997 () Bool)

(assert (=> b!666666 (=> (not res!433997) (not e!381749))))

(assert (=> b!666666 (= res!433997 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666667 () Bool)

(declare-fun res!434009 () Bool)

(assert (=> b!666667 (=> res!434009 e!381750)))

(declare-fun subseq!74 (List!12758 List!12758) Bool)

(assert (=> b!666667 (= res!434009 (not (subseq!74 acc!681 lt!310504)))))

(declare-fun b!666668 () Bool)

(declare-fun lt!310512 () Unit!23310)

(assert (=> b!666668 (= e!381751 lt!310512)))

(declare-fun lt!310508 () Unit!23310)

(declare-fun lemmaListSubSeqRefl!0 (List!12758) Unit!23310)

(assert (=> b!666668 (= lt!310508 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666668 (subseq!74 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39049 List!12758 List!12758 (_ BitVec 32)) Unit!23310)

(declare-fun $colon$colon!206 (List!12758 (_ BitVec 64)) List!12758)

(assert (=> b!666668 (= lt!310512 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!206 acc!681 (select (arr!18717 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666668 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666669 () Bool)

(declare-fun res!433991 () Bool)

(assert (=> b!666669 (=> res!433991 e!381750)))

(assert (=> b!666669 (= res!433991 (contains!3335 lt!310504 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666670 () Bool)

(assert (=> b!666670 (= e!381749 (not e!381750))))

(declare-fun res!433994 () Bool)

(assert (=> b!666670 (=> res!433994 e!381750)))

(assert (=> b!666670 (= res!433994 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!72 (List!12758 (_ BitVec 64)) List!12758)

(assert (=> b!666670 (= (-!72 lt!310504 k!2843) acc!681)))

(assert (=> b!666670 (= lt!310504 ($colon$colon!206 acc!681 k!2843))))

(declare-fun lt!310513 () Unit!23310)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12758) Unit!23310)

(assert (=> b!666670 (= lt!310513 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!666670 (subseq!74 acc!681 acc!681)))

(declare-fun lt!310507 () Unit!23310)

(assert (=> b!666670 (= lt!310507 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666670 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310505 () Unit!23310)

(assert (=> b!666670 (= lt!310505 e!381751)))

(declare-fun c!76700 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666670 (= c!76700 (validKeyInArray!0 (select (arr!18717 a!3626) from!3004)))))

(declare-fun lt!310509 () Unit!23310)

(assert (=> b!666670 (= lt!310509 e!381748)))

(declare-fun c!76699 () Bool)

(assert (=> b!666670 (= c!76699 lt!310510)))

(declare-fun arrayContainsKey!0 (array!39049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666670 (= lt!310510 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666670 (arrayContainsKey!0 (array!39050 (store (arr!18717 a!3626) i!1382 k!2843) (size!19081 a!3626)) k!2843 from!3004)))

(declare-fun b!666671 () Bool)

(declare-fun res!433999 () Bool)

(assert (=> b!666671 (=> (not res!433999) (not e!381749))))

(assert (=> b!666671 (= res!433999 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666672 () Bool)

(declare-fun res!434003 () Bool)

(assert (=> b!666672 (=> (not res!434003) (not e!381749))))

(assert (=> b!666672 (= res!434003 e!381753)))

(declare-fun res!434000 () Bool)

(assert (=> b!666672 (=> res!434000 e!381753)))

(assert (=> b!666672 (= res!434000 e!381747)))

(declare-fun res!434002 () Bool)

(assert (=> b!666672 (=> (not res!434002) (not e!381747))))

(assert (=> b!666672 (= res!434002 (bvsgt from!3004 i!1382))))

(declare-fun b!666673 () Bool)

(declare-fun res!433995 () Bool)

(assert (=> b!666673 (=> (not res!433995) (not e!381749))))

(assert (=> b!666673 (= res!433995 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19081 a!3626))))))

(declare-fun b!666674 () Bool)

(declare-fun res!434001 () Bool)

(assert (=> b!666674 (=> (not res!434001) (not e!381749))))

(assert (=> b!666674 (= res!434001 (validKeyInArray!0 k!2843))))

(declare-fun b!666675 () Bool)

(declare-fun Unit!23314 () Unit!23310)

(assert (=> b!666675 (= e!381748 Unit!23314)))

(declare-fun lt!310506 () Unit!23310)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39049 (_ BitVec 64) (_ BitVec 32)) Unit!23310)

(assert (=> b!666675 (= lt!310506 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666675 false))

(declare-fun b!666676 () Bool)

(declare-fun res!433996 () Bool)

(assert (=> b!666676 (=> res!433996 e!381750)))

(declare-fun noDuplicate!582 (List!12758) Bool)

(assert (=> b!666676 (= res!433996 (not (noDuplicate!582 lt!310504)))))

(declare-fun b!666677 () Bool)

(declare-fun res!434005 () Bool)

(assert (=> b!666677 (=> (not res!434005) (not e!381749))))

(assert (=> b!666677 (= res!434005 (noDuplicate!582 acc!681))))

(assert (= (and start!60002 res!434008) b!666677))

(assert (= (and b!666677 res!434005) b!666659))

(assert (= (and b!666659 res!433990) b!666654))

(assert (= (and b!666654 res!434006) b!666672))

(assert (= (and b!666672 res!434002) b!666655))

(assert (= (and b!666672 (not res!434000)) b!666653))

(assert (= (and b!666653 res!433993) b!666657))

(assert (= (and b!666672 res!434003) b!666661))

(assert (= (and b!666661 res!434007) b!666666))

(assert (= (and b!666666 res!433997) b!666673))

(assert (= (and b!666673 res!433995) b!666674))

(assert (= (and b!666674 res!434001) b!666671))

(assert (= (and b!666671 res!433999) b!666658))

(assert (= (and b!666658 res!433998) b!666670))

(assert (= (and b!666670 c!76699) b!666675))

(assert (= (and b!666670 (not c!76699)) b!666665))

(assert (= (and b!666670 c!76700) b!666668))

(assert (= (and b!666670 (not c!76700)) b!666660))

(assert (= (and b!666670 (not res!433994)) b!666676))

(assert (= (and b!666676 (not res!433996)) b!666656))

(assert (= (and b!666656 (not res!433989)) b!666664))

(assert (= (and b!666664 (not res!433992)) b!666667))

(assert (= (and b!666667 (not res!434009)) b!666662))

(assert (= (and b!666662 (not res!434004)) b!666669))

(assert (= (and b!666669 (not res!433991)) b!666663))

(declare-fun m!637397 () Bool)

(assert (=> b!666676 m!637397))

(declare-fun m!637399 () Bool)

(assert (=> b!666677 m!637399))

(declare-fun m!637401 () Bool)

(assert (=> b!666654 m!637401))

(declare-fun m!637403 () Bool)

(assert (=> b!666666 m!637403))

(declare-fun m!637405 () Bool)

(assert (=> b!666655 m!637405))

(declare-fun m!637407 () Bool)

(assert (=> b!666675 m!637407))

(assert (=> b!666664 m!637405))

(declare-fun m!637409 () Bool)

(assert (=> b!666659 m!637409))

(declare-fun m!637411 () Bool)

(assert (=> b!666662 m!637411))

(declare-fun m!637413 () Bool)

(assert (=> b!666661 m!637413))

(declare-fun m!637415 () Bool)

(assert (=> b!666669 m!637415))

(declare-fun m!637417 () Bool)

(assert (=> b!666667 m!637417))

(assert (=> b!666657 m!637405))

(declare-fun m!637419 () Bool)

(assert (=> start!60002 m!637419))

(declare-fun m!637421 () Bool)

(assert (=> b!666663 m!637421))

(declare-fun m!637423 () Bool)

(assert (=> b!666670 m!637423))

(declare-fun m!637425 () Bool)

(assert (=> b!666670 m!637425))

(declare-fun m!637427 () Bool)

(assert (=> b!666670 m!637427))

(declare-fun m!637429 () Bool)

(assert (=> b!666670 m!637429))

(declare-fun m!637431 () Bool)

(assert (=> b!666670 m!637431))

(declare-fun m!637433 () Bool)

(assert (=> b!666670 m!637433))

(declare-fun m!637435 () Bool)

(assert (=> b!666670 m!637435))

(declare-fun m!637437 () Bool)

(assert (=> b!666670 m!637437))

(assert (=> b!666670 m!637427))

(declare-fun m!637439 () Bool)

(assert (=> b!666670 m!637439))

(declare-fun m!637441 () Bool)

(assert (=> b!666670 m!637441))

(declare-fun m!637443 () Bool)

(assert (=> b!666670 m!637443))

(declare-fun m!637445 () Bool)

(assert (=> b!666671 m!637445))

(assert (=> b!666668 m!637423))

(assert (=> b!666668 m!637427))

(declare-fun m!637447 () Bool)

(assert (=> b!666668 m!637447))

(declare-fun m!637449 () Bool)

(assert (=> b!666668 m!637449))

(assert (=> b!666668 m!637427))

(assert (=> b!666668 m!637447))

(assert (=> b!666668 m!637433))

(assert (=> b!666668 m!637443))

(declare-fun m!637451 () Bool)

(assert (=> b!666674 m!637451))

(push 1)

(assert (not b!666659))

(assert (not b!666654))

(assert (not b!666668))

(assert (not b!666666))

(assert (not b!666674))

(assert (not b!666662))

(assert (not b!666675))

(assert (not b!666663))

(assert (not b!666670))

(assert (not b!666676))

(assert (not b!666667))

(assert (not b!666671))

(assert (not b!666655))

(assert (not b!666664))

(assert (not b!666661))

(assert (not b!666657))

(assert (not start!60002))

(assert (not b!666669))

(assert (not b!666677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

