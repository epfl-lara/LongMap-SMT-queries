; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64350 () Bool)

(assert start!64350)

(declare-fun b!722385 () Bool)

(declare-fun res!484010 () Bool)

(declare-fun e!405018 () Bool)

(assert (=> b!722385 (=> (not res!484010) (not e!405018))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40864 0))(
  ( (array!40865 (arr!19552 (Array (_ BitVec 32) (_ BitVec 64))) (size!19972 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40864)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722385 (= res!484010 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19972 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19972 a!3186))))))

(declare-fun e!405021 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!722386 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7108 0))(
  ( (MissingZero!7108 (index!30800 (_ BitVec 32))) (Found!7108 (index!30801 (_ BitVec 32))) (Intermediate!7108 (undefined!7920 Bool) (index!30802 (_ BitVec 32)) (x!61960 (_ BitVec 32))) (Undefined!7108) (MissingVacant!7108 (index!30803 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40864 (_ BitVec 32)) SeekEntryResult!7108)

(assert (=> b!722386 (= e!405021 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19552 a!3186) j!159) a!3186 mask!3328) (Found!7108 j!159)))))

(declare-fun b!722387 () Bool)

(declare-fun res!484001 () Bool)

(declare-fun e!405017 () Bool)

(assert (=> b!722387 (=> (not res!484001) (not e!405017))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722387 (= res!484001 (and (= (size!19972 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19972 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19972 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!320337 () SeekEntryResult!7108)

(declare-fun b!722388 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40864 (_ BitVec 32)) SeekEntryResult!7108)

(assert (=> b!722388 (= e!405021 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19552 a!3186) j!159) a!3186 mask!3328) lt!320337))))

(declare-fun b!722389 () Bool)

(declare-fun res!484006 () Bool)

(assert (=> b!722389 (=> (not res!484006) (not e!405017))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722389 (= res!484006 (validKeyInArray!0 k0!2102))))

(declare-fun b!722390 () Bool)

(declare-fun res!484002 () Bool)

