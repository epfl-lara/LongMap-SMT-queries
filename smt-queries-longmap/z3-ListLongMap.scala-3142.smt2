; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44262 () Bool)

(assert start!44262)

(declare-fun b!486601 () Bool)

(declare-fun e!286384 () Bool)

(assert (=> b!486601 (= e!286384 false)))

(declare-fun lt!219645 () Bool)

(declare-datatypes ((array!31523 0))(
  ( (array!31524 (arr!15155 (Array (_ BitVec 32) (_ BitVec 64))) (size!15520 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31523)

(declare-datatypes ((List!9352 0))(
  ( (Nil!9349) (Cons!9348 (h!10204 (_ BitVec 64)) (t!15571 List!9352)) )
))
(declare-fun arrayNoDuplicates!0 (array!31523 (_ BitVec 32) List!9352) Bool)

(assert (=> b!486601 (= lt!219645 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9349))))

(declare-fun b!486602 () Bool)

(declare-fun res!290132 () Bool)

(declare-fun e!286385 () Bool)

(assert (=> b!486602 (=> (not res!290132) (not e!286385))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486602 (= res!290132 (and (= (size!15520 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15520 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15520 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290131 () Bool)

(assert (=> start!44262 (=> (not res!290131) (not e!286385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44262 (= res!290131 (validMask!0 mask!3524))))

(assert (=> start!44262 e!286385))

(assert (=> start!44262 true))

(declare-fun array_inv!11038 (array!31523) Bool)

(assert (=> start!44262 (array_inv!11038 a!3235)))

(declare-fun b!486603 () Bool)

(assert (=> b!486603 (= e!286385 e!286384)))

(declare-fun res!290135 () Bool)

(assert (=> b!486603 (=> (not res!290135) (not e!286384))))

(declare-datatypes ((SeekEntryResult!3619 0))(
  ( (MissingZero!3619 (index!16655 (_ BitVec 32))) (Found!3619 (index!16656 (_ BitVec 32))) (Intermediate!3619 (undefined!4431 Bool) (index!16657 (_ BitVec 32)) (x!45794 (_ BitVec 32))) (Undefined!3619) (MissingVacant!3619 (index!16658 (_ BitVec 32))) )
))
(declare-fun lt!219646 () SeekEntryResult!3619)

(assert (=> b!486603 (= res!290135 (or (= lt!219646 (MissingZero!3619 i!1204)) (= lt!219646 (MissingVacant!3619 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31523 (_ BitVec 32)) SeekEntryResult!3619)

(assert (=> b!486603 (= lt!219646 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486604 () Bool)

(declare-fun res!290133 () Bool)

(assert (=> b!486604 (=> (not res!290133) (not e!286385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486604 (= res!290133 (validKeyInArray!0 k0!2280))))

(declare-fun b!486605 () Bool)

(declare-fun res!290134 () Bool)

(assert (=> b!486605 (=> (not res!290134) (not e!286385))))

(declare-fun arrayContainsKey!0 (array!31523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486605 (= res!290134 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486606 () Bool)

(declare-fun res!290129 () Bool)

(assert (=> b!486606 (=> (not res!290129) (not e!286384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31523 (_ BitVec 32)) Bool)

(assert (=> b!486606 (= res!290129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486607 () Bool)

(declare-fun res!290130 () Bool)

(assert (=> b!486607 (=> (not res!290130) (not e!286385))))

(assert (=> b!486607 (= res!290130 (validKeyInArray!0 (select (arr!15155 a!3235) j!176)))))

(assert (= (and start!44262 res!290131) b!486602))

(assert (= (and b!486602 res!290132) b!486607))

(assert (= (and b!486607 res!290130) b!486604))

(assert (= (and b!486604 res!290133) b!486605))

(assert (= (and b!486605 res!290134) b!486603))

(assert (= (and b!486603 res!290135) b!486606))

(assert (= (and b!486606 res!290129) b!486601))

(declare-fun m!465997 () Bool)

(assert (=> b!486604 m!465997))

(declare-fun m!465999 () Bool)

(assert (=> b!486607 m!465999))

(assert (=> b!486607 m!465999))

(declare-fun m!466001 () Bool)

(assert (=> b!486607 m!466001))

(declare-fun m!466003 () Bool)

(assert (=> start!44262 m!466003))

(declare-fun m!466005 () Bool)

(assert (=> start!44262 m!466005))

(declare-fun m!466007 () Bool)

(assert (=> b!486605 m!466007))

(declare-fun m!466009 () Bool)

(assert (=> b!486601 m!466009))

(declare-fun m!466011 () Bool)

(assert (=> b!486603 m!466011))

(declare-fun m!466013 () Bool)

(assert (=> b!486606 m!466013))

(check-sat (not b!486601) (not start!44262) (not b!486605) (not b!486607) (not b!486604) (not b!486603) (not b!486606))
(check-sat)
