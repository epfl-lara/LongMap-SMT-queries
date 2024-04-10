; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120318 () Bool)

(assert start!120318)

(declare-fun b!1400255 () Bool)

(declare-fun e!792781 () Bool)

(declare-fun e!792782 () Bool)

(assert (=> b!1400255 (= e!792781 e!792782)))

(declare-fun res!938774 () Bool)

(assert (=> b!1400255 (=> res!938774 e!792782)))

(declare-datatypes ((SeekEntryResult!10531 0))(
  ( (MissingZero!10531 (index!44501 (_ BitVec 32))) (Found!10531 (index!44502 (_ BitVec 32))) (Intermediate!10531 (undefined!11343 Bool) (index!44503 (_ BitVec 32)) (x!126150 (_ BitVec 32))) (Undefined!10531) (MissingVacant!10531 (index!44504 (_ BitVec 32))) )
))
(declare-fun lt!616075 () SeekEntryResult!10531)

(declare-fun lt!616072 () SeekEntryResult!10531)

(assert (=> b!1400255 (= res!938774 (or (= lt!616075 lt!616072) (not (is-Intermediate!10531 lt!616072))))))

(declare-datatypes ((array!95727 0))(
  ( (array!95728 (arr!46214 (Array (_ BitVec 32) (_ BitVec 64))) (size!46764 (_ BitVec 32))) )
))
(declare-fun lt!616077 () array!95727)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616070 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95727 (_ BitVec 32)) SeekEntryResult!10531)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400255 (= lt!616072 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616070 mask!2840) lt!616070 lt!616077 mask!2840))))

