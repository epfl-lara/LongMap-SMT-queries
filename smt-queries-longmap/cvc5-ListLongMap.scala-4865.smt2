; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67104 () Bool)

(assert start!67104)

(declare-fun b!774522 () Bool)

(declare-fun res!523680 () Bool)

(declare-fun e!431144 () Bool)

(assert (=> b!774522 (=> (not res!523680) (not e!431144))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42459 0))(
  ( (array!42460 (arr!20325 (Array (_ BitVec 32) (_ BitVec 64))) (size!20746 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42459)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!774522 (= res!523680 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20325 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!774523 () Bool)

(declare-fun e!431138 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!344931 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7925 0))(
  ( (MissingZero!7925 (index!34068 (_ BitVec 32))) (Found!7925 (index!34069 (_ BitVec 32))) (Intermediate!7925 (undefined!8737 Bool) (index!34070 (_ BitVec 32)) (x!65020 (_ BitVec 32))) (Undefined!7925) (MissingVacant!7925 (index!34071 (_ BitVec 32))) )
))
(declare-fun lt!344935 () SeekEntryResult!7925)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42459 (_ BitVec 32)) SeekEntryResult!7925)

(assert (=> b!774523 (= e!431138 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344931 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344935)))))

(declare-fun b!774524 () Bool)

(declare-fun e!431137 () Bool)

(declare-fun e!431134 () Bool)

(assert (=> b!774524 (= e!431137 e!431134)))

(declare-fun res!523687 () Bool)

(assert (=> b!774524 (=> (not res!523687) (not e!431134))))

(declare-fun lt!344937 () SeekEntryResult!7925)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42459 (_ BitVec 32)) SeekEntryResult!7925)

(assert (=> b!774524 (= res!523687 (= (seekEntryOrOpen!0 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344937))))

(assert (=> b!774524 (= lt!344937 (Found!7925 j!159))))

(declare-fun b!774525 () Bool)

(declare-datatypes ((Unit!26714 0))(
  ( (Unit!26715) )
))
(declare-fun e!431142 () Unit!26714)

(declare-fun Unit!26716 () Unit!26714)

(assert (=> b!774525 (= e!431142 Unit!26716)))

(declare-fun lt!344927 () SeekEntryResult!7925)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42459 (_ BitVec 32)) SeekEntryResult!7925)

