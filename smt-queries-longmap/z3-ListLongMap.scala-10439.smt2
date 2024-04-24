; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123038 () Bool)

(assert start!123038)

(declare-fun res!959752 () Bool)

(declare-fun e!805643 () Bool)

(assert (=> start!123038 (=> (not res!959752) (not e!805643))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123038 (= res!959752 (validMask!0 mask!2608))))

(assert (=> start!123038 e!805643))

(assert (=> start!123038 true))

(declare-datatypes ((array!97274 0))(
  ( (array!97275 (arr!46951 (Array (_ BitVec 32) (_ BitVec 64))) (size!47502 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97274)

(declare-fun array_inv!36232 (array!97274) Bool)

(assert (=> start!123038 (array_inv!36232 a!2831)))

(declare-fun b!1425192 () Bool)

(declare-fun e!805638 () Bool)

(assert (=> b!1425192 (= e!805643 e!805638)))

(declare-fun res!959750 () Bool)

(assert (=> b!1425192 (=> (not res!959750) (not e!805638))))

(declare-datatypes ((SeekEntryResult!11138 0))(
  ( (MissingZero!11138 (index!46944 (_ BitVec 32))) (Found!11138 (index!46945 (_ BitVec 32))) (Intermediate!11138 (undefined!11950 Bool) (index!46946 (_ BitVec 32)) (x!128741 (_ BitVec 32))) (Undefined!11138) (MissingVacant!11138 (index!46947 (_ BitVec 32))) )
))
(declare-fun lt!627776 () SeekEntryResult!11138)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97274 (_ BitVec 32)) SeekEntryResult!11138)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425192 (= res!959750 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46951 a!2831) j!81) mask!2608) (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627776))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425192 (= lt!627776 (Intermediate!11138 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425193 () Bool)

(declare-fun res!959741 () Bool)

(assert (=> b!1425193 (=> (not res!959741) (not e!805643))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425193 (= res!959741 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47502 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47502 a!2831))))))

(declare-fun b!1425194 () Bool)

(declare-fun e!805641 () Bool)

(assert (=> b!1425194 (= e!805638 e!805641)))

(declare-fun res!959754 () Bool)

(assert (=> b!1425194 (=> (not res!959754) (not e!805641))))

(declare-fun lt!627782 () array!97274)

(declare-fun lt!627779 () (_ BitVec 64))

(declare-fun lt!627777 () SeekEntryResult!11138)

