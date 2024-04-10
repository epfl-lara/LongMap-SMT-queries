; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64354 () Bool)

(assert start!64354)

(declare-fun b!723472 () Bool)

(declare-fun res!485041 () Bool)

(declare-fun e!405318 () Bool)

(assert (=> b!723472 (=> (not res!485041) (not e!405318))))

(declare-datatypes ((array!40935 0))(
  ( (array!40936 (arr!19590 (Array (_ BitVec 32) (_ BitVec 64))) (size!20011 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40935)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723472 (= res!485041 (validKeyInArray!0 (select (arr!19590 a!3186) j!159)))))

(declare-fun b!723473 () Bool)

(declare-fun res!485042 () Bool)

(declare-fun e!405320 () Bool)

(assert (=> b!723473 (=> (not res!485042) (not e!405320))))

(declare-datatypes ((List!13592 0))(
  ( (Nil!13589) (Cons!13588 (h!14642 (_ BitVec 64)) (t!19907 List!13592)) )
))
(declare-fun arrayNoDuplicates!0 (array!40935 (_ BitVec 32) List!13592) Bool)

(assert (=> b!723473 (= res!485042 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13589))))

(declare-fun b!723474 () Bool)

(declare-fun e!405319 () Bool)

(assert (=> b!723474 (= e!405319 (not true))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40935 (_ BitVec 32)) Bool)

(assert (=> b!723474 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24698 0))(
  ( (Unit!24699) )
))
(declare-fun lt!320682 () Unit!24698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24698)

