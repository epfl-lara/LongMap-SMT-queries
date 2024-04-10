; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122824 () Bool)

(assert start!122824)

(declare-fun b!1424415 () Bool)

(declare-fun res!959857 () Bool)

(declare-fun e!805007 () Bool)

(assert (=> b!1424415 (=> (not res!959857) (not e!805007))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97189 0))(
  ( (array!97190 (arr!46912 (Array (_ BitVec 32) (_ BitVec 64))) (size!47462 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97189)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424415 (= res!959857 (and (= (size!47462 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47462 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47462 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424416 () Bool)

(declare-fun res!959863 () Bool)

(assert (=> b!1424416 (=> (not res!959863) (not e!805007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424416 (= res!959863 (validKeyInArray!0 (select (arr!46912 a!2831) j!81)))))

(declare-fun b!1424417 () Bool)

(declare-fun e!805009 () Bool)

(declare-fun e!805005 () Bool)

(assert (=> b!1424417 (= e!805009 e!805005)))

(declare-fun res!959849 () Bool)

(assert (=> b!1424417 (=> res!959849 e!805005)))

(declare-fun lt!627545 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1424417 (= res!959849 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627545 #b00000000000000000000000000000000) (bvsge lt!627545 (size!47462 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424417 (= lt!627545 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1424418 () Bool)

(assert (=> b!1424418 (= e!805005 true)))

(declare-fun lt!627544 () (_ BitVec 64))

(declare-fun lt!627546 () array!97189)

(declare-datatypes ((SeekEntryResult!11197 0))(
  ( (MissingZero!11197 (index!47180 (_ BitVec 32))) (Found!11197 (index!47181 (_ BitVec 32))) (Intermediate!11197 (undefined!12009 Bool) (index!47182 (_ BitVec 32)) (x!128807 (_ BitVec 32))) (Undefined!11197) (MissingVacant!11197 (index!47183 (_ BitVec 32))) )
))
(declare-fun lt!627541 () SeekEntryResult!11197)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97189 (_ BitVec 32)) SeekEntryResult!11197)

(assert (=> b!1424418 (= lt!627541 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627545 lt!627544 lt!627546 mask!2608))))

(declare-fun b!1424419 () Bool)

(declare-fun res!959856 () Bool)

(assert (=> b!1424419 (=> (not res!959856) (not e!805007))))

(assert (=> b!1424419 (= res!959856 (validKeyInArray!0 (select (arr!46912 a!2831) i!982)))))

(declare-fun b!1424421 () Bool)

(declare-fun res!959860 () Bool)

(declare-fun e!805004 () Bool)

(assert (=> b!1424421 (=> (not res!959860) (not e!805004))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424421 (= res!959860 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424422 () Bool)

(declare-fun res!959862 () Bool)

(assert (=> b!1424422 (=> (not res!959862) (not e!805004))))

(declare-fun lt!627542 () SeekEntryResult!11197)

(assert (=> b!1424422 (= res!959862 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!627542))))

(declare-fun b!1424423 () Bool)

(declare-fun res!959854 () Bool)

(assert (=> b!1424423 (=> (not res!959854) (not e!805007))))

(assert (=> b!1424423 (= res!959854 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47462 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47462 a!2831))))))

(declare-fun b!1424424 () Bool)

(declare-fun res!959851 () Bool)

(assert (=> b!1424424 (=> (not res!959851) (not e!805007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97189 (_ BitVec 32)) Bool)

(assert (=> b!1424424 (= res!959851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424425 () Bool)

(declare-fun res!959848 () Bool)

(assert (=> b!1424425 (=> (not res!959848) (not e!805004))))

(declare-fun lt!627543 () SeekEntryResult!11197)

(assert (=> b!1424425 (= res!959848 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627544 lt!627546 mask!2608) lt!627543))))

(declare-fun b!1424426 () Bool)

(declare-fun res!959861 () Bool)

(assert (=> b!1424426 (=> res!959861 e!805005)))

(assert (=> b!1424426 (= res!959861 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627545 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!627542)))))

(declare-fun b!1424427 () Bool)

(assert (=> b!1424427 (= e!805004 (not e!805009))))

(declare-fun res!959859 () Bool)

(assert (=> b!1424427 (=> res!959859 e!805009)))

(assert (=> b!1424427 (= res!959859 (or (= (select (arr!46912 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46912 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46912 a!2831) index!585) (select (arr!46912 a!2831) j!81)) (= (select (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!805006 () Bool)

(assert (=> b!1424427 e!805006))

(declare-fun res!959855 () Bool)

(assert (=> b!1424427 (=> (not res!959855) (not e!805006))))

(assert (=> b!1424427 (= res!959855 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48230 0))(
  ( (Unit!48231) )
))
(declare-fun lt!627540 () Unit!48230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48230)

(assert (=> b!1424427 (= lt!627540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424428 () Bool)

(declare-fun e!805008 () Bool)

(assert (=> b!1424428 (= e!805008 e!805004)))

(declare-fun res!959850 () Bool)

(assert (=> b!1424428 (=> (not res!959850) (not e!805004))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424428 (= res!959850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627544 mask!2608) lt!627544 lt!627546 mask!2608) lt!627543))))

(assert (=> b!1424428 (= lt!627543 (Intermediate!11197 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1424428 (= lt!627544 (select (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424428 (= lt!627546 (array!97190 (store (arr!46912 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47462 a!2831)))))

(declare-fun res!959858 () Bool)

(assert (=> start!122824 (=> (not res!959858) (not e!805007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122824 (= res!959858 (validMask!0 mask!2608))))

(assert (=> start!122824 e!805007))

(assert (=> start!122824 true))

(declare-fun array_inv!35940 (array!97189) Bool)

(assert (=> start!122824 (array_inv!35940 a!2831)))

(declare-fun b!1424420 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97189 (_ BitVec 32)) SeekEntryResult!11197)

(assert (=> b!1424420 (= e!805006 (= (seekEntryOrOpen!0 (select (arr!46912 a!2831) j!81) a!2831 mask!2608) (Found!11197 j!81)))))

(declare-fun b!1424429 () Bool)

(declare-fun res!959852 () Bool)

(assert (=> b!1424429 (=> (not res!959852) (not e!805007))))

(declare-datatypes ((List!33422 0))(
  ( (Nil!33419) (Cons!33418 (h!34720 (_ BitVec 64)) (t!48116 List!33422)) )
))
(declare-fun arrayNoDuplicates!0 (array!97189 (_ BitVec 32) List!33422) Bool)

(assert (=> b!1424429 (= res!959852 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33419))))

(declare-fun b!1424430 () Bool)

(assert (=> b!1424430 (= e!805007 e!805008)))

(declare-fun res!959853 () Bool)

(assert (=> b!1424430 (=> (not res!959853) (not e!805008))))

(assert (=> b!1424430 (= res!959853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46912 a!2831) j!81) mask!2608) (select (arr!46912 a!2831) j!81) a!2831 mask!2608) lt!627542))))

(assert (=> b!1424430 (= lt!627542 (Intermediate!11197 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122824 res!959858) b!1424415))

(assert (= (and b!1424415 res!959857) b!1424419))

(assert (= (and b!1424419 res!959856) b!1424416))

(assert (= (and b!1424416 res!959863) b!1424424))

(assert (= (and b!1424424 res!959851) b!1424429))

(assert (= (and b!1424429 res!959852) b!1424423))

(assert (= (and b!1424423 res!959854) b!1424430))

(assert (= (and b!1424430 res!959853) b!1424428))

(assert (= (and b!1424428 res!959850) b!1424422))

(assert (= (and b!1424422 res!959862) b!1424425))

(assert (= (and b!1424425 res!959848) b!1424421))

(assert (= (and b!1424421 res!959860) b!1424427))

(assert (= (and b!1424427 res!959855) b!1424420))

(assert (= (and b!1424427 (not res!959859)) b!1424417))

(assert (= (and b!1424417 (not res!959849)) b!1424426))

(assert (= (and b!1424426 (not res!959861)) b!1424418))

(declare-fun m!1314963 () Bool)

(assert (=> b!1424425 m!1314963))

(declare-fun m!1314965 () Bool)

(assert (=> b!1424430 m!1314965))

(assert (=> b!1424430 m!1314965))

(declare-fun m!1314967 () Bool)

(assert (=> b!1424430 m!1314967))

(assert (=> b!1424430 m!1314967))

(assert (=> b!1424430 m!1314965))

(declare-fun m!1314969 () Bool)

(assert (=> b!1424430 m!1314969))

(declare-fun m!1314971 () Bool)

(assert (=> start!122824 m!1314971))

(declare-fun m!1314973 () Bool)

(assert (=> start!122824 m!1314973))

(declare-fun m!1314975 () Bool)

(assert (=> b!1424417 m!1314975))

(assert (=> b!1424416 m!1314965))

(assert (=> b!1424416 m!1314965))

(declare-fun m!1314977 () Bool)

(assert (=> b!1424416 m!1314977))

(declare-fun m!1314979 () Bool)

(assert (=> b!1424429 m!1314979))

(declare-fun m!1314981 () Bool)

(assert (=> b!1424428 m!1314981))

(assert (=> b!1424428 m!1314981))

(declare-fun m!1314983 () Bool)

(assert (=> b!1424428 m!1314983))

(declare-fun m!1314985 () Bool)

(assert (=> b!1424428 m!1314985))

(declare-fun m!1314987 () Bool)

(assert (=> b!1424428 m!1314987))

(assert (=> b!1424426 m!1314965))

(assert (=> b!1424426 m!1314965))

(declare-fun m!1314989 () Bool)

(assert (=> b!1424426 m!1314989))

(declare-fun m!1314991 () Bool)

(assert (=> b!1424424 m!1314991))

(declare-fun m!1314993 () Bool)

(assert (=> b!1424419 m!1314993))

(assert (=> b!1424419 m!1314993))

(declare-fun m!1314995 () Bool)

(assert (=> b!1424419 m!1314995))

(assert (=> b!1424420 m!1314965))

(assert (=> b!1424420 m!1314965))

(declare-fun m!1314997 () Bool)

(assert (=> b!1424420 m!1314997))

(declare-fun m!1314999 () Bool)

(assert (=> b!1424418 m!1314999))

(assert (=> b!1424427 m!1314985))

(declare-fun m!1315001 () Bool)

(assert (=> b!1424427 m!1315001))

(declare-fun m!1315003 () Bool)

(assert (=> b!1424427 m!1315003))

(declare-fun m!1315005 () Bool)

(assert (=> b!1424427 m!1315005))

(assert (=> b!1424427 m!1314965))

(declare-fun m!1315007 () Bool)

(assert (=> b!1424427 m!1315007))

(assert (=> b!1424422 m!1314965))

(assert (=> b!1424422 m!1314965))

(declare-fun m!1315009 () Bool)

(assert (=> b!1424422 m!1315009))

(push 1)

