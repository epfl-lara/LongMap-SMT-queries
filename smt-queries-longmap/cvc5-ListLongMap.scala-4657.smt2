; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64714 () Bool)

(assert start!64714)

(declare-fun b!730036 () Bool)

(declare-fun res!490374 () Bool)

(declare-fun e!408563 () Bool)

(assert (=> b!730036 (=> (not res!490374) (not e!408563))))

(declare-datatypes ((array!41163 0))(
  ( (array!41164 (arr!19701 (Array (_ BitVec 32) (_ BitVec 64))) (size!20122 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41163)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41163 (_ BitVec 32)) Bool)

(assert (=> b!730036 (= res!490374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730037 () Bool)

(declare-fun res!490388 () Bool)

(declare-fun e!408564 () Bool)

(assert (=> b!730037 (=> (not res!490388) (not e!408564))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730037 (= res!490388 (validKeyInArray!0 k!2102))))

(declare-fun b!730038 () Bool)

(declare-fun e!408561 () Bool)

(assert (=> b!730038 (= e!408561 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730038 (= lt!323463 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730039 () Bool)

(assert (=> b!730039 (= e!408564 e!408563)))

(declare-fun res!490373 () Bool)

(assert (=> b!730039 (=> (not res!490373) (not e!408563))))

(declare-datatypes ((SeekEntryResult!7301 0))(
  ( (MissingZero!7301 (index!31572 (_ BitVec 32))) (Found!7301 (index!31573 (_ BitVec 32))) (Intermediate!7301 (undefined!8113 Bool) (index!31574 (_ BitVec 32)) (x!62555 (_ BitVec 32))) (Undefined!7301) (MissingVacant!7301 (index!31575 (_ BitVec 32))) )
))
(declare-fun lt!323468 () SeekEntryResult!7301)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730039 (= res!490373 (or (= lt!323468 (MissingZero!7301 i!1173)) (= lt!323468 (MissingVacant!7301 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41163 (_ BitVec 32)) SeekEntryResult!7301)

(assert (=> b!730039 (= lt!323468 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730041 () Bool)

(declare-fun lt!323465 () SeekEntryResult!7301)

(declare-fun e!408562 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41163 (_ BitVec 32)) SeekEntryResult!7301)

(assert (=> b!730041 (= e!408562 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19701 a!3186) j!159) a!3186 mask!3328) lt!323465))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!730042 () Bool)

(declare-fun lt!323460 () SeekEntryResult!7301)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408568 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41163 (_ BitVec 32)) SeekEntryResult!7301)

(assert (=> b!730042 (= e!408568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19701 a!3186) j!159) a!3186 mask!3328) lt!323460))))

(declare-fun b!730043 () Bool)

(declare-fun res!490376 () Bool)

(declare-fun e!408566 () Bool)

(assert (=> b!730043 (=> (not res!490376) (not e!408566))))

(assert (=> b!730043 (= res!490376 e!408562)))

(declare-fun c!80206 () Bool)

(assert (=> b!730043 (= c!80206 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730044 () Bool)

(declare-fun res!490383 () Bool)

(assert (=> b!730044 (=> (not res!490383) (not e!408563))))

(declare-datatypes ((List!13703 0))(
  ( (Nil!13700) (Cons!13699 (h!14759 (_ BitVec 64)) (t!20018 List!13703)) )
))
(declare-fun arrayNoDuplicates!0 (array!41163 (_ BitVec 32) List!13703) Bool)

(assert (=> b!730044 (= res!490383 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13700))))

(declare-fun b!730045 () Bool)

(assert (=> b!730045 (= e!408562 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19701 a!3186) j!159) a!3186 mask!3328) (Found!7301 j!159)))))

(declare-fun b!730046 () Bool)

(declare-fun e!408569 () Bool)

(assert (=> b!730046 (= e!408569 (not e!408561))))

(declare-fun res!490384 () Bool)

