; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30964 () Bool)

(assert start!30964)

(declare-fun res!167451 () Bool)

(declare-fun e!194098 () Bool)

(assert (=> start!30964 (=> (not res!167451) (not e!194098))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30964 (= res!167451 (validMask!0 mask!3709))))

(assert (=> start!30964 e!194098))

(declare-datatypes ((array!15866 0))(
  ( (array!15867 (arr!7515 (Array (_ BitVec 32) (_ BitVec 64))) (size!7867 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15866)

(declare-fun array_inv!5478 (array!15866) Bool)

(assert (=> start!30964 (array_inv!5478 a!3293)))

(assert (=> start!30964 true))

(declare-fun b!310997 () Bool)

(declare-fun res!167460 () Bool)

(assert (=> b!310997 (=> (not res!167460) (not e!194098))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2655 0))(
  ( (MissingZero!2655 (index!12796 (_ BitVec 32))) (Found!2655 (index!12797 (_ BitVec 32))) (Intermediate!2655 (undefined!3467 Bool) (index!12798 (_ BitVec 32)) (x!31020 (_ BitVec 32))) (Undefined!2655) (MissingVacant!2655 (index!12799 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15866 (_ BitVec 32)) SeekEntryResult!2655)

(assert (=> b!310997 (= res!167460 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2655 i!1240)))))

(declare-fun e!194099 () Bool)

(declare-fun lt!152179 () array!15866)

(declare-fun b!310998 () Bool)

(declare-fun lt!152180 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15866 (_ BitVec 32)) SeekEntryResult!2655)

(assert (=> b!310998 (= e!194099 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152179 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152180 k0!2441 lt!152179 mask!3709)))))

(assert (=> b!310998 (= lt!152179 (array!15867 (store (arr!7515 a!3293) i!1240 k0!2441) (size!7867 a!3293)))))

(declare-fun b!310999 () Bool)

(declare-fun res!167455 () Bool)

(assert (=> b!310999 (=> (not res!167455) (not e!194098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15866 (_ BitVec 32)) Bool)

(assert (=> b!310999 (= res!167455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311000 () Bool)

(declare-fun e!194100 () Bool)

(declare-fun e!194101 () Bool)

(assert (=> b!311000 (= e!194100 e!194101)))

(declare-fun res!167457 () Bool)

(assert (=> b!311000 (=> (not res!167457) (not e!194101))))

(declare-fun lt!152178 () SeekEntryResult!2655)

(declare-fun lt!152181 () SeekEntryResult!2655)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311000 (= res!167457 (and (= lt!152178 lt!152181) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7515 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311000 (= lt!152178 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311001 () Bool)

(declare-fun res!167458 () Bool)

(assert (=> b!311001 (=> (not res!167458) (not e!194098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311001 (= res!167458 (validKeyInArray!0 k0!2441))))

(declare-fun b!311002 () Bool)

(assert (=> b!311002 (= e!194098 e!194100)))

(declare-fun res!167454 () Bool)

(assert (=> b!311002 (=> (not res!167454) (not e!194100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311002 (= res!167454 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152181))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311002 (= lt!152181 (Intermediate!2655 false resIndex!52 resX!52))))

(declare-fun b!311003 () Bool)

(assert (=> b!311003 (= e!194101 (not true))))

(assert (=> b!311003 e!194099))

(declare-fun res!167459 () Bool)

(assert (=> b!311003 (=> (not res!167459) (not e!194099))))

(assert (=> b!311003 (= res!167459 (= lt!152178 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152180 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311003 (= lt!152180 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311004 () Bool)

(declare-fun res!167452 () Bool)

(assert (=> b!311004 (=> (not res!167452) (not e!194098))))

(declare-fun arrayContainsKey!0 (array!15866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311004 (= res!167452 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311005 () Bool)

(declare-fun res!167453 () Bool)

(assert (=> b!311005 (=> (not res!167453) (not e!194098))))

(assert (=> b!311005 (= res!167453 (and (= (size!7867 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7867 a!3293))))))

(declare-fun b!311006 () Bool)

(declare-fun res!167456 () Bool)

(assert (=> b!311006 (=> (not res!167456) (not e!194100))))

(assert (=> b!311006 (= res!167456 (and (= (select (arr!7515 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7867 a!3293))))))

(assert (= (and start!30964 res!167451) b!311005))

(assert (= (and b!311005 res!167453) b!311001))

(assert (= (and b!311001 res!167458) b!311004))

(assert (= (and b!311004 res!167452) b!310997))

(assert (= (and b!310997 res!167460) b!310999))

(assert (= (and b!310999 res!167455) b!311002))

(assert (= (and b!311002 res!167454) b!311006))

(assert (= (and b!311006 res!167456) b!311000))

(assert (= (and b!311000 res!167457) b!311003))

(assert (= (and b!311003 res!167459) b!310998))

(declare-fun m!320941 () Bool)

(assert (=> b!311000 m!320941))

(declare-fun m!320943 () Bool)

(assert (=> b!311000 m!320943))

(declare-fun m!320945 () Bool)

(assert (=> b!311006 m!320945))

(declare-fun m!320947 () Bool)

(assert (=> start!30964 m!320947))

(declare-fun m!320949 () Bool)

(assert (=> start!30964 m!320949))

(declare-fun m!320951 () Bool)

(assert (=> b!311002 m!320951))

(assert (=> b!311002 m!320951))

(declare-fun m!320953 () Bool)

(assert (=> b!311002 m!320953))

(declare-fun m!320955 () Bool)

(assert (=> b!311001 m!320955))

(declare-fun m!320957 () Bool)

(assert (=> b!310997 m!320957))

(declare-fun m!320959 () Bool)

(assert (=> b!311004 m!320959))

(declare-fun m!320961 () Bool)

(assert (=> b!310998 m!320961))

(declare-fun m!320963 () Bool)

(assert (=> b!310998 m!320963))

(declare-fun m!320965 () Bool)

(assert (=> b!310998 m!320965))

(declare-fun m!320967 () Bool)

(assert (=> b!311003 m!320967))

(declare-fun m!320969 () Bool)

(assert (=> b!311003 m!320969))

(declare-fun m!320971 () Bool)

(assert (=> b!310999 m!320971))

(check-sat (not b!311004) (not b!311002) (not b!311001) (not start!30964) (not b!311003) (not b!310999) (not b!310998) (not b!311000) (not b!310997))
(check-sat)
