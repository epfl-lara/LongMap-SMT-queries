; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128250 () Bool)

(assert start!128250)

(declare-fun b!1505470 () Bool)

(declare-fun res!1025919 () Bool)

(declare-fun e!841435 () Bool)

(assert (=> b!1505470 (=> (not res!1025919) (not e!841435))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100403 0))(
  ( (array!100404 (arr!48452 (Array (_ BitVec 32) (_ BitVec 64))) (size!49002 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100403)

(assert (=> b!1505470 (= res!1025919 (and (= (size!49002 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49002 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49002 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505471 () Bool)

(assert (=> b!1505471 (= e!841435 (bvsgt #b00000000000000000000000000000000 (size!49002 a!2804)))))

(declare-fun b!1505472 () Bool)

(declare-fun res!1025916 () Bool)

(assert (=> b!1505472 (=> (not res!1025916) (not e!841435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100403 (_ BitVec 32)) Bool)

(assert (=> b!1505472 (= res!1025916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505473 () Bool)

(declare-fun res!1025918 () Bool)

(assert (=> b!1505473 (=> (not res!1025918) (not e!841435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505473 (= res!1025918 (validKeyInArray!0 (select (arr!48452 a!2804) i!961)))))

(declare-fun b!1505474 () Bool)

(declare-fun res!1025917 () Bool)

(assert (=> b!1505474 (=> (not res!1025917) (not e!841435))))

(assert (=> b!1505474 (= res!1025917 (validKeyInArray!0 (select (arr!48452 a!2804) j!70)))))

(declare-fun res!1025920 () Bool)

(assert (=> start!128250 (=> (not res!1025920) (not e!841435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128250 (= res!1025920 (validMask!0 mask!2512))))

(assert (=> start!128250 e!841435))

(assert (=> start!128250 true))

(declare-fun array_inv!37480 (array!100403) Bool)

(assert (=> start!128250 (array_inv!37480 a!2804)))

(assert (= (and start!128250 res!1025920) b!1505470))

(assert (= (and b!1505470 res!1025919) b!1505473))

(assert (= (and b!1505473 res!1025918) b!1505474))

(assert (= (and b!1505474 res!1025917) b!1505472))

(assert (= (and b!1505472 res!1025916) b!1505471))

(declare-fun m!1388569 () Bool)

(assert (=> b!1505472 m!1388569))

(declare-fun m!1388571 () Bool)

(assert (=> b!1505473 m!1388571))

(assert (=> b!1505473 m!1388571))

(declare-fun m!1388573 () Bool)

(assert (=> b!1505473 m!1388573))

(declare-fun m!1388575 () Bool)

(assert (=> b!1505474 m!1388575))

(assert (=> b!1505474 m!1388575))

(declare-fun m!1388577 () Bool)

(assert (=> b!1505474 m!1388577))

(declare-fun m!1388579 () Bool)

(assert (=> start!128250 m!1388579))

(declare-fun m!1388581 () Bool)

(assert (=> start!128250 m!1388581))

(push 1)

(assert (not b!1505474))

(assert (not b!1505473))

(assert (not b!1505472))

