; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45254 () Bool)

(assert start!45254)

(declare-fun b!497014 () Bool)

(declare-fun e!291383 () Bool)

(assert (=> b!497014 (= e!291383 true)))

(declare-datatypes ((SeekEntryResult!3921 0))(
  ( (MissingZero!3921 (index!17863 (_ BitVec 32))) (Found!3921 (index!17864 (_ BitVec 32))) (Intermediate!3921 (undefined!4733 Bool) (index!17865 (_ BitVec 32)) (x!46917 (_ BitVec 32))) (Undefined!3921) (MissingVacant!3921 (index!17866 (_ BitVec 32))) )
))
(declare-fun lt!225007 () SeekEntryResult!3921)

(declare-datatypes ((array!32142 0))(
  ( (array!32143 (arr!15454 (Array (_ BitVec 32) (_ BitVec 64))) (size!15818 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32142)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497014 (and (bvslt (x!46917 lt!225007) #b01111111111111111111111111111110) (or (= (select (arr!15454 a!3235) (index!17865 lt!225007)) (select (arr!15454 a!3235) j!176)) (= (select (arr!15454 a!3235) (index!17865 lt!225007)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15454 a!3235) (index!17865 lt!225007)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497015 () Bool)

(declare-fun e!291387 () Bool)

(declare-fun e!291386 () Bool)

(assert (=> b!497015 (= e!291387 e!291386)))

(declare-fun res!299404 () Bool)

(assert (=> b!497015 (=> (not res!299404) (not e!291386))))

(declare-fun lt!225005 () SeekEntryResult!3921)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497015 (= res!299404 (or (= lt!225005 (MissingZero!3921 i!1204)) (= lt!225005 (MissingVacant!3921 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32142 (_ BitVec 32)) SeekEntryResult!3921)

(assert (=> b!497015 (= lt!225005 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299409 () Bool)

(assert (=> start!45254 (=> (not res!299409) (not e!291387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45254 (= res!299409 (validMask!0 mask!3524))))

(assert (=> start!45254 e!291387))

(assert (=> start!45254 true))

(declare-fun array_inv!11250 (array!32142) Bool)

(assert (=> start!45254 (array_inv!11250 a!3235)))

(declare-fun b!497016 () Bool)

(declare-fun res!299411 () Bool)

(assert (=> b!497016 (=> (not res!299411) (not e!291387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497016 (= res!299411 (validKeyInArray!0 (select (arr!15454 a!3235) j!176)))))

(declare-fun e!291384 () Bool)

(declare-fun b!497017 () Bool)

(assert (=> b!497017 (= e!291384 (= (seekEntryOrOpen!0 (select (arr!15454 a!3235) j!176) a!3235 mask!3524) (Found!3921 j!176)))))

(declare-fun b!497018 () Bool)

(declare-fun res!299405 () Bool)

(assert (=> b!497018 (=> (not res!299405) (not e!291387))))

(assert (=> b!497018 (= res!299405 (validKeyInArray!0 k0!2280))))

(declare-fun b!497019 () Bool)

(declare-fun res!299410 () Bool)

(assert (=> b!497019 (=> res!299410 e!291383)))

(get-info :version)

(assert (=> b!497019 (= res!299410 (or (undefined!4733 lt!225007) (not ((_ is Intermediate!3921) lt!225007))))))

(declare-fun b!497020 () Bool)

(declare-fun res!299407 () Bool)

(assert (=> b!497020 (=> (not res!299407) (not e!291387))))

(assert (=> b!497020 (= res!299407 (and (= (size!15818 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15818 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15818 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497021 () Bool)

(declare-fun res!299406 () Bool)

(assert (=> b!497021 (=> (not res!299406) (not e!291387))))

(declare-fun arrayContainsKey!0 (array!32142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497021 (= res!299406 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497022 () Bool)

(assert (=> b!497022 (= e!291386 (not e!291383))))

(declare-fun res!299401 () Bool)

(assert (=> b!497022 (=> res!299401 e!291383)))

(declare-fun lt!225004 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32142 (_ BitVec 32)) SeekEntryResult!3921)

(assert (=> b!497022 (= res!299401 (= lt!225007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225004 (select (store (arr!15454 a!3235) i!1204 k0!2280) j!176) (array!32143 (store (arr!15454 a!3235) i!1204 k0!2280) (size!15818 a!3235)) mask!3524)))))

(declare-fun lt!225003 () (_ BitVec 32))

(assert (=> b!497022 (= lt!225007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225003 (select (arr!15454 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497022 (= lt!225004 (toIndex!0 (select (store (arr!15454 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497022 (= lt!225003 (toIndex!0 (select (arr!15454 a!3235) j!176) mask!3524))))

(assert (=> b!497022 e!291384))

(declare-fun res!299402 () Bool)

(assert (=> b!497022 (=> (not res!299402) (not e!291384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32142 (_ BitVec 32)) Bool)

(assert (=> b!497022 (= res!299402 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14788 0))(
  ( (Unit!14789) )
))
(declare-fun lt!225006 () Unit!14788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14788)

(assert (=> b!497022 (= lt!225006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497023 () Bool)

(declare-fun res!299408 () Bool)

(assert (=> b!497023 (=> (not res!299408) (not e!291386))))

(assert (=> b!497023 (= res!299408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497024 () Bool)

(declare-fun res!299403 () Bool)

(assert (=> b!497024 (=> (not res!299403) (not e!291386))))

(declare-datatypes ((List!9612 0))(
  ( (Nil!9609) (Cons!9608 (h!10479 (_ BitVec 64)) (t!15840 List!9612)) )
))
(declare-fun arrayNoDuplicates!0 (array!32142 (_ BitVec 32) List!9612) Bool)

(assert (=> b!497024 (= res!299403 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9609))))

(assert (= (and start!45254 res!299409) b!497020))

(assert (= (and b!497020 res!299407) b!497016))

(assert (= (and b!497016 res!299411) b!497018))

(assert (= (and b!497018 res!299405) b!497021))

(assert (= (and b!497021 res!299406) b!497015))

(assert (= (and b!497015 res!299404) b!497023))

(assert (= (and b!497023 res!299408) b!497024))

(assert (= (and b!497024 res!299403) b!497022))

(assert (= (and b!497022 res!299402) b!497017))

(assert (= (and b!497022 (not res!299401)) b!497019))

(assert (= (and b!497019 (not res!299410)) b!497014))

(declare-fun m!478337 () Bool)

(assert (=> b!497021 m!478337))

(declare-fun m!478339 () Bool)

(assert (=> b!497015 m!478339))

(declare-fun m!478341 () Bool)

(assert (=> b!497016 m!478341))

(assert (=> b!497016 m!478341))

(declare-fun m!478343 () Bool)

(assert (=> b!497016 m!478343))

(declare-fun m!478345 () Bool)

(assert (=> b!497024 m!478345))

(declare-fun m!478347 () Bool)

(assert (=> b!497018 m!478347))

(assert (=> b!497017 m!478341))

(assert (=> b!497017 m!478341))

(declare-fun m!478349 () Bool)

(assert (=> b!497017 m!478349))

(declare-fun m!478351 () Bool)

(assert (=> start!45254 m!478351))

(declare-fun m!478353 () Bool)

(assert (=> start!45254 m!478353))

(declare-fun m!478355 () Bool)

(assert (=> b!497022 m!478355))

(declare-fun m!478357 () Bool)

(assert (=> b!497022 m!478357))

(declare-fun m!478359 () Bool)

(assert (=> b!497022 m!478359))

(assert (=> b!497022 m!478341))

(declare-fun m!478361 () Bool)

(assert (=> b!497022 m!478361))

(assert (=> b!497022 m!478341))

(declare-fun m!478363 () Bool)

(assert (=> b!497022 m!478363))

(assert (=> b!497022 m!478359))

(declare-fun m!478365 () Bool)

(assert (=> b!497022 m!478365))

(assert (=> b!497022 m!478359))

(declare-fun m!478367 () Bool)

(assert (=> b!497022 m!478367))

(assert (=> b!497022 m!478341))

(declare-fun m!478369 () Bool)

(assert (=> b!497022 m!478369))

(declare-fun m!478371 () Bool)

(assert (=> b!497023 m!478371))

(declare-fun m!478373 () Bool)

(assert (=> b!497014 m!478373))

(assert (=> b!497014 m!478341))

(check-sat (not b!497018) (not b!497015) (not b!497023) (not start!45254) (not b!497022) (not b!497017) (not b!497016) (not b!497024) (not b!497021))
(check-sat)
