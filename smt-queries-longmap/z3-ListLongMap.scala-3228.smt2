; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45164 () Bool)

(assert start!45164)

(declare-fun b!495633 () Bool)

(declare-fun res!298077 () Bool)

(declare-fun e!290747 () Bool)

(assert (=> b!495633 (=> (not res!298077) (not e!290747))))

(declare-datatypes ((array!32053 0))(
  ( (array!32054 (arr!15409 (Array (_ BitVec 32) (_ BitVec 64))) (size!15773 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32053)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495633 (= res!298077 (validKeyInArray!0 (select (arr!15409 a!3235) j!176)))))

(declare-fun b!495634 () Bool)

(declare-fun e!290744 () Bool)

(assert (=> b!495634 (= e!290747 e!290744)))

(declare-fun res!298083 () Bool)

(assert (=> b!495634 (=> (not res!298083) (not e!290744))))

(declare-datatypes ((SeekEntryResult!3832 0))(
  ( (MissingZero!3832 (index!17507 (_ BitVec 32))) (Found!3832 (index!17508 (_ BitVec 32))) (Intermediate!3832 (undefined!4644 Bool) (index!17509 (_ BitVec 32)) (x!46721 (_ BitVec 32))) (Undefined!3832) (MissingVacant!3832 (index!17510 (_ BitVec 32))) )
))
(declare-fun lt!224418 () SeekEntryResult!3832)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495634 (= res!298083 (or (= lt!224418 (MissingZero!3832 i!1204)) (= lt!224418 (MissingVacant!3832 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32053 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!495634 (= lt!224418 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!298076 () Bool)

(assert (=> start!45164 (=> (not res!298076) (not e!290747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45164 (= res!298076 (validMask!0 mask!3524))))

(assert (=> start!45164 e!290747))

(assert (=> start!45164 true))

(declare-fun array_inv!11268 (array!32053) Bool)

(assert (=> start!45164 (array_inv!11268 a!3235)))

(declare-fun b!495635 () Bool)

(declare-fun e!290746 () Bool)

(assert (=> b!495635 (= e!290746 (= (seekEntryOrOpen!0 (select (arr!15409 a!3235) j!176) a!3235 mask!3524) (Found!3832 j!176)))))

(declare-fun b!495636 () Bool)

(declare-fun res!298075 () Bool)

(assert (=> b!495636 (=> (not res!298075) (not e!290747))))

(assert (=> b!495636 (= res!298075 (and (= (size!15773 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15773 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15773 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495637 () Bool)

(declare-fun res!298078 () Bool)

(assert (=> b!495637 (=> (not res!298078) (not e!290747))))

(declare-fun arrayContainsKey!0 (array!32053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495637 (= res!298078 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495638 () Bool)

(declare-fun res!298084 () Bool)

(assert (=> b!495638 (=> (not res!298084) (not e!290744))))

(declare-datatypes ((List!9474 0))(
  ( (Nil!9471) (Cons!9470 (h!10341 (_ BitVec 64)) (t!15694 List!9474)) )
))
(declare-fun arrayNoDuplicates!0 (array!32053 (_ BitVec 32) List!9474) Bool)

(assert (=> b!495638 (= res!298084 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9471))))

(declare-fun b!495639 () Bool)

(declare-fun e!290745 () Bool)

(assert (=> b!495639 (= e!290745 true)))

(declare-fun lt!224419 () SeekEntryResult!3832)

(assert (=> b!495639 (and (bvslt (x!46721 lt!224419) #b01111111111111111111111111111110) (or (= (select (arr!15409 a!3235) (index!17509 lt!224419)) (select (arr!15409 a!3235) j!176)) (= (select (arr!15409 a!3235) (index!17509 lt!224419)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15409 a!3235) (index!17509 lt!224419)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495640 () Bool)

(declare-fun res!298080 () Bool)

(assert (=> b!495640 (=> res!298080 e!290745)))

(get-info :version)

(assert (=> b!495640 (= res!298080 (or (undefined!4644 lt!224419) (not ((_ is Intermediate!3832) lt!224419))))))

(declare-fun b!495641 () Bool)

(declare-fun res!298079 () Bool)

(assert (=> b!495641 (=> (not res!298079) (not e!290747))))

(assert (=> b!495641 (= res!298079 (validKeyInArray!0 k0!2280))))

(declare-fun b!495642 () Bool)

(declare-fun res!298082 () Bool)

(assert (=> b!495642 (=> (not res!298082) (not e!290744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32053 (_ BitVec 32)) Bool)

(assert (=> b!495642 (= res!298082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495643 () Bool)

(assert (=> b!495643 (= e!290744 (not e!290745))))

(declare-fun res!298081 () Bool)

(assert (=> b!495643 (=> res!298081 e!290745)))

(declare-fun lt!224415 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32053 (_ BitVec 32)) SeekEntryResult!3832)

(assert (=> b!495643 (= res!298081 (= lt!224419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224415 (select (store (arr!15409 a!3235) i!1204 k0!2280) j!176) (array!32054 (store (arr!15409 a!3235) i!1204 k0!2280) (size!15773 a!3235)) mask!3524)))))

(declare-fun lt!224417 () (_ BitVec 32))

(assert (=> b!495643 (= lt!224419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224417 (select (arr!15409 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495643 (= lt!224415 (toIndex!0 (select (store (arr!15409 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495643 (= lt!224417 (toIndex!0 (select (arr!15409 a!3235) j!176) mask!3524))))

(assert (=> b!495643 e!290746))

(declare-fun res!298074 () Bool)

(assert (=> b!495643 (=> (not res!298074) (not e!290746))))

(assert (=> b!495643 (= res!298074 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14671 0))(
  ( (Unit!14672) )
))
(declare-fun lt!224416 () Unit!14671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14671)

(assert (=> b!495643 (= lt!224416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45164 res!298076) b!495636))

(assert (= (and b!495636 res!298075) b!495633))

(assert (= (and b!495633 res!298077) b!495641))

(assert (= (and b!495641 res!298079) b!495637))

(assert (= (and b!495637 res!298078) b!495634))

(assert (= (and b!495634 res!298083) b!495642))

(assert (= (and b!495642 res!298082) b!495638))

(assert (= (and b!495638 res!298084) b!495643))

(assert (= (and b!495643 res!298074) b!495635))

(assert (= (and b!495643 (not res!298081)) b!495640))

(assert (= (and b!495640 (not res!298080)) b!495639))

(declare-fun m!477001 () Bool)

(assert (=> b!495641 m!477001))

(declare-fun m!477003 () Bool)

(assert (=> b!495638 m!477003))

(declare-fun m!477005 () Bool)

(assert (=> start!45164 m!477005))

(declare-fun m!477007 () Bool)

(assert (=> start!45164 m!477007))

(declare-fun m!477009 () Bool)

(assert (=> b!495643 m!477009))

(declare-fun m!477011 () Bool)

(assert (=> b!495643 m!477011))

(declare-fun m!477013 () Bool)

(assert (=> b!495643 m!477013))

(declare-fun m!477015 () Bool)

(assert (=> b!495643 m!477015))

(assert (=> b!495643 m!477011))

(declare-fun m!477017 () Bool)

(assert (=> b!495643 m!477017))

(declare-fun m!477019 () Bool)

(assert (=> b!495643 m!477019))

(assert (=> b!495643 m!477017))

(declare-fun m!477021 () Bool)

(assert (=> b!495643 m!477021))

(assert (=> b!495643 m!477011))

(declare-fun m!477023 () Bool)

(assert (=> b!495643 m!477023))

(assert (=> b!495643 m!477017))

(declare-fun m!477025 () Bool)

(assert (=> b!495643 m!477025))

(declare-fun m!477027 () Bool)

(assert (=> b!495634 m!477027))

(declare-fun m!477029 () Bool)

(assert (=> b!495639 m!477029))

(assert (=> b!495639 m!477017))

(declare-fun m!477031 () Bool)

(assert (=> b!495637 m!477031))

(declare-fun m!477033 () Bool)

(assert (=> b!495642 m!477033))

(assert (=> b!495633 m!477017))

(assert (=> b!495633 m!477017))

(declare-fun m!477035 () Bool)

(assert (=> b!495633 m!477035))

(assert (=> b!495635 m!477017))

(assert (=> b!495635 m!477017))

(declare-fun m!477037 () Bool)

(assert (=> b!495635 m!477037))

(check-sat (not b!495638) (not b!495643) (not b!495642) (not b!495637) (not b!495633) (not b!495634) (not b!495641) (not start!45164) (not b!495635))
(check-sat)
