; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62172 () Bool)

(assert start!62172)

(declare-fun b!695588 () Bool)

(declare-fun res!459427 () Bool)

(declare-fun e!395660 () Bool)

(assert (=> b!695588 (=> (not res!459427) (not e!395660))))

(declare-fun e!395657 () Bool)

(assert (=> b!695588 (= res!459427 e!395657)))

(declare-fun res!459426 () Bool)

(assert (=> b!695588 (=> res!459426 e!395657)))

(declare-fun e!395659 () Bool)

(assert (=> b!695588 (= res!459426 e!395659)))

(declare-fun res!459432 () Bool)

(assert (=> b!695588 (=> (not res!459432) (not e!395659))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695588 (= res!459432 (bvsgt from!3004 i!1382))))

(declare-fun b!695589 () Bool)

(declare-fun res!459433 () Bool)

(assert (=> b!695589 (=> (not res!459433) (not e!395660))))

(declare-datatypes ((List!13056 0))(
  ( (Nil!13053) (Cons!13052 (h!14100 (_ BitVec 64)) (t!19330 List!13056)) )
))
(declare-fun acc!681 () List!13056)

(declare-fun contains!3708 (List!13056 (_ BitVec 64)) Bool)

(assert (=> b!695589 (= res!459433 (not (contains!3708 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695590 () Bool)

(declare-fun e!395661 () Bool)

(assert (=> b!695590 (= e!395657 e!395661)))

(declare-fun res!459425 () Bool)

(assert (=> b!695590 (=> (not res!459425) (not e!395661))))

(assert (=> b!695590 (= res!459425 (bvsle from!3004 i!1382))))

(declare-fun b!695591 () Bool)

(declare-fun res!459431 () Bool)

(assert (=> b!695591 (=> (not res!459431) (not e!395660))))

(declare-datatypes ((array!39900 0))(
  ( (array!39901 (arr!19108 (Array (_ BitVec 32) (_ BitVec 64))) (size!19491 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39900)

(declare-fun arrayNoDuplicates!0 (array!39900 (_ BitVec 32) List!13056) Bool)

(assert (=> b!695591 (= res!459431 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13053))))

(declare-fun res!459429 () Bool)

(assert (=> start!62172 (=> (not res!459429) (not e!395660))))

(assert (=> start!62172 (= res!459429 (and (bvslt (size!19491 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19491 a!3626))))))

(assert (=> start!62172 e!395660))

(assert (=> start!62172 true))

(declare-fun array_inv!14967 (array!39900) Bool)

(assert (=> start!62172 (array_inv!14967 a!3626)))

(declare-fun b!695592 () Bool)

(declare-fun res!459428 () Bool)

(assert (=> b!695592 (=> (not res!459428) (not e!395660))))

(declare-fun noDuplicate!982 (List!13056) Bool)

(assert (=> b!695592 (= res!459428 (noDuplicate!982 acc!681))))

(declare-fun b!695593 () Bool)

(assert (=> b!695593 (= e!395660 false)))

(declare-fun lt!317155 () Bool)

(assert (=> b!695593 (= lt!317155 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695594 () Bool)

(declare-fun res!459430 () Bool)

(assert (=> b!695594 (=> (not res!459430) (not e!395660))))

(assert (=> b!695594 (= res!459430 (not (contains!3708 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695595 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!695595 (= e!395661 (not (contains!3708 acc!681 k0!2843)))))

(declare-fun b!695596 () Bool)

(assert (=> b!695596 (= e!395659 (contains!3708 acc!681 k0!2843))))

(assert (= (and start!62172 res!459429) b!695592))

(assert (= (and b!695592 res!459428) b!695589))

(assert (= (and b!695589 res!459433) b!695594))

(assert (= (and b!695594 res!459430) b!695588))

(assert (= (and b!695588 res!459432) b!695596))

(assert (= (and b!695588 (not res!459426)) b!695590))

(assert (= (and b!695590 res!459425) b!695595))

(assert (= (and b!695588 res!459427) b!695591))

(assert (= (and b!695591 res!459431) b!695593))

(declare-fun m!657607 () Bool)

(assert (=> b!695589 m!657607))

(declare-fun m!657609 () Bool)

(assert (=> b!695592 m!657609))

(declare-fun m!657611 () Bool)

(assert (=> b!695594 m!657611))

(declare-fun m!657613 () Bool)

(assert (=> b!695595 m!657613))

(declare-fun m!657615 () Bool)

(assert (=> b!695591 m!657615))

(declare-fun m!657617 () Bool)

(assert (=> start!62172 m!657617))

(assert (=> b!695596 m!657613))

(declare-fun m!657619 () Bool)

(assert (=> b!695593 m!657619))

(check-sat (not b!695592) (not b!695589) (not b!695591) (not b!695593) (not start!62172) (not b!695596) (not b!695594) (not b!695595))
(check-sat)
