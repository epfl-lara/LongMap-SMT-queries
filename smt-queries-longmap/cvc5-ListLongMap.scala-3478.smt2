; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48202 () Bool)

(assert start!48202)

(declare-fun b!530532 () Bool)

(declare-fun res!326382 () Bool)

(declare-fun e!309032 () Bool)

(assert (=> b!530532 (=> (not res!326382) (not e!309032))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530532 (= res!326382 (validKeyInArray!0 k!1998))))

(declare-fun b!530533 () Bool)

(declare-fun res!326381 () Bool)

(assert (=> b!530533 (=> (not res!326381) (not e!309032))))

(declare-datatypes ((array!33637 0))(
  ( (array!33638 (arr!16165 (Array (_ BitVec 32) (_ BitVec 64))) (size!16530 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33637)

(declare-fun arrayContainsKey!0 (array!33637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530533 (= res!326381 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530534 () Bool)

(declare-fun res!326383 () Bool)

(assert (=> b!530534 (=> (not res!326383) (not e!309032))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530534 (= res!326383 (validKeyInArray!0 (select (arr!16165 a!3154) j!147)))))

(declare-fun res!326384 () Bool)

(assert (=> start!48202 (=> (not res!326384) (not e!309032))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48202 (= res!326384 (validMask!0 mask!3216))))

(assert (=> start!48202 e!309032))

(assert (=> start!48202 true))

(declare-fun array_inv!12048 (array!33637) Bool)

(assert (=> start!48202 (array_inv!12048 a!3154)))

(declare-fun b!530535 () Bool)

(declare-fun res!326380 () Bool)

(assert (=> b!530535 (=> (not res!326380) (not e!309032))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530535 (= res!326380 (and (= (size!16530 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16530 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16530 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530536 () Bool)

(assert (=> b!530536 (= e!309032 false)))

(declare-datatypes ((SeekEntryResult!4620 0))(
  ( (MissingZero!4620 (index!20704 (_ BitVec 32))) (Found!4620 (index!20705 (_ BitVec 32))) (Intermediate!4620 (undefined!5432 Bool) (index!20706 (_ BitVec 32)) (x!49693 (_ BitVec 32))) (Undefined!4620) (MissingVacant!4620 (index!20707 (_ BitVec 32))) )
))
(declare-fun lt!244567 () SeekEntryResult!4620)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33637 (_ BitVec 32)) SeekEntryResult!4620)

(assert (=> b!530536 (= lt!244567 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48202 res!326384) b!530535))

(assert (= (and b!530535 res!326380) b!530534))

(assert (= (and b!530534 res!326383) b!530532))

(assert (= (and b!530532 res!326382) b!530533))

(assert (= (and b!530533 res!326381) b!530536))

(declare-fun m!510599 () Bool)

(assert (=> b!530532 m!510599))

(declare-fun m!510601 () Bool)

(assert (=> b!530536 m!510601))

(declare-fun m!510603 () Bool)

(assert (=> b!530534 m!510603))

(assert (=> b!530534 m!510603))

(declare-fun m!510605 () Bool)

(assert (=> b!530534 m!510605))

(declare-fun m!510607 () Bool)

(assert (=> start!48202 m!510607))

(declare-fun m!510609 () Bool)

(assert (=> start!48202 m!510609))

(declare-fun m!510611 () Bool)

(assert (=> b!530533 m!510611))

(push 1)

(assert (not b!530534))

(assert (not start!48202))

(assert (not b!530532))

(assert (not b!530533))

(assert (not b!530536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

