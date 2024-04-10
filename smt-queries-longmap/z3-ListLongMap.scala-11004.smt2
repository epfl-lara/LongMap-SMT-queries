; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128858 () Bool)

(assert start!128858)

(declare-fun b!1510138 () Bool)

(declare-fun res!1030045 () Bool)

(declare-fun e!843345 () Bool)

(assert (=> b!1510138 (=> (not res!1030045) (not e!843345))))

(declare-datatypes ((array!100714 0))(
  ( (array!100715 (arr!48594 (Array (_ BitVec 32) (_ BitVec 64))) (size!49144 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100714)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100714 (_ BitVec 32)) Bool)

(assert (=> b!1510138 (= res!1030045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510139 () Bool)

(declare-fun e!843344 () Bool)

(assert (=> b!1510139 (= e!843345 e!843344)))

(declare-fun res!1030042 () Bool)

(assert (=> b!1510139 (=> (not res!1030042) (not e!843344))))

(declare-datatypes ((SeekEntryResult!12765 0))(
  ( (MissingZero!12765 (index!53455 (_ BitVec 32))) (Found!12765 (index!53456 (_ BitVec 32))) (Intermediate!12765 (undefined!13577 Bool) (index!53457 (_ BitVec 32)) (x!135203 (_ BitVec 32))) (Undefined!12765) (MissingVacant!12765 (index!53458 (_ BitVec 32))) )
))
(declare-fun lt!655090 () SeekEntryResult!12765)

(declare-fun lt!655089 () SeekEntryResult!12765)

(assert (=> b!1510139 (= res!1030042 (= lt!655090 lt!655089))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510139 (= lt!655089 (Intermediate!12765 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100714 (_ BitVec 32)) SeekEntryResult!12765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510139 (= lt!655090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48594 a!2804) j!70) mask!2512) (select (arr!48594 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510140 () Bool)

(declare-fun res!1030047 () Bool)

(assert (=> b!1510140 (=> (not res!1030047) (not e!843345))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510140 (= res!1030047 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49144 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49144 a!2804))))))

(declare-fun res!1030043 () Bool)

(assert (=> start!128858 (=> (not res!1030043) (not e!843345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128858 (= res!1030043 (validMask!0 mask!2512))))

(assert (=> start!128858 e!843345))

(assert (=> start!128858 true))

(declare-fun array_inv!37622 (array!100714) Bool)

(assert (=> start!128858 (array_inv!37622 a!2804)))

(declare-fun b!1510141 () Bool)

(declare-fun res!1030048 () Bool)

(assert (=> b!1510141 (=> (not res!1030048) (not e!843344))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510141 (= res!1030048 (= lt!655090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48594 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48594 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100715 (store (arr!48594 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49144 a!2804)) mask!2512)))))

(declare-fun b!1510142 () Bool)

(declare-fun e!843346 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100714 (_ BitVec 32)) SeekEntryResult!12765)

(assert (=> b!1510142 (= e!843346 (= (seekEntry!0 (select (arr!48594 a!2804) j!70) a!2804 mask!2512) (Found!12765 j!70)))))

(declare-fun b!1510143 () Bool)

(declare-fun res!1030051 () Bool)

(assert (=> b!1510143 (=> (not res!1030051) (not e!843344))))

(assert (=> b!1510143 (= res!1030051 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48594 a!2804) j!70) a!2804 mask!2512) lt!655089))))

(declare-fun b!1510144 () Bool)

