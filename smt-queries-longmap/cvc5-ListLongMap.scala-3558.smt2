; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48918 () Bool)

(assert start!48918)

(declare-fun b!539186 () Bool)

(declare-fun res!334400 () Bool)

(declare-fun e!312586 () Bool)

(assert (=> b!539186 (=> (not res!334400) (not e!312586))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34130 0))(
  ( (array!34131 (arr!16404 (Array (_ BitVec 32) (_ BitVec 64))) (size!16768 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34130)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4862 0))(
  ( (MissingZero!4862 (index!21672 (_ BitVec 32))) (Found!4862 (index!21673 (_ BitVec 32))) (Intermediate!4862 (undefined!5674 Bool) (index!21674 (_ BitVec 32)) (x!50589 (_ BitVec 32))) (Undefined!4862) (MissingVacant!4862 (index!21675 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34130 (_ BitVec 32)) SeekEntryResult!4862)

(assert (=> b!539186 (= res!334400 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16404 a!3154) j!147) a!3154 mask!3216) (Intermediate!4862 false resIndex!32 resX!32)))))

(declare-fun b!539187 () Bool)

(assert (=> b!539187 (= e!312586 false)))

(declare-fun lt!247086 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539187 (= lt!247086 (toIndex!0 (select (arr!16404 a!3154) j!147) mask!3216))))

(declare-fun b!539188 () Bool)

(declare-fun res!334399 () Bool)

(assert (=> b!539188 (=> (not res!334399) (not e!312586))))

(declare-datatypes ((List!10523 0))(
  ( (Nil!10520) (Cons!10519 (h!11462 (_ BitVec 64)) (t!16751 List!10523)) )
))
(declare-fun arrayNoDuplicates!0 (array!34130 (_ BitVec 32) List!10523) Bool)

(assert (=> b!539188 (= res!334399 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10520))))

(declare-fun b!539189 () Bool)

(declare-fun res!334395 () Bool)

(declare-fun e!312587 () Bool)

(assert (=> b!539189 (=> (not res!334395) (not e!312587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539189 (= res!334395 (validKeyInArray!0 (select (arr!16404 a!3154) j!147)))))

(declare-fun b!539190 () Bool)

(assert (=> b!539190 (= e!312587 e!312586)))

(declare-fun res!334398 () Bool)

(assert (=> b!539190 (=> (not res!334398) (not e!312586))))

(declare-fun lt!247087 () SeekEntryResult!4862)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539190 (= res!334398 (or (= lt!247087 (MissingZero!4862 i!1153)) (= lt!247087 (MissingVacant!4862 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34130 (_ BitVec 32)) SeekEntryResult!4862)

(assert (=> b!539190 (= lt!247087 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539191 () Bool)

(declare-fun res!334392 () Bool)

(assert (=> b!539191 (=> (not res!334392) (not e!312587))))

(declare-fun arrayContainsKey!0 (array!34130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539191 (= res!334392 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539192 () Bool)

(declare-fun res!334393 () Bool)

(assert (=> b!539192 (=> (not res!334393) (not e!312587))))

(assert (=> b!539192 (= res!334393 (validKeyInArray!0 k!1998))))

(declare-fun b!539194 () Bool)

(declare-fun res!334397 () Bool)

(assert (=> b!539194 (=> (not res!334397) (not e!312587))))

(assert (=> b!539194 (= res!334397 (and (= (size!16768 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16768 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16768 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539195 () Bool)

(declare-fun res!334396 () Bool)

(assert (=> b!539195 (=> (not res!334396) (not e!312586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34130 (_ BitVec 32)) Bool)

(assert (=> b!539195 (= res!334396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334391 () Bool)

(assert (=> start!48918 (=> (not res!334391) (not e!312587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48918 (= res!334391 (validMask!0 mask!3216))))

(assert (=> start!48918 e!312587))

(assert (=> start!48918 true))

(declare-fun array_inv!12200 (array!34130) Bool)

(assert (=> start!48918 (array_inv!12200 a!3154)))

(declare-fun b!539193 () Bool)

(declare-fun res!334394 () Bool)

(assert (=> b!539193 (=> (not res!334394) (not e!312586))))

(assert (=> b!539193 (= res!334394 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16768 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16768 a!3154)) (= (select (arr!16404 a!3154) resIndex!32) (select (arr!16404 a!3154) j!147))))))

(assert (= (and start!48918 res!334391) b!539194))

(assert (= (and b!539194 res!334397) b!539189))

(assert (= (and b!539189 res!334395) b!539192))

(assert (= (and b!539192 res!334393) b!539191))

(assert (= (and b!539191 res!334392) b!539190))

(assert (= (and b!539190 res!334398) b!539195))

(assert (= (and b!539195 res!334396) b!539188))

(assert (= (and b!539188 res!334399) b!539193))

(assert (= (and b!539193 res!334394) b!539186))

(assert (= (and b!539186 res!334400) b!539187))

(declare-fun m!518259 () Bool)

(assert (=> b!539189 m!518259))

(assert (=> b!539189 m!518259))

(declare-fun m!518261 () Bool)

(assert (=> b!539189 m!518261))

(declare-fun m!518263 () Bool)

(assert (=> b!539190 m!518263))

(declare-fun m!518265 () Bool)

(assert (=> b!539195 m!518265))

(declare-fun m!518267 () Bool)

(assert (=> b!539191 m!518267))

(declare-fun m!518269 () Bool)

(assert (=> b!539188 m!518269))

(declare-fun m!518271 () Bool)

(assert (=> start!48918 m!518271))

(declare-fun m!518273 () Bool)

(assert (=> start!48918 m!518273))

(assert (=> b!539187 m!518259))

(assert (=> b!539187 m!518259))

(declare-fun m!518275 () Bool)

(assert (=> b!539187 m!518275))

(declare-fun m!518277 () Bool)

(assert (=> b!539193 m!518277))

(assert (=> b!539193 m!518259))

(declare-fun m!518279 () Bool)

(assert (=> b!539192 m!518279))

(assert (=> b!539186 m!518259))

(assert (=> b!539186 m!518259))

(declare-fun m!518281 () Bool)

(assert (=> b!539186 m!518281))

(push 1)

