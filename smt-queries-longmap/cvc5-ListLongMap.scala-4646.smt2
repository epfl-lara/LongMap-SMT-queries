; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64648 () Bool)

(assert start!64648)

(declare-fun b!728254 () Bool)

(declare-fun res!488802 () Bool)

(declare-fun e!407670 () Bool)

(assert (=> b!728254 (=> (not res!488802) (not e!407670))))

(declare-datatypes ((array!41097 0))(
  ( (array!41098 (arr!19668 (Array (_ BitVec 32) (_ BitVec 64))) (size!20089 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41097)

(declare-datatypes ((List!13670 0))(
  ( (Nil!13667) (Cons!13666 (h!14726 (_ BitVec 64)) (t!19985 List!13670)) )
))
(declare-fun arrayNoDuplicates!0 (array!41097 (_ BitVec 32) List!13670) Bool)

(assert (=> b!728254 (= res!488802 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13667))))

(declare-fun b!728255 () Bool)

(declare-fun e!407671 () Bool)

(declare-fun e!407676 () Bool)

(assert (=> b!728255 (= e!407671 e!407676)))

(declare-fun res!488798 () Bool)

(assert (=> b!728255 (=> (not res!488798) (not e!407676))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7268 0))(
  ( (MissingZero!7268 (index!31440 (_ BitVec 32))) (Found!7268 (index!31441 (_ BitVec 32))) (Intermediate!7268 (undefined!8080 Bool) (index!31442 (_ BitVec 32)) (x!62434 (_ BitVec 32))) (Undefined!7268) (MissingVacant!7268 (index!31443 (_ BitVec 32))) )
))
(declare-fun lt!322571 () SeekEntryResult!7268)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41097 (_ BitVec 32)) SeekEntryResult!7268)

(assert (=> b!728255 (= res!488798 (= (seekEntryOrOpen!0 (select (arr!19668 a!3186) j!159) a!3186 mask!3328) lt!322571))))

(assert (=> b!728255 (= lt!322571 (Found!7268 j!159))))

(declare-fun b!728257 () Bool)

(declare-fun res!488795 () Bool)

(declare-fun e!407674 () Bool)

(assert (=> b!728257 (=> (not res!488795) (not e!407674))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728257 (= res!488795 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19668 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728258 () Bool)

(declare-fun e!407677 () Bool)

(declare-fun e!407678 () Bool)

(assert (=> b!728258 (= e!407677 (not e!407678))))

(declare-fun res!488793 () Bool)

(assert (=> b!728258 (=> res!488793 e!407678)))

(declare-fun lt!322572 () SeekEntryResult!7268)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!728258 (= res!488793 (or (not (is-Intermediate!7268 lt!322572)) (bvsge x!1131 (x!62434 lt!322572))))))

(assert (=> b!728258 e!407671))

(declare-fun res!488797 () Bool)

(assert (=> b!728258 (=> (not res!488797) (not e!407671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41097 (_ BitVec 32)) Bool)

(assert (=> b!728258 (= res!488797 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24854 0))(
  ( (Unit!24855) )
))
(declare-fun lt!322573 () Unit!24854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24854)

(assert (=> b!728258 (= lt!322573 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728259 () Bool)

(declare-fun res!488794 () Bool)

(declare-fun e!407675 () Bool)

(assert (=> b!728259 (=> (not res!488794) (not e!407675))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728259 (= res!488794 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!407673 () Bool)

(declare-fun b!728260 () Bool)

(declare-fun lt!322570 () SeekEntryResult!7268)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41097 (_ BitVec 32)) SeekEntryResult!7268)

(assert (=> b!728260 (= e!407673 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19668 a!3186) j!159) a!3186 mask!3328) lt!322570))))

(declare-fun b!728261 () Bool)

(assert (=> b!728261 (= e!407678 true)))

