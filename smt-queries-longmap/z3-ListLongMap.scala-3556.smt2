; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48908 () Bool)

(assert start!48908)

(declare-fun b!539057 () Bool)

(declare-fun res!334267 () Bool)

(declare-fun e!312543 () Bool)

(assert (=> b!539057 (=> (not res!334267) (not e!312543))))

(declare-datatypes ((array!34120 0))(
  ( (array!34121 (arr!16399 (Array (_ BitVec 32) (_ BitVec 64))) (size!16763 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34120)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539057 (= res!334267 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539058 () Bool)

(declare-fun res!334266 () Bool)

(assert (=> b!539058 (=> (not res!334266) (not e!312543))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539058 (= res!334266 (and (= (size!16763 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16763 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16763 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539059 () Bool)

(declare-fun res!334262 () Bool)

(assert (=> b!539059 (=> (not res!334262) (not e!312543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539059 (= res!334262 (validKeyInArray!0 (select (arr!16399 a!3154) j!147)))))

(declare-fun b!539061 () Bool)

(declare-fun e!312541 () Bool)

(assert (=> b!539061 (= e!312541 false)))

(declare-fun lt!247056 () Bool)

(declare-datatypes ((List!10518 0))(
  ( (Nil!10515) (Cons!10514 (h!11457 (_ BitVec 64)) (t!16746 List!10518)) )
))
(declare-fun arrayNoDuplicates!0 (array!34120 (_ BitVec 32) List!10518) Bool)

(assert (=> b!539061 (= lt!247056 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10515))))

(declare-fun b!539062 () Bool)

(declare-fun res!334268 () Bool)

(assert (=> b!539062 (=> (not res!334268) (not e!312541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34120 (_ BitVec 32)) Bool)

(assert (=> b!539062 (= res!334268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539063 () Bool)

(declare-fun res!334265 () Bool)

(assert (=> b!539063 (=> (not res!334265) (not e!312543))))

(assert (=> b!539063 (= res!334265 (validKeyInArray!0 k0!1998))))

(declare-fun res!334263 () Bool)

(assert (=> start!48908 (=> (not res!334263) (not e!312543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48908 (= res!334263 (validMask!0 mask!3216))))

(assert (=> start!48908 e!312543))

(assert (=> start!48908 true))

(declare-fun array_inv!12195 (array!34120) Bool)

(assert (=> start!48908 (array_inv!12195 a!3154)))

(declare-fun b!539060 () Bool)

(assert (=> b!539060 (= e!312543 e!312541)))

(declare-fun res!334264 () Bool)

(assert (=> b!539060 (=> (not res!334264) (not e!312541))))

(declare-datatypes ((SeekEntryResult!4857 0))(
  ( (MissingZero!4857 (index!21652 (_ BitVec 32))) (Found!4857 (index!21653 (_ BitVec 32))) (Intermediate!4857 (undefined!5669 Bool) (index!21654 (_ BitVec 32)) (x!50568 (_ BitVec 32))) (Undefined!4857) (MissingVacant!4857 (index!21655 (_ BitVec 32))) )
))
(declare-fun lt!247057 () SeekEntryResult!4857)

(assert (=> b!539060 (= res!334264 (or (= lt!247057 (MissingZero!4857 i!1153)) (= lt!247057 (MissingVacant!4857 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34120 (_ BitVec 32)) SeekEntryResult!4857)

(assert (=> b!539060 (= lt!247057 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48908 res!334263) b!539058))

(assert (= (and b!539058 res!334266) b!539059))

(assert (= (and b!539059 res!334262) b!539063))

(assert (= (and b!539063 res!334265) b!539057))

(assert (= (and b!539057 res!334267) b!539060))

(assert (= (and b!539060 res!334264) b!539062))

(assert (= (and b!539062 res!334268) b!539061))

(declare-fun m!518157 () Bool)

(assert (=> start!48908 m!518157))

(declare-fun m!518159 () Bool)

(assert (=> start!48908 m!518159))

(declare-fun m!518161 () Bool)

(assert (=> b!539060 m!518161))

(declare-fun m!518163 () Bool)

(assert (=> b!539061 m!518163))

(declare-fun m!518165 () Bool)

(assert (=> b!539057 m!518165))

(declare-fun m!518167 () Bool)

(assert (=> b!539063 m!518167))

(declare-fun m!518169 () Bool)

(assert (=> b!539062 m!518169))

(declare-fun m!518171 () Bool)

(assert (=> b!539059 m!518171))

(assert (=> b!539059 m!518171))

(declare-fun m!518173 () Bool)

(assert (=> b!539059 m!518173))

(check-sat (not b!539063) (not b!539061) (not b!539059) (not start!48908) (not b!539057) (not b!539060) (not b!539062))
(check-sat)
