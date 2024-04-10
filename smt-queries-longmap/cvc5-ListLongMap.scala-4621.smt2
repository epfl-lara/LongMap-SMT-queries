; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64360 () Bool)

(assert start!64360)

(declare-fun b!723609 () Bool)

(declare-fun res!485167 () Bool)

(declare-fun e!405373 () Bool)

(assert (=> b!723609 (=> (not res!485167) (not e!405373))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40941 0))(
  ( (array!40942 (arr!19593 (Array (_ BitVec 32) (_ BitVec 64))) (size!20014 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40941)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723609 (= res!485167 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19593 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723610 () Bool)

(declare-fun res!485169 () Bool)

(declare-fun e!405371 () Bool)

(assert (=> b!723610 (=> (not res!485169) (not e!405371))))

(declare-datatypes ((List!13595 0))(
  ( (Nil!13592) (Cons!13591 (h!14645 (_ BitVec 64)) (t!19910 List!13595)) )
))
(declare-fun arrayNoDuplicates!0 (array!40941 (_ BitVec 32) List!13595) Bool)

(assert (=> b!723610 (= res!485169 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13592))))

(declare-fun b!723611 () Bool)

(declare-fun res!485171 () Bool)

(declare-fun e!405376 () Bool)

(assert (=> b!723611 (=> (not res!485171) (not e!405376))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!723611 (= res!485171 (and (= (size!20014 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20014 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20014 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723612 () Bool)

(declare-fun e!405377 () Bool)

(assert (=> b!723612 (= e!405377 (not true))))

(declare-fun e!405374 () Bool)

(assert (=> b!723612 e!405374))

(declare-fun res!485170 () Bool)

(assert (=> b!723612 (=> (not res!485170) (not e!405374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40941 (_ BitVec 32)) Bool)

(assert (=> b!723612 (= res!485170 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24704 0))(
  ( (Unit!24705) )
))
(declare-fun lt!320725 () Unit!24704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24704)

(assert (=> b!723612 (= lt!320725 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723613 () Bool)

(declare-fun res!485165 () Bool)

(assert (=> b!723613 (=> (not res!485165) (not e!405371))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723613 (= res!485165 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20014 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20014 a!3186))))))

(declare-fun b!723614 () Bool)

(assert (=> b!723614 (= e!405371 e!405373)))

(declare-fun res!485159 () Bool)

(assert (=> b!723614 (=> (not res!485159) (not e!405373))))

(declare-datatypes ((SeekEntryResult!7193 0))(
  ( (MissingZero!7193 (index!31140 (_ BitVec 32))) (Found!7193 (index!31141 (_ BitVec 32))) (Intermediate!7193 (undefined!8005 Bool) (index!31142 (_ BitVec 32)) (x!62138 (_ BitVec 32))) (Undefined!7193) (MissingVacant!7193 (index!31143 (_ BitVec 32))) )
))
(declare-fun lt!320726 () SeekEntryResult!7193)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40941 (_ BitVec 32)) SeekEntryResult!7193)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723614 (= res!485159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19593 a!3186) j!159) mask!3328) (select (arr!19593 a!3186) j!159) a!3186 mask!3328) lt!320726))))

