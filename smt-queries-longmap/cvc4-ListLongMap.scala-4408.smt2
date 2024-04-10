; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60864 () Bool)

(assert start!60864)

(declare-fun b!682515 () Bool)

(declare-fun e!388901 () Bool)

(declare-datatypes ((List!12997 0))(
  ( (Nil!12994) (Cons!12993 (h!14038 (_ BitVec 64)) (t!19240 List!12997)) )
))
(declare-fun acc!681 () List!12997)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3574 (List!12997 (_ BitVec 64)) Bool)

(assert (=> b!682515 (= e!388901 (not (contains!3574 acc!681 k!2843)))))

(declare-fun b!682517 () Bool)

(declare-fun res!448508 () Bool)

(declare-fun e!388897 () Bool)

(assert (=> b!682517 (=> (not res!448508) (not e!388897))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39548 0))(
  ( (array!39549 (arr!18956 (Array (_ BitVec 32) (_ BitVec 64))) (size!19320 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39548)

(assert (=> b!682517 (= res!448508 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19320 a!3626))))))

(declare-fun b!682518 () Bool)

(declare-datatypes ((Unit!23947 0))(
  ( (Unit!23948) )
))
(declare-fun e!388896 () Unit!23947)

(declare-fun lt!313544 () Unit!23947)

(assert (=> b!682518 (= e!388896 lt!313544)))

(declare-fun lt!313545 () Unit!23947)

(declare-fun lemmaListSubSeqRefl!0 (List!12997) Unit!23947)

