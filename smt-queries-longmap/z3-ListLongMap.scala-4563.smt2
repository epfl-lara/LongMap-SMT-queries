; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63664 () Bool)

(assert start!63664)

(declare-fun b!716593 () Bool)

(declare-fun res!479520 () Bool)

(declare-fun e!402384 () Bool)

(assert (=> b!716593 (=> (not res!479520) (not e!402384))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716593 (= res!479520 (validKeyInArray!0 k0!2102))))

(declare-fun b!716594 () Bool)

(declare-fun res!479522 () Bool)

(assert (=> b!716594 (=> (not res!479522) (not e!402384))))

(declare-datatypes ((array!40570 0))(
  ( (array!40571 (arr!19418 (Array (_ BitVec 32) (_ BitVec 64))) (size!19839 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40570)

(declare-fun arrayContainsKey!0 (array!40570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716594 (= res!479522 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!479521 () Bool)

(assert (=> start!63664 (=> (not res!479521) (not e!402384))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63664 (= res!479521 (validMask!0 mask!3328))))

(assert (=> start!63664 e!402384))

(declare-fun array_inv!15301 (array!40570) Bool)

(assert (=> start!63664 (array_inv!15301 a!3186)))

(assert (=> start!63664 true))

(declare-fun b!716595 () Bool)

(assert (=> b!716595 (= e!402384 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!716596 () Bool)

(declare-fun res!479519 () Bool)

(assert (=> b!716596 (=> (not res!479519) (not e!402384))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716596 (= res!479519 (validKeyInArray!0 (select (arr!19418 a!3186) j!159)))))

(declare-fun b!716597 () Bool)

(declare-fun res!479523 () Bool)

(assert (=> b!716597 (=> (not res!479523) (not e!402384))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716597 (= res!479523 (and (= (size!19839 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19839 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19839 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!63664 res!479521) b!716597))

(assert (= (and b!716597 res!479523) b!716596))

(assert (= (and b!716596 res!479519) b!716593))

(assert (= (and b!716593 res!479520) b!716594))

(assert (= (and b!716594 res!479522) b!716595))

(declare-fun m!672123 () Bool)

(assert (=> b!716593 m!672123))

(declare-fun m!672125 () Bool)

(assert (=> b!716594 m!672125))

(declare-fun m!672127 () Bool)

(assert (=> start!63664 m!672127))

(declare-fun m!672129 () Bool)

(assert (=> start!63664 m!672129))

(declare-fun m!672131 () Bool)

(assert (=> b!716596 m!672131))

(assert (=> b!716596 m!672131))

(declare-fun m!672133 () Bool)

(assert (=> b!716596 m!672133))

(check-sat (not b!716594) (not b!716596) (not b!716593) (not start!63664))
(check-sat)