(assert (=> b!1510144 (= e!843344 (not (or (not (= (select (arr!48594 a!2804) j!70) (select (store (arr!48594 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48594 a!2804) index!487) (select (arr!48594 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1510144 e!843346))

(declare-fun res!1030044 () Bool)

(assert (=> b!1510144 (=> (not res!1030044) (not e!843346))))

(assert (=> b!1510144 (= res!1030044 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50398 0))(
  ( (Unit!50399) )
))
(declare-fun lt!655088 () Unit!50398)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50398)

(assert (=> b!1510144 (= lt!655088 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510145 () Bool)

(declare-fun res!1030041 () Bool)

(assert (=> b!1510145 (=> (not res!1030041) (not e!843345))))

(declare-datatypes ((List!35077 0))(
  ( (Nil!35074) (Cons!35073 (h!36485 (_ BitVec 64)) (t!49771 List!35077)) )
))
(declare-fun arrayNoDuplicates!0 (array!100714 (_ BitVec 32) List!35077) Bool)

(assert (=> b!1510145 (= res!1030041 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35074))))

(declare-fun b!1510146 () Bool)

(declare-fun res!1030049 () Bool)

(assert (=> b!1510146 (=> (not res!1030049) (not e!843345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510146 (= res!1030049 (validKeyInArray!0 (select (arr!48594 a!2804) j!70)))))

(declare-fun b!1510147 () Bool)

(declare-fun res!1030046 () Bool)

(assert (=> b!1510147 (=> (not res!1030046) (not e!843345))))

(assert (=> b!1510147 (= res!1030046 (validKeyInArray!0 (select (arr!48594 a!2804) i!961)))))

(declare-fun b!1510148 () Bool)

(declare-fun res!1030050 () Bool)

(assert (=> b!1510148 (=> (not res!1030050) (not e!843345))))

(assert (=> b!1510148 (= res!1030050 (and (= (size!49144 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49144 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49144 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128858 res!1030043) b!1510148))

(assert (= (and b!1510148 res!1030050) b!1510147))

(assert (= (and b!1510147 res!1030046) b!1510146))

(assert (= (and b!1510146 res!1030049) b!1510138))

(assert (= (and b!1510138 res!1030045) b!1510145))

(assert (= (and b!1510145 res!1030041) b!1510140))

(assert (= (and b!1510140 res!1030047) b!1510139))

(assert (= (and b!1510139 res!1030042) b!1510143))

(assert (= (and b!1510143 res!1030051) b!1510141))

(assert (= (and b!1510141 res!1030048) b!1510144))

(assert (= (and b!1510144 res!1030044) b!1510142))

(declare-fun m!1392693 () Bool)

(assert (=> start!128858 m!1392693))

(declare-fun m!1392695 () Bool)

(assert (=> start!128858 m!1392695))

(declare-fun m!1392697 () Bool)

(assert (=> b!1510139 m!1392697))

(assert (=> b!1510139 m!1392697))

(declare-fun m!1392699 () Bool)

(assert (=> b!1510139 m!1392699))

(assert (=> b!1510139 m!1392699))

(assert (=> b!1510139 m!1392697))

(declare-fun m!1392701 () Bool)

(assert (=> b!1510139 m!1392701))

(assert (=> b!1510146 m!1392697))

(assert (=> b!1510146 m!1392697))

(declare-fun m!1392703 () Bool)

(assert (=> b!1510146 m!1392703))

(assert (=> b!1510142 m!1392697))

(assert (=> b!1510142 m!1392697))

(declare-fun m!1392705 () Bool)

(assert (=> b!1510142 m!1392705))

(assert (=> b!1510143 m!1392697))

(assert (=> b!1510143 m!1392697))

(declare-fun m!1392707 () Bool)

(assert (=> b!1510143 m!1392707))

(declare-fun m!1392709 () Bool)

(assert (=> b!1510145 m!1392709))

(declare-fun m!1392711 () Bool)

(assert (=> b!1510138 m!1392711))

(declare-fun m!1392713 () Bool)

(assert (=> b!1510147 m!1392713))

(assert (=> b!1510147 m!1392713))

(declare-fun m!1392715 () Bool)

(assert (=> b!1510147 m!1392715))

(declare-fun m!1392717 () Bool)

(assert (=> b!1510141 m!1392717))

(declare-fun m!1392719 () Bool)

(assert (=> b!1510141 m!1392719))

(assert (=> b!1510141 m!1392719))

(declare-fun m!1392721 () Bool)

(assert (=> b!1510141 m!1392721))

(assert (=> b!1510141 m!1392721))

(assert (=> b!1510141 m!1392719))

(declare-fun m!1392723 () Bool)

(assert (=> b!1510141 m!1392723))

(assert (=> b!1510144 m!1392697))

(declare-fun m!1392725 () Bool)

(assert (=> b!1510144 m!1392725))

(assert (=> b!1510144 m!1392717))

(declare-fun m!1392727 () Bool)

(assert (=> b!1510144 m!1392727))

(assert (=> b!1510144 m!1392719))

(declare-fun m!1392729 () Bool)

(assert (=> b!1510144 m!1392729))

(check-sat (not b!1510147) (not b!1510146) (not b!1510145) (not b!1510139) (not b!1510138) (not b!1510141) (not b!1510142) (not b!1510143) (not b!1510144) (not start!128858))
(check-sat)