(assert (=> b!774525 (= lt!344927 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20325 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!344932 () SeekEntryResult!7925)

(assert (=> b!774525 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344931 resIntermediateIndex!5 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344932)))

(declare-fun b!774526 () Bool)

(declare-fun e!431133 () Bool)

(declare-fun e!431140 () Bool)

(assert (=> b!774526 (= e!431133 e!431140)))

(declare-fun res!523688 () Bool)

(assert (=> b!774526 (=> res!523688 e!431140)))

(assert (=> b!774526 (= res!523688 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344931 #b00000000000000000000000000000000) (bvsge lt!344931 (size!20746 a!3186))))))

(declare-fun lt!344939 () Unit!26714)

(assert (=> b!774526 (= lt!344939 e!431142)))

(declare-fun c!85823 () Bool)

(declare-fun lt!344929 () Bool)

(assert (=> b!774526 (= c!85823 lt!344929)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!774526 (= lt!344929 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774526 (= lt!344931 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!774527 () Bool)

(declare-fun res!523679 () Bool)

(assert (=> b!774527 (=> (not res!523679) (not e!431144))))

(declare-fun e!431136 () Bool)

(assert (=> b!774527 (= res!523679 e!431136)))

(declare-fun c!85825 () Bool)

(assert (=> b!774527 (= c!85825 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774528 () Bool)

(declare-fun res!523686 () Bool)

(declare-fun e!431143 () Bool)

(assert (=> b!774528 (=> (not res!523686) (not e!431143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42459 (_ BitVec 32)) Bool)

(assert (=> b!774528 (= res!523686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774529 () Bool)

(declare-fun e!431139 () Bool)

(assert (=> b!774529 (= e!431144 e!431139)))

(declare-fun res!523678 () Bool)

(assert (=> b!774529 (=> (not res!523678) (not e!431139))))

(declare-fun lt!344934 () SeekEntryResult!7925)

(declare-fun lt!344936 () SeekEntryResult!7925)

(assert (=> b!774529 (= res!523678 (= lt!344934 lt!344936))))

(declare-fun lt!344928 () (_ BitVec 64))

(declare-fun lt!344930 () array!42459)

(assert (=> b!774529 (= lt!344936 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344928 lt!344930 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774529 (= lt!344934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344928 mask!3328) lt!344928 lt!344930 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!774529 (= lt!344928 (select (store (arr!20325 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!774529 (= lt!344930 (array!42460 (store (arr!20325 a!3186) i!1173 k!2102) (size!20746 a!3186)))))

(declare-fun b!774530 () Bool)

(declare-fun res!523684 () Bool)

(assert (=> b!774530 (=> (not res!523684) (not e!431143))))

(assert (=> b!774530 (= res!523684 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20746 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20746 a!3186))))))

(declare-fun b!774531 () Bool)

(declare-fun res!523692 () Bool)

(declare-fun e!431135 () Bool)

(assert (=> b!774531 (=> (not res!523692) (not e!431135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774531 (= res!523692 (validKeyInArray!0 k!2102))))

(declare-fun b!774532 () Bool)

(assert (=> b!774532 (= e!431140 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1131)) (bvsub #b01111111111111111111111111111110 x!1131)))))

(declare-fun b!774534 () Bool)

(declare-fun res!523693 () Bool)

(assert (=> b!774534 (=> (not res!523693) (not e!431135))))

(declare-fun arrayContainsKey!0 (array!42459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774534 (= res!523693 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!774535 () Bool)

(declare-fun res!523694 () Bool)

(assert (=> b!774535 (=> res!523694 e!431140)))

(assert (=> b!774535 (= res!523694 (not (= lt!344934 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344931 lt!344928 lt!344930 mask!3328))))))

(declare-fun b!774536 () Bool)

(assert (=> b!774536 (= e!431139 (not e!431133))))

(declare-fun res!523681 () Bool)

(assert (=> b!774536 (=> res!523681 e!431133)))

(assert (=> b!774536 (= res!523681 (or (not (is-Intermediate!7925 lt!344936)) (bvsge x!1131 (x!65020 lt!344936))))))

(assert (=> b!774536 (= lt!344932 (Found!7925 j!159))))

(assert (=> b!774536 e!431137))

(declare-fun res!523685 () Bool)

(assert (=> b!774536 (=> (not res!523685) (not e!431137))))

(assert (=> b!774536 (= res!523685 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344938 () Unit!26714)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42459 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26714)

(assert (=> b!774536 (= lt!344938 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774537 () Bool)

(declare-fun res!523689 () Bool)

(assert (=> b!774537 (=> res!523689 e!431140)))

(assert (=> b!774537 (= res!523689 e!431138)))

(declare-fun c!85824 () Bool)

(assert (=> b!774537 (= c!85824 lt!344929)))

(declare-fun b!774538 () Bool)

(assert (=> b!774538 (= e!431135 e!431143)))

(declare-fun res!523676 () Bool)

(assert (=> b!774538 (=> (not res!523676) (not e!431143))))

(declare-fun lt!344933 () SeekEntryResult!7925)

(assert (=> b!774538 (= res!523676 (or (= lt!344933 (MissingZero!7925 i!1173)) (= lt!344933 (MissingVacant!7925 i!1173))))))

(assert (=> b!774538 (= lt!344933 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!774539 () Bool)

(assert (=> b!774539 (= e!431136 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) (Found!7925 j!159)))))

(declare-fun b!774540 () Bool)

(declare-fun res!523677 () Bool)

(assert (=> b!774540 (=> (not res!523677) (not e!431135))))

(assert (=> b!774540 (= res!523677 (and (= (size!20746 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20746 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20746 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774541 () Bool)

(declare-fun res!523683 () Bool)

(assert (=> b!774541 (=> (not res!523683) (not e!431135))))

(assert (=> b!774541 (= res!523683 (validKeyInArray!0 (select (arr!20325 a!3186) j!159)))))

(declare-fun b!774542 () Bool)

(assert (=> b!774542 (= e!431136 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344935))))

(declare-fun res!523691 () Bool)

(assert (=> start!67104 (=> (not res!523691) (not e!431135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67104 (= res!523691 (validMask!0 mask!3328))))

(assert (=> start!67104 e!431135))

(assert (=> start!67104 true))

(declare-fun array_inv!16121 (array!42459) Bool)

(assert (=> start!67104 (array_inv!16121 a!3186)))

(declare-fun b!774533 () Bool)

(assert (=> b!774533 (= e!431134 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344937))))

(declare-fun b!774543 () Bool)

(assert (=> b!774543 (= e!431143 e!431144)))

(declare-fun res!523690 () Bool)

(assert (=> b!774543 (=> (not res!523690) (not e!431144))))

(assert (=> b!774543 (= res!523690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20325 a!3186) j!159) mask!3328) (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344935))))

(assert (=> b!774543 (= lt!344935 (Intermediate!7925 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774544 () Bool)

(declare-fun res!523682 () Bool)

(assert (=> b!774544 (=> (not res!523682) (not e!431143))))

(declare-datatypes ((List!14327 0))(
  ( (Nil!14324) (Cons!14323 (h!15431 (_ BitVec 64)) (t!20642 List!14327)) )
))
(declare-fun arrayNoDuplicates!0 (array!42459 (_ BitVec 32) List!14327) Bool)

(assert (=> b!774544 (= res!523682 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14324))))

(declare-fun b!774545 () Bool)

(assert (=> b!774545 (= e!431138 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344931 resIntermediateIndex!5 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344932)))))

(declare-fun b!774546 () Bool)

(declare-fun Unit!26717 () Unit!26714)

(assert (=> b!774546 (= e!431142 Unit!26717)))

(assert (=> b!774546 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344931 (select (arr!20325 a!3186) j!159) a!3186 mask!3328) lt!344935)))

(assert (= (and start!67104 res!523691) b!774540))

(assert (= (and b!774540 res!523677) b!774541))

(assert (= (and b!774541 res!523683) b!774531))

(assert (= (and b!774531 res!523692) b!774534))

(assert (= (and b!774534 res!523693) b!774538))

(assert (= (and b!774538 res!523676) b!774528))

(assert (= (and b!774528 res!523686) b!774544))

(assert (= (and b!774544 res!523682) b!774530))

(assert (= (and b!774530 res!523684) b!774543))

(assert (= (and b!774543 res!523690) b!774522))

(assert (= (and b!774522 res!523680) b!774527))

(assert (= (and b!774527 c!85825) b!774542))

(assert (= (and b!774527 (not c!85825)) b!774539))

(assert (= (and b!774527 res!523679) b!774529))

(assert (= (and b!774529 res!523678) b!774536))

(assert (= (and b!774536 res!523685) b!774524))

(assert (= (and b!774524 res!523687) b!774533))

(assert (= (and b!774536 (not res!523681)) b!774526))

(assert (= (and b!774526 c!85823) b!774546))

(assert (= (and b!774526 (not c!85823)) b!774525))

(assert (= (and b!774526 (not res!523688)) b!774537))

(assert (= (and b!774537 c!85824) b!774523))

(assert (= (and b!774537 (not c!85824)) b!774545))

(assert (= (and b!774537 (not res!523689)) b!774535))

(assert (= (and b!774535 (not res!523694)) b!774532))

(declare-fun m!718967 () Bool)

(assert (=> b!774535 m!718967))

(declare-fun m!718969 () Bool)

(assert (=> b!774543 m!718969))

(assert (=> b!774543 m!718969))

(declare-fun m!718971 () Bool)

(assert (=> b!774543 m!718971))

(assert (=> b!774543 m!718971))

(assert (=> b!774543 m!718969))

(declare-fun m!718973 () Bool)

(assert (=> b!774543 m!718973))

(assert (=> b!774533 m!718969))

(assert (=> b!774533 m!718969))

(declare-fun m!718975 () Bool)

(assert (=> b!774533 m!718975))

(assert (=> b!774542 m!718969))

(assert (=> b!774542 m!718969))

(declare-fun m!718977 () Bool)

(assert (=> b!774542 m!718977))

(declare-fun m!718979 () Bool)

(assert (=> b!774526 m!718979))

(assert (=> b!774546 m!718969))

(assert (=> b!774546 m!718969))

(declare-fun m!718981 () Bool)

(assert (=> b!774546 m!718981))

(assert (=> b!774525 m!718969))

(assert (=> b!774525 m!718969))

(declare-fun m!718983 () Bool)

(assert (=> b!774525 m!718983))

(assert (=> b!774525 m!718969))

(declare-fun m!718985 () Bool)

(assert (=> b!774525 m!718985))

(assert (=> b!774524 m!718969))

(assert (=> b!774524 m!718969))

(declare-fun m!718987 () Bool)

(assert (=> b!774524 m!718987))

(declare-fun m!718989 () Bool)

(assert (=> b!774534 m!718989))

(declare-fun m!718991 () Bool)

(assert (=> start!67104 m!718991))

(declare-fun m!718993 () Bool)

(assert (=> start!67104 m!718993))

(declare-fun m!718995 () Bool)

(assert (=> b!774536 m!718995))

(declare-fun m!718997 () Bool)

(assert (=> b!774536 m!718997))

(declare-fun m!718999 () Bool)

(assert (=> b!774529 m!718999))

(declare-fun m!719001 () Bool)

(assert (=> b!774529 m!719001))

(declare-fun m!719003 () Bool)

(assert (=> b!774529 m!719003))

(declare-fun m!719005 () Bool)

(assert (=> b!774529 m!719005))

(assert (=> b!774529 m!719001))

(declare-fun m!719007 () Bool)

(assert (=> b!774529 m!719007))

(assert (=> b!774541 m!718969))

(assert (=> b!774541 m!718969))

(declare-fun m!719009 () Bool)

(assert (=> b!774541 m!719009))

(declare-fun m!719011 () Bool)

(assert (=> b!774531 m!719011))

(assert (=> b!774545 m!718969))

(assert (=> b!774545 m!718969))

(assert (=> b!774545 m!718985))

(declare-fun m!719013 () Bool)

(assert (=> b!774544 m!719013))

(declare-fun m!719015 () Bool)

(assert (=> b!774538 m!719015))

(assert (=> b!774539 m!718969))

(assert (=> b!774539 m!718969))

(assert (=> b!774539 m!718983))

(declare-fun m!719017 () Bool)

(assert (=> b!774522 m!719017))

(assert (=> b!774523 m!718969))

(assert (=> b!774523 m!718969))

(assert (=> b!774523 m!718981))

(declare-fun m!719019 () Bool)

(assert (=> b!774528 m!719019))

(push 1)

(assert (not b!774534))

(assert (not b!774524))

(assert (not b!774536))

(assert (not b!774531))

(assert (not b!774525))

(assert (not b!774535))

(assert (not b!774542))

(assert (not b!774543))

(assert (not b!774541))

(assert (not b!774529))

(assert (not b!774533))

(assert (not start!67104))

(assert (not b!774546))

(assert (not b!774539))

(assert (not b!774544))

(assert (not b!774545))

(assert (not b!774538))

(assert (not b!774528))

(assert (not b!774523))

(assert (not b!774526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

