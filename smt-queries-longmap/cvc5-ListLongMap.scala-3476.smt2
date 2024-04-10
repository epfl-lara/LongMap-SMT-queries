; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48198 () Bool)

(assert start!48198)

(declare-fun b!530683 () Bool)

(declare-fun res!326389 () Bool)

(declare-fun e!309159 () Bool)

(assert (=> b!530683 (=> (not res!326389) (not e!309159))))

(declare-datatypes ((array!33623 0))(
  ( (array!33624 (arr!16158 (Array (_ BitVec 32) (_ BitVec 64))) (size!16522 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33623)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530683 (= res!326389 (validKeyInArray!0 (select (arr!16158 a!3154) j!147)))))

(declare-fun b!530684 () Bool)

(declare-fun res!326392 () Bool)

(assert (=> b!530684 (=> (not res!326392) (not e!309159))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530684 (= res!326392 (validKeyInArray!0 k!1998))))

(declare-fun res!326390 () Bool)

(assert (=> start!48198 (=> (not res!326390) (not e!309159))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48198 (= res!326390 (validMask!0 mask!3216))))

(assert (=> start!48198 e!309159))

(assert (=> start!48198 true))

(declare-fun array_inv!11954 (array!33623) Bool)

(assert (=> start!48198 (array_inv!11954 a!3154)))

(declare-fun b!530685 () Bool)

(declare-fun res!326393 () Bool)

(assert (=> b!530685 (=> (not res!326393) (not e!309159))))

(declare-fun arrayContainsKey!0 (array!33623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530685 (= res!326393 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530686 () Bool)

(declare-fun res!326391 () Bool)

(assert (=> b!530686 (=> (not res!326391) (not e!309159))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530686 (= res!326391 (and (= (size!16522 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16522 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16522 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530687 () Bool)

(assert (=> b!530687 (= e!309159 false)))

(declare-datatypes ((SeekEntryResult!4616 0))(
  ( (MissingZero!4616 (index!20688 (_ BitVec 32))) (Found!4616 (index!20689 (_ BitVec 32))) (Intermediate!4616 (undefined!5428 Bool) (index!20690 (_ BitVec 32)) (x!49678 (_ BitVec 32))) (Undefined!4616) (MissingVacant!4616 (index!20691 (_ BitVec 32))) )
))
(declare-fun lt!244777 () SeekEntryResult!4616)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33623 (_ BitVec 32)) SeekEntryResult!4616)

(assert (=> b!530687 (= lt!244777 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48198 res!326390) b!530686))

(assert (= (and b!530686 res!326391) b!530683))

(assert (= (and b!530683 res!326389) b!530684))

(assert (= (and b!530684 res!326392) b!530685))

(assert (= (and b!530685 res!326393) b!530687))

(declare-fun m!511239 () Bool)

(assert (=> b!530687 m!511239))

(declare-fun m!511241 () Bool)

(assert (=> b!530683 m!511241))

(assert (=> b!530683 m!511241))

(declare-fun m!511243 () Bool)

(assert (=> b!530683 m!511243))

(declare-fun m!511245 () Bool)

(assert (=> b!530684 m!511245))

(declare-fun m!511247 () Bool)

(assert (=> start!48198 m!511247))

(declare-fun m!511249 () Bool)

(assert (=> start!48198 m!511249))

(declare-fun m!511251 () Bool)

(assert (=> b!530685 m!511251))

(push 1)

(assert (not b!530687))

(assert (not b!530683))

(assert (not b!530685))

(assert (not start!48198))

(assert (not b!530684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

