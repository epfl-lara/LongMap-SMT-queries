; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64334 () Bool)

(assert start!64334)

(declare-fun b!723023 () Bool)

(declare-fun res!484655 () Bool)

(declare-fun e!405140 () Bool)

(assert (=> b!723023 (=> (not res!484655) (not e!405140))))

(declare-datatypes ((array!40915 0))(
  ( (array!40916 (arr!19580 (Array (_ BitVec 32) (_ BitVec 64))) (size!20001 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40915)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40915 (_ BitVec 32)) Bool)

(assert (=> b!723023 (= res!484655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723024 () Bool)

(declare-fun res!484659 () Bool)

(assert (=> b!723024 (=> (not res!484659) (not e!405140))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!723024 (= res!484659 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20001 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20001 a!3186))))))

(declare-fun b!723025 () Bool)

(declare-fun res!484652 () Bool)

(declare-fun e!405138 () Bool)

(assert (=> b!723025 (=> (not res!484652) (not e!405138))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723025 (= res!484652 (validKeyInArray!0 k!2102))))

(declare-fun res!484661 () Bool)

(assert (=> start!64334 (=> (not res!484661) (not e!405138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64334 (= res!484661 (validMask!0 mask!3328))))

(assert (=> start!64334 e!405138))

(assert (=> start!64334 true))

(declare-fun array_inv!15376 (array!40915) Bool)

(assert (=> start!64334 (array_inv!15376 a!3186)))

(declare-fun b!723026 () Bool)

(declare-fun e!405136 () Bool)

(assert (=> b!723026 (= e!405136 false)))

(declare-fun lt!320529 () (_ BitVec 64))

(declare-fun lt!320533 () array!40915)

(declare-datatypes ((SeekEntryResult!7180 0))(
  ( (MissingZero!7180 (index!31088 (_ BitVec 32))) (Found!7180 (index!31089 (_ BitVec 32))) (Intermediate!7180 (undefined!7992 Bool) (index!31090 (_ BitVec 32)) (x!62085 (_ BitVec 32))) (Undefined!7180) (MissingVacant!7180 (index!31091 (_ BitVec 32))) )
))
(declare-fun lt!320530 () SeekEntryResult!7180)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40915 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!723026 (= lt!320530 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320529 lt!320533 mask!3328))))

