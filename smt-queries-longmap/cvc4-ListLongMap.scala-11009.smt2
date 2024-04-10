; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128890 () Bool)

(assert start!128890)

(declare-fun b!1510675 () Bool)

(declare-fun res!1030584 () Bool)

(declare-fun e!843545 () Bool)

(assert (=> b!1510675 (=> (not res!1030584) (not e!843545))))

(declare-datatypes ((SeekEntryResult!12781 0))(
  ( (MissingZero!12781 (index!53519 (_ BitVec 32))) (Found!12781 (index!53520 (_ BitVec 32))) (Intermediate!12781 (undefined!13593 Bool) (index!53521 (_ BitVec 32)) (x!135259 (_ BitVec 32))) (Undefined!12781) (MissingVacant!12781 (index!53522 (_ BitVec 32))) )
))
(declare-fun lt!655234 () SeekEntryResult!12781)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100746 0))(
  ( (array!100747 (arr!48610 (Array (_ BitVec 32) (_ BitVec 64))) (size!49160 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100746)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100746 (_ BitVec 32)) SeekEntryResult!12781)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510675 (= res!1030584 (= lt!655234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100747 (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49160 a!2804)) mask!2512)))))

(declare-fun b!1510676 () Bool)

(declare-fun res!1030579 () Bool)

(declare-fun e!843547 () Bool)

(assert (=> b!1510676 (=> (not res!1030579) (not e!843547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510676 (= res!1030579 (validKeyInArray!0 (select (arr!48610 a!2804) i!961)))))

(declare-fun e!843544 () Bool)

(declare-fun b!1510677 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100746 (_ BitVec 32)) SeekEntryResult!12781)

(assert (=> b!1510677 (= e!843544 (= (seekEntry!0 (select (arr!48610 a!2804) j!70) a!2804 mask!2512) (Found!12781 j!70)))))

(declare-fun b!1510678 () Bool)

(declare-fun res!1030581 () Bool)

(assert (=> b!1510678 (=> (not res!1030581) (not e!843547))))

(declare-datatypes ((List!35093 0))(
  ( (Nil!35090) (Cons!35089 (h!36501 (_ BitVec 64)) (t!49787 List!35093)) )
))
(declare-fun arrayNoDuplicates!0 (array!100746 (_ BitVec 32) List!35093) Bool)

(assert (=> b!1510678 (= res!1030581 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35090))))

(declare-fun b!1510679 () Bool)

(declare-fun res!1030578 () Bool)

(assert (=> b!1510679 (=> (not res!1030578) (not e!843545))))

(declare-fun lt!655232 () SeekEntryResult!12781)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510679 (= res!1030578 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48610 a!2804) j!70) a!2804 mask!2512) lt!655232))))

(declare-fun b!1510680 () Bool)

(declare-fun res!1030585 () Bool)

