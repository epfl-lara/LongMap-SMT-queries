; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122774 () Bool)

(assert start!122774)

(declare-fun b!1423215 () Bool)

(declare-fun res!958655 () Bool)

(declare-fun e!804479 () Bool)

(assert (=> b!1423215 (=> (not res!958655) (not e!804479))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97139 0))(
  ( (array!97140 (arr!46887 (Array (_ BitVec 32) (_ BitVec 64))) (size!47437 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97139)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423215 (= res!958655 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47437 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47437 a!2831))))))

(declare-fun b!1423216 () Bool)

(declare-fun res!958648 () Bool)

(declare-fun e!804482 () Bool)

(assert (=> b!1423216 (=> (not res!958648) (not e!804482))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11172 0))(
  ( (MissingZero!11172 (index!47080 (_ BitVec 32))) (Found!11172 (index!47081 (_ BitVec 32))) (Intermediate!11172 (undefined!11984 Bool) (index!47082 (_ BitVec 32)) (x!128718 (_ BitVec 32))) (Undefined!11172) (MissingVacant!11172 (index!47083 (_ BitVec 32))) )
))
(declare-fun lt!627020 () SeekEntryResult!11172)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97139 (_ BitVec 32)) SeekEntryResult!11172)

(assert (=> b!1423216 (= res!958648 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46887 a!2831) j!81) a!2831 mask!2608) lt!627020))))

(declare-fun b!1423217 () Bool)

(declare-fun res!958651 () Bool)

(declare-fun e!804480 () Bool)

(assert (=> b!1423217 (=> res!958651 e!804480)))

(declare-fun lt!627017 () (_ BitVec 32))

(assert (=> b!1423217 (= res!958651 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627017 (select (arr!46887 a!2831) j!81) a!2831 mask!2608) lt!627020)))))

(declare-fun b!1423218 () Bool)

(declare-fun res!958654 () Bool)

(assert (=> b!1423218 (=> (not res!958654) (not e!804479))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423218 (= res!958654 (validKeyInArray!0 (select (arr!46887 a!2831) i!982)))))

(declare-fun b!1423219 () Bool)

(declare-fun res!958662 () Bool)

