; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44978 () Bool)

(assert start!44978)

(declare-fun b!493405 () Bool)

(declare-fun e!289756 () Bool)

(declare-fun e!289755 () Bool)

(assert (=> b!493405 (= e!289756 (not e!289755))))

(declare-fun res!296030 () Bool)

(assert (=> b!493405 (=> res!296030 e!289755)))

(declare-datatypes ((SeekEntryResult!3769 0))(
  ( (MissingZero!3769 (index!17255 (_ BitVec 32))) (Found!3769 (index!17256 (_ BitVec 32))) (Intermediate!3769 (undefined!4581 Bool) (index!17257 (_ BitVec 32)) (x!46484 (_ BitVec 32))) (Undefined!3769) (MissingVacant!3769 (index!17258 (_ BitVec 32))) )
))
(declare-fun lt!223201 () SeekEntryResult!3769)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31924 0))(
  ( (array!31925 (arr!15346 (Array (_ BitVec 32) (_ BitVec 64))) (size!15710 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31924)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31924 (_ BitVec 32)) SeekEntryResult!3769)

(assert (=> b!493405 (= res!296030 (= lt!223201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223204 (select (store (arr!15346 a!3235) i!1204 k0!2280) j!176) (array!31925 (store (arr!15346 a!3235) i!1204 k0!2280) (size!15710 a!3235)) mask!3524)))))

(declare-fun lt!223200 () (_ BitVec 32))

