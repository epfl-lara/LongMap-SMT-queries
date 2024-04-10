; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129224 () Bool)

(assert start!129224)

(declare-fun b!1517123 () Bool)

(declare-fun e!846468 () Bool)

(declare-fun e!846469 () Bool)

(assert (=> b!1517123 (= e!846468 e!846469)))

(declare-fun res!1037027 () Bool)

(assert (=> b!1517123 (=> res!1037027 e!846469)))

(declare-fun lt!657666 () (_ BitVec 32))

(declare-datatypes ((array!101080 0))(
  ( (array!101081 (arr!48777 (Array (_ BitVec 32) (_ BitVec 64))) (size!49327 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101080)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1517123 (= res!1037027 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657666 #b00000000000000000000000000000000) (bvsge lt!657666 (size!49327 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517123 (= lt!657666 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517124 () Bool)

(declare-fun e!846471 () Bool)

(declare-fun e!846467 () Bool)

(assert (=> b!1517124 (= e!846471 e!846467)))

(declare-fun res!1037029 () Bool)

(assert (=> b!1517124 (=> (not res!1037029) (not e!846467))))

(declare-datatypes ((SeekEntryResult!12948 0))(
  ( (MissingZero!12948 (index!54187 (_ BitVec 32))) (Found!12948 (index!54188 (_ BitVec 32))) (Intermediate!12948 (undefined!13760 Bool) (index!54189 (_ BitVec 32)) (x!135874 (_ BitVec 32))) (Undefined!12948) (MissingVacant!12948 (index!54190 (_ BitVec 32))) )
))
(declare-fun lt!657664 () SeekEntryResult!12948)

(declare-fun lt!657663 () SeekEntryResult!12948)

(assert (=> b!1517124 (= res!1037029 (= lt!657664 lt!657663))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517124 (= lt!657663 (Intermediate!12948 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517124 (= lt!657664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48777 a!2804) j!70) mask!2512) (select (arr!48777 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517125 () Bool)

(declare-fun res!1037031 () Bool)

(assert (=> b!1517125 (=> (not res!1037031) (not e!846467))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517125 (= res!1037031 (= lt!657664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48777 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48777 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101081 (store (arr!48777 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49327 a!2804)) mask!2512)))))

(declare-fun res!1037034 () Bool)

(assert (=> start!129224 (=> (not res!1037034) (not e!846471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129224 (= res!1037034 (validMask!0 mask!2512))))

(assert (=> start!129224 e!846471))

(assert (=> start!129224 true))

(declare-fun array_inv!37805 (array!101080) Bool)

(assert (=> start!129224 (array_inv!37805 a!2804)))

(declare-fun b!1517126 () Bool)

(declare-fun res!1037032 () Bool)

(assert (=> b!1517126 (=> (not res!1037032) (not e!846471))))

(assert (=> b!1517126 (= res!1037032 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49327 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49327 a!2804))))))

(declare-fun b!1517127 () Bool)

(declare-fun res!1037037 () Bool)

(assert (=> b!1517127 (=> (not res!1037037) (not e!846471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101080 (_ BitVec 32)) Bool)

(assert (=> b!1517127 (= res!1037037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517128 () Bool)

(declare-fun res!1037038 () Bool)

(assert (=> b!1517128 (=> (not res!1037038) (not e!846471))))

(declare-datatypes ((List!35260 0))(
  ( (Nil!35257) (Cons!35256 (h!36668 (_ BitVec 64)) (t!49954 List!35260)) )
))
(declare-fun arrayNoDuplicates!0 (array!101080 (_ BitVec 32) List!35260) Bool)

(assert (=> b!1517128 (= res!1037038 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35257))))

(declare-fun b!1517129 () Bool)

(declare-fun res!1037033 () Bool)

(assert (=> b!1517129 (=> (not res!1037033) (not e!846471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517129 (= res!1037033 (validKeyInArray!0 (select (arr!48777 a!2804) j!70)))))

(declare-fun b!1517130 () Bool)

(declare-fun res!1037030 () Bool)

(assert (=> b!1517130 (=> (not res!1037030) (not e!846471))))

(assert (=> b!1517130 (= res!1037030 (and (= (size!49327 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49327 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49327 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517131 () Bool)

(declare-fun res!1037026 () Bool)

(assert (=> b!1517131 (=> (not res!1037026) (not e!846467))))

(assert (=> b!1517131 (= res!1037026 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48777 a!2804) j!70) a!2804 mask!2512) lt!657663))))

(declare-fun b!1517132 () Bool)

(assert (=> b!1517132 (= e!846467 (not e!846468))))

(declare-fun res!1037028 () Bool)

(assert (=> b!1517132 (=> res!1037028 e!846468)))

(assert (=> b!1517132 (= res!1037028 (or (not (= (select (arr!48777 a!2804) j!70) (select (store (arr!48777 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846470 () Bool)

(assert (=> b!1517132 e!846470))

(declare-fun res!1037036 () Bool)

(assert (=> b!1517132 (=> (not res!1037036) (not e!846470))))

(assert (=> b!1517132 (= res!1037036 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50764 0))(
  ( (Unit!50765) )
))
(declare-fun lt!657665 () Unit!50764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50764)

(assert (=> b!1517132 (= lt!657665 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517133 () Bool)

(declare-fun res!1037035 () Bool)

(assert (=> b!1517133 (=> (not res!1037035) (not e!846471))))

(assert (=> b!1517133 (= res!1037035 (validKeyInArray!0 (select (arr!48777 a!2804) i!961)))))

(declare-fun b!1517134 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101080 (_ BitVec 32)) SeekEntryResult!12948)

(assert (=> b!1517134 (= e!846470 (= (seekEntry!0 (select (arr!48777 a!2804) j!70) a!2804 mask!2512) (Found!12948 j!70)))))

(declare-fun b!1517135 () Bool)

(assert (=> b!1517135 (= e!846469 true)))

(declare-fun lt!657667 () SeekEntryResult!12948)

(assert (=> b!1517135 (= lt!657667 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657666 (select (arr!48777 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129224 res!1037034) b!1517130))

(assert (= (and b!1517130 res!1037030) b!1517133))

(assert (= (and b!1517133 res!1037035) b!1517129))

(assert (= (and b!1517129 res!1037033) b!1517127))

(assert (= (and b!1517127 res!1037037) b!1517128))

(assert (= (and b!1517128 res!1037038) b!1517126))

(assert (= (and b!1517126 res!1037032) b!1517124))

(assert (= (and b!1517124 res!1037029) b!1517131))

(assert (= (and b!1517131 res!1037026) b!1517125))

(assert (= (and b!1517125 res!1037031) b!1517132))

(assert (= (and b!1517132 res!1037036) b!1517134))

(assert (= (and b!1517132 (not res!1037028)) b!1517123))

(assert (= (and b!1517123 (not res!1037027)) b!1517135))

(declare-fun m!1400405 () Bool)

(assert (=> b!1517128 m!1400405))

(declare-fun m!1400407 () Bool)

(assert (=> b!1517124 m!1400407))

(assert (=> b!1517124 m!1400407))

(declare-fun m!1400409 () Bool)

(assert (=> b!1517124 m!1400409))

(assert (=> b!1517124 m!1400409))

(assert (=> b!1517124 m!1400407))

(declare-fun m!1400411 () Bool)

(assert (=> b!1517124 m!1400411))

(assert (=> b!1517135 m!1400407))

(assert (=> b!1517135 m!1400407))

(declare-fun m!1400413 () Bool)

(assert (=> b!1517135 m!1400413))

(assert (=> b!1517132 m!1400407))

(declare-fun m!1400415 () Bool)

(assert (=> b!1517132 m!1400415))

(declare-fun m!1400417 () Bool)

(assert (=> b!1517132 m!1400417))

(declare-fun m!1400419 () Bool)

(assert (=> b!1517132 m!1400419))

(declare-fun m!1400421 () Bool)

(assert (=> b!1517132 m!1400421))

(assert (=> b!1517131 m!1400407))

(assert (=> b!1517131 m!1400407))

(declare-fun m!1400423 () Bool)

(assert (=> b!1517131 m!1400423))

(declare-fun m!1400425 () Bool)

(assert (=> b!1517133 m!1400425))

(assert (=> b!1517133 m!1400425))

(declare-fun m!1400427 () Bool)

(assert (=> b!1517133 m!1400427))

(declare-fun m!1400429 () Bool)

(assert (=> start!129224 m!1400429))

(declare-fun m!1400431 () Bool)

(assert (=> start!129224 m!1400431))

(declare-fun m!1400433 () Bool)

(assert (=> b!1517127 m!1400433))

(declare-fun m!1400435 () Bool)

(assert (=> b!1517123 m!1400435))

(assert (=> b!1517134 m!1400407))

(assert (=> b!1517134 m!1400407))

(declare-fun m!1400437 () Bool)

(assert (=> b!1517134 m!1400437))

(assert (=> b!1517129 m!1400407))

(assert (=> b!1517129 m!1400407))

(declare-fun m!1400439 () Bool)

(assert (=> b!1517129 m!1400439))

(assert (=> b!1517125 m!1400417))

(assert (=> b!1517125 m!1400419))

(assert (=> b!1517125 m!1400419))

(declare-fun m!1400441 () Bool)

(assert (=> b!1517125 m!1400441))

(assert (=> b!1517125 m!1400441))

(assert (=> b!1517125 m!1400419))

(declare-fun m!1400443 () Bool)

(assert (=> b!1517125 m!1400443))

(check-sat (not b!1517134) (not b!1517135) (not b!1517127) (not b!1517131) (not b!1517133) (not b!1517132) (not start!129224) (not b!1517129) (not b!1517124) (not b!1517123) (not b!1517128) (not b!1517125))
(check-sat)
