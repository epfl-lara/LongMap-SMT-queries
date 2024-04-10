; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129572 () Bool)

(assert start!129572)

(declare-fun b!1521077 () Bool)

(declare-fun res!1040305 () Bool)

(declare-fun e!848437 () Bool)

(assert (=> b!1521077 (=> (not res!1040305) (not e!848437))))

(declare-datatypes ((array!101247 0))(
  ( (array!101248 (arr!48856 (Array (_ BitVec 32) (_ BitVec 64))) (size!49406 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101247)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521077 (= res!1040305 (validKeyInArray!0 (select (arr!48856 a!2804) i!961)))))

(declare-fun b!1521078 () Bool)

(declare-fun res!1040301 () Bool)

(assert (=> b!1521078 (=> (not res!1040301) (not e!848437))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1521078 (= res!1040301 (and (= (size!49406 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49406 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49406 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521079 () Bool)

(declare-fun res!1040300 () Bool)

(assert (=> b!1521079 (=> (not res!1040300) (not e!848437))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521079 (= res!1040300 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49406 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49406 a!2804))))))

(declare-fun b!1521080 () Bool)

(declare-fun res!1040304 () Bool)

(assert (=> b!1521080 (=> (not res!1040304) (not e!848437))))

(declare-datatypes ((List!35339 0))(
  ( (Nil!35336) (Cons!35335 (h!36756 (_ BitVec 64)) (t!50033 List!35339)) )
))
(declare-fun arrayNoDuplicates!0 (array!101247 (_ BitVec 32) List!35339) Bool)

(assert (=> b!1521080 (= res!1040304 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35336))))

(declare-fun b!1521082 () Bool)

(declare-fun res!1040303 () Bool)

(assert (=> b!1521082 (=> (not res!1040303) (not e!848437))))

(assert (=> b!1521082 (= res!1040303 (validKeyInArray!0 (select (arr!48856 a!2804) j!70)))))

(declare-fun b!1521083 () Bool)

(declare-fun res!1040299 () Bool)

(assert (=> b!1521083 (=> (not res!1040299) (not e!848437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101247 (_ BitVec 32)) Bool)

(assert (=> b!1521083 (= res!1040299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521081 () Bool)

(assert (=> b!1521081 (= e!848437 false)))

(declare-datatypes ((SeekEntryResult!13021 0))(
  ( (MissingZero!13021 (index!54479 (_ BitVec 32))) (Found!13021 (index!54480 (_ BitVec 32))) (Intermediate!13021 (undefined!13833 Bool) (index!54481 (_ BitVec 32)) (x!136177 (_ BitVec 32))) (Undefined!13021) (MissingVacant!13021 (index!54482 (_ BitVec 32))) )
))
(declare-fun lt!659305 () SeekEntryResult!13021)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101247 (_ BitVec 32)) SeekEntryResult!13021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521081 (= lt!659305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48856 a!2804) j!70) mask!2512) (select (arr!48856 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1040302 () Bool)

(assert (=> start!129572 (=> (not res!1040302) (not e!848437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129572 (= res!1040302 (validMask!0 mask!2512))))

(assert (=> start!129572 e!848437))

(assert (=> start!129572 true))

(declare-fun array_inv!37884 (array!101247) Bool)

(assert (=> start!129572 (array_inv!37884 a!2804)))

(assert (= (and start!129572 res!1040302) b!1521078))

(assert (= (and b!1521078 res!1040301) b!1521077))

(assert (= (and b!1521077 res!1040305) b!1521082))

(assert (= (and b!1521082 res!1040303) b!1521083))

(assert (= (and b!1521083 res!1040299) b!1521080))

(assert (= (and b!1521080 res!1040304) b!1521079))

(assert (= (and b!1521079 res!1040300) b!1521081))

(declare-fun m!1404201 () Bool)

(assert (=> b!1521082 m!1404201))

(assert (=> b!1521082 m!1404201))

(declare-fun m!1404203 () Bool)

(assert (=> b!1521082 m!1404203))

(declare-fun m!1404205 () Bool)

(assert (=> start!129572 m!1404205))

(declare-fun m!1404207 () Bool)

(assert (=> start!129572 m!1404207))

(declare-fun m!1404209 () Bool)

(assert (=> b!1521080 m!1404209))

(assert (=> b!1521081 m!1404201))

(assert (=> b!1521081 m!1404201))

(declare-fun m!1404211 () Bool)

(assert (=> b!1521081 m!1404211))

(assert (=> b!1521081 m!1404211))

(assert (=> b!1521081 m!1404201))

(declare-fun m!1404213 () Bool)

(assert (=> b!1521081 m!1404213))

(declare-fun m!1404215 () Bool)

(assert (=> b!1521083 m!1404215))

(declare-fun m!1404217 () Bool)

(assert (=> b!1521077 m!1404217))

(assert (=> b!1521077 m!1404217))

(declare-fun m!1404219 () Bool)

(assert (=> b!1521077 m!1404219))

(push 1)

(assert (not b!1521081))

(assert (not b!1521077))

(assert (not start!129572))

(assert (not b!1521083))

(assert (not b!1521080))

(assert (not b!1521082))

(check-sat)

(pop 1)

