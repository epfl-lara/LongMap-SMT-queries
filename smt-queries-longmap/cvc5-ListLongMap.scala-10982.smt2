; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128946 () Bool)

(assert start!128946)

(declare-fun b!1509702 () Bool)

(declare-fun res!1028638 () Bool)

(declare-fun e!843590 () Bool)

(assert (=> b!1509702 (=> (not res!1028638) (not e!843590))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100694 0))(
  ( (array!100695 (arr!48582 (Array (_ BitVec 32) (_ BitVec 64))) (size!49133 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100694)

(assert (=> b!1509702 (= res!1028638 (and (= (size!49133 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49133 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49133 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509703 () Bool)

(declare-fun res!1028642 () Bool)

(assert (=> b!1509703 (=> (not res!1028642) (not e!843590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509703 (= res!1028642 (validKeyInArray!0 (select (arr!48582 a!2804) j!70)))))

(declare-fun res!1028639 () Bool)

(assert (=> start!128946 (=> (not res!1028639) (not e!843590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128946 (= res!1028639 (validMask!0 mask!2512))))

(assert (=> start!128946 e!843590))

(assert (=> start!128946 true))

(declare-fun array_inv!37863 (array!100694) Bool)

(assert (=> start!128946 (array_inv!37863 a!2804)))

(declare-fun b!1509704 () Bool)

(declare-fun res!1028640 () Bool)

(assert (=> b!1509704 (=> (not res!1028640) (not e!843590))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12646 0))(
  ( (MissingZero!12646 (index!52979 (_ BitVec 32))) (Found!12646 (index!52980 (_ BitVec 32))) (Intermediate!12646 (undefined!13458 Bool) (index!52981 (_ BitVec 32)) (x!134933 (_ BitVec 32))) (Undefined!12646) (MissingVacant!12646 (index!52982 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100694 (_ BitVec 32)) SeekEntryResult!12646)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509704 (= res!1028640 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48582 a!2804) j!70) mask!2512) (select (arr!48582 a!2804) j!70) a!2804 mask!2512) (Intermediate!12646 false resIndex!21 resX!21)))))

(declare-fun b!1509705 () Bool)

(declare-fun res!1028643 () Bool)

(assert (=> b!1509705 (=> (not res!1028643) (not e!843590))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509705 (= res!1028643 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49133 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49133 a!2804))))))

(declare-fun b!1509706 () Bool)

(assert (=> b!1509706 (= e!843590 false)))

(declare-fun lt!655159 () SeekEntryResult!12646)

(assert (=> b!1509706 (= lt!655159 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48582 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509707 () Bool)

(declare-fun res!1028641 () Bool)

(assert (=> b!1509707 (=> (not res!1028641) (not e!843590))))

(declare-datatypes ((List!35052 0))(
  ( (Nil!35049) (Cons!35048 (h!36469 (_ BitVec 64)) (t!49738 List!35052)) )
))
(declare-fun arrayNoDuplicates!0 (array!100694 (_ BitVec 32) List!35052) Bool)

(assert (=> b!1509707 (= res!1028641 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35049))))

(declare-fun b!1509708 () Bool)

(declare-fun res!1028645 () Bool)

(assert (=> b!1509708 (=> (not res!1028645) (not e!843590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100694 (_ BitVec 32)) Bool)

(assert (=> b!1509708 (= res!1028645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509709 () Bool)

(declare-fun res!1028644 () Bool)

(assert (=> b!1509709 (=> (not res!1028644) (not e!843590))))

(assert (=> b!1509709 (= res!1028644 (validKeyInArray!0 (select (arr!48582 a!2804) i!961)))))

(assert (= (and start!128946 res!1028639) b!1509702))

(assert (= (and b!1509702 res!1028638) b!1509709))

(assert (= (and b!1509709 res!1028644) b!1509703))

(assert (= (and b!1509703 res!1028642) b!1509708))

(assert (= (and b!1509708 res!1028645) b!1509707))

(assert (= (and b!1509707 res!1028641) b!1509705))

(assert (= (and b!1509705 res!1028643) b!1509704))

(assert (= (and b!1509704 res!1028640) b!1509706))

(declare-fun m!1392293 () Bool)

(assert (=> start!128946 m!1392293))

(declare-fun m!1392295 () Bool)

(assert (=> start!128946 m!1392295))

(declare-fun m!1392297 () Bool)

(assert (=> b!1509707 m!1392297))

(declare-fun m!1392299 () Bool)

(assert (=> b!1509709 m!1392299))

(assert (=> b!1509709 m!1392299))

(declare-fun m!1392301 () Bool)

(assert (=> b!1509709 m!1392301))

(declare-fun m!1392303 () Bool)

(assert (=> b!1509706 m!1392303))

(assert (=> b!1509706 m!1392303))

(declare-fun m!1392305 () Bool)

(assert (=> b!1509706 m!1392305))

(declare-fun m!1392307 () Bool)

(assert (=> b!1509708 m!1392307))

(assert (=> b!1509703 m!1392303))

(assert (=> b!1509703 m!1392303))

(declare-fun m!1392309 () Bool)

(assert (=> b!1509703 m!1392309))

(assert (=> b!1509704 m!1392303))

(assert (=> b!1509704 m!1392303))

(declare-fun m!1392311 () Bool)

(assert (=> b!1509704 m!1392311))

(assert (=> b!1509704 m!1392311))

(assert (=> b!1509704 m!1392303))

(declare-fun m!1392313 () Bool)

(assert (=> b!1509704 m!1392313))

(push 1)

(assert (not b!1509706))

(assert (not b!1509709))

(assert (not b!1509707))

(assert (not b!1509708))

(assert (not start!128946))

(assert (not b!1509704))

(assert (not b!1509703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

