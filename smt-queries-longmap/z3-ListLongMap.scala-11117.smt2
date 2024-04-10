; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129868 () Bool)

(assert start!129868)

(declare-fun b!1524173 () Bool)

(declare-fun res!1042831 () Bool)

(declare-fun e!849702 () Bool)

(assert (=> b!1524173 (=> (not res!1042831) (not e!849702))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101407 0))(
  ( (array!101408 (arr!48933 (Array (_ BitVec 32) (_ BitVec 64))) (size!49483 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101407)

(assert (=> b!1524173 (= res!1042831 (and (= (size!49483 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49483 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49483 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524174 () Bool)

(declare-fun res!1042828 () Bool)

(declare-fun e!849700 () Bool)

(assert (=> b!1524174 (=> (not res!1042828) (not e!849700))))

(declare-datatypes ((SeekEntryResult!13098 0))(
  ( (MissingZero!13098 (index!54787 (_ BitVec 32))) (Found!13098 (index!54788 (_ BitVec 32))) (Intermediate!13098 (undefined!13910 Bool) (index!54789 (_ BitVec 32)) (x!136478 (_ BitVec 32))) (Undefined!13098) (MissingVacant!13098 (index!54790 (_ BitVec 32))) )
))
(declare-fun lt!660242 () SeekEntryResult!13098)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13098)

(assert (=> b!1524174 (= res!1042828 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48933 a!2804) j!70) a!2804 mask!2512) lt!660242))))

(declare-fun b!1524175 () Bool)

(declare-fun e!849703 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101407 (_ BitVec 32)) SeekEntryResult!13098)

(assert (=> b!1524175 (= e!849703 (= (seekEntry!0 (select (arr!48933 a!2804) j!70) a!2804 mask!2512) (Found!13098 j!70)))))

(declare-fun b!1524176 () Bool)

(assert (=> b!1524176 (= e!849702 e!849700)))

(declare-fun res!1042829 () Bool)

(assert (=> b!1524176 (=> (not res!1042829) (not e!849700))))

(declare-fun lt!660243 () SeekEntryResult!13098)

(assert (=> b!1524176 (= res!1042829 (= lt!660243 lt!660242))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524176 (= lt!660242 (Intermediate!13098 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524176 (= lt!660243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48933 a!2804) j!70) mask!2512) (select (arr!48933 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524177 () Bool)

(declare-fun res!1042834 () Bool)

(assert (=> b!1524177 (=> (not res!1042834) (not e!849702))))

(declare-datatypes ((List!35416 0))(
  ( (Nil!35413) (Cons!35412 (h!36839 (_ BitVec 64)) (t!50110 List!35416)) )
))
(declare-fun arrayNoDuplicates!0 (array!101407 (_ BitVec 32) List!35416) Bool)

(assert (=> b!1524177 (= res!1042834 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35413))))

(declare-fun b!1524172 () Bool)

(declare-fun res!1042827 () Bool)

(assert (=> b!1524172 (=> (not res!1042827) (not e!849702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524172 (= res!1042827 (validKeyInArray!0 (select (arr!48933 a!2804) j!70)))))

(declare-fun res!1042830 () Bool)

(assert (=> start!129868 (=> (not res!1042830) (not e!849702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129868 (= res!1042830 (validMask!0 mask!2512))))

(assert (=> start!129868 e!849702))

(assert (=> start!129868 true))

(declare-fun array_inv!37961 (array!101407) Bool)

(assert (=> start!129868 (array_inv!37961 a!2804)))

(declare-fun b!1524178 () Bool)

(declare-fun res!1042824 () Bool)

(assert (=> b!1524178 (=> (not res!1042824) (not e!849702))))

(assert (=> b!1524178 (= res!1042824 (validKeyInArray!0 (select (arr!48933 a!2804) i!961)))))

(declare-fun b!1524179 () Bool)

(assert (=> b!1524179 (= e!849700 (not true))))

(assert (=> b!1524179 e!849703))

(declare-fun res!1042833 () Bool)

(assert (=> b!1524179 (=> (not res!1042833) (not e!849703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101407 (_ BitVec 32)) Bool)

(assert (=> b!1524179 (= res!1042833 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50980 0))(
  ( (Unit!50981) )
))
(declare-fun lt!660244 () Unit!50980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50980)

(assert (=> b!1524179 (= lt!660244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524180 () Bool)

(declare-fun res!1042825 () Bool)

(assert (=> b!1524180 (=> (not res!1042825) (not e!849700))))

(assert (=> b!1524180 (= res!1042825 (= lt!660243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48933 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48933 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101408 (store (arr!48933 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49483 a!2804)) mask!2512)))))

(declare-fun b!1524181 () Bool)

(declare-fun res!1042832 () Bool)

(assert (=> b!1524181 (=> (not res!1042832) (not e!849702))))

(assert (=> b!1524181 (= res!1042832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524182 () Bool)

(declare-fun res!1042826 () Bool)

(assert (=> b!1524182 (=> (not res!1042826) (not e!849702))))

(assert (=> b!1524182 (= res!1042826 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49483 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49483 a!2804))))))

(assert (= (and start!129868 res!1042830) b!1524173))

(assert (= (and b!1524173 res!1042831) b!1524178))

(assert (= (and b!1524178 res!1042824) b!1524172))

(assert (= (and b!1524172 res!1042827) b!1524181))

(assert (= (and b!1524181 res!1042832) b!1524177))

(assert (= (and b!1524177 res!1042834) b!1524182))

(assert (= (and b!1524182 res!1042826) b!1524176))

(assert (= (and b!1524176 res!1042829) b!1524174))

(assert (= (and b!1524174 res!1042828) b!1524180))

(assert (= (and b!1524180 res!1042825) b!1524179))

(assert (= (and b!1524179 res!1042833) b!1524175))

(declare-fun m!1407195 () Bool)

(assert (=> b!1524176 m!1407195))

(assert (=> b!1524176 m!1407195))

(declare-fun m!1407197 () Bool)

(assert (=> b!1524176 m!1407197))

(assert (=> b!1524176 m!1407197))

(assert (=> b!1524176 m!1407195))

(declare-fun m!1407199 () Bool)

(assert (=> b!1524176 m!1407199))

(declare-fun m!1407201 () Bool)

(assert (=> b!1524180 m!1407201))

(declare-fun m!1407203 () Bool)

(assert (=> b!1524180 m!1407203))

(assert (=> b!1524180 m!1407203))

(declare-fun m!1407205 () Bool)

(assert (=> b!1524180 m!1407205))

(assert (=> b!1524180 m!1407205))

(assert (=> b!1524180 m!1407203))

(declare-fun m!1407207 () Bool)

(assert (=> b!1524180 m!1407207))

(assert (=> b!1524174 m!1407195))

(assert (=> b!1524174 m!1407195))

(declare-fun m!1407209 () Bool)

(assert (=> b!1524174 m!1407209))

(declare-fun m!1407211 () Bool)

(assert (=> b!1524178 m!1407211))

(assert (=> b!1524178 m!1407211))

(declare-fun m!1407213 () Bool)

(assert (=> b!1524178 m!1407213))

(assert (=> b!1524175 m!1407195))

(assert (=> b!1524175 m!1407195))

(declare-fun m!1407215 () Bool)

(assert (=> b!1524175 m!1407215))

(declare-fun m!1407217 () Bool)

(assert (=> b!1524177 m!1407217))

(assert (=> b!1524172 m!1407195))

(assert (=> b!1524172 m!1407195))

(declare-fun m!1407219 () Bool)

(assert (=> b!1524172 m!1407219))

(declare-fun m!1407221 () Bool)

(assert (=> b!1524179 m!1407221))

(declare-fun m!1407223 () Bool)

(assert (=> b!1524179 m!1407223))

(declare-fun m!1407225 () Bool)

(assert (=> b!1524181 m!1407225))

(declare-fun m!1407227 () Bool)

(assert (=> start!129868 m!1407227))

(declare-fun m!1407229 () Bool)

(assert (=> start!129868 m!1407229))

(check-sat (not b!1524179) (not b!1524175) (not b!1524172) (not b!1524180) (not b!1524177) (not b!1524181) (not start!129868) (not b!1524178) (not b!1524176) (not b!1524174))
(check-sat)
