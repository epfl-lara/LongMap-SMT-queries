; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32112 () Bool)

(assert start!32112)

(declare-fun b!320131 () Bool)

(declare-fun res!174424 () Bool)

(declare-fun e!198702 () Bool)

(assert (=> b!320131 (=> (not res!174424) (not e!198702))))

(declare-datatypes ((array!16360 0))(
  ( (array!16361 (arr!7740 (Array (_ BitVec 32) (_ BitVec 64))) (size!8092 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16360)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320131 (= res!174424 (and (= (size!8092 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8092 a!3305))))))

(declare-fun b!320132 () Bool)

(declare-fun res!174429 () Bool)

(assert (=> b!320132 (=> (not res!174429) (not e!198702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16360 (_ BitVec 32)) Bool)

(assert (=> b!320132 (= res!174429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320133 () Bool)

(declare-fun res!174426 () Bool)

(assert (=> b!320133 (=> (not res!174426) (not e!198702))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2836 0))(
  ( (MissingZero!2836 (index!13520 (_ BitVec 32))) (Found!2836 (index!13521 (_ BitVec 32))) (Intermediate!2836 (undefined!3648 Bool) (index!13522 (_ BitVec 32)) (x!31894 (_ BitVec 32))) (Undefined!2836) (MissingVacant!2836 (index!13523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16360 (_ BitVec 32)) SeekEntryResult!2836)

(assert (=> b!320133 (= res!174426 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2836 i!1250)))))

(declare-fun res!174428 () Bool)

(assert (=> start!32112 (=> (not res!174428) (not e!198702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32112 (= res!174428 (validMask!0 mask!3777))))

(assert (=> start!32112 e!198702))

(assert (=> start!32112 true))

(declare-fun array_inv!5690 (array!16360) Bool)

(assert (=> start!32112 (array_inv!5690 a!3305)))

(declare-fun b!320134 () Bool)

(assert (=> b!320134 (= e!198702 false)))

(declare-fun lt!156012 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320134 (= lt!156012 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!320135 () Bool)

(declare-fun res!174425 () Bool)

(assert (=> b!320135 (=> (not res!174425) (not e!198702))))

(declare-fun arrayContainsKey!0 (array!16360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320135 (= res!174425 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320136 () Bool)

(declare-fun res!174427 () Bool)

(assert (=> b!320136 (=> (not res!174427) (not e!198702))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320136 (= res!174427 (validKeyInArray!0 k!2497))))

(assert (= (and start!32112 res!174428) b!320131))

(assert (= (and b!320131 res!174424) b!320136))

(assert (= (and b!320136 res!174427) b!320135))

(assert (= (and b!320135 res!174425) b!320133))

(assert (= (and b!320133 res!174426) b!320132))

(assert (= (and b!320132 res!174429) b!320134))

(declare-fun m!328775 () Bool)

(assert (=> b!320132 m!328775))

(declare-fun m!328777 () Bool)

(assert (=> b!320136 m!328777))

(declare-fun m!328779 () Bool)

(assert (=> b!320133 m!328779))

(declare-fun m!328781 () Bool)

(assert (=> start!32112 m!328781))

(declare-fun m!328783 () Bool)

(assert (=> start!32112 m!328783))

(declare-fun m!328785 () Bool)

(assert (=> b!320134 m!328785))

(declare-fun m!328787 () Bool)

(assert (=> b!320135 m!328787))

(push 1)

(assert (not b!320133))

(assert (not b!320132))

(assert (not b!320134))

(assert (not start!32112))

(assert (not b!320136))

(assert (not b!320135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

