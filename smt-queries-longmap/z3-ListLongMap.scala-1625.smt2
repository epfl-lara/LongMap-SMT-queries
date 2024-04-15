; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30516 () Bool)

(assert start!30516)

(declare-fun b!305219 () Bool)

(declare-fun e!191669 () Bool)

(assert (=> b!305219 (= e!191669 (not true))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305219 (= index!1781 resIndex!52)))

(declare-datatypes ((Unit!9361 0))(
  ( (Unit!9362) )
))
(declare-fun lt!150526 () Unit!9361)

(declare-fun e!191665 () Unit!9361)

(assert (=> b!305219 (= lt!150526 e!191665)))

(declare-fun c!48940 () Bool)

(assert (=> b!305219 (= c!48940 (not (= resIndex!52 index!1781)))))

(declare-fun b!305220 () Bool)

(declare-fun res!162544 () Bool)

(declare-fun e!191667 () Bool)

(assert (=> b!305220 (=> (not res!162544) (not e!191667))))

(declare-datatypes ((array!15524 0))(
  ( (array!15525 (arr!7347 (Array (_ BitVec 32) (_ BitVec 64))) (size!7700 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15524)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2486 0))(
  ( (MissingZero!2486 (index!12120 (_ BitVec 32))) (Found!2486 (index!12121 (_ BitVec 32))) (Intermediate!2486 (undefined!3298 Bool) (index!12122 (_ BitVec 32)) (x!30396 (_ BitVec 32))) (Undefined!2486) (MissingVacant!2486 (index!12123 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15524 (_ BitVec 32)) SeekEntryResult!2486)

(assert (=> b!305220 (= res!162544 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2486 i!1240)))))

(declare-fun b!305221 () Bool)

(declare-fun e!191668 () Unit!9361)

(assert (=> b!305221 (= e!191665 e!191668)))

(declare-fun c!48941 () Bool)

(assert (=> b!305221 (= c!48941 (or (= (select (arr!7347 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7347 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305222 () Bool)

(declare-fun res!162552 () Bool)

(assert (=> b!305222 (=> (not res!162552) (not e!191669))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305222 (= res!162552 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7347 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun res!162543 () Bool)

(assert (=> start!30516 (=> (not res!162543) (not e!191667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30516 (= res!162543 (validMask!0 mask!3709))))

(assert (=> start!30516 e!191667))

(declare-fun array_inv!5319 (array!15524) Bool)

(assert (=> start!30516 (array_inv!5319 a!3293)))

(assert (=> start!30516 true))

(declare-fun b!305223 () Bool)

(declare-fun res!162545 () Bool)

(assert (=> b!305223 (=> (not res!162545) (not e!191669))))

(assert (=> b!305223 (= res!162545 (and (= (select (arr!7347 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7700 a!3293))))))

(declare-fun b!305224 () Bool)

(declare-fun res!162549 () Bool)

(assert (=> b!305224 (=> (not res!162549) (not e!191667))))

(declare-fun arrayContainsKey!0 (array!15524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305224 (= res!162549 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305225 () Bool)

(assert (=> b!305225 false))

(declare-fun lt!150527 () SeekEntryResult!2486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15524 (_ BitVec 32)) SeekEntryResult!2486)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305225 (= lt!150527 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9363 () Unit!9361)

(assert (=> b!305225 (= e!191668 Unit!9363)))

(declare-fun b!305226 () Bool)

(declare-fun res!162548 () Bool)

(assert (=> b!305226 (=> (not res!162548) (not e!191669))))

(declare-fun lt!150525 () SeekEntryResult!2486)

(assert (=> b!305226 (= res!162548 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150525))))

(declare-fun b!305227 () Bool)

(declare-fun res!162550 () Bool)

(assert (=> b!305227 (=> (not res!162550) (not e!191667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15524 (_ BitVec 32)) Bool)

(assert (=> b!305227 (= res!162550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305228 () Bool)

(declare-fun res!162547 () Bool)

(assert (=> b!305228 (=> (not res!162547) (not e!191667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305228 (= res!162547 (validKeyInArray!0 k0!2441))))

(declare-fun b!305229 () Bool)

(assert (=> b!305229 false))

(declare-fun Unit!9364 () Unit!9361)

(assert (=> b!305229 (= e!191668 Unit!9364)))

(declare-fun b!305230 () Bool)

(declare-fun Unit!9365 () Unit!9361)

(assert (=> b!305230 (= e!191665 Unit!9365)))

(declare-fun b!305231 () Bool)

(assert (=> b!305231 (= e!191667 e!191669)))

(declare-fun res!162551 () Bool)

(assert (=> b!305231 (=> (not res!162551) (not e!191669))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305231 (= res!162551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150525))))

(assert (=> b!305231 (= lt!150525 (Intermediate!2486 false resIndex!52 resX!52))))

(declare-fun b!305232 () Bool)

(declare-fun res!162546 () Bool)

(assert (=> b!305232 (=> (not res!162546) (not e!191667))))

(assert (=> b!305232 (= res!162546 (and (= (size!7700 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7700 a!3293))))))

(assert (= (and start!30516 res!162543) b!305232))

(assert (= (and b!305232 res!162546) b!305228))

(assert (= (and b!305228 res!162547) b!305224))

(assert (= (and b!305224 res!162549) b!305220))

(assert (= (and b!305220 res!162544) b!305227))

(assert (= (and b!305227 res!162550) b!305231))

(assert (= (and b!305231 res!162551) b!305223))

(assert (= (and b!305223 res!162545) b!305226))

(assert (= (and b!305226 res!162548) b!305222))

(assert (= (and b!305222 res!162552) b!305219))

(assert (= (and b!305219 c!48940) b!305221))

(assert (= (and b!305219 (not c!48940)) b!305230))

(assert (= (and b!305221 c!48941) b!305229))

(assert (= (and b!305221 (not c!48941)) b!305225))

(declare-fun m!315715 () Bool)

(assert (=> b!305227 m!315715))

(declare-fun m!315717 () Bool)

(assert (=> start!30516 m!315717))

(declare-fun m!315719 () Bool)

(assert (=> start!30516 m!315719))

(declare-fun m!315721 () Bool)

(assert (=> b!305224 m!315721))

(declare-fun m!315723 () Bool)

(assert (=> b!305226 m!315723))

(declare-fun m!315725 () Bool)

(assert (=> b!305225 m!315725))

(assert (=> b!305225 m!315725))

(declare-fun m!315727 () Bool)

(assert (=> b!305225 m!315727))

(declare-fun m!315729 () Bool)

(assert (=> b!305221 m!315729))

(declare-fun m!315731 () Bool)

(assert (=> b!305223 m!315731))

(declare-fun m!315733 () Bool)

(assert (=> b!305231 m!315733))

(assert (=> b!305231 m!315733))

(declare-fun m!315735 () Bool)

(assert (=> b!305231 m!315735))

(declare-fun m!315737 () Bool)

(assert (=> b!305228 m!315737))

(assert (=> b!305222 m!315729))

(declare-fun m!315739 () Bool)

(assert (=> b!305220 m!315739))

(check-sat (not b!305224) (not b!305227) (not b!305225) (not b!305231) (not b!305226) (not b!305220) (not start!30516) (not b!305228))
(check-sat)
