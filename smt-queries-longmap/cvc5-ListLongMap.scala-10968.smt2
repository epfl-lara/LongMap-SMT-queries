; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128424 () Bool)

(assert start!128424)

(declare-fun b!1506145 () Bool)

(declare-fun res!1026678 () Bool)

(declare-fun e!841706 () Bool)

(assert (=> b!1506145 (=> (not res!1026678) (not e!841706))))

(declare-datatypes ((array!100436 0))(
  ( (array!100437 (arr!48462 (Array (_ BitVec 32) (_ BitVec 64))) (size!49014 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100436)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506145 (= res!1026678 (validKeyInArray!0 (select (arr!48462 a!2804) j!70)))))

(declare-fun b!1506146 () Bool)

(declare-fun res!1026679 () Bool)

(assert (=> b!1506146 (=> (not res!1026679) (not e!841706))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506146 (= res!1026679 (validKeyInArray!0 (select (arr!48462 a!2804) i!961)))))

(declare-fun b!1506147 () Bool)

(declare-fun res!1026677 () Bool)

(assert (=> b!1506147 (=> (not res!1026677) (not e!841706))))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506147 (= res!1026677 (and (= (size!49014 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49014 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49014 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506148 () Bool)

(declare-fun res!1026676 () Bool)

(assert (=> b!1506148 (=> (not res!1026676) (not e!841706))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506148 (= res!1026676 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49014 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49014 a!2804))))))

(declare-fun res!1026674 () Bool)

(assert (=> start!128424 (=> (not res!1026674) (not e!841706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128424 (= res!1026674 (validMask!0 mask!2512))))

(assert (=> start!128424 e!841706))

(assert (=> start!128424 true))

(declare-fun array_inv!37695 (array!100436) Bool)

(assert (=> start!128424 (array_inv!37695 a!2804)))

(declare-fun b!1506149 () Bool)

(declare-fun res!1026675 () Bool)

(assert (=> b!1506149 (=> (not res!1026675) (not e!841706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100436 (_ BitVec 32)) Bool)

(assert (=> b!1506149 (= res!1026675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506150 () Bool)

(declare-fun res!1026680 () Bool)

(assert (=> b!1506150 (=> (not res!1026680) (not e!841706))))

(declare-datatypes ((List!35023 0))(
  ( (Nil!35020) (Cons!35019 (h!36420 (_ BitVec 64)) (t!49709 List!35023)) )
))
(declare-fun arrayNoDuplicates!0 (array!100436 (_ BitVec 32) List!35023) Bool)

(assert (=> b!1506150 (= res!1026680 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35020))))

(declare-fun b!1506151 () Bool)

(assert (=> b!1506151 (= e!841706 false)))

(declare-fun lt!653946 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506151 (= lt!653946 (toIndex!0 (select (arr!48462 a!2804) j!70) mask!2512))))

(assert (= (and start!128424 res!1026674) b!1506147))

(assert (= (and b!1506147 res!1026677) b!1506146))

(assert (= (and b!1506146 res!1026679) b!1506145))

(assert (= (and b!1506145 res!1026678) b!1506149))

(assert (= (and b!1506149 res!1026675) b!1506150))

(assert (= (and b!1506150 res!1026680) b!1506148))

(assert (= (and b!1506148 res!1026676) b!1506151))

(declare-fun m!1388513 () Bool)

(assert (=> b!1506151 m!1388513))

(assert (=> b!1506151 m!1388513))

(declare-fun m!1388515 () Bool)

(assert (=> b!1506151 m!1388515))

(assert (=> b!1506145 m!1388513))

(assert (=> b!1506145 m!1388513))

(declare-fun m!1388517 () Bool)

(assert (=> b!1506145 m!1388517))

(declare-fun m!1388519 () Bool)

(assert (=> b!1506150 m!1388519))

(declare-fun m!1388521 () Bool)

(assert (=> b!1506146 m!1388521))

(assert (=> b!1506146 m!1388521))

(declare-fun m!1388523 () Bool)

(assert (=> b!1506146 m!1388523))

(declare-fun m!1388525 () Bool)

(assert (=> b!1506149 m!1388525))

(declare-fun m!1388527 () Bool)

(assert (=> start!128424 m!1388527))

(declare-fun m!1388529 () Bool)

(assert (=> start!128424 m!1388529))

(push 1)

(assert (not b!1506145))

(assert (not b!1506150))

(assert (not b!1506151))

(assert (not b!1506149))

(assert (not start!128424))

(assert (not b!1506146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

