; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128414 () Bool)

(assert start!128414)

(declare-fun b!1506131 () Bool)

(declare-fun res!1026490 () Bool)

(declare-fun e!841780 () Bool)

(assert (=> b!1506131 (=> (not res!1026490) (not e!841780))))

(declare-datatypes ((array!100459 0))(
  ( (array!100460 (arr!48474 (Array (_ BitVec 32) (_ BitVec 64))) (size!49024 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100459)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100459 (_ BitVec 32)) Bool)

(assert (=> b!1506131 (= res!1026490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506132 () Bool)

(declare-fun res!1026489 () Bool)

(assert (=> b!1506132 (=> (not res!1026489) (not e!841780))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506132 (= res!1026489 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49024 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49024 a!2804))))))

(declare-fun b!1506133 () Bool)

(declare-fun res!1026491 () Bool)

(assert (=> b!1506133 (=> (not res!1026491) (not e!841780))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1506133 (= res!1026491 (and (= (size!49024 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49024 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49024 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506134 () Bool)

(declare-fun res!1026492 () Bool)

(assert (=> b!1506134 (=> (not res!1026492) (not e!841780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506134 (= res!1026492 (validKeyInArray!0 (select (arr!48474 a!2804) i!961)))))

(declare-fun b!1506135 () Bool)

(declare-fun res!1026487 () Bool)

(assert (=> b!1506135 (=> (not res!1026487) (not e!841780))))

(assert (=> b!1506135 (= res!1026487 (validKeyInArray!0 (select (arr!48474 a!2804) j!70)))))

(declare-fun b!1506136 () Bool)

(assert (=> b!1506136 (= e!841780 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654157 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506136 (= lt!654157 (toIndex!0 (select (arr!48474 a!2804) j!70) mask!2512))))

(declare-fun res!1026488 () Bool)

(assert (=> start!128414 (=> (not res!1026488) (not e!841780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128414 (= res!1026488 (validMask!0 mask!2512))))

(assert (=> start!128414 e!841780))

(assert (=> start!128414 true))

(declare-fun array_inv!37502 (array!100459) Bool)

(assert (=> start!128414 (array_inv!37502 a!2804)))

(declare-fun b!1506137 () Bool)

(declare-fun res!1026493 () Bool)

(assert (=> b!1506137 (=> (not res!1026493) (not e!841780))))

(declare-datatypes ((List!34957 0))(
  ( (Nil!34954) (Cons!34953 (h!36350 (_ BitVec 64)) (t!49651 List!34957)) )
))
(declare-fun arrayNoDuplicates!0 (array!100459 (_ BitVec 32) List!34957) Bool)

(assert (=> b!1506137 (= res!1026493 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34954))))

(assert (= (and start!128414 res!1026488) b!1506133))

(assert (= (and b!1506133 res!1026491) b!1506134))

(assert (= (and b!1506134 res!1026492) b!1506135))

(assert (= (and b!1506135 res!1026487) b!1506131))

(assert (= (and b!1506131 res!1026490) b!1506137))

(assert (= (and b!1506137 res!1026493) b!1506132))

(assert (= (and b!1506132 res!1026489) b!1506136))

(declare-fun m!1389139 () Bool)

(assert (=> b!1506131 m!1389139))

(declare-fun m!1389141 () Bool)

(assert (=> b!1506135 m!1389141))

(assert (=> b!1506135 m!1389141))

(declare-fun m!1389143 () Bool)

(assert (=> b!1506135 m!1389143))

(declare-fun m!1389145 () Bool)

(assert (=> b!1506134 m!1389145))

(assert (=> b!1506134 m!1389145))

(declare-fun m!1389147 () Bool)

(assert (=> b!1506134 m!1389147))

(assert (=> b!1506136 m!1389141))

(assert (=> b!1506136 m!1389141))

(declare-fun m!1389149 () Bool)

(assert (=> b!1506136 m!1389149))

(declare-fun m!1389151 () Bool)

(assert (=> b!1506137 m!1389151))

(declare-fun m!1389153 () Bool)

(assert (=> start!128414 m!1389153))

(declare-fun m!1389155 () Bool)

(assert (=> start!128414 m!1389155))

(check-sat (not start!128414) (not b!1506134) (not b!1506136) (not b!1506137) (not b!1506135) (not b!1506131))
(check-sat)
