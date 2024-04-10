; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129096 () Bool)

(assert start!129096)

(declare-fun b!1514665 () Bool)

(declare-fun res!1034571 () Bool)

(declare-fun e!845282 () Bool)

(assert (=> b!1514665 (=> (not res!1034571) (not e!845282))))

(declare-datatypes ((array!100952 0))(
  ( (array!100953 (arr!48713 (Array (_ BitVec 32) (_ BitVec 64))) (size!49263 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100952)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514665 (= res!1034571 (validKeyInArray!0 (select (arr!48713 a!2804) i!961)))))

(declare-fun b!1514666 () Bool)

(declare-fun e!845287 () Bool)

(declare-fun e!845284 () Bool)

(assert (=> b!1514666 (= e!845287 e!845284)))

(declare-fun res!1034568 () Bool)

(assert (=> b!1514666 (=> (not res!1034568) (not e!845284))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12884 0))(
  ( (MissingZero!12884 (index!53931 (_ BitVec 32))) (Found!12884 (index!53932 (_ BitVec 32))) (Intermediate!12884 (undefined!13696 Bool) (index!53933 (_ BitVec 32)) (x!135642 (_ BitVec 32))) (Undefined!12884) (MissingVacant!12884 (index!53934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100952 (_ BitVec 32)) SeekEntryResult!12884)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100952 (_ BitVec 32)) SeekEntryResult!12884)

(assert (=> b!1514666 (= res!1034568 (= (seekEntryOrOpen!0 (select (arr!48713 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48713 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514667 () Bool)

(declare-fun e!845285 () Bool)

(assert (=> b!1514667 (= e!845285 e!845287)))

(declare-fun res!1034578 () Bool)

(assert (=> b!1514667 (=> res!1034578 e!845287)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lt!656419 () (_ BitVec 64))

(assert (=> b!1514667 (= res!1034578 (or (not (= (select (arr!48713 a!2804) j!70) lt!656419)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48713 a!2804) index!487) (select (arr!48713 a!2804) j!70)) (not (= (select (arr!48713 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514669 () Bool)

(declare-fun e!845281 () Bool)

(assert (=> b!1514669 (= e!845282 e!845281)))

(declare-fun res!1034579 () Bool)

(assert (=> b!1514669 (=> (not res!1034579) (not e!845281))))

(declare-fun lt!656416 () SeekEntryResult!12884)

(declare-fun lt!656417 () SeekEntryResult!12884)

(assert (=> b!1514669 (= res!1034579 (= lt!656416 lt!656417))))

(assert (=> b!1514669 (= lt!656417 (Intermediate!12884 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100952 (_ BitVec 32)) SeekEntryResult!12884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514669 (= lt!656416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48713 a!2804) j!70) mask!2512) (select (arr!48713 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514670 () Bool)

(declare-fun res!1034570 () Bool)

(assert (=> b!1514670 (=> (not res!1034570) (not e!845282))))

(assert (=> b!1514670 (= res!1034570 (validKeyInArray!0 (select (arr!48713 a!2804) j!70)))))

(declare-fun lt!656418 () array!100952)

(declare-fun b!1514671 () Bool)

(assert (=> b!1514671 (= e!845284 (= (seekEntryOrOpen!0 lt!656419 lt!656418 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656419 lt!656418 mask!2512)))))

(declare-fun b!1514672 () Bool)

(declare-fun e!845283 () Bool)

(assert (=> b!1514672 (= e!845281 e!845283)))

(declare-fun res!1034573 () Bool)

(assert (=> b!1514672 (=> (not res!1034573) (not e!845283))))

(assert (=> b!1514672 (= res!1034573 (= lt!656416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656419 mask!2512) lt!656419 lt!656418 mask!2512)))))

(assert (=> b!1514672 (= lt!656419 (select (store (arr!48713 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514672 (= lt!656418 (array!100953 (store (arr!48713 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49263 a!2804)))))

(declare-fun b!1514673 () Bool)

(declare-fun res!1034575 () Bool)

(assert (=> b!1514673 (=> (not res!1034575) (not e!845282))))

(declare-datatypes ((List!35196 0))(
  ( (Nil!35193) (Cons!35192 (h!36604 (_ BitVec 64)) (t!49890 List!35196)) )
))
(declare-fun arrayNoDuplicates!0 (array!100952 (_ BitVec 32) List!35196) Bool)

(assert (=> b!1514673 (= res!1034575 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35193))))

(declare-fun b!1514668 () Bool)

(declare-fun res!1034572 () Bool)

(assert (=> b!1514668 (=> (not res!1034572) (not e!845282))))

(assert (=> b!1514668 (= res!1034572 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49263 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49263 a!2804))))))

(declare-fun res!1034577 () Bool)

(assert (=> start!129096 (=> (not res!1034577) (not e!845282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129096 (= res!1034577 (validMask!0 mask!2512))))

(assert (=> start!129096 e!845282))

(assert (=> start!129096 true))

(declare-fun array_inv!37741 (array!100952) Bool)

(assert (=> start!129096 (array_inv!37741 a!2804)))

(declare-fun b!1514674 () Bool)

(declare-fun res!1034580 () Bool)

(assert (=> b!1514674 (=> (not res!1034580) (not e!845282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100952 (_ BitVec 32)) Bool)

(assert (=> b!1514674 (= res!1034580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514675 () Bool)

(declare-fun res!1034574 () Bool)

(assert (=> b!1514675 (=> (not res!1034574) (not e!845285))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100952 (_ BitVec 32)) SeekEntryResult!12884)

(assert (=> b!1514675 (= res!1034574 (= (seekEntry!0 (select (arr!48713 a!2804) j!70) a!2804 mask!2512) (Found!12884 j!70)))))

(declare-fun b!1514676 () Bool)

(declare-fun res!1034581 () Bool)

(assert (=> b!1514676 (=> (not res!1034581) (not e!845281))))

(assert (=> b!1514676 (= res!1034581 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48713 a!2804) j!70) a!2804 mask!2512) lt!656417))))

(declare-fun b!1514677 () Bool)

(assert (=> b!1514677 (= e!845283 (not true))))

(assert (=> b!1514677 e!845285))

(declare-fun res!1034576 () Bool)

(assert (=> b!1514677 (=> (not res!1034576) (not e!845285))))

(assert (=> b!1514677 (= res!1034576 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50636 0))(
  ( (Unit!50637) )
))
(declare-fun lt!656415 () Unit!50636)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50636)

(assert (=> b!1514677 (= lt!656415 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514678 () Bool)

(declare-fun res!1034569 () Bool)

(assert (=> b!1514678 (=> (not res!1034569) (not e!845282))))

(assert (=> b!1514678 (= res!1034569 (and (= (size!49263 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49263 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49263 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129096 res!1034577) b!1514678))

(assert (= (and b!1514678 res!1034569) b!1514665))

(assert (= (and b!1514665 res!1034571) b!1514670))

(assert (= (and b!1514670 res!1034570) b!1514674))

(assert (= (and b!1514674 res!1034580) b!1514673))

(assert (= (and b!1514673 res!1034575) b!1514668))

(assert (= (and b!1514668 res!1034572) b!1514669))

(assert (= (and b!1514669 res!1034579) b!1514676))

(assert (= (and b!1514676 res!1034581) b!1514672))

(assert (= (and b!1514672 res!1034573) b!1514677))

(assert (= (and b!1514677 res!1034576) b!1514675))

(assert (= (and b!1514675 res!1034574) b!1514667))

(assert (= (and b!1514667 (not res!1034578)) b!1514666))

(assert (= (and b!1514666 res!1034568) b!1514671))

(declare-fun m!1397641 () Bool)

(assert (=> b!1514669 m!1397641))

(assert (=> b!1514669 m!1397641))

(declare-fun m!1397643 () Bool)

(assert (=> b!1514669 m!1397643))

(assert (=> b!1514669 m!1397643))

(assert (=> b!1514669 m!1397641))

(declare-fun m!1397645 () Bool)

(assert (=> b!1514669 m!1397645))

(declare-fun m!1397647 () Bool)

(assert (=> b!1514673 m!1397647))

(assert (=> b!1514676 m!1397641))

(assert (=> b!1514676 m!1397641))

(declare-fun m!1397649 () Bool)

(assert (=> b!1514676 m!1397649))

(assert (=> b!1514666 m!1397641))

(assert (=> b!1514666 m!1397641))

(declare-fun m!1397651 () Bool)

(assert (=> b!1514666 m!1397651))

(assert (=> b!1514666 m!1397641))

(declare-fun m!1397653 () Bool)

(assert (=> b!1514666 m!1397653))

(assert (=> b!1514667 m!1397641))

(declare-fun m!1397655 () Bool)

(assert (=> b!1514667 m!1397655))

(declare-fun m!1397657 () Bool)

(assert (=> b!1514671 m!1397657))

(declare-fun m!1397659 () Bool)

(assert (=> b!1514671 m!1397659))

(declare-fun m!1397661 () Bool)

(assert (=> b!1514677 m!1397661))

(declare-fun m!1397663 () Bool)

(assert (=> b!1514677 m!1397663))

(declare-fun m!1397665 () Bool)

(assert (=> b!1514665 m!1397665))

(assert (=> b!1514665 m!1397665))

(declare-fun m!1397667 () Bool)

(assert (=> b!1514665 m!1397667))

(declare-fun m!1397669 () Bool)

(assert (=> start!129096 m!1397669))

(declare-fun m!1397671 () Bool)

(assert (=> start!129096 m!1397671))

(declare-fun m!1397673 () Bool)

(assert (=> b!1514674 m!1397673))

(assert (=> b!1514675 m!1397641))

(assert (=> b!1514675 m!1397641))

(declare-fun m!1397675 () Bool)

(assert (=> b!1514675 m!1397675))

(assert (=> b!1514670 m!1397641))

(assert (=> b!1514670 m!1397641))

(declare-fun m!1397677 () Bool)

(assert (=> b!1514670 m!1397677))

(declare-fun m!1397679 () Bool)

(assert (=> b!1514672 m!1397679))

(assert (=> b!1514672 m!1397679))

(declare-fun m!1397681 () Bool)

(assert (=> b!1514672 m!1397681))

(declare-fun m!1397683 () Bool)

(assert (=> b!1514672 m!1397683))

(declare-fun m!1397685 () Bool)

(assert (=> b!1514672 m!1397685))

(push 1)

