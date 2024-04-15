; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30762 () Bool)

(assert start!30762)

(declare-fun b!308575 () Bool)

(declare-fun res!165334 () Bool)

(declare-fun e!192877 () Bool)

(assert (=> b!308575 (=> (not res!165334) (not e!192877))))

(declare-datatypes ((array!15719 0))(
  ( (array!15720 (arr!7443 (Array (_ BitVec 32) (_ BitVec 64))) (size!7796 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15719)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2582 0))(
  ( (MissingZero!2582 (index!12504 (_ BitVec 32))) (Found!2582 (index!12505 (_ BitVec 32))) (Intermediate!2582 (undefined!3394 Bool) (index!12506 (_ BitVec 32)) (x!30757 (_ BitVec 32))) (Undefined!2582) (MissingVacant!2582 (index!12507 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15719 (_ BitVec 32)) SeekEntryResult!2582)

(assert (=> b!308575 (= res!165334 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2582 i!1240)))))

(declare-fun b!308576 () Bool)

(declare-fun res!165342 () Bool)

(assert (=> b!308576 (=> (not res!165342) (not e!192877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15719 (_ BitVec 32)) Bool)

(assert (=> b!308576 (= res!165342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308577 () Bool)

(declare-fun res!165338 () Bool)

(assert (=> b!308577 (=> (not res!165338) (not e!192877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308577 (= res!165338 (validKeyInArray!0 k0!2441))))

(declare-fun res!165336 () Bool)

(assert (=> start!30762 (=> (not res!165336) (not e!192877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30762 (= res!165336 (validMask!0 mask!3709))))

(assert (=> start!30762 e!192877))

(declare-fun array_inv!5415 (array!15719) Bool)

(assert (=> start!30762 (array_inv!5415 a!3293)))

(assert (=> start!30762 true))

(declare-fun b!308578 () Bool)

(declare-fun e!192878 () Bool)

(assert (=> b!308578 (= e!192877 e!192878)))

(declare-fun res!165337 () Bool)

(assert (=> b!308578 (=> (not res!165337) (not e!192878))))

(declare-fun lt!151222 () SeekEntryResult!2582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15719 (_ BitVec 32)) SeekEntryResult!2582)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308578 (= res!165337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151222))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308578 (= lt!151222 (Intermediate!2582 false resIndex!52 resX!52))))

(declare-fun b!308579 () Bool)

(declare-fun res!165341 () Bool)

(assert (=> b!308579 (=> (not res!165341) (not e!192877))))

(declare-fun arrayContainsKey!0 (array!15719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308579 (= res!165341 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308580 () Bool)

(declare-fun e!192876 () Bool)

(assert (=> b!308580 (= e!192878 e!192876)))

(declare-fun res!165335 () Bool)

(assert (=> b!308580 (=> (not res!165335) (not e!192876))))

(declare-fun lt!151223 () SeekEntryResult!2582)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308580 (= res!165335 (and (= lt!151223 lt!151222) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7443 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308580 (= lt!151223 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308581 () Bool)

(declare-fun res!165339 () Bool)

(assert (=> b!308581 (=> (not res!165339) (not e!192878))))

(assert (=> b!308581 (= res!165339 (and (= (select (arr!7443 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7796 a!3293))))))

(declare-fun b!308582 () Bool)

(declare-fun res!165340 () Bool)

(assert (=> b!308582 (=> (not res!165340) (not e!192877))))

(assert (=> b!308582 (= res!165340 (and (= (size!7796 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7796 a!3293))))))

(declare-fun b!308583 () Bool)

(assert (=> b!308583 (= e!192876 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308583 (= lt!151223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30762 res!165336) b!308582))

(assert (= (and b!308582 res!165340) b!308577))

(assert (= (and b!308577 res!165338) b!308579))

(assert (= (and b!308579 res!165341) b!308575))

(assert (= (and b!308575 res!165334) b!308576))

(assert (= (and b!308576 res!165342) b!308578))

(assert (= (and b!308578 res!165337) b!308581))

(assert (= (and b!308581 res!165339) b!308580))

(assert (= (and b!308580 res!165335) b!308583))

(declare-fun m!318145 () Bool)

(assert (=> b!308576 m!318145))

(declare-fun m!318147 () Bool)

(assert (=> b!308581 m!318147))

(declare-fun m!318149 () Bool)

(assert (=> b!308580 m!318149))

(declare-fun m!318151 () Bool)

(assert (=> b!308580 m!318151))

(declare-fun m!318153 () Bool)

(assert (=> b!308575 m!318153))

(declare-fun m!318155 () Bool)

(assert (=> b!308578 m!318155))

(assert (=> b!308578 m!318155))

(declare-fun m!318157 () Bool)

(assert (=> b!308578 m!318157))

(declare-fun m!318159 () Bool)

(assert (=> b!308579 m!318159))

(declare-fun m!318161 () Bool)

(assert (=> b!308583 m!318161))

(assert (=> b!308583 m!318161))

(declare-fun m!318163 () Bool)

(assert (=> b!308583 m!318163))

(declare-fun m!318165 () Bool)

(assert (=> b!308577 m!318165))

(declare-fun m!318167 () Bool)

(assert (=> start!30762 m!318167))

(declare-fun m!318169 () Bool)

(assert (=> start!30762 m!318169))

(check-sat (not b!308580) (not b!308577) (not b!308578) (not b!308575) (not b!308579) (not b!308576) (not start!30762) (not b!308583))
(check-sat)
