; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68458 () Bool)

(assert start!68458)

(declare-fun b!795765 () Bool)

(declare-fun res!540286 () Bool)

(declare-fun e!441632 () Bool)

(assert (=> b!795765 (=> (not res!540286) (not e!441632))))

(declare-datatypes ((array!43248 0))(
  ( (array!43249 (arr!20704 (Array (_ BitVec 32) (_ BitVec 64))) (size!21125 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43248)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795765 (= res!540286 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795766 () Bool)

(declare-fun res!540289 () Bool)

(assert (=> b!795766 (=> (not res!540289) (not e!441632))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!795766 (= res!540289 (and (= (size!21125 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21125 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21125 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795767 () Bool)

(declare-fun res!540285 () Bool)

(assert (=> b!795767 (=> (not res!540285) (not e!441632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795767 (= res!540285 (validKeyInArray!0 (select (arr!20704 a!3170) j!153)))))

(declare-fun b!795768 () Bool)

(declare-fun res!540292 () Bool)

(declare-fun e!441634 () Bool)

(assert (=> b!795768 (=> (not res!540292) (not e!441634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43248 (_ BitVec 32)) Bool)

(assert (=> b!795768 (= res!540292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!540290 () Bool)

(assert (=> start!68458 (=> (not res!540290) (not e!441632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68458 (= res!540290 (validMask!0 mask!3266))))

(assert (=> start!68458 e!441632))

(assert (=> start!68458 true))

(declare-fun array_inv!16500 (array!43248) Bool)

(assert (=> start!68458 (array_inv!16500 a!3170)))

(declare-fun b!795769 () Bool)

(declare-fun res!540293 () Bool)

(assert (=> b!795769 (=> (not res!540293) (not e!441632))))

(assert (=> b!795769 (= res!540293 (validKeyInArray!0 k0!2044))))

(declare-fun b!795770 () Bool)

(declare-fun e!441635 () Bool)

(assert (=> b!795770 (= e!441634 e!441635)))

(declare-fun res!540284 () Bool)

(assert (=> b!795770 (=> (not res!540284) (not e!441635))))

(declare-fun lt!354738 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354736 () array!43248)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8295 0))(
  ( (MissingZero!8295 (index!35548 (_ BitVec 32))) (Found!8295 (index!35549 (_ BitVec 32))) (Intermediate!8295 (undefined!9107 Bool) (index!35550 (_ BitVec 32)) (x!66461 (_ BitVec 32))) (Undefined!8295) (MissingVacant!8295 (index!35551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43248 (_ BitVec 32)) SeekEntryResult!8295)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43248 (_ BitVec 32)) SeekEntryResult!8295)

(assert (=> b!795770 (= res!540284 (= (seekEntryOrOpen!0 lt!354738 lt!354736 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354738 lt!354736 mask!3266)))))

(assert (=> b!795770 (= lt!354738 (select (store (arr!20704 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795770 (= lt!354736 (array!43249 (store (arr!20704 a!3170) i!1163 k0!2044) (size!21125 a!3170)))))

(declare-fun b!795771 () Bool)

(declare-fun res!540288 () Bool)

(assert (=> b!795771 (=> (not res!540288) (not e!441634))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795771 (= res!540288 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21125 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20704 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21125 a!3170)) (= (select (arr!20704 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795772 () Bool)

(declare-fun res!540291 () Bool)

(assert (=> b!795772 (=> (not res!540291) (not e!441634))))

(declare-datatypes ((List!14667 0))(
  ( (Nil!14664) (Cons!14663 (h!15792 (_ BitVec 64)) (t!20982 List!14667)) )
))
(declare-fun arrayNoDuplicates!0 (array!43248 (_ BitVec 32) List!14667) Bool)

(assert (=> b!795772 (= res!540291 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14664))))

(declare-fun b!795773 () Bool)

(assert (=> b!795773 (= e!441632 e!441634)))

(declare-fun res!540287 () Bool)

(assert (=> b!795773 (=> (not res!540287) (not e!441634))))

(declare-fun lt!354740 () SeekEntryResult!8295)

(assert (=> b!795773 (= res!540287 (or (= lt!354740 (MissingZero!8295 i!1163)) (= lt!354740 (MissingVacant!8295 i!1163))))))

(assert (=> b!795773 (= lt!354740 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun lt!354739 () SeekEntryResult!8295)

(declare-fun b!795774 () Bool)

(declare-fun lt!354737 () SeekEntryResult!8295)

(assert (=> b!795774 (= e!441635 (and (= lt!354737 lt!354739) (= lt!354739 (Found!8295 j!153)) (= (select (arr!20704 a!3170) index!1236) (select (arr!20704 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!795774 (= lt!354739 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20704 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795774 (= lt!354737 (seekEntryOrOpen!0 (select (arr!20704 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68458 res!540290) b!795766))

(assert (= (and b!795766 res!540289) b!795767))

(assert (= (and b!795767 res!540285) b!795769))

(assert (= (and b!795769 res!540293) b!795765))

(assert (= (and b!795765 res!540286) b!795773))

(assert (= (and b!795773 res!540287) b!795768))

(assert (= (and b!795768 res!540292) b!795772))

(assert (= (and b!795772 res!540291) b!795771))

(assert (= (and b!795771 res!540288) b!795770))

(assert (= (and b!795770 res!540284) b!795774))

(declare-fun m!736457 () Bool)

(assert (=> b!795773 m!736457))

(declare-fun m!736459 () Bool)

(assert (=> b!795768 m!736459))

(declare-fun m!736461 () Bool)

(assert (=> start!68458 m!736461))

(declare-fun m!736463 () Bool)

(assert (=> start!68458 m!736463))

(declare-fun m!736465 () Bool)

(assert (=> b!795774 m!736465))

(declare-fun m!736467 () Bool)

(assert (=> b!795774 m!736467))

(assert (=> b!795774 m!736467))

(declare-fun m!736469 () Bool)

(assert (=> b!795774 m!736469))

(assert (=> b!795774 m!736467))

(declare-fun m!736471 () Bool)

(assert (=> b!795774 m!736471))

(declare-fun m!736473 () Bool)

(assert (=> b!795765 m!736473))

(declare-fun m!736475 () Bool)

(assert (=> b!795772 m!736475))

(assert (=> b!795767 m!736467))

(assert (=> b!795767 m!736467))

(declare-fun m!736477 () Bool)

(assert (=> b!795767 m!736477))

(declare-fun m!736479 () Bool)

(assert (=> b!795770 m!736479))

(declare-fun m!736481 () Bool)

(assert (=> b!795770 m!736481))

(declare-fun m!736483 () Bool)

(assert (=> b!795770 m!736483))

(declare-fun m!736485 () Bool)

(assert (=> b!795770 m!736485))

(declare-fun m!736487 () Bool)

(assert (=> b!795769 m!736487))

(declare-fun m!736489 () Bool)

(assert (=> b!795771 m!736489))

(declare-fun m!736491 () Bool)

(assert (=> b!795771 m!736491))

(check-sat (not b!795770) (not b!795767) (not b!795769) (not b!795774) (not b!795765) (not b!795772) (not b!795773) (not b!795768) (not start!68458))
(check-sat)
