; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62126 () Bool)

(assert start!62126)

(declare-fun res!459529 () Bool)

(declare-fun e!395608 () Bool)

(assert (=> start!62126 (=> (not res!459529) (not e!395608))))

(declare-datatypes ((array!39916 0))(
  ( (array!39917 (arr!19119 (Array (_ BitVec 32) (_ BitVec 64))) (size!19504 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39916)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62126 (= res!459529 (and (bvslt (size!19504 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19504 a!3626))))))

(assert (=> start!62126 e!395608))

(assert (=> start!62126 true))

(declare-fun array_inv!14915 (array!39916) Bool)

(assert (=> start!62126 (array_inv!14915 a!3626)))

(declare-fun b!695580 () Bool)

(declare-fun e!395609 () Bool)

(declare-datatypes ((List!13160 0))(
  ( (Nil!13157) (Cons!13156 (h!14201 (_ BitVec 64)) (t!19442 List!13160)) )
))
(declare-fun acc!681 () List!13160)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3737 (List!13160 (_ BitVec 64)) Bool)

(assert (=> b!695580 (= e!395609 (not (contains!3737 acc!681 k!2843)))))

(declare-fun b!695581 () Bool)

(declare-fun res!459536 () Bool)

(assert (=> b!695581 (=> (not res!459536) (not e!395608))))

(declare-fun arrayNoDuplicates!0 (array!39916 (_ BitVec 32) List!13160) Bool)

(assert (=> b!695581 (= res!459536 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13157))))

(declare-fun b!695582 () Bool)

(declare-fun res!459530 () Bool)

(assert (=> b!695582 (=> (not res!459530) (not e!395608))))

(assert (=> b!695582 (= res!459530 (not (contains!3737 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695583 () Bool)

(declare-fun res!459532 () Bool)

(assert (=> b!695583 (=> (not res!459532) (not e!395608))))

(declare-fun noDuplicate!984 (List!13160) Bool)

(assert (=> b!695583 (= res!459532 (noDuplicate!984 acc!681))))

(declare-fun b!695584 () Bool)

(declare-fun e!395607 () Bool)

(assert (=> b!695584 (= e!395607 (contains!3737 acc!681 k!2843))))

(declare-fun b!695585 () Bool)

(assert (=> b!695585 (= e!395608 false)))

(declare-fun lt!317062 () Bool)

(assert (=> b!695585 (= lt!317062 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695586 () Bool)

(declare-fun res!459533 () Bool)

(assert (=> b!695586 (=> (not res!459533) (not e!395608))))

(declare-fun e!395606 () Bool)

(assert (=> b!695586 (= res!459533 e!395606)))

(declare-fun res!459534 () Bool)

(assert (=> b!695586 (=> res!459534 e!395606)))

(assert (=> b!695586 (= res!459534 e!395607)))

(declare-fun res!459528 () Bool)

(assert (=> b!695586 (=> (not res!459528) (not e!395607))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695586 (= res!459528 (bvsgt from!3004 i!1382))))

(declare-fun b!695587 () Bool)

(declare-fun res!459531 () Bool)

(assert (=> b!695587 (=> (not res!459531) (not e!395608))))

(assert (=> b!695587 (= res!459531 (not (contains!3737 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695588 () Bool)

(assert (=> b!695588 (= e!395606 e!395609)))

(declare-fun res!459535 () Bool)

(assert (=> b!695588 (=> (not res!459535) (not e!395609))))

(assert (=> b!695588 (= res!459535 (bvsle from!3004 i!1382))))

(assert (= (and start!62126 res!459529) b!695583))

(assert (= (and b!695583 res!459532) b!695587))

(assert (= (and b!695587 res!459531) b!695582))

(assert (= (and b!695582 res!459530) b!695586))

(assert (= (and b!695586 res!459528) b!695584))

(assert (= (and b!695586 (not res!459534)) b!695588))

(assert (= (and b!695588 res!459535) b!695580))

(assert (= (and b!695586 res!459533) b!695581))

(assert (= (and b!695581 res!459536) b!695585))

(declare-fun m!657017 () Bool)

(assert (=> b!695583 m!657017))

(declare-fun m!657019 () Bool)

(assert (=> b!695584 m!657019))

(declare-fun m!657021 () Bool)

(assert (=> b!695585 m!657021))

(declare-fun m!657023 () Bool)

(assert (=> start!62126 m!657023))

(declare-fun m!657025 () Bool)

(assert (=> b!695581 m!657025))

(declare-fun m!657027 () Bool)

(assert (=> b!695587 m!657027))

(declare-fun m!657029 () Bool)

(assert (=> b!695582 m!657029))

(assert (=> b!695580 m!657019))

(push 1)

(assert (not b!695583))

(assert (not b!695582))

(assert (not b!695580))

(assert (not b!695585))

(assert (not b!695587))

(assert (not start!62126))

(assert (not b!695581))

(assert (not b!695584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

