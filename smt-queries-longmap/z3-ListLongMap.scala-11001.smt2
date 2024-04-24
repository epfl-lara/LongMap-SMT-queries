; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129140 () Bool)

(assert start!129140)

(declare-fun b!1511640 () Bool)

(declare-fun res!1030373 () Bool)

(declare-fun e!844359 () Bool)

(assert (=> b!1511640 (=> (not res!1030373) (not e!844359))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100810 0))(
  ( (array!100811 (arr!48637 (Array (_ BitVec 32) (_ BitVec 64))) (size!49188 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100810)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511640 (= res!1030373 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49188 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49188 a!2804))))))

(declare-fun b!1511642 () Bool)

(declare-fun res!1030366 () Bool)

(assert (=> b!1511642 (=> (not res!1030366) (not e!844359))))

(declare-datatypes ((List!35107 0))(
  ( (Nil!35104) (Cons!35103 (h!36530 (_ BitVec 64)) (t!49793 List!35107)) )
))
(declare-fun arrayNoDuplicates!0 (array!100810 (_ BitVec 32) List!35107) Bool)

(assert (=> b!1511642 (= res!1030366 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35104))))

(declare-fun b!1511643 () Bool)

(declare-fun res!1030367 () Bool)

(assert (=> b!1511643 (=> (not res!1030367) (not e!844359))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1511643 (= res!1030367 (and (= (size!49188 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49188 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49188 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511644 () Bool)

(declare-fun res!1030372 () Bool)

(assert (=> b!1511644 (=> (not res!1030372) (not e!844359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511644 (= res!1030372 (validKeyInArray!0 (select (arr!48637 a!2804) i!961)))))

(declare-fun b!1511645 () Bool)

(declare-fun res!1030376 () Bool)

(declare-fun e!844362 () Bool)

(assert (=> b!1511645 (=> (not res!1030376) (not e!844362))))

(declare-datatypes ((SeekEntryResult!12701 0))(
  ( (MissingZero!12701 (index!53199 (_ BitVec 32))) (Found!12701 (index!53200 (_ BitVec 32))) (Intermediate!12701 (undefined!13513 Bool) (index!53201 (_ BitVec 32)) (x!135152 (_ BitVec 32))) (Undefined!12701) (MissingVacant!12701 (index!53202 (_ BitVec 32))) )
))
(declare-fun lt!655661 () SeekEntryResult!12701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12701)

(assert (=> b!1511645 (= res!1030376 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) lt!655661))))

(declare-fun b!1511646 () Bool)

(assert (=> b!1511646 (= e!844362 (not true))))

(declare-fun e!844361 () Bool)

(assert (=> b!1511646 e!844361))

(declare-fun res!1030370 () Bool)

(assert (=> b!1511646 (=> (not res!1030370) (not e!844361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100810 (_ BitVec 32)) Bool)

(assert (=> b!1511646 (= res!1030370 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50305 0))(
  ( (Unit!50306) )
))
(declare-fun lt!655663 () Unit!50305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100810 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50305)

(assert (=> b!1511646 (= lt!655663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1030375 () Bool)

(assert (=> start!129140 (=> (not res!1030375) (not e!844359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129140 (= res!1030375 (validMask!0 mask!2512))))

(assert (=> start!129140 e!844359))

(assert (=> start!129140 true))

(declare-fun array_inv!37918 (array!100810) Bool)

(assert (=> start!129140 (array_inv!37918 a!2804)))

(declare-fun b!1511641 () Bool)

(declare-fun res!1030374 () Bool)

(assert (=> b!1511641 (=> (not res!1030374) (not e!844359))))

(assert (=> b!1511641 (= res!1030374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511647 () Bool)

(assert (=> b!1511647 (= e!844359 e!844362)))

(declare-fun res!1030371 () Bool)

(assert (=> b!1511647 (=> (not res!1030371) (not e!844362))))

(declare-fun lt!655662 () SeekEntryResult!12701)

(assert (=> b!1511647 (= res!1030371 (= lt!655662 lt!655661))))

(assert (=> b!1511647 (= lt!655661 (Intermediate!12701 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511647 (= lt!655662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48637 a!2804) j!70) mask!2512) (select (arr!48637 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511648 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100810 (_ BitVec 32)) SeekEntryResult!12701)

(assert (=> b!1511648 (= e!844361 (= (seekEntry!0 (select (arr!48637 a!2804) j!70) a!2804 mask!2512) (Found!12701 j!70)))))

(declare-fun b!1511649 () Bool)

(declare-fun res!1030368 () Bool)

(assert (=> b!1511649 (=> (not res!1030368) (not e!844359))))

(assert (=> b!1511649 (= res!1030368 (validKeyInArray!0 (select (arr!48637 a!2804) j!70)))))

(declare-fun b!1511650 () Bool)

(declare-fun res!1030369 () Bool)

(assert (=> b!1511650 (=> (not res!1030369) (not e!844362))))

(assert (=> b!1511650 (= res!1030369 (= lt!655662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100811 (store (arr!48637 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49188 a!2804)) mask!2512)))))

(assert (= (and start!129140 res!1030375) b!1511643))

(assert (= (and b!1511643 res!1030367) b!1511644))

(assert (= (and b!1511644 res!1030372) b!1511649))

(assert (= (and b!1511649 res!1030368) b!1511641))

(assert (= (and b!1511641 res!1030374) b!1511642))

(assert (= (and b!1511642 res!1030366) b!1511640))

(assert (= (and b!1511640 res!1030373) b!1511647))

(assert (= (and b!1511647 res!1030371) b!1511645))

(assert (= (and b!1511645 res!1030376) b!1511650))

(assert (= (and b!1511650 res!1030369) b!1511646))

(assert (= (and b!1511646 res!1030370) b!1511648))

(declare-fun m!1394127 () Bool)

(assert (=> b!1511648 m!1394127))

(assert (=> b!1511648 m!1394127))

(declare-fun m!1394129 () Bool)

(assert (=> b!1511648 m!1394129))

(declare-fun m!1394131 () Bool)

(assert (=> b!1511642 m!1394131))

(declare-fun m!1394133 () Bool)

(assert (=> b!1511650 m!1394133))

(declare-fun m!1394135 () Bool)

(assert (=> b!1511650 m!1394135))

(assert (=> b!1511650 m!1394135))

(declare-fun m!1394137 () Bool)

(assert (=> b!1511650 m!1394137))

(assert (=> b!1511650 m!1394137))

(assert (=> b!1511650 m!1394135))

(declare-fun m!1394139 () Bool)

(assert (=> b!1511650 m!1394139))

(declare-fun m!1394141 () Bool)

(assert (=> start!129140 m!1394141))

(declare-fun m!1394143 () Bool)

(assert (=> start!129140 m!1394143))

(assert (=> b!1511645 m!1394127))

(assert (=> b!1511645 m!1394127))

(declare-fun m!1394145 () Bool)

(assert (=> b!1511645 m!1394145))

(assert (=> b!1511647 m!1394127))

(assert (=> b!1511647 m!1394127))

(declare-fun m!1394147 () Bool)

(assert (=> b!1511647 m!1394147))

(assert (=> b!1511647 m!1394147))

(assert (=> b!1511647 m!1394127))

(declare-fun m!1394149 () Bool)

(assert (=> b!1511647 m!1394149))

(assert (=> b!1511649 m!1394127))

(assert (=> b!1511649 m!1394127))

(declare-fun m!1394151 () Bool)

(assert (=> b!1511649 m!1394151))

(declare-fun m!1394153 () Bool)

(assert (=> b!1511644 m!1394153))

(assert (=> b!1511644 m!1394153))

(declare-fun m!1394155 () Bool)

(assert (=> b!1511644 m!1394155))

(declare-fun m!1394157 () Bool)

(assert (=> b!1511646 m!1394157))

(declare-fun m!1394159 () Bool)

(assert (=> b!1511646 m!1394159))

(declare-fun m!1394161 () Bool)

(assert (=> b!1511641 m!1394161))

(check-sat (not b!1511645) (not b!1511649) (not b!1511650) (not b!1511648) (not b!1511642) (not b!1511641) (not b!1511647) (not b!1511646) (not b!1511644) (not start!129140))
(check-sat)
