; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31846 () Bool)

(assert start!31846)

(declare-fun b!318332 () Bool)

(declare-fun res!172911 () Bool)

(declare-fun e!197811 () Bool)

(assert (=> b!318332 (=> (not res!172911) (not e!197811))))

(declare-datatypes ((array!16217 0))(
  ( (array!16218 (arr!7674 (Array (_ BitVec 32) (_ BitVec 64))) (size!8026 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16217)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318332 (= res!172911 (and (= (select (arr!7674 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8026 a!3293))))))

(declare-fun b!318333 () Bool)

(declare-fun e!197813 () Bool)

(assert (=> b!318333 (= e!197813 (not true))))

(declare-fun e!197814 () Bool)

(assert (=> b!318333 e!197814))

(declare-fun res!172920 () Bool)

(assert (=> b!318333 (=> (not res!172920) (not e!197814))))

(declare-fun lt!155309 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2814 0))(
  ( (MissingZero!2814 (index!13432 (_ BitVec 32))) (Found!2814 (index!13433 (_ BitVec 32))) (Intermediate!2814 (undefined!3626 Bool) (index!13434 (_ BitVec 32)) (x!31687 (_ BitVec 32))) (Undefined!2814) (MissingVacant!2814 (index!13435 (_ BitVec 32))) )
))
(declare-fun lt!155310 () SeekEntryResult!2814)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16217 (_ BitVec 32)) SeekEntryResult!2814)

(assert (=> b!318333 (= res!172920 (= lt!155310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155309 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318333 (= lt!155309 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318335 () Bool)

(declare-fun res!172916 () Bool)

(declare-fun e!197812 () Bool)

(assert (=> b!318335 (=> (not res!172916) (not e!197812))))

(declare-fun arrayContainsKey!0 (array!16217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318335 (= res!172916 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318336 () Bool)

(declare-fun res!172914 () Bool)

(assert (=> b!318336 (=> (not res!172914) (not e!197812))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16217 (_ BitVec 32)) SeekEntryResult!2814)

(assert (=> b!318336 (= res!172914 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2814 i!1240)))))

(declare-fun b!318337 () Bool)

(declare-fun res!172918 () Bool)

(assert (=> b!318337 (=> (not res!172918) (not e!197812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318337 (= res!172918 (validKeyInArray!0 k0!2441))))

(declare-fun b!318338 () Bool)

(assert (=> b!318338 (= e!197812 e!197811)))

(declare-fun res!172919 () Bool)

(assert (=> b!318338 (=> (not res!172919) (not e!197811))))

(declare-fun lt!155308 () SeekEntryResult!2814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318338 (= res!172919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155308))))

(assert (=> b!318338 (= lt!155308 (Intermediate!2814 false resIndex!52 resX!52))))

(declare-fun b!318339 () Bool)

(declare-fun res!172915 () Bool)

(assert (=> b!318339 (=> (not res!172915) (not e!197812))))

(assert (=> b!318339 (= res!172915 (and (= (size!8026 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8026 a!3293))))))

(declare-fun b!318334 () Bool)

(assert (=> b!318334 (= e!197811 e!197813)))

(declare-fun res!172912 () Bool)

(assert (=> b!318334 (=> (not res!172912) (not e!197813))))

(assert (=> b!318334 (= res!172912 (and (= lt!155310 lt!155308) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7674 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318334 (= lt!155310 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!172913 () Bool)

(assert (=> start!31846 (=> (not res!172913) (not e!197812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31846 (= res!172913 (validMask!0 mask!3709))))

(assert (=> start!31846 e!197812))

(declare-fun array_inv!5637 (array!16217) Bool)

(assert (=> start!31846 (array_inv!5637 a!3293)))

(assert (=> start!31846 true))

(declare-fun lt!155307 () array!16217)

(declare-fun b!318340 () Bool)

(assert (=> b!318340 (= e!197814 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155307 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155309 k0!2441 lt!155307 mask!3709)))))

(assert (=> b!318340 (= lt!155307 (array!16218 (store (arr!7674 a!3293) i!1240 k0!2441) (size!8026 a!3293)))))

(declare-fun b!318341 () Bool)

(declare-fun res!172917 () Bool)

(assert (=> b!318341 (=> (not res!172917) (not e!197812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16217 (_ BitVec 32)) Bool)

(assert (=> b!318341 (= res!172917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31846 res!172913) b!318339))

(assert (= (and b!318339 res!172915) b!318337))

(assert (= (and b!318337 res!172918) b!318335))

(assert (= (and b!318335 res!172916) b!318336))

(assert (= (and b!318336 res!172914) b!318341))

(assert (= (and b!318341 res!172917) b!318338))

(assert (= (and b!318338 res!172919) b!318332))

(assert (= (and b!318332 res!172911) b!318334))

(assert (= (and b!318334 res!172912) b!318333))

(assert (= (and b!318333 res!172920) b!318340))

(declare-fun m!327025 () Bool)

(assert (=> b!318333 m!327025))

(declare-fun m!327027 () Bool)

(assert (=> b!318333 m!327027))

(declare-fun m!327029 () Bool)

(assert (=> b!318335 m!327029))

(declare-fun m!327031 () Bool)

(assert (=> b!318338 m!327031))

(assert (=> b!318338 m!327031))

(declare-fun m!327033 () Bool)

(assert (=> b!318338 m!327033))

(declare-fun m!327035 () Bool)

(assert (=> start!31846 m!327035))

(declare-fun m!327037 () Bool)

(assert (=> start!31846 m!327037))

(declare-fun m!327039 () Bool)

(assert (=> b!318337 m!327039))

(declare-fun m!327041 () Bool)

(assert (=> b!318341 m!327041))

(declare-fun m!327043 () Bool)

(assert (=> b!318336 m!327043))

(declare-fun m!327045 () Bool)

(assert (=> b!318332 m!327045))

(declare-fun m!327047 () Bool)

(assert (=> b!318340 m!327047))

(declare-fun m!327049 () Bool)

(assert (=> b!318340 m!327049))

(declare-fun m!327051 () Bool)

(assert (=> b!318340 m!327051))

(declare-fun m!327053 () Bool)

(assert (=> b!318334 m!327053))

(declare-fun m!327055 () Bool)

(assert (=> b!318334 m!327055))

(check-sat (not b!318335) (not b!318337) (not b!318334) (not b!318340) (not b!318336) (not start!31846) (not b!318333) (not b!318338) (not b!318341))
(check-sat)
