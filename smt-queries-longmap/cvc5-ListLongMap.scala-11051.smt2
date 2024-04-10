; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129138 () Bool)

(assert start!129138)

(declare-fun b!1515509 () Bool)

(declare-fun res!1035422 () Bool)

(declare-fun e!845727 () Bool)

(assert (=> b!1515509 (=> (not res!1035422) (not e!845727))))

(declare-datatypes ((array!100994 0))(
  ( (array!100995 (arr!48734 (Array (_ BitVec 32) (_ BitVec 64))) (size!49284 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100994)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515509 (= res!1035422 (validKeyInArray!0 (select (arr!48734 a!2804) j!70)))))

(declare-fun b!1515510 () Bool)

(declare-fun e!845723 () Bool)

(declare-fun e!845728 () Bool)

(assert (=> b!1515510 (= e!845723 (not e!845728))))

(declare-fun res!1035424 () Bool)

(assert (=> b!1515510 (=> res!1035424 e!845728)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!656928 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515510 (= res!1035424 (or (not (= (select (arr!48734 a!2804) j!70) lt!656928)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48734 a!2804) index!487) (select (arr!48734 a!2804) j!70)) (not (= (select (arr!48734 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845726 () Bool)

(assert (=> b!1515510 e!845726))

(declare-fun res!1035416 () Bool)

(assert (=> b!1515510 (=> (not res!1035416) (not e!845726))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100994 (_ BitVec 32)) Bool)

(assert (=> b!1515510 (= res!1035416 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50678 0))(
  ( (Unit!50679) )
))
(declare-fun lt!656927 () Unit!50678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50678)

(assert (=> b!1515510 (= lt!656927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515511 () Bool)

(declare-datatypes ((SeekEntryResult!12905 0))(
  ( (MissingZero!12905 (index!54015 (_ BitVec 32))) (Found!12905 (index!54016 (_ BitVec 32))) (Intermediate!12905 (undefined!13717 Bool) (index!54017 (_ BitVec 32)) (x!135719 (_ BitVec 32))) (Undefined!12905) (MissingVacant!12905 (index!54018 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100994 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1515511 (= e!845726 (= (seekEntry!0 (select (arr!48734 a!2804) j!70) a!2804 mask!2512) (Found!12905 j!70)))))

(declare-fun b!1515512 () Bool)

(declare-fun res!1035419 () Bool)

(assert (=> b!1515512 (=> (not res!1035419) (not e!845727))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515512 (= res!1035419 (validKeyInArray!0 (select (arr!48734 a!2804) i!961)))))

(declare-fun b!1515513 () Bool)

(declare-fun e!845725 () Bool)

(assert (=> b!1515513 (= e!845728 e!845725)))

(declare-fun res!1035415 () Bool)

(assert (=> b!1515513 (=> res!1035415 e!845725)))

(declare-fun lt!656924 () SeekEntryResult!12905)

(assert (=> b!1515513 (= res!1035415 (not (= lt!656924 (Found!12905 j!70))))))

(declare-fun lt!656923 () SeekEntryResult!12905)

(declare-fun lt!656921 () SeekEntryResult!12905)

(assert (=> b!1515513 (= lt!656923 lt!656921)))

(declare-fun lt!656920 () array!100994)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100994 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1515513 (= lt!656921 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656928 lt!656920 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100994 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1515513 (= lt!656923 (seekEntryOrOpen!0 lt!656928 lt!656920 mask!2512))))

(declare-fun lt!656926 () SeekEntryResult!12905)

(assert (=> b!1515513 (= lt!656926 lt!656924)))

(assert (=> b!1515513 (= lt!656924 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48734 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515513 (= lt!656926 (seekEntryOrOpen!0 (select (arr!48734 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515514 () Bool)

(declare-fun res!1035413 () Bool)

(declare-fun e!845722 () Bool)

(assert (=> b!1515514 (=> (not res!1035413) (not e!845722))))

(declare-fun lt!656922 () SeekEntryResult!12905)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100994 (_ BitVec 32)) SeekEntryResult!12905)

(assert (=> b!1515514 (= res!1035413 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48734 a!2804) j!70) a!2804 mask!2512) lt!656922))))

(declare-fun res!1035421 () Bool)

(assert (=> start!129138 (=> (not res!1035421) (not e!845727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129138 (= res!1035421 (validMask!0 mask!2512))))

(assert (=> start!129138 e!845727))

(assert (=> start!129138 true))

(declare-fun array_inv!37762 (array!100994) Bool)

(assert (=> start!129138 (array_inv!37762 a!2804)))

(declare-fun b!1515515 () Bool)

(declare-fun res!1035420 () Bool)

(assert (=> b!1515515 (=> (not res!1035420) (not e!845727))))

(assert (=> b!1515515 (= res!1035420 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49284 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49284 a!2804))))))

(declare-fun b!1515516 () Bool)

(declare-fun res!1035418 () Bool)

(assert (=> b!1515516 (=> (not res!1035418) (not e!845727))))

(assert (=> b!1515516 (= res!1035418 (and (= (size!49284 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49284 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49284 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515517 () Bool)

(declare-fun res!1035414 () Bool)

(assert (=> b!1515517 (=> (not res!1035414) (not e!845727))))

(assert (=> b!1515517 (= res!1035414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515518 () Bool)

(assert (=> b!1515518 (= e!845725 true)))

(assert (=> b!1515518 (= lt!656921 lt!656924)))

(declare-fun lt!656925 () Unit!50678)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50678)

(assert (=> b!1515518 (= lt!656925 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515519 () Bool)

(assert (=> b!1515519 (= e!845727 e!845722)))

(declare-fun res!1035423 () Bool)

(assert (=> b!1515519 (=> (not res!1035423) (not e!845722))))

(declare-fun lt!656929 () SeekEntryResult!12905)

(assert (=> b!1515519 (= res!1035423 (= lt!656929 lt!656922))))

(assert (=> b!1515519 (= lt!656922 (Intermediate!12905 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515519 (= lt!656929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48734 a!2804) j!70) mask!2512) (select (arr!48734 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515520 () Bool)

(declare-fun res!1035417 () Bool)

(assert (=> b!1515520 (=> (not res!1035417) (not e!845727))))

(declare-datatypes ((List!35217 0))(
  ( (Nil!35214) (Cons!35213 (h!36625 (_ BitVec 64)) (t!49911 List!35217)) )
))
(declare-fun arrayNoDuplicates!0 (array!100994 (_ BitVec 32) List!35217) Bool)

(assert (=> b!1515520 (= res!1035417 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35214))))

(declare-fun b!1515521 () Bool)

(assert (=> b!1515521 (= e!845722 e!845723)))

(declare-fun res!1035412 () Bool)

(assert (=> b!1515521 (=> (not res!1035412) (not e!845723))))

(assert (=> b!1515521 (= res!1035412 (= lt!656929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656928 mask!2512) lt!656928 lt!656920 mask!2512)))))

(assert (=> b!1515521 (= lt!656928 (select (store (arr!48734 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515521 (= lt!656920 (array!100995 (store (arr!48734 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49284 a!2804)))))

(assert (= (and start!129138 res!1035421) b!1515516))

(assert (= (and b!1515516 res!1035418) b!1515512))

(assert (= (and b!1515512 res!1035419) b!1515509))

(assert (= (and b!1515509 res!1035422) b!1515517))

(assert (= (and b!1515517 res!1035414) b!1515520))

(assert (= (and b!1515520 res!1035417) b!1515515))

(assert (= (and b!1515515 res!1035420) b!1515519))

(assert (= (and b!1515519 res!1035423) b!1515514))

(assert (= (and b!1515514 res!1035413) b!1515521))

(assert (= (and b!1515521 res!1035412) b!1515510))

(assert (= (and b!1515510 res!1035416) b!1515511))

(assert (= (and b!1515510 (not res!1035424)) b!1515513))

(assert (= (and b!1515513 (not res!1035415)) b!1515518))

(declare-fun m!1398631 () Bool)

(assert (=> b!1515517 m!1398631))

(declare-fun m!1398633 () Bool)

(assert (=> b!1515521 m!1398633))

(assert (=> b!1515521 m!1398633))

(declare-fun m!1398635 () Bool)

(assert (=> b!1515521 m!1398635))

(declare-fun m!1398637 () Bool)

(assert (=> b!1515521 m!1398637))

(declare-fun m!1398639 () Bool)

(assert (=> b!1515521 m!1398639))

(declare-fun m!1398641 () Bool)

(assert (=> b!1515514 m!1398641))

(assert (=> b!1515514 m!1398641))

(declare-fun m!1398643 () Bool)

(assert (=> b!1515514 m!1398643))

(declare-fun m!1398645 () Bool)

(assert (=> start!129138 m!1398645))

(declare-fun m!1398647 () Bool)

(assert (=> start!129138 m!1398647))

(assert (=> b!1515509 m!1398641))

(assert (=> b!1515509 m!1398641))

(declare-fun m!1398649 () Bool)

(assert (=> b!1515509 m!1398649))

(declare-fun m!1398651 () Bool)

(assert (=> b!1515518 m!1398651))

(assert (=> b!1515519 m!1398641))

(assert (=> b!1515519 m!1398641))

(declare-fun m!1398653 () Bool)

(assert (=> b!1515519 m!1398653))

(assert (=> b!1515519 m!1398653))

(assert (=> b!1515519 m!1398641))

(declare-fun m!1398655 () Bool)

(assert (=> b!1515519 m!1398655))

(assert (=> b!1515513 m!1398641))

(declare-fun m!1398657 () Bool)

(assert (=> b!1515513 m!1398657))

(assert (=> b!1515513 m!1398641))

(declare-fun m!1398659 () Bool)

(assert (=> b!1515513 m!1398659))

(declare-fun m!1398661 () Bool)

(assert (=> b!1515513 m!1398661))

(assert (=> b!1515513 m!1398641))

(declare-fun m!1398663 () Bool)

(assert (=> b!1515513 m!1398663))

(assert (=> b!1515510 m!1398641))

(declare-fun m!1398665 () Bool)

(assert (=> b!1515510 m!1398665))

(declare-fun m!1398667 () Bool)

(assert (=> b!1515510 m!1398667))

(declare-fun m!1398669 () Bool)

(assert (=> b!1515510 m!1398669))

(assert (=> b!1515511 m!1398641))

(assert (=> b!1515511 m!1398641))

(declare-fun m!1398671 () Bool)

(assert (=> b!1515511 m!1398671))

(declare-fun m!1398673 () Bool)

(assert (=> b!1515520 m!1398673))

(declare-fun m!1398675 () Bool)

(assert (=> b!1515512 m!1398675))

(assert (=> b!1515512 m!1398675))

(declare-fun m!1398677 () Bool)

(assert (=> b!1515512 m!1398677))

(push 1)