(assert (=> b!730046 (=> res!490384 e!408561)))

(declare-fun lt!323467 () SeekEntryResult!7301)

(assert (=> b!730046 (= res!490384 (or (not (is-Intermediate!7301 lt!323467)) (bvsge x!1131 (x!62555 lt!323467))))))

(declare-fun e!408567 () Bool)

(assert (=> b!730046 e!408567))

(declare-fun res!490387 () Bool)

(assert (=> b!730046 (=> (not res!490387) (not e!408567))))

(assert (=> b!730046 (= res!490387 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24920 0))(
  ( (Unit!24921) )
))
(declare-fun lt!323466 () Unit!24920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41163 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24920)

(assert (=> b!730046 (= lt!323466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730047 () Bool)

(declare-fun res!490375 () Bool)

(assert (=> b!730047 (=> (not res!490375) (not e!408563))))

(assert (=> b!730047 (= res!490375 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20122 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20122 a!3186))))))

(declare-fun b!730048 () Bool)

(declare-fun res!490382 () Bool)

(assert (=> b!730048 (=> (not res!490382) (not e!408564))))

(assert (=> b!730048 (= res!490382 (and (= (size!20122 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20122 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20122 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730049 () Bool)

(declare-fun res!490379 () Bool)

(assert (=> b!730049 (=> (not res!490379) (not e!408564))))

(declare-fun arrayContainsKey!0 (array!41163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730049 (= res!490379 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!490381 () Bool)

(assert (=> start!64714 (=> (not res!490381) (not e!408564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64714 (= res!490381 (validMask!0 mask!3328))))

(assert (=> start!64714 e!408564))

(assert (=> start!64714 true))

(declare-fun array_inv!15497 (array!41163) Bool)

(assert (=> start!64714 (array_inv!15497 a!3186)))

(declare-fun b!730040 () Bool)

(declare-fun res!490378 () Bool)

(assert (=> b!730040 (=> (not res!490378) (not e!408566))))

(assert (=> b!730040 (= res!490378 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19701 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730050 () Bool)

(declare-fun res!490385 () Bool)

(assert (=> b!730050 (=> (not res!490385) (not e!408564))))

(assert (=> b!730050 (= res!490385 (validKeyInArray!0 (select (arr!19701 a!3186) j!159)))))

(declare-fun b!730051 () Bool)

(assert (=> b!730051 (= e!408567 e!408568)))

(declare-fun res!490380 () Bool)

(assert (=> b!730051 (=> (not res!490380) (not e!408568))))

(assert (=> b!730051 (= res!490380 (= (seekEntryOrOpen!0 (select (arr!19701 a!3186) j!159) a!3186 mask!3328) lt!323460))))

(assert (=> b!730051 (= lt!323460 (Found!7301 j!159))))

(declare-fun b!730052 () Bool)

(assert (=> b!730052 (= e!408566 e!408569)))

(declare-fun res!490377 () Bool)

(assert (=> b!730052 (=> (not res!490377) (not e!408569))))

(declare-fun lt!323461 () SeekEntryResult!7301)

(assert (=> b!730052 (= res!490377 (= lt!323461 lt!323467))))

(declare-fun lt!323462 () (_ BitVec 64))

(declare-fun lt!323464 () array!41163)

(assert (=> b!730052 (= lt!323467 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323462 lt!323464 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730052 (= lt!323461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323462 mask!3328) lt!323462 lt!323464 mask!3328))))

(assert (=> b!730052 (= lt!323462 (select (store (arr!19701 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730052 (= lt!323464 (array!41164 (store (arr!19701 a!3186) i!1173 k!2102) (size!20122 a!3186)))))

(declare-fun b!730053 () Bool)

(assert (=> b!730053 (= e!408563 e!408566)))

(declare-fun res!490386 () Bool)

(assert (=> b!730053 (=> (not res!490386) (not e!408566))))

(assert (=> b!730053 (= res!490386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19701 a!3186) j!159) mask!3328) (select (arr!19701 a!3186) j!159) a!3186 mask!3328) lt!323465))))

(assert (=> b!730053 (= lt!323465 (Intermediate!7301 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64714 res!490381) b!730048))

(assert (= (and b!730048 res!490382) b!730050))

(assert (= (and b!730050 res!490385) b!730037))

(assert (= (and b!730037 res!490388) b!730049))

(assert (= (and b!730049 res!490379) b!730039))

(assert (= (and b!730039 res!490373) b!730036))

(assert (= (and b!730036 res!490374) b!730044))

(assert (= (and b!730044 res!490383) b!730047))

(assert (= (and b!730047 res!490375) b!730053))

(assert (= (and b!730053 res!490386) b!730040))

(assert (= (and b!730040 res!490378) b!730043))

(assert (= (and b!730043 c!80206) b!730041))

(assert (= (and b!730043 (not c!80206)) b!730045))

(assert (= (and b!730043 res!490376) b!730052))

(assert (= (and b!730052 res!490377) b!730046))

(assert (= (and b!730046 res!490387) b!730051))

(assert (= (and b!730051 res!490380) b!730042))

(assert (= (and b!730046 (not res!490384)) b!730038))

(declare-fun m!683611 () Bool)

(assert (=> b!730052 m!683611))

(declare-fun m!683613 () Bool)

(assert (=> b!730052 m!683613))

(declare-fun m!683615 () Bool)

(assert (=> b!730052 m!683615))

(declare-fun m!683617 () Bool)

(assert (=> b!730052 m!683617))

(assert (=> b!730052 m!683611))

(declare-fun m!683619 () Bool)

(assert (=> b!730052 m!683619))

(declare-fun m!683621 () Bool)

(assert (=> b!730049 m!683621))

(declare-fun m!683623 () Bool)

(assert (=> b!730045 m!683623))

(assert (=> b!730045 m!683623))

(declare-fun m!683625 () Bool)

(assert (=> b!730045 m!683625))

(assert (=> b!730051 m!683623))

(assert (=> b!730051 m!683623))

(declare-fun m!683627 () Bool)

(assert (=> b!730051 m!683627))

(declare-fun m!683629 () Bool)

(assert (=> b!730040 m!683629))

(declare-fun m!683631 () Bool)

(assert (=> b!730044 m!683631))

(assert (=> b!730053 m!683623))

(assert (=> b!730053 m!683623))

(declare-fun m!683633 () Bool)

(assert (=> b!730053 m!683633))

(assert (=> b!730053 m!683633))

(assert (=> b!730053 m!683623))

(declare-fun m!683635 () Bool)

(assert (=> b!730053 m!683635))

(declare-fun m!683637 () Bool)

(assert (=> b!730037 m!683637))

(assert (=> b!730050 m!683623))

(assert (=> b!730050 m!683623))

(declare-fun m!683639 () Bool)

(assert (=> b!730050 m!683639))

(declare-fun m!683641 () Bool)

(assert (=> b!730046 m!683641))

(declare-fun m!683643 () Bool)

(assert (=> b!730046 m!683643))

(assert (=> b!730041 m!683623))

(assert (=> b!730041 m!683623))

(declare-fun m!683645 () Bool)

(assert (=> b!730041 m!683645))

(declare-fun m!683647 () Bool)

(assert (=> b!730038 m!683647))

(declare-fun m!683649 () Bool)

(assert (=> b!730039 m!683649))

(assert (=> b!730042 m!683623))

(assert (=> b!730042 m!683623))

(declare-fun m!683651 () Bool)

(assert (=> b!730042 m!683651))

(declare-fun m!683653 () Bool)

(assert (=> start!64714 m!683653))

(declare-fun m!683655 () Bool)

(assert (=> start!64714 m!683655))

(declare-fun m!683657 () Bool)

(assert (=> b!730036 m!683657))

(push 1)

