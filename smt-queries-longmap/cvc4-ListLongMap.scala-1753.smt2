; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32120 () Bool)

(assert start!32120)

(declare-fun b!320130 () Bool)

(declare-fun res!174373 () Bool)

(declare-fun e!198717 () Bool)

(assert (=> b!320130 (=> (not res!174373) (not e!198717))))

(declare-datatypes ((array!16355 0))(
  ( (array!16356 (arr!7738 (Array (_ BitVec 32) (_ BitVec 64))) (size!8090 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16355)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16355 (_ BitVec 32)) Bool)

(assert (=> b!320130 (= res!174373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320131 () Bool)

(declare-fun res!174378 () Bool)

(assert (=> b!320131 (=> (not res!174378) (not e!198717))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320131 (= res!174378 (and (= (size!8090 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8090 a!3305))))))

(declare-fun b!320132 () Bool)

(declare-fun res!174376 () Bool)

(assert (=> b!320132 (=> (not res!174376) (not e!198717))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2869 0))(
  ( (MissingZero!2869 (index!13652 (_ BitVec 32))) (Found!2869 (index!13653 (_ BitVec 32))) (Intermediate!2869 (undefined!3681 Bool) (index!13654 (_ BitVec 32)) (x!31922 (_ BitVec 32))) (Undefined!2869) (MissingVacant!2869 (index!13655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16355 (_ BitVec 32)) SeekEntryResult!2869)

(assert (=> b!320132 (= res!174376 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2869 i!1250)))))

(declare-fun b!320133 () Bool)

(declare-fun res!174375 () Bool)

(assert (=> b!320133 (=> (not res!174375) (not e!198717))))

(declare-fun arrayContainsKey!0 (array!16355 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320133 (= res!174375 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320135 () Bool)

(assert (=> b!320135 (= e!198717 false)))

(declare-fun lt!155985 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320135 (= lt!155985 (toIndex!0 k!2497 mask!3777))))

(declare-fun res!174374 () Bool)

(assert (=> start!32120 (=> (not res!174374) (not e!198717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32120 (= res!174374 (validMask!0 mask!3777))))

(assert (=> start!32120 e!198717))

(assert (=> start!32120 true))

(declare-fun array_inv!5701 (array!16355) Bool)

(assert (=> start!32120 (array_inv!5701 a!3305)))

(declare-fun b!320134 () Bool)

(declare-fun res!174377 () Bool)

(assert (=> b!320134 (=> (not res!174377) (not e!198717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320134 (= res!174377 (validKeyInArray!0 k!2497))))

(assert (= (and start!32120 res!174374) b!320131))

(assert (= (and b!320131 res!174378) b!320134))

(assert (= (and b!320134 res!174377) b!320133))

(assert (= (and b!320133 res!174375) b!320132))

(assert (= (and b!320132 res!174376) b!320130))

(assert (= (and b!320130 res!174373) b!320135))

(declare-fun m!328557 () Bool)

(assert (=> start!32120 m!328557))

(declare-fun m!328559 () Bool)

(assert (=> start!32120 m!328559))

(declare-fun m!328561 () Bool)

(assert (=> b!320132 m!328561))

(declare-fun m!328563 () Bool)

(assert (=> b!320130 m!328563))

(declare-fun m!328565 () Bool)

(assert (=> b!320134 m!328565))

(declare-fun m!328567 () Bool)

(assert (=> b!320135 m!328567))

(declare-fun m!328569 () Bool)

(assert (=> b!320133 m!328569))

(push 1)

(assert (not start!32120))

