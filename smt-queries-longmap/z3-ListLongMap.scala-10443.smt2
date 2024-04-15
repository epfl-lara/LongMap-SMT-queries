; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122816 () Bool)

(assert start!122816)

(declare-fun b!1424238 () Bool)

(declare-fun res!959734 () Bool)

(declare-fun e!804923 () Bool)

(assert (=> b!1424238 (=> (not res!959734) (not e!804923))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97134 0))(
  ( (array!97135 (arr!46885 (Array (_ BitVec 32) (_ BitVec 64))) (size!47437 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97134)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11197 0))(
  ( (MissingZero!11197 (index!47180 (_ BitVec 32))) (Found!11197 (index!47181 (_ BitVec 32))) (Intermediate!11197 (undefined!12009 Bool) (index!47182 (_ BitVec 32)) (x!128804 (_ BitVec 32))) (Undefined!11197) (MissingVacant!11197 (index!47183 (_ BitVec 32))) )
))
(declare-fun lt!627309 () SeekEntryResult!11197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97134 (_ BitVec 32)) SeekEntryResult!11197)

(assert (=> b!1424238 (= res!959734 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!627309))))

(declare-fun b!1424239 () Bool)

(declare-fun e!804925 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97134 (_ BitVec 32)) SeekEntryResult!11197)

(assert (=> b!1424239 (= e!804925 (= (seekEntryOrOpen!0 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) (Found!11197 j!81)))))

(declare-fun b!1424240 () Bool)

(declare-fun res!959733 () Bool)

(declare-fun e!804929 () Bool)

(assert (=> b!1424240 (=> (not res!959733) (not e!804929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424240 (= res!959733 (validKeyInArray!0 (select (arr!46885 a!2831) j!81)))))

(declare-fun res!959728 () Bool)

(assert (=> start!122816 (=> (not res!959728) (not e!804929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122816 (= res!959728 (validMask!0 mask!2608))))

(assert (=> start!122816 e!804929))

(assert (=> start!122816 true))

(declare-fun array_inv!36118 (array!97134) Bool)

(assert (=> start!122816 (array_inv!36118 a!2831)))

(declare-fun b!1424241 () Bool)

(declare-fun e!804928 () Bool)

(assert (=> b!1424241 (= e!804929 e!804928)))

(declare-fun res!959725 () Bool)

(assert (=> b!1424241 (=> (not res!959725) (not e!804928))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424241 (= res!959725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46885 a!2831) j!81) mask!2608) (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!627309))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424241 (= lt!627309 (Intermediate!11197 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424242 () Bool)

(declare-fun e!804926 () Bool)

(assert (=> b!1424242 (= e!804926 true)))

(declare-fun lt!627312 () array!97134)

(declare-fun lt!627310 () (_ BitVec 32))

(declare-fun lt!627313 () SeekEntryResult!11197)

(declare-fun lt!627308 () (_ BitVec 64))

(assert (=> b!1424242 (= lt!627313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627310 lt!627308 lt!627312 mask!2608))))

(declare-fun b!1424243 () Bool)

(declare-fun res!959723 () Bool)

(assert (=> b!1424243 (=> (not res!959723) (not e!804929))))

(assert (=> b!1424243 (= res!959723 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47437 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47437 a!2831))))))

(declare-fun b!1424244 () Bool)

(declare-fun res!959731 () Bool)

(assert (=> b!1424244 (=> (not res!959731) (not e!804929))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424244 (= res!959731 (validKeyInArray!0 (select (arr!46885 a!2831) i!982)))))

(declare-fun b!1424245 () Bool)

(declare-fun e!804924 () Bool)

(assert (=> b!1424245 (= e!804923 (not e!804924))))

(declare-fun res!959729 () Bool)

(assert (=> b!1424245 (=> res!959729 e!804924)))

