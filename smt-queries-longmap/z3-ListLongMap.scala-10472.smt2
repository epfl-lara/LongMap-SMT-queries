; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123152 () Bool)

(assert start!123152)

(declare-fun b!1427967 () Bool)

(declare-fun res!962850 () Bool)

(declare-fun e!806494 () Bool)

(assert (=> b!1427967 (=> (not res!962850) (not e!806494))))

(declare-datatypes ((array!97317 0))(
  ( (array!97318 (arr!46972 (Array (_ BitVec 32) (_ BitVec 64))) (size!47524 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97317)

(declare-datatypes ((List!33560 0))(
  ( (Nil!33557) (Cons!33556 (h!34867 (_ BitVec 64)) (t!48246 List!33560)) )
))
(declare-fun arrayNoDuplicates!0 (array!97317 (_ BitVec 32) List!33560) Bool)

(assert (=> b!1427967 (= res!962850 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33557))))

(declare-fun b!1427968 () Bool)

(declare-fun res!962860 () Bool)

(assert (=> b!1427968 (=> (not res!962860) (not e!806494))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1427968 (= res!962860 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47524 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47524 a!2831))))))

(declare-fun b!1427969 () Bool)

(declare-fun res!962853 () Bool)

(declare-fun e!806497 () Bool)

(assert (=> b!1427969 (=> (not res!962853) (not e!806497))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!628629 () array!97317)

(declare-datatypes ((SeekEntryResult!11278 0))(
  ( (MissingZero!11278 (index!47504 (_ BitVec 32))) (Found!11278 (index!47505 (_ BitVec 32))) (Intermediate!11278 (undefined!12090 Bool) (index!47506 (_ BitVec 32)) (x!129135 (_ BitVec 32))) (Undefined!11278) (MissingVacant!11278 (index!47507 (_ BitVec 32))) )
))
(declare-fun lt!628630 () SeekEntryResult!11278)

(declare-fun lt!628631 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97317 (_ BitVec 32)) SeekEntryResult!11278)

(assert (=> b!1427969 (= res!962853 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628631 lt!628629 mask!2608) lt!628630))))

(declare-fun res!962857 () Bool)

