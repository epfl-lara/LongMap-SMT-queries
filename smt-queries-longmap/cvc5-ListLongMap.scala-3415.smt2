; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47412 () Bool)

(assert start!47412)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33238 0))(
  ( (array!33239 (arr!15975 (Array (_ BitVec 32) (_ BitVec 64))) (size!16339 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33238)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!521620 () Bool)

(declare-fun e!304305 () Bool)

(declare-datatypes ((SeekEntryResult!4442 0))(
  ( (MissingZero!4442 (index!19971 (_ BitVec 32))) (Found!4442 (index!19972 (_ BitVec 32))) (Intermediate!4442 (undefined!5254 Bool) (index!19973 (_ BitVec 32)) (x!48956 (_ BitVec 32))) (Undefined!4442) (MissingVacant!4442 (index!19974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33238 (_ BitVec 32)) SeekEntryResult!4442)

(assert (=> b!521620 (= e!304305 (= (seekEntryOrOpen!0 (select (arr!15975 a!3235) j!176) a!3235 mask!3524) (Found!4442 j!176)))))

(declare-fun b!521621 () Bool)

(declare-datatypes ((Unit!16220 0))(
  ( (Unit!16221) )
))
(declare-fun e!304309 () Unit!16220)

(declare-fun Unit!16222 () Unit!16220)

(assert (=> b!521621 (= e!304309 Unit!16222)))

(declare-fun b!521622 () Bool)

(declare-fun e!304310 () Bool)

(assert (=> b!521622 (= e!304310 false)))

(declare-fun b!521623 () Bool)

(declare-fun res!319400 () Bool)

(declare-fun e!304306 () Bool)

(assert (=> b!521623 (=> res!319400 e!304306)))

(declare-fun lt!239076 () SeekEntryResult!4442)

(assert (=> b!521623 (= res!319400 (or (undefined!5254 lt!239076) (not (is-Intermediate!4442 lt!239076))))))

(declare-fun b!521624 () Bool)

(declare-fun res!319394 () Bool)

(declare-fun e!304307 () Bool)

(assert (=> b!521624 (=> (not res!319394) (not e!304307))))

(declare-datatypes ((List!10133 0))(
  ( (Nil!10130) (Cons!10129 (h!11051 (_ BitVec 64)) (t!16361 List!10133)) )
))
(declare-fun arrayNoDuplicates!0 (array!33238 (_ BitVec 32) List!10133) Bool)

(assert (=> b!521624 (= res!319394 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10130))))

(declare-fun b!521625 () Bool)

(assert (=> b!521625 (= e!304307 (not e!304306))))

(declare-fun res!319401 () Bool)

(assert (=> b!521625 (=> res!319401 e!304306)))

(declare-fun lt!239077 () array!33238)

(declare-fun lt!239078 () (_ BitVec 64))

(declare-fun lt!239081 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33238 (_ BitVec 32)) SeekEntryResult!4442)

(assert (=> b!521625 (= res!319401 (= lt!239076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239081 lt!239078 lt!239077 mask!3524)))))

(declare-fun lt!239083 () (_ BitVec 32))

(assert (=> b!521625 (= lt!239076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239083 (select (arr!15975 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521625 (= lt!239081 (toIndex!0 lt!239078 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521625 (= lt!239078 (select (store (arr!15975 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521625 (= lt!239083 (toIndex!0 (select (arr!15975 a!3235) j!176) mask!3524))))

(assert (=> b!521625 (= lt!239077 (array!33239 (store (arr!15975 a!3235) i!1204 k!2280) (size!16339 a!3235)))))

(assert (=> b!521625 e!304305))

(declare-fun res!319396 () Bool)

(assert (=> b!521625 (=> (not res!319396) (not e!304305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33238 (_ BitVec 32)) Bool)

(assert (=> b!521625 (= res!319396 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239079 () Unit!16220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16220)

(assert (=> b!521625 (= lt!239079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521626 () Bool)

(declare-fun e!304308 () Bool)

(assert (=> b!521626 (= e!304308 e!304307)))

(declare-fun res!319398 () Bool)

(assert (=> b!521626 (=> (not res!319398) (not e!304307))))

(declare-fun lt!239080 () SeekEntryResult!4442)

(assert (=> b!521626 (= res!319398 (or (= lt!239080 (MissingZero!4442 i!1204)) (= lt!239080 (MissingVacant!4442 i!1204))))))

(assert (=> b!521626 (= lt!239080 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521627 () Bool)

(declare-fun res!319397 () Bool)

(assert (=> b!521627 (=> (not res!319397) (not e!304308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521627 (= res!319397 (validKeyInArray!0 (select (arr!15975 a!3235) j!176)))))

(declare-fun b!521628 () Bool)

(assert (=> b!521628 (= e!304306 true)))

(assert (=> b!521628 (and (or (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239075 () Unit!16220)

(assert (=> b!521628 (= lt!239075 e!304309)))

(declare-fun c!61415 () Bool)

(assert (=> b!521628 (= c!61415 (= (select (arr!15975 a!3235) (index!19973 lt!239076)) (select (arr!15975 a!3235) j!176)))))

(assert (=> b!521628 (and (bvslt (x!48956 lt!239076) #b01111111111111111111111111111110) (or (= (select (arr!15975 a!3235) (index!19973 lt!239076)) (select (arr!15975 a!3235) j!176)) (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15975 a!3235) (index!19973 lt!239076)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521629 () Bool)

(declare-fun res!319393 () Bool)

(assert (=> b!521629 (=> (not res!319393) (not e!304308))))

(assert (=> b!521629 (= res!319393 (and (= (size!16339 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16339 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16339 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521630 () Bool)

(declare-fun Unit!16223 () Unit!16220)

(assert (=> b!521630 (= e!304309 Unit!16223)))

(declare-fun lt!239082 () Unit!16220)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33238 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16220)

(assert (=> b!521630 (= lt!239082 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239083 #b00000000000000000000000000000000 (index!19973 lt!239076) (x!48956 lt!239076) mask!3524))))

(declare-fun res!319395 () Bool)

(assert (=> b!521630 (= res!319395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239083 lt!239078 lt!239077 mask!3524) (Intermediate!4442 false (index!19973 lt!239076) (x!48956 lt!239076))))))

(assert (=> b!521630 (=> (not res!319395) (not e!304310))))

(assert (=> b!521630 e!304310))

(declare-fun b!521631 () Bool)

(declare-fun res!319399 () Bool)

(assert (=> b!521631 (=> (not res!319399) (not e!304308))))

(declare-fun arrayContainsKey!0 (array!33238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521631 (= res!319399 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!319402 () Bool)

(assert (=> start!47412 (=> (not res!319402) (not e!304308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47412 (= res!319402 (validMask!0 mask!3524))))

(assert (=> start!47412 e!304308))

(assert (=> start!47412 true))

(declare-fun array_inv!11771 (array!33238) Bool)

(assert (=> start!47412 (array_inv!11771 a!3235)))

(declare-fun b!521632 () Bool)

(declare-fun res!319403 () Bool)

(assert (=> b!521632 (=> (not res!319403) (not e!304307))))

(assert (=> b!521632 (= res!319403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521633 () Bool)

(declare-fun res!319392 () Bool)

(assert (=> b!521633 (=> (not res!319392) (not e!304308))))

(assert (=> b!521633 (= res!319392 (validKeyInArray!0 k!2280))))

(assert (= (and start!47412 res!319402) b!521629))

(assert (= (and b!521629 res!319393) b!521627))

(assert (= (and b!521627 res!319397) b!521633))

(assert (= (and b!521633 res!319392) b!521631))

(assert (= (and b!521631 res!319399) b!521626))

(assert (= (and b!521626 res!319398) b!521632))

(assert (= (and b!521632 res!319403) b!521624))

(assert (= (and b!521624 res!319394) b!521625))

(assert (= (and b!521625 res!319396) b!521620))

(assert (= (and b!521625 (not res!319401)) b!521623))

(assert (= (and b!521623 (not res!319400)) b!521628))

(assert (= (and b!521628 c!61415) b!521630))

(assert (= (and b!521628 (not c!61415)) b!521621))

(assert (= (and b!521630 res!319395) b!521622))

(declare-fun m!502533 () Bool)

(assert (=> b!521620 m!502533))

(assert (=> b!521620 m!502533))

(declare-fun m!502535 () Bool)

(assert (=> b!521620 m!502535))

(declare-fun m!502537 () Bool)

(assert (=> b!521628 m!502537))

(assert (=> b!521628 m!502533))

(declare-fun m!502539 () Bool)

(assert (=> b!521624 m!502539))

(declare-fun m!502541 () Bool)

(assert (=> b!521633 m!502541))

(assert (=> b!521627 m!502533))

(assert (=> b!521627 m!502533))

(declare-fun m!502543 () Bool)

(assert (=> b!521627 m!502543))

(declare-fun m!502545 () Bool)

(assert (=> b!521625 m!502545))

(declare-fun m!502547 () Bool)

(assert (=> b!521625 m!502547))

(declare-fun m!502549 () Bool)

(assert (=> b!521625 m!502549))

(declare-fun m!502551 () Bool)

(assert (=> b!521625 m!502551))

(assert (=> b!521625 m!502533))

(declare-fun m!502553 () Bool)

(assert (=> b!521625 m!502553))

(assert (=> b!521625 m!502533))

(declare-fun m!502555 () Bool)

(assert (=> b!521625 m!502555))

(assert (=> b!521625 m!502533))

(declare-fun m!502557 () Bool)

(assert (=> b!521625 m!502557))

(declare-fun m!502559 () Bool)

(assert (=> b!521625 m!502559))

(declare-fun m!502561 () Bool)

(assert (=> b!521630 m!502561))

(declare-fun m!502563 () Bool)

(assert (=> b!521630 m!502563))

(declare-fun m!502565 () Bool)

(assert (=> b!521632 m!502565))

(declare-fun m!502567 () Bool)

(assert (=> b!521626 m!502567))

(declare-fun m!502569 () Bool)

(assert (=> start!47412 m!502569))

(declare-fun m!502571 () Bool)

(assert (=> start!47412 m!502571))

(declare-fun m!502573 () Bool)

(assert (=> b!521631 m!502573))

(push 1)

