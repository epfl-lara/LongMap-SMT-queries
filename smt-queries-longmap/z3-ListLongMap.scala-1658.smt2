; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30784 () Bool)

(assert start!30784)

(declare-fun b!308958 () Bool)

(declare-fun res!165573 () Bool)

(declare-fun e!193102 () Bool)

(assert (=> b!308958 (=> (not res!165573) (not e!193102))))

(declare-datatypes ((array!15737 0))(
  ( (array!15738 (arr!7452 (Array (_ BitVec 32) (_ BitVec 64))) (size!7804 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15737)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15737 (_ BitVec 32)) Bool)

(assert (=> b!308958 (= res!165573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308959 () Bool)

(declare-fun res!165578 () Bool)

(assert (=> b!308959 (=> (not res!165578) (not e!193102))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308959 (= res!165578 (validKeyInArray!0 k0!2441))))

(declare-fun b!308960 () Bool)

(declare-fun res!165579 () Bool)

(assert (=> b!308960 (=> (not res!165579) (not e!193102))))

(declare-fun arrayContainsKey!0 (array!15737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308960 (= res!165579 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308961 () Bool)

(declare-fun res!165571 () Bool)

(assert (=> b!308961 (=> (not res!165571) (not e!193102))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308961 (= res!165571 (and (= (size!7804 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7804 a!3293))))))

(declare-fun b!308962 () Bool)

(declare-fun res!165574 () Bool)

(declare-fun e!193100 () Bool)

(assert (=> b!308962 (=> (not res!165574) (not e!193100))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!308962 (= res!165574 (and (= (select (arr!7452 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7804 a!3293))))))

(declare-fun b!308963 () Bool)

(declare-fun e!193099 () Bool)

(assert (=> b!308963 (= e!193100 e!193099)))

(declare-fun res!165572 () Bool)

(assert (=> b!308963 (=> (not res!165572) (not e!193099))))

(declare-datatypes ((SeekEntryResult!2592 0))(
  ( (MissingZero!2592 (index!12544 (_ BitVec 32))) (Found!2592 (index!12545 (_ BitVec 32))) (Intermediate!2592 (undefined!3404 Bool) (index!12546 (_ BitVec 32)) (x!30780 (_ BitVec 32))) (Undefined!2592) (MissingVacant!2592 (index!12547 (_ BitVec 32))) )
))
(declare-fun lt!151482 () SeekEntryResult!2592)

(declare-fun lt!151481 () SeekEntryResult!2592)

(assert (=> b!308963 (= res!165572 (and (= lt!151482 lt!151481) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7452 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15737 (_ BitVec 32)) SeekEntryResult!2592)

(assert (=> b!308963 (= lt!151482 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308964 () Bool)

(assert (=> b!308964 (= e!193099 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308964 (= lt!151482 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308965 () Bool)

(assert (=> b!308965 (= e!193102 e!193100)))

(declare-fun res!165575 () Bool)

(assert (=> b!308965 (=> (not res!165575) (not e!193100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308965 (= res!165575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151481))))

(assert (=> b!308965 (= lt!151481 (Intermediate!2592 false resIndex!52 resX!52))))

(declare-fun res!165577 () Bool)

(assert (=> start!30784 (=> (not res!165577) (not e!193102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30784 (= res!165577 (validMask!0 mask!3709))))

(assert (=> start!30784 e!193102))

(declare-fun array_inv!5415 (array!15737) Bool)

(assert (=> start!30784 (array_inv!5415 a!3293)))

(assert (=> start!30784 true))

(declare-fun b!308966 () Bool)

(declare-fun res!165576 () Bool)

(assert (=> b!308966 (=> (not res!165576) (not e!193102))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15737 (_ BitVec 32)) SeekEntryResult!2592)

(assert (=> b!308966 (= res!165576 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2592 i!1240)))))

(assert (= (and start!30784 res!165577) b!308961))

(assert (= (and b!308961 res!165571) b!308959))

(assert (= (and b!308959 res!165578) b!308960))

(assert (= (and b!308960 res!165579) b!308966))

(assert (= (and b!308966 res!165576) b!308958))

(assert (= (and b!308958 res!165573) b!308965))

(assert (= (and b!308965 res!165575) b!308962))

(assert (= (and b!308962 res!165574) b!308963))

(assert (= (and b!308963 res!165572) b!308964))

(declare-fun m!318979 () Bool)

(assert (=> b!308965 m!318979))

(assert (=> b!308965 m!318979))

(declare-fun m!318981 () Bool)

(assert (=> b!308965 m!318981))

(declare-fun m!318983 () Bool)

(assert (=> b!308966 m!318983))

(declare-fun m!318985 () Bool)

(assert (=> b!308964 m!318985))

(assert (=> b!308964 m!318985))

(declare-fun m!318987 () Bool)

(assert (=> b!308964 m!318987))

(declare-fun m!318989 () Bool)

(assert (=> start!30784 m!318989))

(declare-fun m!318991 () Bool)

(assert (=> start!30784 m!318991))

(declare-fun m!318993 () Bool)

(assert (=> b!308962 m!318993))

(declare-fun m!318995 () Bool)

(assert (=> b!308959 m!318995))

(declare-fun m!318997 () Bool)

(assert (=> b!308958 m!318997))

(declare-fun m!318999 () Bool)

(assert (=> b!308963 m!318999))

(declare-fun m!319001 () Bool)

(assert (=> b!308963 m!319001))

(declare-fun m!319003 () Bool)

(assert (=> b!308960 m!319003))

(check-sat (not b!308959) (not start!30784) (not b!308958) (not b!308965) (not b!308963) (not b!308960) (not b!308966) (not b!308964))
(check-sat)
