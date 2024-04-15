; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65126 () Bool)

(assert start!65126)

(declare-fun b!735786 () Bool)

(declare-fun res!494527 () Bool)

(declare-fun e!411619 () Bool)

(assert (=> b!735786 (=> (not res!494527) (not e!411619))))

(declare-datatypes ((array!41316 0))(
  ( (array!41317 (arr!19772 (Array (_ BitVec 32) (_ BitVec 64))) (size!20193 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41316)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41316 (_ BitVec 32)) Bool)

(assert (=> b!735786 (= res!494527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735787 () Bool)

(declare-fun res!494525 () Bool)

(assert (=> b!735787 (=> (not res!494525) (not e!411619))))

(declare-datatypes ((List!13813 0))(
  ( (Nil!13810) (Cons!13809 (h!14881 (_ BitVec 64)) (t!20119 List!13813)) )
))
(declare-fun arrayNoDuplicates!0 (array!41316 (_ BitVec 32) List!13813) Bool)

(assert (=> b!735787 (= res!494525 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13810))))

(declare-fun b!735788 () Bool)

(declare-fun res!494524 () Bool)

(declare-fun e!411626 () Bool)

(assert (=> b!735788 (=> (not res!494524) (not e!411626))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735788 (= res!494524 (validKeyInArray!0 k0!2102))))

(declare-fun b!735789 () Bool)

(declare-fun res!494532 () Bool)

(assert (=> b!735789 (=> (not res!494532) (not e!411626))))

(declare-fun arrayContainsKey!0 (array!41316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735789 (= res!494532 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!411624 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!735790 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7369 0))(
  ( (MissingZero!7369 (index!31844 (_ BitVec 32))) (Found!7369 (index!31845 (_ BitVec 32))) (Intermediate!7369 (undefined!8181 Bool) (index!31846 (_ BitVec 32)) (x!62858 (_ BitVec 32))) (Undefined!7369) (MissingVacant!7369 (index!31847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41316 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!735790 (= e!411624 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) (Found!7369 j!159)))))

(declare-fun b!735791 () Bool)

(assert (=> b!735791 (= e!411626 e!411619)))

(declare-fun res!494520 () Bool)

(assert (=> b!735791 (=> (not res!494520) (not e!411619))))

(declare-fun lt!326125 () SeekEntryResult!7369)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735791 (= res!494520 (or (= lt!326125 (MissingZero!7369 i!1173)) (= lt!326125 (MissingVacant!7369 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41316 (_ BitVec 32)) SeekEntryResult!7369)

(assert (=> b!735791 (= lt!326125 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735792 () Bool)

(declare-fun res!494529 () Bool)

(declare-fun e!411622 () Bool)

(assert (=> b!735792 (=> (not res!494529) (not e!411622))))

(assert (=> b!735792 (= res!494529 e!411624)))

(declare-fun c!81018 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735792 (= c!81018 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!494526 () Bool)

(assert (=> start!65126 (=> (not res!494526) (not e!411626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65126 (= res!494526 (validMask!0 mask!3328))))

(assert (=> start!65126 e!411626))

(assert (=> start!65126 true))

(declare-fun array_inv!15655 (array!41316) Bool)

(assert (=> start!65126 (array_inv!15655 a!3186)))

(declare-fun b!735793 () Bool)

(assert (=> b!735793 (= e!411619 e!411622)))

(declare-fun res!494516 () Bool)

(assert (=> b!735793 (=> (not res!494516) (not e!411622))))

(declare-fun lt!326131 () SeekEntryResult!7369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41316 (_ BitVec 32)) SeekEntryResult!7369)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735793 (= res!494516 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19772 a!3186) j!159) mask!3328) (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326131))))

(assert (=> b!735793 (= lt!326131 (Intermediate!7369 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!411617 () Bool)

(declare-fun lt!326130 () SeekEntryResult!7369)

(declare-fun b!735794 () Bool)

(declare-fun lt!326129 () (_ BitVec 32))

(assert (=> b!735794 (= e!411617 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326129 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326130)))))

(declare-fun b!735795 () Bool)

(declare-fun e!411625 () Bool)

(declare-fun e!411628 () Bool)

(assert (=> b!735795 (= e!411625 e!411628)))

(declare-fun res!494519 () Bool)

(assert (=> b!735795 (=> (not res!494519) (not e!411628))))

(declare-fun lt!326123 () SeekEntryResult!7369)

(assert (=> b!735795 (= res!494519 (= (seekEntryOrOpen!0 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326123))))

(assert (=> b!735795 (= lt!326123 (Found!7369 j!159))))

(declare-fun b!735796 () Bool)

(declare-fun res!494531 () Bool)

(assert (=> b!735796 (=> (not res!494531) (not e!411622))))

(assert (=> b!735796 (= res!494531 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19772 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735797 () Bool)

(declare-fun e!411620 () Bool)

(declare-fun e!411627 () Bool)

(assert (=> b!735797 (= e!411620 e!411627)))

(declare-fun res!494515 () Bool)

(assert (=> b!735797 (=> res!494515 e!411627)))

(assert (=> b!735797 (= res!494515 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326129 #b00000000000000000000000000000000) (bvsge lt!326129 (size!20193 a!3186))))))

(declare-datatypes ((Unit!25052 0))(
  ( (Unit!25053) )
))
(declare-fun lt!326135 () Unit!25052)

(declare-fun e!411621 () Unit!25052)

(assert (=> b!735797 (= lt!326135 e!411621)))

(declare-fun c!81017 () Bool)

(declare-fun lt!326126 () Bool)

(assert (=> b!735797 (= c!81017 lt!326126)))

(assert (=> b!735797 (= lt!326126 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735797 (= lt!326129 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735798 () Bool)

(declare-fun res!494521 () Bool)

(assert (=> b!735798 (=> (not res!494521) (not e!411626))))

(assert (=> b!735798 (= res!494521 (and (= (size!20193 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20193 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20193 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735799 () Bool)

(assert (=> b!735799 (= e!411627 true)))

(declare-fun lt!326122 () (_ BitVec 64))

(declare-fun lt!326132 () array!41316)

(declare-fun lt!326133 () SeekEntryResult!7369)

(assert (=> b!735799 (= lt!326133 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326129 lt!326122 lt!326132 mask!3328))))

(declare-fun b!735800 () Bool)

(declare-fun res!494522 () Bool)

(assert (=> b!735800 (=> (not res!494522) (not e!411626))))

(assert (=> b!735800 (= res!494522 (validKeyInArray!0 (select (arr!19772 a!3186) j!159)))))

(declare-fun b!735801 () Bool)

(declare-fun Unit!25054 () Unit!25052)

(assert (=> b!735801 (= e!411621 Unit!25054)))

(assert (=> b!735801 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326129 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326131)))

(declare-fun b!735802 () Bool)

(declare-fun res!494530 () Bool)

(assert (=> b!735802 (=> res!494530 e!411627)))

(assert (=> b!735802 (= res!494530 e!411617)))

(declare-fun c!81016 () Bool)

(assert (=> b!735802 (= c!81016 lt!326126)))

(declare-fun b!735803 () Bool)

(declare-fun e!411623 () Bool)

(assert (=> b!735803 (= e!411623 (not e!411620))))

(declare-fun res!494523 () Bool)

(assert (=> b!735803 (=> res!494523 e!411620)))

(declare-fun lt!326127 () SeekEntryResult!7369)

(get-info :version)

(assert (=> b!735803 (= res!494523 (or (not ((_ is Intermediate!7369) lt!326127)) (bvsge x!1131 (x!62858 lt!326127))))))

(assert (=> b!735803 (= lt!326130 (Found!7369 j!159))))

(assert (=> b!735803 e!411625))

(declare-fun res!494528 () Bool)

(assert (=> b!735803 (=> (not res!494528) (not e!411625))))

(assert (=> b!735803 (= res!494528 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326124 () Unit!25052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25052)

(assert (=> b!735803 (= lt!326124 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735804 () Bool)

(assert (=> b!735804 (= e!411617 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326129 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326131)))))

(declare-fun b!735805 () Bool)

(declare-fun Unit!25055 () Unit!25052)

(assert (=> b!735805 (= e!411621 Unit!25055)))

(declare-fun lt!326134 () SeekEntryResult!7369)

(assert (=> b!735805 (= lt!326134 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735805 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326129 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326130)))

(declare-fun b!735806 () Bool)

(assert (=> b!735806 (= e!411624 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326131))))

(declare-fun b!735807 () Bool)

(assert (=> b!735807 (= e!411628 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19772 a!3186) j!159) a!3186 mask!3328) lt!326123))))

(declare-fun b!735808 () Bool)

(assert (=> b!735808 (= e!411622 e!411623)))

(declare-fun res!494517 () Bool)

(assert (=> b!735808 (=> (not res!494517) (not e!411623))))

(declare-fun lt!326128 () SeekEntryResult!7369)

(assert (=> b!735808 (= res!494517 (= lt!326128 lt!326127))))

(assert (=> b!735808 (= lt!326127 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326122 lt!326132 mask!3328))))

(assert (=> b!735808 (= lt!326128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326122 mask!3328) lt!326122 lt!326132 mask!3328))))

(assert (=> b!735808 (= lt!326122 (select (store (arr!19772 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735808 (= lt!326132 (array!41317 (store (arr!19772 a!3186) i!1173 k0!2102) (size!20193 a!3186)))))

(declare-fun b!735809 () Bool)

(declare-fun res!494518 () Bool)

(assert (=> b!735809 (=> (not res!494518) (not e!411619))))

(assert (=> b!735809 (= res!494518 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20193 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20193 a!3186))))))

(assert (= (and start!65126 res!494526) b!735798))

(assert (= (and b!735798 res!494521) b!735800))

(assert (= (and b!735800 res!494522) b!735788))

(assert (= (and b!735788 res!494524) b!735789))

(assert (= (and b!735789 res!494532) b!735791))

(assert (= (and b!735791 res!494520) b!735786))

(assert (= (and b!735786 res!494527) b!735787))

(assert (= (and b!735787 res!494525) b!735809))

(assert (= (and b!735809 res!494518) b!735793))

(assert (= (and b!735793 res!494516) b!735796))

(assert (= (and b!735796 res!494531) b!735792))

(assert (= (and b!735792 c!81018) b!735806))

(assert (= (and b!735792 (not c!81018)) b!735790))

(assert (= (and b!735792 res!494529) b!735808))

(assert (= (and b!735808 res!494517) b!735803))

(assert (= (and b!735803 res!494528) b!735795))

(assert (= (and b!735795 res!494519) b!735807))

(assert (= (and b!735803 (not res!494523)) b!735797))

(assert (= (and b!735797 c!81017) b!735801))

(assert (= (and b!735797 (not c!81017)) b!735805))

(assert (= (and b!735797 (not res!494515)) b!735802))

(assert (= (and b!735802 c!81016) b!735804))

(assert (= (and b!735802 (not c!81016)) b!735794))

(assert (= (and b!735802 (not res!494530)) b!735799))

(declare-fun m!687509 () Bool)

(assert (=> b!735806 m!687509))

(assert (=> b!735806 m!687509))

(declare-fun m!687511 () Bool)

(assert (=> b!735806 m!687511))

(declare-fun m!687513 () Bool)

(assert (=> b!735797 m!687513))

(declare-fun m!687515 () Bool)

(assert (=> b!735787 m!687515))

(declare-fun m!687517 () Bool)

(assert (=> start!65126 m!687517))

(declare-fun m!687519 () Bool)

(assert (=> start!65126 m!687519))

(declare-fun m!687521 () Bool)

(assert (=> b!735796 m!687521))

(declare-fun m!687523 () Bool)

(assert (=> b!735786 m!687523))

(declare-fun m!687525 () Bool)

(assert (=> b!735788 m!687525))

(declare-fun m!687527 () Bool)

(assert (=> b!735803 m!687527))

(declare-fun m!687529 () Bool)

(assert (=> b!735803 m!687529))

(assert (=> b!735794 m!687509))

(assert (=> b!735794 m!687509))

(declare-fun m!687531 () Bool)

(assert (=> b!735794 m!687531))

(assert (=> b!735801 m!687509))

(assert (=> b!735801 m!687509))

(declare-fun m!687533 () Bool)

(assert (=> b!735801 m!687533))

(assert (=> b!735793 m!687509))

(assert (=> b!735793 m!687509))

(declare-fun m!687535 () Bool)

(assert (=> b!735793 m!687535))

(assert (=> b!735793 m!687535))

(assert (=> b!735793 m!687509))

(declare-fun m!687537 () Bool)

(assert (=> b!735793 m!687537))

(declare-fun m!687539 () Bool)

(assert (=> b!735789 m!687539))

(assert (=> b!735805 m!687509))

(assert (=> b!735805 m!687509))

(declare-fun m!687541 () Bool)

(assert (=> b!735805 m!687541))

(assert (=> b!735805 m!687509))

(assert (=> b!735805 m!687531))

(declare-fun m!687543 () Bool)

(assert (=> b!735791 m!687543))

(assert (=> b!735807 m!687509))

(assert (=> b!735807 m!687509))

(declare-fun m!687545 () Bool)

(assert (=> b!735807 m!687545))

(declare-fun m!687547 () Bool)

(assert (=> b!735799 m!687547))

(assert (=> b!735790 m!687509))

(assert (=> b!735790 m!687509))

(assert (=> b!735790 m!687541))

(declare-fun m!687549 () Bool)

(assert (=> b!735808 m!687549))

(declare-fun m!687551 () Bool)

(assert (=> b!735808 m!687551))

(assert (=> b!735808 m!687549))

(declare-fun m!687553 () Bool)

(assert (=> b!735808 m!687553))

(declare-fun m!687555 () Bool)

(assert (=> b!735808 m!687555))

(declare-fun m!687557 () Bool)

(assert (=> b!735808 m!687557))

(assert (=> b!735800 m!687509))

(assert (=> b!735800 m!687509))

(declare-fun m!687559 () Bool)

(assert (=> b!735800 m!687559))

(assert (=> b!735795 m!687509))

(assert (=> b!735795 m!687509))

(declare-fun m!687561 () Bool)

(assert (=> b!735795 m!687561))

(assert (=> b!735804 m!687509))

(assert (=> b!735804 m!687509))

(assert (=> b!735804 m!687533))

(check-sat (not b!735790) (not b!735804) (not b!735808) (not b!735806) (not b!735801) (not b!735799) (not b!735803) (not b!735789) (not b!735791) (not b!735805) (not b!735795) (not b!735807) (not b!735788) (not b!735797) (not b!735786) (not b!735800) (not start!65126) (not b!735793) (not b!735787) (not b!735794))
(check-sat)
