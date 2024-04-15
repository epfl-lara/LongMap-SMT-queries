; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120302 () Bool)

(assert start!120302)

(declare-datatypes ((array!95664 0))(
  ( (array!95665 (arr!46183 (Array (_ BitVec 32) (_ BitVec 64))) (size!46735 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95664)

(declare-fun lt!615736 () array!95664)

(declare-fun lt!615740 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10526 0))(
  ( (MissingZero!10526 (index!44481 (_ BitVec 32))) (Found!10526 (index!44482 (_ BitVec 32))) (Intermediate!10526 (undefined!11338 Bool) (index!44483 (_ BitVec 32)) (x!126126 (_ BitVec 32))) (Undefined!10526) (MissingVacant!10526 (index!44484 (_ BitVec 32))) )
))
(declare-fun lt!615739 () SeekEntryResult!10526)

(declare-fun e!792618 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1399976 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95664 (_ BitVec 32)) SeekEntryResult!10526)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95664 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1399976 (= e!792618 (= (seekEntryOrOpen!0 lt!615740 lt!615736 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126126 lt!615739) (index!44483 lt!615739) (index!44483 lt!615739) (select (arr!46183 a!2901) j!112) lt!615736 mask!2840)))))

(declare-fun b!1399977 () Bool)

(declare-fun res!938541 () Bool)

(declare-fun e!792614 () Bool)

(assert (=> b!1399977 (=> (not res!938541) (not e!792614))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1399977 (= res!938541 (validKeyInArray!0 (select (arr!46183 a!2901) i!1037)))))

(declare-fun b!1399978 () Bool)

(declare-fun res!938542 () Bool)

