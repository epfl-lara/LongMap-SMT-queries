; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123044 () Bool)

(assert start!123044)

(declare-fun b!1425336 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97280 0))(
  ( (array!97281 (arr!46954 (Array (_ BitVec 32) (_ BitVec 64))) (size!47505 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97280)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun e!805703 () Bool)

(declare-datatypes ((SeekEntryResult!11141 0))(
  ( (MissingZero!11141 (index!46956 (_ BitVec 32))) (Found!11141 (index!46957 (_ BitVec 32))) (Intermediate!11141 (undefined!11953 Bool) (index!46958 (_ BitVec 32)) (x!128752 (_ BitVec 32))) (Undefined!11141) (MissingVacant!11141 (index!46959 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97280 (_ BitVec 32)) SeekEntryResult!11141)

(assert (=> b!1425336 (= e!805703 (= (seekEntryOrOpen!0 (select (arr!46954 a!2831) j!81) a!2831 mask!2608) (Found!11141 j!81)))))

(declare-fun b!1425337 () Bool)

(declare-fun res!959892 () Bool)

(declare-fun e!805700 () Bool)

(assert (=> b!1425337 (=> (not res!959892) (not e!805700))))

(declare-datatypes ((List!33451 0))(
  ( (Nil!33448) (Cons!33447 (h!34760 (_ BitVec 64)) (t!48137 List!33451)) )
))
(declare-fun arrayNoDuplicates!0 (array!97280 (_ BitVec 32) List!33451) Bool)

(assert (=> b!1425337 (= res!959892 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33448))))

(declare-fun b!1425338 () Bool)

(declare-fun e!805706 () Bool)

(assert (=> b!1425338 (= e!805706 true)))

(declare-fun lt!627845 () SeekEntryResult!11141)

(declare-fun lt!627843 () (_ BitVec 32))

(declare-fun lt!627840 () (_ BitVec 64))

(declare-fun lt!627844 () array!97280)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97280 (_ BitVec 32)) SeekEntryResult!11141)

(assert (=> b!1425338 (= lt!627845 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627843 lt!627840 lt!627844 mask!2608))))

(declare-fun b!1425339 () Bool)

(declare-fun e!805701 () Bool)

(assert (=> b!1425339 (= e!805701 e!805706)))

(declare-fun res!959896 () Bool)

(assert (=> b!1425339 (=> res!959896 e!805706)))

(assert (=> b!1425339 (= res!959896 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627843 #b00000000000000000000000000000000) (bvsge lt!627843 (size!47505 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425339 (= lt!627843 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425340 () Bool)

(declare-fun res!959886 () Bool)

(declare-fun e!805704 () Bool)

(assert (=> b!1425340 (=> (not res!959886) (not e!805704))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425340 (= res!959886 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425341 () Bool)

(declare-fun res!959891 () Bool)

(assert (=> b!1425341 (=> (not res!959891) (not e!805700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97280 (_ BitVec 32)) Bool)

(assert (=> b!1425341 (= res!959891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!959893 () Bool)

(assert (=> start!123044 (=> (not res!959893) (not e!805700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123044 (= res!959893 (validMask!0 mask!2608))))

(assert (=> start!123044 e!805700))

(assert (=> start!123044 true))

(declare-fun array_inv!36235 (array!97280) Bool)

(assert (=> start!123044 (array_inv!36235 a!2831)))

(declare-fun b!1425342 () Bool)

(declare-fun res!959889 () Bool)

(assert (=> b!1425342 (=> (not res!959889) (not e!805704))))

(declare-fun lt!627839 () SeekEntryResult!11141)

(assert (=> b!1425342 (= res!959889 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627840 lt!627844 mask!2608) lt!627839))))

(declare-fun b!1425343 () Bool)

(declare-fun res!959890 () Bool)

(assert (=> b!1425343 (=> res!959890 e!805706)))

(declare-fun lt!627841 () SeekEntryResult!11141)

(assert (=> b!1425343 (= res!959890 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627843 (select (arr!46954 a!2831) j!81) a!2831 mask!2608) lt!627841)))))

(declare-fun b!1425344 () Bool)

(declare-fun e!805702 () Bool)

(assert (=> b!1425344 (= e!805700 e!805702)))

(declare-fun res!959888 () Bool)

(assert (=> b!1425344 (=> (not res!959888) (not e!805702))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425344 (= res!959888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46954 a!2831) j!81) mask!2608) (select (arr!46954 a!2831) j!81) a!2831 mask!2608) lt!627841))))

(assert (=> b!1425344 (= lt!627841 (Intermediate!11141 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425345 () Bool)

(assert (=> b!1425345 (= e!805704 (not e!805701))))

(declare-fun res!959897 () Bool)

(assert (=> b!1425345 (=> res!959897 e!805701)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425345 (= res!959897 (or (= (select (arr!46954 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46954 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46954 a!2831) index!585) (select (arr!46954 a!2831) j!81)) (= (select (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1425345 e!805703))

(declare-fun res!959884 () Bool)

(assert (=> b!1425345 (=> (not res!959884) (not e!805703))))

(assert (=> b!1425345 (= res!959884 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48149 0))(
  ( (Unit!48150) )
))
(declare-fun lt!627842 () Unit!48149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48149)

(assert (=> b!1425345 (= lt!627842 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425346 () Bool)

(assert (=> b!1425346 (= e!805702 e!805704)))

(declare-fun res!959898 () Bool)

(assert (=> b!1425346 (=> (not res!959898) (not e!805704))))

(assert (=> b!1425346 (= res!959898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627840 mask!2608) lt!627840 lt!627844 mask!2608) lt!627839))))

(assert (=> b!1425346 (= lt!627839 (Intermediate!11141 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1425346 (= lt!627840 (select (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425346 (= lt!627844 (array!97281 (store (arr!46954 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47505 a!2831)))))

(declare-fun b!1425347 () Bool)

(declare-fun res!959894 () Bool)

(assert (=> b!1425347 (=> (not res!959894) (not e!805700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425347 (= res!959894 (validKeyInArray!0 (select (arr!46954 a!2831) j!81)))))

(declare-fun b!1425348 () Bool)

(declare-fun res!959899 () Bool)

(assert (=> b!1425348 (=> (not res!959899) (not e!805700))))

(assert (=> b!1425348 (= res!959899 (validKeyInArray!0 (select (arr!46954 a!2831) i!982)))))

(declare-fun b!1425349 () Bool)

(declare-fun res!959885 () Bool)

(assert (=> b!1425349 (=> (not res!959885) (not e!805704))))

(assert (=> b!1425349 (= res!959885 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46954 a!2831) j!81) a!2831 mask!2608) lt!627841))))

(declare-fun b!1425350 () Bool)

(declare-fun res!959895 () Bool)

(assert (=> b!1425350 (=> (not res!959895) (not e!805700))))

(assert (=> b!1425350 (= res!959895 (and (= (size!47505 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47505 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47505 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425351 () Bool)

(declare-fun res!959887 () Bool)

(assert (=> b!1425351 (=> (not res!959887) (not e!805700))))

(assert (=> b!1425351 (= res!959887 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47505 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47505 a!2831))))))

(assert (= (and start!123044 res!959893) b!1425350))

(assert (= (and b!1425350 res!959895) b!1425348))

(assert (= (and b!1425348 res!959899) b!1425347))

(assert (= (and b!1425347 res!959894) b!1425341))

(assert (= (and b!1425341 res!959891) b!1425337))

(assert (= (and b!1425337 res!959892) b!1425351))

(assert (= (and b!1425351 res!959887) b!1425344))

(assert (= (and b!1425344 res!959888) b!1425346))

(assert (= (and b!1425346 res!959898) b!1425349))

(assert (= (and b!1425349 res!959885) b!1425342))

(assert (= (and b!1425342 res!959889) b!1425340))

(assert (= (and b!1425340 res!959886) b!1425345))

(assert (= (and b!1425345 res!959884) b!1425336))

(assert (= (and b!1425345 (not res!959897)) b!1425339))

(assert (= (and b!1425339 (not res!959896)) b!1425343))

(assert (= (and b!1425343 (not res!959890)) b!1425338))

(declare-fun m!1316001 () Bool)

(assert (=> b!1425342 m!1316001))

(declare-fun m!1316003 () Bool)

(assert (=> b!1425343 m!1316003))

(assert (=> b!1425343 m!1316003))

(declare-fun m!1316005 () Bool)

(assert (=> b!1425343 m!1316005))

(declare-fun m!1316007 () Bool)

(assert (=> b!1425345 m!1316007))

(declare-fun m!1316009 () Bool)

(assert (=> b!1425345 m!1316009))

(declare-fun m!1316011 () Bool)

(assert (=> b!1425345 m!1316011))

(declare-fun m!1316013 () Bool)

(assert (=> b!1425345 m!1316013))

(assert (=> b!1425345 m!1316003))

(declare-fun m!1316015 () Bool)

(assert (=> b!1425345 m!1316015))

(declare-fun m!1316017 () Bool)

(assert (=> b!1425337 m!1316017))

(declare-fun m!1316019 () Bool)

(assert (=> b!1425341 m!1316019))

(declare-fun m!1316021 () Bool)

(assert (=> b!1425339 m!1316021))

(assert (=> b!1425336 m!1316003))

(assert (=> b!1425336 m!1316003))

(declare-fun m!1316023 () Bool)

(assert (=> b!1425336 m!1316023))

(assert (=> b!1425349 m!1316003))

(assert (=> b!1425349 m!1316003))

(declare-fun m!1316025 () Bool)

(assert (=> b!1425349 m!1316025))

(assert (=> b!1425344 m!1316003))

(assert (=> b!1425344 m!1316003))

(declare-fun m!1316027 () Bool)

(assert (=> b!1425344 m!1316027))

(assert (=> b!1425344 m!1316027))

(assert (=> b!1425344 m!1316003))

(declare-fun m!1316029 () Bool)

(assert (=> b!1425344 m!1316029))

(declare-fun m!1316031 () Bool)

(assert (=> start!123044 m!1316031))

(declare-fun m!1316033 () Bool)

(assert (=> start!123044 m!1316033))

(declare-fun m!1316035 () Bool)

(assert (=> b!1425348 m!1316035))

(assert (=> b!1425348 m!1316035))

(declare-fun m!1316037 () Bool)

(assert (=> b!1425348 m!1316037))

(assert (=> b!1425347 m!1316003))

(assert (=> b!1425347 m!1316003))

(declare-fun m!1316039 () Bool)

(assert (=> b!1425347 m!1316039))

(declare-fun m!1316041 () Bool)

(assert (=> b!1425338 m!1316041))

(declare-fun m!1316043 () Bool)

(assert (=> b!1425346 m!1316043))

(assert (=> b!1425346 m!1316043))

(declare-fun m!1316045 () Bool)

(assert (=> b!1425346 m!1316045))

(assert (=> b!1425346 m!1316007))

(declare-fun m!1316047 () Bool)

(assert (=> b!1425346 m!1316047))

(check-sat (not b!1425346) (not start!123044) (not b!1425338) (not b!1425345) (not b!1425341) (not b!1425347) (not b!1425336) (not b!1425339) (not b!1425337) (not b!1425343) (not b!1425349) (not b!1425348) (not b!1425344) (not b!1425342))
(check-sat)
