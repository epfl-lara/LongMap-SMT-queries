; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129194 () Bool)

(assert start!129194)

(declare-fun b!1512540 () Bool)

(declare-fun res!1031271 () Bool)

(declare-fun e!844693 () Bool)

(assert (=> b!1512540 (=> (not res!1031271) (not e!844693))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100864 0))(
  ( (array!100865 (arr!48664 (Array (_ BitVec 32) (_ BitVec 64))) (size!49215 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100864)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512540 (= res!1031271 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49215 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49215 a!2804))))))

(declare-fun b!1512541 () Bool)

(declare-fun res!1031274 () Bool)

(assert (=> b!1512541 (=> (not res!1031274) (not e!844693))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512541 (= res!1031274 (and (= (size!49215 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49215 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49215 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512542 () Bool)

(declare-fun res!1031269 () Bool)

(assert (=> b!1512542 (=> (not res!1031269) (not e!844693))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512542 (= res!1031269 (validKeyInArray!0 (select (arr!48664 a!2804) j!70)))))

(declare-fun b!1512543 () Bool)

(declare-fun e!844695 () Bool)

(assert (=> b!1512543 (= e!844695 (not true))))

(declare-fun e!844694 () Bool)

(assert (=> b!1512543 e!844694))

(declare-fun res!1031276 () Bool)

(assert (=> b!1512543 (=> (not res!1031276) (not e!844694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100864 (_ BitVec 32)) Bool)

(assert (=> b!1512543 (= res!1031276 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50359 0))(
  ( (Unit!50360) )
))
(declare-fun lt!655906 () Unit!50359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50359)

(assert (=> b!1512543 (= lt!655906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1031267 () Bool)

(assert (=> start!129194 (=> (not res!1031267) (not e!844693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129194 (= res!1031267 (validMask!0 mask!2512))))

(assert (=> start!129194 e!844693))

(assert (=> start!129194 true))

(declare-fun array_inv!37945 (array!100864) Bool)

(assert (=> start!129194 (array_inv!37945 a!2804)))

(declare-fun b!1512544 () Bool)

(declare-fun res!1031268 () Bool)

(assert (=> b!1512544 (=> (not res!1031268) (not e!844695))))

(declare-datatypes ((SeekEntryResult!12728 0))(
  ( (MissingZero!12728 (index!53307 (_ BitVec 32))) (Found!12728 (index!53308 (_ BitVec 32))) (Intermediate!12728 (undefined!13540 Bool) (index!53309 (_ BitVec 32)) (x!135251 (_ BitVec 32))) (Undefined!12728) (MissingVacant!12728 (index!53310 (_ BitVec 32))) )
))
(declare-fun lt!655904 () SeekEntryResult!12728)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12728)

(assert (=> b!1512544 (= res!1031268 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) lt!655904))))

(declare-fun b!1512545 () Bool)

(declare-fun res!1031266 () Bool)

(assert (=> b!1512545 (=> (not res!1031266) (not e!844695))))

(declare-fun lt!655905 () SeekEntryResult!12728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512545 (= res!1031266 (= lt!655905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100865 (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49215 a!2804)) mask!2512)))))

(declare-fun b!1512546 () Bool)

(declare-fun res!1031270 () Bool)

(assert (=> b!1512546 (=> (not res!1031270) (not e!844693))))

(assert (=> b!1512546 (= res!1031270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512547 () Bool)

(assert (=> b!1512547 (= e!844693 e!844695)))

(declare-fun res!1031275 () Bool)

(assert (=> b!1512547 (=> (not res!1031275) (not e!844695))))

(assert (=> b!1512547 (= res!1031275 (= lt!655905 lt!655904))))

(assert (=> b!1512547 (= lt!655904 (Intermediate!12728 false resIndex!21 resX!21))))

(assert (=> b!1512547 (= lt!655905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48664 a!2804) j!70) mask!2512) (select (arr!48664 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512548 () Bool)

(declare-fun res!1031273 () Bool)

(assert (=> b!1512548 (=> (not res!1031273) (not e!844693))))

(declare-datatypes ((List!35134 0))(
  ( (Nil!35131) (Cons!35130 (h!36557 (_ BitVec 64)) (t!49820 List!35134)) )
))
(declare-fun arrayNoDuplicates!0 (array!100864 (_ BitVec 32) List!35134) Bool)

(assert (=> b!1512548 (= res!1031273 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35131))))

(declare-fun b!1512549 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12728)

(assert (=> b!1512549 (= e!844694 (= (seekEntry!0 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) (Found!12728 j!70)))))

(declare-fun b!1512550 () Bool)

(declare-fun res!1031272 () Bool)

(assert (=> b!1512550 (=> (not res!1031272) (not e!844693))))

(assert (=> b!1512550 (= res!1031272 (validKeyInArray!0 (select (arr!48664 a!2804) i!961)))))

(assert (= (and start!129194 res!1031267) b!1512541))

(assert (= (and b!1512541 res!1031274) b!1512550))

(assert (= (and b!1512550 res!1031272) b!1512542))

(assert (= (and b!1512542 res!1031269) b!1512546))

(assert (= (and b!1512546 res!1031270) b!1512548))

(assert (= (and b!1512548 res!1031273) b!1512540))

(assert (= (and b!1512540 res!1031271) b!1512547))

(assert (= (and b!1512547 res!1031275) b!1512544))

(assert (= (and b!1512544 res!1031268) b!1512545))

(assert (= (and b!1512545 res!1031266) b!1512543))

(assert (= (and b!1512543 res!1031276) b!1512549))

(declare-fun m!1395123 () Bool)

(assert (=> b!1512545 m!1395123))

(declare-fun m!1395125 () Bool)

(assert (=> b!1512545 m!1395125))

(assert (=> b!1512545 m!1395125))

(declare-fun m!1395127 () Bool)

(assert (=> b!1512545 m!1395127))

(assert (=> b!1512545 m!1395127))

(assert (=> b!1512545 m!1395125))

(declare-fun m!1395129 () Bool)

(assert (=> b!1512545 m!1395129))

(declare-fun m!1395131 () Bool)

(assert (=> b!1512543 m!1395131))

(declare-fun m!1395133 () Bool)

(assert (=> b!1512543 m!1395133))

(declare-fun m!1395135 () Bool)

(assert (=> b!1512550 m!1395135))

(assert (=> b!1512550 m!1395135))

(declare-fun m!1395137 () Bool)

(assert (=> b!1512550 m!1395137))

(declare-fun m!1395139 () Bool)

(assert (=> b!1512549 m!1395139))

(assert (=> b!1512549 m!1395139))

(declare-fun m!1395141 () Bool)

(assert (=> b!1512549 m!1395141))

(assert (=> b!1512544 m!1395139))

(assert (=> b!1512544 m!1395139))

(declare-fun m!1395143 () Bool)

(assert (=> b!1512544 m!1395143))

(assert (=> b!1512542 m!1395139))

(assert (=> b!1512542 m!1395139))

(declare-fun m!1395145 () Bool)

(assert (=> b!1512542 m!1395145))

(declare-fun m!1395147 () Bool)

(assert (=> start!129194 m!1395147))

(declare-fun m!1395149 () Bool)

(assert (=> start!129194 m!1395149))

(declare-fun m!1395151 () Bool)

(assert (=> b!1512548 m!1395151))

(assert (=> b!1512547 m!1395139))

(assert (=> b!1512547 m!1395139))

(declare-fun m!1395153 () Bool)

(assert (=> b!1512547 m!1395153))

(assert (=> b!1512547 m!1395153))

(assert (=> b!1512547 m!1395139))

(declare-fun m!1395155 () Bool)

(assert (=> b!1512547 m!1395155))

(declare-fun m!1395157 () Bool)

(assert (=> b!1512546 m!1395157))

(check-sat (not b!1512542) (not b!1512545) (not b!1512544) (not b!1512550) (not b!1512543) (not b!1512548) (not start!129194) (not b!1512549) (not b!1512546) (not b!1512547))
(check-sat)
