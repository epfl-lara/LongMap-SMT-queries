; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128964 () Bool)

(assert start!128964)

(declare-fun b!1511956 () Bool)

(declare-fun res!1031862 () Bool)

(declare-fun e!844024 () Bool)

(assert (=> b!1511956 (=> (not res!1031862) (not e!844024))))

(declare-datatypes ((SeekEntryResult!12818 0))(
  ( (MissingZero!12818 (index!53667 (_ BitVec 32))) (Found!12818 (index!53668 (_ BitVec 32))) (Intermediate!12818 (undefined!13630 Bool) (index!53669 (_ BitVec 32)) (x!135400 (_ BitVec 32))) (Undefined!12818) (MissingVacant!12818 (index!53670 (_ BitVec 32))) )
))
(declare-fun lt!655566 () SeekEntryResult!12818)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100820 0))(
  ( (array!100821 (arr!48647 (Array (_ BitVec 32) (_ BitVec 64))) (size!49197 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100820)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100820 (_ BitVec 32)) SeekEntryResult!12818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511956 (= res!1031862 (= lt!655566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100821 (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49197 a!2804)) mask!2512)))))

(declare-fun res!1031872 () Bool)

(declare-fun e!844020 () Bool)

(assert (=> start!128964 (=> (not res!1031872) (not e!844020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128964 (= res!1031872 (validMask!0 mask!2512))))

(assert (=> start!128964 e!844020))

(assert (=> start!128964 true))

(declare-fun array_inv!37675 (array!100820) Bool)

(assert (=> start!128964 (array_inv!37675 a!2804)))

(declare-fun b!1511957 () Bool)

(declare-fun res!1031871 () Bool)

(assert (=> b!1511957 (=> (not res!1031871) (not e!844020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511957 (= res!1031871 (validKeyInArray!0 (select (arr!48647 a!2804) j!70)))))

(declare-fun b!1511958 () Bool)

(declare-fun res!1031863 () Bool)

(assert (=> b!1511958 (=> (not res!1031863) (not e!844020))))

(declare-datatypes ((List!35130 0))(
  ( (Nil!35127) (Cons!35126 (h!36538 (_ BitVec 64)) (t!49824 List!35130)) )
))
(declare-fun arrayNoDuplicates!0 (array!100820 (_ BitVec 32) List!35130) Bool)

(assert (=> b!1511958 (= res!1031863 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35127))))

(declare-fun b!1511959 () Bool)

(declare-fun res!1031860 () Bool)

(assert (=> b!1511959 (=> (not res!1031860) (not e!844020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100820 (_ BitVec 32)) Bool)

(assert (=> b!1511959 (= res!1031860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!844021 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1511960 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100820 (_ BitVec 32)) SeekEntryResult!12818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100820 (_ BitVec 32)) SeekEntryResult!12818)

(assert (=> b!1511960 (= e!844021 (= (seekEntryOrOpen!0 (select (arr!48647 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48647 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511961 () Bool)

(declare-fun e!844019 () Bool)

(assert (=> b!1511961 (= e!844024 (not e!844019))))

(declare-fun res!1031868 () Bool)

(assert (=> b!1511961 (=> res!1031868 e!844019)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511961 (= res!1031868 (or (not (= (select (arr!48647 a!2804) j!70) (select (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48647 a!2804) index!487) (select (arr!48647 a!2804) j!70)) (not (= (select (arr!48647 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun e!844023 () Bool)

(assert (=> b!1511961 e!844023))

(declare-fun res!1031869 () Bool)

(assert (=> b!1511961 (=> (not res!1031869) (not e!844023))))

(assert (=> b!1511961 (= res!1031869 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50504 0))(
  ( (Unit!50505) )
))
(declare-fun lt!655567 () Unit!50504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50504)

(assert (=> b!1511961 (= lt!655567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511962 () Bool)

(declare-fun res!1031870 () Bool)

(assert (=> b!1511962 (=> (not res!1031870) (not e!844020))))

(assert (=> b!1511962 (= res!1031870 (validKeyInArray!0 (select (arr!48647 a!2804) i!961)))))

(declare-fun b!1511963 () Bool)

(declare-fun res!1031867 () Bool)

(assert (=> b!1511963 (=> (not res!1031867) (not e!844020))))

(assert (=> b!1511963 (= res!1031867 (and (= (size!49197 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49197 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49197 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511964 () Bool)

(declare-fun res!1031859 () Bool)

(assert (=> b!1511964 (=> (not res!1031859) (not e!844024))))

(declare-fun lt!655565 () SeekEntryResult!12818)

(assert (=> b!1511964 (= res!1031859 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48647 a!2804) j!70) a!2804 mask!2512) lt!655565))))

(declare-fun b!1511965 () Bool)

(declare-fun res!1031865 () Bool)

(assert (=> b!1511965 (=> (not res!1031865) (not e!844023))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100820 (_ BitVec 32)) SeekEntryResult!12818)

(assert (=> b!1511965 (= res!1031865 (= (seekEntry!0 (select (arr!48647 a!2804) j!70) a!2804 mask!2512) (Found!12818 j!70)))))

(declare-fun b!1511966 () Bool)

(assert (=> b!1511966 (= e!844023 e!844021)))

(declare-fun res!1031866 () Bool)

(assert (=> b!1511966 (=> res!1031866 e!844021)))

(assert (=> b!1511966 (= res!1031866 (or (not (= (select (arr!48647 a!2804) j!70) (select (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48647 a!2804) index!487) (select (arr!48647 a!2804) j!70)) (not (= (select (arr!48647 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511967 () Bool)

(declare-fun res!1031861 () Bool)

(assert (=> b!1511967 (=> (not res!1031861) (not e!844020))))

(assert (=> b!1511967 (= res!1031861 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49197 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49197 a!2804))))))

(declare-fun b!1511968 () Bool)

(assert (=> b!1511968 (= e!844020 e!844024)))

(declare-fun res!1031864 () Bool)

(assert (=> b!1511968 (=> (not res!1031864) (not e!844024))))

(assert (=> b!1511968 (= res!1031864 (= lt!655566 lt!655565))))

(assert (=> b!1511968 (= lt!655565 (Intermediate!12818 false resIndex!21 resX!21))))

(assert (=> b!1511968 (= lt!655566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48647 a!2804) j!70) mask!2512) (select (arr!48647 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511969 () Bool)

(assert (=> b!1511969 (= e!844019 (validKeyInArray!0 (select (store (arr!48647 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (= (and start!128964 res!1031872) b!1511963))

(assert (= (and b!1511963 res!1031867) b!1511962))

(assert (= (and b!1511962 res!1031870) b!1511957))

(assert (= (and b!1511957 res!1031871) b!1511959))

(assert (= (and b!1511959 res!1031860) b!1511958))

(assert (= (and b!1511958 res!1031863) b!1511967))

(assert (= (and b!1511967 res!1031861) b!1511968))

(assert (= (and b!1511968 res!1031864) b!1511964))

(assert (= (and b!1511964 res!1031859) b!1511956))

(assert (= (and b!1511956 res!1031862) b!1511961))

(assert (= (and b!1511961 res!1031869) b!1511965))

(assert (= (and b!1511965 res!1031865) b!1511966))

(assert (= (and b!1511966 (not res!1031866)) b!1511960))

(assert (= (and b!1511961 (not res!1031868)) b!1511969))

(declare-fun m!1394689 () Bool)

(assert (=> b!1511959 m!1394689))

(declare-fun m!1394691 () Bool)

(assert (=> b!1511962 m!1394691))

(assert (=> b!1511962 m!1394691))

(declare-fun m!1394693 () Bool)

(assert (=> b!1511962 m!1394693))

(declare-fun m!1394695 () Bool)

(assert (=> b!1511968 m!1394695))

(assert (=> b!1511968 m!1394695))

(declare-fun m!1394697 () Bool)

(assert (=> b!1511968 m!1394697))

(assert (=> b!1511968 m!1394697))

(assert (=> b!1511968 m!1394695))

(declare-fun m!1394699 () Bool)

(assert (=> b!1511968 m!1394699))

(assert (=> b!1511960 m!1394695))

(assert (=> b!1511960 m!1394695))

(declare-fun m!1394701 () Bool)

(assert (=> b!1511960 m!1394701))

(assert (=> b!1511960 m!1394695))

(declare-fun m!1394703 () Bool)

(assert (=> b!1511960 m!1394703))

(assert (=> b!1511966 m!1394695))

(declare-fun m!1394705 () Bool)

(assert (=> b!1511966 m!1394705))

(declare-fun m!1394707 () Bool)

(assert (=> b!1511966 m!1394707))

(declare-fun m!1394709 () Bool)

(assert (=> b!1511966 m!1394709))

(assert (=> b!1511964 m!1394695))

(assert (=> b!1511964 m!1394695))

(declare-fun m!1394711 () Bool)

(assert (=> b!1511964 m!1394711))

(assert (=> b!1511956 m!1394705))

(assert (=> b!1511956 m!1394707))

(assert (=> b!1511956 m!1394707))

(declare-fun m!1394713 () Bool)

(assert (=> b!1511956 m!1394713))

(assert (=> b!1511956 m!1394713))

(assert (=> b!1511956 m!1394707))

(declare-fun m!1394715 () Bool)

(assert (=> b!1511956 m!1394715))

(assert (=> b!1511965 m!1394695))

(assert (=> b!1511965 m!1394695))

(declare-fun m!1394717 () Bool)

(assert (=> b!1511965 m!1394717))

(declare-fun m!1394719 () Bool)

(assert (=> start!128964 m!1394719))

(declare-fun m!1394721 () Bool)

(assert (=> start!128964 m!1394721))

(assert (=> b!1511957 m!1394695))

(assert (=> b!1511957 m!1394695))

(declare-fun m!1394723 () Bool)

(assert (=> b!1511957 m!1394723))

(declare-fun m!1394725 () Bool)

(assert (=> b!1511958 m!1394725))

(assert (=> b!1511969 m!1394705))

(assert (=> b!1511969 m!1394707))

(assert (=> b!1511969 m!1394707))

(declare-fun m!1394727 () Bool)

(assert (=> b!1511969 m!1394727))

(assert (=> b!1511961 m!1394695))

(declare-fun m!1394729 () Bool)

(assert (=> b!1511961 m!1394729))

(assert (=> b!1511961 m!1394705))

(assert (=> b!1511961 m!1394709))

(assert (=> b!1511961 m!1394707))

(declare-fun m!1394731 () Bool)

(assert (=> b!1511961 m!1394731))

(push 1)

