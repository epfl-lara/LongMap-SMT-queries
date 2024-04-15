; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44862 () Bool)

(assert start!44862)

(declare-fun b!492146 () Bool)

(declare-fun e!289092 () Bool)

(declare-fun e!289094 () Bool)

(assert (=> b!492146 (= e!289092 e!289094)))

(declare-fun res!295047 () Bool)

(assert (=> b!492146 (=> (not res!295047) (not e!289094))))

(declare-datatypes ((SeekEntryResult!3787 0))(
  ( (MissingZero!3787 (index!17327 (_ BitVec 32))) (Found!3787 (index!17328 (_ BitVec 32))) (Intermediate!3787 (undefined!4599 Bool) (index!17329 (_ BitVec 32)) (x!46422 (_ BitVec 32))) (Undefined!3787) (MissingVacant!3787 (index!17330 (_ BitVec 32))) )
))
(declare-fun lt!222377 () SeekEntryResult!3787)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492146 (= res!295047 (or (= lt!222377 (MissingZero!3787 i!1204)) (= lt!222377 (MissingVacant!3787 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31874 0))(
  ( (array!31875 (arr!15323 (Array (_ BitVec 32) (_ BitVec 64))) (size!15688 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31874)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31874 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!492146 (= lt!222377 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492147 () Bool)

(assert (=> b!492147 (= e!289094 (not true))))

(declare-fun lt!222379 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222375 () SeekEntryResult!3787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31874 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!492147 (= lt!222375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222379 (select (store (arr!15323 a!3235) i!1204 k0!2280) j!176) (array!31875 (store (arr!15323 a!3235) i!1204 k0!2280) (size!15688 a!3235)) mask!3524))))

(declare-fun lt!222376 () SeekEntryResult!3787)

(declare-fun lt!222378 () (_ BitVec 32))

(assert (=> b!492147 (= lt!222376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222378 (select (arr!15323 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492147 (= lt!222379 (toIndex!0 (select (store (arr!15323 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492147 (= lt!222378 (toIndex!0 (select (arr!15323 a!3235) j!176) mask!3524))))

(declare-fun e!289093 () Bool)

(assert (=> b!492147 e!289093))

(declare-fun res!295042 () Bool)

(assert (=> b!492147 (=> (not res!295042) (not e!289093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31874 (_ BitVec 32)) Bool)

(assert (=> b!492147 (= res!295042 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14506 0))(
  ( (Unit!14507) )
))
(declare-fun lt!222374 () Unit!14506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14506)

(assert (=> b!492147 (= lt!222374 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492148 () Bool)

(declare-fun res!295048 () Bool)

(assert (=> b!492148 (=> (not res!295048) (not e!289094))))

(assert (=> b!492148 (= res!295048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492149 () Bool)

(declare-fun res!295044 () Bool)

(assert (=> b!492149 (=> (not res!295044) (not e!289094))))

(declare-datatypes ((List!9520 0))(
  ( (Nil!9517) (Cons!9516 (h!10381 (_ BitVec 64)) (t!15739 List!9520)) )
))
(declare-fun arrayNoDuplicates!0 (array!31874 (_ BitVec 32) List!9520) Bool)

(assert (=> b!492149 (= res!295044 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9517))))

(declare-fun b!492150 () Bool)

(declare-fun res!295045 () Bool)

(assert (=> b!492150 (=> (not res!295045) (not e!289092))))

(assert (=> b!492150 (= res!295045 (and (= (size!15688 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15688 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15688 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492151 () Bool)

(declare-fun res!295041 () Bool)

(assert (=> b!492151 (=> (not res!295041) (not e!289092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492151 (= res!295041 (validKeyInArray!0 (select (arr!15323 a!3235) j!176)))))

(declare-fun b!492152 () Bool)

(declare-fun res!295043 () Bool)

(assert (=> b!492152 (=> (not res!295043) (not e!289092))))

(declare-fun arrayContainsKey!0 (array!31874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492152 (= res!295043 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295049 () Bool)

(assert (=> start!44862 (=> (not res!295049) (not e!289092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44862 (= res!295049 (validMask!0 mask!3524))))

(assert (=> start!44862 e!289092))

(assert (=> start!44862 true))

(declare-fun array_inv!11206 (array!31874) Bool)

(assert (=> start!44862 (array_inv!11206 a!3235)))

(declare-fun b!492153 () Bool)

(assert (=> b!492153 (= e!289093 (= (seekEntryOrOpen!0 (select (arr!15323 a!3235) j!176) a!3235 mask!3524) (Found!3787 j!176)))))

(declare-fun b!492154 () Bool)

(declare-fun res!295046 () Bool)

(assert (=> b!492154 (=> (not res!295046) (not e!289092))))

(assert (=> b!492154 (= res!295046 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44862 res!295049) b!492150))

(assert (= (and b!492150 res!295045) b!492151))

(assert (= (and b!492151 res!295041) b!492154))

(assert (= (and b!492154 res!295046) b!492152))

(assert (= (and b!492152 res!295043) b!492146))

(assert (= (and b!492146 res!295047) b!492148))

(assert (= (and b!492148 res!295048) b!492149))

(assert (= (and b!492149 res!295044) b!492147))

(assert (= (and b!492147 res!295042) b!492153))

(declare-fun m!472387 () Bool)

(assert (=> b!492146 m!472387))

(declare-fun m!472389 () Bool)

(assert (=> b!492151 m!472389))

(assert (=> b!492151 m!472389))

(declare-fun m!472391 () Bool)

(assert (=> b!492151 m!472391))

(declare-fun m!472393 () Bool)

(assert (=> start!44862 m!472393))

(declare-fun m!472395 () Bool)

(assert (=> start!44862 m!472395))

(declare-fun m!472397 () Bool)

(assert (=> b!492148 m!472397))

(declare-fun m!472399 () Bool)

(assert (=> b!492147 m!472399))

(declare-fun m!472401 () Bool)

(assert (=> b!492147 m!472401))

(declare-fun m!472403 () Bool)

(assert (=> b!492147 m!472403))

(assert (=> b!492147 m!472389))

(declare-fun m!472405 () Bool)

(assert (=> b!492147 m!472405))

(declare-fun m!472407 () Bool)

(assert (=> b!492147 m!472407))

(assert (=> b!492147 m!472403))

(declare-fun m!472409 () Bool)

(assert (=> b!492147 m!472409))

(assert (=> b!492147 m!472403))

(declare-fun m!472411 () Bool)

(assert (=> b!492147 m!472411))

(assert (=> b!492147 m!472389))

(declare-fun m!472413 () Bool)

(assert (=> b!492147 m!472413))

(assert (=> b!492147 m!472389))

(declare-fun m!472415 () Bool)

(assert (=> b!492149 m!472415))

(declare-fun m!472417 () Bool)

(assert (=> b!492152 m!472417))

(declare-fun m!472419 () Bool)

(assert (=> b!492154 m!472419))

(assert (=> b!492153 m!472389))

(assert (=> b!492153 m!472389))

(declare-fun m!472421 () Bool)

(assert (=> b!492153 m!472421))

(check-sat (not b!492149) (not b!492152) (not b!492148) (not b!492147) (not b!492151) (not b!492154) (not b!492153) (not b!492146) (not start!44862))
(check-sat)
