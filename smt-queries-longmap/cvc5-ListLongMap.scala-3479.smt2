; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48208 () Bool)

(assert start!48208)

(declare-fun b!530577 () Bool)

(declare-fun res!326426 () Bool)

(declare-fun e!309050 () Bool)

(assert (=> b!530577 (=> (not res!326426) (not e!309050))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530577 (= res!326426 (validKeyInArray!0 k!1998))))

(declare-fun b!530578 () Bool)

(declare-fun res!326425 () Bool)

(assert (=> b!530578 (=> (not res!326425) (not e!309050))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33643 0))(
  ( (array!33644 (arr!16168 (Array (_ BitVec 32) (_ BitVec 64))) (size!16533 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33643)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530578 (= res!326425 (and (= (size!16533 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16533 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16533 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530579 () Bool)

(declare-fun res!326427 () Bool)

(assert (=> b!530579 (=> (not res!326427) (not e!309050))))

(declare-fun arrayContainsKey!0 (array!33643 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530579 (= res!326427 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530581 () Bool)

(assert (=> b!530581 (= e!309050 false)))

(declare-datatypes ((SeekEntryResult!4623 0))(
  ( (MissingZero!4623 (index!20716 (_ BitVec 32))) (Found!4623 (index!20717 (_ BitVec 32))) (Intermediate!4623 (undefined!5435 Bool) (index!20718 (_ BitVec 32)) (x!49704 (_ BitVec 32))) (Undefined!4623) (MissingVacant!4623 (index!20719 (_ BitVec 32))) )
))
(declare-fun lt!244576 () SeekEntryResult!4623)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33643 (_ BitVec 32)) SeekEntryResult!4623)

(assert (=> b!530581 (= lt!244576 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530580 () Bool)

(declare-fun res!326428 () Bool)

(assert (=> b!530580 (=> (not res!326428) (not e!309050))))

(assert (=> b!530580 (= res!326428 (validKeyInArray!0 (select (arr!16168 a!3154) j!147)))))

(declare-fun res!326429 () Bool)

(assert (=> start!48208 (=> (not res!326429) (not e!309050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48208 (= res!326429 (validMask!0 mask!3216))))

(assert (=> start!48208 e!309050))

(assert (=> start!48208 true))

(declare-fun array_inv!12051 (array!33643) Bool)

(assert (=> start!48208 (array_inv!12051 a!3154)))

(assert (= (and start!48208 res!326429) b!530578))

(assert (= (and b!530578 res!326425) b!530580))

(assert (= (and b!530580 res!326428) b!530577))

(assert (= (and b!530577 res!326426) b!530579))

(assert (= (and b!530579 res!326427) b!530581))

(declare-fun m!510641 () Bool)

(assert (=> b!530579 m!510641))

(declare-fun m!510643 () Bool)

(assert (=> start!48208 m!510643))

(declare-fun m!510645 () Bool)

(assert (=> start!48208 m!510645))

(declare-fun m!510647 () Bool)

(assert (=> b!530580 m!510647))

(assert (=> b!530580 m!510647))

(declare-fun m!510649 () Bool)

(assert (=> b!530580 m!510649))

(declare-fun m!510651 () Bool)

(assert (=> b!530581 m!510651))

(declare-fun m!510653 () Bool)

(assert (=> b!530577 m!510653))

(push 1)

(assert (not b!530577))

(assert (not b!530580))

(assert (not start!48208))

(assert (not b!530581))

(assert (not b!530579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

