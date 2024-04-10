; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48188 () Bool)

(assert start!48188)

(declare-fun b!530604 () Bool)

(declare-fun e!309128 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!530604 (= e!309128 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530605 () Bool)

(declare-fun res!326310 () Bool)

(assert (=> b!530605 (=> (not res!326310) (not e!309128))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530605 (= res!326310 (validKeyInArray!0 k0!1998))))

(declare-fun res!326314 () Bool)

(assert (=> start!48188 (=> (not res!326314) (not e!309128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48188 (= res!326314 (validMask!0 mask!3216))))

(assert (=> start!48188 e!309128))

(assert (=> start!48188 true))

(declare-datatypes ((array!33613 0))(
  ( (array!33614 (arr!16153 (Array (_ BitVec 32) (_ BitVec 64))) (size!16517 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33613)

(declare-fun array_inv!11949 (array!33613) Bool)

(assert (=> start!48188 (array_inv!11949 a!3154)))

(declare-fun b!530606 () Bool)

(declare-fun res!326315 () Bool)

(assert (=> b!530606 (=> (not res!326315) (not e!309128))))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4611 0))(
  ( (MissingZero!4611 (index!20668 (_ BitVec 32))) (Found!4611 (index!20669 (_ BitVec 32))) (Intermediate!4611 (undefined!5423 Bool) (index!20670 (_ BitVec 32)) (x!49657 (_ BitVec 32))) (Undefined!4611) (MissingVacant!4611 (index!20671 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33613 (_ BitVec 32)) SeekEntryResult!4611)

(assert (=> b!530606 (= res!326315 (not (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) (MissingZero!4611 i!1153))))))

(declare-fun b!530607 () Bool)

(declare-fun res!326312 () Bool)

(assert (=> b!530607 (=> (not res!326312) (not e!309128))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530607 (= res!326312 (validKeyInArray!0 (select (arr!16153 a!3154) j!147)))))

(declare-fun b!530608 () Bool)

(declare-fun res!326313 () Bool)

(assert (=> b!530608 (=> (not res!326313) (not e!309128))))

(assert (=> b!530608 (= res!326313 (and (= (size!16517 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16517 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16517 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530609 () Bool)

(declare-fun res!326311 () Bool)

(assert (=> b!530609 (=> (not res!326311) (not e!309128))))

(declare-fun arrayContainsKey!0 (array!33613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530609 (= res!326311 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48188 res!326314) b!530608))

(assert (= (and b!530608 res!326313) b!530607))

(assert (= (and b!530607 res!326312) b!530605))

(assert (= (and b!530605 res!326310) b!530609))

(assert (= (and b!530609 res!326311) b!530606))

(assert (= (and b!530606 res!326315) b!530604))

(declare-fun m!511169 () Bool)

(assert (=> b!530609 m!511169))

(declare-fun m!511171 () Bool)

(assert (=> b!530605 m!511171))

(declare-fun m!511173 () Bool)

(assert (=> b!530607 m!511173))

(assert (=> b!530607 m!511173))

(declare-fun m!511175 () Bool)

(assert (=> b!530607 m!511175))

(declare-fun m!511177 () Bool)

(assert (=> start!48188 m!511177))

(declare-fun m!511179 () Bool)

(assert (=> start!48188 m!511179))

(declare-fun m!511181 () Bool)

(assert (=> b!530606 m!511181))

(check-sat (not b!530606) (not start!48188) (not b!530605) (not b!530609) (not b!530607))
(check-sat)
