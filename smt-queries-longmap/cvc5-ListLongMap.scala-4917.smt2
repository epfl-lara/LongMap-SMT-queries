; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67746 () Bool)

(assert start!67746)

(declare-fun b!786449 () Bool)

(declare-fun e!437189 () Bool)

(declare-fun e!437187 () Bool)

(assert (=> b!786449 (= e!437189 e!437187)))

(declare-fun res!532502 () Bool)

(assert (=> b!786449 (=> (not res!532502) (not e!437187))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42786 0))(
  ( (array!42787 (arr!20481 (Array (_ BitVec 32) (_ BitVec 64))) (size!20902 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42786)

(declare-datatypes ((SeekEntryResult!8081 0))(
  ( (MissingZero!8081 (index!34692 (_ BitVec 32))) (Found!8081 (index!34693 (_ BitVec 32))) (Intermediate!8081 (undefined!8893 Bool) (index!34694 (_ BitVec 32)) (x!65637 (_ BitVec 32))) (Undefined!8081) (MissingVacant!8081 (index!34695 (_ BitVec 32))) )
))
(declare-fun lt!350741 () SeekEntryResult!8081)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42786 (_ BitVec 32)) SeekEntryResult!8081)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786449 (= res!532502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20481 a!3186) j!159) mask!3328) (select (arr!20481 a!3186) j!159) a!3186 mask!3328) lt!350741))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786449 (= lt!350741 (Intermediate!8081 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786450 () Bool)

(declare-fun res!532499 () Bool)

(assert (=> b!786450 (=> (not res!532499) (not e!437189))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!786450 (= res!532499 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20902 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20902 a!3186))))))

(declare-fun b!786451 () Bool)

(declare-fun e!437183 () Bool)

(declare-fun e!437192 () Bool)

(assert (=> b!786451 (= e!437183 e!437192)))

(declare-fun res!532496 () Bool)

(assert (=> b!786451 (=> res!532496 e!437192)))

(declare-fun lt!350734 () SeekEntryResult!8081)

(declare-fun lt!350733 () SeekEntryResult!8081)

(assert (=> b!786451 (= res!532496 (not (= lt!350734 lt!350733)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42786 (_ BitVec 32)) SeekEntryResult!8081)

(assert (=> b!786451 (= lt!350734 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20481 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786452 () Bool)

(declare-fun e!437186 () Bool)

(assert (=> b!786452 (= e!437186 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20481 a!3186) j!159) a!3186 mask!3328) lt!350741))))

(declare-fun b!786454 () Bool)

(assert (=> b!786454 (= e!437186 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20481 a!3186) j!159) a!3186 mask!3328) (Found!8081 j!159)))))

(declare-fun b!786455 () Bool)

(declare-fun e!437188 () Bool)

(assert (=> b!786455 (= e!437188 true)))

(declare-fun e!437191 () Bool)

(assert (=> b!786455 e!437191))

(declare-fun res!532513 () Bool)

(assert (=> b!786455 (=> (not res!532513) (not e!437191))))

(declare-fun lt!350743 () (_ BitVec 64))

