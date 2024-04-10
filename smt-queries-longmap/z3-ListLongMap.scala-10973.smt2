; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128504 () Bool)

(assert start!128504)

(declare-fun b!1506798 () Bool)

(declare-fun res!1027121 () Bool)

(declare-fun e!842004 () Bool)

(assert (=> b!1506798 (=> (not res!1027121) (not e!842004))))

(declare-datatypes ((array!100516 0))(
  ( (array!100517 (arr!48501 (Array (_ BitVec 32) (_ BitVec 64))) (size!49051 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100516)

(declare-datatypes ((List!34984 0))(
  ( (Nil!34981) (Cons!34980 (h!36380 (_ BitVec 64)) (t!49678 List!34984)) )
))
(declare-fun arrayNoDuplicates!0 (array!100516 (_ BitVec 32) List!34984) Bool)

(assert (=> b!1506798 (= res!1027121 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34981))))

(declare-fun b!1506799 () Bool)

(declare-fun res!1027126 () Bool)

(assert (=> b!1506799 (=> (not res!1027126) (not e!842004))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1506799 (= res!1027126 (and (= (size!49051 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49051 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49051 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506800 () Bool)

(declare-fun res!1027122 () Bool)

(assert (=> b!1506800 (=> (not res!1027122) (not e!842004))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506800 (= res!1027122 (validKeyInArray!0 (select (arr!48501 a!2804) j!70)))))

(declare-fun b!1506801 () Bool)

(assert (=> b!1506801 (= e!842004 false)))

(declare-datatypes ((SeekEntryResult!12672 0))(
  ( (MissingZero!12672 (index!53083 (_ BitVec 32))) (Found!12672 (index!53084 (_ BitVec 32))) (Intermediate!12672 (undefined!13484 Bool) (index!53085 (_ BitVec 32)) (x!134838 (_ BitVec 32))) (Undefined!12672) (MissingVacant!12672 (index!53086 (_ BitVec 32))) )
))
(declare-fun lt!654265 () SeekEntryResult!12672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100516 (_ BitVec 32)) SeekEntryResult!12672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506801 (= lt!654265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48501 a!2804) j!70) mask!2512) (select (arr!48501 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1506802 () Bool)

(declare-fun res!1027125 () Bool)

(assert (=> b!1506802 (=> (not res!1027125) (not e!842004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100516 (_ BitVec 32)) Bool)

(assert (=> b!1506802 (= res!1027125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506803 () Bool)

(declare-fun res!1027120 () Bool)

(assert (=> b!1506803 (=> (not res!1027120) (not e!842004))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506803 (= res!1027120 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49051 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49051 a!2804))))))

(declare-fun b!1506797 () Bool)

(declare-fun res!1027124 () Bool)

(assert (=> b!1506797 (=> (not res!1027124) (not e!842004))))

(assert (=> b!1506797 (= res!1027124 (validKeyInArray!0 (select (arr!48501 a!2804) i!961)))))

(declare-fun res!1027123 () Bool)

(assert (=> start!128504 (=> (not res!1027123) (not e!842004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128504 (= res!1027123 (validMask!0 mask!2512))))

(assert (=> start!128504 e!842004))

(assert (=> start!128504 true))

(declare-fun array_inv!37529 (array!100516) Bool)

(assert (=> start!128504 (array_inv!37529 a!2804)))

(assert (= (and start!128504 res!1027123) b!1506799))

(assert (= (and b!1506799 res!1027126) b!1506797))

(assert (= (and b!1506797 res!1027124) b!1506800))

(assert (= (and b!1506800 res!1027122) b!1506802))

(assert (= (and b!1506802 res!1027125) b!1506798))

(assert (= (and b!1506798 res!1027121) b!1506803))

(assert (= (and b!1506803 res!1027120) b!1506801))

(declare-fun m!1389699 () Bool)

(assert (=> start!128504 m!1389699))

(declare-fun m!1389701 () Bool)

(assert (=> start!128504 m!1389701))

(declare-fun m!1389703 () Bool)

(assert (=> b!1506797 m!1389703))

(assert (=> b!1506797 m!1389703))

(declare-fun m!1389705 () Bool)

(assert (=> b!1506797 m!1389705))

(declare-fun m!1389707 () Bool)

(assert (=> b!1506800 m!1389707))

(assert (=> b!1506800 m!1389707))

(declare-fun m!1389709 () Bool)

(assert (=> b!1506800 m!1389709))

(declare-fun m!1389711 () Bool)

(assert (=> b!1506802 m!1389711))

(declare-fun m!1389713 () Bool)

(assert (=> b!1506798 m!1389713))

(assert (=> b!1506801 m!1389707))

(assert (=> b!1506801 m!1389707))

(declare-fun m!1389715 () Bool)

(assert (=> b!1506801 m!1389715))

(assert (=> b!1506801 m!1389715))

(assert (=> b!1506801 m!1389707))

(declare-fun m!1389717 () Bool)

(assert (=> b!1506801 m!1389717))

(check-sat (not b!1506797) (not b!1506801) (not start!128504) (not b!1506800) (not b!1506798) (not b!1506802))
