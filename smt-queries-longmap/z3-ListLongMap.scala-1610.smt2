; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30334 () Bool)

(assert start!30334)

(declare-fun b!303797 () Bool)

(declare-fun res!161292 () Bool)

(declare-fun e!191073 () Bool)

(assert (=> b!303797 (=> (not res!161292) (not e!191073))))

(declare-datatypes ((array!15440 0))(
  ( (array!15441 (arr!7308 (Array (_ BitVec 32) (_ BitVec 64))) (size!7660 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15440)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2448 0))(
  ( (MissingZero!2448 (index!11968 (_ BitVec 32))) (Found!2448 (index!11969 (_ BitVec 32))) (Intermediate!2448 (undefined!3260 Bool) (index!11970 (_ BitVec 32)) (x!30225 (_ BitVec 32))) (Undefined!2448) (MissingVacant!2448 (index!11971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15440 (_ BitVec 32)) SeekEntryResult!2448)

(assert (=> b!303797 (= res!161292 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2448 i!1240)))))

(declare-fun b!303798 () Bool)

(declare-fun res!161284 () Bool)

(declare-fun e!191072 () Bool)

(assert (=> b!303798 (=> (not res!161284) (not e!191072))))

(declare-fun lt!150261 () SeekEntryResult!2448)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15440 (_ BitVec 32)) SeekEntryResult!2448)

(assert (=> b!303798 (= res!161284 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150261))))

(declare-fun b!303799 () Bool)

(declare-fun res!161283 () Bool)

(assert (=> b!303799 (=> (not res!161283) (not e!191073))))

(assert (=> b!303799 (= res!161283 (and (= (size!7660 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7660 a!3293))))))

(declare-fun b!303800 () Bool)

(declare-fun res!161288 () Bool)

(assert (=> b!303800 (=> (not res!161288) (not e!191072))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303800 (= res!161288 (and (= (select (arr!7308 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7660 a!3293))))))

(declare-fun b!303801 () Bool)

(declare-fun res!161291 () Bool)

(assert (=> b!303801 (=> (not res!161291) (not e!191073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303801 (= res!161291 (validKeyInArray!0 k0!2441))))

(declare-fun res!161286 () Bool)

(assert (=> start!30334 (=> (not res!161286) (not e!191073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30334 (= res!161286 (validMask!0 mask!3709))))

(assert (=> start!30334 e!191073))

(declare-fun array_inv!5271 (array!15440) Bool)

(assert (=> start!30334 (array_inv!5271 a!3293)))

(assert (=> start!30334 true))

(declare-fun b!303802 () Bool)

(assert (=> b!303802 (= e!191072 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150260 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303802 (= lt!150260 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303803 () Bool)

(declare-fun res!161287 () Bool)

(assert (=> b!303803 (=> (not res!161287) (not e!191073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15440 (_ BitVec 32)) Bool)

(assert (=> b!303803 (= res!161287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303804 () Bool)

(assert (=> b!303804 (= e!191073 e!191072)))

(declare-fun res!161289 () Bool)

(assert (=> b!303804 (=> (not res!161289) (not e!191072))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303804 (= res!161289 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150261))))

(assert (=> b!303804 (= lt!150261 (Intermediate!2448 false resIndex!52 resX!52))))

(declare-fun b!303805 () Bool)

(declare-fun res!161285 () Bool)

(assert (=> b!303805 (=> (not res!161285) (not e!191073))))

(declare-fun arrayContainsKey!0 (array!15440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303805 (= res!161285 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303806 () Bool)

(declare-fun res!161290 () Bool)

(assert (=> b!303806 (=> (not res!161290) (not e!191072))))

(assert (=> b!303806 (= res!161290 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7308 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7308 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7308 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!30334 res!161286) b!303799))

(assert (= (and b!303799 res!161283) b!303801))

(assert (= (and b!303801 res!161291) b!303805))

(assert (= (and b!303805 res!161285) b!303797))

(assert (= (and b!303797 res!161292) b!303803))

(assert (= (and b!303803 res!161287) b!303804))

(assert (= (and b!303804 res!161289) b!303800))

(assert (= (and b!303800 res!161288) b!303798))

(assert (= (and b!303798 res!161284) b!303806))

(assert (= (and b!303806 res!161290) b!303802))

(declare-fun m!315077 () Bool)

(assert (=> b!303804 m!315077))

(assert (=> b!303804 m!315077))

(declare-fun m!315079 () Bool)

(assert (=> b!303804 m!315079))

(declare-fun m!315081 () Bool)

(assert (=> start!30334 m!315081))

(declare-fun m!315083 () Bool)

(assert (=> start!30334 m!315083))

(declare-fun m!315085 () Bool)

(assert (=> b!303802 m!315085))

(declare-fun m!315087 () Bool)

(assert (=> b!303800 m!315087))

(declare-fun m!315089 () Bool)

(assert (=> b!303803 m!315089))

(declare-fun m!315091 () Bool)

(assert (=> b!303805 m!315091))

(declare-fun m!315093 () Bool)

(assert (=> b!303806 m!315093))

(declare-fun m!315095 () Bool)

(assert (=> b!303798 m!315095))

(declare-fun m!315097 () Bool)

(assert (=> b!303801 m!315097))

(declare-fun m!315099 () Bool)

(assert (=> b!303797 m!315099))

(check-sat (not b!303804) (not b!303802) (not b!303803) (not start!30334) (not b!303797) (not b!303801) (not b!303805) (not b!303798))
(check-sat)
