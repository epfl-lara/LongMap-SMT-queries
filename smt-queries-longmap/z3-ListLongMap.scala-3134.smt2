; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44090 () Bool)

(assert start!44090)

(declare-fun b!485901 () Bool)

(declare-fun res!289561 () Bool)

(declare-fun e!286026 () Bool)

(assert (=> b!485901 (=> (not res!289561) (not e!286026))))

(declare-datatypes ((array!31459 0))(
  ( (array!31460 (arr!15127 (Array (_ BitVec 32) (_ BitVec 64))) (size!15491 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31459)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485901 (= res!289561 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485902 () Bool)

(declare-fun res!289558 () Bool)

(assert (=> b!485902 (=> (not res!289558) (not e!286026))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485902 (= res!289558 (validKeyInArray!0 (select (arr!15127 a!3235) j!176)))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun b!485903 () Bool)

(declare-datatypes ((SeekEntryResult!3550 0))(
  ( (MissingZero!3550 (index!16379 (_ BitVec 32))) (Found!3550 (index!16380 (_ BitVec 32))) (Intermediate!3550 (undefined!4362 Bool) (index!16381 (_ BitVec 32)) (x!45663 (_ BitVec 32))) (Undefined!3550) (MissingVacant!3550 (index!16382 (_ BitVec 32))) )
))
(declare-fun lt!219616 () SeekEntryResult!3550)

(assert (=> b!485903 (= e!286026 (and (or (= lt!219616 (MissingZero!3550 i!1204)) (= lt!219616 (MissingVacant!3550 i!1204))) (bvsgt #b00000000000000000000000000000000 (size!15491 a!3235))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31459 (_ BitVec 32)) SeekEntryResult!3550)

(assert (=> b!485903 (= lt!219616 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485904 () Bool)

(declare-fun res!289557 () Bool)

(assert (=> b!485904 (=> (not res!289557) (not e!286026))))

(assert (=> b!485904 (= res!289557 (validKeyInArray!0 k0!2280))))

(declare-fun b!485905 () Bool)

(declare-fun res!289560 () Bool)

(assert (=> b!485905 (=> (not res!289560) (not e!286026))))

(assert (=> b!485905 (= res!289560 (and (= (size!15491 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15491 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15491 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!289559 () Bool)

(assert (=> start!44090 (=> (not res!289559) (not e!286026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44090 (= res!289559 (validMask!0 mask!3524))))

(assert (=> start!44090 e!286026))

(assert (=> start!44090 true))

(declare-fun array_inv!10986 (array!31459) Bool)

(assert (=> start!44090 (array_inv!10986 a!3235)))

(assert (= (and start!44090 res!289559) b!485905))

(assert (= (and b!485905 res!289560) b!485902))

(assert (= (and b!485902 res!289558) b!485904))

(assert (= (and b!485904 res!289557) b!485901))

(assert (= (and b!485901 res!289561) b!485903))

(declare-fun m!466207 () Bool)

(assert (=> b!485903 m!466207))

(declare-fun m!466209 () Bool)

(assert (=> start!44090 m!466209))

(declare-fun m!466211 () Bool)

(assert (=> start!44090 m!466211))

(declare-fun m!466213 () Bool)

(assert (=> b!485902 m!466213))

(assert (=> b!485902 m!466213))

(declare-fun m!466215 () Bool)

(assert (=> b!485902 m!466215))

(declare-fun m!466217 () Bool)

(assert (=> b!485901 m!466217))

(declare-fun m!466219 () Bool)

(assert (=> b!485904 m!466219))

(check-sat (not b!485901) (not b!485903) (not start!44090) (not b!485904) (not b!485902))
(check-sat)
