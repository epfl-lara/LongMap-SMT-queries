; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67460 () Bool)

(assert start!67460)

(declare-fun res!528068 () Bool)

(declare-fun e!434154 () Bool)

(assert (=> start!67460 (=> (not res!528068) (not e!434154))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67460 (= res!528068 (validMask!0 mask!3328))))

(assert (=> start!67460 e!434154))

(assert (=> start!67460 true))

(declare-datatypes ((array!42626 0))(
  ( (array!42627 (arr!20404 (Array (_ BitVec 32) (_ BitVec 64))) (size!20825 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42626)

(declare-fun array_inv!16200 (array!42626) Bool)

(assert (=> start!67460 (array_inv!16200 a!3186)))

(declare-fun b!780463 () Bool)

(declare-datatypes ((Unit!26904 0))(
  ( (Unit!26905) )
))
(declare-fun e!434155 () Unit!26904)

(declare-fun Unit!26906 () Unit!26904)

(assert (=> b!780463 (= e!434155 Unit!26906)))

(declare-fun b!780464 () Bool)

(declare-fun res!528059 () Bool)

(assert (=> b!780464 (=> (not res!528059) (not e!434154))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780464 (= res!528059 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780465 () Bool)

(declare-fun e!434156 () Bool)

(assert (=> b!780465 (= e!434156 true)))

(declare-fun lt!347798 () Unit!26904)

(assert (=> b!780465 (= lt!347798 e!434155)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun c!86610 () Bool)

(assert (=> b!780465 (= c!86610 (= (select (store (arr!20404 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780466 () Bool)

(declare-fun res!528065 () Bool)

(assert (=> b!780466 (=> (not res!528065) (not e!434154))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780466 (= res!528065 (validKeyInArray!0 (select (arr!20404 a!3186) j!159)))))

(declare-fun b!780467 () Bool)

(declare-fun res!528053 () Bool)

(declare-fun e!434153 () Bool)

(assert (=> b!780467 (=> (not res!528053) (not e!434153))))

(declare-fun e!434159 () Bool)

(assert (=> b!780467 (= res!528053 e!434159)))

(declare-fun c!86611 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780467 (= c!86611 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780468 () Bool)

(declare-fun e!434151 () Bool)

(assert (=> b!780468 (= e!434154 e!434151)))

(declare-fun res!528062 () Bool)

(assert (=> b!780468 (=> (not res!528062) (not e!434151))))

(declare-datatypes ((SeekEntryResult!8004 0))(
  ( (MissingZero!8004 (index!34384 (_ BitVec 32))) (Found!8004 (index!34385 (_ BitVec 32))) (Intermediate!8004 (undefined!8816 Bool) (index!34386 (_ BitVec 32)) (x!65334 (_ BitVec 32))) (Undefined!8004) (MissingVacant!8004 (index!34387 (_ BitVec 32))) )
))
(declare-fun lt!347801 () SeekEntryResult!8004)

(assert (=> b!780468 (= res!528062 (or (= lt!347801 (MissingZero!8004 i!1173)) (= lt!347801 (MissingVacant!8004 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42626 (_ BitVec 32)) SeekEntryResult!8004)

(assert (=> b!780468 (= lt!347801 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780469 () Bool)

(declare-fun e!434158 () Bool)

(assert (=> b!780469 (= e!434153 e!434158)))

(declare-fun res!528054 () Bool)

(assert (=> b!780469 (=> (not res!528054) (not e!434158))))

(declare-fun lt!347799 () SeekEntryResult!8004)

(declare-fun lt!347802 () SeekEntryResult!8004)

(assert (=> b!780469 (= res!528054 (= lt!347799 lt!347802))))

(declare-fun lt!347796 () (_ BitVec 64))

(declare-fun lt!347803 () array!42626)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42626 (_ BitVec 32)) SeekEntryResult!8004)

(assert (=> b!780469 (= lt!347802 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347796 lt!347803 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780469 (= lt!347799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347796 mask!3328) lt!347796 lt!347803 mask!3328))))

(assert (=> b!780469 (= lt!347796 (select (store (arr!20404 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780469 (= lt!347803 (array!42627 (store (arr!20404 a!3186) i!1173 k0!2102) (size!20825 a!3186)))))

(declare-fun b!780470 () Bool)

(declare-fun res!528058 () Bool)

(assert (=> b!780470 (=> (not res!528058) (not e!434151))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!780470 (= res!528058 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20825 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20825 a!3186))))))

(declare-fun b!780471 () Bool)

(assert (=> b!780471 (= e!434158 (not e!434156))))

(declare-fun res!528052 () Bool)

(assert (=> b!780471 (=> res!528052 e!434156)))

(get-info :version)

(assert (=> b!780471 (= res!528052 (or (not ((_ is Intermediate!8004) lt!347802)) (bvslt x!1131 (x!65334 lt!347802)) (not (= x!1131 (x!65334 lt!347802))) (not (= index!1321 (index!34386 lt!347802)))))))

(declare-fun e!434152 () Bool)

(assert (=> b!780471 e!434152))

(declare-fun res!528064 () Bool)

(assert (=> b!780471 (=> (not res!528064) (not e!434152))))

(declare-fun lt!347795 () SeekEntryResult!8004)

(declare-fun lt!347804 () SeekEntryResult!8004)

(assert (=> b!780471 (= res!528064 (= lt!347795 lt!347804))))

(assert (=> b!780471 (= lt!347804 (Found!8004 j!159))))

(assert (=> b!780471 (= lt!347795 (seekEntryOrOpen!0 (select (arr!20404 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42626 (_ BitVec 32)) Bool)

(assert (=> b!780471 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347797 () Unit!26904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26904)

(assert (=> b!780471 (= lt!347797 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780472 () Bool)

(declare-fun res!528066 () Bool)

(assert (=> b!780472 (=> (not res!528066) (not e!434151))))

(declare-datatypes ((List!14406 0))(
  ( (Nil!14403) (Cons!14402 (h!15519 (_ BitVec 64)) (t!20721 List!14406)) )
))
(declare-fun arrayNoDuplicates!0 (array!42626 (_ BitVec 32) List!14406) Bool)

(assert (=> b!780472 (= res!528066 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14403))))

(declare-fun b!780473 () Bool)

(declare-fun res!528056 () Bool)

(assert (=> b!780473 (=> (not res!528056) (not e!434151))))

(assert (=> b!780473 (= res!528056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780474 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42626 (_ BitVec 32)) SeekEntryResult!8004)

(assert (=> b!780474 (= e!434152 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!347804))))

(declare-fun b!780475 () Bool)

(assert (=> b!780475 (= e!434159 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) (Found!8004 j!159)))))

(declare-fun b!780476 () Bool)

(assert (=> b!780476 (= e!434151 e!434153)))

(declare-fun res!528055 () Bool)

(assert (=> b!780476 (=> (not res!528055) (not e!434153))))

(declare-fun lt!347800 () SeekEntryResult!8004)

(assert (=> b!780476 (= res!528055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20404 a!3186) j!159) mask!3328) (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!347800))))

(assert (=> b!780476 (= lt!347800 (Intermediate!8004 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780477 () Bool)

(declare-fun res!528063 () Bool)

(assert (=> b!780477 (=> (not res!528063) (not e!434153))))

(assert (=> b!780477 (= res!528063 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20404 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780478 () Bool)

(declare-fun Unit!26907 () Unit!26904)

(assert (=> b!780478 (= e!434155 Unit!26907)))

(assert (=> b!780478 false))

(declare-fun b!780479 () Bool)

(assert (=> b!780479 (= e!434159 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!347800))))

(declare-fun b!780480 () Bool)

(declare-fun res!528060 () Bool)

(assert (=> b!780480 (=> (not res!528060) (not e!434154))))

(assert (=> b!780480 (= res!528060 (validKeyInArray!0 k0!2102))))

(declare-fun b!780481 () Bool)

(declare-fun res!528061 () Bool)

(assert (=> b!780481 (=> res!528061 e!434156)))

(assert (=> b!780481 (= res!528061 (= (select (store (arr!20404 a!3186) i!1173 k0!2102) index!1321) lt!347796))))

(declare-fun b!780482 () Bool)

(declare-fun res!528067 () Bool)

(assert (=> b!780482 (=> (not res!528067) (not e!434154))))

(assert (=> b!780482 (= res!528067 (and (= (size!20825 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20825 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20825 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780483 () Bool)

(declare-fun res!528057 () Bool)

(assert (=> b!780483 (=> res!528057 e!434156)))

(assert (=> b!780483 (= res!528057 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20404 a!3186) j!159) a!3186 mask!3328) lt!347804)))))

(assert (= (and start!67460 res!528068) b!780482))

(assert (= (and b!780482 res!528067) b!780466))

(assert (= (and b!780466 res!528065) b!780480))

(assert (= (and b!780480 res!528060) b!780464))

(assert (= (and b!780464 res!528059) b!780468))

(assert (= (and b!780468 res!528062) b!780473))

(assert (= (and b!780473 res!528056) b!780472))

(assert (= (and b!780472 res!528066) b!780470))

(assert (= (and b!780470 res!528058) b!780476))

(assert (= (and b!780476 res!528055) b!780477))

(assert (= (and b!780477 res!528063) b!780467))

(assert (= (and b!780467 c!86611) b!780479))

(assert (= (and b!780467 (not c!86611)) b!780475))

(assert (= (and b!780467 res!528053) b!780469))

(assert (= (and b!780469 res!528054) b!780471))

(assert (= (and b!780471 res!528064) b!780474))

(assert (= (and b!780471 (not res!528052)) b!780483))

(assert (= (and b!780483 (not res!528057)) b!780481))

(assert (= (and b!780481 (not res!528061)) b!780465))

(assert (= (and b!780465 c!86610) b!780478))

(assert (= (and b!780465 (not c!86610)) b!780463))

(declare-fun m!723761 () Bool)

(assert (=> start!67460 m!723761))

(declare-fun m!723763 () Bool)

(assert (=> start!67460 m!723763))

(declare-fun m!723765 () Bool)

(assert (=> b!780473 m!723765))

(declare-fun m!723767 () Bool)

(assert (=> b!780469 m!723767))

(declare-fun m!723769 () Bool)

(assert (=> b!780469 m!723769))

(declare-fun m!723771 () Bool)

(assert (=> b!780469 m!723771))

(declare-fun m!723773 () Bool)

(assert (=> b!780469 m!723773))

(declare-fun m!723775 () Bool)

(assert (=> b!780469 m!723775))

(assert (=> b!780469 m!723767))

(declare-fun m!723777 () Bool)

(assert (=> b!780472 m!723777))

(declare-fun m!723779 () Bool)

(assert (=> b!780466 m!723779))

(assert (=> b!780466 m!723779))

(declare-fun m!723781 () Bool)

(assert (=> b!780466 m!723781))

(assert (=> b!780476 m!723779))

(assert (=> b!780476 m!723779))

(declare-fun m!723783 () Bool)

(assert (=> b!780476 m!723783))

(assert (=> b!780476 m!723783))

(assert (=> b!780476 m!723779))

(declare-fun m!723785 () Bool)

(assert (=> b!780476 m!723785))

(assert (=> b!780481 m!723773))

(declare-fun m!723787 () Bool)

(assert (=> b!780481 m!723787))

(assert (=> b!780483 m!723779))

(assert (=> b!780483 m!723779))

(declare-fun m!723789 () Bool)

(assert (=> b!780483 m!723789))

(assert (=> b!780474 m!723779))

(assert (=> b!780474 m!723779))

(declare-fun m!723791 () Bool)

(assert (=> b!780474 m!723791))

(declare-fun m!723793 () Bool)

(assert (=> b!780468 m!723793))

(declare-fun m!723795 () Bool)

(assert (=> b!780477 m!723795))

(assert (=> b!780471 m!723779))

(assert (=> b!780471 m!723779))

(declare-fun m!723797 () Bool)

(assert (=> b!780471 m!723797))

(declare-fun m!723799 () Bool)

(assert (=> b!780471 m!723799))

(declare-fun m!723801 () Bool)

(assert (=> b!780471 m!723801))

(assert (=> b!780475 m!723779))

(assert (=> b!780475 m!723779))

(assert (=> b!780475 m!723789))

(declare-fun m!723803 () Bool)

(assert (=> b!780480 m!723803))

(assert (=> b!780479 m!723779))

(assert (=> b!780479 m!723779))

(declare-fun m!723805 () Bool)

(assert (=> b!780479 m!723805))

(assert (=> b!780465 m!723773))

(assert (=> b!780465 m!723787))

(declare-fun m!723807 () Bool)

(assert (=> b!780464 m!723807))

(check-sat (not b!780469) (not b!780473) (not b!780472) (not b!780471) (not b!780474) (not b!780476) (not b!780475) (not b!780466) (not b!780483) (not b!780464) (not b!780480) (not start!67460) (not b!780479) (not b!780468))
(check-sat)
