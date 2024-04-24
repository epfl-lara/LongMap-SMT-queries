; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68616 () Bool)

(assert start!68616)

(declare-fun b!796964 () Bool)

(declare-fun e!442299 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796964 (= e!442299 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-datatypes ((SeekEntryResult!8263 0))(
  ( (MissingZero!8263 (index!35420 (_ BitVec 32))) (Found!8263 (index!35421 (_ BitVec 32))) (Intermediate!8263 (undefined!9075 Bool) (index!35422 (_ BitVec 32)) (x!66488 (_ BitVec 32))) (Undefined!8263) (MissingVacant!8263 (index!35423 (_ BitVec 32))) )
))
(declare-fun lt!355326 () SeekEntryResult!8263)

(assert (=> b!796964 (= lt!355326 (Found!8263 index!1236))))

(declare-fun b!796965 () Bool)

(declare-fun res!541111 () Bool)

(declare-fun e!442297 () Bool)

(assert (=> b!796965 (=> (not res!541111) (not e!442297))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796965 (= res!541111 (validKeyInArray!0 k0!2044))))

(declare-fun b!796966 () Bool)

(declare-fun res!541115 () Bool)

(declare-fun e!442298 () Bool)

(assert (=> b!796966 (=> (not res!541115) (not e!442298))))

(declare-datatypes ((array!43280 0))(
  ( (array!43281 (arr!20716 (Array (_ BitVec 32) (_ BitVec 64))) (size!21136 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43280)

(declare-datatypes ((List!14586 0))(
  ( (Nil!14583) (Cons!14582 (h!15717 (_ BitVec 64)) (t!20893 List!14586)) )
))
(declare-fun arrayNoDuplicates!0 (array!43280 (_ BitVec 32) List!14586) Bool)

(assert (=> b!796966 (= res!541115 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14583))))

(declare-fun b!796967 () Bool)

(declare-fun res!541114 () Bool)

(assert (=> b!796967 (=> (not res!541114) (not e!442297))))

(declare-fun arrayContainsKey!0 (array!43280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796967 (= res!541114 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!541116 () Bool)

(assert (=> start!68616 (=> (not res!541116) (not e!442297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68616 (= res!541116 (validMask!0 mask!3266))))

(assert (=> start!68616 e!442297))

(assert (=> start!68616 true))

(declare-fun array_inv!16575 (array!43280) Bool)

(assert (=> start!68616 (array_inv!16575 a!3170)))

(declare-fun b!796968 () Bool)

(declare-fun res!541110 () Bool)

(assert (=> b!796968 (=> (not res!541110) (not e!442298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43280 (_ BitVec 32)) Bool)

(assert (=> b!796968 (= res!541110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796969 () Bool)

(declare-fun res!541119 () Bool)

(assert (=> b!796969 (=> (not res!541119) (not e!442297))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796969 (= res!541119 (and (= (size!21136 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21136 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21136 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796970 () Bool)

(assert (=> b!796970 (= e!442297 e!442298)))

(declare-fun res!541109 () Bool)

(assert (=> b!796970 (=> (not res!541109) (not e!442298))))

(declare-fun lt!355324 () SeekEntryResult!8263)

(assert (=> b!796970 (= res!541109 (or (= lt!355324 (MissingZero!8263 i!1163)) (= lt!355324 (MissingVacant!8263 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43280 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!796970 (= lt!355324 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796971 () Bool)

(declare-fun res!541118 () Bool)

(assert (=> b!796971 (=> (not res!541118) (not e!442298))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796971 (= res!541118 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21136 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20716 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21136 a!3170)) (= (select (arr!20716 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796972 () Bool)

(declare-fun e!442296 () Bool)

(assert (=> b!796972 (= e!442296 e!442299)))

(declare-fun res!541113 () Bool)

(assert (=> b!796972 (=> (not res!541113) (not e!442299))))

(declare-fun lt!355325 () SeekEntryResult!8263)

(declare-fun lt!355321 () SeekEntryResult!8263)

(assert (=> b!796972 (= res!541113 (and (= lt!355321 lt!355325) (= lt!355325 (Found!8263 j!153)) (= (select (arr!20716 a!3170) index!1236) (select (arr!20716 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43280 (_ BitVec 32)) SeekEntryResult!8263)

(assert (=> b!796972 (= lt!355325 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20716 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796972 (= lt!355321 (seekEntryOrOpen!0 (select (arr!20716 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796973 () Bool)

(declare-fun res!541117 () Bool)

(assert (=> b!796973 (=> (not res!541117) (not e!442297))))

(assert (=> b!796973 (= res!541117 (validKeyInArray!0 (select (arr!20716 a!3170) j!153)))))

(declare-fun b!796974 () Bool)

(assert (=> b!796974 (= e!442298 e!442296)))

(declare-fun res!541112 () Bool)

(assert (=> b!796974 (=> (not res!541112) (not e!442296))))

(declare-fun lt!355322 () SeekEntryResult!8263)

(assert (=> b!796974 (= res!541112 (= lt!355322 lt!355326))))

(declare-fun lt!355323 () array!43280)

(declare-fun lt!355327 () (_ BitVec 64))

(assert (=> b!796974 (= lt!355326 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355327 lt!355323 mask!3266))))

(assert (=> b!796974 (= lt!355322 (seekEntryOrOpen!0 lt!355327 lt!355323 mask!3266))))

(assert (=> b!796974 (= lt!355327 (select (store (arr!20716 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796974 (= lt!355323 (array!43281 (store (arr!20716 a!3170) i!1163 k0!2044) (size!21136 a!3170)))))

(assert (= (and start!68616 res!541116) b!796969))

(assert (= (and b!796969 res!541119) b!796973))

(assert (= (and b!796973 res!541117) b!796965))

(assert (= (and b!796965 res!541111) b!796967))

(assert (= (and b!796967 res!541114) b!796970))

(assert (= (and b!796970 res!541109) b!796968))

(assert (= (and b!796968 res!541110) b!796966))

(assert (= (and b!796966 res!541115) b!796971))

(assert (= (and b!796971 res!541118) b!796974))

(assert (= (and b!796974 res!541112) b!796972))

(assert (= (and b!796972 res!541113) b!796964))

(declare-fun m!738167 () Bool)

(assert (=> b!796974 m!738167))

(declare-fun m!738169 () Bool)

(assert (=> b!796974 m!738169))

(declare-fun m!738171 () Bool)

(assert (=> b!796974 m!738171))

(declare-fun m!738173 () Bool)

(assert (=> b!796974 m!738173))

(declare-fun m!738175 () Bool)

(assert (=> start!68616 m!738175))

(declare-fun m!738177 () Bool)

(assert (=> start!68616 m!738177))

(declare-fun m!738179 () Bool)

(assert (=> b!796972 m!738179))

(declare-fun m!738181 () Bool)

(assert (=> b!796972 m!738181))

(assert (=> b!796972 m!738181))

(declare-fun m!738183 () Bool)

(assert (=> b!796972 m!738183))

(assert (=> b!796972 m!738181))

(declare-fun m!738185 () Bool)

(assert (=> b!796972 m!738185))

(assert (=> b!796973 m!738181))

(assert (=> b!796973 m!738181))

(declare-fun m!738187 () Bool)

(assert (=> b!796973 m!738187))

(declare-fun m!738189 () Bool)

(assert (=> b!796968 m!738189))

(declare-fun m!738191 () Bool)

(assert (=> b!796967 m!738191))

(declare-fun m!738193 () Bool)

(assert (=> b!796965 m!738193))

(declare-fun m!738195 () Bool)

(assert (=> b!796971 m!738195))

(declare-fun m!738197 () Bool)

(assert (=> b!796971 m!738197))

(declare-fun m!738199 () Bool)

(assert (=> b!796966 m!738199))

(declare-fun m!738201 () Bool)

(assert (=> b!796970 m!738201))

(check-sat (not b!796965) (not b!796967) (not start!68616) (not b!796968) (not b!796966) (not b!796973) (not b!796972) (not b!796974) (not b!796970))
(check-sat)
