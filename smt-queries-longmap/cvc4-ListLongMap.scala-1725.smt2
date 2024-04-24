; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31790 () Bool)

(assert start!31790)

(declare-fun res!172280 () Bool)

(declare-fun e!197463 () Bool)

(assert (=> start!31790 (=> (not res!172280) (not e!197463))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31790 (= res!172280 (validMask!0 mask!3709))))

(assert (=> start!31790 e!197463))

(declare-datatypes ((array!16174 0))(
  ( (array!16175 (arr!7652 (Array (_ BitVec 32) (_ BitVec 64))) (size!8004 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16174)

(declare-fun array_inv!5602 (array!16174) Bool)

(assert (=> start!31790 (array_inv!5602 a!3293)))

(assert (=> start!31790 true))

(declare-fun b!317649 () Bool)

(declare-fun e!197466 () Bool)

(assert (=> b!317649 (= e!197463 e!197466)))

(declare-fun res!172278 () Bool)

(assert (=> b!317649 (=> (not res!172278) (not e!197466))))

(declare-datatypes ((SeekEntryResult!2757 0))(
  ( (MissingZero!2757 (index!13204 (_ BitVec 32))) (Found!2757 (index!13205 (_ BitVec 32))) (Intermediate!2757 (undefined!3569 Bool) (index!13206 (_ BitVec 32)) (x!31571 (_ BitVec 32))) (Undefined!2757) (MissingVacant!2757 (index!13207 (_ BitVec 32))) )
))
(declare-fun lt!155075 () SeekEntryResult!2757)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16174 (_ BitVec 32)) SeekEntryResult!2757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317649 (= res!172278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155075))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317649 (= lt!155075 (Intermediate!2757 false resIndex!52 resX!52))))

(declare-fun b!317650 () Bool)

(declare-fun e!197465 () Bool)

(assert (=> b!317650 (= e!197466 e!197465)))

(declare-fun res!172285 () Bool)

(assert (=> b!317650 (=> (not res!172285) (not e!197465))))

(declare-fun lt!155076 () SeekEntryResult!2757)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317650 (= res!172285 (and (= lt!155076 lt!155075) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7652 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317650 (= lt!155076 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317651 () Bool)

(declare-fun res!172286 () Bool)

(assert (=> b!317651 (=> (not res!172286) (not e!197463))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317651 (= res!172286 (and (= (size!8004 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8004 a!3293))))))

(declare-fun b!317652 () Bool)

(declare-fun res!172283 () Bool)

(assert (=> b!317652 (=> (not res!172283) (not e!197466))))

(assert (=> b!317652 (= res!172283 (and (= (select (arr!7652 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8004 a!3293))))))

(declare-fun b!317653 () Bool)

(declare-fun res!172279 () Bool)

(assert (=> b!317653 (=> (not res!172279) (not e!197463))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16174 (_ BitVec 32)) SeekEntryResult!2757)

(assert (=> b!317653 (= res!172279 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2757 i!1240)))))

(declare-fun lt!155074 () array!16174)

(declare-fun lt!155073 () (_ BitVec 32))

(declare-fun b!317654 () Bool)

(declare-fun e!197464 () Bool)

(assert (=> b!317654 (= e!197464 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155074 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155073 k!2441 lt!155074 mask!3709)))))

(assert (=> b!317654 (= lt!155074 (array!16175 (store (arr!7652 a!3293) i!1240 k!2441) (size!8004 a!3293)))))

(declare-fun b!317655 () Bool)

(declare-fun res!172284 () Bool)

(assert (=> b!317655 (=> (not res!172284) (not e!197463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16174 (_ BitVec 32)) Bool)

(assert (=> b!317655 (= res!172284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317656 () Bool)

(declare-fun res!172287 () Bool)

(assert (=> b!317656 (=> (not res!172287) (not e!197463))))

(declare-fun arrayContainsKey!0 (array!16174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317656 (= res!172287 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317657 () Bool)

(assert (=> b!317657 (= e!197465 (not true))))

(assert (=> b!317657 e!197464))

(declare-fun res!172281 () Bool)

(assert (=> b!317657 (=> (not res!172281) (not e!197464))))

(assert (=> b!317657 (= res!172281 (= lt!155076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155073 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317657 (= lt!155073 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!317658 () Bool)

(declare-fun res!172282 () Bool)

(assert (=> b!317658 (=> (not res!172282) (not e!197463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317658 (= res!172282 (validKeyInArray!0 k!2441))))

(assert (= (and start!31790 res!172280) b!317651))

(assert (= (and b!317651 res!172286) b!317658))

(assert (= (and b!317658 res!172282) b!317656))

(assert (= (and b!317656 res!172287) b!317653))

(assert (= (and b!317653 res!172279) b!317655))

(assert (= (and b!317655 res!172284) b!317649))

(assert (= (and b!317649 res!172278) b!317652))

(assert (= (and b!317652 res!172283) b!317650))

(assert (= (and b!317650 res!172285) b!317657))

(assert (= (and b!317657 res!172281) b!317654))

(declare-fun m!326523 () Bool)

(assert (=> b!317653 m!326523))

(declare-fun m!326525 () Bool)

(assert (=> b!317652 m!326525))

(declare-fun m!326527 () Bool)

(assert (=> b!317650 m!326527))

(declare-fun m!326529 () Bool)

(assert (=> b!317650 m!326529))

(declare-fun m!326531 () Bool)

(assert (=> b!317658 m!326531))

(declare-fun m!326533 () Bool)

(assert (=> b!317655 m!326533))

(declare-fun m!326535 () Bool)

(assert (=> start!31790 m!326535))

(declare-fun m!326537 () Bool)

(assert (=> start!31790 m!326537))

(declare-fun m!326539 () Bool)

(assert (=> b!317657 m!326539))

(declare-fun m!326541 () Bool)

(assert (=> b!317657 m!326541))

(declare-fun m!326543 () Bool)

(assert (=> b!317654 m!326543))

(declare-fun m!326545 () Bool)

(assert (=> b!317654 m!326545))

(declare-fun m!326547 () Bool)

(assert (=> b!317654 m!326547))

(declare-fun m!326549 () Bool)

(assert (=> b!317656 m!326549))

(declare-fun m!326551 () Bool)

(assert (=> b!317649 m!326551))

(assert (=> b!317649 m!326551))

(declare-fun m!326553 () Bool)

(assert (=> b!317649 m!326553))

(push 1)

(assert (not b!317656))

(assert (not b!317650))

(assert (not b!317653))

(assert (not b!317654))

(assert (not b!317658))

(assert (not b!317657))

(assert (not b!317649))

(assert (not start!31790))

(assert (not b!317655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