(declare-fun lt!320534 () SeekEntryResult!7180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723026 (= lt!320534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320529 mask!3328) lt!320529 lt!320533 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723026 (= lt!320529 (select (store (arr!19580 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723026 (= lt!320533 (array!40916 (store (arr!19580 a!3186) i!1173 k!2102) (size!20001 a!3186)))))

(declare-fun b!723027 () Bool)

(declare-fun res!484657 () Bool)

(assert (=> b!723027 (=> (not res!484657) (not e!405138))))

(declare-fun arrayContainsKey!0 (array!40915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723027 (= res!484657 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723028 () Bool)

(declare-fun res!484651 () Bool)

(assert (=> b!723028 (=> (not res!484651) (not e!405138))))

(assert (=> b!723028 (= res!484651 (and (= (size!20001 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20001 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20001 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!405139 () Bool)

(declare-fun b!723029 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40915 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!723029 (= e!405139 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19580 a!3186) j!159) a!3186 mask!3328) (Found!7180 j!159)))))

(declare-fun b!723030 () Bool)

(declare-fun res!484656 () Bool)

(assert (=> b!723030 (=> (not res!484656) (not e!405140))))

(declare-datatypes ((List!13582 0))(
  ( (Nil!13579) (Cons!13578 (h!14632 (_ BitVec 64)) (t!19897 List!13582)) )
))
(declare-fun arrayNoDuplicates!0 (array!40915 (_ BitVec 32) List!13582) Bool)

(assert (=> b!723030 (= res!484656 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13579))))

(declare-fun b!723031 () Bool)

(declare-fun res!484654 () Bool)

(assert (=> b!723031 (=> (not res!484654) (not e!405136))))

(assert (=> b!723031 (= res!484654 e!405139)))

(declare-fun c!79558 () Bool)

(assert (=> b!723031 (= c!79558 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723032 () Bool)

(assert (=> b!723032 (= e!405140 e!405136)))

(declare-fun res!484658 () Bool)

(assert (=> b!723032 (=> (not res!484658) (not e!405136))))

(declare-fun lt!320532 () SeekEntryResult!7180)

(assert (=> b!723032 (= res!484658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19580 a!3186) j!159) mask!3328) (select (arr!19580 a!3186) j!159) a!3186 mask!3328) lt!320532))))

(assert (=> b!723032 (= lt!320532 (Intermediate!7180 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723033 () Bool)

(declare-fun res!484650 () Bool)

(assert (=> b!723033 (=> (not res!484650) (not e!405136))))

(assert (=> b!723033 (= res!484650 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19580 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723034 () Bool)

(assert (=> b!723034 (= e!405138 e!405140)))

(declare-fun res!484653 () Bool)

(assert (=> b!723034 (=> (not res!484653) (not e!405140))))

(declare-fun lt!320531 () SeekEntryResult!7180)

(assert (=> b!723034 (= res!484653 (or (= lt!320531 (MissingZero!7180 i!1173)) (= lt!320531 (MissingVacant!7180 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40915 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!723034 (= lt!320531 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723035 () Bool)

(declare-fun res!484660 () Bool)

(assert (=> b!723035 (=> (not res!484660) (not e!405138))))

(assert (=> b!723035 (= res!484660 (validKeyInArray!0 (select (arr!19580 a!3186) j!159)))))

(declare-fun b!723036 () Bool)

(assert (=> b!723036 (= e!405139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19580 a!3186) j!159) a!3186 mask!3328) lt!320532))))

(assert (= (and start!64334 res!484661) b!723028))

(assert (= (and b!723028 res!484651) b!723035))

(assert (= (and b!723035 res!484660) b!723025))

(assert (= (and b!723025 res!484652) b!723027))

(assert (= (and b!723027 res!484657) b!723034))

(assert (= (and b!723034 res!484653) b!723023))

(assert (= (and b!723023 res!484655) b!723030))

(assert (= (and b!723030 res!484656) b!723024))

(assert (= (and b!723024 res!484659) b!723032))

(assert (= (and b!723032 res!484658) b!723033))

(assert (= (and b!723033 res!484650) b!723031))

(assert (= (and b!723031 c!79558) b!723036))

(assert (= (and b!723031 (not c!79558)) b!723029))

(assert (= (and b!723031 res!484654) b!723026))

(declare-fun m!677495 () Bool)

(assert (=> start!64334 m!677495))

(declare-fun m!677497 () Bool)

(assert (=> start!64334 m!677497))

(declare-fun m!677499 () Bool)

(assert (=> b!723025 m!677499))

(declare-fun m!677501 () Bool)

(assert (=> b!723026 m!677501))

(assert (=> b!723026 m!677501))

(declare-fun m!677503 () Bool)

(assert (=> b!723026 m!677503))

(declare-fun m!677505 () Bool)

(assert (=> b!723026 m!677505))

(declare-fun m!677507 () Bool)

(assert (=> b!723026 m!677507))

(declare-fun m!677509 () Bool)

(assert (=> b!723026 m!677509))

(declare-fun m!677511 () Bool)

(assert (=> b!723027 m!677511))

(declare-fun m!677513 () Bool)

(assert (=> b!723036 m!677513))

(assert (=> b!723036 m!677513))

(declare-fun m!677515 () Bool)

(assert (=> b!723036 m!677515))

(assert (=> b!723032 m!677513))

(assert (=> b!723032 m!677513))

(declare-fun m!677517 () Bool)

(assert (=> b!723032 m!677517))

(assert (=> b!723032 m!677517))

(assert (=> b!723032 m!677513))

(declare-fun m!677519 () Bool)

(assert (=> b!723032 m!677519))

(declare-fun m!677521 () Bool)

(assert (=> b!723033 m!677521))

(assert (=> b!723029 m!677513))

(assert (=> b!723029 m!677513))

(declare-fun m!677523 () Bool)

(assert (=> b!723029 m!677523))

(assert (=> b!723035 m!677513))

(assert (=> b!723035 m!677513))

(declare-fun m!677525 () Bool)

(assert (=> b!723035 m!677525))

(declare-fun m!677527 () Bool)

(assert (=> b!723034 m!677527))

(declare-fun m!677529 () Bool)

(assert (=> b!723023 m!677529))

(declare-fun m!677531 () Bool)

(assert (=> b!723030 m!677531))

(push 1)