(assert (=> b!723614 (= lt!320726 (Intermediate!7193 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723615 () Bool)

(assert (=> b!723615 (= e!405373 e!405377)))

(declare-fun res!485166 () Bool)

(assert (=> b!723615 (=> (not res!485166) (not e!405377))))

(declare-fun lt!320728 () array!40941)

(declare-fun lt!320727 () (_ BitVec 64))

(assert (=> b!723615 (= res!485166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320727 mask!3328) lt!320727 lt!320728 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320727 lt!320728 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!723615 (= lt!320727 (select (store (arr!19593 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723615 (= lt!320728 (array!40942 (store (arr!19593 a!3186) i!1173 k!2102) (size!20014 a!3186)))))

(declare-fun res!485164 () Bool)

(assert (=> start!64360 (=> (not res!485164) (not e!405376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64360 (= res!485164 (validMask!0 mask!3328))))

(assert (=> start!64360 e!405376))

(assert (=> start!64360 true))

(declare-fun array_inv!15389 (array!40941) Bool)

(assert (=> start!64360 (array_inv!15389 a!3186)))

(declare-fun b!723616 () Bool)

(assert (=> b!723616 (= e!405376 e!405371)))

(declare-fun res!485162 () Bool)

(assert (=> b!723616 (=> (not res!485162) (not e!405371))))

(declare-fun lt!320729 () SeekEntryResult!7193)

(assert (=> b!723616 (= res!485162 (or (= lt!320729 (MissingZero!7193 i!1173)) (= lt!320729 (MissingVacant!7193 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40941 (_ BitVec 32)) SeekEntryResult!7193)

(assert (=> b!723616 (= lt!320729 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723617 () Bool)

(declare-fun e!405375 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40941 (_ BitVec 32)) SeekEntryResult!7193)

(assert (=> b!723617 (= e!405375 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19593 a!3186) j!159) a!3186 mask!3328) (Found!7193 j!159)))))

(declare-fun b!723618 () Bool)

(assert (=> b!723618 (= e!405374 (= (seekEntryOrOpen!0 (select (arr!19593 a!3186) j!159) a!3186 mask!3328) (Found!7193 j!159)))))

(declare-fun b!723619 () Bool)

(declare-fun res!485158 () Bool)

(assert (=> b!723619 (=> (not res!485158) (not e!405376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723619 (= res!485158 (validKeyInArray!0 (select (arr!19593 a!3186) j!159)))))

(declare-fun b!723620 () Bool)

(declare-fun res!485161 () Bool)

(assert (=> b!723620 (=> (not res!485161) (not e!405376))))

(assert (=> b!723620 (= res!485161 (validKeyInArray!0 k!2102))))

(declare-fun b!723621 () Bool)

(assert (=> b!723621 (= e!405375 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19593 a!3186) j!159) a!3186 mask!3328) lt!320726))))

(declare-fun b!723622 () Bool)

(declare-fun res!485160 () Bool)

(assert (=> b!723622 (=> (not res!485160) (not e!405373))))

(assert (=> b!723622 (= res!485160 e!405375)))

(declare-fun c!79597 () Bool)

(assert (=> b!723622 (= c!79597 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723623 () Bool)

(declare-fun res!485168 () Bool)

(assert (=> b!723623 (=> (not res!485168) (not e!405376))))

(declare-fun arrayContainsKey!0 (array!40941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723623 (= res!485168 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723624 () Bool)

(declare-fun res!485163 () Bool)

(assert (=> b!723624 (=> (not res!485163) (not e!405371))))

(assert (=> b!723624 (= res!485163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64360 res!485164) b!723611))

(assert (= (and b!723611 res!485171) b!723619))

(assert (= (and b!723619 res!485158) b!723620))

(assert (= (and b!723620 res!485161) b!723623))

(assert (= (and b!723623 res!485168) b!723616))

(assert (= (and b!723616 res!485162) b!723624))

(assert (= (and b!723624 res!485163) b!723610))

(assert (= (and b!723610 res!485169) b!723613))

(assert (= (and b!723613 res!485165) b!723614))

(assert (= (and b!723614 res!485159) b!723609))

(assert (= (and b!723609 res!485167) b!723622))

(assert (= (and b!723622 c!79597) b!723621))

(assert (= (and b!723622 (not c!79597)) b!723617))

(assert (= (and b!723622 res!485160) b!723615))

(assert (= (and b!723615 res!485166) b!723612))

(assert (= (and b!723612 res!485170) b!723618))

(declare-fun m!678037 () Bool)

(assert (=> b!723610 m!678037))

(declare-fun m!678039 () Bool)

(assert (=> b!723616 m!678039))

(declare-fun m!678041 () Bool)

(assert (=> b!723623 m!678041))

(declare-fun m!678043 () Bool)

(assert (=> b!723618 m!678043))

(assert (=> b!723618 m!678043))

(declare-fun m!678045 () Bool)

(assert (=> b!723618 m!678045))

(assert (=> b!723621 m!678043))

(assert (=> b!723621 m!678043))

(declare-fun m!678047 () Bool)

(assert (=> b!723621 m!678047))

(declare-fun m!678049 () Bool)

(assert (=> b!723624 m!678049))

(declare-fun m!678051 () Bool)

(assert (=> b!723620 m!678051))

(declare-fun m!678053 () Bool)

(assert (=> b!723612 m!678053))

(declare-fun m!678055 () Bool)

(assert (=> b!723612 m!678055))

(declare-fun m!678057 () Bool)

(assert (=> b!723615 m!678057))

(declare-fun m!678059 () Bool)

(assert (=> b!723615 m!678059))

(declare-fun m!678061 () Bool)

(assert (=> b!723615 m!678061))

(declare-fun m!678063 () Bool)

(assert (=> b!723615 m!678063))

(declare-fun m!678065 () Bool)

(assert (=> b!723615 m!678065))

(assert (=> b!723615 m!678061))

(assert (=> b!723614 m!678043))

(assert (=> b!723614 m!678043))

(declare-fun m!678067 () Bool)

(assert (=> b!723614 m!678067))

(assert (=> b!723614 m!678067))

(assert (=> b!723614 m!678043))

(declare-fun m!678069 () Bool)

(assert (=> b!723614 m!678069))

(assert (=> b!723619 m!678043))

(assert (=> b!723619 m!678043))

(declare-fun m!678071 () Bool)

(assert (=> b!723619 m!678071))

(declare-fun m!678073 () Bool)

(assert (=> start!64360 m!678073))

(declare-fun m!678075 () Bool)

(assert (=> start!64360 m!678075))

(assert (=> b!723617 m!678043))

(assert (=> b!723617 m!678043))

(declare-fun m!678077 () Bool)

(assert (=> b!723617 m!678077))

(declare-fun m!678079 () Bool)

(assert (=> b!723609 m!678079))

(push 1)

