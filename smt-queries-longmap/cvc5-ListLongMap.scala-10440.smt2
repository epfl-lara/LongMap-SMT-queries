; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122802 () Bool)

(assert start!122802)

(declare-fun b!1423887 () Bool)

(declare-fun res!959329 () Bool)

(declare-fun e!804774 () Bool)

(assert (=> b!1423887 (=> (not res!959329) (not e!804774))))

(declare-datatypes ((array!97167 0))(
  ( (array!97168 (arr!46901 (Array (_ BitVec 32) (_ BitVec 64))) (size!47451 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97167)

(declare-datatypes ((List!33411 0))(
  ( (Nil!33408) (Cons!33407 (h!34709 (_ BitVec 64)) (t!48105 List!33411)) )
))
(declare-fun arrayNoDuplicates!0 (array!97167 (_ BitVec 32) List!33411) Bool)

(assert (=> b!1423887 (= res!959329 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33408))))

(declare-fun b!1423888 () Bool)

(declare-fun res!959324 () Bool)

(assert (=> b!1423888 (=> (not res!959324) (not e!804774))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423888 (= res!959324 (validKeyInArray!0 (select (arr!46901 a!2831) i!982)))))

(declare-fun b!1423889 () Bool)

(declare-fun res!959330 () Bool)

(declare-fun e!804779 () Bool)

(assert (=> b!1423889 (=> (not res!959330) (not e!804779))))

(declare-datatypes ((SeekEntryResult!11186 0))(
  ( (MissingZero!11186 (index!47136 (_ BitVec 32))) (Found!11186 (index!47137 (_ BitVec 32))) (Intermediate!11186 (undefined!11998 Bool) (index!47138 (_ BitVec 32)) (x!128772 (_ BitVec 32))) (Undefined!11186) (MissingVacant!11186 (index!47139 (_ BitVec 32))) )
))
(declare-fun lt!627314 () SeekEntryResult!11186)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97167 (_ BitVec 32)) SeekEntryResult!11186)

(assert (=> b!1423889 (= res!959330 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46901 a!2831) j!81) a!2831 mask!2608) lt!627314))))

(declare-fun b!1423890 () Bool)

(declare-fun res!959331 () Bool)

(assert (=> b!1423890 (=> (not res!959331) (not e!804774))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423890 (= res!959331 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47451 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47451 a!2831))))))

(declare-fun e!804773 () Bool)

(declare-fun b!1423891 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97167 (_ BitVec 32)) SeekEntryResult!11186)

(assert (=> b!1423891 (= e!804773 (= (seekEntryOrOpen!0 (select (arr!46901 a!2831) j!81) a!2831 mask!2608) (Found!11186 j!81)))))

(declare-fun b!1423892 () Bool)

(declare-fun e!804777 () Bool)

(assert (=> b!1423892 (= e!804774 e!804777)))

(declare-fun res!959325 () Bool)

(assert (=> b!1423892 (=> (not res!959325) (not e!804777))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423892 (= res!959325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46901 a!2831) j!81) mask!2608) (select (arr!46901 a!2831) j!81) a!2831 mask!2608) lt!627314))))

