; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122744 () Bool)

(assert start!122744)

(declare-fun b!1422495 () Bool)

(declare-fun e!804170 () Bool)

(declare-fun e!804165 () Bool)

(assert (=> b!1422495 (= e!804170 e!804165)))

(declare-fun res!957942 () Bool)

(assert (=> b!1422495 (=> res!957942 e!804165)))

(declare-fun lt!626705 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97109 0))(
  ( (array!97110 (arr!46872 (Array (_ BitVec 32) (_ BitVec 64))) (size!47422 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97109)

(assert (=> b!1422495 (= res!957942 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626705 #b00000000000000000000000000000000) (bvsge lt!626705 (size!47422 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422495 (= lt!626705 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422496 () Bool)

(declare-fun res!957935 () Bool)

(declare-fun e!804168 () Bool)

(assert (=> b!1422496 (=> (not res!957935) (not e!804168))))

(declare-datatypes ((SeekEntryResult!11157 0))(
  ( (MissingZero!11157 (index!47020 (_ BitVec 32))) (Found!11157 (index!47021 (_ BitVec 32))) (Intermediate!11157 (undefined!11969 Bool) (index!47022 (_ BitVec 32)) (x!128663 (_ BitVec 32))) (Undefined!11157) (MissingVacant!11157 (index!47023 (_ BitVec 32))) )
))
(declare-fun lt!626706 () SeekEntryResult!11157)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97109 (_ BitVec 32)) SeekEntryResult!11157)

(assert (=> b!1422496 (= res!957935 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46872 a!2831) j!81) a!2831 mask!2608) lt!626706))))

(declare-fun b!1422497 () Bool)

(declare-fun res!957941 () Bool)

(declare-fun e!804164 () Bool)

(assert (=> b!1422497 (=> (not res!957941) (not e!804164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422497 (= res!957941 (validKeyInArray!0 (select (arr!46872 a!2831) j!81)))))

(declare-fun b!1422498 () Bool)

(declare-fun res!957928 () Bool)

(assert (=> b!1422498 (=> (not res!957928) (not e!804164))))

(declare-datatypes ((List!33382 0))(
  ( (Nil!33379) (Cons!33378 (h!34680 (_ BitVec 64)) (t!48076 List!33382)) )
))
(declare-fun arrayNoDuplicates!0 (array!97109 (_ BitVec 32) List!33382) Bool)

(assert (=> b!1422498 (= res!957928 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33379))))

(declare-fun b!1422499 () Bool)

(assert (=> b!1422499 (= e!804165 true)))

(declare-fun lt!626700 () array!97109)

(declare-fun lt!626702 () SeekEntryResult!11157)

(declare-fun lt!626701 () (_ BitVec 64))

(assert (=> b!1422499 (= lt!626702 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626705 lt!626701 lt!626700 mask!2608))))

(declare-fun b!1422500 () Bool)

(declare-fun e!804167 () Bool)

(assert (=> b!1422500 (= e!804167 e!804168)))

(declare-fun res!957929 () Bool)

(assert (=> b!1422500 (=> (not res!957929) (not e!804168))))

(declare-fun lt!626704 () SeekEntryResult!11157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422500 (= res!957929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626701 mask!2608) lt!626701 lt!626700 mask!2608) lt!626704))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422500 (= lt!626704 (Intermediate!11157 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422500 (= lt!626701 (select (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422500 (= lt!626700 (array!97110 (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47422 a!2831)))))

(declare-fun b!1422501 () Bool)

(declare-fun res!957930 () Bool)

(assert (=> b!1422501 (=> (not res!957930) (not e!804164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97109 (_ BitVec 32)) Bool)

(assert (=> b!1422501 (= res!957930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422502 () Bool)

(declare-fun res!957939 () Bool)

(assert (=> b!1422502 (=> (not res!957939) (not e!804164))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1422502 (= res!957939 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47422 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47422 a!2831))))))

(declare-fun res!957933 () Bool)

(assert (=> start!122744 (=> (not res!957933) (not e!804164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122744 (= res!957933 (validMask!0 mask!2608))))

(assert (=> start!122744 e!804164))

(assert (=> start!122744 true))

(declare-fun array_inv!35900 (array!97109) Bool)

(assert (=> start!122744 (array_inv!35900 a!2831)))

(declare-fun b!1422503 () Bool)

(declare-fun res!957940 () Bool)

(assert (=> b!1422503 (=> res!957940 e!804165)))

(assert (=> b!1422503 (= res!957940 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626705 (select (arr!46872 a!2831) j!81) a!2831 mask!2608) lt!626706)))))

(declare-fun b!1422504 () Bool)

(assert (=> b!1422504 (= e!804164 e!804167)))

(declare-fun res!957936 () Bool)

(assert (=> b!1422504 (=> (not res!957936) (not e!804167))))

(assert (=> b!1422504 (= res!957936 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46872 a!2831) j!81) mask!2608) (select (arr!46872 a!2831) j!81) a!2831 mask!2608) lt!626706))))

