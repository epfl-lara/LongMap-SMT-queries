; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48190 () Bool)

(assert start!48190)

(declare-fun b!530442 () Bool)

(declare-fun res!326291 () Bool)

(declare-fun e!308997 () Bool)

(assert (=> b!530442 (=> (not res!326291) (not e!308997))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530442 (= res!326291 (validKeyInArray!0 k!1998))))

(declare-fun b!530443 () Bool)

(declare-fun res!326290 () Bool)

(assert (=> b!530443 (=> (not res!326290) (not e!308997))))

(declare-datatypes ((array!33625 0))(
  ( (array!33626 (arr!16159 (Array (_ BitVec 32) (_ BitVec 64))) (size!16524 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33625)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530443 (= res!326290 (validKeyInArray!0 (select (arr!16159 a!3154) j!147)))))

(declare-fun res!326292 () Bool)

(assert (=> start!48190 (=> (not res!326292) (not e!308997))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48190 (= res!326292 (validMask!0 mask!3216))))

(assert (=> start!48190 e!308997))

(assert (=> start!48190 true))

(declare-fun array_inv!12042 (array!33625) Bool)

(assert (=> start!48190 (array_inv!12042 a!3154)))

(declare-fun b!530444 () Bool)

(assert (=> b!530444 (= e!308997 false)))

(declare-datatypes ((SeekEntryResult!4614 0))(
  ( (MissingZero!4614 (index!20680 (_ BitVec 32))) (Found!4614 (index!20681 (_ BitVec 32))) (Intermediate!4614 (undefined!5426 Bool) (index!20682 (_ BitVec 32)) (x!49671 (_ BitVec 32))) (Undefined!4614) (MissingVacant!4614 (index!20683 (_ BitVec 32))) )
))
(declare-fun lt!244549 () SeekEntryResult!4614)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33625 (_ BitVec 32)) SeekEntryResult!4614)

(assert (=> b!530444 (= lt!244549 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530445 () Bool)

(declare-fun res!326294 () Bool)

(assert (=> b!530445 (=> (not res!326294) (not e!308997))))

(declare-fun arrayContainsKey!0 (array!33625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530445 (= res!326294 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530446 () Bool)

(declare-fun res!326293 () Bool)

(assert (=> b!530446 (=> (not res!326293) (not e!308997))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530446 (= res!326293 (and (= (size!16524 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16524 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16524 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48190 res!326292) b!530446))

(assert (= (and b!530446 res!326293) b!530443))

(assert (= (and b!530443 res!326290) b!530442))

(assert (= (and b!530442 res!326291) b!530445))

(assert (= (and b!530445 res!326294) b!530444))

(declare-fun m!510515 () Bool)

(assert (=> start!48190 m!510515))

(declare-fun m!510517 () Bool)

(assert (=> start!48190 m!510517))

(declare-fun m!510519 () Bool)

(assert (=> b!530445 m!510519))

(declare-fun m!510521 () Bool)

(assert (=> b!530442 m!510521))

(declare-fun m!510523 () Bool)

(assert (=> b!530443 m!510523))

(assert (=> b!530443 m!510523))

(declare-fun m!510525 () Bool)

(assert (=> b!530443 m!510525))

(declare-fun m!510527 () Bool)

(assert (=> b!530444 m!510527))

(push 1)

(assert (not b!530445))

(assert (not b!530442))

(assert (not start!48190))

(assert (not b!530443))

(assert (not b!530444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