(assert (=> b!1399978 (=> (not res!938542) (not e!792614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95664 (_ BitVec 32)) Bool)

(assert (=> b!1399978 (= res!938542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1399979 () Bool)

(declare-fun e!792615 () Bool)

(assert (=> b!1399979 (= e!792615 true)))

(declare-fun lt!615741 () SeekEntryResult!10526)

(declare-fun lt!615738 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95664 (_ BitVec 32)) SeekEntryResult!10526)

(assert (=> b!1399979 (= lt!615741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615738 lt!615740 lt!615736 mask!2840))))

(declare-fun e!792620 () Bool)

(declare-fun b!1399980 () Bool)

(assert (=> b!1399980 (= e!792620 (= (seekEntryOrOpen!0 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) (Found!10526 j!112)))))

(declare-fun b!1399981 () Bool)

(declare-fun e!792617 () Bool)

(declare-fun e!792616 () Bool)

(assert (=> b!1399981 (= e!792617 e!792616)))

(declare-fun res!938547 () Bool)

(assert (=> b!1399981 (=> res!938547 e!792616)))

(declare-fun lt!615743 () SeekEntryResult!10526)

(get-info :version)

(assert (=> b!1399981 (= res!938547 (or (= lt!615743 lt!615739) (not ((_ is Intermediate!10526) lt!615739))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1399981 (= lt!615739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615740 mask!2840) lt!615740 lt!615736 mask!2840))))

(assert (=> b!1399981 (= lt!615740 (select (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1399981 (= lt!615736 (array!95665 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46735 a!2901)))))

(declare-fun b!1399982 () Bool)

(declare-fun res!938539 () Bool)

(assert (=> b!1399982 (=> (not res!938539) (not e!792614))))

(assert (=> b!1399982 (= res!938539 (and (= (size!46735 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46735 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46735 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1399983 () Bool)

(declare-fun res!938540 () Bool)

(assert (=> b!1399983 (=> (not res!938540) (not e!792614))))

(declare-datatypes ((List!32780 0))(
  ( (Nil!32777) (Cons!32776 (h!34024 (_ BitVec 64)) (t!47466 List!32780)) )
))
(declare-fun arrayNoDuplicates!0 (array!95664 (_ BitVec 32) List!32780) Bool)

(assert (=> b!1399983 (= res!938540 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32777))))

(declare-fun b!1399984 () Bool)

(assert (=> b!1399984 (= e!792616 e!792615)))

(declare-fun res!938545 () Bool)

(assert (=> b!1399984 (=> res!938545 e!792615)))

(assert (=> b!1399984 (= res!938545 (or (bvslt (x!126126 lt!615743) #b00000000000000000000000000000000) (bvsgt (x!126126 lt!615743) #b01111111111111111111111111111110) (bvslt (x!126126 lt!615739) #b00000000000000000000000000000000) (bvsgt (x!126126 lt!615739) #b01111111111111111111111111111110) (bvslt lt!615738 #b00000000000000000000000000000000) (bvsge lt!615738 (size!46735 a!2901)) (bvslt (index!44483 lt!615743) #b00000000000000000000000000000000) (bvsge (index!44483 lt!615743) (size!46735 a!2901)) (bvslt (index!44483 lt!615739) #b00000000000000000000000000000000) (bvsge (index!44483 lt!615739) (size!46735 a!2901)) (not (= lt!615743 (Intermediate!10526 false (index!44483 lt!615743) (x!126126 lt!615743)))) (not (= lt!615739 (Intermediate!10526 false (index!44483 lt!615739) (x!126126 lt!615739))))))))

(assert (=> b!1399984 e!792618))

(declare-fun res!938546 () Bool)

(assert (=> b!1399984 (=> (not res!938546) (not e!792618))))

(assert (=> b!1399984 (= res!938546 (and (not (undefined!11338 lt!615739)) (= (index!44483 lt!615739) i!1037) (bvslt (x!126126 lt!615739) (x!126126 lt!615743)) (= (select (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44483 lt!615739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46899 0))(
  ( (Unit!46900) )
))
(declare-fun lt!615742 () Unit!46899)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46899)

(assert (=> b!1399984 (= lt!615742 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615738 (x!126126 lt!615743) (index!44483 lt!615743) (x!126126 lt!615739) (index!44483 lt!615739) (undefined!11338 lt!615739) mask!2840))))

(declare-fun b!1399985 () Bool)

(declare-fun res!938544 () Bool)

(assert (=> b!1399985 (=> (not res!938544) (not e!792614))))

(assert (=> b!1399985 (= res!938544 (validKeyInArray!0 (select (arr!46183 a!2901) j!112)))))

(declare-fun res!938538 () Bool)

(assert (=> start!120302 (=> (not res!938538) (not e!792614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120302 (= res!938538 (validMask!0 mask!2840))))

(assert (=> start!120302 e!792614))

(assert (=> start!120302 true))

(declare-fun array_inv!35416 (array!95664) Bool)

(assert (=> start!120302 (array_inv!35416 a!2901)))

(declare-fun b!1399986 () Bool)

(assert (=> b!1399986 (= e!792614 (not e!792617))))

(declare-fun res!938548 () Bool)

(assert (=> b!1399986 (=> res!938548 e!792617)))

(assert (=> b!1399986 (= res!938548 (or (not ((_ is Intermediate!10526) lt!615743)) (undefined!11338 lt!615743)))))

(assert (=> b!1399986 e!792620))

(declare-fun res!938543 () Bool)

(assert (=> b!1399986 (=> (not res!938543) (not e!792620))))

(assert (=> b!1399986 (= res!938543 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615737 () Unit!46899)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95664 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46899)

(assert (=> b!1399986 (= lt!615737 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1399986 (= lt!615743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615738 (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1399986 (= lt!615738 (toIndex!0 (select (arr!46183 a!2901) j!112) mask!2840))))

(assert (= (and start!120302 res!938538) b!1399982))

(assert (= (and b!1399982 res!938539) b!1399977))

(assert (= (and b!1399977 res!938541) b!1399985))

(assert (= (and b!1399985 res!938544) b!1399978))

(assert (= (and b!1399978 res!938542) b!1399983))

(assert (= (and b!1399983 res!938540) b!1399986))

(assert (= (and b!1399986 res!938543) b!1399980))

(assert (= (and b!1399986 (not res!938548)) b!1399981))

(assert (= (and b!1399981 (not res!938547)) b!1399984))

(assert (= (and b!1399984 res!938546) b!1399976))

(assert (= (and b!1399984 (not res!938545)) b!1399979))

(declare-fun m!1286845 () Bool)

(assert (=> b!1399978 m!1286845))

(declare-fun m!1286847 () Bool)

(assert (=> b!1399979 m!1286847))

(declare-fun m!1286849 () Bool)

(assert (=> b!1399976 m!1286849))

(declare-fun m!1286851 () Bool)

(assert (=> b!1399976 m!1286851))

(assert (=> b!1399976 m!1286851))

(declare-fun m!1286853 () Bool)

(assert (=> b!1399976 m!1286853))

(assert (=> b!1399980 m!1286851))

(assert (=> b!1399980 m!1286851))

(declare-fun m!1286855 () Bool)

(assert (=> b!1399980 m!1286855))

(assert (=> b!1399985 m!1286851))

(assert (=> b!1399985 m!1286851))

(declare-fun m!1286857 () Bool)

(assert (=> b!1399985 m!1286857))

(declare-fun m!1286859 () Bool)

(assert (=> b!1399984 m!1286859))

(declare-fun m!1286861 () Bool)

(assert (=> b!1399984 m!1286861))

(declare-fun m!1286863 () Bool)

(assert (=> b!1399984 m!1286863))

(declare-fun m!1286865 () Bool)

(assert (=> start!120302 m!1286865))

(declare-fun m!1286867 () Bool)

(assert (=> start!120302 m!1286867))

(declare-fun m!1286869 () Bool)

(assert (=> b!1399981 m!1286869))

(assert (=> b!1399981 m!1286869))

(declare-fun m!1286871 () Bool)

(assert (=> b!1399981 m!1286871))

(assert (=> b!1399981 m!1286859))

(declare-fun m!1286873 () Bool)

(assert (=> b!1399981 m!1286873))

(declare-fun m!1286875 () Bool)

(assert (=> b!1399983 m!1286875))

(assert (=> b!1399986 m!1286851))

(declare-fun m!1286877 () Bool)

(assert (=> b!1399986 m!1286877))

(assert (=> b!1399986 m!1286851))

(assert (=> b!1399986 m!1286851))

(declare-fun m!1286879 () Bool)

(assert (=> b!1399986 m!1286879))

(declare-fun m!1286881 () Bool)

(assert (=> b!1399986 m!1286881))

(declare-fun m!1286883 () Bool)

(assert (=> b!1399986 m!1286883))

(declare-fun m!1286885 () Bool)

(assert (=> b!1399977 m!1286885))

(assert (=> b!1399977 m!1286885))

(declare-fun m!1286887 () Bool)

(assert (=> b!1399977 m!1286887))

(check-sat (not b!1399979) (not b!1399981) (not b!1399976) (not b!1399980) (not b!1399984) (not b!1399977) (not b!1399983) (not b!1399986) (not start!120302) (not b!1399985) (not b!1399978))
(check-sat)