(declare-fun a!2901 () array!95727)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400255 (= lt!616070 (select (store (arr!46214 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400255 (= lt!616077 (array!95728 (store (arr!46214 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46764 a!2901)))))

(declare-fun b!1400256 () Bool)

(declare-fun res!938767 () Bool)

(declare-fun e!792784 () Bool)

(assert (=> b!1400256 (=> (not res!938767) (not e!792784))))

(assert (=> b!1400256 (= res!938767 (and (= (size!46764 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46764 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46764 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400257 () Bool)

(declare-fun e!792785 () Bool)

(assert (=> b!1400257 (= e!792785 true)))

(declare-fun lt!616074 () (_ BitVec 32))

(declare-fun lt!616073 () SeekEntryResult!10531)

(assert (=> b!1400257 (= lt!616073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616074 lt!616070 lt!616077 mask!2840))))

(declare-fun b!1400258 () Bool)

(declare-fun res!938769 () Bool)

(assert (=> b!1400258 (=> (not res!938769) (not e!792784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95727 (_ BitVec 32)) Bool)

(assert (=> b!1400258 (= res!938769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400259 () Bool)

(declare-fun res!938766 () Bool)

(assert (=> b!1400259 (=> (not res!938766) (not e!792784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400259 (= res!938766 (validKeyInArray!0 (select (arr!46214 a!2901) i!1037)))))

(declare-fun res!938773 () Bool)

(assert (=> start!120318 (=> (not res!938773) (not e!792784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120318 (= res!938773 (validMask!0 mask!2840))))

(assert (=> start!120318 e!792784))

(assert (=> start!120318 true))

(declare-fun array_inv!35242 (array!95727) Bool)

(assert (=> start!120318 (array_inv!35242 a!2901)))

(declare-fun b!1400260 () Bool)

(assert (=> b!1400260 (= e!792782 e!792785)))

(declare-fun res!938776 () Bool)

(assert (=> b!1400260 (=> res!938776 e!792785)))

(assert (=> b!1400260 (= res!938776 (or (bvslt (x!126150 lt!616075) #b00000000000000000000000000000000) (bvsgt (x!126150 lt!616075) #b01111111111111111111111111111110) (bvslt (x!126150 lt!616072) #b00000000000000000000000000000000) (bvsgt (x!126150 lt!616072) #b01111111111111111111111111111110) (bvslt lt!616074 #b00000000000000000000000000000000) (bvsge lt!616074 (size!46764 a!2901)) (bvslt (index!44503 lt!616075) #b00000000000000000000000000000000) (bvsge (index!44503 lt!616075) (size!46764 a!2901)) (bvslt (index!44503 lt!616072) #b00000000000000000000000000000000) (bvsge (index!44503 lt!616072) (size!46764 a!2901)) (not (= lt!616075 (Intermediate!10531 false (index!44503 lt!616075) (x!126150 lt!616075)))) (not (= lt!616072 (Intermediate!10531 false (index!44503 lt!616072) (x!126150 lt!616072))))))))

(declare-fun e!792779 () Bool)

(assert (=> b!1400260 e!792779))

(declare-fun res!938768 () Bool)

(assert (=> b!1400260 (=> (not res!938768) (not e!792779))))

(assert (=> b!1400260 (= res!938768 (and (not (undefined!11343 lt!616072)) (= (index!44503 lt!616072) i!1037) (bvslt (x!126150 lt!616072) (x!126150 lt!616075)) (= (select (store (arr!46214 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44503 lt!616072)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47066 0))(
  ( (Unit!47067) )
))
(declare-fun lt!616071 () Unit!47066)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47066)

(assert (=> b!1400260 (= lt!616071 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616074 (x!126150 lt!616075) (index!44503 lt!616075) (x!126150 lt!616072) (index!44503 lt!616072) (undefined!11343 lt!616072) mask!2840))))

(declare-fun b!1400261 () Bool)

(declare-fun e!792780 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95727 (_ BitVec 32)) SeekEntryResult!10531)

(assert (=> b!1400261 (= e!792780 (= (seekEntryOrOpen!0 (select (arr!46214 a!2901) j!112) a!2901 mask!2840) (Found!10531 j!112)))))

(declare-fun b!1400262 () Bool)

(declare-fun res!938772 () Bool)

(assert (=> b!1400262 (=> (not res!938772) (not e!792784))))

(assert (=> b!1400262 (= res!938772 (validKeyInArray!0 (select (arr!46214 a!2901) j!112)))))

(declare-fun b!1400263 () Bool)

(declare-fun res!938771 () Bool)

(assert (=> b!1400263 (=> (not res!938771) (not e!792784))))

(declare-datatypes ((List!32733 0))(
  ( (Nil!32730) (Cons!32729 (h!33977 (_ BitVec 64)) (t!47427 List!32733)) )
))
(declare-fun arrayNoDuplicates!0 (array!95727 (_ BitVec 32) List!32733) Bool)

(assert (=> b!1400263 (= res!938771 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32730))))

(declare-fun b!1400264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95727 (_ BitVec 32)) SeekEntryResult!10531)

(assert (=> b!1400264 (= e!792779 (= (seekEntryOrOpen!0 lt!616070 lt!616077 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126150 lt!616072) (index!44503 lt!616072) (index!44503 lt!616072) (select (arr!46214 a!2901) j!112) lt!616077 mask!2840)))))

(declare-fun b!1400265 () Bool)

(assert (=> b!1400265 (= e!792784 (not e!792781))))

(declare-fun res!938775 () Bool)

(assert (=> b!1400265 (=> res!938775 e!792781)))

(assert (=> b!1400265 (= res!938775 (or (not (is-Intermediate!10531 lt!616075)) (undefined!11343 lt!616075)))))

(assert (=> b!1400265 e!792780))

(declare-fun res!938770 () Bool)

(assert (=> b!1400265 (=> (not res!938770) (not e!792780))))

(assert (=> b!1400265 (= res!938770 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616076 () Unit!47066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47066)

(assert (=> b!1400265 (= lt!616076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400265 (= lt!616075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616074 (select (arr!46214 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400265 (= lt!616074 (toIndex!0 (select (arr!46214 a!2901) j!112) mask!2840))))

(assert (= (and start!120318 res!938773) b!1400256))

(assert (= (and b!1400256 res!938767) b!1400259))

(assert (= (and b!1400259 res!938766) b!1400262))

(assert (= (and b!1400262 res!938772) b!1400258))

(assert (= (and b!1400258 res!938769) b!1400263))

(assert (= (and b!1400263 res!938771) b!1400265))

(assert (= (and b!1400265 res!938770) b!1400261))

(assert (= (and b!1400265 (not res!938775)) b!1400255))

(assert (= (and b!1400255 (not res!938774)) b!1400260))

(assert (= (and b!1400260 res!938768) b!1400264))

(assert (= (and b!1400260 (not res!938776)) b!1400257))

(declare-fun m!1287645 () Bool)

(assert (=> b!1400265 m!1287645))

(declare-fun m!1287647 () Bool)

(assert (=> b!1400265 m!1287647))

(declare-fun m!1287649 () Bool)

(assert (=> b!1400265 m!1287649))

(declare-fun m!1287651 () Bool)

(assert (=> b!1400265 m!1287651))

(assert (=> b!1400265 m!1287645))

(declare-fun m!1287653 () Bool)

(assert (=> b!1400265 m!1287653))

(assert (=> b!1400265 m!1287645))

(declare-fun m!1287655 () Bool)

(assert (=> b!1400263 m!1287655))

(assert (=> b!1400261 m!1287645))

(assert (=> b!1400261 m!1287645))

(declare-fun m!1287657 () Bool)

(assert (=> b!1400261 m!1287657))

(declare-fun m!1287659 () Bool)

(assert (=> start!120318 m!1287659))

(declare-fun m!1287661 () Bool)

(assert (=> start!120318 m!1287661))

(declare-fun m!1287663 () Bool)

(assert (=> b!1400259 m!1287663))

(assert (=> b!1400259 m!1287663))

(declare-fun m!1287665 () Bool)

(assert (=> b!1400259 m!1287665))

(declare-fun m!1287667 () Bool)

(assert (=> b!1400260 m!1287667))

(declare-fun m!1287669 () Bool)

(assert (=> b!1400260 m!1287669))

(declare-fun m!1287671 () Bool)

(assert (=> b!1400260 m!1287671))

(assert (=> b!1400262 m!1287645))

(assert (=> b!1400262 m!1287645))

(declare-fun m!1287673 () Bool)

(assert (=> b!1400262 m!1287673))

(declare-fun m!1287675 () Bool)

(assert (=> b!1400257 m!1287675))

(declare-fun m!1287677 () Bool)

(assert (=> b!1400264 m!1287677))

(assert (=> b!1400264 m!1287645))

(assert (=> b!1400264 m!1287645))

(declare-fun m!1287679 () Bool)

(assert (=> b!1400264 m!1287679))

(declare-fun m!1287681 () Bool)

(assert (=> b!1400255 m!1287681))

(assert (=> b!1400255 m!1287681))

(declare-fun m!1287683 () Bool)

(assert (=> b!1400255 m!1287683))

(assert (=> b!1400255 m!1287667))

(declare-fun m!1287685 () Bool)

(assert (=> b!1400255 m!1287685))

(declare-fun m!1287687 () Bool)

(assert (=> b!1400258 m!1287687))

(push 1)

