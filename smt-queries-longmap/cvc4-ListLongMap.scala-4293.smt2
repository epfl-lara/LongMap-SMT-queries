; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59790 () Bool)

(assert start!59790)

(declare-fun b!660516 () Bool)

(declare-fun res!428582 () Bool)

(declare-fun e!379547 () Bool)

(assert (=> b!660516 (=> (not res!428582) (not e!379547))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!660516 (= res!428582 (validKeyInArray!0 k!2843))))

(declare-fun b!660517 () Bool)

(declare-fun res!428585 () Bool)

(assert (=> b!660517 (=> (not res!428585) (not e!379547))))

(declare-datatypes ((array!38837 0))(
  ( (array!38838 (arr!18611 (Array (_ BitVec 32) (_ BitVec 64))) (size!18975 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38837)

(declare-datatypes ((List!12652 0))(
  ( (Nil!12649) (Cons!12648 (h!13693 (_ BitVec 64)) (t!18880 List!12652)) )
))
(declare-fun arrayNoDuplicates!0 (array!38837 (_ BitVec 32) List!12652) Bool)

(assert (=> b!660517 (= res!428585 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12649))))

(declare-fun b!660518 () Bool)

(declare-fun res!428591 () Bool)

(assert (=> b!660518 (=> (not res!428591) (not e!379547))))

(declare-fun acc!681 () List!12652)

(declare-fun contains!3229 (List!12652 (_ BitVec 64)) Bool)

(assert (=> b!660518 (= res!428591 (not (contains!3229 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660519 () Bool)

(declare-fun res!428588 () Bool)

(assert (=> b!660519 (=> (not res!428588) (not e!379547))))

(declare-fun noDuplicate!476 (List!12652) Bool)

(assert (=> b!660519 (= res!428588 (noDuplicate!476 acc!681))))

(declare-fun b!660520 () Bool)

(declare-fun res!428581 () Bool)

(assert (=> b!660520 (=> (not res!428581) (not e!379547))))

(declare-fun e!379549 () Bool)

(assert (=> b!660520 (= res!428581 e!379549)))

(declare-fun res!428586 () Bool)

(assert (=> b!660520 (=> res!428586 e!379549)))

(declare-fun e!379548 () Bool)

(assert (=> b!660520 (= res!428586 e!379548)))

(declare-fun res!428590 () Bool)

(assert (=> b!660520 (=> (not res!428590) (not e!379548))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660520 (= res!428590 (bvsgt from!3004 i!1382))))

(declare-fun b!660521 () Bool)

(declare-fun e!379550 () Bool)

(assert (=> b!660521 (= e!379549 e!379550)))

(declare-fun res!428589 () Bool)

(assert (=> b!660521 (=> (not res!428589) (not e!379550))))

(assert (=> b!660521 (= res!428589 (bvsle from!3004 i!1382))))

(declare-fun res!428583 () Bool)

(assert (=> start!59790 (=> (not res!428583) (not e!379547))))

(assert (=> start!59790 (= res!428583 (and (bvslt (size!18975 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18975 a!3626))))))

(assert (=> start!59790 e!379547))

(assert (=> start!59790 true))

(declare-fun array_inv!14407 (array!38837) Bool)

(assert (=> start!59790 (array_inv!14407 a!3626)))

(declare-fun b!660522 () Bool)

(assert (=> b!660522 (= e!379550 (not (contains!3229 acc!681 k!2843)))))

(declare-fun b!660523 () Bool)

(assert (=> b!660523 (= e!379547 (bvsge #b00000000000000000000000000000000 (size!18975 a!3626)))))

(declare-fun b!660524 () Bool)

(declare-fun res!428587 () Bool)

(assert (=> b!660524 (=> (not res!428587) (not e!379547))))

(assert (=> b!660524 (= res!428587 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18975 a!3626))))))

(declare-fun b!660525 () Bool)

(declare-fun res!428580 () Bool)

(assert (=> b!660525 (=> (not res!428580) (not e!379547))))

(assert (=> b!660525 (= res!428580 (not (contains!3229 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660526 () Bool)

(assert (=> b!660526 (= e!379548 (contains!3229 acc!681 k!2843))))

(declare-fun b!660527 () Bool)

(declare-fun res!428584 () Bool)

(assert (=> b!660527 (=> (not res!428584) (not e!379547))))

(assert (=> b!660527 (= res!428584 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59790 res!428583) b!660519))

(assert (= (and b!660519 res!428588) b!660525))

(assert (= (and b!660525 res!428580) b!660518))

(assert (= (and b!660518 res!428591) b!660520))

(assert (= (and b!660520 res!428590) b!660526))

(assert (= (and b!660520 (not res!428586)) b!660521))

(assert (= (and b!660521 res!428589) b!660522))

(assert (= (and b!660520 res!428581) b!660517))

(assert (= (and b!660517 res!428585) b!660527))

(assert (= (and b!660527 res!428584) b!660524))

(assert (= (and b!660524 res!428587) b!660516))

(assert (= (and b!660516 res!428582) b!660523))

(declare-fun m!633151 () Bool)

(assert (=> b!660517 m!633151))

(declare-fun m!633153 () Bool)

(assert (=> b!660526 m!633153))

(declare-fun m!633155 () Bool)

(assert (=> b!660518 m!633155))

(assert (=> b!660522 m!633153))

(declare-fun m!633157 () Bool)

(assert (=> b!660516 m!633157))

(declare-fun m!633159 () Bool)

(assert (=> start!59790 m!633159))

(declare-fun m!633161 () Bool)

(assert (=> b!660519 m!633161))

(declare-fun m!633163 () Bool)

(assert (=> b!660525 m!633163))

(declare-fun m!633165 () Bool)

(assert (=> b!660527 m!633165))

(push 1)

(assert (not b!660518))

(assert (not b!660527))

(assert (not start!59790))

(assert (not b!660526))

(assert (not b!660522))

(assert (not b!660516))

(assert (not b!660519))

(assert (not b!660517))

(assert (not b!660525))

