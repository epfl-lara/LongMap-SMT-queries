; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128420 () Bool)

(assert start!128420)

(declare-fun b!1506194 () Bool)

(declare-fun res!1026551 () Bool)

(declare-fun e!841797 () Bool)

(assert (=> b!1506194 (=> (not res!1026551) (not e!841797))))

(declare-datatypes ((array!100465 0))(
  ( (array!100466 (arr!48477 (Array (_ BitVec 32) (_ BitVec 64))) (size!49027 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100465)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506194 (= res!1026551 (validKeyInArray!0 (select (arr!48477 a!2804) j!70)))))

(declare-fun b!1506195 () Bool)

(assert (=> b!1506195 (= e!841797 false)))

(declare-fun lt!654166 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506195 (= lt!654166 (toIndex!0 (select (arr!48477 a!2804) j!70) mask!2512))))

(declare-fun b!1506196 () Bool)

(declare-fun res!1026555 () Bool)

(assert (=> b!1506196 (=> (not res!1026555) (not e!841797))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506196 (= res!1026555 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49027 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49027 a!2804))))))

(declare-fun b!1506197 () Bool)

(declare-fun res!1026550 () Bool)

(assert (=> b!1506197 (=> (not res!1026550) (not e!841797))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506197 (= res!1026550 (validKeyInArray!0 (select (arr!48477 a!2804) i!961)))))

(declare-fun b!1506198 () Bool)

(declare-fun res!1026553 () Bool)

(assert (=> b!1506198 (=> (not res!1026553) (not e!841797))))

(assert (=> b!1506198 (= res!1026553 (and (= (size!49027 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49027 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49027 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1026552 () Bool)

(assert (=> start!128420 (=> (not res!1026552) (not e!841797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128420 (= res!1026552 (validMask!0 mask!2512))))

(assert (=> start!128420 e!841797))

(assert (=> start!128420 true))

(declare-fun array_inv!37505 (array!100465) Bool)

(assert (=> start!128420 (array_inv!37505 a!2804)))

(declare-fun b!1506199 () Bool)

(declare-fun res!1026556 () Bool)

(assert (=> b!1506199 (=> (not res!1026556) (not e!841797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100465 (_ BitVec 32)) Bool)

(assert (=> b!1506199 (= res!1026556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506200 () Bool)

(declare-fun res!1026554 () Bool)

(assert (=> b!1506200 (=> (not res!1026554) (not e!841797))))

(declare-datatypes ((List!34960 0))(
  ( (Nil!34957) (Cons!34956 (h!36353 (_ BitVec 64)) (t!49654 List!34960)) )
))
(declare-fun arrayNoDuplicates!0 (array!100465 (_ BitVec 32) List!34960) Bool)

(assert (=> b!1506200 (= res!1026554 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34957))))

(assert (= (and start!128420 res!1026552) b!1506198))

(assert (= (and b!1506198 res!1026553) b!1506197))

(assert (= (and b!1506197 res!1026550) b!1506194))

(assert (= (and b!1506194 res!1026551) b!1506199))

(assert (= (and b!1506199 res!1026556) b!1506200))

(assert (= (and b!1506200 res!1026554) b!1506196))

(assert (= (and b!1506196 res!1026555) b!1506195))

(declare-fun m!1389193 () Bool)

(assert (=> b!1506194 m!1389193))

(assert (=> b!1506194 m!1389193))

(declare-fun m!1389195 () Bool)

(assert (=> b!1506194 m!1389195))

(declare-fun m!1389197 () Bool)

(assert (=> b!1506200 m!1389197))

(declare-fun m!1389199 () Bool)

(assert (=> start!128420 m!1389199))

(declare-fun m!1389201 () Bool)

(assert (=> start!128420 m!1389201))

(assert (=> b!1506195 m!1389193))

(assert (=> b!1506195 m!1389193))

(declare-fun m!1389203 () Bool)

(assert (=> b!1506195 m!1389203))

(declare-fun m!1389205 () Bool)

(assert (=> b!1506197 m!1389205))

(assert (=> b!1506197 m!1389205))

(declare-fun m!1389207 () Bool)

(assert (=> b!1506197 m!1389207))

(declare-fun m!1389209 () Bool)

(assert (=> b!1506199 m!1389209))

(check-sat (not b!1506195) (not b!1506199) (not b!1506197) (not start!128420) (not b!1506200) (not b!1506194))
