; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48910 () Bool)

(assert start!48910)

(declare-fun b!539078 () Bool)

(declare-fun res!334283 () Bool)

(declare-fun e!312551 () Bool)

(assert (=> b!539078 (=> (not res!334283) (not e!312551))))

(declare-datatypes ((array!34122 0))(
  ( (array!34123 (arr!16400 (Array (_ BitVec 32) (_ BitVec 64))) (size!16764 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34122)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34122 (_ BitVec 32)) Bool)

(assert (=> b!539078 (= res!334283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539079 () Bool)

(declare-fun res!334284 () Bool)

(declare-fun e!312552 () Bool)

(assert (=> b!539079 (=> (not res!334284) (not e!312552))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539079 (= res!334284 (validKeyInArray!0 (select (arr!16400 a!3154) j!147)))))

(declare-fun res!334287 () Bool)

(assert (=> start!48910 (=> (not res!334287) (not e!312552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48910 (= res!334287 (validMask!0 mask!3216))))

(assert (=> start!48910 e!312552))

(assert (=> start!48910 true))

(declare-fun array_inv!12196 (array!34122) Bool)

(assert (=> start!48910 (array_inv!12196 a!3154)))

(declare-fun b!539080 () Bool)

(assert (=> b!539080 (= e!312551 false)))

(declare-fun lt!247062 () Bool)

(declare-datatypes ((List!10519 0))(
  ( (Nil!10516) (Cons!10515 (h!11458 (_ BitVec 64)) (t!16747 List!10519)) )
))
(declare-fun arrayNoDuplicates!0 (array!34122 (_ BitVec 32) List!10519) Bool)

(assert (=> b!539080 (= lt!247062 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10516))))

(declare-fun b!539081 () Bool)

(declare-fun res!334285 () Bool)

(assert (=> b!539081 (=> (not res!334285) (not e!312552))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!539081 (= res!334285 (validKeyInArray!0 k!1998))))

(declare-fun b!539082 () Bool)

(declare-fun res!334288 () Bool)

(assert (=> b!539082 (=> (not res!334288) (not e!312552))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539082 (= res!334288 (and (= (size!16764 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16764 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16764 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539083 () Bool)

(assert (=> b!539083 (= e!312552 e!312551)))

(declare-fun res!334289 () Bool)

(assert (=> b!539083 (=> (not res!334289) (not e!312551))))

(declare-datatypes ((SeekEntryResult!4858 0))(
  ( (MissingZero!4858 (index!21656 (_ BitVec 32))) (Found!4858 (index!21657 (_ BitVec 32))) (Intermediate!4858 (undefined!5670 Bool) (index!21658 (_ BitVec 32)) (x!50569 (_ BitVec 32))) (Undefined!4858) (MissingVacant!4858 (index!21659 (_ BitVec 32))) )
))
(declare-fun lt!247063 () SeekEntryResult!4858)

(assert (=> b!539083 (= res!334289 (or (= lt!247063 (MissingZero!4858 i!1153)) (= lt!247063 (MissingVacant!4858 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34122 (_ BitVec 32)) SeekEntryResult!4858)

(assert (=> b!539083 (= lt!247063 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539084 () Bool)

(declare-fun res!334286 () Bool)

(assert (=> b!539084 (=> (not res!334286) (not e!312552))))

(declare-fun arrayContainsKey!0 (array!34122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539084 (= res!334286 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48910 res!334287) b!539082))

(assert (= (and b!539082 res!334288) b!539079))

(assert (= (and b!539079 res!334284) b!539081))

(assert (= (and b!539081 res!334285) b!539084))

(assert (= (and b!539084 res!334286) b!539083))

(assert (= (and b!539083 res!334289) b!539078))

(assert (= (and b!539078 res!334283) b!539080))

(declare-fun m!518175 () Bool)

(assert (=> b!539081 m!518175))

(declare-fun m!518177 () Bool)

(assert (=> b!539079 m!518177))

(assert (=> b!539079 m!518177))

(declare-fun m!518179 () Bool)

(assert (=> b!539079 m!518179))

(declare-fun m!518181 () Bool)

(assert (=> b!539083 m!518181))

(declare-fun m!518183 () Bool)

(assert (=> b!539080 m!518183))

(declare-fun m!518185 () Bool)

(assert (=> b!539084 m!518185))

(declare-fun m!518187 () Bool)

(assert (=> b!539078 m!518187))

(declare-fun m!518189 () Bool)

(assert (=> start!48910 m!518189))

(declare-fun m!518191 () Bool)

(assert (=> start!48910 m!518191))

(push 1)

(assert (not b!539080))

(assert (not b!539079))

(assert (not b!539078))

(assert (not b!539081))

(assert (not b!539084))