(assert (=> start!123152 (=> (not res!962857) (not e!806494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123152 (= res!962857 (validMask!0 mask!2608))))

(assert (=> start!123152 e!806494))

(assert (=> start!123152 true))

(declare-fun array_inv!36205 (array!97317) Bool)

(assert (=> start!123152 (array_inv!36205 a!2831)))

(declare-fun b!1427970 () Bool)

(assert (=> b!1427970 (= e!806497 (not true))))

(declare-fun e!806496 () Bool)

(assert (=> b!1427970 e!806496))

(declare-fun res!962848 () Bool)

(assert (=> b!1427970 (=> (not res!962848) (not e!806496))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97317 (_ BitVec 32)) Bool)

(assert (=> b!1427970 (= res!962848 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48141 0))(
  ( (Unit!48142) )
))
(declare-fun lt!628627 () Unit!48141)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48141)

(assert (=> b!1427970 (= lt!628627 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1427971 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97317 (_ BitVec 32)) SeekEntryResult!11278)

(assert (=> b!1427971 (= e!806496 (= (seekEntryOrOpen!0 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) (Found!11278 j!81)))))

(declare-fun b!1427972 () Bool)

(declare-fun res!962858 () Bool)

(assert (=> b!1427972 (=> (not res!962858) (not e!806497))))

(declare-fun lt!628628 () SeekEntryResult!11278)

(assert (=> b!1427972 (= res!962858 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628628))))

(declare-fun b!1427973 () Bool)

(declare-fun res!962849 () Bool)

(assert (=> b!1427973 (=> (not res!962849) (not e!806494))))

(assert (=> b!1427973 (= res!962849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1427974 () Bool)

(declare-fun res!962854 () Bool)

(assert (=> b!1427974 (=> (not res!962854) (not e!806497))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1427974 (= res!962854 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1427975 () Bool)

(declare-fun e!806498 () Bool)

(assert (=> b!1427975 (= e!806498 e!806497)))

(declare-fun res!962856 () Bool)

(assert (=> b!1427975 (=> (not res!962856) (not e!806497))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1427975 (= res!962856 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628631 mask!2608) lt!628631 lt!628629 mask!2608) lt!628630))))

(assert (=> b!1427975 (= lt!628630 (Intermediate!11278 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1427975 (= lt!628631 (select (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1427975 (= lt!628629 (array!97318 (store (arr!46972 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47524 a!2831)))))

(declare-fun b!1427976 () Bool)

(declare-fun res!962859 () Bool)

(assert (=> b!1427976 (=> (not res!962859) (not e!806494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1427976 (= res!962859 (validKeyInArray!0 (select (arr!46972 a!2831) i!982)))))

(declare-fun b!1427977 () Bool)

(assert (=> b!1427977 (= e!806494 e!806498)))

(declare-fun res!962855 () Bool)

(assert (=> b!1427977 (=> (not res!962855) (not e!806498))))

(assert (=> b!1427977 (= res!962855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46972 a!2831) j!81) mask!2608) (select (arr!46972 a!2831) j!81) a!2831 mask!2608) lt!628628))))

(assert (=> b!1427977 (= lt!628628 (Intermediate!11278 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1427978 () Bool)

(declare-fun res!962851 () Bool)

(assert (=> b!1427978 (=> (not res!962851) (not e!806494))))

(assert (=> b!1427978 (= res!962851 (validKeyInArray!0 (select (arr!46972 a!2831) j!81)))))

(declare-fun b!1427979 () Bool)

(declare-fun res!962852 () Bool)

(assert (=> b!1427979 (=> (not res!962852) (not e!806494))))

(assert (=> b!1427979 (= res!962852 (and (= (size!47524 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47524 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47524 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123152 res!962857) b!1427979))

(assert (= (and b!1427979 res!962852) b!1427976))

(assert (= (and b!1427976 res!962859) b!1427978))

(assert (= (and b!1427978 res!962851) b!1427973))

(assert (= (and b!1427973 res!962849) b!1427967))

(assert (= (and b!1427967 res!962850) b!1427968))

(assert (= (and b!1427968 res!962860) b!1427977))

(assert (= (and b!1427977 res!962855) b!1427975))

(assert (= (and b!1427975 res!962856) b!1427972))

(assert (= (and b!1427972 res!962858) b!1427969))

(assert (= (and b!1427969 res!962853) b!1427974))

(assert (= (and b!1427974 res!962854) b!1427970))

(assert (= (and b!1427970 res!962848) b!1427971))

(declare-fun m!1317741 () Bool)

(assert (=> b!1427975 m!1317741))

(assert (=> b!1427975 m!1317741))

(declare-fun m!1317743 () Bool)

(assert (=> b!1427975 m!1317743))

(declare-fun m!1317745 () Bool)

(assert (=> b!1427975 m!1317745))

(declare-fun m!1317747 () Bool)

(assert (=> b!1427975 m!1317747))

(declare-fun m!1317749 () Bool)

(assert (=> b!1427978 m!1317749))

(assert (=> b!1427978 m!1317749))

(declare-fun m!1317751 () Bool)

(assert (=> b!1427978 m!1317751))

(declare-fun m!1317753 () Bool)

(assert (=> b!1427967 m!1317753))

(assert (=> b!1427972 m!1317749))

(assert (=> b!1427972 m!1317749))

(declare-fun m!1317755 () Bool)

(assert (=> b!1427972 m!1317755))

(declare-fun m!1317757 () Bool)

(assert (=> b!1427973 m!1317757))

(declare-fun m!1317759 () Bool)

(assert (=> b!1427970 m!1317759))

(declare-fun m!1317761 () Bool)

(assert (=> b!1427970 m!1317761))

(declare-fun m!1317763 () Bool)

(assert (=> b!1427976 m!1317763))

(assert (=> b!1427976 m!1317763))

(declare-fun m!1317765 () Bool)

(assert (=> b!1427976 m!1317765))

(assert (=> b!1427971 m!1317749))

(assert (=> b!1427971 m!1317749))

(declare-fun m!1317767 () Bool)

(assert (=> b!1427971 m!1317767))

(declare-fun m!1317769 () Bool)

(assert (=> b!1427969 m!1317769))

(assert (=> b!1427977 m!1317749))

(assert (=> b!1427977 m!1317749))

(declare-fun m!1317771 () Bool)

(assert (=> b!1427977 m!1317771))

(assert (=> b!1427977 m!1317771))

(assert (=> b!1427977 m!1317749))

(declare-fun m!1317773 () Bool)

(assert (=> b!1427977 m!1317773))

(declare-fun m!1317775 () Bool)

(assert (=> start!123152 m!1317775))

(declare-fun m!1317777 () Bool)

(assert (=> start!123152 m!1317777))

(check-sat (not start!123152) (not b!1427969) (not b!1427977) (not b!1427975) (not b!1427967) (not b!1427973) (not b!1427971) (not b!1427972) (not b!1427970) (not b!1427976) (not b!1427978))
(check-sat)
