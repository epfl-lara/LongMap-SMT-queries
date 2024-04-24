; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86818 () Bool)

(assert start!86818)

(declare-fun b!1005307 () Bool)

(declare-fun e!566249 () Bool)

(assert (=> b!1005307 (= e!566249 false)))

(declare-fun lt!444468 () (_ BitVec 32))

(declare-fun lt!444473 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9406 0))(
  ( (MissingZero!9406 (index!39995 (_ BitVec 32))) (Found!9406 (index!39996 (_ BitVec 32))) (Intermediate!9406 (undefined!10218 Bool) (index!39997 (_ BitVec 32)) (x!87558 (_ BitVec 32))) (Undefined!9406) (MissingVacant!9406 (index!39998 (_ BitVec 32))) )
))
(declare-fun lt!444467 () SeekEntryResult!9406)

(declare-datatypes ((array!63438 0))(
  ( (array!63439 (arr!30538 (Array (_ BitVec 32) (_ BitVec 64))) (size!31041 (_ BitVec 32))) )
))
(declare-fun lt!444466 () array!63438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63438 (_ BitVec 32)) SeekEntryResult!9406)

(assert (=> b!1005307 (= lt!444467 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444468 lt!444473 lt!444466 mask!3464))))

(declare-fun b!1005308 () Bool)

(declare-fun e!566248 () Bool)

(declare-fun e!566245 () Bool)

(assert (=> b!1005308 (= e!566248 e!566245)))

(declare-fun res!674036 () Bool)

(assert (=> b!1005308 (=> (not res!674036) (not e!566245))))

(declare-fun lt!444472 () SeekEntryResult!9406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005308 (= res!674036 (not (= lt!444472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444473 mask!3464) lt!444473 lt!444466 mask!3464))))))

