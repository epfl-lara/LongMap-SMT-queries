; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66118 () Bool)

(assert start!66118)

(declare-fun b!761636 () Bool)

(declare-fun res!515054 () Bool)

(declare-fun e!424600 () Bool)

(assert (=> b!761636 (=> (not res!515054) (not e!424600))))

(declare-fun e!424604 () Bool)

(assert (=> b!761636 (= res!515054 e!424604)))

(declare-fun c!83680 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!761636 (= c!83680 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!761637 () Bool)

(declare-fun e!424597 () Bool)

(declare-fun e!424605 () Bool)

(assert (=> b!761637 (= e!424597 e!424605)))

(declare-fun res!515059 () Bool)

(assert (=> b!761637 (=> (not res!515059) (not e!424605))))

(declare-datatypes ((SeekEntryResult!7752 0))(
  ( (MissingZero!7752 (index!33376 (_ BitVec 32))) (Found!7752 (index!33377 (_ BitVec 32))) (Intermediate!7752 (undefined!8564 Bool) (index!33378 (_ BitVec 32)) (x!64283 (_ BitVec 32))) (Undefined!7752) (MissingVacant!7752 (index!33379 (_ BitVec 32))) )
))
(declare-fun lt!339301 () SeekEntryResult!7752)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761637 (= res!515059 (or (= lt!339301 (MissingZero!7752 i!1173)) (= lt!339301 (MissingVacant!7752 i!1173))))))

