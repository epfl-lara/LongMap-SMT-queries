; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121988 () Bool)

(assert start!121988)

(declare-fun b!1415783 () Bool)

(declare-fun e!801321 () Bool)

(declare-fun e!801320 () Bool)

(assert (=> b!1415783 (= e!801321 (not e!801320))))

(declare-fun res!951881 () Bool)

(assert (=> b!1415783 (=> res!951881 e!801320)))

(declare-datatypes ((SeekEntryResult!10982 0))(
  ( (MissingZero!10982 (index!46320 (_ BitVec 32))) (Found!10982 (index!46321 (_ BitVec 32))) (Intermediate!10982 (undefined!11794 Bool) (index!46322 (_ BitVec 32)) (x!127922 (_ BitVec 32))) (Undefined!10982) (MissingVacant!10982 (index!46323 (_ BitVec 32))) )
))
(declare-fun lt!624250 () SeekEntryResult!10982)

(get-info :version)

(assert (=> b!1415783 (= res!951881 (or (not ((_ is Intermediate!10982) lt!624250)) (undefined!11794 lt!624250)))))

(declare-fun e!801326 () Bool)

(assert (=> b!1415783 e!801326))

(declare-fun res!951885 () Bool)

(assert (=> b!1415783 (=> (not res!951885) (not e!801326))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96627 0))(
  ( (array!96628 (arr!46645 (Array (_ BitVec 32) (_ BitVec 64))) (size!47197 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96627)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96627 (_ BitVec 32)) Bool)

(assert (=> b!1415783 (= res!951885 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47781 0))(
  ( (Unit!47782) )
))
(declare-fun lt!624249 () Unit!47781)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47781)

