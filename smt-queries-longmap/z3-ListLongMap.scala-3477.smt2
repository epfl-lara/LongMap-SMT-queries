; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48206 () Bool)

(assert start!48206)

(declare-fun res!326449 () Bool)

(declare-fun e!309182 () Bool)

(assert (=> start!48206 (=> (not res!326449) (not e!309182))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48206 (= res!326449 (validMask!0 mask!3216))))

(assert (=> start!48206 e!309182))

(assert (=> start!48206 true))

(declare-datatypes ((array!33631 0))(
  ( (array!33632 (arr!16162 (Array (_ BitVec 32) (_ BitVec 64))) (size!16526 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33631)

(declare-fun array_inv!11958 (array!33631) Bool)

(assert (=> start!48206 (array_inv!11958 a!3154)))

(declare-fun b!530743 () Bool)

(declare-fun res!326451 () Bool)

(assert (=> b!530743 (=> (not res!326451) (not e!309182))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530743 (= res!326451 (validKeyInArray!0 (select (arr!16162 a!3154) j!147)))))

(declare-fun b!530744 () Bool)

(declare-fun res!326453 () Bool)

(assert (=> b!530744 (=> (not res!326453) (not e!309182))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530744 (= res!326453 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530745 () Bool)

(assert (=> b!530745 (= e!309182 false)))

(declare-datatypes ((SeekEntryResult!4620 0))(
  ( (MissingZero!4620 (index!20704 (_ BitVec 32))) (Found!4620 (index!20705 (_ BitVec 32))) (Intermediate!4620 (undefined!5432 Bool) (index!20706 (_ BitVec 32)) (x!49690 (_ BitVec 32))) (Undefined!4620) (MissingVacant!4620 (index!20707 (_ BitVec 32))) )
))
(declare-fun lt!244789 () SeekEntryResult!4620)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33631 (_ BitVec 32)) SeekEntryResult!4620)

(assert (=> b!530745 (= lt!244789 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530746 () Bool)

(declare-fun res!326450 () Bool)

(assert (=> b!530746 (=> (not res!326450) (not e!309182))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530746 (= res!326450 (and (= (size!16526 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16526 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16526 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530747 () Bool)

(declare-fun res!326452 () Bool)

(assert (=> b!530747 (=> (not res!326452) (not e!309182))))

(assert (=> b!530747 (= res!326452 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48206 res!326449) b!530746))

(assert (= (and b!530746 res!326450) b!530743))

(assert (= (and b!530743 res!326451) b!530747))

(assert (= (and b!530747 res!326452) b!530744))

(assert (= (and b!530744 res!326453) b!530745))

(declare-fun m!511295 () Bool)

(assert (=> b!530745 m!511295))

(declare-fun m!511297 () Bool)

(assert (=> start!48206 m!511297))

(declare-fun m!511299 () Bool)

(assert (=> start!48206 m!511299))

(declare-fun m!511301 () Bool)

(assert (=> b!530747 m!511301))

(declare-fun m!511303 () Bool)

(assert (=> b!530744 m!511303))

(declare-fun m!511305 () Bool)

(assert (=> b!530743 m!511305))

(assert (=> b!530743 m!511305))

(declare-fun m!511307 () Bool)

(assert (=> b!530743 m!511307))

(check-sat (not b!530745) (not start!48206) (not b!530747) (not b!530744) (not b!530743))
