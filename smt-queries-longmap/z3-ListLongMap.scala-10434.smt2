; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123008 () Bool)

(assert start!123008)

(declare-fun b!1424472 () Bool)

(declare-fun res!959027 () Bool)

(declare-fun e!805322 () Bool)

(assert (=> b!1424472 (=> res!959027 e!805322)))

(declare-datatypes ((SeekEntryResult!11123 0))(
  ( (MissingZero!11123 (index!46884 (_ BitVec 32))) (Found!11123 (index!46885 (_ BitVec 32))) (Intermediate!11123 (undefined!11935 Bool) (index!46886 (_ BitVec 32)) (x!128686 (_ BitVec 32))) (Undefined!11123) (MissingVacant!11123 (index!46887 (_ BitVec 32))) )
))
(declare-fun lt!627464 () SeekEntryResult!11123)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97244 0))(
  ( (array!97245 (arr!46936 (Array (_ BitVec 32) (_ BitVec 64))) (size!47487 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97244)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627461 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97244 (_ BitVec 32)) SeekEntryResult!11123)

(assert (=> b!1424472 (= res!959027 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627461 (select (arr!46936 a!2831) j!81) a!2831 mask!2608) lt!627464)))))

(declare-fun b!1424473 () Bool)

(declare-fun res!959033 () Bool)

(declare-fun e!805328 () Bool)

(assert (=> b!1424473 (=> (not res!959033) (not e!805328))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424473 (= res!959033 (validKeyInArray!0 (select (arr!46936 a!2831) i!982)))))

(declare-fun b!1424474 () Bool)

(declare-fun e!805325 () Bool)

(declare-fun e!805327 () Bool)

(assert (=> b!1424474 (= e!805325 (not e!805327))))

(declare-fun res!959020 () Bool)