(assert (=> b!1415783 (= lt!624249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624252 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96627 (_ BitVec 32)) SeekEntryResult!10982)

(assert (=> b!1415783 (= lt!624250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624252 (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415783 (= lt!624252 (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840))))

(declare-fun b!1415784 () Bool)

(declare-fun e!801323 () Bool)

(assert (=> b!1415784 (= e!801320 e!801323)))

(declare-fun res!951876 () Bool)

(assert (=> b!1415784 (=> res!951876 e!801323)))

(declare-fun lt!624251 () SeekEntryResult!10982)

(assert (=> b!1415784 (= res!951876 (or (= lt!624250 lt!624251) (not ((_ is Intermediate!10982) lt!624251))))))

(declare-fun lt!624253 () array!96627)

(declare-fun lt!624247 () (_ BitVec 64))

(assert (=> b!1415784 (= lt!624251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624247 mask!2840) lt!624247 lt!624253 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1415784 (= lt!624247 (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415784 (= lt!624253 (array!96628 (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47197 a!2901)))))

(declare-fun b!1415785 () Bool)

(declare-fun e!801325 () Bool)

(assert (=> b!1415785 (= e!801323 e!801325)))

(declare-fun res!951879 () Bool)

(assert (=> b!1415785 (=> res!951879 e!801325)))

(assert (=> b!1415785 (= res!951879 (or (bvslt (x!127922 lt!624250) #b00000000000000000000000000000000) (bvsgt (x!127922 lt!624250) #b01111111111111111111111111111110) (bvslt (x!127922 lt!624251) #b00000000000000000000000000000000) (bvsgt (x!127922 lt!624251) #b01111111111111111111111111111110) (bvslt lt!624252 #b00000000000000000000000000000000) (bvsge lt!624252 (size!47197 a!2901)) (bvslt (index!46322 lt!624250) #b00000000000000000000000000000000) (bvsge (index!46322 lt!624250) (size!47197 a!2901)) (bvslt (index!46322 lt!624251) #b00000000000000000000000000000000) (bvsge (index!46322 lt!624251) (size!47197 a!2901)) (not (= lt!624250 (Intermediate!10982 false (index!46322 lt!624250) (x!127922 lt!624250)))) (not (= lt!624251 (Intermediate!10982 false (index!46322 lt!624251) (x!127922 lt!624251))))))))

(declare-fun e!801322 () Bool)

(assert (=> b!1415785 e!801322))

(declare-fun res!951882 () Bool)

(assert (=> b!1415785 (=> (not res!951882) (not e!801322))))

(assert (=> b!1415785 (= res!951882 (and (not (undefined!11794 lt!624251)) (= (index!46322 lt!624251) i!1037) (bvslt (x!127922 lt!624251) (x!127922 lt!624250)) (= (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46322 lt!624251)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624248 () Unit!47781)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47781)

(assert (=> b!1415785 (= lt!624248 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624252 (x!127922 lt!624250) (index!46322 lt!624250) (x!127922 lt!624251) (index!46322 lt!624251) (undefined!11794 lt!624251) mask!2840))))

(declare-fun b!1415786 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96627 (_ BitVec 32)) SeekEntryResult!10982)

(assert (=> b!1415786 (= e!801326 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) (Found!10982 j!112)))))

(declare-fun b!1415787 () Bool)

(declare-fun res!951886 () Bool)

(assert (=> b!1415787 (=> (not res!951886) (not e!801321))))

(assert (=> b!1415787 (= res!951886 (and (= (size!47197 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47197 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47197 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415788 () Bool)

(assert (=> b!1415788 (= e!801325 true)))

(declare-fun lt!624254 () SeekEntryResult!10982)

(assert (=> b!1415788 (= lt!624254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624252 lt!624247 lt!624253 mask!2840))))

(declare-fun b!1415789 () Bool)

(declare-fun res!951883 () Bool)

(assert (=> b!1415789 (=> (not res!951883) (not e!801321))))

(declare-datatypes ((List!33242 0))(
  ( (Nil!33239) (Cons!33238 (h!34525 (_ BitVec 64)) (t!47928 List!33242)) )
))
(declare-fun arrayNoDuplicates!0 (array!96627 (_ BitVec 32) List!33242) Bool)

(assert (=> b!1415789 (= res!951883 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33239))))

(declare-fun b!1415790 () Bool)

(declare-fun res!951877 () Bool)

(assert (=> b!1415790 (=> (not res!951877) (not e!801321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415790 (= res!951877 (validKeyInArray!0 (select (arr!46645 a!2901) i!1037)))))

(declare-fun b!1415791 () Bool)

(declare-fun res!951880 () Bool)

(assert (=> b!1415791 (=> (not res!951880) (not e!801321))))

(assert (=> b!1415791 (= res!951880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415792 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96627 (_ BitVec 32)) SeekEntryResult!10982)

(assert (=> b!1415792 (= e!801322 (= (seekEntryOrOpen!0 lt!624247 lt!624253 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127922 lt!624251) (index!46322 lt!624251) (index!46322 lt!624251) (select (arr!46645 a!2901) j!112) lt!624253 mask!2840)))))

(declare-fun b!1415793 () Bool)

(declare-fun res!951878 () Bool)

(assert (=> b!1415793 (=> (not res!951878) (not e!801321))))

(assert (=> b!1415793 (= res!951878 (validKeyInArray!0 (select (arr!46645 a!2901) j!112)))))

(declare-fun res!951884 () Bool)

(assert (=> start!121988 (=> (not res!951884) (not e!801321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121988 (= res!951884 (validMask!0 mask!2840))))

(assert (=> start!121988 e!801321))

(assert (=> start!121988 true))

(declare-fun array_inv!35878 (array!96627) Bool)

(assert (=> start!121988 (array_inv!35878 a!2901)))

(assert (= (and start!121988 res!951884) b!1415787))

(assert (= (and b!1415787 res!951886) b!1415790))

(assert (= (and b!1415790 res!951877) b!1415793))

(assert (= (and b!1415793 res!951878) b!1415791))

(assert (= (and b!1415791 res!951880) b!1415789))

(assert (= (and b!1415789 res!951883) b!1415783))

(assert (= (and b!1415783 res!951885) b!1415786))

(assert (= (and b!1415783 (not res!951881)) b!1415784))

(assert (= (and b!1415784 (not res!951876)) b!1415785))

(assert (= (and b!1415785 res!951882) b!1415792))

(assert (= (and b!1415785 (not res!951879)) b!1415788))

(declare-fun m!1305763 () Bool)

(assert (=> start!121988 m!1305763))

(declare-fun m!1305765 () Bool)

(assert (=> start!121988 m!1305765))

(declare-fun m!1305767 () Bool)

(assert (=> b!1415784 m!1305767))

(assert (=> b!1415784 m!1305767))

(declare-fun m!1305769 () Bool)

(assert (=> b!1415784 m!1305769))

(declare-fun m!1305771 () Bool)

(assert (=> b!1415784 m!1305771))

(declare-fun m!1305773 () Bool)

(assert (=> b!1415784 m!1305773))

(declare-fun m!1305775 () Bool)

(assert (=> b!1415786 m!1305775))

(assert (=> b!1415786 m!1305775))

(declare-fun m!1305777 () Bool)

(assert (=> b!1415786 m!1305777))

(declare-fun m!1305779 () Bool)

(assert (=> b!1415790 m!1305779))

(assert (=> b!1415790 m!1305779))

(declare-fun m!1305781 () Bool)

(assert (=> b!1415790 m!1305781))

(declare-fun m!1305783 () Bool)

(assert (=> b!1415789 m!1305783))

(assert (=> b!1415783 m!1305775))

(declare-fun m!1305785 () Bool)

(assert (=> b!1415783 m!1305785))

(assert (=> b!1415783 m!1305775))

(declare-fun m!1305787 () Bool)

(assert (=> b!1415783 m!1305787))

(declare-fun m!1305789 () Bool)

(assert (=> b!1415783 m!1305789))

(assert (=> b!1415783 m!1305775))

(declare-fun m!1305791 () Bool)

(assert (=> b!1415783 m!1305791))

(declare-fun m!1305793 () Bool)

(assert (=> b!1415788 m!1305793))

(assert (=> b!1415793 m!1305775))

(assert (=> b!1415793 m!1305775))

(declare-fun m!1305795 () Bool)

(assert (=> b!1415793 m!1305795))

(declare-fun m!1305797 () Bool)

(assert (=> b!1415792 m!1305797))

(assert (=> b!1415792 m!1305775))

(assert (=> b!1415792 m!1305775))

(declare-fun m!1305799 () Bool)

(assert (=> b!1415792 m!1305799))

(declare-fun m!1305801 () Bool)

(assert (=> b!1415791 m!1305801))

(assert (=> b!1415785 m!1305771))

(declare-fun m!1305803 () Bool)

(assert (=> b!1415785 m!1305803))

(declare-fun m!1305805 () Bool)

(assert (=> b!1415785 m!1305805))

(check-sat (not b!1415783) (not start!121988) (not b!1415785) (not b!1415784) (not b!1415791) (not b!1415788) (not b!1415790) (not b!1415792) (not b!1415793) (not b!1415786) (not b!1415789))
(check-sat)
