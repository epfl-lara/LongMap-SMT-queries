; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122180 () Bool)

(assert start!122180)

(declare-fun b!1417004 () Bool)

(declare-fun e!802101 () Bool)

(assert (=> b!1417004 (= e!802101 true)))

(declare-fun lt!624842 () (_ BitVec 32))

(declare-datatypes ((array!96788 0))(
  ( (array!96789 (arr!46723 (Array (_ BitVec 32) (_ BitVec 64))) (size!47274 (_ BitVec 32))) )
))
(declare-fun lt!624840 () array!96788)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10937 0))(
  ( (MissingZero!10937 (index!46140 (_ BitVec 32))) (Found!10937 (index!46141 (_ BitVec 32))) (Intermediate!10937 (undefined!11749 Bool) (index!46142 (_ BitVec 32)) (x!127899 (_ BitVec 32))) (Undefined!10937) (MissingVacant!10937 (index!46143 (_ BitVec 32))) )
))
(declare-fun lt!624841 () SeekEntryResult!10937)

(declare-fun lt!624836 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96788 (_ BitVec 32)) SeekEntryResult!10937)

(assert (=> b!1417004 (= lt!624841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624842 lt!624836 lt!624840 mask!2840))))

(declare-fun b!1417005 () Bool)

(declare-fun e!802103 () Bool)

(declare-fun e!802098 () Bool)

(assert (=> b!1417005 (= e!802103 (not e!802098))))

(declare-fun res!952365 () Bool)

(assert (=> b!1417005 (=> res!952365 e!802098)))

(declare-fun lt!624839 () SeekEntryResult!10937)

(get-info :version)

(assert (=> b!1417005 (= res!952365 (or (not ((_ is Intermediate!10937) lt!624839)) (undefined!11749 lt!624839)))))

(declare-fun e!802100 () Bool)

(assert (=> b!1417005 e!802100))

(declare-fun res!952364 () Bool)

(assert (=> b!1417005 (=> (not res!952364) (not e!802100))))

(declare-fun a!2901 () array!96788)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96788 (_ BitVec 32)) Bool)

(assert (=> b!1417005 (= res!952364 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47875 0))(
  ( (Unit!47876) )
))
(declare-fun lt!624837 () Unit!47875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47875)

