; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48906 () Bool)

(assert start!48906)

(declare-fun b!539036 () Bool)

(declare-fun res!334245 () Bool)

(declare-fun e!312532 () Bool)

(assert (=> b!539036 (=> (not res!334245) (not e!312532))))

(declare-datatypes ((array!34118 0))(
  ( (array!34119 (arr!16398 (Array (_ BitVec 32) (_ BitVec 64))) (size!16762 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34118)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34118 (_ BitVec 32)) Bool)

(assert (=> b!539036 (= res!334245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334247 () Bool)

(declare-fun e!312533 () Bool)

(assert (=> start!48906 (=> (not res!334247) (not e!312533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48906 (= res!334247 (validMask!0 mask!3216))))

(assert (=> start!48906 e!312533))

(assert (=> start!48906 true))

(declare-fun array_inv!12194 (array!34118) Bool)

(assert (=> start!48906 (array_inv!12194 a!3154)))

(declare-fun b!539037 () Bool)

(declare-fun res!334243 () Bool)

(assert (=> b!539037 (=> (not res!334243) (not e!312533))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539037 (= res!334243 (validKeyInArray!0 k!1998))))

(declare-fun b!539038 () Bool)

(declare-fun res!334241 () Bool)

(assert (=> b!539038 (=> (not res!334241) (not e!312533))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539038 (= res!334241 (and (= (size!16762 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16762 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16762 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539039 () Bool)

(assert (=> b!539039 (= e!312533 e!312532)))

(declare-fun res!334242 () Bool)

(assert (=> b!539039 (=> (not res!334242) (not e!312532))))

(declare-datatypes ((SeekEntryResult!4856 0))(
  ( (MissingZero!4856 (index!21648 (_ BitVec 32))) (Found!4856 (index!21649 (_ BitVec 32))) (Intermediate!4856 (undefined!5668 Bool) (index!21650 (_ BitVec 32)) (x!50567 (_ BitVec 32))) (Undefined!4856) (MissingVacant!4856 (index!21651 (_ BitVec 32))) )
))
(declare-fun lt!247051 () SeekEntryResult!4856)

(assert (=> b!539039 (= res!334242 (or (= lt!247051 (MissingZero!4856 i!1153)) (= lt!247051 (MissingVacant!4856 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34118 (_ BitVec 32)) SeekEntryResult!4856)

(assert (=> b!539039 (= lt!247051 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539040 () Bool)

(assert (=> b!539040 (= e!312532 false)))

(declare-fun lt!247050 () Bool)

(declare-datatypes ((List!10517 0))(
  ( (Nil!10514) (Cons!10513 (h!11456 (_ BitVec 64)) (t!16745 List!10517)) )
))
(declare-fun arrayNoDuplicates!0 (array!34118 (_ BitVec 32) List!10517) Bool)

(assert (=> b!539040 (= lt!247050 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10514))))

(declare-fun b!539041 () Bool)

(declare-fun res!334244 () Bool)

(assert (=> b!539041 (=> (not res!334244) (not e!312533))))

(assert (=> b!539041 (= res!334244 (validKeyInArray!0 (select (arr!16398 a!3154) j!147)))))

(declare-fun b!539042 () Bool)

(declare-fun res!334246 () Bool)

(assert (=> b!539042 (=> (not res!334246) (not e!312533))))

(declare-fun arrayContainsKey!0 (array!34118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539042 (= res!334246 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48906 res!334247) b!539038))

(assert (= (and b!539038 res!334241) b!539041))

(assert (= (and b!539041 res!334244) b!539037))

(assert (= (and b!539037 res!334243) b!539042))

(assert (= (and b!539042 res!334246) b!539039))

(assert (= (and b!539039 res!334242) b!539036))

(assert (= (and b!539036 res!334245) b!539040))

(declare-fun m!518139 () Bool)

(assert (=> b!539041 m!518139))

(assert (=> b!539041 m!518139))

(declare-fun m!518141 () Bool)

(assert (=> b!539041 m!518141))

(declare-fun m!518143 () Bool)

(assert (=> b!539040 m!518143))

(declare-fun m!518145 () Bool)

(assert (=> b!539037 m!518145))

(declare-fun m!518147 () Bool)

(assert (=> start!48906 m!518147))

(declare-fun m!518149 () Bool)

(assert (=> start!48906 m!518149))

(declare-fun m!518151 () Bool)

(assert (=> b!539036 m!518151))

(declare-fun m!518153 () Bool)

(assert (=> b!539039 m!518153))

(declare-fun m!518155 () Bool)

(assert (=> b!539042 m!518155))

(push 1)

