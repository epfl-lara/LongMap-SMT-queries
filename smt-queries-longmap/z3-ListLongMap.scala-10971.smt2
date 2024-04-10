; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128492 () Bool)

(assert start!128492)

(declare-fun b!1506662 () Bool)

(declare-fun res!1026990 () Bool)

(declare-fun e!841968 () Bool)

(assert (=> b!1506662 (=> (not res!1026990) (not e!841968))))

(declare-datatypes ((array!100504 0))(
  ( (array!100505 (arr!48495 (Array (_ BitVec 32) (_ BitVec 64))) (size!49045 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100504)

(declare-datatypes ((List!34978 0))(
  ( (Nil!34975) (Cons!34974 (h!36374 (_ BitVec 64)) (t!49672 List!34978)) )
))
(declare-fun arrayNoDuplicates!0 (array!100504 (_ BitVec 32) List!34978) Bool)

(assert (=> b!1506662 (= res!1026990 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34975))))

(declare-fun b!1506663 () Bool)

(declare-fun res!1026985 () Bool)

(assert (=> b!1506663 (=> (not res!1026985) (not e!841968))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506663 (= res!1026985 (validKeyInArray!0 (select (arr!48495 a!2804) i!961)))))

(declare-fun b!1506664 () Bool)

(declare-fun res!1026989 () Bool)

(assert (=> b!1506664 (=> (not res!1026989) (not e!841968))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506664 (= res!1026989 (and (= (size!49045 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49045 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49045 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506666 () Bool)

(assert (=> b!1506666 (= e!841968 false)))

(declare-datatypes ((SeekEntryResult!12666 0))(
  ( (MissingZero!12666 (index!53059 (_ BitVec 32))) (Found!12666 (index!53060 (_ BitVec 32))) (Intermediate!12666 (undefined!13478 Bool) (index!53061 (_ BitVec 32)) (x!134816 (_ BitVec 32))) (Undefined!12666) (MissingVacant!12666 (index!53062 (_ BitVec 32))) )
))
(declare-fun lt!654256 () SeekEntryResult!12666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100504 (_ BitVec 32)) SeekEntryResult!12666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506666 (= lt!654256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48495 a!2804) j!70) mask!2512) (select (arr!48495 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506667 () Bool)

(declare-fun res!1026991 () Bool)

(assert (=> b!1506667 (=> (not res!1026991) (not e!841968))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506667 (= res!1026991 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49045 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49045 a!2804))))))

(declare-fun b!1506668 () Bool)

(declare-fun res!1026986 () Bool)

(assert (=> b!1506668 (=> (not res!1026986) (not e!841968))))

(assert (=> b!1506668 (= res!1026986 (validKeyInArray!0 (select (arr!48495 a!2804) j!70)))))

(declare-fun res!1026987 () Bool)

(assert (=> start!128492 (=> (not res!1026987) (not e!841968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128492 (= res!1026987 (validMask!0 mask!2512))))

(assert (=> start!128492 e!841968))

(assert (=> start!128492 true))

(declare-fun array_inv!37523 (array!100504) Bool)

(assert (=> start!128492 (array_inv!37523 a!2804)))

(declare-fun b!1506665 () Bool)

(declare-fun res!1026988 () Bool)

(assert (=> b!1506665 (=> (not res!1026988) (not e!841968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100504 (_ BitVec 32)) Bool)

(assert (=> b!1506665 (= res!1026988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128492 res!1026987) b!1506664))

(assert (= (and b!1506664 res!1026989) b!1506663))

(assert (= (and b!1506663 res!1026985) b!1506668))

(assert (= (and b!1506668 res!1026986) b!1506665))

(assert (= (and b!1506665 res!1026988) b!1506662))

(assert (= (and b!1506662 res!1026990) b!1506667))

(assert (= (and b!1506667 res!1026991) b!1506666))

(declare-fun m!1389579 () Bool)

(assert (=> b!1506663 m!1389579))

(assert (=> b!1506663 m!1389579))

(declare-fun m!1389581 () Bool)

(assert (=> b!1506663 m!1389581))

(declare-fun m!1389583 () Bool)

(assert (=> b!1506665 m!1389583))

(declare-fun m!1389585 () Bool)

(assert (=> b!1506662 m!1389585))

(declare-fun m!1389587 () Bool)

(assert (=> b!1506668 m!1389587))

(assert (=> b!1506668 m!1389587))

(declare-fun m!1389589 () Bool)

(assert (=> b!1506668 m!1389589))

(assert (=> b!1506666 m!1389587))

(assert (=> b!1506666 m!1389587))

(declare-fun m!1389591 () Bool)

(assert (=> b!1506666 m!1389591))

(assert (=> b!1506666 m!1389591))

(assert (=> b!1506666 m!1389587))

(declare-fun m!1389593 () Bool)

(assert (=> b!1506666 m!1389593))

(declare-fun m!1389595 () Bool)

(assert (=> start!128492 m!1389595))

(declare-fun m!1389597 () Bool)

(assert (=> start!128492 m!1389597))

(check-sat (not b!1506668) (not b!1506665) (not b!1506666) (not b!1506662) (not b!1506663) (not start!128492))
