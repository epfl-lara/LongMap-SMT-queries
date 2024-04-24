; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31782 () Bool)

(assert start!31782)

(declare-fun b!317529 () Bool)

(declare-fun res!172158 () Bool)

(declare-fun e!197404 () Bool)

(assert (=> b!317529 (=> (not res!172158) (not e!197404))))

(declare-datatypes ((array!16166 0))(
  ( (array!16167 (arr!7648 (Array (_ BitVec 32) (_ BitVec 64))) (size!8000 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16166)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317529 (= res!172158 (and (= (size!8000 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8000 a!3293))))))

(declare-fun b!317530 () Bool)

(declare-fun res!172162 () Bool)

(assert (=> b!317530 (=> (not res!172162) (not e!197404))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2753 0))(
  ( (MissingZero!2753 (index!13188 (_ BitVec 32))) (Found!2753 (index!13189 (_ BitVec 32))) (Intermediate!2753 (undefined!3565 Bool) (index!13190 (_ BitVec 32)) (x!31559 (_ BitVec 32))) (Undefined!2753) (MissingVacant!2753 (index!13191 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16166 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!317530 (= res!172162 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2753 i!1240)))))

(declare-fun b!317531 () Bool)

(declare-fun res!172161 () Bool)

(assert (=> b!317531 (=> (not res!172161) (not e!197404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16166 (_ BitVec 32)) Bool)

(assert (=> b!317531 (= res!172161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317532 () Bool)

(declare-fun e!197406 () Bool)

(assert (=> b!317532 (= e!197404 e!197406)))

(declare-fun res!172165 () Bool)

(assert (=> b!317532 (=> (not res!172165) (not e!197406))))

(declare-fun lt!155026 () SeekEntryResult!2753)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16166 (_ BitVec 32)) SeekEntryResult!2753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317532 (= res!172165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155026))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317532 (= lt!155026 (Intermediate!2753 false resIndex!52 resX!52))))

(declare-fun b!317534 () Bool)

(declare-fun res!172160 () Bool)

(assert (=> b!317534 (=> (not res!172160) (not e!197406))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317534 (= res!172160 (and (= (select (arr!7648 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8000 a!3293))))))

(declare-fun b!317535 () Bool)

(declare-fun res!172159 () Bool)

(assert (=> b!317535 (=> (not res!172159) (not e!197404))))

(declare-fun arrayContainsKey!0 (array!16166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317535 (= res!172159 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317536 () Bool)

(declare-fun e!197405 () Bool)

(assert (=> b!317536 (= e!197406 e!197405)))

(declare-fun res!172166 () Bool)

(assert (=> b!317536 (=> (not res!172166) (not e!197405))))

(declare-fun lt!155027 () SeekEntryResult!2753)

(assert (=> b!317536 (= res!172166 (and (= lt!155027 lt!155026) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7648 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317536 (= lt!155027 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317533 () Bool)

(assert (=> b!317533 (= e!197405 (not true))))

(declare-fun e!197403 () Bool)

(assert (=> b!317533 e!197403))

(declare-fun res!172163 () Bool)

(assert (=> b!317533 (=> (not res!172163) (not e!197403))))

(declare-fun lt!155028 () (_ BitVec 32))

(assert (=> b!317533 (= res!172163 (= lt!155027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155028 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317533 (= lt!155028 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!172167 () Bool)

(assert (=> start!31782 (=> (not res!172167) (not e!197404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31782 (= res!172167 (validMask!0 mask!3709))))

(assert (=> start!31782 e!197404))

(declare-fun array_inv!5598 (array!16166) Bool)

(assert (=> start!31782 (array_inv!5598 a!3293)))

(assert (=> start!31782 true))

(declare-fun b!317537 () Bool)

(declare-fun res!172164 () Bool)

(assert (=> b!317537 (=> (not res!172164) (not e!197404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317537 (= res!172164 (validKeyInArray!0 k0!2441))))

(declare-fun b!317538 () Bool)

(declare-fun lt!155025 () array!16166)

(assert (=> b!317538 (= e!197403 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155025 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155028 k0!2441 lt!155025 mask!3709)))))

(assert (=> b!317538 (= lt!155025 (array!16167 (store (arr!7648 a!3293) i!1240 k0!2441) (size!8000 a!3293)))))

(assert (= (and start!31782 res!172167) b!317529))

(assert (= (and b!317529 res!172158) b!317537))

(assert (= (and b!317537 res!172164) b!317535))

(assert (= (and b!317535 res!172159) b!317530))

(assert (= (and b!317530 res!172162) b!317531))

(assert (= (and b!317531 res!172161) b!317532))

(assert (= (and b!317532 res!172165) b!317534))

(assert (= (and b!317534 res!172160) b!317536))

(assert (= (and b!317536 res!172166) b!317533))

(assert (= (and b!317533 res!172163) b!317538))

(declare-fun m!326395 () Bool)

(assert (=> b!317538 m!326395))

(declare-fun m!326397 () Bool)

(assert (=> b!317538 m!326397))

(declare-fun m!326399 () Bool)

(assert (=> b!317538 m!326399))

(declare-fun m!326401 () Bool)

(assert (=> b!317537 m!326401))

(declare-fun m!326403 () Bool)

(assert (=> b!317532 m!326403))

(assert (=> b!317532 m!326403))

(declare-fun m!326405 () Bool)

(assert (=> b!317532 m!326405))

(declare-fun m!326407 () Bool)

(assert (=> b!317534 m!326407))

(declare-fun m!326409 () Bool)

(assert (=> b!317535 m!326409))

(declare-fun m!326411 () Bool)

(assert (=> b!317530 m!326411))

(declare-fun m!326413 () Bool)

(assert (=> b!317533 m!326413))

(declare-fun m!326415 () Bool)

(assert (=> b!317533 m!326415))

(declare-fun m!326417 () Bool)

(assert (=> b!317531 m!326417))

(declare-fun m!326419 () Bool)

(assert (=> start!31782 m!326419))

(declare-fun m!326421 () Bool)

(assert (=> start!31782 m!326421))

(declare-fun m!326423 () Bool)

(assert (=> b!317536 m!326423))

(declare-fun m!326425 () Bool)

(assert (=> b!317536 m!326425))

(check-sat (not b!317536) (not b!317537) (not b!317531) (not b!317533) (not b!317530) (not b!317535) (not start!31782) (not b!317538) (not b!317532))
(check-sat)