(assert (=> b!1510680 (=> (not res!1030585) (not e!843547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100746 (_ BitVec 32)) Bool)

(assert (=> b!1510680 (= res!1030585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510681 () Bool)

(declare-fun res!1030580 () Bool)

(assert (=> b!1510681 (=> (not res!1030580) (not e!843547))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510681 (= res!1030580 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49160 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49160 a!2804))))))

(declare-fun res!1030582 () Bool)

(assert (=> start!128890 (=> (not res!1030582) (not e!843547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128890 (= res!1030582 (validMask!0 mask!2512))))

(assert (=> start!128890 e!843547))

(assert (=> start!128890 true))

(declare-fun array_inv!37638 (array!100746) Bool)

(assert (=> start!128890 (array_inv!37638 a!2804)))

(declare-fun b!1510682 () Bool)

(declare-fun res!1030588 () Bool)

(assert (=> b!1510682 (=> (not res!1030588) (not e!843547))))

(assert (=> b!1510682 (= res!1030588 (validKeyInArray!0 (select (arr!48610 a!2804) j!70)))))

(declare-fun b!1510683 () Bool)

(assert (=> b!1510683 (= e!843545 (not true))))

(assert (=> b!1510683 e!843544))

(declare-fun res!1030587 () Bool)

(assert (=> b!1510683 (=> (not res!1030587) (not e!843544))))

(assert (=> b!1510683 (= res!1030587 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50430 0))(
  ( (Unit!50431) )
))
(declare-fun lt!655233 () Unit!50430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100746 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50430)

(assert (=> b!1510683 (= lt!655233 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510684 () Bool)

(declare-fun res!1030583 () Bool)

(assert (=> b!1510684 (=> (not res!1030583) (not e!843547))))

(assert (=> b!1510684 (= res!1030583 (and (= (size!49160 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49160 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49160 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510685 () Bool)

(assert (=> b!1510685 (= e!843547 e!843545)))

(declare-fun res!1030586 () Bool)

(assert (=> b!1510685 (=> (not res!1030586) (not e!843545))))

(assert (=> b!1510685 (= res!1030586 (= lt!655234 lt!655232))))

(assert (=> b!1510685 (= lt!655232 (Intermediate!12781 false resIndex!21 resX!21))))

(assert (=> b!1510685 (= lt!655234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48610 a!2804) j!70) mask!2512) (select (arr!48610 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128890 res!1030582) b!1510684))

(assert (= (and b!1510684 res!1030583) b!1510676))

(assert (= (and b!1510676 res!1030579) b!1510682))

(assert (= (and b!1510682 res!1030588) b!1510680))

(assert (= (and b!1510680 res!1030585) b!1510678))

(assert (= (and b!1510678 res!1030581) b!1510681))

(assert (= (and b!1510681 res!1030580) b!1510685))

(assert (= (and b!1510685 res!1030586) b!1510679))

(assert (= (and b!1510679 res!1030578) b!1510675))

(assert (= (and b!1510675 res!1030584) b!1510683))

(assert (= (and b!1510683 res!1030587) b!1510677))

(declare-fun m!1393291 () Bool)

(assert (=> b!1510682 m!1393291))

(assert (=> b!1510682 m!1393291))

(declare-fun m!1393293 () Bool)

(assert (=> b!1510682 m!1393293))

(declare-fun m!1393295 () Bool)

(assert (=> start!128890 m!1393295))

(declare-fun m!1393297 () Bool)

(assert (=> start!128890 m!1393297))

(declare-fun m!1393299 () Bool)

(assert (=> b!1510675 m!1393299))

(declare-fun m!1393301 () Bool)

(assert (=> b!1510675 m!1393301))

(assert (=> b!1510675 m!1393301))

(declare-fun m!1393303 () Bool)

(assert (=> b!1510675 m!1393303))

(assert (=> b!1510675 m!1393303))

(assert (=> b!1510675 m!1393301))

(declare-fun m!1393305 () Bool)

(assert (=> b!1510675 m!1393305))

(declare-fun m!1393307 () Bool)

(assert (=> b!1510678 m!1393307))

(declare-fun m!1393309 () Bool)

(assert (=> b!1510676 m!1393309))

(assert (=> b!1510676 m!1393309))

(declare-fun m!1393311 () Bool)

(assert (=> b!1510676 m!1393311))

(assert (=> b!1510679 m!1393291))

(assert (=> b!1510679 m!1393291))

(declare-fun m!1393313 () Bool)

(assert (=> b!1510679 m!1393313))

(declare-fun m!1393315 () Bool)

(assert (=> b!1510680 m!1393315))

(assert (=> b!1510677 m!1393291))

(assert (=> b!1510677 m!1393291))

(declare-fun m!1393317 () Bool)

(assert (=> b!1510677 m!1393317))

(assert (=> b!1510685 m!1393291))

(assert (=> b!1510685 m!1393291))

(declare-fun m!1393319 () Bool)

(assert (=> b!1510685 m!1393319))

(assert (=> b!1510685 m!1393319))

(assert (=> b!1510685 m!1393291))

(declare-fun m!1393321 () Bool)

(assert (=> b!1510685 m!1393321))

(declare-fun m!1393323 () Bool)

(assert (=> b!1510683 m!1393323))

(declare-fun m!1393325 () Bool)

(assert (=> b!1510683 m!1393325))

(push 1)

(assert (not b!1510676))

(assert (not start!128890))

