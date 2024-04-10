; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123284 () Bool)

(assert start!123284)

(declare-fun b!1429800 () Bool)

(declare-fun res!964430 () Bool)

(declare-fun e!807278 () Bool)

(assert (=> b!1429800 (=> (not res!964430) (not e!807278))))

(declare-datatypes ((array!97445 0))(
  ( (array!97446 (arr!47034 (Array (_ BitVec 32) (_ BitVec 64))) (size!47584 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97445)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429800 (= res!964430 (validKeyInArray!0 (select (arr!47034 a!2831) j!81)))))

(declare-fun b!1429801 () Bool)

(declare-fun e!807277 () Bool)

(declare-fun e!807279 () Bool)

(assert (=> b!1429801 (= e!807277 e!807279)))

(declare-fun res!964440 () Bool)

(assert (=> b!1429801 (=> (not res!964440) (not e!807279))))

(declare-fun lt!629506 () array!97445)

(declare-fun lt!629507 () (_ BitVec 64))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11313 0))(
  ( (MissingZero!11313 (index!47644 (_ BitVec 32))) (Found!11313 (index!47645 (_ BitVec 32))) (Intermediate!11313 (undefined!12125 Bool) (index!47646 (_ BitVec 32)) (x!129275 (_ BitVec 32))) (Undefined!11313) (MissingVacant!11313 (index!47647 (_ BitVec 32))) )
))
(declare-fun lt!629508 () SeekEntryResult!11313)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97445 (_ BitVec 32)) SeekEntryResult!11313)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429801 (= res!964440 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629507 mask!2608) lt!629507 lt!629506 mask!2608) lt!629508))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429801 (= lt!629508 (Intermediate!11313 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429801 (= lt!629507 (select (store (arr!47034 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429801 (= lt!629506 (array!97446 (store (arr!47034 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47584 a!2831)))))

(declare-fun b!1429802 () Bool)

(declare-fun res!964429 () Bool)

(assert (=> b!1429802 (=> (not res!964429) (not e!807278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97445 (_ BitVec 32)) Bool)

(assert (=> b!1429802 (= res!964429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429803 () Bool)

(assert (=> b!1429803 (= e!807278 e!807277)))

(declare-fun res!964434 () Bool)

(assert (=> b!1429803 (=> (not res!964434) (not e!807277))))

(declare-fun lt!629505 () SeekEntryResult!11313)

(assert (=> b!1429803 (= res!964434 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47034 a!2831) j!81) mask!2608) (select (arr!47034 a!2831) j!81) a!2831 mask!2608) lt!629505))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429803 (= lt!629505 (Intermediate!11313 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429804 () Bool)

(declare-fun e!807281 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97445 (_ BitVec 32)) SeekEntryResult!11313)

(assert (=> b!1429804 (= e!807281 (= (seekEntryOrOpen!0 (select (arr!47034 a!2831) j!81) a!2831 mask!2608) (Found!11313 j!81)))))

(declare-fun b!1429805 () Bool)

(declare-fun res!964441 () Bool)

(assert (=> b!1429805 (=> (not res!964441) (not e!807279))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429805 (= res!964441 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629507 lt!629506 mask!2608) lt!629508))))

(declare-fun b!1429806 () Bool)

(declare-fun res!964438 () Bool)

(assert (=> b!1429806 (=> (not res!964438) (not e!807278))))

(declare-datatypes ((List!33544 0))(
  ( (Nil!33541) (Cons!33540 (h!34854 (_ BitVec 64)) (t!48238 List!33544)) )
))
(declare-fun arrayNoDuplicates!0 (array!97445 (_ BitVec 32) List!33544) Bool)

(assert (=> b!1429806 (= res!964438 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33541))))

(declare-fun b!1429807 () Bool)

(declare-fun res!964437 () Bool)

(assert (=> b!1429807 (=> (not res!964437) (not e!807279))))

(assert (=> b!1429807 (= res!964437 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47034 a!2831) j!81) a!2831 mask!2608) lt!629505))))

(declare-fun res!964433 () Bool)

