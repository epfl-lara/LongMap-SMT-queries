; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123760 () Bool)

(assert start!123760)

(declare-fun res!966350 () Bool)

(declare-fun e!809263 () Bool)

(assert (=> start!123760 (=> (not res!966350) (not e!809263))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123760 (= res!966350 (validMask!0 mask!2608))))

(assert (=> start!123760 e!809263))

(assert (=> start!123760 true))

(declare-datatypes ((array!97613 0))(
  ( (array!97614 (arr!47110 (Array (_ BitVec 32) (_ BitVec 64))) (size!47661 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97613)

(declare-fun array_inv!36391 (array!97613) Bool)

(assert (=> start!123760 (array_inv!36391 a!2831)))

(declare-fun b!1433312 () Bool)

(declare-fun e!809264 () Bool)

(declare-fun e!809267 () Bool)

(assert (=> b!1433312 (= e!809264 e!809267)))

(declare-fun res!966349 () Bool)

(assert (=> b!1433312 (=> (not res!966349) (not e!809267))))

(declare-fun lt!630879 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11291 0))(
  ( (MissingZero!11291 (index!47556 (_ BitVec 32))) (Found!11291 (index!47557 (_ BitVec 32))) (Intermediate!11291 (undefined!12103 Bool) (index!47558 (_ BitVec 32)) (x!129365 (_ BitVec 32))) (Undefined!11291) (MissingVacant!11291 (index!47559 (_ BitVec 32))) )
))
(declare-fun lt!630881 () SeekEntryResult!11291)

(declare-fun lt!630882 () array!97613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97613 (_ BitVec 32)) SeekEntryResult!11291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433312 (= res!966349 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630879 mask!2608) lt!630879 lt!630882 mask!2608) lt!630881))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433312 (= lt!630881 (Intermediate!11291 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433312 (= lt!630879 (select (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433312 (= lt!630882 (array!97614 (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47661 a!2831)))))

(declare-fun b!1433313 () Bool)

(declare-fun res!966344 () Bool)

(assert (=> b!1433313 (=> (not res!966344) (not e!809263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433313 (= res!966344 (validKeyInArray!0 (select (arr!47110 a!2831) i!982)))))

(declare-fun b!1433314 () Bool)

(declare-fun res!966340 () Bool)

(assert (=> b!1433314 (=> (not res!966340) (not e!809267))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1433314 (= res!966340 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433315 () Bool)

(assert (=> b!1433315 (= e!809263 e!809264)))

(declare-fun res!966347 () Bool)

(assert (=> b!1433315 (=> (not res!966347) (not e!809264))))

(declare-fun lt!630880 () SeekEntryResult!11291)

(assert (=> b!1433315 (= res!966347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47110 a!2831) j!81) mask!2608) (select (arr!47110 a!2831) j!81) a!2831 mask!2608) lt!630880))))

(assert (=> b!1433315 (= lt!630880 (Intermediate!11291 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433316 () Bool)

(declare-fun res!966343 () Bool)

(assert (=> b!1433316 (=> (not res!966343) (not e!809263))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1433316 (= res!966343 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47661 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47661 a!2831))))))

(declare-fun b!1433317 () Bool)

(declare-fun res!966352 () Bool)

(assert (=> b!1433317 (=> (not res!966352) (not e!809263))))

(assert (=> b!1433317 (= res!966352 (and (= (size!47661 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47661 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47661 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433318 () Bool)

(declare-fun e!809262 () Bool)

(assert (=> b!1433318 (= e!809267 (not e!809262))))

(declare-fun res!966341 () Bool)

(assert (=> b!1433318 (=> res!966341 e!809262)))

(assert (=> b!1433318 (= res!966341 (or (= (select (arr!47110 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47110 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47110 a!2831) index!585) (select (arr!47110 a!2831) j!81)) (= (select (store (arr!47110 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809266 () Bool)

(assert (=> b!1433318 e!809266))

(declare-fun res!966342 () Bool)

(assert (=> b!1433318 (=> (not res!966342) (not e!809266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97613 (_ BitVec 32)) Bool)

(assert (=> b!1433318 (= res!966342 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48359 0))(
  ( (Unit!48360) )
))
(declare-fun lt!630884 () Unit!48359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48359)

(assert (=> b!1433318 (= lt!630884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433319 () Bool)

(declare-fun res!966348 () Bool)

(assert (=> b!1433319 (=> (not res!966348) (not e!809263))))

(assert (=> b!1433319 (= res!966348 (validKeyInArray!0 (select (arr!47110 a!2831) j!81)))))

(declare-fun b!1433320 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97613 (_ BitVec 32)) SeekEntryResult!11291)

(assert (=> b!1433320 (= e!809266 (= (seekEntryOrOpen!0 (select (arr!47110 a!2831) j!81) a!2831 mask!2608) (Found!11291 j!81)))))

(declare-fun b!1433321 () Bool)

(declare-fun res!966346 () Bool)

(assert (=> b!1433321 (=> (not res!966346) (not e!809263))))

(assert (=> b!1433321 (= res!966346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433322 () Bool)

(declare-fun res!966345 () Bool)

(assert (=> b!1433322 (=> (not res!966345) (not e!809267))))

(assert (=> b!1433322 (= res!966345 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630879 lt!630882 mask!2608) lt!630881))))

(declare-fun b!1433323 () Bool)

(declare-fun res!966351 () Bool)

(assert (=> b!1433323 (=> (not res!966351) (not e!809267))))

(assert (=> b!1433323 (= res!966351 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47110 a!2831) j!81) a!2831 mask!2608) lt!630880))))

(declare-fun b!1433324 () Bool)

(assert (=> b!1433324 (= e!809262 true)))

(declare-fun lt!630883 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433324 (= lt!630883 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1433325 () Bool)

(declare-fun res!966339 () Bool)

(assert (=> b!1433325 (=> (not res!966339) (not e!809263))))

(declare-datatypes ((List!33607 0))(
  ( (Nil!33604) (Cons!33603 (h!34937 (_ BitVec 64)) (t!48293 List!33607)) )
))
(declare-fun arrayNoDuplicates!0 (array!97613 (_ BitVec 32) List!33607) Bool)

(assert (=> b!1433325 (= res!966339 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33604))))

(assert (= (and start!123760 res!966350) b!1433317))

(assert (= (and b!1433317 res!966352) b!1433313))

(assert (= (and b!1433313 res!966344) b!1433319))

(assert (= (and b!1433319 res!966348) b!1433321))

(assert (= (and b!1433321 res!966346) b!1433325))

(assert (= (and b!1433325 res!966339) b!1433316))

(assert (= (and b!1433316 res!966343) b!1433315))

(assert (= (and b!1433315 res!966347) b!1433312))

(assert (= (and b!1433312 res!966349) b!1433323))

(assert (= (and b!1433323 res!966351) b!1433322))

(assert (= (and b!1433322 res!966345) b!1433314))

(assert (= (and b!1433314 res!966340) b!1433318))

(assert (= (and b!1433318 res!966342) b!1433320))

(assert (= (and b!1433318 (not res!966341)) b!1433324))

(declare-fun m!1323199 () Bool)

(assert (=> b!1433320 m!1323199))

(assert (=> b!1433320 m!1323199))

(declare-fun m!1323201 () Bool)

(assert (=> b!1433320 m!1323201))

(declare-fun m!1323203 () Bool)

(assert (=> b!1433321 m!1323203))

(assert (=> b!1433319 m!1323199))

(assert (=> b!1433319 m!1323199))

(declare-fun m!1323205 () Bool)

(assert (=> b!1433319 m!1323205))

(assert (=> b!1433315 m!1323199))

(assert (=> b!1433315 m!1323199))

(declare-fun m!1323207 () Bool)

(assert (=> b!1433315 m!1323207))

(assert (=> b!1433315 m!1323207))

(assert (=> b!1433315 m!1323199))

(declare-fun m!1323209 () Bool)

(assert (=> b!1433315 m!1323209))

(declare-fun m!1323211 () Bool)

(assert (=> start!123760 m!1323211))

(declare-fun m!1323213 () Bool)

(assert (=> start!123760 m!1323213))

(declare-fun m!1323215 () Bool)

(assert (=> b!1433324 m!1323215))

(declare-fun m!1323217 () Bool)

(assert (=> b!1433322 m!1323217))

(declare-fun m!1323219 () Bool)

(assert (=> b!1433318 m!1323219))

(declare-fun m!1323221 () Bool)

(assert (=> b!1433318 m!1323221))

(declare-fun m!1323223 () Bool)

(assert (=> b!1433318 m!1323223))

(declare-fun m!1323225 () Bool)

(assert (=> b!1433318 m!1323225))

(assert (=> b!1433318 m!1323199))

(declare-fun m!1323227 () Bool)

(assert (=> b!1433318 m!1323227))

(declare-fun m!1323229 () Bool)

(assert (=> b!1433312 m!1323229))

(assert (=> b!1433312 m!1323229))

(declare-fun m!1323231 () Bool)

(assert (=> b!1433312 m!1323231))

(assert (=> b!1433312 m!1323219))

(declare-fun m!1323233 () Bool)

(assert (=> b!1433312 m!1323233))

(declare-fun m!1323235 () Bool)

(assert (=> b!1433325 m!1323235))

(declare-fun m!1323237 () Bool)

(assert (=> b!1433313 m!1323237))

(assert (=> b!1433313 m!1323237))

(declare-fun m!1323239 () Bool)

(assert (=> b!1433313 m!1323239))

(assert (=> b!1433323 m!1323199))

(assert (=> b!1433323 m!1323199))

(declare-fun m!1323241 () Bool)

(assert (=> b!1433323 m!1323241))

(check-sat (not b!1433323) (not b!1433322) (not b!1433325) (not b!1433319) (not b!1433318) (not start!123760) (not b!1433324) (not b!1433313) (not b!1433320) (not b!1433312) (not b!1433315) (not b!1433321))
(check-sat)
