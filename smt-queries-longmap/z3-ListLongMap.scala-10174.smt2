; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120158 () Bool)

(assert start!120158)

(declare-fun b!1397695 () Bool)

(declare-fun e!791377 () Bool)

(assert (=> b!1397695 (= e!791377 true)))

(declare-datatypes ((SeekEntryResult!10376 0))(
  ( (MissingZero!10376 (index!43875 (_ BitVec 32))) (Found!10376 (index!43876 (_ BitVec 32))) (Intermediate!10376 (undefined!11188 Bool) (index!43877 (_ BitVec 32)) (x!125697 (_ BitVec 32))) (Undefined!10376) (MissingVacant!10376 (index!43878 (_ BitVec 32))) )
))
(declare-fun lt!613915 () SeekEntryResult!10376)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95609 0))(
  ( (array!95610 (arr!46156 (Array (_ BitVec 32) (_ BitVec 64))) (size!46707 (_ BitVec 32))) )
))
(declare-fun lt!613913 () array!95609)

(declare-fun lt!613919 () (_ BitVec 32))

(declare-fun lt!613916 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95609 (_ BitVec 32)) SeekEntryResult!10376)

(assert (=> b!1397695 (= lt!613915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613919 lt!613916 lt!613913 mask!2840))))

(declare-fun b!1397696 () Bool)

(declare-fun res!935924 () Bool)

(declare-fun e!791380 () Bool)

(assert (=> b!1397696 (=> (not res!935924) (not e!791380))))

(declare-fun a!2901 () array!95609)

(declare-datatypes ((List!32662 0))(
  ( (Nil!32659) (Cons!32658 (h!33908 (_ BitVec 64)) (t!47348 List!32662)) )
))
(declare-fun arrayNoDuplicates!0 (array!95609 (_ BitVec 32) List!32662) Bool)

(assert (=> b!1397696 (= res!935924 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32659))))

(declare-fun res!935932 () Bool)

