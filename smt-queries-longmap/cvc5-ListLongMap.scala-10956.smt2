; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128244 () Bool)

(assert start!128244)

(declare-fun b!1505432 () Bool)

(declare-fun res!1025878 () Bool)

(declare-fun e!841417 () Bool)

(assert (=> b!1505432 (=> (not res!1025878) (not e!841417))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100397 0))(
  ( (array!100398 (arr!48449 (Array (_ BitVec 32) (_ BitVec 64))) (size!48999 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100397)

(assert (=> b!1505432 (= res!1025878 (and (= (size!48999 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48999 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48999 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1025881 () Bool)

(assert (=> start!128244 (=> (not res!1025881) (not e!841417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128244 (= res!1025881 (validMask!0 mask!2512))))

(assert (=> start!128244 e!841417))

(assert (=> start!128244 true))

(declare-fun array_inv!37477 (array!100397) Bool)

(assert (=> start!128244 (array_inv!37477 a!2804)))

(declare-fun b!1505434 () Bool)

(declare-fun res!1025879 () Bool)

(assert (=> b!1505434 (=> (not res!1025879) (not e!841417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505434 (= res!1025879 (validKeyInArray!0 (select (arr!48449 a!2804) j!70)))))

(declare-fun b!1505435 () Bool)

(assert (=> b!1505435 (= e!841417 (bvsgt #b00000000000000000000000000000000 (size!48999 a!2804)))))

(declare-fun b!1505433 () Bool)

(declare-fun res!1025880 () Bool)

(assert (=> b!1505433 (=> (not res!1025880) (not e!841417))))

(assert (=> b!1505433 (= res!1025880 (validKeyInArray!0 (select (arr!48449 a!2804) i!961)))))

(assert (= (and start!128244 res!1025881) b!1505432))

(assert (= (and b!1505432 res!1025878) b!1505433))

(assert (= (and b!1505433 res!1025880) b!1505434))

(assert (= (and b!1505434 res!1025879) b!1505435))

(declare-fun m!1388533 () Bool)

(assert (=> start!128244 m!1388533))

(declare-fun m!1388535 () Bool)

(assert (=> start!128244 m!1388535))

(declare-fun m!1388537 () Bool)

(assert (=> b!1505434 m!1388537))

(assert (=> b!1505434 m!1388537))

(declare-fun m!1388539 () Bool)

(assert (=> b!1505434 m!1388539))

(declare-fun m!1388541 () Bool)

(assert (=> b!1505433 m!1388541))

(assert (=> b!1505433 m!1388541))

(declare-fun m!1388543 () Bool)

(assert (=> b!1505433 m!1388543))

(push 1)

(assert (not start!128244))

(assert (not b!1505434))

(assert (not b!1505433))

