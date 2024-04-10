; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48928 () Bool)

(assert start!48928)

(declare-fun b!539328 () Bool)

(declare-fun res!334533 () Bool)

(declare-fun e!312632 () Bool)

(assert (=> b!539328 (=> (not res!334533) (not e!312632))))

(declare-datatypes ((array!34140 0))(
  ( (array!34141 (arr!16409 (Array (_ BitVec 32) (_ BitVec 64))) (size!16773 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34140)

(declare-datatypes ((List!10528 0))(
  ( (Nil!10525) (Cons!10524 (h!11467 (_ BitVec 64)) (t!16756 List!10528)) )
))
(declare-fun arrayNoDuplicates!0 (array!34140 (_ BitVec 32) List!10528) Bool)

(assert (=> b!539328 (= res!334533 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10525))))

(declare-fun b!539329 () Bool)

(assert (=> b!539329 (= e!312632 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4867 0))(
  ( (MissingZero!4867 (index!21692 (_ BitVec 32))) (Found!4867 (index!21693 (_ BitVec 32))) (Intermediate!4867 (undefined!5679 Bool) (index!21694 (_ BitVec 32)) (x!50602 (_ BitVec 32))) (Undefined!4867) (MissingVacant!4867 (index!21695 (_ BitVec 32))) )
))
(declare-fun lt!247116 () SeekEntryResult!4867)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34140 (_ BitVec 32)) SeekEntryResult!4867)

(assert (=> b!539329 (= lt!247116 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16409 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539330 () Bool)

(declare-fun e!312631 () Bool)

(assert (=> b!539330 (= e!312631 e!312632)))

(declare-fun res!334535 () Bool)

(assert (=> b!539330 (=> (not res!334535) (not e!312632))))

(declare-fun lt!247117 () SeekEntryResult!4867)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539330 (= res!334535 (or (= lt!247117 (MissingZero!4867 i!1153)) (= lt!247117 (MissingVacant!4867 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34140 (_ BitVec 32)) SeekEntryResult!4867)

(assert (=> b!539330 (= lt!247117 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539331 () Bool)

(declare-fun res!334537 () Bool)

(assert (=> b!539331 (=> (not res!334537) (not e!312631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539331 (= res!334537 (validKeyInArray!0 (select (arr!16409 a!3154) j!147)))))

(declare-fun b!539332 () Bool)

(declare-fun res!334534 () Bool)

(assert (=> b!539332 (=> (not res!334534) (not e!312631))))

(assert (=> b!539332 (= res!334534 (validKeyInArray!0 k!1998))))

(declare-fun res!334540 () Bool)

(assert (=> start!48928 (=> (not res!334540) (not e!312631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48928 (= res!334540 (validMask!0 mask!3216))))

(assert (=> start!48928 e!312631))

(assert (=> start!48928 true))

(declare-fun array_inv!12205 (array!34140) Bool)

(assert (=> start!48928 (array_inv!12205 a!3154)))

(declare-fun b!539333 () Bool)

(declare-fun res!334536 () Bool)

(assert (=> b!539333 (=> (not res!334536) (not e!312632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34140 (_ BitVec 32)) Bool)

(assert (=> b!539333 (= res!334536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539334 () Bool)

(declare-fun res!334541 () Bool)

(assert (=> b!539334 (=> (not res!334541) (not e!312631))))

(declare-fun arrayContainsKey!0 (array!34140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539334 (= res!334541 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539335 () Bool)

(declare-fun res!334538 () Bool)

(assert (=> b!539335 (=> (not res!334538) (not e!312631))))

(assert (=> b!539335 (= res!334538 (and (= (size!16773 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16773 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16773 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539336 () Bool)

(declare-fun res!334539 () Bool)

(assert (=> b!539336 (=> (not res!334539) (not e!312632))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539336 (= res!334539 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16773 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16773 a!3154)) (= (select (arr!16409 a!3154) resIndex!32) (select (arr!16409 a!3154) j!147))))))

(assert (= (and start!48928 res!334540) b!539335))

(assert (= (and b!539335 res!334538) b!539331))

(assert (= (and b!539331 res!334537) b!539332))

(assert (= (and b!539332 res!334534) b!539334))

(assert (= (and b!539334 res!334541) b!539330))

(assert (= (and b!539330 res!334535) b!539333))

(assert (= (and b!539333 res!334536) b!539328))

(assert (= (and b!539328 res!334533) b!539336))

(assert (= (and b!539336 res!334539) b!539329))

(declare-fun m!518375 () Bool)

(assert (=> b!539329 m!518375))

(assert (=> b!539329 m!518375))

(declare-fun m!518377 () Bool)

(assert (=> b!539329 m!518377))

(declare-fun m!518379 () Bool)

(assert (=> b!539332 m!518379))

(declare-fun m!518381 () Bool)

(assert (=> b!539334 m!518381))

(declare-fun m!518383 () Bool)

(assert (=> b!539333 m!518383))

(declare-fun m!518385 () Bool)

(assert (=> b!539330 m!518385))

(declare-fun m!518387 () Bool)

(assert (=> b!539328 m!518387))

(declare-fun m!518389 () Bool)

(assert (=> b!539336 m!518389))

(assert (=> b!539336 m!518375))

(declare-fun m!518391 () Bool)

(assert (=> start!48928 m!518391))

(declare-fun m!518393 () Bool)

(assert (=> start!48928 m!518393))

(assert (=> b!539331 m!518375))

(assert (=> b!539331 m!518375))

(declare-fun m!518395 () Bool)

(assert (=> b!539331 m!518395))

(push 1)

(assert (not start!48928))

(assert (not b!539329))

(assert (not b!539334))

(assert (not b!539331))

(assert (not b!539333))

(assert (not b!539330))

(assert (not b!539332))

(assert (not b!539328))

(check-sat)

