; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30676 () Bool)

(assert start!30676)

(declare-fun b!307982 () Bool)

(declare-fun res!164737 () Bool)

(declare-fun e!192675 () Bool)

(assert (=> b!307982 (=> (not res!164737) (not e!192675))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307982 (= res!164737 (validKeyInArray!0 k0!2441))))

(declare-fun b!307983 () Bool)

(declare-fun res!164745 () Bool)

(declare-fun e!192676 () Bool)

(assert (=> b!307983 (=> (not res!164745) (not e!192676))))

(declare-datatypes ((SeekEntryResult!2565 0))(
  ( (MissingZero!2565 (index!12436 (_ BitVec 32))) (Found!2565 (index!12437 (_ BitVec 32))) (Intermediate!2565 (undefined!3377 Bool) (index!12438 (_ BitVec 32)) (x!30672 (_ BitVec 32))) (Undefined!2565) (MissingVacant!2565 (index!12439 (_ BitVec 32))) )
))
(declare-fun lt!151214 () SeekEntryResult!2565)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15680 0))(
  ( (array!15681 (arr!7425 (Array (_ BitVec 32) (_ BitVec 64))) (size!7777 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15680)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15680 (_ BitVec 32)) SeekEntryResult!2565)

(assert (=> b!307983 (= res!164745 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151214))))

(declare-fun b!307984 () Bool)

(assert (=> b!307984 (= e!192676 false)))

(declare-fun lt!151215 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307984 (= lt!151215 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307985 () Bool)

(declare-fun res!164736 () Bool)

(assert (=> b!307985 (=> (not res!164736) (not e!192676))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307985 (= res!164736 (and (= (select (arr!7425 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7777 a!3293))))))

(declare-fun b!307986 () Bool)

(declare-fun res!164742 () Bool)

(assert (=> b!307986 (=> (not res!164742) (not e!192675))))

(declare-fun arrayContainsKey!0 (array!15680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307986 (= res!164742 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307987 () Bool)

(declare-fun res!164738 () Bool)

(assert (=> b!307987 (=> (not res!164738) (not e!192675))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15680 (_ BitVec 32)) SeekEntryResult!2565)

(assert (=> b!307987 (= res!164738 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2565 i!1240)))))

(declare-fun b!307988 () Bool)

(declare-fun res!164741 () Bool)

(assert (=> b!307988 (=> (not res!164741) (not e!192675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15680 (_ BitVec 32)) Bool)

(assert (=> b!307988 (= res!164741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!164739 () Bool)

(assert (=> start!30676 (=> (not res!164739) (not e!192675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30676 (= res!164739 (validMask!0 mask!3709))))

(assert (=> start!30676 e!192675))

(declare-fun array_inv!5388 (array!15680) Bool)

(assert (=> start!30676 (array_inv!5388 a!3293)))

(assert (=> start!30676 true))

(declare-fun b!307989 () Bool)

(assert (=> b!307989 (= e!192675 e!192676)))

(declare-fun res!164740 () Bool)

(assert (=> b!307989 (=> (not res!164740) (not e!192676))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307989 (= res!164740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151214))))

(assert (=> b!307989 (= lt!151214 (Intermediate!2565 false resIndex!52 resX!52))))

(declare-fun b!307990 () Bool)

(declare-fun res!164744 () Bool)

(assert (=> b!307990 (=> (not res!164744) (not e!192675))))

(assert (=> b!307990 (= res!164744 (and (= (size!7777 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7777 a!3293))))))

(declare-fun b!307991 () Bool)

(declare-fun res!164743 () Bool)

(assert (=> b!307991 (=> (not res!164743) (not e!192676))))

(assert (=> b!307991 (= res!164743 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7425 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (= (and start!30676 res!164739) b!307990))

(assert (= (and b!307990 res!164744) b!307982))

(assert (= (and b!307982 res!164737) b!307986))

(assert (= (and b!307986 res!164742) b!307987))

(assert (= (and b!307987 res!164738) b!307988))

(assert (= (and b!307988 res!164741) b!307989))

(assert (= (and b!307989 res!164740) b!307985))

(assert (= (and b!307985 res!164736) b!307983))

(assert (= (and b!307983 res!164745) b!307991))

(assert (= (and b!307991 res!164743) b!307984))

(declare-fun m!318185 () Bool)

(assert (=> b!307982 m!318185))

(declare-fun m!318187 () Bool)

(assert (=> b!307987 m!318187))

(declare-fun m!318189 () Bool)

(assert (=> b!307984 m!318189))

(declare-fun m!318191 () Bool)

(assert (=> b!307986 m!318191))

(declare-fun m!318193 () Bool)

(assert (=> b!307985 m!318193))

(declare-fun m!318195 () Bool)

(assert (=> b!307989 m!318195))

(assert (=> b!307989 m!318195))

(declare-fun m!318197 () Bool)

(assert (=> b!307989 m!318197))

(declare-fun m!318199 () Bool)

(assert (=> b!307983 m!318199))

(declare-fun m!318201 () Bool)

(assert (=> b!307991 m!318201))

(declare-fun m!318203 () Bool)

(assert (=> b!307988 m!318203))

(declare-fun m!318205 () Bool)

(assert (=> start!30676 m!318205))

(declare-fun m!318207 () Bool)

(assert (=> start!30676 m!318207))

(check-sat (not b!307982) (not b!307988) (not b!307984) (not b!307983) (not start!30676) (not b!307986) (not b!307989) (not b!307987))
(check-sat)
