; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129098 () Bool)

(assert start!129098)

(declare-fun b!1514707 () Bool)

(declare-fun res!1034613 () Bool)

(declare-fun e!845306 () Bool)

(assert (=> b!1514707 (=> (not res!1034613) (not e!845306))))

(declare-datatypes ((array!100954 0))(
  ( (array!100955 (arr!48714 (Array (_ BitVec 32) (_ BitVec 64))) (size!49264 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100954)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514707 (= res!1034613 (validKeyInArray!0 (select (arr!48714 a!2804) i!961)))))

(declare-fun res!1034614 () Bool)

(assert (=> start!129098 (=> (not res!1034614) (not e!845306))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129098 (= res!1034614 (validMask!0 mask!2512))))

(assert (=> start!129098 e!845306))

(assert (=> start!129098 true))

(declare-fun array_inv!37742 (array!100954) Bool)

(assert (=> start!129098 (array_inv!37742 a!2804)))

(declare-fun b!1514708 () Bool)

(declare-fun res!1034622 () Bool)

(declare-fun e!845302 () Bool)

(assert (=> b!1514708 (=> (not res!1034622) (not e!845302))))

(declare-datatypes ((SeekEntryResult!12885 0))(
  ( (MissingZero!12885 (index!53935 (_ BitVec 32))) (Found!12885 (index!53936 (_ BitVec 32))) (Intermediate!12885 (undefined!13697 Bool) (index!53937 (_ BitVec 32)) (x!135643 (_ BitVec 32))) (Undefined!12885) (MissingVacant!12885 (index!53938 (_ BitVec 32))) )
))
(declare-fun lt!656430 () SeekEntryResult!12885)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12885)

(assert (=> b!1514708 (= res!1034622 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48714 a!2804) j!70) a!2804 mask!2512) lt!656430))))

(declare-fun b!1514709 () Bool)

(declare-fun e!845305 () Bool)

(assert (=> b!1514709 (= e!845305 (not true))))

(declare-fun e!845304 () Bool)

(assert (=> b!1514709 e!845304))

(declare-fun res!1034619 () Bool)

