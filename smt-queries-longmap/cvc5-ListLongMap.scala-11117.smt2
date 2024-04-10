; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129866 () Bool)

(assert start!129866)

(declare-fun b!1524139 () Bool)

(declare-fun res!1042791 () Bool)

(declare-fun e!849689 () Bool)

(assert (=> b!1524139 (=> (not res!1042791) (not e!849689))))

(declare-datatypes ((array!101405 0))(
  ( (array!101406 (arr!48932 (Array (_ BitVec 32) (_ BitVec 64))) (size!49482 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101405)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101405 (_ BitVec 32)) Bool)

(assert (=> b!1524139 (= res!1042791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524140 () Bool)

(declare-fun res!1042797 () Bool)

(assert (=> b!1524140 (=> (not res!1042797) (not e!849689))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1524140 (= res!1042797 (and (= (size!49482 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49482 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49482 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524141 () Bool)

(declare-fun e!849688 () Bool)

(assert (=> b!1524141 (= e!849688 (not true))))

(declare-fun e!849691 () Bool)

(assert (=> b!1524141 e!849691))

(declare-fun res!1042799 () Bool)

(assert (=> b!1524141 (=> (not res!1042799) (not e!849691))))

(assert (=> b!1524141 (= res!1042799 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50978 0))(
  ( (Unit!50979) )
))
(declare-fun lt!660233 () Unit!50978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50978)

(assert (=> b!1524141 (= lt!660233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524142 () Bool)

(declare-datatypes ((SeekEntryResult!13097 0))(
  ( (MissingZero!13097 (index!54783 (_ BitVec 32))) (Found!13097 (index!54784 (_ BitVec 32))) (Intermediate!13097 (undefined!13909 Bool) (index!54785 (_ BitVec 32)) (x!136477 (_ BitVec 32))) (Undefined!13097) (MissingVacant!13097 (index!54786 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101405 (_ BitVec 32)) SeekEntryResult!13097)

(assert (=> b!1524142 (= e!849691 (= (seekEntry!0 (select (arr!48932 a!2804) j!70) a!2804 mask!2512) (Found!13097 j!70)))))

(declare-fun b!1524143 () Bool)

(declare-fun res!1042792 () Bool)

(assert (=> b!1524143 (=> (not res!1042792) (not e!849689))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1524143 (= res!1042792 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49482 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49482 a!2804))))))

(declare-fun b!1524144 () Bool)

(declare-fun res!1042795 () Bool)

(assert (=> b!1524144 (=> (not res!1042795) (not e!849689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524144 (= res!1042795 (validKeyInArray!0 (select (arr!48932 a!2804) i!961)))))

(declare-fun b!1524145 () Bool)

(declare-fun res!1042793 () Bool)

(assert (=> b!1524145 (=> (not res!1042793) (not e!849689))))

(assert (=> b!1524145 (= res!1042793 (validKeyInArray!0 (select (arr!48932 a!2804) j!70)))))

(declare-fun b!1524146 () Bool)

(declare-fun res!1042794 () Bool)

(assert (=> b!1524146 (=> (not res!1042794) (not e!849688))))

(declare-fun lt!660234 () SeekEntryResult!13097)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101405 (_ BitVec 32)) SeekEntryResult!13097)

(assert (=> b!1524146 (= res!1042794 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48932 a!2804) j!70) a!2804 mask!2512) lt!660234))))

(declare-fun res!1042801 () Bool)

(assert (=> start!129866 (=> (not res!1042801) (not e!849689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129866 (= res!1042801 (validMask!0 mask!2512))))

(assert (=> start!129866 e!849689))

(assert (=> start!129866 true))

(declare-fun array_inv!37960 (array!101405) Bool)

(assert (=> start!129866 (array_inv!37960 a!2804)))

(declare-fun b!1524147 () Bool)

(assert (=> b!1524147 (= e!849689 e!849688)))

(declare-fun res!1042800 () Bool)

(assert (=> b!1524147 (=> (not res!1042800) (not e!849688))))

(declare-fun lt!660235 () SeekEntryResult!13097)

(assert (=> b!1524147 (= res!1042800 (= lt!660235 lt!660234))))

(assert (=> b!1524147 (= lt!660234 (Intermediate!13097 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524147 (= lt!660235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48932 a!2804) j!70) mask!2512) (select (arr!48932 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524148 () Bool)

(declare-fun res!1042798 () Bool)

(assert (=> b!1524148 (=> (not res!1042798) (not e!849689))))

(declare-datatypes ((List!35415 0))(
  ( (Nil!35412) (Cons!35411 (h!36838 (_ BitVec 64)) (t!50109 List!35415)) )
))
(declare-fun arrayNoDuplicates!0 (array!101405 (_ BitVec 32) List!35415) Bool)

(assert (=> b!1524148 (= res!1042798 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35412))))

(declare-fun b!1524149 () Bool)

(declare-fun res!1042796 () Bool)

(assert (=> b!1524149 (=> (not res!1042796) (not e!849688))))

(assert (=> b!1524149 (= res!1042796 (= lt!660235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48932 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48932 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101406 (store (arr!48932 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49482 a!2804)) mask!2512)))))

(assert (= (and start!129866 res!1042801) b!1524140))

(assert (= (and b!1524140 res!1042797) b!1524144))

(assert (= (and b!1524144 res!1042795) b!1524145))

(assert (= (and b!1524145 res!1042793) b!1524139))

(assert (= (and b!1524139 res!1042791) b!1524148))

(assert (= (and b!1524148 res!1042798) b!1524143))

(assert (= (and b!1524143 res!1042792) b!1524147))

(assert (= (and b!1524147 res!1042800) b!1524146))

(assert (= (and b!1524146 res!1042794) b!1524149))

(assert (= (and b!1524149 res!1042796) b!1524141))

(assert (= (and b!1524141 res!1042799) b!1524142))

(declare-fun m!1407159 () Bool)

(assert (=> b!1524139 m!1407159))

(declare-fun m!1407161 () Bool)

(assert (=> b!1524148 m!1407161))

(declare-fun m!1407163 () Bool)

(assert (=> b!1524142 m!1407163))

(assert (=> b!1524142 m!1407163))

(declare-fun m!1407165 () Bool)

(assert (=> b!1524142 m!1407165))

(assert (=> b!1524147 m!1407163))

(assert (=> b!1524147 m!1407163))

(declare-fun m!1407167 () Bool)

(assert (=> b!1524147 m!1407167))

(assert (=> b!1524147 m!1407167))

(assert (=> b!1524147 m!1407163))

(declare-fun m!1407169 () Bool)

(assert (=> b!1524147 m!1407169))

(assert (=> b!1524145 m!1407163))

(assert (=> b!1524145 m!1407163))

(declare-fun m!1407171 () Bool)

(assert (=> b!1524145 m!1407171))

(declare-fun m!1407173 () Bool)

(assert (=> b!1524149 m!1407173))

(declare-fun m!1407175 () Bool)

(assert (=> b!1524149 m!1407175))

(assert (=> b!1524149 m!1407175))

(declare-fun m!1407177 () Bool)

(assert (=> b!1524149 m!1407177))

(assert (=> b!1524149 m!1407177))

(assert (=> b!1524149 m!1407175))

(declare-fun m!1407179 () Bool)

(assert (=> b!1524149 m!1407179))

(assert (=> b!1524146 m!1407163))

(assert (=> b!1524146 m!1407163))

(declare-fun m!1407181 () Bool)

(assert (=> b!1524146 m!1407181))

(declare-fun m!1407183 () Bool)

(assert (=> b!1524141 m!1407183))

(declare-fun m!1407185 () Bool)

(assert (=> b!1524141 m!1407185))

(declare-fun m!1407187 () Bool)

(assert (=> start!129866 m!1407187))

(declare-fun m!1407189 () Bool)

(assert (=> start!129866 m!1407189))

(declare-fun m!1407191 () Bool)

(assert (=> b!1524144 m!1407191))

(assert (=> b!1524144 m!1407191))

(declare-fun m!1407193 () Bool)

(assert (=> b!1524144 m!1407193))

(push 1)

