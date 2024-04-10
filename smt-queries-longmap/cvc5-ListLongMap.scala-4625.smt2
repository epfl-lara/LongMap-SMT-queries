; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64384 () Bool)

(assert start!64384)

(declare-fun b!724185 () Bool)

(declare-fun res!485667 () Bool)

(declare-fun e!405623 () Bool)

(assert (=> b!724185 (=> (not res!485667) (not e!405623))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40965 0))(
  ( (array!40966 (arr!19605 (Array (_ BitVec 32) (_ BitVec 64))) (size!20026 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40965)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724185 (= res!485667 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20026 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20026 a!3186))))))

(declare-fun b!724186 () Bool)

(declare-fun res!485672 () Bool)

(declare-fun e!405627 () Bool)

(assert (=> b!724186 (=> (not res!485672) (not e!405627))))

(declare-fun e!405629 () Bool)

(assert (=> b!724186 (= res!485672 e!405629)))

(declare-fun c!79633 () Bool)

(assert (=> b!724186 (= c!79633 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724187 () Bool)

(declare-fun res!485665 () Bool)

(assert (=> b!724187 (=> (not res!485665) (not e!405627))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724187 (= res!485665 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19605 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724188 () Bool)

(declare-fun res!485675 () Bool)

(declare-fun e!405624 () Bool)

(assert (=> b!724188 (=> (not res!485675) (not e!405624))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!724188 (= res!485675 (and (= (size!20026 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20026 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20026 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724189 () Bool)

(declare-datatypes ((SeekEntryResult!7205 0))(
  ( (MissingZero!7205 (index!31188 (_ BitVec 32))) (Found!7205 (index!31189 (_ BitVec 32))) (Intermediate!7205 (undefined!8017 Bool) (index!31190 (_ BitVec 32)) (x!62182 (_ BitVec 32))) (Undefined!7205) (MissingVacant!7205 (index!31191 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40965 (_ BitVec 32)) SeekEntryResult!7205)

(assert (=> b!724189 (= e!405629 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) (Found!7205 j!159)))))

(declare-fun b!724190 () Bool)

(declare-fun res!485664 () Bool)

(assert (=> b!724190 (=> (not res!485664) (not e!405624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724190 (= res!485664 (validKeyInArray!0 (select (arr!19605 a!3186) j!159)))))

(declare-fun res!485673 () Bool)

(assert (=> start!64384 (=> (not res!485673) (not e!405624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64384 (= res!485673 (validMask!0 mask!3328))))

(assert (=> start!64384 e!405624))

(assert (=> start!64384 true))

(declare-fun array_inv!15401 (array!40965) Bool)

(assert (=> start!64384 (array_inv!15401 a!3186)))

(declare-fun b!724191 () Bool)

(declare-fun res!485674 () Bool)

(assert (=> b!724191 (=> (not res!485674) (not e!405624))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724191 (= res!485674 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724192 () Bool)

(declare-fun res!485663 () Bool)

(assert (=> b!724192 (=> (not res!485663) (not e!405623))))

(declare-datatypes ((List!13607 0))(
  ( (Nil!13604) (Cons!13603 (h!14657 (_ BitVec 64)) (t!19922 List!13607)) )
))
(declare-fun arrayNoDuplicates!0 (array!40965 (_ BitVec 32) List!13607) Bool)

(assert (=> b!724192 (= res!485663 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13604))))

(declare-fun b!724193 () Bool)

(assert (=> b!724193 (= e!405624 e!405623)))

(declare-fun res!485666 () Bool)

(assert (=> b!724193 (=> (not res!485666) (not e!405623))))

(declare-fun lt!320905 () SeekEntryResult!7205)

(assert (=> b!724193 (= res!485666 (or (= lt!320905 (MissingZero!7205 i!1173)) (= lt!320905 (MissingVacant!7205 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40965 (_ BitVec 32)) SeekEntryResult!7205)

(assert (=> b!724193 (= lt!320905 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!405625 () Bool)

(declare-fun b!724194 () Bool)

(assert (=> b!724194 (= e!405625 (= (seekEntryOrOpen!0 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) (Found!7205 j!159)))))

(declare-fun b!724195 () Bool)

(declare-fun lt!320908 () SeekEntryResult!7205)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40965 (_ BitVec 32)) SeekEntryResult!7205)

(assert (=> b!724195 (= e!405629 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) lt!320908))))

(declare-fun b!724196 () Bool)

(declare-fun e!405626 () Bool)

(assert (=> b!724196 (= e!405627 e!405626)))

(declare-fun res!485668 () Bool)

(assert (=> b!724196 (=> (not res!485668) (not e!405626))))

(declare-fun lt!320909 () array!40965)

(declare-fun lt!320907 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724196 (= res!485668 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320907 mask!3328) lt!320907 lt!320909 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320907 lt!320909 mask!3328)))))

(assert (=> b!724196 (= lt!320907 (select (store (arr!19605 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724196 (= lt!320909 (array!40966 (store (arr!19605 a!3186) i!1173 k!2102) (size!20026 a!3186)))))

(declare-fun b!724197 () Bool)

(assert (=> b!724197 (= e!405626 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge resIntermediateX!5 #b00000000000000000000000000000000))))))

(assert (=> b!724197 e!405625))

(declare-fun res!485671 () Bool)

(assert (=> b!724197 (=> (not res!485671) (not e!405625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40965 (_ BitVec 32)) Bool)

(assert (=> b!724197 (= res!485671 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24728 0))(
  ( (Unit!24729) )
))
(declare-fun lt!320906 () Unit!24728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24728)

(assert (=> b!724197 (= lt!320906 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724198 () Bool)

(declare-fun res!485662 () Bool)

(assert (=> b!724198 (=> (not res!485662) (not e!405623))))

(assert (=> b!724198 (= res!485662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724199 () Bool)

(assert (=> b!724199 (= e!405623 e!405627)))

(declare-fun res!485669 () Bool)

(assert (=> b!724199 (=> (not res!485669) (not e!405627))))

(assert (=> b!724199 (= res!485669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) (select (arr!19605 a!3186) j!159) a!3186 mask!3328) lt!320908))))

(assert (=> b!724199 (= lt!320908 (Intermediate!7205 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724200 () Bool)

(declare-fun res!485670 () Bool)

(assert (=> b!724200 (=> (not res!485670) (not e!405624))))

(assert (=> b!724200 (= res!485670 (validKeyInArray!0 k!2102))))

(assert (= (and start!64384 res!485673) b!724188))

(assert (= (and b!724188 res!485675) b!724190))

(assert (= (and b!724190 res!485664) b!724200))

(assert (= (and b!724200 res!485670) b!724191))

(assert (= (and b!724191 res!485674) b!724193))

(assert (= (and b!724193 res!485666) b!724198))

(assert (= (and b!724198 res!485662) b!724192))

(assert (= (and b!724192 res!485663) b!724185))

(assert (= (and b!724185 res!485667) b!724199))

(assert (= (and b!724199 res!485669) b!724187))

(assert (= (and b!724187 res!485665) b!724186))

(assert (= (and b!724186 c!79633) b!724195))

(assert (= (and b!724186 (not c!79633)) b!724189))

(assert (= (and b!724186 res!485672) b!724196))

(assert (= (and b!724196 res!485668) b!724197))

(assert (= (and b!724197 res!485671) b!724194))

(declare-fun m!678565 () Bool)

(assert (=> b!724195 m!678565))

(assert (=> b!724195 m!678565))

(declare-fun m!678567 () Bool)

(assert (=> b!724195 m!678567))

(declare-fun m!678569 () Bool)

(assert (=> b!724191 m!678569))

(declare-fun m!678571 () Bool)

(assert (=> b!724196 m!678571))

(declare-fun m!678573 () Bool)

(assert (=> b!724196 m!678573))

(declare-fun m!678575 () Bool)

(assert (=> b!724196 m!678575))

(declare-fun m!678577 () Bool)

(assert (=> b!724196 m!678577))

(assert (=> b!724196 m!678575))

(declare-fun m!678579 () Bool)

(assert (=> b!724196 m!678579))

(assert (=> b!724199 m!678565))

(assert (=> b!724199 m!678565))

(declare-fun m!678581 () Bool)

(assert (=> b!724199 m!678581))

(assert (=> b!724199 m!678581))

(assert (=> b!724199 m!678565))

(declare-fun m!678583 () Bool)

(assert (=> b!724199 m!678583))

(assert (=> b!724190 m!678565))

(assert (=> b!724190 m!678565))

(declare-fun m!678585 () Bool)

(assert (=> b!724190 m!678585))

(assert (=> b!724194 m!678565))

(assert (=> b!724194 m!678565))

(declare-fun m!678587 () Bool)

(assert (=> b!724194 m!678587))

(assert (=> b!724189 m!678565))

(assert (=> b!724189 m!678565))

(declare-fun m!678589 () Bool)

(assert (=> b!724189 m!678589))

(declare-fun m!678591 () Bool)

(assert (=> b!724187 m!678591))

(declare-fun m!678593 () Bool)

(assert (=> b!724197 m!678593))

(declare-fun m!678595 () Bool)

(assert (=> b!724197 m!678595))

(declare-fun m!678597 () Bool)

(assert (=> b!724200 m!678597))

(declare-fun m!678599 () Bool)

(assert (=> b!724193 m!678599))

(declare-fun m!678601 () Bool)

(assert (=> start!64384 m!678601))

(declare-fun m!678603 () Bool)

(assert (=> start!64384 m!678603))

(declare-fun m!678605 () Bool)

(assert (=> b!724192 m!678605))

(declare-fun m!678607 () Bool)

(assert (=> b!724198 m!678607))

(push 1)

(assert (not b!724190))

(assert (not b!724193))

(assert (not b!724197))

(assert (not start!64384))

(assert (not b!724195))

(assert (not b!724199))

(assert (not b!724198))

(assert (not b!724192))

(assert (not b!724196))

(assert (not b!724194))

(assert (not b!724191))

(assert (not b!724200))

(assert (not b!724189))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99311 () Bool)

(declare-fun res!485773 () Bool)

(declare-fun e!405703 () Bool)

(assert (=> d!99311 (=> res!485773 e!405703)))

(assert (=> d!99311 (= res!485773 (= (select (arr!19605 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99311 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!405703)))

(declare-fun b!724346 () Bool)

(declare-fun e!405704 () Bool)

(assert (=> b!724346 (= e!405703 e!405704)))

(declare-fun res!485774 () Bool)

(assert (=> b!724346 (=> (not res!485774) (not e!405704))))

(assert (=> b!724346 (= res!485774 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20026 a!3186)))))

(declare-fun b!724347 () Bool)

(assert (=> b!724347 (= e!405704 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99311 (not res!485773)) b!724346))

(assert (= (and b!724346 res!485774) b!724347))

(declare-fun m!678715 () Bool)

(assert (=> d!99311 m!678715))

(declare-fun m!678717 () Bool)

(assert (=> b!724347 m!678717))

(assert (=> b!724191 d!99311))

(declare-fun bm!34790 () Bool)

(declare-fun call!34793 () Bool)

(declare-fun c!79665 () Bool)

(assert (=> bm!34790 (= call!34793 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79665 (Cons!13603 (select (arr!19605 a!3186) #b00000000000000000000000000000000) Nil!13604) Nil!13604)))))

(declare-fun d!99315 () Bool)

(declare-fun res!485786 () Bool)

(declare-fun e!405725 () Bool)

(assert (=> d!99315 (=> res!485786 e!405725)))

(assert (=> d!99315 (= res!485786 (bvsge #b00000000000000000000000000000000 (size!20026 a!3186)))))

(assert (=> d!99315 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13604) e!405725)))

(declare-fun b!724372 () Bool)

(declare-fun e!405722 () Bool)

(declare-fun contains!4047 (List!13607 (_ BitVec 64)) Bool)

(assert (=> b!724372 (= e!405722 (contains!4047 Nil!13604 (select (arr!19605 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724373 () Bool)

(declare-fun e!405724 () Bool)

(declare-fun e!405723 () Bool)

(assert (=> b!724373 (= e!405724 e!405723)))

(assert (=> b!724373 (= c!79665 (validKeyInArray!0 (select (arr!19605 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724374 () Bool)

(assert (=> b!724374 (= e!405723 call!34793)))

(declare-fun b!724375 () Bool)

(assert (=> b!724375 (= e!405725 e!405724)))

(declare-fun res!485785 () Bool)

(assert (=> b!724375 (=> (not res!485785) (not e!405724))))

(assert (=> b!724375 (= res!485785 (not e!405722))))

(declare-fun res!485787 () Bool)

(assert (=> b!724375 (=> (not res!485787) (not e!405722))))

(assert (=> b!724375 (= res!485787 (validKeyInArray!0 (select (arr!19605 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!724376 () Bool)

(assert (=> b!724376 (= e!405723 call!34793)))

(assert (= (and d!99315 (not res!485786)) b!724375))

(assert (= (and b!724375 res!485787) b!724372))

(assert (= (and b!724375 res!485785) b!724373))

(assert (= (and b!724373 c!79665) b!724374))

(assert (= (and b!724373 (not c!79665)) b!724376))

(assert (= (or b!724374 b!724376) bm!34790))

(assert (=> bm!34790 m!678715))

(declare-fun m!678733 () Bool)

(assert (=> bm!34790 m!678733))

(assert (=> b!724372 m!678715))

(assert (=> b!724372 m!678715))

(declare-fun m!678735 () Bool)

(assert (=> b!724372 m!678735))

(assert (=> b!724373 m!678715))

(assert (=> b!724373 m!678715))

(declare-fun m!678737 () Bool)

(assert (=> b!724373 m!678737))

(assert (=> b!724375 m!678715))

(assert (=> b!724375 m!678715))

(assert (=> b!724375 m!678737))

(assert (=> b!724192 d!99315))

(declare-fun e!405762 () SeekEntryResult!7205)

(declare-fun b!724438 () Bool)

(assert (=> b!724438 (= e!405762 (Intermediate!7205 false (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724440 () Bool)

(declare-fun lt!320982 () SeekEntryResult!7205)

(assert (=> b!724440 (and (bvsge (index!31190 lt!320982) #b00000000000000000000000000000000) (bvslt (index!31190 lt!320982) (size!20026 a!3186)))))

(declare-fun res!485806 () Bool)

(assert (=> b!724440 (= res!485806 (= (select (arr!19605 a!3186) (index!31190 lt!320982)) (select (arr!19605 a!3186) j!159)))))

(declare-fun e!405761 () Bool)

(assert (=> b!724440 (=> res!485806 e!405761)))

(declare-fun e!405760 () Bool)

(assert (=> b!724440 (= e!405760 e!405761)))

(declare-fun b!724441 () Bool)

(assert (=> b!724441 (and (bvsge (index!31190 lt!320982) #b00000000000000000000000000000000) (bvslt (index!31190 lt!320982) (size!20026 a!3186)))))

(declare-fun res!485807 () Bool)

(assert (=> b!724441 (= res!485807 (= (select (arr!19605 a!3186) (index!31190 lt!320982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724441 (=> res!485807 e!405761)))

(declare-fun e!405764 () SeekEntryResult!7205)

(declare-fun b!724442 () Bool)

(assert (=> b!724442 (= e!405764 (Intermediate!7205 true (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724443 () Bool)

(declare-fun e!405763 () Bool)

(assert (=> b!724443 (= e!405763 e!405760)))

(declare-fun res!485808 () Bool)

(assert (=> b!724443 (= res!485808 (and (is-Intermediate!7205 lt!320982) (not (undefined!8017 lt!320982)) (bvslt (x!62182 lt!320982) #b01111111111111111111111111111110) (bvsge (x!62182 lt!320982) #b00000000000000000000000000000000) (bvsge (x!62182 lt!320982) #b00000000000000000000000000000000)))))

(assert (=> b!724443 (=> (not res!485808) (not e!405760))))

(declare-fun b!724444 () Bool)

(assert (=> b!724444 (= e!405764 e!405762)))

(declare-fun c!79690 () Bool)

(declare-fun lt!320981 () (_ BitVec 64))

(assert (=> b!724444 (= c!79690 (or (= lt!320981 (select (arr!19605 a!3186) j!159)) (= (bvadd lt!320981 lt!320981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724439 () Bool)

(assert (=> b!724439 (and (bvsge (index!31190 lt!320982) #b00000000000000000000000000000000) (bvslt (index!31190 lt!320982) (size!20026 a!3186)))))

(assert (=> b!724439 (= e!405761 (= (select (arr!19605 a!3186) (index!31190 lt!320982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99321 () Bool)

(assert (=> d!99321 e!405763))

(declare-fun c!79689 () Bool)

(assert (=> d!99321 (= c!79689 (and (is-Intermediate!7205 lt!320982) (undefined!8017 lt!320982)))))

(assert (=> d!99321 (= lt!320982 e!405764)))

(declare-fun c!79688 () Bool)

(assert (=> d!99321 (= c!79688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99321 (= lt!320981 (select (arr!19605 a!3186) (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328)))))

(assert (=> d!99321 (validMask!0 mask!3328)))

(assert (=> d!99321 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) (select (arr!19605 a!3186) j!159) a!3186 mask!3328) lt!320982)))

(declare-fun b!724445 () Bool)

(assert (=> b!724445 (= e!405763 (bvsge (x!62182 lt!320982) #b01111111111111111111111111111110))))

(declare-fun b!724446 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724446 (= e!405762 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19605 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!99321 c!79688) b!724442))

(assert (= (and d!99321 (not c!79688)) b!724444))

(assert (= (and b!724444 c!79690) b!724438))

(assert (= (and b!724444 (not c!79690)) b!724446))

(assert (= (and d!99321 c!79689) b!724445))

(assert (= (and d!99321 (not c!79689)) b!724443))

(assert (= (and b!724443 res!485808) b!724440))

(assert (= (and b!724440 (not res!485806)) b!724441))

(assert (= (and b!724441 (not res!485807)) b!724439))

(declare-fun m!678755 () Bool)

(assert (=> b!724439 m!678755))

(assert (=> b!724441 m!678755))

(assert (=> b!724440 m!678755))

(assert (=> d!99321 m!678581))

(declare-fun m!678761 () Bool)

(assert (=> d!99321 m!678761))

(assert (=> d!99321 m!678601))

(assert (=> b!724446 m!678581))

(declare-fun m!678767 () Bool)

(assert (=> b!724446 m!678767))

(assert (=> b!724446 m!678767))

(assert (=> b!724446 m!678565))

(declare-fun m!678771 () Bool)

(assert (=> b!724446 m!678771))

(assert (=> b!724199 d!99321))

(declare-fun d!99331 () Bool)

(declare-fun lt!320999 () (_ BitVec 32))

(declare-fun lt!320998 () (_ BitVec 32))

(assert (=> d!99331 (= lt!320999 (bvmul (bvxor lt!320998 (bvlshr lt!320998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99331 (= lt!320998 ((_ extract 31 0) (bvand (bvxor (select (arr!19605 a!3186) j!159) (bvlshr (select (arr!19605 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99331 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485811 (let ((h!14661 ((_ extract 31 0) (bvand (bvxor (select (arr!19605 a!3186) j!159) (bvlshr (select (arr!19605 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62190 (bvmul (bvxor h!14661 (bvlshr h!14661 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62190 (bvlshr x!62190 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485811 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485811 #b00000000000000000000000000000000))))))

(assert (=> d!99331 (= (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) (bvand (bvxor lt!320999 (bvlshr lt!320999 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724199 d!99331))

(declare-fun d!99337 () Bool)

(assert (=> d!99337 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64384 d!99337))

(declare-fun d!99341 () Bool)

(assert (=> d!99341 (= (array_inv!15401 a!3186) (bvsge (size!20026 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64384 d!99341))

(declare-fun d!99343 () Bool)

(assert (=> d!99343 (= (validKeyInArray!0 (select (arr!19605 a!3186) j!159)) (and (not (= (select (arr!19605 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19605 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724190 d!99343))

(declare-fun d!99347 () Bool)

(assert (=> d!99347 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!724200 d!99347))

(declare-fun e!405826 () SeekEntryResult!7205)

(declare-fun b!724545 () Bool)

(assert (=> b!724545 (= e!405826 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19605 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724546 () Bool)

(declare-fun e!405827 () SeekEntryResult!7205)

(assert (=> b!724546 (= e!405827 Undefined!7205)))

(declare-fun b!724548 () Bool)

(declare-fun c!79723 () Bool)

(declare-fun lt!321034 () (_ BitVec 64))

(assert (=> b!724548 (= c!79723 (= lt!321034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!405825 () SeekEntryResult!7205)

(assert (=> b!724548 (= e!405825 e!405826)))

(declare-fun lt!321033 () SeekEntryResult!7205)

(declare-fun d!99349 () Bool)

(assert (=> d!99349 (and (or (is-Undefined!7205 lt!321033) (not (is-Found!7205 lt!321033)) (and (bvsge (index!31189 lt!321033) #b00000000000000000000000000000000) (bvslt (index!31189 lt!321033) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321033) (is-Found!7205 lt!321033) (not (is-MissingVacant!7205 lt!321033)) (not (= (index!31191 lt!321033) resIntermediateIndex!5)) (and (bvsge (index!31191 lt!321033) #b00000000000000000000000000000000) (bvslt (index!31191 lt!321033) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321033) (ite (is-Found!7205 lt!321033) (= (select (arr!19605 a!3186) (index!31189 lt!321033)) (select (arr!19605 a!3186) j!159)) (and (is-MissingVacant!7205 lt!321033) (= (index!31191 lt!321033) resIntermediateIndex!5) (= (select (arr!19605 a!3186) (index!31191 lt!321033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99349 (= lt!321033 e!405827)))

(declare-fun c!79724 () Bool)

(assert (=> d!99349 (= c!79724 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99349 (= lt!321034 (select (arr!19605 a!3186) index!1321))))

(assert (=> d!99349 (validMask!0 mask!3328)))

(assert (=> d!99349 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) lt!321033)))

(declare-fun b!724547 () Bool)

(assert (=> b!724547 (= e!405827 e!405825)))

(declare-fun c!79725 () Bool)

(assert (=> b!724547 (= c!79725 (= lt!321034 (select (arr!19605 a!3186) j!159)))))

(declare-fun b!724549 () Bool)

(assert (=> b!724549 (= e!405826 (MissingVacant!7205 resIntermediateIndex!5))))

(declare-fun b!724550 () Bool)

(assert (=> b!724550 (= e!405825 (Found!7205 index!1321))))

(assert (= (and d!99349 c!79724) b!724546))

(assert (= (and d!99349 (not c!79724)) b!724547))

(assert (= (and b!724547 c!79725) b!724550))

(assert (= (and b!724547 (not c!79725)) b!724548))

(assert (= (and b!724548 c!79723) b!724549))

(assert (= (and b!724548 (not c!79723)) b!724545))

(declare-fun m!678825 () Bool)

(assert (=> b!724545 m!678825))

(assert (=> b!724545 m!678825))

(assert (=> b!724545 m!678565))

(declare-fun m!678827 () Bool)

(assert (=> b!724545 m!678827))

(declare-fun m!678829 () Bool)

(assert (=> d!99349 m!678829))

(declare-fun m!678831 () Bool)

(assert (=> d!99349 m!678831))

(declare-fun m!678833 () Bool)

(assert (=> d!99349 m!678833))

(assert (=> d!99349 m!678601))

(assert (=> b!724189 d!99349))

(declare-fun b!724551 () Bool)

(declare-fun e!405830 () SeekEntryResult!7205)

(assert (=> b!724551 (= e!405830 (Intermediate!7205 false (toIndex!0 lt!320907 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724553 () Bool)

(declare-fun lt!321036 () SeekEntryResult!7205)

(assert (=> b!724553 (and (bvsge (index!31190 lt!321036) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321036) (size!20026 lt!320909)))))

(declare-fun res!485844 () Bool)

(assert (=> b!724553 (= res!485844 (= (select (arr!19605 lt!320909) (index!31190 lt!321036)) lt!320907))))

(declare-fun e!405829 () Bool)

(assert (=> b!724553 (=> res!485844 e!405829)))

(declare-fun e!405828 () Bool)

(assert (=> b!724553 (= e!405828 e!405829)))

(declare-fun b!724554 () Bool)

(assert (=> b!724554 (and (bvsge (index!31190 lt!321036) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321036) (size!20026 lt!320909)))))

(declare-fun res!485845 () Bool)

(assert (=> b!724554 (= res!485845 (= (select (arr!19605 lt!320909) (index!31190 lt!321036)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724554 (=> res!485845 e!405829)))

(declare-fun b!724555 () Bool)

(declare-fun e!405832 () SeekEntryResult!7205)

(assert (=> b!724555 (= e!405832 (Intermediate!7205 true (toIndex!0 lt!320907 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!724556 () Bool)

(declare-fun e!405831 () Bool)

(assert (=> b!724556 (= e!405831 e!405828)))

(declare-fun res!485846 () Bool)

(assert (=> b!724556 (= res!485846 (and (is-Intermediate!7205 lt!321036) (not (undefined!8017 lt!321036)) (bvslt (x!62182 lt!321036) #b01111111111111111111111111111110) (bvsge (x!62182 lt!321036) #b00000000000000000000000000000000) (bvsge (x!62182 lt!321036) #b00000000000000000000000000000000)))))

(assert (=> b!724556 (=> (not res!485846) (not e!405828))))

(declare-fun b!724557 () Bool)

(assert (=> b!724557 (= e!405832 e!405830)))

(declare-fun c!79728 () Bool)

(declare-fun lt!321035 () (_ BitVec 64))

(assert (=> b!724557 (= c!79728 (or (= lt!321035 lt!320907) (= (bvadd lt!321035 lt!321035) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724552 () Bool)

(assert (=> b!724552 (and (bvsge (index!31190 lt!321036) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321036) (size!20026 lt!320909)))))

(assert (=> b!724552 (= e!405829 (= (select (arr!19605 lt!320909) (index!31190 lt!321036)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99371 () Bool)

(assert (=> d!99371 e!405831))

(declare-fun c!79727 () Bool)

(assert (=> d!99371 (= c!79727 (and (is-Intermediate!7205 lt!321036) (undefined!8017 lt!321036)))))

(assert (=> d!99371 (= lt!321036 e!405832)))

(declare-fun c!79726 () Bool)

(assert (=> d!99371 (= c!79726 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99371 (= lt!321035 (select (arr!19605 lt!320909) (toIndex!0 lt!320907 mask!3328)))))

(assert (=> d!99371 (validMask!0 mask!3328)))

(assert (=> d!99371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320907 mask!3328) lt!320907 lt!320909 mask!3328) lt!321036)))

(declare-fun b!724558 () Bool)

(assert (=> b!724558 (= e!405831 (bvsge (x!62182 lt!321036) #b01111111111111111111111111111110))))

(declare-fun b!724559 () Bool)

(assert (=> b!724559 (= e!405830 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!320907 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!320907 lt!320909 mask!3328))))

(assert (= (and d!99371 c!79726) b!724555))

(assert (= (and d!99371 (not c!79726)) b!724557))

(assert (= (and b!724557 c!79728) b!724551))

(assert (= (and b!724557 (not c!79728)) b!724559))

(assert (= (and d!99371 c!79727) b!724558))

(assert (= (and d!99371 (not c!79727)) b!724556))

(assert (= (and b!724556 res!485846) b!724553))

(assert (= (and b!724553 (not res!485844)) b!724554))

(assert (= (and b!724554 (not res!485845)) b!724552))

(declare-fun m!678835 () Bool)

(assert (=> b!724552 m!678835))

(assert (=> b!724554 m!678835))

(assert (=> b!724553 m!678835))

(assert (=> d!99371 m!678575))

(declare-fun m!678837 () Bool)

(assert (=> d!99371 m!678837))

(assert (=> d!99371 m!678601))

(assert (=> b!724559 m!678575))

(declare-fun m!678839 () Bool)

(assert (=> b!724559 m!678839))

(assert (=> b!724559 m!678839))

(declare-fun m!678841 () Bool)

(assert (=> b!724559 m!678841))

(assert (=> b!724196 d!99371))

(declare-fun d!99379 () Bool)

(declare-fun lt!321041 () (_ BitVec 32))

(declare-fun lt!321040 () (_ BitVec 32))

(assert (=> d!99379 (= lt!321041 (bvmul (bvxor lt!321040 (bvlshr lt!321040 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99379 (= lt!321040 ((_ extract 31 0) (bvand (bvxor lt!320907 (bvlshr lt!320907 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99379 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!485811 (let ((h!14661 ((_ extract 31 0) (bvand (bvxor lt!320907 (bvlshr lt!320907 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62190 (bvmul (bvxor h!14661 (bvlshr h!14661 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62190 (bvlshr x!62190 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!485811 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!485811 #b00000000000000000000000000000000))))))

(assert (=> d!99379 (= (toIndex!0 lt!320907 mask!3328) (bvand (bvxor lt!321041 (bvlshr lt!321041 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!724196 d!99379))

(declare-fun b!724566 () Bool)

(declare-fun e!405838 () SeekEntryResult!7205)

(assert (=> b!724566 (= e!405838 (Intermediate!7205 false index!1321 x!1131))))

(declare-fun b!724568 () Bool)

(declare-fun lt!321043 () SeekEntryResult!7205)

(assert (=> b!724568 (and (bvsge (index!31190 lt!321043) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321043) (size!20026 lt!320909)))))

(declare-fun res!485847 () Bool)

(assert (=> b!724568 (= res!485847 (= (select (arr!19605 lt!320909) (index!31190 lt!321043)) lt!320907))))

(declare-fun e!405837 () Bool)

(assert (=> b!724568 (=> res!485847 e!405837)))

(declare-fun e!405836 () Bool)

(assert (=> b!724568 (= e!405836 e!405837)))

(declare-fun b!724569 () Bool)

(assert (=> b!724569 (and (bvsge (index!31190 lt!321043) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321043) (size!20026 lt!320909)))))

(declare-fun res!485848 () Bool)

(assert (=> b!724569 (= res!485848 (= (select (arr!19605 lt!320909) (index!31190 lt!321043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724569 (=> res!485848 e!405837)))

(declare-fun b!724570 () Bool)

(declare-fun e!405840 () SeekEntryResult!7205)

(assert (=> b!724570 (= e!405840 (Intermediate!7205 true index!1321 x!1131))))

(declare-fun b!724571 () Bool)

(declare-fun e!405839 () Bool)

(assert (=> b!724571 (= e!405839 e!405836)))

(declare-fun res!485849 () Bool)

(assert (=> b!724571 (= res!485849 (and (is-Intermediate!7205 lt!321043) (not (undefined!8017 lt!321043)) (bvslt (x!62182 lt!321043) #b01111111111111111111111111111110) (bvsge (x!62182 lt!321043) #b00000000000000000000000000000000) (bvsge (x!62182 lt!321043) x!1131)))))

(assert (=> b!724571 (=> (not res!485849) (not e!405836))))

(declare-fun b!724572 () Bool)

(assert (=> b!724572 (= e!405840 e!405838)))

(declare-fun c!79734 () Bool)

(declare-fun lt!321042 () (_ BitVec 64))

(assert (=> b!724572 (= c!79734 (or (= lt!321042 lt!320907) (= (bvadd lt!321042 lt!321042) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724567 () Bool)

(assert (=> b!724567 (and (bvsge (index!31190 lt!321043) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321043) (size!20026 lt!320909)))))

(assert (=> b!724567 (= e!405837 (= (select (arr!19605 lt!320909) (index!31190 lt!321043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99381 () Bool)

(assert (=> d!99381 e!405839))

(declare-fun c!79733 () Bool)

(assert (=> d!99381 (= c!79733 (and (is-Intermediate!7205 lt!321043) (undefined!8017 lt!321043)))))

(assert (=> d!99381 (= lt!321043 e!405840)))

(declare-fun c!79732 () Bool)

(assert (=> d!99381 (= c!79732 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99381 (= lt!321042 (select (arr!19605 lt!320909) index!1321))))

(assert (=> d!99381 (validMask!0 mask!3328)))

(assert (=> d!99381 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320907 lt!320909 mask!3328) lt!321043)))

(declare-fun b!724573 () Bool)

(assert (=> b!724573 (= e!405839 (bvsge (x!62182 lt!321043) #b01111111111111111111111111111110))))

(declare-fun b!724574 () Bool)

(assert (=> b!724574 (= e!405838 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!320907 lt!320909 mask!3328))))

(assert (= (and d!99381 c!79732) b!724570))

(assert (= (and d!99381 (not c!79732)) b!724572))

(assert (= (and b!724572 c!79734) b!724566))

(assert (= (and b!724572 (not c!79734)) b!724574))

(assert (= (and d!99381 c!79733) b!724573))

(assert (= (and d!99381 (not c!79733)) b!724571))

(assert (= (and b!724571 res!485849) b!724568))

(assert (= (and b!724568 (not res!485847)) b!724569))

(assert (= (and b!724569 (not res!485848)) b!724567))

(declare-fun m!678853 () Bool)

(assert (=> b!724567 m!678853))

(assert (=> b!724569 m!678853))

(assert (=> b!724568 m!678853))

(declare-fun m!678855 () Bool)

(assert (=> d!99381 m!678855))

(assert (=> d!99381 m!678601))

(assert (=> b!724574 m!678825))

(assert (=> b!724574 m!678825))

(declare-fun m!678857 () Bool)

(assert (=> b!724574 m!678857))

(assert (=> b!724196 d!99381))

(declare-fun d!99383 () Bool)

(declare-fun res!485869 () Bool)

(declare-fun e!405866 () Bool)

(assert (=> d!99383 (=> res!485869 e!405866)))

(assert (=> d!99383 (= res!485869 (bvsge #b00000000000000000000000000000000 (size!20026 a!3186)))))

(assert (=> d!99383 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!405866)))

(declare-fun b!724604 () Bool)

(declare-fun e!405865 () Bool)

(declare-fun call!34805 () Bool)

(assert (=> b!724604 (= e!405865 call!34805)))

(declare-fun bm!34802 () Bool)

(assert (=> bm!34802 (= call!34805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724605 () Bool)

(declare-fun e!405867 () Bool)

(assert (=> b!724605 (= e!405867 call!34805)))

(declare-fun b!724606 () Bool)

(assert (=> b!724606 (= e!405865 e!405867)))

(declare-fun lt!321051 () (_ BitVec 64))

(assert (=> b!724606 (= lt!321051 (select (arr!19605 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!321052 () Unit!24728)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40965 (_ BitVec 64) (_ BitVec 32)) Unit!24728)

(assert (=> b!724606 (= lt!321052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321051 #b00000000000000000000000000000000))))

(assert (=> b!724606 (arrayContainsKey!0 a!3186 lt!321051 #b00000000000000000000000000000000)))

(declare-fun lt!321050 () Unit!24728)

(assert (=> b!724606 (= lt!321050 lt!321052)))

(declare-fun res!485870 () Bool)

(assert (=> b!724606 (= res!485870 (= (seekEntryOrOpen!0 (select (arr!19605 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7205 #b00000000000000000000000000000000)))))

(assert (=> b!724606 (=> (not res!485870) (not e!405867))))

(declare-fun b!724607 () Bool)

(assert (=> b!724607 (= e!405866 e!405865)))

(declare-fun c!79740 () Bool)

(assert (=> b!724607 (= c!79740 (validKeyInArray!0 (select (arr!19605 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99383 (not res!485869)) b!724607))

(assert (= (and b!724607 c!79740) b!724606))

(assert (= (and b!724607 (not c!79740)) b!724604))

(assert (= (and b!724606 res!485870) b!724605))

(assert (= (or b!724605 b!724604) bm!34802))

(declare-fun m!678865 () Bool)

(assert (=> bm!34802 m!678865))

(assert (=> b!724606 m!678715))

(declare-fun m!678867 () Bool)

(assert (=> b!724606 m!678867))

(declare-fun m!678869 () Bool)

(assert (=> b!724606 m!678869))

(assert (=> b!724606 m!678715))

(declare-fun m!678871 () Bool)

(assert (=> b!724606 m!678871))

(assert (=> b!724607 m!678715))

(assert (=> b!724607 m!678715))

(assert (=> b!724607 m!678737))

(assert (=> b!724198 d!99383))

(declare-fun d!99389 () Bool)

(declare-fun res!485871 () Bool)

(declare-fun e!405869 () Bool)

(assert (=> d!99389 (=> res!485871 e!405869)))

(assert (=> d!99389 (= res!485871 (bvsge j!159 (size!20026 a!3186)))))

(assert (=> d!99389 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!405869)))

(declare-fun b!724608 () Bool)

(declare-fun e!405868 () Bool)

(declare-fun call!34806 () Bool)

(assert (=> b!724608 (= e!405868 call!34806)))

(declare-fun bm!34803 () Bool)

(assert (=> bm!34803 (= call!34806 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!724609 () Bool)

(declare-fun e!405870 () Bool)

(assert (=> b!724609 (= e!405870 call!34806)))

(declare-fun b!724610 () Bool)

(assert (=> b!724610 (= e!405868 e!405870)))

(declare-fun lt!321054 () (_ BitVec 64))

(assert (=> b!724610 (= lt!321054 (select (arr!19605 a!3186) j!159))))

(declare-fun lt!321055 () Unit!24728)

(assert (=> b!724610 (= lt!321055 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!321054 j!159))))

(assert (=> b!724610 (arrayContainsKey!0 a!3186 lt!321054 #b00000000000000000000000000000000)))

(declare-fun lt!321053 () Unit!24728)

(assert (=> b!724610 (= lt!321053 lt!321055)))

(declare-fun res!485872 () Bool)

(assert (=> b!724610 (= res!485872 (= (seekEntryOrOpen!0 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) (Found!7205 j!159)))))

(assert (=> b!724610 (=> (not res!485872) (not e!405870))))

(declare-fun b!724611 () Bool)

(assert (=> b!724611 (= e!405869 e!405868)))

(declare-fun c!79741 () Bool)

(assert (=> b!724611 (= c!79741 (validKeyInArray!0 (select (arr!19605 a!3186) j!159)))))

(assert (= (and d!99389 (not res!485871)) b!724611))

(assert (= (and b!724611 c!79741) b!724610))

(assert (= (and b!724611 (not c!79741)) b!724608))

(assert (= (and b!724610 res!485872) b!724609))

(assert (= (or b!724609 b!724608) bm!34803))

(declare-fun m!678873 () Bool)

(assert (=> bm!34803 m!678873))

(assert (=> b!724610 m!678565))

(declare-fun m!678875 () Bool)

(assert (=> b!724610 m!678875))

(declare-fun m!678877 () Bool)

(assert (=> b!724610 m!678877))

(assert (=> b!724610 m!678565))

(assert (=> b!724610 m!678587))

(assert (=> b!724611 m!678565))

(assert (=> b!724611 m!678565))

(assert (=> b!724611 m!678585))

(assert (=> b!724197 d!99389))

(declare-fun d!99391 () Bool)

(assert (=> d!99391 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!321058 () Unit!24728)

(declare-fun choose!38 (array!40965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24728)

(assert (=> d!99391 (= lt!321058 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99391 (validMask!0 mask!3328)))

(assert (=> d!99391 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!321058)))

(declare-fun bs!20811 () Bool)

(assert (= bs!20811 d!99391))

(assert (=> bs!20811 m!678593))

(declare-fun m!678879 () Bool)

(assert (=> bs!20811 m!678879))

(assert (=> bs!20811 m!678601))

(assert (=> b!724197 d!99391))

(declare-fun d!99393 () Bool)

(declare-fun lt!321084 () SeekEntryResult!7205)

(assert (=> d!99393 (and (or (is-Undefined!7205 lt!321084) (not (is-Found!7205 lt!321084)) (and (bvsge (index!31189 lt!321084) #b00000000000000000000000000000000) (bvslt (index!31189 lt!321084) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321084) (is-Found!7205 lt!321084) (not (is-MissingZero!7205 lt!321084)) (and (bvsge (index!31188 lt!321084) #b00000000000000000000000000000000) (bvslt (index!31188 lt!321084) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321084) (is-Found!7205 lt!321084) (is-MissingZero!7205 lt!321084) (not (is-MissingVacant!7205 lt!321084)) (and (bvsge (index!31191 lt!321084) #b00000000000000000000000000000000) (bvslt (index!31191 lt!321084) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321084) (ite (is-Found!7205 lt!321084) (= (select (arr!19605 a!3186) (index!31189 lt!321084)) (select (arr!19605 a!3186) j!159)) (ite (is-MissingZero!7205 lt!321084) (= (select (arr!19605 a!3186) (index!31188 lt!321084)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7205 lt!321084) (= (select (arr!19605 a!3186) (index!31191 lt!321084)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405897 () SeekEntryResult!7205)

(assert (=> d!99393 (= lt!321084 e!405897)))

(declare-fun c!79763 () Bool)

(declare-fun lt!321086 () SeekEntryResult!7205)

(assert (=> d!99393 (= c!79763 (and (is-Intermediate!7205 lt!321086) (undefined!8017 lt!321086)))))

(assert (=> d!99393 (= lt!321086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19605 a!3186) j!159) mask!3328) (select (arr!19605 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99393 (validMask!0 mask!3328)))

(assert (=> d!99393 (= (seekEntryOrOpen!0 (select (arr!19605 a!3186) j!159) a!3186 mask!3328) lt!321084)))

(declare-fun b!724660 () Bool)

(assert (=> b!724660 (= e!405897 Undefined!7205)))

(declare-fun e!405898 () SeekEntryResult!7205)

(declare-fun b!724661 () Bool)

(assert (=> b!724661 (= e!405898 (seekKeyOrZeroReturnVacant!0 (x!62182 lt!321086) (index!31190 lt!321086) (index!31190 lt!321086) (select (arr!19605 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!724662 () Bool)

(declare-fun e!405896 () SeekEntryResult!7205)

(assert (=> b!724662 (= e!405896 (Found!7205 (index!31190 lt!321086)))))

(declare-fun b!724663 () Bool)

(declare-fun c!79764 () Bool)

(declare-fun lt!321085 () (_ BitVec 64))

(assert (=> b!724663 (= c!79764 (= lt!321085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724663 (= e!405896 e!405898)))

(declare-fun b!724664 () Bool)

(assert (=> b!724664 (= e!405898 (MissingZero!7205 (index!31190 lt!321086)))))

(declare-fun b!724665 () Bool)

(assert (=> b!724665 (= e!405897 e!405896)))

(assert (=> b!724665 (= lt!321085 (select (arr!19605 a!3186) (index!31190 lt!321086)))))

(declare-fun c!79765 () Bool)

(assert (=> b!724665 (= c!79765 (= lt!321085 (select (arr!19605 a!3186) j!159)))))

(assert (= (and d!99393 c!79763) b!724660))

(assert (= (and d!99393 (not c!79763)) b!724665))

(assert (= (and b!724665 c!79765) b!724662))

(assert (= (and b!724665 (not c!79765)) b!724663))

(assert (= (and b!724663 c!79764) b!724664))

(assert (= (and b!724663 (not c!79764)) b!724661))

(assert (=> d!99393 m!678601))

(declare-fun m!678903 () Bool)

(assert (=> d!99393 m!678903))

(assert (=> d!99393 m!678565))

(assert (=> d!99393 m!678581))

(assert (=> d!99393 m!678581))

(assert (=> d!99393 m!678565))

(assert (=> d!99393 m!678583))

(declare-fun m!678907 () Bool)

(assert (=> d!99393 m!678907))

(declare-fun m!678909 () Bool)

(assert (=> d!99393 m!678909))

(assert (=> b!724661 m!678565))

(declare-fun m!678911 () Bool)

(assert (=> b!724661 m!678911))

(declare-fun m!678913 () Bool)

(assert (=> b!724665 m!678913))

(assert (=> b!724194 d!99393))

(declare-fun d!99403 () Bool)

(declare-fun lt!321089 () SeekEntryResult!7205)

(assert (=> d!99403 (and (or (is-Undefined!7205 lt!321089) (not (is-Found!7205 lt!321089)) (and (bvsge (index!31189 lt!321089) #b00000000000000000000000000000000) (bvslt (index!31189 lt!321089) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321089) (is-Found!7205 lt!321089) (not (is-MissingZero!7205 lt!321089)) (and (bvsge (index!31188 lt!321089) #b00000000000000000000000000000000) (bvslt (index!31188 lt!321089) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321089) (is-Found!7205 lt!321089) (is-MissingZero!7205 lt!321089) (not (is-MissingVacant!7205 lt!321089)) (and (bvsge (index!31191 lt!321089) #b00000000000000000000000000000000) (bvslt (index!31191 lt!321089) (size!20026 a!3186)))) (or (is-Undefined!7205 lt!321089) (ite (is-Found!7205 lt!321089) (= (select (arr!19605 a!3186) (index!31189 lt!321089)) k!2102) (ite (is-MissingZero!7205 lt!321089) (= (select (arr!19605 a!3186) (index!31188 lt!321089)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7205 lt!321089) (= (select (arr!19605 a!3186) (index!31191 lt!321089)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!405905 () SeekEntryResult!7205)

(assert (=> d!99403 (= lt!321089 e!405905)))

(declare-fun c!79769 () Bool)

(declare-fun lt!321091 () SeekEntryResult!7205)

(assert (=> d!99403 (= c!79769 (and (is-Intermediate!7205 lt!321091) (undefined!8017 lt!321091)))))

(assert (=> d!99403 (= lt!321091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99403 (validMask!0 mask!3328)))

(assert (=> d!99403 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!321089)))

(declare-fun b!724675 () Bool)

(assert (=> b!724675 (= e!405905 Undefined!7205)))

(declare-fun b!724676 () Bool)

(declare-fun e!405906 () SeekEntryResult!7205)

(assert (=> b!724676 (= e!405906 (seekKeyOrZeroReturnVacant!0 (x!62182 lt!321091) (index!31190 lt!321091) (index!31190 lt!321091) k!2102 a!3186 mask!3328))))

(declare-fun b!724677 () Bool)

(declare-fun e!405904 () SeekEntryResult!7205)

(assert (=> b!724677 (= e!405904 (Found!7205 (index!31190 lt!321091)))))

(declare-fun b!724678 () Bool)

(declare-fun c!79770 () Bool)

(declare-fun lt!321090 () (_ BitVec 64))

(assert (=> b!724678 (= c!79770 (= lt!321090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!724678 (= e!405904 e!405906)))

(declare-fun b!724679 () Bool)

(assert (=> b!724679 (= e!405906 (MissingZero!7205 (index!31190 lt!321091)))))

(declare-fun b!724680 () Bool)

(assert (=> b!724680 (= e!405905 e!405904)))

(assert (=> b!724680 (= lt!321090 (select (arr!19605 a!3186) (index!31190 lt!321091)))))

(declare-fun c!79771 () Bool)

(assert (=> b!724680 (= c!79771 (= lt!321090 k!2102))))

(assert (= (and d!99403 c!79769) b!724675))

(assert (= (and d!99403 (not c!79769)) b!724680))

(assert (= (and b!724680 c!79771) b!724677))

(assert (= (and b!724680 (not c!79771)) b!724678))

(assert (= (and b!724678 c!79770) b!724679))

(assert (= (and b!724678 (not c!79770)) b!724676))

(assert (=> d!99403 m!678601))

(declare-fun m!678915 () Bool)

(assert (=> d!99403 m!678915))

(declare-fun m!678918 () Bool)

(assert (=> d!99403 m!678918))

(assert (=> d!99403 m!678918))

(declare-fun m!678921 () Bool)

(assert (=> d!99403 m!678921))

(declare-fun m!678925 () Bool)

(assert (=> d!99403 m!678925))

(declare-fun m!678927 () Bool)

(assert (=> d!99403 m!678927))

(declare-fun m!678931 () Bool)

(assert (=> b!724676 m!678931))

(declare-fun m!678933 () Bool)

(assert (=> b!724680 m!678933))

(assert (=> b!724193 d!99403))

(declare-fun b!724681 () Bool)

(declare-fun e!405909 () SeekEntryResult!7205)

(assert (=> b!724681 (= e!405909 (Intermediate!7205 false index!1321 x!1131))))

(declare-fun b!724683 () Bool)

(declare-fun lt!321093 () SeekEntryResult!7205)

(assert (=> b!724683 (and (bvsge (index!31190 lt!321093) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321093) (size!20026 a!3186)))))

(declare-fun res!485883 () Bool)

(assert (=> b!724683 (= res!485883 (= (select (arr!19605 a!3186) (index!31190 lt!321093)) (select (arr!19605 a!3186) j!159)))))

(declare-fun e!405908 () Bool)

(assert (=> b!724683 (=> res!485883 e!405908)))

(declare-fun e!405907 () Bool)

(assert (=> b!724683 (= e!405907 e!405908)))

(declare-fun b!724684 () Bool)

(assert (=> b!724684 (and (bvsge (index!31190 lt!321093) #b00000000000000000000000000000000) (bvslt (index!31190 lt!321093) (size!20026 a!3186)))))

(declare-fun res!485884 () Bool)

(assert (=> b!724684 (= res!485884 (= (select (arr!19605 a!3186) (index!31190 lt!321093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

