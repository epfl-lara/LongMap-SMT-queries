; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130822 () Bool)

(assert start!130822)

(declare-fun b!1534238 () Bool)

(declare-fun res!1051327 () Bool)

(declare-fun e!854446 () Bool)

(assert (=> b!1534238 (=> (not res!1051327) (not e!854446))))

(declare-datatypes ((array!101920 0))(
  ( (array!101921 (arr!49176 (Array (_ BitVec 32) (_ BitVec 64))) (size!49726 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101920)

(declare-datatypes ((List!35650 0))(
  ( (Nil!35647) (Cons!35646 (h!37091 (_ BitVec 64)) (t!50344 List!35650)) )
))
(declare-fun arrayNoDuplicates!0 (array!101920 (_ BitVec 32) List!35650) Bool)

(assert (=> b!1534238 (= res!1051327 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35647))))

(declare-fun b!1534239 () Bool)

(declare-fun res!1051330 () Bool)

(assert (=> b!1534239 (=> (not res!1051330) (not e!854446))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534239 (= res!1051330 (validKeyInArray!0 (select (arr!49176 a!2792) j!64)))))

(declare-fun b!1534240 () Bool)

(declare-fun res!1051324 () Bool)

(assert (=> b!1534240 (=> (not res!1051324) (not e!854446))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101920 (_ BitVec 32)) Bool)

(assert (=> b!1534240 (= res!1051324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534241 () Bool)

(declare-fun res!1051325 () Bool)

(assert (=> b!1534241 (=> (not res!1051325) (not e!854446))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534241 (= res!1051325 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49726 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49726 a!2792)) (= (select (arr!49176 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534242 () Bool)

(assert (=> b!1534242 (= e!854446 false)))

(declare-datatypes ((SeekEntryResult!13308 0))(
  ( (MissingZero!13308 (index!55627 (_ BitVec 32))) (Found!13308 (index!55628 (_ BitVec 32))) (Intermediate!13308 (undefined!14120 Bool) (index!55629 (_ BitVec 32)) (x!137390 (_ BitVec 32))) (Undefined!13308) (MissingVacant!13308 (index!55630 (_ BitVec 32))) )
))
(declare-fun lt!663853 () SeekEntryResult!13308)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101920 (_ BitVec 32)) SeekEntryResult!13308)

(assert (=> b!1534242 (= lt!663853 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49176 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534243 () Bool)

(declare-fun res!1051329 () Bool)

(assert (=> b!1534243 (=> (not res!1051329) (not e!854446))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534243 (= res!1051329 (and (= (size!49726 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49726 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49726 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534244 () Bool)

(declare-fun res!1051328 () Bool)

(assert (=> b!1534244 (=> (not res!1051328) (not e!854446))))

(assert (=> b!1534244 (= res!1051328 (validKeyInArray!0 (select (arr!49176 a!2792) i!951)))))

(declare-fun res!1051326 () Bool)

(assert (=> start!130822 (=> (not res!1051326) (not e!854446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130822 (= res!1051326 (validMask!0 mask!2480))))

(assert (=> start!130822 e!854446))

(assert (=> start!130822 true))

(declare-fun array_inv!38204 (array!101920) Bool)

(assert (=> start!130822 (array_inv!38204 a!2792)))

(assert (= (and start!130822 res!1051326) b!1534243))

(assert (= (and b!1534243 res!1051329) b!1534244))

(assert (= (and b!1534244 res!1051328) b!1534239))

(assert (= (and b!1534239 res!1051330) b!1534240))

(assert (= (and b!1534240 res!1051324) b!1534238))

(assert (= (and b!1534238 res!1051327) b!1534241))

(assert (= (and b!1534241 res!1051325) b!1534242))

(declare-fun m!1416905 () Bool)

(assert (=> start!130822 m!1416905))

(declare-fun m!1416907 () Bool)

(assert (=> start!130822 m!1416907))

(declare-fun m!1416909 () Bool)

(assert (=> b!1534241 m!1416909))

(declare-fun m!1416911 () Bool)

(assert (=> b!1534239 m!1416911))

(assert (=> b!1534239 m!1416911))

(declare-fun m!1416913 () Bool)

(assert (=> b!1534239 m!1416913))

(declare-fun m!1416915 () Bool)

(assert (=> b!1534240 m!1416915))

(assert (=> b!1534242 m!1416911))

(assert (=> b!1534242 m!1416911))

(declare-fun m!1416917 () Bool)

(assert (=> b!1534242 m!1416917))

(declare-fun m!1416919 () Bool)

(assert (=> b!1534238 m!1416919))

(declare-fun m!1416921 () Bool)

(assert (=> b!1534244 m!1416921))

(assert (=> b!1534244 m!1416921))

(declare-fun m!1416923 () Bool)

(assert (=> b!1534244 m!1416923))

(check-sat (not b!1534244) (not b!1534242) (not start!130822) (not b!1534239) (not b!1534238) (not b!1534240))
