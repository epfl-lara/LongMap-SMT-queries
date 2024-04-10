; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31502 () Bool)

(assert start!31502)

(declare-fun b!315231 () Bool)

(declare-fun res!170683 () Bool)

(declare-fun e!196254 () Bool)

(assert (=> b!315231 (=> (not res!170683) (not e!196254))))

(declare-datatypes ((array!16077 0))(
  ( (array!16078 (arr!7610 (Array (_ BitVec 32) (_ BitVec 64))) (size!7962 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16077)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2750 0))(
  ( (MissingZero!2750 (index!13176 (_ BitVec 32))) (Found!2750 (index!13177 (_ BitVec 32))) (Intermediate!2750 (undefined!3562 Bool) (index!13178 (_ BitVec 32)) (x!31419 (_ BitVec 32))) (Undefined!2750) (MissingVacant!2750 (index!13179 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16077 (_ BitVec 32)) SeekEntryResult!2750)

(assert (=> b!315231 (= res!170683 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2750 i!1240)))))

(declare-fun b!315232 () Bool)

(declare-fun res!170680 () Bool)

(assert (=> b!315232 (=> (not res!170680) (not e!196254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315232 (= res!170680 (validKeyInArray!0 k!2441))))

(declare-fun b!315233 () Bool)

(declare-fun res!170684 () Bool)

(assert (=> b!315233 (=> (not res!170684) (not e!196254))))

(declare-fun arrayContainsKey!0 (array!16077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315233 (= res!170684 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315234 () Bool)

(declare-fun res!170685 () Bool)

(declare-fun e!196252 () Bool)

(assert (=> b!315234 (=> (not res!170685) (not e!196252))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315234 (= res!170685 (and (= (select (arr!7610 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7962 a!3293))))))

(declare-fun b!315235 () Bool)

(declare-fun res!170686 () Bool)

(assert (=> b!315235 (=> (not res!170686) (not e!196254))))

(assert (=> b!315235 (= res!170686 (and (= (size!7962 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7962 a!3293))))))

(declare-fun b!315236 () Bool)

(declare-fun res!170682 () Bool)

(assert (=> b!315236 (=> (not res!170682) (not e!196254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16077 (_ BitVec 32)) Bool)

(assert (=> b!315236 (= res!170682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315237 () Bool)

(declare-fun e!196253 () Bool)

(assert (=> b!315237 (= e!196252 e!196253)))

(declare-fun res!170687 () Bool)

(assert (=> b!315237 (=> (not res!170687) (not e!196253))))

(declare-fun lt!154184 () SeekEntryResult!2750)

(declare-fun lt!154185 () SeekEntryResult!2750)

(assert (=> b!315237 (= res!170687 (and (= lt!154184 lt!154185) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7610 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7610 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7610 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16077 (_ BitVec 32)) SeekEntryResult!2750)

(assert (=> b!315237 (= lt!154184 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!315238 () Bool)

(declare-fun lt!154183 () SeekEntryResult!2750)

(assert (=> b!315238 (= e!196253 (not (is-Intermediate!2750 lt!154183)))))

(assert (=> b!315238 (= lt!154184 lt!154183)))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315238 (= lt!154183 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!170688 () Bool)

(assert (=> start!31502 (=> (not res!170688) (not e!196254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31502 (= res!170688 (validMask!0 mask!3709))))

(assert (=> start!31502 e!196254))

(declare-fun array_inv!5573 (array!16077) Bool)

(assert (=> start!31502 (array_inv!5573 a!3293)))

(assert (=> start!31502 true))

(declare-fun b!315239 () Bool)

(assert (=> b!315239 (= e!196254 e!196252)))

(declare-fun res!170681 () Bool)

(assert (=> b!315239 (=> (not res!170681) (not e!196252))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315239 (= res!170681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154185))))

(assert (=> b!315239 (= lt!154185 (Intermediate!2750 false resIndex!52 resX!52))))

(assert (= (and start!31502 res!170688) b!315235))

(assert (= (and b!315235 res!170686) b!315232))

(assert (= (and b!315232 res!170680) b!315233))

(assert (= (and b!315233 res!170684) b!315231))

(assert (= (and b!315231 res!170683) b!315236))

(assert (= (and b!315236 res!170682) b!315239))

(assert (= (and b!315239 res!170681) b!315234))

(assert (= (and b!315234 res!170685) b!315237))

(assert (= (and b!315237 res!170687) b!315238))

(declare-fun m!324539 () Bool)

(assert (=> b!315239 m!324539))

(assert (=> b!315239 m!324539))

(declare-fun m!324541 () Bool)

(assert (=> b!315239 m!324541))

(declare-fun m!324543 () Bool)

(assert (=> b!315232 m!324543))

(declare-fun m!324545 () Bool)

(assert (=> b!315236 m!324545))

(declare-fun m!324547 () Bool)

(assert (=> b!315233 m!324547))

(declare-fun m!324549 () Bool)

(assert (=> b!315237 m!324549))

(declare-fun m!324551 () Bool)

(assert (=> b!315237 m!324551))

(declare-fun m!324553 () Bool)

(assert (=> b!315231 m!324553))

(declare-fun m!324555 () Bool)

(assert (=> b!315234 m!324555))

(declare-fun m!324557 () Bool)

(assert (=> start!31502 m!324557))

(declare-fun m!324559 () Bool)

(assert (=> start!31502 m!324559))

(declare-fun m!324561 () Bool)

(assert (=> b!315238 m!324561))

(assert (=> b!315238 m!324561))

(declare-fun m!324563 () Bool)

(assert (=> b!315238 m!324563))

(push 1)

(assert (not b!315236))

(assert (not b!315237))

(assert (not b!315232))

(assert (not b!315239))

(assert (not start!31502))

(assert (not b!315233))

(assert (not b!315238))

(assert (not b!315231))

(check-sat)