(assert (=> b!786455 (= res!532513 (= lt!350743 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27212 0))(
  ( (Unit!27213) )
))
(declare-fun lt!350739 () Unit!27212)

(declare-fun e!437181 () Unit!27212)

(assert (=> b!786455 (= lt!350739 e!437181)))

(declare-fun c!87384 () Bool)

(assert (=> b!786455 (= c!87384 (= lt!350743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786456 () Bool)

(declare-fun res!532511 () Bool)

(declare-fun e!437185 () Bool)

(assert (=> b!786456 (=> (not res!532511) (not e!437185))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786456 (= res!532511 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786457 () Bool)

(assert (=> b!786457 (= e!437185 e!437189)))

(declare-fun res!532501 () Bool)

(assert (=> b!786457 (=> (not res!532501) (not e!437189))))

(declare-fun lt!350736 () SeekEntryResult!8081)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786457 (= res!532501 (or (= lt!350736 (MissingZero!8081 i!1173)) (= lt!350736 (MissingVacant!8081 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42786 (_ BitVec 32)) SeekEntryResult!8081)

(assert (=> b!786457 (= lt!350736 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786458 () Bool)

(declare-fun e!437182 () Bool)

(assert (=> b!786458 (= e!437182 (not e!437183))))

(declare-fun res!532510 () Bool)

(assert (=> b!786458 (=> res!532510 e!437183)))

(declare-fun lt!350742 () SeekEntryResult!8081)

(assert (=> b!786458 (= res!532510 (or (not (is-Intermediate!8081 lt!350742)) (bvslt x!1131 (x!65637 lt!350742)) (not (= x!1131 (x!65637 lt!350742))) (not (= index!1321 (index!34694 lt!350742)))))))

(declare-fun e!437184 () Bool)

(assert (=> b!786458 e!437184))

(declare-fun res!532497 () Bool)

(assert (=> b!786458 (=> (not res!532497) (not e!437184))))

(declare-fun lt!350737 () SeekEntryResult!8081)

(assert (=> b!786458 (= res!532497 (= lt!350737 lt!350733))))

(assert (=> b!786458 (= lt!350733 (Found!8081 j!159))))

(assert (=> b!786458 (= lt!350737 (seekEntryOrOpen!0 (select (arr!20481 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42786 (_ BitVec 32)) Bool)

(assert (=> b!786458 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350740 () Unit!27212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27212)

(assert (=> b!786458 (= lt!350740 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786459 () Bool)

(assert (=> b!786459 (= e!437191 (= lt!350737 lt!350734))))

(declare-fun res!532505 () Bool)

(assert (=> start!67746 (=> (not res!532505) (not e!437185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67746 (= res!532505 (validMask!0 mask!3328))))

(assert (=> start!67746 e!437185))

(assert (=> start!67746 true))

(declare-fun array_inv!16277 (array!42786) Bool)

(assert (=> start!67746 (array_inv!16277 a!3186)))

(declare-fun b!786453 () Bool)

(assert (=> b!786453 (= e!437192 e!437188)))

(declare-fun res!532507 () Bool)

(assert (=> b!786453 (=> res!532507 e!437188)))

(declare-fun lt!350738 () (_ BitVec 64))

(assert (=> b!786453 (= res!532507 (= lt!350743 lt!350738))))

(assert (=> b!786453 (= lt!350743 (select (store (arr!20481 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786460 () Bool)

(declare-fun res!532500 () Bool)

(assert (=> b!786460 (=> (not res!532500) (not e!437185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786460 (= res!532500 (validKeyInArray!0 k!2102))))

(declare-fun b!786461 () Bool)

(declare-fun res!532504 () Bool)

(assert (=> b!786461 (=> (not res!532504) (not e!437187))))

(assert (=> b!786461 (= res!532504 e!437186)))

(declare-fun c!87385 () Bool)

(assert (=> b!786461 (= c!87385 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786462 () Bool)

(declare-fun res!532509 () Bool)

(assert (=> b!786462 (=> (not res!532509) (not e!437185))))

(assert (=> b!786462 (= res!532509 (validKeyInArray!0 (select (arr!20481 a!3186) j!159)))))

(declare-fun b!786463 () Bool)

(declare-fun res!532498 () Bool)

(assert (=> b!786463 (=> (not res!532498) (not e!437187))))

(assert (=> b!786463 (= res!532498 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20481 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786464 () Bool)

(assert (=> b!786464 (= e!437187 e!437182)))

(declare-fun res!532512 () Bool)

(assert (=> b!786464 (=> (not res!532512) (not e!437182))))

(declare-fun lt!350744 () SeekEntryResult!8081)

(assert (=> b!786464 (= res!532512 (= lt!350744 lt!350742))))

(declare-fun lt!350735 () array!42786)

(assert (=> b!786464 (= lt!350742 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350738 lt!350735 mask!3328))))

(assert (=> b!786464 (= lt!350744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350738 mask!3328) lt!350738 lt!350735 mask!3328))))

(assert (=> b!786464 (= lt!350738 (select (store (arr!20481 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786464 (= lt!350735 (array!42787 (store (arr!20481 a!3186) i!1173 k!2102) (size!20902 a!3186)))))

(declare-fun b!786465 () Bool)

(declare-fun res!532514 () Bool)

(assert (=> b!786465 (=> (not res!532514) (not e!437185))))

(assert (=> b!786465 (= res!532514 (and (= (size!20902 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20902 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20902 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786466 () Bool)

(declare-fun res!532503 () Bool)

(assert (=> b!786466 (=> (not res!532503) (not e!437189))))

(declare-datatypes ((List!14483 0))(
  ( (Nil!14480) (Cons!14479 (h!15602 (_ BitVec 64)) (t!20798 List!14483)) )
))
(declare-fun arrayNoDuplicates!0 (array!42786 (_ BitVec 32) List!14483) Bool)

(assert (=> b!786466 (= res!532503 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14480))))

(declare-fun b!786467 () Bool)

(declare-fun res!532506 () Bool)

(assert (=> b!786467 (=> (not res!532506) (not e!437191))))

(assert (=> b!786467 (= res!532506 (= (seekEntryOrOpen!0 lt!350738 lt!350735 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350738 lt!350735 mask!3328)))))

(declare-fun b!786468 () Bool)

(declare-fun res!532508 () Bool)

(assert (=> b!786468 (=> (not res!532508) (not e!437189))))

(assert (=> b!786468 (= res!532508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786469 () Bool)

(declare-fun Unit!27214 () Unit!27212)

(assert (=> b!786469 (= e!437181 Unit!27214)))

(assert (=> b!786469 false))

(declare-fun b!786470 () Bool)

(declare-fun Unit!27215 () Unit!27212)

(assert (=> b!786470 (= e!437181 Unit!27215)))

(declare-fun b!786471 () Bool)

(assert (=> b!786471 (= e!437184 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20481 a!3186) j!159) a!3186 mask!3328) lt!350733))))

(assert (= (and start!67746 res!532505) b!786465))

(assert (= (and b!786465 res!532514) b!786462))

(assert (= (and b!786462 res!532509) b!786460))

(assert (= (and b!786460 res!532500) b!786456))

(assert (= (and b!786456 res!532511) b!786457))

(assert (= (and b!786457 res!532501) b!786468))

(assert (= (and b!786468 res!532508) b!786466))

(assert (= (and b!786466 res!532503) b!786450))

(assert (= (and b!786450 res!532499) b!786449))

(assert (= (and b!786449 res!532502) b!786463))

(assert (= (and b!786463 res!532498) b!786461))

(assert (= (and b!786461 c!87385) b!786452))

(assert (= (and b!786461 (not c!87385)) b!786454))

(assert (= (and b!786461 res!532504) b!786464))

(assert (= (and b!786464 res!532512) b!786458))

(assert (= (and b!786458 res!532497) b!786471))

(assert (= (and b!786458 (not res!532510)) b!786451))

(assert (= (and b!786451 (not res!532496)) b!786453))

(assert (= (and b!786453 (not res!532507)) b!786455))

(assert (= (and b!786455 c!87384) b!786469))

(assert (= (and b!786455 (not c!87384)) b!786470))

(assert (= (and b!786455 res!532513) b!786467))

(assert (= (and b!786467 res!532506) b!786459))

(declare-fun m!728273 () Bool)

(assert (=> b!786463 m!728273))

(declare-fun m!728275 () Bool)

(assert (=> b!786471 m!728275))

(assert (=> b!786471 m!728275))

(declare-fun m!728277 () Bool)

(assert (=> b!786471 m!728277))

(assert (=> b!786449 m!728275))

(assert (=> b!786449 m!728275))

(declare-fun m!728279 () Bool)

(assert (=> b!786449 m!728279))

(assert (=> b!786449 m!728279))

(assert (=> b!786449 m!728275))

(declare-fun m!728281 () Bool)

(assert (=> b!786449 m!728281))

(assert (=> b!786462 m!728275))

(assert (=> b!786462 m!728275))

(declare-fun m!728283 () Bool)

(assert (=> b!786462 m!728283))

(declare-fun m!728285 () Bool)

(assert (=> b!786453 m!728285))

(declare-fun m!728287 () Bool)

(assert (=> b!786453 m!728287))

(declare-fun m!728289 () Bool)

(assert (=> b!786467 m!728289))

(declare-fun m!728291 () Bool)

(assert (=> b!786467 m!728291))

(assert (=> b!786454 m!728275))

(assert (=> b!786454 m!728275))

(declare-fun m!728293 () Bool)

(assert (=> b!786454 m!728293))

(assert (=> b!786451 m!728275))

(assert (=> b!786451 m!728275))

(assert (=> b!786451 m!728293))

(assert (=> b!786452 m!728275))

(assert (=> b!786452 m!728275))

(declare-fun m!728295 () Bool)

(assert (=> b!786452 m!728295))

(declare-fun m!728297 () Bool)

(assert (=> b!786460 m!728297))

(declare-fun m!728299 () Bool)

(assert (=> b!786457 m!728299))

(declare-fun m!728301 () Bool)

(assert (=> b!786456 m!728301))

(declare-fun m!728303 () Bool)

(assert (=> b!786468 m!728303))

(declare-fun m!728305 () Bool)

(assert (=> b!786464 m!728305))

(declare-fun m!728307 () Bool)

(assert (=> b!786464 m!728307))

(assert (=> b!786464 m!728285))

(declare-fun m!728309 () Bool)

(assert (=> b!786464 m!728309))

(assert (=> b!786464 m!728307))

(declare-fun m!728311 () Bool)

(assert (=> b!786464 m!728311))

(declare-fun m!728313 () Bool)

(assert (=> start!67746 m!728313))

(declare-fun m!728315 () Bool)

(assert (=> start!67746 m!728315))

(assert (=> b!786458 m!728275))

(assert (=> b!786458 m!728275))

(declare-fun m!728317 () Bool)

(assert (=> b!786458 m!728317))

(declare-fun m!728319 () Bool)

(assert (=> b!786458 m!728319))

(declare-fun m!728321 () Bool)

(assert (=> b!786458 m!728321))

(declare-fun m!728323 () Bool)

(assert (=> b!786466 m!728323))

(push 1)

