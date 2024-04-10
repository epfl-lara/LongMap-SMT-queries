; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45048 () Bool)

(assert start!45048)

(declare-fun b!494366 () Bool)

(declare-fun res!296936 () Bool)

(declare-fun e!290154 () Bool)

(assert (=> b!494366 (=> (not res!296936) (not e!290154))))

(declare-datatypes ((array!31993 0))(
  ( (array!31994 (arr!15381 (Array (_ BitVec 32) (_ BitVec 64))) (size!15745 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31993)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31993 (_ BitVec 32)) Bool)

(assert (=> b!494366 (= res!296936 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!296943 () Bool)

(declare-fun e!290157 () Bool)

(assert (=> start!45048 (=> (not res!296943) (not e!290157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45048 (= res!296943 (validMask!0 mask!3524))))

(assert (=> start!45048 e!290157))

(assert (=> start!45048 true))

(declare-fun array_inv!11177 (array!31993) Bool)

(assert (=> start!45048 (array_inv!11177 a!3235)))

(declare-fun b!494367 () Bool)

(declare-fun e!290155 () Bool)

(assert (=> b!494367 (= e!290155 true)))

(declare-datatypes ((SeekEntryResult!3848 0))(
  ( (MissingZero!3848 (index!17571 (_ BitVec 32))) (Found!3848 (index!17572 (_ BitVec 32))) (Intermediate!3848 (undefined!4660 Bool) (index!17573 (_ BitVec 32)) (x!46646 (_ BitVec 32))) (Undefined!3848) (MissingVacant!3848 (index!17574 (_ BitVec 32))) )
))
(declare-fun lt!223727 () SeekEntryResult!3848)

(assert (=> b!494367 (= lt!223727 Undefined!3848)))

(declare-fun b!494368 () Bool)

(assert (=> b!494368 (= e!290157 e!290154)))

(declare-fun res!296938 () Bool)

(assert (=> b!494368 (=> (not res!296938) (not e!290154))))

(declare-fun lt!223729 () SeekEntryResult!3848)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494368 (= res!296938 (or (= lt!223729 (MissingZero!3848 i!1204)) (= lt!223729 (MissingVacant!3848 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31993 (_ BitVec 32)) SeekEntryResult!3848)

(assert (=> b!494368 (= lt!223729 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494369 () Bool)

(declare-fun res!296942 () Bool)

(assert (=> b!494369 (=> (not res!296942) (not e!290157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494369 (= res!296942 (validKeyInArray!0 k!2280))))

(declare-fun b!494370 () Bool)

(declare-fun res!296937 () Bool)

(assert (=> b!494370 (=> res!296937 e!290155)))

(declare-fun lt!223731 () SeekEntryResult!3848)

(assert (=> b!494370 (= res!296937 (or (not (is-Intermediate!3848 lt!223731)) (not (undefined!4660 lt!223731))))))

(declare-fun b!494371 () Bool)

(declare-fun res!296941 () Bool)

(assert (=> b!494371 (=> (not res!296941) (not e!290157))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494371 (= res!296941 (validKeyInArray!0 (select (arr!15381 a!3235) j!176)))))

(declare-fun b!494372 () Bool)

(assert (=> b!494372 (= e!290154 (not e!290155))))

(declare-fun res!296940 () Bool)

(assert (=> b!494372 (=> res!296940 e!290155)))

(declare-fun lt!223732 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31993 (_ BitVec 32)) SeekEntryResult!3848)

(assert (=> b!494372 (= res!296940 (= lt!223731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223732 (select (store (arr!15381 a!3235) i!1204 k!2280) j!176) (array!31994 (store (arr!15381 a!3235) i!1204 k!2280) (size!15745 a!3235)) mask!3524)))))

(declare-fun lt!223728 () (_ BitVec 32))

(assert (=> b!494372 (= lt!223731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223728 (select (arr!15381 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494372 (= lt!223732 (toIndex!0 (select (store (arr!15381 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494372 (= lt!223728 (toIndex!0 (select (arr!15381 a!3235) j!176) mask!3524))))

(assert (=> b!494372 (= lt!223727 (Found!3848 j!176))))

(assert (=> b!494372 (= lt!223727 (seekEntryOrOpen!0 (select (arr!15381 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494372 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14642 0))(
  ( (Unit!14643) )
))
(declare-fun lt!223730 () Unit!14642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31993 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14642)

(assert (=> b!494372 (= lt!223730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494373 () Bool)

(declare-fun res!296945 () Bool)

(assert (=> b!494373 (=> (not res!296945) (not e!290157))))

(assert (=> b!494373 (= res!296945 (and (= (size!15745 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15745 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15745 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494374 () Bool)

(declare-fun res!296939 () Bool)

(assert (=> b!494374 (=> (not res!296939) (not e!290154))))

(declare-datatypes ((List!9539 0))(
  ( (Nil!9536) (Cons!9535 (h!10403 (_ BitVec 64)) (t!15767 List!9539)) )
))
(declare-fun arrayNoDuplicates!0 (array!31993 (_ BitVec 32) List!9539) Bool)

(assert (=> b!494374 (= res!296939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9536))))

(declare-fun b!494375 () Bool)

(declare-fun res!296944 () Bool)

(assert (=> b!494375 (=> (not res!296944) (not e!290157))))

(declare-fun arrayContainsKey!0 (array!31993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494375 (= res!296944 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45048 res!296943) b!494373))

(assert (= (and b!494373 res!296945) b!494371))

(assert (= (and b!494371 res!296941) b!494369))

(assert (= (and b!494369 res!296942) b!494375))

(assert (= (and b!494375 res!296944) b!494368))

(assert (= (and b!494368 res!296938) b!494366))

(assert (= (and b!494366 res!296936) b!494374))

(assert (= (and b!494374 res!296939) b!494372))

(assert (= (and b!494372 (not res!296940)) b!494370))

(assert (= (and b!494370 (not res!296937)) b!494367))

(declare-fun m!475395 () Bool)

(assert (=> b!494374 m!475395))

(declare-fun m!475397 () Bool)

(assert (=> b!494375 m!475397))

(declare-fun m!475399 () Bool)

(assert (=> b!494371 m!475399))

(assert (=> b!494371 m!475399))

(declare-fun m!475401 () Bool)

(assert (=> b!494371 m!475401))

(declare-fun m!475403 () Bool)

(assert (=> b!494372 m!475403))

(declare-fun m!475405 () Bool)

(assert (=> b!494372 m!475405))

(declare-fun m!475407 () Bool)

(assert (=> b!494372 m!475407))

(declare-fun m!475409 () Bool)

(assert (=> b!494372 m!475409))

(assert (=> b!494372 m!475399))

(declare-fun m!475411 () Bool)

(assert (=> b!494372 m!475411))

(assert (=> b!494372 m!475399))

(declare-fun m!475413 () Bool)

(assert (=> b!494372 m!475413))

(assert (=> b!494372 m!475399))

(declare-fun m!475415 () Bool)

(assert (=> b!494372 m!475415))

(assert (=> b!494372 m!475407))

(declare-fun m!475417 () Bool)

(assert (=> b!494372 m!475417))

(assert (=> b!494372 m!475399))

(declare-fun m!475419 () Bool)

(assert (=> b!494372 m!475419))

(assert (=> b!494372 m!475407))

(declare-fun m!475421 () Bool)

(assert (=> b!494368 m!475421))

(declare-fun m!475423 () Bool)

(assert (=> start!45048 m!475423))

(declare-fun m!475425 () Bool)

(assert (=> start!45048 m!475425))

(declare-fun m!475427 () Bool)

(assert (=> b!494369 m!475427))

(declare-fun m!475429 () Bool)

(assert (=> b!494366 m!475429))

(push 1)

