; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68996 () Bool)

(assert start!68996)

(declare-fun b!803233 () Bool)

(declare-fun e!445242 () Bool)

(declare-fun e!445240 () Bool)

(assert (=> b!803233 (= e!445242 e!445240)))

(declare-fun res!547210 () Bool)

(assert (=> b!803233 (=> (not res!547210) (not e!445240))))

(declare-datatypes ((array!43618 0))(
  ( (array!43619 (arr!20884 (Array (_ BitVec 32) (_ BitVec 64))) (size!21304 (_ BitVec 32))) )
))
(declare-fun lt!359156 () array!43618)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!359154 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8431 0))(
  ( (MissingZero!8431 (index!36092 (_ BitVec 32))) (Found!8431 (index!36093 (_ BitVec 32))) (Intermediate!8431 (undefined!9243 Bool) (index!36094 (_ BitVec 32)) (x!67107 (_ BitVec 32))) (Undefined!8431) (MissingVacant!8431 (index!36095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43618 (_ BitVec 32)) SeekEntryResult!8431)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43618 (_ BitVec 32)) SeekEntryResult!8431)

(assert (=> b!803233 (= res!547210 (= (seekEntryOrOpen!0 lt!359154 lt!359156 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359154 lt!359156 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43618)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803233 (= lt!359154 (select (store (arr!20884 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803233 (= lt!359156 (array!43619 (store (arr!20884 a!3170) i!1163 k0!2044) (size!21304 a!3170)))))

(declare-fun b!803234 () Bool)

(declare-fun res!547206 () Bool)

(declare-fun e!445243 () Bool)

(assert (=> b!803234 (=> (not res!547206) (not e!445243))))

(declare-fun arrayContainsKey!0 (array!43618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803234 (= res!547206 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803235 () Bool)

(declare-fun res!547209 () Bool)

(assert (=> b!803235 (=> (not res!547209) (not e!445243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803235 (= res!547209 (validKeyInArray!0 k0!2044))))

(declare-fun b!803236 () Bool)

(declare-fun res!547207 () Bool)

(assert (=> b!803236 (=> (not res!547207) (not e!445242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43618 (_ BitVec 32)) Bool)

(assert (=> b!803236 (= res!547207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803237 () Bool)

(declare-fun e!445241 () Bool)

(assert (=> b!803237 (= e!445240 e!445241)))

(declare-fun res!547204 () Bool)

(assert (=> b!803237 (=> (not res!547204) (not e!445241))))

(declare-fun lt!359152 () SeekEntryResult!8431)

(declare-fun lt!359150 () SeekEntryResult!8431)

(assert (=> b!803237 (= res!547204 (and (= lt!359150 lt!359152) (= lt!359152 (Found!8431 j!153)) (not (= (select (arr!20884 a!3170) index!1236) (select (arr!20884 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803237 (= lt!359152 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803237 (= lt!359150 (seekEntryOrOpen!0 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803238 () Bool)

(assert (=> b!803238 (= e!445243 e!445242)))

(declare-fun res!547213 () Bool)

(assert (=> b!803238 (=> (not res!547213) (not e!445242))))

(declare-fun lt!359151 () SeekEntryResult!8431)

(assert (=> b!803238 (= res!547213 (or (= lt!359151 (MissingZero!8431 i!1163)) (= lt!359151 (MissingVacant!8431 i!1163))))))

(assert (=> b!803238 (= lt!359151 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803239 () Bool)

(declare-fun e!445238 () Bool)

(assert (=> b!803239 (= e!445241 (not e!445238))))

(declare-fun res!547212 () Bool)

(assert (=> b!803239 (=> res!547212 e!445238)))

(assert (=> b!803239 (= res!547212 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20884 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359155 () (_ BitVec 32))

(assert (=> b!803239 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359155 vacantAfter!23 lt!359154 lt!359156 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359155 vacantBefore!23 (select (arr!20884 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27487 0))(
  ( (Unit!27488) )
))
(declare-fun lt!359153 () Unit!27487)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43618 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27487)

(assert (=> b!803239 (= lt!359153 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359155 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803239 (= lt!359155 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!803240 () Bool)

(assert (=> b!803240 (= e!445238 (validKeyInArray!0 lt!359154))))

(declare-fun res!547214 () Bool)

(assert (=> start!68996 (=> (not res!547214) (not e!445243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68996 (= res!547214 (validMask!0 mask!3266))))

(assert (=> start!68996 e!445243))

(assert (=> start!68996 true))

(declare-fun array_inv!16743 (array!43618) Bool)

(assert (=> start!68996 (array_inv!16743 a!3170)))

(declare-fun b!803241 () Bool)

(declare-fun res!547211 () Bool)

(assert (=> b!803241 (=> (not res!547211) (not e!445243))))

(assert (=> b!803241 (= res!547211 (validKeyInArray!0 (select (arr!20884 a!3170) j!153)))))

(declare-fun b!803242 () Bool)

(declare-fun res!547215 () Bool)

(assert (=> b!803242 (=> (not res!547215) (not e!445243))))

(assert (=> b!803242 (= res!547215 (and (= (size!21304 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21304 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21304 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803243 () Bool)

(declare-fun res!547205 () Bool)

(assert (=> b!803243 (=> (not res!547205) (not e!445242))))

(assert (=> b!803243 (= res!547205 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21304 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20884 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21304 a!3170)) (= (select (arr!20884 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803244 () Bool)

(declare-fun res!547208 () Bool)

(assert (=> b!803244 (=> (not res!547208) (not e!445242))))

(declare-datatypes ((List!14754 0))(
  ( (Nil!14751) (Cons!14750 (h!15885 (_ BitVec 64)) (t!21061 List!14754)) )
))
(declare-fun arrayNoDuplicates!0 (array!43618 (_ BitVec 32) List!14754) Bool)

(assert (=> b!803244 (= res!547208 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14751))))

(assert (= (and start!68996 res!547214) b!803242))

(assert (= (and b!803242 res!547215) b!803241))

(assert (= (and b!803241 res!547211) b!803235))

(assert (= (and b!803235 res!547209) b!803234))

(assert (= (and b!803234 res!547206) b!803238))

(assert (= (and b!803238 res!547213) b!803236))

(assert (= (and b!803236 res!547207) b!803244))

(assert (= (and b!803244 res!547208) b!803243))

(assert (= (and b!803243 res!547205) b!803233))

(assert (= (and b!803233 res!547210) b!803237))

(assert (= (and b!803237 res!547204) b!803239))

(assert (= (and b!803239 (not res!547212)) b!803240))

(declare-fun m!745021 () Bool)

(assert (=> b!803235 m!745021))

(declare-fun m!745023 () Bool)

(assert (=> b!803240 m!745023))

(declare-fun m!745025 () Bool)

(assert (=> b!803239 m!745025))

(declare-fun m!745027 () Bool)

(assert (=> b!803239 m!745027))

(declare-fun m!745029 () Bool)

(assert (=> b!803239 m!745029))

(declare-fun m!745031 () Bool)

(assert (=> b!803239 m!745031))

(assert (=> b!803239 m!745025))

(declare-fun m!745033 () Bool)

(assert (=> b!803239 m!745033))

(declare-fun m!745035 () Bool)

(assert (=> b!803239 m!745035))

(declare-fun m!745037 () Bool)

(assert (=> b!803239 m!745037))

(declare-fun m!745039 () Bool)

(assert (=> b!803243 m!745039))

(declare-fun m!745041 () Bool)

(assert (=> b!803243 m!745041))

(declare-fun m!745043 () Bool)

(assert (=> b!803238 m!745043))

(declare-fun m!745045 () Bool)

(assert (=> b!803233 m!745045))

(declare-fun m!745047 () Bool)

(assert (=> b!803233 m!745047))

(assert (=> b!803233 m!745037))

(declare-fun m!745049 () Bool)

(assert (=> b!803233 m!745049))

(declare-fun m!745051 () Bool)

(assert (=> start!68996 m!745051))

(declare-fun m!745053 () Bool)

(assert (=> start!68996 m!745053))

(declare-fun m!745055 () Bool)

(assert (=> b!803237 m!745055))

(assert (=> b!803237 m!745025))

(assert (=> b!803237 m!745025))

(declare-fun m!745057 () Bool)

(assert (=> b!803237 m!745057))

(assert (=> b!803237 m!745025))

(declare-fun m!745059 () Bool)

(assert (=> b!803237 m!745059))

(declare-fun m!745061 () Bool)

(assert (=> b!803234 m!745061))

(declare-fun m!745063 () Bool)

(assert (=> b!803244 m!745063))

(assert (=> b!803241 m!745025))

(assert (=> b!803241 m!745025))

(declare-fun m!745065 () Bool)

(assert (=> b!803241 m!745065))

(declare-fun m!745067 () Bool)

(assert (=> b!803236 m!745067))

(check-sat (not b!803235) (not b!803234) (not b!803239) (not b!803244) (not b!803240) (not b!803236) (not b!803233) (not start!68996) (not b!803241) (not b!803237) (not b!803238))
(check-sat)