(assert (=> b!1417005 (= lt!624837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1417005 (= lt!624839 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624842 (select (arr!46723 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417005 (= lt!624842 (toIndex!0 (select (arr!46723 a!2901) j!112) mask!2840))))

(declare-fun b!1417006 () Bool)

(declare-fun e!802097 () Bool)

(assert (=> b!1417006 (= e!802098 e!802097)))

(declare-fun res!952367 () Bool)

(assert (=> b!1417006 (=> res!952367 e!802097)))

(declare-fun lt!624835 () SeekEntryResult!10937)

(assert (=> b!1417006 (= res!952367 (or (= lt!624839 lt!624835) (not ((_ is Intermediate!10937) lt!624835))))))

(assert (=> b!1417006 (= lt!624835 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624836 mask!2840) lt!624836 lt!624840 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1417006 (= lt!624836 (select (store (arr!46723 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417006 (= lt!624840 (array!96789 (store (arr!46723 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47274 a!2901)))))

(declare-fun b!1417007 () Bool)

(declare-fun e!802102 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96788 (_ BitVec 32)) SeekEntryResult!10937)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96788 (_ BitVec 32)) SeekEntryResult!10937)

(assert (=> b!1417007 (= e!802102 (= (seekEntryOrOpen!0 lt!624836 lt!624840 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127899 lt!624835) (index!46142 lt!624835) (index!46142 lt!624835) (select (arr!46723 a!2901) j!112) lt!624840 mask!2840)))))

(declare-fun b!1417008 () Bool)

(declare-fun res!952362 () Bool)

(assert (=> b!1417008 (=> (not res!952362) (not e!802103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417008 (= res!952362 (validKeyInArray!0 (select (arr!46723 a!2901) i!1037)))))

(declare-fun b!1417009 () Bool)

(declare-fun res!952368 () Bool)

(assert (=> b!1417009 (=> (not res!952368) (not e!802103))))

(declare-datatypes ((List!33229 0))(
  ( (Nil!33226) (Cons!33225 (h!34520 (_ BitVec 64)) (t!47915 List!33229)) )
))
(declare-fun arrayNoDuplicates!0 (array!96788 (_ BitVec 32) List!33229) Bool)

(assert (=> b!1417009 (= res!952368 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33226))))

(declare-fun b!1417011 () Bool)

(assert (=> b!1417011 (= e!802097 e!802101)))

(declare-fun res!952369 () Bool)

(assert (=> b!1417011 (=> res!952369 e!802101)))

(assert (=> b!1417011 (= res!952369 (or (bvslt (x!127899 lt!624839) #b00000000000000000000000000000000) (bvsgt (x!127899 lt!624839) #b01111111111111111111111111111110) (bvslt (x!127899 lt!624835) #b00000000000000000000000000000000) (bvsgt (x!127899 lt!624835) #b01111111111111111111111111111110) (bvslt lt!624842 #b00000000000000000000000000000000) (bvsge lt!624842 (size!47274 a!2901)) (bvslt (index!46142 lt!624839) #b00000000000000000000000000000000) (bvsge (index!46142 lt!624839) (size!47274 a!2901)) (bvslt (index!46142 lt!624835) #b00000000000000000000000000000000) (bvsge (index!46142 lt!624835) (size!47274 a!2901)) (not (= lt!624839 (Intermediate!10937 false (index!46142 lt!624839) (x!127899 lt!624839)))) (not (= lt!624835 (Intermediate!10937 false (index!46142 lt!624835) (x!127899 lt!624835))))))))

(assert (=> b!1417011 e!802102))

(declare-fun res!952372 () Bool)

(assert (=> b!1417011 (=> (not res!952372) (not e!802102))))

(assert (=> b!1417011 (= res!952372 (and (not (undefined!11749 lt!624835)) (= (index!46142 lt!624835) i!1037) (bvslt (x!127899 lt!624835) (x!127899 lt!624839)) (= (select (store (arr!46723 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46142 lt!624835)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624838 () Unit!47875)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47875)

(assert (=> b!1417011 (= lt!624838 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624842 (x!127899 lt!624839) (index!46142 lt!624839) (x!127899 lt!624835) (index!46142 lt!624835) (undefined!11749 lt!624835) mask!2840))))

(declare-fun b!1417012 () Bool)

(assert (=> b!1417012 (= e!802100 (= (seekEntryOrOpen!0 (select (arr!46723 a!2901) j!112) a!2901 mask!2840) (Found!10937 j!112)))))

(declare-fun b!1417013 () Bool)

(declare-fun res!952366 () Bool)

(assert (=> b!1417013 (=> (not res!952366) (not e!802103))))

(assert (=> b!1417013 (= res!952366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1417014 () Bool)

(declare-fun res!952371 () Bool)

(assert (=> b!1417014 (=> (not res!952371) (not e!802103))))

(assert (=> b!1417014 (= res!952371 (and (= (size!47274 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47274 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47274 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!952370 () Bool)

(assert (=> start!122180 (=> (not res!952370) (not e!802103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122180 (= res!952370 (validMask!0 mask!2840))))

(assert (=> start!122180 e!802103))

(assert (=> start!122180 true))

(declare-fun array_inv!36004 (array!96788) Bool)

(assert (=> start!122180 (array_inv!36004 a!2901)))

(declare-fun b!1417010 () Bool)

(declare-fun res!952363 () Bool)

(assert (=> b!1417010 (=> (not res!952363) (not e!802103))))

(assert (=> b!1417010 (= res!952363 (validKeyInArray!0 (select (arr!46723 a!2901) j!112)))))

(assert (= (and start!122180 res!952370) b!1417014))

(assert (= (and b!1417014 res!952371) b!1417008))

(assert (= (and b!1417008 res!952362) b!1417010))

(assert (= (and b!1417010 res!952363) b!1417013))

(assert (= (and b!1417013 res!952366) b!1417009))

(assert (= (and b!1417009 res!952368) b!1417005))

(assert (= (and b!1417005 res!952364) b!1417012))

(assert (= (and b!1417005 (not res!952365)) b!1417006))

(assert (= (and b!1417006 (not res!952367)) b!1417011))

(assert (= (and b!1417011 res!952372) b!1417007))

(assert (= (and b!1417011 (not res!952369)) b!1417004))

(declare-fun m!1307671 () Bool)

(assert (=> start!122180 m!1307671))

(declare-fun m!1307673 () Bool)

(assert (=> start!122180 m!1307673))

(declare-fun m!1307675 () Bool)

(assert (=> b!1417008 m!1307675))

(assert (=> b!1417008 m!1307675))

(declare-fun m!1307677 () Bool)

(assert (=> b!1417008 m!1307677))

(declare-fun m!1307679 () Bool)

(assert (=> b!1417010 m!1307679))

(assert (=> b!1417010 m!1307679))

(declare-fun m!1307681 () Bool)

(assert (=> b!1417010 m!1307681))

(declare-fun m!1307683 () Bool)

(assert (=> b!1417009 m!1307683))

(declare-fun m!1307685 () Bool)

(assert (=> b!1417006 m!1307685))

(assert (=> b!1417006 m!1307685))

(declare-fun m!1307687 () Bool)

(assert (=> b!1417006 m!1307687))

(declare-fun m!1307689 () Bool)

(assert (=> b!1417006 m!1307689))

(declare-fun m!1307691 () Bool)

(assert (=> b!1417006 m!1307691))

(assert (=> b!1417011 m!1307689))

(declare-fun m!1307693 () Bool)

(assert (=> b!1417011 m!1307693))

(declare-fun m!1307695 () Bool)

(assert (=> b!1417011 m!1307695))

(assert (=> b!1417012 m!1307679))

(assert (=> b!1417012 m!1307679))

(declare-fun m!1307697 () Bool)

(assert (=> b!1417012 m!1307697))

(declare-fun m!1307699 () Bool)

(assert (=> b!1417007 m!1307699))

(assert (=> b!1417007 m!1307679))

(assert (=> b!1417007 m!1307679))

(declare-fun m!1307701 () Bool)

(assert (=> b!1417007 m!1307701))

(declare-fun m!1307703 () Bool)

(assert (=> b!1417013 m!1307703))

(assert (=> b!1417005 m!1307679))

(declare-fun m!1307705 () Bool)

(assert (=> b!1417005 m!1307705))

(assert (=> b!1417005 m!1307679))

(assert (=> b!1417005 m!1307679))

(declare-fun m!1307707 () Bool)

(assert (=> b!1417005 m!1307707))

(declare-fun m!1307709 () Bool)

(assert (=> b!1417005 m!1307709))

(declare-fun m!1307711 () Bool)

(assert (=> b!1417005 m!1307711))

(declare-fun m!1307713 () Bool)

(assert (=> b!1417004 m!1307713))

(check-sat (not b!1417009) (not b!1417011) (not b!1417010) (not b!1417006) (not b!1417007) (not b!1417013) (not b!1417004) (not start!122180) (not b!1417012) (not b!1417008) (not b!1417005))
(check-sat)
