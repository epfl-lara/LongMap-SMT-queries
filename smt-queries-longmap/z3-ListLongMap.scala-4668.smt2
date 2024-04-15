; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64904 () Bool)

(assert start!64904)

(declare-fun b!732503 () Bool)

(declare-fun e!409874 () Bool)

(assert (=> b!732503 (= e!409874 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7330 0))(
  ( (MissingZero!7330 (index!31688 (_ BitVec 32))) (Found!7330 (index!31689 (_ BitVec 32))) (Intermediate!7330 (undefined!8142 Bool) (index!31690 (_ BitVec 32)) (x!62691 (_ BitVec 32))) (Undefined!7330) (MissingVacant!7330 (index!31691 (_ BitVec 32))) )
))
(declare-fun lt!324491 () SeekEntryResult!7330)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41232 0))(
  ( (array!41233 (arr!19733 (Array (_ BitVec 32) (_ BitVec 64))) (size!20154 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41232)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41232 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732503 (= lt!324491 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!732504 () Bool)

(declare-fun e!409870 () Bool)

(declare-fun e!409872 () Bool)

(assert (=> b!732504 (= e!409870 e!409872)))

(declare-fun res!492211 () Bool)

(assert (=> b!732504 (=> (not res!492211) (not e!409872))))

(declare-fun lt!324492 () SeekEntryResult!7330)

(declare-fun lt!324493 () SeekEntryResult!7330)

(assert (=> b!732504 (= res!492211 (= lt!324492 lt!324493))))

(declare-fun lt!324496 () array!41232)

(declare-fun lt!324490 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41232 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732504 (= lt!324493 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324490 lt!324496 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732504 (= lt!324492 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324490 mask!3328) lt!324490 lt!324496 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!732504 (= lt!324490 (select (store (arr!19733 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!732504 (= lt!324496 (array!41233 (store (arr!19733 a!3186) i!1173 k0!2102) (size!20154 a!3186)))))

(declare-fun b!732505 () Bool)

(declare-fun res!492214 () Bool)

(declare-fun e!409873 () Bool)

(assert (=> b!732505 (=> (not res!492214) (not e!409873))))

(declare-datatypes ((List!13774 0))(
  ( (Nil!13771) (Cons!13770 (h!14836 (_ BitVec 64)) (t!20080 List!13774)) )
))
(declare-fun arrayNoDuplicates!0 (array!41232 (_ BitVec 32) List!13774) Bool)

(assert (=> b!732505 (= res!492214 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13771))))

(declare-fun e!409868 () Bool)

(declare-fun b!732506 () Bool)

(declare-fun lt!324495 () SeekEntryResult!7330)

(assert (=> b!732506 (= e!409868 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324495))))

(declare-fun b!732507 () Bool)

(declare-fun e!409876 () Bool)

(assert (=> b!732507 (= e!409872 (not e!409876))))

(declare-fun res!492208 () Bool)

(assert (=> b!732507 (=> res!492208 e!409876)))

(get-info :version)

(assert (=> b!732507 (= res!492208 (or (not ((_ is Intermediate!7330) lt!324493)) (bvsge x!1131 (x!62691 lt!324493))))))

(declare-fun e!409875 () Bool)

(assert (=> b!732507 e!409875))

(declare-fun res!492212 () Bool)

(assert (=> b!732507 (=> (not res!492212) (not e!409875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41232 (_ BitVec 32)) Bool)

(assert (=> b!732507 (= res!492212 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24950 0))(
  ( (Unit!24951) )
))
(declare-fun lt!324488 () Unit!24950)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24950)

(assert (=> b!732507 (= lt!324488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!732508 () Bool)

(declare-fun res!492213 () Bool)

(assert (=> b!732508 (=> (not res!492213) (not e!409870))))

(assert (=> b!732508 (= res!492213 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19733 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732509 () Bool)

(declare-fun e!409871 () Bool)

(assert (=> b!732509 (= e!409875 e!409871)))

(declare-fun res!492204 () Bool)

(assert (=> b!732509 (=> (not res!492204) (not e!409871))))

(declare-fun lt!324497 () SeekEntryResult!7330)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41232 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!732509 (= res!492204 (= (seekEntryOrOpen!0 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324497))))

(assert (=> b!732509 (= lt!324497 (Found!7330 j!159))))

(declare-fun b!732510 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732510 (= e!409871 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324497))))

(declare-fun b!732511 () Bool)

(declare-fun e!409869 () Bool)

(assert (=> b!732511 (= e!409869 e!409873)))

(declare-fun res!492207 () Bool)

(assert (=> b!732511 (=> (not res!492207) (not e!409873))))

(declare-fun lt!324489 () SeekEntryResult!7330)

(assert (=> b!732511 (= res!492207 (or (= lt!324489 (MissingZero!7330 i!1173)) (= lt!324489 (MissingVacant!7330 i!1173))))))

(assert (=> b!732511 (= lt!324489 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!732512 () Bool)

(declare-fun res!492215 () Bool)

(assert (=> b!732512 (=> (not res!492215) (not e!409869))))

(assert (=> b!732512 (= res!492215 (and (= (size!20154 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20154 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20154 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732513 () Bool)

(assert (=> b!732513 (= e!409876 e!409874)))

(declare-fun res!492201 () Bool)

(assert (=> b!732513 (=> res!492201 e!409874)))

(assert (=> b!732513 (= res!492201 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324494 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732513 (= lt!324494 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732514 () Bool)

(declare-fun res!492200 () Bool)

(assert (=> b!732514 (=> (not res!492200) (not e!409869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732514 (= res!492200 (validKeyInArray!0 (select (arr!19733 a!3186) j!159)))))

(declare-fun b!732515 () Bool)

(declare-fun res!492203 () Bool)

(assert (=> b!732515 (=> (not res!492203) (not e!409869))))

(assert (=> b!732515 (= res!492203 (validKeyInArray!0 k0!2102))))

(declare-fun b!732516 () Bool)

(declare-fun res!492205 () Bool)

(assert (=> b!732516 (=> (not res!492205) (not e!409873))))

(assert (=> b!732516 (= res!492205 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20154 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20154 a!3186))))))

(declare-fun b!732517 () Bool)

(assert (=> b!732517 (= e!409873 e!409870)))

(declare-fun res!492206 () Bool)

(assert (=> b!732517 (=> (not res!492206) (not e!409870))))

(assert (=> b!732517 (= res!492206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19733 a!3186) j!159) mask!3328) (select (arr!19733 a!3186) j!159) a!3186 mask!3328) lt!324495))))

(assert (=> b!732517 (= lt!324495 (Intermediate!7330 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732518 () Bool)

(declare-fun res!492202 () Bool)

(assert (=> b!732518 (=> (not res!492202) (not e!409870))))

(assert (=> b!732518 (= res!492202 e!409868)))

(declare-fun c!80529 () Bool)

(assert (=> b!732518 (= c!80529 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732519 () Bool)

(declare-fun res!492209 () Bool)

(assert (=> b!732519 (=> (not res!492209) (not e!409869))))

(declare-fun arrayContainsKey!0 (array!41232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732519 (= res!492209 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!492216 () Bool)

(assert (=> start!64904 (=> (not res!492216) (not e!409869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64904 (= res!492216 (validMask!0 mask!3328))))

(assert (=> start!64904 e!409869))

(assert (=> start!64904 true))

(declare-fun array_inv!15616 (array!41232) Bool)

(assert (=> start!64904 (array_inv!15616 a!3186)))

(declare-fun b!732520 () Bool)

(assert (=> b!732520 (= e!409868 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19733 a!3186) j!159) a!3186 mask!3328) (Found!7330 j!159)))))

(declare-fun b!732521 () Bool)

(declare-fun res!492210 () Bool)

(assert (=> b!732521 (=> (not res!492210) (not e!409873))))

(assert (=> b!732521 (= res!492210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64904 res!492216) b!732512))

(assert (= (and b!732512 res!492215) b!732514))

(assert (= (and b!732514 res!492200) b!732515))

(assert (= (and b!732515 res!492203) b!732519))

(assert (= (and b!732519 res!492209) b!732511))

(assert (= (and b!732511 res!492207) b!732521))

(assert (= (and b!732521 res!492210) b!732505))

(assert (= (and b!732505 res!492214) b!732516))

(assert (= (and b!732516 res!492205) b!732517))

(assert (= (and b!732517 res!492206) b!732508))

(assert (= (and b!732508 res!492213) b!732518))

(assert (= (and b!732518 c!80529) b!732506))

(assert (= (and b!732518 (not c!80529)) b!732520))

(assert (= (and b!732518 res!492202) b!732504))

(assert (= (and b!732504 res!492211) b!732507))

(assert (= (and b!732507 res!492212) b!732509))

(assert (= (and b!732509 res!492204) b!732510))

(assert (= (and b!732507 (not res!492208)) b!732513))

(assert (= (and b!732513 (not res!492201)) b!732503))

(declare-fun m!685001 () Bool)

(assert (=> b!732509 m!685001))

(assert (=> b!732509 m!685001))

(declare-fun m!685003 () Bool)

(assert (=> b!732509 m!685003))

(declare-fun m!685005 () Bool)

(assert (=> b!732515 m!685005))

(assert (=> b!732520 m!685001))

(assert (=> b!732520 m!685001))

(declare-fun m!685007 () Bool)

(assert (=> b!732520 m!685007))

(assert (=> b!732503 m!685001))

(assert (=> b!732503 m!685001))

(assert (=> b!732503 m!685007))

(declare-fun m!685009 () Bool)

(assert (=> start!64904 m!685009))

(declare-fun m!685011 () Bool)

(assert (=> start!64904 m!685011))

(declare-fun m!685013 () Bool)

(assert (=> b!732513 m!685013))

(declare-fun m!685015 () Bool)

(assert (=> b!732521 m!685015))

(declare-fun m!685017 () Bool)

(assert (=> b!732508 m!685017))

(assert (=> b!732510 m!685001))

(assert (=> b!732510 m!685001))

(declare-fun m!685019 () Bool)

(assert (=> b!732510 m!685019))

(declare-fun m!685021 () Bool)

(assert (=> b!732507 m!685021))

(declare-fun m!685023 () Bool)

(assert (=> b!732507 m!685023))

(declare-fun m!685025 () Bool)

(assert (=> b!732504 m!685025))

(declare-fun m!685027 () Bool)

(assert (=> b!732504 m!685027))

(declare-fun m!685029 () Bool)

(assert (=> b!732504 m!685029))

(declare-fun m!685031 () Bool)

(assert (=> b!732504 m!685031))

(declare-fun m!685033 () Bool)

(assert (=> b!732504 m!685033))

(assert (=> b!732504 m!685027))

(assert (=> b!732514 m!685001))

(assert (=> b!732514 m!685001))

(declare-fun m!685035 () Bool)

(assert (=> b!732514 m!685035))

(declare-fun m!685037 () Bool)

(assert (=> b!732519 m!685037))

(assert (=> b!732506 m!685001))

(assert (=> b!732506 m!685001))

(declare-fun m!685039 () Bool)

(assert (=> b!732506 m!685039))

(assert (=> b!732517 m!685001))

(assert (=> b!732517 m!685001))

(declare-fun m!685041 () Bool)

(assert (=> b!732517 m!685041))

(assert (=> b!732517 m!685041))

(assert (=> b!732517 m!685001))

(declare-fun m!685043 () Bool)

(assert (=> b!732517 m!685043))

(declare-fun m!685045 () Bool)

(assert (=> b!732511 m!685045))

(declare-fun m!685047 () Bool)

(assert (=> b!732505 m!685047))

(check-sat (not b!732507) (not b!732515) (not b!732511) (not b!732517) (not b!732519) (not b!732520) (not b!732514) (not start!64904) (not b!732506) (not b!732513) (not b!732505) (not b!732509) (not b!732521) (not b!732504) (not b!732510) (not b!732503))
(check-sat)