(assert (=> b!1422504 (= lt!626706 (Intermediate!11157 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun e!804169 () Bool)

(declare-fun b!1422505 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97109 (_ BitVec 32)) SeekEntryResult!11157)

(assert (=> b!1422505 (= e!804169 (= (seekEntryOrOpen!0 (select (arr!46872 a!2831) j!81) a!2831 mask!2608) (Found!11157 j!81)))))

(declare-fun b!1422506 () Bool)

(declare-fun res!957943 () Bool)

(assert (=> b!1422506 (=> (not res!957943) (not e!804164))))

(assert (=> b!1422506 (= res!957943 (and (= (size!47422 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47422 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47422 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422507 () Bool)

(declare-fun res!957938 () Bool)

(assert (=> b!1422507 (=> (not res!957938) (not e!804164))))

(assert (=> b!1422507 (= res!957938 (validKeyInArray!0 (select (arr!46872 a!2831) i!982)))))

(declare-fun b!1422508 () Bool)

(assert (=> b!1422508 (= e!804168 (not e!804170))))

(declare-fun res!957934 () Bool)

(assert (=> b!1422508 (=> res!957934 e!804170)))

(assert (=> b!1422508 (= res!957934 (or (= (select (arr!46872 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46872 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46872 a!2831) index!585) (select (arr!46872 a!2831) j!81)) (= (select (store (arr!46872 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422508 e!804169))

(declare-fun res!957937 () Bool)

(assert (=> b!1422508 (=> (not res!957937) (not e!804169))))

(assert (=> b!1422508 (= res!957937 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48150 0))(
  ( (Unit!48151) )
))
(declare-fun lt!626703 () Unit!48150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48150)

(assert (=> b!1422508 (= lt!626703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422509 () Bool)

(declare-fun res!957931 () Bool)

(assert (=> b!1422509 (=> (not res!957931) (not e!804168))))

(assert (=> b!1422509 (= res!957931 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626701 lt!626700 mask!2608) lt!626704))))

(declare-fun b!1422510 () Bool)

(declare-fun res!957932 () Bool)

(assert (=> b!1422510 (=> (not res!957932) (not e!804168))))

(assert (=> b!1422510 (= res!957932 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(assert (= (and start!122744 res!957933) b!1422506))

(assert (= (and b!1422506 res!957943) b!1422507))

(assert (= (and b!1422507 res!957938) b!1422497))

(assert (= (and b!1422497 res!957941) b!1422501))

(assert (= (and b!1422501 res!957930) b!1422498))

(assert (= (and b!1422498 res!957928) b!1422502))

(assert (= (and b!1422502 res!957939) b!1422504))

(assert (= (and b!1422504 res!957936) b!1422500))

(assert (= (and b!1422500 res!957929) b!1422496))

(assert (= (and b!1422496 res!957935) b!1422509))

(assert (= (and b!1422509 res!957931) b!1422510))

(assert (= (and b!1422510 res!957932) b!1422508))

(assert (= (and b!1422508 res!957937) b!1422505))

(assert (= (and b!1422508 (not res!957934)) b!1422495))

(assert (= (and b!1422495 (not res!957942)) b!1422503))

(assert (= (and b!1422503 (not res!957940)) b!1422499))

(declare-fun m!1313043 () Bool)

(assert (=> start!122744 m!1313043))

(declare-fun m!1313045 () Bool)

(assert (=> start!122744 m!1313045))

(declare-fun m!1313047 () Bool)

(assert (=> b!1422499 m!1313047))

(declare-fun m!1313049 () Bool)

(assert (=> b!1422508 m!1313049))

(declare-fun m!1313051 () Bool)

(assert (=> b!1422508 m!1313051))

(declare-fun m!1313053 () Bool)

(assert (=> b!1422508 m!1313053))

(declare-fun m!1313055 () Bool)

(assert (=> b!1422508 m!1313055))

(declare-fun m!1313057 () Bool)

(assert (=> b!1422508 m!1313057))

(declare-fun m!1313059 () Bool)

(assert (=> b!1422508 m!1313059))

(declare-fun m!1313061 () Bool)

(assert (=> b!1422498 m!1313061))

(assert (=> b!1422503 m!1313057))

(assert (=> b!1422503 m!1313057))

(declare-fun m!1313063 () Bool)

(assert (=> b!1422503 m!1313063))

(declare-fun m!1313065 () Bool)

(assert (=> b!1422500 m!1313065))

(assert (=> b!1422500 m!1313065))

(declare-fun m!1313067 () Bool)

(assert (=> b!1422500 m!1313067))

(assert (=> b!1422500 m!1313049))

(declare-fun m!1313069 () Bool)

(assert (=> b!1422500 m!1313069))

(declare-fun m!1313071 () Bool)

(assert (=> b!1422507 m!1313071))

(assert (=> b!1422507 m!1313071))

(declare-fun m!1313073 () Bool)

(assert (=> b!1422507 m!1313073))

(assert (=> b!1422496 m!1313057))

(assert (=> b!1422496 m!1313057))

(declare-fun m!1313075 () Bool)

(assert (=> b!1422496 m!1313075))

(declare-fun m!1313077 () Bool)

(assert (=> b!1422509 m!1313077))

(declare-fun m!1313079 () Bool)

(assert (=> b!1422501 m!1313079))

(assert (=> b!1422497 m!1313057))

(assert (=> b!1422497 m!1313057))

(declare-fun m!1313081 () Bool)

(assert (=> b!1422497 m!1313081))

(assert (=> b!1422505 m!1313057))

(assert (=> b!1422505 m!1313057))

(declare-fun m!1313083 () Bool)

(assert (=> b!1422505 m!1313083))

(declare-fun m!1313085 () Bool)

(assert (=> b!1422495 m!1313085))

(assert (=> b!1422504 m!1313057))

(assert (=> b!1422504 m!1313057))

(declare-fun m!1313087 () Bool)

(assert (=> b!1422504 m!1313087))

(assert (=> b!1422504 m!1313087))

(assert (=> b!1422504 m!1313057))

(declare-fun m!1313089 () Bool)

(assert (=> b!1422504 m!1313089))

(check-sat (not b!1422508) (not b!1422496) (not b!1422501) (not b!1422505) (not b!1422509) (not b!1422503) (not start!122744) (not b!1422498) (not b!1422507) (not b!1422499) (not b!1422500) (not b!1422495) (not b!1422497) (not b!1422504))
(check-sat)
