; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31824 () Bool)

(assert start!31824)

(declare-fun b!317937 () Bool)

(declare-fun e!197576 () Bool)

(declare-fun e!197577 () Bool)

(assert (=> b!317937 (= e!197576 e!197577)))

(declare-fun res!172663 () Bool)

(assert (=> b!317937 (=> (not res!172663) (not e!197577))))

(declare-datatypes ((array!16199 0))(
  ( (array!16200 (arr!7665 (Array (_ BitVec 32) (_ BitVec 64))) (size!8018 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16199)

(declare-datatypes ((SeekEntryResult!2804 0))(
  ( (MissingZero!2804 (index!13392 (_ BitVec 32))) (Found!2804 (index!13393 (_ BitVec 32))) (Intermediate!2804 (undefined!3616 Bool) (index!13394 (_ BitVec 32)) (x!31664 (_ BitVec 32))) (Undefined!2804) (MissingVacant!2804 (index!13395 (_ BitVec 32))) )
))
(declare-fun lt!155025 () SeekEntryResult!2804)

(declare-fun lt!155027 () SeekEntryResult!2804)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317937 (= res!172663 (and (= lt!155025 lt!155027) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7665 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16199 (_ BitVec 32)) SeekEntryResult!2804)

(assert (=> b!317937 (= lt!155025 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317938 () Bool)

(declare-fun res!172669 () Bool)

(declare-fun e!197579 () Bool)

(assert (=> b!317938 (=> (not res!172669) (not e!197579))))

(declare-fun arrayContainsKey!0 (array!16199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317938 (= res!172669 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!172662 () Bool)

(assert (=> start!31824 (=> (not res!172662) (not e!197579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31824 (= res!172662 (validMask!0 mask!3709))))

(assert (=> start!31824 e!197579))

(declare-fun array_inv!5637 (array!16199) Bool)

(assert (=> start!31824 (array_inv!5637 a!3293)))

(assert (=> start!31824 true))

(declare-fun b!317939 () Bool)

(declare-fun res!172670 () Bool)

(assert (=> b!317939 (=> (not res!172670) (not e!197579))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16199 (_ BitVec 32)) SeekEntryResult!2804)

(assert (=> b!317939 (= res!172670 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2804 i!1240)))))

(declare-fun b!317940 () Bool)

(declare-fun res!172668 () Bool)

(assert (=> b!317940 (=> (not res!172668) (not e!197579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317940 (= res!172668 (validKeyInArray!0 k0!2441))))

(declare-fun b!317941 () Bool)

(declare-fun res!172664 () Bool)

(assert (=> b!317941 (=> (not res!172664) (not e!197579))))

(assert (=> b!317941 (= res!172664 (and (= (size!8018 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8018 a!3293))))))

(declare-fun b!317942 () Bool)

(assert (=> b!317942 (= e!197579 e!197576)))

(declare-fun res!172666 () Bool)

(assert (=> b!317942 (=> (not res!172666) (not e!197576))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317942 (= res!172666 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155027))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317942 (= lt!155027 (Intermediate!2804 false resIndex!52 resX!52))))

(declare-fun b!317943 () Bool)

(declare-fun res!172667 () Bool)

(assert (=> b!317943 (=> (not res!172667) (not e!197576))))

(assert (=> b!317943 (= res!172667 (and (= (select (arr!7665 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8018 a!3293))))))

(declare-fun e!197578 () Bool)

(declare-fun lt!155026 () array!16199)

(declare-fun b!317944 () Bool)

(declare-fun lt!155024 () (_ BitVec 32))

(assert (=> b!317944 (= e!197578 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155026 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155024 k0!2441 lt!155026 mask!3709)))))

(assert (=> b!317944 (= lt!155026 (array!16200 (store (arr!7665 a!3293) i!1240 k0!2441) (size!8018 a!3293)))))

(declare-fun b!317945 () Bool)

(assert (=> b!317945 (= e!197577 (not true))))

(assert (=> b!317945 e!197578))

(declare-fun res!172671 () Bool)

(assert (=> b!317945 (=> (not res!172671) (not e!197578))))

(assert (=> b!317945 (= res!172671 (= lt!155025 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155024 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317945 (= lt!155024 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317946 () Bool)

(declare-fun res!172665 () Bool)

(assert (=> b!317946 (=> (not res!172665) (not e!197579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16199 (_ BitVec 32)) Bool)

(assert (=> b!317946 (= res!172665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31824 res!172662) b!317941))

(assert (= (and b!317941 res!172664) b!317940))

(assert (= (and b!317940 res!172668) b!317938))

(assert (= (and b!317938 res!172669) b!317939))

(assert (= (and b!317939 res!172670) b!317946))

(assert (= (and b!317946 res!172665) b!317942))

(assert (= (and b!317942 res!172666) b!317943))

(assert (= (and b!317943 res!172667) b!317937))

(assert (= (and b!317937 res!172663) b!317945))

(assert (= (and b!317945 res!172671) b!317944))

(declare-fun m!326167 () Bool)

(assert (=> b!317939 m!326167))

(declare-fun m!326169 () Bool)

(assert (=> b!317938 m!326169))

(declare-fun m!326171 () Bool)

(assert (=> b!317944 m!326171))

(declare-fun m!326173 () Bool)

(assert (=> b!317944 m!326173))

(declare-fun m!326175 () Bool)

(assert (=> b!317944 m!326175))

(declare-fun m!326177 () Bool)

(assert (=> b!317942 m!326177))

(assert (=> b!317942 m!326177))

(declare-fun m!326179 () Bool)

(assert (=> b!317942 m!326179))

(declare-fun m!326181 () Bool)

(assert (=> b!317943 m!326181))

(declare-fun m!326183 () Bool)

(assert (=> b!317937 m!326183))

(declare-fun m!326185 () Bool)

(assert (=> b!317937 m!326185))

(declare-fun m!326187 () Bool)

(assert (=> start!31824 m!326187))

(declare-fun m!326189 () Bool)

(assert (=> start!31824 m!326189))

(declare-fun m!326191 () Bool)

(assert (=> b!317945 m!326191))

(declare-fun m!326193 () Bool)

(assert (=> b!317945 m!326193))

(declare-fun m!326195 () Bool)

(assert (=> b!317940 m!326195))

(declare-fun m!326197 () Bool)

(assert (=> b!317946 m!326197))

(check-sat (not start!31824) (not b!317945) (not b!317942) (not b!317939) (not b!317940) (not b!317946) (not b!317937) (not b!317938) (not b!317944))
(check-sat)
