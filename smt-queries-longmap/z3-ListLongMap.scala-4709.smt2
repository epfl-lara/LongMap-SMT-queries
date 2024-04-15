; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65294 () Bool)

(assert start!65294)

(declare-fun b!741550 () Bool)

(declare-fun res!498968 () Bool)

(declare-fun e!414468 () Bool)

(assert (=> b!741550 (=> (not res!498968) (not e!414468))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741550 (= res!498968 (validKeyInArray!0 k0!2102))))

(declare-fun b!741551 () Bool)

(declare-fun res!498961 () Bool)

(declare-fun e!414465 () Bool)

(assert (=> b!741551 (=> (not res!498961) (not e!414465))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41484 0))(
  ( (array!41485 (arr!19856 (Array (_ BitVec 32) (_ BitVec 64))) (size!20277 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41484)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741551 (= res!498961 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20277 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20277 a!3186))))))

(declare-fun b!741552 () Bool)

(assert (=> b!741552 (= e!414468 e!414465)))

(declare-fun res!498960 () Bool)

(assert (=> b!741552 (=> (not res!498960) (not e!414465))))

(declare-datatypes ((SeekEntryResult!7453 0))(
  ( (MissingZero!7453 (index!32180 (_ BitVec 32))) (Found!7453 (index!32181 (_ BitVec 32))) (Intermediate!7453 (undefined!8265 Bool) (index!32182 (_ BitVec 32)) (x!63166 (_ BitVec 32))) (Undefined!7453) (MissingVacant!7453 (index!32183 (_ BitVec 32))) )
))
(declare-fun lt!329317 () SeekEntryResult!7453)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741552 (= res!498960 (or (= lt!329317 (MissingZero!7453 i!1173)) (= lt!329317 (MissingVacant!7453 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41484 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!741552 (= lt!329317 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741553 () Bool)

(declare-fun e!414466 () Bool)

(assert (=> b!741553 (= e!414465 e!414466)))

(declare-fun res!498959 () Bool)

(assert (=> b!741553 (=> (not res!498959) (not e!414466))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!329321 () SeekEntryResult!7453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41484 (_ BitVec 32)) SeekEntryResult!7453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741553 (= res!498959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19856 a!3186) j!159) mask!3328) (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329321))))

(assert (=> b!741553 (= lt!329321 (Intermediate!7453 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!414469 () Bool)

(declare-fun lt!329315 () SeekEntryResult!7453)

(declare-fun b!741554 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41484 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!741554 (= e!414469 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329315))))

(declare-fun b!741555 () Bool)

(declare-fun res!498956 () Bool)

(assert (=> b!741555 (=> (not res!498956) (not e!414465))))

(declare-datatypes ((List!13897 0))(
  ( (Nil!13894) (Cons!13893 (h!14965 (_ BitVec 64)) (t!20203 List!13897)) )
))
(declare-fun arrayNoDuplicates!0 (array!41484 (_ BitVec 32) List!13897) Bool)

(assert (=> b!741555 (= res!498956 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13894))))

(declare-fun b!741556 () Bool)

(declare-fun res!498964 () Bool)

(assert (=> b!741556 (=> (not res!498964) (not e!414468))))

(assert (=> b!741556 (= res!498964 (validKeyInArray!0 (select (arr!19856 a!3186) j!159)))))

(declare-fun res!498965 () Bool)

