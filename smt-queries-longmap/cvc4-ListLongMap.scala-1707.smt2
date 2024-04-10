; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31380 () Bool)

(assert start!31380)

(declare-fun b!314512 () Bool)

(declare-fun res!170263 () Bool)

(declare-fun e!195865 () Bool)

(assert (=> b!314512 (=> (not res!170263) (not e!195865))))

(declare-datatypes ((array!16051 0))(
  ( (array!16052 (arr!7600 (Array (_ BitVec 32) (_ BitVec 64))) (size!7952 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16051)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2740 0))(
  ( (MissingZero!2740 (index!13136 (_ BitVec 32))) (Found!2740 (index!13137 (_ BitVec 32))) (Intermediate!2740 (undefined!3552 Bool) (index!13138 (_ BitVec 32)) (x!31362 (_ BitVec 32))) (Undefined!2740) (MissingVacant!2740 (index!13139 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16051 (_ BitVec 32)) SeekEntryResult!2740)

(assert (=> b!314512 (= res!170263 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2740 i!1240)))))

(declare-fun b!314513 () Bool)

(declare-fun res!170268 () Bool)

(assert (=> b!314513 (=> (not res!170268) (not e!195865))))

(declare-fun arrayContainsKey!0 (array!16051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314513 (= res!170268 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314514 () Bool)

(declare-fun res!170267 () Bool)

(assert (=> b!314514 (=> (not res!170267) (not e!195865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16051 (_ BitVec 32)) Bool)

(assert (=> b!314514 (= res!170267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314515 () Bool)

(assert (=> b!314515 (= e!195865 false)))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153915 () SeekEntryResult!2740)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16051 (_ BitVec 32)) SeekEntryResult!2740)

(assert (=> b!314515 (= lt!153915 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!314516 () Bool)

(declare-fun res!170262 () Bool)

(assert (=> b!314516 (=> (not res!170262) (not e!195865))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314516 (= res!170262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2740 false resIndex!52 resX!52)))))

(declare-fun b!314517 () Bool)

(declare-fun res!170266 () Bool)

(assert (=> b!314517 (=> (not res!170266) (not e!195865))))

(assert (=> b!314517 (= res!170266 (and (= (size!7952 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7952 a!3293))))))

(declare-fun res!170264 () Bool)

(assert (=> start!31380 (=> (not res!170264) (not e!195865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31380 (= res!170264 (validMask!0 mask!3709))))

(assert (=> start!31380 e!195865))

(declare-fun array_inv!5563 (array!16051) Bool)

(assert (=> start!31380 (array_inv!5563 a!3293)))

(assert (=> start!31380 true))

(declare-fun b!314518 () Bool)

(declare-fun res!170265 () Bool)

(assert (=> b!314518 (=> (not res!170265) (not e!195865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314518 (= res!170265 (validKeyInArray!0 k!2441))))

(declare-fun b!314519 () Bool)

(declare-fun res!170261 () Bool)

(assert (=> b!314519 (=> (not res!170261) (not e!195865))))

(assert (=> b!314519 (= res!170261 (and (= (select (arr!7600 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7952 a!3293))))))

(assert (= (and start!31380 res!170264) b!314517))

(assert (= (and b!314517 res!170266) b!314518))

(assert (= (and b!314518 res!170265) b!314513))

(assert (= (and b!314513 res!170268) b!314512))

(assert (= (and b!314512 res!170263) b!314514))

(assert (= (and b!314514 res!170267) b!314516))

(assert (= (and b!314516 res!170262) b!314519))

(assert (= (and b!314519 res!170261) b!314515))

(declare-fun m!324057 () Bool)

(assert (=> b!314516 m!324057))

(assert (=> b!314516 m!324057))

(declare-fun m!324059 () Bool)

(assert (=> b!314516 m!324059))

(declare-fun m!324061 () Bool)

(assert (=> b!314519 m!324061))

(declare-fun m!324063 () Bool)

(assert (=> b!314513 m!324063))

(declare-fun m!324065 () Bool)

(assert (=> b!314512 m!324065))

(declare-fun m!324067 () Bool)

(assert (=> start!31380 m!324067))

(declare-fun m!324069 () Bool)

(assert (=> start!31380 m!324069))

(declare-fun m!324071 () Bool)

(assert (=> b!314518 m!324071))

(declare-fun m!324073 () Bool)

(assert (=> b!314515 m!324073))

(declare-fun m!324075 () Bool)

(assert (=> b!314514 m!324075))

(push 1)

(assert (not b!314515))

