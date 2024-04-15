; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65276 () Bool)

(assert start!65276)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41466 0))(
  ( (array!41467 (arr!19847 (Array (_ BitVec 32) (_ BitVec 64))) (size!20268 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41466)

(declare-fun b!741091 () Bool)

(declare-fun e!414248 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7444 0))(
  ( (MissingZero!7444 (index!32144 (_ BitVec 32))) (Found!7444 (index!32145 (_ BitVec 32))) (Intermediate!7444 (undefined!8256 Bool) (index!32146 (_ BitVec 32)) (x!63133 (_ BitVec 32))) (Undefined!7444) (MissingVacant!7444 (index!32147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41466 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!741091 (= e!414248 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) (Found!7444 j!159)))))

(declare-fun b!741092 () Bool)

(declare-fun e!414249 () Bool)

(declare-fun e!414247 () Bool)

(assert (=> b!741092 (= e!414249 e!414247)))

(declare-fun res!498554 () Bool)

(assert (=> b!741092 (=> (not res!498554) (not e!414247))))

(declare-fun lt!329131 () array!41466)

(declare-fun lt!329130 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41466 (_ BitVec 32)) SeekEntryResult!7444)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741092 (= res!498554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329130 mask!3328) lt!329130 lt!329131 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329130 lt!329131 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!741092 (= lt!329130 (select (store (arr!19847 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741092 (= lt!329131 (array!41467 (store (arr!19847 a!3186) i!1173 k0!2102) (size!20268 a!3186)))))

(declare-fun lt!329135 () SeekEntryResult!7444)

(declare-fun b!741093 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!414251 () Bool)

(assert (=> b!741093 (= e!414251 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329135))))

(declare-fun b!741094 () Bool)

(declare-fun res!498557 () Bool)

(declare-fun e!414253 () Bool)

(assert (=> b!741094 (=> (not res!498557) (not e!414253))))

(declare-datatypes ((List!13888 0))(
  ( (Nil!13885) (Cons!13884 (h!14956 (_ BitVec 64)) (t!20194 List!13888)) )
))
(declare-fun arrayNoDuplicates!0 (array!41466 (_ BitVec 32) List!13888) Bool)

(assert (=> b!741094 (= res!498557 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13885))))

(declare-fun res!498553 () Bool)

(declare-fun e!414250 () Bool)

(assert (=> start!65276 (=> (not res!498553) (not e!414250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65276 (= res!498553 (validMask!0 mask!3328))))

(assert (=> start!65276 e!414250))

(assert (=> start!65276 true))

(declare-fun array_inv!15730 (array!41466) Bool)

(assert (=> start!65276 (array_inv!15730 a!3186)))

(declare-fun b!741095 () Bool)

(declare-fun res!498559 () Bool)

(assert (=> b!741095 (=> (not res!498559) (not e!414250))))

(declare-fun arrayContainsKey!0 (array!41466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741095 (= res!498559 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741096 () Bool)

(declare-fun res!498561 () Bool)

(assert (=> b!741096 (=> (not res!498561) (not e!414253))))

(assert (=> b!741096 (= res!498561 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20268 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20268 a!3186))))))

(declare-fun b!741097 () Bool)

(assert (=> b!741097 (= e!414253 e!414249)))

(declare-fun res!498550 () Bool)

(assert (=> b!741097 (=> (not res!498550) (not e!414249))))

(declare-fun lt!329133 () SeekEntryResult!7444)

(assert (=> b!741097 (= res!498550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19847 a!3186) j!159) mask!3328) (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329133))))

