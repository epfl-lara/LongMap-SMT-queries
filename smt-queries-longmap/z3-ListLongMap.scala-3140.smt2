; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44264 () Bool)

(assert start!44264)

(declare-fun b!486767 () Bool)

(declare-fun e!286514 () Bool)

(assert (=> b!486767 (= e!286514 false)))

(declare-fun lt!219850 () Bool)

(declare-datatypes ((array!31515 0))(
  ( (array!31516 (arr!15151 (Array (_ BitVec 32) (_ BitVec 64))) (size!15515 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31515)

(declare-datatypes ((List!9309 0))(
  ( (Nil!9306) (Cons!9305 (h!10161 (_ BitVec 64)) (t!15537 List!9309)) )
))
(declare-fun arrayNoDuplicates!0 (array!31515 (_ BitVec 32) List!9309) Bool)

(assert (=> b!486767 (= lt!219850 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9306))))

(declare-fun b!486768 () Bool)

(declare-fun res!290156 () Bool)

(declare-fun e!286513 () Bool)

(assert (=> b!486768 (=> (not res!290156) (not e!286513))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486768 (= res!290156 (validKeyInArray!0 k0!2280))))

(declare-fun b!486769 () Bool)

(declare-fun res!290159 () Bool)

(assert (=> b!486769 (=> (not res!290159) (not e!286513))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486769 (= res!290159 (and (= (size!15515 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15515 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15515 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290157 () Bool)

(assert (=> start!44264 (=> (not res!290157) (not e!286513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44264 (= res!290157 (validMask!0 mask!3524))))

(assert (=> start!44264 e!286513))

(assert (=> start!44264 true))

(declare-fun array_inv!10947 (array!31515) Bool)

(assert (=> start!44264 (array_inv!10947 a!3235)))

(declare-fun b!486770 () Bool)

(declare-fun res!290153 () Bool)

(assert (=> b!486770 (=> (not res!290153) (not e!286514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31515 (_ BitVec 32)) Bool)

(assert (=> b!486770 (= res!290153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486771 () Bool)

(assert (=> b!486771 (= e!286513 e!286514)))

(declare-fun res!290158 () Bool)

(assert (=> b!486771 (=> (not res!290158) (not e!286514))))

(declare-datatypes ((SeekEntryResult!3618 0))(
  ( (MissingZero!3618 (index!16651 (_ BitVec 32))) (Found!3618 (index!16652 (_ BitVec 32))) (Intermediate!3618 (undefined!4430 Bool) (index!16653 (_ BitVec 32)) (x!45782 (_ BitVec 32))) (Undefined!3618) (MissingVacant!3618 (index!16654 (_ BitVec 32))) )
))
(declare-fun lt!219849 () SeekEntryResult!3618)

(assert (=> b!486771 (= res!290158 (or (= lt!219849 (MissingZero!3618 i!1204)) (= lt!219849 (MissingVacant!3618 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31515 (_ BitVec 32)) SeekEntryResult!3618)

(assert (=> b!486771 (= lt!219849 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486772 () Bool)

(declare-fun res!290155 () Bool)

(assert (=> b!486772 (=> (not res!290155) (not e!286513))))

(assert (=> b!486772 (= res!290155 (validKeyInArray!0 (select (arr!15151 a!3235) j!176)))))

(declare-fun b!486773 () Bool)

(declare-fun res!290154 () Bool)

(assert (=> b!486773 (=> (not res!290154) (not e!286513))))

(declare-fun arrayContainsKey!0 (array!31515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486773 (= res!290154 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44264 res!290157) b!486769))

(assert (= (and b!486769 res!290159) b!486772))

(assert (= (and b!486772 res!290155) b!486768))

(assert (= (and b!486768 res!290156) b!486773))

(assert (= (and b!486773 res!290154) b!486771))

(assert (= (and b!486771 res!290158) b!486770))

(assert (= (and b!486770 res!290153) b!486767))

(declare-fun m!466659 () Bool)

(assert (=> b!486772 m!466659))

(assert (=> b!486772 m!466659))

(declare-fun m!466661 () Bool)

(assert (=> b!486772 m!466661))

(declare-fun m!466663 () Bool)

(assert (=> b!486767 m!466663))

(declare-fun m!466665 () Bool)

(assert (=> start!44264 m!466665))

(declare-fun m!466667 () Bool)

(assert (=> start!44264 m!466667))

(declare-fun m!466669 () Bool)

(assert (=> b!486768 m!466669))

(declare-fun m!466671 () Bool)

(assert (=> b!486771 m!466671))

(declare-fun m!466673 () Bool)

(assert (=> b!486773 m!466673))

(declare-fun m!466675 () Bool)

(assert (=> b!486770 m!466675))

(check-sat (not b!486772) (not b!486771) (not start!44264) (not b!486773) (not b!486770) (not b!486768) (not b!486767))
(check-sat)
