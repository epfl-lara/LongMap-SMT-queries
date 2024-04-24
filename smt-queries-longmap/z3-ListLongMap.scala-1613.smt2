; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30390 () Bool)

(assert start!30390)

(declare-fun e!191242 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!304200 () Bool)

(declare-fun lt!150432 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!304200 (= e!191242 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!150432 #b00000000000000000000000000000000) (bvslt lt!150432 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304200 (= lt!150432 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!304201 () Bool)

(declare-fun e!191244 () Bool)

(assert (=> b!304201 (= e!191244 e!191242)))

(declare-fun res!161595 () Bool)

(assert (=> b!304201 (=> (not res!161595) (not e!191242))))

(declare-datatypes ((array!15458 0))(
  ( (array!15459 (arr!7315 (Array (_ BitVec 32) (_ BitVec 64))) (size!7667 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15458)

(declare-datatypes ((SeekEntryResult!2420 0))(
  ( (MissingZero!2420 (index!11856 (_ BitVec 32))) (Found!2420 (index!11857 (_ BitVec 32))) (Intermediate!2420 (undefined!3232 Bool) (index!11858 (_ BitVec 32)) (x!30227 (_ BitVec 32))) (Undefined!2420) (MissingVacant!2420 (index!11859 (_ BitVec 32))) )
))
(declare-fun lt!150431 () SeekEntryResult!2420)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15458 (_ BitVec 32)) SeekEntryResult!2420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304201 (= res!161595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150431))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304201 (= lt!150431 (Intermediate!2420 false resIndex!52 resX!52))))

(declare-fun b!304202 () Bool)

(declare-fun res!161597 () Bool)

(assert (=> b!304202 (=> (not res!161597) (not e!191242))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304202 (= res!161597 (and (= (select (arr!7315 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7667 a!3293))))))

(declare-fun b!304203 () Bool)

(declare-fun res!161596 () Bool)

(assert (=> b!304203 (=> (not res!161596) (not e!191244))))

(assert (=> b!304203 (= res!161596 (and (= (size!7667 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7667 a!3293))))))

(declare-fun b!304204 () Bool)

(declare-fun res!161601 () Bool)

(assert (=> b!304204 (=> (not res!161601) (not e!191244))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15458 (_ BitVec 32)) SeekEntryResult!2420)

(assert (=> b!304204 (= res!161601 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2420 i!1240)))))

(declare-fun res!161604 () Bool)

(assert (=> start!30390 (=> (not res!161604) (not e!191244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30390 (= res!161604 (validMask!0 mask!3709))))

(assert (=> start!30390 e!191244))

(declare-fun array_inv!5265 (array!15458) Bool)

(assert (=> start!30390 (array_inv!5265 a!3293)))

(assert (=> start!30390 true))

(declare-fun b!304205 () Bool)

(declare-fun res!161600 () Bool)

(assert (=> b!304205 (=> (not res!161600) (not e!191242))))

(assert (=> b!304205 (= res!161600 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150431))))

(declare-fun b!304206 () Bool)

(declare-fun res!161599 () Bool)

(assert (=> b!304206 (=> (not res!161599) (not e!191244))))

(declare-fun arrayContainsKey!0 (array!15458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304206 (= res!161599 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304207 () Bool)

(declare-fun res!161602 () Bool)

(assert (=> b!304207 (=> (not res!161602) (not e!191244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304207 (= res!161602 (validKeyInArray!0 k0!2441))))

(declare-fun b!304208 () Bool)

(declare-fun res!161598 () Bool)

(assert (=> b!304208 (=> (not res!161598) (not e!191242))))

(assert (=> b!304208 (= res!161598 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7315 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7315 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7315 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!304209 () Bool)

(declare-fun res!161603 () Bool)

(assert (=> b!304209 (=> (not res!161603) (not e!191244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15458 (_ BitVec 32)) Bool)

(assert (=> b!304209 (= res!161603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30390 res!161604) b!304203))

(assert (= (and b!304203 res!161596) b!304207))

(assert (= (and b!304207 res!161602) b!304206))

(assert (= (and b!304206 res!161599) b!304204))

(assert (= (and b!304204 res!161601) b!304209))

(assert (= (and b!304209 res!161603) b!304201))

(assert (= (and b!304201 res!161595) b!304202))

(assert (= (and b!304202 res!161597) b!304205))

(assert (= (and b!304205 res!161600) b!304208))

(assert (= (and b!304208 res!161598) b!304200))

(declare-fun m!315499 () Bool)

(assert (=> b!304202 m!315499))

(declare-fun m!315501 () Bool)

(assert (=> start!30390 m!315501))

(declare-fun m!315503 () Bool)

(assert (=> start!30390 m!315503))

(declare-fun m!315505 () Bool)

(assert (=> b!304209 m!315505))

(declare-fun m!315507 () Bool)

(assert (=> b!304204 m!315507))

(declare-fun m!315509 () Bool)

(assert (=> b!304205 m!315509))

(declare-fun m!315511 () Bool)

(assert (=> b!304208 m!315511))

(declare-fun m!315513 () Bool)

(assert (=> b!304201 m!315513))

(assert (=> b!304201 m!315513))

(declare-fun m!315515 () Bool)

(assert (=> b!304201 m!315515))

(declare-fun m!315517 () Bool)

(assert (=> b!304206 m!315517))

(declare-fun m!315519 () Bool)

(assert (=> b!304207 m!315519))

(declare-fun m!315521 () Bool)

(assert (=> b!304200 m!315521))

(check-sat (not b!304206) (not b!304204) (not start!30390) (not b!304205) (not b!304207) (not b!304201) (not b!304200) (not b!304209))
(check-sat)
