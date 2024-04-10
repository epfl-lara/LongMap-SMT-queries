; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64532 () Bool)

(assert start!64532)

(declare-datatypes ((array!41050 0))(
  ( (array!41051 (arr!19646 (Array (_ BitVec 32) (_ BitVec 64))) (size!20067 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41050)

(declare-fun b!726650 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7246 0))(
  ( (MissingZero!7246 (index!31352 (_ BitVec 32))) (Found!7246 (index!31353 (_ BitVec 32))) (Intermediate!7246 (undefined!8058 Bool) (index!31354 (_ BitVec 32)) (x!62336 (_ BitVec 32))) (Undefined!7246) (MissingVacant!7246 (index!31355 (_ BitVec 32))) )
))
(declare-fun lt!321806 () SeekEntryResult!7246)

(declare-fun e!406825 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726650 (= e!406825 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321806))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!321809 () SeekEntryResult!7246)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!406829 () Bool)

(declare-fun b!726651 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726651 (= e!406829 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321809))))

(declare-fun b!726652 () Bool)

(declare-fun e!406827 () Bool)

(declare-fun e!406828 () Bool)

(assert (=> b!726652 (= e!406827 e!406828)))

(declare-fun res!487616 () Bool)

(assert (=> b!726652 (=> (not res!487616) (not e!406828))))

(declare-fun lt!321804 () (_ BitVec 64))

