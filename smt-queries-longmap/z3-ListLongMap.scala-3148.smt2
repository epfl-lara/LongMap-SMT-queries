; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44300 () Bool)

(assert start!44300)

(declare-fun res!290670 () Bool)

(declare-fun e!286684 () Bool)

(assert (=> start!44300 (=> (not res!290670) (not e!286684))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44300 (= res!290670 (validMask!0 mask!3524))))

(assert (=> start!44300 e!286684))

(assert (=> start!44300 true))

(declare-datatypes ((array!31552 0))(
  ( (array!31553 (arr!15169 (Array (_ BitVec 32) (_ BitVec 64))) (size!15533 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31552)

(declare-fun array_inv!11028 (array!31552) Bool)

(assert (=> start!44300 (array_inv!11028 a!3235)))

(declare-fun b!487229 () Bool)

(declare-fun res!290673 () Bool)

(assert (=> b!487229 (=> (not res!290673) (not e!286684))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487229 (= res!290673 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487230 () Bool)

(declare-fun res!290671 () Bool)

(assert (=> b!487230 (=> (not res!290671) (not e!286684))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487230 (= res!290671 (and (= (size!15533 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15533 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15533 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487231 () Bool)

(declare-fun res!290669 () Bool)

(assert (=> b!487231 (=> (not res!290669) (not e!286684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487231 (= res!290669 (validKeyInArray!0 (select (arr!15169 a!3235) j!176)))))

(declare-fun b!487232 () Bool)

(declare-fun res!290674 () Bool)

(declare-fun e!286685 () Bool)

(assert (=> b!487232 (=> (not res!290674) (not e!286685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31552 (_ BitVec 32)) Bool)

(assert (=> b!487232 (= res!290674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487233 () Bool)

(assert (=> b!487233 (= e!286685 (not (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun e!286686 () Bool)

(assert (=> b!487233 e!286686))

(declare-fun res!290677 () Bool)

(assert (=> b!487233 (=> (not res!290677) (not e!286686))))

(assert (=> b!487233 (= res!290677 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14191 0))(
  ( (Unit!14192) )
))
(declare-fun lt!220000 () Unit!14191)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14191)

(assert (=> b!487233 (= lt!220000 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487234 () Bool)

(assert (=> b!487234 (= e!286684 e!286685)))

(declare-fun res!290675 () Bool)

(assert (=> b!487234 (=> (not res!290675) (not e!286685))))

(declare-datatypes ((SeekEntryResult!3592 0))(
  ( (MissingZero!3592 (index!16547 (_ BitVec 32))) (Found!3592 (index!16548 (_ BitVec 32))) (Intermediate!3592 (undefined!4404 Bool) (index!16549 (_ BitVec 32)) (x!45817 (_ BitVec 32))) (Undefined!3592) (MissingVacant!3592 (index!16550 (_ BitVec 32))) )
))
(declare-fun lt!219999 () SeekEntryResult!3592)

(assert (=> b!487234 (= res!290675 (or (= lt!219999 (MissingZero!3592 i!1204)) (= lt!219999 (MissingVacant!3592 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31552 (_ BitVec 32)) SeekEntryResult!3592)

(assert (=> b!487234 (= lt!219999 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487235 () Bool)

(declare-fun res!290676 () Bool)

(assert (=> b!487235 (=> (not res!290676) (not e!286684))))

(assert (=> b!487235 (= res!290676 (validKeyInArray!0 k0!2280))))

(declare-fun b!487236 () Bool)

(assert (=> b!487236 (= e!286686 (= (seekEntryOrOpen!0 (select (arr!15169 a!3235) j!176) a!3235 mask!3524) (Found!3592 j!176)))))

(declare-fun b!487237 () Bool)

(declare-fun res!290672 () Bool)

(assert (=> b!487237 (=> (not res!290672) (not e!286685))))

(declare-datatypes ((List!9234 0))(
  ( (Nil!9231) (Cons!9230 (h!10086 (_ BitVec 64)) (t!15454 List!9234)) )
))
(declare-fun arrayNoDuplicates!0 (array!31552 (_ BitVec 32) List!9234) Bool)

(assert (=> b!487237 (= res!290672 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9231))))

(assert (= (and start!44300 res!290670) b!487230))

(assert (= (and b!487230 res!290671) b!487231))

(assert (= (and b!487231 res!290669) b!487235))

(assert (= (and b!487235 res!290676) b!487229))

(assert (= (and b!487229 res!290673) b!487234))

(assert (= (and b!487234 res!290675) b!487232))

(assert (= (and b!487232 res!290674) b!487237))

(assert (= (and b!487237 res!290672) b!487233))

(assert (= (and b!487233 res!290677) b!487236))

(declare-fun m!467305 () Bool)

(assert (=> b!487236 m!467305))

(assert (=> b!487236 m!467305))

(declare-fun m!467307 () Bool)

(assert (=> b!487236 m!467307))

(assert (=> b!487231 m!467305))

(assert (=> b!487231 m!467305))

(declare-fun m!467309 () Bool)

(assert (=> b!487231 m!467309))

(declare-fun m!467311 () Bool)

(assert (=> b!487233 m!467311))

(declare-fun m!467313 () Bool)

(assert (=> b!487233 m!467313))

(declare-fun m!467315 () Bool)

(assert (=> b!487235 m!467315))

(declare-fun m!467317 () Bool)

(assert (=> b!487237 m!467317))

(declare-fun m!467319 () Bool)

(assert (=> start!44300 m!467319))

(declare-fun m!467321 () Bool)

(assert (=> start!44300 m!467321))

(declare-fun m!467323 () Bool)

(assert (=> b!487232 m!467323))

(declare-fun m!467325 () Bool)

(assert (=> b!487229 m!467325))

(declare-fun m!467327 () Bool)

(assert (=> b!487234 m!467327))

(check-sat (not b!487237) (not b!487229) (not start!44300) (not b!487235) (not b!487233) (not b!487231) (not b!487232) (not b!487236) (not b!487234))
(check-sat)
