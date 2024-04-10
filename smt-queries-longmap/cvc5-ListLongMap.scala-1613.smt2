; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30404 () Bool)

(assert start!30404)

(declare-fun b!304253 () Bool)

(declare-fun res!161599 () Bool)

(declare-fun e!191277 () Bool)

(assert (=> b!304253 (=> (not res!161599) (not e!191277))))

(declare-datatypes ((array!15459 0))(
  ( (array!15460 (arr!7316 (Array (_ BitVec 32) (_ BitVec 64))) (size!7668 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15459)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15459 (_ BitVec 32)) Bool)

(assert (=> b!304253 (= res!161599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304254 () Bool)

(declare-fun res!161606 () Bool)

(declare-fun e!191278 () Bool)

(assert (=> b!304254 (=> (not res!161606) (not e!191278))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304254 (= res!161606 (and (= (select (arr!7316 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7668 a!3293))))))

(declare-fun b!304255 () Bool)

(declare-fun res!161607 () Bool)

(assert (=> b!304255 (=> (not res!161607) (not e!191277))))

(assert (=> b!304255 (= res!161607 (and (= (size!7668 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7668 a!3293))))))

(declare-fun b!304256 () Bool)

(declare-fun res!161602 () Bool)

(assert (=> b!304256 (=> (not res!161602) (not e!191277))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304256 (= res!161602 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304257 () Bool)

(declare-fun res!161605 () Bool)

(assert (=> b!304257 (=> (not res!161605) (not e!191278))))

(declare-datatypes ((SeekEntryResult!2456 0))(
  ( (MissingZero!2456 (index!12000 (_ BitVec 32))) (Found!2456 (index!12001 (_ BitVec 32))) (Intermediate!2456 (undefined!3268 Bool) (index!12002 (_ BitVec 32)) (x!30266 (_ BitVec 32))) (Undefined!2456) (MissingVacant!2456 (index!12003 (_ BitVec 32))) )
))
(declare-fun lt!150414 () SeekEntryResult!2456)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15459 (_ BitVec 32)) SeekEntryResult!2456)

(assert (=> b!304257 (= res!161605 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150414))))

(declare-fun b!304258 () Bool)

(declare-fun res!161600 () Bool)

(assert (=> b!304258 (=> (not res!161600) (not e!191277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304258 (= res!161600 (validKeyInArray!0 k!2441))))

(declare-fun b!304259 () Bool)

(declare-fun res!161601 () Bool)

(assert (=> b!304259 (=> (not res!161601) (not e!191278))))

(assert (=> b!304259 (= res!161601 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7316 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7316 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7316 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304260 () Bool)

(assert (=> b!304260 (= e!191277 e!191278)))

(declare-fun res!161604 () Bool)

(assert (=> b!304260 (=> (not res!161604) (not e!191278))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304260 (= res!161604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150414))))

(assert (=> b!304260 (= lt!150414 (Intermediate!2456 false resIndex!52 resX!52))))

(declare-fun res!161598 () Bool)

(assert (=> start!30404 (=> (not res!161598) (not e!191277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30404 (= res!161598 (validMask!0 mask!3709))))

(assert (=> start!30404 e!191277))

(declare-fun array_inv!5279 (array!15459) Bool)

(assert (=> start!30404 (array_inv!5279 a!3293)))

(assert (=> start!30404 true))

(declare-fun b!304261 () Bool)

(declare-fun res!161603 () Bool)

(assert (=> b!304261 (=> (not res!161603) (not e!191277))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15459 (_ BitVec 32)) SeekEntryResult!2456)

(assert (=> b!304261 (= res!161603 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2456 i!1240)))))

(declare-fun lt!150413 () (_ BitVec 32))

(declare-fun b!304262 () Bool)

(assert (=> b!304262 (= e!191278 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!150413 #b00000000000000000000000000000000) (bvslt lt!150413 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304262 (= lt!150413 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30404 res!161598) b!304255))

(assert (= (and b!304255 res!161607) b!304258))

(assert (= (and b!304258 res!161600) b!304256))

(assert (= (and b!304256 res!161602) b!304261))

(assert (= (and b!304261 res!161603) b!304253))

(assert (= (and b!304253 res!161599) b!304260))

(assert (= (and b!304260 res!161604) b!304254))

(assert (= (and b!304254 res!161606) b!304257))

(assert (= (and b!304257 res!161605) b!304259))

(assert (= (and b!304259 res!161601) b!304262))

(declare-fun m!315383 () Bool)

(assert (=> b!304256 m!315383))

(declare-fun m!315385 () Bool)

(assert (=> b!304262 m!315385))

(declare-fun m!315387 () Bool)

(assert (=> b!304254 m!315387))

(declare-fun m!315389 () Bool)

(assert (=> b!304259 m!315389))

(declare-fun m!315391 () Bool)

(assert (=> b!304261 m!315391))

(declare-fun m!315393 () Bool)

(assert (=> b!304260 m!315393))

(assert (=> b!304260 m!315393))

(declare-fun m!315395 () Bool)

(assert (=> b!304260 m!315395))

(declare-fun m!315397 () Bool)

(assert (=> start!30404 m!315397))

(declare-fun m!315399 () Bool)

(assert (=> start!30404 m!315399))

(declare-fun m!315401 () Bool)

(assert (=> b!304257 m!315401))

(declare-fun m!315403 () Bool)

(assert (=> b!304258 m!315403))

(declare-fun m!315405 () Bool)

(assert (=> b!304253 m!315405))

(push 1)

(assert (not b!304260))

(assert (not start!30404))

(assert (not b!304258))

(assert (not b!304257))

(assert (not b!304253))

