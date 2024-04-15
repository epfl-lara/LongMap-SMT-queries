; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123698 () Bool)

(assert start!123698)

(declare-fun b!1433777 () Bool)

(declare-fun res!967346 () Bool)

(declare-fun e!809268 () Bool)

(assert (=> b!1433777 (=> (not res!967346) (not e!809268))))

(declare-datatypes ((array!97521 0))(
  ( (array!97522 (arr!47065 (Array (_ BitVec 32) (_ BitVec 64))) (size!47617 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97521)

(declare-datatypes ((List!33653 0))(
  ( (Nil!33650) (Cons!33649 (h!34978 (_ BitVec 64)) (t!48339 List!33653)) )
))
(declare-fun arrayNoDuplicates!0 (array!97521 (_ BitVec 32) List!33653) Bool)

(assert (=> b!1433777 (= res!967346 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33650))))

(declare-fun b!1433778 () Bool)

(declare-fun res!967350 () Bool)

(assert (=> b!1433778 (=> (not res!967350) (not e!809268))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97521 (_ BitVec 32)) Bool)

(assert (=> b!1433778 (= res!967350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433779 () Bool)

(declare-fun e!809264 () Bool)

(declare-fun e!809265 () Bool)

(assert (=> b!1433779 (= e!809264 (not e!809265))))

(declare-fun res!967344 () Bool)

(assert (=> b!1433779 (=> res!967344 e!809265)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433779 (= res!967344 (or (= (select (arr!47065 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47065 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47065 a!2831) index!585) (select (arr!47065 a!2831) j!81)) (= (select (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809263 () Bool)

(assert (=> b!1433779 e!809263))

(declare-fun res!967354 () Bool)

(assert (=> b!1433779 (=> (not res!967354) (not e!809263))))

(assert (=> b!1433779 (= res!967354 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48327 0))(
  ( (Unit!48328) )
))
(declare-fun lt!631030 () Unit!48327)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48327)

(assert (=> b!1433779 (= lt!631030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433780 () Bool)

(declare-fun res!967345 () Bool)

(assert (=> b!1433780 (=> (not res!967345) (not e!809268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433780 (= res!967345 (validKeyInArray!0 (select (arr!47065 a!2831) j!81)))))

(declare-fun b!1433781 () Bool)

(declare-fun res!967356 () Bool)

(assert (=> b!1433781 (=> (not res!967356) (not e!809264))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433781 (= res!967356 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433782 () Bool)

(declare-fun res!967349 () Bool)

(assert (=> b!1433782 (=> (not res!967349) (not e!809268))))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1433782 (= res!967349 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47617 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47617 a!2831))))))

(declare-fun b!1433783 () Bool)

(declare-fun res!967351 () Bool)

(assert (=> b!1433783 (=> (not res!967351) (not e!809268))))

(assert (=> b!1433783 (= res!967351 (and (= (size!47617 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47617 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47617 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433784 () Bool)

(declare-fun res!967352 () Bool)

(assert (=> b!1433784 (=> (not res!967352) (not e!809268))))

(assert (=> b!1433784 (= res!967352 (validKeyInArray!0 (select (arr!47065 a!2831) i!982)))))

(declare-fun b!1433785 () Bool)

(declare-fun e!809266 () Bool)

(assert (=> b!1433785 (= e!809266 e!809264)))

(declare-fun res!967357 () Bool)

(assert (=> b!1433785 (=> (not res!967357) (not e!809264))))

(declare-fun lt!631031 () array!97521)

(declare-datatypes ((SeekEntryResult!11371 0))(
  ( (MissingZero!11371 (index!47876 (_ BitVec 32))) (Found!11371 (index!47877 (_ BitVec 32))) (Intermediate!11371 (undefined!12183 Bool) (index!47878 (_ BitVec 32)) (x!129522 (_ BitVec 32))) (Undefined!11371) (MissingVacant!11371 (index!47879 (_ BitVec 32))) )
))
(declare-fun lt!631034 () SeekEntryResult!11371)

(declare-fun lt!631035 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97521 (_ BitVec 32)) SeekEntryResult!11371)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433785 (= res!967357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631035 mask!2608) lt!631035 lt!631031 mask!2608) lt!631034))))

(assert (=> b!1433785 (= lt!631034 (Intermediate!11371 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433785 (= lt!631035 (select (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433785 (= lt!631031 (array!97522 (store (arr!47065 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47617 a!2831)))))

(declare-fun res!967353 () Bool)

(assert (=> start!123698 (=> (not res!967353) (not e!809268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123698 (= res!967353 (validMask!0 mask!2608))))

(assert (=> start!123698 e!809268))

(assert (=> start!123698 true))

(declare-fun array_inv!36298 (array!97521) Bool)

(assert (=> start!123698 (array_inv!36298 a!2831)))

(declare-fun b!1433786 () Bool)

(assert (=> b!1433786 (= e!809265 true)))

(declare-fun lt!631032 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433786 (= lt!631032 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433787 () Bool)

(declare-fun res!967348 () Bool)

(assert (=> b!1433787 (=> (not res!967348) (not e!809264))))

(assert (=> b!1433787 (= res!967348 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631035 lt!631031 mask!2608) lt!631034))))

(declare-fun b!1433788 () Bool)

(assert (=> b!1433788 (= e!809268 e!809266)))

(declare-fun res!967347 () Bool)

(assert (=> b!1433788 (=> (not res!967347) (not e!809266))))

(declare-fun lt!631033 () SeekEntryResult!11371)

(assert (=> b!1433788 (= res!967347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47065 a!2831) j!81) mask!2608) (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!631033))))

(assert (=> b!1433788 (= lt!631033 (Intermediate!11371 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433789 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97521 (_ BitVec 32)) SeekEntryResult!11371)

(assert (=> b!1433789 (= e!809263 (= (seekEntryOrOpen!0 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) (Found!11371 j!81)))))

(declare-fun b!1433790 () Bool)

(declare-fun res!967355 () Bool)

(assert (=> b!1433790 (=> (not res!967355) (not e!809264))))

(assert (=> b!1433790 (= res!967355 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47065 a!2831) j!81) a!2831 mask!2608) lt!631033))))

(assert (= (and start!123698 res!967353) b!1433783))

(assert (= (and b!1433783 res!967351) b!1433784))

(assert (= (and b!1433784 res!967352) b!1433780))

(assert (= (and b!1433780 res!967345) b!1433778))

(assert (= (and b!1433778 res!967350) b!1433777))

(assert (= (and b!1433777 res!967346) b!1433782))

(assert (= (and b!1433782 res!967349) b!1433788))

(assert (= (and b!1433788 res!967347) b!1433785))

(assert (= (and b!1433785 res!967357) b!1433790))

(assert (= (and b!1433790 res!967355) b!1433787))

(assert (= (and b!1433787 res!967348) b!1433781))

(assert (= (and b!1433781 res!967356) b!1433779))

(assert (= (and b!1433779 res!967354) b!1433789))

(assert (= (and b!1433779 (not res!967344)) b!1433786))

(declare-fun m!1322897 () Bool)

(assert (=> b!1433787 m!1322897))

(declare-fun m!1322899 () Bool)

(assert (=> b!1433789 m!1322899))

(assert (=> b!1433789 m!1322899))

(declare-fun m!1322901 () Bool)

(assert (=> b!1433789 m!1322901))

(declare-fun m!1322903 () Bool)

(assert (=> b!1433784 m!1322903))

(assert (=> b!1433784 m!1322903))

(declare-fun m!1322905 () Bool)

(assert (=> b!1433784 m!1322905))

(declare-fun m!1322907 () Bool)

(assert (=> start!123698 m!1322907))

(declare-fun m!1322909 () Bool)

(assert (=> start!123698 m!1322909))

(declare-fun m!1322911 () Bool)

(assert (=> b!1433777 m!1322911))

(assert (=> b!1433780 m!1322899))

(assert (=> b!1433780 m!1322899))

(declare-fun m!1322913 () Bool)

(assert (=> b!1433780 m!1322913))

(assert (=> b!1433788 m!1322899))

(assert (=> b!1433788 m!1322899))

(declare-fun m!1322915 () Bool)

(assert (=> b!1433788 m!1322915))

(assert (=> b!1433788 m!1322915))

(assert (=> b!1433788 m!1322899))

(declare-fun m!1322917 () Bool)

(assert (=> b!1433788 m!1322917))

(declare-fun m!1322919 () Bool)

(assert (=> b!1433786 m!1322919))

(declare-fun m!1322921 () Bool)

(assert (=> b!1433779 m!1322921))

(declare-fun m!1322923 () Bool)

(assert (=> b!1433779 m!1322923))

(declare-fun m!1322925 () Bool)

(assert (=> b!1433779 m!1322925))

(declare-fun m!1322927 () Bool)

(assert (=> b!1433779 m!1322927))

(assert (=> b!1433779 m!1322899))

(declare-fun m!1322929 () Bool)

(assert (=> b!1433779 m!1322929))

(declare-fun m!1322931 () Bool)

(assert (=> b!1433778 m!1322931))

(assert (=> b!1433790 m!1322899))

(assert (=> b!1433790 m!1322899))

(declare-fun m!1322933 () Bool)

(assert (=> b!1433790 m!1322933))

(declare-fun m!1322935 () Bool)

(assert (=> b!1433785 m!1322935))

(assert (=> b!1433785 m!1322935))

(declare-fun m!1322937 () Bool)

(assert (=> b!1433785 m!1322937))

(assert (=> b!1433785 m!1322921))

(declare-fun m!1322939 () Bool)

(assert (=> b!1433785 m!1322939))

(check-sat (not b!1433779) (not b!1433790) (not b!1433777) (not b!1433778) (not b!1433787) (not b!1433786) (not start!123698) (not b!1433788) (not b!1433785) (not b!1433784) (not b!1433789) (not b!1433780))
(check-sat)
