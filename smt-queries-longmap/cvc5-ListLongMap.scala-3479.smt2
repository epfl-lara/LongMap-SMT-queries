; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48212 () Bool)

(assert start!48212)

(declare-fun b!530787 () Bool)

(declare-fun e!309186 () Bool)

(assert (=> b!530787 (= e!309186 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33636 0))(
  ( (array!33637 (arr!16164 (Array (_ BitVec 32) (_ BitVec 64))) (size!16528 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33636)

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4578 0))(
  ( (MissingZero!4578 (index!20536 (_ BitVec 32))) (Found!4578 (index!20537 (_ BitVec 32))) (Intermediate!4578 (undefined!5390 Bool) (index!20538 (_ BitVec 32)) (x!49661 (_ BitVec 32))) (Undefined!4578) (MissingVacant!4578 (index!20539 (_ BitVec 32))) )
))
(declare-fun lt!244822 () SeekEntryResult!4578)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33636 (_ BitVec 32)) SeekEntryResult!4578)

(assert (=> b!530787 (= lt!244822 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326547 () Bool)

(assert (=> start!48212 (=> (not res!326547) (not e!309186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48212 (= res!326547 (validMask!0 mask!3216))))

(assert (=> start!48212 e!309186))

(assert (=> start!48212 true))

(declare-fun array_inv!12023 (array!33636) Bool)

(assert (=> start!48212 (array_inv!12023 a!3154)))

(declare-fun b!530788 () Bool)

(declare-fun res!326551 () Bool)

(assert (=> b!530788 (=> (not res!326551) (not e!309186))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530788 (= res!326551 (and (= (size!16528 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16528 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16528 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530789 () Bool)

(declare-fun res!326549 () Bool)

(assert (=> b!530789 (=> (not res!326549) (not e!309186))))

(declare-fun arrayContainsKey!0 (array!33636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530789 (= res!326549 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530790 () Bool)

(declare-fun res!326550 () Bool)

(assert (=> b!530790 (=> (not res!326550) (not e!309186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530790 (= res!326550 (validKeyInArray!0 k!1998))))

(declare-fun b!530791 () Bool)

(declare-fun res!326548 () Bool)

(assert (=> b!530791 (=> (not res!326548) (not e!309186))))

(assert (=> b!530791 (= res!326548 (validKeyInArray!0 (select (arr!16164 a!3154) j!147)))))

(assert (= (and start!48212 res!326547) b!530788))

(assert (= (and b!530788 res!326551) b!530791))

(assert (= (and b!530791 res!326548) b!530790))

(assert (= (and b!530790 res!326550) b!530789))

(assert (= (and b!530789 res!326549) b!530787))

(declare-fun m!511577 () Bool)

(assert (=> b!530791 m!511577))

(assert (=> b!530791 m!511577))

(declare-fun m!511579 () Bool)

(assert (=> b!530791 m!511579))

(declare-fun m!511581 () Bool)

(assert (=> start!48212 m!511581))

(declare-fun m!511583 () Bool)

(assert (=> start!48212 m!511583))

(declare-fun m!511585 () Bool)

(assert (=> b!530790 m!511585))

(declare-fun m!511587 () Bool)

(assert (=> b!530789 m!511587))

(declare-fun m!511589 () Bool)

(assert (=> b!530787 m!511589))

(push 1)

(assert (not b!530789))

(assert (not b!530787))

(assert (not b!530791))

(assert (not start!48212))

(assert (not b!530790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

