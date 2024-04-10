; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60318 () Bool)

(assert start!60318)

(declare-fun b!677391 () Bool)

(declare-fun res!443836 () Bool)

(declare-fun e!386165 () Bool)

(assert (=> b!677391 (=> (not res!443836) (not e!386165))))

(declare-datatypes ((List!12916 0))(
  ( (Nil!12913) (Cons!12912 (h!13957 (_ BitVec 64)) (t!19144 List!12916)) )
))
(declare-fun acc!681 () List!12916)

(declare-fun contains!3493 (List!12916 (_ BitVec 64)) Bool)

(assert (=> b!677391 (= res!443836 (not (contains!3493 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677392 () Bool)

(declare-fun e!386162 () Bool)

(declare-fun e!386166 () Bool)

(assert (=> b!677392 (= e!386162 e!386166)))

(declare-fun res!443837 () Bool)

(assert (=> b!677392 (=> (not res!443837) (not e!386166))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677392 (= res!443837 (bvsle from!3004 i!1382))))

(declare-fun b!677393 () Bool)

(declare-fun res!443830 () Bool)

(assert (=> b!677393 (=> (not res!443830) (not e!386165))))

(declare-datatypes ((array!39365 0))(
  ( (array!39366 (arr!18875 (Array (_ BitVec 32) (_ BitVec 64))) (size!19239 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39365)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677393 (= res!443830 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!443819 () Bool)

(assert (=> start!60318 (=> (not res!443819) (not e!386165))))

(assert (=> start!60318 (= res!443819 (and (bvslt (size!19239 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19239 a!3626))))))

(assert (=> start!60318 e!386165))

(assert (=> start!60318 true))

(declare-fun array_inv!14671 (array!39365) Bool)

(assert (=> start!60318 (array_inv!14671 a!3626)))

(declare-fun b!677394 () Bool)

(declare-fun res!443821 () Bool)

(assert (=> b!677394 (=> (not res!443821) (not e!386165))))

(assert (=> b!677394 (= res!443821 (not (contains!3493 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677395 () Bool)

(declare-fun res!443824 () Bool)

(assert (=> b!677395 (=> (not res!443824) (not e!386165))))

(declare-fun e!386160 () Bool)

(assert (=> b!677395 (= res!443824 e!386160)))

(declare-fun res!443829 () Bool)

(assert (=> b!677395 (=> res!443829 e!386160)))

(declare-fun e!386161 () Bool)

(assert (=> b!677395 (= res!443829 e!386161)))

(declare-fun res!443826 () Bool)

(assert (=> b!677395 (=> (not res!443826) (not e!386161))))

(assert (=> b!677395 (= res!443826 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677396 () Bool)

(declare-fun res!443820 () Bool)

(assert (=> b!677396 (=> (not res!443820) (not e!386165))))

(assert (=> b!677396 (= res!443820 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19239 a!3626))))))

(declare-fun b!677397 () Bool)

(declare-fun e!386163 () Bool)

(assert (=> b!677397 (= e!386160 e!386163)))

(declare-fun res!443818 () Bool)

(assert (=> b!677397 (=> (not res!443818) (not e!386163))))

(assert (=> b!677397 (= res!443818 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677398 () Bool)

(assert (=> b!677398 (= e!386165 (not true))))

(declare-fun arrayNoDuplicates!0 (array!39365 (_ BitVec 32) List!12916) Bool)

(assert (=> b!677398 (arrayNoDuplicates!0 (array!39366 (store (arr!18875 a!3626) i!1382 k!2843) (size!19239 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23770 0))(
  ( (Unit!23771) )
))
(declare-fun lt!312823 () Unit!23770)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39365 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12916) Unit!23770)

(assert (=> b!677398 (= lt!312823 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677399 () Bool)

(assert (=> b!677399 (= e!386166 (not (contains!3493 acc!681 k!2843)))))

(declare-fun b!677400 () Bool)

(declare-fun res!443835 () Bool)

(assert (=> b!677400 (=> (not res!443835) (not e!386165))))

(assert (=> b!677400 (= res!443835 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12913))))

(declare-fun b!677401 () Bool)

(declare-fun res!443833 () Bool)

(assert (=> b!677401 (=> (not res!443833) (not e!386165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677401 (= res!443833 (validKeyInArray!0 k!2843))))

(declare-fun b!677402 () Bool)

(declare-fun res!443831 () Bool)

(assert (=> b!677402 (=> (not res!443831) (not e!386165))))

(assert (=> b!677402 (= res!443831 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677403 () Bool)

(declare-fun res!443834 () Bool)

(assert (=> b!677403 (=> (not res!443834) (not e!386165))))

(assert (=> b!677403 (= res!443834 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677404 () Bool)

(declare-fun res!443822 () Bool)

(assert (=> b!677404 (=> (not res!443822) (not e!386165))))

(assert (=> b!677404 (= res!443822 (not (validKeyInArray!0 (select (arr!18875 a!3626) from!3004))))))

(declare-fun b!677405 () Bool)

(declare-fun res!443817 () Bool)

(assert (=> b!677405 (=> (not res!443817) (not e!386165))))

(assert (=> b!677405 (= res!443817 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19239 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677406 () Bool)

(declare-fun res!443832 () Bool)

(assert (=> b!677406 (=> (not res!443832) (not e!386165))))

(assert (=> b!677406 (= res!443832 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677407 () Bool)

(assert (=> b!677407 (= e!386163 (not (contains!3493 acc!681 k!2843)))))

(declare-fun b!677408 () Bool)

(assert (=> b!677408 (= e!386161 (contains!3493 acc!681 k!2843))))

(declare-fun b!677409 () Bool)

(declare-fun e!386159 () Bool)

(assert (=> b!677409 (= e!386159 (contains!3493 acc!681 k!2843))))

(declare-fun b!677410 () Bool)

(declare-fun res!443827 () Bool)

(assert (=> b!677410 (=> (not res!443827) (not e!386165))))

(declare-fun noDuplicate!740 (List!12916) Bool)

(assert (=> b!677410 (= res!443827 (noDuplicate!740 acc!681))))

(declare-fun b!677411 () Bool)

(declare-fun res!443825 () Bool)

(assert (=> b!677411 (=> (not res!443825) (not e!386165))))

(assert (=> b!677411 (= res!443825 e!386162)))

(declare-fun res!443828 () Bool)

(assert (=> b!677411 (=> res!443828 e!386162)))

(assert (=> b!677411 (= res!443828 e!386159)))

(declare-fun res!443823 () Bool)

(assert (=> b!677411 (=> (not res!443823) (not e!386159))))

(assert (=> b!677411 (= res!443823 (bvsgt from!3004 i!1382))))

(assert (= (and start!60318 res!443819) b!677410))

(assert (= (and b!677410 res!443827) b!677394))

(assert (= (and b!677394 res!443821) b!677391))

(assert (= (and b!677391 res!443836) b!677411))

(assert (= (and b!677411 res!443823) b!677409))

(assert (= (and b!677411 (not res!443828)) b!677392))

(assert (= (and b!677392 res!443837) b!677399))

(assert (= (and b!677411 res!443825) b!677400))

(assert (= (and b!677400 res!443835) b!677402))

(assert (= (and b!677402 res!443831) b!677396))

(assert (= (and b!677396 res!443820) b!677401))

(assert (= (and b!677401 res!443833) b!677393))

(assert (= (and b!677393 res!443830) b!677405))

(assert (= (and b!677405 res!443817) b!677404))

(assert (= (and b!677404 res!443822) b!677406))

(assert (= (and b!677406 res!443832) b!677395))

(assert (= (and b!677395 res!443826) b!677408))

(assert (= (and b!677395 (not res!443829)) b!677397))

(assert (= (and b!677397 res!443818) b!677407))

(assert (= (and b!677395 res!443824) b!677403))

(assert (= (and b!677403 res!443834) b!677398))

(declare-fun m!643697 () Bool)

(assert (=> start!60318 m!643697))

(declare-fun m!643699 () Bool)

(assert (=> b!677403 m!643699))

(declare-fun m!643701 () Bool)

(assert (=> b!677409 m!643701))

(assert (=> b!677408 m!643701))

(declare-fun m!643703 () Bool)

(assert (=> b!677391 m!643703))

(declare-fun m!643705 () Bool)

(assert (=> b!677400 m!643705))

(declare-fun m!643707 () Bool)

(assert (=> b!677404 m!643707))

(assert (=> b!677404 m!643707))

(declare-fun m!643709 () Bool)

(assert (=> b!677404 m!643709))

(declare-fun m!643711 () Bool)

(assert (=> b!677393 m!643711))

(declare-fun m!643713 () Bool)

(assert (=> b!677402 m!643713))

(assert (=> b!677407 m!643701))

(declare-fun m!643715 () Bool)

(assert (=> b!677398 m!643715))

(declare-fun m!643717 () Bool)

(assert (=> b!677398 m!643717))

(declare-fun m!643719 () Bool)

(assert (=> b!677398 m!643719))

(assert (=> b!677399 m!643701))

(declare-fun m!643721 () Bool)

(assert (=> b!677394 m!643721))

(declare-fun m!643723 () Bool)

(assert (=> b!677410 m!643723))

(declare-fun m!643725 () Bool)

(assert (=> b!677401 m!643725))

(push 1)

(assert (not b!677408))

(assert (not b!677401))

(assert (not b!677403))

(assert (not b!677398))

(assert (not b!677399))

(assert (not b!677391))

(assert (not b!677393))

(assert (not b!677404))

(assert (not b!677400))

(assert (not b!677410))

(assert (not b!677407))

(assert (not b!677409))

(assert (not start!60318))

(assert (not b!677402))

(assert (not b!677394))

(check-sat)

