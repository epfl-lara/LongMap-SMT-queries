; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119650 () Bool)

(assert start!119650)

(declare-fun b!1393739 () Bool)

(declare-fun res!933151 () Bool)

(declare-fun e!789167 () Bool)

(assert (=> b!1393739 (=> (not res!933151) (not e!789167))))

(declare-datatypes ((array!95332 0))(
  ( (array!95333 (arr!46024 (Array (_ BitVec 32) (_ BitVec 64))) (size!46574 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95332)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95332 (_ BitVec 32)) Bool)

(assert (=> b!1393739 (= res!933151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393740 () Bool)

(declare-fun e!789169 () Bool)

(assert (=> b!1393740 (= e!789167 (not e!789169))))

(declare-fun res!933154 () Bool)

(assert (=> b!1393740 (=> res!933154 e!789169)))

(declare-datatypes ((SeekEntryResult!10341 0))(
  ( (MissingZero!10341 (index!43735 (_ BitVec 32))) (Found!10341 (index!43736 (_ BitVec 32))) (Intermediate!10341 (undefined!11153 Bool) (index!43737 (_ BitVec 32)) (x!125409 (_ BitVec 32))) (Undefined!10341) (MissingVacant!10341 (index!43738 (_ BitVec 32))) )
))
(declare-fun lt!612104 () SeekEntryResult!10341)

(assert (=> b!1393740 (= res!933154 (or (not (is-Intermediate!10341 lt!612104)) (undefined!11153 lt!612104)))))

(declare-fun e!789170 () Bool)

(assert (=> b!1393740 e!789170))

(declare-fun res!933147 () Bool)

(assert (=> b!1393740 (=> (not res!933147) (not e!789170))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1393740 (= res!933147 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46686 0))(
  ( (Unit!46687) )
))
(declare-fun lt!612105 () Unit!46686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95332 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46686)

(assert (=> b!1393740 (= lt!612105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95332 (_ BitVec 32)) SeekEntryResult!10341)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393740 (= lt!612104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46024 a!2901) j!112) mask!2840) (select (arr!46024 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!933152 () Bool)

(assert (=> start!119650 (=> (not res!933152) (not e!789167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119650 (= res!933152 (validMask!0 mask!2840))))

(assert (=> start!119650 e!789167))

(assert (=> start!119650 true))

(declare-fun array_inv!35052 (array!95332) Bool)

(assert (=> start!119650 (array_inv!35052 a!2901)))

(declare-fun b!1393741 () Bool)

(declare-fun res!933153 () Bool)

(assert (=> b!1393741 (=> (not res!933153) (not e!789167))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393741 (= res!933153 (validKeyInArray!0 (select (arr!46024 a!2901) i!1037)))))

(declare-fun b!1393742 () Bool)

(assert (=> b!1393742 (= e!789169 true)))

(declare-fun lt!612103 () SeekEntryResult!10341)

(assert (=> b!1393742 (= lt!612103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46024 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46024 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95333 (store (arr!46024 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46574 a!2901)) mask!2840))))

(declare-fun b!1393743 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95332 (_ BitVec 32)) SeekEntryResult!10341)

(assert (=> b!1393743 (= e!789170 (= (seekEntryOrOpen!0 (select (arr!46024 a!2901) j!112) a!2901 mask!2840) (Found!10341 j!112)))))

(declare-fun b!1393744 () Bool)

(declare-fun res!933149 () Bool)

(assert (=> b!1393744 (=> (not res!933149) (not e!789167))))

(assert (=> b!1393744 (= res!933149 (and (= (size!46574 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46574 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46574 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393745 () Bool)

(declare-fun res!933150 () Bool)

(assert (=> b!1393745 (=> (not res!933150) (not e!789167))))

(assert (=> b!1393745 (= res!933150 (validKeyInArray!0 (select (arr!46024 a!2901) j!112)))))

(declare-fun b!1393746 () Bool)

(declare-fun res!933148 () Bool)

(assert (=> b!1393746 (=> (not res!933148) (not e!789167))))

(declare-datatypes ((List!32543 0))(
  ( (Nil!32540) (Cons!32539 (h!33772 (_ BitVec 64)) (t!47237 List!32543)) )
))
(declare-fun arrayNoDuplicates!0 (array!95332 (_ BitVec 32) List!32543) Bool)

(assert (=> b!1393746 (= res!933148 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32540))))

(assert (= (and start!119650 res!933152) b!1393744))

(assert (= (and b!1393744 res!933149) b!1393741))

(assert (= (and b!1393741 res!933153) b!1393745))

(assert (= (and b!1393745 res!933150) b!1393739))

(assert (= (and b!1393739 res!933151) b!1393746))

(assert (= (and b!1393746 res!933148) b!1393740))

(assert (= (and b!1393740 res!933147) b!1393743))

(assert (= (and b!1393740 (not res!933154)) b!1393742))

(declare-fun m!1279775 () Bool)

(assert (=> start!119650 m!1279775))

(declare-fun m!1279777 () Bool)

(assert (=> start!119650 m!1279777))

(declare-fun m!1279779 () Bool)

(assert (=> b!1393742 m!1279779))

(declare-fun m!1279781 () Bool)

(assert (=> b!1393742 m!1279781))

(assert (=> b!1393742 m!1279781))

(declare-fun m!1279783 () Bool)

(assert (=> b!1393742 m!1279783))

(assert (=> b!1393742 m!1279783))

(assert (=> b!1393742 m!1279781))

(declare-fun m!1279785 () Bool)

(assert (=> b!1393742 m!1279785))

(declare-fun m!1279787 () Bool)

(assert (=> b!1393741 m!1279787))

(assert (=> b!1393741 m!1279787))

(declare-fun m!1279789 () Bool)

(assert (=> b!1393741 m!1279789))

(declare-fun m!1279791 () Bool)

(assert (=> b!1393746 m!1279791))

(declare-fun m!1279793 () Bool)

(assert (=> b!1393745 m!1279793))

(assert (=> b!1393745 m!1279793))

(declare-fun m!1279795 () Bool)

(assert (=> b!1393745 m!1279795))

(assert (=> b!1393740 m!1279793))

(declare-fun m!1279797 () Bool)

(assert (=> b!1393740 m!1279797))

(assert (=> b!1393740 m!1279793))

(declare-fun m!1279799 () Bool)

(assert (=> b!1393740 m!1279799))

(assert (=> b!1393740 m!1279797))

(assert (=> b!1393740 m!1279793))

(declare-fun m!1279801 () Bool)

(assert (=> b!1393740 m!1279801))

(declare-fun m!1279803 () Bool)

(assert (=> b!1393740 m!1279803))

(declare-fun m!1279805 () Bool)

(assert (=> b!1393739 m!1279805))

(assert (=> b!1393743 m!1279793))

(assert (=> b!1393743 m!1279793))

(declare-fun m!1279807 () Bool)

(assert (=> b!1393743 m!1279807))

(push 1)

(assert (not b!1393742))

(assert (not b!1393740))

(assert (not b!1393745))

(assert (not b!1393746))

(assert (not start!119650))

(assert (not b!1393739))

(assert (not b!1393741))

(assert (not b!1393743))

(check-sat)

(pop 1)

(push 1)