(assert (=> b!1425194 (= res!959754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627779 mask!2608) lt!627779 lt!627782 mask!2608) lt!627777))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425194 (= lt!627777 (Intermediate!11138 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425194 (= lt!627779 (select (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425194 (= lt!627782 (array!97275 (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47502 a!2831)))))

(declare-fun b!1425195 () Bool)

(declare-fun res!959745 () Bool)

(assert (=> b!1425195 (=> (not res!959745) (not e!805643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425195 (= res!959745 (validKeyInArray!0 (select (arr!46951 a!2831) j!81)))))

(declare-fun b!1425196 () Bool)

(declare-fun res!959748 () Bool)

(assert (=> b!1425196 (=> (not res!959748) (not e!805641))))

(assert (=> b!1425196 (= res!959748 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425197 () Bool)

(declare-fun res!959753 () Bool)

(assert (=> b!1425197 (=> (not res!959753) (not e!805643))))

(assert (=> b!1425197 (= res!959753 (and (= (size!47502 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47502 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47502 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425198 () Bool)

(declare-fun res!959742 () Bool)

(assert (=> b!1425198 (=> (not res!959742) (not e!805643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97274 (_ BitVec 32)) Bool)

(assert (=> b!1425198 (= res!959742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425199 () Bool)

(declare-fun res!959747 () Bool)

(assert (=> b!1425199 (=> (not res!959747) (not e!805643))))

(declare-datatypes ((List!33448 0))(
  ( (Nil!33445) (Cons!33444 (h!34757 (_ BitVec 64)) (t!48134 List!33448)) )
))
(declare-fun arrayNoDuplicates!0 (array!97274 (_ BitVec 32) List!33448) Bool)

(assert (=> b!1425199 (= res!959747 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33445))))

(declare-fun b!1425200 () Bool)

(declare-fun e!805640 () Bool)

(assert (=> b!1425200 (= e!805640 true)))

(declare-fun lt!627780 () SeekEntryResult!11138)

(declare-fun lt!627781 () (_ BitVec 32))

(assert (=> b!1425200 (= lt!627780 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627781 lt!627779 lt!627782 mask!2608))))

(declare-fun b!1425201 () Bool)

(declare-fun e!805642 () Bool)

(assert (=> b!1425201 (= e!805642 e!805640)))

(declare-fun res!959743 () Bool)

(assert (=> b!1425201 (=> res!959743 e!805640)))

(assert (=> b!1425201 (= res!959743 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627781 #b00000000000000000000000000000000) (bvsge lt!627781 (size!47502 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425201 (= lt!627781 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425202 () Bool)

(declare-fun res!959755 () Bool)

(assert (=> b!1425202 (=> res!959755 e!805640)))

(assert (=> b!1425202 (= res!959755 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627781 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627776)))))

(declare-fun b!1425203 () Bool)

(declare-fun res!959746 () Bool)

(assert (=> b!1425203 (=> (not res!959746) (not e!805641))))

(assert (=> b!1425203 (= res!959746 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) lt!627776))))

(declare-fun e!805639 () Bool)

(declare-fun b!1425204 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97274 (_ BitVec 32)) SeekEntryResult!11138)

(assert (=> b!1425204 (= e!805639 (= (seekEntryOrOpen!0 (select (arr!46951 a!2831) j!81) a!2831 mask!2608) (Found!11138 j!81)))))

(declare-fun b!1425205 () Bool)

(assert (=> b!1425205 (= e!805641 (not e!805642))))

(declare-fun res!959749 () Bool)

(assert (=> b!1425205 (=> res!959749 e!805642)))

(assert (=> b!1425205 (= res!959749 (or (= (select (arr!46951 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46951 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46951 a!2831) index!585) (select (arr!46951 a!2831) j!81)) (= (select (store (arr!46951 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1425205 e!805639))

(declare-fun res!959744 () Bool)

(assert (=> b!1425205 (=> (not res!959744) (not e!805639))))

(assert (=> b!1425205 (= res!959744 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48143 0))(
  ( (Unit!48144) )
))
(declare-fun lt!627778 () Unit!48143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48143)

(assert (=> b!1425205 (= lt!627778 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425206 () Bool)

(declare-fun res!959751 () Bool)

(assert (=> b!1425206 (=> (not res!959751) (not e!805643))))

(assert (=> b!1425206 (= res!959751 (validKeyInArray!0 (select (arr!46951 a!2831) i!982)))))

(declare-fun b!1425207 () Bool)

(declare-fun res!959740 () Bool)

(assert (=> b!1425207 (=> (not res!959740) (not e!805641))))

(assert (=> b!1425207 (= res!959740 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627779 lt!627782 mask!2608) lt!627777))))

(assert (= (and start!123038 res!959752) b!1425197))

(assert (= (and b!1425197 res!959753) b!1425206))

(assert (= (and b!1425206 res!959751) b!1425195))

(assert (= (and b!1425195 res!959745) b!1425198))

(assert (= (and b!1425198 res!959742) b!1425199))

(assert (= (and b!1425199 res!959747) b!1425193))

(assert (= (and b!1425193 res!959741) b!1425192))

(assert (= (and b!1425192 res!959750) b!1425194))

(assert (= (and b!1425194 res!959754) b!1425203))

(assert (= (and b!1425203 res!959746) b!1425207))

(assert (= (and b!1425207 res!959740) b!1425196))

(assert (= (and b!1425196 res!959748) b!1425205))

(assert (= (and b!1425205 res!959744) b!1425204))

(assert (= (and b!1425205 (not res!959749)) b!1425201))

(assert (= (and b!1425201 (not res!959743)) b!1425202))

(assert (= (and b!1425202 (not res!959755)) b!1425200))

(declare-fun m!1315857 () Bool)

(assert (=> b!1425206 m!1315857))

(assert (=> b!1425206 m!1315857))

(declare-fun m!1315859 () Bool)

(assert (=> b!1425206 m!1315859))

(declare-fun m!1315861 () Bool)

(assert (=> b!1425199 m!1315861))

(declare-fun m!1315863 () Bool)

(assert (=> b!1425202 m!1315863))

(assert (=> b!1425202 m!1315863))

(declare-fun m!1315865 () Bool)

(assert (=> b!1425202 m!1315865))

(assert (=> b!1425192 m!1315863))

(assert (=> b!1425192 m!1315863))

(declare-fun m!1315867 () Bool)

(assert (=> b!1425192 m!1315867))

(assert (=> b!1425192 m!1315867))

(assert (=> b!1425192 m!1315863))

(declare-fun m!1315869 () Bool)

(assert (=> b!1425192 m!1315869))

(declare-fun m!1315871 () Bool)

(assert (=> b!1425205 m!1315871))

(declare-fun m!1315873 () Bool)

(assert (=> b!1425205 m!1315873))

(declare-fun m!1315875 () Bool)

(assert (=> b!1425205 m!1315875))

(declare-fun m!1315877 () Bool)

(assert (=> b!1425205 m!1315877))

(assert (=> b!1425205 m!1315863))

(declare-fun m!1315879 () Bool)

(assert (=> b!1425205 m!1315879))

(declare-fun m!1315881 () Bool)

(assert (=> b!1425201 m!1315881))

(declare-fun m!1315883 () Bool)

(assert (=> b!1425207 m!1315883))

(declare-fun m!1315885 () Bool)

(assert (=> start!123038 m!1315885))

(declare-fun m!1315887 () Bool)

(assert (=> start!123038 m!1315887))

(assert (=> b!1425204 m!1315863))

(assert (=> b!1425204 m!1315863))

(declare-fun m!1315889 () Bool)

(assert (=> b!1425204 m!1315889))

(declare-fun m!1315891 () Bool)

(assert (=> b!1425194 m!1315891))

(assert (=> b!1425194 m!1315891))

(declare-fun m!1315893 () Bool)

(assert (=> b!1425194 m!1315893))

(assert (=> b!1425194 m!1315871))

(declare-fun m!1315895 () Bool)

(assert (=> b!1425194 m!1315895))

(declare-fun m!1315897 () Bool)

(assert (=> b!1425198 m!1315897))

(assert (=> b!1425195 m!1315863))

(assert (=> b!1425195 m!1315863))

(declare-fun m!1315899 () Bool)

(assert (=> b!1425195 m!1315899))

(declare-fun m!1315901 () Bool)

(assert (=> b!1425200 m!1315901))

(assert (=> b!1425203 m!1315863))

(assert (=> b!1425203 m!1315863))

(declare-fun m!1315903 () Bool)

(assert (=> b!1425203 m!1315903))

(check-sat (not b!1425202) (not b!1425200) (not b!1425199) (not start!123038) (not b!1425204) (not b!1425194) (not b!1425207) (not b!1425206) (not b!1425203) (not b!1425198) (not b!1425195) (not b!1425192) (not b!1425201) (not b!1425205))
(check-sat)
