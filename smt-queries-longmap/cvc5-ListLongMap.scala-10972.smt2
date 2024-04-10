; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128496 () Bool)

(assert start!128496)

(declare-fun b!1506706 () Bool)

(declare-fun res!1027035 () Bool)

(declare-fun e!841980 () Bool)

(assert (=> b!1506706 (=> (not res!1027035) (not e!841980))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100508 0))(
  ( (array!100509 (arr!48497 (Array (_ BitVec 32) (_ BitVec 64))) (size!49047 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100508)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12668 0))(
  ( (MissingZero!12668 (index!53067 (_ BitVec 32))) (Found!12668 (index!53068 (_ BitVec 32))) (Intermediate!12668 (undefined!13480 Bool) (index!53069 (_ BitVec 32)) (x!134826 (_ BitVec 32))) (Undefined!12668) (MissingVacant!12668 (index!53070 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100508 (_ BitVec 32)) SeekEntryResult!12668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506706 (= res!1027035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48497 a!2804) j!70) mask!2512) (select (arr!48497 a!2804) j!70) a!2804 mask!2512) (Intermediate!12668 false resIndex!21 resX!21)))))

(declare-fun b!1506707 () Bool)

(declare-fun res!1027031 () Bool)

(assert (=> b!1506707 (=> (not res!1027031) (not e!841980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100508 (_ BitVec 32)) Bool)

(assert (=> b!1506707 (= res!1027031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506708 () Bool)

(declare-fun res!1027033 () Bool)

(assert (=> b!1506708 (=> (not res!1027033) (not e!841980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506708 (= res!1027033 (validKeyInArray!0 (select (arr!48497 a!2804) j!70)))))

(declare-fun b!1506710 () Bool)

(declare-fun res!1027034 () Bool)

(assert (=> b!1506710 (=> (not res!1027034) (not e!841980))))

(declare-datatypes ((List!34980 0))(
  ( (Nil!34977) (Cons!34976 (h!36376 (_ BitVec 64)) (t!49674 List!34980)) )
))
(declare-fun arrayNoDuplicates!0 (array!100508 (_ BitVec 32) List!34980) Bool)

(assert (=> b!1506710 (= res!1027034 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34977))))

(declare-fun b!1506711 () Bool)

(declare-fun res!1027032 () Bool)

(assert (=> b!1506711 (=> (not res!1027032) (not e!841980))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506711 (= res!1027032 (and (= (size!49047 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49047 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49047 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506712 () Bool)

(declare-fun res!1027036 () Bool)

(assert (=> b!1506712 (=> (not res!1027036) (not e!841980))))

(assert (=> b!1506712 (= res!1027036 (validKeyInArray!0 (select (arr!48497 a!2804) i!961)))))

(declare-fun b!1506713 () Bool)

(declare-fun res!1027029 () Bool)

(assert (=> b!1506713 (=> (not res!1027029) (not e!841980))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1506713 (= res!1027029 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49047 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49047 a!2804))))))

(declare-fun b!1506709 () Bool)

(assert (=> b!1506709 (= e!841980 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun res!1027030 () Bool)

(assert (=> start!128496 (=> (not res!1027030) (not e!841980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128496 (= res!1027030 (validMask!0 mask!2512))))

(assert (=> start!128496 e!841980))

(assert (=> start!128496 true))

(declare-fun array_inv!37525 (array!100508) Bool)

(assert (=> start!128496 (array_inv!37525 a!2804)))

(assert (= (and start!128496 res!1027030) b!1506711))

(assert (= (and b!1506711 res!1027032) b!1506712))

(assert (= (and b!1506712 res!1027036) b!1506708))

(assert (= (and b!1506708 res!1027033) b!1506707))

(assert (= (and b!1506707 res!1027031) b!1506710))

(assert (= (and b!1506710 res!1027034) b!1506713))

(assert (= (and b!1506713 res!1027029) b!1506706))

(assert (= (and b!1506706 res!1027035) b!1506709))

(declare-fun m!1389619 () Bool)

(assert (=> start!128496 m!1389619))

(declare-fun m!1389621 () Bool)

(assert (=> start!128496 m!1389621))

(declare-fun m!1389623 () Bool)

(assert (=> b!1506708 m!1389623))

(assert (=> b!1506708 m!1389623))

(declare-fun m!1389625 () Bool)

(assert (=> b!1506708 m!1389625))

(declare-fun m!1389627 () Bool)

(assert (=> b!1506710 m!1389627))

(declare-fun m!1389629 () Bool)

(assert (=> b!1506712 m!1389629))

(assert (=> b!1506712 m!1389629))

(declare-fun m!1389631 () Bool)

(assert (=> b!1506712 m!1389631))

(assert (=> b!1506706 m!1389623))

(assert (=> b!1506706 m!1389623))

(declare-fun m!1389633 () Bool)

(assert (=> b!1506706 m!1389633))

(assert (=> b!1506706 m!1389633))

(assert (=> b!1506706 m!1389623))

(declare-fun m!1389635 () Bool)

(assert (=> b!1506706 m!1389635))

(declare-fun m!1389637 () Bool)

(assert (=> b!1506707 m!1389637))

(push 1)

(assert (not b!1506706))

(assert (not b!1506707))

(assert (not start!128496))

(assert (not b!1506708))

(assert (not b!1506712))

(assert (not b!1506710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

