; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62268 () Bool)

(assert start!62268)

(declare-fun b!697531 () Bool)

(declare-fun e!396509 () Bool)

(declare-datatypes ((List!13236 0))(
  ( (Nil!13233) (Cons!13232 (h!14277 (_ BitVec 64)) (t!19509 List!13236)) )
))
(declare-fun acc!681 () List!13236)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3758 (List!13236 (_ BitVec 64)) Bool)

(assert (=> b!697531 (= e!396509 (contains!3758 acc!681 k!2843))))

(declare-fun b!697532 () Bool)

(declare-fun res!461572 () Bool)

(declare-fun e!396507 () Bool)

(assert (=> b!697532 (=> (not res!461572) (not e!396507))))

(declare-datatypes ((array!39997 0))(
  ( (array!39998 (arr!19156 (Array (_ BitVec 32) (_ BitVec 64))) (size!19538 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39997)

(declare-fun arrayNoDuplicates!0 (array!39997 (_ BitVec 32) List!13236) Bool)

(assert (=> b!697532 (= res!461572 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13233))))

(declare-fun b!697533 () Bool)

(declare-fun res!461569 () Bool)

(assert (=> b!697533 (=> (not res!461569) (not e!396507))))

(assert (=> b!697533 (= res!461569 (not (contains!3758 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697534 () Bool)

(declare-fun res!461571 () Bool)

(assert (=> b!697534 (=> (not res!461571) (not e!396507))))

(assert (=> b!697534 (= res!461571 (not (contains!3758 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697535 () Bool)

(declare-fun res!461570 () Bool)

(assert (=> b!697535 (=> (not res!461570) (not e!396507))))

(declare-fun noDuplicate!1027 (List!13236) Bool)

(assert (=> b!697535 (= res!461570 (noDuplicate!1027 acc!681))))

(declare-fun b!697536 () Bool)

(declare-fun e!396508 () Bool)

(assert (=> b!697536 (= e!396508 (not (contains!3758 acc!681 k!2843)))))

(declare-fun b!697537 () Bool)

(declare-fun res!461567 () Bool)

(assert (=> b!697537 (=> (not res!461567) (not e!396507))))

(declare-fun e!396505 () Bool)

(assert (=> b!697537 (= res!461567 e!396505)))

(declare-fun res!461575 () Bool)

(assert (=> b!697537 (=> res!461575 e!396505)))

(assert (=> b!697537 (= res!461575 e!396509)))

(declare-fun res!461574 () Bool)

(assert (=> b!697537 (=> (not res!461574) (not e!396509))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697537 (= res!461574 (bvsgt from!3004 i!1382))))

(declare-fun res!461573 () Bool)

(assert (=> start!62268 (=> (not res!461573) (not e!396507))))

(assert (=> start!62268 (= res!461573 (and (bvslt (size!19538 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19538 a!3626))))))

(assert (=> start!62268 e!396507))

(assert (=> start!62268 true))

(declare-fun array_inv!15039 (array!39997) Bool)

(assert (=> start!62268 (array_inv!15039 a!3626)))

(declare-fun b!697538 () Bool)

(assert (=> b!697538 (= e!396507 false)))

(declare-fun lt!316941 () Bool)

(assert (=> b!697538 (= lt!316941 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697539 () Bool)

(assert (=> b!697539 (= e!396505 e!396508)))

(declare-fun res!461568 () Bool)

(assert (=> b!697539 (=> (not res!461568) (not e!396508))))

(assert (=> b!697539 (= res!461568 (bvsle from!3004 i!1382))))

(assert (= (and start!62268 res!461573) b!697535))

(assert (= (and b!697535 res!461570) b!697534))

(assert (= (and b!697534 res!461571) b!697533))

(assert (= (and b!697533 res!461569) b!697537))

(assert (= (and b!697537 res!461574) b!697531))

(assert (= (and b!697537 (not res!461575)) b!697539))

(assert (= (and b!697539 res!461568) b!697536))

(assert (= (and b!697537 res!461567) b!697532))

(assert (= (and b!697532 res!461572) b!697538))

(declare-fun m!657367 () Bool)

(assert (=> b!697532 m!657367))

(declare-fun m!657369 () Bool)

(assert (=> b!697538 m!657369))

(declare-fun m!657371 () Bool)

(assert (=> b!697536 m!657371))

(declare-fun m!657373 () Bool)

(assert (=> b!697534 m!657373))

(assert (=> b!697531 m!657371))

(declare-fun m!657375 () Bool)

(assert (=> b!697533 m!657375))

(declare-fun m!657377 () Bool)

(assert (=> start!62268 m!657377))

(declare-fun m!657379 () Bool)

(assert (=> b!697535 m!657379))

(push 1)

(assert (not start!62268))

(assert (not b!697531))

(assert (not b!697534))

(assert (not b!697532))

(assert (not b!697536))

(assert (not b!697533))

(assert (not b!697538))

(assert (not b!697535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

