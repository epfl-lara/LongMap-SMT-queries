; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60274 () Bool)

(assert start!60274)

(declare-fun b!676054 () Bool)

(declare-fun res!442485 () Bool)

(declare-fun e!385636 () Bool)

(assert (=> b!676054 (=> (not res!442485) (not e!385636))))

(declare-datatypes ((array!39321 0))(
  ( (array!39322 (arr!18853 (Array (_ BitVec 32) (_ BitVec 64))) (size!19217 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39321)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12894 0))(
  ( (Nil!12891) (Cons!12890 (h!13935 (_ BitVec 64)) (t!19122 List!12894)) )
))
(declare-fun acc!681 () List!12894)

(declare-fun arrayNoDuplicates!0 (array!39321 (_ BitVec 32) List!12894) Bool)

(assert (=> b!676054 (= res!442485 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676055 () Bool)

(declare-fun res!442482 () Bool)

(assert (=> b!676055 (=> (not res!442482) (not e!385636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676055 (= res!442482 (not (validKeyInArray!0 (select (arr!18853 a!3626) from!3004))))))

(declare-fun b!676056 () Bool)

(declare-fun res!442481 () Bool)

(assert (=> b!676056 (=> (not res!442481) (not e!385636))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676056 (= res!442481 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676057 () Bool)

(declare-fun e!385635 () Bool)

(declare-fun contains!3471 (List!12894 (_ BitVec 64)) Bool)

(assert (=> b!676057 (= e!385635 (contains!3471 acc!681 k0!2843))))

(declare-fun b!676058 () Bool)

(declare-fun e!385637 () Bool)

(declare-fun e!385638 () Bool)

(assert (=> b!676058 (= e!385637 e!385638)))

(declare-fun res!442486 () Bool)

(assert (=> b!676058 (=> (not res!442486) (not e!385638))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676058 (= res!442486 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676059 () Bool)

(declare-fun res!442490 () Bool)

(assert (=> b!676059 (=> (not res!442490) (not e!385636))))

(declare-fun e!385633 () Bool)

(assert (=> b!676059 (= res!442490 e!385633)))

(declare-fun res!442492 () Bool)

(assert (=> b!676059 (=> res!442492 e!385633)))

(declare-fun e!385632 () Bool)

(assert (=> b!676059 (= res!442492 e!385632)))

(declare-fun res!442484 () Bool)

(assert (=> b!676059 (=> (not res!442484) (not e!385632))))

(assert (=> b!676059 (= res!442484 (bvsgt from!3004 i!1382))))

(declare-fun b!676060 () Bool)

(declare-fun e!385631 () Bool)

(assert (=> b!676060 (= e!385633 e!385631)))

(declare-fun res!442498 () Bool)

(assert (=> b!676060 (=> (not res!442498) (not e!385631))))

(assert (=> b!676060 (= res!442498 (bvsle from!3004 i!1382))))

(declare-fun b!676061 () Bool)

(assert (=> b!676061 (= e!385638 (not (contains!3471 acc!681 k0!2843)))))

(declare-fun b!676062 () Bool)

(declare-fun res!442483 () Bool)

(assert (=> b!676062 (=> (not res!442483) (not e!385636))))

(declare-fun noDuplicate!718 (List!12894) Bool)

(assert (=> b!676062 (= res!442483 (noDuplicate!718 acc!681))))

(declare-fun b!676063 () Bool)

(assert (=> b!676063 (= e!385632 (contains!3471 acc!681 k0!2843))))

(declare-fun b!676064 () Bool)

(assert (=> b!676064 (= e!385631 (not (contains!3471 acc!681 k0!2843)))))

(declare-fun b!676065 () Bool)

(declare-fun res!442497 () Bool)

(assert (=> b!676065 (=> (not res!442497) (not e!385636))))

(assert (=> b!676065 (= res!442497 e!385637)))

(declare-fun res!442496 () Bool)

(assert (=> b!676065 (=> res!442496 e!385637)))

(assert (=> b!676065 (= res!442496 e!385635)))

(declare-fun res!442491 () Bool)

(assert (=> b!676065 (=> (not res!442491) (not e!385635))))

(assert (=> b!676065 (= res!442491 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676066 () Bool)

(declare-fun res!442499 () Bool)

(assert (=> b!676066 (=> (not res!442499) (not e!385636))))

(assert (=> b!676066 (= res!442499 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19217 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676067 () Bool)

(declare-fun res!442489 () Bool)

(assert (=> b!676067 (=> (not res!442489) (not e!385636))))

(assert (=> b!676067 (= res!442489 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12891))))

(declare-fun b!676069 () Bool)

(declare-fun res!442487 () Bool)

(assert (=> b!676069 (=> (not res!442487) (not e!385636))))

(assert (=> b!676069 (= res!442487 (not (contains!3471 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676070 () Bool)

(declare-fun res!442493 () Bool)

(assert (=> b!676070 (=> (not res!442493) (not e!385636))))

(assert (=> b!676070 (= res!442493 (validKeyInArray!0 k0!2843))))

(declare-fun b!676071 () Bool)

(declare-fun res!442495 () Bool)

(assert (=> b!676071 (=> (not res!442495) (not e!385636))))

(assert (=> b!676071 (= res!442495 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19217 a!3626))))))

(declare-fun b!676072 () Bool)

(assert (=> b!676072 (= e!385636 false)))

(declare-fun lt!312757 () Bool)

(assert (=> b!676072 (= lt!312757 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676073 () Bool)

(declare-fun res!442480 () Bool)

(assert (=> b!676073 (=> (not res!442480) (not e!385636))))

(assert (=> b!676073 (= res!442480 (not (contains!3471 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!442494 () Bool)

(assert (=> start!60274 (=> (not res!442494) (not e!385636))))

(assert (=> start!60274 (= res!442494 (and (bvslt (size!19217 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19217 a!3626))))))

(assert (=> start!60274 e!385636))

(assert (=> start!60274 true))

(declare-fun array_inv!14649 (array!39321) Bool)

(assert (=> start!60274 (array_inv!14649 a!3626)))

(declare-fun b!676068 () Bool)

(declare-fun res!442488 () Bool)

(assert (=> b!676068 (=> (not res!442488) (not e!385636))))

(assert (=> b!676068 (= res!442488 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (= (and start!60274 res!442494) b!676062))

(assert (= (and b!676062 res!442483) b!676069))

(assert (= (and b!676069 res!442487) b!676073))

(assert (= (and b!676073 res!442480) b!676059))

(assert (= (and b!676059 res!442484) b!676063))

(assert (= (and b!676059 (not res!442492)) b!676060))

(assert (= (and b!676060 res!442498) b!676064))

(assert (= (and b!676059 res!442490) b!676067))

(assert (= (and b!676067 res!442489) b!676054))

(assert (= (and b!676054 res!442485) b!676071))

(assert (= (and b!676071 res!442495) b!676070))

(assert (= (and b!676070 res!442493) b!676056))

(assert (= (and b!676056 res!442481) b!676066))

(assert (= (and b!676066 res!442499) b!676055))

(assert (= (and b!676055 res!442482) b!676068))

(assert (= (and b!676068 res!442488) b!676065))

(assert (= (and b!676065 res!442491) b!676057))

(assert (= (and b!676065 (not res!442496)) b!676058))

(assert (= (and b!676058 res!442486) b!676061))

(assert (= (and b!676065 res!442497) b!676072))

(declare-fun m!643139 () Bool)

(assert (=> b!676070 m!643139))

(declare-fun m!643141 () Bool)

(assert (=> start!60274 m!643141))

(declare-fun m!643143 () Bool)

(assert (=> b!676063 m!643143))

(assert (=> b!676061 m!643143))

(declare-fun m!643145 () Bool)

(assert (=> b!676062 m!643145))

(declare-fun m!643147 () Bool)

(assert (=> b!676055 m!643147))

(assert (=> b!676055 m!643147))

(declare-fun m!643149 () Bool)

(assert (=> b!676055 m!643149))

(declare-fun m!643151 () Bool)

(assert (=> b!676054 m!643151))

(declare-fun m!643153 () Bool)

(assert (=> b!676073 m!643153))

(declare-fun m!643155 () Bool)

(assert (=> b!676072 m!643155))

(declare-fun m!643157 () Bool)

(assert (=> b!676069 m!643157))

(declare-fun m!643159 () Bool)

(assert (=> b!676056 m!643159))

(declare-fun m!643161 () Bool)

(assert (=> b!676067 m!643161))

(assert (=> b!676064 m!643143))

(assert (=> b!676057 m!643143))

(check-sat (not b!676056) (not b!676055) (not b!676057) (not b!676073) (not b!676061) (not b!676072) (not b!676070) (not b!676054) (not b!676062) (not b!676063) (not b!676067) (not b!676064) (not b!676069) (not start!60274))
