; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123704 () Bool)

(assert start!123704)

(declare-fun b!1433903 () Bool)

(declare-fun res!967473 () Bool)

(declare-fun e!809321 () Bool)

(assert (=> b!1433903 (=> (not res!967473) (not e!809321))))

(declare-datatypes ((array!97527 0))(
  ( (array!97528 (arr!47068 (Array (_ BitVec 32) (_ BitVec 64))) (size!47620 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97527)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97527 (_ BitVec 32)) Bool)

(assert (=> b!1433903 (= res!967473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433904 () Bool)

(declare-fun res!967470 () Bool)

(assert (=> b!1433904 (=> (not res!967470) (not e!809321))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1433904 (= res!967470 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47620 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47620 a!2831))))))

(declare-fun res!967476 () Bool)

(assert (=> start!123704 (=> (not res!967476) (not e!809321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123704 (= res!967476 (validMask!0 mask!2608))))

(assert (=> start!123704 e!809321))

(assert (=> start!123704 true))

(declare-fun array_inv!36301 (array!97527) Bool)

(assert (=> start!123704 (array_inv!36301 a!2831)))

(declare-fun b!1433905 () Bool)

(declare-fun e!809322 () Bool)

(assert (=> b!1433905 (= e!809322 true)))

(declare-fun lt!631089 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433905 (= lt!631089 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1433906 () Bool)

(declare-fun e!809320 () Bool)

(declare-fun e!809319 () Bool)

(assert (=> b!1433906 (= e!809320 e!809319)))

(declare-fun res!967481 () Bool)

(assert (=> b!1433906 (=> (not res!967481) (not e!809319))))

(declare-fun lt!631086 () (_ BitVec 64))

(declare-fun lt!631084 () array!97527)

(declare-datatypes ((SeekEntryResult!11374 0))(
  ( (MissingZero!11374 (index!47888 (_ BitVec 32))) (Found!11374 (index!47889 (_ BitVec 32))) (Intermediate!11374 (undefined!12186 Bool) (index!47890 (_ BitVec 32)) (x!129533 (_ BitVec 32))) (Undefined!11374) (MissingVacant!11374 (index!47891 (_ BitVec 32))) )
))
(declare-fun lt!631087 () SeekEntryResult!11374)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97527 (_ BitVec 32)) SeekEntryResult!11374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433906 (= res!967481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631086 mask!2608) lt!631086 lt!631084 mask!2608) lt!631087))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1433906 (= lt!631087 (Intermediate!11374 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433906 (= lt!631086 (select (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433906 (= lt!631084 (array!97528 (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47620 a!2831)))))

(declare-fun b!1433907 () Bool)

(assert (=> b!1433907 (= e!809321 e!809320)))

(declare-fun res!967474 () Bool)

(assert (=> b!1433907 (=> (not res!967474) (not e!809320))))

(declare-fun lt!631088 () SeekEntryResult!11374)

(assert (=> b!1433907 (= res!967474 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47068 a!2831) j!81) mask!2608) (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!631088))))

