; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126476 () Bool)

(assert start!126476)

(declare-fun b!1483990 () Bool)

(declare-fun res!1009008 () Bool)

(declare-fun e!832018 () Bool)

(assert (=> b!1483990 (=> (not res!1009008) (not e!832018))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((array!99436 0))(
  ( (array!99437 (arr!47995 (Array (_ BitVec 32) (_ BitVec 64))) (size!48547 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99436)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1483990 (= res!1009008 (or (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47995 a!2862) intermediateBeforeIndex!19) (select (arr!47995 a!2862) j!93))))))

(declare-fun b!1483991 () Bool)

(declare-fun res!1009017 () Bool)

(declare-fun e!832012 () Bool)

(assert (=> b!1483991 (=> (not res!1009017) (not e!832012))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1483991 (= res!1009017 (validKeyInArray!0 (select (arr!47995 a!2862) i!1006)))))

(declare-fun b!1483992 () Bool)

(declare-fun res!1009014 () Bool)

(assert (=> b!1483992 (=> (not res!1009014) (not e!832012))))

(assert (=> b!1483992 (= res!1009014 (validKeyInArray!0 (select (arr!47995 a!2862) j!93)))))

(declare-fun b!1483993 () Bool)

(declare-fun res!1009001 () Bool)

(assert (=> b!1483993 (=> (not res!1009001) (not e!832018))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12260 0))(
  ( (MissingZero!12260 (index!51432 (_ BitVec 32))) (Found!12260 (index!51433 (_ BitVec 32))) (Intermediate!12260 (undefined!13072 Bool) (index!51434 (_ BitVec 32)) (x!133009 (_ BitVec 32))) (Undefined!12260) (MissingVacant!12260 (index!51435 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12260)

(assert (=> b!1483993 (= res!1009001 (= (seekEntryOrOpen!0 (select (arr!47995 a!2862) j!93) a!2862 mask!2687) (Found!12260 j!93)))))

(declare-fun res!1009009 () Bool)

(assert (=> start!126476 (=> (not res!1009009) (not e!832012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126476 (= res!1009009 (validMask!0 mask!2687))))

(assert (=> start!126476 e!832012))

(assert (=> start!126476 true))

(declare-fun array_inv!37228 (array!99436) Bool)

(assert (=> start!126476 (array_inv!37228 a!2862)))

(declare-fun b!1483994 () Bool)

(declare-fun e!832010 () Bool)

(assert (=> b!1483994 (= e!832018 e!832010)))

(declare-fun res!1009004 () Bool)

(assert (=> b!1483994 (=> res!1009004 e!832010)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!647433 () (_ BitVec 64))

(assert (=> b!1483994 (= res!1009004 (or (and (= (select (arr!47995 a!2862) index!646) lt!647433) (= (select (arr!47995 a!2862) index!646) (select (arr!47995 a!2862) j!93))) (= (select (arr!47995 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1483994 (= lt!647433 (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1483995 () Bool)

(declare-fun res!1009006 () Bool)

(declare-fun e!832014 () Bool)

(assert (=> b!1483995 (=> (not res!1009006) (not e!832014))))

(declare-fun e!832011 () Bool)

(assert (=> b!1483995 (= res!1009006 e!832011)))

(declare-fun c!137020 () Bool)

(assert (=> b!1483995 (= c!137020 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1483996 () Bool)

(declare-fun res!1009005 () Bool)

(assert (=> b!1483996 (=> (not res!1009005) (not e!832014))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1483996 (= res!1009005 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1483997 () Bool)

(declare-fun lt!647430 () array!99436)

(declare-fun lt!647435 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12260)

(assert (=> b!1483997 (= e!832011 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647435 lt!647430 mask!2687) (seekEntryOrOpen!0 lt!647435 lt!647430 mask!2687)))))

(declare-fun b!1483998 () Bool)

(declare-fun res!1009011 () Bool)

(assert (=> b!1483998 (=> (not res!1009011) (not e!832012))))

(assert (=> b!1483998 (= res!1009011 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48547 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48547 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48547 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!832016 () Bool)

(declare-fun b!1483999 () Bool)

(assert (=> b!1483999 (= e!832016 (= (seekEntryOrOpen!0 lt!647435 lt!647430 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647435 lt!647430 mask!2687)))))

(declare-fun b!1484000 () Bool)

(declare-fun res!1009012 () Bool)

(assert (=> b!1484000 (=> (not res!1009012) (not e!832012))))

(declare-datatypes ((List!34574 0))(
  ( (Nil!34571) (Cons!34570 (h!35944 (_ BitVec 64)) (t!49260 List!34574)) )
))
(declare-fun arrayNoDuplicates!0 (array!99436 (_ BitVec 32) List!34574) Bool)

(assert (=> b!1484000 (= res!1009012 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34571))))

(declare-fun b!1484001 () Bool)

(declare-fun e!832013 () Bool)

(assert (=> b!1484001 (= e!832013 true)))

(declare-fun lt!647432 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484001 (= lt!647432 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484002 () Bool)

(declare-fun res!1009000 () Bool)

(declare-fun e!832015 () Bool)

(assert (=> b!1484002 (=> (not res!1009000) (not e!832015))))

(declare-fun lt!647434 () SeekEntryResult!12260)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99436 (_ BitVec 32)) SeekEntryResult!12260)

(assert (=> b!1484002 (= res!1009000 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!647434))))

(declare-fun b!1484003 () Bool)

(declare-fun res!1009013 () Bool)

(assert (=> b!1484003 (=> (not res!1009013) (not e!832012))))

(assert (=> b!1484003 (= res!1009013 (and (= (size!48547 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48547 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48547 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484004 () Bool)

(assert (=> b!1484004 (= e!832010 e!832016)))

(declare-fun res!1009007 () Bool)

(assert (=> b!1484004 (=> (not res!1009007) (not e!832016))))

(assert (=> b!1484004 (= res!1009007 (and (= index!646 intermediateAfterIndex!19) (= lt!647433 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484005 () Bool)

(declare-fun e!832019 () Bool)

(assert (=> b!1484005 (= e!832019 e!832015)))

(declare-fun res!1009003 () Bool)

(assert (=> b!1484005 (=> (not res!1009003) (not e!832015))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484005 (= res!1009003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47995 a!2862) j!93) mask!2687) (select (arr!47995 a!2862) j!93) a!2862 mask!2687) lt!647434))))

(assert (=> b!1484005 (= lt!647434 (Intermediate!12260 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484006 () Bool)

(declare-fun res!1009015 () Bool)

(assert (=> b!1484006 (=> (not res!1009015) (not e!832012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99436 (_ BitVec 32)) Bool)

(assert (=> b!1484006 (= res!1009015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484007 () Bool)

(assert (=> b!1484007 (= e!832014 (not e!832013))))

(declare-fun res!1009016 () Bool)

(assert (=> b!1484007 (=> res!1009016 e!832013)))

(assert (=> b!1484007 (= res!1009016 (or (and (= (select (arr!47995 a!2862) index!646) (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47995 a!2862) index!646) (select (arr!47995 a!2862) j!93))) (= (select (arr!47995 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484007 e!832018))

(declare-fun res!1009018 () Bool)

(assert (=> b!1484007 (=> (not res!1009018) (not e!832018))))

(assert (=> b!1484007 (= res!1009018 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49701 0))(
  ( (Unit!49702) )
))
(declare-fun lt!647429 () Unit!49701)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49701)

(assert (=> b!1484007 (= lt!647429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1484008 () Bool)

(assert (=> b!1484008 (= e!832015 e!832014)))

(declare-fun res!1009010 () Bool)

(assert (=> b!1484008 (=> (not res!1009010) (not e!832014))))

(declare-fun lt!647431 () SeekEntryResult!12260)

(assert (=> b!1484008 (= res!1009010 (= lt!647431 (Intermediate!12260 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484008 (= lt!647431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647435 mask!2687) lt!647435 lt!647430 mask!2687))))

(assert (=> b!1484008 (= lt!647435 (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484009 () Bool)

(assert (=> b!1484009 (= e!832012 e!832019)))

(declare-fun res!1009002 () Bool)

(assert (=> b!1484009 (=> (not res!1009002) (not e!832019))))

(assert (=> b!1484009 (= res!1009002 (= (select (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484009 (= lt!647430 (array!99437 (store (arr!47995 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48547 a!2862)))))

(declare-fun b!1484010 () Bool)

(assert (=> b!1484010 (= e!832011 (= lt!647431 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647435 lt!647430 mask!2687)))))

(assert (= (and start!126476 res!1009009) b!1484003))

(assert (= (and b!1484003 res!1009013) b!1483991))

(assert (= (and b!1483991 res!1009017) b!1483992))

(assert (= (and b!1483992 res!1009014) b!1484006))

(assert (= (and b!1484006 res!1009015) b!1484000))

(assert (= (and b!1484000 res!1009012) b!1483998))

(assert (= (and b!1483998 res!1009011) b!1484009))

(assert (= (and b!1484009 res!1009002) b!1484005))

(assert (= (and b!1484005 res!1009003) b!1484002))

(assert (= (and b!1484002 res!1009000) b!1484008))

(assert (= (and b!1484008 res!1009010) b!1483995))

(assert (= (and b!1483995 c!137020) b!1484010))

(assert (= (and b!1483995 (not c!137020)) b!1483997))

(assert (= (and b!1483995 res!1009006) b!1483996))

(assert (= (and b!1483996 res!1009005) b!1484007))

(assert (= (and b!1484007 res!1009018) b!1483993))

(assert (= (and b!1483993 res!1009001) b!1483990))

(assert (= (and b!1483990 res!1009008) b!1483994))

(assert (= (and b!1483994 (not res!1009004)) b!1484004))

(assert (= (and b!1484004 res!1009007) b!1483999))

(assert (= (and b!1484007 (not res!1009016)) b!1484001))

(declare-fun m!1368777 () Bool)

(assert (=> b!1484006 m!1368777))

(declare-fun m!1368779 () Bool)

(assert (=> b!1484000 m!1368779))

(declare-fun m!1368781 () Bool)

(assert (=> b!1484009 m!1368781))

(declare-fun m!1368783 () Bool)

(assert (=> b!1484009 m!1368783))

(declare-fun m!1368785 () Bool)

(assert (=> b!1484007 m!1368785))

(assert (=> b!1484007 m!1368781))

(declare-fun m!1368787 () Bool)

(assert (=> b!1484007 m!1368787))

(declare-fun m!1368789 () Bool)

(assert (=> b!1484007 m!1368789))

(declare-fun m!1368791 () Bool)

(assert (=> b!1484007 m!1368791))

(declare-fun m!1368793 () Bool)

(assert (=> b!1484007 m!1368793))

(assert (=> b!1483992 m!1368793))

(assert (=> b!1483992 m!1368793))

(declare-fun m!1368795 () Bool)

(assert (=> b!1483992 m!1368795))

(declare-fun m!1368797 () Bool)

(assert (=> b!1483999 m!1368797))

(declare-fun m!1368799 () Bool)

(assert (=> b!1483999 m!1368799))

(assert (=> b!1483994 m!1368789))

(assert (=> b!1483994 m!1368793))

(assert (=> b!1483994 m!1368781))

(assert (=> b!1483994 m!1368787))

(assert (=> b!1484005 m!1368793))

(assert (=> b!1484005 m!1368793))

(declare-fun m!1368801 () Bool)

(assert (=> b!1484005 m!1368801))

(assert (=> b!1484005 m!1368801))

(assert (=> b!1484005 m!1368793))

(declare-fun m!1368803 () Bool)

(assert (=> b!1484005 m!1368803))

(assert (=> b!1483997 m!1368799))

(assert (=> b!1483997 m!1368797))

(declare-fun m!1368805 () Bool)

(assert (=> b!1483990 m!1368805))

(assert (=> b!1483990 m!1368793))

(declare-fun m!1368807 () Bool)

(assert (=> start!126476 m!1368807))

(declare-fun m!1368809 () Bool)

(assert (=> start!126476 m!1368809))

(assert (=> b!1484002 m!1368793))

(assert (=> b!1484002 m!1368793))

(declare-fun m!1368811 () Bool)

(assert (=> b!1484002 m!1368811))

(declare-fun m!1368813 () Bool)

(assert (=> b!1484010 m!1368813))

(declare-fun m!1368815 () Bool)

(assert (=> b!1483991 m!1368815))

(assert (=> b!1483991 m!1368815))

(declare-fun m!1368817 () Bool)

(assert (=> b!1483991 m!1368817))

(assert (=> b!1483993 m!1368793))

(assert (=> b!1483993 m!1368793))

(declare-fun m!1368819 () Bool)

(assert (=> b!1483993 m!1368819))

(declare-fun m!1368821 () Bool)

(assert (=> b!1484008 m!1368821))

(assert (=> b!1484008 m!1368821))

(declare-fun m!1368823 () Bool)

(assert (=> b!1484008 m!1368823))

(assert (=> b!1484008 m!1368781))

(declare-fun m!1368825 () Bool)

(assert (=> b!1484008 m!1368825))

(declare-fun m!1368827 () Bool)

(assert (=> b!1484001 m!1368827))

(check-sat (not b!1484001) (not b!1484000) (not start!126476) (not b!1484010) (not b!1484002) (not b!1484008) (not b!1483993) (not b!1484006) (not b!1483997) (not b!1483991) (not b!1484005) (not b!1484007) (not b!1483992) (not b!1483999))
(check-sat)