(assert (=> b!493405 (= lt!223201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223200 (select (arr!15346 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493405 (= lt!223204 (toIndex!0 (select (store (arr!15346 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493405 (= lt!223200 (toIndex!0 (select (arr!15346 a!3235) j!176) mask!3524))))

(declare-fun lt!223203 () SeekEntryResult!3769)

(assert (=> b!493405 (= lt!223203 (Found!3769 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31924 (_ BitVec 32)) SeekEntryResult!3769)

(assert (=> b!493405 (= lt!223203 (seekEntryOrOpen!0 (select (arr!15346 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31924 (_ BitVec 32)) Bool)

(assert (=> b!493405 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14545 0))(
  ( (Unit!14546) )
))
(declare-fun lt!223199 () Unit!14545)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14545)

(assert (=> b!493405 (= lt!223199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493406 () Bool)

(declare-fun e!289758 () Bool)

(assert (=> b!493406 (= e!289758 e!289756)))

(declare-fun res!296031 () Bool)

(assert (=> b!493406 (=> (not res!296031) (not e!289756))))

(declare-fun lt!223202 () SeekEntryResult!3769)

(assert (=> b!493406 (= res!296031 (or (= lt!223202 (MissingZero!3769 i!1204)) (= lt!223202 (MissingVacant!3769 i!1204))))))

(assert (=> b!493406 (= lt!223202 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493407 () Bool)

(assert (=> b!493407 (= e!289755 true)))

(assert (=> b!493407 (= lt!223203 Undefined!3769)))

(declare-fun res!296038 () Bool)

(assert (=> start!44978 (=> (not res!296038) (not e!289758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44978 (= res!296038 (validMask!0 mask!3524))))

(assert (=> start!44978 e!289758))

(assert (=> start!44978 true))

(declare-fun array_inv!11205 (array!31924) Bool)

(assert (=> start!44978 (array_inv!11205 a!3235)))

(declare-fun b!493408 () Bool)

(declare-fun res!296036 () Bool)

(assert (=> b!493408 (=> (not res!296036) (not e!289758))))

(declare-fun arrayContainsKey!0 (array!31924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493408 (= res!296036 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493409 () Bool)

(declare-fun res!296032 () Bool)

(assert (=> b!493409 (=> res!296032 e!289755)))

(get-info :version)

(assert (=> b!493409 (= res!296032 (or (not ((_ is Intermediate!3769) lt!223201)) (not (undefined!4581 lt!223201))))))

(declare-fun b!493410 () Bool)

(declare-fun res!296035 () Bool)

(assert (=> b!493410 (=> (not res!296035) (not e!289756))))

(assert (=> b!493410 (= res!296035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493411 () Bool)

(declare-fun res!296034 () Bool)

(assert (=> b!493411 (=> (not res!296034) (not e!289758))))

(assert (=> b!493411 (= res!296034 (and (= (size!15710 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15710 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15710 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493412 () Bool)

(declare-fun res!296033 () Bool)

(assert (=> b!493412 (=> (not res!296033) (not e!289758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493412 (= res!296033 (validKeyInArray!0 k0!2280))))

(declare-fun b!493413 () Bool)

(declare-fun res!296037 () Bool)

(assert (=> b!493413 (=> (not res!296037) (not e!289758))))

(assert (=> b!493413 (= res!296037 (validKeyInArray!0 (select (arr!15346 a!3235) j!176)))))

(declare-fun b!493414 () Bool)

(declare-fun res!296029 () Bool)

(assert (=> b!493414 (=> (not res!296029) (not e!289756))))

(declare-datatypes ((List!9411 0))(
  ( (Nil!9408) (Cons!9407 (h!10275 (_ BitVec 64)) (t!15631 List!9411)) )
))
(declare-fun arrayNoDuplicates!0 (array!31924 (_ BitVec 32) List!9411) Bool)

(assert (=> b!493414 (= res!296029 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9408))))

(assert (= (and start!44978 res!296038) b!493411))

(assert (= (and b!493411 res!296034) b!493413))

(assert (= (and b!493413 res!296037) b!493412))

(assert (= (and b!493412 res!296033) b!493408))

(assert (= (and b!493408 res!296036) b!493406))

(assert (= (and b!493406 res!296031) b!493410))

(assert (= (and b!493410 res!296035) b!493414))

(assert (= (and b!493414 res!296029) b!493405))

(assert (= (and b!493405 (not res!296030)) b!493409))

(assert (= (and b!493409 (not res!296032)) b!493407))

(declare-fun m!474499 () Bool)

(assert (=> b!493405 m!474499))

(declare-fun m!474501 () Bool)

(assert (=> b!493405 m!474501))

(declare-fun m!474503 () Bool)

(assert (=> b!493405 m!474503))

(declare-fun m!474505 () Bool)

(assert (=> b!493405 m!474505))

(assert (=> b!493405 m!474499))

(declare-fun m!474507 () Bool)

(assert (=> b!493405 m!474507))

(declare-fun m!474509 () Bool)

(assert (=> b!493405 m!474509))

(assert (=> b!493405 m!474507))

(declare-fun m!474511 () Bool)

(assert (=> b!493405 m!474511))

(assert (=> b!493405 m!474507))

(declare-fun m!474513 () Bool)

(assert (=> b!493405 m!474513))

(assert (=> b!493405 m!474507))

(declare-fun m!474515 () Bool)

(assert (=> b!493405 m!474515))

(assert (=> b!493405 m!474499))

(declare-fun m!474517 () Bool)

(assert (=> b!493405 m!474517))

(declare-fun m!474519 () Bool)

(assert (=> b!493412 m!474519))

(declare-fun m!474521 () Bool)

(assert (=> b!493410 m!474521))

(assert (=> b!493413 m!474507))

(assert (=> b!493413 m!474507))

(declare-fun m!474523 () Bool)

(assert (=> b!493413 m!474523))

(declare-fun m!474525 () Bool)

(assert (=> b!493414 m!474525))

(declare-fun m!474527 () Bool)

(assert (=> start!44978 m!474527))

(declare-fun m!474529 () Bool)

(assert (=> start!44978 m!474529))

(declare-fun m!474531 () Bool)

(assert (=> b!493406 m!474531))

(declare-fun m!474533 () Bool)

(assert (=> b!493408 m!474533))

(check-sat (not start!44978) (not b!493412) (not b!493410) (not b!493405) (not b!493408) (not b!493406) (not b!493413) (not b!493414))
(check-sat)
