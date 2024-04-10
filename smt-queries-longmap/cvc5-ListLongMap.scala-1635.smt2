; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30590 () Bool)

(assert start!30590)

(declare-fun b!306754 () Bool)

(declare-datatypes ((Unit!9551 0))(
  ( (Unit!9552) )
))
(declare-fun e!192292 () Unit!9551)

(declare-fun Unit!9553 () Unit!9551)

(assert (=> b!306754 (= e!192292 Unit!9553)))

(declare-fun b!306755 () Bool)

(declare-fun res!163574 () Bool)

(declare-fun e!192293 () Bool)

(assert (=> b!306755 (=> (not res!163574) (not e!192293))))

(declare-datatypes ((array!15594 0))(
  ( (array!15595 (arr!7382 (Array (_ BitVec 32) (_ BitVec 64))) (size!7734 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15594)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15594 (_ BitVec 32)) Bool)

(assert (=> b!306755 (= res!163574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306756 () Bool)

(declare-fun res!163578 () Bool)

(declare-fun e!192295 () Bool)

(assert (=> b!306756 (=> (not res!163578) (not e!192295))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306756 (= res!163578 (and (= (select (arr!7382 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7734 a!3293))))))

(declare-fun b!306757 () Bool)

(declare-fun res!163579 () Bool)

(assert (=> b!306757 (=> (not res!163579) (not e!192293))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306757 (= res!163579 (validKeyInArray!0 k!2441))))

(declare-fun b!306758 () Bool)

(assert (=> b!306758 false))

(declare-datatypes ((SeekEntryResult!2522 0))(
  ( (MissingZero!2522 (index!12264 (_ BitVec 32))) (Found!2522 (index!12265 (_ BitVec 32))) (Intermediate!2522 (undefined!3334 Bool) (index!12266 (_ BitVec 32)) (x!30517 (_ BitVec 32))) (Undefined!2522) (MissingVacant!2522 (index!12267 (_ BitVec 32))) )
))
(declare-fun lt!151032 () SeekEntryResult!2522)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15594 (_ BitVec 32)) SeekEntryResult!2522)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306758 (= lt!151032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun e!192294 () Unit!9551)

(declare-fun Unit!9554 () Unit!9551)

(assert (=> b!306758 (= e!192294 Unit!9554)))

(declare-fun b!306759 () Bool)

(declare-fun res!163581 () Bool)

(assert (=> b!306759 (=> (not res!163581) (not e!192295))))

(declare-fun lt!151031 () SeekEntryResult!2522)

(assert (=> b!306759 (= res!163581 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151031))))

(declare-fun b!306760 () Bool)

(declare-fun res!163573 () Bool)

(assert (=> b!306760 (=> (not res!163573) (not e!192293))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15594 (_ BitVec 32)) SeekEntryResult!2522)

(assert (=> b!306760 (= res!163573 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2522 i!1240)))))

(declare-fun b!306762 () Bool)

(declare-fun res!163577 () Bool)

(assert (=> b!306762 (=> (not res!163577) (not e!192293))))

(declare-fun arrayContainsKey!0 (array!15594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306762 (= res!163577 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306763 () Bool)

(assert (=> b!306763 (= e!192293 e!192295)))

(declare-fun res!163576 () Bool)

(assert (=> b!306763 (=> (not res!163576) (not e!192295))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306763 (= res!163576 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151031))))

(assert (=> b!306763 (= lt!151031 (Intermediate!2522 false resIndex!52 resX!52))))

(declare-fun b!306764 () Bool)

(declare-fun res!163572 () Bool)

(assert (=> b!306764 (=> (not res!163572) (not e!192295))))

(assert (=> b!306764 (= res!163572 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7382 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306765 () Bool)

(declare-fun res!163580 () Bool)

(assert (=> b!306765 (=> (not res!163580) (not e!192293))))

(assert (=> b!306765 (= res!163580 (and (= (size!7734 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7734 a!3293))))))

(declare-fun b!306766 () Bool)

(assert (=> b!306766 (= e!192292 e!192294)))

(declare-fun c!49194 () Bool)

(assert (=> b!306766 (= c!49194 (or (= (select (arr!7382 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7382 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306767 () Bool)

(assert (=> b!306767 (= e!192295 (not (or (not (= (select (arr!7382 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!306767 (= index!1781 resIndex!52)))

(declare-fun lt!151030 () Unit!9551)

(assert (=> b!306767 (= lt!151030 e!192292)))

(declare-fun c!49193 () Bool)

(assert (=> b!306767 (= c!49193 (not (= resIndex!52 index!1781)))))

(declare-fun b!306761 () Bool)

(assert (=> b!306761 false))

(declare-fun Unit!9555 () Unit!9551)

(assert (=> b!306761 (= e!192294 Unit!9555)))

(declare-fun res!163575 () Bool)

(assert (=> start!30590 (=> (not res!163575) (not e!192293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30590 (= res!163575 (validMask!0 mask!3709))))

(assert (=> start!30590 e!192293))

(declare-fun array_inv!5345 (array!15594) Bool)

(assert (=> start!30590 (array_inv!5345 a!3293)))

(assert (=> start!30590 true))

(assert (= (and start!30590 res!163575) b!306765))

(assert (= (and b!306765 res!163580) b!306757))

(assert (= (and b!306757 res!163579) b!306762))

(assert (= (and b!306762 res!163577) b!306760))

(assert (= (and b!306760 res!163573) b!306755))

(assert (= (and b!306755 res!163574) b!306763))

(assert (= (and b!306763 res!163576) b!306756))

(assert (= (and b!306756 res!163578) b!306759))

(assert (= (and b!306759 res!163581) b!306764))

(assert (= (and b!306764 res!163572) b!306767))

(assert (= (and b!306767 c!49193) b!306766))

(assert (= (and b!306767 (not c!49193)) b!306754))

(assert (= (and b!306766 c!49194) b!306761))

(assert (= (and b!306766 (not c!49194)) b!306758))

(declare-fun m!317225 () Bool)

(assert (=> b!306757 m!317225))

(declare-fun m!317227 () Bool)

(assert (=> b!306763 m!317227))

(assert (=> b!306763 m!317227))

(declare-fun m!317229 () Bool)

(assert (=> b!306763 m!317229))

(declare-fun m!317231 () Bool)

(assert (=> b!306760 m!317231))

(declare-fun m!317233 () Bool)

(assert (=> b!306764 m!317233))

(assert (=> b!306767 m!317233))

(declare-fun m!317235 () Bool)

(assert (=> start!30590 m!317235))

(declare-fun m!317237 () Bool)

(assert (=> start!30590 m!317237))

(declare-fun m!317239 () Bool)

(assert (=> b!306758 m!317239))

(assert (=> b!306758 m!317239))

(declare-fun m!317241 () Bool)

(assert (=> b!306758 m!317241))

(declare-fun m!317243 () Bool)

(assert (=> b!306762 m!317243))

(declare-fun m!317245 () Bool)

(assert (=> b!306759 m!317245))

(assert (=> b!306766 m!317233))

(declare-fun m!317247 () Bool)

(assert (=> b!306755 m!317247))

(declare-fun m!317249 () Bool)

(assert (=> b!306756 m!317249))

(push 1)

