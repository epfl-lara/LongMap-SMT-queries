; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48210 () Bool)

(assert start!48210)

(declare-fun res!326483 () Bool)

(declare-fun e!309195 () Bool)

(assert (=> start!48210 (=> (not res!326483) (not e!309195))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48210 (= res!326483 (validMask!0 mask!3216))))

(assert (=> start!48210 e!309195))

(assert (=> start!48210 true))

(declare-datatypes ((array!33635 0))(
  ( (array!33636 (arr!16164 (Array (_ BitVec 32) (_ BitVec 64))) (size!16528 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33635)

(declare-fun array_inv!11960 (array!33635) Bool)

(assert (=> start!48210 (array_inv!11960 a!3154)))

(declare-fun b!530773 () Bool)

(assert (=> b!530773 (= e!309195 false)))

(declare-datatypes ((SeekEntryResult!4622 0))(
  ( (MissingZero!4622 (index!20712 (_ BitVec 32))) (Found!4622 (index!20713 (_ BitVec 32))) (Intermediate!4622 (undefined!5434 Bool) (index!20714 (_ BitVec 32)) (x!49700 (_ BitVec 32))) (Undefined!4622) (MissingVacant!4622 (index!20715 (_ BitVec 32))) )
))
(declare-fun lt!244795 () SeekEntryResult!4622)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33635 (_ BitVec 32)) SeekEntryResult!4622)

(assert (=> b!530773 (= lt!244795 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530774 () Bool)

(declare-fun res!326479 () Bool)

(assert (=> b!530774 (=> (not res!326479) (not e!309195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530774 (= res!326479 (validKeyInArray!0 k!1998))))

(declare-fun b!530775 () Bool)

(declare-fun res!326482 () Bool)

(assert (=> b!530775 (=> (not res!326482) (not e!309195))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530775 (= res!326482 (and (= (size!16528 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16528 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16528 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530776 () Bool)

(declare-fun res!326480 () Bool)

(assert (=> b!530776 (=> (not res!326480) (not e!309195))))

(assert (=> b!530776 (= res!326480 (validKeyInArray!0 (select (arr!16164 a!3154) j!147)))))

(declare-fun b!530777 () Bool)

(declare-fun res!326481 () Bool)

(assert (=> b!530777 (=> (not res!326481) (not e!309195))))

(declare-fun arrayContainsKey!0 (array!33635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530777 (= res!326481 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48210 res!326483) b!530775))

(assert (= (and b!530775 res!326482) b!530776))

(assert (= (and b!530776 res!326480) b!530774))

(assert (= (and b!530774 res!326479) b!530777))

(assert (= (and b!530777 res!326481) b!530773))

(declare-fun m!511323 () Bool)

(assert (=> b!530774 m!511323))

(declare-fun m!511325 () Bool)

(assert (=> b!530773 m!511325))

(declare-fun m!511327 () Bool)

(assert (=> b!530777 m!511327))

(declare-fun m!511329 () Bool)

(assert (=> start!48210 m!511329))

(declare-fun m!511331 () Bool)

(assert (=> start!48210 m!511331))

(declare-fun m!511333 () Bool)

(assert (=> b!530776 m!511333))

(assert (=> b!530776 m!511333))

(declare-fun m!511335 () Bool)

(assert (=> b!530776 m!511335))

(push 1)

(assert (not b!530777))

(assert (not b!530774))

(assert (not b!530773))

(assert (not start!48210))

(assert (not b!530776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

