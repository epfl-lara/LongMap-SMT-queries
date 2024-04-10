; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130286 () Bool)

(assert start!130286)

(declare-fun b!1529712 () Bool)

(declare-fun e!852444 () Bool)

(assert (=> b!1529712 (= e!852444 true)))

(declare-fun lt!662525 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529712 (= lt!662525 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529713 () Bool)

(declare-fun res!1047429 () Bool)

(declare-fun e!852445 () Bool)

(assert (=> b!1529713 (=> (not res!1047429) (not e!852445))))

(declare-datatypes ((array!101636 0))(
  ( (array!101637 (arr!49043 (Array (_ BitVec 32) (_ BitVec 64))) (size!49593 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101636)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529713 (= res!1047429 (validKeyInArray!0 (select (arr!49043 a!2804) i!961)))))

(declare-fun b!1529714 () Bool)

(declare-fun res!1047422 () Bool)

(assert (=> b!1529714 (=> (not res!1047422) (not e!852445))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529714 (= res!1047422 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49593 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49593 a!2804))))))

(declare-fun res!1047427 () Bool)

(assert (=> start!130286 (=> (not res!1047427) (not e!852445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130286 (= res!1047427 (validMask!0 mask!2512))))

(assert (=> start!130286 e!852445))

(assert (=> start!130286 true))

(declare-fun array_inv!38071 (array!101636) Bool)

(assert (=> start!130286 (array_inv!38071 a!2804)))

(declare-fun b!1529715 () Bool)

(declare-fun res!1047419 () Bool)

(declare-fun e!852448 () Bool)

(assert (=> b!1529715 (=> (not res!1047419) (not e!852448))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13208 0))(
  ( (MissingZero!13208 (index!55227 (_ BitVec 32))) (Found!13208 (index!55228 (_ BitVec 32))) (Intermediate!13208 (undefined!14020 Bool) (index!55229 (_ BitVec 32)) (x!136911 (_ BitVec 32))) (Undefined!13208) (MissingVacant!13208 (index!55230 (_ BitVec 32))) )
))
(declare-fun lt!662524 () SeekEntryResult!13208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101636 (_ BitVec 32)) SeekEntryResult!13208)

(assert (=> b!1529715 (= res!1047419 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49043 a!2804) j!70) a!2804 mask!2512) lt!662524))))

(declare-fun e!852446 () Bool)

(declare-fun b!1529716 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101636 (_ BitVec 32)) SeekEntryResult!13208)

(assert (=> b!1529716 (= e!852446 (= (seekEntry!0 (select (arr!49043 a!2804) j!70) a!2804 mask!2512) (Found!13208 j!70)))))

(declare-fun b!1529717 () Bool)

(declare-fun res!1047420 () Bool)

(assert (=> b!1529717 (=> (not res!1047420) (not e!852448))))

(declare-fun lt!662527 () SeekEntryResult!13208)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529717 (= res!1047420 (= lt!662527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49043 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49043 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101637 (store (arr!49043 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49593 a!2804)) mask!2512)))))

(declare-fun b!1529718 () Bool)

(declare-fun res!1047424 () Bool)

