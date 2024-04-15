; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48552 () Bool)

(assert start!48552)

(declare-fun b!532910 () Bool)

(declare-fun res!328257 () Bool)

(declare-fun e!310153 () Bool)

(assert (=> b!532910 (=> (not res!328257) (not e!310153))))

(declare-datatypes ((array!33774 0))(
  ( (array!33775 (arr!16226 (Array (_ BitVec 32) (_ BitVec 64))) (size!16591 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33774)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532910 (= res!328257 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532911 () Bool)

(declare-fun e!310154 () Bool)

(assert (=> b!532911 (= e!310154 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4681 0))(
  ( (MissingZero!4681 (index!20948 (_ BitVec 32))) (Found!4681 (index!20949 (_ BitVec 32))) (Intermediate!4681 (undefined!5493 Bool) (index!20950 (_ BitVec 32)) (x!49931 (_ BitVec 32))) (Undefined!4681) (MissingVacant!4681 (index!20951 (_ BitVec 32))) )
))
(declare-fun lt!245170 () SeekEntryResult!4681)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33774 (_ BitVec 32)) SeekEntryResult!4681)

(assert (=> b!532911 (= lt!245170 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16226 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!532912 () Bool)

(declare-fun res!328261 () Bool)

(assert (=> b!532912 (=> (not res!328261) (not e!310153))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532912 (= res!328261 (and (= (size!16591 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16591 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16591 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532914 () Bool)

(declare-fun res!328264 () Bool)

(assert (=> b!532914 (=> (not res!328264) (not e!310154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33774 (_ BitVec 32)) Bool)

(assert (=> b!532914 (= res!328264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532915 () Bool)

(declare-fun res!328258 () Bool)

(assert (=> b!532915 (=> (not res!328258) (not e!310154))))

(declare-datatypes ((List!10384 0))(
  ( (Nil!10381) (Cons!10380 (h!11323 (_ BitVec 64)) (t!16603 List!10384)) )
))
(declare-fun arrayNoDuplicates!0 (array!33774 (_ BitVec 32) List!10384) Bool)

(assert (=> b!532915 (= res!328258 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10381))))

(declare-fun b!532916 () Bool)

(declare-fun res!328265 () Bool)

(assert (=> b!532916 (=> (not res!328265) (not e!310154))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532916 (= res!328265 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16591 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16591 a!3154)) (= (select (arr!16226 a!3154) resIndex!32) (select (arr!16226 a!3154) j!147))))))

(declare-fun b!532917 () Bool)

(declare-fun res!328260 () Bool)

(assert (=> b!532917 (=> (not res!328260) (not e!310153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532917 (= res!328260 (validKeyInArray!0 k0!1998))))

(declare-fun b!532918 () Bool)

(assert (=> b!532918 (= e!310153 e!310154)))

(declare-fun res!328262 () Bool)

(assert (=> b!532918 (=> (not res!328262) (not e!310154))))

(declare-fun lt!245169 () SeekEntryResult!4681)

(assert (=> b!532918 (= res!328262 (or (= lt!245169 (MissingZero!4681 i!1153)) (= lt!245169 (MissingVacant!4681 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33774 (_ BitVec 32)) SeekEntryResult!4681)

(assert (=> b!532918 (= lt!245169 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532913 () Bool)

(declare-fun res!328263 () Bool)

(assert (=> b!532913 (=> (not res!328263) (not e!310153))))

(assert (=> b!532913 (= res!328263 (validKeyInArray!0 (select (arr!16226 a!3154) j!147)))))

(declare-fun res!328259 () Bool)

(assert (=> start!48552 (=> (not res!328259) (not e!310153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48552 (= res!328259 (validMask!0 mask!3216))))

(assert (=> start!48552 e!310153))

(assert (=> start!48552 true))

(declare-fun array_inv!12109 (array!33774) Bool)

(assert (=> start!48552 (array_inv!12109 a!3154)))

(assert (= (and start!48552 res!328259) b!532912))

(assert (= (and b!532912 res!328261) b!532913))

(assert (= (and b!532913 res!328263) b!532917))

(assert (= (and b!532917 res!328260) b!532910))

(assert (= (and b!532910 res!328257) b!532918))

(assert (= (and b!532918 res!328262) b!532914))

(assert (= (and b!532914 res!328264) b!532915))

(assert (= (and b!532915 res!328258) b!532916))

(assert (= (and b!532916 res!328265) b!532911))

(declare-fun m!512365 () Bool)

(assert (=> b!532915 m!512365))

(declare-fun m!512367 () Bool)

(assert (=> b!532911 m!512367))

(assert (=> b!532911 m!512367))

(declare-fun m!512369 () Bool)

(assert (=> b!532911 m!512369))

(declare-fun m!512371 () Bool)

(assert (=> start!48552 m!512371))

(declare-fun m!512373 () Bool)

(assert (=> start!48552 m!512373))

(declare-fun m!512375 () Bool)

(assert (=> b!532918 m!512375))

(declare-fun m!512377 () Bool)

(assert (=> b!532917 m!512377))

(declare-fun m!512379 () Bool)

(assert (=> b!532910 m!512379))

(declare-fun m!512381 () Bool)

(assert (=> b!532916 m!512381))

(assert (=> b!532916 m!512367))

(declare-fun m!512383 () Bool)

(assert (=> b!532914 m!512383))

(assert (=> b!532913 m!512367))

(assert (=> b!532913 m!512367))

(declare-fun m!512385 () Bool)

(assert (=> b!532913 m!512385))

(check-sat (not b!532914) (not b!532913) (not b!532917) (not b!532918) (not b!532915) (not start!48552) (not b!532911) (not b!532910))
(check-sat)
