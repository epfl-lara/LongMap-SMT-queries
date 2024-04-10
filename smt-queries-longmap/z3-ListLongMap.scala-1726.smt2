; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31810 () Bool)

(assert start!31810)

(declare-fun b!317792 () Bool)

(declare-fun e!197542 () Bool)

(assert (=> b!317792 (= e!197542 (not true))))

(declare-fun e!197543 () Bool)

(assert (=> b!317792 e!197543))

(declare-fun res!172375 () Bool)

(assert (=> b!317792 (=> (not res!172375) (not e!197543))))

(declare-datatypes ((SeekEntryResult!2796 0))(
  ( (MissingZero!2796 (index!13360 (_ BitVec 32))) (Found!2796 (index!13361 (_ BitVec 32))) (Intermediate!2796 (undefined!3608 Bool) (index!13362 (_ BitVec 32)) (x!31621 (_ BitVec 32))) (Undefined!2796) (MissingVacant!2796 (index!13363 (_ BitVec 32))) )
))
(declare-fun lt!155094 () SeekEntryResult!2796)

(declare-datatypes ((array!16181 0))(
  ( (array!16182 (arr!7656 (Array (_ BitVec 32) (_ BitVec 64))) (size!8008 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16181)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!155093 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16181 (_ BitVec 32)) SeekEntryResult!2796)

(assert (=> b!317792 (= res!172375 (= lt!155094 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155093 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317792 (= lt!155093 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317793 () Bool)

(declare-fun res!172373 () Bool)

(declare-fun e!197545 () Bool)

(assert (=> b!317793 (=> (not res!172373) (not e!197545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16181 (_ BitVec 32)) Bool)

(assert (=> b!317793 (= res!172373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317794 () Bool)

(declare-fun e!197544 () Bool)

(assert (=> b!317794 (= e!197545 e!197544)))

(declare-fun res!172372 () Bool)

(assert (=> b!317794 (=> (not res!172372) (not e!197544))))

(declare-fun lt!155092 () SeekEntryResult!2796)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317794 (= res!172372 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155092))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317794 (= lt!155092 (Intermediate!2796 false resIndex!52 resX!52))))

(declare-fun lt!155091 () array!16181)

(declare-fun b!317795 () Bool)

(assert (=> b!317795 (= e!197543 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155091 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155093 k0!2441 lt!155091 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317795 (= lt!155091 (array!16182 (store (arr!7656 a!3293) i!1240 k0!2441) (size!8008 a!3293)))))

(declare-fun res!172380 () Bool)

(assert (=> start!31810 (=> (not res!172380) (not e!197545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31810 (= res!172380 (validMask!0 mask!3709))))

(assert (=> start!31810 e!197545))

(declare-fun array_inv!5619 (array!16181) Bool)

(assert (=> start!31810 (array_inv!5619 a!3293)))

(assert (=> start!31810 true))

(declare-fun b!317796 () Bool)

(declare-fun res!172379 () Bool)

(assert (=> b!317796 (=> (not res!172379) (not e!197544))))

(assert (=> b!317796 (= res!172379 (and (= (select (arr!7656 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8008 a!3293))))))

(declare-fun b!317797 () Bool)

(declare-fun res!172376 () Bool)

(assert (=> b!317797 (=> (not res!172376) (not e!197545))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16181 (_ BitVec 32)) SeekEntryResult!2796)

(assert (=> b!317797 (= res!172376 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2796 i!1240)))))

(declare-fun b!317798 () Bool)

(declare-fun res!172377 () Bool)

(assert (=> b!317798 (=> (not res!172377) (not e!197545))))

(declare-fun arrayContainsKey!0 (array!16181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317798 (= res!172377 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317799 () Bool)

(declare-fun res!172371 () Bool)

(assert (=> b!317799 (=> (not res!172371) (not e!197545))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317799 (= res!172371 (validKeyInArray!0 k0!2441))))

(declare-fun b!317800 () Bool)

(assert (=> b!317800 (= e!197544 e!197542)))

(declare-fun res!172378 () Bool)

(assert (=> b!317800 (=> (not res!172378) (not e!197542))))

(assert (=> b!317800 (= res!172378 (and (= lt!155094 lt!155092) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7656 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317800 (= lt!155094 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317801 () Bool)

(declare-fun res!172374 () Bool)

(assert (=> b!317801 (=> (not res!172374) (not e!197545))))

(assert (=> b!317801 (= res!172374 (and (= (size!8008 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8008 a!3293))))))

(assert (= (and start!31810 res!172380) b!317801))

(assert (= (and b!317801 res!172374) b!317799))

(assert (= (and b!317799 res!172371) b!317798))

(assert (= (and b!317798 res!172377) b!317797))

(assert (= (and b!317797 res!172376) b!317793))

(assert (= (and b!317793 res!172373) b!317794))

(assert (= (and b!317794 res!172372) b!317796))

(assert (= (and b!317796 res!172379) b!317800))

(assert (= (and b!317800 res!172378) b!317792))

(assert (= (and b!317792 res!172375) b!317795))

(declare-fun m!326449 () Bool)

(assert (=> b!317800 m!326449))

(declare-fun m!326451 () Bool)

(assert (=> b!317800 m!326451))

(declare-fun m!326453 () Bool)

(assert (=> b!317799 m!326453))

(declare-fun m!326455 () Bool)

(assert (=> b!317796 m!326455))

(declare-fun m!326457 () Bool)

(assert (=> start!31810 m!326457))

(declare-fun m!326459 () Bool)

(assert (=> start!31810 m!326459))

(declare-fun m!326461 () Bool)

(assert (=> b!317793 m!326461))

(declare-fun m!326463 () Bool)

(assert (=> b!317792 m!326463))

(declare-fun m!326465 () Bool)

(assert (=> b!317792 m!326465))

(declare-fun m!326467 () Bool)

(assert (=> b!317798 m!326467))

(declare-fun m!326469 () Bool)

(assert (=> b!317794 m!326469))

(assert (=> b!317794 m!326469))

(declare-fun m!326471 () Bool)

(assert (=> b!317794 m!326471))

(declare-fun m!326473 () Bool)

(assert (=> b!317795 m!326473))

(declare-fun m!326475 () Bool)

(assert (=> b!317795 m!326475))

(declare-fun m!326477 () Bool)

(assert (=> b!317795 m!326477))

(declare-fun m!326479 () Bool)

(assert (=> b!317797 m!326479))

(check-sat (not b!317794) (not b!317793) (not start!31810) (not b!317798) (not b!317792) (not b!317797) (not b!317799) (not b!317800) (not b!317795))
(check-sat)
