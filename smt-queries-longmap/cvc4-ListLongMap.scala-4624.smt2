; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64382 () Bool)

(assert start!64382)

(declare-datatypes ((array!40963 0))(
  ( (array!40964 (arr!19604 (Array (_ BitVec 32) (_ BitVec 64))) (size!20025 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40963)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!724137 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405604 () Bool)

(declare-datatypes ((SeekEntryResult!7204 0))(
  ( (MissingZero!7204 (index!31184 (_ BitVec 32))) (Found!7204 (index!31185 (_ BitVec 32))) (Intermediate!7204 (undefined!8016 Bool) (index!31186 (_ BitVec 32)) (x!62173 (_ BitVec 32))) (Undefined!7204) (MissingVacant!7204 (index!31187 (_ BitVec 32))) )
))
(declare-fun lt!320891 () SeekEntryResult!7204)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40963 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724137 (= e!405604 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320891))))

(declare-fun b!724138 () Bool)

(declare-fun res!485632 () Bool)

(declare-fun e!405602 () Bool)

(assert (=> b!724138 (=> (not res!485632) (not e!405602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40963 (_ BitVec 32)) Bool)

(assert (=> b!724138 (= res!485632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724139 () Bool)

(declare-fun res!485629 () Bool)

(assert (=> b!724139 (=> (not res!485629) (not e!405602))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724139 (= res!485629 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20025 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20025 a!3186))))))

(declare-fun b!724140 () Bool)

(declare-fun e!405607 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40963 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724140 (= e!405607 (= (seekEntryOrOpen!0 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) (Found!7204 j!159)))))

(declare-fun b!724141 () Bool)

(declare-fun res!485625 () Bool)

(declare-fun e!405608 () Bool)

(assert (=> b!724141 (=> (not res!485625) (not e!405608))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724141 (= res!485625 (validKeyInArray!0 k!2102))))

(declare-fun b!724142 () Bool)

(declare-fun res!485631 () Bool)

(assert (=> b!724142 (=> (not res!485631) (not e!405608))))

(assert (=> b!724142 (= res!485631 (validKeyInArray!0 (select (arr!19604 a!3186) j!159)))))

(declare-fun b!724143 () Bool)

(declare-fun res!485630 () Bool)

(declare-fun e!405606 () Bool)

(assert (=> b!724143 (=> (not res!485630) (not e!405606))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724143 (= res!485630 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19604 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724144 () Bool)

(assert (=> b!724144 (= e!405608 e!405602)))

(declare-fun res!485621 () Bool)

(assert (=> b!724144 (=> (not res!485621) (not e!405602))))

(declare-fun lt!320894 () SeekEntryResult!7204)

(assert (=> b!724144 (= res!485621 (or (= lt!320894 (MissingZero!7204 i!1173)) (= lt!320894 (MissingVacant!7204 i!1173))))))

(assert (=> b!724144 (= lt!320894 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40963 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724145 (= e!405604 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19604 a!3186) j!159) a!3186 mask!3328) (Found!7204 j!159)))))

(declare-fun b!724147 () Bool)

(declare-fun res!485627 () Bool)

(assert (=> b!724147 (=> (not res!485627) (not e!405606))))

(assert (=> b!724147 (= res!485627 e!405604)))

(declare-fun c!79630 () Bool)

(assert (=> b!724147 (= c!79630 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724148 () Bool)

(declare-fun e!405605 () Bool)

(assert (=> b!724148 (= e!405605 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!724148 e!405607))

(declare-fun res!485626 () Bool)

(assert (=> b!724148 (=> (not res!485626) (not e!405607))))

(assert (=> b!724148 (= res!485626 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24726 0))(
  ( (Unit!24727) )
))
(declare-fun lt!320892 () Unit!24726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40963 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24726)

(assert (=> b!724148 (= lt!320892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724149 () Bool)

(assert (=> b!724149 (= e!405602 e!405606)))

(declare-fun res!485624 () Bool)

(assert (=> b!724149 (=> (not res!485624) (not e!405606))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724149 (= res!485624 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19604 a!3186) j!159) mask!3328) (select (arr!19604 a!3186) j!159) a!3186 mask!3328) lt!320891))))