(assert (=> start!123284 (=> (not res!964433) (not e!807278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123284 (= res!964433 (validMask!0 mask!2608))))

(assert (=> start!123284 e!807278))

(assert (=> start!123284 true))

(declare-fun array_inv!36062 (array!97445) Bool)

(assert (=> start!123284 (array_inv!36062 a!2831)))

(declare-fun b!1429808 () Bool)

(assert (=> b!1429808 (= e!807279 (not true))))

(assert (=> b!1429808 e!807281))

(declare-fun res!964432 () Bool)

(assert (=> b!1429808 (=> (not res!964432) (not e!807281))))

(assert (=> b!1429808 (= res!964432 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48372 0))(
  ( (Unit!48373) )
))
(declare-fun lt!629504 () Unit!48372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97445 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48372)

(assert (=> b!1429808 (= lt!629504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429809 () Bool)

(declare-fun res!964435 () Bool)

(assert (=> b!1429809 (=> (not res!964435) (not e!807279))))

(assert (=> b!1429809 (= res!964435 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429810 () Bool)

(declare-fun res!964431 () Bool)

(assert (=> b!1429810 (=> (not res!964431) (not e!807278))))

(assert (=> b!1429810 (= res!964431 (validKeyInArray!0 (select (arr!47034 a!2831) i!982)))))

(declare-fun b!1429811 () Bool)

(declare-fun res!964439 () Bool)

(assert (=> b!1429811 (=> (not res!964439) (not e!807278))))

(assert (=> b!1429811 (= res!964439 (and (= (size!47584 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47584 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47584 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429812 () Bool)

(declare-fun res!964436 () Bool)

(assert (=> b!1429812 (=> (not res!964436) (not e!807278))))

(assert (=> b!1429812 (= res!964436 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47584 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47584 a!2831))))))

(assert (= (and start!123284 res!964433) b!1429811))

(assert (= (and b!1429811 res!964439) b!1429810))

(assert (= (and b!1429810 res!964431) b!1429800))

(assert (= (and b!1429800 res!964430) b!1429802))

(assert (= (and b!1429802 res!964429) b!1429806))

(assert (= (and b!1429806 res!964438) b!1429812))

(assert (= (and b!1429812 res!964436) b!1429803))

(assert (= (and b!1429803 res!964434) b!1429801))

(assert (= (and b!1429801 res!964440) b!1429807))

(assert (= (and b!1429807 res!964437) b!1429805))

(assert (= (and b!1429805 res!964441) b!1429809))

(assert (= (and b!1429809 res!964435) b!1429808))

(assert (= (and b!1429808 res!964432) b!1429804))

(declare-fun m!1319891 () Bool)

(assert (=> b!1429810 m!1319891))

(assert (=> b!1429810 m!1319891))

(declare-fun m!1319893 () Bool)

(assert (=> b!1429810 m!1319893))

(declare-fun m!1319895 () Bool)

(assert (=> b!1429807 m!1319895))

(assert (=> b!1429807 m!1319895))

(declare-fun m!1319897 () Bool)

(assert (=> b!1429807 m!1319897))

(declare-fun m!1319899 () Bool)

(assert (=> b!1429808 m!1319899))

(declare-fun m!1319901 () Bool)

(assert (=> b!1429808 m!1319901))

(declare-fun m!1319903 () Bool)

(assert (=> b!1429805 m!1319903))

(assert (=> b!1429800 m!1319895))

(assert (=> b!1429800 m!1319895))

(declare-fun m!1319905 () Bool)

(assert (=> b!1429800 m!1319905))

(assert (=> b!1429804 m!1319895))

(assert (=> b!1429804 m!1319895))

(declare-fun m!1319907 () Bool)

(assert (=> b!1429804 m!1319907))

(declare-fun m!1319909 () Bool)

(assert (=> start!123284 m!1319909))

(declare-fun m!1319911 () Bool)

(assert (=> start!123284 m!1319911))

(declare-fun m!1319913 () Bool)

(assert (=> b!1429802 m!1319913))

(declare-fun m!1319915 () Bool)

(assert (=> b!1429806 m!1319915))

(declare-fun m!1319917 () Bool)

(assert (=> b!1429801 m!1319917))

(assert (=> b!1429801 m!1319917))

(declare-fun m!1319919 () Bool)

(assert (=> b!1429801 m!1319919))

(declare-fun m!1319921 () Bool)

(assert (=> b!1429801 m!1319921))

(declare-fun m!1319923 () Bool)

(assert (=> b!1429801 m!1319923))

(assert (=> b!1429803 m!1319895))

(assert (=> b!1429803 m!1319895))

(declare-fun m!1319925 () Bool)

(assert (=> b!1429803 m!1319925))

(assert (=> b!1429803 m!1319925))

(assert (=> b!1429803 m!1319895))

(declare-fun m!1319927 () Bool)

(assert (=> b!1429803 m!1319927))

(check-sat (not b!1429808) (not b!1429810) (not start!123284) (not b!1429804) (not b!1429802) (not b!1429807) (not b!1429803) (not b!1429805) (not b!1429800) (not b!1429801) (not b!1429806))
(check-sat)