(assert (=> start!65294 (=> (not res!498965) (not e!414468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65294 (= res!498965 (validMask!0 mask!3328))))

(assert (=> start!65294 e!414468))

(assert (=> start!65294 true))

(declare-fun array_inv!15739 (array!41484) Bool)

(assert (=> start!65294 (array_inv!15739 a!3186)))

(declare-fun b!741557 () Bool)

(declare-fun res!498958 () Bool)

(assert (=> b!741557 (=> (not res!498958) (not e!414468))))

(assert (=> b!741557 (= res!498958 (and (= (size!20277 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20277 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20277 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!414467 () Bool)

(declare-fun b!741558 () Bool)

(assert (=> b!741558 (= e!414467 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) (Found!7453 j!159)))))

(declare-fun lt!329319 () SeekEntryResult!7453)

(declare-fun e!414462 () Bool)

(declare-fun b!741559 () Bool)

(get-info :version)

(assert (=> b!741559 (= e!414462 (not (or (not ((_ is Intermediate!7453) lt!329319)) (not (= x!1131 (x!63166 lt!329319))) (not (= index!1321 (index!32182 lt!329319))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!414463 () Bool)

(assert (=> b!741559 e!414463))

(declare-fun res!498957 () Bool)

(assert (=> b!741559 (=> (not res!498957) (not e!414463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41484 (_ BitVec 32)) Bool)

(assert (=> b!741559 (= res!498957 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25358 0))(
  ( (Unit!25359) )
))
(declare-fun lt!329316 () Unit!25358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25358)

(assert (=> b!741559 (= lt!329316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741560 () Bool)

(assert (=> b!741560 (= e!414467 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329321))))

(declare-fun b!741561 () Bool)

(assert (=> b!741561 (= e!414463 e!414469)))

(declare-fun res!498963 () Bool)

(assert (=> b!741561 (=> (not res!498963) (not e!414469))))

(assert (=> b!741561 (= res!498963 (= (seekEntryOrOpen!0 (select (arr!19856 a!3186) j!159) a!3186 mask!3328) lt!329315))))

(assert (=> b!741561 (= lt!329315 (Found!7453 j!159))))

(declare-fun b!741562 () Bool)

(declare-fun res!498955 () Bool)

(assert (=> b!741562 (=> (not res!498955) (not e!414466))))

(assert (=> b!741562 (= res!498955 e!414467)))

(declare-fun c!81678 () Bool)

(assert (=> b!741562 (= c!81678 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741563 () Bool)

(assert (=> b!741563 (= e!414466 e!414462)))

(declare-fun res!498966 () Bool)

(assert (=> b!741563 (=> (not res!498966) (not e!414462))))

(declare-fun lt!329318 () SeekEntryResult!7453)

(assert (=> b!741563 (= res!498966 (= lt!329318 lt!329319))))

(declare-fun lt!329320 () (_ BitVec 64))

(declare-fun lt!329314 () array!41484)

(assert (=> b!741563 (= lt!329319 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329320 lt!329314 mask!3328))))

(assert (=> b!741563 (= lt!329318 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329320 mask!3328) lt!329320 lt!329314 mask!3328))))

(assert (=> b!741563 (= lt!329320 (select (store (arr!19856 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741563 (= lt!329314 (array!41485 (store (arr!19856 a!3186) i!1173 k0!2102) (size!20277 a!3186)))))

(declare-fun b!741564 () Bool)

(declare-fun res!498967 () Bool)

(assert (=> b!741564 (=> (not res!498967) (not e!414468))))

(declare-fun arrayContainsKey!0 (array!41484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741564 (= res!498967 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741565 () Bool)

(declare-fun res!498969 () Bool)

(assert (=> b!741565 (=> (not res!498969) (not e!414465))))

(assert (=> b!741565 (= res!498969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741566 () Bool)

(declare-fun res!498962 () Bool)

(assert (=> b!741566 (=> (not res!498962) (not e!414466))))

(assert (=> b!741566 (= res!498962 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19856 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65294 res!498965) b!741557))

(assert (= (and b!741557 res!498958) b!741556))

(assert (= (and b!741556 res!498964) b!741550))

(assert (= (and b!741550 res!498968) b!741564))

(assert (= (and b!741564 res!498967) b!741552))

(assert (= (and b!741552 res!498960) b!741565))

(assert (= (and b!741565 res!498969) b!741555))

(assert (= (and b!741555 res!498956) b!741551))

(assert (= (and b!741551 res!498961) b!741553))

(assert (= (and b!741553 res!498959) b!741566))

(assert (= (and b!741566 res!498962) b!741562))

(assert (= (and b!741562 c!81678) b!741560))

(assert (= (and b!741562 (not c!81678)) b!741558))

(assert (= (and b!741562 res!498955) b!741563))

(assert (= (and b!741563 res!498966) b!741559))

(assert (= (and b!741559 res!498957) b!741561))

(assert (= (and b!741561 res!498963) b!741554))

(declare-fun m!691979 () Bool)

(assert (=> b!741550 m!691979))

(declare-fun m!691981 () Bool)

(assert (=> b!741554 m!691981))

(assert (=> b!741554 m!691981))

(declare-fun m!691983 () Bool)

(assert (=> b!741554 m!691983))

(declare-fun m!691985 () Bool)

(assert (=> b!741563 m!691985))

(declare-fun m!691987 () Bool)

(assert (=> b!741563 m!691987))

(declare-fun m!691989 () Bool)

(assert (=> b!741563 m!691989))

(declare-fun m!691991 () Bool)

(assert (=> b!741563 m!691991))

(assert (=> b!741563 m!691987))

(declare-fun m!691993 () Bool)

(assert (=> b!741563 m!691993))

(assert (=> b!741553 m!691981))

(assert (=> b!741553 m!691981))

(declare-fun m!691995 () Bool)

(assert (=> b!741553 m!691995))

(assert (=> b!741553 m!691995))

(assert (=> b!741553 m!691981))

(declare-fun m!691997 () Bool)

(assert (=> b!741553 m!691997))

(assert (=> b!741560 m!691981))

(assert (=> b!741560 m!691981))

(declare-fun m!691999 () Bool)

(assert (=> b!741560 m!691999))

(declare-fun m!692001 () Bool)

(assert (=> start!65294 m!692001))

(declare-fun m!692003 () Bool)

(assert (=> start!65294 m!692003))

(declare-fun m!692005 () Bool)

(assert (=> b!741559 m!692005))

(declare-fun m!692007 () Bool)

(assert (=> b!741559 m!692007))

(assert (=> b!741558 m!691981))

(assert (=> b!741558 m!691981))

(declare-fun m!692009 () Bool)

(assert (=> b!741558 m!692009))

(declare-fun m!692011 () Bool)

(assert (=> b!741555 m!692011))

(declare-fun m!692013 () Bool)

(assert (=> b!741552 m!692013))

(assert (=> b!741561 m!691981))

(assert (=> b!741561 m!691981))

(declare-fun m!692015 () Bool)

(assert (=> b!741561 m!692015))

(assert (=> b!741556 m!691981))

(assert (=> b!741556 m!691981))

(declare-fun m!692017 () Bool)

(assert (=> b!741556 m!692017))

(declare-fun m!692019 () Bool)

(assert (=> b!741565 m!692019))

(declare-fun m!692021 () Bool)

(assert (=> b!741566 m!692021))

(declare-fun m!692023 () Bool)

(assert (=> b!741564 m!692023))

(check-sat (not b!741550) (not b!741556) (not b!741564) (not b!741561) (not b!741554) (not b!741553) (not b!741565) (not b!741563) (not b!741558) (not b!741559) (not b!741560) (not b!741555) (not start!65294) (not b!741552))
(check-sat)
