; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67016 () Bool)

(assert start!67016)

(declare-fun b!773480 () Bool)

(declare-fun e!430564 () Bool)

(declare-fun e!430570 () Bool)

(assert (=> b!773480 (= e!430564 e!430570)))

(declare-fun res!523116 () Bool)

(assert (=> b!773480 (=> (not res!523116) (not e!430570))))

(declare-datatypes ((SeekEntryResult!7917 0))(
  ( (MissingZero!7917 (index!34036 (_ BitVec 32))) (Found!7917 (index!34037 (_ BitVec 32))) (Intermediate!7917 (undefined!8729 Bool) (index!34038 (_ BitVec 32)) (x!64976 (_ BitVec 32))) (Undefined!7917) (MissingVacant!7917 (index!34039 (_ BitVec 32))) )
))
(declare-fun lt!344440 () SeekEntryResult!7917)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773480 (= res!523116 (or (= lt!344440 (MissingZero!7917 i!1173)) (= lt!344440 (MissingVacant!7917 i!1173))))))

(declare-datatypes ((array!42440 0))(
  ( (array!42441 (arr!20317 (Array (_ BitVec 32) (_ BitVec 64))) (size!20738 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42440)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42440 (_ BitVec 32)) SeekEntryResult!7917)

(assert (=> b!773480 (= lt!344440 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773481 () Bool)

(declare-fun res!523122 () Bool)

(assert (=> b!773481 (=> (not res!523122) (not e!430564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773481 (= res!523122 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!344439 () SeekEntryResult!7917)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!430569 () Bool)

(declare-fun b!773482 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42440 (_ BitVec 32)) SeekEntryResult!7917)

(assert (=> b!773482 (= e!430569 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344439))))

(declare-fun b!773483 () Bool)

(declare-fun e!430566 () Bool)

(assert (=> b!773483 (= e!430566 e!430569)))

(declare-fun res!523125 () Bool)

(assert (=> b!773483 (=> (not res!523125) (not e!430569))))

(assert (=> b!773483 (= res!523125 (= (seekEntryOrOpen!0 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344439))))

(assert (=> b!773483 (= lt!344439 (Found!7917 j!159))))

(declare-fun b!773484 () Bool)

(declare-fun res!523118 () Bool)

(assert (=> b!773484 (=> (not res!523118) (not e!430564))))

(assert (=> b!773484 (= res!523118 (and (= (size!20738 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20738 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20738 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773485 () Bool)

(declare-fun res!523129 () Bool)

(declare-fun e!430562 () Bool)

(assert (=> b!773485 (=> (not res!523129) (not e!430562))))

(declare-fun e!430565 () Bool)

(assert (=> b!773485 (= res!523129 e!430565)))

(declare-fun c!85581 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!773485 (= c!85581 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773486 () Bool)

(declare-datatypes ((Unit!26682 0))(
  ( (Unit!26683) )
))
(declare-fun e!430563 () Unit!26682)

(declare-fun Unit!26684 () Unit!26682)

(assert (=> b!773486 (= e!430563 Unit!26684)))

(declare-fun lt!344435 () SeekEntryResult!7917)

(declare-fun lt!344431 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42440 (_ BitVec 32)) SeekEntryResult!7917)

(assert (=> b!773486 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344431 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344435)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!773487 () Bool)

(assert (=> b!773487 (= e!430565 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) (Found!7917 j!159)))))

(declare-fun b!773488 () Bool)

(declare-fun res!523117 () Bool)

(assert (=> b!773488 (=> (not res!523117) (not e!430564))))

(declare-fun arrayContainsKey!0 (array!42440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773488 (= res!523117 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!523127 () Bool)

(assert (=> start!67016 (=> (not res!523127) (not e!430564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67016 (= res!523127 (validMask!0 mask!3328))))

(assert (=> start!67016 e!430564))

(assert (=> start!67016 true))

(declare-fun array_inv!16113 (array!42440) Bool)

(assert (=> start!67016 (array_inv!16113 a!3186)))

(declare-fun b!773489 () Bool)

(declare-fun res!523119 () Bool)

(assert (=> b!773489 (=> (not res!523119) (not e!430564))))

(assert (=> b!773489 (= res!523119 (validKeyInArray!0 (select (arr!20317 a!3186) j!159)))))

(declare-fun b!773490 () Bool)

(declare-fun e!430567 () Bool)

(assert (=> b!773490 (= e!430567 true)))

(declare-fun lt!344441 () Unit!26682)

(assert (=> b!773490 (= lt!344441 e!430563)))

(declare-fun c!85582 () Bool)

(assert (=> b!773490 (= c!85582 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773490 (= lt!344431 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773491 () Bool)

(declare-fun Unit!26685 () Unit!26682)

(assert (=> b!773491 (= e!430563 Unit!26685)))

(declare-fun lt!344432 () SeekEntryResult!7917)

(assert (=> b!773491 (= lt!344432 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773491 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344431 resIntermediateIndex!5 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) (Found!7917 j!159))))

(declare-fun b!773492 () Bool)

(assert (=> b!773492 (= e!430565 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344435))))

(declare-fun b!773493 () Bool)

(declare-fun res!523126 () Bool)

(assert (=> b!773493 (=> (not res!523126) (not e!430562))))

(assert (=> b!773493 (= res!523126 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20317 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773494 () Bool)

(declare-fun res!523120 () Bool)

(assert (=> b!773494 (=> (not res!523120) (not e!430570))))

(assert (=> b!773494 (= res!523120 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20738 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20738 a!3186))))))

(declare-fun b!773495 () Bool)

(declare-fun res!523121 () Bool)

(assert (=> b!773495 (=> (not res!523121) (not e!430570))))

(declare-datatypes ((List!14319 0))(
  ( (Nil!14316) (Cons!14315 (h!15420 (_ BitVec 64)) (t!20634 List!14319)) )
))
(declare-fun arrayNoDuplicates!0 (array!42440 (_ BitVec 32) List!14319) Bool)

(assert (=> b!773495 (= res!523121 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14316))))

(declare-fun b!773496 () Bool)

(assert (=> b!773496 (= e!430570 e!430562)))

(declare-fun res!523123 () Bool)

(assert (=> b!773496 (=> (not res!523123) (not e!430562))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773496 (= res!523123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20317 a!3186) j!159) mask!3328) (select (arr!20317 a!3186) j!159) a!3186 mask!3328) lt!344435))))

(assert (=> b!773496 (= lt!344435 (Intermediate!7917 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773497 () Bool)

(declare-fun res!523124 () Bool)

(assert (=> b!773497 (=> (not res!523124) (not e!430570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42440 (_ BitVec 32)) Bool)

(assert (=> b!773497 (= res!523124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773498 () Bool)

(declare-fun e!430568 () Bool)

(assert (=> b!773498 (= e!430562 e!430568)))

(declare-fun res!523128 () Bool)

(assert (=> b!773498 (=> (not res!523128) (not e!430568))))

(declare-fun lt!344434 () SeekEntryResult!7917)

(declare-fun lt!344436 () SeekEntryResult!7917)

(assert (=> b!773498 (= res!523128 (= lt!344434 lt!344436))))

(declare-fun lt!344437 () (_ BitVec 64))

(declare-fun lt!344438 () array!42440)

(assert (=> b!773498 (= lt!344436 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344437 lt!344438 mask!3328))))

(assert (=> b!773498 (= lt!344434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344437 mask!3328) lt!344437 lt!344438 mask!3328))))

(assert (=> b!773498 (= lt!344437 (select (store (arr!20317 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773498 (= lt!344438 (array!42441 (store (arr!20317 a!3186) i!1173 k0!2102) (size!20738 a!3186)))))

(declare-fun b!773499 () Bool)

(assert (=> b!773499 (= e!430568 (not e!430567))))

(declare-fun res!523115 () Bool)

(assert (=> b!773499 (=> res!523115 e!430567)))

(get-info :version)

(assert (=> b!773499 (= res!523115 (or (not ((_ is Intermediate!7917) lt!344436)) (bvsge x!1131 (x!64976 lt!344436))))))

(assert (=> b!773499 e!430566))

(declare-fun res!523130 () Bool)

(assert (=> b!773499 (=> (not res!523130) (not e!430566))))

(assert (=> b!773499 (= res!523130 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344433 () Unit!26682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26682)

(assert (=> b!773499 (= lt!344433 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67016 res!523127) b!773484))

(assert (= (and b!773484 res!523118) b!773489))

(assert (= (and b!773489 res!523119) b!773481))

(assert (= (and b!773481 res!523122) b!773488))

(assert (= (and b!773488 res!523117) b!773480))

(assert (= (and b!773480 res!523116) b!773497))

(assert (= (and b!773497 res!523124) b!773495))

(assert (= (and b!773495 res!523121) b!773494))

(assert (= (and b!773494 res!523120) b!773496))

(assert (= (and b!773496 res!523123) b!773493))

(assert (= (and b!773493 res!523126) b!773485))

(assert (= (and b!773485 c!85581) b!773492))

(assert (= (and b!773485 (not c!85581)) b!773487))

(assert (= (and b!773485 res!523129) b!773498))

(assert (= (and b!773498 res!523128) b!773499))

(assert (= (and b!773499 res!523130) b!773483))

(assert (= (and b!773483 res!523125) b!773482))

(assert (= (and b!773499 (not res!523115)) b!773490))

(assert (= (and b!773490 c!85582) b!773486))

(assert (= (and b!773490 (not c!85582)) b!773491))

(declare-fun m!718203 () Bool)

(assert (=> b!773493 m!718203))

(declare-fun m!718205 () Bool)

(assert (=> b!773491 m!718205))

(assert (=> b!773491 m!718205))

(declare-fun m!718207 () Bool)

(assert (=> b!773491 m!718207))

(assert (=> b!773491 m!718205))

(declare-fun m!718209 () Bool)

(assert (=> b!773491 m!718209))

(declare-fun m!718211 () Bool)

(assert (=> b!773488 m!718211))

(assert (=> b!773482 m!718205))

(assert (=> b!773482 m!718205))

(declare-fun m!718213 () Bool)

(assert (=> b!773482 m!718213))

(declare-fun m!718215 () Bool)

(assert (=> start!67016 m!718215))

(declare-fun m!718217 () Bool)

(assert (=> start!67016 m!718217))

(declare-fun m!718219 () Bool)

(assert (=> b!773498 m!718219))

(declare-fun m!718221 () Bool)

(assert (=> b!773498 m!718221))

(declare-fun m!718223 () Bool)

(assert (=> b!773498 m!718223))

(assert (=> b!773498 m!718219))

(declare-fun m!718225 () Bool)

(assert (=> b!773498 m!718225))

(declare-fun m!718227 () Bool)

(assert (=> b!773498 m!718227))

(declare-fun m!718229 () Bool)

(assert (=> b!773480 m!718229))

(assert (=> b!773483 m!718205))

(assert (=> b!773483 m!718205))

(declare-fun m!718231 () Bool)

(assert (=> b!773483 m!718231))

(assert (=> b!773486 m!718205))

(assert (=> b!773486 m!718205))

(declare-fun m!718233 () Bool)

(assert (=> b!773486 m!718233))

(declare-fun m!718235 () Bool)

(assert (=> b!773495 m!718235))

(assert (=> b!773489 m!718205))

(assert (=> b!773489 m!718205))

(declare-fun m!718237 () Bool)

(assert (=> b!773489 m!718237))

(assert (=> b!773492 m!718205))

(assert (=> b!773492 m!718205))

(declare-fun m!718239 () Bool)

(assert (=> b!773492 m!718239))

(declare-fun m!718241 () Bool)

(assert (=> b!773499 m!718241))

(declare-fun m!718243 () Bool)

(assert (=> b!773499 m!718243))

(declare-fun m!718245 () Bool)

(assert (=> b!773490 m!718245))

(declare-fun m!718247 () Bool)

(assert (=> b!773497 m!718247))

(assert (=> b!773496 m!718205))

(assert (=> b!773496 m!718205))

(declare-fun m!718249 () Bool)

(assert (=> b!773496 m!718249))

(assert (=> b!773496 m!718249))

(assert (=> b!773496 m!718205))

(declare-fun m!718251 () Bool)

(assert (=> b!773496 m!718251))

(assert (=> b!773487 m!718205))

(assert (=> b!773487 m!718205))

(assert (=> b!773487 m!718207))

(declare-fun m!718253 () Bool)

(assert (=> b!773481 m!718253))

(check-sat (not b!773499) (not b!773492) (not b!773488) (not b!773486) (not b!773490) (not start!67016) (not b!773480) (not b!773487) (not b!773497) (not b!773482) (not b!773489) (not b!773491) (not b!773495) (not b!773498) (not b!773483) (not b!773481) (not b!773496))
(check-sat)