(assert (=> b!1423219 (=> (not res!958662) (not e!804482))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1423219 (= res!958662 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun e!804485 () Bool)

(declare-fun b!1423220 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97139 (_ BitVec 32)) SeekEntryResult!11172)

(assert (=> b!1423220 (= e!804485 (= (seekEntryOrOpen!0 (select (arr!46887 a!2831) j!81) a!2831 mask!2608) (Found!11172 j!81)))))

(declare-fun b!1423221 () Bool)

(declare-fun res!958663 () Bool)

(assert (=> b!1423221 (=> (not res!958663) (not e!804479))))

(assert (=> b!1423221 (= res!958663 (and (= (size!47437 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47437 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47437 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423222 () Bool)

(declare-fun res!958652 () Bool)

(assert (=> b!1423222 (=> (not res!958652) (not e!804479))))

(declare-datatypes ((List!33397 0))(
  ( (Nil!33394) (Cons!33393 (h!34695 (_ BitVec 64)) (t!48091 List!33397)) )
))
(declare-fun arrayNoDuplicates!0 (array!97139 (_ BitVec 32) List!33397) Bool)

(assert (=> b!1423222 (= res!958652 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33394))))

(declare-fun b!1423223 () Bool)

(declare-fun e!804481 () Bool)

(assert (=> b!1423223 (= e!804482 (not e!804481))))

(declare-fun res!958653 () Bool)

(assert (=> b!1423223 (=> res!958653 e!804481)))

(assert (=> b!1423223 (= res!958653 (or (= (select (arr!46887 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46887 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46887 a!2831) index!585) (select (arr!46887 a!2831) j!81)) (= (select (store (arr!46887 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423223 e!804485))

(declare-fun res!958661 () Bool)

(assert (=> b!1423223 (=> (not res!958661) (not e!804485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97139 (_ BitVec 32)) Bool)

(assert (=> b!1423223 (= res!958661 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48180 0))(
  ( (Unit!48181) )
))
(declare-fun lt!627021 () Unit!48180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97139 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48180)

(assert (=> b!1423223 (= lt!627021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423224 () Bool)

(assert (=> b!1423224 (= e!804480 true)))

(declare-fun lt!627018 () (_ BitVec 64))

(declare-fun lt!627016 () SeekEntryResult!11172)

(declare-fun lt!627015 () array!97139)

(assert (=> b!1423224 (= lt!627016 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627017 lt!627018 lt!627015 mask!2608))))

(declare-fun res!958660 () Bool)

(assert (=> start!122774 (=> (not res!958660) (not e!804479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122774 (= res!958660 (validMask!0 mask!2608))))

(assert (=> start!122774 e!804479))

(assert (=> start!122774 true))

(declare-fun array_inv!35915 (array!97139) Bool)

(assert (=> start!122774 (array_inv!35915 a!2831)))

(declare-fun b!1423225 () Bool)

(declare-fun e!804484 () Bool)

(assert (=> b!1423225 (= e!804484 e!804482)))

(declare-fun res!958656 () Bool)

(assert (=> b!1423225 (=> (not res!958656) (not e!804482))))

(declare-fun lt!627019 () SeekEntryResult!11172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423225 (= res!958656 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627018 mask!2608) lt!627018 lt!627015 mask!2608) lt!627019))))

(assert (=> b!1423225 (= lt!627019 (Intermediate!11172 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423225 (= lt!627018 (select (store (arr!46887 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423225 (= lt!627015 (array!97140 (store (arr!46887 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47437 a!2831)))))

(declare-fun b!1423226 () Bool)

(declare-fun res!958659 () Bool)

(assert (=> b!1423226 (=> (not res!958659) (not e!804479))))

(assert (=> b!1423226 (= res!958659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423227 () Bool)

(declare-fun res!958650 () Bool)

(assert (=> b!1423227 (=> (not res!958650) (not e!804482))))

(assert (=> b!1423227 (= res!958650 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627018 lt!627015 mask!2608) lt!627019))))

(declare-fun b!1423228 () Bool)

(assert (=> b!1423228 (= e!804479 e!804484)))

(declare-fun res!958657 () Bool)

(assert (=> b!1423228 (=> (not res!958657) (not e!804484))))

(assert (=> b!1423228 (= res!958657 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46887 a!2831) j!81) mask!2608) (select (arr!46887 a!2831) j!81) a!2831 mask!2608) lt!627020))))

(assert (=> b!1423228 (= lt!627020 (Intermediate!11172 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423229 () Bool)

(declare-fun res!958658 () Bool)

(assert (=> b!1423229 (=> (not res!958658) (not e!804479))))

(assert (=> b!1423229 (= res!958658 (validKeyInArray!0 (select (arr!46887 a!2831) j!81)))))

(declare-fun b!1423230 () Bool)

(assert (=> b!1423230 (= e!804481 e!804480)))

(declare-fun res!958649 () Bool)

(assert (=> b!1423230 (=> res!958649 e!804480)))

(assert (=> b!1423230 (= res!958649 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627017 #b00000000000000000000000000000000) (bvsge lt!627017 (size!47437 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423230 (= lt!627017 (nextIndex!0 index!585 x!605 mask!2608))))

(assert (= (and start!122774 res!958660) b!1423221))

(assert (= (and b!1423221 res!958663) b!1423218))

(assert (= (and b!1423218 res!958654) b!1423229))

(assert (= (and b!1423229 res!958658) b!1423226))

(assert (= (and b!1423226 res!958659) b!1423222))

(assert (= (and b!1423222 res!958652) b!1423215))

(assert (= (and b!1423215 res!958655) b!1423228))

(assert (= (and b!1423228 res!958657) b!1423225))

(assert (= (and b!1423225 res!958656) b!1423216))

(assert (= (and b!1423216 res!958648) b!1423227))

(assert (= (and b!1423227 res!958650) b!1423219))

(assert (= (and b!1423219 res!958662) b!1423223))

(assert (= (and b!1423223 res!958661) b!1423220))

(assert (= (and b!1423223 (not res!958653)) b!1423230))

(assert (= (and b!1423230 (not res!958649)) b!1423217))

(assert (= (and b!1423217 (not res!958651)) b!1423224))

(declare-fun m!1313763 () Bool)

(assert (=> b!1423228 m!1313763))

(assert (=> b!1423228 m!1313763))

(declare-fun m!1313765 () Bool)

(assert (=> b!1423228 m!1313765))

(assert (=> b!1423228 m!1313765))

(assert (=> b!1423228 m!1313763))

(declare-fun m!1313767 () Bool)

(assert (=> b!1423228 m!1313767))

(declare-fun m!1313769 () Bool)

(assert (=> b!1423227 m!1313769))

(declare-fun m!1313771 () Bool)

(assert (=> b!1423230 m!1313771))

(declare-fun m!1313773 () Bool)

(assert (=> start!122774 m!1313773))

(declare-fun m!1313775 () Bool)

(assert (=> start!122774 m!1313775))

(assert (=> b!1423217 m!1313763))

(assert (=> b!1423217 m!1313763))

(declare-fun m!1313777 () Bool)

(assert (=> b!1423217 m!1313777))

(declare-fun m!1313779 () Bool)

(assert (=> b!1423218 m!1313779))

(assert (=> b!1423218 m!1313779))

(declare-fun m!1313781 () Bool)

(assert (=> b!1423218 m!1313781))

(assert (=> b!1423220 m!1313763))

(assert (=> b!1423220 m!1313763))

(declare-fun m!1313783 () Bool)

(assert (=> b!1423220 m!1313783))

(declare-fun m!1313785 () Bool)

(assert (=> b!1423226 m!1313785))

(declare-fun m!1313787 () Bool)

(assert (=> b!1423223 m!1313787))

(declare-fun m!1313789 () Bool)

(assert (=> b!1423223 m!1313789))

(declare-fun m!1313791 () Bool)

(assert (=> b!1423223 m!1313791))

(declare-fun m!1313793 () Bool)

(assert (=> b!1423223 m!1313793))

(assert (=> b!1423223 m!1313763))

(declare-fun m!1313795 () Bool)

(assert (=> b!1423223 m!1313795))

(assert (=> b!1423216 m!1313763))

(assert (=> b!1423216 m!1313763))

(declare-fun m!1313797 () Bool)

(assert (=> b!1423216 m!1313797))

(declare-fun m!1313799 () Bool)

(assert (=> b!1423224 m!1313799))

(declare-fun m!1313801 () Bool)

(assert (=> b!1423222 m!1313801))

(assert (=> b!1423229 m!1313763))

(assert (=> b!1423229 m!1313763))

(declare-fun m!1313803 () Bool)

(assert (=> b!1423229 m!1313803))

(declare-fun m!1313805 () Bool)

(assert (=> b!1423225 m!1313805))

(assert (=> b!1423225 m!1313805))

(declare-fun m!1313807 () Bool)

(assert (=> b!1423225 m!1313807))

(assert (=> b!1423225 m!1313787))

(declare-fun m!1313809 () Bool)

(assert (=> b!1423225 m!1313809))

(check-sat (not b!1423229) (not b!1423217) (not b!1423220) (not b!1423227) (not b!1423225) (not start!122774) (not b!1423222) (not b!1423224) (not b!1423218) (not b!1423216) (not b!1423228) (not b!1423226) (not b!1423230) (not b!1423223))
(check-sat)
