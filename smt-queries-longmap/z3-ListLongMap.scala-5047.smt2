; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68772 () Bool)

(assert start!68772)

(declare-fun b!801499 () Bool)

(declare-fun e!444241 () Bool)

(declare-fun e!444242 () Bool)

(assert (=> b!801499 (= e!444241 e!444242)))

(declare-fun res!546162 () Bool)

(assert (=> b!801499 (=> (not res!546162) (not e!444242))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358175 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43579 0))(
  ( (array!43580 (arr!20870 (Array (_ BitVec 32) (_ BitVec 64))) (size!21291 (_ BitVec 32))) )
))
(declare-fun lt!358181 () array!43579)

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8458 0))(
  ( (MissingZero!8458 (index!36200 (_ BitVec 32))) (Found!8458 (index!36201 (_ BitVec 32))) (Intermediate!8458 (undefined!9270 Bool) (index!36202 (_ BitVec 32)) (x!67067 (_ BitVec 32))) (Undefined!8458) (MissingVacant!8458 (index!36203 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43579 (_ BitVec 32)) SeekEntryResult!8458)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43579 (_ BitVec 32)) SeekEntryResult!8458)

(assert (=> b!801499 (= res!546162 (= (seekEntryOrOpen!0 lt!358175 lt!358181 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358175 lt!358181 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43579)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!801499 (= lt!358175 (select (store (arr!20870 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801499 (= lt!358181 (array!43580 (store (arr!20870 a!3170) i!1163 k0!2044) (size!21291 a!3170)))))

(declare-fun b!801500 () Bool)

(declare-fun res!546160 () Bool)

(assert (=> b!801500 (=> (not res!546160) (not e!444241))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801500 (= res!546160 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21291 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20870 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21291 a!3170)) (= (select (arr!20870 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801501 () Bool)

(declare-fun e!444244 () Bool)

(assert (=> b!801501 (= e!444244 (not (bvsge mask!3266 #b00000000000000000000000000000000)))))

(declare-fun lt!358177 () (_ BitVec 32))

(assert (=> b!801501 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358177 vacantAfter!23 lt!358175 lt!358181 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358177 vacantBefore!23 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27430 0))(
  ( (Unit!27431) )
))
(declare-fun lt!358179 () Unit!27430)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43579 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27430)

(assert (=> b!801501 (= lt!358179 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358177 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801501 (= lt!358177 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801502 () Bool)

(declare-fun res!546168 () Bool)

(assert (=> b!801502 (=> (not res!546168) (not e!444241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43579 (_ BitVec 32)) Bool)

(assert (=> b!801502 (= res!546168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801503 () Bool)

(declare-fun e!444240 () Bool)

(assert (=> b!801503 (= e!444240 e!444241)))

(declare-fun res!546164 () Bool)

(assert (=> b!801503 (=> (not res!546164) (not e!444241))))

(declare-fun lt!358178 () SeekEntryResult!8458)

(assert (=> b!801503 (= res!546164 (or (= lt!358178 (MissingZero!8458 i!1163)) (= lt!358178 (MissingVacant!8458 i!1163))))))

(assert (=> b!801503 (= lt!358178 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801505 () Bool)

(declare-fun res!546163 () Bool)

(assert (=> b!801505 (=> (not res!546163) (not e!444240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801505 (= res!546163 (validKeyInArray!0 (select (arr!20870 a!3170) j!153)))))

(declare-fun b!801506 () Bool)

(declare-fun res!546167 () Bool)

(assert (=> b!801506 (=> (not res!546167) (not e!444240))))

(assert (=> b!801506 (= res!546167 (and (= (size!21291 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21291 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21291 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801507 () Bool)

(declare-fun res!546166 () Bool)

(assert (=> b!801507 (=> (not res!546166) (not e!444241))))

(declare-datatypes ((List!14872 0))(
  ( (Nil!14869) (Cons!14868 (h!15997 (_ BitVec 64)) (t!21178 List!14872)) )
))
(declare-fun arrayNoDuplicates!0 (array!43579 (_ BitVec 32) List!14872) Bool)

(assert (=> b!801507 (= res!546166 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14869))))

(declare-fun b!801508 () Bool)

(assert (=> b!801508 (= e!444242 e!444244)))

(declare-fun res!546165 () Bool)

(assert (=> b!801508 (=> (not res!546165) (not e!444244))))

(declare-fun lt!358176 () SeekEntryResult!8458)

(declare-fun lt!358180 () SeekEntryResult!8458)

(assert (=> b!801508 (= res!546165 (and (= lt!358180 lt!358176) (= lt!358176 (Found!8458 j!153)) (not (= (select (arr!20870 a!3170) index!1236) (select (arr!20870 a!3170) j!153)))))))

(assert (=> b!801508 (= lt!358176 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801508 (= lt!358180 (seekEntryOrOpen!0 (select (arr!20870 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801509 () Bool)

(declare-fun res!546161 () Bool)

(assert (=> b!801509 (=> (not res!546161) (not e!444240))))

(assert (=> b!801509 (= res!546161 (validKeyInArray!0 k0!2044))))

(declare-fun res!546158 () Bool)

(assert (=> start!68772 (=> (not res!546158) (not e!444240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68772 (= res!546158 (validMask!0 mask!3266))))

(assert (=> start!68772 e!444240))

(assert (=> start!68772 true))

(declare-fun array_inv!16753 (array!43579) Bool)

(assert (=> start!68772 (array_inv!16753 a!3170)))

(declare-fun b!801504 () Bool)

(declare-fun res!546159 () Bool)

(assert (=> b!801504 (=> (not res!546159) (not e!444240))))

(declare-fun arrayContainsKey!0 (array!43579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801504 (= res!546159 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68772 res!546158) b!801506))

(assert (= (and b!801506 res!546167) b!801505))

(assert (= (and b!801505 res!546163) b!801509))

(assert (= (and b!801509 res!546161) b!801504))

(assert (= (and b!801504 res!546159) b!801503))

(assert (= (and b!801503 res!546164) b!801502))

(assert (= (and b!801502 res!546168) b!801507))

(assert (= (and b!801507 res!546166) b!801500))

(assert (= (and b!801500 res!546160) b!801499))

(assert (= (and b!801499 res!546162) b!801508))

(assert (= (and b!801508 res!546165) b!801501))

(declare-fun m!742225 () Bool)

(assert (=> b!801502 m!742225))

(declare-fun m!742227 () Bool)

(assert (=> b!801500 m!742227))

(declare-fun m!742229 () Bool)

(assert (=> b!801500 m!742229))

(declare-fun m!742231 () Bool)

(assert (=> b!801507 m!742231))

(declare-fun m!742233 () Bool)

(assert (=> b!801509 m!742233))

(declare-fun m!742235 () Bool)

(assert (=> b!801499 m!742235))

(declare-fun m!742237 () Bool)

(assert (=> b!801499 m!742237))

(declare-fun m!742239 () Bool)

(assert (=> b!801499 m!742239))

(declare-fun m!742241 () Bool)

(assert (=> b!801499 m!742241))

(declare-fun m!742243 () Bool)

(assert (=> b!801504 m!742243))

(declare-fun m!742245 () Bool)

(assert (=> start!68772 m!742245))

(declare-fun m!742247 () Bool)

(assert (=> start!68772 m!742247))

(declare-fun m!742249 () Bool)

(assert (=> b!801508 m!742249))

(declare-fun m!742251 () Bool)

(assert (=> b!801508 m!742251))

(assert (=> b!801508 m!742251))

(declare-fun m!742253 () Bool)

(assert (=> b!801508 m!742253))

(assert (=> b!801508 m!742251))

(declare-fun m!742255 () Bool)

(assert (=> b!801508 m!742255))

(assert (=> b!801501 m!742251))

(declare-fun m!742257 () Bool)

(assert (=> b!801501 m!742257))

(declare-fun m!742259 () Bool)

(assert (=> b!801501 m!742259))

(assert (=> b!801501 m!742251))

(declare-fun m!742261 () Bool)

(assert (=> b!801501 m!742261))

(declare-fun m!742263 () Bool)

(assert (=> b!801501 m!742263))

(assert (=> b!801505 m!742251))

(assert (=> b!801505 m!742251))

(declare-fun m!742265 () Bool)

(assert (=> b!801505 m!742265))

(declare-fun m!742267 () Bool)

(assert (=> b!801503 m!742267))

(check-sat (not b!801501) (not b!801504) (not b!801508) (not b!801503) (not b!801507) (not start!68772) (not b!801505) (not b!801509) (not b!801502) (not b!801499))
(check-sat)
