; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122784 () Bool)

(assert start!122784)

(declare-fun b!1423455 () Bool)

(declare-fun res!958890 () Bool)

(declare-fun e!804586 () Bool)

(assert (=> b!1423455 (=> (not res!958890) (not e!804586))))

(declare-datatypes ((array!97149 0))(
  ( (array!97150 (arr!46892 (Array (_ BitVec 32) (_ BitVec 64))) (size!47442 (_ BitVec 32))) )
))
(declare-fun lt!627123 () array!97149)

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11177 0))(
  ( (MissingZero!11177 (index!47100 (_ BitVec 32))) (Found!11177 (index!47101 (_ BitVec 32))) (Intermediate!11177 (undefined!11989 Bool) (index!47102 (_ BitVec 32)) (x!128739 (_ BitVec 32))) (Undefined!11177) (MissingVacant!11177 (index!47103 (_ BitVec 32))) )
))
(declare-fun lt!627124 () SeekEntryResult!11177)

(declare-fun lt!627121 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97149 (_ BitVec 32)) SeekEntryResult!11177)

(assert (=> b!1423455 (= res!958890 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627121 lt!627123 mask!2608) lt!627124))))

(declare-fun b!1423456 () Bool)

(declare-fun res!958900 () Bool)

(declare-fun e!804587 () Bool)

(assert (=> b!1423456 (=> res!958900 e!804587)))

(declare-fun lt!627120 () SeekEntryResult!11177)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97149)

(declare-fun lt!627122 () (_ BitVec 32))

(assert (=> b!1423456 (= res!958900 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627122 (select (arr!46892 a!2831) j!81) a!2831 mask!2608) lt!627120)))))

(declare-fun b!1423457 () Bool)

(declare-fun res!958895 () Bool)

(declare-fun e!804588 () Bool)

(assert (=> b!1423457 (=> (not res!958895) (not e!804588))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423457 (= res!958895 (validKeyInArray!0 (select (arr!46892 a!2831) i!982)))))

(declare-fun b!1423458 () Bool)

(declare-fun res!958901 () Bool)

(assert (=> b!1423458 (=> (not res!958901) (not e!804588))))

(assert (=> b!1423458 (= res!958901 (and (= (size!47442 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47442 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47442 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423459 () Bool)

(declare-fun res!958896 () Bool)

(assert (=> b!1423459 (=> (not res!958896) (not e!804588))))

(declare-datatypes ((List!33402 0))(
  ( (Nil!33399) (Cons!33398 (h!34700 (_ BitVec 64)) (t!48096 List!33402)) )
))
(declare-fun arrayNoDuplicates!0 (array!97149 (_ BitVec 32) List!33402) Bool)

(assert (=> b!1423459 (= res!958896 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33399))))

(declare-fun b!1423460 () Bool)

(declare-fun res!958893 () Bool)

(assert (=> b!1423460 (=> (not res!958893) (not e!804588))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423460 (= res!958893 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47442 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47442 a!2831))))))

(declare-fun b!1423461 () Bool)

(assert (=> b!1423461 (= e!804587 true)))

(declare-fun lt!627125 () SeekEntryResult!11177)

(assert (=> b!1423461 (= lt!627125 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627122 lt!627121 lt!627123 mask!2608))))

(declare-fun b!1423462 () Bool)

(declare-fun e!804590 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97149 (_ BitVec 32)) SeekEntryResult!11177)

(assert (=> b!1423462 (= e!804590 (= (seekEntryOrOpen!0 (select (arr!46892 a!2831) j!81) a!2831 mask!2608) (Found!11177 j!81)))))

(declare-fun b!1423463 () Bool)

(declare-fun e!804585 () Bool)

(assert (=> b!1423463 (= e!804585 e!804586)))

(declare-fun res!958889 () Bool)

