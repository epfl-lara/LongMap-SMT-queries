; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59846 () Bool)

(assert start!59846)

(declare-fun b!661510 () Bool)

(declare-fun e!379969 () Bool)

(assert (=> b!661510 (= e!379969 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38893 0))(
  ( (array!38894 (arr!18639 (Array (_ BitVec 32) (_ BitVec 64))) (size!19003 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38893)

(declare-fun arrayContainsKey!0 (array!38893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661510 (arrayContainsKey!0 (array!38894 (store (arr!18639 a!3626) i!1382 k!2843) (size!19003 a!3626)) k!2843 from!3004)))

(declare-fun b!661511 () Bool)

(declare-fun res!429585 () Bool)

(assert (=> b!661511 (=> (not res!429585) (not e!379969))))

(declare-fun e!379968 () Bool)

(assert (=> b!661511 (= res!429585 e!379968)))

(declare-fun res!429584 () Bool)

(assert (=> b!661511 (=> res!429584 e!379968)))

(declare-fun e!379967 () Bool)

(assert (=> b!661511 (= res!429584 e!379967)))

(declare-fun res!429580 () Bool)

(assert (=> b!661511 (=> (not res!429580) (not e!379967))))

(assert (=> b!661511 (= res!429580 (bvsgt from!3004 i!1382))))

(declare-fun b!661512 () Bool)

(declare-fun e!379970 () Bool)

(declare-datatypes ((List!12680 0))(
  ( (Nil!12677) (Cons!12676 (h!13721 (_ BitVec 64)) (t!18908 List!12680)) )
))
(declare-fun acc!681 () List!12680)

(declare-fun contains!3257 (List!12680 (_ BitVec 64)) Bool)

(assert (=> b!661512 (= e!379970 (not (contains!3257 acc!681 k!2843)))))

(declare-fun b!661513 () Bool)

(declare-fun res!429576 () Bool)

(assert (=> b!661513 (=> (not res!429576) (not e!379969))))

(assert (=> b!661513 (= res!429576 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19003 a!3626))))))

(declare-fun b!661514 () Bool)

(declare-fun res!429579 () Bool)

(assert (=> b!661514 (=> (not res!429579) (not e!379969))))

(assert (=> b!661514 (= res!429579 (not (contains!3257 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429581 () Bool)

(assert (=> start!59846 (=> (not res!429581) (not e!379969))))

(assert (=> start!59846 (= res!429581 (and (bvslt (size!19003 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19003 a!3626))))))

(assert (=> start!59846 e!379969))

(assert (=> start!59846 true))

(declare-fun array_inv!14435 (array!38893) Bool)

(assert (=> start!59846 (array_inv!14435 a!3626)))

(declare-fun b!661515 () Bool)

(assert (=> b!661515 (= e!379968 e!379970)))

(declare-fun res!429582 () Bool)

(assert (=> b!661515 (=> (not res!429582) (not e!379970))))

(assert (=> b!661515 (= res!429582 (bvsle from!3004 i!1382))))

(declare-fun b!661516 () Bool)

(declare-fun res!429587 () Bool)

(assert (=> b!661516 (=> (not res!429587) (not e!379969))))

(declare-fun arrayNoDuplicates!0 (array!38893 (_ BitVec 32) List!12680) Bool)

(assert (=> b!661516 (= res!429587 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661517 () Bool)

(declare-fun res!429583 () Bool)

(assert (=> b!661517 (=> (not res!429583) (not e!379969))))

(assert (=> b!661517 (= res!429583 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19003 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661518 () Bool)

(declare-fun res!429575 () Bool)

(assert (=> b!661518 (=> (not res!429575) (not e!379969))))

(assert (=> b!661518 (= res!429575 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661519 () Bool)

(declare-fun res!429574 () Bool)

(assert (=> b!661519 (=> (not res!429574) (not e!379969))))

(assert (=> b!661519 (= res!429574 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12677))))

(declare-fun b!661520 () Bool)

(declare-fun res!429586 () Bool)

(assert (=> b!661520 (=> (not res!429586) (not e!379969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661520 (= res!429586 (validKeyInArray!0 k!2843))))

(declare-fun b!661521 () Bool)

(declare-fun res!429577 () Bool)

(assert (=> b!661521 (=> (not res!429577) (not e!379969))))

(declare-fun noDuplicate!504 (List!12680) Bool)

(assert (=> b!661521 (= res!429577 (noDuplicate!504 acc!681))))

(declare-fun b!661522 () Bool)

(assert (=> b!661522 (= e!379967 (contains!3257 acc!681 k!2843))))

(declare-fun b!661523 () Bool)

(declare-fun res!429578 () Bool)

(assert (=> b!661523 (=> (not res!429578) (not e!379969))))

(assert (=> b!661523 (= res!429578 (not (contains!3257 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59846 res!429581) b!661521))

(assert (= (and b!661521 res!429577) b!661514))

(assert (= (and b!661514 res!429579) b!661523))

(assert (= (and b!661523 res!429578) b!661511))

(assert (= (and b!661511 res!429580) b!661522))

(assert (= (and b!661511 (not res!429584)) b!661515))

(assert (= (and b!661515 res!429582) b!661512))

(assert (= (and b!661511 res!429585) b!661519))

(assert (= (and b!661519 res!429574) b!661516))

(assert (= (and b!661516 res!429587) b!661513))

(assert (= (and b!661513 res!429576) b!661520))

(assert (= (and b!661520 res!429586) b!661518))

(assert (= (and b!661518 res!429575) b!661517))

(assert (= (and b!661517 res!429583) b!661510))

(declare-fun m!633665 () Bool)

(assert (=> b!661519 m!633665))

(declare-fun m!633667 () Bool)

(assert (=> start!59846 m!633667))

(declare-fun m!633669 () Bool)

(assert (=> b!661514 m!633669))

(declare-fun m!633671 () Bool)

(assert (=> b!661523 m!633671))

(declare-fun m!633673 () Bool)

(assert (=> b!661520 m!633673))

(declare-fun m!633675 () Bool)

(assert (=> b!661516 m!633675))

(declare-fun m!633677 () Bool)

(assert (=> b!661512 m!633677))

(declare-fun m!633679 () Bool)

(assert (=> b!661510 m!633679))

(declare-fun m!633681 () Bool)

(assert (=> b!661510 m!633681))

(declare-fun m!633683 () Bool)

(assert (=> b!661518 m!633683))

(declare-fun m!633685 () Bool)

(assert (=> b!661521 m!633685))

(assert (=> b!661522 m!633677))

(push 1)

(assert (not b!661516))

(assert (not b!661520))

(assert (not b!661512))

(assert (not b!661519))

(assert (not b!661510))

(assert (not b!661518))

(assert (not b!661522))

(assert (not b!661521))

(assert (not b!661523))

(assert (not b!661514))

(assert (not start!59846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