(declare-datatypes ((array!42086 0))(
  ( (array!42087 (arr!20152 (Array (_ BitVec 32) (_ BitVec 64))) (size!20573 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42086)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42086 (_ BitVec 32)) SeekEntryResult!7752)

(assert (=> b!761637 (= lt!339301 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!761638 () Bool)

(declare-fun res!515053 () Bool)

(assert (=> b!761638 (=> (not res!515053) (not e!424597))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!761638 (= res!515053 (and (= (size!20573 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20573 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20573 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515048 () Bool)

(assert (=> start!66118 (=> (not res!515048) (not e!424597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66118 (= res!515048 (validMask!0 mask!3328))))

(assert (=> start!66118 e!424597))

(assert (=> start!66118 true))

(declare-fun array_inv!15948 (array!42086) Bool)

(assert (=> start!66118 (array_inv!15948 a!3186)))

(declare-fun b!761639 () Bool)

(assert (=> b!761639 (= e!424605 e!424600)))

(declare-fun res!515060 () Bool)

(assert (=> b!761639 (=> (not res!515060) (not e!424600))))

(declare-fun lt!339305 () SeekEntryResult!7752)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42086 (_ BitVec 32)) SeekEntryResult!7752)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761639 (= res!515060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339305))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!761639 (= lt!339305 (Intermediate!7752 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!761640 () Bool)

(declare-fun res!515049 () Bool)

(assert (=> b!761640 (=> (not res!515049) (not e!424600))))

(assert (=> b!761640 (= res!515049 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20152 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761641 () Bool)

(declare-fun res!515061 () Bool)

(assert (=> b!761641 (=> (not res!515061) (not e!424597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!761641 (= res!515061 (validKeyInArray!0 k0!2102))))

(declare-fun e!424601 () Bool)

(declare-fun lt!339307 () SeekEntryResult!7752)

(declare-fun b!761642 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42086 (_ BitVec 32)) SeekEntryResult!7752)

(assert (=> b!761642 (= e!424601 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339307))))

(declare-fun b!761643 () Bool)

(declare-fun res!515056 () Bool)

(assert (=> b!761643 (=> (not res!515056) (not e!424597))))

(assert (=> b!761643 (= res!515056 (validKeyInArray!0 (select (arr!20152 a!3186) j!159)))))

(declare-fun b!761644 () Bool)

(declare-fun res!515055 () Bool)

(assert (=> b!761644 (=> (not res!515055) (not e!424605))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!761644 (= res!515055 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20573 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20573 a!3186))))))

(declare-fun e!424602 () Bool)

(declare-fun lt!339304 () SeekEntryResult!7752)

(declare-fun b!761645 () Bool)

(declare-fun lt!339306 () (_ BitVec 64))

(assert (=> b!761645 (= e!424602 (or (not (= (select (store (arr!20152 a!3186) i!1173 k0!2102) index!1321) lt!339306)) (not (undefined!8564 lt!339304))))))

(declare-fun b!761646 () Bool)

(declare-fun e!424599 () Bool)

(assert (=> b!761646 (= e!424600 e!424599)))

(declare-fun res!515046 () Bool)

(assert (=> b!761646 (=> (not res!515046) (not e!424599))))

(declare-fun lt!339308 () SeekEntryResult!7752)

(assert (=> b!761646 (= res!515046 (= lt!339308 lt!339304))))

(declare-fun lt!339302 () array!42086)

(assert (=> b!761646 (= lt!339304 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339306 lt!339302 mask!3328))))

(assert (=> b!761646 (= lt!339308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339306 mask!3328) lt!339306 lt!339302 mask!3328))))

(assert (=> b!761646 (= lt!339306 (select (store (arr!20152 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!761646 (= lt!339302 (array!42087 (store (arr!20152 a!3186) i!1173 k0!2102) (size!20573 a!3186)))))

(declare-fun b!761647 () Bool)

(declare-fun e!424598 () Bool)

(assert (=> b!761647 (= e!424598 e!424601)))

(declare-fun res!515062 () Bool)

(assert (=> b!761647 (=> (not res!515062) (not e!424601))))

(assert (=> b!761647 (= res!515062 (= (seekEntryOrOpen!0 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339307))))

(assert (=> b!761647 (= lt!339307 (Found!7752 j!159))))

(declare-fun b!761648 () Bool)

(declare-fun res!515047 () Bool)

(assert (=> b!761648 (=> (not res!515047) (not e!424605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42086 (_ BitVec 32)) Bool)

(assert (=> b!761648 (= res!515047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!761649 () Bool)

(declare-fun res!515051 () Bool)

(assert (=> b!761649 (=> res!515051 e!424602)))

(assert (=> b!761649 (= res!515051 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) (Found!7752 j!159))))))

(declare-fun b!761650 () Bool)

(declare-fun res!515058 () Bool)

(assert (=> b!761650 (=> (not res!515058) (not e!424605))))

(declare-datatypes ((List!14154 0))(
  ( (Nil!14151) (Cons!14150 (h!15231 (_ BitVec 64)) (t!20469 List!14154)) )
))
(declare-fun arrayNoDuplicates!0 (array!42086 (_ BitVec 32) List!14154) Bool)

(assert (=> b!761650 (= res!515058 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14151))))

(declare-fun b!761651 () Bool)

(declare-fun res!515057 () Bool)

(assert (=> b!761651 (=> (not res!515057) (not e!424597))))

(declare-fun arrayContainsKey!0 (array!42086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761651 (= res!515057 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!761652 () Bool)

(assert (=> b!761652 (= e!424599 (not e!424602))))

(declare-fun res!515050 () Bool)

(assert (=> b!761652 (=> res!515050 e!424602)))

(get-info :version)

(assert (=> b!761652 (= res!515050 (or (not ((_ is Intermediate!7752) lt!339304)) (bvslt x!1131 (x!64283 lt!339304)) (not (= x!1131 (x!64283 lt!339304))) (not (= index!1321 (index!33378 lt!339304)))))))

(assert (=> b!761652 e!424598))

(declare-fun res!515052 () Bool)

(assert (=> b!761652 (=> (not res!515052) (not e!424598))))

(assert (=> b!761652 (= res!515052 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26344 0))(
  ( (Unit!26345) )
))
(declare-fun lt!339303 () Unit!26344)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26344)

(assert (=> b!761652 (= lt!339303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!761653 () Bool)

(assert (=> b!761653 (= e!424604 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339305))))

(declare-fun b!761654 () Bool)

(assert (=> b!761654 (= e!424604 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) (Found!7752 j!159)))))

(assert (= (and start!66118 res!515048) b!761638))

(assert (= (and b!761638 res!515053) b!761643))

(assert (= (and b!761643 res!515056) b!761641))

(assert (= (and b!761641 res!515061) b!761651))

(assert (= (and b!761651 res!515057) b!761637))

(assert (= (and b!761637 res!515059) b!761648))

(assert (= (and b!761648 res!515047) b!761650))

(assert (= (and b!761650 res!515058) b!761644))

(assert (= (and b!761644 res!515055) b!761639))

(assert (= (and b!761639 res!515060) b!761640))

(assert (= (and b!761640 res!515049) b!761636))

(assert (= (and b!761636 c!83680) b!761653))

(assert (= (and b!761636 (not c!83680)) b!761654))

(assert (= (and b!761636 res!515054) b!761646))

(assert (= (and b!761646 res!515046) b!761652))

(assert (= (and b!761652 res!515052) b!761647))

(assert (= (and b!761647 res!515062) b!761642))

(assert (= (and b!761652 (not res!515050)) b!761649))

(assert (= (and b!761649 (not res!515051)) b!761645))

(declare-fun m!708573 () Bool)

(assert (=> b!761648 m!708573))

(declare-fun m!708575 () Bool)

(assert (=> b!761637 m!708575))

(declare-fun m!708577 () Bool)

(assert (=> b!761651 m!708577))

(declare-fun m!708579 () Bool)

(assert (=> b!761641 m!708579))

(declare-fun m!708581 () Bool)

(assert (=> b!761653 m!708581))

(assert (=> b!761653 m!708581))

(declare-fun m!708583 () Bool)

(assert (=> b!761653 m!708583))

(assert (=> b!761649 m!708581))

(assert (=> b!761649 m!708581))

(declare-fun m!708585 () Bool)

(assert (=> b!761649 m!708585))

(assert (=> b!761654 m!708581))

(assert (=> b!761654 m!708581))

(assert (=> b!761654 m!708585))

(assert (=> b!761643 m!708581))

(assert (=> b!761643 m!708581))

(declare-fun m!708587 () Bool)

(assert (=> b!761643 m!708587))

(declare-fun m!708589 () Bool)

(assert (=> b!761650 m!708589))

(declare-fun m!708591 () Bool)

(assert (=> b!761640 m!708591))

(assert (=> b!761647 m!708581))

(assert (=> b!761647 m!708581))

(declare-fun m!708593 () Bool)

(assert (=> b!761647 m!708593))

(declare-fun m!708595 () Bool)

(assert (=> b!761645 m!708595))

(declare-fun m!708597 () Bool)

(assert (=> b!761645 m!708597))

(declare-fun m!708599 () Bool)

(assert (=> b!761646 m!708599))

(declare-fun m!708601 () Bool)

(assert (=> b!761646 m!708601))

(assert (=> b!761646 m!708595))

(declare-fun m!708603 () Bool)

(assert (=> b!761646 m!708603))

(assert (=> b!761646 m!708601))

(declare-fun m!708605 () Bool)

(assert (=> b!761646 m!708605))

(declare-fun m!708607 () Bool)

(assert (=> b!761652 m!708607))

(declare-fun m!708609 () Bool)

(assert (=> b!761652 m!708609))

(declare-fun m!708611 () Bool)

(assert (=> start!66118 m!708611))

(declare-fun m!708613 () Bool)

(assert (=> start!66118 m!708613))

(assert (=> b!761639 m!708581))

(assert (=> b!761639 m!708581))

(declare-fun m!708615 () Bool)

(assert (=> b!761639 m!708615))

(assert (=> b!761639 m!708615))

(assert (=> b!761639 m!708581))

(declare-fun m!708617 () Bool)

(assert (=> b!761639 m!708617))

(assert (=> b!761642 m!708581))

(assert (=> b!761642 m!708581))

(declare-fun m!708619 () Bool)

(assert (=> b!761642 m!708619))

(check-sat (not start!66118) (not b!761648) (not b!761646) (not b!761641) (not b!761649) (not b!761652) (not b!761650) (not b!761643) (not b!761653) (not b!761651) (not b!761654) (not b!761639) (not b!761642) (not b!761647) (not b!761637))
(check-sat)
(get-model)

(declare-fun d!100823 () Bool)

(declare-fun lt!339340 () SeekEntryResult!7752)

(assert (=> d!100823 (and (or ((_ is Undefined!7752) lt!339340) (not ((_ is Found!7752) lt!339340)) (and (bvsge (index!33377 lt!339340) #b00000000000000000000000000000000) (bvslt (index!33377 lt!339340) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339340) ((_ is Found!7752) lt!339340) (not ((_ is MissingZero!7752) lt!339340)) (and (bvsge (index!33376 lt!339340) #b00000000000000000000000000000000) (bvslt (index!33376 lt!339340) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339340) ((_ is Found!7752) lt!339340) ((_ is MissingZero!7752) lt!339340) (not ((_ is MissingVacant!7752) lt!339340)) (and (bvsge (index!33379 lt!339340) #b00000000000000000000000000000000) (bvslt (index!33379 lt!339340) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339340) (ite ((_ is Found!7752) lt!339340) (= (select (arr!20152 a!3186) (index!33377 lt!339340)) (select (arr!20152 a!3186) j!159)) (ite ((_ is MissingZero!7752) lt!339340) (= (select (arr!20152 a!3186) (index!33376 lt!339340)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7752) lt!339340) (= (select (arr!20152 a!3186) (index!33379 lt!339340)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424641 () SeekEntryResult!7752)

(assert (=> d!100823 (= lt!339340 e!424641)))

(declare-fun c!83692 () Bool)

(declare-fun lt!339339 () SeekEntryResult!7752)

(assert (=> d!100823 (= c!83692 (and ((_ is Intermediate!7752) lt!339339) (undefined!8564 lt!339339)))))

(assert (=> d!100823 (= lt!339339 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100823 (validMask!0 mask!3328)))

(assert (=> d!100823 (= (seekEntryOrOpen!0 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339340)))

(declare-fun b!761724 () Bool)

(declare-fun e!424640 () SeekEntryResult!7752)

(assert (=> b!761724 (= e!424641 e!424640)))

(declare-fun lt!339341 () (_ BitVec 64))

(assert (=> b!761724 (= lt!339341 (select (arr!20152 a!3186) (index!33378 lt!339339)))))

(declare-fun c!83690 () Bool)

(assert (=> b!761724 (= c!83690 (= lt!339341 (select (arr!20152 a!3186) j!159)))))

(declare-fun b!761725 () Bool)

(assert (=> b!761725 (= e!424640 (Found!7752 (index!33378 lt!339339)))))

(declare-fun e!424639 () SeekEntryResult!7752)

(declare-fun b!761726 () Bool)

(assert (=> b!761726 (= e!424639 (seekKeyOrZeroReturnVacant!0 (x!64283 lt!339339) (index!33378 lt!339339) (index!33378 lt!339339) (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761727 () Bool)

(assert (=> b!761727 (= e!424641 Undefined!7752)))

(declare-fun b!761728 () Bool)

(assert (=> b!761728 (= e!424639 (MissingZero!7752 (index!33378 lt!339339)))))

(declare-fun b!761729 () Bool)

(declare-fun c!83691 () Bool)

(assert (=> b!761729 (= c!83691 (= lt!339341 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761729 (= e!424640 e!424639)))

(assert (= (and d!100823 c!83692) b!761727))

(assert (= (and d!100823 (not c!83692)) b!761724))

(assert (= (and b!761724 c!83690) b!761725))

(assert (= (and b!761724 (not c!83690)) b!761729))

(assert (= (and b!761729 c!83691) b!761728))

(assert (= (and b!761729 (not c!83691)) b!761726))

(declare-fun m!708669 () Bool)

(assert (=> d!100823 m!708669))

(assert (=> d!100823 m!708615))

(assert (=> d!100823 m!708581))

(assert (=> d!100823 m!708617))

(assert (=> d!100823 m!708581))

(assert (=> d!100823 m!708615))

(declare-fun m!708671 () Bool)

(assert (=> d!100823 m!708671))

(assert (=> d!100823 m!708611))

(declare-fun m!708673 () Bool)

(assert (=> d!100823 m!708673))

(declare-fun m!708675 () Bool)

(assert (=> b!761724 m!708675))

(assert (=> b!761726 m!708581))

(declare-fun m!708677 () Bool)

(assert (=> b!761726 m!708677))

(assert (=> b!761647 d!100823))

(declare-fun d!100825 () Bool)

(declare-fun lt!339343 () SeekEntryResult!7752)

(assert (=> d!100825 (and (or ((_ is Undefined!7752) lt!339343) (not ((_ is Found!7752) lt!339343)) (and (bvsge (index!33377 lt!339343) #b00000000000000000000000000000000) (bvslt (index!33377 lt!339343) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339343) ((_ is Found!7752) lt!339343) (not ((_ is MissingZero!7752) lt!339343)) (and (bvsge (index!33376 lt!339343) #b00000000000000000000000000000000) (bvslt (index!33376 lt!339343) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339343) ((_ is Found!7752) lt!339343) ((_ is MissingZero!7752) lt!339343) (not ((_ is MissingVacant!7752) lt!339343)) (and (bvsge (index!33379 lt!339343) #b00000000000000000000000000000000) (bvslt (index!33379 lt!339343) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339343) (ite ((_ is Found!7752) lt!339343) (= (select (arr!20152 a!3186) (index!33377 lt!339343)) k0!2102) (ite ((_ is MissingZero!7752) lt!339343) (= (select (arr!20152 a!3186) (index!33376 lt!339343)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7752) lt!339343) (= (select (arr!20152 a!3186) (index!33379 lt!339343)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!424644 () SeekEntryResult!7752)

(assert (=> d!100825 (= lt!339343 e!424644)))

(declare-fun c!83695 () Bool)

(declare-fun lt!339342 () SeekEntryResult!7752)

(assert (=> d!100825 (= c!83695 (and ((_ is Intermediate!7752) lt!339342) (undefined!8564 lt!339342)))))

(assert (=> d!100825 (= lt!339342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100825 (validMask!0 mask!3328)))

(assert (=> d!100825 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!339343)))

(declare-fun b!761730 () Bool)

(declare-fun e!424643 () SeekEntryResult!7752)

(assert (=> b!761730 (= e!424644 e!424643)))

(declare-fun lt!339344 () (_ BitVec 64))

(assert (=> b!761730 (= lt!339344 (select (arr!20152 a!3186) (index!33378 lt!339342)))))

(declare-fun c!83693 () Bool)

(assert (=> b!761730 (= c!83693 (= lt!339344 k0!2102))))

(declare-fun b!761731 () Bool)

(assert (=> b!761731 (= e!424643 (Found!7752 (index!33378 lt!339342)))))

(declare-fun e!424642 () SeekEntryResult!7752)

(declare-fun b!761732 () Bool)

(assert (=> b!761732 (= e!424642 (seekKeyOrZeroReturnVacant!0 (x!64283 lt!339342) (index!33378 lt!339342) (index!33378 lt!339342) k0!2102 a!3186 mask!3328))))

(declare-fun b!761733 () Bool)

(assert (=> b!761733 (= e!424644 Undefined!7752)))

(declare-fun b!761734 () Bool)

(assert (=> b!761734 (= e!424642 (MissingZero!7752 (index!33378 lt!339342)))))

(declare-fun b!761735 () Bool)

(declare-fun c!83694 () Bool)

(assert (=> b!761735 (= c!83694 (= lt!339344 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761735 (= e!424643 e!424642)))

(assert (= (and d!100825 c!83695) b!761733))

(assert (= (and d!100825 (not c!83695)) b!761730))

(assert (= (and b!761730 c!83693) b!761731))

(assert (= (and b!761730 (not c!83693)) b!761735))

(assert (= (and b!761735 c!83694) b!761734))

(assert (= (and b!761735 (not c!83694)) b!761732))

(declare-fun m!708679 () Bool)

(assert (=> d!100825 m!708679))

(declare-fun m!708681 () Bool)

(assert (=> d!100825 m!708681))

(declare-fun m!708683 () Bool)

(assert (=> d!100825 m!708683))

(assert (=> d!100825 m!708681))

(declare-fun m!708685 () Bool)

(assert (=> d!100825 m!708685))

(assert (=> d!100825 m!708611))

(declare-fun m!708687 () Bool)

(assert (=> d!100825 m!708687))

(declare-fun m!708689 () Bool)

(assert (=> b!761730 m!708689))

(declare-fun m!708691 () Bool)

(assert (=> b!761732 m!708691))

(assert (=> b!761637 d!100825))

(declare-fun bm!34980 () Bool)

(declare-fun call!34983 () Bool)

(assert (=> bm!34980 (= call!34983 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761744 () Bool)

(declare-fun e!424653 () Bool)

(assert (=> b!761744 (= e!424653 call!34983)))

(declare-fun d!100827 () Bool)

(declare-fun res!515118 () Bool)

(declare-fun e!424651 () Bool)

(assert (=> d!100827 (=> res!515118 e!424651)))

(assert (=> d!100827 (= res!515118 (bvsge #b00000000000000000000000000000000 (size!20573 a!3186)))))

(assert (=> d!100827 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424651)))

(declare-fun b!761745 () Bool)

(declare-fun e!424652 () Bool)

(assert (=> b!761745 (= e!424653 e!424652)))

(declare-fun lt!339353 () (_ BitVec 64))

(assert (=> b!761745 (= lt!339353 (select (arr!20152 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339351 () Unit!26344)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42086 (_ BitVec 64) (_ BitVec 32)) Unit!26344)

(assert (=> b!761745 (= lt!339351 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339353 #b00000000000000000000000000000000))))

(assert (=> b!761745 (arrayContainsKey!0 a!3186 lt!339353 #b00000000000000000000000000000000)))

(declare-fun lt!339352 () Unit!26344)

(assert (=> b!761745 (= lt!339352 lt!339351)))

(declare-fun res!515119 () Bool)

(assert (=> b!761745 (= res!515119 (= (seekEntryOrOpen!0 (select (arr!20152 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7752 #b00000000000000000000000000000000)))))

(assert (=> b!761745 (=> (not res!515119) (not e!424652))))

(declare-fun b!761746 () Bool)

(assert (=> b!761746 (= e!424652 call!34983)))

(declare-fun b!761747 () Bool)

(assert (=> b!761747 (= e!424651 e!424653)))

(declare-fun c!83698 () Bool)

(assert (=> b!761747 (= c!83698 (validKeyInArray!0 (select (arr!20152 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100827 (not res!515118)) b!761747))

(assert (= (and b!761747 c!83698) b!761745))

(assert (= (and b!761747 (not c!83698)) b!761744))

(assert (= (and b!761745 res!515119) b!761746))

(assert (= (or b!761746 b!761744) bm!34980))

(declare-fun m!708693 () Bool)

(assert (=> bm!34980 m!708693))

(declare-fun m!708695 () Bool)

(assert (=> b!761745 m!708695))

(declare-fun m!708697 () Bool)

(assert (=> b!761745 m!708697))

(declare-fun m!708699 () Bool)

(assert (=> b!761745 m!708699))

(assert (=> b!761745 m!708695))

(declare-fun m!708701 () Bool)

(assert (=> b!761745 m!708701))

(assert (=> b!761747 m!708695))

(assert (=> b!761747 m!708695))

(declare-fun m!708703 () Bool)

(assert (=> b!761747 m!708703))

(assert (=> b!761648 d!100827))

(declare-fun b!761768 () Bool)

(declare-fun c!83708 () Bool)

(declare-fun lt!339365 () (_ BitVec 64))

(assert (=> b!761768 (= c!83708 (= lt!339365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424667 () SeekEntryResult!7752)

(declare-fun e!424666 () SeekEntryResult!7752)

(assert (=> b!761768 (= e!424667 e!424666)))

(declare-fun b!761769 () Bool)

(assert (=> b!761769 (= e!424666 (MissingVacant!7752 resIntermediateIndex!5))))

(declare-fun b!761770 () Bool)

(declare-fun e!424668 () SeekEntryResult!7752)

(assert (=> b!761770 (= e!424668 Undefined!7752)))

(declare-fun b!761771 () Bool)

(assert (=> b!761771 (= e!424668 e!424667)))

(declare-fun c!83707 () Bool)

(assert (=> b!761771 (= c!83707 (= lt!339365 (select (arr!20152 a!3186) j!159)))))

(declare-fun b!761772 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761772 (= e!424666 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!339364 () SeekEntryResult!7752)

(declare-fun d!100829 () Bool)

(assert (=> d!100829 (and (or ((_ is Undefined!7752) lt!339364) (not ((_ is Found!7752) lt!339364)) (and (bvsge (index!33377 lt!339364) #b00000000000000000000000000000000) (bvslt (index!33377 lt!339364) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339364) ((_ is Found!7752) lt!339364) (not ((_ is MissingVacant!7752) lt!339364)) (not (= (index!33379 lt!339364) resIntermediateIndex!5)) (and (bvsge (index!33379 lt!339364) #b00000000000000000000000000000000) (bvslt (index!33379 lt!339364) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339364) (ite ((_ is Found!7752) lt!339364) (= (select (arr!20152 a!3186) (index!33377 lt!339364)) (select (arr!20152 a!3186) j!159)) (and ((_ is MissingVacant!7752) lt!339364) (= (index!33379 lt!339364) resIntermediateIndex!5) (= (select (arr!20152 a!3186) (index!33379 lt!339364)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100829 (= lt!339364 e!424668)))

(declare-fun c!83709 () Bool)

(assert (=> d!100829 (= c!83709 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100829 (= lt!339365 (select (arr!20152 a!3186) index!1321))))

(assert (=> d!100829 (validMask!0 mask!3328)))

(assert (=> d!100829 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339364)))

(declare-fun b!761773 () Bool)

(assert (=> b!761773 (= e!424667 (Found!7752 index!1321))))

(assert (= (and d!100829 c!83709) b!761770))

(assert (= (and d!100829 (not c!83709)) b!761771))

(assert (= (and b!761771 c!83707) b!761773))

(assert (= (and b!761771 (not c!83707)) b!761768))

(assert (= (and b!761768 c!83708) b!761769))

(assert (= (and b!761768 (not c!83708)) b!761772))

(declare-fun m!708705 () Bool)

(assert (=> b!761772 m!708705))

(assert (=> b!761772 m!708705))

(assert (=> b!761772 m!708581))

(declare-fun m!708707 () Bool)

(assert (=> b!761772 m!708707))

(declare-fun m!708709 () Bool)

(assert (=> d!100829 m!708709))

(declare-fun m!708711 () Bool)

(assert (=> d!100829 m!708711))

(declare-fun m!708713 () Bool)

(assert (=> d!100829 m!708713))

(assert (=> d!100829 m!708611))

(assert (=> b!761649 d!100829))

(declare-fun b!761826 () Bool)

(declare-fun e!424698 () Bool)

(declare-fun lt!339385 () SeekEntryResult!7752)

(assert (=> b!761826 (= e!424698 (bvsge (x!64283 lt!339385) #b01111111111111111111111111111110))))

(declare-fun e!424701 () SeekEntryResult!7752)

(declare-fun b!761827 () Bool)

(assert (=> b!761827 (= e!424701 (Intermediate!7752 false (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761828 () Bool)

(assert (=> b!761828 (and (bvsge (index!33378 lt!339385) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339385) (size!20573 a!3186)))))

(declare-fun res!515132 () Bool)

(assert (=> b!761828 (= res!515132 (= (select (arr!20152 a!3186) (index!33378 lt!339385)) (select (arr!20152 a!3186) j!159)))))

(declare-fun e!424700 () Bool)

(assert (=> b!761828 (=> res!515132 e!424700)))

(declare-fun e!424699 () Bool)

(assert (=> b!761828 (= e!424699 e!424700)))

(declare-fun b!761829 () Bool)

(assert (=> b!761829 (and (bvsge (index!33378 lt!339385) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339385) (size!20573 a!3186)))))

(assert (=> b!761829 (= e!424700 (= (select (arr!20152 a!3186) (index!33378 lt!339385)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424697 () SeekEntryResult!7752)

(declare-fun b!761831 () Bool)

(assert (=> b!761831 (= e!424697 (Intermediate!7752 true (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761832 () Bool)

(assert (=> b!761832 (= e!424701 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761833 () Bool)

(assert (=> b!761833 (= e!424698 e!424699)))

(declare-fun res!515134 () Bool)

(assert (=> b!761833 (= res!515134 (and ((_ is Intermediate!7752) lt!339385) (not (undefined!8564 lt!339385)) (bvslt (x!64283 lt!339385) #b01111111111111111111111111111110) (bvsge (x!64283 lt!339385) #b00000000000000000000000000000000) (bvsge (x!64283 lt!339385) #b00000000000000000000000000000000)))))

(assert (=> b!761833 (=> (not res!515134) (not e!424699))))

(declare-fun b!761834 () Bool)

(assert (=> b!761834 (and (bvsge (index!33378 lt!339385) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339385) (size!20573 a!3186)))))

(declare-fun res!515133 () Bool)

(assert (=> b!761834 (= res!515133 (= (select (arr!20152 a!3186) (index!33378 lt!339385)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761834 (=> res!515133 e!424700)))

(declare-fun b!761830 () Bool)

(assert (=> b!761830 (= e!424697 e!424701)))

(declare-fun lt!339386 () (_ BitVec 64))

(declare-fun c!83734 () Bool)

(assert (=> b!761830 (= c!83734 (or (= lt!339386 (select (arr!20152 a!3186) j!159)) (= (bvadd lt!339386 lt!339386) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100833 () Bool)

(assert (=> d!100833 e!424698))

(declare-fun c!83733 () Bool)

(assert (=> d!100833 (= c!83733 (and ((_ is Intermediate!7752) lt!339385) (undefined!8564 lt!339385)))))

(assert (=> d!100833 (= lt!339385 e!424697)))

(declare-fun c!83732 () Bool)

(assert (=> d!100833 (= c!83732 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100833 (= lt!339386 (select (arr!20152 a!3186) (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328)))))

(assert (=> d!100833 (validMask!0 mask!3328)))

(assert (=> d!100833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339385)))

(assert (= (and d!100833 c!83732) b!761831))

(assert (= (and d!100833 (not c!83732)) b!761830))

(assert (= (and b!761830 c!83734) b!761827))

(assert (= (and b!761830 (not c!83734)) b!761832))

(assert (= (and d!100833 c!83733) b!761826))

(assert (= (and d!100833 (not c!83733)) b!761833))

(assert (= (and b!761833 res!515134) b!761828))

(assert (= (and b!761828 (not res!515132)) b!761834))

(assert (= (and b!761834 (not res!515133)) b!761829))

(declare-fun m!708737 () Bool)

(assert (=> b!761828 m!708737))

(assert (=> d!100833 m!708615))

(declare-fun m!708739 () Bool)

(assert (=> d!100833 m!708739))

(assert (=> d!100833 m!708611))

(assert (=> b!761834 m!708737))

(assert (=> b!761829 m!708737))

(assert (=> b!761832 m!708615))

(declare-fun m!708741 () Bool)

(assert (=> b!761832 m!708741))

(assert (=> b!761832 m!708741))

(assert (=> b!761832 m!708581))

(declare-fun m!708743 () Bool)

(assert (=> b!761832 m!708743))

(assert (=> b!761639 d!100833))

(declare-fun d!100841 () Bool)

(declare-fun lt!339395 () (_ BitVec 32))

(declare-fun lt!339394 () (_ BitVec 32))

(assert (=> d!100841 (= lt!339395 (bvmul (bvxor lt!339394 (bvlshr lt!339394 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100841 (= lt!339394 ((_ extract 31 0) (bvand (bvxor (select (arr!20152 a!3186) j!159) (bvlshr (select (arr!20152 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100841 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515141 (let ((h!15233 ((_ extract 31 0) (bvand (bvxor (select (arr!20152 a!3186) j!159) (bvlshr (select (arr!20152 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64288 (bvmul (bvxor h!15233 (bvlshr h!15233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64288 (bvlshr x!64288 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515141 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515141 #b00000000000000000000000000000000))))))

(assert (=> d!100841 (= (toIndex!0 (select (arr!20152 a!3186) j!159) mask!3328) (bvand (bvxor lt!339395 (bvlshr lt!339395 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761639 d!100841))

(declare-fun b!761857 () Bool)

(declare-fun e!424722 () Bool)

(declare-fun e!424719 () Bool)

(assert (=> b!761857 (= e!424722 e!424719)))

(declare-fun c!83740 () Bool)

(assert (=> b!761857 (= c!83740 (validKeyInArray!0 (select (arr!20152 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34986 () Bool)

(declare-fun call!34989 () Bool)

(assert (=> bm!34986 (= call!34989 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83740 (Cons!14150 (select (arr!20152 a!3186) #b00000000000000000000000000000000) Nil!14151) Nil!14151)))))

(declare-fun b!761858 () Bool)

(declare-fun e!424720 () Bool)

(declare-fun contains!4072 (List!14154 (_ BitVec 64)) Bool)

(assert (=> b!761858 (= e!424720 (contains!4072 Nil!14151 (select (arr!20152 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761859 () Bool)

(assert (=> b!761859 (= e!424719 call!34989)))

(declare-fun b!761860 () Bool)

(assert (=> b!761860 (= e!424719 call!34989)))

(declare-fun b!761861 () Bool)

(declare-fun e!424721 () Bool)

(assert (=> b!761861 (= e!424721 e!424722)))

(declare-fun res!515149 () Bool)

(assert (=> b!761861 (=> (not res!515149) (not e!424722))))

(assert (=> b!761861 (= res!515149 (not e!424720))))

(declare-fun res!515148 () Bool)

(assert (=> b!761861 (=> (not res!515148) (not e!424720))))

(assert (=> b!761861 (= res!515148 (validKeyInArray!0 (select (arr!20152 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!100847 () Bool)

(declare-fun res!515150 () Bool)

(assert (=> d!100847 (=> res!515150 e!424721)))

(assert (=> d!100847 (= res!515150 (bvsge #b00000000000000000000000000000000 (size!20573 a!3186)))))

(assert (=> d!100847 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14151) e!424721)))

(assert (= (and d!100847 (not res!515150)) b!761861))

(assert (= (and b!761861 res!515148) b!761858))

(assert (= (and b!761861 res!515149) b!761857))

(assert (= (and b!761857 c!83740) b!761860))

(assert (= (and b!761857 (not c!83740)) b!761859))

(assert (= (or b!761860 b!761859) bm!34986))

(assert (=> b!761857 m!708695))

(assert (=> b!761857 m!708695))

(assert (=> b!761857 m!708703))

(assert (=> bm!34986 m!708695))

(declare-fun m!708759 () Bool)

(assert (=> bm!34986 m!708759))

(assert (=> b!761858 m!708695))

(assert (=> b!761858 m!708695))

(declare-fun m!708761 () Bool)

(assert (=> b!761858 m!708761))

(assert (=> b!761861 m!708695))

(assert (=> b!761861 m!708695))

(assert (=> b!761861 m!708703))

(assert (=> b!761650 d!100847))

(declare-fun d!100849 () Bool)

(declare-fun res!515157 () Bool)

(declare-fun e!424730 () Bool)

(assert (=> d!100849 (=> res!515157 e!424730)))

(assert (=> d!100849 (= res!515157 (= (select (arr!20152 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100849 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!424730)))

(declare-fun b!761870 () Bool)

(declare-fun e!424731 () Bool)

(assert (=> b!761870 (= e!424730 e!424731)))

(declare-fun res!515158 () Bool)

(assert (=> b!761870 (=> (not res!515158) (not e!424731))))

(assert (=> b!761870 (= res!515158 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20573 a!3186)))))

(declare-fun b!761871 () Bool)

(assert (=> b!761871 (= e!424731 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100849 (not res!515157)) b!761870))

(assert (= (and b!761870 res!515158) b!761871))

(assert (=> d!100849 m!708695))

(declare-fun m!708769 () Bool)

(assert (=> b!761871 m!708769))

(assert (=> b!761651 d!100849))

(declare-fun d!100857 () Bool)

(assert (=> d!100857 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66118 d!100857))

(declare-fun d!100871 () Bool)

(assert (=> d!100871 (= (array_inv!15948 a!3186) (bvsge (size!20573 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66118 d!100871))

(declare-fun d!100873 () Bool)

(assert (=> d!100873 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761641 d!100873))

(declare-fun call!34991 () Bool)

(declare-fun bm!34988 () Bool)

(assert (=> bm!34988 (= call!34991 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761902 () Bool)

(declare-fun e!424749 () Bool)

(assert (=> b!761902 (= e!424749 call!34991)))

(declare-fun d!100875 () Bool)

(declare-fun res!515159 () Bool)

(declare-fun e!424747 () Bool)

(assert (=> d!100875 (=> res!515159 e!424747)))

(assert (=> d!100875 (= res!515159 (bvsge j!159 (size!20573 a!3186)))))

(assert (=> d!100875 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424747)))

(declare-fun b!761903 () Bool)

(declare-fun e!424748 () Bool)

(assert (=> b!761903 (= e!424749 e!424748)))

(declare-fun lt!339419 () (_ BitVec 64))

(assert (=> b!761903 (= lt!339419 (select (arr!20152 a!3186) j!159))))

(declare-fun lt!339417 () Unit!26344)

(assert (=> b!761903 (= lt!339417 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339419 j!159))))

(assert (=> b!761903 (arrayContainsKey!0 a!3186 lt!339419 #b00000000000000000000000000000000)))

(declare-fun lt!339418 () Unit!26344)

(assert (=> b!761903 (= lt!339418 lt!339417)))

(declare-fun res!515160 () Bool)

(assert (=> b!761903 (= res!515160 (= (seekEntryOrOpen!0 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) (Found!7752 j!159)))))

(assert (=> b!761903 (=> (not res!515160) (not e!424748))))

(declare-fun b!761904 () Bool)

(assert (=> b!761904 (= e!424748 call!34991)))

(declare-fun b!761905 () Bool)

(assert (=> b!761905 (= e!424747 e!424749)))

(declare-fun c!83757 () Bool)

(assert (=> b!761905 (= c!83757 (validKeyInArray!0 (select (arr!20152 a!3186) j!159)))))

(assert (= (and d!100875 (not res!515159)) b!761905))

(assert (= (and b!761905 c!83757) b!761903))

(assert (= (and b!761905 (not c!83757)) b!761902))

(assert (= (and b!761903 res!515160) b!761904))

(assert (= (or b!761904 b!761902) bm!34988))

(declare-fun m!708811 () Bool)

(assert (=> bm!34988 m!708811))

(assert (=> b!761903 m!708581))

(declare-fun m!708813 () Bool)

(assert (=> b!761903 m!708813))

(declare-fun m!708815 () Bool)

(assert (=> b!761903 m!708815))

(assert (=> b!761903 m!708581))

(assert (=> b!761903 m!708593))

(assert (=> b!761905 m!708581))

(assert (=> b!761905 m!708581))

(assert (=> b!761905 m!708587))

(assert (=> b!761652 d!100875))

(declare-fun d!100877 () Bool)

(assert (=> d!100877 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339422 () Unit!26344)

(declare-fun choose!38 (array!42086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26344)

(assert (=> d!100877 (= lt!339422 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100877 (validMask!0 mask!3328)))

(assert (=> d!100877 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339422)))

(declare-fun bs!21412 () Bool)

(assert (= bs!21412 d!100877))

(assert (=> bs!21412 m!708607))

(declare-fun m!708817 () Bool)

(assert (=> bs!21412 m!708817))

(assert (=> bs!21412 m!708611))

(assert (=> b!761652 d!100877))

(declare-fun b!761906 () Bool)

(declare-fun c!83759 () Bool)

(declare-fun lt!339424 () (_ BitVec 64))

(assert (=> b!761906 (= c!83759 (= lt!339424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424751 () SeekEntryResult!7752)

(declare-fun e!424750 () SeekEntryResult!7752)

(assert (=> b!761906 (= e!424751 e!424750)))

(declare-fun b!761907 () Bool)

(assert (=> b!761907 (= e!424750 (MissingVacant!7752 resIntermediateIndex!5))))

(declare-fun b!761908 () Bool)

(declare-fun e!424752 () SeekEntryResult!7752)

(assert (=> b!761908 (= e!424752 Undefined!7752)))

(declare-fun b!761909 () Bool)

(assert (=> b!761909 (= e!424752 e!424751)))

(declare-fun c!83758 () Bool)

(assert (=> b!761909 (= c!83758 (= lt!339424 (select (arr!20152 a!3186) j!159)))))

(declare-fun b!761910 () Bool)

(assert (=> b!761910 (= e!424750 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100879 () Bool)

(declare-fun lt!339423 () SeekEntryResult!7752)

(assert (=> d!100879 (and (or ((_ is Undefined!7752) lt!339423) (not ((_ is Found!7752) lt!339423)) (and (bvsge (index!33377 lt!339423) #b00000000000000000000000000000000) (bvslt (index!33377 lt!339423) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339423) ((_ is Found!7752) lt!339423) (not ((_ is MissingVacant!7752) lt!339423)) (not (= (index!33379 lt!339423) resIntermediateIndex!5)) (and (bvsge (index!33379 lt!339423) #b00000000000000000000000000000000) (bvslt (index!33379 lt!339423) (size!20573 a!3186)))) (or ((_ is Undefined!7752) lt!339423) (ite ((_ is Found!7752) lt!339423) (= (select (arr!20152 a!3186) (index!33377 lt!339423)) (select (arr!20152 a!3186) j!159)) (and ((_ is MissingVacant!7752) lt!339423) (= (index!33379 lt!339423) resIntermediateIndex!5) (= (select (arr!20152 a!3186) (index!33379 lt!339423)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100879 (= lt!339423 e!424752)))

(declare-fun c!83760 () Bool)

(assert (=> d!100879 (= c!83760 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!100879 (= lt!339424 (select (arr!20152 a!3186) resIntermediateIndex!5))))

(assert (=> d!100879 (validMask!0 mask!3328)))

(assert (=> d!100879 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339423)))

(declare-fun b!761911 () Bool)

(assert (=> b!761911 (= e!424751 (Found!7752 resIntermediateIndex!5))))

(assert (= (and d!100879 c!83760) b!761908))

(assert (= (and d!100879 (not c!83760)) b!761909))

(assert (= (and b!761909 c!83758) b!761911))

(assert (= (and b!761909 (not c!83758)) b!761906))

(assert (= (and b!761906 c!83759) b!761907))

(assert (= (and b!761906 (not c!83759)) b!761910))

(declare-fun m!708819 () Bool)

(assert (=> b!761910 m!708819))

(assert (=> b!761910 m!708819))

(assert (=> b!761910 m!708581))

(declare-fun m!708821 () Bool)

(assert (=> b!761910 m!708821))

(declare-fun m!708823 () Bool)

(assert (=> d!100879 m!708823))

(declare-fun m!708825 () Bool)

(assert (=> d!100879 m!708825))

(assert (=> d!100879 m!708591))

(assert (=> d!100879 m!708611))

(assert (=> b!761642 d!100879))

(declare-fun b!761912 () Bool)

(declare-fun e!424754 () Bool)

(declare-fun lt!339425 () SeekEntryResult!7752)

(assert (=> b!761912 (= e!424754 (bvsge (x!64283 lt!339425) #b01111111111111111111111111111110))))

(declare-fun b!761913 () Bool)

(declare-fun e!424757 () SeekEntryResult!7752)

(assert (=> b!761913 (= e!424757 (Intermediate!7752 false index!1321 x!1131))))

(declare-fun b!761914 () Bool)

(assert (=> b!761914 (and (bvsge (index!33378 lt!339425) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339425) (size!20573 a!3186)))))

(declare-fun res!515161 () Bool)

(assert (=> b!761914 (= res!515161 (= (select (arr!20152 a!3186) (index!33378 lt!339425)) (select (arr!20152 a!3186) j!159)))))

(declare-fun e!424756 () Bool)

(assert (=> b!761914 (=> res!515161 e!424756)))

(declare-fun e!424755 () Bool)

(assert (=> b!761914 (= e!424755 e!424756)))

(declare-fun b!761915 () Bool)

(assert (=> b!761915 (and (bvsge (index!33378 lt!339425) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339425) (size!20573 a!3186)))))

(assert (=> b!761915 (= e!424756 (= (select (arr!20152 a!3186) (index!33378 lt!339425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761917 () Bool)

(declare-fun e!424753 () SeekEntryResult!7752)

(assert (=> b!761917 (= e!424753 (Intermediate!7752 true index!1321 x!1131))))

(declare-fun b!761918 () Bool)

(assert (=> b!761918 (= e!424757 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20152 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761919 () Bool)

(assert (=> b!761919 (= e!424754 e!424755)))

(declare-fun res!515163 () Bool)

(assert (=> b!761919 (= res!515163 (and ((_ is Intermediate!7752) lt!339425) (not (undefined!8564 lt!339425)) (bvslt (x!64283 lt!339425) #b01111111111111111111111111111110) (bvsge (x!64283 lt!339425) #b00000000000000000000000000000000) (bvsge (x!64283 lt!339425) x!1131)))))

(assert (=> b!761919 (=> (not res!515163) (not e!424755))))

(declare-fun b!761920 () Bool)

(assert (=> b!761920 (and (bvsge (index!33378 lt!339425) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339425) (size!20573 a!3186)))))

(declare-fun res!515162 () Bool)

(assert (=> b!761920 (= res!515162 (= (select (arr!20152 a!3186) (index!33378 lt!339425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761920 (=> res!515162 e!424756)))

(declare-fun b!761916 () Bool)

(assert (=> b!761916 (= e!424753 e!424757)))

(declare-fun c!83763 () Bool)

(declare-fun lt!339426 () (_ BitVec 64))

(assert (=> b!761916 (= c!83763 (or (= lt!339426 (select (arr!20152 a!3186) j!159)) (= (bvadd lt!339426 lt!339426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100881 () Bool)

(assert (=> d!100881 e!424754))

(declare-fun c!83762 () Bool)

(assert (=> d!100881 (= c!83762 (and ((_ is Intermediate!7752) lt!339425) (undefined!8564 lt!339425)))))

(assert (=> d!100881 (= lt!339425 e!424753)))

(declare-fun c!83761 () Bool)

(assert (=> d!100881 (= c!83761 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100881 (= lt!339426 (select (arr!20152 a!3186) index!1321))))

(assert (=> d!100881 (validMask!0 mask!3328)))

(assert (=> d!100881 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20152 a!3186) j!159) a!3186 mask!3328) lt!339425)))

(assert (= (and d!100881 c!83761) b!761917))

(assert (= (and d!100881 (not c!83761)) b!761916))

(assert (= (and b!761916 c!83763) b!761913))

(assert (= (and b!761916 (not c!83763)) b!761918))

(assert (= (and d!100881 c!83762) b!761912))

(assert (= (and d!100881 (not c!83762)) b!761919))

(assert (= (and b!761919 res!515163) b!761914))

(assert (= (and b!761914 (not res!515161)) b!761920))

(assert (= (and b!761920 (not res!515162)) b!761915))

(declare-fun m!708827 () Bool)

(assert (=> b!761914 m!708827))

(assert (=> d!100881 m!708713))

(assert (=> d!100881 m!708611))

(assert (=> b!761920 m!708827))

(assert (=> b!761915 m!708827))

(assert (=> b!761918 m!708705))

(assert (=> b!761918 m!708705))

(assert (=> b!761918 m!708581))

(declare-fun m!708829 () Bool)

(assert (=> b!761918 m!708829))

(assert (=> b!761653 d!100881))

(declare-fun d!100883 () Bool)

(assert (=> d!100883 (= (validKeyInArray!0 (select (arr!20152 a!3186) j!159)) (and (not (= (select (arr!20152 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20152 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761643 d!100883))

(assert (=> b!761654 d!100829))

(declare-fun b!761921 () Bool)

(declare-fun e!424759 () Bool)

(declare-fun lt!339427 () SeekEntryResult!7752)

(assert (=> b!761921 (= e!424759 (bvsge (x!64283 lt!339427) #b01111111111111111111111111111110))))

(declare-fun b!761922 () Bool)

(declare-fun e!424762 () SeekEntryResult!7752)

(assert (=> b!761922 (= e!424762 (Intermediate!7752 false index!1321 x!1131))))

(declare-fun b!761923 () Bool)

(assert (=> b!761923 (and (bvsge (index!33378 lt!339427) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339427) (size!20573 lt!339302)))))

(declare-fun res!515164 () Bool)

(assert (=> b!761923 (= res!515164 (= (select (arr!20152 lt!339302) (index!33378 lt!339427)) lt!339306))))

(declare-fun e!424761 () Bool)

(assert (=> b!761923 (=> res!515164 e!424761)))

(declare-fun e!424760 () Bool)

(assert (=> b!761923 (= e!424760 e!424761)))

(declare-fun b!761924 () Bool)

(assert (=> b!761924 (and (bvsge (index!33378 lt!339427) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339427) (size!20573 lt!339302)))))

(assert (=> b!761924 (= e!424761 (= (select (arr!20152 lt!339302) (index!33378 lt!339427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761926 () Bool)

(declare-fun e!424758 () SeekEntryResult!7752)

(assert (=> b!761926 (= e!424758 (Intermediate!7752 true index!1321 x!1131))))

(declare-fun b!761927 () Bool)

(assert (=> b!761927 (= e!424762 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!339306 lt!339302 mask!3328))))

(declare-fun b!761928 () Bool)

(assert (=> b!761928 (= e!424759 e!424760)))

(declare-fun res!515166 () Bool)

(assert (=> b!761928 (= res!515166 (and ((_ is Intermediate!7752) lt!339427) (not (undefined!8564 lt!339427)) (bvslt (x!64283 lt!339427) #b01111111111111111111111111111110) (bvsge (x!64283 lt!339427) #b00000000000000000000000000000000) (bvsge (x!64283 lt!339427) x!1131)))))

(assert (=> b!761928 (=> (not res!515166) (not e!424760))))

(declare-fun b!761929 () Bool)

(assert (=> b!761929 (and (bvsge (index!33378 lt!339427) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339427) (size!20573 lt!339302)))))

(declare-fun res!515165 () Bool)

(assert (=> b!761929 (= res!515165 (= (select (arr!20152 lt!339302) (index!33378 lt!339427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761929 (=> res!515165 e!424761)))

(declare-fun b!761925 () Bool)

(assert (=> b!761925 (= e!424758 e!424762)))

(declare-fun c!83766 () Bool)

(declare-fun lt!339428 () (_ BitVec 64))

(assert (=> b!761925 (= c!83766 (or (= lt!339428 lt!339306) (= (bvadd lt!339428 lt!339428) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100885 () Bool)

(assert (=> d!100885 e!424759))

(declare-fun c!83765 () Bool)

(assert (=> d!100885 (= c!83765 (and ((_ is Intermediate!7752) lt!339427) (undefined!8564 lt!339427)))))

(assert (=> d!100885 (= lt!339427 e!424758)))

(declare-fun c!83764 () Bool)

(assert (=> d!100885 (= c!83764 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100885 (= lt!339428 (select (arr!20152 lt!339302) index!1321))))

(assert (=> d!100885 (validMask!0 mask!3328)))

(assert (=> d!100885 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339306 lt!339302 mask!3328) lt!339427)))

(assert (= (and d!100885 c!83764) b!761926))

(assert (= (and d!100885 (not c!83764)) b!761925))

(assert (= (and b!761925 c!83766) b!761922))

(assert (= (and b!761925 (not c!83766)) b!761927))

(assert (= (and d!100885 c!83765) b!761921))

(assert (= (and d!100885 (not c!83765)) b!761928))

(assert (= (and b!761928 res!515166) b!761923))

(assert (= (and b!761923 (not res!515164)) b!761929))

(assert (= (and b!761929 (not res!515165)) b!761924))

(declare-fun m!708831 () Bool)

(assert (=> b!761923 m!708831))

(declare-fun m!708833 () Bool)

(assert (=> d!100885 m!708833))

(assert (=> d!100885 m!708611))

(assert (=> b!761929 m!708831))

(assert (=> b!761924 m!708831))

(assert (=> b!761927 m!708705))

(assert (=> b!761927 m!708705))

(declare-fun m!708835 () Bool)

(assert (=> b!761927 m!708835))

(assert (=> b!761646 d!100885))

(declare-fun b!761932 () Bool)

(declare-fun e!424764 () Bool)

(declare-fun lt!339433 () SeekEntryResult!7752)

(assert (=> b!761932 (= e!424764 (bvsge (x!64283 lt!339433) #b01111111111111111111111111111110))))

(declare-fun b!761933 () Bool)

(declare-fun e!424767 () SeekEntryResult!7752)

(assert (=> b!761933 (= e!424767 (Intermediate!7752 false (toIndex!0 lt!339306 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761934 () Bool)

(assert (=> b!761934 (and (bvsge (index!33378 lt!339433) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339433) (size!20573 lt!339302)))))

(declare-fun res!515167 () Bool)

(assert (=> b!761934 (= res!515167 (= (select (arr!20152 lt!339302) (index!33378 lt!339433)) lt!339306))))

(declare-fun e!424766 () Bool)

(assert (=> b!761934 (=> res!515167 e!424766)))

(declare-fun e!424765 () Bool)

(assert (=> b!761934 (= e!424765 e!424766)))

(declare-fun b!761935 () Bool)

(assert (=> b!761935 (and (bvsge (index!33378 lt!339433) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339433) (size!20573 lt!339302)))))

(assert (=> b!761935 (= e!424766 (= (select (arr!20152 lt!339302) (index!33378 lt!339433)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!761938 () Bool)

(declare-fun e!424763 () SeekEntryResult!7752)

(assert (=> b!761938 (= e!424763 (Intermediate!7752 true (toIndex!0 lt!339306 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761940 () Bool)

(assert (=> b!761940 (= e!424767 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339306 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!339306 lt!339302 mask!3328))))

(declare-fun b!761941 () Bool)

(assert (=> b!761941 (= e!424764 e!424765)))

(declare-fun res!515169 () Bool)

(assert (=> b!761941 (= res!515169 (and ((_ is Intermediate!7752) lt!339433) (not (undefined!8564 lt!339433)) (bvslt (x!64283 lt!339433) #b01111111111111111111111111111110) (bvsge (x!64283 lt!339433) #b00000000000000000000000000000000) (bvsge (x!64283 lt!339433) #b00000000000000000000000000000000)))))

(assert (=> b!761941 (=> (not res!515169) (not e!424765))))

(declare-fun b!761942 () Bool)

(assert (=> b!761942 (and (bvsge (index!33378 lt!339433) #b00000000000000000000000000000000) (bvslt (index!33378 lt!339433) (size!20573 lt!339302)))))

(declare-fun res!515168 () Bool)

(assert (=> b!761942 (= res!515168 (= (select (arr!20152 lt!339302) (index!33378 lt!339433)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761942 (=> res!515168 e!424766)))

(declare-fun b!761937 () Bool)

(assert (=> b!761937 (= e!424763 e!424767)))

(declare-fun c!83769 () Bool)

(declare-fun lt!339434 () (_ BitVec 64))

(assert (=> b!761937 (= c!83769 (or (= lt!339434 lt!339306) (= (bvadd lt!339434 lt!339434) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!100887 () Bool)

(assert (=> d!100887 e!424764))

(declare-fun c!83768 () Bool)

(assert (=> d!100887 (= c!83768 (and ((_ is Intermediate!7752) lt!339433) (undefined!8564 lt!339433)))))

(assert (=> d!100887 (= lt!339433 e!424763)))

(declare-fun c!83767 () Bool)

(assert (=> d!100887 (= c!83767 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100887 (= lt!339434 (select (arr!20152 lt!339302) (toIndex!0 lt!339306 mask!3328)))))

(assert (=> d!100887 (validMask!0 mask!3328)))

(assert (=> d!100887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339306 mask!3328) lt!339306 lt!339302 mask!3328) lt!339433)))

(assert (= (and d!100887 c!83767) b!761938))

(assert (= (and d!100887 (not c!83767)) b!761937))

(assert (= (and b!761937 c!83769) b!761933))

(assert (= (and b!761937 (not c!83769)) b!761940))

(assert (= (and d!100887 c!83768) b!761932))

(assert (= (and d!100887 (not c!83768)) b!761941))

(assert (= (and b!761941 res!515169) b!761934))

(assert (= (and b!761934 (not res!515167)) b!761942))

(assert (= (and b!761942 (not res!515168)) b!761935))

(declare-fun m!708837 () Bool)

(assert (=> b!761934 m!708837))

(assert (=> d!100887 m!708601))

(declare-fun m!708839 () Bool)

(assert (=> d!100887 m!708839))

(assert (=> d!100887 m!708611))

(assert (=> b!761942 m!708837))

(assert (=> b!761935 m!708837))

(assert (=> b!761940 m!708601))

(declare-fun m!708841 () Bool)

(assert (=> b!761940 m!708841))

(assert (=> b!761940 m!708841))

(declare-fun m!708843 () Bool)

(assert (=> b!761940 m!708843))

(assert (=> b!761646 d!100887))

(declare-fun d!100889 () Bool)

(declare-fun lt!339436 () (_ BitVec 32))

(declare-fun lt!339435 () (_ BitVec 32))

(assert (=> d!100889 (= lt!339436 (bvmul (bvxor lt!339435 (bvlshr lt!339435 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100889 (= lt!339435 ((_ extract 31 0) (bvand (bvxor lt!339306 (bvlshr lt!339306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100889 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!515141 (let ((h!15233 ((_ extract 31 0) (bvand (bvxor lt!339306 (bvlshr lt!339306 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64288 (bvmul (bvxor h!15233 (bvlshr h!15233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64288 (bvlshr x!64288 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!515141 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!515141 #b00000000000000000000000000000000))))))

(assert (=> d!100889 (= (toIndex!0 lt!339306 mask!3328) (bvand (bvxor lt!339436 (bvlshr lt!339436 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761646 d!100889))

(check-sat (not bm!34986) (not d!100877) (not bm!34980) (not b!761772) (not b!761940) (not d!100833) (not b!761861) (not d!100823) (not b!761832) (not b!761905) (not d!100885) (not b!761858) (not d!100887) (not d!100825) (not b!761745) (not b!761910) (not b!761903) (not b!761918) (not d!100879) (not b!761726) (not bm!34988) (not b!761871) (not b!761747) (not d!100829) (not b!761732) (not b!761927) (not d!100881) (not b!761857))
(check-sat)
