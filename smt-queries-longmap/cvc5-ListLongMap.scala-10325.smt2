; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121434 () Bool)

(assert start!121434)

(declare-fun b!1410879 () Bool)

(declare-fun res!948108 () Bool)

(declare-fun e!798412 () Bool)

(assert (=> b!1410879 (=> (not res!948108) (not e!798412))))

(declare-datatypes ((array!96435 0))(
  ( (array!96436 (arr!46556 (Array (_ BitVec 32) (_ BitVec 64))) (size!47106 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96435)

(declare-datatypes ((List!33075 0))(
  ( (Nil!33072) (Cons!33071 (h!34343 (_ BitVec 64)) (t!47769 List!33075)) )
))
(declare-fun arrayNoDuplicates!0 (array!96435 (_ BitVec 32) List!33075) Bool)

(assert (=> b!1410879 (= res!948108 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33072))))

(declare-fun b!1410880 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!798413 () Bool)

(declare-datatypes ((SeekEntryResult!10867 0))(
  ( (MissingZero!10867 (index!45845 (_ BitVec 32))) (Found!10867 (index!45846 (_ BitVec 32))) (Intermediate!10867 (undefined!11679 Bool) (index!45847 (_ BitVec 32)) (x!127446 (_ BitVec 32))) (Undefined!10867) (MissingVacant!10867 (index!45848 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96435 (_ BitVec 32)) SeekEntryResult!10867)

(assert (=> b!1410880 (= e!798413 (= (seekEntryOrOpen!0 (select (arr!46556 a!2901) j!112) a!2901 mask!2840) (Found!10867 j!112)))))

(declare-fun b!1410881 () Bool)

(declare-fun e!798411 () Bool)

(declare-fun e!798415 () Bool)

(assert (=> b!1410881 (= e!798411 e!798415)))

(declare-fun res!948107 () Bool)

(assert (=> b!1410881 (=> res!948107 e!798415)))

(declare-fun lt!621382 () SeekEntryResult!10867)

(declare-fun lt!621384 () SeekEntryResult!10867)

(declare-fun lt!621381 () (_ BitVec 32))

(assert (=> b!1410881 (= res!948107 (or (= lt!621384 lt!621382) (not (is-Intermediate!10867 lt!621382)) (bvslt (x!127446 lt!621384) #b00000000000000000000000000000000) (bvsgt (x!127446 lt!621384) #b01111111111111111111111111111110) (bvslt lt!621381 #b00000000000000000000000000000000) (bvsge lt!621381 (size!47106 a!2901)) (bvslt (index!45847 lt!621384) #b00000000000000000000000000000000) (bvsge (index!45847 lt!621384) (size!47106 a!2901)) (not (= lt!621384 (Intermediate!10867 false (index!45847 lt!621384) (x!127446 lt!621384))))))))

(declare-fun lt!621380 () (_ BitVec 64))

(declare-fun lt!621379 () array!96435)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96435 (_ BitVec 32)) SeekEntryResult!10867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410881 (= lt!621382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!621380 mask!2840) lt!621380 lt!621379 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410881 (= lt!621380 (select (store (arr!46556 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1410881 (= lt!621379 (array!96436 (store (arr!46556 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47106 a!2901)))))

(declare-fun b!1410882 () Bool)

(declare-fun res!948112 () Bool)

(assert (=> b!1410882 (=> (not res!948112) (not e!798412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96435 (_ BitVec 32)) Bool)

(assert (=> b!1410882 (= res!948112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410883 () Bool)

(assert (=> b!1410883 (= e!798412 (not e!798411))))

(declare-fun res!948111 () Bool)

(assert (=> b!1410883 (=> res!948111 e!798411)))

(assert (=> b!1410883 (= res!948111 (or (not (is-Intermediate!10867 lt!621384)) (undefined!11679 lt!621384)))))

(assert (=> b!1410883 e!798413))

(declare-fun res!948113 () Bool)

(assert (=> b!1410883 (=> (not res!948113) (not e!798413))))

(assert (=> b!1410883 (= res!948113 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47708 0))(
  ( (Unit!47709) )
))
(declare-fun lt!621378 () Unit!47708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96435 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47708)

(assert (=> b!1410883 (= lt!621378 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410883 (= lt!621384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621381 (select (arr!46556 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410883 (= lt!621381 (toIndex!0 (select (arr!46556 a!2901) j!112) mask!2840))))

(declare-fun res!948114 () Bool)

(assert (=> start!121434 (=> (not res!948114) (not e!798412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121434 (= res!948114 (validMask!0 mask!2840))))

(assert (=> start!121434 e!798412))

(assert (=> start!121434 true))

(declare-fun array_inv!35584 (array!96435) Bool)

(assert (=> start!121434 (array_inv!35584 a!2901)))

(declare-fun b!1410884 () Bool)

(declare-fun e!798416 () Bool)

(assert (=> b!1410884 (= e!798415 e!798416)))

(declare-fun res!948109 () Bool)

(assert (=> b!1410884 (=> res!948109 e!798416)))

(declare-fun lt!621383 () SeekEntryResult!10867)

(assert (=> b!1410884 (= res!948109 (not (= lt!621382 lt!621383)))))

(assert (=> b!1410884 (= lt!621383 (Intermediate!10867 (undefined!11679 lt!621382) (index!45847 lt!621382) (x!127446 lt!621382)))))

(declare-fun b!1410885 () Bool)

(declare-fun res!948110 () Bool)

(assert (=> b!1410885 (=> (not res!948110) (not e!798412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410885 (= res!948110 (validKeyInArray!0 (select (arr!46556 a!2901) i!1037)))))

(declare-fun b!1410886 () Bool)

(declare-fun res!948106 () Bool)

(assert (=> b!1410886 (=> (not res!948106) (not e!798412))))

(assert (=> b!1410886 (= res!948106 (validKeyInArray!0 (select (arr!46556 a!2901) j!112)))))

(declare-fun b!1410887 () Bool)

(assert (=> b!1410887 (= e!798416 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621381 lt!621380 lt!621379 mask!2840) lt!621383))))

(declare-fun b!1410888 () Bool)

(declare-fun res!948115 () Bool)

(assert (=> b!1410888 (=> (not res!948115) (not e!798412))))

(assert (=> b!1410888 (= res!948115 (and (= (size!47106 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47106 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47106 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121434 res!948114) b!1410888))

(assert (= (and b!1410888 res!948115) b!1410885))

(assert (= (and b!1410885 res!948110) b!1410886))

(assert (= (and b!1410886 res!948106) b!1410882))

(assert (= (and b!1410882 res!948112) b!1410879))

(assert (= (and b!1410879 res!948108) b!1410883))

(assert (= (and b!1410883 res!948113) b!1410880))

(assert (= (and b!1410883 (not res!948111)) b!1410881))

(assert (= (and b!1410881 (not res!948107)) b!1410884))

(assert (= (and b!1410884 (not res!948109)) b!1410887))

(declare-fun m!1300569 () Bool)

(assert (=> b!1410879 m!1300569))

(declare-fun m!1300571 () Bool)

(assert (=> b!1410887 m!1300571))

(declare-fun m!1300573 () Bool)

(assert (=> b!1410886 m!1300573))

(assert (=> b!1410886 m!1300573))

(declare-fun m!1300575 () Bool)

(assert (=> b!1410886 m!1300575))

(declare-fun m!1300577 () Bool)

(assert (=> b!1410881 m!1300577))

(assert (=> b!1410881 m!1300577))

(declare-fun m!1300579 () Bool)

(assert (=> b!1410881 m!1300579))

(declare-fun m!1300581 () Bool)

(assert (=> b!1410881 m!1300581))

(declare-fun m!1300583 () Bool)

(assert (=> b!1410881 m!1300583))

(declare-fun m!1300585 () Bool)

(assert (=> b!1410882 m!1300585))

(assert (=> b!1410880 m!1300573))

(assert (=> b!1410880 m!1300573))

(declare-fun m!1300587 () Bool)

(assert (=> b!1410880 m!1300587))

(declare-fun m!1300589 () Bool)

(assert (=> b!1410885 m!1300589))

(assert (=> b!1410885 m!1300589))

(declare-fun m!1300591 () Bool)

(assert (=> b!1410885 m!1300591))

(assert (=> b!1410883 m!1300573))

(declare-fun m!1300593 () Bool)

(assert (=> b!1410883 m!1300593))

(assert (=> b!1410883 m!1300573))

(declare-fun m!1300595 () Bool)

(assert (=> b!1410883 m!1300595))

(declare-fun m!1300597 () Bool)

(assert (=> b!1410883 m!1300597))

(assert (=> b!1410883 m!1300573))

(declare-fun m!1300599 () Bool)

(assert (=> b!1410883 m!1300599))

(declare-fun m!1300601 () Bool)

(assert (=> start!121434 m!1300601))

(declare-fun m!1300603 () Bool)

(assert (=> start!121434 m!1300603))

(push 1)

