; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130038 () Bool)

(assert start!130038)

(declare-fun b!1526421 () Bool)

(declare-fun res!1044650 () Bool)

(declare-fun e!850786 () Bool)

(assert (=> b!1526421 (=> (not res!1044650) (not e!850786))))

(declare-datatypes ((array!101449 0))(
  ( (array!101450 (arr!48952 (Array (_ BitVec 32) (_ BitVec 64))) (size!49504 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101449)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526421 (= res!1044650 (validKeyInArray!0 (select (arr!48952 a!2804) i!961)))))

(declare-fun b!1526422 () Bool)

(declare-fun res!1044648 () Bool)

(assert (=> b!1526422 (=> (not res!1044648) (not e!850786))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526422 (= res!1044648 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49504 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49504 a!2804))))))

(declare-fun b!1526423 () Bool)

(declare-fun res!1044649 () Bool)

(declare-fun e!850784 () Bool)

(assert (=> b!1526423 (=> (not res!1044649) (not e!850784))))

(declare-datatypes ((SeekEntryResult!13140 0))(
  ( (MissingZero!13140 (index!54955 (_ BitVec 32))) (Found!13140 (index!54956 (_ BitVec 32))) (Intermediate!13140 (undefined!13952 Bool) (index!54957 (_ BitVec 32)) (x!136653 (_ BitVec 32))) (Undefined!13140) (MissingVacant!13140 (index!54958 (_ BitVec 32))) )
))
(declare-fun lt!660895 () SeekEntryResult!13140)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101449 (_ BitVec 32)) SeekEntryResult!13140)

(assert (=> b!1526423 (= res!1044649 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) lt!660895))))

(declare-fun b!1526424 () Bool)

(declare-fun res!1044645 () Bool)

(assert (=> b!1526424 (=> (not res!1044645) (not e!850786))))

(declare-datatypes ((List!35513 0))(
  ( (Nil!35510) (Cons!35509 (h!36943 (_ BitVec 64)) (t!50199 List!35513)) )
))
(declare-fun arrayNoDuplicates!0 (array!101449 (_ BitVec 32) List!35513) Bool)

(assert (=> b!1526424 (= res!1044645 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35510))))

(declare-fun b!1526425 () Bool)

(declare-fun e!850780 () Bool)

(declare-fun e!850785 () Bool)

(assert (=> b!1526425 (= e!850780 e!850785)))

(declare-fun res!1044647 () Bool)

(assert (=> b!1526425 (=> (not res!1044647) (not e!850785))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101449 (_ BitVec 32)) SeekEntryResult!13140)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101449 (_ BitVec 32)) SeekEntryResult!13140)

