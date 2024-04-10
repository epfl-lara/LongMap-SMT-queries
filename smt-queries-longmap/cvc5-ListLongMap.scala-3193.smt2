; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44784 () Bool)

(assert start!44784)

(declare-fun b!491687 () Bool)

(declare-fun e!288868 () Bool)

(declare-fun e!288867 () Bool)

(assert (=> b!491687 (= e!288868 e!288867)))

(declare-fun res!294629 () Bool)

(assert (=> b!491687 (=> res!294629 e!288867)))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!491687 (= res!294629 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3776 0))(
  ( (MissingZero!3776 (index!17283 (_ BitVec 32))) (Found!3776 (index!17284 (_ BitVec 32))) (Intermediate!3776 (undefined!4588 Bool) (index!17285 (_ BitVec 32)) (x!46370 (_ BitVec 32))) (Undefined!3776) (MissingVacant!3776 (index!17286 (_ BitVec 32))) )
))
(declare-fun lt!222320 () SeekEntryResult!3776)

(declare-datatypes ((array!31843 0))(
  ( (array!31844 (arr!15309 (Array (_ BitVec 32) (_ BitVec 64))) (size!15673 (_ BitVec 32))) )
))
(declare-fun lt!222322 () array!31843)

(declare-fun lt!222317 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31843 (_ BitVec 32)) SeekEntryResult!3776)

(assert (=> b!491687 (= lt!222320 (seekEntryOrOpen!0 lt!222317 lt!222322 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31843)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14498 0))(
  ( (Unit!14499) )
))
(declare-fun lt!222318 () Unit!14498)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31843 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14498)

(assert (=> b!491687 (= lt!222318 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491688 () Bool)

(declare-fun res!294623 () Bool)

(declare-fun e!288866 () Bool)

(assert (=> b!491688 (=> (not res!294623) (not e!288866))))

(assert (=> b!491688 (= res!294623 (and (= (size!15673 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15673 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15673 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491689 () Bool)

(declare-fun e!288870 () Bool)

(assert (=> b!491689 (= e!288870 (not e!288868))))

(declare-fun res!294627 () Bool)

(assert (=> b!491689 (=> res!294627 e!288868)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31843 (_ BitVec 32)) SeekEntryResult!3776)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491689 (= res!294627 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15309 a!3235) j!176) mask!3524) (select (arr!15309 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222317 mask!3524) lt!222317 lt!222322 mask!3524))))))

