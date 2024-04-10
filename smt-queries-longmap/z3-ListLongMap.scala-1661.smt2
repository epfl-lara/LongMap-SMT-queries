; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30802 () Bool)

(assert start!30802)

(declare-fun b!309202 () Bool)

(declare-fun res!165819 () Bool)

(declare-fun e!193210 () Bool)

(assert (=> b!309202 (=> (not res!165819) (not e!193210))))

(declare-datatypes ((array!15755 0))(
  ( (array!15756 (arr!7461 (Array (_ BitVec 32) (_ BitVec 64))) (size!7813 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15755)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2601 0))(
  ( (MissingZero!2601 (index!12580 (_ BitVec 32))) (Found!2601 (index!12581 (_ BitVec 32))) (Intermediate!2601 (undefined!3413 Bool) (index!12582 (_ BitVec 32)) (x!30813 (_ BitVec 32))) (Undefined!2601) (MissingVacant!2601 (index!12583 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15755 (_ BitVec 32)) SeekEntryResult!2601)

(assert (=> b!309202 (= res!165819 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2601 i!1240)))))

(declare-fun b!309203 () Bool)

(declare-fun e!193207 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309203 (= e!193207 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun lt!151536 () SeekEntryResult!2601)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15755 (_ BitVec 32)) SeekEntryResult!2601)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309203 (= lt!151536 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309204 () Bool)

(declare-fun res!165815 () Bool)

(assert (=> b!309204 (=> (not res!165815) (not e!193210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15755 (_ BitVec 32)) Bool)

(assert (=> b!309204 (= res!165815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309205 () Bool)

(declare-fun res!165821 () Bool)

(assert (=> b!309205 (=> (not res!165821) (not e!193210))))

(declare-fun arrayContainsKey!0 (array!15755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309205 (= res!165821 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309206 () Bool)

(declare-fun res!165817 () Bool)

(declare-fun e!193209 () Bool)

(assert (=> b!309206 (=> (not res!165817) (not e!193209))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309206 (= res!165817 (and (= (select (arr!7461 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7813 a!3293))))))

(declare-fun b!309207 () Bool)

(declare-fun res!165820 () Bool)

(assert (=> b!309207 (=> (not res!165820) (not e!193210))))

(assert (=> b!309207 (= res!165820 (and (= (size!7813 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7813 a!3293))))))

(declare-fun b!309208 () Bool)

(assert (=> b!309208 (= e!193210 e!193209)))

(declare-fun res!165822 () Bool)

(assert (=> b!309208 (=> (not res!165822) (not e!193209))))

(declare-fun lt!151535 () SeekEntryResult!2601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309208 (= res!165822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151535))))

(assert (=> b!309208 (= lt!151535 (Intermediate!2601 false resIndex!52 resX!52))))

(declare-fun b!309209 () Bool)

(declare-fun res!165818 () Bool)

(assert (=> b!309209 (=> (not res!165818) (not e!193210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309209 (= res!165818 (validKeyInArray!0 k0!2441))))

(declare-fun b!309201 () Bool)

(assert (=> b!309201 (= e!193209 e!193207)))

(declare-fun res!165814 () Bool)

(assert (=> b!309201 (=> (not res!165814) (not e!193207))))

(assert (=> b!309201 (= res!165814 (and (= lt!151536 lt!151535) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7461 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309201 (= lt!151536 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!165816 () Bool)

(assert (=> start!30802 (=> (not res!165816) (not e!193210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30802 (= res!165816 (validMask!0 mask!3709))))

(assert (=> start!30802 e!193210))

(declare-fun array_inv!5424 (array!15755) Bool)

(assert (=> start!30802 (array_inv!5424 a!3293)))

(assert (=> start!30802 true))

(assert (= (and start!30802 res!165816) b!309207))

(assert (= (and b!309207 res!165820) b!309209))

(assert (= (and b!309209 res!165818) b!309205))

(assert (= (and b!309205 res!165821) b!309202))

(assert (= (and b!309202 res!165819) b!309204))

(assert (= (and b!309204 res!165815) b!309208))

(assert (= (and b!309208 res!165822) b!309206))

(assert (= (and b!309206 res!165817) b!309201))

(assert (= (and b!309201 res!165814) b!309203))

(declare-fun m!319213 () Bool)

(assert (=> b!309201 m!319213))

(declare-fun m!319215 () Bool)

(assert (=> b!309201 m!319215))

(declare-fun m!319217 () Bool)

(assert (=> b!309205 m!319217))

(declare-fun m!319219 () Bool)

(assert (=> start!30802 m!319219))

(declare-fun m!319221 () Bool)

(assert (=> start!30802 m!319221))

(declare-fun m!319223 () Bool)

(assert (=> b!309202 m!319223))

(declare-fun m!319225 () Bool)

(assert (=> b!309208 m!319225))

(assert (=> b!309208 m!319225))

(declare-fun m!319227 () Bool)

(assert (=> b!309208 m!319227))

(declare-fun m!319229 () Bool)

(assert (=> b!309203 m!319229))

(assert (=> b!309203 m!319229))

(declare-fun m!319231 () Bool)

(assert (=> b!309203 m!319231))

(declare-fun m!319233 () Bool)

(assert (=> b!309206 m!319233))

(declare-fun m!319235 () Bool)

(assert (=> b!309209 m!319235))

(declare-fun m!319237 () Bool)

(assert (=> b!309204 m!319237))

(check-sat (not b!309203) (not b!309209) (not b!309204) (not start!30802) (not b!309201) (not b!309208) (not b!309202) (not b!309205))
(check-sat)
