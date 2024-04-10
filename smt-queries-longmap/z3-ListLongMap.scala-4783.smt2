; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65760 () Bool)

(assert start!65760)

(declare-fun b!755633 () Bool)

(declare-fun res!510781 () Bool)

(declare-fun e!421374 () Bool)

(assert (=> b!755633 (=> (not res!510781) (not e!421374))))

(declare-datatypes ((array!41933 0))(
  ( (array!41934 (arr!20080 (Array (_ BitVec 32) (_ BitVec 64))) (size!20501 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41933)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!755633 (= res!510781 (validKeyInArray!0 (select (arr!20080 a!3186) j!159)))))

(declare-fun b!755634 () Bool)

(declare-fun e!421376 () Bool)

(declare-fun e!421377 () Bool)

(assert (=> b!755634 (= e!421376 e!421377)))

(declare-fun res!510782 () Bool)

(assert (=> b!755634 (=> (not res!510782) (not e!421377))))

(declare-datatypes ((SeekEntryResult!7680 0))(
  ( (MissingZero!7680 (index!33088 (_ BitVec 32))) (Found!7680 (index!33089 (_ BitVec 32))) (Intermediate!7680 (undefined!8492 Bool) (index!33090 (_ BitVec 32)) (x!63990 (_ BitVec 32))) (Undefined!7680) (MissingVacant!7680 (index!33091 (_ BitVec 32))) )
))
(declare-fun lt!336377 () SeekEntryResult!7680)

(declare-fun lt!336366 () SeekEntryResult!7680)

(assert (=> b!755634 (= res!510782 (= lt!336377 lt!336366))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!336374 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!336372 () array!41933)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41933 (_ BitVec 32)) SeekEntryResult!7680)

(assert (=> b!755634 (= lt!336366 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336374 lt!336372 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!755634 (= lt!336377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336374 mask!3328) lt!336374 lt!336372 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!755634 (= lt!336374 (select (store (arr!20080 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!755634 (= lt!336372 (array!41934 (store (arr!20080 a!3186) i!1173 k0!2102) (size!20501 a!3186)))))

(declare-fun b!755635 () Bool)

(declare-fun e!421378 () Bool)

(assert (=> b!755635 (= e!421377 (not e!421378))))

(declare-fun res!510785 () Bool)

(assert (=> b!755635 (=> res!510785 e!421378)))

(get-info :version)

(assert (=> b!755635 (= res!510785 (or (not ((_ is Intermediate!7680) lt!336366)) (bvslt x!1131 (x!63990 lt!336366)) (not (= x!1131 (x!63990 lt!336366))) (not (= index!1321 (index!33090 lt!336366)))))))

(declare-fun e!421380 () Bool)

(assert (=> b!755635 e!421380))

(declare-fun res!510786 () Bool)

(assert (=> b!755635 (=> (not res!510786) (not e!421380))))

(declare-fun lt!336370 () SeekEntryResult!7680)

(declare-fun lt!336368 () SeekEntryResult!7680)

(assert (=> b!755635 (= res!510786 (= lt!336370 lt!336368))))

(assert (=> b!755635 (= lt!336368 (Found!7680 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41933 (_ BitVec 32)) SeekEntryResult!7680)

(assert (=> b!755635 (= lt!336370 (seekEntryOrOpen!0 (select (arr!20080 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41933 (_ BitVec 32)) Bool)

(assert (=> b!755635 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26100 0))(
  ( (Unit!26101) )
))
(declare-fun lt!336371 () Unit!26100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26100)

(assert (=> b!755635 (= lt!336371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!755636 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41933 (_ BitVec 32)) SeekEntryResult!7680)

(assert (=> b!755636 (= e!421380 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336368))))

(declare-fun b!755637 () Bool)

(declare-fun res!510794 () Bool)

(assert (=> b!755637 (=> (not res!510794) (not e!421374))))

(assert (=> b!755637 (= res!510794 (and (= (size!20501 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20501 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20501 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!755638 () Bool)

(declare-fun e!421382 () Bool)

(assert (=> b!755638 (= e!421382 true)))

(declare-fun e!421383 () Bool)

(assert (=> b!755638 e!421383))

(declare-fun res!510791 () Bool)

(assert (=> b!755638 (=> (not res!510791) (not e!421383))))

(declare-fun lt!336376 () (_ BitVec 64))

(assert (=> b!755638 (= res!510791 (= lt!336376 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336367 () Unit!26100)

(declare-fun e!421375 () Unit!26100)

(assert (=> b!755638 (= lt!336367 e!421375)))

(declare-fun c!82809 () Bool)

(assert (=> b!755638 (= c!82809 (= lt!336376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!755639 () Bool)

(declare-fun e!421379 () Bool)

(assert (=> b!755639 (= e!421379 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) (Found!7680 j!159)))))

(declare-fun b!755640 () Bool)

(declare-fun res!510779 () Bool)

(assert (=> b!755640 (=> (not res!510779) (not e!421374))))

(assert (=> b!755640 (= res!510779 (validKeyInArray!0 k0!2102))))

(declare-fun b!755641 () Bool)

(declare-fun res!510793 () Bool)

(assert (=> b!755641 (=> (not res!510793) (not e!421376))))

(assert (=> b!755641 (= res!510793 e!421379)))

(declare-fun c!82810 () Bool)

(assert (=> b!755641 (= c!82810 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!755642 () Bool)

(declare-fun Unit!26102 () Unit!26100)

(assert (=> b!755642 (= e!421375 Unit!26102)))

(assert (=> b!755642 false))

(declare-fun b!755643 () Bool)

(declare-fun res!510784 () Bool)

(declare-fun e!421381 () Bool)

(assert (=> b!755643 (=> (not res!510784) (not e!421381))))

(assert (=> b!755643 (= res!510784 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20501 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20501 a!3186))))))

(declare-fun b!755644 () Bool)

(declare-fun res!510783 () Bool)

(assert (=> b!755644 (=> (not res!510783) (not e!421374))))

(declare-fun arrayContainsKey!0 (array!41933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!755644 (= res!510783 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!336369 () SeekEntryResult!7680)

(declare-fun b!755645 () Bool)

(assert (=> b!755645 (= e!421379 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336369))))

(declare-fun b!755646 () Bool)

(declare-fun e!421385 () Bool)

(assert (=> b!755646 (= e!421385 e!421382)))

(declare-fun res!510788 () Bool)

(assert (=> b!755646 (=> res!510788 e!421382)))

(assert (=> b!755646 (= res!510788 (= lt!336376 lt!336374))))

(assert (=> b!755646 (= lt!336376 (select (store (arr!20080 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!510780 () Bool)

(assert (=> start!65760 (=> (not res!510780) (not e!421374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65760 (= res!510780 (validMask!0 mask!3328))))

(assert (=> start!65760 e!421374))

(assert (=> start!65760 true))

(declare-fun array_inv!15876 (array!41933) Bool)

(assert (=> start!65760 (array_inv!15876 a!3186)))

(declare-fun b!755647 () Bool)

(assert (=> b!755647 (= e!421378 e!421385)))

(declare-fun res!510778 () Bool)

(assert (=> b!755647 (=> res!510778 e!421385)))

(declare-fun lt!336373 () SeekEntryResult!7680)

(assert (=> b!755647 (= res!510778 (not (= lt!336373 lt!336368)))))

(assert (=> b!755647 (= lt!336373 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20080 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!755648 () Bool)

(assert (=> b!755648 (= e!421374 e!421381)))

(declare-fun res!510790 () Bool)

(assert (=> b!755648 (=> (not res!510790) (not e!421381))))

(declare-fun lt!336375 () SeekEntryResult!7680)

(assert (=> b!755648 (= res!510790 (or (= lt!336375 (MissingZero!7680 i!1173)) (= lt!336375 (MissingVacant!7680 i!1173))))))

(assert (=> b!755648 (= lt!336375 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!755649 () Bool)

(declare-fun res!510792 () Bool)

(assert (=> b!755649 (=> (not res!510792) (not e!421376))))

(assert (=> b!755649 (= res!510792 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20080 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!755650 () Bool)

(assert (=> b!755650 (= e!421381 e!421376)))

(declare-fun res!510777 () Bool)

(assert (=> b!755650 (=> (not res!510777) (not e!421376))))

(assert (=> b!755650 (= res!510777 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20080 a!3186) j!159) mask!3328) (select (arr!20080 a!3186) j!159) a!3186 mask!3328) lt!336369))))

(assert (=> b!755650 (= lt!336369 (Intermediate!7680 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!755651 () Bool)

(declare-fun res!510789 () Bool)

(assert (=> b!755651 (=> (not res!510789) (not e!421383))))

(assert (=> b!755651 (= res!510789 (= (seekEntryOrOpen!0 lt!336374 lt!336372 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336374 lt!336372 mask!3328)))))

(declare-fun b!755652 () Bool)

(declare-fun res!510776 () Bool)

(assert (=> b!755652 (=> (not res!510776) (not e!421381))))

(assert (=> b!755652 (= res!510776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!755653 () Bool)

(declare-fun res!510787 () Bool)

(assert (=> b!755653 (=> (not res!510787) (not e!421381))))

(declare-datatypes ((List!14082 0))(
  ( (Nil!14079) (Cons!14078 (h!15150 (_ BitVec 64)) (t!20397 List!14082)) )
))
(declare-fun arrayNoDuplicates!0 (array!41933 (_ BitVec 32) List!14082) Bool)

(assert (=> b!755653 (= res!510787 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14079))))

(declare-fun b!755654 () Bool)

(assert (=> b!755654 (= e!421383 (= lt!336370 lt!336373))))

(declare-fun b!755655 () Bool)

(declare-fun Unit!26103 () Unit!26100)

(assert (=> b!755655 (= e!421375 Unit!26103)))

(assert (= (and start!65760 res!510780) b!755637))

(assert (= (and b!755637 res!510794) b!755633))

(assert (= (and b!755633 res!510781) b!755640))

(assert (= (and b!755640 res!510779) b!755644))

(assert (= (and b!755644 res!510783) b!755648))

(assert (= (and b!755648 res!510790) b!755652))

(assert (= (and b!755652 res!510776) b!755653))

(assert (= (and b!755653 res!510787) b!755643))

(assert (= (and b!755643 res!510784) b!755650))

(assert (= (and b!755650 res!510777) b!755649))

(assert (= (and b!755649 res!510792) b!755641))

(assert (= (and b!755641 c!82810) b!755645))

(assert (= (and b!755641 (not c!82810)) b!755639))

(assert (= (and b!755641 res!510793) b!755634))

(assert (= (and b!755634 res!510782) b!755635))

(assert (= (and b!755635 res!510786) b!755636))

(assert (= (and b!755635 (not res!510785)) b!755647))

(assert (= (and b!755647 (not res!510778)) b!755646))

(assert (= (and b!755646 (not res!510788)) b!755638))

(assert (= (and b!755638 c!82809) b!755642))

(assert (= (and b!755638 (not c!82809)) b!755655))

(assert (= (and b!755638 res!510791) b!755651))

(assert (= (and b!755651 res!510789) b!755654))

(declare-fun m!703787 () Bool)

(assert (=> b!755636 m!703787))

(assert (=> b!755636 m!703787))

(declare-fun m!703789 () Bool)

(assert (=> b!755636 m!703789))

(declare-fun m!703791 () Bool)

(assert (=> b!755649 m!703791))

(assert (=> b!755647 m!703787))

(assert (=> b!755647 m!703787))

(declare-fun m!703793 () Bool)

(assert (=> b!755647 m!703793))

(declare-fun m!703795 () Bool)

(assert (=> start!65760 m!703795))

(declare-fun m!703797 () Bool)

(assert (=> start!65760 m!703797))

(declare-fun m!703799 () Bool)

(assert (=> b!755653 m!703799))

(declare-fun m!703801 () Bool)

(assert (=> b!755634 m!703801))

(declare-fun m!703803 () Bool)

(assert (=> b!755634 m!703803))

(declare-fun m!703805 () Bool)

(assert (=> b!755634 m!703805))

(declare-fun m!703807 () Bool)

(assert (=> b!755634 m!703807))

(assert (=> b!755634 m!703803))

(declare-fun m!703809 () Bool)

(assert (=> b!755634 m!703809))

(declare-fun m!703811 () Bool)

(assert (=> b!755644 m!703811))

(declare-fun m!703813 () Bool)

(assert (=> b!755651 m!703813))

(declare-fun m!703815 () Bool)

(assert (=> b!755651 m!703815))

(assert (=> b!755633 m!703787))

(assert (=> b!755633 m!703787))

(declare-fun m!703817 () Bool)

(assert (=> b!755633 m!703817))

(declare-fun m!703819 () Bool)

(assert (=> b!755652 m!703819))

(assert (=> b!755639 m!703787))

(assert (=> b!755639 m!703787))

(assert (=> b!755639 m!703793))

(declare-fun m!703821 () Bool)

(assert (=> b!755640 m!703821))

(assert (=> b!755650 m!703787))

(assert (=> b!755650 m!703787))

(declare-fun m!703823 () Bool)

(assert (=> b!755650 m!703823))

(assert (=> b!755650 m!703823))

(assert (=> b!755650 m!703787))

(declare-fun m!703825 () Bool)

(assert (=> b!755650 m!703825))

(assert (=> b!755645 m!703787))

(assert (=> b!755645 m!703787))

(declare-fun m!703827 () Bool)

(assert (=> b!755645 m!703827))

(assert (=> b!755646 m!703807))

(declare-fun m!703829 () Bool)

(assert (=> b!755646 m!703829))

(assert (=> b!755635 m!703787))

(assert (=> b!755635 m!703787))

(declare-fun m!703831 () Bool)

(assert (=> b!755635 m!703831))

(declare-fun m!703833 () Bool)

(assert (=> b!755635 m!703833))

(declare-fun m!703835 () Bool)

(assert (=> b!755635 m!703835))

(declare-fun m!703837 () Bool)

(assert (=> b!755648 m!703837))

(check-sat (not b!755636) (not b!755652) (not b!755648) (not start!65760) (not b!755644) (not b!755633) (not b!755640) (not b!755650) (not b!755645) (not b!755647) (not b!755634) (not b!755653) (not b!755635) (not b!755639) (not b!755651))
(check-sat)
