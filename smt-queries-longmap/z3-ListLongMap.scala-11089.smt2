; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129558 () Bool)

(assert start!129558)

(declare-fun b!1520938 () Bool)

(declare-fun res!1040163 () Bool)

(declare-fun e!848394 () Bool)

(assert (=> b!1520938 (=> (not res!1040163) (not e!848394))))

(declare-datatypes ((array!101233 0))(
  ( (array!101234 (arr!48849 (Array (_ BitVec 32) (_ BitVec 64))) (size!49399 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101233)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520938 (= res!1040163 (validKeyInArray!0 (select (arr!48849 a!2804) i!961)))))

(declare-fun res!1040164 () Bool)

(assert (=> start!129558 (=> (not res!1040164) (not e!848394))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129558 (= res!1040164 (validMask!0 mask!2512))))

(assert (=> start!129558 e!848394))

(assert (=> start!129558 true))

(declare-fun array_inv!37877 (array!101233) Bool)

(assert (=> start!129558 (array_inv!37877 a!2804)))

(declare-fun b!1520939 () Bool)

(declare-fun res!1040162 () Bool)

(assert (=> b!1520939 (=> (not res!1040162) (not e!848394))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520939 (= res!1040162 (validKeyInArray!0 (select (arr!48849 a!2804) j!70)))))

(declare-fun b!1520940 () Bool)

(declare-fun res!1040161 () Bool)

(assert (=> b!1520940 (=> (not res!1040161) (not e!848394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101233 (_ BitVec 32)) Bool)

(assert (=> b!1520940 (= res!1040161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520941 () Bool)

(declare-fun res!1040160 () Bool)

(assert (=> b!1520941 (=> (not res!1040160) (not e!848394))))

(assert (=> b!1520941 (= res!1040160 (and (= (size!49399 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49399 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49399 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520942 () Bool)

(assert (=> b!1520942 (= e!848394 false)))

(declare-fun lt!659284 () Bool)

(declare-datatypes ((List!35332 0))(
  ( (Nil!35329) (Cons!35328 (h!36749 (_ BitVec 64)) (t!50026 List!35332)) )
))
(declare-fun arrayNoDuplicates!0 (array!101233 (_ BitVec 32) List!35332) Bool)

(assert (=> b!1520942 (= lt!659284 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35329))))

(assert (= (and start!129558 res!1040164) b!1520941))

(assert (= (and b!1520941 res!1040160) b!1520938))

(assert (= (and b!1520938 res!1040163) b!1520939))

(assert (= (and b!1520939 res!1040162) b!1520940))

(assert (= (and b!1520940 res!1040161) b!1520942))

(declare-fun m!1404075 () Bool)

(assert (=> b!1520940 m!1404075))

(declare-fun m!1404077 () Bool)

(assert (=> start!129558 m!1404077))

(declare-fun m!1404079 () Bool)

(assert (=> start!129558 m!1404079))

(declare-fun m!1404081 () Bool)

(assert (=> b!1520939 m!1404081))

(assert (=> b!1520939 m!1404081))

(declare-fun m!1404083 () Bool)

(assert (=> b!1520939 m!1404083))

(declare-fun m!1404085 () Bool)

(assert (=> b!1520942 m!1404085))

(declare-fun m!1404087 () Bool)

(assert (=> b!1520938 m!1404087))

(assert (=> b!1520938 m!1404087))

(declare-fun m!1404089 () Bool)

(assert (=> b!1520938 m!1404089))

(check-sat (not b!1520939) (not b!1520938) (not start!129558) (not b!1520940) (not b!1520942))
(check-sat)