(assert (=> b!491689 (= lt!222317 (select (store (arr!15309 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491689 (= lt!222322 (array!31844 (store (arr!15309 a!3235) i!1204 k!2280) (size!15673 a!3235)))))

(assert (=> b!491689 (= lt!222320 (Found!3776 j!176))))

(assert (=> b!491689 (= lt!222320 (seekEntryOrOpen!0 (select (arr!15309 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31843 (_ BitVec 32)) Bool)

(assert (=> b!491689 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222321 () Unit!14498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14498)

(assert (=> b!491689 (= lt!222321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491690 () Bool)

(declare-fun res!294626 () Bool)

(assert (=> b!491690 (=> (not res!294626) (not e!288866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491690 (= res!294626 (validKeyInArray!0 (select (arr!15309 a!3235) j!176)))))

(declare-fun res!294624 () Bool)

(assert (=> start!44784 (=> (not res!294624) (not e!288866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44784 (= res!294624 (validMask!0 mask!3524))))

(assert (=> start!44784 e!288866))

(assert (=> start!44784 true))

(declare-fun array_inv!11105 (array!31843) Bool)

(assert (=> start!44784 (array_inv!11105 a!3235)))

(declare-fun b!491691 () Bool)

(assert (=> b!491691 (= e!288866 e!288870)))

(declare-fun res!294630 () Bool)

(assert (=> b!491691 (=> (not res!294630) (not e!288870))))

(declare-fun lt!222319 () SeekEntryResult!3776)

(assert (=> b!491691 (= res!294630 (or (= lt!222319 (MissingZero!3776 i!1204)) (= lt!222319 (MissingVacant!3776 i!1204))))))

(assert (=> b!491691 (= lt!222319 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491692 () Bool)

(declare-fun res!294631 () Bool)

(assert (=> b!491692 (=> (not res!294631) (not e!288866))))

(assert (=> b!491692 (= res!294631 (validKeyInArray!0 k!2280))))

(declare-fun b!491693 () Bool)

(declare-fun res!294628 () Bool)

(assert (=> b!491693 (=> (not res!294628) (not e!288870))))

(declare-datatypes ((List!9467 0))(
  ( (Nil!9464) (Cons!9463 (h!10325 (_ BitVec 64)) (t!15695 List!9467)) )
))
(declare-fun arrayNoDuplicates!0 (array!31843 (_ BitVec 32) List!9467) Bool)

(assert (=> b!491693 (= res!294628 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9464))))

(declare-fun b!491694 () Bool)

(assert (=> b!491694 (= e!288867 (validKeyInArray!0 lt!222317))))

(declare-fun b!491695 () Bool)

(declare-fun res!294625 () Bool)

(assert (=> b!491695 (=> (not res!294625) (not e!288870))))

(assert (=> b!491695 (= res!294625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491696 () Bool)

(declare-fun res!294632 () Bool)

(assert (=> b!491696 (=> (not res!294632) (not e!288866))))

(declare-fun arrayContainsKey!0 (array!31843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491696 (= res!294632 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44784 res!294624) b!491688))

(assert (= (and b!491688 res!294623) b!491690))

(assert (= (and b!491690 res!294626) b!491692))

(assert (= (and b!491692 res!294631) b!491696))

(assert (= (and b!491696 res!294632) b!491691))

(assert (= (and b!491691 res!294630) b!491695))

(assert (= (and b!491695 res!294625) b!491693))

(assert (= (and b!491693 res!294628) b!491689))

(assert (= (and b!491689 (not res!294627)) b!491687))

(assert (= (and b!491687 (not res!294629)) b!491694))

(declare-fun m!472383 () Bool)

(assert (=> b!491691 m!472383))

(declare-fun m!472385 () Bool)

(assert (=> b!491689 m!472385))

(declare-fun m!472387 () Bool)

(assert (=> b!491689 m!472387))

(declare-fun m!472389 () Bool)

(assert (=> b!491689 m!472389))

(declare-fun m!472391 () Bool)

(assert (=> b!491689 m!472391))

(declare-fun m!472393 () Bool)

(assert (=> b!491689 m!472393))

(declare-fun m!472395 () Bool)

(assert (=> b!491689 m!472395))

(declare-fun m!472397 () Bool)

(assert (=> b!491689 m!472397))

(assert (=> b!491689 m!472393))

(assert (=> b!491689 m!472391))

(assert (=> b!491689 m!472393))

(declare-fun m!472399 () Bool)

(assert (=> b!491689 m!472399))

(assert (=> b!491689 m!472393))

(declare-fun m!472401 () Bool)

(assert (=> b!491689 m!472401))

(assert (=> b!491689 m!472397))

(declare-fun m!472403 () Bool)

(assert (=> b!491689 m!472403))

(declare-fun m!472405 () Bool)

(assert (=> start!44784 m!472405))

(declare-fun m!472407 () Bool)

(assert (=> start!44784 m!472407))

(assert (=> b!491690 m!472393))

(assert (=> b!491690 m!472393))

(declare-fun m!472409 () Bool)

(assert (=> b!491690 m!472409))

(declare-fun m!472411 () Bool)

(assert (=> b!491687 m!472411))

(declare-fun m!472413 () Bool)

(assert (=> b!491687 m!472413))

(declare-fun m!472415 () Bool)

(assert (=> b!491692 m!472415))

(declare-fun m!472417 () Bool)

(assert (=> b!491694 m!472417))

(declare-fun m!472419 () Bool)

(assert (=> b!491693 m!472419))

(declare-fun m!472421 () Bool)

(assert (=> b!491695 m!472421))

(declare-fun m!472423 () Bool)

(assert (=> b!491696 m!472423))

(push 1)

