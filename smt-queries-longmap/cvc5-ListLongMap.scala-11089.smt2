; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129556 () Bool)

(assert start!129556)

(declare-fun b!1520923 () Bool)

(declare-fun res!1040147 () Bool)

(declare-fun e!848389 () Bool)

(assert (=> b!1520923 (=> (not res!1040147) (not e!848389))))

(declare-datatypes ((array!101231 0))(
  ( (array!101232 (arr!48848 (Array (_ BitVec 32) (_ BitVec 64))) (size!49398 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101231)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520923 (= res!1040147 (validKeyInArray!0 (select (arr!48848 a!2804) j!70)))))

(declare-fun b!1520924 () Bool)

(declare-fun res!1040149 () Bool)

(assert (=> b!1520924 (=> (not res!1040149) (not e!848389))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101231 (_ BitVec 32)) Bool)

(assert (=> b!1520924 (= res!1040149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520925 () Bool)

(assert (=> b!1520925 (= e!848389 false)))

(declare-fun lt!659281 () Bool)

(declare-datatypes ((List!35331 0))(
  ( (Nil!35328) (Cons!35327 (h!36748 (_ BitVec 64)) (t!50025 List!35331)) )
))
(declare-fun arrayNoDuplicates!0 (array!101231 (_ BitVec 32) List!35331) Bool)

(assert (=> b!1520925 (= lt!659281 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35328))))

(declare-fun b!1520926 () Bool)

(declare-fun res!1040145 () Bool)

(assert (=> b!1520926 (=> (not res!1040145) (not e!848389))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520926 (= res!1040145 (and (= (size!49398 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49398 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49398 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1040148 () Bool)

(assert (=> start!129556 (=> (not res!1040148) (not e!848389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129556 (= res!1040148 (validMask!0 mask!2512))))

(assert (=> start!129556 e!848389))

(assert (=> start!129556 true))

(declare-fun array_inv!37876 (array!101231) Bool)

(assert (=> start!129556 (array_inv!37876 a!2804)))

(declare-fun b!1520927 () Bool)

(declare-fun res!1040146 () Bool)

(assert (=> b!1520927 (=> (not res!1040146) (not e!848389))))

(assert (=> b!1520927 (= res!1040146 (validKeyInArray!0 (select (arr!48848 a!2804) i!961)))))

(assert (= (and start!129556 res!1040148) b!1520926))

(assert (= (and b!1520926 res!1040145) b!1520927))

(assert (= (and b!1520927 res!1040146) b!1520923))

(assert (= (and b!1520923 res!1040147) b!1520924))

(assert (= (and b!1520924 res!1040149) b!1520925))

(declare-fun m!1404059 () Bool)

(assert (=> b!1520924 m!1404059))

(declare-fun m!1404061 () Bool)

(assert (=> start!129556 m!1404061))

(declare-fun m!1404063 () Bool)

(assert (=> start!129556 m!1404063))

(declare-fun m!1404065 () Bool)

(assert (=> b!1520925 m!1404065))

(declare-fun m!1404067 () Bool)

(assert (=> b!1520923 m!1404067))

(assert (=> b!1520923 m!1404067))

(declare-fun m!1404069 () Bool)

(assert (=> b!1520923 m!1404069))

(declare-fun m!1404071 () Bool)

(assert (=> b!1520927 m!1404071))

(assert (=> b!1520927 m!1404071))

(declare-fun m!1404073 () Bool)

(assert (=> b!1520927 m!1404073))

(push 1)

(assert (not b!1520923))

(assert (not b!1520927))

(assert (not b!1520924))

(assert (not b!1520925))

(assert (not start!129556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