(assert (=> b!1423892 (= lt!627314 (Intermediate!11186 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423894 () Bool)

(declare-fun res!959328 () Bool)

(assert (=> b!1423894 (=> (not res!959328) (not e!804774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97167 (_ BitVec 32)) Bool)

(assert (=> b!1423894 (= res!959328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423895 () Bool)

(declare-fun res!959322 () Bool)

(assert (=> b!1423895 (=> (not res!959322) (not e!804774))))

(assert (=> b!1423895 (= res!959322 (and (= (size!47451 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47451 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47451 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423896 () Bool)

(declare-fun res!959332 () Bool)

(declare-fun e!804778 () Bool)

(assert (=> b!1423896 (=> res!959332 e!804778)))

(declare-fun lt!627310 () (_ BitVec 32))

(assert (=> b!1423896 (= res!959332 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627310 (select (arr!46901 a!2831) j!81) a!2831 mask!2608) lt!627314)))))

(declare-fun b!1423897 () Bool)

(declare-fun e!804775 () Bool)

(assert (=> b!1423897 (= e!804775 e!804778)))

(declare-fun res!959323 () Bool)

(assert (=> b!1423897 (=> res!959323 e!804778)))

(assert (=> b!1423897 (= res!959323 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627310 #b00000000000000000000000000000000) (bvsge lt!627310 (size!47451 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423897 (= lt!627310 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423898 () Bool)

(assert (=> b!1423898 (= e!804777 e!804779)))

(declare-fun res!959333 () Bool)

(assert (=> b!1423898 (=> (not res!959333) (not e!804779))))

(declare-fun lt!627311 () (_ BitVec 64))

(declare-fun lt!627313 () array!97167)

(declare-fun lt!627312 () SeekEntryResult!11186)

(assert (=> b!1423898 (= res!959333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627311 mask!2608) lt!627311 lt!627313 mask!2608) lt!627312))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423898 (= lt!627312 (Intermediate!11186 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423898 (= lt!627311 (select (store (arr!46901 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423898 (= lt!627313 (array!97168 (store (arr!46901 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47451 a!2831)))))

(declare-fun b!1423899 () Bool)

(assert (=> b!1423899 (= e!804778 true)))

(declare-fun lt!627309 () SeekEntryResult!11186)

(assert (=> b!1423899 (= lt!627309 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627310 lt!627311 lt!627313 mask!2608))))

(declare-fun b!1423900 () Bool)

(declare-fun res!959326 () Bool)

(assert (=> b!1423900 (=> (not res!959326) (not e!804774))))

(assert (=> b!1423900 (= res!959326 (validKeyInArray!0 (select (arr!46901 a!2831) j!81)))))

(declare-fun b!1423901 () Bool)

(declare-fun res!959321 () Bool)

(assert (=> b!1423901 (=> (not res!959321) (not e!804779))))

(assert (=> b!1423901 (= res!959321 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423902 () Bool)

(assert (=> b!1423902 (= e!804779 (not e!804775))))

(declare-fun res!959335 () Bool)

(assert (=> b!1423902 (=> res!959335 e!804775)))

(assert (=> b!1423902 (= res!959335 (or (= (select (arr!46901 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46901 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46901 a!2831) index!585) (select (arr!46901 a!2831) j!81)) (= (select (store (arr!46901 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423902 e!804773))

(declare-fun res!959334 () Bool)

(assert (=> b!1423902 (=> (not res!959334) (not e!804773))))

(assert (=> b!1423902 (= res!959334 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48208 0))(
  ( (Unit!48209) )
))
(declare-fun lt!627315 () Unit!48208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48208)

(assert (=> b!1423902 (= lt!627315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423893 () Bool)

(declare-fun res!959327 () Bool)

(assert (=> b!1423893 (=> (not res!959327) (not e!804779))))

(assert (=> b!1423893 (= res!959327 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627311 lt!627313 mask!2608) lt!627312))))

(declare-fun res!959320 () Bool)

(assert (=> start!122802 (=> (not res!959320) (not e!804774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122802 (= res!959320 (validMask!0 mask!2608))))

(assert (=> start!122802 e!804774))

(assert (=> start!122802 true))

(declare-fun array_inv!35929 (array!97167) Bool)

(assert (=> start!122802 (array_inv!35929 a!2831)))

(assert (= (and start!122802 res!959320) b!1423895))

(assert (= (and b!1423895 res!959322) b!1423888))

(assert (= (and b!1423888 res!959324) b!1423900))

(assert (= (and b!1423900 res!959326) b!1423894))

(assert (= (and b!1423894 res!959328) b!1423887))

(assert (= (and b!1423887 res!959329) b!1423890))

(assert (= (and b!1423890 res!959331) b!1423892))

(assert (= (and b!1423892 res!959325) b!1423898))

(assert (= (and b!1423898 res!959333) b!1423889))

(assert (= (and b!1423889 res!959330) b!1423893))

(assert (= (and b!1423893 res!959327) b!1423901))

(assert (= (and b!1423901 res!959321) b!1423902))

(assert (= (and b!1423902 res!959334) b!1423891))

(assert (= (and b!1423902 (not res!959335)) b!1423897))

(assert (= (and b!1423897 (not res!959323)) b!1423896))

(assert (= (and b!1423896 (not res!959332)) b!1423899))

(declare-fun m!1314435 () Bool)

(assert (=> b!1423894 m!1314435))

(declare-fun m!1314437 () Bool)

(assert (=> b!1423891 m!1314437))

(assert (=> b!1423891 m!1314437))

(declare-fun m!1314439 () Bool)

(assert (=> b!1423891 m!1314439))

(declare-fun m!1314441 () Bool)

(assert (=> b!1423898 m!1314441))

(assert (=> b!1423898 m!1314441))

(declare-fun m!1314443 () Bool)

(assert (=> b!1423898 m!1314443))

(declare-fun m!1314445 () Bool)

(assert (=> b!1423898 m!1314445))

(declare-fun m!1314447 () Bool)

(assert (=> b!1423898 m!1314447))

(assert (=> b!1423892 m!1314437))

(assert (=> b!1423892 m!1314437))

(declare-fun m!1314449 () Bool)

(assert (=> b!1423892 m!1314449))

(assert (=> b!1423892 m!1314449))

(assert (=> b!1423892 m!1314437))

(declare-fun m!1314451 () Bool)

(assert (=> b!1423892 m!1314451))

(declare-fun m!1314453 () Bool)

(assert (=> start!122802 m!1314453))

(declare-fun m!1314455 () Bool)

(assert (=> start!122802 m!1314455))

(assert (=> b!1423902 m!1314445))

(declare-fun m!1314457 () Bool)

(assert (=> b!1423902 m!1314457))

(declare-fun m!1314459 () Bool)

(assert (=> b!1423902 m!1314459))

(declare-fun m!1314461 () Bool)

(assert (=> b!1423902 m!1314461))

(assert (=> b!1423902 m!1314437))

(declare-fun m!1314463 () Bool)

(assert (=> b!1423902 m!1314463))

(declare-fun m!1314465 () Bool)

(assert (=> b!1423899 m!1314465))

(declare-fun m!1314467 () Bool)

(assert (=> b!1423893 m!1314467))

(declare-fun m!1314469 () Bool)

(assert (=> b!1423897 m!1314469))

(assert (=> b!1423889 m!1314437))

(assert (=> b!1423889 m!1314437))

(declare-fun m!1314471 () Bool)

(assert (=> b!1423889 m!1314471))

(assert (=> b!1423900 m!1314437))

(assert (=> b!1423900 m!1314437))

(declare-fun m!1314473 () Bool)

(assert (=> b!1423900 m!1314473))

(declare-fun m!1314475 () Bool)

(assert (=> b!1423887 m!1314475))

(assert (=> b!1423896 m!1314437))

(assert (=> b!1423896 m!1314437))

(declare-fun m!1314477 () Bool)

(assert (=> b!1423896 m!1314477))

(declare-fun m!1314479 () Bool)

(assert (=> b!1423888 m!1314479))

(assert (=> b!1423888 m!1314479))

(declare-fun m!1314481 () Bool)

(assert (=> b!1423888 m!1314481))

(push 1)

