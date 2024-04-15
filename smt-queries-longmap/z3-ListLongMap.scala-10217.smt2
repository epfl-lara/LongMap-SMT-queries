; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120350 () Bool)

(assert start!120350)

(declare-fun b!1400768 () Bool)

(declare-fun res!939334 () Bool)

(declare-fun e!793120 () Bool)

(assert (=> b!1400768 (=> (not res!939334) (not e!793120))))

(declare-datatypes ((array!95712 0))(
  ( (array!95713 (arr!46207 (Array (_ BitVec 32) (_ BitVec 64))) (size!46759 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95712)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95712 (_ BitVec 32)) Bool)

(assert (=> b!1400768 (= res!939334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400769 () Bool)

(declare-fun e!793121 () Bool)

(assert (=> b!1400769 (= e!793120 (not e!793121))))

(declare-fun res!939330 () Bool)

(assert (=> b!1400769 (=> res!939330 e!793121)))

(declare-datatypes ((SeekEntryResult!10550 0))(
  ( (MissingZero!10550 (index!44577 (_ BitVec 32))) (Found!10550 (index!44578 (_ BitVec 32))) (Intermediate!10550 (undefined!11362 Bool) (index!44579 (_ BitVec 32)) (x!126214 (_ BitVec 32))) (Undefined!10550) (MissingVacant!10550 (index!44580 (_ BitVec 32))) )
))
(declare-fun lt!616317 () SeekEntryResult!10550)

(get-info :version)

(assert (=> b!1400769 (= res!939330 (or (not ((_ is Intermediate!10550) lt!616317)) (undefined!11362 lt!616317)))))

(declare-fun e!793124 () Bool)

(assert (=> b!1400769 e!793124))

(declare-fun res!939340 () Bool)

(assert (=> b!1400769 (=> (not res!939340) (not e!793124))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400769 (= res!939340 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46947 0))(
  ( (Unit!46948) )
))
(declare-fun lt!616315 () Unit!46947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46947)

(assert (=> b!1400769 (= lt!616315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616313 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95712 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1400769 (= lt!616317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616313 (select (arr!46207 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400769 (= lt!616313 (toIndex!0 (select (arr!46207 a!2901) j!112) mask!2840))))

(declare-fun b!1400770 () Bool)

(declare-fun e!793119 () Bool)

(assert (=> b!1400770 (= e!793121 e!793119)))

(declare-fun res!939331 () Bool)

(assert (=> b!1400770 (=> res!939331 e!793119)))

(declare-fun lt!616314 () SeekEntryResult!10550)

(assert (=> b!1400770 (= res!939331 (or (= lt!616317 lt!616314) (not ((_ is Intermediate!10550) lt!616314))))))

(declare-fun lt!616318 () (_ BitVec 64))

(declare-fun lt!616312 () array!95712)

(assert (=> b!1400770 (= lt!616314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616318 mask!2840) lt!616318 lt!616312 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400770 (= lt!616318 (select (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400770 (= lt!616312 (array!95713 (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46759 a!2901)))))

(declare-fun b!1400771 () Bool)

(declare-fun res!939336 () Bool)

(assert (=> b!1400771 (=> (not res!939336) (not e!793120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400771 (= res!939336 (validKeyInArray!0 (select (arr!46207 a!2901) i!1037)))))

(declare-fun b!1400772 () Bool)

(declare-fun res!939339 () Bool)

(assert (=> b!1400772 (=> (not res!939339) (not e!793120))))

(assert (=> b!1400772 (= res!939339 (and (= (size!46759 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46759 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46759 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!939333 () Bool)

(assert (=> start!120350 (=> (not res!939333) (not e!793120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120350 (= res!939333 (validMask!0 mask!2840))))

(assert (=> start!120350 e!793120))

(assert (=> start!120350 true))

(declare-fun array_inv!35440 (array!95712) Bool)

(assert (=> start!120350 (array_inv!35440 a!2901)))

(declare-fun e!793123 () Bool)

(declare-fun b!1400773 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95712 (_ BitVec 32)) SeekEntryResult!10550)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95712 (_ BitVec 32)) SeekEntryResult!10550)

(assert (=> b!1400773 (= e!793123 (= (seekEntryOrOpen!0 lt!616318 lt!616312 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126214 lt!616314) (index!44579 lt!616314) (index!44579 lt!616314) (select (arr!46207 a!2901) j!112) lt!616312 mask!2840)))))

(declare-fun b!1400774 () Bool)

(assert (=> b!1400774 (= e!793124 (= (seekEntryOrOpen!0 (select (arr!46207 a!2901) j!112) a!2901 mask!2840) (Found!10550 j!112)))))

(declare-fun b!1400775 () Bool)

(declare-fun e!793118 () Bool)

(assert (=> b!1400775 (= e!793119 e!793118)))

(declare-fun res!939335 () Bool)

(assert (=> b!1400775 (=> res!939335 e!793118)))

(assert (=> b!1400775 (= res!939335 (or (bvslt (x!126214 lt!616317) #b00000000000000000000000000000000) (bvsgt (x!126214 lt!616317) #b01111111111111111111111111111110) (bvslt (x!126214 lt!616314) #b00000000000000000000000000000000) (bvsgt (x!126214 lt!616314) #b01111111111111111111111111111110) (bvslt lt!616313 #b00000000000000000000000000000000) (bvsge lt!616313 (size!46759 a!2901)) (bvslt (index!44579 lt!616317) #b00000000000000000000000000000000) (bvsge (index!44579 lt!616317) (size!46759 a!2901)) (bvslt (index!44579 lt!616314) #b00000000000000000000000000000000) (bvsge (index!44579 lt!616314) (size!46759 a!2901)) (not (= lt!616317 (Intermediate!10550 false (index!44579 lt!616317) (x!126214 lt!616317)))) (not (= lt!616314 (Intermediate!10550 false (index!44579 lt!616314) (x!126214 lt!616314))))))))

(assert (=> b!1400775 e!793123))

(declare-fun res!939332 () Bool)

(assert (=> b!1400775 (=> (not res!939332) (not e!793123))))

(assert (=> b!1400775 (= res!939332 (and (not (undefined!11362 lt!616314)) (= (index!44579 lt!616314) i!1037) (bvslt (x!126214 lt!616314) (x!126214 lt!616317)) (= (select (store (arr!46207 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44579 lt!616314)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616316 () Unit!46947)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46947)

(assert (=> b!1400775 (= lt!616316 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616313 (x!126214 lt!616317) (index!44579 lt!616317) (x!126214 lt!616314) (index!44579 lt!616314) (undefined!11362 lt!616314) mask!2840))))

(declare-fun b!1400776 () Bool)

(declare-fun res!939337 () Bool)

(assert (=> b!1400776 (=> (not res!939337) (not e!793120))))

(assert (=> b!1400776 (= res!939337 (validKeyInArray!0 (select (arr!46207 a!2901) j!112)))))

(declare-fun b!1400777 () Bool)

(assert (=> b!1400777 (= e!793118 true)))

(declare-fun lt!616319 () SeekEntryResult!10550)

(assert (=> b!1400777 (= lt!616319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616313 lt!616318 lt!616312 mask!2840))))

(declare-fun b!1400778 () Bool)

(declare-fun res!939338 () Bool)

(assert (=> b!1400778 (=> (not res!939338) (not e!793120))))

(declare-datatypes ((List!32804 0))(
  ( (Nil!32801) (Cons!32800 (h!34048 (_ BitVec 64)) (t!47490 List!32804)) )
))
(declare-fun arrayNoDuplicates!0 (array!95712 (_ BitVec 32) List!32804) Bool)

(assert (=> b!1400778 (= res!939338 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32801))))

(assert (= (and start!120350 res!939333) b!1400772))

(assert (= (and b!1400772 res!939339) b!1400771))

(assert (= (and b!1400771 res!939336) b!1400776))

(assert (= (and b!1400776 res!939337) b!1400768))

(assert (= (and b!1400768 res!939334) b!1400778))

(assert (= (and b!1400778 res!939338) b!1400769))

(assert (= (and b!1400769 res!939340) b!1400774))

(assert (= (and b!1400769 (not res!939330)) b!1400770))

(assert (= (and b!1400770 (not res!939331)) b!1400775))

(assert (= (and b!1400775 res!939332) b!1400773))

(assert (= (and b!1400775 (not res!939335)) b!1400777))

(declare-fun m!1287901 () Bool)

(assert (=> b!1400774 m!1287901))

(assert (=> b!1400774 m!1287901))

(declare-fun m!1287903 () Bool)

(assert (=> b!1400774 m!1287903))

(declare-fun m!1287905 () Bool)

(assert (=> b!1400768 m!1287905))

(declare-fun m!1287907 () Bool)

(assert (=> b!1400773 m!1287907))

(assert (=> b!1400773 m!1287901))

(assert (=> b!1400773 m!1287901))

(declare-fun m!1287909 () Bool)

(assert (=> b!1400773 m!1287909))

(declare-fun m!1287911 () Bool)

(assert (=> b!1400775 m!1287911))

(declare-fun m!1287913 () Bool)

(assert (=> b!1400775 m!1287913))

(declare-fun m!1287915 () Bool)

(assert (=> b!1400775 m!1287915))

(declare-fun m!1287917 () Bool)

(assert (=> b!1400770 m!1287917))

(assert (=> b!1400770 m!1287917))

(declare-fun m!1287919 () Bool)

(assert (=> b!1400770 m!1287919))

(assert (=> b!1400770 m!1287911))

(declare-fun m!1287921 () Bool)

(assert (=> b!1400770 m!1287921))

(declare-fun m!1287923 () Bool)

(assert (=> b!1400778 m!1287923))

(assert (=> b!1400776 m!1287901))

(assert (=> b!1400776 m!1287901))

(declare-fun m!1287925 () Bool)

(assert (=> b!1400776 m!1287925))

(declare-fun m!1287927 () Bool)

(assert (=> b!1400777 m!1287927))

(declare-fun m!1287929 () Bool)

(assert (=> b!1400771 m!1287929))

(assert (=> b!1400771 m!1287929))

(declare-fun m!1287931 () Bool)

(assert (=> b!1400771 m!1287931))

(declare-fun m!1287933 () Bool)

(assert (=> start!120350 m!1287933))

(declare-fun m!1287935 () Bool)

(assert (=> start!120350 m!1287935))

(assert (=> b!1400769 m!1287901))

(declare-fun m!1287937 () Bool)

(assert (=> b!1400769 m!1287937))

(assert (=> b!1400769 m!1287901))

(assert (=> b!1400769 m!1287901))

(declare-fun m!1287939 () Bool)

(assert (=> b!1400769 m!1287939))

(declare-fun m!1287941 () Bool)

(assert (=> b!1400769 m!1287941))

(declare-fun m!1287943 () Bool)

(assert (=> b!1400769 m!1287943))

(check-sat (not b!1400770) (not b!1400778) (not b!1400774) (not b!1400769) (not b!1400777) (not b!1400771) (not b!1400768) (not b!1400776) (not b!1400775) (not b!1400773) (not start!120350))
(check-sat)
