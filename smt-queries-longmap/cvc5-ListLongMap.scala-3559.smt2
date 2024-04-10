; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48924 () Bool)

(assert start!48924)

(declare-fun b!539274 () Bool)

(declare-fun res!334484 () Bool)

(declare-fun e!312613 () Bool)

(assert (=> b!539274 (=> (not res!334484) (not e!312613))))

(declare-datatypes ((array!34136 0))(
  ( (array!34137 (arr!16407 (Array (_ BitVec 32) (_ BitVec 64))) (size!16771 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34136)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539274 (= res!334484 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539275 () Bool)

(declare-fun e!312614 () Bool)

(assert (=> b!539275 (= e!312613 e!312614)))

(declare-fun res!334483 () Bool)

(assert (=> b!539275 (=> (not res!334483) (not e!312614))))

(declare-datatypes ((SeekEntryResult!4865 0))(
  ( (MissingZero!4865 (index!21684 (_ BitVec 32))) (Found!4865 (index!21685 (_ BitVec 32))) (Intermediate!4865 (undefined!5677 Bool) (index!21686 (_ BitVec 32)) (x!50600 (_ BitVec 32))) (Undefined!4865) (MissingVacant!4865 (index!21687 (_ BitVec 32))) )
))
(declare-fun lt!247104 () SeekEntryResult!4865)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539275 (= res!334483 (or (= lt!247104 (MissingZero!4865 i!1153)) (= lt!247104 (MissingVacant!4865 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34136 (_ BitVec 32)) SeekEntryResult!4865)

(assert (=> b!539275 (= lt!247104 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539277 () Bool)

(declare-fun res!334486 () Bool)

(assert (=> b!539277 (=> (not res!334486) (not e!312614))))

(declare-datatypes ((List!10526 0))(
  ( (Nil!10523) (Cons!10522 (h!11465 (_ BitVec 64)) (t!16754 List!10526)) )
))
(declare-fun arrayNoDuplicates!0 (array!34136 (_ BitVec 32) List!10526) Bool)

(assert (=> b!539277 (= res!334486 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10523))))

(declare-fun b!539278 () Bool)

(declare-fun res!334482 () Bool)

(assert (=> b!539278 (=> (not res!334482) (not e!312614))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539278 (= res!334482 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16771 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16771 a!3154)) (= (select (arr!16407 a!3154) resIndex!32) (select (arr!16407 a!3154) j!147))))))

(declare-fun b!539279 () Bool)

(assert (=> b!539279 (= e!312614 false)))

(declare-fun lt!247105 () SeekEntryResult!4865)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34136 (_ BitVec 32)) SeekEntryResult!4865)

(assert (=> b!539279 (= lt!247105 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16407 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539280 () Bool)

(declare-fun res!334481 () Bool)

(assert (=> b!539280 (=> (not res!334481) (not e!312613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539280 (= res!334481 (validKeyInArray!0 k!1998))))

(declare-fun b!539281 () Bool)

(declare-fun res!334480 () Bool)

(assert (=> b!539281 (=> (not res!334480) (not e!312614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34136 (_ BitVec 32)) Bool)

(assert (=> b!539281 (= res!334480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539282 () Bool)

(declare-fun res!334479 () Bool)

(assert (=> b!539282 (=> (not res!334479) (not e!312613))))

(assert (=> b!539282 (= res!334479 (and (= (size!16771 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16771 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16771 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539276 () Bool)

(declare-fun res!334487 () Bool)

(assert (=> b!539276 (=> (not res!334487) (not e!312613))))

(assert (=> b!539276 (= res!334487 (validKeyInArray!0 (select (arr!16407 a!3154) j!147)))))

(declare-fun res!334485 () Bool)

(assert (=> start!48924 (=> (not res!334485) (not e!312613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48924 (= res!334485 (validMask!0 mask!3216))))

(assert (=> start!48924 e!312613))

(assert (=> start!48924 true))

(declare-fun array_inv!12203 (array!34136) Bool)

(assert (=> start!48924 (array_inv!12203 a!3154)))

(assert (= (and start!48924 res!334485) b!539282))

(assert (= (and b!539282 res!334479) b!539276))

(assert (= (and b!539276 res!334487) b!539280))

(assert (= (and b!539280 res!334481) b!539274))

(assert (= (and b!539274 res!334484) b!539275))

(assert (= (and b!539275 res!334483) b!539281))

(assert (= (and b!539281 res!334480) b!539277))

(assert (= (and b!539277 res!334486) b!539278))

(assert (= (and b!539278 res!334482) b!539279))

(declare-fun m!518331 () Bool)

(assert (=> start!48924 m!518331))

(declare-fun m!518333 () Bool)

(assert (=> start!48924 m!518333))

(declare-fun m!518335 () Bool)

(assert (=> b!539280 m!518335))

(declare-fun m!518337 () Bool)

(assert (=> b!539274 m!518337))

(declare-fun m!518339 () Bool)

(assert (=> b!539277 m!518339))

(declare-fun m!518341 () Bool)

(assert (=> b!539278 m!518341))

(declare-fun m!518343 () Bool)

(assert (=> b!539278 m!518343))

(declare-fun m!518345 () Bool)

(assert (=> b!539275 m!518345))

(assert (=> b!539276 m!518343))

(assert (=> b!539276 m!518343))

(declare-fun m!518347 () Bool)

(assert (=> b!539276 m!518347))

(assert (=> b!539279 m!518343))

(assert (=> b!539279 m!518343))

(declare-fun m!518349 () Bool)

(assert (=> b!539279 m!518349))

(declare-fun m!518351 () Bool)

(assert (=> b!539281 m!518351))

(push 1)

