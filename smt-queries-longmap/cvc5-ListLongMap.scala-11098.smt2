; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129610 () Bool)

(assert start!129610)

(declare-fun b!1521543 () Bool)

(declare-fun res!1040767 () Bool)

(declare-fun e!848563 () Bool)

(assert (=> b!1521543 (=> (not res!1040767) (not e!848563))))

(declare-datatypes ((array!101285 0))(
  ( (array!101286 (arr!48875 (Array (_ BitVec 32) (_ BitVec 64))) (size!49425 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101285)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101285 (_ BitVec 32)) Bool)

(assert (=> b!1521543 (= res!1040767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521544 () Bool)

(declare-fun e!848562 () Bool)

(assert (=> b!1521544 (= e!848562 false)))

(declare-fun lt!659374 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521544 (= lt!659374 (toIndex!0 (select (store (arr!48875 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1521545 () Bool)

(declare-fun res!1040773 () Bool)

(assert (=> b!1521545 (=> (not res!1040773) (not e!848563))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521545 (= res!1040773 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49425 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49425 a!2804))))))

(declare-fun b!1521546 () Bool)

(declare-fun res!1040772 () Bool)

(assert (=> b!1521546 (=> (not res!1040772) (not e!848563))))

(assert (=> b!1521546 (= res!1040772 (and (= (size!49425 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49425 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49425 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521547 () Bool)

(declare-fun res!1040765 () Bool)

(assert (=> b!1521547 (=> (not res!1040765) (not e!848562))))

(declare-datatypes ((SeekEntryResult!13040 0))(
  ( (MissingZero!13040 (index!54555 (_ BitVec 32))) (Found!13040 (index!54556 (_ BitVec 32))) (Intermediate!13040 (undefined!13852 Bool) (index!54557 (_ BitVec 32)) (x!136252 (_ BitVec 32))) (Undefined!13040) (MissingVacant!13040 (index!54558 (_ BitVec 32))) )
))
(declare-fun lt!659373 () SeekEntryResult!13040)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101285 (_ BitVec 32)) SeekEntryResult!13040)

(assert (=> b!1521547 (= res!1040765 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48875 a!2804) j!70) a!2804 mask!2512) lt!659373))))

(declare-fun b!1521548 () Bool)

(assert (=> b!1521548 (= e!848563 e!848562)))

(declare-fun res!1040769 () Bool)

(assert (=> b!1521548 (=> (not res!1040769) (not e!848562))))

(assert (=> b!1521548 (= res!1040769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48875 a!2804) j!70) mask!2512) (select (arr!48875 a!2804) j!70) a!2804 mask!2512) lt!659373))))

(assert (=> b!1521548 (= lt!659373 (Intermediate!13040 false resIndex!21 resX!21))))

(declare-fun res!1040770 () Bool)

(assert (=> start!129610 (=> (not res!1040770) (not e!848563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129610 (= res!1040770 (validMask!0 mask!2512))))

(assert (=> start!129610 e!848563))

(assert (=> start!129610 true))

(declare-fun array_inv!37903 (array!101285) Bool)

(assert (=> start!129610 (array_inv!37903 a!2804)))

(declare-fun b!1521549 () Bool)

(declare-fun res!1040768 () Bool)

(assert (=> b!1521549 (=> (not res!1040768) (not e!848563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521549 (= res!1040768 (validKeyInArray!0 (select (arr!48875 a!2804) i!961)))))

(declare-fun b!1521550 () Bool)

(declare-fun res!1040766 () Bool)

(assert (=> b!1521550 (=> (not res!1040766) (not e!848563))))

(assert (=> b!1521550 (= res!1040766 (validKeyInArray!0 (select (arr!48875 a!2804) j!70)))))

(declare-fun b!1521551 () Bool)

(declare-fun res!1040771 () Bool)

(assert (=> b!1521551 (=> (not res!1040771) (not e!848563))))

(declare-datatypes ((List!35358 0))(
  ( (Nil!35355) (Cons!35354 (h!36775 (_ BitVec 64)) (t!50052 List!35358)) )
))
(declare-fun arrayNoDuplicates!0 (array!101285 (_ BitVec 32) List!35358) Bool)

(assert (=> b!1521551 (= res!1040771 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35355))))

(assert (= (and start!129610 res!1040770) b!1521546))

(assert (= (and b!1521546 res!1040772) b!1521549))

(assert (= (and b!1521549 res!1040768) b!1521550))

(assert (= (and b!1521550 res!1040766) b!1521543))

(assert (= (and b!1521543 res!1040767) b!1521551))

(assert (= (and b!1521551 res!1040771) b!1521545))

(assert (= (and b!1521545 res!1040773) b!1521548))

(assert (= (and b!1521548 res!1040769) b!1521547))

(assert (= (and b!1521547 res!1040765) b!1521544))

(declare-fun m!1404635 () Bool)

(assert (=> start!129610 m!1404635))

(declare-fun m!1404637 () Bool)

(assert (=> start!129610 m!1404637))

(declare-fun m!1404639 () Bool)

(assert (=> b!1521550 m!1404639))

(assert (=> b!1521550 m!1404639))

(declare-fun m!1404641 () Bool)

(assert (=> b!1521550 m!1404641))

(declare-fun m!1404643 () Bool)

(assert (=> b!1521551 m!1404643))

(assert (=> b!1521548 m!1404639))

(assert (=> b!1521548 m!1404639))

(declare-fun m!1404645 () Bool)

(assert (=> b!1521548 m!1404645))

(assert (=> b!1521548 m!1404645))

(assert (=> b!1521548 m!1404639))

(declare-fun m!1404647 () Bool)

(assert (=> b!1521548 m!1404647))

(declare-fun m!1404649 () Bool)

(assert (=> b!1521543 m!1404649))

(assert (=> b!1521547 m!1404639))

(assert (=> b!1521547 m!1404639))

(declare-fun m!1404651 () Bool)

(assert (=> b!1521547 m!1404651))

(declare-fun m!1404653 () Bool)

(assert (=> b!1521549 m!1404653))

(assert (=> b!1521549 m!1404653))

(declare-fun m!1404655 () Bool)

(assert (=> b!1521549 m!1404655))

(declare-fun m!1404657 () Bool)

(assert (=> b!1521544 m!1404657))

(declare-fun m!1404659 () Bool)

(assert (=> b!1521544 m!1404659))

(assert (=> b!1521544 m!1404659))

(declare-fun m!1404661 () Bool)

(assert (=> b!1521544 m!1404661))

(push 1)

