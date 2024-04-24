; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59898 () Bool)

(assert start!59898)

(declare-fun b!661608 () Bool)

(declare-fun res!429568 () Bool)

(declare-fun e!380063 () Bool)

(assert (=> b!661608 (=> (not res!429568) (not e!380063))))

(declare-fun e!380067 () Bool)

(assert (=> b!661608 (= res!429568 e!380067)))

(declare-fun res!429563 () Bool)

(assert (=> b!661608 (=> res!429563 e!380067)))

(declare-fun e!380066 () Bool)

(assert (=> b!661608 (= res!429563 e!380066)))

(declare-fun res!429565 () Bool)

(assert (=> b!661608 (=> (not res!429565) (not e!380066))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661608 (= res!429565 (bvsgt from!3004 i!1382))))

(declare-fun b!661609 () Bool)

(assert (=> b!661609 (= e!380063 (not true))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!38883 0))(
  ( (array!38884 (arr!18631 (Array (_ BitVec 32) (_ BitVec 64))) (size!18995 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38883)

(declare-fun arrayContainsKey!0 (array!38883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661609 (arrayContainsKey!0 (array!38884 (store (arr!18631 a!3626) i!1382 k0!2843) (size!18995 a!3626)) k0!2843 from!3004)))

(declare-fun b!661610 () Bool)

(declare-fun res!429567 () Bool)

(assert (=> b!661610 (=> (not res!429567) (not e!380063))))

(declare-datatypes ((List!12579 0))(
  ( (Nil!12576) (Cons!12575 (h!13623 (_ BitVec 64)) (t!18799 List!12579)) )
))
(declare-fun arrayNoDuplicates!0 (array!38883 (_ BitVec 32) List!12579) Bool)

(assert (=> b!661610 (= res!429567 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12576))))

(declare-fun b!661612 () Bool)

(declare-fun res!429573 () Bool)

(assert (=> b!661612 (=> (not res!429573) (not e!380063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661612 (= res!429573 (validKeyInArray!0 k0!2843))))

(declare-fun b!661613 () Bool)

(declare-fun res!429562 () Bool)

(assert (=> b!661613 (=> (not res!429562) (not e!380063))))

(declare-fun acc!681 () List!12579)

(declare-fun contains!3231 (List!12579 (_ BitVec 64)) Bool)

(assert (=> b!661613 (= res!429562 (not (contains!3231 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661614 () Bool)

(declare-fun res!429569 () Bool)

(assert (=> b!661614 (=> (not res!429569) (not e!380063))))

(assert (=> b!661614 (= res!429569 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18995 a!3626))))))

(declare-fun b!661615 () Bool)

(declare-fun res!429572 () Bool)

(assert (=> b!661615 (=> (not res!429572) (not e!380063))))

(assert (=> b!661615 (= res!429572 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661616 () Bool)

(declare-fun res!429574 () Bool)

(assert (=> b!661616 (=> (not res!429574) (not e!380063))))

(declare-fun noDuplicate!505 (List!12579) Bool)

(assert (=> b!661616 (= res!429574 (noDuplicate!505 acc!681))))

(declare-fun b!661617 () Bool)

(declare-fun res!429571 () Bool)

(assert (=> b!661617 (=> (not res!429571) (not e!380063))))

(assert (=> b!661617 (= res!429571 (not (contains!3231 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!429564 () Bool)

(assert (=> start!59898 (=> (not res!429564) (not e!380063))))

(assert (=> start!59898 (= res!429564 (and (bvslt (size!18995 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18995 a!3626))))))

(assert (=> start!59898 e!380063))

(assert (=> start!59898 true))

(declare-fun array_inv!14490 (array!38883) Bool)

(assert (=> start!59898 (array_inv!14490 a!3626)))

(declare-fun b!661611 () Bool)

(declare-fun e!380064 () Bool)

(assert (=> b!661611 (= e!380067 e!380064)))

(declare-fun res!429570 () Bool)

(assert (=> b!661611 (=> (not res!429570) (not e!380064))))

(assert (=> b!661611 (= res!429570 (bvsle from!3004 i!1382))))

(declare-fun b!661618 () Bool)

(declare-fun res!429566 () Bool)

(assert (=> b!661618 (=> (not res!429566) (not e!380063))))

(assert (=> b!661618 (= res!429566 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18995 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661619 () Bool)

(assert (=> b!661619 (= e!380064 (not (contains!3231 acc!681 k0!2843)))))

(declare-fun b!661620 () Bool)

(assert (=> b!661620 (= e!380066 (contains!3231 acc!681 k0!2843))))

(declare-fun b!661621 () Bool)

(declare-fun res!429561 () Bool)

(assert (=> b!661621 (=> (not res!429561) (not e!380063))))

(assert (=> b!661621 (= res!429561 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!59898 res!429564) b!661616))

(assert (= (and b!661616 res!429574) b!661617))

(assert (= (and b!661617 res!429571) b!661613))

(assert (= (and b!661613 res!429562) b!661608))

(assert (= (and b!661608 res!429565) b!661620))

(assert (= (and b!661608 (not res!429563)) b!661611))

(assert (= (and b!661611 res!429570) b!661619))

(assert (= (and b!661608 res!429568) b!661610))

(assert (= (and b!661610 res!429567) b!661615))

(assert (= (and b!661615 res!429572) b!661614))

(assert (= (and b!661614 res!429569) b!661612))

(assert (= (and b!661612 res!429573) b!661621))

(assert (= (and b!661621 res!429561) b!661618))

(assert (= (and b!661618 res!429566) b!661609))

(declare-fun m!634297 () Bool)

(assert (=> b!661609 m!634297))

(declare-fun m!634299 () Bool)

(assert (=> b!661609 m!634299))

(declare-fun m!634301 () Bool)

(assert (=> b!661610 m!634301))

(declare-fun m!634303 () Bool)

(assert (=> b!661619 m!634303))

(declare-fun m!634305 () Bool)

(assert (=> b!661616 m!634305))

(declare-fun m!634307 () Bool)

(assert (=> b!661613 m!634307))

(declare-fun m!634309 () Bool)

(assert (=> start!59898 m!634309))

(declare-fun m!634311 () Bool)

(assert (=> b!661617 m!634311))

(declare-fun m!634313 () Bool)

(assert (=> b!661612 m!634313))

(declare-fun m!634315 () Bool)

(assert (=> b!661621 m!634315))

(assert (=> b!661620 m!634303))

(declare-fun m!634317 () Bool)

(assert (=> b!661615 m!634317))

(check-sat (not b!661613) (not b!661615) (not b!661612) (not start!59898) (not b!661616) (not b!661617) (not b!661621) (not b!661619) (not b!661609) (not b!661610) (not b!661620))
(check-sat)
