; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44734 () Bool)

(assert start!44734)

(declare-fun b!491001 () Bool)

(declare-fun res!293938 () Bool)

(declare-fun e!288556 () Bool)

(assert (=> b!491001 (=> (not res!293938) (not e!288556))))

(declare-datatypes ((array!31793 0))(
  ( (array!31794 (arr!15284 (Array (_ BitVec 32) (_ BitVec 64))) (size!15648 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31793)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491001 (= res!293938 (validKeyInArray!0 (select (arr!15284 a!3235) j!176)))))

(declare-fun res!293940 () Bool)

(assert (=> start!44734 (=> (not res!293940) (not e!288556))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44734 (= res!293940 (validMask!0 mask!3524))))

(assert (=> start!44734 e!288556))

(assert (=> start!44734 true))

(declare-fun array_inv!11080 (array!31793) Bool)

(assert (=> start!44734 (array_inv!11080 a!3235)))

(declare-fun b!491002 () Bool)

(declare-fun res!293943 () Bool)

(declare-fun e!288555 () Bool)

(assert (=> b!491002 (=> (not res!293943) (not e!288555))))

(declare-datatypes ((List!9442 0))(
  ( (Nil!9439) (Cons!9438 (h!10300 (_ BitVec 64)) (t!15670 List!9442)) )
))
(declare-fun arrayNoDuplicates!0 (array!31793 (_ BitVec 32) List!9442) Bool)

(assert (=> b!491002 (= res!293943 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9439))))

(declare-fun b!491003 () Bool)

(declare-fun res!293937 () Bool)

(assert (=> b!491003 (=> (not res!293937) (not e!288556))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491003 (= res!293937 (and (= (size!15648 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15648 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15648 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491004 () Bool)

(declare-fun e!288558 () Bool)

(assert (=> b!491004 (= e!288558 true)))

(declare-fun lt!221869 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3751 0))(
  ( (MissingZero!3751 (index!17183 (_ BitVec 32))) (Found!3751 (index!17184 (_ BitVec 32))) (Intermediate!3751 (undefined!4563 Bool) (index!17185 (_ BitVec 32)) (x!46273 (_ BitVec 32))) (Undefined!3751) (MissingVacant!3751 (index!17186 (_ BitVec 32))) )
))
(declare-fun lt!221870 () SeekEntryResult!3751)

(declare-fun lt!221872 () array!31793)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31793 (_ BitVec 32)) SeekEntryResult!3751)

(assert (=> b!491004 (= lt!221870 (seekEntryOrOpen!0 lt!221869 lt!221872 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!14448 0))(
  ( (Unit!14449) )
))
(declare-fun lt!221868 () Unit!14448)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14448)

(assert (=> b!491004 (= lt!221868 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491005 () Bool)

(assert (=> b!491005 (= e!288556 e!288555)))

(declare-fun res!293939 () Bool)

(assert (=> b!491005 (=> (not res!293939) (not e!288555))))

(declare-fun lt!221871 () SeekEntryResult!3751)

(assert (=> b!491005 (= res!293939 (or (= lt!221871 (MissingZero!3751 i!1204)) (= lt!221871 (MissingVacant!3751 i!1204))))))

(assert (=> b!491005 (= lt!221871 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491006 () Bool)

(assert (=> b!491006 (= e!288555 (not e!288558))))

(declare-fun res!293945 () Bool)

(assert (=> b!491006 (=> res!293945 e!288558)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31793 (_ BitVec 32)) SeekEntryResult!3751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491006 (= res!293945 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15284 a!3235) j!176) mask!3524) (select (arr!15284 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221869 mask!3524) lt!221869 lt!221872 mask!3524))))))

(assert (=> b!491006 (= lt!221869 (select (store (arr!15284 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491006 (= lt!221872 (array!31794 (store (arr!15284 a!3235) i!1204 k!2280) (size!15648 a!3235)))))

(assert (=> b!491006 (= lt!221870 (Found!3751 j!176))))

(assert (=> b!491006 (= lt!221870 (seekEntryOrOpen!0 (select (arr!15284 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31793 (_ BitVec 32)) Bool)

(assert (=> b!491006 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221867 () Unit!14448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14448)

(assert (=> b!491006 (= lt!221867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491007 () Bool)

(declare-fun res!293941 () Bool)

(assert (=> b!491007 (=> (not res!293941) (not e!288556))))

(assert (=> b!491007 (= res!293941 (validKeyInArray!0 k!2280))))

(declare-fun b!491008 () Bool)

(declare-fun res!293942 () Bool)

(assert (=> b!491008 (=> (not res!293942) (not e!288555))))

(assert (=> b!491008 (= res!293942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491009 () Bool)

(declare-fun res!293944 () Bool)

(assert (=> b!491009 (=> (not res!293944) (not e!288556))))

(declare-fun arrayContainsKey!0 (array!31793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491009 (= res!293944 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44734 res!293940) b!491003))

(assert (= (and b!491003 res!293937) b!491001))

(assert (= (and b!491001 res!293938) b!491007))

(assert (= (and b!491007 res!293941) b!491009))

(assert (= (and b!491009 res!293944) b!491005))

(assert (= (and b!491005 res!293939) b!491008))

(assert (= (and b!491008 res!293942) b!491002))

(assert (= (and b!491002 res!293943) b!491006))

(assert (= (and b!491006 (not res!293945)) b!491004))

(declare-fun m!471377 () Bool)

(assert (=> b!491001 m!471377))

(assert (=> b!491001 m!471377))

(declare-fun m!471379 () Bool)

(assert (=> b!491001 m!471379))

(declare-fun m!471381 () Bool)

(assert (=> b!491005 m!471381))

(declare-fun m!471383 () Bool)

(assert (=> b!491008 m!471383))

(declare-fun m!471385 () Bool)

(assert (=> b!491007 m!471385))

(declare-fun m!471387 () Bool)

(assert (=> b!491009 m!471387))

(declare-fun m!471389 () Bool)

(assert (=> b!491002 m!471389))

(declare-fun m!471391 () Bool)

(assert (=> start!44734 m!471391))

(declare-fun m!471393 () Bool)

(assert (=> start!44734 m!471393))

(declare-fun m!471395 () Bool)

(assert (=> b!491006 m!471395))

(declare-fun m!471397 () Bool)

(assert (=> b!491006 m!471397))

(declare-fun m!471399 () Bool)

(assert (=> b!491006 m!471399))

(declare-fun m!471401 () Bool)

(assert (=> b!491006 m!471401))

(assert (=> b!491006 m!471377))

(declare-fun m!471403 () Bool)

(assert (=> b!491006 m!471403))

(declare-fun m!471405 () Bool)

(assert (=> b!491006 m!471405))

(declare-fun m!471407 () Bool)

(assert (=> b!491006 m!471407))

(assert (=> b!491006 m!471377))

(assert (=> b!491006 m!471401))

(assert (=> b!491006 m!471377))

(declare-fun m!471409 () Bool)

(assert (=> b!491006 m!471409))

(assert (=> b!491006 m!471377))

(declare-fun m!471411 () Bool)

(assert (=> b!491006 m!471411))

(assert (=> b!491006 m!471405))

(declare-fun m!471413 () Bool)

(assert (=> b!491004 m!471413))

(declare-fun m!471415 () Bool)

(assert (=> b!491004 m!471415))

(push 1)

