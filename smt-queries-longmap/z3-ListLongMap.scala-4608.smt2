; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64344 () Bool)

(assert start!64344)

(declare-fun b!722266 () Bool)

(declare-fun res!483907 () Bool)

(declare-fun e!404973 () Bool)

(assert (=> b!722266 (=> (not res!483907) (not e!404973))))

(declare-datatypes ((array!40858 0))(
  ( (array!40859 (arr!19549 (Array (_ BitVec 32) (_ BitVec 64))) (size!19969 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40858)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722266 (= res!483907 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722267 () Bool)

(declare-fun res!483902 () Bool)

(declare-fun e!404972 () Bool)

(assert (=> b!722267 (=> (not res!483902) (not e!404972))))

(declare-datatypes ((List!13458 0))(
  ( (Nil!13455) (Cons!13454 (h!14511 (_ BitVec 64)) (t!19765 List!13458)) )
))
(declare-fun arrayNoDuplicates!0 (array!40858 (_ BitVec 32) List!13458) Bool)

(assert (=> b!722267 (= res!483902 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13455))))

(declare-fun b!722268 () Bool)

(declare-fun e!404975 () Bool)

(assert (=> b!722268 (= e!404975 false)))

(declare-fun lt!320313 () Bool)

(declare-fun e!404974 () Bool)

(assert (=> b!722268 (= lt!320313 e!404974)))

(declare-fun c!79556 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722268 (= c!79556 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722269 () Bool)

(declare-fun res!483908 () Bool)

(assert (=> b!722269 (=> (not res!483908) (not e!404972))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40858 (_ BitVec 32)) Bool)

(assert (=> b!722269 (= res!483908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722270 () Bool)

(assert (=> b!722270 (= e!404973 e!404972)))

(declare-fun res!483904 () Bool)

(assert (=> b!722270 (=> (not res!483904) (not e!404972))))

(declare-datatypes ((SeekEntryResult!7105 0))(
  ( (MissingZero!7105 (index!30788 (_ BitVec 32))) (Found!7105 (index!30789 (_ BitVec 32))) (Intermediate!7105 (undefined!7917 Bool) (index!30790 (_ BitVec 32)) (x!61949 (_ BitVec 32))) (Undefined!7105) (MissingVacant!7105 (index!30791 (_ BitVec 32))) )
))
(declare-fun lt!320311 () SeekEntryResult!7105)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722270 (= res!483904 (or (= lt!320311 (MissingZero!7105 i!1173)) (= lt!320311 (MissingVacant!7105 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40858 (_ BitVec 32)) SeekEntryResult!7105)

(assert (=> b!722270 (= lt!320311 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722271 () Bool)

(assert (=> b!722271 (= e!404972 e!404975)))

(declare-fun res!483900 () Bool)

(assert (=> b!722271 (=> (not res!483900) (not e!404975))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!320312 () SeekEntryResult!7105)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40858 (_ BitVec 32)) SeekEntryResult!7105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722271 (= res!483900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19549 a!3186) j!159) mask!3328) (select (arr!19549 a!3186) j!159) a!3186 mask!3328) lt!320312))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722271 (= lt!320312 (Intermediate!7105 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722272 () Bool)

(declare-fun res!483906 () Bool)

(assert (=> b!722272 (=> (not res!483906) (not e!404973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722272 (= res!483906 (validKeyInArray!0 (select (arr!19549 a!3186) j!159)))))

(declare-fun b!722273 () Bool)

(declare-fun res!483909 () Bool)

(assert (=> b!722273 (=> (not res!483909) (not e!404975))))

(assert (=> b!722273 (= res!483909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19549 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722274 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40858 (_ BitVec 32)) SeekEntryResult!7105)

(assert (=> b!722274 (= e!404974 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19549 a!3186) j!159) a!3186 mask!3328) (Found!7105 j!159))))))

(declare-fun res!483903 () Bool)

(assert (=> start!64344 (=> (not res!483903) (not e!404973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64344 (= res!483903 (validMask!0 mask!3328))))

(assert (=> start!64344 e!404973))

(assert (=> start!64344 true))

(declare-fun array_inv!15408 (array!40858) Bool)

(assert (=> start!64344 (array_inv!15408 a!3186)))

(declare-fun b!722275 () Bool)

(declare-fun res!483901 () Bool)

(assert (=> b!722275 (=> (not res!483901) (not e!404972))))

(assert (=> b!722275 (= res!483901 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19969 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19969 a!3186))))))

(declare-fun b!722276 () Bool)

(declare-fun res!483905 () Bool)

(assert (=> b!722276 (=> (not res!483905) (not e!404973))))

(assert (=> b!722276 (= res!483905 (validKeyInArray!0 k0!2102))))

(declare-fun b!722277 () Bool)

(assert (=> b!722277 (= e!404974 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19549 a!3186) j!159) a!3186 mask!3328) lt!320312)))))

(declare-fun b!722278 () Bool)

(declare-fun res!483910 () Bool)

(assert (=> b!722278 (=> (not res!483910) (not e!404973))))

(assert (=> b!722278 (= res!483910 (and (= (size!19969 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19969 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19969 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64344 res!483903) b!722278))

(assert (= (and b!722278 res!483910) b!722272))

(assert (= (and b!722272 res!483906) b!722276))

(assert (= (and b!722276 res!483905) b!722266))

(assert (= (and b!722266 res!483907) b!722270))

(assert (= (and b!722270 res!483904) b!722269))

(assert (= (and b!722269 res!483908) b!722267))

(assert (= (and b!722267 res!483902) b!722275))

(assert (= (and b!722275 res!483901) b!722271))

(assert (= (and b!722271 res!483900) b!722273))

(assert (= (and b!722273 res!483909) b!722268))

(assert (= (and b!722268 c!79556) b!722277))

(assert (= (and b!722268 (not c!79556)) b!722274))

(declare-fun m!677457 () Bool)

(assert (=> b!722267 m!677457))

(declare-fun m!677459 () Bool)

(assert (=> b!722266 m!677459))

(declare-fun m!677461 () Bool)

(assert (=> b!722276 m!677461))

(declare-fun m!677463 () Bool)

(assert (=> b!722270 m!677463))

(declare-fun m!677465 () Bool)

(assert (=> b!722274 m!677465))

(assert (=> b!722274 m!677465))

(declare-fun m!677467 () Bool)

(assert (=> b!722274 m!677467))

(declare-fun m!677469 () Bool)

(assert (=> b!722273 m!677469))

(declare-fun m!677471 () Bool)

(assert (=> b!722269 m!677471))

(assert (=> b!722271 m!677465))

(assert (=> b!722271 m!677465))

(declare-fun m!677473 () Bool)

(assert (=> b!722271 m!677473))

(assert (=> b!722271 m!677473))

(assert (=> b!722271 m!677465))

(declare-fun m!677475 () Bool)

(assert (=> b!722271 m!677475))

(assert (=> b!722277 m!677465))

(assert (=> b!722277 m!677465))

(declare-fun m!677477 () Bool)

(assert (=> b!722277 m!677477))

(declare-fun m!677479 () Bool)

(assert (=> start!64344 m!677479))

(declare-fun m!677481 () Bool)

(assert (=> start!64344 m!677481))

(assert (=> b!722272 m!677465))

(assert (=> b!722272 m!677465))

(declare-fun m!677483 () Bool)

(assert (=> b!722272 m!677483))

(check-sat (not start!64344) (not b!722274) (not b!722267) (not b!722269) (not b!722271) (not b!722270) (not b!722266) (not b!722272) (not b!722277) (not b!722276))
(check-sat)