(declare-fun lt!321807 () array!41050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726652 (= res!487616 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321804 mask!3328) lt!321804 lt!321807 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321804 lt!321807 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!726652 (= lt!321804 (select (store (arr!19646 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726652 (= lt!321807 (array!41051 (store (arr!19646 a!3186) i!1173 k!2102) (size!20067 a!3186)))))

(declare-fun b!726653 () Bool)

(assert (=> b!726653 (= e!406825 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) (Found!7246 j!159)))))

(declare-fun b!726654 () Bool)

(declare-fun res!487621 () Bool)

(declare-fun e!406831 () Bool)

(assert (=> b!726654 (=> (not res!487621) (not e!406831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726654 (= res!487621 (validKeyInArray!0 (select (arr!19646 a!3186) j!159)))))

(declare-fun b!726655 () Bool)

(declare-fun res!487612 () Bool)

(assert (=> b!726655 (=> (not res!487612) (not e!406827))))

(assert (=> b!726655 (= res!487612 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19646 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726656 () Bool)

(declare-fun res!487622 () Bool)

(assert (=> b!726656 (=> (not res!487622) (not e!406831))))

(assert (=> b!726656 (= res!487622 (validKeyInArray!0 k!2102))))

(declare-fun b!726657 () Bool)

(declare-fun res!487611 () Bool)

(assert (=> b!726657 (=> (not res!487611) (not e!406831))))

(declare-fun arrayContainsKey!0 (array!41050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726657 (= res!487611 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726658 () Bool)

(declare-fun res!487614 () Bool)

(declare-fun e!406830 () Bool)

(assert (=> b!726658 (=> (not res!487614) (not e!406830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41050 (_ BitVec 32)) Bool)

(assert (=> b!726658 (= res!487614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726659 () Bool)

(assert (=> b!726659 (= e!406828 (not true))))

(declare-fun e!406832 () Bool)

(assert (=> b!726659 e!406832))

(declare-fun res!487608 () Bool)

(assert (=> b!726659 (=> (not res!487608) (not e!406832))))

(assert (=> b!726659 (= res!487608 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24810 0))(
  ( (Unit!24811) )
))
(declare-fun lt!321805 () Unit!24810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24810)

(assert (=> b!726659 (= lt!321805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726660 () Bool)

(assert (=> b!726660 (= e!406830 e!406827)))

(declare-fun res!487618 () Bool)

(assert (=> b!726660 (=> (not res!487618) (not e!406827))))

(assert (=> b!726660 (= res!487618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19646 a!3186) j!159) mask!3328) (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321806))))

(assert (=> b!726660 (= lt!321806 (Intermediate!7246 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726661 () Bool)

(assert (=> b!726661 (= e!406832 e!406829)))

(declare-fun res!487619 () Bool)

(assert (=> b!726661 (=> (not res!487619) (not e!406829))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41050 (_ BitVec 32)) SeekEntryResult!7246)

(assert (=> b!726661 (= res!487619 (= (seekEntryOrOpen!0 (select (arr!19646 a!3186) j!159) a!3186 mask!3328) lt!321809))))

(assert (=> b!726661 (= lt!321809 (Found!7246 j!159))))

(declare-fun b!726662 () Bool)

(declare-fun res!487610 () Bool)

(assert (=> b!726662 (=> (not res!487610) (not e!406827))))

(assert (=> b!726662 (= res!487610 e!406825)))

(declare-fun c!79894 () Bool)

(assert (=> b!726662 (= c!79894 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726663 () Bool)

(declare-fun res!487617 () Bool)

(assert (=> b!726663 (=> (not res!487617) (not e!406830))))

(declare-datatypes ((List!13648 0))(
  ( (Nil!13645) (Cons!13644 (h!14701 (_ BitVec 64)) (t!19963 List!13648)) )
))
(declare-fun arrayNoDuplicates!0 (array!41050 (_ BitVec 32) List!13648) Bool)

(assert (=> b!726663 (= res!487617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13645))))

(declare-fun b!726664 () Bool)

(declare-fun res!487615 () Bool)

(assert (=> b!726664 (=> (not res!487615) (not e!406830))))

(assert (=> b!726664 (= res!487615 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20067 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20067 a!3186))))))

(declare-fun res!487620 () Bool)

(assert (=> start!64532 (=> (not res!487620) (not e!406831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64532 (= res!487620 (validMask!0 mask!3328))))

(assert (=> start!64532 e!406831))

(assert (=> start!64532 true))

(declare-fun array_inv!15442 (array!41050) Bool)

(assert (=> start!64532 (array_inv!15442 a!3186)))

(declare-fun b!726665 () Bool)

(declare-fun res!487609 () Bool)

(assert (=> b!726665 (=> (not res!487609) (not e!406831))))

(assert (=> b!726665 (= res!487609 (and (= (size!20067 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20067 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20067 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726666 () Bool)

(assert (=> b!726666 (= e!406831 e!406830)))

(declare-fun res!487613 () Bool)

(assert (=> b!726666 (=> (not res!487613) (not e!406830))))

(declare-fun lt!321808 () SeekEntryResult!7246)

(assert (=> b!726666 (= res!487613 (or (= lt!321808 (MissingZero!7246 i!1173)) (= lt!321808 (MissingVacant!7246 i!1173))))))

(assert (=> b!726666 (= lt!321808 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64532 res!487620) b!726665))

(assert (= (and b!726665 res!487609) b!726654))

(assert (= (and b!726654 res!487621) b!726656))

(assert (= (and b!726656 res!487622) b!726657))

(assert (= (and b!726657 res!487611) b!726666))

(assert (= (and b!726666 res!487613) b!726658))

(assert (= (and b!726658 res!487614) b!726663))

(assert (= (and b!726663 res!487617) b!726664))

(assert (= (and b!726664 res!487615) b!726660))

(assert (= (and b!726660 res!487618) b!726655))

(assert (= (and b!726655 res!487612) b!726662))

(assert (= (and b!726662 c!79894) b!726650))

(assert (= (and b!726662 (not c!79894)) b!726653))

(assert (= (and b!726662 res!487610) b!726652))

(assert (= (and b!726652 res!487616) b!726659))

(assert (= (and b!726659 res!487608) b!726661))

(assert (= (and b!726661 res!487619) b!726651))

(declare-fun m!680691 () Bool)

(assert (=> b!726660 m!680691))

(assert (=> b!726660 m!680691))

(declare-fun m!680693 () Bool)

(assert (=> b!726660 m!680693))

(assert (=> b!726660 m!680693))

(assert (=> b!726660 m!680691))

(declare-fun m!680695 () Bool)

(assert (=> b!726660 m!680695))

(declare-fun m!680697 () Bool)

(assert (=> b!726656 m!680697))

(declare-fun m!680699 () Bool)

(assert (=> b!726657 m!680699))

(assert (=> b!726661 m!680691))

(assert (=> b!726661 m!680691))

(declare-fun m!680701 () Bool)

(assert (=> b!726661 m!680701))

(assert (=> b!726651 m!680691))

(assert (=> b!726651 m!680691))

(declare-fun m!680703 () Bool)

(assert (=> b!726651 m!680703))

(assert (=> b!726654 m!680691))

(assert (=> b!726654 m!680691))

(declare-fun m!680705 () Bool)

(assert (=> b!726654 m!680705))

(assert (=> b!726653 m!680691))

(assert (=> b!726653 m!680691))

(declare-fun m!680707 () Bool)

(assert (=> b!726653 m!680707))

(declare-fun m!680709 () Bool)

(assert (=> b!726666 m!680709))

(declare-fun m!680711 () Bool)

(assert (=> b!726663 m!680711))

(declare-fun m!680713 () Bool)

(assert (=> b!726659 m!680713))

(declare-fun m!680715 () Bool)

(assert (=> b!726659 m!680715))

(declare-fun m!680717 () Bool)

(assert (=> b!726655 m!680717))

(declare-fun m!680719 () Bool)

(assert (=> b!726658 m!680719))

(declare-fun m!680721 () Bool)

(assert (=> b!726652 m!680721))

(declare-fun m!680723 () Bool)

(assert (=> b!726652 m!680723))

(declare-fun m!680725 () Bool)

(assert (=> b!726652 m!680725))

(declare-fun m!680727 () Bool)

(assert (=> b!726652 m!680727))

(assert (=> b!726652 m!680727))

(declare-fun m!680729 () Bool)

(assert (=> b!726652 m!680729))

(assert (=> b!726650 m!680691))

(assert (=> b!726650 m!680691))

(declare-fun m!680731 () Bool)

(assert (=> b!726650 m!680731))

(declare-fun m!680733 () Bool)

(assert (=> start!64532 m!680733))

(declare-fun m!680735 () Bool)

(assert (=> start!64532 m!680735))

(push 1)