(assert (=> start!120158 (=> (not res!935932) (not e!791380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120158 (= res!935932 (validMask!0 mask!2840))))

(assert (=> start!120158 e!791380))

(assert (=> start!120158 true))

(declare-fun array_inv!35437 (array!95609) Bool)

(assert (=> start!120158 (array_inv!35437 a!2901)))

(declare-fun b!1397697 () Bool)

(declare-fun res!935926 () Bool)

(assert (=> b!1397697 (=> (not res!935926) (not e!791380))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397697 (= res!935926 (validKeyInArray!0 (select (arr!46156 a!2901) i!1037)))))

(declare-fun b!1397698 () Bool)

(declare-fun res!935930 () Bool)

(assert (=> b!1397698 (=> (not res!935930) (not e!791380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95609 (_ BitVec 32)) Bool)

(assert (=> b!1397698 (= res!935930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397699 () Bool)

(declare-fun res!935925 () Bool)

(assert (=> b!1397699 (=> (not res!935925) (not e!791380))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397699 (= res!935925 (and (= (size!46707 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46707 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46707 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397700 () Bool)

(declare-fun res!935927 () Bool)

(assert (=> b!1397700 (=> (not res!935927) (not e!791380))))

(assert (=> b!1397700 (= res!935927 (validKeyInArray!0 (select (arr!46156 a!2901) j!112)))))

(declare-fun b!1397701 () Bool)

(declare-fun e!791381 () Bool)

(assert (=> b!1397701 (= e!791380 (not e!791381))))

(declare-fun res!935931 () Bool)

(assert (=> b!1397701 (=> res!935931 e!791381)))

(declare-fun lt!613918 () SeekEntryResult!10376)

(get-info :version)

(assert (=> b!1397701 (= res!935931 (or (not ((_ is Intermediate!10376) lt!613918)) (undefined!11188 lt!613918)))))

(declare-fun e!791378 () Bool)

(assert (=> b!1397701 e!791378))

(declare-fun res!935929 () Bool)

(assert (=> b!1397701 (=> (not res!935929) (not e!791378))))

(assert (=> b!1397701 (= res!935929 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46783 0))(
  ( (Unit!46784) )
))
(declare-fun lt!613914 () Unit!46783)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46783)

(assert (=> b!1397701 (= lt!613914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397701 (= lt!613918 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613919 (select (arr!46156 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397701 (= lt!613919 (toIndex!0 (select (arr!46156 a!2901) j!112) mask!2840))))

(declare-fun b!1397702 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95609 (_ BitVec 32)) SeekEntryResult!10376)

(assert (=> b!1397702 (= e!791378 (= (seekEntryOrOpen!0 (select (arr!46156 a!2901) j!112) a!2901 mask!2840) (Found!10376 j!112)))))

(declare-fun b!1397703 () Bool)

(assert (=> b!1397703 (= e!791381 e!791377)))

(declare-fun res!935928 () Bool)

(assert (=> b!1397703 (=> res!935928 e!791377)))

(declare-fun lt!613917 () SeekEntryResult!10376)

(assert (=> b!1397703 (= res!935928 (or (= lt!613918 lt!613917) (not ((_ is Intermediate!10376) lt!613917)) (bvslt (x!125697 lt!613918) #b00000000000000000000000000000000) (bvsgt (x!125697 lt!613918) #b01111111111111111111111111111110) (bvslt lt!613919 #b00000000000000000000000000000000) (bvsge lt!613919 (size!46707 a!2901)) (bvslt (index!43877 lt!613918) #b00000000000000000000000000000000) (bvsge (index!43877 lt!613918) (size!46707 a!2901)) (not (= lt!613918 (Intermediate!10376 false (index!43877 lt!613918) (x!125697 lt!613918)))) (not (= lt!613917 (Intermediate!10376 (undefined!11188 lt!613917) (index!43877 lt!613917) (x!125697 lt!613917))))))))

(assert (=> b!1397703 (= lt!613917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613916 mask!2840) lt!613916 lt!613913 mask!2840))))

(assert (=> b!1397703 (= lt!613916 (select (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397703 (= lt!613913 (array!95610 (store (arr!46156 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46707 a!2901)))))

(assert (= (and start!120158 res!935932) b!1397699))

(assert (= (and b!1397699 res!935925) b!1397697))

(assert (= (and b!1397697 res!935926) b!1397700))

(assert (= (and b!1397700 res!935927) b!1397698))

(assert (= (and b!1397698 res!935930) b!1397696))

(assert (= (and b!1397696 res!935924) b!1397701))

(assert (= (and b!1397701 res!935929) b!1397702))

(assert (= (and b!1397701 (not res!935931)) b!1397703))

(assert (= (and b!1397703 (not res!935928)) b!1397695))

(declare-fun m!1284403 () Bool)

(assert (=> b!1397697 m!1284403))

(assert (=> b!1397697 m!1284403))

(declare-fun m!1284405 () Bool)

(assert (=> b!1397697 m!1284405))

(declare-fun m!1284407 () Bool)

(assert (=> b!1397701 m!1284407))

(declare-fun m!1284409 () Bool)

(assert (=> b!1397701 m!1284409))

(assert (=> b!1397701 m!1284407))

(declare-fun m!1284411 () Bool)

(assert (=> b!1397701 m!1284411))

(assert (=> b!1397701 m!1284407))

(declare-fun m!1284413 () Bool)

(assert (=> b!1397701 m!1284413))

(declare-fun m!1284415 () Bool)

(assert (=> b!1397701 m!1284415))

(assert (=> b!1397700 m!1284407))

(assert (=> b!1397700 m!1284407))

(declare-fun m!1284417 () Bool)

(assert (=> b!1397700 m!1284417))

(declare-fun m!1284419 () Bool)

(assert (=> b!1397698 m!1284419))

(declare-fun m!1284421 () Bool)

(assert (=> b!1397695 m!1284421))

(declare-fun m!1284423 () Bool)

(assert (=> start!120158 m!1284423))

(declare-fun m!1284425 () Bool)

(assert (=> start!120158 m!1284425))

(assert (=> b!1397702 m!1284407))

(assert (=> b!1397702 m!1284407))

(declare-fun m!1284427 () Bool)

(assert (=> b!1397702 m!1284427))

(declare-fun m!1284429 () Bool)

(assert (=> b!1397703 m!1284429))

(assert (=> b!1397703 m!1284429))

(declare-fun m!1284431 () Bool)

(assert (=> b!1397703 m!1284431))

(declare-fun m!1284433 () Bool)

(assert (=> b!1397703 m!1284433))

(declare-fun m!1284435 () Bool)

(assert (=> b!1397703 m!1284435))

(declare-fun m!1284437 () Bool)

(assert (=> b!1397696 m!1284437))

(check-sat (not b!1397702) (not b!1397701) (not b!1397697) (not b!1397695) (not start!120158) (not b!1397698) (not b!1397703) (not b!1397700) (not b!1397696))
(check-sat)
