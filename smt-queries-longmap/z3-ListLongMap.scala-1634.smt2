; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30586 () Bool)

(assert start!30586)

(declare-fun b!306670 () Bool)

(declare-fun e!192261 () Bool)

(declare-fun e!192265 () Bool)

(assert (=> b!306670 (= e!192261 e!192265)))

(declare-fun res!163515 () Bool)

(assert (=> b!306670 (=> (not res!163515) (not e!192265))))

(declare-datatypes ((array!15590 0))(
  ( (array!15591 (arr!7380 (Array (_ BitVec 32) (_ BitVec 64))) (size!7732 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15590)

(declare-datatypes ((SeekEntryResult!2520 0))(
  ( (MissingZero!2520 (index!12256 (_ BitVec 32))) (Found!2520 (index!12257 (_ BitVec 32))) (Intermediate!2520 (undefined!3332 Bool) (index!12258 (_ BitVec 32)) (x!30507 (_ BitVec 32))) (Undefined!2520) (MissingVacant!2520 (index!12259 (_ BitVec 32))) )
))
(declare-fun lt!151012 () SeekEntryResult!2520)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15590 (_ BitVec 32)) SeekEntryResult!2520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306670 (= res!163515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151012))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306670 (= lt!151012 (Intermediate!2520 false resIndex!52 resX!52))))

(declare-fun b!306671 () Bool)

(declare-fun res!163516 () Bool)

(assert (=> b!306671 (=> (not res!163516) (not e!192261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306671 (= res!163516 (validKeyInArray!0 k0!2441))))

(declare-fun b!306672 () Bool)

(declare-fun res!163520 () Bool)

(assert (=> b!306672 (=> (not res!163520) (not e!192265))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306672 (= res!163520 (and (= (select (arr!7380 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7732 a!3293))))))

(declare-fun b!306673 () Bool)

(declare-datatypes ((Unit!9541 0))(
  ( (Unit!9542) )
))
(declare-fun e!192262 () Unit!9541)

(declare-fun e!192263 () Unit!9541)

(assert (=> b!306673 (= e!192262 e!192263)))

(declare-fun c!49181 () Bool)

(assert (=> b!306673 (= c!49181 (or (= (select (arr!7380 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7380 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306674 () Bool)

(declare-fun Unit!9543 () Unit!9541)

(assert (=> b!306674 (= e!192262 Unit!9543)))

(declare-fun b!306675 () Bool)

(assert (=> b!306675 false))

(declare-fun Unit!9544 () Unit!9541)

(assert (=> b!306675 (= e!192263 Unit!9544)))

(declare-fun b!306676 () Bool)

(declare-fun res!163512 () Bool)

(assert (=> b!306676 (=> (not res!163512) (not e!192261))))

(assert (=> b!306676 (= res!163512 (and (= (size!7732 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7732 a!3293))))))

(declare-fun res!163517 () Bool)

(assert (=> start!30586 (=> (not res!163517) (not e!192261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30586 (= res!163517 (validMask!0 mask!3709))))

(assert (=> start!30586 e!192261))

(declare-fun array_inv!5343 (array!15590) Bool)

(assert (=> start!30586 (array_inv!5343 a!3293)))

(assert (=> start!30586 true))

(declare-fun b!306677 () Bool)

(assert (=> b!306677 false))

(declare-fun lt!151013 () SeekEntryResult!2520)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306677 (= lt!151013 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9545 () Unit!9541)

(assert (=> b!306677 (= e!192263 Unit!9545)))

(declare-fun b!306678 () Bool)

(declare-fun res!163518 () Bool)

(assert (=> b!306678 (=> (not res!163518) (not e!192261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15590 (_ BitVec 32)) Bool)

(assert (=> b!306678 (= res!163518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306679 () Bool)

(assert (=> b!306679 (= e!192265 (not (or (not (= (select (arr!7380 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!306679 (= index!1781 resIndex!52)))

(declare-fun lt!151014 () Unit!9541)

(assert (=> b!306679 (= lt!151014 e!192262)))

(declare-fun c!49182 () Bool)

(assert (=> b!306679 (= c!49182 (not (= resIndex!52 index!1781)))))

(declare-fun b!306680 () Bool)

(declare-fun res!163519 () Bool)

(assert (=> b!306680 (=> (not res!163519) (not e!192261))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15590 (_ BitVec 32)) SeekEntryResult!2520)

(assert (=> b!306680 (= res!163519 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2520 i!1240)))))

(declare-fun b!306681 () Bool)

(declare-fun res!163514 () Bool)

(assert (=> b!306681 (=> (not res!163514) (not e!192265))))

(assert (=> b!306681 (= res!163514 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151012))))

(declare-fun b!306682 () Bool)

(declare-fun res!163521 () Bool)

(assert (=> b!306682 (=> (not res!163521) (not e!192261))))

(declare-fun arrayContainsKey!0 (array!15590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306682 (= res!163521 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306683 () Bool)

(declare-fun res!163513 () Bool)

(assert (=> b!306683 (=> (not res!163513) (not e!192265))))

(assert (=> b!306683 (= res!163513 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7380 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!30586 res!163517) b!306676))

(assert (= (and b!306676 res!163512) b!306671))

(assert (= (and b!306671 res!163516) b!306682))

(assert (= (and b!306682 res!163521) b!306680))

(assert (= (and b!306680 res!163519) b!306678))

(assert (= (and b!306678 res!163518) b!306670))

(assert (= (and b!306670 res!163515) b!306672))

(assert (= (and b!306672 res!163520) b!306681))

(assert (= (and b!306681 res!163514) b!306683))

(assert (= (and b!306683 res!163513) b!306679))

(assert (= (and b!306679 c!49182) b!306673))

(assert (= (and b!306679 (not c!49182)) b!306674))

(assert (= (and b!306673 c!49181) b!306675))

(assert (= (and b!306673 (not c!49181)) b!306677))

(declare-fun m!317173 () Bool)

(assert (=> b!306672 m!317173))

(declare-fun m!317175 () Bool)

(assert (=> b!306673 m!317175))

(declare-fun m!317177 () Bool)

(assert (=> b!306677 m!317177))

(assert (=> b!306677 m!317177))

(declare-fun m!317179 () Bool)

(assert (=> b!306677 m!317179))

(declare-fun m!317181 () Bool)

(assert (=> b!306671 m!317181))

(declare-fun m!317183 () Bool)

(assert (=> b!306681 m!317183))

(declare-fun m!317185 () Bool)

(assert (=> start!30586 m!317185))

(declare-fun m!317187 () Bool)

(assert (=> start!30586 m!317187))

(assert (=> b!306683 m!317175))

(assert (=> b!306679 m!317175))

(declare-fun m!317189 () Bool)

(assert (=> b!306680 m!317189))

(declare-fun m!317191 () Bool)

(assert (=> b!306670 m!317191))

(assert (=> b!306670 m!317191))

(declare-fun m!317193 () Bool)

(assert (=> b!306670 m!317193))

(declare-fun m!317195 () Bool)

(assert (=> b!306678 m!317195))

(declare-fun m!317197 () Bool)

(assert (=> b!306682 m!317197))

(check-sat (not b!306678) (not b!306680) (not b!306670) (not b!306681) (not b!306677) (not start!30586) (not b!306671) (not b!306682))
(check-sat)
