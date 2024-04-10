; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128950 () Bool)

(assert start!128950)

(declare-fun b!1511681 () Bool)

(declare-fun res!1031588 () Bool)

(declare-fun e!843912 () Bool)

(assert (=> b!1511681 (=> (not res!1031588) (not e!843912))))

(declare-datatypes ((array!100806 0))(
  ( (array!100807 (arr!48640 (Array (_ BitVec 32) (_ BitVec 64))) (size!49190 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100806)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511681 (= res!1031588 (validKeyInArray!0 (select (arr!48640 a!2804) j!70)))))

(declare-fun b!1511682 () Bool)

(declare-fun res!1031594 () Bool)

(assert (=> b!1511682 (=> (not res!1031594) (not e!843912))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511682 (= res!1031594 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49190 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49190 a!2804))))))

(declare-fun b!1511683 () Bool)

(declare-fun res!1031590 () Bool)

(declare-fun e!843914 () Bool)

(assert (=> b!1511683 (=> (not res!1031590) (not e!843914))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12811 0))(
  ( (MissingZero!12811 (index!53639 (_ BitVec 32))) (Found!12811 (index!53640 (_ BitVec 32))) (Intermediate!12811 (undefined!13623 Bool) (index!53641 (_ BitVec 32)) (x!135369 (_ BitVec 32))) (Undefined!12811) (MissingVacant!12811 (index!53642 (_ BitVec 32))) )
))
(declare-fun lt!655503 () SeekEntryResult!12811)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100806 (_ BitVec 32)) SeekEntryResult!12811)

(assert (=> b!1511683 (= res!1031590 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) lt!655503))))

(declare-fun b!1511684 () Bool)

(declare-fun res!1031584 () Bool)

(assert (=> b!1511684 (=> (not res!1031584) (not e!843912))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511684 (= res!1031584 (validKeyInArray!0 (select (arr!48640 a!2804) i!961)))))

(declare-fun b!1511685 () Bool)

(declare-fun res!1031591 () Bool)

(assert (=> b!1511685 (=> (not res!1031591) (not e!843912))))

(declare-datatypes ((List!35123 0))(
  ( (Nil!35120) (Cons!35119 (h!36531 (_ BitVec 64)) (t!49817 List!35123)) )
))
(declare-fun arrayNoDuplicates!0 (array!100806 (_ BitVec 32) List!35123) Bool)

(assert (=> b!1511685 (= res!1031591 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35120))))

(declare-fun b!1511686 () Bool)

(assert (=> b!1511686 (= e!843912 e!843914)))

(declare-fun res!1031595 () Bool)

(assert (=> b!1511686 (=> (not res!1031595) (not e!843914))))

(declare-fun lt!655502 () SeekEntryResult!12811)

(assert (=> b!1511686 (= res!1031595 (= lt!655502 lt!655503))))

(assert (=> b!1511686 (= lt!655503 (Intermediate!12811 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511686 (= lt!655502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48640 a!2804) j!70) mask!2512) (select (arr!48640 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1031589 () Bool)

(assert (=> start!128950 (=> (not res!1031589) (not e!843912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128950 (= res!1031589 (validMask!0 mask!2512))))

(assert (=> start!128950 e!843912))

(assert (=> start!128950 true))

(declare-fun array_inv!37668 (array!100806) Bool)

(assert (=> start!128950 (array_inv!37668 a!2804)))

(declare-fun b!1511687 () Bool)

(declare-fun res!1031586 () Bool)

(assert (=> b!1511687 (=> (not res!1031586) (not e!843914))))

(assert (=> b!1511687 (= res!1031586 (= lt!655502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100807 (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49190 a!2804)) mask!2512)))))

(declare-fun b!1511688 () Bool)

(declare-fun e!843916 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100806 (_ BitVec 32)) SeekEntryResult!12811)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100806 (_ BitVec 32)) SeekEntryResult!12811)