(assert (=> b!1423463 (=> (not res!958889) (not e!804586))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423463 (= res!958889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627121 mask!2608) lt!627121 lt!627123 mask!2608) lt!627124))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423463 (= lt!627124 (Intermediate!11177 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423463 (= lt!627121 (select (store (arr!46892 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423463 (= lt!627123 (array!97150 (store (arr!46892 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47442 a!2831)))))

(declare-fun b!1423464 () Bool)

(declare-fun res!958897 () Bool)

(assert (=> b!1423464 (=> (not res!958897) (not e!804588))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97149 (_ BitVec 32)) Bool)

(assert (=> b!1423464 (= res!958897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423465 () Bool)

(declare-fun e!804584 () Bool)

(assert (=> b!1423465 (= e!804584 e!804587)))

(declare-fun res!958899 () Bool)

(assert (=> b!1423465 (=> res!958899 e!804587)))

(assert (=> b!1423465 (= res!958899 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627122 #b00000000000000000000000000000000) (bvsge lt!627122 (size!47442 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423465 (= lt!627122 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423466 () Bool)

(assert (=> b!1423466 (= e!804588 e!804585)))

(declare-fun res!958903 () Bool)

(assert (=> b!1423466 (=> (not res!958903) (not e!804585))))

(assert (=> b!1423466 (= res!958903 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46892 a!2831) j!81) mask!2608) (select (arr!46892 a!2831) j!81) a!2831 mask!2608) lt!627120))))

(assert (=> b!1423466 (= lt!627120 (Intermediate!11177 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423467 () Bool)

(declare-fun res!958891 () Bool)

(assert (=> b!1423467 (=> (not res!958891) (not e!804586))))

(assert (=> b!1423467 (= res!958891 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423469 () Bool)

(declare-fun res!958898 () Bool)

(assert (=> b!1423469 (=> (not res!958898) (not e!804588))))

(assert (=> b!1423469 (= res!958898 (validKeyInArray!0 (select (arr!46892 a!2831) j!81)))))

(declare-fun b!1423470 () Bool)

(declare-fun res!958888 () Bool)

(assert (=> b!1423470 (=> (not res!958888) (not e!804586))))

(assert (=> b!1423470 (= res!958888 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46892 a!2831) j!81) a!2831 mask!2608) lt!627120))))

(declare-fun res!958892 () Bool)

(assert (=> start!122784 (=> (not res!958892) (not e!804588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122784 (= res!958892 (validMask!0 mask!2608))))

(assert (=> start!122784 e!804588))

(assert (=> start!122784 true))

(declare-fun array_inv!35920 (array!97149) Bool)

(assert (=> start!122784 (array_inv!35920 a!2831)))

(declare-fun b!1423468 () Bool)

(assert (=> b!1423468 (= e!804586 (not e!804584))))

(declare-fun res!958902 () Bool)

(assert (=> b!1423468 (=> res!958902 e!804584)))

(assert (=> b!1423468 (= res!958902 (or (= (select (arr!46892 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46892 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46892 a!2831) index!585) (select (arr!46892 a!2831) j!81)) (= (select (store (arr!46892 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423468 e!804590))

(declare-fun res!958894 () Bool)

(assert (=> b!1423468 (=> (not res!958894) (not e!804590))))

(assert (=> b!1423468 (= res!958894 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48190 0))(
  ( (Unit!48191) )
))
(declare-fun lt!627126 () Unit!48190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97149 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48190)

(assert (=> b!1423468 (= lt!627126 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122784 res!958892) b!1423458))

(assert (= (and b!1423458 res!958901) b!1423457))

(assert (= (and b!1423457 res!958895) b!1423469))

(assert (= (and b!1423469 res!958898) b!1423464))

(assert (= (and b!1423464 res!958897) b!1423459))

(assert (= (and b!1423459 res!958896) b!1423460))

(assert (= (and b!1423460 res!958893) b!1423466))

(assert (= (and b!1423466 res!958903) b!1423463))

(assert (= (and b!1423463 res!958889) b!1423470))

(assert (= (and b!1423470 res!958888) b!1423455))

(assert (= (and b!1423455 res!958890) b!1423467))

(assert (= (and b!1423467 res!958891) b!1423468))

(assert (= (and b!1423468 res!958894) b!1423462))

(assert (= (and b!1423468 (not res!958902)) b!1423465))

(assert (= (and b!1423465 (not res!958899)) b!1423456))

(assert (= (and b!1423456 (not res!958900)) b!1423461))

(declare-fun m!1314003 () Bool)

(assert (=> b!1423464 m!1314003))

(declare-fun m!1314005 () Bool)

(assert (=> b!1423459 m!1314005))

(declare-fun m!1314007 () Bool)

(assert (=> b!1423466 m!1314007))

(assert (=> b!1423466 m!1314007))

(declare-fun m!1314009 () Bool)

(assert (=> b!1423466 m!1314009))

(assert (=> b!1423466 m!1314009))

(assert (=> b!1423466 m!1314007))

(declare-fun m!1314011 () Bool)

(assert (=> b!1423466 m!1314011))

(assert (=> b!1423462 m!1314007))

(assert (=> b!1423462 m!1314007))

(declare-fun m!1314013 () Bool)

(assert (=> b!1423462 m!1314013))

(declare-fun m!1314015 () Bool)

(assert (=> b!1423465 m!1314015))

(declare-fun m!1314017 () Bool)

(assert (=> b!1423457 m!1314017))

(assert (=> b!1423457 m!1314017))

(declare-fun m!1314019 () Bool)

(assert (=> b!1423457 m!1314019))

(declare-fun m!1314021 () Bool)

(assert (=> b!1423455 m!1314021))

(declare-fun m!1314023 () Bool)

(assert (=> b!1423468 m!1314023))

(declare-fun m!1314025 () Bool)

(assert (=> b!1423468 m!1314025))

(declare-fun m!1314027 () Bool)

(assert (=> b!1423468 m!1314027))

(declare-fun m!1314029 () Bool)

(assert (=> b!1423468 m!1314029))

(assert (=> b!1423468 m!1314007))

(declare-fun m!1314031 () Bool)

(assert (=> b!1423468 m!1314031))

(declare-fun m!1314033 () Bool)

(assert (=> b!1423463 m!1314033))

(assert (=> b!1423463 m!1314033))

(declare-fun m!1314035 () Bool)

(assert (=> b!1423463 m!1314035))

(assert (=> b!1423463 m!1314023))

(declare-fun m!1314037 () Bool)

(assert (=> b!1423463 m!1314037))

(assert (=> b!1423470 m!1314007))

(assert (=> b!1423470 m!1314007))

(declare-fun m!1314039 () Bool)

(assert (=> b!1423470 m!1314039))

(assert (=> b!1423469 m!1314007))

(assert (=> b!1423469 m!1314007))

(declare-fun m!1314041 () Bool)

(assert (=> b!1423469 m!1314041))

(assert (=> b!1423456 m!1314007))

(assert (=> b!1423456 m!1314007))

(declare-fun m!1314043 () Bool)

(assert (=> b!1423456 m!1314043))

(declare-fun m!1314045 () Bool)

(assert (=> b!1423461 m!1314045))

(declare-fun m!1314047 () Bool)

(assert (=> start!122784 m!1314047))

(declare-fun m!1314049 () Bool)

(assert (=> start!122784 m!1314049))

(push 1)

