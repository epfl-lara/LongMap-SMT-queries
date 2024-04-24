; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128940 () Bool)

(assert start!128940)

(declare-fun b!1509630 () Bool)

(declare-fun res!1028570 () Bool)

(declare-fun e!843573 () Bool)

(assert (=> b!1509630 (=> (not res!1028570) (not e!843573))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100688 0))(
  ( (array!100689 (arr!48579 (Array (_ BitVec 32) (_ BitVec 64))) (size!49130 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100688)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509630 (= res!1028570 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49130 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49130 a!2804))))))

(declare-fun b!1509631 () Bool)

(declare-fun res!1028572 () Bool)

(assert (=> b!1509631 (=> (not res!1028572) (not e!843573))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12643 0))(
  ( (MissingZero!12643 (index!52967 (_ BitVec 32))) (Found!12643 (index!52968 (_ BitVec 32))) (Intermediate!12643 (undefined!13455 Bool) (index!52969 (_ BitVec 32)) (x!134922 (_ BitVec 32))) (Undefined!12643) (MissingVacant!12643 (index!52970 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100688 (_ BitVec 32)) SeekEntryResult!12643)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509631 (= res!1028572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48579 a!2804) j!70) mask!2512) (select (arr!48579 a!2804) j!70) a!2804 mask!2512) (Intermediate!12643 false resIndex!21 resX!21)))))

(declare-fun b!1509632 () Bool)

(declare-fun res!1028566 () Bool)

(assert (=> b!1509632 (=> (not res!1028566) (not e!843573))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509632 (= res!1028566 (validKeyInArray!0 (select (arr!48579 a!2804) i!961)))))

(declare-fun b!1509633 () Bool)

(declare-fun res!1028569 () Bool)

(assert (=> b!1509633 (=> (not res!1028569) (not e!843573))))

(assert (=> b!1509633 (= res!1028569 (and (= (size!49130 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49130 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49130 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509635 () Bool)

(declare-fun res!1028573 () Bool)

(assert (=> b!1509635 (=> (not res!1028573) (not e!843573))))

(declare-datatypes ((List!35049 0))(
  ( (Nil!35046) (Cons!35045 (h!36466 (_ BitVec 64)) (t!49735 List!35049)) )
))
(declare-fun arrayNoDuplicates!0 (array!100688 (_ BitVec 32) List!35049) Bool)

(assert (=> b!1509635 (= res!1028573 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35046))))

(declare-fun b!1509636 () Bool)

(assert (=> b!1509636 (= e!843573 false)))

(declare-fun lt!655150 () SeekEntryResult!12643)

(assert (=> b!1509636 (= lt!655150 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48579 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509637 () Bool)

(declare-fun res!1028568 () Bool)

(assert (=> b!1509637 (=> (not res!1028568) (not e!843573))))

(assert (=> b!1509637 (= res!1028568 (validKeyInArray!0 (select (arr!48579 a!2804) j!70)))))

(declare-fun res!1028571 () Bool)

(assert (=> start!128940 (=> (not res!1028571) (not e!843573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128940 (= res!1028571 (validMask!0 mask!2512))))

(assert (=> start!128940 e!843573))

(assert (=> start!128940 true))

(declare-fun array_inv!37860 (array!100688) Bool)

(assert (=> start!128940 (array_inv!37860 a!2804)))

(declare-fun b!1509634 () Bool)

(declare-fun res!1028567 () Bool)

(assert (=> b!1509634 (=> (not res!1028567) (not e!843573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100688 (_ BitVec 32)) Bool)

(assert (=> b!1509634 (= res!1028567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128940 res!1028571) b!1509633))

(assert (= (and b!1509633 res!1028569) b!1509632))

(assert (= (and b!1509632 res!1028566) b!1509637))

(assert (= (and b!1509637 res!1028568) b!1509634))

(assert (= (and b!1509634 res!1028567) b!1509635))

(assert (= (and b!1509635 res!1028573) b!1509630))

(assert (= (and b!1509630 res!1028570) b!1509631))

(assert (= (and b!1509631 res!1028572) b!1509636))

(declare-fun m!1392227 () Bool)

(assert (=> b!1509636 m!1392227))

(assert (=> b!1509636 m!1392227))

(declare-fun m!1392229 () Bool)

(assert (=> b!1509636 m!1392229))

(declare-fun m!1392231 () Bool)

(assert (=> start!128940 m!1392231))

(declare-fun m!1392233 () Bool)

(assert (=> start!128940 m!1392233))

(assert (=> b!1509631 m!1392227))

(assert (=> b!1509631 m!1392227))

(declare-fun m!1392235 () Bool)

(assert (=> b!1509631 m!1392235))

(assert (=> b!1509631 m!1392235))

(assert (=> b!1509631 m!1392227))

(declare-fun m!1392237 () Bool)

(assert (=> b!1509631 m!1392237))

(declare-fun m!1392239 () Bool)

(assert (=> b!1509635 m!1392239))

(assert (=> b!1509637 m!1392227))

(assert (=> b!1509637 m!1392227))

(declare-fun m!1392241 () Bool)

(assert (=> b!1509637 m!1392241))

(declare-fun m!1392243 () Bool)

(assert (=> b!1509632 m!1392243))

(assert (=> b!1509632 m!1392243))

(declare-fun m!1392245 () Bool)

(assert (=> b!1509632 m!1392245))

(declare-fun m!1392247 () Bool)

(assert (=> b!1509634 m!1392247))

(push 1)

(assert (not b!1509631))

(assert (not b!1509636))

(assert (not b!1509634))

(assert (not start!128940))

(assert (not b!1509635))

(assert (not b!1509637))

(assert (not b!1509632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

