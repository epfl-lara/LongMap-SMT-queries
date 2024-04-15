; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48184 () Bool)

(assert start!48184)

(declare-fun res!326248 () Bool)

(declare-fun e!308978 () Bool)

(assert (=> start!48184 (=> (not res!326248) (not e!308978))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48184 (= res!326248 (validMask!0 mask!3216))))

(assert (=> start!48184 e!308978))

(assert (=> start!48184 true))

(declare-datatypes ((array!33619 0))(
  ( (array!33620 (arr!16156 (Array (_ BitVec 32) (_ BitVec 64))) (size!16521 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33619)

(declare-fun array_inv!12039 (array!33619) Bool)

(assert (=> start!48184 (array_inv!12039 a!3154)))

(declare-fun b!530397 () Bool)

(declare-fun res!326247 () Bool)

(assert (=> b!530397 (=> (not res!326247) (not e!308978))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530397 (= res!326247 (and (= (size!16521 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16521 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16521 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530398 () Bool)

(declare-fun res!326246 () Bool)

(assert (=> b!530398 (=> (not res!326246) (not e!308978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530398 (= res!326246 (validKeyInArray!0 (select (arr!16156 a!3154) j!147)))))

(declare-fun b!530399 () Bool)

(declare-fun res!326249 () Bool)

(assert (=> b!530399 (=> (not res!326249) (not e!308978))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530399 (= res!326249 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530400 () Bool)

(assert (=> b!530400 (= e!308978 false)))

(declare-datatypes ((SeekEntryResult!4611 0))(
  ( (MissingZero!4611 (index!20668 (_ BitVec 32))) (Found!4611 (index!20669 (_ BitVec 32))) (Intermediate!4611 (undefined!5423 Bool) (index!20670 (_ BitVec 32)) (x!49660 (_ BitVec 32))) (Undefined!4611) (MissingVacant!4611 (index!20671 (_ BitVec 32))) )
))
(declare-fun lt!244540 () SeekEntryResult!4611)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33619 (_ BitVec 32)) SeekEntryResult!4611)

(assert (=> b!530400 (= lt!244540 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530401 () Bool)

(declare-fun res!326245 () Bool)

(assert (=> b!530401 (=> (not res!326245) (not e!308978))))

(assert (=> b!530401 (= res!326245 (validKeyInArray!0 k!1998))))

(assert (= (and start!48184 res!326248) b!530397))

(assert (= (and b!530397 res!326247) b!530398))

(assert (= (and b!530398 res!326246) b!530401))

(assert (= (and b!530401 res!326245) b!530399))

(assert (= (and b!530399 res!326249) b!530400))

(declare-fun m!510473 () Bool)

(assert (=> b!530398 m!510473))

(assert (=> b!530398 m!510473))

(declare-fun m!510475 () Bool)

(assert (=> b!530398 m!510475))

(declare-fun m!510477 () Bool)

(assert (=> b!530399 m!510477))

(declare-fun m!510479 () Bool)

(assert (=> start!48184 m!510479))

(declare-fun m!510481 () Bool)

(assert (=> start!48184 m!510481))

(declare-fun m!510483 () Bool)

(assert (=> b!530401 m!510483))

(declare-fun m!510485 () Bool)

(assert (=> b!530400 m!510485))

(push 1)

(assert (not b!530401))

(assert (not b!530399))

(assert (not b!530400))

(assert (not start!48184))

(assert (not b!530398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

