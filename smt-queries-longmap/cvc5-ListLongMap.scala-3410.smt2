; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47382 () Bool)

(assert start!47382)

(declare-fun b!520990 () Bool)

(declare-fun res!318855 () Bool)

(declare-fun e!303991 () Bool)

(assert (=> b!520990 (=> (not res!318855) (not e!303991))))

(declare-datatypes ((array!33208 0))(
  ( (array!33209 (arr!15960 (Array (_ BitVec 32) (_ BitVec 64))) (size!16324 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33208)

(declare-datatypes ((List!10118 0))(
  ( (Nil!10115) (Cons!10114 (h!11036 (_ BitVec 64)) (t!16346 List!10118)) )
))
(declare-fun arrayNoDuplicates!0 (array!33208 (_ BitVec 32) List!10118) Bool)

(assert (=> b!520990 (= res!318855 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10115))))

(declare-fun b!520991 () Bool)

(declare-fun res!318860 () Bool)

(declare-fun e!303993 () Bool)

(assert (=> b!520991 (=> (not res!318860) (not e!303993))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520991 (= res!318860 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520993 () Bool)

(declare-fun e!303994 () Bool)

(assert (=> b!520993 (= e!303991 (not e!303994))))

(declare-fun res!318861 () Bool)

(assert (=> b!520993 (=> res!318861 e!303994)))

(declare-fun lt!238675 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4427 0))(
  ( (MissingZero!4427 (index!19911 (_ BitVec 32))) (Found!4427 (index!19912 (_ BitVec 32))) (Intermediate!4427 (undefined!5239 Bool) (index!19913 (_ BitVec 32)) (x!48901 (_ BitVec 32))) (Undefined!4427) (MissingVacant!4427 (index!19914 (_ BitVec 32))) )
))
(declare-fun lt!238678 () SeekEntryResult!4427)

(declare-fun lt!238670 () array!33208)

(declare-fun lt!238674 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33208 (_ BitVec 32)) SeekEntryResult!4427)

(assert (=> b!520993 (= res!318861 (= lt!238678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238674 lt!238675 lt!238670 mask!3524)))))

(declare-fun lt!238673 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520993 (= lt!238678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238673 (select (arr!15960 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520993 (= lt!238674 (toIndex!0 lt!238675 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520993 (= lt!238675 (select (store (arr!15960 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520993 (= lt!238673 (toIndex!0 (select (arr!15960 a!3235) j!176) mask!3524))))

(assert (=> b!520993 (= lt!238670 (array!33209 (store (arr!15960 a!3235) i!1204 k!2280) (size!16324 a!3235)))))

(declare-fun e!303990 () Bool)

(assert (=> b!520993 e!303990))

(declare-fun res!318859 () Bool)

(assert (=> b!520993 (=> (not res!318859) (not e!303990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33208 (_ BitVec 32)) Bool)

(assert (=> b!520993 (= res!318859 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16160 0))(
  ( (Unit!16161) )
))
(declare-fun lt!238671 () Unit!16160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16160)

(assert (=> b!520993 (= lt!238671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520994 () Bool)

(assert (=> b!520994 (= e!303994 true)))

(assert (=> b!520994 (and (or (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238676 () Unit!16160)

(declare-fun e!303996 () Unit!16160)

(assert (=> b!520994 (= lt!238676 e!303996)))

(declare-fun c!61370 () Bool)

(assert (=> b!520994 (= c!61370 (= (select (arr!15960 a!3235) (index!19913 lt!238678)) (select (arr!15960 a!3235) j!176)))))

(assert (=> b!520994 (and (bvslt (x!48901 lt!238678) #b01111111111111111111111111111110) (or (= (select (arr!15960 a!3235) (index!19913 lt!238678)) (select (arr!15960 a!3235) j!176)) (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15960 a!3235) (index!19913 lt!238678)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520995 () Bool)

(declare-fun res!318853 () Bool)

(assert (=> b!520995 (=> (not res!318853) (not e!303993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520995 (= res!318853 (validKeyInArray!0 k!2280))))

(declare-fun b!520996 () Bool)

(declare-fun Unit!16162 () Unit!16160)

(assert (=> b!520996 (= e!303996 Unit!16162)))

(declare-fun lt!238677 () Unit!16160)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33208 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16160)

(assert (=> b!520996 (= lt!238677 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238673 #b00000000000000000000000000000000 (index!19913 lt!238678) (x!48901 lt!238678) mask!3524))))

(declare-fun res!318854 () Bool)

(assert (=> b!520996 (= res!318854 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238673 lt!238675 lt!238670 mask!3524) (Intermediate!4427 false (index!19913 lt!238678) (x!48901 lt!238678))))))

(declare-fun e!303992 () Bool)

(assert (=> b!520996 (=> (not res!318854) (not e!303992))))

(assert (=> b!520996 e!303992))

(declare-fun b!520997 () Bool)

(declare-fun res!318862 () Bool)

(assert (=> b!520997 (=> (not res!318862) (not e!303993))))

(assert (=> b!520997 (= res!318862 (validKeyInArray!0 (select (arr!15960 a!3235) j!176)))))

(declare-fun b!520992 () Bool)

(assert (=> b!520992 (= e!303993 e!303991)))

(declare-fun res!318858 () Bool)

(assert (=> b!520992 (=> (not res!318858) (not e!303991))))

(declare-fun lt!238672 () SeekEntryResult!4427)

(assert (=> b!520992 (= res!318858 (or (= lt!238672 (MissingZero!4427 i!1204)) (= lt!238672 (MissingVacant!4427 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33208 (_ BitVec 32)) SeekEntryResult!4427)

(assert (=> b!520992 (= lt!238672 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!318857 () Bool)

(assert (=> start!47382 (=> (not res!318857) (not e!303993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47382 (= res!318857 (validMask!0 mask!3524))))

(assert (=> start!47382 e!303993))

(assert (=> start!47382 true))

(declare-fun array_inv!11756 (array!33208) Bool)

(assert (=> start!47382 (array_inv!11756 a!3235)))

(declare-fun b!520998 () Bool)

(declare-fun res!318852 () Bool)

(assert (=> b!520998 (=> (not res!318852) (not e!303993))))

(assert (=> b!520998 (= res!318852 (and (= (size!16324 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16324 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16324 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520999 () Bool)

(declare-fun Unit!16163 () Unit!16160)

(assert (=> b!520999 (= e!303996 Unit!16163)))

(declare-fun b!521000 () Bool)

(assert (=> b!521000 (= e!303992 false)))

(declare-fun b!521001 () Bool)

(declare-fun res!318863 () Bool)

(assert (=> b!521001 (=> (not res!318863) (not e!303991))))

(assert (=> b!521001 (= res!318863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521002 () Bool)

(assert (=> b!521002 (= e!303990 (= (seekEntryOrOpen!0 (select (arr!15960 a!3235) j!176) a!3235 mask!3524) (Found!4427 j!176)))))

(declare-fun b!521003 () Bool)

(declare-fun res!318856 () Bool)

(assert (=> b!521003 (=> res!318856 e!303994)))

(assert (=> b!521003 (= res!318856 (or (undefined!5239 lt!238678) (not (is-Intermediate!4427 lt!238678))))))

(assert (= (and start!47382 res!318857) b!520998))

(assert (= (and b!520998 res!318852) b!520997))

(assert (= (and b!520997 res!318862) b!520995))

(assert (= (and b!520995 res!318853) b!520991))

(assert (= (and b!520991 res!318860) b!520992))

(assert (= (and b!520992 res!318858) b!521001))

(assert (= (and b!521001 res!318863) b!520990))

(assert (= (and b!520990 res!318855) b!520993))

(assert (= (and b!520993 res!318859) b!521002))

(assert (= (and b!520993 (not res!318861)) b!521003))

(assert (= (and b!521003 (not res!318856)) b!520994))

(assert (= (and b!520994 c!61370) b!520996))

(assert (= (and b!520994 (not c!61370)) b!520999))

(assert (= (and b!520996 res!318854) b!521000))

(declare-fun m!501903 () Bool)

(assert (=> b!520996 m!501903))

(declare-fun m!501905 () Bool)

(assert (=> b!520996 m!501905))

(declare-fun m!501907 () Bool)

(assert (=> b!520997 m!501907))

(assert (=> b!520997 m!501907))

(declare-fun m!501909 () Bool)

(assert (=> b!520997 m!501909))

(declare-fun m!501911 () Bool)

(assert (=> b!520991 m!501911))

(assert (=> b!521002 m!501907))

(assert (=> b!521002 m!501907))

(declare-fun m!501913 () Bool)

(assert (=> b!521002 m!501913))

(declare-fun m!501915 () Bool)

(assert (=> b!520995 m!501915))

(declare-fun m!501917 () Bool)

(assert (=> b!520994 m!501917))

(assert (=> b!520994 m!501907))

(declare-fun m!501919 () Bool)

(assert (=> b!520992 m!501919))

(declare-fun m!501921 () Bool)

(assert (=> start!47382 m!501921))

(declare-fun m!501923 () Bool)

(assert (=> start!47382 m!501923))

(declare-fun m!501925 () Bool)

(assert (=> b!521001 m!501925))

(declare-fun m!501927 () Bool)

(assert (=> b!520993 m!501927))

(declare-fun m!501929 () Bool)

(assert (=> b!520993 m!501929))

(declare-fun m!501931 () Bool)

(assert (=> b!520993 m!501931))

(declare-fun m!501933 () Bool)

(assert (=> b!520993 m!501933))

(declare-fun m!501935 () Bool)

(assert (=> b!520993 m!501935))

(assert (=> b!520993 m!501907))

(declare-fun m!501937 () Bool)

(assert (=> b!520993 m!501937))

(assert (=> b!520993 m!501907))

(declare-fun m!501939 () Bool)

(assert (=> b!520993 m!501939))

(assert (=> b!520993 m!501907))

(declare-fun m!501941 () Bool)

(assert (=> b!520993 m!501941))

(declare-fun m!501943 () Bool)

(assert (=> b!520990 m!501943))

(push 1)

