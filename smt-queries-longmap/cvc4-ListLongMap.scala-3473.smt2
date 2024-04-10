; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48184 () Bool)

(assert start!48184)

(declare-fun b!530569 () Bool)

(declare-fun res!326277 () Bool)

(declare-fun e!309117 () Bool)

(assert (=> b!530569 (=> (not res!326277) (not e!309117))))

(declare-datatypes ((array!33609 0))(
  ( (array!33610 (arr!16151 (Array (_ BitVec 32) (_ BitVec 64))) (size!16515 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33609)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530569 (= res!326277 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530570 () Bool)

(assert (=> b!530570 (= e!309117 false)))

(declare-datatypes ((SeekEntryResult!4609 0))(
  ( (MissingZero!4609 (index!20660 (_ BitVec 32))) (Found!4609 (index!20661 (_ BitVec 32))) (Intermediate!4609 (undefined!5421 Bool) (index!20662 (_ BitVec 32)) (x!49647 (_ BitVec 32))) (Undefined!4609) (MissingVacant!4609 (index!20663 (_ BitVec 32))) )
))
(declare-fun lt!244765 () SeekEntryResult!4609)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33609 (_ BitVec 32)) SeekEntryResult!4609)

(assert (=> b!530570 (= lt!244765 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530571 () Bool)

(declare-fun res!326276 () Bool)

(assert (=> b!530571 (=> (not res!326276) (not e!309117))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530571 (= res!326276 (validKeyInArray!0 (select (arr!16151 a!3154) j!147)))))

(declare-fun res!326275 () Bool)

(assert (=> start!48184 (=> (not res!326275) (not e!309117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48184 (= res!326275 (validMask!0 mask!3216))))

(assert (=> start!48184 e!309117))

(assert (=> start!48184 true))

(declare-fun array_inv!11947 (array!33609) Bool)

(assert (=> start!48184 (array_inv!11947 a!3154)))

(declare-fun b!530572 () Bool)

(declare-fun res!326279 () Bool)

(assert (=> b!530572 (=> (not res!326279) (not e!309117))))

(assert (=> b!530572 (= res!326279 (validKeyInArray!0 k!1998))))

(declare-fun b!530573 () Bool)

(declare-fun res!326278 () Bool)

(assert (=> b!530573 (=> (not res!326278) (not e!309117))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530573 (= res!326278 (and (= (size!16515 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16515 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16515 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48184 res!326275) b!530573))

(assert (= (and b!530573 res!326278) b!530571))

(assert (= (and b!530571 res!326276) b!530572))

(assert (= (and b!530572 res!326279) b!530569))

(assert (= (and b!530569 res!326277) b!530570))

(declare-fun m!511141 () Bool)

(assert (=> b!530572 m!511141))

(declare-fun m!511143 () Bool)

(assert (=> b!530570 m!511143))

(declare-fun m!511145 () Bool)

(assert (=> b!530569 m!511145))

(declare-fun m!511147 () Bool)

(assert (=> b!530571 m!511147))

(assert (=> b!530571 m!511147))

(declare-fun m!511149 () Bool)

(assert (=> b!530571 m!511149))

(declare-fun m!511151 () Bool)

(assert (=> start!48184 m!511151))

(declare-fun m!511153 () Bool)

(assert (=> start!48184 m!511153))

(push 1)

(assert (not b!530570))

(assert (not b!530571))

(assert (not start!48184))

(assert (not b!530569))

(assert (not b!530572))

(check-sat)

(pop 1)

