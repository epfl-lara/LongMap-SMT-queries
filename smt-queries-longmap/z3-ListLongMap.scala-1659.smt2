; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30774 () Bool)

(assert start!30774)

(declare-fun b!308959 () Bool)

(declare-fun e!193090 () Bool)

(assert (=> b!308959 (= e!193090 (not true))))

(declare-datatypes ((array!15740 0))(
  ( (array!15741 (arr!7453 (Array (_ BitVec 32) (_ BitVec 64))) (size!7805 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15740)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2558 0))(
  ( (MissingZero!2558 (index!12408 (_ BitVec 32))) (Found!2558 (index!12409 (_ BitVec 32))) (Intermediate!2558 (undefined!3370 Bool) (index!12410 (_ BitVec 32)) (x!30751 (_ BitVec 32))) (Undefined!2558) (MissingVacant!2558 (index!12411 (_ BitVec 32))) )
))
(declare-fun lt!151511 () SeekEntryResult!2558)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15740 (_ BitVec 32)) SeekEntryResult!2558)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308959 (= lt!151511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308960 () Bool)

(declare-fun e!193091 () Bool)

(declare-fun e!193092 () Bool)

(assert (=> b!308960 (= e!193091 e!193092)))

(declare-fun res!165627 () Bool)

(assert (=> b!308960 (=> (not res!165627) (not e!193092))))

(declare-fun lt!151512 () SeekEntryResult!2558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308960 (= res!165627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151512))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308960 (= lt!151512 (Intermediate!2558 false resIndex!52 resX!52))))

(declare-fun b!308961 () Bool)

(assert (=> b!308961 (= e!193092 e!193090)))

(declare-fun res!165629 () Bool)

(assert (=> b!308961 (=> (not res!165629) (not e!193090))))

(assert (=> b!308961 (= res!165629 (and (= lt!151511 lt!151512) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7453 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308961 (= lt!151511 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308962 () Bool)

(declare-fun res!165624 () Bool)

(assert (=> b!308962 (=> (not res!165624) (not e!193091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15740 (_ BitVec 32)) Bool)

(assert (=> b!308962 (= res!165624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308963 () Bool)

(declare-fun res!165625 () Bool)

(assert (=> b!308963 (=> (not res!165625) (not e!193092))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308963 (= res!165625 (and (= (select (arr!7453 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7805 a!3293))))))

(declare-fun b!308964 () Bool)

(declare-fun res!165623 () Bool)

(assert (=> b!308964 (=> (not res!165623) (not e!193091))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308964 (= res!165623 (validKeyInArray!0 k0!2441))))

(declare-fun b!308965 () Bool)

(declare-fun res!165630 () Bool)

(assert (=> b!308965 (=> (not res!165630) (not e!193091))))

(assert (=> b!308965 (= res!165630 (and (= (size!7805 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7805 a!3293))))))

(declare-fun b!308966 () Bool)

(declare-fun res!165626 () Bool)

(assert (=> b!308966 (=> (not res!165626) (not e!193091))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15740 (_ BitVec 32)) SeekEntryResult!2558)

(assert (=> b!308966 (= res!165626 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2558 i!1240)))))

(declare-fun res!165628 () Bool)

(assert (=> start!30774 (=> (not res!165628) (not e!193091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30774 (= res!165628 (validMask!0 mask!3709))))

(assert (=> start!30774 e!193091))

(declare-fun array_inv!5403 (array!15740) Bool)

(assert (=> start!30774 (array_inv!5403 a!3293)))

(assert (=> start!30774 true))

(declare-fun b!308967 () Bool)

(declare-fun res!165622 () Bool)

(assert (=> b!308967 (=> (not res!165622) (not e!193091))))

(declare-fun arrayContainsKey!0 (array!15740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308967 (= res!165622 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30774 res!165628) b!308965))

(assert (= (and b!308965 res!165630) b!308964))

(assert (= (and b!308964 res!165623) b!308967))

(assert (= (and b!308967 res!165622) b!308966))

(assert (= (and b!308966 res!165626) b!308962))

(assert (= (and b!308962 res!165624) b!308960))

(assert (= (and b!308960 res!165627) b!308963))

(assert (= (and b!308963 res!165625) b!308961))

(assert (= (and b!308961 res!165629) b!308959))

(declare-fun m!319159 () Bool)

(assert (=> b!308964 m!319159))

(declare-fun m!319161 () Bool)

(assert (=> b!308963 m!319161))

(declare-fun m!319163 () Bool)

(assert (=> start!30774 m!319163))

(declare-fun m!319165 () Bool)

(assert (=> start!30774 m!319165))

(declare-fun m!319167 () Bool)

(assert (=> b!308966 m!319167))

(declare-fun m!319169 () Bool)

(assert (=> b!308967 m!319169))

(declare-fun m!319171 () Bool)

(assert (=> b!308960 m!319171))

(assert (=> b!308960 m!319171))

(declare-fun m!319173 () Bool)

(assert (=> b!308960 m!319173))

(declare-fun m!319175 () Bool)

(assert (=> b!308959 m!319175))

(assert (=> b!308959 m!319175))

(declare-fun m!319177 () Bool)

(assert (=> b!308959 m!319177))

(declare-fun m!319179 () Bool)

(assert (=> b!308961 m!319179))

(declare-fun m!319181 () Bool)

(assert (=> b!308961 m!319181))

(declare-fun m!319183 () Bool)

(assert (=> b!308962 m!319183))

(check-sat (not b!308960) (not b!308966) (not b!308961) (not b!308967) (not start!30774) (not b!308959) (not b!308964) (not b!308962))
(check-sat)
