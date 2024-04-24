; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31354 () Bool)

(assert start!31354)

(declare-fun b!314315 () Bool)

(declare-fun res!170115 () Bool)

(declare-fun e!195795 () Bool)

(assert (=> b!314315 (=> (not res!170115) (not e!195795))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!16038 0))(
  ( (array!16039 (arr!7593 (Array (_ BitVec 32) (_ BitVec 64))) (size!7945 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16038)

(declare-datatypes ((SeekEntryResult!2698 0))(
  ( (MissingZero!2698 (index!12968 (_ BitVec 32))) (Found!2698 (index!12969 (_ BitVec 32))) (Intermediate!2698 (undefined!3510 Bool) (index!12970 (_ BitVec 32)) (x!31301 (_ BitVec 32))) (Undefined!2698) (MissingVacant!2698 (index!12971 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16038 (_ BitVec 32)) SeekEntryResult!2698)

(assert (=> b!314315 (= res!170115 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2698 i!1240)))))

(declare-fun b!314316 () Bool)

(declare-fun res!170117 () Bool)

(assert (=> b!314316 (=> (not res!170117) (not e!195795))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16038 (_ BitVec 32)) SeekEntryResult!2698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314316 (= res!170117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2698 false resIndex!52 resX!52)))))

(declare-fun b!314317 () Bool)

(declare-fun res!170120 () Bool)

(assert (=> b!314317 (=> (not res!170120) (not e!195795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314317 (= res!170120 (validKeyInArray!0 k!2441))))

(declare-fun b!314318 () Bool)

(declare-fun res!170114 () Bool)

(assert (=> b!314318 (=> (not res!170114) (not e!195795))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314318 (= res!170114 (and (= (select (arr!7593 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7945 a!3293))))))

(declare-fun b!314319 () Bool)

(declare-fun res!170119 () Bool)

(assert (=> b!314319 (=> (not res!170119) (not e!195795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16038 (_ BitVec 32)) Bool)

(assert (=> b!314319 (= res!170119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!170118 () Bool)

(assert (=> start!31354 (=> (not res!170118) (not e!195795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31354 (= res!170118 (validMask!0 mask!3709))))

(assert (=> start!31354 e!195795))

(declare-fun array_inv!5543 (array!16038) Bool)

(assert (=> start!31354 (array_inv!5543 a!3293)))

(assert (=> start!31354 true))

(declare-fun b!314320 () Bool)

(declare-fun res!170121 () Bool)

(assert (=> b!314320 (=> (not res!170121) (not e!195795))))

(assert (=> b!314320 (= res!170121 (and (= (size!7945 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7945 a!3293))))))

(declare-fun b!314321 () Bool)

(declare-fun res!170116 () Bool)

(assert (=> b!314321 (=> (not res!170116) (not e!195795))))

(declare-fun arrayContainsKey!0 (array!16038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314321 (= res!170116 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314322 () Bool)

(assert (=> b!314322 (= e!195795 false)))

(declare-fun lt!153915 () SeekEntryResult!2698)

(assert (=> b!314322 (= lt!153915 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31354 res!170118) b!314320))

(assert (= (and b!314320 res!170121) b!314317))

(assert (= (and b!314317 res!170120) b!314321))

(assert (= (and b!314321 res!170116) b!314315))

(assert (= (and b!314315 res!170115) b!314319))

(assert (= (and b!314319 res!170119) b!314316))

(assert (= (and b!314316 res!170117) b!314318))

(assert (= (and b!314318 res!170114) b!314322))

(declare-fun m!324077 () Bool)

(assert (=> b!314316 m!324077))

(assert (=> b!314316 m!324077))

(declare-fun m!324079 () Bool)

(assert (=> b!314316 m!324079))

(declare-fun m!324081 () Bool)

(assert (=> start!31354 m!324081))

(declare-fun m!324083 () Bool)

(assert (=> start!31354 m!324083))

(declare-fun m!324085 () Bool)

(assert (=> b!314315 m!324085))

(declare-fun m!324087 () Bool)

(assert (=> b!314318 m!324087))

(declare-fun m!324089 () Bool)

(assert (=> b!314321 m!324089))

(declare-fun m!324091 () Bool)

(assert (=> b!314319 m!324091))

(declare-fun m!324093 () Bool)

(assert (=> b!314317 m!324093))

(declare-fun m!324095 () Bool)

(assert (=> b!314322 m!324095))

(push 1)

(assert (not b!314321))

(assert (not b!314316))

(assert (not b!314319))

(assert (not b!314317))

(assert (not b!314315))

(assert (not start!31354))

(assert (not b!314322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

