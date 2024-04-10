; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45776 () Bool)

(assert start!45776)

(declare-fun b!506587 () Bool)

(declare-fun res!307552 () Bool)

(declare-fun e!296501 () Bool)

(assert (=> b!506587 (=> (not res!307552) (not e!296501))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506587 (= res!307552 (validKeyInArray!0 k0!2280))))

(declare-fun b!506588 () Bool)

(declare-fun res!307554 () Bool)

(declare-fun e!296502 () Bool)

(assert (=> b!506588 (=> (not res!307554) (not e!296502))))

(declare-datatypes ((array!32532 0))(
  ( (array!32533 (arr!15646 (Array (_ BitVec 32) (_ BitVec 64))) (size!16010 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32532)

(declare-datatypes ((List!9804 0))(
  ( (Nil!9801) (Cons!9800 (h!10677 (_ BitVec 64)) (t!16032 List!9804)) )
))
(declare-fun arrayNoDuplicates!0 (array!32532 (_ BitVec 32) List!9804) Bool)

(assert (=> b!506588 (= res!307554 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9801))))

(declare-fun b!506589 () Bool)

(declare-fun e!296497 () Bool)

(assert (=> b!506589 (= e!296502 (not e!296497))))

(declare-fun res!307550 () Bool)

(assert (=> b!506589 (=> res!307550 e!296497)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4113 0))(
  ( (MissingZero!4113 (index!18640 (_ BitVec 32))) (Found!4113 (index!18641 (_ BitVec 32))) (Intermediate!4113 (undefined!4925 Bool) (index!18642 (_ BitVec 32)) (x!47642 (_ BitVec 32))) (Undefined!4113) (MissingVacant!4113 (index!18643 (_ BitVec 32))) )
))
(declare-fun lt!231178 () SeekEntryResult!4113)

(declare-fun lt!231175 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32532 (_ BitVec 32)) SeekEntryResult!4113)

(assert (=> b!506589 (= res!307550 (= lt!231178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231175 (select (store (arr!15646 a!3235) i!1204 k0!2280) j!176) (array!32533 (store (arr!15646 a!3235) i!1204 k0!2280) (size!16010 a!3235)) mask!3524)))))

(declare-fun lt!231176 () (_ BitVec 32))

