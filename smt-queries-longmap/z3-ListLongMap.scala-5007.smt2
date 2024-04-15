; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68532 () Bool)

(assert start!68532)

(declare-fun b!797082 () Bool)

(declare-fun res!541752 () Bool)

(declare-fun e!442204 () Bool)

(assert (=> b!797082 (=> (not res!541752) (not e!442204))))

(declare-datatypes ((array!43339 0))(
  ( (array!43340 (arr!20750 (Array (_ BitVec 32) (_ BitVec 64))) (size!21171 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43339)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797082 (= res!541752 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797083 () Bool)

(declare-fun res!541745 () Bool)

(assert (=> b!797083 (=> (not res!541745) (not e!442204))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!797083 (= res!541745 (and (= (size!21171 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21171 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21171 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797084 () Bool)

(declare-fun res!541751 () Bool)

(assert (=> b!797084 (=> (not res!541751) (not e!442204))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797084 (= res!541751 (validKeyInArray!0 (select (arr!20750 a!3170) j!153)))))

(declare-fun b!797086 () Bool)

(declare-fun e!442201 () Bool)

(declare-fun e!442203 () Bool)

(assert (=> b!797086 (= e!442201 e!442203)))

(declare-fun res!541750 () Bool)

(assert (=> b!797086 (=> (not res!541750) (not e!442203))))

(declare-datatypes ((SeekEntryResult!8338 0))(
  ( (MissingZero!8338 (index!35720 (_ BitVec 32))) (Found!8338 (index!35721 (_ BitVec 32))) (Intermediate!8338 (undefined!9150 Bool) (index!35722 (_ BitVec 32)) (x!66627 (_ BitVec 32))) (Undefined!8338) (MissingVacant!8338 (index!35723 (_ BitVec 32))) )
))
(declare-fun lt!355463 () SeekEntryResult!8338)

(declare-fun lt!355466 () SeekEntryResult!8338)

(assert (=> b!797086 (= res!541750 (= lt!355463 lt!355466))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355462 () array!43339)

(declare-fun lt!355459 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43339 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!797086 (= lt!355466 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355459 lt!355462 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43339 (_ BitVec 32)) SeekEntryResult!8338)

(assert (=> b!797086 (= lt!355463 (seekEntryOrOpen!0 lt!355459 lt!355462 mask!3266))))

(assert (=> b!797086 (= lt!355459 (select (store (arr!20750 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797086 (= lt!355462 (array!43340 (store (arr!20750 a!3170) i!1163 k0!2044) (size!21171 a!3170)))))

(declare-fun b!797087 () Bool)

(declare-fun lt!355465 () SeekEntryResult!8338)

(declare-fun e!442199 () Bool)

(assert (=> b!797087 (= e!442199 (not (or (not (= lt!355466 lt!355465)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797087 (= lt!355466 (Found!8338 index!1236))))

(declare-fun b!797088 () Bool)

(assert (=> b!797088 (= e!442204 e!442201)))

(declare-fun res!541746 () Bool)

(assert (=> b!797088 (=> (not res!541746) (not e!442201))))

(declare-fun lt!355461 () SeekEntryResult!8338)

(assert (=> b!797088 (= res!541746 (or (= lt!355461 (MissingZero!8338 i!1163)) (= lt!355461 (MissingVacant!8338 i!1163))))))

(assert (=> b!797088 (= lt!355461 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797089 () Bool)

(declare-fun res!541743 () Bool)

(assert (=> b!797089 (=> (not res!541743) (not e!442201))))

(declare-datatypes ((List!14752 0))(
  ( (Nil!14749) (Cons!14748 (h!15877 (_ BitVec 64)) (t!21058 List!14752)) )
))
(declare-fun arrayNoDuplicates!0 (array!43339 (_ BitVec 32) List!14752) Bool)

(assert (=> b!797089 (= res!541743 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14749))))

(declare-fun b!797090 () Bool)

(declare-fun e!442202 () Bool)

(assert (=> b!797090 (= e!442203 e!442202)))

(declare-fun res!541747 () Bool)

(assert (=> b!797090 (=> (not res!541747) (not e!442202))))

(declare-fun lt!355464 () SeekEntryResult!8338)

(declare-fun lt!355460 () SeekEntryResult!8338)

(assert (=> b!797090 (= res!541747 (= lt!355464 lt!355460))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797090 (= lt!355460 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20750 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797090 (= lt!355464 (seekEntryOrOpen!0 (select (arr!20750 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797091 () Bool)

(assert (=> b!797091 (= e!442202 e!442199)))

(declare-fun res!541749 () Bool)

(assert (=> b!797091 (=> (not res!541749) (not e!442199))))

(assert (=> b!797091 (= res!541749 (and (= lt!355460 lt!355465) (= (select (arr!20750 a!3170) index!1236) (select (arr!20750 a!3170) j!153))))))

(assert (=> b!797091 (= lt!355465 (Found!8338 j!153))))

(declare-fun b!797092 () Bool)

(declare-fun res!541744 () Bool)

(assert (=> b!797092 (=> (not res!541744) (not e!442201))))

(assert (=> b!797092 (= res!541744 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21171 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20750 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21171 a!3170)) (= (select (arr!20750 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797093 () Bool)

(declare-fun res!541741 () Bool)

(assert (=> b!797093 (=> (not res!541741) (not e!442201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43339 (_ BitVec 32)) Bool)

(assert (=> b!797093 (= res!541741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!541742 () Bool)

(assert (=> start!68532 (=> (not res!541742) (not e!442204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68532 (= res!541742 (validMask!0 mask!3266))))

(assert (=> start!68532 e!442204))

(assert (=> start!68532 true))

(declare-fun array_inv!16633 (array!43339) Bool)

(assert (=> start!68532 (array_inv!16633 a!3170)))

(declare-fun b!797085 () Bool)

(declare-fun res!541748 () Bool)

(assert (=> b!797085 (=> (not res!541748) (not e!442204))))

(assert (=> b!797085 (= res!541748 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68532 res!541742) b!797083))

(assert (= (and b!797083 res!541745) b!797084))

(assert (= (and b!797084 res!541751) b!797085))

(assert (= (and b!797085 res!541748) b!797082))

(assert (= (and b!797082 res!541752) b!797088))

(assert (= (and b!797088 res!541746) b!797093))

(assert (= (and b!797093 res!541741) b!797089))

(assert (= (and b!797089 res!541743) b!797092))

(assert (= (and b!797092 res!541744) b!797086))

(assert (= (and b!797086 res!541750) b!797090))

(assert (= (and b!797090 res!541747) b!797091))

(assert (= (and b!797091 res!541749) b!797087))

(declare-fun m!737443 () Bool)

(assert (=> start!68532 m!737443))

(declare-fun m!737445 () Bool)

(assert (=> start!68532 m!737445))

(declare-fun m!737447 () Bool)

(assert (=> b!797090 m!737447))

(assert (=> b!797090 m!737447))

(declare-fun m!737449 () Bool)

(assert (=> b!797090 m!737449))

(assert (=> b!797090 m!737447))

(declare-fun m!737451 () Bool)

(assert (=> b!797090 m!737451))

(declare-fun m!737453 () Bool)

(assert (=> b!797085 m!737453))

(declare-fun m!737455 () Bool)

(assert (=> b!797088 m!737455))

(assert (=> b!797084 m!737447))

(assert (=> b!797084 m!737447))

(declare-fun m!737457 () Bool)

(assert (=> b!797084 m!737457))

(declare-fun m!737459 () Bool)

(assert (=> b!797089 m!737459))

(declare-fun m!737461 () Bool)

(assert (=> b!797091 m!737461))

(assert (=> b!797091 m!737447))

(declare-fun m!737463 () Bool)

(assert (=> b!797082 m!737463))

(declare-fun m!737465 () Bool)

(assert (=> b!797086 m!737465))

(declare-fun m!737467 () Bool)

(assert (=> b!797086 m!737467))

(declare-fun m!737469 () Bool)

(assert (=> b!797086 m!737469))

(declare-fun m!737471 () Bool)

(assert (=> b!797086 m!737471))

(declare-fun m!737473 () Bool)

(assert (=> b!797093 m!737473))

(declare-fun m!737475 () Bool)

(assert (=> b!797092 m!737475))

(declare-fun m!737477 () Bool)

(assert (=> b!797092 m!737477))

(check-sat (not b!797085) (not b!797082) (not b!797093) (not b!797086) (not b!797084) (not start!68532) (not b!797088) (not b!797089) (not b!797090))
(check-sat)
