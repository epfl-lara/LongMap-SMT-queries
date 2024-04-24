; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125526 () Bool)

(assert start!125526)

(declare-fun b!1463365 () Bool)

(declare-fun res!991855 () Bool)

(declare-fun e!822774 () Bool)

(assert (=> b!1463365 (=> (not res!991855) (not e!822774))))

(declare-datatypes ((array!98812 0))(
  ( (array!98813 (arr!47689 (Array (_ BitVec 32) (_ BitVec 64))) (size!48240 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98812)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463365 (= res!991855 (validKeyInArray!0 (select (arr!47689 a!2862) i!1006)))))

(declare-fun b!1463366 () Bool)

(declare-fun res!991851 () Bool)

(assert (=> b!1463366 (=> (not res!991851) (not e!822774))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1463366 (= res!991851 (validKeyInArray!0 (select (arr!47689 a!2862) j!93)))))

(declare-fun b!1463367 () Bool)

(declare-fun res!991858 () Bool)

(declare-fun e!822781 () Bool)

(assert (=> b!1463367 (=> (not res!991858) (not e!822781))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11838 0))(
  ( (MissingZero!11838 (index!49744 (_ BitVec 32))) (Found!11838 (index!49745 (_ BitVec 32))) (Intermediate!11838 (undefined!12650 Bool) (index!49746 (_ BitVec 32)) (x!131528 (_ BitVec 32))) (Undefined!11838) (MissingVacant!11838 (index!49747 (_ BitVec 32))) )
))
(declare-fun lt!640841 () SeekEntryResult!11838)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11838)

(assert (=> b!1463367 (= res!991858 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!640841))))

(declare-fun lt!640837 () (_ BitVec 64))

(declare-fun lt!640838 () array!98812)

(declare-fun e!822778 () Bool)

(declare-fun b!1463368 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11838)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11838)

(assert (=> b!1463368 (= e!822778 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640837 lt!640838 mask!2687) (seekEntryOrOpen!0 lt!640837 lt!640838 mask!2687)))))

(declare-fun b!1463369 () Bool)

(declare-fun res!991844 () Bool)

(declare-fun e!822780 () Bool)

(assert (=> b!1463369 (=> (not res!991844) (not e!822780))))

(assert (=> b!1463369 (= res!991844 e!822778)))

