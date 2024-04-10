; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68446 () Bool)

(assert start!68446)

(declare-fun b!795585 () Bool)

(declare-fun res!540104 () Bool)

(declare-fun e!441562 () Bool)

(assert (=> b!795585 (=> (not res!540104) (not e!441562))))

(declare-datatypes ((array!43236 0))(
  ( (array!43237 (arr!20698 (Array (_ BitVec 32) (_ BitVec 64))) (size!21119 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43236)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795585 (= res!540104 (validKeyInArray!0 (select (arr!20698 a!3170) j!153)))))

(declare-fun b!795586 () Bool)

(declare-fun e!441560 () Bool)

(declare-fun e!441561 () Bool)

(assert (=> b!795586 (= e!441560 e!441561)))

(declare-fun res!540110 () Bool)

(assert (=> b!795586 (=> (not res!540110) (not e!441561))))

(declare-fun lt!354646 () array!43236)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!354649 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8289 0))(
  ( (MissingZero!8289 (index!35524 (_ BitVec 32))) (Found!8289 (index!35525 (_ BitVec 32))) (Intermediate!8289 (undefined!9101 Bool) (index!35526 (_ BitVec 32)) (x!66439 (_ BitVec 32))) (Undefined!8289) (MissingVacant!8289 (index!35527 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43236 (_ BitVec 32)) SeekEntryResult!8289)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43236 (_ BitVec 32)) SeekEntryResult!8289)

(assert (=> b!795586 (= res!540110 (= (seekEntryOrOpen!0 lt!354649 lt!354646 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354649 lt!354646 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795586 (= lt!354649 (select (store (arr!20698 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795586 (= lt!354646 (array!43237 (store (arr!20698 a!3170) i!1163 k0!2044) (size!21119 a!3170)))))

(declare-fun b!795587 () Bool)

(declare-fun res!540111 () Bool)

(assert (=> b!795587 (=> (not res!540111) (not e!441560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43236 (_ BitVec 32)) Bool)

(assert (=> b!795587 (= res!540111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795588 () Bool)

(assert (=> b!795588 (= e!441562 e!441560)))

(declare-fun res!540112 () Bool)

(assert (=> b!795588 (=> (not res!540112) (not e!441560))))

(declare-fun lt!354647 () SeekEntryResult!8289)

(assert (=> b!795588 (= res!540112 (or (= lt!354647 (MissingZero!8289 i!1163)) (= lt!354647 (MissingVacant!8289 i!1163))))))

(assert (=> b!795588 (= lt!354647 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795589 () Bool)

(declare-fun res!540106 () Bool)

(assert (=> b!795589 (=> (not res!540106) (not e!441562))))

(assert (=> b!795589 (= res!540106 (validKeyInArray!0 k0!2044))))

(declare-fun res!540107 () Bool)

(assert (=> start!68446 (=> (not res!540107) (not e!441562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68446 (= res!540107 (validMask!0 mask!3266))))

(assert (=> start!68446 e!441562))

(assert (=> start!68446 true))

(declare-fun array_inv!16494 (array!43236) Bool)

(assert (=> start!68446 (array_inv!16494 a!3170)))

(declare-fun b!795590 () Bool)

(declare-fun res!540108 () Bool)

(assert (=> b!795590 (=> (not res!540108) (not e!441560))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795590 (= res!540108 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21119 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20698 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21119 a!3170)) (= (select (arr!20698 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795591 () Bool)

(declare-fun res!540105 () Bool)

(assert (=> b!795591 (=> (not res!540105) (not e!441562))))

(declare-fun arrayContainsKey!0 (array!43236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795591 (= res!540105 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795592 () Bool)

(declare-fun res!540113 () Bool)

(assert (=> b!795592 (=> (not res!540113) (not e!441560))))

(declare-datatypes ((List!14661 0))(
  ( (Nil!14658) (Cons!14657 (h!15786 (_ BitVec 64)) (t!20976 List!14661)) )
))
(declare-fun arrayNoDuplicates!0 (array!43236 (_ BitVec 32) List!14661) Bool)

(assert (=> b!795592 (= res!540113 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14658))))

(declare-fun b!795593 () Bool)

(declare-fun res!540109 () Bool)

(assert (=> b!795593 (=> (not res!540109) (not e!441562))))

(assert (=> b!795593 (= res!540109 (and (= (size!21119 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21119 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21119 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795594 () Bool)

(declare-fun lt!354648 () SeekEntryResult!8289)

(declare-fun lt!354650 () SeekEntryResult!8289)

(assert (=> b!795594 (= e!441561 (and (= lt!354648 lt!354650) (= lt!354650 (Found!8289 j!153)) (= (select (arr!20698 a!3170) index!1236) (select (arr!20698 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!795594 (= lt!354650 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20698 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795594 (= lt!354648 (seekEntryOrOpen!0 (select (arr!20698 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68446 res!540107) b!795593))

(assert (= (and b!795593 res!540109) b!795585))

(assert (= (and b!795585 res!540104) b!795589))

(assert (= (and b!795589 res!540106) b!795591))

(assert (= (and b!795591 res!540105) b!795588))

(assert (= (and b!795588 res!540112) b!795587))

(assert (= (and b!795587 res!540111) b!795592))

(assert (= (and b!795592 res!540113) b!795590))

(assert (= (and b!795590 res!540108) b!795586))

(assert (= (and b!795586 res!540110) b!795594))

(declare-fun m!736247 () Bool)

(assert (=> b!795590 m!736247))

(declare-fun m!736249 () Bool)

(assert (=> b!795590 m!736249))

(declare-fun m!736251 () Bool)

(assert (=> b!795592 m!736251))

(declare-fun m!736253 () Bool)

(assert (=> b!795589 m!736253))

(declare-fun m!736255 () Bool)

(assert (=> b!795585 m!736255))

(assert (=> b!795585 m!736255))

(declare-fun m!736257 () Bool)

(assert (=> b!795585 m!736257))

(declare-fun m!736259 () Bool)

(assert (=> start!68446 m!736259))

(declare-fun m!736261 () Bool)

(assert (=> start!68446 m!736261))

(declare-fun m!736263 () Bool)

(assert (=> b!795586 m!736263))

(declare-fun m!736265 () Bool)

(assert (=> b!795586 m!736265))

(declare-fun m!736267 () Bool)

(assert (=> b!795586 m!736267))

(declare-fun m!736269 () Bool)

(assert (=> b!795586 m!736269))

(declare-fun m!736271 () Bool)

(assert (=> b!795591 m!736271))

(declare-fun m!736273 () Bool)

(assert (=> b!795594 m!736273))

(assert (=> b!795594 m!736255))

(assert (=> b!795594 m!736255))

(declare-fun m!736275 () Bool)

(assert (=> b!795594 m!736275))

(assert (=> b!795594 m!736255))

(declare-fun m!736277 () Bool)

(assert (=> b!795594 m!736277))

(declare-fun m!736279 () Bool)

(assert (=> b!795588 m!736279))

(declare-fun m!736281 () Bool)

(assert (=> b!795587 m!736281))

(check-sat (not b!795587) (not b!795585) (not b!795594) (not start!68446) (not b!795589) (not b!795591) (not b!795592) (not b!795588) (not b!795586))
(check-sat)
