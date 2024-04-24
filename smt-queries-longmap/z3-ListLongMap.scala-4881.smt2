; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67384 () Bool)

(assert start!67384)

(declare-fun b!778544 () Bool)

(declare-fun res!526561 () Bool)

(declare-fun e!433227 () Bool)

(assert (=> b!778544 (=> res!526561 e!433227)))

(declare-datatypes ((array!42556 0))(
  ( (array!42557 (arr!20368 (Array (_ BitVec 32) (_ BitVec 64))) (size!20788 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42556)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun lt!346849 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7924 0))(
  ( (MissingZero!7924 (index!34064 (_ BitVec 32))) (Found!7924 (index!34065 (_ BitVec 32))) (Intermediate!7924 (undefined!8736 Bool) (index!34066 (_ BitVec 32)) (x!65167 (_ BitVec 32))) (Undefined!7924) (MissingVacant!7924 (index!34067 (_ BitVec 32))) )
))
(declare-fun lt!346845 () SeekEntryResult!7924)

(assert (=> b!778544 (= res!526561 (or (not (= (select (store (arr!20368 a!3186) i!1173 k0!2102) index!1321) lt!346849)) (undefined!8736 lt!346845)))))

(declare-fun res!526567 () Bool)

(declare-fun e!433232 () Bool)

(assert (=> start!67384 (=> (not res!526567) (not e!433232))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67384 (= res!526567 (validMask!0 mask!3328))))

(assert (=> start!67384 e!433232))

(assert (=> start!67384 true))

(declare-fun array_inv!16227 (array!42556) Bool)

(assert (=> start!67384 (array_inv!16227 a!3186)))

(declare-fun b!778545 () Bool)

(declare-fun res!526571 () Bool)

(declare-fun e!433229 () Bool)

(assert (=> b!778545 (=> (not res!526571) (not e!433229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42556 (_ BitVec 32)) Bool)

(assert (=> b!778545 (= res!526571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778546 () Bool)

(declare-fun e!433226 () Bool)

(declare-fun e!433231 () Bool)

(assert (=> b!778546 (= e!433226 e!433231)))

(declare-fun res!526562 () Bool)

(assert (=> b!778546 (=> (not res!526562) (not e!433231))))

(declare-fun lt!346847 () SeekEntryResult!7924)

(assert (=> b!778546 (= res!526562 (= lt!346847 lt!346845))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!346842 () array!42556)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!778546 (= lt!346845 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346849 lt!346842 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778546 (= lt!346847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346849 mask!3328) lt!346849 lt!346842 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!778546 (= lt!346849 (select (store (arr!20368 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778546 (= lt!346842 (array!42557 (store (arr!20368 a!3186) i!1173 k0!2102) (size!20788 a!3186)))))

(declare-fun b!778547 () Bool)

(declare-fun res!526564 () Bool)

(assert (=> b!778547 (=> (not res!526564) (not e!433229))))

(declare-datatypes ((List!14277 0))(
  ( (Nil!14274) (Cons!14273 (h!15390 (_ BitVec 64)) (t!20584 List!14277)) )
))
(declare-fun arrayNoDuplicates!0 (array!42556 (_ BitVec 32) List!14277) Bool)

(assert (=> b!778547 (= res!526564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14274))))

(declare-fun b!778548 () Bool)

(declare-fun res!526560 () Bool)

(assert (=> b!778548 (=> (not res!526560) (not e!433226))))

(declare-fun e!433234 () Bool)

(assert (=> b!778548 (= res!526560 e!433234)))

(declare-fun c!86399 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778548 (= c!86399 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778549 () Bool)

(declare-fun e!433228 () Bool)

(declare-fun e!433233 () Bool)

(assert (=> b!778549 (= e!433228 e!433233)))

(declare-fun res!526555 () Bool)

(assert (=> b!778549 (=> (not res!526555) (not e!433233))))

(declare-fun lt!346844 () SeekEntryResult!7924)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!778549 (= res!526555 (= (seekEntryOrOpen!0 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346844))))

(assert (=> b!778549 (= lt!346844 (Found!7924 j!159))))

(declare-fun b!778550 () Bool)

(assert (=> b!778550 (= e!433229 e!433226)))

(declare-fun res!526558 () Bool)

(assert (=> b!778550 (=> (not res!526558) (not e!433226))))

(declare-fun lt!346841 () SeekEntryResult!7924)

(assert (=> b!778550 (= res!526558 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20368 a!3186) j!159) mask!3328) (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346841))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!778550 (= lt!346841 (Intermediate!7924 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778551 () Bool)

(declare-fun res!526569 () Bool)

(assert (=> b!778551 (=> (not res!526569) (not e!433232))))

(assert (=> b!778551 (= res!526569 (and (= (size!20788 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20788 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20788 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42556 (_ BitVec 32)) SeekEntryResult!7924)

(assert (=> b!778552 (= e!433233 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346844))))

(declare-fun b!778553 () Bool)

(declare-fun res!526559 () Bool)

(assert (=> b!778553 (=> (not res!526559) (not e!433229))))

(assert (=> b!778553 (= res!526559 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20788 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20788 a!3186))))))

(declare-fun b!778554 () Bool)

(assert (=> b!778554 (= e!433232 e!433229)))

(declare-fun res!526556 () Bool)

(assert (=> b!778554 (=> (not res!526556) (not e!433229))))

(declare-fun lt!346843 () SeekEntryResult!7924)

(assert (=> b!778554 (= res!526556 (or (= lt!346843 (MissingZero!7924 i!1173)) (= lt!346843 (MissingVacant!7924 i!1173))))))

(assert (=> b!778554 (= lt!346843 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778555 () Bool)

(assert (=> b!778555 (= e!433234 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) lt!346841))))

(declare-fun b!778556 () Bool)

(declare-fun res!526572 () Bool)

(assert (=> b!778556 (=> (not res!526572) (not e!433232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778556 (= res!526572 (validKeyInArray!0 k0!2102))))

(declare-fun b!778557 () Bool)

(assert (=> b!778557 (= e!433227 true)))

(declare-fun lt!346848 () SeekEntryResult!7924)

(assert (=> b!778557 (= lt!346848 (seekEntryOrOpen!0 lt!346849 lt!346842 mask!3328))))

(declare-fun b!778558 () Bool)

(assert (=> b!778558 (= e!433234 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) (Found!7924 j!159)))))

(declare-fun b!778559 () Bool)

(declare-fun res!526565 () Bool)

(assert (=> b!778559 (=> (not res!526565) (not e!433232))))

(declare-fun arrayContainsKey!0 (array!42556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778559 (= res!526565 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778560 () Bool)

(declare-fun res!526563 () Bool)

(assert (=> b!778560 (=> res!526563 e!433227)))

(assert (=> b!778560 (= res!526563 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20368 a!3186) j!159) a!3186 mask!3328) (Found!7924 j!159))))))

(declare-fun b!778561 () Bool)

(assert (=> b!778561 (= e!433231 (not e!433227))))

(declare-fun res!526570 () Bool)

(assert (=> b!778561 (=> res!526570 e!433227)))

(get-info :version)

(assert (=> b!778561 (= res!526570 (or (not ((_ is Intermediate!7924) lt!346845)) (bvslt x!1131 (x!65167 lt!346845)) (not (= x!1131 (x!65167 lt!346845))) (not (= index!1321 (index!34066 lt!346845)))))))

(assert (=> b!778561 e!433228))

(declare-fun res!526566 () Bool)

(assert (=> b!778561 (=> (not res!526566) (not e!433228))))

(assert (=> b!778561 (= res!526566 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26821 0))(
  ( (Unit!26822) )
))
(declare-fun lt!346846 () Unit!26821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26821)

(assert (=> b!778561 (= lt!346846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778562 () Bool)

(declare-fun res!526557 () Bool)

(assert (=> b!778562 (=> (not res!526557) (not e!433226))))

(assert (=> b!778562 (= res!526557 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20368 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778563 () Bool)

(declare-fun res!526568 () Bool)

(assert (=> b!778563 (=> (not res!526568) (not e!433232))))

(assert (=> b!778563 (= res!526568 (validKeyInArray!0 (select (arr!20368 a!3186) j!159)))))

(assert (= (and start!67384 res!526567) b!778551))

(assert (= (and b!778551 res!526569) b!778563))

(assert (= (and b!778563 res!526568) b!778556))

(assert (= (and b!778556 res!526572) b!778559))

(assert (= (and b!778559 res!526565) b!778554))

(assert (= (and b!778554 res!526556) b!778545))

(assert (= (and b!778545 res!526571) b!778547))

(assert (= (and b!778547 res!526564) b!778553))

(assert (= (and b!778553 res!526559) b!778550))

(assert (= (and b!778550 res!526558) b!778562))

(assert (= (and b!778562 res!526557) b!778548))

(assert (= (and b!778548 c!86399) b!778555))

(assert (= (and b!778548 (not c!86399)) b!778558))

(assert (= (and b!778548 res!526560) b!778546))

(assert (= (and b!778546 res!526562) b!778561))

(assert (= (and b!778561 res!526566) b!778549))

(assert (= (and b!778549 res!526555) b!778552))

(assert (= (and b!778561 (not res!526570)) b!778560))

(assert (= (and b!778560 (not res!526563)) b!778544))

(assert (= (and b!778544 (not res!526561)) b!778557))

(declare-fun m!722753 () Bool)

(assert (=> b!778560 m!722753))

(assert (=> b!778560 m!722753))

(declare-fun m!722755 () Bool)

(assert (=> b!778560 m!722755))

(declare-fun m!722757 () Bool)

(assert (=> b!778554 m!722757))

(declare-fun m!722759 () Bool)

(assert (=> b!778544 m!722759))

(declare-fun m!722761 () Bool)

(assert (=> b!778544 m!722761))

(assert (=> b!778552 m!722753))

(assert (=> b!778552 m!722753))

(declare-fun m!722763 () Bool)

(assert (=> b!778552 m!722763))

(declare-fun m!722765 () Bool)

(assert (=> b!778547 m!722765))

(declare-fun m!722767 () Bool)

(assert (=> b!778557 m!722767))

(assert (=> b!778555 m!722753))

(assert (=> b!778555 m!722753))

(declare-fun m!722769 () Bool)

(assert (=> b!778555 m!722769))

(declare-fun m!722771 () Bool)

(assert (=> b!778546 m!722771))

(declare-fun m!722773 () Bool)

(assert (=> b!778546 m!722773))

(declare-fun m!722775 () Bool)

(assert (=> b!778546 m!722775))

(assert (=> b!778546 m!722773))

(assert (=> b!778546 m!722759))

(declare-fun m!722777 () Bool)

(assert (=> b!778546 m!722777))

(assert (=> b!778558 m!722753))

(assert (=> b!778558 m!722753))

(assert (=> b!778558 m!722755))

(declare-fun m!722779 () Bool)

(assert (=> b!778562 m!722779))

(declare-fun m!722781 () Bool)

(assert (=> b!778559 m!722781))

(declare-fun m!722783 () Bool)

(assert (=> start!67384 m!722783))

(declare-fun m!722785 () Bool)

(assert (=> start!67384 m!722785))

(declare-fun m!722787 () Bool)

(assert (=> b!778556 m!722787))

(assert (=> b!778549 m!722753))

(assert (=> b!778549 m!722753))

(declare-fun m!722789 () Bool)

(assert (=> b!778549 m!722789))

(assert (=> b!778563 m!722753))

(assert (=> b!778563 m!722753))

(declare-fun m!722791 () Bool)

(assert (=> b!778563 m!722791))

(assert (=> b!778550 m!722753))

(assert (=> b!778550 m!722753))

(declare-fun m!722793 () Bool)

(assert (=> b!778550 m!722793))

(assert (=> b!778550 m!722793))

(assert (=> b!778550 m!722753))

(declare-fun m!722795 () Bool)

(assert (=> b!778550 m!722795))

(declare-fun m!722797 () Bool)

(assert (=> b!778561 m!722797))

(declare-fun m!722799 () Bool)

(assert (=> b!778561 m!722799))

(declare-fun m!722801 () Bool)

(assert (=> b!778545 m!722801))

(check-sat (not b!778555) (not b!778546) (not b!778560) (not b!778545) (not b!778554) (not b!778549) (not b!778557) (not b!778563) (not b!778561) (not b!778558) (not b!778552) (not b!778550) (not b!778559) (not b!778547) (not start!67384) (not b!778556))
(check-sat)
