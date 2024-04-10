; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60352 () Bool)

(assert start!60352)

(declare-fun b!678114 () Bool)

(declare-fun res!444548 () Bool)

(declare-fun e!386474 () Bool)

(assert (=> b!678114 (=> (not res!444548) (not e!386474))))

(declare-datatypes ((List!12933 0))(
  ( (Nil!12930) (Cons!12929 (h!13974 (_ BitVec 64)) (t!19161 List!12933)) )
))
(declare-fun acc!681 () List!12933)

(declare-fun contains!3510 (List!12933 (_ BitVec 64)) Bool)

(assert (=> b!678114 (= res!444548 (not (contains!3510 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444543 () Bool)

(assert (=> start!60352 (=> (not res!444543) (not e!386474))))

(declare-datatypes ((array!39399 0))(
  ( (array!39400 (arr!18892 (Array (_ BitVec 32) (_ BitVec 64))) (size!19256 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39399)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60352 (= res!444543 (and (bvslt (size!19256 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19256 a!3626))))))

(assert (=> start!60352 e!386474))

(assert (=> start!60352 true))

(declare-fun array_inv!14688 (array!39399) Bool)

(assert (=> start!60352 (array_inv!14688 a!3626)))

(declare-fun b!678115 () Bool)

(declare-fun res!444542 () Bool)

(assert (=> b!678115 (=> (not res!444542) (not e!386474))))

(declare-fun e!386473 () Bool)

(assert (=> b!678115 (= res!444542 e!386473)))

(declare-fun res!444547 () Bool)

(assert (=> b!678115 (=> res!444547 e!386473)))

(declare-fun e!386471 () Bool)

(assert (=> b!678115 (= res!444547 e!386471)))

(declare-fun res!444545 () Bool)

(assert (=> b!678115 (=> (not res!444545) (not e!386471))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678115 (= res!444545 (bvsgt from!3004 i!1382))))

(declare-fun b!678116 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!678116 (= e!386471 (contains!3510 acc!681 k0!2843))))

(declare-fun b!678117 () Bool)

(declare-fun res!444546 () Bool)

(assert (=> b!678117 (=> (not res!444546) (not e!386474))))

(assert (=> b!678117 (= res!444546 (not (contains!3510 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678118 () Bool)

(assert (=> b!678118 (= e!386474 false)))

(declare-fun lt!312865 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39399 (_ BitVec 32) List!12933) Bool)

(assert (=> b!678118 (= lt!312865 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678119 () Bool)

(declare-fun res!444540 () Bool)

(assert (=> b!678119 (=> (not res!444540) (not e!386474))))

(declare-fun noDuplicate!757 (List!12933) Bool)

(assert (=> b!678119 (= res!444540 (noDuplicate!757 acc!681))))

(declare-fun b!678120 () Bool)

(declare-fun e!386472 () Bool)

(assert (=> b!678120 (= e!386472 (not (contains!3510 acc!681 k0!2843)))))

(declare-fun b!678121 () Bool)

(assert (=> b!678121 (= e!386473 e!386472)))

(declare-fun res!444541 () Bool)

(assert (=> b!678121 (=> (not res!444541) (not e!386472))))

(assert (=> b!678121 (= res!444541 (bvsle from!3004 i!1382))))

(declare-fun b!678122 () Bool)

(declare-fun res!444544 () Bool)

(assert (=> b!678122 (=> (not res!444544) (not e!386474))))

(assert (=> b!678122 (= res!444544 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12930))))

(assert (= (and start!60352 res!444543) b!678119))

(assert (= (and b!678119 res!444540) b!678114))

(assert (= (and b!678114 res!444548) b!678117))

(assert (= (and b!678117 res!444546) b!678115))

(assert (= (and b!678115 res!444545) b!678116))

(assert (= (and b!678115 (not res!444547)) b!678121))

(assert (= (and b!678121 res!444541) b!678120))

(assert (= (and b!678115 res!444542) b!678122))

(assert (= (and b!678122 res!444544) b!678118))

(declare-fun m!644059 () Bool)

(assert (=> start!60352 m!644059))

(declare-fun m!644061 () Bool)

(assert (=> b!678114 m!644061))

(declare-fun m!644063 () Bool)

(assert (=> b!678116 m!644063))

(assert (=> b!678120 m!644063))

(declare-fun m!644065 () Bool)

(assert (=> b!678119 m!644065))

(declare-fun m!644067 () Bool)

(assert (=> b!678122 m!644067))

(declare-fun m!644069 () Bool)

(assert (=> b!678118 m!644069))

(declare-fun m!644071 () Bool)

(assert (=> b!678117 m!644071))

(check-sat (not b!678114) (not start!60352) (not b!678118) (not b!678116) (not b!678122) (not b!678119) (not b!678117) (not b!678120))
(check-sat)
