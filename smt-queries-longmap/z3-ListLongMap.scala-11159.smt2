; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130386 () Bool)

(assert start!130386)

(declare-fun b!1530503 () Bool)

(declare-fun e!852823 () Bool)

(declare-fun e!852820 () Bool)

(assert (=> b!1530503 (= e!852823 (not e!852820))))

(declare-fun res!1048031 () Bool)

(assert (=> b!1530503 (=> res!1048031 e!852820)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101620 0))(
  ( (array!101621 (arr!49033 (Array (_ BitVec 32) (_ BitVec 64))) (size!49585 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101620)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530503 (= res!1048031 (or (not (= (select (arr!49033 a!2804) j!70) (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852819 () Bool)

(assert (=> b!1530503 e!852819))

(declare-fun res!1048039 () Bool)

(assert (=> b!1530503 (=> (not res!1048039) (not e!852819))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101620 (_ BitVec 32)) Bool)

(assert (=> b!1530503 (= res!1048039 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51065 0))(
  ( (Unit!51066) )
))
(declare-fun lt!662708 () Unit!51065)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51065)

(assert (=> b!1530503 (= lt!662708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1048037 () Bool)

(declare-fun e!852821 () Bool)

(assert (=> start!130386 (=> (not res!1048037) (not e!852821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130386 (= res!1048037 (validMask!0 mask!2512))))

(assert (=> start!130386 e!852821))

(assert (=> start!130386 true))

(declare-fun array_inv!38266 (array!101620) Bool)

(assert (=> start!130386 (array_inv!38266 a!2804)))

(declare-fun b!1530504 () Bool)

(declare-fun res!1048038 () Bool)

(assert (=> b!1530504 (=> (not res!1048038) (not e!852821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530504 (= res!1048038 (validKeyInArray!0 (select (arr!49033 a!2804) j!70)))))

(declare-fun b!1530505 () Bool)

(declare-datatypes ((SeekEntryResult!13221 0))(
  ( (MissingZero!13221 (index!55279 (_ BitVec 32))) (Found!13221 (index!55280 (_ BitVec 32))) (Intermediate!13221 (undefined!14033 Bool) (index!55281 (_ BitVec 32)) (x!136977 (_ BitVec 32))) (Undefined!13221) (MissingVacant!13221 (index!55282 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1530505 (= e!852819 (= (seekEntry!0 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) (Found!13221 j!70)))))

(declare-fun b!1530506 () Bool)

(declare-fun res!1048032 () Bool)

(assert (=> b!1530506 (=> (not res!1048032) (not e!852821))))

(assert (=> b!1530506 (= res!1048032 (and (= (size!49585 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49585 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49585 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530507 () Bool)

(declare-fun res!1048034 () Bool)

(assert (=> b!1530507 (=> (not res!1048034) (not e!852821))))

(assert (=> b!1530507 (= res!1048034 (validKeyInArray!0 (select (arr!49033 a!2804) i!961)))))

(declare-fun b!1530508 () Bool)

(declare-fun res!1048030 () Bool)

(assert (=> b!1530508 (=> (not res!1048030) (not e!852823))))

(declare-fun lt!662709 () SeekEntryResult!13221)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101620 (_ BitVec 32)) SeekEntryResult!13221)

(assert (=> b!1530508 (= res!1048030 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) lt!662709))))

(declare-fun b!1530509 () Bool)

(declare-fun res!1048035 () Bool)

(assert (=> b!1530509 (=> (not res!1048035) (not e!852821))))

(assert (=> b!1530509 (= res!1048035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530510 () Bool)

(declare-fun res!1048033 () Bool)

(assert (=> b!1530510 (=> (not res!1048033) (not e!852821))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530510 (= res!1048033 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49585 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49585 a!2804))))))

(declare-fun b!1530511 () Bool)

(declare-fun res!1048028 () Bool)

(assert (=> b!1530511 (=> (not res!1048028) (not e!852823))))

(declare-fun lt!662706 () SeekEntryResult!13221)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530511 (= res!1048028 (= lt!662706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101621 (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49585 a!2804)) mask!2512)))))

(declare-fun b!1530512 () Bool)

(assert (=> b!1530512 (= e!852820 true)))

(declare-fun lt!662707 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530512 (= lt!662707 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530513 () Bool)

(declare-fun res!1048029 () Bool)

(assert (=> b!1530513 (=> (not res!1048029) (not e!852821))))

(declare-datatypes ((List!35594 0))(
  ( (Nil!35591) (Cons!35590 (h!37033 (_ BitVec 64)) (t!50280 List!35594)) )
))
(declare-fun arrayNoDuplicates!0 (array!101620 (_ BitVec 32) List!35594) Bool)

(assert (=> b!1530513 (= res!1048029 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35591))))

(declare-fun b!1530514 () Bool)

(assert (=> b!1530514 (= e!852821 e!852823)))

(declare-fun res!1048036 () Bool)

(assert (=> b!1530514 (=> (not res!1048036) (not e!852823))))

(assert (=> b!1530514 (= res!1048036 (= lt!662706 lt!662709))))

(assert (=> b!1530514 (= lt!662709 (Intermediate!13221 false resIndex!21 resX!21))))

(assert (=> b!1530514 (= lt!662706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49033 a!2804) j!70) mask!2512) (select (arr!49033 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130386 res!1048037) b!1530506))

(assert (= (and b!1530506 res!1048032) b!1530507))

(assert (= (and b!1530507 res!1048034) b!1530504))

(assert (= (and b!1530504 res!1048038) b!1530509))

(assert (= (and b!1530509 res!1048035) b!1530513))

(assert (= (and b!1530513 res!1048029) b!1530510))

(assert (= (and b!1530510 res!1048033) b!1530514))

(assert (= (and b!1530514 res!1048036) b!1530508))

(assert (= (and b!1530508 res!1048030) b!1530511))

(assert (= (and b!1530511 res!1048028) b!1530503))

(assert (= (and b!1530503 res!1048039) b!1530505))

(assert (= (and b!1530503 (not res!1048031)) b!1530512))

(declare-fun m!1412687 () Bool)

(assert (=> b!1530512 m!1412687))

(declare-fun m!1412689 () Bool)

(assert (=> b!1530509 m!1412689))

(declare-fun m!1412691 () Bool)

(assert (=> b!1530505 m!1412691))

(assert (=> b!1530505 m!1412691))

(declare-fun m!1412693 () Bool)

(assert (=> b!1530505 m!1412693))

(assert (=> b!1530514 m!1412691))

(assert (=> b!1530514 m!1412691))

(declare-fun m!1412695 () Bool)

(assert (=> b!1530514 m!1412695))

(assert (=> b!1530514 m!1412695))

(assert (=> b!1530514 m!1412691))

(declare-fun m!1412697 () Bool)

(assert (=> b!1530514 m!1412697))

(declare-fun m!1412699 () Bool)

(assert (=> start!130386 m!1412699))

(declare-fun m!1412701 () Bool)

(assert (=> start!130386 m!1412701))

(declare-fun m!1412703 () Bool)

(assert (=> b!1530507 m!1412703))

(assert (=> b!1530507 m!1412703))

(declare-fun m!1412705 () Bool)

(assert (=> b!1530507 m!1412705))

(assert (=> b!1530504 m!1412691))

(assert (=> b!1530504 m!1412691))

(declare-fun m!1412707 () Bool)

(assert (=> b!1530504 m!1412707))

(declare-fun m!1412709 () Bool)

(assert (=> b!1530513 m!1412709))

(assert (=> b!1530508 m!1412691))

(assert (=> b!1530508 m!1412691))

(declare-fun m!1412711 () Bool)

(assert (=> b!1530508 m!1412711))

(declare-fun m!1412713 () Bool)

(assert (=> b!1530511 m!1412713))

(declare-fun m!1412715 () Bool)

(assert (=> b!1530511 m!1412715))

(assert (=> b!1530511 m!1412715))

(declare-fun m!1412717 () Bool)

(assert (=> b!1530511 m!1412717))

(assert (=> b!1530511 m!1412717))

(assert (=> b!1530511 m!1412715))

(declare-fun m!1412719 () Bool)

(assert (=> b!1530511 m!1412719))

(assert (=> b!1530503 m!1412691))

(declare-fun m!1412721 () Bool)

(assert (=> b!1530503 m!1412721))

(assert (=> b!1530503 m!1412713))

(assert (=> b!1530503 m!1412715))

(declare-fun m!1412723 () Bool)

(assert (=> b!1530503 m!1412723))

(check-sat (not b!1530509) (not b!1530512) (not b!1530511) (not b!1530514) (not start!130386) (not b!1530505) (not b!1530504) (not b!1530503) (not b!1530513) (not b!1530507) (not b!1530508))
(check-sat)
