; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31366 () Bool)

(assert start!31366)

(declare-fun b!314237 () Bool)

(declare-fun res!170132 () Bool)

(declare-fun e!195688 () Bool)

(assert (=> b!314237 (=> (not res!170132) (not e!195688))))

(declare-datatypes ((array!16041 0))(
  ( (array!16042 (arr!7595 (Array (_ BitVec 32) (_ BitVec 64))) (size!7948 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16041)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2734 0))(
  ( (MissingZero!2734 (index!13112 (_ BitVec 32))) (Found!2734 (index!13113 (_ BitVec 32))) (Intermediate!2734 (undefined!3546 Bool) (index!13114 (_ BitVec 32)) (x!31351 (_ BitVec 32))) (Undefined!2734) (MissingVacant!2734 (index!13115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16041 (_ BitVec 32)) SeekEntryResult!2734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314237 (= res!170132 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2734 false resIndex!52 resX!52)))))

(declare-fun b!314238 () Bool)

(assert (=> b!314238 (= e!195688 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153680 () SeekEntryResult!2734)

(assert (=> b!314238 (= lt!153680 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314239 () Bool)

(declare-fun res!170134 () Bool)

(assert (=> b!314239 (=> (not res!170134) (not e!195688))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314239 (= res!170134 (and (= (size!7948 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7948 a!3293))))))

(declare-fun b!314240 () Bool)

(declare-fun res!170136 () Bool)

(assert (=> b!314240 (=> (not res!170136) (not e!195688))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16041 (_ BitVec 32)) SeekEntryResult!2734)

(assert (=> b!314240 (= res!170136 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2734 i!1240)))))

(declare-fun b!314241 () Bool)

(declare-fun res!170133 () Bool)

(assert (=> b!314241 (=> (not res!170133) (not e!195688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314241 (= res!170133 (validKeyInArray!0 k!2441))))

(declare-fun res!170135 () Bool)

(assert (=> start!31366 (=> (not res!170135) (not e!195688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31366 (= res!170135 (validMask!0 mask!3709))))

(assert (=> start!31366 e!195688))

(declare-fun array_inv!5567 (array!16041) Bool)

(assert (=> start!31366 (array_inv!5567 a!3293)))

(assert (=> start!31366 true))

(declare-fun b!314242 () Bool)

(declare-fun res!170138 () Bool)

(assert (=> b!314242 (=> (not res!170138) (not e!195688))))

(declare-fun arrayContainsKey!0 (array!16041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314242 (= res!170138 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314243 () Bool)

(declare-fun res!170139 () Bool)

(assert (=> b!314243 (=> (not res!170139) (not e!195688))))

(assert (=> b!314243 (= res!170139 (and (= (select (arr!7595 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7948 a!3293))))))

(declare-fun b!314244 () Bool)

(declare-fun res!170137 () Bool)

(assert (=> b!314244 (=> (not res!170137) (not e!195688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16041 (_ BitVec 32)) Bool)

(assert (=> b!314244 (= res!170137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31366 res!170135) b!314239))

(assert (= (and b!314239 res!170134) b!314241))

(assert (= (and b!314241 res!170133) b!314242))

(assert (= (and b!314242 res!170138) b!314240))

(assert (= (and b!314240 res!170136) b!314244))

(assert (= (and b!314244 res!170137) b!314237))

(assert (= (and b!314237 res!170132) b!314243))

(assert (= (and b!314243 res!170139) b!314238))

(declare-fun m!323327 () Bool)

(assert (=> b!314238 m!323327))

(declare-fun m!323329 () Bool)

(assert (=> b!314242 m!323329))

(declare-fun m!323331 () Bool)

(assert (=> b!314243 m!323331))

(declare-fun m!323333 () Bool)

(assert (=> b!314241 m!323333))

(declare-fun m!323335 () Bool)

(assert (=> b!314240 m!323335))

(declare-fun m!323337 () Bool)

(assert (=> start!31366 m!323337))

(declare-fun m!323339 () Bool)

(assert (=> start!31366 m!323339))

(declare-fun m!323341 () Bool)

(assert (=> b!314244 m!323341))

(declare-fun m!323343 () Bool)

(assert (=> b!314237 m!323343))

(assert (=> b!314237 m!323343))

(declare-fun m!323345 () Bool)

(assert (=> b!314237 m!323345))

(push 1)

(assert (not b!314238))

(assert (not b!314240))

(assert (not b!314242))

(assert (not b!314241))

(assert (not b!314237))

(assert (not start!31366))

(assert (not b!314244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

