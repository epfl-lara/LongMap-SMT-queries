; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67720 () Bool)

(assert start!67720)

(declare-fun b!785552 () Bool)

(declare-fun res!531772 () Bool)

(declare-fun e!436716 () Bool)

(assert (=> b!785552 (=> (not res!531772) (not e!436716))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350268 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42760 0))(
  ( (array!42761 (arr!20468 (Array (_ BitVec 32) (_ BitVec 64))) (size!20889 (_ BitVec 32))) )
))
(declare-fun lt!350269 () array!42760)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8068 0))(
  ( (MissingZero!8068 (index!34640 (_ BitVec 32))) (Found!8068 (index!34641 (_ BitVec 32))) (Intermediate!8068 (undefined!8880 Bool) (index!34642 (_ BitVec 32)) (x!65584 (_ BitVec 32))) (Undefined!8068) (MissingVacant!8068 (index!34643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8068)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!785552 (= res!531772 (= (seekEntryOrOpen!0 lt!350268 lt!350269 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350268 lt!350269 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!42760)

(declare-fun b!785553 () Bool)

(declare-fun e!436714 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!785553 (= e!436714 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) (Found!8068 j!159)))))

(declare-fun b!785554 () Bool)

(declare-fun res!531756 () Bool)

(declare-fun e!436719 () Bool)

(assert (=> b!785554 (=> (not res!531756) (not e!436719))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785554 (= res!531756 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20889 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20889 a!3186))))))

(declare-fun b!785555 () Bool)

(declare-fun e!436721 () Bool)

(declare-fun e!436723 () Bool)

(assert (=> b!785555 (= e!436721 e!436723)))

(declare-fun res!531766 () Bool)

(assert (=> b!785555 (=> res!531766 e!436723)))

(declare-fun lt!350267 () (_ BitVec 64))

