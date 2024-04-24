; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30318 () Bool)

(assert start!30318)

(declare-fun b!303714 () Bool)

(declare-fun res!161258 () Bool)

(declare-fun e!191031 () Bool)

(assert (=> b!303714 (=> (not res!161258) (not e!191031))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303714 (= res!161258 (validKeyInArray!0 k0!2441))))

(declare-fun b!303716 () Bool)

(declare-fun res!161256 () Bool)

(declare-fun e!191029 () Bool)

(assert (=> b!303716 (=> (not res!161256) (not e!191029))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15437 0))(
  ( (array!15438 (arr!7306 (Array (_ BitVec 32) (_ BitVec 64))) (size!7658 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15437)

(assert (=> b!303716 (= res!161256 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7306 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7306 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7306 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303717 () Bool)

(assert (=> b!303717 (= e!191031 e!191029)))

(declare-fun res!161254 () Bool)

(assert (=> b!303717 (=> (not res!161254) (not e!191029))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2411 0))(
  ( (MissingZero!2411 (index!11820 (_ BitVec 32))) (Found!2411 (index!11821 (_ BitVec 32))) (Intermediate!2411 (undefined!3223 Bool) (index!11822 (_ BitVec 32)) (x!30185 (_ BitVec 32))) (Undefined!2411) (MissingVacant!2411 (index!11823 (_ BitVec 32))) )
))
(declare-fun lt!150272 () SeekEntryResult!2411)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15437 (_ BitVec 32)) SeekEntryResult!2411)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303717 (= res!161254 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150272))))

(assert (=> b!303717 (= lt!150272 (Intermediate!2411 false resIndex!52 resX!52))))

(declare-fun b!303718 () Bool)

(assert (=> b!303718 (= e!191029 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150273 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303718 (= lt!150273 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!303719 () Bool)

(declare-fun res!161257 () Bool)

(assert (=> b!303719 (=> (not res!161257) (not e!191029))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303719 (= res!161257 (and (= (select (arr!7306 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7658 a!3293))))))

(declare-fun b!303720 () Bool)

(declare-fun res!161251 () Bool)

(assert (=> b!303720 (=> (not res!161251) (not e!191029))))

(assert (=> b!303720 (= res!161251 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150272))))

(declare-fun b!303721 () Bool)

(declare-fun res!161259 () Bool)

(assert (=> b!303721 (=> (not res!161259) (not e!191031))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15437 (_ BitVec 32)) SeekEntryResult!2411)

(assert (=> b!303721 (= res!161259 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2411 i!1240)))))

(declare-fun res!161255 () Bool)

(assert (=> start!30318 (=> (not res!161255) (not e!191031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30318 (= res!161255 (validMask!0 mask!3709))))

(assert (=> start!30318 e!191031))

(declare-fun array_inv!5256 (array!15437) Bool)

(assert (=> start!30318 (array_inv!5256 a!3293)))

(assert (=> start!30318 true))

(declare-fun b!303715 () Bool)

(declare-fun res!161253 () Bool)

(assert (=> b!303715 (=> (not res!161253) (not e!191031))))

(declare-fun arrayContainsKey!0 (array!15437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303715 (= res!161253 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303722 () Bool)

(declare-fun res!161250 () Bool)

(assert (=> b!303722 (=> (not res!161250) (not e!191031))))

(assert (=> b!303722 (= res!161250 (and (= (size!7658 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7658 a!3293))))))

(declare-fun b!303723 () Bool)

(declare-fun res!161252 () Bool)

(assert (=> b!303723 (=> (not res!161252) (not e!191031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15437 (_ BitVec 32)) Bool)

(assert (=> b!303723 (= res!161252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30318 res!161255) b!303722))

(assert (= (and b!303722 res!161250) b!303714))

(assert (= (and b!303714 res!161258) b!303715))

(assert (= (and b!303715 res!161253) b!303721))

(assert (= (and b!303721 res!161259) b!303723))

(assert (= (and b!303723 res!161252) b!303717))

(assert (= (and b!303717 res!161254) b!303719))

(assert (= (and b!303719 res!161257) b!303720))

(assert (= (and b!303720 res!161251) b!303716))

(assert (= (and b!303716 res!161256) b!303718))

(declare-fun m!315163 () Bool)

(assert (=> b!303717 m!315163))

(assert (=> b!303717 m!315163))

(declare-fun m!315165 () Bool)

(assert (=> b!303717 m!315165))

(declare-fun m!315167 () Bool)

(assert (=> b!303723 m!315167))

(declare-fun m!315169 () Bool)

(assert (=> b!303714 m!315169))

(declare-fun m!315171 () Bool)

(assert (=> b!303715 m!315171))

(declare-fun m!315173 () Bool)

(assert (=> b!303716 m!315173))

(declare-fun m!315175 () Bool)

(assert (=> b!303719 m!315175))

(declare-fun m!315177 () Bool)

(assert (=> b!303720 m!315177))

(declare-fun m!315179 () Bool)

(assert (=> start!30318 m!315179))

(declare-fun m!315181 () Bool)

(assert (=> start!30318 m!315181))

(declare-fun m!315183 () Bool)

(assert (=> b!303721 m!315183))

(declare-fun m!315185 () Bool)

(assert (=> b!303718 m!315185))

(check-sat (not b!303720) (not b!303721) (not b!303714) (not b!303718) (not b!303717) (not b!303715) (not start!30318) (not b!303723))
(check-sat)
