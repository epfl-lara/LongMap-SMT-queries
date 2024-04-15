; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68496 () Bool)

(assert start!68496)

(declare-fun b!796462 () Bool)

(declare-fun res!541126 () Bool)

(declare-fun e!441904 () Bool)

(assert (=> b!796462 (=> (not res!541126) (not e!441904))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43303 0))(
  ( (array!43304 (arr!20732 (Array (_ BitVec 32) (_ BitVec 64))) (size!21153 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43303)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796462 (= res!541126 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21153 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20732 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21153 a!3170)) (= (select (arr!20732 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796463 () Bool)

(declare-fun e!441905 () Bool)

(assert (=> b!796463 (= e!441904 e!441905)))

(declare-fun res!541131 () Bool)

(assert (=> b!796463 (=> (not res!541131) (not e!441905))))

(declare-datatypes ((SeekEntryResult!8320 0))(
  ( (MissingZero!8320 (index!35648 (_ BitVec 32))) (Found!8320 (index!35649 (_ BitVec 32))) (Intermediate!8320 (undefined!9132 Bool) (index!35650 (_ BitVec 32)) (x!66561 (_ BitVec 32))) (Undefined!8320) (MissingVacant!8320 (index!35651 (_ BitVec 32))) )
))
(declare-fun lt!355064 () SeekEntryResult!8320)

(declare-fun lt!355067 () SeekEntryResult!8320)

(assert (=> b!796463 (= res!541131 (= lt!355064 lt!355067))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!355061 () (_ BitVec 64))

(declare-fun lt!355066 () array!43303)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43303 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!796463 (= lt!355067 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355061 lt!355066 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43303 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!796463 (= lt!355064 (seekEntryOrOpen!0 lt!355061 lt!355066 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796463 (= lt!355061 (select (store (arr!20732 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796463 (= lt!355066 (array!43304 (store (arr!20732 a!3170) i!1163 k0!2044) (size!21153 a!3170)))))

(declare-fun b!796464 () Bool)

(declare-fun e!441907 () Bool)

(declare-fun e!441903 () Bool)

(assert (=> b!796464 (= e!441907 (not e!441903))))

(declare-fun res!541123 () Bool)

(assert (=> b!796464 (=> res!541123 e!441903)))

(assert (=> b!796464 (= res!541123 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20732 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!796464 (= lt!355067 (Found!8320 index!1236))))

(declare-fun b!796465 () Bool)

(declare-fun res!541124 () Bool)

(declare-fun e!441902 () Bool)

(assert (=> b!796465 (=> (not res!541124) (not e!441902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796465 (= res!541124 (validKeyInArray!0 (select (arr!20732 a!3170) j!153)))))

(declare-fun b!796466 () Bool)

(assert (=> b!796466 (= e!441905 e!441907)))

(declare-fun res!541120 () Bool)

(assert (=> b!796466 (=> (not res!541120) (not e!441907))))

(declare-fun lt!355063 () SeekEntryResult!8320)

(declare-fun lt!355062 () SeekEntryResult!8320)

(assert (=> b!796466 (= res!541120 (and (= lt!355063 lt!355062) (= lt!355062 (Found!8320 j!153)) (= (select (arr!20732 a!3170) index!1236) (select (arr!20732 a!3170) j!153))))))

(assert (=> b!796466 (= lt!355062 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20732 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796466 (= lt!355063 (seekEntryOrOpen!0 (select (arr!20732 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796467 () Bool)

(assert (=> b!796467 (= e!441902 e!441904)))

(declare-fun res!541129 () Bool)

(assert (=> b!796467 (=> (not res!541129) (not e!441904))))

(declare-fun lt!355065 () SeekEntryResult!8320)

(assert (=> b!796467 (= res!541129 (or (= lt!355065 (MissingZero!8320 i!1163)) (= lt!355065 (MissingVacant!8320 i!1163))))))

(assert (=> b!796467 (= lt!355065 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796468 () Bool)

(declare-fun res!541121 () Bool)

(assert (=> b!796468 (=> (not res!541121) (not e!441904))))

(declare-datatypes ((List!14734 0))(
  ( (Nil!14731) (Cons!14730 (h!15859 (_ BitVec 64)) (t!21040 List!14734)) )
))
(declare-fun arrayNoDuplicates!0 (array!43303 (_ BitVec 32) List!14734) Bool)

(assert (=> b!796468 (= res!541121 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14731))))

(declare-fun b!796469 () Bool)

(declare-fun res!541122 () Bool)

(assert (=> b!796469 (=> (not res!541122) (not e!441902))))

(assert (=> b!796469 (= res!541122 (and (= (size!21153 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21153 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21153 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796470 () Bool)

(declare-fun res!541128 () Bool)

(assert (=> b!796470 (=> (not res!541128) (not e!441902))))

(declare-fun arrayContainsKey!0 (array!43303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796470 (= res!541128 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796461 () Bool)

(declare-fun res!541125 () Bool)

(assert (=> b!796461 (=> (not res!541125) (not e!441902))))

(assert (=> b!796461 (= res!541125 (validKeyInArray!0 k0!2044))))

(declare-fun res!541127 () Bool)

(assert (=> start!68496 (=> (not res!541127) (not e!441902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68496 (= res!541127 (validMask!0 mask!3266))))

(assert (=> start!68496 e!441902))

(assert (=> start!68496 true))

(declare-fun array_inv!16615 (array!43303) Bool)

(assert (=> start!68496 (array_inv!16615 a!3170)))

(declare-fun b!796471 () Bool)

(assert (=> b!796471 (= e!441903 (validKeyInArray!0 lt!355061))))

(declare-fun b!796472 () Bool)

(declare-fun res!541130 () Bool)

(assert (=> b!796472 (=> (not res!541130) (not e!441904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43303 (_ BitVec 32)) Bool)

(assert (=> b!796472 (= res!541130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68496 res!541127) b!796469))

(assert (= (and b!796469 res!541122) b!796465))

(assert (= (and b!796465 res!541124) b!796461))

(assert (= (and b!796461 res!541125) b!796470))

(assert (= (and b!796470 res!541128) b!796467))

(assert (= (and b!796467 res!541129) b!796472))

(assert (= (and b!796472 res!541130) b!796468))

(assert (= (and b!796468 res!541121) b!796462))

(assert (= (and b!796462 res!541126) b!796463))

(assert (= (and b!796463 res!541131) b!796466))

(assert (= (and b!796466 res!541120) b!796464))

(assert (= (and b!796464 (not res!541123)) b!796471))

(declare-fun m!736783 () Bool)

(assert (=> b!796468 m!736783))

(declare-fun m!736785 () Bool)

(assert (=> b!796466 m!736785))

(declare-fun m!736787 () Bool)

(assert (=> b!796466 m!736787))

(assert (=> b!796466 m!736787))

(declare-fun m!736789 () Bool)

(assert (=> b!796466 m!736789))

(assert (=> b!796466 m!736787))

(declare-fun m!736791 () Bool)

(assert (=> b!796466 m!736791))

(declare-fun m!736793 () Bool)

(assert (=> b!796463 m!736793))

(declare-fun m!736795 () Bool)

(assert (=> b!796463 m!736795))

(declare-fun m!736797 () Bool)

(assert (=> b!796463 m!736797))

(declare-fun m!736799 () Bool)

(assert (=> b!796463 m!736799))

(declare-fun m!736801 () Bool)

(assert (=> b!796462 m!736801))

(declare-fun m!736803 () Bool)

(assert (=> b!796462 m!736803))

(assert (=> b!796464 m!736797))

(declare-fun m!736805 () Bool)

(assert (=> b!796464 m!736805))

(assert (=> b!796465 m!736787))

(assert (=> b!796465 m!736787))

(declare-fun m!736807 () Bool)

(assert (=> b!796465 m!736807))

(declare-fun m!736809 () Bool)

(assert (=> b!796471 m!736809))

(declare-fun m!736811 () Bool)

(assert (=> b!796467 m!736811))

(declare-fun m!736813 () Bool)

(assert (=> b!796461 m!736813))

(declare-fun m!736815 () Bool)

(assert (=> b!796472 m!736815))

(declare-fun m!736817 () Bool)

(assert (=> b!796470 m!736817))

(declare-fun m!736819 () Bool)

(assert (=> start!68496 m!736819))

(declare-fun m!736821 () Bool)

(assert (=> start!68496 m!736821))

(check-sat (not b!796463) (not b!796471) (not b!796468) (not b!796461) (not b!796466) (not b!796465) (not b!796467) (not start!68496) (not b!796472) (not b!796470))
(check-sat)
