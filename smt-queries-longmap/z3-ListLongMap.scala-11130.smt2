; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130458 () Bool)

(assert start!130458)

(declare-fun b!1528774 () Bool)

(declare-fun res!1045322 () Bool)

(declare-fun e!852273 () Bool)

(assert (=> b!1528774 (=> (not res!1045322) (not e!852273))))

(declare-datatypes ((array!101608 0))(
  ( (array!101609 (arr!49024 (Array (_ BitVec 32) (_ BitVec 64))) (size!49575 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101608)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101608 (_ BitVec 32)) Bool)

(assert (=> b!1528774 (= res!1045322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1045330 () Bool)

(assert (=> start!130458 (=> (not res!1045330) (not e!852273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130458 (= res!1045330 (validMask!0 mask!2512))))

(assert (=> start!130458 e!852273))

(assert (=> start!130458 true))

(declare-fun array_inv!38305 (array!101608) Bool)

(assert (=> start!130458 (array_inv!38305 a!2804)))

(declare-fun b!1528775 () Bool)

(declare-fun res!1045335 () Bool)

(assert (=> b!1528775 (=> (not res!1045335) (not e!852273))))

(declare-datatypes ((List!35494 0))(
  ( (Nil!35491) (Cons!35490 (h!36941 (_ BitVec 64)) (t!50180 List!35494)) )
))
(declare-fun arrayNoDuplicates!0 (array!101608 (_ BitVec 32) List!35494) Bool)

(assert (=> b!1528775 (= res!1045335 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35491))))

(declare-fun b!1528776 () Bool)

(declare-fun res!1045334 () Bool)

(declare-fun e!852275 () Bool)

(assert (=> b!1528776 (=> (not res!1045334) (not e!852275))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13082 0))(
  ( (MissingZero!13082 (index!54723 (_ BitVec 32))) (Found!13082 (index!54724 (_ BitVec 32))) (Intermediate!13082 (undefined!13894 Bool) (index!54725 (_ BitVec 32)) (x!136631 (_ BitVec 32))) (Undefined!13082) (MissingVacant!13082 (index!54726 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13082)

(assert (=> b!1528776 (= res!1045334 (= (seekEntry!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) (Found!13082 j!70)))))

(declare-fun b!1528777 () Bool)

(declare-fun res!1045325 () Bool)

(assert (=> b!1528777 (=> (not res!1045325) (not e!852273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528777 (= res!1045325 (validKeyInArray!0 (select (arr!49024 a!2804) j!70)))))

(declare-fun b!1528778 () Bool)

(declare-fun e!852277 () Bool)

(assert (=> b!1528778 (= e!852277 (not true))))

(assert (=> b!1528778 e!852275))

(declare-fun res!1045333 () Bool)

(assert (=> b!1528778 (=> (not res!1045333) (not e!852275))))

(assert (=> b!1528778 (= res!1045333 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50983 0))(
  ( (Unit!50984) )
))
(declare-fun lt!661966 () Unit!50983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101608 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50983)

(assert (=> b!1528778 (= lt!661966 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528779 () Bool)

(declare-fun e!852274 () Bool)

(assert (=> b!1528779 (= e!852273 e!852274)))

(declare-fun res!1045328 () Bool)

(assert (=> b!1528779 (=> (not res!1045328) (not e!852274))))

(declare-fun lt!661964 () SeekEntryResult!13082)

(declare-fun lt!661967 () SeekEntryResult!13082)

(assert (=> b!1528779 (= res!1045328 (= lt!661964 lt!661967))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528779 (= lt!661967 (Intermediate!13082 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13082)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528779 (= lt!661964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528780 () Bool)

(assert (=> b!1528780 (= e!852274 e!852277)))

(declare-fun res!1045326 () Bool)

(assert (=> b!1528780 (=> (not res!1045326) (not e!852277))))

(declare-fun lt!661965 () (_ BitVec 64))

(declare-fun lt!661968 () array!101608)

(assert (=> b!1528780 (= res!1045326 (= lt!661964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661965 mask!2512) lt!661965 lt!661968 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528780 (= lt!661965 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528780 (= lt!661968 (array!101609 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49575 a!2804)))))

(declare-fun b!1528781 () Bool)

(declare-fun e!852276 () Bool)

(declare-fun e!852271 () Bool)

(assert (=> b!1528781 (= e!852276 e!852271)))

(declare-fun res!1045332 () Bool)

(assert (=> b!1528781 (=> (not res!1045332) (not e!852271))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13082)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101608 (_ BitVec 32)) SeekEntryResult!13082)

(assert (=> b!1528781 (= res!1045332 (= (seekEntryOrOpen!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49024 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528782 () Bool)

(assert (=> b!1528782 (= e!852275 e!852276)))

(declare-fun res!1045323 () Bool)

(assert (=> b!1528782 (=> res!1045323 e!852276)))

(assert (=> b!1528782 (= res!1045323 (or (not (= (select (arr!49024 a!2804) j!70) lt!661965)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49024 a!2804) index!487) (select (arr!49024 a!2804) j!70)) (not (= (select (arr!49024 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528783 () Bool)

(declare-fun res!1045324 () Bool)

(assert (=> b!1528783 (=> (not res!1045324) (not e!852273))))

(assert (=> b!1528783 (= res!1045324 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49575 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49575 a!2804))))))

(declare-fun b!1528784 () Bool)

(declare-fun res!1045327 () Bool)

(assert (=> b!1528784 (=> (not res!1045327) (not e!852274))))

(assert (=> b!1528784 (= res!1045327 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!661967))))

(declare-fun b!1528785 () Bool)

(declare-fun res!1045331 () Bool)

(assert (=> b!1528785 (=> (not res!1045331) (not e!852273))))

(assert (=> b!1528785 (= res!1045331 (validKeyInArray!0 (select (arr!49024 a!2804) i!961)))))

(declare-fun b!1528786 () Bool)

(declare-fun res!1045329 () Bool)

(assert (=> b!1528786 (=> (not res!1045329) (not e!852273))))

(assert (=> b!1528786 (= res!1045329 (and (= (size!49575 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49575 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49575 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528787 () Bool)

(assert (=> b!1528787 (= e!852271 (= (seekEntryOrOpen!0 lt!661965 lt!661968 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661965 lt!661968 mask!2512)))))

(assert (= (and start!130458 res!1045330) b!1528786))

(assert (= (and b!1528786 res!1045329) b!1528785))

(assert (= (and b!1528785 res!1045331) b!1528777))

(assert (= (and b!1528777 res!1045325) b!1528774))

(assert (= (and b!1528774 res!1045322) b!1528775))

(assert (= (and b!1528775 res!1045335) b!1528783))

(assert (= (and b!1528783 res!1045324) b!1528779))

(assert (= (and b!1528779 res!1045328) b!1528784))

(assert (= (and b!1528784 res!1045327) b!1528780))

(assert (= (and b!1528780 res!1045326) b!1528778))

(assert (= (and b!1528778 res!1045333) b!1528776))

(assert (= (and b!1528776 res!1045334) b!1528782))

(assert (= (and b!1528782 (not res!1045323)) b!1528781))

(assert (= (and b!1528781 res!1045332) b!1528787))

(declare-fun m!1411429 () Bool)

(assert (=> b!1528785 m!1411429))

(assert (=> b!1528785 m!1411429))

(declare-fun m!1411431 () Bool)

(assert (=> b!1528785 m!1411431))

(declare-fun m!1411433 () Bool)

(assert (=> b!1528775 m!1411433))

(declare-fun m!1411435 () Bool)

(assert (=> b!1528784 m!1411435))

(assert (=> b!1528784 m!1411435))

(declare-fun m!1411437 () Bool)

(assert (=> b!1528784 m!1411437))

(assert (=> b!1528776 m!1411435))

(assert (=> b!1528776 m!1411435))

(declare-fun m!1411439 () Bool)

(assert (=> b!1528776 m!1411439))

(declare-fun m!1411441 () Bool)

(assert (=> b!1528787 m!1411441))

(declare-fun m!1411443 () Bool)

(assert (=> b!1528787 m!1411443))

(assert (=> b!1528777 m!1411435))

(assert (=> b!1528777 m!1411435))

(declare-fun m!1411445 () Bool)

(assert (=> b!1528777 m!1411445))

(declare-fun m!1411447 () Bool)

(assert (=> b!1528778 m!1411447))

(declare-fun m!1411449 () Bool)

(assert (=> b!1528778 m!1411449))

(assert (=> b!1528782 m!1411435))

(declare-fun m!1411451 () Bool)

(assert (=> b!1528782 m!1411451))

(declare-fun m!1411453 () Bool)

(assert (=> b!1528780 m!1411453))

(assert (=> b!1528780 m!1411453))

(declare-fun m!1411455 () Bool)

(assert (=> b!1528780 m!1411455))

(declare-fun m!1411457 () Bool)

(assert (=> b!1528780 m!1411457))

(declare-fun m!1411459 () Bool)

(assert (=> b!1528780 m!1411459))

(declare-fun m!1411461 () Bool)

(assert (=> start!130458 m!1411461))

(declare-fun m!1411463 () Bool)

(assert (=> start!130458 m!1411463))

(declare-fun m!1411465 () Bool)

(assert (=> b!1528774 m!1411465))

(assert (=> b!1528781 m!1411435))

(assert (=> b!1528781 m!1411435))

(declare-fun m!1411467 () Bool)

(assert (=> b!1528781 m!1411467))

(assert (=> b!1528781 m!1411435))

(declare-fun m!1411469 () Bool)

(assert (=> b!1528781 m!1411469))

(assert (=> b!1528779 m!1411435))

(assert (=> b!1528779 m!1411435))

(declare-fun m!1411471 () Bool)

(assert (=> b!1528779 m!1411471))

(assert (=> b!1528779 m!1411471))

(assert (=> b!1528779 m!1411435))

(declare-fun m!1411473 () Bool)

(assert (=> b!1528779 m!1411473))

(check-sat (not b!1528776) (not b!1528781) (not start!130458) (not b!1528774) (not b!1528779) (not b!1528777) (not b!1528787) (not b!1528784) (not b!1528775) (not b!1528778) (not b!1528785) (not b!1528780))
(check-sat)
