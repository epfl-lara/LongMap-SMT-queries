; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30336 () Bool)

(assert start!30336)

(declare-fun res!161320 () Bool)

(declare-fun e!191082 () Bool)

(assert (=> start!30336 (=> (not res!161320) (not e!191082))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30336 (= res!161320 (validMask!0 mask!3709))))

(assert (=> start!30336 e!191082))

(declare-datatypes ((array!15442 0))(
  ( (array!15443 (arr!7309 (Array (_ BitVec 32) (_ BitVec 64))) (size!7661 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15442)

(declare-fun array_inv!5272 (array!15442) Bool)

(assert (=> start!30336 (array_inv!5272 a!3293)))

(assert (=> start!30336 true))

(declare-fun b!303827 () Bool)

(declare-fun res!161317 () Bool)

(assert (=> b!303827 (=> (not res!161317) (not e!191082))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303827 (= res!161317 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303828 () Bool)

(declare-fun res!161319 () Bool)

(declare-fun e!191081 () Bool)

(assert (=> b!303828 (=> (not res!161319) (not e!191081))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303828 (= res!161319 (and (= (select (arr!7309 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7661 a!3293))))))

(declare-fun b!303829 () Bool)

(declare-fun res!161313 () Bool)

(assert (=> b!303829 (=> (not res!161313) (not e!191082))))

(declare-datatypes ((SeekEntryResult!2449 0))(
  ( (MissingZero!2449 (index!11972 (_ BitVec 32))) (Found!2449 (index!11973 (_ BitVec 32))) (Intermediate!2449 (undefined!3261 Bool) (index!11974 (_ BitVec 32)) (x!30226 (_ BitVec 32))) (Undefined!2449) (MissingVacant!2449 (index!11975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15442 (_ BitVec 32)) SeekEntryResult!2449)

(assert (=> b!303829 (= res!161313 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2449 i!1240)))))

(declare-fun b!303830 () Bool)

(declare-fun res!161315 () Bool)

(assert (=> b!303830 (=> (not res!161315) (not e!191081))))

(declare-fun lt!150266 () SeekEntryResult!2449)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15442 (_ BitVec 32)) SeekEntryResult!2449)

(assert (=> b!303830 (= res!161315 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150266))))

(declare-fun b!303831 () Bool)

(declare-fun res!161318 () Bool)

(assert (=> b!303831 (=> (not res!161318) (not e!191081))))

(assert (=> b!303831 (= res!161318 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7309 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7309 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7309 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303832 () Bool)

(assert (=> b!303832 (= e!191081 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150267 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303832 (= lt!150267 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303833 () Bool)

(declare-fun res!161321 () Bool)

(assert (=> b!303833 (=> (not res!161321) (not e!191082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15442 (_ BitVec 32)) Bool)

(assert (=> b!303833 (= res!161321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303834 () Bool)

(declare-fun res!161314 () Bool)

(assert (=> b!303834 (=> (not res!161314) (not e!191082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303834 (= res!161314 (validKeyInArray!0 k!2441))))

(declare-fun b!303835 () Bool)

(assert (=> b!303835 (= e!191082 e!191081)))

(declare-fun res!161322 () Bool)

(assert (=> b!303835 (=> (not res!161322) (not e!191081))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303835 (= res!161322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150266))))

(assert (=> b!303835 (= lt!150266 (Intermediate!2449 false resIndex!52 resX!52))))

(declare-fun b!303836 () Bool)

(declare-fun res!161316 () Bool)

(assert (=> b!303836 (=> (not res!161316) (not e!191082))))

(assert (=> b!303836 (= res!161316 (and (= (size!7661 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7661 a!3293))))))

(assert (= (and start!30336 res!161320) b!303836))

(assert (= (and b!303836 res!161316) b!303834))

(assert (= (and b!303834 res!161314) b!303827))

(assert (= (and b!303827 res!161317) b!303829))

(assert (= (and b!303829 res!161313) b!303833))

(assert (= (and b!303833 res!161321) b!303835))

(assert (= (and b!303835 res!161322) b!303828))

(assert (= (and b!303828 res!161319) b!303830))

(assert (= (and b!303830 res!161315) b!303831))

(assert (= (and b!303831 res!161318) b!303832))

(declare-fun m!315101 () Bool)

(assert (=> b!303833 m!315101))

(declare-fun m!315103 () Bool)

(assert (=> b!303834 m!315103))

(declare-fun m!315105 () Bool)

(assert (=> start!30336 m!315105))

(declare-fun m!315107 () Bool)

(assert (=> start!30336 m!315107))

(declare-fun m!315109 () Bool)

(assert (=> b!303832 m!315109))

(declare-fun m!315111 () Bool)

(assert (=> b!303828 m!315111))

(declare-fun m!315113 () Bool)

(assert (=> b!303829 m!315113))

(declare-fun m!315115 () Bool)

(assert (=> b!303831 m!315115))

(declare-fun m!315117 () Bool)

(assert (=> b!303835 m!315117))

(assert (=> b!303835 m!315117))

(declare-fun m!315119 () Bool)

(assert (=> b!303835 m!315119))

(declare-fun m!315121 () Bool)

(assert (=> b!303830 m!315121))

(declare-fun m!315123 () Bool)

(assert (=> b!303827 m!315123))

(push 1)

(assert (not start!30336))

(assert (not b!303829))

(assert (not b!303827))

(assert (not b!303835))

(assert (not b!303830))

(assert (not b!303833))

(assert (not b!303832))

(assert (not b!303834))

(check-sat)

