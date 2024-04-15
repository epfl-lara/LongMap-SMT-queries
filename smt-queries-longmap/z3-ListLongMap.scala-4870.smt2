; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67112 () Bool)

(assert start!67112)

(declare-fun b!775381 () Bool)

(declare-fun e!431514 () Bool)

(assert (=> b!775381 (= e!431514 (not true))))

(declare-fun e!431513 () Bool)

(assert (=> b!775381 e!431513))

(declare-fun res!524421 () Bool)

(assert (=> b!775381 (=> (not res!524421) (not e!431513))))

(declare-datatypes ((array!42486 0))(
  ( (array!42487 (arr!20339 (Array (_ BitVec 32) (_ BitVec 64))) (size!20760 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42486)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42486 (_ BitVec 32)) Bool)

(assert (=> b!775381 (= res!524421 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26738 0))(
  ( (Unit!26739) )
))
(declare-fun lt!345297 () Unit!26738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26738)

(assert (=> b!775381 (= lt!345297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775382 () Bool)

(declare-fun e!431517 () Bool)

(declare-fun e!431511 () Bool)

(assert (=> b!775382 (= e!431517 e!431511)))

(declare-fun res!524417 () Bool)

(assert (=> b!775382 (=> (not res!524417) (not e!431511))))

(declare-datatypes ((SeekEntryResult!7936 0))(
  ( (MissingZero!7936 (index!34112 (_ BitVec 32))) (Found!7936 (index!34113 (_ BitVec 32))) (Intermediate!7936 (undefined!8748 Bool) (index!34114 (_ BitVec 32)) (x!65066 (_ BitVec 32))) (Undefined!7936) (MissingVacant!7936 (index!34115 (_ BitVec 32))) )
))
(declare-fun lt!345295 () SeekEntryResult!7936)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775382 (= res!524417 (or (= lt!345295 (MissingZero!7936 i!1173)) (= lt!345295 (MissingVacant!7936 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42486 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!775382 (= lt!345295 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775384 () Bool)

(declare-fun e!431518 () Bool)

(assert (=> b!775384 (= e!431518 e!431514)))

(declare-fun res!524420 () Bool)

(assert (=> b!775384 (=> (not res!524420) (not e!431514))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345294 () (_ BitVec 64))

(declare-fun lt!345298 () array!42486)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42486 (_ BitVec 32)) SeekEntryResult!7936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775384 (= res!524420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345294 mask!3328) lt!345294 lt!345298 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345294 lt!345298 mask!3328)))))

(assert (=> b!775384 (= lt!345294 (select (store (arr!20339 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775384 (= lt!345298 (array!42487 (store (arr!20339 a!3186) i!1173 k0!2102) (size!20760 a!3186)))))

(declare-fun b!775385 () Bool)

(assert (=> b!775385 (= e!431511 e!431518)))

(declare-fun res!524419 () Bool)

(assert (=> b!775385 (=> (not res!524419) (not e!431518))))

(declare-fun lt!345296 () SeekEntryResult!7936)

(assert (=> b!775385 (= res!524419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20339 a!3186) j!159) mask!3328) (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345296))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775385 (= lt!345296 (Intermediate!7936 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775386 () Bool)

(declare-fun res!524425 () Bool)

(assert (=> b!775386 (=> (not res!524425) (not e!431511))))

(declare-datatypes ((List!14380 0))(
  ( (Nil!14377) (Cons!14376 (h!15484 (_ BitVec 64)) (t!20686 List!14380)) )
))
(declare-fun arrayNoDuplicates!0 (array!42486 (_ BitVec 32) List!14380) Bool)

(assert (=> b!775386 (= res!524425 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14377))))

(declare-fun b!775387 () Bool)

(declare-fun res!524416 () Bool)

(assert (=> b!775387 (=> (not res!524416) (not e!431518))))

(assert (=> b!775387 (= res!524416 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20339 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775388 () Bool)

(declare-fun e!431515 () Bool)

(assert (=> b!775388 (= e!431513 e!431515)))

(declare-fun res!524413 () Bool)

(assert (=> b!775388 (=> (not res!524413) (not e!431515))))

(declare-fun lt!345299 () SeekEntryResult!7936)

(assert (=> b!775388 (= res!524413 (= (seekEntryOrOpen!0 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345299))))

(assert (=> b!775388 (= lt!345299 (Found!7936 j!159))))

(declare-fun b!775389 () Bool)

(declare-fun res!524418 () Bool)

(assert (=> b!775389 (=> (not res!524418) (not e!431517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775389 (= res!524418 (validKeyInArray!0 k0!2102))))

(declare-fun b!775390 () Bool)

(declare-fun res!524415 () Bool)

(assert (=> b!775390 (=> (not res!524415) (not e!431517))))

(declare-fun arrayContainsKey!0 (array!42486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775390 (= res!524415 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!524422 () Bool)

(assert (=> start!67112 (=> (not res!524422) (not e!431517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67112 (= res!524422 (validMask!0 mask!3328))))

(assert (=> start!67112 e!431517))

(assert (=> start!67112 true))

(declare-fun array_inv!16222 (array!42486) Bool)

(assert (=> start!67112 (array_inv!16222 a!3186)))

(declare-fun e!431512 () Bool)

(declare-fun b!775383 () Bool)

(assert (=> b!775383 (= e!431512 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345296))))

(declare-fun b!775391 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42486 (_ BitVec 32)) SeekEntryResult!7936)

(assert (=> b!775391 (= e!431515 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) lt!345299))))

(declare-fun b!775392 () Bool)

(declare-fun res!524423 () Bool)

(assert (=> b!775392 (=> (not res!524423) (not e!431517))))

(assert (=> b!775392 (= res!524423 (validKeyInArray!0 (select (arr!20339 a!3186) j!159)))))

(declare-fun b!775393 () Bool)

(declare-fun res!524426 () Bool)

(assert (=> b!775393 (=> (not res!524426) (not e!431511))))

(assert (=> b!775393 (= res!524426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775394 () Bool)

(declare-fun res!524424 () Bool)

(assert (=> b!775394 (=> (not res!524424) (not e!431518))))

(assert (=> b!775394 (= res!524424 e!431512)))

(declare-fun c!85884 () Bool)

(assert (=> b!775394 (= c!85884 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775395 () Bool)

(declare-fun res!524427 () Bool)

(assert (=> b!775395 (=> (not res!524427) (not e!431517))))

(assert (=> b!775395 (= res!524427 (and (= (size!20760 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20760 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20760 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775396 () Bool)

(assert (=> b!775396 (= e!431512 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20339 a!3186) j!159) a!3186 mask!3328) (Found!7936 j!159)))))

(declare-fun b!775397 () Bool)

(declare-fun res!524414 () Bool)

(assert (=> b!775397 (=> (not res!524414) (not e!431511))))

(assert (=> b!775397 (= res!524414 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20760 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20760 a!3186))))))

(assert (= (and start!67112 res!524422) b!775395))

(assert (= (and b!775395 res!524427) b!775392))

(assert (= (and b!775392 res!524423) b!775389))

(assert (= (and b!775389 res!524418) b!775390))

(assert (= (and b!775390 res!524415) b!775382))

(assert (= (and b!775382 res!524417) b!775393))

(assert (= (and b!775393 res!524426) b!775386))

(assert (= (and b!775386 res!524425) b!775397))

(assert (= (and b!775397 res!524414) b!775385))

(assert (= (and b!775385 res!524419) b!775387))

(assert (= (and b!775387 res!524416) b!775394))

(assert (= (and b!775394 c!85884) b!775383))

(assert (= (and b!775394 (not c!85884)) b!775396))

(assert (= (and b!775394 res!524424) b!775384))

(assert (= (and b!775384 res!524420) b!775381))

(assert (= (and b!775381 res!524421) b!775388))

(assert (= (and b!775388 res!524413) b!775391))

(declare-fun m!719067 () Bool)

(assert (=> b!775386 m!719067))

(declare-fun m!719069 () Bool)

(assert (=> b!775392 m!719069))

(assert (=> b!775392 m!719069))

(declare-fun m!719071 () Bool)

(assert (=> b!775392 m!719071))

(assert (=> b!775388 m!719069))

(assert (=> b!775388 m!719069))

(declare-fun m!719073 () Bool)

(assert (=> b!775388 m!719073))

(declare-fun m!719075 () Bool)

(assert (=> b!775382 m!719075))

(assert (=> b!775383 m!719069))

(assert (=> b!775383 m!719069))

(declare-fun m!719077 () Bool)

(assert (=> b!775383 m!719077))

(declare-fun m!719079 () Bool)

(assert (=> b!775381 m!719079))

(declare-fun m!719081 () Bool)

(assert (=> b!775381 m!719081))

(declare-fun m!719083 () Bool)

(assert (=> b!775387 m!719083))

(declare-fun m!719085 () Bool)

(assert (=> b!775389 m!719085))

(declare-fun m!719087 () Bool)

(assert (=> b!775393 m!719087))

(declare-fun m!719089 () Bool)

(assert (=> b!775384 m!719089))

(declare-fun m!719091 () Bool)

(assert (=> b!775384 m!719091))

(declare-fun m!719093 () Bool)

(assert (=> b!775384 m!719093))

(assert (=> b!775384 m!719091))

(declare-fun m!719095 () Bool)

(assert (=> b!775384 m!719095))

(declare-fun m!719097 () Bool)

(assert (=> b!775384 m!719097))

(declare-fun m!719099 () Bool)

(assert (=> b!775390 m!719099))

(declare-fun m!719101 () Bool)

(assert (=> start!67112 m!719101))

(declare-fun m!719103 () Bool)

(assert (=> start!67112 m!719103))

(assert (=> b!775396 m!719069))

(assert (=> b!775396 m!719069))

(declare-fun m!719105 () Bool)

(assert (=> b!775396 m!719105))

(assert (=> b!775391 m!719069))

(assert (=> b!775391 m!719069))

(declare-fun m!719107 () Bool)

(assert (=> b!775391 m!719107))

(assert (=> b!775385 m!719069))

(assert (=> b!775385 m!719069))

(declare-fun m!719109 () Bool)

(assert (=> b!775385 m!719109))

(assert (=> b!775385 m!719109))

(assert (=> b!775385 m!719069))

(declare-fun m!719111 () Bool)

(assert (=> b!775385 m!719111))

(check-sat (not b!775391) (not b!775384) (not b!775382) (not b!775383) (not start!67112) (not b!775386) (not b!775388) (not b!775389) (not b!775381) (not b!775392) (not b!775385) (not b!775396) (not b!775390) (not b!775393))
(check-sat)