(declare-fun c!135283 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1463369 (= c!135283 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463370 () Bool)

(declare-fun e!822783 () Bool)

(assert (=> b!1463370 (= e!822774 e!822783)))

(declare-fun res!991852 () Bool)

(assert (=> b!1463370 (=> (not res!991852) (not e!822783))))

(assert (=> b!1463370 (= res!991852 (= (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463370 (= lt!640838 (array!98813 (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48240 a!2862)))))

(declare-fun res!991857 () Bool)

(assert (=> start!125526 (=> (not res!991857) (not e!822774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125526 (= res!991857 (validMask!0 mask!2687))))

(assert (=> start!125526 e!822774))

(assert (=> start!125526 true))

(declare-fun array_inv!36970 (array!98812) Bool)

(assert (=> start!125526 (array_inv!36970 a!2862)))

(declare-fun b!1463371 () Bool)

(declare-fun res!991842 () Bool)

(assert (=> b!1463371 (=> (not res!991842) (not e!822774))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463371 (= res!991842 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48240 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48240 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48240 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463372 () Bool)

(declare-fun lt!640840 () SeekEntryResult!11838)

(assert (=> b!1463372 (= e!822778 (= lt!640840 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640837 lt!640838 mask!2687)))))

(declare-fun b!1463373 () Bool)

(assert (=> b!1463373 (= e!822781 e!822780)))

(declare-fun res!991843 () Bool)

(assert (=> b!1463373 (=> (not res!991843) (not e!822780))))

(assert (=> b!1463373 (= res!991843 (= lt!640840 (Intermediate!11838 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463373 (= lt!640840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640837 mask!2687) lt!640837 lt!640838 mask!2687))))

(assert (=> b!1463373 (= lt!640837 (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463374 () Bool)

(declare-fun lt!640842 () (_ BitVec 32))

(declare-fun e!822777 () Bool)

(assert (=> b!1463374 (= e!822777 (not (= lt!640840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640842 lt!640837 lt!640838 mask!2687))))))

(declare-fun b!1463375 () Bool)

(assert (=> b!1463375 (= e!822783 e!822781)))

(declare-fun res!991846 () Bool)

(assert (=> b!1463375 (=> (not res!991846) (not e!822781))))

(assert (=> b!1463375 (= res!991846 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47689 a!2862) j!93) mask!2687) (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!640841))))

(assert (=> b!1463375 (= lt!640841 (Intermediate!11838 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463376 () Bool)

(declare-fun res!991859 () Bool)

(declare-fun e!822782 () Bool)

(assert (=> b!1463376 (=> res!991859 e!822782)))

(assert (=> b!1463376 (= res!991859 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640842 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!640841)))))

(declare-fun b!1463377 () Bool)

(declare-fun res!991848 () Bool)

(declare-fun e!822775 () Bool)

(assert (=> b!1463377 (=> (not res!991848) (not e!822775))))

(assert (=> b!1463377 (= res!991848 (= (seekEntryOrOpen!0 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) (Found!11838 j!93)))))

(declare-fun b!1463378 () Bool)

(assert (=> b!1463378 (= e!822775 (or (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) (select (arr!47689 a!2862) j!93))))))

(declare-fun b!1463379 () Bool)

(declare-fun res!991854 () Bool)

(assert (=> b!1463379 (=> (not res!991854) (not e!822774))))

(declare-datatypes ((List!34177 0))(
  ( (Nil!34174) (Cons!34173 (h!35537 (_ BitVec 64)) (t!48863 List!34177)) )
))
(declare-fun arrayNoDuplicates!0 (array!98812 (_ BitVec 32) List!34177) Bool)

(assert (=> b!1463379 (= res!991854 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34174))))

(declare-fun b!1463380 () Bool)

(assert (=> b!1463380 (= e!822782 true)))

(declare-fun lt!640843 () Bool)

(assert (=> b!1463380 (= lt!640843 e!822777)))

(declare-fun c!135282 () Bool)

(assert (=> b!1463380 (= c!135282 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463381 () Bool)

(assert (=> b!1463381 (= e!822777 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640842 intermediateAfterIndex!19 lt!640837 lt!640838 mask!2687) (seekEntryOrOpen!0 lt!640837 lt!640838 mask!2687))))))

(declare-fun b!1463382 () Bool)

(declare-fun res!991849 () Bool)

(assert (=> b!1463382 (=> (not res!991849) (not e!822780))))

(assert (=> b!1463382 (= res!991849 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463383 () Bool)

(declare-fun e!822779 () Bool)

(assert (=> b!1463383 (= e!822779 e!822782)))

(declare-fun res!991853 () Bool)

(assert (=> b!1463383 (=> res!991853 e!822782)))

(assert (=> b!1463383 (= res!991853 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640842 #b00000000000000000000000000000000) (bvsge lt!640842 (size!48240 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463383 (= lt!640842 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1463384 () Bool)

(assert (=> b!1463384 (= e!822780 (not e!822779))))

(declare-fun res!991856 () Bool)

(assert (=> b!1463384 (=> res!991856 e!822779)))

(assert (=> b!1463384 (= res!991856 (or (and (= (select (arr!47689 a!2862) index!646) (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47689 a!2862) index!646) (select (arr!47689 a!2862) j!93))) (= (select (arr!47689 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463384 e!822775))

(declare-fun res!991847 () Bool)

(assert (=> b!1463384 (=> (not res!991847) (not e!822775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98812 (_ BitVec 32)) Bool)

(assert (=> b!1463384 (= res!991847 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49205 0))(
  ( (Unit!49206) )
))
(declare-fun lt!640839 () Unit!49205)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49205)

(assert (=> b!1463384 (= lt!640839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463385 () Bool)

(declare-fun res!991850 () Bool)

(assert (=> b!1463385 (=> (not res!991850) (not e!822774))))

(assert (=> b!1463385 (= res!991850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1463386 () Bool)

(declare-fun res!991845 () Bool)

(assert (=> b!1463386 (=> (not res!991845) (not e!822774))))

(assert (=> b!1463386 (= res!991845 (and (= (size!48240 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48240 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48240 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125526 res!991857) b!1463386))

(assert (= (and b!1463386 res!991845) b!1463365))

(assert (= (and b!1463365 res!991855) b!1463366))

(assert (= (and b!1463366 res!991851) b!1463385))

(assert (= (and b!1463385 res!991850) b!1463379))

(assert (= (and b!1463379 res!991854) b!1463371))

(assert (= (and b!1463371 res!991842) b!1463370))

(assert (= (and b!1463370 res!991852) b!1463375))

(assert (= (and b!1463375 res!991846) b!1463367))

(assert (= (and b!1463367 res!991858) b!1463373))

(assert (= (and b!1463373 res!991843) b!1463369))

(assert (= (and b!1463369 c!135283) b!1463372))

(assert (= (and b!1463369 (not c!135283)) b!1463368))

(assert (= (and b!1463369 res!991844) b!1463382))

(assert (= (and b!1463382 res!991849) b!1463384))

(assert (= (and b!1463384 res!991847) b!1463377))

(assert (= (and b!1463377 res!991848) b!1463378))

(assert (= (and b!1463384 (not res!991856)) b!1463383))

(assert (= (and b!1463383 (not res!991853)) b!1463376))

(assert (= (and b!1463376 (not res!991859)) b!1463380))

(assert (= (and b!1463380 c!135282) b!1463374))

(assert (= (and b!1463380 (not c!135282)) b!1463381))

(declare-fun m!1350895 () Bool)

(assert (=> b!1463366 m!1350895))

(assert (=> b!1463366 m!1350895))

(declare-fun m!1350897 () Bool)

(assert (=> b!1463366 m!1350897))

(assert (=> b!1463367 m!1350895))

(assert (=> b!1463367 m!1350895))

(declare-fun m!1350899 () Bool)

(assert (=> b!1463367 m!1350899))

(declare-fun m!1350901 () Bool)

(assert (=> b!1463378 m!1350901))

(assert (=> b!1463378 m!1350895))

(declare-fun m!1350903 () Bool)

(assert (=> b!1463365 m!1350903))

(assert (=> b!1463365 m!1350903))

(declare-fun m!1350905 () Bool)

(assert (=> b!1463365 m!1350905))

(declare-fun m!1350907 () Bool)

(assert (=> b!1463381 m!1350907))

(declare-fun m!1350909 () Bool)

(assert (=> b!1463381 m!1350909))

(assert (=> b!1463375 m!1350895))

(assert (=> b!1463375 m!1350895))

(declare-fun m!1350911 () Bool)

(assert (=> b!1463375 m!1350911))

(assert (=> b!1463375 m!1350911))

(assert (=> b!1463375 m!1350895))

(declare-fun m!1350913 () Bool)

(assert (=> b!1463375 m!1350913))

(declare-fun m!1350915 () Bool)

(assert (=> b!1463372 m!1350915))

(declare-fun m!1350917 () Bool)

(assert (=> b!1463384 m!1350917))

(declare-fun m!1350919 () Bool)

(assert (=> b!1463384 m!1350919))

(declare-fun m!1350921 () Bool)

(assert (=> b!1463384 m!1350921))

(declare-fun m!1350923 () Bool)

(assert (=> b!1463384 m!1350923))

(declare-fun m!1350925 () Bool)

(assert (=> b!1463384 m!1350925))

(assert (=> b!1463384 m!1350895))

(declare-fun m!1350927 () Bool)

(assert (=> b!1463385 m!1350927))

(declare-fun m!1350929 () Bool)

(assert (=> b!1463368 m!1350929))

(assert (=> b!1463368 m!1350909))

(assert (=> b!1463377 m!1350895))

(assert (=> b!1463377 m!1350895))

(declare-fun m!1350931 () Bool)

(assert (=> b!1463377 m!1350931))

(assert (=> b!1463376 m!1350895))

(assert (=> b!1463376 m!1350895))

(declare-fun m!1350933 () Bool)

(assert (=> b!1463376 m!1350933))

(declare-fun m!1350935 () Bool)

(assert (=> b!1463379 m!1350935))

(declare-fun m!1350937 () Bool)

(assert (=> b!1463374 m!1350937))

(declare-fun m!1350939 () Bool)

(assert (=> b!1463373 m!1350939))

(assert (=> b!1463373 m!1350939))

(declare-fun m!1350941 () Bool)

(assert (=> b!1463373 m!1350941))

(assert (=> b!1463373 m!1350919))

(declare-fun m!1350943 () Bool)

(assert (=> b!1463373 m!1350943))

(declare-fun m!1350945 () Bool)

(assert (=> b!1463383 m!1350945))

(assert (=> b!1463370 m!1350919))

(declare-fun m!1350947 () Bool)

(assert (=> b!1463370 m!1350947))

(declare-fun m!1350949 () Bool)

(assert (=> start!125526 m!1350949))

(declare-fun m!1350951 () Bool)

(assert (=> start!125526 m!1350951))

(check-sat (not b!1463381) (not b!1463375) (not b!1463376) (not b!1463365) (not b!1463373) (not start!125526) (not b!1463374) (not b!1463379) (not b!1463383) (not b!1463385) (not b!1463367) (not b!1463372) (not b!1463384) (not b!1463368) (not b!1463377) (not b!1463366))
(check-sat)
