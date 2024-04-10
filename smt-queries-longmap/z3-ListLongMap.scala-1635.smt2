; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30592 () Bool)

(assert start!30592)

(declare-fun b!306796 () Bool)

(declare-fun res!163603 () Bool)

(declare-fun e!192306 () Bool)

(assert (=> b!306796 (=> (not res!163603) (not e!192306))))

(declare-datatypes ((array!15596 0))(
  ( (array!15597 (arr!7383 (Array (_ BitVec 32) (_ BitVec 64))) (size!7735 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15596)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306796 (= res!163603 (and (= (size!7735 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7735 a!3293))))))

(declare-fun b!306797 () Bool)

(declare-fun res!163609 () Bool)

(assert (=> b!306797 (=> (not res!163609) (not e!192306))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2523 0))(
  ( (MissingZero!2523 (index!12268 (_ BitVec 32))) (Found!2523 (index!12269 (_ BitVec 32))) (Intermediate!2523 (undefined!3335 Bool) (index!12270 (_ BitVec 32)) (x!30518 (_ BitVec 32))) (Undefined!2523) (MissingVacant!2523 (index!12271 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15596 (_ BitVec 32)) SeekEntryResult!2523)

(assert (=> b!306797 (= res!163609 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2523 i!1240)))))

(declare-fun b!306798 () Bool)

(declare-datatypes ((Unit!9556 0))(
  ( (Unit!9557) )
))
(declare-fun e!192310 () Unit!9556)

(declare-fun e!192309 () Unit!9556)

(assert (=> b!306798 (= e!192310 e!192309)))

(declare-fun c!49200 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306798 (= c!49200 (or (= (select (arr!7383 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7383 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306799 () Bool)

(declare-fun res!163610 () Bool)

(assert (=> b!306799 (=> (not res!163610) (not e!192306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15596 (_ BitVec 32)) Bool)

(assert (=> b!306799 (= res!163610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306800 () Bool)

(declare-fun e!192307 () Bool)

(assert (=> b!306800 (= e!192306 e!192307)))

(declare-fun res!163602 () Bool)

(assert (=> b!306800 (=> (not res!163602) (not e!192307))))

(declare-fun lt!151041 () SeekEntryResult!2523)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15596 (_ BitVec 32)) SeekEntryResult!2523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306800 (= res!163602 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151041))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306800 (= lt!151041 (Intermediate!2523 false resIndex!52 resX!52))))

(declare-fun b!306801 () Bool)

(declare-fun res!163605 () Bool)

(assert (=> b!306801 (=> (not res!163605) (not e!192307))))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!306801 (= res!163605 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7383 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!306802 () Bool)

(declare-fun Unit!9558 () Unit!9556)

(assert (=> b!306802 (= e!192310 Unit!9558)))

(declare-fun b!306803 () Bool)

(assert (=> b!306803 (= e!192307 (not (or (not (= (select (arr!7383 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!306803 (= index!1781 resIndex!52)))

(declare-fun lt!151040 () Unit!9556)

(assert (=> b!306803 (= lt!151040 e!192310)))

(declare-fun c!49199 () Bool)

(assert (=> b!306803 (= c!49199 (not (= resIndex!52 index!1781)))))

(declare-fun b!306804 () Bool)

(declare-fun res!163608 () Bool)

(assert (=> b!306804 (=> (not res!163608) (not e!192307))))

(assert (=> b!306804 (= res!163608 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151041))))

(declare-fun res!163607 () Bool)

(assert (=> start!30592 (=> (not res!163607) (not e!192306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30592 (= res!163607 (validMask!0 mask!3709))))

(assert (=> start!30592 e!192306))

(declare-fun array_inv!5346 (array!15596) Bool)

(assert (=> start!30592 (array_inv!5346 a!3293)))

(assert (=> start!30592 true))

(declare-fun b!306805 () Bool)

(declare-fun res!163604 () Bool)

(assert (=> b!306805 (=> (not res!163604) (not e!192306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306805 (= res!163604 (validKeyInArray!0 k0!2441))))

(declare-fun b!306806 () Bool)

(declare-fun res!163606 () Bool)

(assert (=> b!306806 (=> (not res!163606) (not e!192306))))

(declare-fun arrayContainsKey!0 (array!15596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306806 (= res!163606 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306807 () Bool)

(assert (=> b!306807 false))

(declare-fun lt!151039 () SeekEntryResult!2523)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306807 (= lt!151039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9559 () Unit!9556)

(assert (=> b!306807 (= e!192309 Unit!9559)))

(declare-fun b!306808 () Bool)

(declare-fun res!163611 () Bool)

(assert (=> b!306808 (=> (not res!163611) (not e!192307))))

(assert (=> b!306808 (= res!163611 (and (= (select (arr!7383 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7735 a!3293))))))

(declare-fun b!306809 () Bool)

(assert (=> b!306809 false))

(declare-fun Unit!9560 () Unit!9556)

(assert (=> b!306809 (= e!192309 Unit!9560)))

(assert (= (and start!30592 res!163607) b!306796))

(assert (= (and b!306796 res!163603) b!306805))

(assert (= (and b!306805 res!163604) b!306806))

(assert (= (and b!306806 res!163606) b!306797))

(assert (= (and b!306797 res!163609) b!306799))

(assert (= (and b!306799 res!163610) b!306800))

(assert (= (and b!306800 res!163602) b!306808))

(assert (= (and b!306808 res!163611) b!306804))

(assert (= (and b!306804 res!163608) b!306801))

(assert (= (and b!306801 res!163605) b!306803))

(assert (= (and b!306803 c!49199) b!306798))

(assert (= (and b!306803 (not c!49199)) b!306802))

(assert (= (and b!306798 c!49200) b!306809))

(assert (= (and b!306798 (not c!49200)) b!306807))

(declare-fun m!317251 () Bool)

(assert (=> b!306798 m!317251))

(declare-fun m!317253 () Bool)

(assert (=> b!306799 m!317253))

(declare-fun m!317255 () Bool)

(assert (=> b!306808 m!317255))

(assert (=> b!306801 m!317251))

(declare-fun m!317257 () Bool)

(assert (=> b!306807 m!317257))

(assert (=> b!306807 m!317257))

(declare-fun m!317259 () Bool)

(assert (=> b!306807 m!317259))

(declare-fun m!317261 () Bool)

(assert (=> b!306804 m!317261))

(declare-fun m!317263 () Bool)

(assert (=> b!306797 m!317263))

(declare-fun m!317265 () Bool)

(assert (=> b!306805 m!317265))

(declare-fun m!317267 () Bool)

(assert (=> b!306806 m!317267))

(declare-fun m!317269 () Bool)

(assert (=> start!30592 m!317269))

(declare-fun m!317271 () Bool)

(assert (=> start!30592 m!317271))

(declare-fun m!317273 () Bool)

(assert (=> b!306800 m!317273))

(assert (=> b!306800 m!317273))

(declare-fun m!317275 () Bool)

(assert (=> b!306800 m!317275))

(assert (=> b!306803 m!317251))

(check-sat (not b!306804) (not b!306799) (not b!306807) (not b!306797) (not b!306805) (not b!306800) (not start!30592) (not b!306806))
(check-sat)
