; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48904 () Bool)

(assert start!48904)

(declare-fun b!539015 () Bool)

(declare-fun res!334225 () Bool)

(declare-fun e!312524 () Bool)

(assert (=> b!539015 (=> (not res!334225) (not e!312524))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!34116 0))(
  ( (array!34117 (arr!16397 (Array (_ BitVec 32) (_ BitVec 64))) (size!16761 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34116)

(assert (=> b!539015 (= res!334225 (and (= (size!16761 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16761 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16761 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539016 () Bool)

(declare-fun res!334220 () Bool)

(declare-fun e!312525 () Bool)

(assert (=> b!539016 (=> (not res!334220) (not e!312525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34116 (_ BitVec 32)) Bool)

(assert (=> b!539016 (= res!334220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539017 () Bool)

(assert (=> b!539017 (= e!312524 e!312525)))

(declare-fun res!334223 () Bool)

(assert (=> b!539017 (=> (not res!334223) (not e!312525))))

(declare-datatypes ((SeekEntryResult!4855 0))(
  ( (MissingZero!4855 (index!21644 (_ BitVec 32))) (Found!4855 (index!21645 (_ BitVec 32))) (Intermediate!4855 (undefined!5667 Bool) (index!21646 (_ BitVec 32)) (x!50558 (_ BitVec 32))) (Undefined!4855) (MissingVacant!4855 (index!21647 (_ BitVec 32))) )
))
(declare-fun lt!247044 () SeekEntryResult!4855)

(assert (=> b!539017 (= res!334223 (or (= lt!247044 (MissingZero!4855 i!1153)) (= lt!247044 (MissingVacant!4855 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34116 (_ BitVec 32)) SeekEntryResult!4855)

(assert (=> b!539017 (= lt!247044 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539018 () Bool)

(declare-fun res!334224 () Bool)

(assert (=> b!539018 (=> (not res!334224) (not e!312524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539018 (= res!334224 (validKeyInArray!0 (select (arr!16397 a!3154) j!147)))))

(declare-fun res!334226 () Bool)

(assert (=> start!48904 (=> (not res!334226) (not e!312524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48904 (= res!334226 (validMask!0 mask!3216))))

(assert (=> start!48904 e!312524))

(assert (=> start!48904 true))

(declare-fun array_inv!12193 (array!34116) Bool)

(assert (=> start!48904 (array_inv!12193 a!3154)))

(declare-fun b!539019 () Bool)

(declare-fun res!334222 () Bool)

(assert (=> b!539019 (=> (not res!334222) (not e!312524))))

(declare-fun arrayContainsKey!0 (array!34116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539019 (= res!334222 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539020 () Bool)

(assert (=> b!539020 (= e!312525 false)))

(declare-fun lt!247045 () Bool)

(declare-datatypes ((List!10516 0))(
  ( (Nil!10513) (Cons!10512 (h!11455 (_ BitVec 64)) (t!16744 List!10516)) )
))
(declare-fun arrayNoDuplicates!0 (array!34116 (_ BitVec 32) List!10516) Bool)

(assert (=> b!539020 (= lt!247045 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10513))))

(declare-fun b!539021 () Bool)

(declare-fun res!334221 () Bool)

(assert (=> b!539021 (=> (not res!334221) (not e!312524))))

(assert (=> b!539021 (= res!334221 (validKeyInArray!0 k!1998))))

(assert (= (and start!48904 res!334226) b!539015))

(assert (= (and b!539015 res!334225) b!539018))

(assert (= (and b!539018 res!334224) b!539021))

(assert (= (and b!539021 res!334221) b!539019))

(assert (= (and b!539019 res!334222) b!539017))

(assert (= (and b!539017 res!334223) b!539016))

(assert (= (and b!539016 res!334220) b!539020))

(declare-fun m!518121 () Bool)

(assert (=> b!539019 m!518121))

(declare-fun m!518123 () Bool)

(assert (=> b!539020 m!518123))

(declare-fun m!518125 () Bool)

(assert (=> b!539016 m!518125))

(declare-fun m!518127 () Bool)

(assert (=> start!48904 m!518127))

(declare-fun m!518129 () Bool)

(assert (=> start!48904 m!518129))

(declare-fun m!518131 () Bool)

(assert (=> b!539017 m!518131))

(declare-fun m!518133 () Bool)

(assert (=> b!539021 m!518133))

(declare-fun m!518135 () Bool)

(assert (=> b!539018 m!518135))

(assert (=> b!539018 m!518135))

(declare-fun m!518137 () Bool)

(assert (=> b!539018 m!518137))

(push 1)

(assert (not b!539021))

(assert (not b!539018))

(assert (not start!48904))

(assert (not b!539016))