(declare-fun a!3219 () array!63438)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1005308 (= lt!444473 (select (store (arr!30538 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005308 (= lt!444466 (array!63439 (store (arr!30538 a!3219) i!1194 k0!2224) (size!31041 a!3219)))))

(declare-fun b!1005309 () Bool)

(declare-fun res!674032 () Bool)

(assert (=> b!1005309 (=> (not res!674032) (not e!566245))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444469 () SeekEntryResult!9406)

(assert (=> b!1005309 (= res!674032 (not (= lt!444469 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444473 lt!444466 mask!3464))))))

(declare-fun b!1005310 () Bool)

(declare-fun res!674029 () Bool)

(declare-fun e!566244 () Bool)

(assert (=> b!1005310 (=> (not res!674029) (not e!566244))))

(declare-fun arrayContainsKey!0 (array!63438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005310 (= res!674029 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005311 () Bool)

(declare-fun res!674033 () Bool)

(assert (=> b!1005311 (=> (not res!674033) (not e!566244))))

(assert (=> b!1005311 (= res!674033 (and (= (size!31041 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31041 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31041 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005312 () Bool)

(declare-fun res!674026 () Bool)

(declare-fun e!566246 () Bool)

(assert (=> b!1005312 (=> (not res!674026) (not e!566246))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005312 (= res!674026 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31041 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31041 a!3219))))))

(declare-fun b!1005313 () Bool)

(declare-fun res!674030 () Bool)

(assert (=> b!1005313 (=> (not res!674030) (not e!566244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005313 (= res!674030 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005314 () Bool)

(declare-fun res!674037 () Bool)

(assert (=> b!1005314 (=> (not res!674037) (not e!566246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63438 (_ BitVec 32)) Bool)

(assert (=> b!1005314 (= res!674037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005315 () Bool)

(assert (=> b!1005315 (= e!566245 e!566249)))

(declare-fun res!674038 () Bool)

(assert (=> b!1005315 (=> (not res!674038) (not e!566249))))

(assert (=> b!1005315 (= res!674038 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444468 #b00000000000000000000000000000000) (bvslt lt!444468 (size!31041 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005315 (= lt!444468 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1005316 () Bool)

(assert (=> b!1005316 (= e!566244 e!566246)))

(declare-fun res!674034 () Bool)

(assert (=> b!1005316 (=> (not res!674034) (not e!566246))))

(declare-fun lt!444470 () SeekEntryResult!9406)

(assert (=> b!1005316 (= res!674034 (or (= lt!444470 (MissingVacant!9406 i!1194)) (= lt!444470 (MissingZero!9406 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63438 (_ BitVec 32)) SeekEntryResult!9406)

(assert (=> b!1005316 (= lt!444470 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005317 () Bool)

(declare-fun res!674027 () Bool)

(assert (=> b!1005317 (=> (not res!674027) (not e!566249))))

(declare-fun lt!444471 () SeekEntryResult!9406)

(assert (=> b!1005317 (= res!674027 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444468 (select (arr!30538 a!3219) j!170) a!3219 mask!3464) lt!444471))))

(declare-fun b!1005318 () Bool)

(declare-fun res!674024 () Bool)

(assert (=> b!1005318 (=> (not res!674024) (not e!566246))))

(declare-datatypes ((List!21185 0))(
  ( (Nil!21182) (Cons!21181 (h!22367 (_ BitVec 64)) (t!30178 List!21185)) )
))
(declare-fun arrayNoDuplicates!0 (array!63438 (_ BitVec 32) List!21185) Bool)

(assert (=> b!1005318 (= res!674024 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21182))))

(declare-fun b!1005319 () Bool)

(declare-fun res!674035 () Bool)

(assert (=> b!1005319 (=> (not res!674035) (not e!566244))))

(assert (=> b!1005319 (= res!674035 (validKeyInArray!0 (select (arr!30538 a!3219) j!170)))))

(declare-fun b!1005320 () Bool)

(declare-fun e!566247 () Bool)

(assert (=> b!1005320 (= e!566246 e!566247)))

(declare-fun res!674039 () Bool)

(assert (=> b!1005320 (=> (not res!674039) (not e!566247))))

(assert (=> b!1005320 (= res!674039 (= lt!444472 lt!444471))))

(assert (=> b!1005320 (= lt!444471 (Intermediate!9406 false resIndex!38 resX!38))))

(assert (=> b!1005320 (= lt!444472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30538 a!3219) j!170) mask!3464) (select (arr!30538 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005321 () Bool)

(assert (=> b!1005321 (= e!566247 e!566248)))

(declare-fun res!674031 () Bool)

(assert (=> b!1005321 (=> (not res!674031) (not e!566248))))

(assert (=> b!1005321 (= res!674031 (= lt!444469 lt!444471))))

(assert (=> b!1005321 (= lt!444469 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30538 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!674025 () Bool)

(assert (=> start!86818 (=> (not res!674025) (not e!566244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86818 (= res!674025 (validMask!0 mask!3464))))

(assert (=> start!86818 e!566244))

(declare-fun array_inv!23674 (array!63438) Bool)

(assert (=> start!86818 (array_inv!23674 a!3219)))

(assert (=> start!86818 true))

(declare-fun b!1005322 () Bool)

(declare-fun res!674028 () Bool)

(assert (=> b!1005322 (=> (not res!674028) (not e!566245))))

(assert (=> b!1005322 (= res!674028 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86818 res!674025) b!1005311))

(assert (= (and b!1005311 res!674033) b!1005319))

(assert (= (and b!1005319 res!674035) b!1005313))

(assert (= (and b!1005313 res!674030) b!1005310))

(assert (= (and b!1005310 res!674029) b!1005316))

(assert (= (and b!1005316 res!674034) b!1005314))

(assert (= (and b!1005314 res!674037) b!1005318))

(assert (= (and b!1005318 res!674024) b!1005312))

(assert (= (and b!1005312 res!674026) b!1005320))

(assert (= (and b!1005320 res!674039) b!1005321))

(assert (= (and b!1005321 res!674031) b!1005308))

(assert (= (and b!1005308 res!674036) b!1005309))

(assert (= (and b!1005309 res!674032) b!1005322))

(assert (= (and b!1005322 res!674028) b!1005315))

(assert (= (and b!1005315 res!674038) b!1005317))

(assert (= (and b!1005317 res!674027) b!1005307))

(declare-fun m!931193 () Bool)

(assert (=> b!1005314 m!931193))

(declare-fun m!931195 () Bool)

(assert (=> b!1005317 m!931195))

(assert (=> b!1005317 m!931195))

(declare-fun m!931197 () Bool)

(assert (=> b!1005317 m!931197))

(declare-fun m!931199 () Bool)

(assert (=> b!1005313 m!931199))

(assert (=> b!1005319 m!931195))

(assert (=> b!1005319 m!931195))

(declare-fun m!931201 () Bool)

(assert (=> b!1005319 m!931201))

(declare-fun m!931203 () Bool)

(assert (=> b!1005307 m!931203))

(assert (=> b!1005321 m!931195))

(assert (=> b!1005321 m!931195))

(declare-fun m!931205 () Bool)

(assert (=> b!1005321 m!931205))

(declare-fun m!931207 () Bool)

(assert (=> b!1005309 m!931207))

(declare-fun m!931209 () Bool)

(assert (=> b!1005315 m!931209))

(declare-fun m!931211 () Bool)

(assert (=> b!1005308 m!931211))

(assert (=> b!1005308 m!931211))

(declare-fun m!931213 () Bool)

(assert (=> b!1005308 m!931213))

(declare-fun m!931215 () Bool)

(assert (=> b!1005308 m!931215))

(declare-fun m!931217 () Bool)

(assert (=> b!1005308 m!931217))

(assert (=> b!1005320 m!931195))

(assert (=> b!1005320 m!931195))

(declare-fun m!931219 () Bool)

(assert (=> b!1005320 m!931219))

(assert (=> b!1005320 m!931219))

(assert (=> b!1005320 m!931195))

(declare-fun m!931221 () Bool)

(assert (=> b!1005320 m!931221))

(declare-fun m!931223 () Bool)

(assert (=> b!1005310 m!931223))

(declare-fun m!931225 () Bool)

(assert (=> start!86818 m!931225))

(declare-fun m!931227 () Bool)

(assert (=> start!86818 m!931227))

(declare-fun m!931229 () Bool)

(assert (=> b!1005318 m!931229))

(declare-fun m!931231 () Bool)

(assert (=> b!1005316 m!931231))

(check-sat (not start!86818) (not b!1005309) (not b!1005320) (not b!1005319) (not b!1005315) (not b!1005316) (not b!1005317) (not b!1005318) (not b!1005314) (not b!1005313) (not b!1005321) (not b!1005307) (not b!1005308) (not b!1005310))
(check-sat)
