; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48196 () Bool)

(assert start!48196)

(declare-fun b!530487 () Bool)

(declare-fun res!326336 () Bool)

(declare-fun e!309015 () Bool)

(assert (=> b!530487 (=> (not res!326336) (not e!309015))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33631 0))(
  ( (array!33632 (arr!16162 (Array (_ BitVec 32) (_ BitVec 64))) (size!16527 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33631)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530487 (= res!326336 (and (= (size!16527 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16527 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16527 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326338 () Bool)

(assert (=> start!48196 (=> (not res!326338) (not e!309015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48196 (= res!326338 (validMask!0 mask!3216))))

(assert (=> start!48196 e!309015))

(assert (=> start!48196 true))

(declare-fun array_inv!12045 (array!33631) Bool)

(assert (=> start!48196 (array_inv!12045 a!3154)))

(declare-fun b!530488 () Bool)

(assert (=> b!530488 (= e!309015 false)))

(declare-datatypes ((SeekEntryResult!4617 0))(
  ( (MissingZero!4617 (index!20692 (_ BitVec 32))) (Found!4617 (index!20693 (_ BitVec 32))) (Intermediate!4617 (undefined!5429 Bool) (index!20694 (_ BitVec 32)) (x!49682 (_ BitVec 32))) (Undefined!4617) (MissingVacant!4617 (index!20695 (_ BitVec 32))) )
))
(declare-fun lt!244558 () SeekEntryResult!4617)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33631 (_ BitVec 32)) SeekEntryResult!4617)

(assert (=> b!530488 (= lt!244558 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530489 () Bool)

(declare-fun res!326335 () Bool)

(assert (=> b!530489 (=> (not res!326335) (not e!309015))))

(declare-fun arrayContainsKey!0 (array!33631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530489 (= res!326335 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530490 () Bool)

(declare-fun res!326339 () Bool)

(assert (=> b!530490 (=> (not res!326339) (not e!309015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530490 (= res!326339 (validKeyInArray!0 k!1998))))

(declare-fun b!530491 () Bool)

(declare-fun res!326337 () Bool)

(assert (=> b!530491 (=> (not res!326337) (not e!309015))))

(assert (=> b!530491 (= res!326337 (validKeyInArray!0 (select (arr!16162 a!3154) j!147)))))

(assert (= (and start!48196 res!326338) b!530487))

(assert (= (and b!530487 res!326336) b!530491))

(assert (= (and b!530491 res!326337) b!530490))

(assert (= (and b!530490 res!326339) b!530489))

(assert (= (and b!530489 res!326335) b!530488))

(declare-fun m!510557 () Bool)

(assert (=> b!530490 m!510557))

(declare-fun m!510559 () Bool)

(assert (=> b!530489 m!510559))

(declare-fun m!510561 () Bool)

(assert (=> start!48196 m!510561))

(declare-fun m!510563 () Bool)

(assert (=> start!48196 m!510563))

(declare-fun m!510565 () Bool)

(assert (=> b!530488 m!510565))

(declare-fun m!510567 () Bool)

(assert (=> b!530491 m!510567))

(assert (=> b!530491 m!510567))

(declare-fun m!510569 () Bool)

(assert (=> b!530491 m!510569))

(push 1)

(assert (not b!530491))

(assert (not b!530489))

(assert (not b!530488))

(assert (not b!530490))

(assert (not start!48196))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