(assert (=> b!724149 (= lt!320891 (Intermediate!7204 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724150 () Bool)

(declare-fun res!485620 () Bool)

(assert (=> b!724150 (=> (not res!485620) (not e!405608))))

(declare-fun arrayContainsKey!0 (array!40963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724150 (= res!485620 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724151 () Bool)

(assert (=> b!724151 (= e!405606 e!405605)))

(declare-fun res!485623 () Bool)

(assert (=> b!724151 (=> (not res!485623) (not e!405605))))

(declare-fun lt!320893 () array!40963)

(declare-fun lt!320890 () (_ BitVec 64))

(assert (=> b!724151 (= res!485623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320890 mask!3328) lt!320890 lt!320893 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320890 lt!320893 mask!3328)))))

(assert (=> b!724151 (= lt!320890 (select (store (arr!19604 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724151 (= lt!320893 (array!40964 (store (arr!19604 a!3186) i!1173 k!2102) (size!20025 a!3186)))))

(declare-fun b!724152 () Bool)

(declare-fun res!485622 () Bool)

(assert (=> b!724152 (=> (not res!485622) (not e!405602))))

(declare-datatypes ((List!13606 0))(
  ( (Nil!13603) (Cons!13602 (h!14656 (_ BitVec 64)) (t!19921 List!13606)) )
))
(declare-fun arrayNoDuplicates!0 (array!40963 (_ BitVec 32) List!13606) Bool)

(assert (=> b!724152 (= res!485622 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13603))))

(declare-fun res!485628 () Bool)

(assert (=> start!64382 (=> (not res!485628) (not e!405608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64382 (= res!485628 (validMask!0 mask!3328))))

(assert (=> start!64382 e!405608))

(assert (=> start!64382 true))

(declare-fun array_inv!15400 (array!40963) Bool)

(assert (=> start!64382 (array_inv!15400 a!3186)))

(declare-fun b!724146 () Bool)

(declare-fun res!485633 () Bool)

(assert (=> b!724146 (=> (not res!485633) (not e!405608))))

(assert (=> b!724146 (= res!485633 (and (= (size!20025 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20025 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20025 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64382 res!485628) b!724146))

(assert (= (and b!724146 res!485633) b!724142))

(assert (= (and b!724142 res!485631) b!724141))

(assert (= (and b!724141 res!485625) b!724150))

(assert (= (and b!724150 res!485620) b!724144))

(assert (= (and b!724144 res!485621) b!724138))

(assert (= (and b!724138 res!485632) b!724152))

(assert (= (and b!724152 res!485622) b!724139))

(assert (= (and b!724139 res!485629) b!724149))

(assert (= (and b!724149 res!485624) b!724143))

(assert (= (and b!724143 res!485630) b!724147))

(assert (= (and b!724147 c!79630) b!724137))

(assert (= (and b!724147 (not c!79630)) b!724145))

(assert (= (and b!724147 res!485627) b!724151))

(assert (= (and b!724151 res!485623) b!724148))

(assert (= (and b!724148 res!485626) b!724140))

(declare-fun m!678521 () Bool)

(assert (=> b!724152 m!678521))

(declare-fun m!678523 () Bool)

(assert (=> b!724137 m!678523))

(assert (=> b!724137 m!678523))

(declare-fun m!678525 () Bool)

(assert (=> b!724137 m!678525))

(declare-fun m!678527 () Bool)

(assert (=> start!64382 m!678527))

(declare-fun m!678529 () Bool)

(assert (=> start!64382 m!678529))

(assert (=> b!724140 m!678523))

(assert (=> b!724140 m!678523))

(declare-fun m!678531 () Bool)

(assert (=> b!724140 m!678531))

(declare-fun m!678533 () Bool)

(assert (=> b!724141 m!678533))

(declare-fun m!678535 () Bool)

(assert (=> b!724150 m!678535))

(declare-fun m!678537 () Bool)

(assert (=> b!724138 m!678537))

(declare-fun m!678539 () Bool)

(assert (=> b!724144 m!678539))

(declare-fun m!678541 () Bool)

(assert (=> b!724148 m!678541))

(declare-fun m!678543 () Bool)

(assert (=> b!724148 m!678543))

(declare-fun m!678545 () Bool)

(assert (=> b!724143 m!678545))

(assert (=> b!724142 m!678523))

(assert (=> b!724142 m!678523))

(declare-fun m!678547 () Bool)

(assert (=> b!724142 m!678547))

(assert (=> b!724149 m!678523))

(assert (=> b!724149 m!678523))

(declare-fun m!678549 () Bool)

(assert (=> b!724149 m!678549))

(assert (=> b!724149 m!678549))

(assert (=> b!724149 m!678523))

(declare-fun m!678551 () Bool)

(assert (=> b!724149 m!678551))

(declare-fun m!678553 () Bool)

(assert (=> b!724151 m!678553))

(declare-fun m!678555 () Bool)

(assert (=> b!724151 m!678555))

(declare-fun m!678557 () Bool)

(assert (=> b!724151 m!678557))

(declare-fun m!678559 () Bool)

(assert (=> b!724151 m!678559))

(assert (=> b!724151 m!678553))

(declare-fun m!678561 () Bool)

(assert (=> b!724151 m!678561))

(assert (=> b!724145 m!678523))

(assert (=> b!724145 m!678523))

(declare-fun m!678563 () Bool)

(assert (=> b!724145 m!678563))

(push 1)

(assert (not b!724140))

(assert (not b!724151))

(assert (not b!724141))

(assert (not b!724148))

(assert (not start!64382))

(assert (not b!724137))

(assert (not b!724149))

(assert (not b!724152))

(assert (not b!724144))

(assert (not b!724145))

(assert (not b!724142))

(assert (not b!724138))

(assert (not b!724150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