(assert (=> b!1424245 (= res!959729 (or (= (select (arr!46885 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46885 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46885 a!2831) index!585) (select (arr!46885 a!2831) j!81)) (= (select (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424245 e!804925))

(declare-fun res!959727 () Bool)

(assert (=> b!1424245 (=> (not res!959727) (not e!804925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97134 (_ BitVec 32)) Bool)

(assert (=> b!1424245 (= res!959727 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48069 0))(
  ( (Unit!48070) )
))
(declare-fun lt!627311 () Unit!48069)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48069)

(assert (=> b!1424245 (= lt!627311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424246 () Bool)

(assert (=> b!1424246 (= e!804928 e!804923)))

(declare-fun res!959737 () Bool)

(assert (=> b!1424246 (=> (not res!959737) (not e!804923))))

(declare-fun lt!627314 () SeekEntryResult!11197)

(assert (=> b!1424246 (= res!959737 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627308 mask!2608) lt!627308 lt!627312 mask!2608) lt!627314))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424246 (= lt!627314 (Intermediate!11197 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424246 (= lt!627308 (select (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424246 (= lt!627312 (array!97135 (store (arr!46885 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47437 a!2831)))))

(declare-fun b!1424247 () Bool)

(declare-fun res!959726 () Bool)

(assert (=> b!1424247 (=> (not res!959726) (not e!804929))))

(assert (=> b!1424247 (= res!959726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424248 () Bool)

(declare-fun res!959722 () Bool)

(assert (=> b!1424248 (=> (not res!959722) (not e!804923))))

(assert (=> b!1424248 (= res!959722 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627308 lt!627312 mask!2608) lt!627314))))

(declare-fun b!1424249 () Bool)

(declare-fun res!959724 () Bool)

(assert (=> b!1424249 (=> (not res!959724) (not e!804929))))

(assert (=> b!1424249 (= res!959724 (and (= (size!47437 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47437 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47437 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424250 () Bool)

(assert (=> b!1424250 (= e!804924 e!804926)))

(declare-fun res!959730 () Bool)

(assert (=> b!1424250 (=> res!959730 e!804926)))

(assert (=> b!1424250 (= res!959730 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627310 #b00000000000000000000000000000000) (bvsge lt!627310 (size!47437 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424250 (= lt!627310 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424251 () Bool)

(declare-fun res!959735 () Bool)

(assert (=> b!1424251 (=> (not res!959735) (not e!804929))))

(declare-datatypes ((List!33473 0))(
  ( (Nil!33470) (Cons!33469 (h!34771 (_ BitVec 64)) (t!48159 List!33473)) )
))
(declare-fun arrayNoDuplicates!0 (array!97134 (_ BitVec 32) List!33473) Bool)

(assert (=> b!1424251 (= res!959735 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33470))))

(declare-fun b!1424252 () Bool)

(declare-fun res!959732 () Bool)

(assert (=> b!1424252 (=> res!959732 e!804926)))

(assert (=> b!1424252 (= res!959732 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627310 (select (arr!46885 a!2831) j!81) a!2831 mask!2608) lt!627309)))))

(declare-fun b!1424253 () Bool)

(declare-fun res!959736 () Bool)

(assert (=> b!1424253 (=> (not res!959736) (not e!804923))))

(assert (=> b!1424253 (= res!959736 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122816 res!959728) b!1424249))

(assert (= (and b!1424249 res!959724) b!1424244))

(assert (= (and b!1424244 res!959731) b!1424240))

(assert (= (and b!1424240 res!959733) b!1424247))

(assert (= (and b!1424247 res!959726) b!1424251))

(assert (= (and b!1424251 res!959735) b!1424243))

(assert (= (and b!1424243 res!959723) b!1424241))

(assert (= (and b!1424241 res!959725) b!1424246))

(assert (= (and b!1424246 res!959737) b!1424238))

(assert (= (and b!1424238 res!959734) b!1424248))

(assert (= (and b!1424248 res!959722) b!1424253))

(assert (= (and b!1424253 res!959736) b!1424245))

(assert (= (and b!1424245 res!959727) b!1424239))

(assert (= (and b!1424245 (not res!959729)) b!1424250))

(assert (= (and b!1424250 (not res!959730)) b!1424252))

(assert (= (and b!1424252 (not res!959732)) b!1424242))

(declare-fun m!1314315 () Bool)

(assert (=> b!1424239 m!1314315))

(assert (=> b!1424239 m!1314315))

(declare-fun m!1314317 () Bool)

(assert (=> b!1424239 m!1314317))

(assert (=> b!1424241 m!1314315))

(assert (=> b!1424241 m!1314315))

(declare-fun m!1314319 () Bool)

(assert (=> b!1424241 m!1314319))

(assert (=> b!1424241 m!1314319))

(assert (=> b!1424241 m!1314315))

(declare-fun m!1314321 () Bool)

(assert (=> b!1424241 m!1314321))

(assert (=> b!1424238 m!1314315))

(assert (=> b!1424238 m!1314315))

(declare-fun m!1314323 () Bool)

(assert (=> b!1424238 m!1314323))

(declare-fun m!1314325 () Bool)

(assert (=> b!1424250 m!1314325))

(declare-fun m!1314327 () Bool)

(assert (=> start!122816 m!1314327))

(declare-fun m!1314329 () Bool)

(assert (=> start!122816 m!1314329))

(assert (=> b!1424240 m!1314315))

(assert (=> b!1424240 m!1314315))

(declare-fun m!1314331 () Bool)

(assert (=> b!1424240 m!1314331))

(declare-fun m!1314333 () Bool)

(assert (=> b!1424242 m!1314333))

(declare-fun m!1314335 () Bool)

(assert (=> b!1424248 m!1314335))

(declare-fun m!1314337 () Bool)

(assert (=> b!1424247 m!1314337))

(declare-fun m!1314339 () Bool)

(assert (=> b!1424245 m!1314339))

(declare-fun m!1314341 () Bool)

(assert (=> b!1424245 m!1314341))

(declare-fun m!1314343 () Bool)

(assert (=> b!1424245 m!1314343))

(declare-fun m!1314345 () Bool)

(assert (=> b!1424245 m!1314345))

(assert (=> b!1424245 m!1314315))

(declare-fun m!1314347 () Bool)

(assert (=> b!1424245 m!1314347))

(declare-fun m!1314349 () Bool)

(assert (=> b!1424244 m!1314349))

(assert (=> b!1424244 m!1314349))

(declare-fun m!1314351 () Bool)

(assert (=> b!1424244 m!1314351))

(assert (=> b!1424252 m!1314315))

(assert (=> b!1424252 m!1314315))

(declare-fun m!1314353 () Bool)

(assert (=> b!1424252 m!1314353))

(declare-fun m!1314355 () Bool)

(assert (=> b!1424251 m!1314355))

(declare-fun m!1314357 () Bool)

(assert (=> b!1424246 m!1314357))

(assert (=> b!1424246 m!1314357))

(declare-fun m!1314359 () Bool)

(assert (=> b!1424246 m!1314359))

(assert (=> b!1424246 m!1314339))

(declare-fun m!1314361 () Bool)

(assert (=> b!1424246 m!1314361))

(check-sat (not b!1424246) (not b!1424242) (not b!1424239) (not b!1424244) (not b!1424251) (not b!1424238) (not b!1424247) (not b!1424241) (not b!1424248) (not start!122816) (not b!1424240) (not b!1424245) (not b!1424252) (not b!1424250))
(check-sat)