(assert (=> b!741097 (= lt!329133 (Intermediate!7444 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741098 () Bool)

(declare-fun res!498552 () Bool)

(assert (=> b!741098 (=> (not res!498552) (not e!414250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741098 (= res!498552 (validKeyInArray!0 (select (arr!19847 a!3186) j!159)))))

(declare-fun b!741099 () Bool)

(assert (=> b!741099 (= e!414250 e!414253)))

(declare-fun res!498555 () Bool)

(assert (=> b!741099 (=> (not res!498555) (not e!414253))))

(declare-fun lt!329134 () SeekEntryResult!7444)

(assert (=> b!741099 (= res!498555 (or (= lt!329134 (MissingZero!7444 i!1173)) (= lt!329134 (MissingVacant!7444 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41466 (_ BitVec 32)) SeekEntryResult!7444)

(assert (=> b!741099 (= lt!329134 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741100 () Bool)

(declare-fun e!414252 () Bool)

(assert (=> b!741100 (= e!414252 e!414251)))

(declare-fun res!498562 () Bool)

(assert (=> b!741100 (=> (not res!498562) (not e!414251))))

(assert (=> b!741100 (= res!498562 (= (seekEntryOrOpen!0 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329135))))

(assert (=> b!741100 (= lt!329135 (Found!7444 j!159))))

(declare-fun b!741101 () Bool)

(declare-fun res!498556 () Bool)

(assert (=> b!741101 (=> (not res!498556) (not e!414249))))

(assert (=> b!741101 (= res!498556 e!414248)))

(declare-fun c!81651 () Bool)

(assert (=> b!741101 (= c!81651 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741102 () Bool)

(declare-fun res!498558 () Bool)

(assert (=> b!741102 (=> (not res!498558) (not e!414249))))

(assert (=> b!741102 (= res!498558 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19847 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741103 () Bool)

(declare-fun res!498551 () Bool)

(assert (=> b!741103 (=> (not res!498551) (not e!414250))))

(assert (=> b!741103 (= res!498551 (validKeyInArray!0 k0!2102))))

(declare-fun b!741104 () Bool)

(assert (=> b!741104 (= e!414248 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19847 a!3186) j!159) a!3186 mask!3328) lt!329133))))

(declare-fun b!741105 () Bool)

(declare-fun res!498564 () Bool)

(assert (=> b!741105 (=> (not res!498564) (not e!414250))))

(assert (=> b!741105 (= res!498564 (and (= (size!20268 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20268 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20268 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741106 () Bool)

(declare-fun res!498560 () Bool)

(assert (=> b!741106 (=> (not res!498560) (not e!414253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41466 (_ BitVec 32)) Bool)

(assert (=> b!741106 (= res!498560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741107 () Bool)

(assert (=> b!741107 (= e!414247 (not true))))

(assert (=> b!741107 e!414252))

(declare-fun res!498563 () Bool)

(assert (=> b!741107 (=> (not res!498563) (not e!414252))))

(assert (=> b!741107 (= res!498563 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25340 0))(
  ( (Unit!25341) )
))
(declare-fun lt!329132 () Unit!25340)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25340)

(assert (=> b!741107 (= lt!329132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65276 res!498553) b!741105))

(assert (= (and b!741105 res!498564) b!741098))

(assert (= (and b!741098 res!498552) b!741103))

(assert (= (and b!741103 res!498551) b!741095))

(assert (= (and b!741095 res!498559) b!741099))

(assert (= (and b!741099 res!498555) b!741106))

(assert (= (and b!741106 res!498560) b!741094))

(assert (= (and b!741094 res!498557) b!741096))

(assert (= (and b!741096 res!498561) b!741097))

(assert (= (and b!741097 res!498550) b!741102))

(assert (= (and b!741102 res!498558) b!741101))

(assert (= (and b!741101 c!81651) b!741104))

(assert (= (and b!741101 (not c!81651)) b!741091))

(assert (= (and b!741101 res!498556) b!741092))

(assert (= (and b!741092 res!498554) b!741107))

(assert (= (and b!741107 res!498563) b!741100))

(assert (= (and b!741100 res!498562) b!741093))

(declare-fun m!691565 () Bool)

(assert (=> b!741097 m!691565))

(assert (=> b!741097 m!691565))

(declare-fun m!691567 () Bool)

(assert (=> b!741097 m!691567))

(assert (=> b!741097 m!691567))

(assert (=> b!741097 m!691565))

(declare-fun m!691569 () Bool)

(assert (=> b!741097 m!691569))

(declare-fun m!691571 () Bool)

(assert (=> start!65276 m!691571))

(declare-fun m!691573 () Bool)

(assert (=> start!65276 m!691573))

(assert (=> b!741100 m!691565))

(assert (=> b!741100 m!691565))

(declare-fun m!691575 () Bool)

(assert (=> b!741100 m!691575))

(declare-fun m!691577 () Bool)

(assert (=> b!741102 m!691577))

(declare-fun m!691579 () Bool)

(assert (=> b!741094 m!691579))

(declare-fun m!691581 () Bool)

(assert (=> b!741107 m!691581))

(declare-fun m!691583 () Bool)

(assert (=> b!741107 m!691583))

(assert (=> b!741098 m!691565))

(assert (=> b!741098 m!691565))

(declare-fun m!691585 () Bool)

(assert (=> b!741098 m!691585))

(declare-fun m!691587 () Bool)

(assert (=> b!741099 m!691587))

(declare-fun m!691589 () Bool)

(assert (=> b!741106 m!691589))

(assert (=> b!741104 m!691565))

(assert (=> b!741104 m!691565))

(declare-fun m!691591 () Bool)

(assert (=> b!741104 m!691591))

(assert (=> b!741091 m!691565))

(assert (=> b!741091 m!691565))

(declare-fun m!691593 () Bool)

(assert (=> b!741091 m!691593))

(declare-fun m!691595 () Bool)

(assert (=> b!741095 m!691595))

(assert (=> b!741093 m!691565))

(assert (=> b!741093 m!691565))

(declare-fun m!691597 () Bool)

(assert (=> b!741093 m!691597))

(declare-fun m!691599 () Bool)

(assert (=> b!741103 m!691599))

(declare-fun m!691601 () Bool)

(assert (=> b!741092 m!691601))

(declare-fun m!691603 () Bool)

(assert (=> b!741092 m!691603))

(declare-fun m!691605 () Bool)

(assert (=> b!741092 m!691605))

(declare-fun m!691607 () Bool)

(assert (=> b!741092 m!691607))

(assert (=> b!741092 m!691607))

(declare-fun m!691609 () Bool)

(assert (=> b!741092 m!691609))

(check-sat (not b!741097) (not b!741091) (not start!65276) (not b!741095) (not b!741106) (not b!741099) (not b!741094) (not b!741100) (not b!741098) (not b!741092) (not b!741103) (not b!741093) (not b!741104) (not b!741107))
(check-sat)
