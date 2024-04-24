; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128874 () Bool)

(assert start!128874)

(declare-fun b!1509135 () Bool)

(declare-fun e!843359 () Bool)

(assert (=> b!1509135 (= e!843359 false)))

(declare-datatypes ((SeekEntryResult!12631 0))(
  ( (MissingZero!12631 (index!52919 (_ BitVec 32))) (Found!12631 (index!52920 (_ BitVec 32))) (Intermediate!12631 (undefined!13443 Bool) (index!52921 (_ BitVec 32)) (x!134872 (_ BitVec 32))) (Undefined!12631) (MissingVacant!12631 (index!52922 (_ BitVec 32))) )
))
(declare-fun lt!655036 () SeekEntryResult!12631)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100661 0))(
  ( (array!100662 (arr!48567 (Array (_ BitVec 32) (_ BitVec 64))) (size!49118 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100661)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100661 (_ BitVec 32)) SeekEntryResult!12631)

(assert (=> b!1509135 (= lt!655036 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48567 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509136 () Bool)

(declare-fun res!1028176 () Bool)

(assert (=> b!1509136 (=> (not res!1028176) (not e!843359))))

(declare-datatypes ((List!35037 0))(
  ( (Nil!35034) (Cons!35033 (h!36451 (_ BitVec 64)) (t!49723 List!35037)) )
))
(declare-fun arrayNoDuplicates!0 (array!100661 (_ BitVec 32) List!35037) Bool)

(assert (=> b!1509136 (= res!1028176 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35034))))

(declare-fun b!1509137 () Bool)

(declare-fun res!1028180 () Bool)

(assert (=> b!1509137 (=> (not res!1028180) (not e!843359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509137 (= res!1028180 (validKeyInArray!0 (select (arr!48567 a!2804) j!70)))))

(declare-fun b!1509138 () Bool)

(declare-fun res!1028182 () Bool)

(assert (=> b!1509138 (=> (not res!1028182) (not e!843359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100661 (_ BitVec 32)) Bool)

(assert (=> b!1509138 (= res!1028182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1028179 () Bool)

(assert (=> start!128874 (=> (not res!1028179) (not e!843359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128874 (= res!1028179 (validMask!0 mask!2512))))

(assert (=> start!128874 e!843359))

(assert (=> start!128874 true))

(declare-fun array_inv!37848 (array!100661) Bool)

(assert (=> start!128874 (array_inv!37848 a!2804)))

(declare-fun b!1509139 () Bool)

(declare-fun res!1028181 () Bool)

(assert (=> b!1509139 (=> (not res!1028181) (not e!843359))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509139 (= res!1028181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48567 a!2804) j!70) mask!2512) (select (arr!48567 a!2804) j!70) a!2804 mask!2512) (Intermediate!12631 false resIndex!21 resX!21)))))

(declare-fun b!1509140 () Bool)

(declare-fun res!1028183 () Bool)

(assert (=> b!1509140 (=> (not res!1028183) (not e!843359))))

(assert (=> b!1509140 (= res!1028183 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49118 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49118 a!2804))))))

(declare-fun b!1509141 () Bool)

(declare-fun res!1028178 () Bool)

(assert (=> b!1509141 (=> (not res!1028178) (not e!843359))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509141 (= res!1028178 (and (= (size!49118 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49118 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49118 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509142 () Bool)

(declare-fun res!1028177 () Bool)

(assert (=> b!1509142 (=> (not res!1028177) (not e!843359))))

(assert (=> b!1509142 (= res!1028177 (validKeyInArray!0 (select (arr!48567 a!2804) i!961)))))

(assert (= (and start!128874 res!1028179) b!1509141))

(assert (= (and b!1509141 res!1028178) b!1509142))

(assert (= (and b!1509142 res!1028177) b!1509137))

(assert (= (and b!1509137 res!1028180) b!1509138))

(assert (= (and b!1509138 res!1028182) b!1509136))

(assert (= (and b!1509136 res!1028176) b!1509140))

(assert (= (and b!1509140 res!1028183) b!1509139))

(assert (= (and b!1509139 res!1028181) b!1509135))

(declare-fun m!1391867 () Bool)

(assert (=> b!1509136 m!1391867))

(declare-fun m!1391869 () Bool)

(assert (=> b!1509135 m!1391869))

(assert (=> b!1509135 m!1391869))

(declare-fun m!1391871 () Bool)

(assert (=> b!1509135 m!1391871))

(declare-fun m!1391873 () Bool)

(assert (=> b!1509138 m!1391873))

(assert (=> b!1509137 m!1391869))

(assert (=> b!1509137 m!1391869))

(declare-fun m!1391875 () Bool)

(assert (=> b!1509137 m!1391875))

(assert (=> b!1509139 m!1391869))

(assert (=> b!1509139 m!1391869))

(declare-fun m!1391877 () Bool)

(assert (=> b!1509139 m!1391877))

(assert (=> b!1509139 m!1391877))

(assert (=> b!1509139 m!1391869))

(declare-fun m!1391879 () Bool)

(assert (=> b!1509139 m!1391879))

(declare-fun m!1391881 () Bool)

(assert (=> b!1509142 m!1391881))

(assert (=> b!1509142 m!1391881))

(declare-fun m!1391883 () Bool)

(assert (=> b!1509142 m!1391883))

(declare-fun m!1391885 () Bool)

(assert (=> start!128874 m!1391885))

(declare-fun m!1391887 () Bool)

(assert (=> start!128874 m!1391887))

(push 1)

(assert (not b!1509138))

(assert (not b!1509135))

(assert (not b!1509136))

(assert (not b!1509137))

(assert (not b!1509142))

(assert (not b!1509139))

(assert (not start!128874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

