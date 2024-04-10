; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120322 () Bool)

(assert start!120322)

(declare-fun b!1400321 () Bool)

(declare-fun res!938835 () Bool)

(declare-fun e!792821 () Bool)

(assert (=> b!1400321 (=> (not res!938835) (not e!792821))))

(declare-datatypes ((array!95731 0))(
  ( (array!95732 (arr!46216 (Array (_ BitVec 32) (_ BitVec 64))) (size!46766 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95731)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400321 (= res!938835 (validKeyInArray!0 (select (arr!46216 a!2901) j!112)))))

(declare-fun b!1400322 () Bool)

(declare-fun e!792822 () Bool)

(assert (=> b!1400322 (= e!792821 (not e!792822))))

(declare-fun res!938833 () Bool)

(assert (=> b!1400322 (=> res!938833 e!792822)))

(declare-datatypes ((SeekEntryResult!10533 0))(
  ( (MissingZero!10533 (index!44509 (_ BitVec 32))) (Found!10533 (index!44510 (_ BitVec 32))) (Intermediate!10533 (undefined!11345 Bool) (index!44511 (_ BitVec 32)) (x!126152 (_ BitVec 32))) (Undefined!10533) (MissingVacant!10533 (index!44512 (_ BitVec 32))) )
))
(declare-fun lt!616124 () SeekEntryResult!10533)

(assert (=> b!1400322 (= res!938833 (or (not (is-Intermediate!10533 lt!616124)) (undefined!11345 lt!616124)))))

(declare-fun e!792827 () Bool)

(assert (=> b!1400322 e!792827))

(declare-fun res!938837 () Bool)

(assert (=> b!1400322 (=> (not res!938837) (not e!792827))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95731 (_ BitVec 32)) Bool)

(assert (=> b!1400322 (= res!938837 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47070 0))(
  ( (Unit!47071) )
))
(declare-fun lt!616125 () Unit!47070)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47070)

(assert (=> b!1400322 (= lt!616125 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616118 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95731 (_ BitVec 32)) SeekEntryResult!10533)

(assert (=> b!1400322 (= lt!616124 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616118 (select (arr!46216 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400322 (= lt!616118 (toIndex!0 (select (arr!46216 a!2901) j!112) mask!2840))))

(declare-fun b!1400323 () Bool)

(declare-fun res!938839 () Bool)

(assert (=> b!1400323 (=> (not res!938839) (not e!792821))))

(assert (=> b!1400323 (= res!938839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400324 () Bool)

(declare-fun e!792823 () Bool)

(assert (=> b!1400324 (= e!792822 e!792823)))

(declare-fun res!938832 () Bool)

(assert (=> b!1400324 (=> res!938832 e!792823)))

(declare-fun lt!616120 () SeekEntryResult!10533)

(assert (=> b!1400324 (= res!938832 (or (= lt!616124 lt!616120) (not (is-Intermediate!10533 lt!616120))))))

(declare-fun lt!616122 () array!95731)

(declare-fun lt!616119 () (_ BitVec 64))

(assert (=> b!1400324 (= lt!616120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616119 mask!2840) lt!616119 lt!616122 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400324 (= lt!616119 (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400324 (= lt!616122 (array!95732 (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46766 a!2901)))))

(declare-fun b!1400325 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95731 (_ BitVec 32)) SeekEntryResult!10533)

(assert (=> b!1400325 (= e!792827 (= (seekEntryOrOpen!0 (select (arr!46216 a!2901) j!112) a!2901 mask!2840) (Found!10533 j!112)))))

(declare-fun b!1400326 () Bool)

(declare-fun res!938842 () Bool)

(assert (=> b!1400326 (=> (not res!938842) (not e!792821))))

(assert (=> b!1400326 (= res!938842 (validKeyInArray!0 (select (arr!46216 a!2901) i!1037)))))

(declare-fun b!1400327 () Bool)

(declare-fun res!938834 () Bool)

(assert (=> b!1400327 (=> (not res!938834) (not e!792821))))

(assert (=> b!1400327 (= res!938834 (and (= (size!46766 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46766 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46766 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400328 () Bool)

(declare-fun e!792824 () Bool)

(assert (=> b!1400328 (= e!792824 true)))

(declare-fun lt!616121 () SeekEntryResult!10533)

(assert (=> b!1400328 (= lt!616121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616118 lt!616119 lt!616122 mask!2840))))

(declare-fun res!938836 () Bool)

(assert (=> start!120322 (=> (not res!938836) (not e!792821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120322 (= res!938836 (validMask!0 mask!2840))))

(assert (=> start!120322 e!792821))

(assert (=> start!120322 true))

(declare-fun array_inv!35244 (array!95731) Bool)

(assert (=> start!120322 (array_inv!35244 a!2901)))

(declare-fun b!1400329 () Bool)

(assert (=> b!1400329 (= e!792823 e!792824)))

(declare-fun res!938838 () Bool)

(assert (=> b!1400329 (=> res!938838 e!792824)))

(assert (=> b!1400329 (= res!938838 (or (bvslt (x!126152 lt!616124) #b00000000000000000000000000000000) (bvsgt (x!126152 lt!616124) #b01111111111111111111111111111110) (bvslt (x!126152 lt!616120) #b00000000000000000000000000000000) (bvsgt (x!126152 lt!616120) #b01111111111111111111111111111110) (bvslt lt!616118 #b00000000000000000000000000000000) (bvsge lt!616118 (size!46766 a!2901)) (bvslt (index!44511 lt!616124) #b00000000000000000000000000000000) (bvsge (index!44511 lt!616124) (size!46766 a!2901)) (bvslt (index!44511 lt!616120) #b00000000000000000000000000000000) (bvsge (index!44511 lt!616120) (size!46766 a!2901)) (not (= lt!616124 (Intermediate!10533 false (index!44511 lt!616124) (x!126152 lt!616124)))) (not (= lt!616120 (Intermediate!10533 false (index!44511 lt!616120) (x!126152 lt!616120))))))))

(declare-fun e!792825 () Bool)

(assert (=> b!1400329 e!792825))

(declare-fun res!938841 () Bool)

(assert (=> b!1400329 (=> (not res!938841) (not e!792825))))

(assert (=> b!1400329 (= res!938841 (and (not (undefined!11345 lt!616120)) (= (index!44511 lt!616120) i!1037) (bvslt (x!126152 lt!616120) (x!126152 lt!616124)) (= (select (store (arr!46216 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44511 lt!616120)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616123 () Unit!47070)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47070)

(assert (=> b!1400329 (= lt!616123 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616118 (x!126152 lt!616124) (index!44511 lt!616124) (x!126152 lt!616120) (index!44511 lt!616120) (undefined!11345 lt!616120) mask!2840))))

(declare-fun b!1400330 () Bool)

(declare-fun res!938840 () Bool)

(assert (=> b!1400330 (=> (not res!938840) (not e!792821))))

(declare-datatypes ((List!32735 0))(
  ( (Nil!32732) (Cons!32731 (h!33979 (_ BitVec 64)) (t!47429 List!32735)) )
))
(declare-fun arrayNoDuplicates!0 (array!95731 (_ BitVec 32) List!32735) Bool)

(assert (=> b!1400330 (= res!938840 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32732))))

(declare-fun b!1400331 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95731 (_ BitVec 32)) SeekEntryResult!10533)

(assert (=> b!1400331 (= e!792825 (= (seekEntryOrOpen!0 lt!616119 lt!616122 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126152 lt!616120) (index!44511 lt!616120) (index!44511 lt!616120) (select (arr!46216 a!2901) j!112) lt!616122 mask!2840)))))

(assert (= (and start!120322 res!938836) b!1400327))

(assert (= (and b!1400327 res!938834) b!1400326))

(assert (= (and b!1400326 res!938842) b!1400321))

(assert (= (and b!1400321 res!938835) b!1400323))

(assert (= (and b!1400323 res!938839) b!1400330))

(assert (= (and b!1400330 res!938840) b!1400322))

(assert (= (and b!1400322 res!938837) b!1400325))

(assert (= (and b!1400322 (not res!938833)) b!1400324))

(assert (= (and b!1400324 (not res!938832)) b!1400329))

(assert (= (and b!1400329 res!938841) b!1400331))

(assert (= (and b!1400329 (not res!938838)) b!1400328))

(declare-fun m!1287733 () Bool)

(assert (=> b!1400323 m!1287733))

(declare-fun m!1287735 () Bool)

(assert (=> b!1400329 m!1287735))

(declare-fun m!1287737 () Bool)

(assert (=> b!1400329 m!1287737))

(declare-fun m!1287739 () Bool)

(assert (=> b!1400329 m!1287739))

(declare-fun m!1287741 () Bool)

(assert (=> b!1400324 m!1287741))

(assert (=> b!1400324 m!1287741))

(declare-fun m!1287743 () Bool)

(assert (=> b!1400324 m!1287743))

(assert (=> b!1400324 m!1287735))

(declare-fun m!1287745 () Bool)

(assert (=> b!1400324 m!1287745))

(declare-fun m!1287747 () Bool)

(assert (=> b!1400326 m!1287747))

(assert (=> b!1400326 m!1287747))

(declare-fun m!1287749 () Bool)

(assert (=> b!1400326 m!1287749))

(declare-fun m!1287751 () Bool)

(assert (=> b!1400325 m!1287751))

(assert (=> b!1400325 m!1287751))

(declare-fun m!1287753 () Bool)

(assert (=> b!1400325 m!1287753))

(declare-fun m!1287755 () Bool)

(assert (=> b!1400331 m!1287755))

(assert (=> b!1400331 m!1287751))

(assert (=> b!1400331 m!1287751))

(declare-fun m!1287757 () Bool)

(assert (=> b!1400331 m!1287757))

(assert (=> b!1400322 m!1287751))

(declare-fun m!1287759 () Bool)

(assert (=> b!1400322 m!1287759))

(assert (=> b!1400322 m!1287751))

(declare-fun m!1287761 () Bool)

(assert (=> b!1400322 m!1287761))

(declare-fun m!1287763 () Bool)

(assert (=> b!1400322 m!1287763))

(assert (=> b!1400322 m!1287751))

(declare-fun m!1287765 () Bool)

(assert (=> b!1400322 m!1287765))

(declare-fun m!1287767 () Bool)

(assert (=> b!1400328 m!1287767))

(assert (=> b!1400321 m!1287751))

(assert (=> b!1400321 m!1287751))

(declare-fun m!1287769 () Bool)

(assert (=> b!1400321 m!1287769))

(declare-fun m!1287771 () Bool)

(assert (=> start!120322 m!1287771))

(declare-fun m!1287773 () Bool)

(assert (=> start!120322 m!1287773))

(declare-fun m!1287775 () Bool)

(assert (=> b!1400330 m!1287775))

(push 1)