(assert (=> b!1514709 (=> (not res!1034619) (not e!845304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100954 (_ BitVec 32)) Bool)

(assert (=> b!1514709 (= res!1034619 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50638 0))(
  ( (Unit!50639) )
))
(declare-fun lt!656433 () Unit!50638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50638)

(assert (=> b!1514709 (= lt!656433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514710 () Bool)

(declare-fun res!1034612 () Bool)

(assert (=> b!1514710 (=> (not res!1034612) (not e!845304))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12885)

(assert (=> b!1514710 (= res!1034612 (= (seekEntry!0 (select (arr!48714 a!2804) j!70) a!2804 mask!2512) (Found!12885 j!70)))))

(declare-fun b!1514711 () Bool)

(declare-fun res!1034623 () Bool)

(assert (=> b!1514711 (=> (not res!1034623) (not e!845306))))

(declare-datatypes ((List!35197 0))(
  ( (Nil!35194) (Cons!35193 (h!36605 (_ BitVec 64)) (t!49891 List!35197)) )
))
(declare-fun arrayNoDuplicates!0 (array!100954 (_ BitVec 32) List!35197) Bool)

(assert (=> b!1514711 (= res!1034623 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35194))))

(declare-fun b!1514712 () Bool)

(declare-fun res!1034621 () Bool)

(assert (=> b!1514712 (=> (not res!1034621) (not e!845306))))

(assert (=> b!1514712 (= res!1034621 (and (= (size!49264 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49264 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49264 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514713 () Bool)

(declare-fun e!845308 () Bool)

(assert (=> b!1514713 (= e!845304 e!845308)))

(declare-fun res!1034618 () Bool)

(assert (=> b!1514713 (=> res!1034618 e!845308)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656431 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514713 (= res!1034618 (or (not (= (select (arr!48714 a!2804) j!70) lt!656431)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48714 a!2804) index!487) (select (arr!48714 a!2804) j!70)) (not (= (select (arr!48714 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514714 () Bool)

(declare-fun res!1034620 () Bool)

(assert (=> b!1514714 (=> (not res!1034620) (not e!845306))))

(assert (=> b!1514714 (= res!1034620 (validKeyInArray!0 (select (arr!48714 a!2804) j!70)))))

(declare-fun b!1514715 () Bool)

(declare-fun e!845303 () Bool)

(assert (=> b!1514715 (= e!845308 e!845303)))

(declare-fun res!1034610 () Bool)

(assert (=> b!1514715 (=> (not res!1034610) (not e!845303))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12885)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100954 (_ BitVec 32)) SeekEntryResult!12885)

(assert (=> b!1514715 (= res!1034610 (= (seekEntryOrOpen!0 (select (arr!48714 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48714 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514716 () Bool)

(declare-fun res!1034615 () Bool)

(assert (=> b!1514716 (=> (not res!1034615) (not e!845306))))

(assert (=> b!1514716 (= res!1034615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514717 () Bool)

(assert (=> b!1514717 (= e!845302 e!845305)))

(declare-fun res!1034611 () Bool)

(assert (=> b!1514717 (=> (not res!1034611) (not e!845305))))

(declare-fun lt!656434 () array!100954)

(declare-fun lt!656432 () SeekEntryResult!12885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514717 (= res!1034611 (= lt!656432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656431 mask!2512) lt!656431 lt!656434 mask!2512)))))

(assert (=> b!1514717 (= lt!656431 (select (store (arr!48714 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514717 (= lt!656434 (array!100955 (store (arr!48714 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49264 a!2804)))))

(declare-fun b!1514718 () Bool)

(assert (=> b!1514718 (= e!845306 e!845302)))

(declare-fun res!1034617 () Bool)

(assert (=> b!1514718 (=> (not res!1034617) (not e!845302))))

(assert (=> b!1514718 (= res!1034617 (= lt!656432 lt!656430))))

(assert (=> b!1514718 (= lt!656430 (Intermediate!12885 false resIndex!21 resX!21))))

(assert (=> b!1514718 (= lt!656432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48714 a!2804) j!70) mask!2512) (select (arr!48714 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514719 () Bool)

(declare-fun res!1034616 () Bool)

(assert (=> b!1514719 (=> (not res!1034616) (not e!845306))))

(assert (=> b!1514719 (= res!1034616 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49264 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49264 a!2804))))))

(declare-fun b!1514720 () Bool)

(assert (=> b!1514720 (= e!845303 (= (seekEntryOrOpen!0 lt!656431 lt!656434 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656431 lt!656434 mask!2512)))))

(assert (= (and start!129098 res!1034614) b!1514712))

(assert (= (and b!1514712 res!1034621) b!1514707))

(assert (= (and b!1514707 res!1034613) b!1514714))

(assert (= (and b!1514714 res!1034620) b!1514716))

(assert (= (and b!1514716 res!1034615) b!1514711))

(assert (= (and b!1514711 res!1034623) b!1514719))

(assert (= (and b!1514719 res!1034616) b!1514718))

(assert (= (and b!1514718 res!1034617) b!1514708))

(assert (= (and b!1514708 res!1034622) b!1514717))

(assert (= (and b!1514717 res!1034611) b!1514709))

(assert (= (and b!1514709 res!1034619) b!1514710))

(assert (= (and b!1514710 res!1034612) b!1514713))

(assert (= (and b!1514713 (not res!1034618)) b!1514715))

(assert (= (and b!1514715 res!1034610) b!1514720))

(declare-fun m!1397687 () Bool)

(assert (=> b!1514707 m!1397687))

(assert (=> b!1514707 m!1397687))

(declare-fun m!1397689 () Bool)

(assert (=> b!1514707 m!1397689))

(declare-fun m!1397691 () Bool)

(assert (=> b!1514710 m!1397691))

(assert (=> b!1514710 m!1397691))

(declare-fun m!1397693 () Bool)

(assert (=> b!1514710 m!1397693))

(declare-fun m!1397695 () Bool)

(assert (=> b!1514709 m!1397695))

(declare-fun m!1397697 () Bool)

(assert (=> b!1514709 m!1397697))

(assert (=> b!1514718 m!1397691))

(assert (=> b!1514718 m!1397691))

(declare-fun m!1397699 () Bool)

(assert (=> b!1514718 m!1397699))

(assert (=> b!1514718 m!1397699))

(assert (=> b!1514718 m!1397691))

(declare-fun m!1397701 () Bool)

(assert (=> b!1514718 m!1397701))

(declare-fun m!1397703 () Bool)

(assert (=> start!129098 m!1397703))

(declare-fun m!1397705 () Bool)

(assert (=> start!129098 m!1397705))

(assert (=> b!1514708 m!1397691))

(assert (=> b!1514708 m!1397691))

(declare-fun m!1397707 () Bool)

(assert (=> b!1514708 m!1397707))

(declare-fun m!1397709 () Bool)

(assert (=> b!1514720 m!1397709))

(declare-fun m!1397711 () Bool)

(assert (=> b!1514720 m!1397711))

(assert (=> b!1514713 m!1397691))

(declare-fun m!1397713 () Bool)

(assert (=> b!1514713 m!1397713))

(assert (=> b!1514714 m!1397691))

(assert (=> b!1514714 m!1397691))

(declare-fun m!1397715 () Bool)

(assert (=> b!1514714 m!1397715))

(declare-fun m!1397717 () Bool)

(assert (=> b!1514717 m!1397717))

(assert (=> b!1514717 m!1397717))

(declare-fun m!1397719 () Bool)

(assert (=> b!1514717 m!1397719))

(declare-fun m!1397721 () Bool)

(assert (=> b!1514717 m!1397721))

(declare-fun m!1397723 () Bool)

(assert (=> b!1514717 m!1397723))

(assert (=> b!1514715 m!1397691))

(assert (=> b!1514715 m!1397691))

(declare-fun m!1397725 () Bool)

(assert (=> b!1514715 m!1397725))

(assert (=> b!1514715 m!1397691))

(declare-fun m!1397727 () Bool)

(assert (=> b!1514715 m!1397727))

(declare-fun m!1397729 () Bool)

(assert (=> b!1514711 m!1397729))

(declare-fun m!1397731 () Bool)

(assert (=> b!1514716 m!1397731))

(check-sat (not b!1514714) (not b!1514718) (not b!1514716) (not start!129098) (not b!1514709) (not b!1514707) (not b!1514715) (not b!1514711) (not b!1514720) (not b!1514717) (not b!1514710) (not b!1514708))
(check-sat)
