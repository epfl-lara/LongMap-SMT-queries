; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128370 () Bool)

(assert start!128370)

(declare-fun b!1505875 () Bool)

(declare-fun res!1026440 () Bool)

(declare-fun e!841589 () Bool)

(assert (=> b!1505875 (=> (not res!1026440) (not e!841589))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100415 0))(
  ( (array!100416 (arr!48453 (Array (_ BitVec 32) (_ BitVec 64))) (size!49005 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100415)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505875 (= res!1026440 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49005 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49005 a!2804))))))

(declare-fun b!1505876 () Bool)

(declare-fun res!1026437 () Bool)

(assert (=> b!1505876 (=> (not res!1026437) (not e!841589))))

(declare-datatypes ((List!35014 0))(
  ( (Nil!35011) (Cons!35010 (h!36408 (_ BitVec 64)) (t!49700 List!35014)) )
))
(declare-fun arrayNoDuplicates!0 (array!100415 (_ BitVec 32) List!35014) Bool)

(assert (=> b!1505876 (= res!1026437 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35011))))

(declare-fun b!1505877 () Bool)

(declare-fun res!1026443 () Bool)

(assert (=> b!1505877 (=> (not res!1026443) (not e!841589))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505877 (= res!1026443 (validKeyInArray!0 (select (arr!48453 a!2804) j!70)))))

(declare-fun b!1505878 () Bool)

(declare-fun res!1026438 () Bool)

(assert (=> b!1505878 (=> (not res!1026438) (not e!841589))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100415 (_ BitVec 32)) Bool)

(assert (=> b!1505878 (= res!1026438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505879 () Bool)

(declare-fun res!1026442 () Bool)

(assert (=> b!1505879 (=> (not res!1026442) (not e!841589))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505879 (= res!1026442 (and (= (size!49005 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49005 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49005 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026439 () Bool)

(assert (=> start!128370 (=> (not res!1026439) (not e!841589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128370 (= res!1026439 (validMask!0 mask!2512))))

(assert (=> start!128370 e!841589))

(assert (=> start!128370 true))

(declare-fun array_inv!37686 (array!100415) Bool)

(assert (=> start!128370 (array_inv!37686 a!2804)))

(declare-fun b!1505880 () Bool)

(declare-fun res!1026441 () Bool)

(assert (=> b!1505880 (=> (not res!1026441) (not e!841589))))

(assert (=> b!1505880 (= res!1026441 (validKeyInArray!0 (select (arr!48453 a!2804) i!961)))))

(declare-fun b!1505881 () Bool)

(assert (=> b!1505881 (= e!841589 false)))

(declare-fun lt!653874 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505881 (= lt!653874 (toIndex!0 (select (arr!48453 a!2804) j!70) mask!2512))))

(assert (= (and start!128370 res!1026439) b!1505879))

(assert (= (and b!1505879 res!1026442) b!1505880))

(assert (= (and b!1505880 res!1026441) b!1505877))

(assert (= (and b!1505877 res!1026443) b!1505878))

(assert (= (and b!1505878 res!1026438) b!1505876))

(assert (= (and b!1505876 res!1026437) b!1505875))

(assert (= (and b!1505875 res!1026440) b!1505881))

(declare-fun m!1388303 () Bool)

(assert (=> b!1505876 m!1388303))

(declare-fun m!1388305 () Bool)

(assert (=> start!128370 m!1388305))

(declare-fun m!1388307 () Bool)

(assert (=> start!128370 m!1388307))

(declare-fun m!1388309 () Bool)

(assert (=> b!1505880 m!1388309))

(assert (=> b!1505880 m!1388309))

(declare-fun m!1388311 () Bool)

(assert (=> b!1505880 m!1388311))

(declare-fun m!1388313 () Bool)

(assert (=> b!1505881 m!1388313))

(assert (=> b!1505881 m!1388313))

(declare-fun m!1388315 () Bool)

(assert (=> b!1505881 m!1388315))

(declare-fun m!1388317 () Bool)

(assert (=> b!1505878 m!1388317))

(assert (=> b!1505877 m!1388313))

(assert (=> b!1505877 m!1388313))

(declare-fun m!1388319 () Bool)

(assert (=> b!1505877 m!1388319))

(push 1)

(assert (not b!1505877))

(assert (not b!1505881))

(assert (not b!1505880))

(assert (not b!1505878))

(assert (not start!128370))

(assert (not b!1505876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

