; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62128 () Bool)

(assert start!62128)

(declare-fun res!459556 () Bool)

(declare-fun e!395624 () Bool)

(assert (=> start!62128 (=> (not res!459556) (not e!395624))))

(declare-datatypes ((array!39918 0))(
  ( (array!39919 (arr!19120 (Array (_ BitVec 32) (_ BitVec 64))) (size!19505 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39918)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62128 (= res!459556 (and (bvslt (size!19505 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19505 a!3626))))))

(assert (=> start!62128 e!395624))

(assert (=> start!62128 true))

(declare-fun array_inv!14916 (array!39918) Bool)

(assert (=> start!62128 (array_inv!14916 a!3626)))

(declare-fun b!695607 () Bool)

(declare-fun e!395622 () Bool)

(declare-datatypes ((List!13161 0))(
  ( (Nil!13158) (Cons!13157 (h!14202 (_ BitVec 64)) (t!19443 List!13161)) )
))
(declare-fun acc!681 () List!13161)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3738 (List!13161 (_ BitVec 64)) Bool)

(assert (=> b!695607 (= e!395622 (contains!3738 acc!681 k0!2843))))

(declare-fun b!695608 () Bool)

(declare-fun e!395625 () Bool)

(assert (=> b!695608 (= e!395625 (not (contains!3738 acc!681 k0!2843)))))

(declare-fun b!695609 () Bool)

(declare-fun res!459560 () Bool)

(assert (=> b!695609 (=> (not res!459560) (not e!395624))))

(assert (=> b!695609 (= res!459560 (not (contains!3738 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695610 () Bool)

(declare-fun e!395623 () Bool)

(assert (=> b!695610 (= e!395623 e!395625)))

(declare-fun res!459563 () Bool)

(assert (=> b!695610 (=> (not res!459563) (not e!395625))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695610 (= res!459563 (bvsle from!3004 i!1382))))

(declare-fun b!695611 () Bool)

(declare-fun res!459555 () Bool)

(assert (=> b!695611 (=> (not res!459555) (not e!395624))))

(assert (=> b!695611 (= res!459555 (not (contains!3738 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695612 () Bool)

(assert (=> b!695612 (= e!395624 false)))

(declare-fun lt!317065 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39918 (_ BitVec 32) List!13161) Bool)

(assert (=> b!695612 (= lt!317065 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695613 () Bool)

(declare-fun res!459557 () Bool)

(assert (=> b!695613 (=> (not res!459557) (not e!395624))))

(declare-fun noDuplicate!985 (List!13161) Bool)

(assert (=> b!695613 (= res!459557 (noDuplicate!985 acc!681))))

(declare-fun b!695614 () Bool)

(declare-fun res!459562 () Bool)

(assert (=> b!695614 (=> (not res!459562) (not e!395624))))

(assert (=> b!695614 (= res!459562 e!395623)))

(declare-fun res!459558 () Bool)

(assert (=> b!695614 (=> res!459558 e!395623)))

(assert (=> b!695614 (= res!459558 e!395622)))

(declare-fun res!459559 () Bool)

(assert (=> b!695614 (=> (not res!459559) (not e!395622))))

(assert (=> b!695614 (= res!459559 (bvsgt from!3004 i!1382))))

(declare-fun b!695615 () Bool)

(declare-fun res!459561 () Bool)

(assert (=> b!695615 (=> (not res!459561) (not e!395624))))

(assert (=> b!695615 (= res!459561 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13158))))

(assert (= (and start!62128 res!459556) b!695613))

(assert (= (and b!695613 res!459557) b!695609))

(assert (= (and b!695609 res!459560) b!695611))

(assert (= (and b!695611 res!459555) b!695614))

(assert (= (and b!695614 res!459559) b!695607))

(assert (= (and b!695614 (not res!459558)) b!695610))

(assert (= (and b!695610 res!459563) b!695608))

(assert (= (and b!695614 res!459562) b!695615))

(assert (= (and b!695615 res!459561) b!695612))

(declare-fun m!657031 () Bool)

(assert (=> b!695607 m!657031))

(declare-fun m!657033 () Bool)

(assert (=> b!695613 m!657033))

(assert (=> b!695608 m!657031))

(declare-fun m!657035 () Bool)

(assert (=> b!695609 m!657035))

(declare-fun m!657037 () Bool)

(assert (=> b!695612 m!657037))

(declare-fun m!657039 () Bool)

(assert (=> b!695615 m!657039))

(declare-fun m!657041 () Bool)

(assert (=> b!695611 m!657041))

(declare-fun m!657043 () Bool)

(assert (=> start!62128 m!657043))

(check-sat (not b!695615) (not start!62128) (not b!695611) (not b!695607) (not b!695613) (not b!695609) (not b!695612) (not b!695608))
(check-sat)
