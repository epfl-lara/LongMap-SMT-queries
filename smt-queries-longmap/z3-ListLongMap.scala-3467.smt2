; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48120 () Bool)

(assert start!48120)

(declare-fun b!529866 () Bool)

(declare-fun e!308725 () Bool)

(declare-fun e!308726 () Bool)

(assert (=> b!529866 (= e!308725 e!308726)))

(declare-fun res!325716 () Bool)

(assert (=> b!529866 (=> (not res!325716) (not e!308726))))

(declare-datatypes ((SeekEntryResult!4594 0))(
  ( (MissingZero!4594 (index!20600 (_ BitVec 32))) (Found!4594 (index!20601 (_ BitVec 32))) (Intermediate!4594 (undefined!5406 Bool) (index!20602 (_ BitVec 32)) (x!49579 (_ BitVec 32))) (Undefined!4594) (MissingVacant!4594 (index!20603 (_ BitVec 32))) )
))
(declare-fun lt!244302 () SeekEntryResult!4594)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529866 (= res!325716 (or (= lt!244302 (MissingZero!4594 i!1204)) (= lt!244302 (MissingVacant!4594 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33566 0))(
  ( (array!33567 (arr!16130 (Array (_ BitVec 32) (_ BitVec 64))) (size!16495 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33566)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33566 (_ BitVec 32)) SeekEntryResult!4594)

(assert (=> b!529866 (= lt!244302 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!325722 () Bool)

(assert (=> start!48120 (=> (not res!325722) (not e!308725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48120 (= res!325722 (validMask!0 mask!3524))))

(assert (=> start!48120 e!308725))

(assert (=> start!48120 true))

(declare-fun array_inv!12013 (array!33566) Bool)

(assert (=> start!48120 (array_inv!12013 a!3235)))

(declare-fun b!529867 () Bool)

(declare-fun res!325718 () Bool)

(assert (=> b!529867 (=> (not res!325718) (not e!308725))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529867 (= res!325718 (validKeyInArray!0 (select (arr!16130 a!3235) j!176)))))

(declare-fun b!529868 () Bool)

(declare-fun res!325723 () Bool)

(assert (=> b!529868 (=> (not res!325723) (not e!308725))))

(declare-fun arrayContainsKey!0 (array!33566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529868 (= res!325723 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529869 () Bool)

(declare-fun res!325717 () Bool)

(assert (=> b!529869 (=> (not res!325717) (not e!308726))))

(declare-datatypes ((List!10327 0))(
  ( (Nil!10324) (Cons!10323 (h!11263 (_ BitVec 64)) (t!16546 List!10327)) )
))
(declare-fun arrayNoDuplicates!0 (array!33566 (_ BitVec 32) List!10327) Bool)

(assert (=> b!529869 (= res!325717 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10324))))

(declare-fun e!308722 () Bool)

(declare-fun b!529870 () Bool)

(assert (=> b!529870 (= e!308722 (= (seekEntryOrOpen!0 (select (arr!16130 a!3235) j!176) a!3235 mask!3524) (Found!4594 j!176)))))

(declare-fun b!529871 () Bool)

(declare-fun res!325719 () Bool)

(assert (=> b!529871 (=> (not res!325719) (not e!308725))))

(assert (=> b!529871 (= res!325719 (and (= (size!16495 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16495 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16495 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529872 () Bool)

(declare-fun res!325724 () Bool)

(assert (=> b!529872 (=> (not res!325724) (not e!308725))))

(assert (=> b!529872 (= res!325724 (validKeyInArray!0 k0!2280))))

(declare-fun b!529873 () Bool)

(declare-fun e!308724 () Bool)

(assert (=> b!529873 (= e!308726 (not e!308724))))

(declare-fun res!325715 () Bool)

(assert (=> b!529873 (=> res!325715 e!308724)))

(declare-fun lt!244303 () (_ BitVec 32))

(declare-fun lt!244306 () SeekEntryResult!4594)

(declare-fun lt!244298 () array!33566)

(declare-fun lt!244305 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33566 (_ BitVec 32)) SeekEntryResult!4594)

(assert (=> b!529873 (= res!325715 (= lt!244306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244303 lt!244305 lt!244298 mask!3524)))))

(declare-fun lt!244299 () (_ BitVec 32))

(assert (=> b!529873 (= lt!244306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244299 (select (arr!16130 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529873 (= lt!244303 (toIndex!0 lt!244305 mask!3524))))

(assert (=> b!529873 (= lt!244305 (select (store (arr!16130 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529873 (= lt!244299 (toIndex!0 (select (arr!16130 a!3235) j!176) mask!3524))))

(assert (=> b!529873 (= lt!244298 (array!33567 (store (arr!16130 a!3235) i!1204 k0!2280) (size!16495 a!3235)))))

(assert (=> b!529873 e!308722))

(declare-fun res!325721 () Bool)

(assert (=> b!529873 (=> (not res!325721) (not e!308722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33566 (_ BitVec 32)) Bool)

(assert (=> b!529873 (= res!325721 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16786 0))(
  ( (Unit!16787) )
))
(declare-fun lt!244300 () Unit!16786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16786)

(assert (=> b!529873 (= lt!244300 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529874 () Bool)

(declare-fun e!308723 () Bool)

(assert (=> b!529874 (= e!308723 true)))

(declare-fun lt!244304 () SeekEntryResult!4594)

(assert (=> b!529874 (= lt!244304 (seekEntryOrOpen!0 lt!244305 lt!244298 mask!3524))))

(assert (=> b!529874 false))

(declare-fun b!529875 () Bool)

(declare-fun res!325720 () Bool)

(assert (=> b!529875 (=> (not res!325720) (not e!308726))))

(assert (=> b!529875 (= res!325720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529876 () Bool)

(assert (=> b!529876 (= e!308724 e!308723)))

(declare-fun res!325714 () Bool)

(assert (=> b!529876 (=> res!325714 e!308723)))

(declare-fun lt!244301 () Bool)

(assert (=> b!529876 (= res!325714 (or (and (not lt!244301) (undefined!5406 lt!244306)) (and (not lt!244301) (not (undefined!5406 lt!244306)))))))

(get-info :version)

(assert (=> b!529876 (= lt!244301 (not ((_ is Intermediate!4594) lt!244306)))))

(assert (= (and start!48120 res!325722) b!529871))

(assert (= (and b!529871 res!325719) b!529867))

(assert (= (and b!529867 res!325718) b!529872))

(assert (= (and b!529872 res!325724) b!529868))

(assert (= (and b!529868 res!325723) b!529866))

(assert (= (and b!529866 res!325716) b!529875))

(assert (= (and b!529875 res!325720) b!529869))

(assert (= (and b!529869 res!325717) b!529873))

(assert (= (and b!529873 res!325721) b!529870))

(assert (= (and b!529873 (not res!325715)) b!529876))

(assert (= (and b!529876 (not res!325714)) b!529874))

(declare-fun m!509923 () Bool)

(assert (=> b!529866 m!509923))

(declare-fun m!509925 () Bool)

(assert (=> b!529867 m!509925))

(assert (=> b!529867 m!509925))

(declare-fun m!509927 () Bool)

(assert (=> b!529867 m!509927))

(declare-fun m!509929 () Bool)

(assert (=> b!529874 m!509929))

(declare-fun m!509931 () Bool)

(assert (=> b!529872 m!509931))

(declare-fun m!509933 () Bool)

(assert (=> b!529869 m!509933))

(assert (=> b!529870 m!509925))

(assert (=> b!529870 m!509925))

(declare-fun m!509935 () Bool)

(assert (=> b!529870 m!509935))

(declare-fun m!509937 () Bool)

(assert (=> b!529873 m!509937))

(assert (=> b!529873 m!509925))

(declare-fun m!509939 () Bool)

(assert (=> b!529873 m!509939))

(declare-fun m!509941 () Bool)

(assert (=> b!529873 m!509941))

(declare-fun m!509943 () Bool)

(assert (=> b!529873 m!509943))

(declare-fun m!509945 () Bool)

(assert (=> b!529873 m!509945))

(declare-fun m!509947 () Bool)

(assert (=> b!529873 m!509947))

(assert (=> b!529873 m!509925))

(declare-fun m!509949 () Bool)

(assert (=> b!529873 m!509949))

(assert (=> b!529873 m!509925))

(declare-fun m!509951 () Bool)

(assert (=> b!529873 m!509951))

(declare-fun m!509953 () Bool)

(assert (=> start!48120 m!509953))

(declare-fun m!509955 () Bool)

(assert (=> start!48120 m!509955))

(declare-fun m!509957 () Bool)

(assert (=> b!529875 m!509957))

(declare-fun m!509959 () Bool)

(assert (=> b!529868 m!509959))

(check-sat (not b!529869) (not b!529866) (not b!529875) (not b!529870) (not b!529868) (not b!529874) (not b!529872) (not b!529867) (not b!529873) (not start!48120))
(check-sat)
