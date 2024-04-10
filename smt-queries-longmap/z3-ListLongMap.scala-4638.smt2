; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64530 () Bool)

(assert start!64530)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41048 0))(
  ( (array!41049 (arr!19645 (Array (_ BitVec 32) (_ BitVec 64))) (size!20066 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41048)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!726599 () Bool)

(declare-fun e!406803 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7245 0))(
  ( (MissingZero!7245 (index!31348 (_ BitVec 32))) (Found!7245 (index!31349 (_ BitVec 32))) (Intermediate!7245 (undefined!8057 Bool) (index!31350 (_ BitVec 32)) (x!62335 (_ BitVec 32))) (Undefined!7245) (MissingVacant!7245 (index!31351 (_ BitVec 32))) )
))
(declare-fun lt!321789 () SeekEntryResult!7245)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41048 (_ BitVec 32)) SeekEntryResult!7245)

(assert (=> b!726599 (= e!406803 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!321789))))

(declare-fun b!726600 () Bool)

(declare-fun e!406802 () Bool)

(assert (=> b!726600 (= e!406802 e!406803)))

(declare-fun res!487574 () Bool)

(assert (=> b!726600 (=> (not res!487574) (not e!406803))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41048 (_ BitVec 32)) SeekEntryResult!7245)

(assert (=> b!726600 (= res!487574 (= (seekEntryOrOpen!0 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!321789))))

(assert (=> b!726600 (= lt!321789 (Found!7245 j!159))))

(declare-fun b!726601 () Bool)

(declare-fun res!487563 () Bool)

(declare-fun e!406807 () Bool)

(assert (=> b!726601 (=> (not res!487563) (not e!406807))))

(declare-fun e!406806 () Bool)

(assert (=> b!726601 (= res!487563 e!406806)))

(declare-fun c!79891 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!726601 (= c!79891 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!487570 () Bool)

(declare-fun e!406801 () Bool)

(assert (=> start!64530 (=> (not res!487570) (not e!406801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64530 (= res!487570 (validMask!0 mask!3328))))

(assert (=> start!64530 e!406801))

(assert (=> start!64530 true))

(declare-fun array_inv!15441 (array!41048) Bool)

(assert (=> start!64530 (array_inv!15441 a!3186)))

(declare-fun b!726602 () Bool)

(declare-fun res!487577 () Bool)

(assert (=> b!726602 (=> (not res!487577) (not e!406807))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726602 (= res!487577 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19645 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726603 () Bool)

(declare-fun e!406804 () Bool)

(assert (=> b!726603 (= e!406801 e!406804)))

(declare-fun res!487571 () Bool)

(assert (=> b!726603 (=> (not res!487571) (not e!406804))))

(declare-fun lt!321791 () SeekEntryResult!7245)

(assert (=> b!726603 (= res!487571 (or (= lt!321791 (MissingZero!7245 i!1173)) (= lt!321791 (MissingVacant!7245 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726603 (= lt!321791 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726604 () Bool)

(declare-fun res!487576 () Bool)

(assert (=> b!726604 (=> (not res!487576) (not e!406801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726604 (= res!487576 (validKeyInArray!0 (select (arr!19645 a!3186) j!159)))))

(declare-fun b!726605 () Bool)

(declare-fun res!487564 () Bool)

(assert (=> b!726605 (=> (not res!487564) (not e!406804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41048 (_ BitVec 32)) Bool)

(assert (=> b!726605 (= res!487564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726606 () Bool)

(declare-fun res!487568 () Bool)

(assert (=> b!726606 (=> (not res!487568) (not e!406804))))

(declare-datatypes ((List!13647 0))(
  ( (Nil!13644) (Cons!13643 (h!14700 (_ BitVec 64)) (t!19962 List!13647)) )
))
(declare-fun arrayNoDuplicates!0 (array!41048 (_ BitVec 32) List!13647) Bool)

(assert (=> b!726606 (= res!487568 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13644))))

(declare-fun b!726607 () Bool)

(assert (=> b!726607 (= e!406804 e!406807)))

(declare-fun res!487565 () Bool)

(assert (=> b!726607 (=> (not res!487565) (not e!406807))))

(declare-fun lt!321787 () SeekEntryResult!7245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41048 (_ BitVec 32)) SeekEntryResult!7245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726607 (= res!487565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19645 a!3186) j!159) mask!3328) (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!321787))))

(assert (=> b!726607 (= lt!321787 (Intermediate!7245 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726608 () Bool)

(declare-fun e!406805 () Bool)

(assert (=> b!726608 (= e!406807 e!406805)))

(declare-fun res!487573 () Bool)

(assert (=> b!726608 (=> (not res!487573) (not e!406805))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321788 () array!41048)

(declare-fun lt!321786 () (_ BitVec 64))

(assert (=> b!726608 (= res!487573 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321786 mask!3328) lt!321786 lt!321788 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321786 lt!321788 mask!3328)))))

(assert (=> b!726608 (= lt!321786 (select (store (arr!19645 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726608 (= lt!321788 (array!41049 (store (arr!19645 a!3186) i!1173 k0!2102) (size!20066 a!3186)))))

(declare-fun b!726609 () Bool)

(assert (=> b!726609 (= e!406806 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) (Found!7245 j!159)))))

(declare-fun b!726610 () Bool)

(declare-fun res!487575 () Bool)

(assert (=> b!726610 (=> (not res!487575) (not e!406804))))

(assert (=> b!726610 (= res!487575 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20066 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20066 a!3186))))))

(declare-fun b!726611 () Bool)

(declare-fun res!487566 () Bool)

(assert (=> b!726611 (=> (not res!487566) (not e!406801))))

(declare-fun arrayContainsKey!0 (array!41048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726611 (= res!487566 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726612 () Bool)

(assert (=> b!726612 (= e!406806 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19645 a!3186) j!159) a!3186 mask!3328) lt!321787))))

(declare-fun b!726613 () Bool)

(declare-fun res!487572 () Bool)

(assert (=> b!726613 (=> (not res!487572) (not e!406801))))

(assert (=> b!726613 (= res!487572 (validKeyInArray!0 k0!2102))))

(declare-fun b!726614 () Bool)

(assert (=> b!726614 (= e!406805 (not true))))

(assert (=> b!726614 e!406802))

(declare-fun res!487569 () Bool)

(assert (=> b!726614 (=> (not res!487569) (not e!406802))))

(assert (=> b!726614 (= res!487569 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24808 0))(
  ( (Unit!24809) )
))
(declare-fun lt!321790 () Unit!24808)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24808)

(assert (=> b!726614 (= lt!321790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726615 () Bool)

(declare-fun res!487567 () Bool)

(assert (=> b!726615 (=> (not res!487567) (not e!406801))))

(assert (=> b!726615 (= res!487567 (and (= (size!20066 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20066 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20066 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64530 res!487570) b!726615))

(assert (= (and b!726615 res!487567) b!726604))

(assert (= (and b!726604 res!487576) b!726613))

(assert (= (and b!726613 res!487572) b!726611))

(assert (= (and b!726611 res!487566) b!726603))

(assert (= (and b!726603 res!487571) b!726605))

(assert (= (and b!726605 res!487564) b!726606))

(assert (= (and b!726606 res!487568) b!726610))

(assert (= (and b!726610 res!487575) b!726607))

(assert (= (and b!726607 res!487565) b!726602))

(assert (= (and b!726602 res!487577) b!726601))

(assert (= (and b!726601 c!79891) b!726612))

(assert (= (and b!726601 (not c!79891)) b!726609))

(assert (= (and b!726601 res!487563) b!726608))

(assert (= (and b!726608 res!487573) b!726614))

(assert (= (and b!726614 res!487569) b!726600))

(assert (= (and b!726600 res!487574) b!726599))

(declare-fun m!680645 () Bool)

(assert (=> b!726614 m!680645))

(declare-fun m!680647 () Bool)

(assert (=> b!726614 m!680647))

(declare-fun m!680649 () Bool)

(assert (=> b!726605 m!680649))

(declare-fun m!680651 () Bool)

(assert (=> start!64530 m!680651))

(declare-fun m!680653 () Bool)

(assert (=> start!64530 m!680653))

(declare-fun m!680655 () Bool)

(assert (=> b!726607 m!680655))

(assert (=> b!726607 m!680655))

(declare-fun m!680657 () Bool)

(assert (=> b!726607 m!680657))

(assert (=> b!726607 m!680657))

(assert (=> b!726607 m!680655))

(declare-fun m!680659 () Bool)

(assert (=> b!726607 m!680659))

(declare-fun m!680661 () Bool)

(assert (=> b!726606 m!680661))

(declare-fun m!680663 () Bool)

(assert (=> b!726602 m!680663))

(assert (=> b!726600 m!680655))

(assert (=> b!726600 m!680655))

(declare-fun m!680665 () Bool)

(assert (=> b!726600 m!680665))

(declare-fun m!680667 () Bool)

(assert (=> b!726608 m!680667))

(assert (=> b!726608 m!680667))

(declare-fun m!680669 () Bool)

(assert (=> b!726608 m!680669))

(declare-fun m!680671 () Bool)

(assert (=> b!726608 m!680671))

(declare-fun m!680673 () Bool)

(assert (=> b!726608 m!680673))

(declare-fun m!680675 () Bool)

(assert (=> b!726608 m!680675))

(assert (=> b!726609 m!680655))

(assert (=> b!726609 m!680655))

(declare-fun m!680677 () Bool)

(assert (=> b!726609 m!680677))

(declare-fun m!680679 () Bool)

(assert (=> b!726603 m!680679))

(declare-fun m!680681 () Bool)

(assert (=> b!726611 m!680681))

(declare-fun m!680683 () Bool)

(assert (=> b!726613 m!680683))

(assert (=> b!726604 m!680655))

(assert (=> b!726604 m!680655))

(declare-fun m!680685 () Bool)

(assert (=> b!726604 m!680685))

(assert (=> b!726599 m!680655))

(assert (=> b!726599 m!680655))

(declare-fun m!680687 () Bool)

(assert (=> b!726599 m!680687))

(assert (=> b!726612 m!680655))

(assert (=> b!726612 m!680655))

(declare-fun m!680689 () Bool)

(assert (=> b!726612 m!680689))

(check-sat (not b!726608) (not b!726609) (not b!726611) (not b!726607) (not b!726612) (not start!64530) (not b!726614) (not b!726606) (not b!726603) (not b!726600) (not b!726599) (not b!726604) (not b!726605) (not b!726613))
(check-sat)
