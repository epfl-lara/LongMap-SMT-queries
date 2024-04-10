; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65392 () Bool)

(assert start!65392)

(declare-fun b!744016 () Bool)

(declare-fun e!415651 () Bool)

(declare-fun e!415649 () Bool)

(assert (=> b!744016 (= e!415651 e!415649)))

(declare-fun res!501058 () Bool)

(assert (=> b!744016 (=> (not res!501058) (not e!415649))))

(declare-datatypes ((SeekEntryResult!7496 0))(
  ( (MissingZero!7496 (index!32352 (_ BitVec 32))) (Found!7496 (index!32353 (_ BitVec 32))) (Intermediate!7496 (undefined!8308 Bool) (index!32354 (_ BitVec 32)) (x!63318 (_ BitVec 32))) (Undefined!7496) (MissingVacant!7496 (index!32355 (_ BitVec 32))) )
))
(declare-fun lt!330507 () SeekEntryResult!7496)

(declare-fun lt!330508 () SeekEntryResult!7496)

(assert (=> b!744016 (= res!501058 (= lt!330507 lt!330508))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330509 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41565 0))(
  ( (array!41566 (arr!19896 (Array (_ BitVec 32) (_ BitVec 64))) (size!20317 (_ BitVec 32))) )
))
(declare-fun lt!330505 () array!41565)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41565 (_ BitVec 32)) SeekEntryResult!7496)

(assert (=> b!744016 (= lt!330508 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330509 lt!330505 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744016 (= lt!330507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330509 mask!3328) lt!330509 lt!330505 mask!3328))))

