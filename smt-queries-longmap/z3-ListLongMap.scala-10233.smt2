; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120638 () Bool)

(assert start!120638)

(declare-fun b!1403553 () Bool)

(declare-fun e!794865 () Bool)

(declare-fun e!794867 () Bool)

(assert (=> b!1403553 (= e!794865 e!794867)))

(declare-fun res!941387 () Bool)

(assert (=> b!1403553 (=> res!941387 e!794867)))

(declare-datatypes ((SeekEntryResult!10553 0))(
  ( (MissingZero!10553 (index!44589 (_ BitVec 32))) (Found!10553 (index!44590 (_ BitVec 32))) (Intermediate!10553 (undefined!11365 Bool) (index!44591 (_ BitVec 32)) (x!126367 (_ BitVec 32))) (Undefined!10553) (MissingVacant!10553 (index!44592 (_ BitVec 32))) )
))
(declare-fun lt!618097 () SeekEntryResult!10553)

(declare-fun lt!618100 () SeekEntryResult!10553)

(declare-fun lt!618101 () (_ BitVec 32))

(declare-datatypes ((array!95969 0))(
  ( (array!95970 (arr!46333 (Array (_ BitVec 32) (_ BitVec 64))) (size!46884 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95969)

(assert (=> b!1403553 (= res!941387 (or (bvslt (x!126367 lt!618097) #b00000000000000000000000000000000) (bvsgt (x!126367 lt!618097) #b01111111111111111111111111111110) (bvslt (x!126367 lt!618100) #b00000000000000000000000000000000) (bvsgt (x!126367 lt!618100) #b01111111111111111111111111111110) (bvslt lt!618101 #b00000000000000000000000000000000) (bvsge lt!618101 (size!46884 a!2901)) (bvslt (index!44591 lt!618097) #b00000000000000000000000000000000) (bvsge (index!44591 lt!618097) (size!46884 a!2901)) (bvslt (index!44591 lt!618100) #b00000000000000000000000000000000) (bvsge (index!44591 lt!618100) (size!46884 a!2901)) (not (= lt!618097 (Intermediate!10553 false (index!44591 lt!618097) (x!126367 lt!618097)))) (not (= lt!618100 (Intermediate!10553 false (index!44591 lt!618100) (x!126367 lt!618100))))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!618099 () array!95969)

(declare-fun lt!618094 () SeekEntryResult!10553)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95969 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1403553 (= lt!618094 (seekKeyOrZeroReturnVacant!0 (x!126367 lt!618100) (index!44591 lt!618100) (index!44591 lt!618100) (select (arr!46333 a!2901) j!112) lt!618099 mask!2840))))

(declare-fun lt!618093 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95969 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1403553 (= lt!618094 (seekEntryOrOpen!0 lt!618093 lt!618099 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403553 (and (not (undefined!11365 lt!618100)) (= (index!44591 lt!618100) i!1037) (bvslt (x!126367 lt!618100) (x!126367 lt!618097)) (= (select (store (arr!46333 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44591 lt!618100)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47137 0))(
  ( (Unit!47138) )
))
(declare-fun lt!618098 () Unit!47137)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47137)

(assert (=> b!1403553 (= lt!618098 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618101 (x!126367 lt!618097) (index!44591 lt!618097) (x!126367 lt!618100) (index!44591 lt!618100) (undefined!11365 lt!618100) mask!2840))))

(declare-fun b!1403554 () Bool)

(declare-fun e!794864 () Bool)

(declare-fun e!794866 () Bool)

(assert (=> b!1403554 (= e!794864 (not e!794866))))

(declare-fun res!941380 () Bool)

(assert (=> b!1403554 (=> res!941380 e!794866)))

(get-info :version)

(assert (=> b!1403554 (= res!941380 (or (not ((_ is Intermediate!10553) lt!618097)) (undefined!11365 lt!618097)))))

(declare-fun lt!618095 () SeekEntryResult!10553)

(assert (=> b!1403554 (= lt!618095 (Found!10553 j!112))))

(assert (=> b!1403554 (= lt!618095 (seekEntryOrOpen!0 (select (arr!46333 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95969 (_ BitVec 32)) Bool)

(assert (=> b!1403554 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618092 () Unit!47137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47137)

(assert (=> b!1403554 (= lt!618092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95969 (_ BitVec 32)) SeekEntryResult!10553)

(assert (=> b!1403554 (= lt!618097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618101 (select (arr!46333 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403554 (= lt!618101 (toIndex!0 (select (arr!46333 a!2901) j!112) mask!2840))))

(declare-fun b!1403555 () Bool)

(declare-fun res!941386 () Bool)

(assert (=> b!1403555 (=> (not res!941386) (not e!794864))))

(assert (=> b!1403555 (= res!941386 (and (= (size!46884 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46884 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46884 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941382 () Bool)

(assert (=> start!120638 (=> (not res!941382) (not e!794864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120638 (= res!941382 (validMask!0 mask!2840))))

(assert (=> start!120638 e!794864))

(assert (=> start!120638 true))

(declare-fun array_inv!35614 (array!95969) Bool)

(assert (=> start!120638 (array_inv!35614 a!2901)))

(declare-fun b!1403556 () Bool)

(assert (=> b!1403556 (= e!794867 true)))

(assert (=> b!1403556 (= lt!618095 lt!618094)))

(declare-fun lt!618096 () Unit!47137)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47137)

(assert (=> b!1403556 (= lt!618096 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618101 (x!126367 lt!618097) (index!44591 lt!618097) (x!126367 lt!618100) (index!44591 lt!618100) mask!2840))))

(declare-fun b!1403557 () Bool)

(assert (=> b!1403557 (= e!794866 e!794865)))

(declare-fun res!941388 () Bool)

(assert (=> b!1403557 (=> res!941388 e!794865)))

(assert (=> b!1403557 (= res!941388 (or (= lt!618097 lt!618100) (not ((_ is Intermediate!10553) lt!618100))))))

(assert (=> b!1403557 (= lt!618100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618093 mask!2840) lt!618093 lt!618099 mask!2840))))

(assert (=> b!1403557 (= lt!618093 (select (store (arr!46333 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403557 (= lt!618099 (array!95970 (store (arr!46333 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46884 a!2901)))))

(declare-fun b!1403558 () Bool)

(declare-fun res!941383 () Bool)

(assert (=> b!1403558 (=> (not res!941383) (not e!794864))))

(assert (=> b!1403558 (= res!941383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403559 () Bool)

(declare-fun res!941389 () Bool)

(assert (=> b!1403559 (=> (not res!941389) (not e!794864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403559 (= res!941389 (validKeyInArray!0 (select (arr!46333 a!2901) i!1037)))))

(declare-fun b!1403560 () Bool)

(declare-fun res!941384 () Bool)

(assert (=> b!1403560 (=> (not res!941384) (not e!794864))))

(declare-datatypes ((List!32839 0))(
  ( (Nil!32836) (Cons!32835 (h!34091 (_ BitVec 64)) (t!47525 List!32839)) )
))
(declare-fun arrayNoDuplicates!0 (array!95969 (_ BitVec 32) List!32839) Bool)

(assert (=> b!1403560 (= res!941384 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32836))))

(declare-fun b!1403561 () Bool)

(declare-fun res!941381 () Bool)

(assert (=> b!1403561 (=> (not res!941381) (not e!794864))))

(assert (=> b!1403561 (= res!941381 (validKeyInArray!0 (select (arr!46333 a!2901) j!112)))))

(declare-fun b!1403562 () Bool)

(declare-fun res!941385 () Bool)

(assert (=> b!1403562 (=> res!941385 e!794867)))

(assert (=> b!1403562 (= res!941385 (not (= lt!618100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618101 lt!618093 lt!618099 mask!2840))))))

(assert (= (and start!120638 res!941382) b!1403555))

(assert (= (and b!1403555 res!941386) b!1403559))

(assert (= (and b!1403559 res!941389) b!1403561))

(assert (= (and b!1403561 res!941381) b!1403558))

(assert (= (and b!1403558 res!941383) b!1403560))

(assert (= (and b!1403560 res!941384) b!1403554))

(assert (= (and b!1403554 (not res!941380)) b!1403557))

(assert (= (and b!1403557 (not res!941388)) b!1403553))

(assert (= (and b!1403553 (not res!941387)) b!1403562))

(assert (= (and b!1403562 (not res!941385)) b!1403556))

(declare-fun m!1291933 () Bool)

(assert (=> b!1403559 m!1291933))

(assert (=> b!1403559 m!1291933))

(declare-fun m!1291935 () Bool)

(assert (=> b!1403559 m!1291935))

(declare-fun m!1291937 () Bool)

(assert (=> start!120638 m!1291937))

(declare-fun m!1291939 () Bool)

(assert (=> start!120638 m!1291939))

(declare-fun m!1291941 () Bool)

(assert (=> b!1403557 m!1291941))

(assert (=> b!1403557 m!1291941))

(declare-fun m!1291943 () Bool)

(assert (=> b!1403557 m!1291943))

(declare-fun m!1291945 () Bool)

(assert (=> b!1403557 m!1291945))

(declare-fun m!1291947 () Bool)

(assert (=> b!1403557 m!1291947))

(declare-fun m!1291949 () Bool)

(assert (=> b!1403562 m!1291949))

(declare-fun m!1291951 () Bool)

(assert (=> b!1403558 m!1291951))

(declare-fun m!1291953 () Bool)

(assert (=> b!1403554 m!1291953))

(declare-fun m!1291955 () Bool)

(assert (=> b!1403554 m!1291955))

(assert (=> b!1403554 m!1291953))

(declare-fun m!1291957 () Bool)

(assert (=> b!1403554 m!1291957))

(declare-fun m!1291959 () Bool)

(assert (=> b!1403554 m!1291959))

(assert (=> b!1403554 m!1291953))

(declare-fun m!1291961 () Bool)

(assert (=> b!1403554 m!1291961))

(assert (=> b!1403554 m!1291953))

(declare-fun m!1291963 () Bool)

(assert (=> b!1403554 m!1291963))

(assert (=> b!1403561 m!1291953))

(assert (=> b!1403561 m!1291953))

(declare-fun m!1291965 () Bool)

(assert (=> b!1403561 m!1291965))

(declare-fun m!1291967 () Bool)

(assert (=> b!1403553 m!1291967))

(assert (=> b!1403553 m!1291953))

(declare-fun m!1291969 () Bool)

(assert (=> b!1403553 m!1291969))

(assert (=> b!1403553 m!1291953))

(declare-fun m!1291971 () Bool)

(assert (=> b!1403553 m!1291971))

(declare-fun m!1291973 () Bool)

(assert (=> b!1403553 m!1291973))

(assert (=> b!1403553 m!1291945))

(declare-fun m!1291975 () Bool)

(assert (=> b!1403556 m!1291975))

(declare-fun m!1291977 () Bool)

(assert (=> b!1403560 m!1291977))

(check-sat (not b!1403558) (not b!1403560) (not b!1403561) (not b!1403562) (not b!1403554) (not b!1403559) (not b!1403556) (not b!1403553) (not start!120638) (not b!1403557))
(check-sat)
