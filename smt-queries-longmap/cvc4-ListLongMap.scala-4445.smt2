; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61776 () Bool)

(assert start!61776)

(declare-fun b!691426 () Bool)

(declare-fun e!393510 () Bool)

(declare-datatypes ((List!13108 0))(
  ( (Nil!13105) (Cons!13104 (h!14149 (_ BitVec 64)) (t!19375 List!13108)) )
))
(declare-fun acc!681 () List!13108)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3685 (List!13108 (_ BitVec 64)) Bool)

(assert (=> b!691426 (= e!393510 (not (contains!3685 acc!681 k!2843)))))

(declare-fun b!691427 () Bool)

(declare-fun res!455795 () Bool)

(declare-fun e!393509 () Bool)

(assert (=> b!691427 (=> (not res!455795) (not e!393509))))

(declare-datatypes ((array!39797 0))(
  ( (array!39798 (arr!19067 (Array (_ BitVec 32) (_ BitVec 64))) (size!19452 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39797)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691427 (= res!455795 (validKeyInArray!0 (select (arr!19067 a!3626) from!3004)))))

(declare-fun b!691428 () Bool)

(declare-fun res!455794 () Bool)

(assert (=> b!691428 (=> (not res!455794) (not e!393509))))

(declare-fun arrayNoDuplicates!0 (array!39797 (_ BitVec 32) List!13108) Bool)

(assert (=> b!691428 (= res!455794 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13105))))

(declare-fun b!691429 () Bool)

(declare-fun res!455790 () Bool)

(assert (=> b!691429 (=> (not res!455790) (not e!393509))))

(assert (=> b!691429 (= res!455790 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691430 () Bool)

(declare-fun res!455801 () Bool)

(assert (=> b!691430 (=> (not res!455801) (not e!393509))))

(assert (=> b!691430 (= res!455801 (validKeyInArray!0 k!2843))))

(declare-fun res!455793 () Bool)

(assert (=> start!61776 (=> (not res!455793) (not e!393509))))

(assert (=> start!61776 (= res!455793 (and (bvslt (size!19452 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19452 a!3626))))))

(assert (=> start!61776 e!393509))

(assert (=> start!61776 true))

(declare-fun array_inv!14863 (array!39797) Bool)

(assert (=> start!61776 (array_inv!14863 a!3626)))

(declare-fun b!691431 () Bool)

(declare-datatypes ((Unit!24386 0))(
  ( (Unit!24387) )
))
(declare-fun e!393505 () Unit!24386)

(declare-fun Unit!24388 () Unit!24386)

(assert (=> b!691431 (= e!393505 Unit!24388)))

(declare-fun arrayContainsKey!0 (array!39797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691431 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316464 () Unit!24386)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39797 (_ BitVec 64) (_ BitVec 32)) Unit!24386)

(assert (=> b!691431 (= lt!316464 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691431 false))

(declare-fun b!691432 () Bool)

(declare-fun res!455800 () Bool)

(assert (=> b!691432 (=> (not res!455800) (not e!393509))))

(assert (=> b!691432 (= res!455800 (not (contains!3685 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691433 () Bool)

(declare-fun e!393506 () Bool)

(assert (=> b!691433 (= e!393506 (contains!3685 acc!681 k!2843))))

(declare-fun b!691434 () Bool)

(declare-fun res!455792 () Bool)

(assert (=> b!691434 (=> (not res!455792) (not e!393509))))

(assert (=> b!691434 (= res!455792 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691435 () Bool)

(declare-fun res!455804 () Bool)

(assert (=> b!691435 (=> (not res!455804) (not e!393509))))

(assert (=> b!691435 (= res!455804 (not (contains!3685 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691436 () Bool)

(assert (=> b!691436 (= e!393509 false)))

(declare-fun lt!316465 () Unit!24386)

(assert (=> b!691436 (= lt!316465 e!393505)))

(declare-fun c!78185 () Bool)

(assert (=> b!691436 (= c!78185 (= (select (arr!19067 a!3626) from!3004) k!2843))))

(declare-fun b!691437 () Bool)

(declare-fun Unit!24389 () Unit!24386)

(assert (=> b!691437 (= e!393505 Unit!24389)))

(declare-fun b!691438 () Bool)

(declare-fun res!455802 () Bool)

(assert (=> b!691438 (=> (not res!455802) (not e!393509))))

(declare-fun e!393507 () Bool)

(assert (=> b!691438 (= res!455802 e!393507)))

(declare-fun res!455803 () Bool)

(assert (=> b!691438 (=> res!455803 e!393507)))

(assert (=> b!691438 (= res!455803 e!393506)))

(declare-fun res!455797 () Bool)

(assert (=> b!691438 (=> (not res!455797) (not e!393506))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691438 (= res!455797 (bvsgt from!3004 i!1382))))

(declare-fun b!691439 () Bool)

(assert (=> b!691439 (= e!393507 e!393510)))

(declare-fun res!455798 () Bool)

(assert (=> b!691439 (=> (not res!455798) (not e!393510))))

(assert (=> b!691439 (= res!455798 (bvsle from!3004 i!1382))))

(declare-fun b!691440 () Bool)

(declare-fun res!455799 () Bool)

(assert (=> b!691440 (=> (not res!455799) (not e!393509))))

(declare-fun noDuplicate!932 (List!13108) Bool)

(assert (=> b!691440 (= res!455799 (noDuplicate!932 acc!681))))

(declare-fun b!691441 () Bool)

(declare-fun res!455796 () Bool)

(assert (=> b!691441 (=> (not res!455796) (not e!393509))))

(assert (=> b!691441 (= res!455796 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19452 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691442 () Bool)

(declare-fun res!455791 () Bool)

(assert (=> b!691442 (=> (not res!455791) (not e!393509))))

(assert (=> b!691442 (= res!455791 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19452 a!3626))))))

(assert (= (and start!61776 res!455793) b!691440))

(assert (= (and b!691440 res!455799) b!691435))

(assert (= (and b!691435 res!455804) b!691432))

(assert (= (and b!691432 res!455800) b!691438))

(assert (= (and b!691438 res!455797) b!691433))

(assert (= (and b!691438 (not res!455803)) b!691439))

(assert (= (and b!691439 res!455798) b!691426))

(assert (= (and b!691438 res!455802) b!691428))

(assert (= (and b!691428 res!455794) b!691429))

(assert (= (and b!691429 res!455790) b!691442))

(assert (= (and b!691442 res!455791) b!691430))

(assert (= (and b!691430 res!455801) b!691434))

(assert (= (and b!691434 res!455792) b!691441))

(assert (= (and b!691441 res!455796) b!691427))

(assert (= (and b!691427 res!455795) b!691436))

(assert (= (and b!691436 c!78185) b!691431))

(assert (= (and b!691436 (not c!78185)) b!691437))

(declare-fun m!654459 () Bool)

(assert (=> b!691433 m!654459))

(declare-fun m!654461 () Bool)

(assert (=> b!691435 m!654461))

(declare-fun m!654463 () Bool)

(assert (=> b!691430 m!654463))

(declare-fun m!654465 () Bool)

(assert (=> b!691428 m!654465))

(declare-fun m!654467 () Bool)

(assert (=> b!691427 m!654467))

(assert (=> b!691427 m!654467))

(declare-fun m!654469 () Bool)

(assert (=> b!691427 m!654469))

(declare-fun m!654471 () Bool)

(assert (=> b!691429 m!654471))

(declare-fun m!654473 () Bool)

(assert (=> b!691440 m!654473))

(declare-fun m!654475 () Bool)

(assert (=> start!61776 m!654475))

(assert (=> b!691426 m!654459))

(assert (=> b!691436 m!654467))

(declare-fun m!654477 () Bool)

(assert (=> b!691434 m!654477))

(declare-fun m!654479 () Bool)

(assert (=> b!691432 m!654479))

(declare-fun m!654481 () Bool)

(assert (=> b!691431 m!654481))

(declare-fun m!654483 () Bool)

(assert (=> b!691431 m!654483))

(push 1)

(assert (not b!691435))

(assert (not b!691440))

(assert (not b!691429))

(assert (not b!691427))

(assert (not b!691432))

(assert (not b!691434))

(assert (not b!691428))

(assert (not b!691426))

(assert (not b!691430))

(assert (not b!691433))

(assert (not b!691431))

(assert (not start!61776))

(check-sat)

