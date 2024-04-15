; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122792 () Bool)

(assert start!122792)

(declare-fun b!1423662 () Bool)

(declare-fun e!804677 () Bool)

(assert (=> b!1423662 (= e!804677 true)))

(declare-fun lt!627062 () (_ BitVec 32))

(declare-fun lt!627061 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11185 0))(
  ( (MissingZero!11185 (index!47132 (_ BitVec 32))) (Found!11185 (index!47133 (_ BitVec 32))) (Intermediate!11185 (undefined!11997 Bool) (index!47134 (_ BitVec 32)) (x!128760 (_ BitVec 32))) (Undefined!11185) (MissingVacant!11185 (index!47135 (_ BitVec 32))) )
))
(declare-fun lt!627057 () SeekEntryResult!11185)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((array!97110 0))(
  ( (array!97111 (arr!46873 (Array (_ BitVec 32) (_ BitVec 64))) (size!47425 (_ BitVec 32))) )
))
(declare-fun lt!627060 () array!97110)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97110 (_ BitVec 32)) SeekEntryResult!11185)

(assert (=> b!1423662 (= lt!627057 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627062 lt!627061 lt!627060 mask!2608))))

(declare-fun b!1423663 () Bool)

(declare-fun res!959161 () Bool)

(declare-fun e!804673 () Bool)