(assert (=> b!506589 (= lt!231178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231176 (select (arr!15646 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506589 (= lt!231175 (toIndex!0 (select (store (arr!15646 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506589 (= lt!231176 (toIndex!0 (select (arr!15646 a!3235) j!176) mask!3524))))

(declare-fun e!296498 () Bool)

(assert (=> b!506589 e!296498))

(declare-fun res!307551 () Bool)

(assert (=> b!506589 (=> (not res!307551) (not e!296498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32532 (_ BitVec 32)) Bool)

(assert (=> b!506589 (= res!307551 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15514 0))(
  ( (Unit!15515) )
))
(declare-fun lt!231173 () Unit!15514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15514)

(assert (=> b!506589 (= lt!231173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506590 () Bool)

(assert (=> b!506590 (= e!296501 e!296502)))

(declare-fun res!307555 () Bool)

(assert (=> b!506590 (=> (not res!307555) (not e!296502))))

(declare-fun lt!231177 () SeekEntryResult!4113)

(assert (=> b!506590 (= res!307555 (or (= lt!231177 (MissingZero!4113 i!1204)) (= lt!231177 (MissingVacant!4113 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32532 (_ BitVec 32)) SeekEntryResult!4113)

(assert (=> b!506590 (= lt!231177 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506591 () Bool)

(declare-fun res!307556 () Bool)

(assert (=> b!506591 (=> (not res!307556) (not e!296501))))

(assert (=> b!506591 (= res!307556 (and (= (size!16010 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16010 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16010 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506592 () Bool)

(declare-fun res!307547 () Bool)

(assert (=> b!506592 (=> (not res!307547) (not e!296501))))

(assert (=> b!506592 (= res!307547 (validKeyInArray!0 (select (arr!15646 a!3235) j!176)))))

(declare-fun res!307549 () Bool)

(assert (=> start!45776 (=> (not res!307549) (not e!296501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45776 (= res!307549 (validMask!0 mask!3524))))

(assert (=> start!45776 e!296501))

(assert (=> start!45776 true))

(declare-fun array_inv!11442 (array!32532) Bool)

(assert (=> start!45776 (array_inv!11442 a!3235)))

(declare-fun b!506593 () Bool)

(declare-fun e!296500 () Bool)

(assert (=> b!506593 (= e!296500 true)))

(assert (=> b!506593 false))

(declare-fun b!506594 () Bool)

(assert (=> b!506594 (= e!296498 (= (seekEntryOrOpen!0 (select (arr!15646 a!3235) j!176) a!3235 mask!3524) (Found!4113 j!176)))))

(declare-fun b!506595 () Bool)

(declare-fun res!307553 () Bool)

(assert (=> b!506595 (=> (not res!307553) (not e!296501))))

(declare-fun arrayContainsKey!0 (array!32532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506595 (= res!307553 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506596 () Bool)

(assert (=> b!506596 (= e!296497 e!296500)))

(declare-fun res!307546 () Bool)

(assert (=> b!506596 (=> res!307546 e!296500)))

(declare-fun lt!231174 () Bool)

(assert (=> b!506596 (= res!307546 (or (and (not lt!231174) (undefined!4925 lt!231178)) (and (not lt!231174) (not (undefined!4925 lt!231178)))))))

(get-info :version)

(assert (=> b!506596 (= lt!231174 (not ((_ is Intermediate!4113) lt!231178)))))

(declare-fun b!506597 () Bool)

(declare-fun res!307548 () Bool)

(assert (=> b!506597 (=> (not res!307548) (not e!296502))))

(assert (=> b!506597 (= res!307548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45776 res!307549) b!506591))

(assert (= (and b!506591 res!307556) b!506592))

(assert (= (and b!506592 res!307547) b!506587))

(assert (= (and b!506587 res!307552) b!506595))

(assert (= (and b!506595 res!307553) b!506590))

(assert (= (and b!506590 res!307555) b!506597))

(assert (= (and b!506597 res!307548) b!506588))

(assert (= (and b!506588 res!307554) b!506589))

(assert (= (and b!506589 res!307551) b!506594))

(assert (= (and b!506589 (not res!307550)) b!506596))

(assert (= (and b!506596 (not res!307546)) b!506593))

(declare-fun m!487263 () Bool)

(assert (=> b!506589 m!487263))

(declare-fun m!487265 () Bool)

(assert (=> b!506589 m!487265))

(declare-fun m!487267 () Bool)

(assert (=> b!506589 m!487267))

(declare-fun m!487269 () Bool)

(assert (=> b!506589 m!487269))

(assert (=> b!506589 m!487263))

(declare-fun m!487271 () Bool)

(assert (=> b!506589 m!487271))

(declare-fun m!487273 () Bool)

(assert (=> b!506589 m!487273))

(assert (=> b!506589 m!487271))

(declare-fun m!487275 () Bool)

(assert (=> b!506589 m!487275))

(assert (=> b!506589 m!487271))

(declare-fun m!487277 () Bool)

(assert (=> b!506589 m!487277))

(assert (=> b!506589 m!487263))

(declare-fun m!487279 () Bool)

(assert (=> b!506589 m!487279))

(assert (=> b!506592 m!487271))

(assert (=> b!506592 m!487271))

(declare-fun m!487281 () Bool)

(assert (=> b!506592 m!487281))

(declare-fun m!487283 () Bool)

(assert (=> b!506587 m!487283))

(declare-fun m!487285 () Bool)

(assert (=> b!506588 m!487285))

(assert (=> b!506594 m!487271))

(assert (=> b!506594 m!487271))

(declare-fun m!487287 () Bool)

(assert (=> b!506594 m!487287))

(declare-fun m!487289 () Bool)

(assert (=> b!506590 m!487289))

(declare-fun m!487291 () Bool)

(assert (=> b!506597 m!487291))

(declare-fun m!487293 () Bool)

(assert (=> start!45776 m!487293))

(declare-fun m!487295 () Bool)

(assert (=> start!45776 m!487295))

(declare-fun m!487297 () Bool)

(assert (=> b!506595 m!487297))

(check-sat (not b!506587) (not b!506597) (not b!506590) (not b!506589) (not b!506594) (not start!45776) (not b!506595) (not b!506588) (not b!506592))
(check-sat)
