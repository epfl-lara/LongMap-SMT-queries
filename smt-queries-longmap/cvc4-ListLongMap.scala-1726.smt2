; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31812 () Bool)

(assert start!31812)

(declare-fun b!317822 () Bool)

(declare-fun res!172408 () Bool)

(declare-fun e!197556 () Bool)

(assert (=> b!317822 (=> (not res!172408) (not e!197556))))

(declare-datatypes ((array!16183 0))(
  ( (array!16184 (arr!7657 (Array (_ BitVec 32) (_ BitVec 64))) (size!8009 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16183)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2797 0))(
  ( (MissingZero!2797 (index!13364 (_ BitVec 32))) (Found!2797 (index!13365 (_ BitVec 32))) (Intermediate!2797 (undefined!3609 Bool) (index!13366 (_ BitVec 32)) (x!31622 (_ BitVec 32))) (Undefined!2797) (MissingVacant!2797 (index!13367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16183 (_ BitVec 32)) SeekEntryResult!2797)

(assert (=> b!317822 (= res!172408 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2797 i!1240)))))

(declare-fun b!317823 () Bool)

(declare-fun res!172409 () Bool)

(declare-fun e!197559 () Bool)

(assert (=> b!317823 (=> (not res!172409) (not e!197559))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317823 (= res!172409 (and (= (select (arr!7657 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8009 a!3293))))))

(declare-fun b!317824 () Bool)

(assert (=> b!317824 (= e!197556 e!197559)))

(declare-fun res!172407 () Bool)

(assert (=> b!317824 (=> (not res!172407) (not e!197559))))

(declare-fun lt!155103 () SeekEntryResult!2797)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16183 (_ BitVec 32)) SeekEntryResult!2797)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317824 (= res!172407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155103))))

(assert (=> b!317824 (= lt!155103 (Intermediate!2797 false resIndex!52 resX!52))))

(declare-fun b!317825 () Bool)

(declare-fun e!197557 () Bool)

(assert (=> b!317825 (= e!197559 e!197557)))

(declare-fun res!172406 () Bool)

(assert (=> b!317825 (=> (not res!172406) (not e!197557))))

(declare-fun lt!155106 () SeekEntryResult!2797)

(assert (=> b!317825 (= res!172406 (and (= lt!155106 lt!155103) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7657 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317825 (= lt!155106 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317826 () Bool)

(declare-fun res!172402 () Bool)

(assert (=> b!317826 (=> (not res!172402) (not e!197556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16183 (_ BitVec 32)) Bool)

(assert (=> b!317826 (= res!172402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155104 () array!16183)

(declare-fun e!197560 () Bool)

(declare-fun lt!155105 () (_ BitVec 32))

(declare-fun b!317827 () Bool)

(assert (=> b!317827 (= e!197560 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155104 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155105 k!2441 lt!155104 mask!3709)))))

(assert (=> b!317827 (= lt!155104 (array!16184 (store (arr!7657 a!3293) i!1240 k!2441) (size!8009 a!3293)))))

(declare-fun b!317828 () Bool)

(declare-fun res!172405 () Bool)

(assert (=> b!317828 (=> (not res!172405) (not e!197556))))

(assert (=> b!317828 (= res!172405 (and (= (size!8009 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8009 a!3293))))))

(declare-fun b!317830 () Bool)

(declare-fun res!172401 () Bool)

(assert (=> b!317830 (=> (not res!172401) (not e!197556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317830 (= res!172401 (validKeyInArray!0 k!2441))))

(declare-fun b!317831 () Bool)

(assert (=> b!317831 (= e!197557 (not true))))

(assert (=> b!317831 e!197560))

(declare-fun res!172410 () Bool)

(assert (=> b!317831 (=> (not res!172410) (not e!197560))))

(assert (=> b!317831 (= res!172410 (= lt!155106 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155105 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317831 (= lt!155105 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317829 () Bool)

(declare-fun res!172403 () Bool)

(assert (=> b!317829 (=> (not res!172403) (not e!197556))))

(declare-fun arrayContainsKey!0 (array!16183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317829 (= res!172403 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!172404 () Bool)

(assert (=> start!31812 (=> (not res!172404) (not e!197556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31812 (= res!172404 (validMask!0 mask!3709))))

(assert (=> start!31812 e!197556))

(declare-fun array_inv!5620 (array!16183) Bool)

(assert (=> start!31812 (array_inv!5620 a!3293)))

(assert (=> start!31812 true))

(assert (= (and start!31812 res!172404) b!317828))

(assert (= (and b!317828 res!172405) b!317830))

(assert (= (and b!317830 res!172401) b!317829))

(assert (= (and b!317829 res!172403) b!317822))

(assert (= (and b!317822 res!172408) b!317826))

(assert (= (and b!317826 res!172402) b!317824))

(assert (= (and b!317824 res!172407) b!317823))

(assert (= (and b!317823 res!172409) b!317825))

(assert (= (and b!317825 res!172406) b!317831))

(assert (= (and b!317831 res!172410) b!317827))

(declare-fun m!326481 () Bool)

(assert (=> b!317827 m!326481))

(declare-fun m!326483 () Bool)

(assert (=> b!317827 m!326483))

(declare-fun m!326485 () Bool)

(assert (=> b!317827 m!326485))

(declare-fun m!326487 () Bool)

(assert (=> b!317826 m!326487))

(declare-fun m!326489 () Bool)

(assert (=> b!317825 m!326489))

(declare-fun m!326491 () Bool)

(assert (=> b!317825 m!326491))

(declare-fun m!326493 () Bool)

(assert (=> b!317823 m!326493))

(declare-fun m!326495 () Bool)

(assert (=> b!317830 m!326495))

(declare-fun m!326497 () Bool)

(assert (=> b!317829 m!326497))

(declare-fun m!326499 () Bool)

(assert (=> start!31812 m!326499))

(declare-fun m!326501 () Bool)

(assert (=> start!31812 m!326501))

(declare-fun m!326503 () Bool)

(assert (=> b!317831 m!326503))

(declare-fun m!326505 () Bool)

(assert (=> b!317831 m!326505))

(declare-fun m!326507 () Bool)

(assert (=> b!317822 m!326507))

(declare-fun m!326509 () Bool)

(assert (=> b!317824 m!326509))

(assert (=> b!317824 m!326509))

(declare-fun m!326511 () Bool)

(assert (=> b!317824 m!326511))

(push 1)

(assert (not b!317826))

(assert (not b!317831))