(assert (=> b!785555 (= res!531766 (= lt!350267 lt!350268))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!785555 (= lt!350267 (select (store (arr!20468 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785556 () Bool)

(declare-fun res!531757 () Bool)

(declare-fun e!436717 () Bool)

(assert (=> b!785556 (=> (not res!531757) (not e!436717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785556 (= res!531757 (validKeyInArray!0 (select (arr!20468 a!3186) j!159)))))

(declare-fun b!785557 () Bool)

(declare-fun lt!350275 () SeekEntryResult!8068)

(declare-fun lt!350276 () SeekEntryResult!8068)

(assert (=> b!785557 (= e!436716 (= lt!350275 lt!350276))))

(declare-fun b!785558 () Bool)

(declare-fun res!531768 () Bool)

(assert (=> b!785558 (=> (not res!531768) (not e!436719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42760 (_ BitVec 32)) Bool)

(assert (=> b!785558 (= res!531768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785559 () Bool)

(declare-fun res!531761 () Bool)

(assert (=> b!785559 (=> (not res!531761) (not e!436717))))

(declare-fun arrayContainsKey!0 (array!42760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785559 (= res!531761 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785560 () Bool)

(declare-datatypes ((Unit!27160 0))(
  ( (Unit!27161) )
))
(declare-fun e!436713 () Unit!27160)

(declare-fun Unit!27162 () Unit!27160)

(assert (=> b!785560 (= e!436713 Unit!27162)))

(assert (=> b!785560 false))

(declare-fun b!785561 () Bool)

(declare-fun e!436715 () Bool)

(declare-fun e!436720 () Bool)

(assert (=> b!785561 (= e!436715 e!436720)))

(declare-fun res!531762 () Bool)

(assert (=> b!785561 (=> (not res!531762) (not e!436720))))

(declare-fun lt!350265 () SeekEntryResult!8068)

(declare-fun lt!350273 () SeekEntryResult!8068)

(assert (=> b!785561 (= res!531762 (= lt!350265 lt!350273))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42760 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!785561 (= lt!350273 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350268 lt!350269 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785561 (= lt!350265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350268 mask!3328) lt!350268 lt!350269 mask!3328))))

(assert (=> b!785561 (= lt!350268 (select (store (arr!20468 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785561 (= lt!350269 (array!42761 (store (arr!20468 a!3186) i!1173 k!2102) (size!20889 a!3186)))))

(declare-fun b!785562 () Bool)

(assert (=> b!785562 (= e!436717 e!436719)))

(declare-fun res!531773 () Bool)

(assert (=> b!785562 (=> (not res!531773) (not e!436719))))

(declare-fun lt!350270 () SeekEntryResult!8068)

(assert (=> b!785562 (= res!531773 (or (= lt!350270 (MissingZero!8068 i!1173)) (= lt!350270 (MissingVacant!8068 i!1173))))))

(assert (=> b!785562 (= lt!350270 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785563 () Bool)

(declare-fun res!531764 () Bool)

(assert (=> b!785563 (=> (not res!531764) (not e!436715))))

(assert (=> b!785563 (= res!531764 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20468 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785565 () Bool)

(declare-fun res!531767 () Bool)

(assert (=> b!785565 (=> (not res!531767) (not e!436715))))

(assert (=> b!785565 (= res!531767 e!436714)))

(declare-fun c!87307 () Bool)

(assert (=> b!785565 (= c!87307 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785566 () Bool)

(declare-fun e!436718 () Bool)

(assert (=> b!785566 (= e!436718 e!436721)))

(declare-fun res!531760 () Bool)

(assert (=> b!785566 (=> res!531760 e!436721)))

(declare-fun lt!350274 () SeekEntryResult!8068)

(assert (=> b!785566 (= res!531760 (not (= lt!350276 lt!350274)))))

(assert (=> b!785566 (= lt!350276 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!350266 () SeekEntryResult!8068)

(declare-fun b!785567 () Bool)

(assert (=> b!785567 (= e!436714 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350266))))

(declare-fun b!785568 () Bool)

(declare-fun res!531769 () Bool)

(assert (=> b!785568 (=> (not res!531769) (not e!436719))))

(declare-datatypes ((List!14470 0))(
  ( (Nil!14467) (Cons!14466 (h!15589 (_ BitVec 64)) (t!20785 List!14470)) )
))
(declare-fun arrayNoDuplicates!0 (array!42760 (_ BitVec 32) List!14470) Bool)

(assert (=> b!785568 (= res!531769 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14467))))

(declare-fun e!436724 () Bool)

(declare-fun b!785569 () Bool)

(assert (=> b!785569 (= e!436724 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350274))))

(declare-fun b!785570 () Bool)

(assert (=> b!785570 (= e!436720 (not e!436718))))

(declare-fun res!531770 () Bool)

(assert (=> b!785570 (=> res!531770 e!436718)))

(assert (=> b!785570 (= res!531770 (or (not (is-Intermediate!8068 lt!350273)) (bvslt x!1131 (x!65584 lt!350273)) (not (= x!1131 (x!65584 lt!350273))) (not (= index!1321 (index!34642 lt!350273)))))))

(assert (=> b!785570 e!436724))

(declare-fun res!531759 () Bool)

(assert (=> b!785570 (=> (not res!531759) (not e!436724))))

(assert (=> b!785570 (= res!531759 (= lt!350275 lt!350274))))

(assert (=> b!785570 (= lt!350274 (Found!8068 j!159))))

(assert (=> b!785570 (= lt!350275 (seekEntryOrOpen!0 (select (arr!20468 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785570 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350271 () Unit!27160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27160)

(assert (=> b!785570 (= lt!350271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785571 () Bool)

(assert (=> b!785571 (= e!436723 true)))

(assert (=> b!785571 e!436716))

(declare-fun res!531771 () Bool)

(assert (=> b!785571 (=> (not res!531771) (not e!436716))))

(assert (=> b!785571 (= res!531771 (= lt!350267 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350272 () Unit!27160)

(assert (=> b!785571 (= lt!350272 e!436713)))

(declare-fun c!87306 () Bool)

(assert (=> b!785571 (= c!87306 (= lt!350267 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785572 () Bool)

(declare-fun res!531755 () Bool)

(assert (=> b!785572 (=> (not res!531755) (not e!436717))))

(assert (=> b!785572 (= res!531755 (and (= (size!20889 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20889 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20889 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785573 () Bool)

(declare-fun Unit!27163 () Unit!27160)

(assert (=> b!785573 (= e!436713 Unit!27163)))

(declare-fun b!785574 () Bool)

(assert (=> b!785574 (= e!436719 e!436715)))

(declare-fun res!531765 () Bool)

(assert (=> b!785574 (=> (not res!531765) (not e!436715))))

(assert (=> b!785574 (= res!531765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20468 a!3186) j!159) mask!3328) (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350266))))

(assert (=> b!785574 (= lt!350266 (Intermediate!8068 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785564 () Bool)

(declare-fun res!531758 () Bool)

(assert (=> b!785564 (=> (not res!531758) (not e!436717))))

(assert (=> b!785564 (= res!531758 (validKeyInArray!0 k!2102))))

(declare-fun res!531763 () Bool)

(assert (=> start!67720 (=> (not res!531763) (not e!436717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67720 (= res!531763 (validMask!0 mask!3328))))

(assert (=> start!67720 e!436717))

(assert (=> start!67720 true))

(declare-fun array_inv!16264 (array!42760) Bool)

(assert (=> start!67720 (array_inv!16264 a!3186)))

(assert (= (and start!67720 res!531763) b!785572))

(assert (= (and b!785572 res!531755) b!785556))

(assert (= (and b!785556 res!531757) b!785564))

(assert (= (and b!785564 res!531758) b!785559))

(assert (= (and b!785559 res!531761) b!785562))

(assert (= (and b!785562 res!531773) b!785558))

(assert (= (and b!785558 res!531768) b!785568))

(assert (= (and b!785568 res!531769) b!785554))

(assert (= (and b!785554 res!531756) b!785574))

(assert (= (and b!785574 res!531765) b!785563))

(assert (= (and b!785563 res!531764) b!785565))

(assert (= (and b!785565 c!87307) b!785567))

(assert (= (and b!785565 (not c!87307)) b!785553))

(assert (= (and b!785565 res!531767) b!785561))

(assert (= (and b!785561 res!531762) b!785570))

(assert (= (and b!785570 res!531759) b!785569))

(assert (= (and b!785570 (not res!531770)) b!785566))

(assert (= (and b!785566 (not res!531760)) b!785555))

(assert (= (and b!785555 (not res!531766)) b!785571))

(assert (= (and b!785571 c!87306) b!785560))

(assert (= (and b!785571 (not c!87306)) b!785573))

(assert (= (and b!785571 res!531771) b!785552))

(assert (= (and b!785552 res!531772) b!785557))

(declare-fun m!727597 () Bool)

(assert (=> b!785556 m!727597))

(assert (=> b!785556 m!727597))

(declare-fun m!727599 () Bool)

(assert (=> b!785556 m!727599))

(declare-fun m!727601 () Bool)

(assert (=> b!785561 m!727601))

(declare-fun m!727603 () Bool)

(assert (=> b!785561 m!727603))

(declare-fun m!727605 () Bool)

(assert (=> b!785561 m!727605))

(assert (=> b!785561 m!727605))

(declare-fun m!727607 () Bool)

(assert (=> b!785561 m!727607))

(declare-fun m!727609 () Bool)

(assert (=> b!785561 m!727609))

(assert (=> b!785569 m!727597))

(assert (=> b!785569 m!727597))

(declare-fun m!727611 () Bool)

(assert (=> b!785569 m!727611))

(assert (=> b!785574 m!727597))

(assert (=> b!785574 m!727597))

(declare-fun m!727613 () Bool)

(assert (=> b!785574 m!727613))

(assert (=> b!785574 m!727613))

(assert (=> b!785574 m!727597))

(declare-fun m!727615 () Bool)

(assert (=> b!785574 m!727615))

(assert (=> b!785553 m!727597))

(assert (=> b!785553 m!727597))

(declare-fun m!727617 () Bool)

(assert (=> b!785553 m!727617))

(declare-fun m!727619 () Bool)

(assert (=> start!67720 m!727619))

(declare-fun m!727621 () Bool)

(assert (=> start!67720 m!727621))

(assert (=> b!785555 m!727603))

(declare-fun m!727623 () Bool)

(assert (=> b!785555 m!727623))

(assert (=> b!785566 m!727597))

(assert (=> b!785566 m!727597))

(assert (=> b!785566 m!727617))

(declare-fun m!727625 () Bool)

(assert (=> b!785558 m!727625))

(declare-fun m!727627 () Bool)

(assert (=> b!785562 m!727627))

(declare-fun m!727629 () Bool)

(assert (=> b!785552 m!727629))

(declare-fun m!727631 () Bool)

(assert (=> b!785552 m!727631))

(assert (=> b!785570 m!727597))

(assert (=> b!785570 m!727597))

(declare-fun m!727633 () Bool)

(assert (=> b!785570 m!727633))

(declare-fun m!727635 () Bool)

(assert (=> b!785570 m!727635))

(declare-fun m!727637 () Bool)

(assert (=> b!785570 m!727637))

(declare-fun m!727639 () Bool)

(assert (=> b!785559 m!727639))

(assert (=> b!785567 m!727597))

(assert (=> b!785567 m!727597))

(declare-fun m!727641 () Bool)

(assert (=> b!785567 m!727641))

(declare-fun m!727643 () Bool)

(assert (=> b!785564 m!727643))

(declare-fun m!727645 () Bool)

(assert (=> b!785563 m!727645))

(declare-fun m!727647 () Bool)

(assert (=> b!785568 m!727647))

(push 1)