(assert (=> b!1424474 (=> res!959020 e!805327)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424474 (= res!959020 (or (= (select (arr!46936 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46936 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46936 a!2831) index!585) (select (arr!46936 a!2831) j!81)) (= (select (store (arr!46936 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805324 () Bool)

(assert (=> b!1424474 e!805324))

(declare-fun res!959029 () Bool)

(assert (=> b!1424474 (=> (not res!959029) (not e!805324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97244 (_ BitVec 32)) Bool)

(assert (=> b!1424474 (= res!959029 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48113 0))(
  ( (Unit!48114) )
))
(declare-fun lt!627465 () Unit!48113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48113)

(assert (=> b!1424474 (= lt!627465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424475 () Bool)

(declare-fun res!959022 () Bool)

(assert (=> b!1424475 (=> (not res!959022) (not e!805328))))

(declare-datatypes ((List!33433 0))(
  ( (Nil!33430) (Cons!33429 (h!34742 (_ BitVec 64)) (t!48119 List!33433)) )
))
(declare-fun arrayNoDuplicates!0 (array!97244 (_ BitVec 32) List!33433) Bool)

(assert (=> b!1424475 (= res!959022 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33430))))

(declare-fun b!1424476 () Bool)

(declare-fun res!959026 () Bool)

(assert (=> b!1424476 (=> (not res!959026) (not e!805328))))

(assert (=> b!1424476 (= res!959026 (and (= (size!47487 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47487 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47487 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!959023 () Bool)

(assert (=> start!123008 (=> (not res!959023) (not e!805328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123008 (= res!959023 (validMask!0 mask!2608))))

(assert (=> start!123008 e!805328))

(assert (=> start!123008 true))

(declare-fun array_inv!36217 (array!97244) Bool)

(assert (=> start!123008 (array_inv!36217 a!2831)))

(declare-fun b!1424477 () Bool)

(declare-fun res!959031 () Bool)

(assert (=> b!1424477 (=> (not res!959031) (not e!805325))))

(assert (=> b!1424477 (= res!959031 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46936 a!2831) j!81) a!2831 mask!2608) lt!627464))))

(declare-fun b!1424478 () Bool)

(declare-fun res!959034 () Bool)

(assert (=> b!1424478 (=> (not res!959034) (not e!805328))))

(assert (=> b!1424478 (= res!959034 (validKeyInArray!0 (select (arr!46936 a!2831) j!81)))))

(declare-fun b!1424479 () Bool)

(assert (=> b!1424479 (= e!805327 e!805322)))

(declare-fun res!959028 () Bool)

(assert (=> b!1424479 (=> res!959028 e!805322)))

(assert (=> b!1424479 (= res!959028 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627461 #b00000000000000000000000000000000) (bvsge lt!627461 (size!47487 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424479 (= lt!627461 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424480 () Bool)

(assert (=> b!1424480 (= e!805322 true)))

(declare-fun lt!627467 () (_ BitVec 64))

(declare-fun lt!627463 () array!97244)

(declare-fun lt!627466 () SeekEntryResult!11123)

(assert (=> b!1424480 (= lt!627466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627461 lt!627467 lt!627463 mask!2608))))

(declare-fun b!1424481 () Bool)

(declare-fun e!805326 () Bool)

(assert (=> b!1424481 (= e!805328 e!805326)))

(declare-fun res!959021 () Bool)

(assert (=> b!1424481 (=> (not res!959021) (not e!805326))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424481 (= res!959021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46936 a!2831) j!81) mask!2608) (select (arr!46936 a!2831) j!81) a!2831 mask!2608) lt!627464))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1424481 (= lt!627464 (Intermediate!11123 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424482 () Bool)

(declare-fun res!959030 () Bool)

(assert (=> b!1424482 (=> (not res!959030) (not e!805325))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424482 (= res!959030 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424483 () Bool)

(declare-fun res!959035 () Bool)

(assert (=> b!1424483 (=> (not res!959035) (not e!805328))))

(assert (=> b!1424483 (= res!959035 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47487 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47487 a!2831))))))

(declare-fun b!1424484 () Bool)

(declare-fun res!959032 () Bool)

(assert (=> b!1424484 (=> (not res!959032) (not e!805328))))

(assert (=> b!1424484 (= res!959032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424485 () Bool)

(declare-fun res!959024 () Bool)

(assert (=> b!1424485 (=> (not res!959024) (not e!805325))))

(declare-fun lt!627462 () SeekEntryResult!11123)

(assert (=> b!1424485 (= res!959024 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627467 lt!627463 mask!2608) lt!627462))))

(declare-fun b!1424486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97244 (_ BitVec 32)) SeekEntryResult!11123)

(assert (=> b!1424486 (= e!805324 (= (seekEntryOrOpen!0 (select (arr!46936 a!2831) j!81) a!2831 mask!2608) (Found!11123 j!81)))))

(declare-fun b!1424487 () Bool)

(assert (=> b!1424487 (= e!805326 e!805325)))

(declare-fun res!959025 () Bool)

(assert (=> b!1424487 (=> (not res!959025) (not e!805325))))

(assert (=> b!1424487 (= res!959025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627467 mask!2608) lt!627467 lt!627463 mask!2608) lt!627462))))

(assert (=> b!1424487 (= lt!627462 (Intermediate!11123 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424487 (= lt!627467 (select (store (arr!46936 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424487 (= lt!627463 (array!97245 (store (arr!46936 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47487 a!2831)))))

(assert (= (and start!123008 res!959023) b!1424476))

(assert (= (and b!1424476 res!959026) b!1424473))

(assert (= (and b!1424473 res!959033) b!1424478))

(assert (= (and b!1424478 res!959034) b!1424484))

(assert (= (and b!1424484 res!959032) b!1424475))

(assert (= (and b!1424475 res!959022) b!1424483))

(assert (= (and b!1424483 res!959035) b!1424481))

(assert (= (and b!1424481 res!959021) b!1424487))

(assert (= (and b!1424487 res!959025) b!1424477))

(assert (= (and b!1424477 res!959031) b!1424485))

(assert (= (and b!1424485 res!959024) b!1424482))

(assert (= (and b!1424482 res!959030) b!1424474))

(assert (= (and b!1424474 res!959029) b!1424486))

(assert (= (and b!1424474 (not res!959020)) b!1424479))

(assert (= (and b!1424479 (not res!959028)) b!1424472))

(assert (= (and b!1424472 (not res!959027)) b!1424480))

(declare-fun m!1315137 () Bool)

(assert (=> b!1424477 m!1315137))

(assert (=> b!1424477 m!1315137))

(declare-fun m!1315139 () Bool)

(assert (=> b!1424477 m!1315139))

(assert (=> b!1424481 m!1315137))

(assert (=> b!1424481 m!1315137))

(declare-fun m!1315141 () Bool)

(assert (=> b!1424481 m!1315141))

(assert (=> b!1424481 m!1315141))

(assert (=> b!1424481 m!1315137))

(declare-fun m!1315143 () Bool)

(assert (=> b!1424481 m!1315143))

(declare-fun m!1315145 () Bool)

(assert (=> b!1424480 m!1315145))

(assert (=> b!1424472 m!1315137))

(assert (=> b!1424472 m!1315137))

(declare-fun m!1315147 () Bool)

(assert (=> b!1424472 m!1315147))

(declare-fun m!1315149 () Bool)

(assert (=> b!1424474 m!1315149))

(declare-fun m!1315151 () Bool)

(assert (=> b!1424474 m!1315151))

(declare-fun m!1315153 () Bool)

(assert (=> b!1424474 m!1315153))

(declare-fun m!1315155 () Bool)

(assert (=> b!1424474 m!1315155))

(assert (=> b!1424474 m!1315137))

(declare-fun m!1315157 () Bool)

(assert (=> b!1424474 m!1315157))

(declare-fun m!1315159 () Bool)

(assert (=> b!1424487 m!1315159))

(assert (=> b!1424487 m!1315159))

(declare-fun m!1315161 () Bool)

(assert (=> b!1424487 m!1315161))

(assert (=> b!1424487 m!1315149))

(declare-fun m!1315163 () Bool)

(assert (=> b!1424487 m!1315163))

(assert (=> b!1424478 m!1315137))

(assert (=> b!1424478 m!1315137))

(declare-fun m!1315165 () Bool)

(assert (=> b!1424478 m!1315165))

(declare-fun m!1315167 () Bool)

(assert (=> b!1424473 m!1315167))

(assert (=> b!1424473 m!1315167))

(declare-fun m!1315169 () Bool)

(assert (=> b!1424473 m!1315169))

(assert (=> b!1424486 m!1315137))

(assert (=> b!1424486 m!1315137))

(declare-fun m!1315171 () Bool)

(assert (=> b!1424486 m!1315171))

(declare-fun m!1315173 () Bool)

(assert (=> start!123008 m!1315173))

(declare-fun m!1315175 () Bool)

(assert (=> start!123008 m!1315175))

(declare-fun m!1315177 () Bool)

(assert (=> b!1424485 m!1315177))

(declare-fun m!1315179 () Bool)

(assert (=> b!1424484 m!1315179))

(declare-fun m!1315181 () Bool)

(assert (=> b!1424479 m!1315181))

(declare-fun m!1315183 () Bool)

(assert (=> b!1424475 m!1315183))

(check-sat (not b!1424472) (not start!123008) (not b!1424480) (not b!1424486) (not b!1424485) (not b!1424474) (not b!1424477) (not b!1424475) (not b!1424481) (not b!1424484) (not b!1424473) (not b!1424487) (not b!1424478) (not b!1424479))
(check-sat)
