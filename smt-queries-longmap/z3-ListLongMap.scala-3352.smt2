; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46092 () Bool)

(assert start!46092)

(declare-fun b!510431 () Bool)

(declare-fun e!298309 () Bool)

(declare-fun e!298308 () Bool)

(assert (=> b!510431 (= e!298309 e!298308)))

(declare-fun res!311424 () Bool)

(assert (=> b!510431 (=> (not res!311424) (not e!298308))))

(declare-datatypes ((SeekEntryResult!4249 0))(
  ( (MissingZero!4249 (index!19184 (_ BitVec 32))) (Found!4249 (index!19185 (_ BitVec 32))) (Intermediate!4249 (undefined!5061 Bool) (index!19186 (_ BitVec 32)) (x!48149 (_ BitVec 32))) (Undefined!4249) (MissingVacant!4249 (index!19187 (_ BitVec 32))) )
))
(declare-fun lt!233326 () SeekEntryResult!4249)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510431 (= res!311424 (or (= lt!233326 (MissingZero!4249 i!1204)) (= lt!233326 (MissingVacant!4249 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32813 0))(
  ( (array!32814 (arr!15785 (Array (_ BitVec 32) (_ BitVec 64))) (size!16150 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32813)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32813 (_ BitVec 32)) SeekEntryResult!4249)

(assert (=> b!510431 (= lt!233326 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!311426 () Bool)

(assert (=> start!46092 (=> (not res!311426) (not e!298309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46092 (= res!311426 (validMask!0 mask!3524))))

(assert (=> start!46092 e!298309))

(assert (=> start!46092 true))

(declare-fun array_inv!11668 (array!32813) Bool)

(assert (=> start!46092 (array_inv!11668 a!3235)))

(declare-fun b!510432 () Bool)

(declare-fun res!311418 () Bool)

(assert (=> b!510432 (=> (not res!311418) (not e!298309))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510432 (= res!311418 (and (= (size!16150 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16150 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16150 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510433 () Bool)

(declare-fun e!298311 () Bool)

(assert (=> b!510433 (= e!298308 (not e!298311))))

(declare-fun res!311420 () Bool)

(assert (=> b!510433 (=> res!311420 e!298311)))

(declare-fun lt!233325 () (_ BitVec 64))

(declare-fun lt!233328 () array!32813)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32813 (_ BitVec 32)) SeekEntryResult!4249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510433 (= res!311420 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15785 a!3235) j!176) mask!3524) (select (arr!15785 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233325 mask!3524) lt!233325 lt!233328 mask!3524))))))

(assert (=> b!510433 (= lt!233325 (select (store (arr!15785 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510433 (= lt!233328 (array!32814 (store (arr!15785 a!3235) i!1204 k0!2280) (size!16150 a!3235)))))

(declare-fun lt!233327 () SeekEntryResult!4249)

(assert (=> b!510433 (= lt!233327 (Found!4249 j!176))))

(assert (=> b!510433 (= lt!233327 (seekEntryOrOpen!0 (select (arr!15785 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32813 (_ BitVec 32)) Bool)

(assert (=> b!510433 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15742 0))(
  ( (Unit!15743) )
))
(declare-fun lt!233329 () Unit!15742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15742)

(assert (=> b!510433 (= lt!233329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510434 () Bool)

(assert (=> b!510434 (= e!298311 true)))

(assert (=> b!510434 (= lt!233327 (seekEntryOrOpen!0 lt!233325 lt!233328 mask!3524))))

(declare-fun lt!233324 () Unit!15742)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32813 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15742)

(assert (=> b!510434 (= lt!233324 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510435 () Bool)

(declare-fun res!311419 () Bool)

(assert (=> b!510435 (=> (not res!311419) (not e!298308))))

(declare-datatypes ((List!9982 0))(
  ( (Nil!9979) (Cons!9978 (h!10855 (_ BitVec 64)) (t!16201 List!9982)) )
))
(declare-fun arrayNoDuplicates!0 (array!32813 (_ BitVec 32) List!9982) Bool)

(assert (=> b!510435 (= res!311419 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9979))))

(declare-fun b!510436 () Bool)

(declare-fun res!311421 () Bool)

(assert (=> b!510436 (=> (not res!311421) (not e!298308))))

(assert (=> b!510436 (= res!311421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510437 () Bool)

(declare-fun res!311422 () Bool)

(assert (=> b!510437 (=> (not res!311422) (not e!298309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510437 (= res!311422 (validKeyInArray!0 (select (arr!15785 a!3235) j!176)))))

(declare-fun b!510438 () Bool)

(declare-fun res!311423 () Bool)

(assert (=> b!510438 (=> (not res!311423) (not e!298309))))

(assert (=> b!510438 (= res!311423 (validKeyInArray!0 k0!2280))))

(declare-fun b!510439 () Bool)

(declare-fun res!311425 () Bool)

(assert (=> b!510439 (=> (not res!311425) (not e!298309))))

(declare-fun arrayContainsKey!0 (array!32813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510439 (= res!311425 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46092 res!311426) b!510432))

(assert (= (and b!510432 res!311418) b!510437))

(assert (= (and b!510437 res!311422) b!510438))

(assert (= (and b!510438 res!311423) b!510439))

(assert (= (and b!510439 res!311425) b!510431))

(assert (= (and b!510431 res!311424) b!510436))

(assert (= (and b!510436 res!311421) b!510435))

(assert (= (and b!510435 res!311419) b!510433))

(assert (= (and b!510433 (not res!311420)) b!510434))

(declare-fun m!491341 () Bool)

(assert (=> b!510436 m!491341))

(declare-fun m!491343 () Bool)

(assert (=> b!510437 m!491343))

(assert (=> b!510437 m!491343))

(declare-fun m!491345 () Bool)

(assert (=> b!510437 m!491345))

(declare-fun m!491347 () Bool)

(assert (=> b!510435 m!491347))

(declare-fun m!491349 () Bool)

(assert (=> b!510439 m!491349))

(declare-fun m!491351 () Bool)

(assert (=> b!510431 m!491351))

(declare-fun m!491353 () Bool)

(assert (=> b!510438 m!491353))

(declare-fun m!491355 () Bool)

(assert (=> b!510434 m!491355))

(declare-fun m!491357 () Bool)

(assert (=> b!510434 m!491357))

(declare-fun m!491359 () Bool)

(assert (=> b!510433 m!491359))

(declare-fun m!491361 () Bool)

(assert (=> b!510433 m!491361))

(declare-fun m!491363 () Bool)

(assert (=> b!510433 m!491363))

(assert (=> b!510433 m!491343))

(declare-fun m!491365 () Bool)

(assert (=> b!510433 m!491365))

(assert (=> b!510433 m!491343))

(assert (=> b!510433 m!491363))

(assert (=> b!510433 m!491343))

(declare-fun m!491367 () Bool)

(assert (=> b!510433 m!491367))

(declare-fun m!491369 () Bool)

(assert (=> b!510433 m!491369))

(assert (=> b!510433 m!491343))

(declare-fun m!491371 () Bool)

(assert (=> b!510433 m!491371))

(declare-fun m!491373 () Bool)

(assert (=> b!510433 m!491373))

(assert (=> b!510433 m!491369))

(declare-fun m!491375 () Bool)

(assert (=> b!510433 m!491375))

(declare-fun m!491377 () Bool)

(assert (=> start!46092 m!491377))

(declare-fun m!491379 () Bool)

(assert (=> start!46092 m!491379))

(check-sat (not start!46092) (not b!510437) (not b!510438) (not b!510436) (not b!510435) (not b!510434) (not b!510439) (not b!510433) (not b!510431))
(check-sat)
