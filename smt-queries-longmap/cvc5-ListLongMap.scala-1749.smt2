; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32050 () Bool)

(assert start!32050)

(declare-fun b!319770 () Bool)

(declare-fun res!174087 () Bool)

(declare-fun e!198562 () Bool)

(assert (=> b!319770 (=> (not res!174087) (not e!198562))))

(declare-datatypes ((array!16324 0))(
  ( (array!16325 (arr!7724 (Array (_ BitVec 32) (_ BitVec 64))) (size!8076 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16324)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319770 (= res!174087 (and (= (size!8076 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8076 a!3305))))))

(declare-fun b!319771 () Bool)

(declare-fun res!174082 () Bool)

(assert (=> b!319771 (=> (not res!174082) (not e!198562))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16324 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319771 (= res!174082 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319772 () Bool)

(declare-fun res!174083 () Bool)

(assert (=> b!319772 (=> (not res!174083) (not e!198562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319772 (= res!174083 (validKeyInArray!0 k!2497))))

(declare-fun b!319773 () Bool)

(declare-fun res!174084 () Bool)

(assert (=> b!319773 (=> (not res!174084) (not e!198562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16324 (_ BitVec 32)) Bool)

(assert (=> b!319773 (= res!174084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319774 () Bool)

(declare-fun res!174085 () Bool)

(assert (=> b!319774 (=> (not res!174085) (not e!198562))))

(declare-datatypes ((SeekEntryResult!2855 0))(
  ( (MissingZero!2855 (index!13596 (_ BitVec 32))) (Found!2855 (index!13597 (_ BitVec 32))) (Intermediate!2855 (undefined!3667 Bool) (index!13598 (_ BitVec 32)) (x!31873 (_ BitVec 32))) (Undefined!2855) (MissingVacant!2855 (index!13599 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16324 (_ BitVec 32)) SeekEntryResult!2855)

(assert (=> b!319774 (= res!174085 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2855 i!1250)))))

(declare-fun b!319775 () Bool)

(assert (=> b!319775 (= e!198562 false)))

(declare-fun lt!155871 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319775 (= lt!155871 (toIndex!0 k!2497 mask!3777))))

(declare-fun res!174086 () Bool)

(assert (=> start!32050 (=> (not res!174086) (not e!198562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32050 (= res!174086 (validMask!0 mask!3777))))

(assert (=> start!32050 e!198562))

(assert (=> start!32050 true))

(declare-fun array_inv!5687 (array!16324) Bool)

(assert (=> start!32050 (array_inv!5687 a!3305)))

(assert (= (and start!32050 res!174086) b!319770))

(assert (= (and b!319770 res!174087) b!319772))

(assert (= (and b!319772 res!174083) b!319771))

(assert (= (and b!319771 res!174082) b!319774))

(assert (= (and b!319774 res!174085) b!319773))

(assert (= (and b!319773 res!174084) b!319775))

(declare-fun m!328283 () Bool)

(assert (=> b!319771 m!328283))

(declare-fun m!328285 () Bool)

(assert (=> b!319774 m!328285))

(declare-fun m!328287 () Bool)

(assert (=> b!319772 m!328287))

(declare-fun m!328289 () Bool)

(assert (=> b!319775 m!328289))

(declare-fun m!328291 () Bool)

(assert (=> start!32050 m!328291))

(declare-fun m!328293 () Bool)

(assert (=> start!32050 m!328293))

(declare-fun m!328295 () Bool)

(assert (=> b!319773 m!328295))

(push 1)

(assert (not start!32050))

(assert (not b!319773))

(assert (not b!319774))

(assert (not b!319771))

(assert (not b!319775))

(assert (not b!319772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