(assert (=> b!1423663 (=> (not res!959161) (not e!804673))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97110)

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423663 (= res!959161 (and (= (size!47425 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47425 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47425 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!959156 () Bool)

(assert (=> start!122792 (=> (not res!959156) (not e!804673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122792 (= res!959156 (validMask!0 mask!2608))))

(assert (=> start!122792 e!804673))

(assert (=> start!122792 true))

(declare-fun array_inv!36106 (array!97110) Bool)

(assert (=> start!122792 (array_inv!36106 a!2831)))

(declare-fun b!1423664 () Bool)

(declare-fun res!959151 () Bool)

(assert (=> b!1423664 (=> (not res!959151) (not e!804673))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423664 (= res!959151 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47425 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47425 a!2831))))))

(declare-fun b!1423665 () Bool)

(declare-fun e!804672 () Bool)

(assert (=> b!1423665 (= e!804672 e!804677)))

(declare-fun res!959159 () Bool)

(assert (=> b!1423665 (=> res!959159 e!804677)))

(assert (=> b!1423665 (= res!959159 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627062 #b00000000000000000000000000000000) (bvsge lt!627062 (size!47425 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423665 (= lt!627062 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423666 () Bool)

(declare-fun e!804675 () Bool)

(assert (=> b!1423666 (= e!804675 (not e!804672))))

(declare-fun res!959147 () Bool)

(assert (=> b!1423666 (=> res!959147 e!804672)))

(assert (=> b!1423666 (= res!959147 (or (= (select (arr!46873 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46873 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46873 a!2831) index!585) (select (arr!46873 a!2831) j!81)) (= (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804674 () Bool)

(assert (=> b!1423666 e!804674))

(declare-fun res!959152 () Bool)

(assert (=> b!1423666 (=> (not res!959152) (not e!804674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97110 (_ BitVec 32)) Bool)

(assert (=> b!1423666 (= res!959152 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48045 0))(
  ( (Unit!48046) )
))
(declare-fun lt!627056 () Unit!48045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48045)

(assert (=> b!1423666 (= lt!627056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423667 () Bool)

(declare-fun res!959149 () Bool)

(assert (=> b!1423667 (=> (not res!959149) (not e!804673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423667 (= res!959149 (validKeyInArray!0 (select (arr!46873 a!2831) i!982)))))

(declare-fun b!1423668 () Bool)

(declare-fun res!959157 () Bool)

(assert (=> b!1423668 (=> (not res!959157) (not e!804675))))

(declare-fun lt!627058 () SeekEntryResult!11185)

(assert (=> b!1423668 (= res!959157 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!627058))))

(declare-fun b!1423669 () Bool)

(declare-fun e!804676 () Bool)

(assert (=> b!1423669 (= e!804676 e!804675)))

(declare-fun res!959150 () Bool)

(assert (=> b!1423669 (=> (not res!959150) (not e!804675))))

(declare-fun lt!627059 () SeekEntryResult!11185)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423669 (= res!959150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627061 mask!2608) lt!627061 lt!627060 mask!2608) lt!627059))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423669 (= lt!627059 (Intermediate!11185 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423669 (= lt!627061 (select (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423669 (= lt!627060 (array!97111 (store (arr!46873 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47425 a!2831)))))

(declare-fun b!1423670 () Bool)

(declare-fun res!959154 () Bool)

(assert (=> b!1423670 (=> (not res!959154) (not e!804673))))

(declare-datatypes ((List!33461 0))(
  ( (Nil!33458) (Cons!33457 (h!34759 (_ BitVec 64)) (t!48147 List!33461)) )
))
(declare-fun arrayNoDuplicates!0 (array!97110 (_ BitVec 32) List!33461) Bool)

(assert (=> b!1423670 (= res!959154 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33458))))

(declare-fun b!1423671 () Bool)

(declare-fun res!959158 () Bool)

(assert (=> b!1423671 (=> (not res!959158) (not e!804673))))

(assert (=> b!1423671 (= res!959158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423672 () Bool)

(declare-fun res!959153 () Bool)

(assert (=> b!1423672 (=> (not res!959153) (not e!804675))))

(assert (=> b!1423672 (= res!959153 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627061 lt!627060 mask!2608) lt!627059))))

(declare-fun b!1423673 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97110 (_ BitVec 32)) SeekEntryResult!11185)

(assert (=> b!1423673 (= e!804674 (= (seekEntryOrOpen!0 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) (Found!11185 j!81)))))

(declare-fun b!1423674 () Bool)

(declare-fun res!959160 () Bool)

(assert (=> b!1423674 (=> (not res!959160) (not e!804675))))

(assert (=> b!1423674 (= res!959160 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423675 () Bool)

(declare-fun res!959148 () Bool)

(assert (=> b!1423675 (=> res!959148 e!804677)))

(assert (=> b!1423675 (= res!959148 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627062 (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!627058)))))

(declare-fun b!1423676 () Bool)

(declare-fun res!959155 () Bool)

(assert (=> b!1423676 (=> (not res!959155) (not e!804673))))

(assert (=> b!1423676 (= res!959155 (validKeyInArray!0 (select (arr!46873 a!2831) j!81)))))

(declare-fun b!1423677 () Bool)

(assert (=> b!1423677 (= e!804673 e!804676)))

(declare-fun res!959146 () Bool)

(assert (=> b!1423677 (=> (not res!959146) (not e!804676))))

(assert (=> b!1423677 (= res!959146 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46873 a!2831) j!81) mask!2608) (select (arr!46873 a!2831) j!81) a!2831 mask!2608) lt!627058))))

(assert (=> b!1423677 (= lt!627058 (Intermediate!11185 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122792 res!959156) b!1423663))

(assert (= (and b!1423663 res!959161) b!1423667))

(assert (= (and b!1423667 res!959149) b!1423676))

(assert (= (and b!1423676 res!959155) b!1423671))

(assert (= (and b!1423671 res!959158) b!1423670))

(assert (= (and b!1423670 res!959154) b!1423664))

(assert (= (and b!1423664 res!959151) b!1423677))

(assert (= (and b!1423677 res!959146) b!1423669))

(assert (= (and b!1423669 res!959150) b!1423668))

(assert (= (and b!1423668 res!959157) b!1423672))

(assert (= (and b!1423672 res!959153) b!1423674))

(assert (= (and b!1423674 res!959160) b!1423666))

(assert (= (and b!1423666 res!959152) b!1423673))

(assert (= (and b!1423666 (not res!959147)) b!1423665))

(assert (= (and b!1423665 (not res!959159)) b!1423675))

(assert (= (and b!1423675 (not res!959148)) b!1423662))

(declare-fun m!1313739 () Bool)

(assert (=> b!1423669 m!1313739))

(assert (=> b!1423669 m!1313739))

(declare-fun m!1313741 () Bool)

(assert (=> b!1423669 m!1313741))

(declare-fun m!1313743 () Bool)

(assert (=> b!1423669 m!1313743))

(declare-fun m!1313745 () Bool)

(assert (=> b!1423669 m!1313745))

(declare-fun m!1313747 () Bool)

(assert (=> b!1423673 m!1313747))

(assert (=> b!1423673 m!1313747))

(declare-fun m!1313749 () Bool)

(assert (=> b!1423673 m!1313749))

(declare-fun m!1313751 () Bool)

(assert (=> b!1423667 m!1313751))

(assert (=> b!1423667 m!1313751))

(declare-fun m!1313753 () Bool)

(assert (=> b!1423667 m!1313753))

(declare-fun m!1313755 () Bool)

(assert (=> b!1423665 m!1313755))

(assert (=> b!1423666 m!1313743))

(declare-fun m!1313757 () Bool)

(assert (=> b!1423666 m!1313757))

(declare-fun m!1313759 () Bool)

(assert (=> b!1423666 m!1313759))

(declare-fun m!1313761 () Bool)

(assert (=> b!1423666 m!1313761))

(assert (=> b!1423666 m!1313747))

(declare-fun m!1313763 () Bool)

(assert (=> b!1423666 m!1313763))

(declare-fun m!1313765 () Bool)

(assert (=> b!1423670 m!1313765))

(declare-fun m!1313767 () Bool)

(assert (=> b!1423671 m!1313767))

(declare-fun m!1313769 () Bool)

(assert (=> start!122792 m!1313769))

(declare-fun m!1313771 () Bool)

(assert (=> start!122792 m!1313771))

(assert (=> b!1423676 m!1313747))

(assert (=> b!1423676 m!1313747))

(declare-fun m!1313773 () Bool)

(assert (=> b!1423676 m!1313773))

(declare-fun m!1313775 () Bool)

(assert (=> b!1423672 m!1313775))

(declare-fun m!1313777 () Bool)

(assert (=> b!1423662 m!1313777))

(assert (=> b!1423675 m!1313747))

(assert (=> b!1423675 m!1313747))

(declare-fun m!1313779 () Bool)

(assert (=> b!1423675 m!1313779))

(assert (=> b!1423677 m!1313747))

(assert (=> b!1423677 m!1313747))

(declare-fun m!1313781 () Bool)

(assert (=> b!1423677 m!1313781))

(assert (=> b!1423677 m!1313781))

(assert (=> b!1423677 m!1313747))

(declare-fun m!1313783 () Bool)

(assert (=> b!1423677 m!1313783))

(assert (=> b!1423668 m!1313747))

(assert (=> b!1423668 m!1313747))

(declare-fun m!1313785 () Bool)

(assert (=> b!1423668 m!1313785))

(check-sat (not b!1423671) (not b!1423675) (not b!1423665) (not b!1423669) (not b!1423672) (not b!1423666) (not b!1423662) (not b!1423667) (not b!1423670) (not b!1423673) (not b!1423677) (not start!122792) (not b!1423676) (not b!1423668))
(check-sat)
