; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31854 () Bool)

(assert start!31854)

(declare-fun b!318452 () Bool)

(declare-fun res!173039 () Bool)

(declare-fun e!197873 () Bool)

(assert (=> b!318452 (=> (not res!173039) (not e!197873))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318452 (= res!173039 (validKeyInArray!0 k!2441))))

(declare-fun b!318453 () Bool)

(declare-fun res!173040 () Bool)

(assert (=> b!318453 (=> (not res!173040) (not e!197873))))

(declare-datatypes ((array!16225 0))(
  ( (array!16226 (arr!7678 (Array (_ BitVec 32) (_ BitVec 64))) (size!8030 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16225)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16225 (_ BitVec 32)) Bool)

(assert (=> b!318453 (= res!173040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318454 () Bool)

(declare-fun e!197875 () Bool)

(assert (=> b!318454 (= e!197873 e!197875)))

(declare-fun res!173036 () Bool)

(assert (=> b!318454 (=> (not res!173036) (not e!197875))))

(declare-datatypes ((SeekEntryResult!2818 0))(
  ( (MissingZero!2818 (index!13448 (_ BitVec 32))) (Found!2818 (index!13449 (_ BitVec 32))) (Intermediate!2818 (undefined!3630 Bool) (index!13450 (_ BitVec 32)) (x!31699 (_ BitVec 32))) (Undefined!2818) (MissingVacant!2818 (index!13451 (_ BitVec 32))) )
))
(declare-fun lt!155355 () SeekEntryResult!2818)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16225 (_ BitVec 32)) SeekEntryResult!2818)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318454 (= res!173036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155355))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318454 (= lt!155355 (Intermediate!2818 false resIndex!52 resX!52))))

(declare-fun b!318455 () Bool)

(declare-fun e!197872 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!318455 (= e!197872 (not (bvsle (bvadd #b00000000000000000000000000000001 x!1427) resX!52)))))

(declare-fun e!197874 () Bool)

(assert (=> b!318455 e!197874))

(declare-fun res!173038 () Bool)

(assert (=> b!318455 (=> (not res!173038) (not e!197874))))

(declare-fun lt!155356 () SeekEntryResult!2818)

(declare-fun lt!155357 () (_ BitVec 32))

(assert (=> b!318455 (= res!173038 (= lt!155356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155357 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318455 (= lt!155357 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun lt!155358 () array!16225)

(declare-fun b!318456 () Bool)

(assert (=> b!318456 (= e!197874 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155358 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155357 k!2441 lt!155358 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318456 (= lt!155358 (array!16226 (store (arr!7678 a!3293) i!1240 k!2441) (size!8030 a!3293)))))

(declare-fun res!173031 () Bool)

(assert (=> start!31854 (=> (not res!173031) (not e!197873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31854 (= res!173031 (validMask!0 mask!3709))))

(assert (=> start!31854 e!197873))

(declare-fun array_inv!5641 (array!16225) Bool)

(assert (=> start!31854 (array_inv!5641 a!3293)))

(assert (=> start!31854 true))

(declare-fun b!318457 () Bool)

(declare-fun res!173034 () Bool)

(assert (=> b!318457 (=> (not res!173034) (not e!197873))))

(declare-fun arrayContainsKey!0 (array!16225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318457 (= res!173034 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318458 () Bool)

(assert (=> b!318458 (= e!197875 e!197872)))

(declare-fun res!173037 () Bool)

(assert (=> b!318458 (=> (not res!173037) (not e!197872))))

(assert (=> b!318458 (= res!173037 (and (= lt!155356 lt!155355) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7678 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318458 (= lt!155356 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318459 () Bool)

(declare-fun res!173033 () Bool)

(assert (=> b!318459 (=> (not res!173033) (not e!197873))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16225 (_ BitVec 32)) SeekEntryResult!2818)

(assert (=> b!318459 (= res!173033 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2818 i!1240)))))

(declare-fun b!318460 () Bool)

(declare-fun res!173032 () Bool)

(assert (=> b!318460 (=> (not res!173032) (not e!197875))))

(assert (=> b!318460 (= res!173032 (and (= (select (arr!7678 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8030 a!3293))))))

(declare-fun b!318461 () Bool)

(declare-fun res!173035 () Bool)

(assert (=> b!318461 (=> (not res!173035) (not e!197873))))

(assert (=> b!318461 (= res!173035 (and (= (size!8030 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8030 a!3293))))))

(assert (= (and start!31854 res!173031) b!318461))

(assert (= (and b!318461 res!173035) b!318452))

(assert (= (and b!318452 res!173039) b!318457))

(assert (= (and b!318457 res!173034) b!318459))

(assert (= (and b!318459 res!173033) b!318453))

(assert (= (and b!318453 res!173040) b!318454))

(assert (= (and b!318454 res!173036) b!318460))

(assert (= (and b!318460 res!173032) b!318458))

(assert (= (and b!318458 res!173037) b!318455))

(assert (= (and b!318455 res!173038) b!318456))

(declare-fun m!327153 () Bool)

(assert (=> start!31854 m!327153))

(declare-fun m!327155 () Bool)

(assert (=> start!31854 m!327155))

(declare-fun m!327157 () Bool)

(assert (=> b!318455 m!327157))

(declare-fun m!327159 () Bool)

(assert (=> b!318455 m!327159))

(declare-fun m!327161 () Bool)

(assert (=> b!318456 m!327161))

(declare-fun m!327163 () Bool)

(assert (=> b!318456 m!327163))

(declare-fun m!327165 () Bool)

(assert (=> b!318456 m!327165))

(declare-fun m!327167 () Bool)

(assert (=> b!318453 m!327167))

(declare-fun m!327169 () Bool)

(assert (=> b!318458 m!327169))

(declare-fun m!327171 () Bool)

(assert (=> b!318458 m!327171))

(declare-fun m!327173 () Bool)

(assert (=> b!318452 m!327173))

(declare-fun m!327175 () Bool)

(assert (=> b!318457 m!327175))

(declare-fun m!327177 () Bool)

(assert (=> b!318454 m!327177))

(assert (=> b!318454 m!327177))

(declare-fun m!327179 () Bool)

(assert (=> b!318454 m!327179))

(declare-fun m!327181 () Bool)

(assert (=> b!318460 m!327181))

(declare-fun m!327183 () Bool)

(assert (=> b!318459 m!327183))

(push 1)

(assert (not b!318452))

(assert (not b!318455))

(assert (not b!318457))

(assert (not b!318459))

(assert (not b!318454))

(assert (not b!318453))

(assert (not start!31854))

(assert (not b!318458))

(assert (not b!318456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

