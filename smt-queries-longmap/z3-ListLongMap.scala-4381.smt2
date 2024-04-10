; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60316 () Bool)

(assert start!60316)

(declare-fun b!677328 () Bool)

(declare-fun res!443772 () Bool)

(declare-fun e!386138 () Bool)

(assert (=> b!677328 (=> (not res!443772) (not e!386138))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677328 (= res!443772 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677330 () Bool)

(assert (=> b!677330 (= e!386138 (not true))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((List!12915 0))(
  ( (Nil!12912) (Cons!12911 (h!13956 (_ BitVec 64)) (t!19143 List!12915)) )
))
(declare-fun acc!681 () List!12915)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39363 0))(
  ( (array!39364 (arr!18874 (Array (_ BitVec 32) (_ BitVec 64))) (size!19238 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39363)

(declare-fun arrayNoDuplicates!0 (array!39363 (_ BitVec 32) List!12915) Bool)

(assert (=> b!677330 (arrayNoDuplicates!0 (array!39364 (store (arr!18874 a!3626) i!1382 k0!2843) (size!19238 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23768 0))(
  ( (Unit!23769) )
))
(declare-fun lt!312820 () Unit!23768)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39363 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12915) Unit!23768)

(assert (=> b!677330 (= lt!312820 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677331 () Bool)

(declare-fun res!443770 () Bool)

(assert (=> b!677331 (=> (not res!443770) (not e!386138))))

(declare-fun e!386140 () Bool)

(assert (=> b!677331 (= res!443770 e!386140)))

(declare-fun res!443764 () Bool)

(assert (=> b!677331 (=> res!443764 e!386140)))

(declare-fun e!386136 () Bool)

(assert (=> b!677331 (= res!443764 e!386136)))

(declare-fun res!443755 () Bool)

(assert (=> b!677331 (=> (not res!443755) (not e!386136))))

(assert (=> b!677331 (= res!443755 (bvsgt from!3004 i!1382))))

(declare-fun b!677332 () Bool)

(declare-fun e!386142 () Bool)

(declare-fun e!386139 () Bool)

(assert (=> b!677332 (= e!386142 e!386139)))

(declare-fun res!443774 () Bool)

(assert (=> b!677332 (=> (not res!443774) (not e!386139))))

(assert (=> b!677332 (= res!443774 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677333 () Bool)

(declare-fun res!443771 () Bool)

(assert (=> b!677333 (=> (not res!443771) (not e!386138))))

(assert (=> b!677333 (= res!443771 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677334 () Bool)

(declare-fun contains!3492 (List!12915 (_ BitVec 64)) Bool)

(assert (=> b!677334 (= e!386139 (not (contains!3492 acc!681 k0!2843)))))

(declare-fun b!677335 () Bool)

(declare-fun e!386141 () Bool)

(assert (=> b!677335 (= e!386141 (not (contains!3492 acc!681 k0!2843)))))

(declare-fun b!677336 () Bool)

(declare-fun res!443756 () Bool)

(assert (=> b!677336 (=> (not res!443756) (not e!386138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677336 (= res!443756 (validKeyInArray!0 k0!2843))))

(declare-fun b!677337 () Bool)

(declare-fun res!443766 () Bool)

(assert (=> b!677337 (=> (not res!443766) (not e!386138))))

(assert (=> b!677337 (= res!443766 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19238 a!3626))))))

(declare-fun b!677338 () Bool)

(declare-fun res!443758 () Bool)

(assert (=> b!677338 (=> (not res!443758) (not e!386138))))

(assert (=> b!677338 (= res!443758 (not (contains!3492 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677339 () Bool)

(declare-fun res!443757 () Bool)

(assert (=> b!677339 (=> (not res!443757) (not e!386138))))

(declare-fun arrayContainsKey!0 (array!39363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677339 (= res!443757 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677340 () Bool)

(declare-fun res!443769 () Bool)

(assert (=> b!677340 (=> (not res!443769) (not e!386138))))

(assert (=> b!677340 (= res!443769 e!386142)))

(declare-fun res!443760 () Bool)

(assert (=> b!677340 (=> res!443760 e!386142)))

(declare-fun e!386135 () Bool)

(assert (=> b!677340 (= res!443760 e!386135)))

(declare-fun res!443762 () Bool)

(assert (=> b!677340 (=> (not res!443762) (not e!386135))))

(assert (=> b!677340 (= res!443762 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677341 () Bool)

(assert (=> b!677341 (= e!386135 (contains!3492 acc!681 k0!2843))))

(declare-fun b!677342 () Bool)

(declare-fun res!443759 () Bool)

(assert (=> b!677342 (=> (not res!443759) (not e!386138))))

(declare-fun noDuplicate!739 (List!12915) Bool)

(assert (=> b!677342 (= res!443759 (noDuplicate!739 acc!681))))

(declare-fun b!677329 () Bool)

(assert (=> b!677329 (= e!386136 (contains!3492 acc!681 k0!2843))))

(declare-fun res!443765 () Bool)

(assert (=> start!60316 (=> (not res!443765) (not e!386138))))

(assert (=> start!60316 (= res!443765 (and (bvslt (size!19238 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19238 a!3626))))))

(assert (=> start!60316 e!386138))

(assert (=> start!60316 true))

(declare-fun array_inv!14670 (array!39363) Bool)

(assert (=> start!60316 (array_inv!14670 a!3626)))

(declare-fun b!677343 () Bool)

(declare-fun res!443773 () Bool)

(assert (=> b!677343 (=> (not res!443773) (not e!386138))))

(assert (=> b!677343 (= res!443773 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12912))))

(declare-fun b!677344 () Bool)

(declare-fun res!443768 () Bool)

(assert (=> b!677344 (=> (not res!443768) (not e!386138))))

(assert (=> b!677344 (= res!443768 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19238 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!677345 () Bool)

(assert (=> b!677345 (= e!386140 e!386141)))

(declare-fun res!443763 () Bool)

(assert (=> b!677345 (=> (not res!443763) (not e!386141))))

(assert (=> b!677345 (= res!443763 (bvsle from!3004 i!1382))))

(declare-fun b!677346 () Bool)

(declare-fun res!443754 () Bool)

(assert (=> b!677346 (=> (not res!443754) (not e!386138))))

(assert (=> b!677346 (= res!443754 (not (validKeyInArray!0 (select (arr!18874 a!3626) from!3004))))))

(declare-fun b!677347 () Bool)

(declare-fun res!443761 () Bool)

(assert (=> b!677347 (=> (not res!443761) (not e!386138))))

(assert (=> b!677347 (= res!443761 (not (contains!3492 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677348 () Bool)

(declare-fun res!443767 () Bool)

(assert (=> b!677348 (=> (not res!443767) (not e!386138))))

(assert (=> b!677348 (= res!443767 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(assert (= (and start!60316 res!443765) b!677342))

(assert (= (and b!677342 res!443759) b!677338))

(assert (= (and b!677338 res!443758) b!677347))

(assert (= (and b!677347 res!443761) b!677331))

(assert (= (and b!677331 res!443755) b!677329))

(assert (= (and b!677331 (not res!443764)) b!677345))

(assert (= (and b!677345 res!443763) b!677335))

(assert (= (and b!677331 res!443770) b!677343))

(assert (= (and b!677343 res!443773) b!677333))

(assert (= (and b!677333 res!443771) b!677337))

(assert (= (and b!677337 res!443766) b!677336))

(assert (= (and b!677336 res!443756) b!677339))

(assert (= (and b!677339 res!443757) b!677344))

(assert (= (and b!677344 res!443768) b!677346))

(assert (= (and b!677346 res!443754) b!677328))

(assert (= (and b!677328 res!443772) b!677340))

(assert (= (and b!677340 res!443762) b!677341))

(assert (= (and b!677340 (not res!443760)) b!677332))

(assert (= (and b!677332 res!443774) b!677334))

(assert (= (and b!677340 res!443769) b!677348))

(assert (= (and b!677348 res!443767) b!677330))

(declare-fun m!643667 () Bool)

(assert (=> b!677346 m!643667))

(assert (=> b!677346 m!643667))

(declare-fun m!643669 () Bool)

(assert (=> b!677346 m!643669))

(declare-fun m!643671 () Bool)

(assert (=> b!677339 m!643671))

(declare-fun m!643673 () Bool)

(assert (=> b!677329 m!643673))

(declare-fun m!643675 () Bool)

(assert (=> b!677338 m!643675))

(declare-fun m!643677 () Bool)

(assert (=> b!677347 m!643677))

(declare-fun m!643679 () Bool)

(assert (=> b!677342 m!643679))

(declare-fun m!643681 () Bool)

(assert (=> b!677330 m!643681))

(declare-fun m!643683 () Bool)

(assert (=> b!677330 m!643683))

(declare-fun m!643685 () Bool)

(assert (=> b!677330 m!643685))

(declare-fun m!643687 () Bool)

(assert (=> b!677343 m!643687))

(assert (=> b!677335 m!643673))

(declare-fun m!643689 () Bool)

(assert (=> b!677333 m!643689))

(declare-fun m!643691 () Bool)

(assert (=> b!677336 m!643691))

(assert (=> b!677334 m!643673))

(declare-fun m!643693 () Bool)

(assert (=> start!60316 m!643693))

(declare-fun m!643695 () Bool)

(assert (=> b!677348 m!643695))

(assert (=> b!677341 m!643673))

(check-sat (not b!677339) (not b!677335) (not b!677347) (not b!677336) (not b!677333) (not b!677346) (not b!677342) (not b!677343) (not b!677341) (not b!677329) (not b!677330) (not b!677338) (not b!677334) (not b!677348) (not start!60316))
(check-sat)