(assert (=> b!722390 (=> (not res!484002) (not e!405018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40864 (_ BitVec 32)) Bool)

(assert (=> b!722390 (= res!484002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722391 () Bool)

(declare-fun res!484011 () Bool)

(declare-fun e!405019 () Bool)

(assert (=> b!722391 (=> (not res!484011) (not e!405019))))

(assert (=> b!722391 (= res!484011 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19552 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722392 () Bool)

(assert (=> b!722392 (= e!405019 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722393 () Bool)

(declare-fun res!484008 () Bool)

(assert (=> b!722393 (=> (not res!484008) (not e!405019))))

(assert (=> b!722393 (= res!484008 e!405021)))

(declare-fun c!79565 () Bool)

(assert (=> b!722393 (= c!79565 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722394 () Bool)

(declare-fun res!484007 () Bool)

(assert (=> b!722394 (=> (not res!484007) (not e!405018))))

(declare-datatypes ((List!13461 0))(
  ( (Nil!13458) (Cons!13457 (h!14514 (_ BitVec 64)) (t!19768 List!13461)) )
))
(declare-fun arrayNoDuplicates!0 (array!40864 (_ BitVec 32) List!13461) Bool)

(assert (=> b!722394 (= res!484007 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13458))))

(declare-fun b!722395 () Bool)

(assert (=> b!722395 (= e!405018 e!405019)))

(declare-fun res!484005 () Bool)

(assert (=> b!722395 (=> (not res!484005) (not e!405019))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722395 (= res!484005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19552 a!3186) j!159) mask!3328) (select (arr!19552 a!3186) j!159) a!3186 mask!3328) lt!320337))))

(assert (=> b!722395 (= lt!320337 (Intermediate!7108 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!484012 () Bool)

(assert (=> start!64350 (=> (not res!484012) (not e!405017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64350 (= res!484012 (validMask!0 mask!3328))))

(assert (=> start!64350 e!405017))

(assert (=> start!64350 true))

(declare-fun array_inv!15411 (array!40864) Bool)

(assert (=> start!64350 (array_inv!15411 a!3186)))

(declare-fun b!722396 () Bool)

(declare-fun res!484004 () Bool)

(assert (=> b!722396 (=> (not res!484004) (not e!405017))))

(declare-fun arrayContainsKey!0 (array!40864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722396 (= res!484004 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722397 () Bool)

(declare-fun res!484003 () Bool)

(assert (=> b!722397 (=> (not res!484003) (not e!405017))))

(assert (=> b!722397 (= res!484003 (validKeyInArray!0 (select (arr!19552 a!3186) j!159)))))

(declare-fun b!722398 () Bool)

(assert (=> b!722398 (= e!405017 e!405018)))

(declare-fun res!484009 () Bool)

(assert (=> b!722398 (=> (not res!484009) (not e!405018))))

(declare-fun lt!320336 () SeekEntryResult!7108)

(assert (=> b!722398 (= res!484009 (or (= lt!320336 (MissingZero!7108 i!1173)) (= lt!320336 (MissingVacant!7108 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40864 (_ BitVec 32)) SeekEntryResult!7108)

(assert (=> b!722398 (= lt!320336 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64350 res!484012) b!722387))

(assert (= (and b!722387 res!484001) b!722397))

(assert (= (and b!722397 res!484003) b!722389))

(assert (= (and b!722389 res!484006) b!722396))

(assert (= (and b!722396 res!484004) b!722398))

(assert (= (and b!722398 res!484009) b!722390))

(assert (= (and b!722390 res!484002) b!722394))

(assert (= (and b!722394 res!484007) b!722385))

(assert (= (and b!722385 res!484010) b!722395))

(assert (= (and b!722395 res!484005) b!722391))

(assert (= (and b!722391 res!484011) b!722393))

(assert (= (and b!722393 c!79565) b!722388))

(assert (= (and b!722393 (not c!79565)) b!722386))

(assert (= (and b!722393 res!484008) b!722392))

(declare-fun m!677541 () Bool)

(assert (=> b!722390 m!677541))

(declare-fun m!677543 () Bool)

(assert (=> b!722389 m!677543))

(declare-fun m!677545 () Bool)

(assert (=> b!722391 m!677545))

(declare-fun m!677547 () Bool)

(assert (=> b!722396 m!677547))

(declare-fun m!677549 () Bool)

(assert (=> b!722397 m!677549))

(assert (=> b!722397 m!677549))

(declare-fun m!677551 () Bool)

(assert (=> b!722397 m!677551))

(declare-fun m!677553 () Bool)

(assert (=> b!722394 m!677553))

(assert (=> b!722395 m!677549))

(assert (=> b!722395 m!677549))

(declare-fun m!677555 () Bool)

(assert (=> b!722395 m!677555))

(assert (=> b!722395 m!677555))

(assert (=> b!722395 m!677549))

(declare-fun m!677557 () Bool)

(assert (=> b!722395 m!677557))

(assert (=> b!722388 m!677549))

(assert (=> b!722388 m!677549))

(declare-fun m!677559 () Bool)

(assert (=> b!722388 m!677559))

(declare-fun m!677561 () Bool)

(assert (=> start!64350 m!677561))

(declare-fun m!677563 () Bool)

(assert (=> start!64350 m!677563))

(declare-fun m!677565 () Bool)

(assert (=> b!722398 m!677565))

(assert (=> b!722386 m!677549))

(assert (=> b!722386 m!677549))

(declare-fun m!677567 () Bool)

(assert (=> b!722386 m!677567))

(check-sat (not b!722398) (not b!722388) (not b!722394) (not b!722397) (not b!722395) (not b!722390) (not start!64350) (not b!722386) (not b!722396) (not b!722389))
(check-sat)
