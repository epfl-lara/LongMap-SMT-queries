; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122186 () Bool)

(assert start!122186)

(declare-fun b!1417467 () Bool)

(declare-fun res!953197 () Bool)

(declare-fun e!802223 () Bool)

(assert (=> b!1417467 (=> (not res!953197) (not e!802223))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96770 0))(
  ( (array!96771 (arr!46713 (Array (_ BitVec 32) (_ BitVec 64))) (size!47263 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96770)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417467 (= res!953197 (and (= (size!47263 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47263 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47263 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417468 () Bool)

(declare-fun res!953198 () Bool)

(assert (=> b!1417468 (=> (not res!953198) (not e!802223))))

(declare-datatypes ((List!33232 0))(
  ( (Nil!33229) (Cons!33228 (h!34521 (_ BitVec 64)) (t!47926 List!33232)) )
))
(declare-fun arrayNoDuplicates!0 (array!96770 (_ BitVec 32) List!33232) Bool)

(assert (=> b!1417468 (= res!953198 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33229))))

(declare-fun b!1417469 () Bool)

(assert (=> b!1417469 (= e!802223 (not true))))

(declare-fun e!802221 () Bool)

(assert (=> b!1417469 e!802221))

(declare-fun res!953201 () Bool)

(assert (=> b!1417469 (=> (not res!953201) (not e!802221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96770 (_ BitVec 32)) Bool)

(assert (=> b!1417469 (= res!953201 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!48022 0))(
  ( (Unit!48023) )
))
(declare-fun lt!625379 () Unit!48022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48022)

(assert (=> b!1417469 (= lt!625379 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!11024 0))(
  ( (MissingZero!11024 (index!46488 (_ BitVec 32))) (Found!11024 (index!46489 (_ BitVec 32))) (Intermediate!11024 (undefined!11836 Bool) (index!46490 (_ BitVec 32)) (x!128091 (_ BitVec 32))) (Undefined!11024) (MissingVacant!11024 (index!46491 (_ BitVec 32))) )
))
(declare-fun lt!625380 () SeekEntryResult!11024)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96770 (_ BitVec 32)) SeekEntryResult!11024)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417469 (= lt!625380 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46713 a!2901) j!112) mask!2840) (select (arr!46713 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1417470 () Bool)

(declare-fun res!953199 () Bool)

(assert (=> b!1417470 (=> (not res!953199) (not e!802223))))

(assert (=> b!1417470 (= res!953199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417471 () Bool)

(declare-fun res!953203 () Bool)

(assert (=> b!1417471 (=> (not res!953203) (not e!802223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417471 (= res!953203 (validKeyInArray!0 (select (arr!46713 a!2901) i!1037)))))

(declare-fun b!1417472 () Bool)

(declare-fun res!953200 () Bool)

(assert (=> b!1417472 (=> (not res!953200) (not e!802223))))

(assert (=> b!1417472 (= res!953200 (validKeyInArray!0 (select (arr!46713 a!2901) j!112)))))

(declare-fun res!953202 () Bool)

(assert (=> start!122186 (=> (not res!953202) (not e!802223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122186 (= res!953202 (validMask!0 mask!2840))))

(assert (=> start!122186 e!802223))

(assert (=> start!122186 true))

(declare-fun array_inv!35741 (array!96770) Bool)

(assert (=> start!122186 (array_inv!35741 a!2901)))

(declare-fun b!1417473 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96770 (_ BitVec 32)) SeekEntryResult!11024)

(assert (=> b!1417473 (= e!802221 (= (seekEntryOrOpen!0 (select (arr!46713 a!2901) j!112) a!2901 mask!2840) (Found!11024 j!112)))))

(assert (= (and start!122186 res!953202) b!1417467))

(assert (= (and b!1417467 res!953197) b!1417471))

(assert (= (and b!1417471 res!953203) b!1417472))

(assert (= (and b!1417472 res!953200) b!1417470))

(assert (= (and b!1417470 res!953199) b!1417468))

(assert (= (and b!1417468 res!953198) b!1417469))

(assert (= (and b!1417469 res!953201) b!1417473))

(declare-fun m!1308191 () Bool)

(assert (=> b!1417473 m!1308191))

(assert (=> b!1417473 m!1308191))

(declare-fun m!1308193 () Bool)

(assert (=> b!1417473 m!1308193))

(declare-fun m!1308195 () Bool)

(assert (=> b!1417470 m!1308195))

(declare-fun m!1308197 () Bool)

(assert (=> start!122186 m!1308197))

(declare-fun m!1308199 () Bool)

(assert (=> start!122186 m!1308199))

(assert (=> b!1417469 m!1308191))

(declare-fun m!1308201 () Bool)

(assert (=> b!1417469 m!1308201))

(assert (=> b!1417469 m!1308191))

(declare-fun m!1308203 () Bool)

(assert (=> b!1417469 m!1308203))

(assert (=> b!1417469 m!1308201))

(assert (=> b!1417469 m!1308191))

(declare-fun m!1308205 () Bool)

(assert (=> b!1417469 m!1308205))

(declare-fun m!1308207 () Bool)

(assert (=> b!1417469 m!1308207))

(declare-fun m!1308209 () Bool)

(assert (=> b!1417471 m!1308209))

(assert (=> b!1417471 m!1308209))

(declare-fun m!1308211 () Bool)

(assert (=> b!1417471 m!1308211))

(assert (=> b!1417472 m!1308191))

(assert (=> b!1417472 m!1308191))

(declare-fun m!1308213 () Bool)

(assert (=> b!1417472 m!1308213))

(declare-fun m!1308215 () Bool)

(assert (=> b!1417468 m!1308215))

(check-sat (not b!1417472) (not b!1417469) (not b!1417473) (not b!1417468) (not b!1417470) (not start!122186) (not b!1417471))
