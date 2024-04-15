; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31800 () Bool)

(assert start!31800)

(declare-fun b!317577 () Bool)

(declare-fun res!172311 () Bool)

(declare-fun e!197397 () Bool)

(assert (=> b!317577 (=> (not res!172311) (not e!197397))))

(declare-datatypes ((array!16175 0))(
  ( (array!16176 (arr!7653 (Array (_ BitVec 32) (_ BitVec 64))) (size!8006 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16175)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317577 (= res!172311 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317578 () Bool)

(declare-fun e!197396 () Bool)

(assert (=> b!317578 (= e!197396 (not true))))

(declare-fun e!197395 () Bool)

(assert (=> b!317578 e!197395))

(declare-fun res!172303 () Bool)

(assert (=> b!317578 (=> (not res!172303) (not e!197395))))

(declare-fun lt!154883 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2792 0))(
  ( (MissingZero!2792 (index!13344 (_ BitVec 32))) (Found!2792 (index!13345 (_ BitVec 32))) (Intermediate!2792 (undefined!3604 Bool) (index!13346 (_ BitVec 32)) (x!31620 (_ BitVec 32))) (Undefined!2792) (MissingVacant!2792 (index!13347 (_ BitVec 32))) )
))
(declare-fun lt!154880 () SeekEntryResult!2792)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16175 (_ BitVec 32)) SeekEntryResult!2792)

(assert (=> b!317578 (= res!172303 (= lt!154880 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154883 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317578 (= lt!154883 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172310 () Bool)

(assert (=> start!31800 (=> (not res!172310) (not e!197397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31800 (= res!172310 (validMask!0 mask!3709))))

(assert (=> start!31800 e!197397))

(declare-fun array_inv!5625 (array!16175) Bool)

(assert (=> start!31800 (array_inv!5625 a!3293)))

(assert (=> start!31800 true))

(declare-fun b!317579 () Bool)

(declare-fun e!197398 () Bool)

(assert (=> b!317579 (= e!197397 e!197398)))

(declare-fun res!172304 () Bool)

(assert (=> b!317579 (=> (not res!172304) (not e!197398))))

(declare-fun lt!154882 () SeekEntryResult!2792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317579 (= res!172304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154882))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317579 (= lt!154882 (Intermediate!2792 false resIndex!52 resX!52))))

(declare-fun b!317580 () Bool)

(assert (=> b!317580 (= e!197398 e!197396)))

(declare-fun res!172305 () Bool)

(assert (=> b!317580 (=> (not res!172305) (not e!197396))))

(assert (=> b!317580 (= res!172305 (and (= lt!154880 lt!154882) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7653 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317580 (= lt!154880 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317581 () Bool)

(declare-fun res!172307 () Bool)

(assert (=> b!317581 (=> (not res!172307) (not e!197398))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317581 (= res!172307 (and (= (select (arr!7653 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8006 a!3293))))))

(declare-fun b!317582 () Bool)

(declare-fun res!172306 () Bool)

(assert (=> b!317582 (=> (not res!172306) (not e!197397))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317582 (= res!172306 (validKeyInArray!0 k0!2441))))

(declare-fun b!317583 () Bool)

(declare-fun res!172309 () Bool)

(assert (=> b!317583 (=> (not res!172309) (not e!197397))))

(assert (=> b!317583 (= res!172309 (and (= (size!8006 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8006 a!3293))))))

(declare-fun b!317584 () Bool)

(declare-fun res!172308 () Bool)

(assert (=> b!317584 (=> (not res!172308) (not e!197397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16175 (_ BitVec 32)) Bool)

(assert (=> b!317584 (= res!172308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!154881 () array!16175)

(declare-fun b!317585 () Bool)

(assert (=> b!317585 (= e!197395 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154881 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154883 k0!2441 lt!154881 mask!3709)))))

(assert (=> b!317585 (= lt!154881 (array!16176 (store (arr!7653 a!3293) i!1240 k0!2441) (size!8006 a!3293)))))

(declare-fun b!317586 () Bool)

(declare-fun res!172302 () Bool)

(assert (=> b!317586 (=> (not res!172302) (not e!197397))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16175 (_ BitVec 32)) SeekEntryResult!2792)

(assert (=> b!317586 (= res!172302 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2792 i!1240)))))

(assert (= (and start!31800 res!172310) b!317583))

(assert (= (and b!317583 res!172309) b!317582))

(assert (= (and b!317582 res!172306) b!317577))

(assert (= (and b!317577 res!172311) b!317586))

(assert (= (and b!317586 res!172302) b!317584))

(assert (= (and b!317584 res!172308) b!317579))

(assert (= (and b!317579 res!172304) b!317581))

(assert (= (and b!317581 res!172307) b!317580))

(assert (= (and b!317580 res!172305) b!317578))

(assert (= (and b!317578 res!172303) b!317585))

(declare-fun m!325783 () Bool)

(assert (=> b!317584 m!325783))

(declare-fun m!325785 () Bool)

(assert (=> b!317580 m!325785))

(declare-fun m!325787 () Bool)

(assert (=> b!317580 m!325787))

(declare-fun m!325789 () Bool)

(assert (=> b!317579 m!325789))

(assert (=> b!317579 m!325789))

(declare-fun m!325791 () Bool)

(assert (=> b!317579 m!325791))

(declare-fun m!325793 () Bool)

(assert (=> b!317585 m!325793))

(declare-fun m!325795 () Bool)

(assert (=> b!317585 m!325795))

(declare-fun m!325797 () Bool)

(assert (=> b!317585 m!325797))

(declare-fun m!325799 () Bool)

(assert (=> start!31800 m!325799))

(declare-fun m!325801 () Bool)

(assert (=> start!31800 m!325801))

(declare-fun m!325803 () Bool)

(assert (=> b!317581 m!325803))

(declare-fun m!325805 () Bool)

(assert (=> b!317582 m!325805))

(declare-fun m!325807 () Bool)

(assert (=> b!317577 m!325807))

(declare-fun m!325809 () Bool)

(assert (=> b!317586 m!325809))

(declare-fun m!325811 () Bool)

(assert (=> b!317578 m!325811))

(declare-fun m!325813 () Bool)

(assert (=> b!317578 m!325813))

(check-sat (not b!317579) (not b!317578) (not b!317580) (not b!317586) (not b!317582) (not b!317585) (not b!317584) (not b!317577) (not start!31800))
(check-sat)
