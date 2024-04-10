; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60870 () Bool)

(assert start!60870)

(declare-fun b!682677 () Bool)

(declare-fun res!448624 () Bool)

(declare-fun e!388960 () Bool)

(assert (=> b!682677 (=> (not res!448624) (not e!388960))))

(declare-datatypes ((array!39554 0))(
  ( (array!39555 (arr!18959 (Array (_ BitVec 32) (_ BitVec 64))) (size!19323 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39554)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13000 0))(
  ( (Nil!12997) (Cons!12996 (h!14041 (_ BitVec 64)) (t!19243 List!13000)) )
))
(declare-fun acc!681 () List!13000)

(declare-fun arrayNoDuplicates!0 (array!39554 (_ BitVec 32) List!13000) Bool)

(assert (=> b!682677 (= res!448624 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682678 () Bool)

(declare-datatypes ((Unit!23962 0))(
  ( (Unit!23963) )
))
(declare-fun e!388961 () Unit!23962)

(declare-fun Unit!23964 () Unit!23962)

(assert (=> b!682678 (= e!388961 Unit!23964)))

(declare-fun res!448633 () Bool)

(assert (=> start!60870 (=> (not res!448633) (not e!388960))))

(assert (=> start!60870 (= res!448633 (and (bvslt (size!19323 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19323 a!3626))))))

(assert (=> start!60870 e!388960))

(assert (=> start!60870 true))

(declare-fun array_inv!14755 (array!39554) Bool)

(assert (=> start!60870 (array_inv!14755 a!3626)))

(declare-fun b!682679 () Bool)

(declare-fun res!448632 () Bool)

(assert (=> b!682679 (=> (not res!448632) (not e!388960))))

(declare-fun noDuplicate!824 (List!13000) Bool)

(assert (=> b!682679 (= res!448632 (noDuplicate!824 acc!681))))

(declare-fun b!682680 () Bool)

(declare-fun res!448627 () Bool)

(assert (=> b!682680 (=> (not res!448627) (not e!388960))))

(declare-fun contains!3577 (List!13000 (_ BitVec 64)) Bool)

(assert (=> b!682680 (= res!448627 (not (contains!3577 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682681 () Bool)

(declare-fun Unit!23965 () Unit!23962)

(assert (=> b!682681 (= e!388961 Unit!23965)))

(declare-fun lt!313606 () Unit!23962)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39554 (_ BitVec 64) (_ BitVec 32)) Unit!23962)

(assert (=> b!682681 (= lt!313606 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682681 false))

(declare-fun b!682682 () Bool)

(declare-fun res!448625 () Bool)

(assert (=> b!682682 (=> (not res!448625) (not e!388960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682682 (= res!448625 (validKeyInArray!0 k!2843))))

(declare-fun b!682683 () Bool)

(declare-fun e!388963 () Unit!23962)

(declare-fun lt!313611 () Unit!23962)

(assert (=> b!682683 (= e!388963 lt!313611)))

(declare-fun lt!313608 () Unit!23962)

(declare-fun lemmaListSubSeqRefl!0 (List!13000) Unit!23962)

(assert (=> b!682683 (= lt!313608 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!163 (List!13000 List!13000) Bool)

(assert (=> b!682683 (subseq!163 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39554 List!13000 List!13000 (_ BitVec 32)) Unit!23962)

(declare-fun $colon$colon!328 (List!13000 (_ BitVec 64)) List!13000)

(assert (=> b!682683 (= lt!313611 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!328 acc!681 (select (arr!18959 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682683 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682684 () Bool)

(declare-fun res!448622 () Bool)

(assert (=> b!682684 (=> (not res!448622) (not e!388960))))

(declare-fun e!388959 () Bool)

(assert (=> b!682684 (= res!448622 e!388959)))

(declare-fun res!448623 () Bool)

(assert (=> b!682684 (=> res!448623 e!388959)))

(declare-fun e!388962 () Bool)

(assert (=> b!682684 (= res!448623 e!388962)))

(declare-fun res!448626 () Bool)

(assert (=> b!682684 (=> (not res!448626) (not e!388962))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682684 (= res!448626 (bvsgt from!3004 i!1382))))

(declare-fun b!682685 () Bool)

(declare-fun e!388965 () Bool)

(assert (=> b!682685 (= e!388959 e!388965)))

(declare-fun res!448634 () Bool)

(assert (=> b!682685 (=> (not res!448634) (not e!388965))))

(assert (=> b!682685 (= res!448634 (bvsle from!3004 i!1382))))

(declare-fun b!682686 () Bool)

(assert (=> b!682686 (= e!388960 (not true))))

(declare-fun -!128 (List!13000 (_ BitVec 64)) List!13000)

(assert (=> b!682686 (= (-!128 ($colon$colon!328 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313610 () Unit!23962)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13000) Unit!23962)

(assert (=> b!682686 (= lt!313610 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!682686 (subseq!163 acc!681 acc!681)))

(declare-fun lt!313609 () Unit!23962)

(assert (=> b!682686 (= lt!313609 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682686 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313612 () Unit!23962)

(assert (=> b!682686 (= lt!313612 e!388963)))

(declare-fun c!77395 () Bool)

(assert (=> b!682686 (= c!77395 (validKeyInArray!0 (select (arr!18959 a!3626) from!3004)))))

(declare-fun lt!313607 () Unit!23962)

(assert (=> b!682686 (= lt!313607 e!388961)))

(declare-fun c!77396 () Bool)

(declare-fun arrayContainsKey!0 (array!39554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682686 (= c!77396 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682686 (arrayContainsKey!0 (array!39555 (store (arr!18959 a!3626) i!1382 k!2843) (size!19323 a!3626)) k!2843 from!3004)))

(declare-fun b!682687 () Bool)

(assert (=> b!682687 (= e!388962 (contains!3577 acc!681 k!2843))))

(declare-fun b!682688 () Bool)

(declare-fun res!448621 () Bool)

(assert (=> b!682688 (=> (not res!448621) (not e!388960))))

(assert (=> b!682688 (= res!448621 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682689 () Bool)

(assert (=> b!682689 (= e!388965 (not (contains!3577 acc!681 k!2843)))))

(declare-fun b!682690 () Bool)

(declare-fun res!448629 () Bool)

(assert (=> b!682690 (=> (not res!448629) (not e!388960))))

(assert (=> b!682690 (= res!448629 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19323 a!3626))))))

(declare-fun b!682691 () Bool)

(declare-fun res!448628 () Bool)

(assert (=> b!682691 (=> (not res!448628) (not e!388960))))

(assert (=> b!682691 (= res!448628 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12997))))

(declare-fun b!682692 () Bool)

(declare-fun res!448631 () Bool)

(assert (=> b!682692 (=> (not res!448631) (not e!388960))))

(assert (=> b!682692 (= res!448631 (not (contains!3577 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682693 () Bool)

(declare-fun res!448630 () Bool)

(assert (=> b!682693 (=> (not res!448630) (not e!388960))))

(assert (=> b!682693 (= res!448630 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19323 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682694 () Bool)

(declare-fun Unit!23966 () Unit!23962)

(assert (=> b!682694 (= e!388963 Unit!23966)))

(assert (= (and start!60870 res!448633) b!682679))

(assert (= (and b!682679 res!448632) b!682680))

(assert (= (and b!682680 res!448627) b!682692))

(assert (= (and b!682692 res!448631) b!682684))

(assert (= (and b!682684 res!448626) b!682687))

(assert (= (and b!682684 (not res!448623)) b!682685))

(assert (= (and b!682685 res!448634) b!682689))

(assert (= (and b!682684 res!448622) b!682691))

(assert (= (and b!682691 res!448628) b!682677))

(assert (= (and b!682677 res!448624) b!682690))

(assert (= (and b!682690 res!448629) b!682682))

(assert (= (and b!682682 res!448625) b!682688))

(assert (= (and b!682688 res!448621) b!682693))

(assert (= (and b!682693 res!448630) b!682686))

(assert (= (and b!682686 c!77396) b!682681))

(assert (= (and b!682686 (not c!77396)) b!682678))

(assert (= (and b!682686 c!77395) b!682683))

(assert (= (and b!682686 (not c!77395)) b!682694))

(declare-fun m!647329 () Bool)

(assert (=> b!682689 m!647329))

(declare-fun m!647331 () Bool)

(assert (=> b!682681 m!647331))

(assert (=> b!682687 m!647329))

(declare-fun m!647333 () Bool)

(assert (=> b!682692 m!647333))

(declare-fun m!647335 () Bool)

(assert (=> b!682677 m!647335))

(declare-fun m!647337 () Bool)

(assert (=> b!682679 m!647337))

(declare-fun m!647339 () Bool)

(assert (=> b!682691 m!647339))

(declare-fun m!647341 () Bool)

(assert (=> start!60870 m!647341))

(declare-fun m!647343 () Bool)

(assert (=> b!682682 m!647343))

(declare-fun m!647345 () Bool)

(assert (=> b!682686 m!647345))

(declare-fun m!647347 () Bool)

(assert (=> b!682686 m!647347))

(declare-fun m!647349 () Bool)

(assert (=> b!682686 m!647349))

(declare-fun m!647351 () Bool)

(assert (=> b!682686 m!647351))

(declare-fun m!647353 () Bool)

(assert (=> b!682686 m!647353))

(declare-fun m!647355 () Bool)

(assert (=> b!682686 m!647355))

(declare-fun m!647357 () Bool)

(assert (=> b!682686 m!647357))

(declare-fun m!647359 () Bool)

(assert (=> b!682686 m!647359))

(assert (=> b!682686 m!647345))

(assert (=> b!682686 m!647351))

(declare-fun m!647361 () Bool)

(assert (=> b!682686 m!647361))

(declare-fun m!647363 () Bool)

(assert (=> b!682686 m!647363))

(declare-fun m!647365 () Bool)

(assert (=> b!682686 m!647365))

(assert (=> b!682683 m!647349))

(assert (=> b!682683 m!647351))

(declare-fun m!647367 () Bool)

(assert (=> b!682683 m!647367))

(declare-fun m!647369 () Bool)

(assert (=> b!682683 m!647369))

(assert (=> b!682683 m!647351))

(assert (=> b!682683 m!647367))

(assert (=> b!682683 m!647357))

(assert (=> b!682683 m!647365))

(declare-fun m!647371 () Bool)

(assert (=> b!682688 m!647371))

(declare-fun m!647373 () Bool)

(assert (=> b!682680 m!647373))

(push 1)

(assert (not b!682687))

(assert (not b!682686))

(assert (not b!682688))

(assert (not start!60870))

(assert (not b!682679))

(assert (not b!682677))

(assert (not b!682683))

(assert (not b!682682))

(assert (not b!682681))

(assert (not b!682692))

(assert (not b!682680))

(assert (not b!682689))

(assert (not b!682691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

