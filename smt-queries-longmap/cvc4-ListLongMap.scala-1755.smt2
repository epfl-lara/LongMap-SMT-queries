; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32132 () Bool)

(assert start!32132)

(declare-fun b!320238 () Bool)

(declare-fun res!174481 () Bool)

(declare-fun e!198754 () Bool)

(assert (=> b!320238 (=> (not res!174481) (not e!198754))))

(declare-datatypes ((array!16367 0))(
  ( (array!16368 (arr!7744 (Array (_ BitVec 32) (_ BitVec 64))) (size!8096 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16367)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320238 (= res!174481 (and (= (size!8096 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8096 a!3305))))))

(declare-fun b!320239 () Bool)

(declare-fun res!174486 () Bool)

(assert (=> b!320239 (=> (not res!174486) (not e!198754))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2875 0))(
  ( (MissingZero!2875 (index!13676 (_ BitVec 32))) (Found!2875 (index!13677 (_ BitVec 32))) (Intermediate!2875 (undefined!3687 Bool) (index!13678 (_ BitVec 32)) (x!31944 (_ BitVec 32))) (Undefined!2875) (MissingVacant!2875 (index!13679 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16367 (_ BitVec 32)) SeekEntryResult!2875)

(assert (=> b!320239 (= res!174486 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2875 i!1250)))))

(declare-fun res!174483 () Bool)

(assert (=> start!32132 (=> (not res!174483) (not e!198754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32132 (= res!174483 (validMask!0 mask!3777))))

(assert (=> start!32132 e!198754))

(assert (=> start!32132 true))

(declare-fun array_inv!5707 (array!16367) Bool)

(assert (=> start!32132 (array_inv!5707 a!3305)))

(declare-fun b!320240 () Bool)

(declare-fun res!174485 () Bool)

(assert (=> b!320240 (=> (not res!174485) (not e!198754))))

(declare-fun arrayContainsKey!0 (array!16367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320240 (= res!174485 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320241 () Bool)

(declare-fun res!174484 () Bool)

(assert (=> b!320241 (=> (not res!174484) (not e!198754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320241 (= res!174484 (validKeyInArray!0 k!2497))))

(declare-fun b!320242 () Bool)

(assert (=> b!320242 (= e!198754 false)))

(declare-fun lt!156003 () SeekEntryResult!2875)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16367 (_ BitVec 32)) SeekEntryResult!2875)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320242 (= lt!156003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!320243 () Bool)

(declare-fun res!174482 () Bool)

(assert (=> b!320243 (=> (not res!174482) (not e!198754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16367 (_ BitVec 32)) Bool)

(assert (=> b!320243 (= res!174482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32132 res!174483) b!320238))

(assert (= (and b!320238 res!174481) b!320241))

(assert (= (and b!320241 res!174484) b!320240))

(assert (= (and b!320240 res!174485) b!320239))

(assert (= (and b!320239 res!174486) b!320243))

(assert (= (and b!320243 res!174482) b!320242))

(declare-fun m!328645 () Bool)

(assert (=> b!320242 m!328645))

(assert (=> b!320242 m!328645))

(declare-fun m!328647 () Bool)

(assert (=> b!320242 m!328647))

(declare-fun m!328649 () Bool)

(assert (=> b!320239 m!328649))

(declare-fun m!328651 () Bool)

(assert (=> b!320243 m!328651))

(declare-fun m!328653 () Bool)

(assert (=> start!32132 m!328653))

(declare-fun m!328655 () Bool)

(assert (=> start!32132 m!328655))

(declare-fun m!328657 () Bool)

(assert (=> b!320241 m!328657))

(declare-fun m!328659 () Bool)

(assert (=> b!320240 m!328659))

(push 1)

(assert (not b!320240))

(assert (not start!32132))

(assert (not b!320239))

(assert (not b!320241))

(assert (not b!320243))

(assert (not b!320242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

