; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60340 () Bool)

(assert start!60340)

(declare-fun b!676518 () Bool)

(declare-fun e!385875 () Bool)

(assert (=> b!676518 (= e!385875 false)))

(declare-datatypes ((array!39325 0))(
  ( (array!39326 (arr!18852 (Array (_ BitVec 32) (_ BitVec 64))) (size!19216 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39325)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12800 0))(
  ( (Nil!12797) (Cons!12796 (h!13844 (_ BitVec 64)) (t!19020 List!12800)) )
))
(declare-fun acc!681 () List!12800)

(declare-fun lt!312871 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39325 (_ BitVec 32) List!12800) Bool)

(assert (=> b!676518 (= lt!312871 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun res!442838 () Bool)

(assert (=> start!60340 (=> (not res!442838) (not e!385875))))

(assert (=> start!60340 (= res!442838 (and (bvslt (size!19216 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19216 a!3626))))))

(assert (=> start!60340 e!385875))

(assert (=> start!60340 true))

(declare-fun array_inv!14711 (array!39325) Bool)

(assert (=> start!60340 (array_inv!14711 a!3626)))

(declare-fun b!676519 () Bool)

(declare-fun res!442848 () Bool)

(assert (=> b!676519 (=> (not res!442848) (not e!385875))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676519 (= res!442848 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676520 () Bool)

(declare-fun res!442833 () Bool)

(assert (=> b!676520 (=> (not res!442833) (not e!385875))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676520 (= res!442833 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19216 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676521 () Bool)

(declare-fun res!442837 () Bool)

(assert (=> b!676521 (=> (not res!442837) (not e!385875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676521 (= res!442837 (not (validKeyInArray!0 (select (arr!18852 a!3626) from!3004))))))

(declare-fun b!676522 () Bool)

(declare-fun e!385869 () Bool)

(declare-fun contains!3452 (List!12800 (_ BitVec 64)) Bool)

(assert (=> b!676522 (= e!385869 (not (contains!3452 acc!681 k!2843)))))

(declare-fun b!676523 () Bool)

(declare-fun res!442850 () Bool)

(assert (=> b!676523 (=> (not res!442850) (not e!385875))))

(declare-fun e!385871 () Bool)

(assert (=> b!676523 (= res!442850 e!385871)))

(declare-fun res!442840 () Bool)

(assert (=> b!676523 (=> res!442840 e!385871)))

(declare-fun e!385874 () Bool)

(assert (=> b!676523 (= res!442840 e!385874)))

(declare-fun res!442847 () Bool)

(assert (=> b!676523 (=> (not res!442847) (not e!385874))))

(assert (=> b!676523 (= res!442847 (bvsgt from!3004 i!1382))))

(declare-fun b!676524 () Bool)

(declare-fun e!385873 () Bool)

(assert (=> b!676524 (= e!385873 (not (contains!3452 acc!681 k!2843)))))

(declare-fun b!676525 () Bool)

(declare-fun res!442839 () Bool)

(assert (=> b!676525 (=> (not res!442839) (not e!385875))))

(assert (=> b!676525 (= res!442839 (not (contains!3452 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676526 () Bool)

(declare-fun res!442834 () Bool)

(assert (=> b!676526 (=> (not res!442834) (not e!385875))))

(assert (=> b!676526 (= res!442834 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676527 () Bool)

(declare-fun res!442835 () Bool)

(assert (=> b!676527 (=> (not res!442835) (not e!385875))))

(assert (=> b!676527 (= res!442835 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19216 a!3626))))))

(declare-fun b!676528 () Bool)

(declare-fun res!442845 () Bool)

(assert (=> b!676528 (=> (not res!442845) (not e!385875))))

(assert (=> b!676528 (= res!442845 (validKeyInArray!0 k!2843))))

(declare-fun b!676529 () Bool)

(declare-fun e!385870 () Bool)

(assert (=> b!676529 (= e!385870 e!385873)))

(declare-fun res!442842 () Bool)

(assert (=> b!676529 (=> (not res!442842) (not e!385873))))

(assert (=> b!676529 (= res!442842 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676530 () Bool)

(declare-fun res!442852 () Bool)

(assert (=> b!676530 (=> (not res!442852) (not e!385875))))

(assert (=> b!676530 (= res!442852 e!385870)))

(declare-fun res!442849 () Bool)

(assert (=> b!676530 (=> res!442849 e!385870)))

(declare-fun e!385868 () Bool)

(assert (=> b!676530 (= res!442849 e!385868)))

(declare-fun res!442846 () Bool)

(assert (=> b!676530 (=> (not res!442846) (not e!385868))))

(assert (=> b!676530 (= res!442846 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676531 () Bool)

(assert (=> b!676531 (= e!385871 e!385869)))

(declare-fun res!442841 () Bool)

(assert (=> b!676531 (=> (not res!442841) (not e!385869))))

(assert (=> b!676531 (= res!442841 (bvsle from!3004 i!1382))))

(declare-fun b!676532 () Bool)

(declare-fun res!442843 () Bool)

(assert (=> b!676532 (=> (not res!442843) (not e!385875))))

(assert (=> b!676532 (= res!442843 (not (contains!3452 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676533 () Bool)

(assert (=> b!676533 (= e!385868 (contains!3452 acc!681 k!2843))))

(declare-fun b!676534 () Bool)

(assert (=> b!676534 (= e!385874 (contains!3452 acc!681 k!2843))))

(declare-fun b!676535 () Bool)

(declare-fun res!442844 () Bool)

(assert (=> b!676535 (=> (not res!442844) (not e!385875))))

(assert (=> b!676535 (= res!442844 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676536 () Bool)

(declare-fun res!442836 () Bool)

(assert (=> b!676536 (=> (not res!442836) (not e!385875))))

(declare-fun noDuplicate!726 (List!12800) Bool)

(assert (=> b!676536 (= res!442836 (noDuplicate!726 acc!681))))

(declare-fun b!676537 () Bool)

(declare-fun res!442851 () Bool)

(assert (=> b!676537 (=> (not res!442851) (not e!385875))))

(assert (=> b!676537 (= res!442851 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12797))))

(assert (= (and start!60340 res!442838) b!676536))

(assert (= (and b!676536 res!442836) b!676525))

(assert (= (and b!676525 res!442839) b!676532))

(assert (= (and b!676532 res!442843) b!676523))

(assert (= (and b!676523 res!442847) b!676534))

(assert (= (and b!676523 (not res!442840)) b!676531))

(assert (= (and b!676531 res!442841) b!676522))

(assert (= (and b!676523 res!442850) b!676537))

(assert (= (and b!676537 res!442851) b!676535))

(assert (= (and b!676535 res!442844) b!676527))

(assert (= (and b!676527 res!442835) b!676528))

(assert (= (and b!676528 res!442845) b!676519))

(assert (= (and b!676519 res!442848) b!676520))

(assert (= (and b!676520 res!442833) b!676521))

(assert (= (and b!676521 res!442837) b!676526))

(assert (= (and b!676526 res!442834) b!676530))

(assert (= (and b!676530 res!442846) b!676533))

(assert (= (and b!676530 (not res!442849)) b!676529))

(assert (= (and b!676529 res!442842) b!676524))

(assert (= (and b!676530 res!442852) b!676518))

(declare-fun m!643933 () Bool)

(assert (=> b!676521 m!643933))

(assert (=> b!676521 m!643933))

(declare-fun m!643935 () Bool)

(assert (=> b!676521 m!643935))

(declare-fun m!643937 () Bool)

(assert (=> b!676536 m!643937))

(declare-fun m!643939 () Bool)

(assert (=> b!676528 m!643939))

(declare-fun m!643941 () Bool)

(assert (=> b!676533 m!643941))

(declare-fun m!643943 () Bool)

(assert (=> b!676535 m!643943))

(declare-fun m!643945 () Bool)

(assert (=> b!676525 m!643945))

(declare-fun m!643947 () Bool)

(assert (=> b!676518 m!643947))

(assert (=> b!676524 m!643941))

(declare-fun m!643949 () Bool)

(assert (=> b!676537 m!643949))

(assert (=> b!676522 m!643941))

(declare-fun m!643951 () Bool)

(assert (=> b!676519 m!643951))

(declare-fun m!643953 () Bool)

(assert (=> b!676532 m!643953))

(assert (=> b!676534 m!643941))

(declare-fun m!643955 () Bool)

(assert (=> start!60340 m!643955))

(push 1)

(assert (not start!60340))

(assert (not b!676524))

(assert (not b!676522))

(assert (not b!676534))

(assert (not b!676533))

(assert (not b!676525))

(assert (not b!676518))

(assert (not b!676521))

(assert (not b!676536))

(assert (not b!676532))

(assert (not b!676528))

(assert (not b!676535))

(assert (not b!676537))

(assert (not b!676519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

