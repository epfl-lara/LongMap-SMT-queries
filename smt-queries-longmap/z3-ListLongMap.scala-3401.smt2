; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47000 () Bool)

(assert start!47000)

(declare-fun b!518271 () Bool)

(declare-fun e!302400 () Bool)

(declare-fun e!302401 () Bool)

(assert (=> b!518271 (= e!302400 e!302401)))

(declare-fun res!317297 () Bool)

(assert (=> b!518271 (=> (not res!317297) (not e!302401))))

(declare-datatypes ((SeekEntryResult!4401 0))(
  ( (MissingZero!4401 (index!19792 (_ BitVec 32))) (Found!4401 (index!19793 (_ BitVec 32))) (Intermediate!4401 (undefined!5213 Bool) (index!19794 (_ BitVec 32)) (x!48758 (_ BitVec 32))) (Undefined!4401) (MissingVacant!4401 (index!19795 (_ BitVec 32))) )
))
(declare-fun lt!237255 () SeekEntryResult!4401)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518271 (= res!317297 (or (= lt!237255 (MissingZero!4401 i!1204)) (= lt!237255 (MissingVacant!4401 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33141 0))(
  ( (array!33142 (arr!15934 (Array (_ BitVec 32) (_ BitVec 64))) (size!16298 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33141)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33141 (_ BitVec 32)) SeekEntryResult!4401)

(assert (=> b!518271 (= lt!237255 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518272 () Bool)

(declare-fun res!317289 () Bool)

(assert (=> b!518272 (=> (not res!317289) (not e!302400))))

(declare-fun arrayContainsKey!0 (array!33141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518272 (= res!317289 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518273 () Bool)

(declare-fun res!317286 () Bool)

(assert (=> b!518273 (=> (not res!317286) (not e!302400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518273 (= res!317286 (validKeyInArray!0 k0!2280))))

(declare-fun b!518274 () Bool)

(declare-fun res!317294 () Bool)

(assert (=> b!518274 (=> (not res!317294) (not e!302400))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518274 (= res!317294 (and (= (size!16298 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16298 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16298 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518275 () Bool)

(declare-fun e!302402 () Bool)

(assert (=> b!518275 (= e!302402 (= (seekEntryOrOpen!0 (select (arr!15934 a!3235) j!176) a!3235 mask!3524) (Found!4401 j!176)))))

(declare-fun b!518276 () Bool)

(declare-fun res!317292 () Bool)

(declare-fun e!302399 () Bool)

(assert (=> b!518276 (=> res!317292 e!302399)))

(declare-fun lt!237259 () SeekEntryResult!4401)

(get-info :version)

(assert (=> b!518276 (= res!317292 (or (undefined!5213 lt!237259) (not ((_ is Intermediate!4401) lt!237259))))))

(declare-fun b!518278 () Bool)

(declare-fun res!317290 () Bool)

(assert (=> b!518278 (=> (not res!317290) (not e!302401))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33141 (_ BitVec 32)) Bool)

(assert (=> b!518278 (= res!317290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518279 () Bool)

(declare-fun res!317288 () Bool)

(assert (=> b!518279 (=> (not res!317288) (not e!302400))))

(assert (=> b!518279 (= res!317288 (validKeyInArray!0 (select (arr!15934 a!3235) j!176)))))

(declare-fun b!518280 () Bool)

(assert (=> b!518280 (= e!302401 (not e!302399))))

(declare-fun res!317296 () Bool)

(assert (=> b!518280 (=> res!317296 e!302399)))

(declare-fun lt!237252 () (_ BitVec 32))

(declare-fun lt!237254 () (_ BitVec 64))

(declare-fun lt!237253 () array!33141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33141 (_ BitVec 32)) SeekEntryResult!4401)

(assert (=> b!518280 (= res!317296 (= lt!237259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237252 lt!237254 lt!237253 mask!3524)))))

(declare-fun lt!237257 () (_ BitVec 32))

(assert (=> b!518280 (= lt!237259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237257 (select (arr!15934 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518280 (= lt!237252 (toIndex!0 lt!237254 mask!3524))))

(assert (=> b!518280 (= lt!237254 (select (store (arr!15934 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518280 (= lt!237257 (toIndex!0 (select (arr!15934 a!3235) j!176) mask!3524))))

(assert (=> b!518280 (= lt!237253 (array!33142 (store (arr!15934 a!3235) i!1204 k0!2280) (size!16298 a!3235)))))

(assert (=> b!518280 e!302402))

(declare-fun res!317287 () Bool)

(assert (=> b!518280 (=> (not res!317287) (not e!302402))))

(assert (=> b!518280 (= res!317287 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16060 0))(
  ( (Unit!16061) )
))
(declare-fun lt!237256 () Unit!16060)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16060)

(assert (=> b!518280 (= lt!237256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!317291 () Bool)

(assert (=> start!47000 (=> (not res!317291) (not e!302400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47000 (= res!317291 (validMask!0 mask!3524))))

(assert (=> start!47000 e!302400))

(assert (=> start!47000 true))

(declare-fun array_inv!11730 (array!33141) Bool)

(assert (=> start!47000 (array_inv!11730 a!3235)))

(declare-fun b!518277 () Bool)

(declare-fun e!302403 () Bool)

(assert (=> b!518277 (= e!302403 false)))

(assert (=> b!518277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237257 lt!237254 lt!237253 mask!3524) (Intermediate!4401 false (index!19794 lt!237259) (x!48758 lt!237259)))))

(declare-fun lt!237258 () Unit!16060)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33141 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16060)

(assert (=> b!518277 (= lt!237258 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237257 #b00000000000000000000000000000000 (index!19794 lt!237259) (x!48758 lt!237259) mask!3524))))

(declare-fun b!518281 () Bool)

(declare-fun res!317295 () Bool)

(assert (=> b!518281 (=> (not res!317295) (not e!302401))))

(declare-datatypes ((List!10092 0))(
  ( (Nil!10089) (Cons!10088 (h!10995 (_ BitVec 64)) (t!16320 List!10092)) )
))
(declare-fun arrayNoDuplicates!0 (array!33141 (_ BitVec 32) List!10092) Bool)

(assert (=> b!518281 (= res!317295 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10089))))

(declare-fun b!518282 () Bool)

(assert (=> b!518282 (= e!302399 e!302403)))

(declare-fun res!317293 () Bool)

(assert (=> b!518282 (=> res!317293 e!302403)))

(assert (=> b!518282 (= res!317293 (not (= (select (arr!15934 a!3235) (index!19794 lt!237259)) (select (arr!15934 a!3235) j!176))))))

(assert (=> b!518282 (and (bvslt (x!48758 lt!237259) #b01111111111111111111111111111110) (or (= (select (arr!15934 a!3235) (index!19794 lt!237259)) (select (arr!15934 a!3235) j!176)) (= (select (arr!15934 a!3235) (index!19794 lt!237259)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15934 a!3235) (index!19794 lt!237259)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47000 res!317291) b!518274))

(assert (= (and b!518274 res!317294) b!518279))

(assert (= (and b!518279 res!317288) b!518273))

(assert (= (and b!518273 res!317286) b!518272))

(assert (= (and b!518272 res!317289) b!518271))

(assert (= (and b!518271 res!317297) b!518278))

(assert (= (and b!518278 res!317290) b!518281))

(assert (= (and b!518281 res!317295) b!518280))

(assert (= (and b!518280 res!317287) b!518275))

(assert (= (and b!518280 (not res!317296)) b!518276))

(assert (= (and b!518276 (not res!317292)) b!518282))

(assert (= (and b!518282 (not res!317293)) b!518277))

(declare-fun m!499641 () Bool)

(assert (=> b!518271 m!499641))

(declare-fun m!499643 () Bool)

(assert (=> b!518278 m!499643))

(declare-fun m!499645 () Bool)

(assert (=> start!47000 m!499645))

(declare-fun m!499647 () Bool)

(assert (=> start!47000 m!499647))

(declare-fun m!499649 () Bool)

(assert (=> b!518280 m!499649))

(declare-fun m!499651 () Bool)

(assert (=> b!518280 m!499651))

(declare-fun m!499653 () Bool)

(assert (=> b!518280 m!499653))

(declare-fun m!499655 () Bool)

(assert (=> b!518280 m!499655))

(declare-fun m!499657 () Bool)

(assert (=> b!518280 m!499657))

(assert (=> b!518280 m!499649))

(declare-fun m!499659 () Bool)

(assert (=> b!518280 m!499659))

(declare-fun m!499661 () Bool)

(assert (=> b!518280 m!499661))

(declare-fun m!499663 () Bool)

(assert (=> b!518280 m!499663))

(declare-fun m!499665 () Bool)

(assert (=> b!518280 m!499665))

(assert (=> b!518280 m!499649))

(declare-fun m!499667 () Bool)

(assert (=> b!518273 m!499667))

(declare-fun m!499669 () Bool)

(assert (=> b!518281 m!499669))

(declare-fun m!499671 () Bool)

(assert (=> b!518272 m!499671))

(declare-fun m!499673 () Bool)

(assert (=> b!518277 m!499673))

(declare-fun m!499675 () Bool)

(assert (=> b!518277 m!499675))

(assert (=> b!518275 m!499649))

(assert (=> b!518275 m!499649))

(declare-fun m!499677 () Bool)

(assert (=> b!518275 m!499677))

(assert (=> b!518279 m!499649))

(assert (=> b!518279 m!499649))

(declare-fun m!499679 () Bool)

(assert (=> b!518279 m!499679))

(declare-fun m!499681 () Bool)

(assert (=> b!518282 m!499681))

(assert (=> b!518282 m!499649))

(check-sat (not b!518281) (not b!518280) (not b!518279) (not start!47000) (not b!518272) (not b!518271) (not b!518275) (not b!518277) (not b!518273) (not b!518278))
(check-sat)