(assert (=> b!1511688 (= e!843916 (= (seekEntryOrOpen!0 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48640 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511689 () Bool)

(assert (=> b!1511689 (= e!843914 (not true))))

(declare-fun e!843915 () Bool)

(assert (=> b!1511689 e!843915))

(declare-fun res!1031587 () Bool)

(assert (=> b!1511689 (=> (not res!1031587) (not e!843915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100806 (_ BitVec 32)) Bool)

(assert (=> b!1511689 (= res!1031587 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50490 0))(
  ( (Unit!50491) )
))
(declare-fun lt!655504 () Unit!50490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50490)

(assert (=> b!1511689 (= lt!655504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511690 () Bool)

(declare-fun res!1031596 () Bool)

(assert (=> b!1511690 (=> (not res!1031596) (not e!843912))))

(assert (=> b!1511690 (= res!1031596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511691 () Bool)

(declare-fun res!1031592 () Bool)

(assert (=> b!1511691 (=> (not res!1031592) (not e!843915))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100806 (_ BitVec 32)) SeekEntryResult!12811)

(assert (=> b!1511691 (= res!1031592 (= (seekEntry!0 (select (arr!48640 a!2804) j!70) a!2804 mask!2512) (Found!12811 j!70)))))

(declare-fun b!1511692 () Bool)

(assert (=> b!1511692 (= e!843915 e!843916)))

(declare-fun res!1031585 () Bool)

(assert (=> b!1511692 (=> res!1031585 e!843916)))

(assert (=> b!1511692 (= res!1031585 (or (not (= (select (arr!48640 a!2804) j!70) (select (store (arr!48640 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48640 a!2804) index!487) (select (arr!48640 a!2804) j!70)) (not (= (select (arr!48640 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511693 () Bool)

(declare-fun res!1031593 () Bool)

(assert (=> b!1511693 (=> (not res!1031593) (not e!843912))))

(assert (=> b!1511693 (= res!1031593 (and (= (size!49190 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49190 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49190 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128950 res!1031589) b!1511693))

(assert (= (and b!1511693 res!1031593) b!1511684))

(assert (= (and b!1511684 res!1031584) b!1511681))

(assert (= (and b!1511681 res!1031588) b!1511690))

(assert (= (and b!1511690 res!1031596) b!1511685))

(assert (= (and b!1511685 res!1031591) b!1511682))

(assert (= (and b!1511682 res!1031594) b!1511686))

(assert (= (and b!1511686 res!1031595) b!1511683))

(assert (= (and b!1511683 res!1031590) b!1511687))

(assert (= (and b!1511687 res!1031586) b!1511689))

(assert (= (and b!1511689 res!1031587) b!1511691))

(assert (= (and b!1511691 res!1031592) b!1511692))

(assert (= (and b!1511692 (not res!1031585)) b!1511688))

(declare-fun m!1394395 () Bool)

(assert (=> b!1511688 m!1394395))

(assert (=> b!1511688 m!1394395))

(declare-fun m!1394397 () Bool)

(assert (=> b!1511688 m!1394397))

(assert (=> b!1511688 m!1394395))

(declare-fun m!1394399 () Bool)

(assert (=> b!1511688 m!1394399))

(declare-fun m!1394401 () Bool)

(assert (=> b!1511684 m!1394401))

(assert (=> b!1511684 m!1394401))

(declare-fun m!1394403 () Bool)

(assert (=> b!1511684 m!1394403))

(assert (=> b!1511692 m!1394395))

(declare-fun m!1394405 () Bool)

(assert (=> b!1511692 m!1394405))

(declare-fun m!1394407 () Bool)

(assert (=> b!1511692 m!1394407))

(declare-fun m!1394409 () Bool)

(assert (=> b!1511692 m!1394409))

(assert (=> b!1511683 m!1394395))

(assert (=> b!1511683 m!1394395))

(declare-fun m!1394411 () Bool)

(assert (=> b!1511683 m!1394411))

(declare-fun m!1394413 () Bool)

(assert (=> b!1511689 m!1394413))

(declare-fun m!1394415 () Bool)

(assert (=> b!1511689 m!1394415))

(assert (=> b!1511681 m!1394395))

(assert (=> b!1511681 m!1394395))

(declare-fun m!1394417 () Bool)

(assert (=> b!1511681 m!1394417))

(assert (=> b!1511686 m!1394395))

(assert (=> b!1511686 m!1394395))

(declare-fun m!1394419 () Bool)

(assert (=> b!1511686 m!1394419))

(assert (=> b!1511686 m!1394419))

(assert (=> b!1511686 m!1394395))

(declare-fun m!1394421 () Bool)

(assert (=> b!1511686 m!1394421))

(declare-fun m!1394423 () Bool)

(assert (=> b!1511685 m!1394423))

(declare-fun m!1394425 () Bool)

(assert (=> b!1511690 m!1394425))

(assert (=> b!1511691 m!1394395))

(assert (=> b!1511691 m!1394395))

(declare-fun m!1394427 () Bool)

(assert (=> b!1511691 m!1394427))

(declare-fun m!1394429 () Bool)

(assert (=> start!128950 m!1394429))

(declare-fun m!1394431 () Bool)

(assert (=> start!128950 m!1394431))

(assert (=> b!1511687 m!1394405))

(assert (=> b!1511687 m!1394407))

(assert (=> b!1511687 m!1394407))

(declare-fun m!1394433 () Bool)

(assert (=> b!1511687 m!1394433))

(assert (=> b!1511687 m!1394433))

(assert (=> b!1511687 m!1394407))

(declare-fun m!1394435 () Bool)

(assert (=> b!1511687 m!1394435))

(push 1)