(assert (=> b!1529718 (=> (not res!1047424) (not e!852445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101636 (_ BitVec 32)) Bool)

(assert (=> b!1529718 (= res!1047424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529719 () Bool)

(declare-fun res!1047425 () Bool)

(assert (=> b!1529719 (=> (not res!1047425) (not e!852445))))

(declare-datatypes ((List!35526 0))(
  ( (Nil!35523) (Cons!35522 (h!36958 (_ BitVec 64)) (t!50220 List!35526)) )
))
(declare-fun arrayNoDuplicates!0 (array!101636 (_ BitVec 32) List!35526) Bool)

(assert (=> b!1529719 (= res!1047425 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35523))))

(declare-fun b!1529720 () Bool)

(declare-fun res!1047428 () Bool)

(assert (=> b!1529720 (=> (not res!1047428) (not e!852445))))

(assert (=> b!1529720 (= res!1047428 (validKeyInArray!0 (select (arr!49043 a!2804) j!70)))))

(declare-fun b!1529721 () Bool)

(assert (=> b!1529721 (= e!852448 (not e!852444))))

(declare-fun res!1047423 () Bool)

(assert (=> b!1529721 (=> res!1047423 e!852444)))

(assert (=> b!1529721 (= res!1047423 (or (not (= (select (arr!49043 a!2804) j!70) (select (store (arr!49043 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529721 e!852446))

(declare-fun res!1047430 () Bool)

(assert (=> b!1529721 (=> (not res!1047430) (not e!852446))))

(assert (=> b!1529721 (= res!1047430 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51200 0))(
  ( (Unit!51201) )
))
(declare-fun lt!662526 () Unit!51200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101636 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51200)

(assert (=> b!1529721 (= lt!662526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529722 () Bool)

(assert (=> b!1529722 (= e!852445 e!852448)))

(declare-fun res!1047426 () Bool)

(assert (=> b!1529722 (=> (not res!1047426) (not e!852448))))

(assert (=> b!1529722 (= res!1047426 (= lt!662527 lt!662524))))

(assert (=> b!1529722 (= lt!662524 (Intermediate!13208 false resIndex!21 resX!21))))

(assert (=> b!1529722 (= lt!662527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49043 a!2804) j!70) mask!2512) (select (arr!49043 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529723 () Bool)

(declare-fun res!1047421 () Bool)

(assert (=> b!1529723 (=> (not res!1047421) (not e!852445))))

(assert (=> b!1529723 (= res!1047421 (and (= (size!49593 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49593 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49593 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130286 res!1047427) b!1529723))

(assert (= (and b!1529723 res!1047421) b!1529713))

(assert (= (and b!1529713 res!1047429) b!1529720))

(assert (= (and b!1529720 res!1047428) b!1529718))

(assert (= (and b!1529718 res!1047424) b!1529719))

(assert (= (and b!1529719 res!1047425) b!1529714))

(assert (= (and b!1529714 res!1047422) b!1529722))

(assert (= (and b!1529722 res!1047426) b!1529715))

(assert (= (and b!1529715 res!1047419) b!1529717))

(assert (= (and b!1529717 res!1047420) b!1529721))

(assert (= (and b!1529721 res!1047430) b!1529716))

(assert (= (and b!1529721 (not res!1047423)) b!1529712))

(declare-fun m!1412673 () Bool)

(assert (=> b!1529712 m!1412673))

(declare-fun m!1412675 () Bool)

(assert (=> b!1529713 m!1412675))

(assert (=> b!1529713 m!1412675))

(declare-fun m!1412677 () Bool)

(assert (=> b!1529713 m!1412677))

(declare-fun m!1412679 () Bool)

(assert (=> b!1529719 m!1412679))

(declare-fun m!1412681 () Bool)

(assert (=> b!1529722 m!1412681))

(assert (=> b!1529722 m!1412681))

(declare-fun m!1412683 () Bool)

(assert (=> b!1529722 m!1412683))

(assert (=> b!1529722 m!1412683))

(assert (=> b!1529722 m!1412681))

(declare-fun m!1412685 () Bool)

(assert (=> b!1529722 m!1412685))

(declare-fun m!1412687 () Bool)

(assert (=> b!1529717 m!1412687))

(declare-fun m!1412689 () Bool)

(assert (=> b!1529717 m!1412689))

(assert (=> b!1529717 m!1412689))

(declare-fun m!1412691 () Bool)

(assert (=> b!1529717 m!1412691))

(assert (=> b!1529717 m!1412691))

(assert (=> b!1529717 m!1412689))

(declare-fun m!1412693 () Bool)

(assert (=> b!1529717 m!1412693))

(assert (=> b!1529720 m!1412681))

(assert (=> b!1529720 m!1412681))

(declare-fun m!1412695 () Bool)

(assert (=> b!1529720 m!1412695))

(assert (=> b!1529716 m!1412681))

(assert (=> b!1529716 m!1412681))

(declare-fun m!1412697 () Bool)

(assert (=> b!1529716 m!1412697))

(declare-fun m!1412699 () Bool)

(assert (=> b!1529718 m!1412699))

(assert (=> b!1529721 m!1412681))

(declare-fun m!1412701 () Bool)

(assert (=> b!1529721 m!1412701))

(assert (=> b!1529721 m!1412687))

(assert (=> b!1529721 m!1412689))

(declare-fun m!1412703 () Bool)

(assert (=> b!1529721 m!1412703))

(declare-fun m!1412705 () Bool)

(assert (=> start!130286 m!1412705))

(declare-fun m!1412707 () Bool)

(assert (=> start!130286 m!1412707))

(assert (=> b!1529715 m!1412681))

(assert (=> b!1529715 m!1412681))

(declare-fun m!1412709 () Bool)

(assert (=> b!1529715 m!1412709))

(push 1)

