; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45180 () Bool)

(assert start!45180)

(declare-fun b!495720 () Bool)

(declare-fun res!298249 () Bool)

(declare-fun e!290746 () Bool)

(assert (=> b!495720 (=> (not res!298249) (not e!290746))))

(declare-datatypes ((array!32078 0))(
  ( (array!32079 (arr!15422 (Array (_ BitVec 32) (_ BitVec 64))) (size!15787 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32078)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495720 (= res!298249 (validKeyInArray!0 (select (arr!15422 a!3235) j!176)))))

(declare-fun b!495721 () Bool)

(declare-fun res!298256 () Bool)

(declare-fun e!290747 () Bool)

(assert (=> b!495721 (=> res!298256 e!290747)))

(declare-datatypes ((SeekEntryResult!3886 0))(
  ( (MissingZero!3886 (index!17723 (_ BitVec 32))) (Found!3886 (index!17724 (_ BitVec 32))) (Intermediate!3886 (undefined!4698 Bool) (index!17725 (_ BitVec 32)) (x!46797 (_ BitVec 32))) (Undefined!3886) (MissingVacant!3886 (index!17726 (_ BitVec 32))) )
))
(declare-fun lt!224307 () SeekEntryResult!3886)

(get-info :version)

(assert (=> b!495721 (= res!298256 (or (undefined!4698 lt!224307) (not ((_ is Intermediate!3886) lt!224307))))))

(declare-fun b!495722 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!290748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32078 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!495722 (= e!290748 (= (seekEntryOrOpen!0 (select (arr!15422 a!3235) j!176) a!3235 mask!3524) (Found!3886 j!176)))))

(declare-fun b!495723 () Bool)

(declare-fun res!298258 () Bool)

(assert (=> b!495723 (=> (not res!298258) (not e!290746))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495723 (= res!298258 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495724 () Bool)

(declare-fun res!298257 () Bool)

(assert (=> b!495724 (=> (not res!298257) (not e!290746))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!495724 (= res!298257 (and (= (size!15787 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15787 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15787 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495725 () Bool)

(assert (=> b!495725 (= e!290747 true)))

(assert (=> b!495725 (and (bvslt (x!46797 lt!224307) #b01111111111111111111111111111110) (or (= (select (arr!15422 a!3235) (index!17725 lt!224307)) (select (arr!15422 a!3235) j!176)) (= (select (arr!15422 a!3235) (index!17725 lt!224307)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15422 a!3235) (index!17725 lt!224307)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495727 () Bool)

(declare-fun e!290745 () Bool)

(assert (=> b!495727 (= e!290745 (not e!290747))))

(declare-fun res!298252 () Bool)

(assert (=> b!495727 (=> res!298252 e!290747)))

(declare-fun lt!224308 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32078 (_ BitVec 32)) SeekEntryResult!3886)

(assert (=> b!495727 (= res!298252 (= lt!224307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224308 (select (store (arr!15422 a!3235) i!1204 k0!2280) j!176) (array!32079 (store (arr!15422 a!3235) i!1204 k0!2280) (size!15787 a!3235)) mask!3524)))))

(declare-fun lt!224304 () (_ BitVec 32))

(assert (=> b!495727 (= lt!224307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224304 (select (arr!15422 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495727 (= lt!224308 (toIndex!0 (select (store (arr!15422 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495727 (= lt!224304 (toIndex!0 (select (arr!15422 a!3235) j!176) mask!3524))))

(assert (=> b!495727 e!290748))

(declare-fun res!298250 () Bool)

(assert (=> b!495727 (=> (not res!298250) (not e!290748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32078 (_ BitVec 32)) Bool)

(assert (=> b!495727 (= res!298250 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14704 0))(
  ( (Unit!14705) )
))
(declare-fun lt!224305 () Unit!14704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14704)

(assert (=> b!495727 (= lt!224305 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495728 () Bool)

(declare-fun res!298251 () Bool)

(assert (=> b!495728 (=> (not res!298251) (not e!290745))))

(declare-datatypes ((List!9619 0))(
  ( (Nil!9616) (Cons!9615 (h!10486 (_ BitVec 64)) (t!15838 List!9619)) )
))
(declare-fun arrayNoDuplicates!0 (array!32078 (_ BitVec 32) List!9619) Bool)

(assert (=> b!495728 (= res!298251 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9616))))

(declare-fun b!495729 () Bool)

(declare-fun res!298259 () Bool)

(assert (=> b!495729 (=> (not res!298259) (not e!290745))))

(assert (=> b!495729 (= res!298259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495730 () Bool)

(assert (=> b!495730 (= e!290746 e!290745)))

(declare-fun res!298255 () Bool)

(assert (=> b!495730 (=> (not res!298255) (not e!290745))))

(declare-fun lt!224306 () SeekEntryResult!3886)

(assert (=> b!495730 (= res!298255 (or (= lt!224306 (MissingZero!3886 i!1204)) (= lt!224306 (MissingVacant!3886 i!1204))))))

(assert (=> b!495730 (= lt!224306 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495726 () Bool)

(declare-fun res!298253 () Bool)

(assert (=> b!495726 (=> (not res!298253) (not e!290746))))

(assert (=> b!495726 (= res!298253 (validKeyInArray!0 k0!2280))))

(declare-fun res!298254 () Bool)

(assert (=> start!45180 (=> (not res!298254) (not e!290746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45180 (= res!298254 (validMask!0 mask!3524))))

(assert (=> start!45180 e!290746))

(assert (=> start!45180 true))

(declare-fun array_inv!11305 (array!32078) Bool)

(assert (=> start!45180 (array_inv!11305 a!3235)))

(assert (= (and start!45180 res!298254) b!495724))

(assert (= (and b!495724 res!298257) b!495720))

(assert (= (and b!495720 res!298249) b!495726))

(assert (= (and b!495726 res!298253) b!495723))

(assert (= (and b!495723 res!298258) b!495730))

(assert (= (and b!495730 res!298255) b!495729))

(assert (= (and b!495729 res!298259) b!495728))

(assert (= (and b!495728 res!298251) b!495727))

(assert (= (and b!495727 res!298250) b!495722))

(assert (= (and b!495727 (not res!298252)) b!495721))

(assert (= (and b!495721 (not res!298256)) b!495725))

(declare-fun m!476407 () Bool)

(assert (=> b!495728 m!476407))

(declare-fun m!476409 () Bool)

(assert (=> b!495720 m!476409))

(assert (=> b!495720 m!476409))

(declare-fun m!476411 () Bool)

(assert (=> b!495720 m!476411))

(assert (=> b!495722 m!476409))

(assert (=> b!495722 m!476409))

(declare-fun m!476413 () Bool)

(assert (=> b!495722 m!476413))

(declare-fun m!476415 () Bool)

(assert (=> b!495730 m!476415))

(declare-fun m!476417 () Bool)

(assert (=> b!495725 m!476417))

(assert (=> b!495725 m!476409))

(declare-fun m!476419 () Bool)

(assert (=> b!495726 m!476419))

(declare-fun m!476421 () Bool)

(assert (=> start!45180 m!476421))

(declare-fun m!476423 () Bool)

(assert (=> start!45180 m!476423))

(declare-fun m!476425 () Bool)

(assert (=> b!495727 m!476425))

(declare-fun m!476427 () Bool)

(assert (=> b!495727 m!476427))

(declare-fun m!476429 () Bool)

(assert (=> b!495727 m!476429))

(declare-fun m!476431 () Bool)

(assert (=> b!495727 m!476431))

(assert (=> b!495727 m!476427))

(assert (=> b!495727 m!476409))

(declare-fun m!476433 () Bool)

(assert (=> b!495727 m!476433))

(assert (=> b!495727 m!476409))

(declare-fun m!476435 () Bool)

(assert (=> b!495727 m!476435))

(assert (=> b!495727 m!476427))

(declare-fun m!476437 () Bool)

(assert (=> b!495727 m!476437))

(assert (=> b!495727 m!476409))

(declare-fun m!476439 () Bool)

(assert (=> b!495727 m!476439))

(declare-fun m!476441 () Bool)

(assert (=> b!495729 m!476441))

(declare-fun m!476443 () Bool)

(assert (=> b!495723 m!476443))

(check-sat (not start!45180) (not b!495729) (not b!495727) (not b!495722) (not b!495730) (not b!495723) (not b!495728) (not b!495726) (not b!495720))
(check-sat)