(declare-fun a!3186 () array!41565)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744016 (= lt!330509 (select (store (arr!19896 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744016 (= lt!330505 (array!41566 (store (arr!19896 a!3186) i!1173 k!2102) (size!20317 a!3186)))))

(declare-fun b!744017 () Bool)

(declare-fun e!415650 () Bool)

(assert (=> b!744017 (= e!415650 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!330506 () SeekEntryResult!7496)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41565 (_ BitVec 32)) SeekEntryResult!7496)

(assert (=> b!744017 (= lt!330506 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19896 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744018 () Bool)

(declare-fun res!501048 () Bool)

(declare-fun e!415648 () Bool)

(assert (=> b!744018 (=> (not res!501048) (not e!415648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41565 (_ BitVec 32)) Bool)

(assert (=> b!744018 (= res!501048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744019 () Bool)

(assert (=> b!744019 (= e!415649 (not e!415650))))

(declare-fun res!501047 () Bool)

(assert (=> b!744019 (=> res!501047 e!415650)))

(assert (=> b!744019 (= res!501047 (or (not (is-Intermediate!7496 lt!330508)) (bvslt x!1131 (x!63318 lt!330508)) (not (= x!1131 (x!63318 lt!330508))) (not (= index!1321 (index!32354 lt!330508)))))))

(declare-fun e!415646 () Bool)

(assert (=> b!744019 e!415646))

(declare-fun res!501057 () Bool)

(assert (=> b!744019 (=> (not res!501057) (not e!415646))))

(assert (=> b!744019 (= res!501057 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25472 0))(
  ( (Unit!25473) )
))
(declare-fun lt!330503 () Unit!25472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25472)

(assert (=> b!744019 (= lt!330503 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744020 () Bool)

(declare-fun res!501054 () Bool)

(declare-fun e!415644 () Bool)

(assert (=> b!744020 (=> (not res!501054) (not e!415644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744020 (= res!501054 (validKeyInArray!0 k!2102))))

(declare-fun res!501062 () Bool)

(assert (=> start!65392 (=> (not res!501062) (not e!415644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65392 (= res!501062 (validMask!0 mask!3328))))

(assert (=> start!65392 e!415644))

(assert (=> start!65392 true))

(declare-fun array_inv!15692 (array!41565) Bool)

(assert (=> start!65392 (array_inv!15692 a!3186)))

(declare-fun b!744021 () Bool)

(assert (=> b!744021 (= e!415648 e!415651)))

(declare-fun res!501055 () Bool)

(assert (=> b!744021 (=> (not res!501055) (not e!415651))))

(declare-fun lt!330504 () SeekEntryResult!7496)

(assert (=> b!744021 (= res!501055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19896 a!3186) j!159) mask!3328) (select (arr!19896 a!3186) j!159) a!3186 mask!3328) lt!330504))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744021 (= lt!330504 (Intermediate!7496 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744022 () Bool)

(declare-fun res!501050 () Bool)

(assert (=> b!744022 (=> (not res!501050) (not e!415651))))

(declare-fun e!415645 () Bool)

(assert (=> b!744022 (= res!501050 e!415645)))

(declare-fun c!81865 () Bool)

(assert (=> b!744022 (= c!81865 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744023 () Bool)

(assert (=> b!744023 (= e!415645 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19896 a!3186) j!159) a!3186 mask!3328) (Found!7496 j!159)))))

(declare-fun b!744024 () Bool)

(declare-fun res!501049 () Bool)

(assert (=> b!744024 (=> (not res!501049) (not e!415644))))

(assert (=> b!744024 (= res!501049 (and (= (size!20317 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20317 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20317 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744025 () Bool)

(declare-fun res!501061 () Bool)

(assert (=> b!744025 (=> (not res!501061) (not e!415644))))

(declare-fun arrayContainsKey!0 (array!41565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744025 (= res!501061 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744026 () Bool)

(declare-fun res!501052 () Bool)

(assert (=> b!744026 (=> (not res!501052) (not e!415648))))

(assert (=> b!744026 (= res!501052 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20317 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20317 a!3186))))))

(declare-fun b!744027 () Bool)

(declare-fun e!415647 () Bool)

(assert (=> b!744027 (= e!415646 e!415647)))

(declare-fun res!501053 () Bool)

(assert (=> b!744027 (=> (not res!501053) (not e!415647))))

(declare-fun lt!330502 () SeekEntryResult!7496)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41565 (_ BitVec 32)) SeekEntryResult!7496)

(assert (=> b!744027 (= res!501053 (= (seekEntryOrOpen!0 (select (arr!19896 a!3186) j!159) a!3186 mask!3328) lt!330502))))

(assert (=> b!744027 (= lt!330502 (Found!7496 j!159))))

(declare-fun b!744028 () Bool)

(declare-fun res!501056 () Bool)

(assert (=> b!744028 (=> (not res!501056) (not e!415644))))

(assert (=> b!744028 (= res!501056 (validKeyInArray!0 (select (arr!19896 a!3186) j!159)))))

(declare-fun b!744029 () Bool)

(assert (=> b!744029 (= e!415644 e!415648)))

(declare-fun res!501060 () Bool)

(assert (=> b!744029 (=> (not res!501060) (not e!415648))))

(declare-fun lt!330501 () SeekEntryResult!7496)

(assert (=> b!744029 (= res!501060 (or (= lt!330501 (MissingZero!7496 i!1173)) (= lt!330501 (MissingVacant!7496 i!1173))))))

(assert (=> b!744029 (= lt!330501 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!744030 () Bool)

(declare-fun res!501051 () Bool)

(assert (=> b!744030 (=> (not res!501051) (not e!415651))))

(assert (=> b!744030 (= res!501051 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19896 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744031 () Bool)

(assert (=> b!744031 (= e!415647 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19896 a!3186) j!159) a!3186 mask!3328) lt!330502))))

(declare-fun b!744032 () Bool)

(assert (=> b!744032 (= e!415645 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19896 a!3186) j!159) a!3186 mask!3328) lt!330504))))

(declare-fun b!744033 () Bool)

(declare-fun res!501059 () Bool)

(assert (=> b!744033 (=> (not res!501059) (not e!415648))))

(declare-datatypes ((List!13898 0))(
  ( (Nil!13895) (Cons!13894 (h!14966 (_ BitVec 64)) (t!20213 List!13898)) )
))
(declare-fun arrayNoDuplicates!0 (array!41565 (_ BitVec 32) List!13898) Bool)

(assert (=> b!744033 (= res!501059 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13895))))

(assert (= (and start!65392 res!501062) b!744024))

(assert (= (and b!744024 res!501049) b!744028))

(assert (= (and b!744028 res!501056) b!744020))

(assert (= (and b!744020 res!501054) b!744025))

(assert (= (and b!744025 res!501061) b!744029))

(assert (= (and b!744029 res!501060) b!744018))

(assert (= (and b!744018 res!501048) b!744033))

(assert (= (and b!744033 res!501059) b!744026))

(assert (= (and b!744026 res!501052) b!744021))

(assert (= (and b!744021 res!501055) b!744030))

(assert (= (and b!744030 res!501051) b!744022))

(assert (= (and b!744022 c!81865) b!744032))

(assert (= (and b!744022 (not c!81865)) b!744023))

(assert (= (and b!744022 res!501050) b!744016))

(assert (= (and b!744016 res!501058) b!744019))

(assert (= (and b!744019 res!501057) b!744027))

(assert (= (and b!744027 res!501053) b!744031))

(assert (= (and b!744019 (not res!501047)) b!744017))

(declare-fun m!694609 () Bool)

(assert (=> b!744025 m!694609))

(declare-fun m!694611 () Bool)

(assert (=> b!744021 m!694611))

(assert (=> b!744021 m!694611))

(declare-fun m!694613 () Bool)

(assert (=> b!744021 m!694613))

(assert (=> b!744021 m!694613))

(assert (=> b!744021 m!694611))

(declare-fun m!694615 () Bool)

(assert (=> b!744021 m!694615))

(assert (=> b!744023 m!694611))

(assert (=> b!744023 m!694611))

(declare-fun m!694617 () Bool)

(assert (=> b!744023 m!694617))

(assert (=> b!744032 m!694611))

(assert (=> b!744032 m!694611))

(declare-fun m!694619 () Bool)

(assert (=> b!744032 m!694619))

(declare-fun m!694621 () Bool)

(assert (=> b!744018 m!694621))

(assert (=> b!744017 m!694611))

(assert (=> b!744017 m!694611))

(assert (=> b!744017 m!694617))

(declare-fun m!694623 () Bool)

(assert (=> start!65392 m!694623))

(declare-fun m!694625 () Bool)

(assert (=> start!65392 m!694625))

(declare-fun m!694627 () Bool)

(assert (=> b!744019 m!694627))

(declare-fun m!694629 () Bool)

(assert (=> b!744019 m!694629))

(declare-fun m!694631 () Bool)

(assert (=> b!744029 m!694631))

(declare-fun m!694633 () Bool)

(assert (=> b!744033 m!694633))

(declare-fun m!694635 () Bool)

(assert (=> b!744020 m!694635))

(declare-fun m!694637 () Bool)

(assert (=> b!744030 m!694637))

(assert (=> b!744031 m!694611))

(assert (=> b!744031 m!694611))

(declare-fun m!694639 () Bool)

(assert (=> b!744031 m!694639))

(assert (=> b!744028 m!694611))

(assert (=> b!744028 m!694611))

(declare-fun m!694641 () Bool)

(assert (=> b!744028 m!694641))

(assert (=> b!744027 m!694611))

(assert (=> b!744027 m!694611))

(declare-fun m!694643 () Bool)

(assert (=> b!744027 m!694643))

(declare-fun m!694645 () Bool)

(assert (=> b!744016 m!694645))

(declare-fun m!694647 () Bool)

(assert (=> b!744016 m!694647))

(declare-fun m!694649 () Bool)

(assert (=> b!744016 m!694649))

(declare-fun m!694651 () Bool)

(assert (=> b!744016 m!694651))

(assert (=> b!744016 m!694649))

(declare-fun m!694653 () Bool)

(assert (=> b!744016 m!694653))

(push 1)

