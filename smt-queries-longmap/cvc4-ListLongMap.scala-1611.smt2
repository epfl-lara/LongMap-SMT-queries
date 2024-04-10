; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30342 () Bool)

(assert start!30342)

(declare-fun b!303917 () Bool)

(declare-fun res!161409 () Bool)

(declare-fun e!191109 () Bool)

(assert (=> b!303917 (=> (not res!161409) (not e!191109))))

(declare-datatypes ((array!15448 0))(
  ( (array!15449 (arr!7312 (Array (_ BitVec 32) (_ BitVec 64))) (size!7664 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15448)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303917 (= res!161409 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7312 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7312 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7312 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303918 () Bool)

(declare-fun e!191110 () Bool)

(assert (=> b!303918 (= e!191110 e!191109)))

(declare-fun res!161404 () Bool)

(assert (=> b!303918 (=> (not res!161404) (not e!191109))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2452 0))(
  ( (MissingZero!2452 (index!11984 (_ BitVec 32))) (Found!2452 (index!11985 (_ BitVec 32))) (Intermediate!2452 (undefined!3264 Bool) (index!11986 (_ BitVec 32)) (x!30237 (_ BitVec 32))) (Undefined!2452) (MissingVacant!2452 (index!11987 (_ BitVec 32))) )
))
(declare-fun lt!150285 () SeekEntryResult!2452)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15448 (_ BitVec 32)) SeekEntryResult!2452)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303918 (= res!161404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150285))))

(assert (=> b!303918 (= lt!150285 (Intermediate!2452 false resIndex!52 resX!52))))

(declare-fun res!161407 () Bool)

(assert (=> start!30342 (=> (not res!161407) (not e!191110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30342 (= res!161407 (validMask!0 mask!3709))))

(assert (=> start!30342 e!191110))

(declare-fun array_inv!5275 (array!15448) Bool)

(assert (=> start!30342 (array_inv!5275 a!3293)))

(assert (=> start!30342 true))

(declare-fun b!303919 () Bool)

(declare-fun res!161403 () Bool)

(assert (=> b!303919 (=> (not res!161403) (not e!191110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15448 (_ BitVec 32)) Bool)

(assert (=> b!303919 (= res!161403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303920 () Bool)

(declare-fun res!161412 () Bool)

(assert (=> b!303920 (=> (not res!161412) (not e!191109))))

(assert (=> b!303920 (= res!161412 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150285))))

(declare-fun b!303921 () Bool)

(declare-fun res!161408 () Bool)

(assert (=> b!303921 (=> (not res!161408) (not e!191109))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303921 (= res!161408 (and (= (select (arr!7312 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7664 a!3293))))))

(declare-fun b!303922 () Bool)

(declare-fun res!161411 () Bool)

(assert (=> b!303922 (=> (not res!161411) (not e!191110))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15448 (_ BitVec 32)) SeekEntryResult!2452)

(assert (=> b!303922 (= res!161411 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2452 i!1240)))))

(declare-fun b!303923 () Bool)

(declare-fun res!161406 () Bool)

(assert (=> b!303923 (=> (not res!161406) (not e!191110))))

(declare-fun arrayContainsKey!0 (array!15448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303923 (= res!161406 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303924 () Bool)

(assert (=> b!303924 (= e!191109 false)))

(declare-fun lt!150284 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303924 (= lt!150284 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303925 () Bool)

(declare-fun res!161410 () Bool)

(assert (=> b!303925 (=> (not res!161410) (not e!191110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303925 (= res!161410 (validKeyInArray!0 k!2441))))

(declare-fun b!303926 () Bool)

(declare-fun res!161405 () Bool)

(assert (=> b!303926 (=> (not res!161405) (not e!191110))))

(assert (=> b!303926 (= res!161405 (and (= (size!7664 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7664 a!3293))))))

(assert (= (and start!30342 res!161407) b!303926))

(assert (= (and b!303926 res!161405) b!303925))

(assert (= (and b!303925 res!161410) b!303923))

(assert (= (and b!303923 res!161406) b!303922))

(assert (= (and b!303922 res!161411) b!303919))

(assert (= (and b!303919 res!161403) b!303918))

(assert (= (and b!303918 res!161404) b!303921))

(assert (= (and b!303921 res!161408) b!303920))

(assert (= (and b!303920 res!161412) b!303917))

(assert (= (and b!303917 res!161409) b!303924))

(declare-fun m!315173 () Bool)

(assert (=> b!303918 m!315173))

(assert (=> b!303918 m!315173))

(declare-fun m!315175 () Bool)

(assert (=> b!303918 m!315175))

(declare-fun m!315177 () Bool)

(assert (=> start!30342 m!315177))

(declare-fun m!315179 () Bool)

(assert (=> start!30342 m!315179))

(declare-fun m!315181 () Bool)

(assert (=> b!303923 m!315181))

(declare-fun m!315183 () Bool)

(assert (=> b!303920 m!315183))

(declare-fun m!315185 () Bool)

(assert (=> b!303924 m!315185))

(declare-fun m!315187 () Bool)

(assert (=> b!303921 m!315187))

(declare-fun m!315189 () Bool)

(assert (=> b!303917 m!315189))

(declare-fun m!315191 () Bool)

(assert (=> b!303922 m!315191))

(declare-fun m!315193 () Bool)

(assert (=> b!303919 m!315193))

(declare-fun m!315195 () Bool)

(assert (=> b!303925 m!315195))

(push 1)

(assert (not b!303922))

(assert (not b!303920))

(assert (not b!303918))

(assert (not b!303919))

(assert (not b!303924))

(assert (not b!303923))

(assert (not start!30342))

(assert (not b!303925))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

