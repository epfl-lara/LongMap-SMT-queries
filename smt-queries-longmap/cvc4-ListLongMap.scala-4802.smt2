; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65876 () Bool)

(assert start!65876)

(declare-fun b!759452 () Bool)

(declare-fun res!513957 () Bool)

(declare-fun e!423370 () Bool)

(assert (=> b!759452 (=> (not res!513957) (not e!423370))))

(declare-datatypes ((array!42049 0))(
  ( (array!42050 (arr!20138 (Array (_ BitVec 32) (_ BitVec 64))) (size!20559 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42049)

(declare-datatypes ((List!14140 0))(
  ( (Nil!14137) (Cons!14136 (h!15208 (_ BitVec 64)) (t!20455 List!14140)) )
))
(declare-fun arrayNoDuplicates!0 (array!42049 (_ BitVec 32) List!14140) Bool)

(assert (=> b!759452 (= res!513957 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14137))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7738 0))(
  ( (MissingZero!7738 (index!33320 (_ BitVec 32))) (Found!7738 (index!33321 (_ BitVec 32))) (Intermediate!7738 (undefined!8550 Bool) (index!33322 (_ BitVec 32)) (x!64200 (_ BitVec 32))) (Undefined!7738) (MissingVacant!7738 (index!33323 (_ BitVec 32))) )
))
(declare-fun lt!338408 () SeekEntryResult!7738)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!759453 () Bool)

(declare-fun e!423367 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7738)

(assert (=> b!759453 (= e!423367 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338408))))

(declare-fun b!759454 () Bool)

(declare-fun res!513964 () Bool)

(assert (=> b!759454 (=> (not res!513964) (not e!423370))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!759454 (= res!513964 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20559 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20559 a!3186))))))

(declare-fun res!513959 () Bool)

(declare-fun e!423373 () Bool)

(assert (=> start!65876 (=> (not res!513959) (not e!423373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65876 (= res!513959 (validMask!0 mask!3328))))

(assert (=> start!65876 e!423373))

(assert (=> start!65876 true))

(declare-fun array_inv!15934 (array!42049) Bool)

(assert (=> start!65876 (array_inv!15934 a!3186)))

(declare-fun b!759455 () Bool)

(declare-fun e!423369 () Bool)

(assert (=> b!759455 (= e!423369 e!423367)))

(declare-fun res!513952 () Bool)

(assert (=> b!759455 (=> (not res!513952) (not e!423367))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7738)

(assert (=> b!759455 (= res!513952 (= (seekEntryOrOpen!0 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338408))))

(assert (=> b!759455 (= lt!338408 (Found!7738 j!159))))

(declare-fun b!759456 () Bool)

(declare-fun res!513955 () Bool)

(declare-fun e!423371 () Bool)

(assert (=> b!759456 (=> (not res!513955) (not e!423371))))

(declare-fun e!423372 () Bool)

(assert (=> b!759456 (= res!513955 e!423372)))

(declare-fun c!83131 () Bool)

(assert (=> b!759456 (= c!83131 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759457 () Bool)

(assert (=> b!759457 (= e!423370 e!423371)))

(declare-fun res!513956 () Bool)

(assert (=> b!759457 (=> (not res!513956) (not e!423371))))

(declare-fun lt!338411 () SeekEntryResult!7738)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42049 (_ BitVec 32)) SeekEntryResult!7738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759457 (= res!513956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20138 a!3186) j!159) mask!3328) (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338411))))

