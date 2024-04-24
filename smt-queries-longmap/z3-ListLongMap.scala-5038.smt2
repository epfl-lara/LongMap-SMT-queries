; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68906 () Bool)

(assert start!68906)

(declare-fun b!801606 () Bool)

(declare-fun res!545580 () Bool)

(declare-fun e!444495 () Bool)

(assert (=> b!801606 (=> (not res!545580) (not e!444495))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801606 (= res!545580 (validKeyInArray!0 k0!2044))))

(declare-fun b!801607 () Bool)

(declare-fun res!545582 () Bool)

(assert (=> b!801607 (=> (not res!545582) (not e!444495))))

(declare-datatypes ((array!43528 0))(
  ( (array!43529 (arr!20839 (Array (_ BitVec 32) (_ BitVec 64))) (size!21259 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43528)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801607 (= res!545582 (validKeyInArray!0 (select (arr!20839 a!3170) j!153)))))

(declare-fun b!801608 () Bool)

(declare-fun res!545584 () Bool)

(declare-fun e!444494 () Bool)

(assert (=> b!801608 (=> (not res!545584) (not e!444494))))

(declare-datatypes ((List!14709 0))(
  ( (Nil!14706) (Cons!14705 (h!15840 (_ BitVec 64)) (t!21016 List!14709)) )
))
(declare-fun arrayNoDuplicates!0 (array!43528 (_ BitVec 32) List!14709) Bool)

(assert (=> b!801608 (= res!545584 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14706))))

(declare-fun b!801609 () Bool)

(assert (=> b!801609 (= e!444495 e!444494)))

(declare-fun res!545586 () Bool)

(assert (=> b!801609 (=> (not res!545586) (not e!444494))))

(declare-datatypes ((SeekEntryResult!8386 0))(
  ( (MissingZero!8386 (index!35912 (_ BitVec 32))) (Found!8386 (index!35913 (_ BitVec 32))) (Intermediate!8386 (undefined!9198 Bool) (index!35914 (_ BitVec 32)) (x!66942 (_ BitVec 32))) (Undefined!8386) (MissingVacant!8386 (index!35915 (_ BitVec 32))) )
))
(declare-fun lt!358136 () SeekEntryResult!8386)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801609 (= res!545586 (or (= lt!358136 (MissingZero!8386 i!1163)) (= lt!358136 (MissingVacant!8386 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43528 (_ BitVec 32)) SeekEntryResult!8386)

(assert (=> b!801609 (= lt!358136 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801610 () Bool)

(declare-fun res!545589 () Bool)

(assert (=> b!801610 (=> (not res!545589) (not e!444494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43528 (_ BitVec 32)) Bool)

(assert (=> b!801610 (= res!545589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801611 () Bool)

(declare-fun e!444492 () Bool)

(declare-fun e!444493 () Bool)

(assert (=> b!801611 (= e!444492 e!444493)))

(declare-fun res!545579 () Bool)

(assert (=> b!801611 (=> (not res!545579) (not e!444493))))

(declare-fun lt!358135 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!801611 (= res!545579 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358135 #b00000000000000000000000000000000) (bvslt lt!358135 (size!21259 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801611 (= lt!358135 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801612 () Bool)

(declare-fun e!444496 () Bool)

(assert (=> b!801612 (= e!444494 e!444496)))

(declare-fun res!545587 () Bool)

(assert (=> b!801612 (=> (not res!545587) (not e!444496))))

(declare-fun lt!358138 () SeekEntryResult!8386)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358141 () (_ BitVec 64))

(declare-fun lt!358140 () array!43528)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43528 (_ BitVec 32)) SeekEntryResult!8386)

(assert (=> b!801612 (= res!545587 (= lt!358138 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358141 lt!358140 mask!3266)))))

(assert (=> b!801612 (= lt!358138 (seekEntryOrOpen!0 lt!358141 lt!358140 mask!3266))))

(assert (=> b!801612 (= lt!358141 (select (store (arr!20839 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801612 (= lt!358140 (array!43529 (store (arr!20839 a!3170) i!1163 k0!2044) (size!21259 a!3170)))))

(declare-fun b!801613 () Bool)

(declare-fun res!545577 () Bool)

(assert (=> b!801613 (=> (not res!545577) (not e!444493))))

(assert (=> b!801613 (= res!545577 (= lt!358138 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358135 vacantAfter!23 lt!358141 lt!358140 mask!3266)))))

(declare-fun b!801614 () Bool)

(declare-fun res!545583 () Bool)

(assert (=> b!801614 (=> (not res!545583) (not e!444495))))

(assert (=> b!801614 (= res!545583 (and (= (size!21259 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21259 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21259 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801615 () Bool)

(assert (=> b!801615 (= e!444496 e!444492)))

(declare-fun res!545588 () Bool)

(assert (=> b!801615 (=> (not res!545588) (not e!444492))))

(declare-fun lt!358139 () SeekEntryResult!8386)

(declare-fun lt!358137 () SeekEntryResult!8386)

(assert (=> b!801615 (= res!545588 (and (= lt!358139 lt!358137) (= lt!358137 (Found!8386 j!153)) (not (= (select (arr!20839 a!3170) index!1236) (select (arr!20839 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801615 (= lt!358137 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801615 (= lt!358139 (seekEntryOrOpen!0 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801616 () Bool)

(declare-fun res!545581 () Bool)

(assert (=> b!801616 (=> (not res!545581) (not e!444495))))

(declare-fun arrayContainsKey!0 (array!43528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801616 (= res!545581 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801618 () Bool)

(assert (=> b!801618 (= e!444493 false)))

(declare-fun lt!358142 () SeekEntryResult!8386)

(assert (=> b!801618 (= lt!358142 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358135 vacantBefore!23 (select (arr!20839 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!545578 () Bool)

(assert (=> start!68906 (=> (not res!545578) (not e!444495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68906 (= res!545578 (validMask!0 mask!3266))))

(assert (=> start!68906 e!444495))

(assert (=> start!68906 true))

(declare-fun array_inv!16698 (array!43528) Bool)

(assert (=> start!68906 (array_inv!16698 a!3170)))

(declare-fun b!801617 () Bool)

(declare-fun res!545585 () Bool)

(assert (=> b!801617 (=> (not res!545585) (not e!444494))))

(assert (=> b!801617 (= res!545585 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21259 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20839 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21259 a!3170)) (= (select (arr!20839 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68906 res!545578) b!801614))

(assert (= (and b!801614 res!545583) b!801607))

(assert (= (and b!801607 res!545582) b!801606))

(assert (= (and b!801606 res!545580) b!801616))

(assert (= (and b!801616 res!545581) b!801609))

(assert (= (and b!801609 res!545586) b!801610))

(assert (= (and b!801610 res!545589) b!801608))

(assert (= (and b!801608 res!545584) b!801617))

(assert (= (and b!801617 res!545585) b!801612))

(assert (= (and b!801612 res!545587) b!801615))

(assert (= (and b!801615 res!545588) b!801611))

(assert (= (and b!801611 res!545579) b!801613))

(assert (= (and b!801613 res!545577) b!801618))

(declare-fun m!743083 () Bool)

(assert (=> b!801610 m!743083))

(declare-fun m!743085 () Bool)

(assert (=> b!801617 m!743085))

(declare-fun m!743087 () Bool)

(assert (=> b!801617 m!743087))

(declare-fun m!743089 () Bool)

(assert (=> b!801611 m!743089))

(declare-fun m!743091 () Bool)

(assert (=> b!801606 m!743091))

(declare-fun m!743093 () Bool)

(assert (=> b!801616 m!743093))

(declare-fun m!743095 () Bool)

(assert (=> b!801607 m!743095))

(assert (=> b!801607 m!743095))

(declare-fun m!743097 () Bool)

(assert (=> b!801607 m!743097))

(declare-fun m!743099 () Bool)

(assert (=> b!801608 m!743099))

(declare-fun m!743101 () Bool)

(assert (=> b!801615 m!743101))

(assert (=> b!801615 m!743095))

(assert (=> b!801615 m!743095))

(declare-fun m!743103 () Bool)

(assert (=> b!801615 m!743103))

(assert (=> b!801615 m!743095))

(declare-fun m!743105 () Bool)

(assert (=> b!801615 m!743105))

(declare-fun m!743107 () Bool)

(assert (=> start!68906 m!743107))

(declare-fun m!743109 () Bool)

(assert (=> start!68906 m!743109))

(declare-fun m!743111 () Bool)

(assert (=> b!801613 m!743111))

(declare-fun m!743113 () Bool)

(assert (=> b!801612 m!743113))

(declare-fun m!743115 () Bool)

(assert (=> b!801612 m!743115))

(declare-fun m!743117 () Bool)

(assert (=> b!801612 m!743117))

(declare-fun m!743119 () Bool)

(assert (=> b!801612 m!743119))

(declare-fun m!743121 () Bool)

(assert (=> b!801609 m!743121))

(assert (=> b!801618 m!743095))

(assert (=> b!801618 m!743095))

(declare-fun m!743123 () Bool)

(assert (=> b!801618 m!743123))

(check-sat (not b!801615) (not b!801611) (not b!801616) (not b!801613) (not b!801608) (not b!801618) (not b!801607) (not start!68906) (not b!801612) (not b!801610) (not b!801609) (not b!801606))
(check-sat)
