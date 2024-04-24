; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128552 () Bool)

(assert start!128552)

(declare-fun res!1026572 () Bool)

(declare-fun e!842571 () Bool)

(assert (=> start!128552 (=> (not res!1026572) (not e!842571))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128552 (= res!1026572 (validMask!0 mask!2512))))

(assert (=> start!128552 e!842571))

(assert (=> start!128552 true))

(declare-datatypes ((array!100519 0))(
  ( (array!100520 (arr!48505 (Array (_ BitVec 32) (_ BitVec 64))) (size!49056 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100519)

(declare-fun array_inv!37786 (array!100519) Bool)

(assert (=> start!128552 (array_inv!37786 a!2804)))

(declare-fun b!1507302 () Bool)

(declare-fun res!1026571 () Bool)

(assert (=> b!1507302 (=> (not res!1026571) (not e!842571))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507302 (= res!1026571 (validKeyInArray!0 (select (arr!48505 a!2804) i!961)))))

(declare-fun b!1507303 () Bool)

(declare-fun res!1026575 () Bool)

(assert (=> b!1507303 (=> (not res!1026575) (not e!842571))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507303 (= res!1026575 (and (= (size!49056 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49056 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49056 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507304 () Bool)

(assert (=> b!1507304 (= e!842571 (bvsgt #b00000000000000000000000000000000 (size!49056 a!2804)))))

(declare-fun b!1507305 () Bool)

(declare-fun res!1026574 () Bool)

(assert (=> b!1507305 (=> (not res!1026574) (not e!842571))))

(assert (=> b!1507305 (= res!1026574 (validKeyInArray!0 (select (arr!48505 a!2804) j!70)))))

(declare-fun b!1507306 () Bool)

(declare-fun res!1026573 () Bool)

(assert (=> b!1507306 (=> (not res!1026573) (not e!842571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100519 (_ BitVec 32)) Bool)

(assert (=> b!1507306 (= res!1026573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128552 res!1026572) b!1507303))

(assert (= (and b!1507303 res!1026575) b!1507302))

(assert (= (and b!1507302 res!1026571) b!1507305))

(assert (= (and b!1507305 res!1026574) b!1507306))

(assert (= (and b!1507306 res!1026573) b!1507304))

(declare-fun m!1390365 () Bool)

(assert (=> start!128552 m!1390365))

(declare-fun m!1390367 () Bool)

(assert (=> start!128552 m!1390367))

(declare-fun m!1390369 () Bool)

(assert (=> b!1507302 m!1390369))

(assert (=> b!1507302 m!1390369))

(declare-fun m!1390371 () Bool)

(assert (=> b!1507302 m!1390371))

(declare-fun m!1390373 () Bool)

(assert (=> b!1507305 m!1390373))

(assert (=> b!1507305 m!1390373))

(declare-fun m!1390375 () Bool)

(assert (=> b!1507305 m!1390375))

(declare-fun m!1390377 () Bool)

(assert (=> b!1507306 m!1390377))

(check-sat (not b!1507302) (not start!128552) (not b!1507306) (not b!1507305))
(check-sat)
