; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86956 () Bool)

(assert start!86956)

(declare-fun b!1006586 () Bool)

(declare-fun res!674914 () Bool)

(declare-fun e!566931 () Bool)

(assert (=> b!1006586 (=> (not res!674914) (not e!566931))))

(declare-datatypes ((array!63474 0))(
  ( (array!63475 (arr!30553 (Array (_ BitVec 32) (_ BitVec 64))) (size!31056 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63474)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006586 (= res!674914 (validKeyInArray!0 (select (arr!30553 a!3219) j!170)))))

(declare-fun b!1006587 () Bool)

(declare-fun res!674917 () Bool)

(assert (=> b!1006587 (=> (not res!674917) (not e!566931))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1006587 (= res!674917 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006588 () Bool)

(declare-fun res!674916 () Bool)

(assert (=> b!1006588 (=> (not res!674916) (not e!566931))))

(declare-fun arrayContainsKey!0 (array!63474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006588 (= res!674916 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006589 () Bool)

(declare-fun e!566929 () Bool)

(assert (=> b!1006589 (= e!566929 false)))

(declare-fun lt!445006 () Bool)

(declare-datatypes ((List!21200 0))(
  ( (Nil!21197) (Cons!21196 (h!22388 (_ BitVec 64)) (t!30193 List!21200)) )
))
(declare-fun arrayNoDuplicates!0 (array!63474 (_ BitVec 32) List!21200) Bool)

(assert (=> b!1006589 (= lt!445006 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21197))))

(declare-fun b!1006590 () Bool)

(declare-fun res!674912 () Bool)

(assert (=> b!1006590 (=> (not res!674912) (not e!566931))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006590 (= res!674912 (and (= (size!31056 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31056 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31056 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006591 () Bool)

(assert (=> b!1006591 (= e!566931 e!566929)))

(declare-fun res!674913 () Bool)

(assert (=> b!1006591 (=> (not res!674913) (not e!566929))))

(declare-datatypes ((SeekEntryResult!9421 0))(
  ( (MissingZero!9421 (index!40055 (_ BitVec 32))) (Found!9421 (index!40056 (_ BitVec 32))) (Intermediate!9421 (undefined!10233 Bool) (index!40057 (_ BitVec 32)) (x!87625 (_ BitVec 32))) (Undefined!9421) (MissingVacant!9421 (index!40058 (_ BitVec 32))) )
))
(declare-fun lt!445007 () SeekEntryResult!9421)

(assert (=> b!1006591 (= res!674913 (or (= lt!445007 (MissingVacant!9421 i!1194)) (= lt!445007 (MissingZero!9421 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63474 (_ BitVec 32)) SeekEntryResult!9421)

(assert (=> b!1006591 (= lt!445007 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!674915 () Bool)

(assert (=> start!86956 (=> (not res!674915) (not e!566931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86956 (= res!674915 (validMask!0 mask!3464))))

(assert (=> start!86956 e!566931))

(declare-fun array_inv!23689 (array!63474) Bool)

(assert (=> start!86956 (array_inv!23689 a!3219)))

(assert (=> start!86956 true))

(declare-fun b!1006585 () Bool)

(declare-fun res!674918 () Bool)

(assert (=> b!1006585 (=> (not res!674918) (not e!566929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63474 (_ BitVec 32)) Bool)

(assert (=> b!1006585 (= res!674918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86956 res!674915) b!1006590))

(assert (= (and b!1006590 res!674912) b!1006586))

(assert (= (and b!1006586 res!674914) b!1006587))

(assert (= (and b!1006587 res!674917) b!1006588))

(assert (= (and b!1006588 res!674916) b!1006591))

(assert (= (and b!1006591 res!674913) b!1006585))

(assert (= (and b!1006585 res!674918) b!1006589))

(declare-fun m!932129 () Bool)

(assert (=> b!1006586 m!932129))

(assert (=> b!1006586 m!932129))

(declare-fun m!932131 () Bool)

(assert (=> b!1006586 m!932131))

(declare-fun m!932133 () Bool)

(assert (=> b!1006589 m!932133))

(declare-fun m!932135 () Bool)

(assert (=> b!1006585 m!932135))

(declare-fun m!932137 () Bool)

(assert (=> start!86956 m!932137))

(declare-fun m!932139 () Bool)

(assert (=> start!86956 m!932139))

(declare-fun m!932141 () Bool)

(assert (=> b!1006588 m!932141))

(declare-fun m!932143 () Bool)

(assert (=> b!1006587 m!932143))

(declare-fun m!932145 () Bool)

(assert (=> b!1006591 m!932145))

(check-sat (not b!1006591) (not b!1006587) (not b!1006586) (not b!1006585) (not b!1006588) (not b!1006589) (not start!86956))
(check-sat)