(assert (=> b!1433907 (= lt!631088 (Intermediate!11374 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433908 () Bool)

(assert (=> b!1433908 (= e!809319 (not e!809322))))

(declare-fun res!967478 () Bool)

(assert (=> b!1433908 (=> res!967478 e!809322)))

(assert (=> b!1433908 (= res!967478 (or (= (select (arr!47068 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47068 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47068 a!2831) index!585) (select (arr!47068 a!2831) j!81)) (= (select (store (arr!47068 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!809318 () Bool)

(assert (=> b!1433908 e!809318))

(declare-fun res!967480 () Bool)

(assert (=> b!1433908 (=> (not res!967480) (not e!809318))))

(assert (=> b!1433908 (= res!967480 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48333 0))(
  ( (Unit!48334) )
))
(declare-fun lt!631085 () Unit!48333)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48333)

(assert (=> b!1433908 (= lt!631085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433909 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97527 (_ BitVec 32)) SeekEntryResult!11374)

(assert (=> b!1433909 (= e!809318 (= (seekEntryOrOpen!0 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) (Found!11374 j!81)))))

(declare-fun b!1433910 () Bool)

(declare-fun res!967472 () Bool)

(assert (=> b!1433910 (=> (not res!967472) (not e!809319))))

(assert (=> b!1433910 (= res!967472 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631086 lt!631084 mask!2608) lt!631087))))

(declare-fun b!1433911 () Bool)

(declare-fun res!967483 () Bool)

(assert (=> b!1433911 (=> (not res!967483) (not e!809321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433911 (= res!967483 (validKeyInArray!0 (select (arr!47068 a!2831) j!81)))))

(declare-fun b!1433912 () Bool)

(declare-fun res!967477 () Bool)

(assert (=> b!1433912 (=> (not res!967477) (not e!809321))))

(declare-datatypes ((List!33656 0))(
  ( (Nil!33653) (Cons!33652 (h!34981 (_ BitVec 64)) (t!48342 List!33656)) )
))
(declare-fun arrayNoDuplicates!0 (array!97527 (_ BitVec 32) List!33656) Bool)

(assert (=> b!1433912 (= res!967477 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33653))))

(declare-fun b!1433913 () Bool)

(declare-fun res!967475 () Bool)

(assert (=> b!1433913 (=> (not res!967475) (not e!809319))))

(assert (=> b!1433913 (= res!967475 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433914 () Bool)

(declare-fun res!967471 () Bool)

(assert (=> b!1433914 (=> (not res!967471) (not e!809321))))

(assert (=> b!1433914 (= res!967471 (and (= (size!47620 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47620 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47620 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433915 () Bool)

(declare-fun res!967479 () Bool)

(assert (=> b!1433915 (=> (not res!967479) (not e!809321))))

(assert (=> b!1433915 (= res!967479 (validKeyInArray!0 (select (arr!47068 a!2831) i!982)))))

(declare-fun b!1433916 () Bool)

(declare-fun res!967482 () Bool)

(assert (=> b!1433916 (=> (not res!967482) (not e!809319))))

(assert (=> b!1433916 (= res!967482 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47068 a!2831) j!81) a!2831 mask!2608) lt!631088))))

(assert (= (and start!123704 res!967476) b!1433914))

(assert (= (and b!1433914 res!967471) b!1433915))

(assert (= (and b!1433915 res!967479) b!1433911))

(assert (= (and b!1433911 res!967483) b!1433903))

(assert (= (and b!1433903 res!967473) b!1433912))

(assert (= (and b!1433912 res!967477) b!1433904))

(assert (= (and b!1433904 res!967470) b!1433907))

(assert (= (and b!1433907 res!967474) b!1433906))

(assert (= (and b!1433906 res!967481) b!1433916))

(assert (= (and b!1433916 res!967482) b!1433910))

(assert (= (and b!1433910 res!967472) b!1433913))

(assert (= (and b!1433913 res!967475) b!1433908))

(assert (= (and b!1433908 res!967480) b!1433909))

(assert (= (and b!1433908 (not res!967478)) b!1433905))

(declare-fun m!1323029 () Bool)

(assert (=> b!1433908 m!1323029))

(declare-fun m!1323031 () Bool)

(assert (=> b!1433908 m!1323031))

(declare-fun m!1323033 () Bool)

(assert (=> b!1433908 m!1323033))

(declare-fun m!1323035 () Bool)

(assert (=> b!1433908 m!1323035))

(declare-fun m!1323037 () Bool)

(assert (=> b!1433908 m!1323037))

(declare-fun m!1323039 () Bool)

(assert (=> b!1433908 m!1323039))

(declare-fun m!1323041 () Bool)

(assert (=> b!1433905 m!1323041))

(declare-fun m!1323043 () Bool)

(assert (=> b!1433903 m!1323043))

(declare-fun m!1323045 () Bool)

(assert (=> b!1433912 m!1323045))

(declare-fun m!1323047 () Bool)

(assert (=> b!1433910 m!1323047))

(assert (=> b!1433916 m!1323037))

(assert (=> b!1433916 m!1323037))

(declare-fun m!1323049 () Bool)

(assert (=> b!1433916 m!1323049))

(assert (=> b!1433911 m!1323037))

(assert (=> b!1433911 m!1323037))

(declare-fun m!1323051 () Bool)

(assert (=> b!1433911 m!1323051))

(declare-fun m!1323053 () Bool)

(assert (=> start!123704 m!1323053))

(declare-fun m!1323055 () Bool)

(assert (=> start!123704 m!1323055))

(declare-fun m!1323057 () Bool)

(assert (=> b!1433906 m!1323057))

(assert (=> b!1433906 m!1323057))

(declare-fun m!1323059 () Bool)

(assert (=> b!1433906 m!1323059))

(assert (=> b!1433906 m!1323029))

(declare-fun m!1323061 () Bool)

(assert (=> b!1433906 m!1323061))

(assert (=> b!1433909 m!1323037))

(assert (=> b!1433909 m!1323037))

(declare-fun m!1323063 () Bool)

(assert (=> b!1433909 m!1323063))

(assert (=> b!1433907 m!1323037))

(assert (=> b!1433907 m!1323037))

(declare-fun m!1323065 () Bool)

(assert (=> b!1433907 m!1323065))

(assert (=> b!1433907 m!1323065))

(assert (=> b!1433907 m!1323037))

(declare-fun m!1323067 () Bool)

(assert (=> b!1433907 m!1323067))

(declare-fun m!1323069 () Bool)

(assert (=> b!1433915 m!1323069))

(assert (=> b!1433915 m!1323069))

(declare-fun m!1323071 () Bool)

(assert (=> b!1433915 m!1323071))

(check-sat (not b!1433911) (not b!1433910) (not b!1433905) (not b!1433906) (not b!1433907) (not b!1433912) (not b!1433903) (not b!1433915) (not b!1433909) (not b!1433908) (not start!123704) (not b!1433916))
(check-sat)