(assert (=> b!759457 (= lt!338411 (Intermediate!7738 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759458 () Bool)

(declare-fun res!513958 () Bool)

(assert (=> b!759458 (=> (not res!513958) (not e!423373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759458 (= res!513958 (validKeyInArray!0 (select (arr!20138 a!3186) j!159)))))

(declare-fun b!759459 () Bool)

(assert (=> b!759459 (= e!423372 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) (Found!7738 j!159)))))

(declare-fun b!759460 () Bool)

(declare-fun res!513962 () Bool)

(assert (=> b!759460 (=> (not res!513962) (not e!423373))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759460 (= res!513962 (and (= (size!20559 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20559 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20559 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759461 () Bool)

(declare-fun e!423374 () Bool)

(assert (=> b!759461 (= e!423371 e!423374)))

(declare-fun res!513954 () Bool)

(assert (=> b!759461 (=> (not res!513954) (not e!423374))))

(declare-fun lt!338407 () array!42049)

(declare-fun lt!338410 () (_ BitVec 64))

(assert (=> b!759461 (= res!513954 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338410 mask!3328) lt!338410 lt!338407 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338410 lt!338407 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!759461 (= lt!338410 (select (store (arr!20138 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759461 (= lt!338407 (array!42050 (store (arr!20138 a!3186) i!1173 k!2102) (size!20559 a!3186)))))

(declare-fun b!759462 () Bool)

(declare-fun res!513963 () Bool)

(assert (=> b!759462 (=> (not res!513963) (not e!423370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42049 (_ BitVec 32)) Bool)

(assert (=> b!759462 (= res!513963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759463 () Bool)

(assert (=> b!759463 (= e!423374 (not true))))

(assert (=> b!759463 e!423369))

(declare-fun res!513961 () Bool)

(assert (=> b!759463 (=> (not res!513961) (not e!423369))))

(assert (=> b!759463 (= res!513961 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26316 0))(
  ( (Unit!26317) )
))
(declare-fun lt!338406 () Unit!26316)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42049 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26316)

(assert (=> b!759463 (= lt!338406 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759464 () Bool)

(declare-fun res!513960 () Bool)

(assert (=> b!759464 (=> (not res!513960) (not e!423373))))

(assert (=> b!759464 (= res!513960 (validKeyInArray!0 k!2102))))

(declare-fun b!759465 () Bool)

(declare-fun res!513965 () Bool)

(assert (=> b!759465 (=> (not res!513965) (not e!423373))))

(declare-fun arrayContainsKey!0 (array!42049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759465 (= res!513965 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759466 () Bool)

(assert (=> b!759466 (= e!423372 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20138 a!3186) j!159) a!3186 mask!3328) lt!338411))))

(declare-fun b!759467 () Bool)

(assert (=> b!759467 (= e!423373 e!423370)))

(declare-fun res!513951 () Bool)

(assert (=> b!759467 (=> (not res!513951) (not e!423370))))

(declare-fun lt!338409 () SeekEntryResult!7738)

(assert (=> b!759467 (= res!513951 (or (= lt!338409 (MissingZero!7738 i!1173)) (= lt!338409 (MissingVacant!7738 i!1173))))))

(assert (=> b!759467 (= lt!338409 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759468 () Bool)

(declare-fun res!513953 () Bool)

(assert (=> b!759468 (=> (not res!513953) (not e!423371))))

(assert (=> b!759468 (= res!513953 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20138 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65876 res!513959) b!759460))

(assert (= (and b!759460 res!513962) b!759458))

(assert (= (and b!759458 res!513958) b!759464))

(assert (= (and b!759464 res!513960) b!759465))

(assert (= (and b!759465 res!513965) b!759467))

(assert (= (and b!759467 res!513951) b!759462))

(assert (= (and b!759462 res!513963) b!759452))

(assert (= (and b!759452 res!513957) b!759454))

(assert (= (and b!759454 res!513964) b!759457))

(assert (= (and b!759457 res!513956) b!759468))

(assert (= (and b!759468 res!513953) b!759456))

(assert (= (and b!759456 c!83131) b!759466))

(assert (= (and b!759456 (not c!83131)) b!759459))

(assert (= (and b!759456 res!513955) b!759461))

(assert (= (and b!759461 res!513954) b!759463))

(assert (= (and b!759463 res!513961) b!759455))

(assert (= (and b!759455 res!513952) b!759453))

(declare-fun m!706809 () Bool)

(assert (=> b!759461 m!706809))

(declare-fun m!706811 () Bool)

(assert (=> b!759461 m!706811))

(declare-fun m!706813 () Bool)

(assert (=> b!759461 m!706813))

(declare-fun m!706815 () Bool)

(assert (=> b!759461 m!706815))

(assert (=> b!759461 m!706809))

(declare-fun m!706817 () Bool)

(assert (=> b!759461 m!706817))

(declare-fun m!706819 () Bool)

(assert (=> b!759458 m!706819))

(assert (=> b!759458 m!706819))

(declare-fun m!706821 () Bool)

(assert (=> b!759458 m!706821))

(assert (=> b!759457 m!706819))

(assert (=> b!759457 m!706819))

(declare-fun m!706823 () Bool)

(assert (=> b!759457 m!706823))

(assert (=> b!759457 m!706823))

(assert (=> b!759457 m!706819))

(declare-fun m!706825 () Bool)

(assert (=> b!759457 m!706825))

(declare-fun m!706827 () Bool)

(assert (=> b!759462 m!706827))

(declare-fun m!706829 () Bool)

(assert (=> start!65876 m!706829))

(declare-fun m!706831 () Bool)

(assert (=> start!65876 m!706831))

(assert (=> b!759459 m!706819))

(assert (=> b!759459 m!706819))

(declare-fun m!706833 () Bool)

(assert (=> b!759459 m!706833))

(declare-fun m!706835 () Bool)

(assert (=> b!759465 m!706835))

(declare-fun m!706837 () Bool)

(assert (=> b!759468 m!706837))

(assert (=> b!759455 m!706819))

(assert (=> b!759455 m!706819))

(declare-fun m!706839 () Bool)

(assert (=> b!759455 m!706839))

(declare-fun m!706841 () Bool)

(assert (=> b!759452 m!706841))

(declare-fun m!706843 () Bool)

(assert (=> b!759467 m!706843))

(declare-fun m!706845 () Bool)

(assert (=> b!759464 m!706845))

(declare-fun m!706847 () Bool)

(assert (=> b!759463 m!706847))

(declare-fun m!706849 () Bool)

(assert (=> b!759463 m!706849))

(assert (=> b!759466 m!706819))

(assert (=> b!759466 m!706819))

(declare-fun m!706851 () Bool)

(assert (=> b!759466 m!706851))

(assert (=> b!759453 m!706819))

(assert (=> b!759453 m!706819))

(declare-fun m!706853 () Bool)

(assert (=> b!759453 m!706853))

(push 1)

(assert (not b!759461))

(assert (not b!759453))

(assert (not b!759464))

(assert (not b!759467))

(assert (not b!759458))

(assert (not b!759452))

(assert (not b!759459))

(assert (not start!65876))

(assert (not b!759465))

(assert (not b!759466))

(assert (not b!759462))

(assert (not b!759457))

(assert (not b!759455))

(assert (not b!759463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