(declare-fun lt!322574 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728261 (= lt!322574 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728262 () Bool)

(declare-fun res!488791 () Bool)

(assert (=> b!728262 (=> (not res!488791) (not e!407675))))

(assert (=> b!728262 (= res!488791 (and (= (size!20089 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20089 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20089 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728263 () Bool)

(declare-fun res!488790 () Bool)

(assert (=> b!728263 (=> (not res!488790) (not e!407670))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728263 (= res!488790 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20089 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20089 a!3186))))))

(declare-fun b!728264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41097 (_ BitVec 32)) SeekEntryResult!7268)

(assert (=> b!728264 (= e!407676 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19668 a!3186) j!159) a!3186 mask!3328) lt!322571))))

(declare-fun b!728265 () Bool)

(declare-fun res!488804 () Bool)

(assert (=> b!728265 (=> (not res!488804) (not e!407674))))

(assert (=> b!728265 (= res!488804 e!407673)))

(declare-fun c!80107 () Bool)

(assert (=> b!728265 (= c!80107 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728256 () Bool)

(assert (=> b!728256 (= e!407674 e!407677)))

(declare-fun res!488800 () Bool)

(assert (=> b!728256 (=> (not res!488800) (not e!407677))))

(declare-fun lt!322576 () SeekEntryResult!7268)

(assert (=> b!728256 (= res!488800 (= lt!322576 lt!322572))))

(declare-fun lt!322575 () (_ BitVec 64))

(declare-fun lt!322569 () array!41097)

(assert (=> b!728256 (= lt!322572 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322575 lt!322569 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728256 (= lt!322576 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322575 mask!3328) lt!322575 lt!322569 mask!3328))))

(assert (=> b!728256 (= lt!322575 (select (store (arr!19668 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!728256 (= lt!322569 (array!41098 (store (arr!19668 a!3186) i!1173 k!2102) (size!20089 a!3186)))))

(declare-fun res!488796 () Bool)

(assert (=> start!64648 (=> (not res!488796) (not e!407675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64648 (= res!488796 (validMask!0 mask!3328))))

(assert (=> start!64648 e!407675))

(assert (=> start!64648 true))

(declare-fun array_inv!15464 (array!41097) Bool)

(assert (=> start!64648 (array_inv!15464 a!3186)))

(declare-fun b!728266 () Bool)

(declare-fun res!488789 () Bool)

(assert (=> b!728266 (=> (not res!488789) (not e!407670))))

(assert (=> b!728266 (= res!488789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728267 () Bool)

(assert (=> b!728267 (= e!407673 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19668 a!3186) j!159) a!3186 mask!3328) (Found!7268 j!159)))))

(declare-fun b!728268 () Bool)

(declare-fun res!488803 () Bool)

(assert (=> b!728268 (=> (not res!488803) (not e!407675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728268 (= res!488803 (validKeyInArray!0 k!2102))))

(declare-fun b!728269 () Bool)

(assert (=> b!728269 (= e!407675 e!407670)))

(declare-fun res!488799 () Bool)

(assert (=> b!728269 (=> (not res!488799) (not e!407670))))

(declare-fun lt!322577 () SeekEntryResult!7268)

(assert (=> b!728269 (= res!488799 (or (= lt!322577 (MissingZero!7268 i!1173)) (= lt!322577 (MissingVacant!7268 i!1173))))))

(assert (=> b!728269 (= lt!322577 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!728270 () Bool)

(assert (=> b!728270 (= e!407670 e!407674)))

(declare-fun res!488792 () Bool)

(assert (=> b!728270 (=> (not res!488792) (not e!407674))))

(assert (=> b!728270 (= res!488792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19668 a!3186) j!159) mask!3328) (select (arr!19668 a!3186) j!159) a!3186 mask!3328) lt!322570))))

(assert (=> b!728270 (= lt!322570 (Intermediate!7268 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728271 () Bool)

(declare-fun res!488801 () Bool)

(assert (=> b!728271 (=> (not res!488801) (not e!407675))))

(assert (=> b!728271 (= res!488801 (validKeyInArray!0 (select (arr!19668 a!3186) j!159)))))

(assert (= (and start!64648 res!488796) b!728262))

(assert (= (and b!728262 res!488791) b!728271))

(assert (= (and b!728271 res!488801) b!728268))

(assert (= (and b!728268 res!488803) b!728259))

(assert (= (and b!728259 res!488794) b!728269))

(assert (= (and b!728269 res!488799) b!728266))

(assert (= (and b!728266 res!488789) b!728254))

(assert (= (and b!728254 res!488802) b!728263))

(assert (= (and b!728263 res!488790) b!728270))

(assert (= (and b!728270 res!488792) b!728257))

(assert (= (and b!728257 res!488795) b!728265))

(assert (= (and b!728265 c!80107) b!728260))

(assert (= (and b!728265 (not c!80107)) b!728267))

(assert (= (and b!728265 res!488804) b!728256))

(assert (= (and b!728256 res!488800) b!728258))

(assert (= (and b!728258 res!488797) b!728255))

(assert (= (and b!728255 res!488798) b!728264))

(assert (= (and b!728258 (not res!488793)) b!728261))

(declare-fun m!682027 () Bool)

(assert (=> b!728257 m!682027))

(declare-fun m!682029 () Bool)

(assert (=> b!728254 m!682029))

(declare-fun m!682031 () Bool)

(assert (=> b!728260 m!682031))

(assert (=> b!728260 m!682031))

(declare-fun m!682033 () Bool)

(assert (=> b!728260 m!682033))

(declare-fun m!682035 () Bool)

(assert (=> b!728258 m!682035))

(declare-fun m!682037 () Bool)

(assert (=> b!728258 m!682037))

(declare-fun m!682039 () Bool)

(assert (=> start!64648 m!682039))

(declare-fun m!682041 () Bool)

(assert (=> start!64648 m!682041))

(assert (=> b!728270 m!682031))

(assert (=> b!728270 m!682031))

(declare-fun m!682043 () Bool)

(assert (=> b!728270 m!682043))

(assert (=> b!728270 m!682043))

(assert (=> b!728270 m!682031))

(declare-fun m!682045 () Bool)

(assert (=> b!728270 m!682045))

(declare-fun m!682047 () Bool)

(assert (=> b!728261 m!682047))

(declare-fun m!682049 () Bool)

(assert (=> b!728269 m!682049))

(assert (=> b!728264 m!682031))

(assert (=> b!728264 m!682031))

(declare-fun m!682051 () Bool)

(assert (=> b!728264 m!682051))

(declare-fun m!682053 () Bool)

(assert (=> b!728268 m!682053))

(declare-fun m!682055 () Bool)

(assert (=> b!728256 m!682055))

(declare-fun m!682057 () Bool)

(assert (=> b!728256 m!682057))

(declare-fun m!682059 () Bool)

(assert (=> b!728256 m!682059))

(declare-fun m!682061 () Bool)

(assert (=> b!728256 m!682061))

(declare-fun m!682063 () Bool)

(assert (=> b!728256 m!682063))

(assert (=> b!728256 m!682061))

(declare-fun m!682065 () Bool)

(assert (=> b!728266 m!682065))

(assert (=> b!728267 m!682031))

(assert (=> b!728267 m!682031))

(declare-fun m!682067 () Bool)

(assert (=> b!728267 m!682067))

(assert (=> b!728271 m!682031))

(assert (=> b!728271 m!682031))

(declare-fun m!682069 () Bool)

(assert (=> b!728271 m!682069))

(assert (=> b!728255 m!682031))

(assert (=> b!728255 m!682031))

(declare-fun m!682071 () Bool)

(assert (=> b!728255 m!682071))

(declare-fun m!682073 () Bool)

(assert (=> b!728259 m!682073))

(push 1)

