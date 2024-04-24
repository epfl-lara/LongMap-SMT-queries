; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68682 () Bool)

(assert start!68682)

(declare-fun b!798091 () Bool)

(declare-fun res!542244 () Bool)

(declare-fun e!442832 () Bool)

(assert (=> b!798091 (=> (not res!542244) (not e!442832))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43346 0))(
  ( (array!43347 (arr!20749 (Array (_ BitVec 32) (_ BitVec 64))) (size!21169 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43346)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798091 (= res!542244 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21169 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20749 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21169 a!3170)) (= (select (arr!20749 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798092 () Bool)

(declare-fun e!442833 () Bool)

(assert (=> b!798092 (= e!442832 e!442833)))

(declare-fun res!542239 () Bool)

(assert (=> b!798092 (=> (not res!542239) (not e!442833))))

(declare-datatypes ((SeekEntryResult!8296 0))(
  ( (MissingZero!8296 (index!35552 (_ BitVec 32))) (Found!8296 (index!35553 (_ BitVec 32))) (Intermediate!8296 (undefined!9108 Bool) (index!35554 (_ BitVec 32)) (x!66609 (_ BitVec 32))) (Undefined!8296) (MissingVacant!8296 (index!35555 (_ BitVec 32))) )
))
(declare-fun lt!356049 () SeekEntryResult!8296)

(declare-fun lt!356048 () SeekEntryResult!8296)

(assert (=> b!798092 (= res!542239 (= lt!356049 lt!356048))))

(declare-fun lt!356046 () (_ BitVec 64))

(declare-fun lt!356047 () array!43346)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43346 (_ BitVec 32)) SeekEntryResult!8296)

(assert (=> b!798092 (= lt!356048 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356046 lt!356047 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43346 (_ BitVec 32)) SeekEntryResult!8296)

(assert (=> b!798092 (= lt!356049 (seekEntryOrOpen!0 lt!356046 lt!356047 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798092 (= lt!356046 (select (store (arr!20749 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798092 (= lt!356047 (array!43347 (store (arr!20749 a!3170) i!1163 k0!2044) (size!21169 a!3170)))))

(declare-fun res!542241 () Bool)

(declare-fun e!442830 () Bool)

(assert (=> start!68682 (=> (not res!542241) (not e!442830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68682 (= res!542241 (validMask!0 mask!3266))))

(assert (=> start!68682 e!442830))

(assert (=> start!68682 true))

(declare-fun array_inv!16608 (array!43346) Bool)

(assert (=> start!68682 (array_inv!16608 a!3170)))

(declare-fun b!798093 () Bool)

(declare-fun res!542247 () Bool)

(assert (=> b!798093 (=> (not res!542247) (not e!442832))))

(declare-datatypes ((List!14619 0))(
  ( (Nil!14616) (Cons!14615 (h!15750 (_ BitVec 64)) (t!20926 List!14619)) )
))
(declare-fun arrayNoDuplicates!0 (array!43346 (_ BitVec 32) List!14619) Bool)

(assert (=> b!798093 (= res!542247 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14616))))

(declare-fun b!798094 () Bool)

(declare-fun res!542236 () Bool)

(assert (=> b!798094 (=> (not res!542236) (not e!442830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798094 (= res!542236 (validKeyInArray!0 (select (arr!20749 a!3170) j!153)))))

(declare-fun b!798095 () Bool)

(declare-fun res!542242 () Bool)

(assert (=> b!798095 (=> (not res!542242) (not e!442830))))

(assert (=> b!798095 (= res!542242 (validKeyInArray!0 k0!2044))))

(declare-fun b!798096 () Bool)

(declare-fun e!442831 () Bool)

(declare-fun lt!356050 () SeekEntryResult!8296)

(assert (=> b!798096 (= e!442831 (not (or (not (= lt!356048 lt!356050)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20749 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!798096 (= lt!356048 (Found!8296 index!1236))))

(declare-fun b!798097 () Bool)

(declare-fun res!542240 () Bool)

(assert (=> b!798097 (=> (not res!542240) (not e!442832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43346 (_ BitVec 32)) Bool)

(assert (=> b!798097 (= res!542240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798098 () Bool)

(declare-fun res!542245 () Bool)

(assert (=> b!798098 (=> (not res!542245) (not e!442830))))

(declare-fun arrayContainsKey!0 (array!43346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798098 (= res!542245 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798099 () Bool)

(declare-fun res!542237 () Bool)

(assert (=> b!798099 (=> (not res!542237) (not e!442830))))

(assert (=> b!798099 (= res!542237 (and (= (size!21169 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21169 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21169 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798100 () Bool)

(assert (=> b!798100 (= e!442830 e!442832)))

(declare-fun res!542243 () Bool)

(assert (=> b!798100 (=> (not res!542243) (not e!442832))))

(declare-fun lt!356044 () SeekEntryResult!8296)

(assert (=> b!798100 (= res!542243 (or (= lt!356044 (MissingZero!8296 i!1163)) (= lt!356044 (MissingVacant!8296 i!1163))))))

(assert (=> b!798100 (= lt!356044 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798101 () Bool)

(declare-fun e!442834 () Bool)

(assert (=> b!798101 (= e!442833 e!442834)))

(declare-fun res!542238 () Bool)

(assert (=> b!798101 (=> (not res!542238) (not e!442834))))

(declare-fun lt!356043 () SeekEntryResult!8296)

(declare-fun lt!356045 () SeekEntryResult!8296)

(assert (=> b!798101 (= res!542238 (= lt!356043 lt!356045))))

(assert (=> b!798101 (= lt!356045 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20749 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798101 (= lt!356043 (seekEntryOrOpen!0 (select (arr!20749 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798102 () Bool)

(assert (=> b!798102 (= e!442834 e!442831)))

(declare-fun res!542246 () Bool)

(assert (=> b!798102 (=> (not res!542246) (not e!442831))))

(assert (=> b!798102 (= res!542246 (and (= lt!356045 lt!356050) (= (select (arr!20749 a!3170) index!1236) (select (arr!20749 a!3170) j!153))))))

(assert (=> b!798102 (= lt!356050 (Found!8296 j!153))))

(assert (= (and start!68682 res!542241) b!798099))

(assert (= (and b!798099 res!542237) b!798094))

(assert (= (and b!798094 res!542236) b!798095))

(assert (= (and b!798095 res!542242) b!798098))

(assert (= (and b!798098 res!542245) b!798100))

(assert (= (and b!798100 res!542243) b!798097))

(assert (= (and b!798097 res!542240) b!798093))

(assert (= (and b!798093 res!542247) b!798091))

(assert (= (and b!798091 res!542244) b!798092))

(assert (= (and b!798092 res!542239) b!798101))

(assert (= (and b!798101 res!542238) b!798102))

(assert (= (and b!798102 res!542246) b!798096))

(declare-fun m!739373 () Bool)

(assert (=> b!798096 m!739373))

(declare-fun m!739375 () Bool)

(assert (=> b!798096 m!739375))

(declare-fun m!739377 () Bool)

(assert (=> b!798094 m!739377))

(assert (=> b!798094 m!739377))

(declare-fun m!739379 () Bool)

(assert (=> b!798094 m!739379))

(declare-fun m!739381 () Bool)

(assert (=> b!798102 m!739381))

(assert (=> b!798102 m!739377))

(declare-fun m!739383 () Bool)

(assert (=> b!798091 m!739383))

(declare-fun m!739385 () Bool)

(assert (=> b!798091 m!739385))

(declare-fun m!739387 () Bool)

(assert (=> b!798098 m!739387))

(declare-fun m!739389 () Bool)

(assert (=> start!68682 m!739389))

(declare-fun m!739391 () Bool)

(assert (=> start!68682 m!739391))

(declare-fun m!739393 () Bool)

(assert (=> b!798095 m!739393))

(declare-fun m!739395 () Bool)

(assert (=> b!798093 m!739395))

(declare-fun m!739397 () Bool)

(assert (=> b!798100 m!739397))

(declare-fun m!739399 () Bool)

(assert (=> b!798097 m!739399))

(declare-fun m!739401 () Bool)

(assert (=> b!798092 m!739401))

(declare-fun m!739403 () Bool)

(assert (=> b!798092 m!739403))

(assert (=> b!798092 m!739373))

(declare-fun m!739405 () Bool)

(assert (=> b!798092 m!739405))

(assert (=> b!798101 m!739377))

(assert (=> b!798101 m!739377))

(declare-fun m!739407 () Bool)

(assert (=> b!798101 m!739407))

(assert (=> b!798101 m!739377))

(declare-fun m!739409 () Bool)

(assert (=> b!798101 m!739409))

(check-sat (not b!798100) (not b!798095) (not b!798092) (not b!798101) (not b!798098) (not b!798093) (not start!68682) (not b!798097) (not b!798094))
(check-sat)