(assert (=> b!1526425 (= res!1044647 (= (seekEntryOrOpen!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48952 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1044641 () Bool)

(assert (=> start!130038 (=> (not res!1044641) (not e!850786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130038 (= res!1044641 (validMask!0 mask!2512))))

(assert (=> start!130038 e!850786))

(assert (=> start!130038 true))

(declare-fun array_inv!38185 (array!101449) Bool)

(assert (=> start!130038 (array_inv!38185 a!2804)))

(declare-fun b!1526426 () Bool)

(declare-fun e!850783 () Bool)

(assert (=> b!1526426 (= e!850783 e!850780)))

(declare-fun res!1044651 () Bool)

(assert (=> b!1526426 (=> res!1044651 e!850780)))

(declare-fun lt!660897 () (_ BitVec 64))

(assert (=> b!1526426 (= res!1044651 (or (not (= (select (arr!48952 a!2804) j!70) lt!660897)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48952 a!2804) index!487) (select (arr!48952 a!2804) j!70)) (not (= (select (arr!48952 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!660893 () array!101449)

(declare-fun b!1526427 () Bool)

(assert (=> b!1526427 (= e!850785 (= (seekEntryOrOpen!0 lt!660897 lt!660893 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660897 lt!660893 mask!2512)))))

(declare-fun b!1526428 () Bool)

(declare-fun e!850781 () Bool)

(assert (=> b!1526428 (= e!850781 (not true))))

(assert (=> b!1526428 e!850783))

(declare-fun res!1044639 () Bool)

(assert (=> b!1526428 (=> (not res!1044639) (not e!850783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101449 (_ BitVec 32)) Bool)

(assert (=> b!1526428 (= res!1044639 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50903 0))(
  ( (Unit!50904) )
))
(declare-fun lt!660894 () Unit!50903)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50903)

(assert (=> b!1526428 (= lt!660894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526429 () Bool)

(declare-fun res!1044643 () Bool)

(assert (=> b!1526429 (=> (not res!1044643) (not e!850786))))

(assert (=> b!1526429 (= res!1044643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526430 () Bool)

(assert (=> b!1526430 (= e!850786 e!850784)))

(declare-fun res!1044646 () Bool)

(assert (=> b!1526430 (=> (not res!1044646) (not e!850784))))

(declare-fun lt!660896 () SeekEntryResult!13140)

(assert (=> b!1526430 (= res!1044646 (= lt!660896 lt!660895))))

(assert (=> b!1526430 (= lt!660895 (Intermediate!13140 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526430 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) (select (arr!48952 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526431 () Bool)

(assert (=> b!1526431 (= e!850784 e!850781)))

(declare-fun res!1044644 () Bool)

(assert (=> b!1526431 (=> (not res!1044644) (not e!850781))))

(assert (=> b!1526431 (= res!1044644 (= lt!660896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660897 mask!2512) lt!660897 lt!660893 mask!2512)))))

(assert (=> b!1526431 (= lt!660897 (select (store (arr!48952 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526431 (= lt!660893 (array!101450 (store (arr!48952 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49504 a!2804)))))

(declare-fun b!1526432 () Bool)

(declare-fun res!1044640 () Bool)

(assert (=> b!1526432 (=> (not res!1044640) (not e!850783))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101449 (_ BitVec 32)) SeekEntryResult!13140)

(assert (=> b!1526432 (= res!1044640 (= (seekEntry!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) (Found!13140 j!70)))))

(declare-fun b!1526433 () Bool)

(declare-fun res!1044642 () Bool)

(assert (=> b!1526433 (=> (not res!1044642) (not e!850786))))

(assert (=> b!1526433 (= res!1044642 (validKeyInArray!0 (select (arr!48952 a!2804) j!70)))))

(declare-fun b!1526434 () Bool)

(declare-fun res!1044652 () Bool)

(assert (=> b!1526434 (=> (not res!1044652) (not e!850786))))

(assert (=> b!1526434 (= res!1044652 (and (= (size!49504 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49504 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49504 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130038 res!1044641) b!1526434))

(assert (= (and b!1526434 res!1044652) b!1526421))

(assert (= (and b!1526421 res!1044650) b!1526433))

(assert (= (and b!1526433 res!1044642) b!1526429))

(assert (= (and b!1526429 res!1044643) b!1526424))

(assert (= (and b!1526424 res!1044645) b!1526422))

(assert (= (and b!1526422 res!1044648) b!1526430))

(assert (= (and b!1526430 res!1044646) b!1526423))

(assert (= (and b!1526423 res!1044649) b!1526431))

(assert (= (and b!1526431 res!1044644) b!1526428))

(assert (= (and b!1526428 res!1044639) b!1526432))

(assert (= (and b!1526432 res!1044640) b!1526426))

(assert (= (and b!1526426 (not res!1044651)) b!1526425))

(assert (= (and b!1526425 res!1044647) b!1526427))

(declare-fun m!1408673 () Bool)

(assert (=> start!130038 m!1408673))

(declare-fun m!1408675 () Bool)

(assert (=> start!130038 m!1408675))

(declare-fun m!1408677 () Bool)

(assert (=> b!1526421 m!1408677))

(assert (=> b!1526421 m!1408677))

(declare-fun m!1408679 () Bool)

(assert (=> b!1526421 m!1408679))

(declare-fun m!1408681 () Bool)

(assert (=> b!1526433 m!1408681))

(assert (=> b!1526433 m!1408681))

(declare-fun m!1408683 () Bool)

(assert (=> b!1526433 m!1408683))

(assert (=> b!1526423 m!1408681))

(assert (=> b!1526423 m!1408681))

(declare-fun m!1408685 () Bool)

(assert (=> b!1526423 m!1408685))

(assert (=> b!1526425 m!1408681))

(assert (=> b!1526425 m!1408681))

(declare-fun m!1408687 () Bool)

(assert (=> b!1526425 m!1408687))

(assert (=> b!1526425 m!1408681))

(declare-fun m!1408689 () Bool)

(assert (=> b!1526425 m!1408689))

(declare-fun m!1408691 () Bool)

(assert (=> b!1526429 m!1408691))

(declare-fun m!1408693 () Bool)

(assert (=> b!1526428 m!1408693))

(declare-fun m!1408695 () Bool)

(assert (=> b!1526428 m!1408695))

(assert (=> b!1526430 m!1408681))

(assert (=> b!1526430 m!1408681))

(declare-fun m!1408697 () Bool)

(assert (=> b!1526430 m!1408697))

(assert (=> b!1526430 m!1408697))

(assert (=> b!1526430 m!1408681))

(declare-fun m!1408699 () Bool)

(assert (=> b!1526430 m!1408699))

(assert (=> b!1526432 m!1408681))

(assert (=> b!1526432 m!1408681))

(declare-fun m!1408701 () Bool)

(assert (=> b!1526432 m!1408701))

(declare-fun m!1408703 () Bool)

(assert (=> b!1526424 m!1408703))

(declare-fun m!1408705 () Bool)

(assert (=> b!1526427 m!1408705))

(declare-fun m!1408707 () Bool)

(assert (=> b!1526427 m!1408707))

(declare-fun m!1408709 () Bool)

(assert (=> b!1526431 m!1408709))

(assert (=> b!1526431 m!1408709))

(declare-fun m!1408711 () Bool)

(assert (=> b!1526431 m!1408711))

(declare-fun m!1408713 () Bool)

(assert (=> b!1526431 m!1408713))

(declare-fun m!1408715 () Bool)

(assert (=> b!1526431 m!1408715))

(assert (=> b!1526426 m!1408681))

(declare-fun m!1408717 () Bool)

(assert (=> b!1526426 m!1408717))

(check-sat (not b!1526432) (not b!1526433) (not b!1526430) (not b!1526431) (not start!130038) (not b!1526425) (not b!1526421) (not b!1526424) (not b!1526427) (not b!1526428) (not b!1526423) (not b!1526429))
(check-sat)
