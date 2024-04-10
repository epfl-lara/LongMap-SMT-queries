; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47812 () Bool)

(assert start!47812)

(declare-fun b!526852 () Bool)

(declare-fun res!323416 () Bool)

(declare-fun e!307069 () Bool)

(assert (=> b!526852 (=> (not res!323416) (not e!307069))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33449 0))(
  ( (array!33450 (arr!16076 (Array (_ BitVec 32) (_ BitVec 64))) (size!16440 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33449)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526852 (= res!323416 (and (= (size!16440 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16440 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16440 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526853 () Bool)

(declare-fun res!323424 () Bool)

(declare-fun e!307067 () Bool)

(assert (=> b!526853 (=> (not res!323424) (not e!307067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33449 (_ BitVec 32)) Bool)

(assert (=> b!526853 (= res!323424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526854 () Bool)

(declare-datatypes ((Unit!16624 0))(
  ( (Unit!16625) )
))
(declare-fun e!307068 () Unit!16624)

(declare-fun Unit!16626 () Unit!16624)

(assert (=> b!526854 (= e!307068 Unit!16626)))

(declare-fun lt!242406 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!242410 () Unit!16624)

(declare-datatypes ((SeekEntryResult!4543 0))(
  ( (MissingZero!4543 (index!20384 (_ BitVec 32))) (Found!4543 (index!20385 (_ BitVec 32))) (Intermediate!4543 (undefined!5355 Bool) (index!20386 (_ BitVec 32)) (x!49348 (_ BitVec 32))) (Undefined!4543) (MissingVacant!4543 (index!20387 (_ BitVec 32))) )
))
(declare-fun lt!242412 () SeekEntryResult!4543)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16624)

(assert (=> b!526854 (= lt!242410 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!242406 #b00000000000000000000000000000000 (index!20386 lt!242412) (x!49348 lt!242412) mask!3524))))

(declare-fun lt!242407 () (_ BitVec 64))

(declare-fun res!323415 () Bool)

(declare-fun lt!242408 () array!33449)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33449 (_ BitVec 32)) SeekEntryResult!4543)

(assert (=> b!526854 (= res!323415 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242406 lt!242407 lt!242408 mask!3524) (Intermediate!4543 false (index!20386 lt!242412) (x!49348 lt!242412))))))

(declare-fun e!307066 () Bool)

(assert (=> b!526854 (=> (not res!323415) (not e!307066))))

(assert (=> b!526854 e!307066))

(declare-fun b!526855 () Bool)

(declare-fun Unit!16627 () Unit!16624)

(assert (=> b!526855 (= e!307068 Unit!16627)))

(declare-fun b!526856 () Bool)

(declare-fun res!323426 () Bool)

(assert (=> b!526856 (=> (not res!323426) (not e!307067))))

(declare-datatypes ((List!10234 0))(
  ( (Nil!10231) (Cons!10230 (h!11161 (_ BitVec 64)) (t!16462 List!10234)) )
))
(declare-fun arrayNoDuplicates!0 (array!33449 (_ BitVec 32) List!10234) Bool)

(assert (=> b!526856 (= res!323426 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10231))))

(declare-fun b!526857 () Bool)

(declare-fun e!307065 () Bool)

(assert (=> b!526857 (= e!307065 (bvsle (x!49348 lt!242412) #b01111111111111111111111111111110))))

(assert (=> b!526857 (= (index!20386 lt!242412) i!1204)))

(declare-fun lt!242411 () Unit!16624)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33449 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16624)

(assert (=> b!526857 (= lt!242411 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!242406 #b00000000000000000000000000000000 (index!20386 lt!242412) (x!49348 lt!242412) mask!3524))))

(assert (=> b!526857 (and (or (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242404 () Unit!16624)

(assert (=> b!526857 (= lt!242404 e!307068)))

(declare-fun c!62024 () Bool)

(assert (=> b!526857 (= c!62024 (= (select (arr!16076 a!3235) (index!20386 lt!242412)) (select (arr!16076 a!3235) j!176)))))

(assert (=> b!526857 (and (bvslt (x!49348 lt!242412) #b01111111111111111111111111111110) (or (= (select (arr!16076 a!3235) (index!20386 lt!242412)) (select (arr!16076 a!3235) j!176)) (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16076 a!3235) (index!20386 lt!242412)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526858 () Bool)

(assert (=> b!526858 (= e!307066 false)))

(declare-fun res!323418 () Bool)

(assert (=> start!47812 (=> (not res!323418) (not e!307069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47812 (= res!323418 (validMask!0 mask!3524))))

(assert (=> start!47812 e!307069))

(assert (=> start!47812 true))

(declare-fun array_inv!11872 (array!33449) Bool)

(assert (=> start!47812 (array_inv!11872 a!3235)))

(declare-fun b!526859 () Bool)

(declare-fun res!323420 () Bool)

(assert (=> b!526859 (=> (not res!323420) (not e!307069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526859 (= res!323420 (validKeyInArray!0 k!2280))))

(declare-fun b!526860 () Bool)

(declare-fun e!307070 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33449 (_ BitVec 32)) SeekEntryResult!4543)

(assert (=> b!526860 (= e!307070 (= (seekEntryOrOpen!0 (select (arr!16076 a!3235) j!176) a!3235 mask!3524) (Found!4543 j!176)))))

(declare-fun b!526861 () Bool)

(assert (=> b!526861 (= e!307069 e!307067)))

(declare-fun res!323422 () Bool)

(assert (=> b!526861 (=> (not res!323422) (not e!307067))))

(declare-fun lt!242409 () SeekEntryResult!4543)

(assert (=> b!526861 (= res!323422 (or (= lt!242409 (MissingZero!4543 i!1204)) (= lt!242409 (MissingVacant!4543 i!1204))))))

(assert (=> b!526861 (= lt!242409 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526862 () Bool)

(declare-fun res!323421 () Bool)

(assert (=> b!526862 (=> res!323421 e!307065)))

(assert (=> b!526862 (= res!323421 (or (undefined!5355 lt!242412) (not (is-Intermediate!4543 lt!242412))))))

(declare-fun b!526863 () Bool)

(declare-fun res!323425 () Bool)

(assert (=> b!526863 (=> (not res!323425) (not e!307069))))

(assert (=> b!526863 (= res!323425 (validKeyInArray!0 (select (arr!16076 a!3235) j!176)))))

(declare-fun b!526864 () Bool)

(assert (=> b!526864 (= e!307067 (not e!307065))))

(declare-fun res!323423 () Bool)

(assert (=> b!526864 (=> res!323423 e!307065)))

(declare-fun lt!242413 () (_ BitVec 32))

(assert (=> b!526864 (= res!323423 (= lt!242412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242413 lt!242407 lt!242408 mask!3524)))))

(assert (=> b!526864 (= lt!242412 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242406 (select (arr!16076 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526864 (= lt!242413 (toIndex!0 lt!242407 mask!3524))))

(assert (=> b!526864 (= lt!242407 (select (store (arr!16076 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526864 (= lt!242406 (toIndex!0 (select (arr!16076 a!3235) j!176) mask!3524))))

(assert (=> b!526864 (= lt!242408 (array!33450 (store (arr!16076 a!3235) i!1204 k!2280) (size!16440 a!3235)))))

(assert (=> b!526864 e!307070))

(declare-fun res!323417 () Bool)

(assert (=> b!526864 (=> (not res!323417) (not e!307070))))

(assert (=> b!526864 (= res!323417 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!242405 () Unit!16624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16624)

(assert (=> b!526864 (= lt!242405 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526865 () Bool)

(declare-fun res!323419 () Bool)

(assert (=> b!526865 (=> (not res!323419) (not e!307069))))

(declare-fun arrayContainsKey!0 (array!33449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526865 (= res!323419 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47812 res!323418) b!526852))

(assert (= (and b!526852 res!323416) b!526863))

(assert (= (and b!526863 res!323425) b!526859))

(assert (= (and b!526859 res!323420) b!526865))

(assert (= (and b!526865 res!323419) b!526861))

(assert (= (and b!526861 res!323422) b!526853))

(assert (= (and b!526853 res!323424) b!526856))

(assert (= (and b!526856 res!323426) b!526864))

(assert (= (and b!526864 res!323417) b!526860))

(assert (= (and b!526864 (not res!323423)) b!526862))

(assert (= (and b!526862 (not res!323421)) b!526857))

(assert (= (and b!526857 c!62024) b!526854))

(assert (= (and b!526857 (not c!62024)) b!526855))

(assert (= (and b!526854 res!323415) b!526858))

(declare-fun m!507577 () Bool)

(assert (=> b!526861 m!507577))

(declare-fun m!507579 () Bool)

(assert (=> b!526864 m!507579))

(declare-fun m!507581 () Bool)

(assert (=> b!526864 m!507581))

(declare-fun m!507583 () Bool)

(assert (=> b!526864 m!507583))

(declare-fun m!507585 () Bool)

(assert (=> b!526864 m!507585))

(declare-fun m!507587 () Bool)

(assert (=> b!526864 m!507587))

(declare-fun m!507589 () Bool)

(assert (=> b!526864 m!507589))

(assert (=> b!526864 m!507587))

(declare-fun m!507591 () Bool)

(assert (=> b!526864 m!507591))

(assert (=> b!526864 m!507587))

(declare-fun m!507593 () Bool)

(assert (=> b!526864 m!507593))

(declare-fun m!507595 () Bool)

(assert (=> b!526864 m!507595))

(declare-fun m!507597 () Bool)

(assert (=> b!526854 m!507597))

(declare-fun m!507599 () Bool)

(assert (=> b!526854 m!507599))

(declare-fun m!507601 () Bool)

(assert (=> b!526853 m!507601))

(declare-fun m!507603 () Bool)

(assert (=> b!526859 m!507603))

(declare-fun m!507605 () Bool)

(assert (=> b!526857 m!507605))

(declare-fun m!507607 () Bool)

(assert (=> b!526857 m!507607))

(assert (=> b!526857 m!507587))

(assert (=> b!526863 m!507587))

(assert (=> b!526863 m!507587))

(declare-fun m!507609 () Bool)

(assert (=> b!526863 m!507609))

(declare-fun m!507611 () Bool)

(assert (=> b!526856 m!507611))

(assert (=> b!526860 m!507587))

(assert (=> b!526860 m!507587))

(declare-fun m!507613 () Bool)

(assert (=> b!526860 m!507613))

(declare-fun m!507615 () Bool)

(assert (=> start!47812 m!507615))

(declare-fun m!507617 () Bool)

(assert (=> start!47812 m!507617))

(declare-fun m!507619 () Bool)

(assert (=> b!526865 m!507619))

(push 1)