(assert (=> b!682518 (= lt!313545 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!160 (List!12997 List!12997) Bool)

(assert (=> b!682518 (subseq!160 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39548 List!12997 List!12997 (_ BitVec 32)) Unit!23947)

(declare-fun $colon$colon!325 (List!12997 (_ BitVec 64)) List!12997)

(assert (=> b!682518 (= lt!313544 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!325 acc!681 (select (arr!18956 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39548 (_ BitVec 32) List!12997) Bool)

(assert (=> b!682518 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682519 () Bool)

(declare-fun Unit!23949 () Unit!23947)

(assert (=> b!682519 (= e!388896 Unit!23949)))

(declare-fun b!682520 () Bool)

(declare-fun res!448502 () Bool)

(assert (=> b!682520 (=> (not res!448502) (not e!388897))))

(assert (=> b!682520 (= res!448502 (not (contains!3574 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682521 () Bool)

(declare-fun res!448506 () Bool)

(assert (=> b!682521 (=> (not res!448506) (not e!388897))))

(assert (=> b!682521 (= res!448506 (not (contains!3574 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682522 () Bool)

(declare-fun res!448498 () Bool)

(assert (=> b!682522 (=> (not res!448498) (not e!388897))))

(declare-fun arrayContainsKey!0 (array!39548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682522 (= res!448498 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682523 () Bool)

(declare-fun res!448497 () Bool)

(assert (=> b!682523 (=> (not res!448497) (not e!388897))))

(assert (=> b!682523 (= res!448497 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19320 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682524 () Bool)

(assert (=> b!682524 (= e!388897 (not (not (contains!3574 acc!681 k!2843))))))

(assert (=> b!682524 (subseq!160 acc!681 acc!681)))

(declare-fun lt!313547 () Unit!23947)

(assert (=> b!682524 (= lt!313547 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682524 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313548 () Unit!23947)

(assert (=> b!682524 (= lt!313548 e!388896)))

(declare-fun c!77377 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682524 (= c!77377 (validKeyInArray!0 (select (arr!18956 a!3626) from!3004)))))

(declare-fun lt!313546 () Unit!23947)

(declare-fun e!388900 () Unit!23947)

(assert (=> b!682524 (= lt!313546 e!388900)))

(declare-fun c!77378 () Bool)

(assert (=> b!682524 (= c!77378 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682524 (arrayContainsKey!0 (array!39549 (store (arr!18956 a!3626) i!1382 k!2843) (size!19320 a!3626)) k!2843 from!3004)))

(declare-fun b!682525 () Bool)

(declare-fun Unit!23950 () Unit!23947)

(assert (=> b!682525 (= e!388900 Unit!23950)))

(declare-fun lt!313549 () Unit!23947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39548 (_ BitVec 64) (_ BitVec 32)) Unit!23947)

(assert (=> b!682525 (= lt!313549 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682525 false))

(declare-fun b!682526 () Bool)

(declare-fun e!388902 () Bool)

(assert (=> b!682526 (= e!388902 (contains!3574 acc!681 k!2843))))

(declare-fun b!682527 () Bool)

(declare-fun res!448501 () Bool)

(assert (=> b!682527 (=> (not res!448501) (not e!388897))))

(declare-fun noDuplicate!821 (List!12997) Bool)

(assert (=> b!682527 (= res!448501 (noDuplicate!821 acc!681))))

(declare-fun b!682528 () Bool)

(declare-fun res!448505 () Bool)

(assert (=> b!682528 (=> (not res!448505) (not e!388897))))

(assert (=> b!682528 (= res!448505 (validKeyInArray!0 k!2843))))

(declare-fun b!682516 () Bool)

(declare-fun res!448500 () Bool)

(assert (=> b!682516 (=> (not res!448500) (not e!388897))))

(assert (=> b!682516 (= res!448500 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!448495 () Bool)

(assert (=> start!60864 (=> (not res!448495) (not e!388897))))

(assert (=> start!60864 (= res!448495 (and (bvslt (size!19320 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19320 a!3626))))))

(assert (=> start!60864 e!388897))

(assert (=> start!60864 true))

(declare-fun array_inv!14752 (array!39548) Bool)

(assert (=> start!60864 (array_inv!14752 a!3626)))

(declare-fun b!682529 () Bool)

(declare-fun res!448504 () Bool)

(assert (=> b!682529 (=> (not res!448504) (not e!388897))))

(declare-fun e!388899 () Bool)

(assert (=> b!682529 (= res!448504 e!388899)))

(declare-fun res!448507 () Bool)

(assert (=> b!682529 (=> res!448507 e!388899)))

(assert (=> b!682529 (= res!448507 e!388902)))

(declare-fun res!448503 () Bool)

(assert (=> b!682529 (=> (not res!448503) (not e!388902))))

(assert (=> b!682529 (= res!448503 (bvsgt from!3004 i!1382))))

(declare-fun b!682530 () Bool)

(assert (=> b!682530 (= e!388899 e!388901)))

(declare-fun res!448496 () Bool)

(assert (=> b!682530 (=> (not res!448496) (not e!388901))))

(assert (=> b!682530 (= res!448496 (bvsle from!3004 i!1382))))

(declare-fun b!682531 () Bool)

(declare-fun res!448499 () Bool)

(assert (=> b!682531 (=> (not res!448499) (not e!388897))))

(assert (=> b!682531 (= res!448499 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12994))))

(declare-fun b!682532 () Bool)

(declare-fun Unit!23951 () Unit!23947)

(assert (=> b!682532 (= e!388900 Unit!23951)))

(assert (= (and start!60864 res!448495) b!682527))

(assert (= (and b!682527 res!448501) b!682521))

(assert (= (and b!682521 res!448506) b!682520))

(assert (= (and b!682520 res!448502) b!682529))

(assert (= (and b!682529 res!448503) b!682526))

(assert (= (and b!682529 (not res!448507)) b!682530))

(assert (= (and b!682530 res!448496) b!682515))

(assert (= (and b!682529 res!448504) b!682531))

(assert (= (and b!682531 res!448499) b!682516))

(assert (= (and b!682516 res!448500) b!682517))

(assert (= (and b!682517 res!448508) b!682528))

(assert (= (and b!682528 res!448505) b!682522))

(assert (= (and b!682522 res!448498) b!682523))

(assert (= (and b!682523 res!448497) b!682524))

(assert (= (and b!682524 c!77378) b!682525))

(assert (= (and b!682524 (not c!77378)) b!682532))

(assert (= (and b!682524 c!77377) b!682518))

(assert (= (and b!682524 (not c!77377)) b!682519))

(declare-fun m!647197 () Bool)

(assert (=> b!682524 m!647197))

(declare-fun m!647199 () Bool)

(assert (=> b!682524 m!647199))

(declare-fun m!647201 () Bool)

(assert (=> b!682524 m!647201))

(declare-fun m!647203 () Bool)

(assert (=> b!682524 m!647203))

(declare-fun m!647205 () Bool)

(assert (=> b!682524 m!647205))

(declare-fun m!647207 () Bool)

(assert (=> b!682524 m!647207))

(assert (=> b!682524 m!647199))

(declare-fun m!647209 () Bool)

(assert (=> b!682524 m!647209))

(declare-fun m!647211 () Bool)

(assert (=> b!682524 m!647211))

(declare-fun m!647213 () Bool)

(assert (=> b!682524 m!647213))

(declare-fun m!647215 () Bool)

(assert (=> b!682531 m!647215))

(declare-fun m!647217 () Bool)

(assert (=> b!682521 m!647217))

(assert (=> b!682515 m!647201))

(declare-fun m!647219 () Bool)

(assert (=> b!682516 m!647219))

(declare-fun m!647221 () Bool)

(assert (=> start!60864 m!647221))

(declare-fun m!647223 () Bool)

(assert (=> b!682528 m!647223))

(assert (=> b!682518 m!647197))

(assert (=> b!682518 m!647199))

(declare-fun m!647225 () Bool)

(assert (=> b!682518 m!647225))

(declare-fun m!647227 () Bool)

(assert (=> b!682518 m!647227))

(assert (=> b!682518 m!647199))

(assert (=> b!682518 m!647225))

(assert (=> b!682518 m!647205))

(assert (=> b!682518 m!647213))

(declare-fun m!647229 () Bool)

(assert (=> b!682522 m!647229))

(declare-fun m!647231 () Bool)

(assert (=> b!682525 m!647231))

(declare-fun m!647233 () Bool)

(assert (=> b!682520 m!647233))

(declare-fun m!647235 () Bool)

(assert (=> b!682527 m!647235))

(assert (=> b!682526 m!647201))

(push 1)

(assert (not b!682520))

(assert (not b!682515))

(assert (not start!60864))

(assert (not b!682528))

(assert (not b!682531))

(assert (not b!682526))

(assert (not b!682524))

(assert (not b!682516))

(assert (not b!682518))

(assert (not b!682527))

(assert (not b!682521))

(assert (not b!682522))

(assert (not b!682525))

(check-sat)

(pop 1)

(push 1)

(check-sat)

