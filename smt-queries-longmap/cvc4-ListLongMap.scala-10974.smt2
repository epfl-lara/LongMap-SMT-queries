; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128512 () Bool)

(assert start!128512)

(declare-fun b!1506881 () Bool)

(declare-fun e!842028 () Bool)

(assert (=> b!1506881 (= e!842028 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100524 0))(
  ( (array!100525 (arr!48505 (Array (_ BitVec 32) (_ BitVec 64))) (size!49055 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100524)

(declare-datatypes ((SeekEntryResult!12676 0))(
  ( (MissingZero!12676 (index!53099 (_ BitVec 32))) (Found!12676 (index!53100 (_ BitVec 32))) (Intermediate!12676 (undefined!13488 Bool) (index!53101 (_ BitVec 32)) (x!134850 (_ BitVec 32))) (Undefined!12676) (MissingVacant!12676 (index!53102 (_ BitVec 32))) )
))
(declare-fun lt!654277 () SeekEntryResult!12676)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100524 (_ BitVec 32)) SeekEntryResult!12676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506881 (= lt!654277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48505 a!2804) j!70) mask!2512) (select (arr!48505 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506882 () Bool)

(declare-fun res!1027206 () Bool)

(assert (=> b!1506882 (=> (not res!1027206) (not e!842028))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506882 (= res!1027206 (validKeyInArray!0 (select (arr!48505 a!2804) i!961)))))

(declare-fun b!1506883 () Bool)

(declare-fun res!1027204 () Bool)

(assert (=> b!1506883 (=> (not res!1027204) (not e!842028))))

(assert (=> b!1506883 (= res!1027204 (and (= (size!49055 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49055 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49055 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506884 () Bool)

(declare-fun res!1027208 () Bool)

(assert (=> b!1506884 (=> (not res!1027208) (not e!842028))))

(assert (=> b!1506884 (= res!1027208 (validKeyInArray!0 (select (arr!48505 a!2804) j!70)))))

(declare-fun b!1506885 () Bool)

(declare-fun res!1027205 () Bool)

(assert (=> b!1506885 (=> (not res!1027205) (not e!842028))))

(declare-datatypes ((List!34988 0))(
  ( (Nil!34985) (Cons!34984 (h!36384 (_ BitVec 64)) (t!49682 List!34988)) )
))
(declare-fun arrayNoDuplicates!0 (array!100524 (_ BitVec 32) List!34988) Bool)

(assert (=> b!1506885 (= res!1027205 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34985))))

(declare-fun b!1506886 () Bool)

(declare-fun res!1027210 () Bool)

(assert (=> b!1506886 (=> (not res!1027210) (not e!842028))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506886 (= res!1027210 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49055 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49055 a!2804))))))

(declare-fun b!1506887 () Bool)

(declare-fun res!1027209 () Bool)

(assert (=> b!1506887 (=> (not res!1027209) (not e!842028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100524 (_ BitVec 32)) Bool)

(assert (=> b!1506887 (= res!1027209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1027207 () Bool)

(assert (=> start!128512 (=> (not res!1027207) (not e!842028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128512 (= res!1027207 (validMask!0 mask!2512))))

(assert (=> start!128512 e!842028))

(assert (=> start!128512 true))

(declare-fun array_inv!37533 (array!100524) Bool)

(assert (=> start!128512 (array_inv!37533 a!2804)))

(assert (= (and start!128512 res!1027207) b!1506883))

(assert (= (and b!1506883 res!1027204) b!1506882))

(assert (= (and b!1506882 res!1027206) b!1506884))

(assert (= (and b!1506884 res!1027208) b!1506887))

(assert (= (and b!1506887 res!1027209) b!1506885))

(assert (= (and b!1506885 res!1027205) b!1506886))

(assert (= (and b!1506886 res!1027210) b!1506881))

(declare-fun m!1389779 () Bool)

(assert (=> start!128512 m!1389779))

(declare-fun m!1389781 () Bool)

(assert (=> start!128512 m!1389781))

(declare-fun m!1389783 () Bool)

(assert (=> b!1506885 m!1389783))

(declare-fun m!1389785 () Bool)

(assert (=> b!1506887 m!1389785))

(declare-fun m!1389787 () Bool)

(assert (=> b!1506882 m!1389787))

(assert (=> b!1506882 m!1389787))

(declare-fun m!1389789 () Bool)

(assert (=> b!1506882 m!1389789))

(declare-fun m!1389791 () Bool)

(assert (=> b!1506881 m!1389791))

(assert (=> b!1506881 m!1389791))

(declare-fun m!1389793 () Bool)

(assert (=> b!1506881 m!1389793))

(assert (=> b!1506881 m!1389793))

(assert (=> b!1506881 m!1389791))

(declare-fun m!1389795 () Bool)

(assert (=> b!1506881 m!1389795))

(assert (=> b!1506884 m!1389791))

(assert (=> b!1506884 m!1389791))

(declare-fun m!1389797 () Bool)

(assert (=> b!1506884 m!1389797))

(push 1)

(assert (not b!1506884))

(assert (not start!128512))

(assert (not b!1506882))

(assert (not b!1506881))

(assert (not b!1506885))

(assert (not b!1506887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