(assert (=> b!723474 (= lt!320682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723475 () Bool)

(declare-fun e!405316 () Bool)

(assert (=> b!723475 (= e!405316 e!405319)))

(declare-fun res!485040 () Bool)

(assert (=> b!723475 (=> (not res!485040) (not e!405319))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!320681 () array!40935)

(declare-fun lt!320683 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7190 0))(
  ( (MissingZero!7190 (index!31128 (_ BitVec 32))) (Found!7190 (index!31129 (_ BitVec 32))) (Intermediate!7190 (undefined!8002 Bool) (index!31130 (_ BitVec 32)) (x!62127 (_ BitVec 32))) (Undefined!7190) (MissingVacant!7190 (index!31131 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40935 (_ BitVec 32)) SeekEntryResult!7190)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723475 (= res!485040 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320683 mask!3328) lt!320683 lt!320681 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320683 lt!320681 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!723475 (= lt!320683 (select (store (arr!19590 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723475 (= lt!320681 (array!40936 (store (arr!19590 a!3186) i!1173 k!2102) (size!20011 a!3186)))))

(declare-fun b!723476 () Bool)

(declare-fun res!485043 () Bool)

(assert (=> b!723476 (=> (not res!485043) (not e!405320))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723476 (= res!485043 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20011 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20011 a!3186))))))

(declare-fun b!723477 () Bool)

(declare-fun res!485046 () Bool)

(assert (=> b!723477 (=> (not res!485046) (not e!405320))))

(assert (=> b!723477 (= res!485046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!485049 () Bool)

(assert (=> start!64354 (=> (not res!485049) (not e!405318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64354 (= res!485049 (validMask!0 mask!3328))))

(assert (=> start!64354 e!405318))

(assert (=> start!64354 true))

(declare-fun array_inv!15386 (array!40935) Bool)

(assert (=> start!64354 (array_inv!15386 a!3186)))

(declare-fun b!723478 () Bool)

(declare-fun res!485044 () Bool)

(assert (=> b!723478 (=> (not res!485044) (not e!405318))))

(assert (=> b!723478 (= res!485044 (and (= (size!20011 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20011 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20011 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723479 () Bool)

(declare-fun res!485047 () Bool)

(assert (=> b!723479 (=> (not res!485047) (not e!405316))))

(assert (=> b!723479 (= res!485047 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19590 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723480 () Bool)

(assert (=> b!723480 (= e!405320 e!405316)))

(declare-fun res!485051 () Bool)

(assert (=> b!723480 (=> (not res!485051) (not e!405316))))

(declare-fun lt!320680 () SeekEntryResult!7190)

(assert (=> b!723480 (= res!485051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19590 a!3186) j!159) mask!3328) (select (arr!19590 a!3186) j!159) a!3186 mask!3328) lt!320680))))

(assert (=> b!723480 (= lt!320680 (Intermediate!7190 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!405317 () Bool)

(declare-fun b!723481 () Bool)

(assert (=> b!723481 (= e!405317 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19590 a!3186) j!159) a!3186 mask!3328) lt!320680))))

(declare-fun b!723482 () Bool)

(declare-fun res!485048 () Bool)

(assert (=> b!723482 (=> (not res!485048) (not e!405316))))

(assert (=> b!723482 (= res!485048 e!405317)))

(declare-fun c!79588 () Bool)

(assert (=> b!723482 (= c!79588 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723483 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40935 (_ BitVec 32)) SeekEntryResult!7190)

(assert (=> b!723483 (= e!405317 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19590 a!3186) j!159) a!3186 mask!3328) (Found!7190 j!159)))))

(declare-fun b!723484 () Bool)

(declare-fun res!485050 () Bool)

(assert (=> b!723484 (=> (not res!485050) (not e!405318))))

(declare-fun arrayContainsKey!0 (array!40935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723484 (= res!485050 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723485 () Bool)

(declare-fun res!485045 () Bool)

(assert (=> b!723485 (=> (not res!485045) (not e!405318))))

(assert (=> b!723485 (= res!485045 (validKeyInArray!0 k!2102))))

(declare-fun b!723486 () Bool)

(assert (=> b!723486 (= e!405318 e!405320)))

(declare-fun res!485039 () Bool)

(assert (=> b!723486 (=> (not res!485039) (not e!405320))))

(declare-fun lt!320684 () SeekEntryResult!7190)

(assert (=> b!723486 (= res!485039 (or (= lt!320684 (MissingZero!7190 i!1173)) (= lt!320684 (MissingVacant!7190 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40935 (_ BitVec 32)) SeekEntryResult!7190)

(assert (=> b!723486 (= lt!320684 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64354 res!485049) b!723478))

(assert (= (and b!723478 res!485044) b!723472))

(assert (= (and b!723472 res!485041) b!723485))

(assert (= (and b!723485 res!485045) b!723484))

(assert (= (and b!723484 res!485050) b!723486))

(assert (= (and b!723486 res!485039) b!723477))

(assert (= (and b!723477 res!485046) b!723473))

(assert (= (and b!723473 res!485042) b!723476))

(assert (= (and b!723476 res!485043) b!723480))

(assert (= (and b!723480 res!485051) b!723479))

(assert (= (and b!723479 res!485047) b!723482))

(assert (= (and b!723482 c!79588) b!723481))

(assert (= (and b!723482 (not c!79588)) b!723483))

(assert (= (and b!723482 res!485048) b!723475))

(assert (= (and b!723475 res!485040) b!723474))

(declare-fun m!677911 () Bool)

(assert (=> b!723485 m!677911))

(declare-fun m!677913 () Bool)

(assert (=> b!723481 m!677913))

(assert (=> b!723481 m!677913))

(declare-fun m!677915 () Bool)

(assert (=> b!723481 m!677915))

(declare-fun m!677917 () Bool)

(assert (=> b!723486 m!677917))

(declare-fun m!677919 () Bool)

(assert (=> b!723474 m!677919))

(declare-fun m!677921 () Bool)

(assert (=> b!723474 m!677921))

(declare-fun m!677923 () Bool)

(assert (=> b!723475 m!677923))

(declare-fun m!677925 () Bool)

(assert (=> b!723475 m!677925))

(declare-fun m!677927 () Bool)

(assert (=> b!723475 m!677927))

(declare-fun m!677929 () Bool)

(assert (=> b!723475 m!677929))

(declare-fun m!677931 () Bool)

(assert (=> b!723475 m!677931))

(assert (=> b!723475 m!677929))

(declare-fun m!677933 () Bool)

(assert (=> start!64354 m!677933))

(declare-fun m!677935 () Bool)

(assert (=> start!64354 m!677935))

(declare-fun m!677937 () Bool)

(assert (=> b!723484 m!677937))

(assert (=> b!723483 m!677913))

(assert (=> b!723483 m!677913))

(declare-fun m!677939 () Bool)

(assert (=> b!723483 m!677939))

(declare-fun m!677941 () Bool)

(assert (=> b!723473 m!677941))

(declare-fun m!677943 () Bool)

(assert (=> b!723477 m!677943))

(assert (=> b!723472 m!677913))

(assert (=> b!723472 m!677913))

(declare-fun m!677945 () Bool)

(assert (=> b!723472 m!677945))

(assert (=> b!723480 m!677913))

(assert (=> b!723480 m!677913))

(declare-fun m!677947 () Bool)

(assert (=> b!723480 m!677947))

(assert (=> b!723480 m!677947))

(assert (=> b!723480 m!677913))

(declare-fun m!677949 () Bool)

(assert (=> b!723480 m!677949))

(declare-fun m!677951 () Bool)

(assert (=> b!723479 m!677951))

(push 1)

