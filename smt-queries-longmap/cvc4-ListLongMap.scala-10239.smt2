; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120490 () Bool)

(assert start!120490)

(declare-fun b!1403006 () Bool)

(declare-fun res!941520 () Bool)

(declare-fun e!794426 () Bool)

(assert (=> b!1403006 (=> (not res!941520) (not e!794426))))

(declare-datatypes ((array!95899 0))(
  ( (array!95900 (arr!46300 (Array (_ BitVec 32) (_ BitVec 64))) (size!46850 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95899)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95899 (_ BitVec 32)) Bool)

(assert (=> b!1403006 (= res!941520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403007 () Bool)

(declare-fun e!794427 () Bool)

(assert (=> b!1403007 (= e!794426 (not e!794427))))

(declare-fun res!941523 () Bool)

(assert (=> b!1403007 (=> res!941523 e!794427)))

(declare-datatypes ((SeekEntryResult!10617 0))(
  ( (MissingZero!10617 (index!44845 (_ BitVec 32))) (Found!10617 (index!44846 (_ BitVec 32))) (Intermediate!10617 (undefined!11429 Bool) (index!44847 (_ BitVec 32)) (x!126460 (_ BitVec 32))) (Undefined!10617) (MissingVacant!10617 (index!44848 (_ BitVec 32))) )
))
(declare-fun lt!618238 () SeekEntryResult!10617)

(assert (=> b!1403007 (= res!941523 (or (not (is-Intermediate!10617 lt!618238)) (undefined!11429 lt!618238)))))

(declare-fun e!794429 () Bool)

(assert (=> b!1403007 e!794429))

(declare-fun res!941517 () Bool)

(assert (=> b!1403007 (=> (not res!941517) (not e!794429))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403007 (= res!941517 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47238 0))(
  ( (Unit!47239) )
))
(declare-fun lt!618240 () Unit!47238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47238)

(assert (=> b!1403007 (= lt!618240 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95899 (_ BitVec 32)) SeekEntryResult!10617)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403007 (= lt!618238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46300 a!2901) j!112) mask!2840) (select (arr!46300 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403008 () Bool)

(declare-fun res!941518 () Bool)

(assert (=> b!1403008 (=> (not res!941518) (not e!794426))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403008 (= res!941518 (validKeyInArray!0 (select (arr!46300 a!2901) i!1037)))))

(declare-fun b!1403010 () Bool)

(declare-fun res!941521 () Bool)

(assert (=> b!1403010 (=> (not res!941521) (not e!794426))))

(assert (=> b!1403010 (= res!941521 (and (= (size!46850 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46850 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46850 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403011 () Bool)

(assert (=> b!1403011 (= e!794427 true)))

(declare-fun lt!618239 () SeekEntryResult!10617)

(assert (=> b!1403011 (= lt!618239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95900 (store (arr!46300 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46850 a!2901)) mask!2840))))

(declare-fun b!1403012 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95899 (_ BitVec 32)) SeekEntryResult!10617)

(assert (=> b!1403012 (= e!794429 (= (seekEntryOrOpen!0 (select (arr!46300 a!2901) j!112) a!2901 mask!2840) (Found!10617 j!112)))))

(declare-fun b!1403013 () Bool)

(declare-fun res!941519 () Bool)

(assert (=> b!1403013 (=> (not res!941519) (not e!794426))))

(declare-datatypes ((List!32819 0))(
  ( (Nil!32816) (Cons!32815 (h!34063 (_ BitVec 64)) (t!47513 List!32819)) )
))
(declare-fun arrayNoDuplicates!0 (array!95899 (_ BitVec 32) List!32819) Bool)

(assert (=> b!1403013 (= res!941519 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32816))))

(declare-fun b!1403009 () Bool)

(declare-fun res!941522 () Bool)

(assert (=> b!1403009 (=> (not res!941522) (not e!794426))))

(assert (=> b!1403009 (= res!941522 (validKeyInArray!0 (select (arr!46300 a!2901) j!112)))))

(declare-fun res!941524 () Bool)

(assert (=> start!120490 (=> (not res!941524) (not e!794426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120490 (= res!941524 (validMask!0 mask!2840))))

(assert (=> start!120490 e!794426))

(assert (=> start!120490 true))

(declare-fun array_inv!35328 (array!95899) Bool)

(assert (=> start!120490 (array_inv!35328 a!2901)))

(assert (= (and start!120490 res!941524) b!1403010))

(assert (= (and b!1403010 res!941521) b!1403008))

(assert (= (and b!1403008 res!941518) b!1403009))

(assert (= (and b!1403009 res!941522) b!1403006))

(assert (= (and b!1403006 res!941520) b!1403013))

(assert (= (and b!1403013 res!941519) b!1403007))

(assert (= (and b!1403007 res!941517) b!1403012))

(assert (= (and b!1403007 (not res!941523)) b!1403011))

(declare-fun m!1291463 () Bool)

(assert (=> b!1403009 m!1291463))

(assert (=> b!1403009 m!1291463))

(declare-fun m!1291465 () Bool)

(assert (=> b!1403009 m!1291465))

(declare-fun m!1291467 () Bool)

(assert (=> b!1403008 m!1291467))

(assert (=> b!1403008 m!1291467))

(declare-fun m!1291469 () Bool)

(assert (=> b!1403008 m!1291469))

(assert (=> b!1403012 m!1291463))

(assert (=> b!1403012 m!1291463))

(declare-fun m!1291471 () Bool)

(assert (=> b!1403012 m!1291471))

(declare-fun m!1291473 () Bool)

(assert (=> b!1403011 m!1291473))

(declare-fun m!1291475 () Bool)

(assert (=> b!1403011 m!1291475))

(assert (=> b!1403011 m!1291475))

(declare-fun m!1291477 () Bool)

(assert (=> b!1403011 m!1291477))

(assert (=> b!1403011 m!1291477))

(assert (=> b!1403011 m!1291475))

(declare-fun m!1291479 () Bool)

(assert (=> b!1403011 m!1291479))

(declare-fun m!1291481 () Bool)

(assert (=> b!1403013 m!1291481))

(declare-fun m!1291483 () Bool)

(assert (=> start!120490 m!1291483))

(declare-fun m!1291485 () Bool)

(assert (=> start!120490 m!1291485))

(assert (=> b!1403007 m!1291463))

(declare-fun m!1291487 () Bool)

(assert (=> b!1403007 m!1291487))

(assert (=> b!1403007 m!1291463))

(declare-fun m!1291489 () Bool)

(assert (=> b!1403007 m!1291489))

(assert (=> b!1403007 m!1291487))

(assert (=> b!1403007 m!1291463))

(declare-fun m!1291491 () Bool)

(assert (=> b!1403007 m!1291491))

(declare-fun m!1291493 () Bool)

(assert (=> b!1403007 m!1291493))

(declare-fun m!1291495 () Bool)

(assert (=> b!1403006 m!1291495))

(push 1)

(assert (not b!1403012))

(assert (not b!1403007))

(assert (not b!1403006))

(assert (not start!120490))

(assert (not b!1403013))

(assert (not b!1403009))

(assert (not b!1403008))

(assert (not b!1403011))

(check-sat)

(pop 1)

