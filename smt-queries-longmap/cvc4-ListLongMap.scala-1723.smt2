; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31794 () Bool)

(assert start!31794)

(declare-fun b!317552 () Bool)

(declare-fun res!172138 () Bool)

(declare-fun e!197422 () Bool)

(assert (=> b!317552 (=> (not res!172138) (not e!197422))))

(declare-datatypes ((array!16165 0))(
  ( (array!16166 (arr!7648 (Array (_ BitVec 32) (_ BitVec 64))) (size!8000 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16165)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317552 (= res!172138 (and (= (select (arr!7648 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8000 a!3293))))))

(declare-fun b!317553 () Bool)

(declare-fun res!172135 () Bool)

(declare-fun e!197421 () Bool)

(assert (=> b!317553 (=> (not res!172135) (not e!197421))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2788 0))(
  ( (MissingZero!2788 (index!13328 (_ BitVec 32))) (Found!2788 (index!13329 (_ BitVec 32))) (Intermediate!2788 (undefined!3600 Bool) (index!13330 (_ BitVec 32)) (x!31589 (_ BitVec 32))) (Undefined!2788) (MissingVacant!2788 (index!13331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16165 (_ BitVec 32)) SeekEntryResult!2788)

(assert (=> b!317553 (= res!172135 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2788 i!1240)))))

(declare-fun res!172133 () Bool)

(assert (=> start!31794 (=> (not res!172133) (not e!197421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31794 (= res!172133 (validMask!0 mask!3709))))

(assert (=> start!31794 e!197421))

(declare-fun array_inv!5611 (array!16165) Bool)

(assert (=> start!31794 (array_inv!5611 a!3293)))

(assert (=> start!31794 true))

(declare-fun b!317554 () Bool)

(declare-fun res!172132 () Bool)

(assert (=> b!317554 (=> (not res!172132) (not e!197421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317554 (= res!172132 (validKeyInArray!0 k!2441))))

(declare-fun b!317555 () Bool)

(declare-fun res!172136 () Bool)

(assert (=> b!317555 (=> (not res!172136) (not e!197421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16165 (_ BitVec 32)) Bool)

(assert (=> b!317555 (= res!172136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317556 () Bool)

(declare-fun e!197424 () Bool)

(assert (=> b!317556 (= e!197422 e!197424)))

(declare-fun res!172131 () Bool)

(assert (=> b!317556 (=> (not res!172131) (not e!197424))))

(declare-fun lt!154998 () SeekEntryResult!2788)

(declare-fun lt!154995 () SeekEntryResult!2788)

(assert (=> b!317556 (= res!172131 (and (= lt!154995 lt!154998) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7648 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16165 (_ BitVec 32)) SeekEntryResult!2788)

(assert (=> b!317556 (= lt!154995 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317557 () Bool)

(declare-fun res!172137 () Bool)

(assert (=> b!317557 (=> (not res!172137) (not e!197421))))

(declare-fun arrayContainsKey!0 (array!16165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317557 (= res!172137 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317558 () Bool)

(assert (=> b!317558 (= e!197421 e!197422)))

(declare-fun res!172134 () Bool)

(assert (=> b!317558 (=> (not res!172134) (not e!197422))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317558 (= res!172134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154998))))

(assert (=> b!317558 (= lt!154998 (Intermediate!2788 false resIndex!52 resX!52))))

(declare-fun e!197423 () Bool)

(declare-fun lt!154997 () (_ BitVec 32))

(declare-fun lt!154996 () array!16165)

(declare-fun b!317559 () Bool)

(assert (=> b!317559 (= e!197423 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154996 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154997 k!2441 lt!154996 mask!3709)))))

(assert (=> b!317559 (= lt!154996 (array!16166 (store (arr!7648 a!3293) i!1240 k!2441) (size!8000 a!3293)))))

(declare-fun b!317560 () Bool)

(assert (=> b!317560 (= e!197424 (not true))))

(assert (=> b!317560 e!197423))

(declare-fun res!172139 () Bool)

(assert (=> b!317560 (=> (not res!172139) (not e!197423))))

(assert (=> b!317560 (= res!172139 (= lt!154995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154997 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317560 (= lt!154997 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317561 () Bool)

(declare-fun res!172140 () Bool)

(assert (=> b!317561 (=> (not res!172140) (not e!197421))))

(assert (=> b!317561 (= res!172140 (and (= (size!8000 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8000 a!3293))))))

(assert (= (and start!31794 res!172133) b!317561))

(assert (= (and b!317561 res!172140) b!317554))

(assert (= (and b!317554 res!172132) b!317557))

(assert (= (and b!317557 res!172137) b!317553))

(assert (= (and b!317553 res!172135) b!317555))

(assert (= (and b!317555 res!172136) b!317558))

(assert (= (and b!317558 res!172134) b!317552))

(assert (= (and b!317552 res!172138) b!317556))

(assert (= (and b!317556 res!172131) b!317560))

(assert (= (and b!317560 res!172139) b!317559))

(declare-fun m!326193 () Bool)

(assert (=> b!317556 m!326193))

(declare-fun m!326195 () Bool)

(assert (=> b!317556 m!326195))

(declare-fun m!326197 () Bool)

(assert (=> b!317558 m!326197))

(assert (=> b!317558 m!326197))

(declare-fun m!326199 () Bool)

(assert (=> b!317558 m!326199))

(declare-fun m!326201 () Bool)

(assert (=> b!317552 m!326201))

(declare-fun m!326203 () Bool)

(assert (=> b!317559 m!326203))

(declare-fun m!326205 () Bool)

(assert (=> b!317559 m!326205))

(declare-fun m!326207 () Bool)

(assert (=> b!317559 m!326207))

(declare-fun m!326209 () Bool)

(assert (=> b!317554 m!326209))

(declare-fun m!326211 () Bool)

(assert (=> b!317560 m!326211))

(declare-fun m!326213 () Bool)

(assert (=> b!317560 m!326213))

(declare-fun m!326215 () Bool)

(assert (=> b!317555 m!326215))

(declare-fun m!326217 () Bool)

(assert (=> b!317553 m!326217))

(declare-fun m!326219 () Bool)

(assert (=> start!31794 m!326219))

(declare-fun m!326221 () Bool)

(assert (=> start!31794 m!326221))

(declare-fun m!326223 () Bool)

(assert (=> b!317557 m!326223))

(push 1)

(assert (not b!317556))

