; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32056 () Bool)

(assert start!32056)

(declare-fun b!319824 () Bool)

(declare-fun e!198580 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319824 (= e!198580 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155880 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319824 (= lt!155880 (toIndex!0 k!2497 mask!3777))))

(declare-fun res!174141 () Bool)

(assert (=> start!32056 (=> (not res!174141) (not e!198580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32056 (= res!174141 (validMask!0 mask!3777))))

(assert (=> start!32056 e!198580))

(assert (=> start!32056 true))

(declare-datatypes ((array!16330 0))(
  ( (array!16331 (arr!7727 (Array (_ BitVec 32) (_ BitVec 64))) (size!8079 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16330)

(declare-fun array_inv!5690 (array!16330) Bool)

(assert (=> start!32056 (array_inv!5690 a!3305)))

(declare-fun b!319825 () Bool)

(declare-fun res!174136 () Bool)

(assert (=> b!319825 (=> (not res!174136) (not e!198580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16330 (_ BitVec 32)) Bool)

(assert (=> b!319825 (= res!174136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319826 () Bool)

(declare-fun res!174138 () Bool)

(assert (=> b!319826 (=> (not res!174138) (not e!198580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319826 (= res!174138 (validKeyInArray!0 k!2497))))

(declare-fun b!319827 () Bool)

(declare-fun res!174137 () Bool)

(assert (=> b!319827 (=> (not res!174137) (not e!198580))))

(declare-fun arrayContainsKey!0 (array!16330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319827 (= res!174137 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319828 () Bool)

(declare-fun res!174139 () Bool)

(assert (=> b!319828 (=> (not res!174139) (not e!198580))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319828 (= res!174139 (and (= (size!8079 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8079 a!3305))))))

(declare-fun b!319829 () Bool)

(declare-fun res!174140 () Bool)

(assert (=> b!319829 (=> (not res!174140) (not e!198580))))

(declare-datatypes ((SeekEntryResult!2858 0))(
  ( (MissingZero!2858 (index!13608 (_ BitVec 32))) (Found!2858 (index!13609 (_ BitVec 32))) (Intermediate!2858 (undefined!3670 Bool) (index!13610 (_ BitVec 32)) (x!31884 (_ BitVec 32))) (Undefined!2858) (MissingVacant!2858 (index!13611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16330 (_ BitVec 32)) SeekEntryResult!2858)

(assert (=> b!319829 (= res!174140 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2858 i!1250)))))

(assert (= (and start!32056 res!174141) b!319828))

(assert (= (and b!319828 res!174139) b!319826))

(assert (= (and b!319826 res!174138) b!319827))

(assert (= (and b!319827 res!174137) b!319829))

(assert (= (and b!319829 res!174140) b!319825))

(assert (= (and b!319825 res!174136) b!319824))

(declare-fun m!328325 () Bool)

(assert (=> start!32056 m!328325))

(declare-fun m!328327 () Bool)

(assert (=> start!32056 m!328327))

(declare-fun m!328329 () Bool)

(assert (=> b!319827 m!328329))

(declare-fun m!328331 () Bool)

(assert (=> b!319825 m!328331))

(declare-fun m!328333 () Bool)

(assert (=> b!319824 m!328333))

(declare-fun m!328335 () Bool)

(assert (=> b!319829 m!328335))

(declare-fun m!328337 () Bool)

(assert (=> b!319826 m!328337))

(push 1)

(assert (not b!319824))

(assert (not b!319829))

(assert (not start!32056))

(assert (not b!319826))

(assert (not b!319827))

(assert (not b!319825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

