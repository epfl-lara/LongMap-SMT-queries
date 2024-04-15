; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48710 () Bool)

(assert start!48710)

(declare-fun b!535314 () Bool)

(declare-fun res!330661 () Bool)

(declare-fun e!310917 () Bool)

(assert (=> b!535314 (=> (not res!330661) (not e!310917))))

(declare-datatypes ((array!33932 0))(
  ( (array!33933 (arr!16305 (Array (_ BitVec 32) (_ BitVec 64))) (size!16670 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33932)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33932 (_ BitVec 32)) Bool)

(assert (=> b!535314 (= res!330661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535315 () Bool)

(declare-fun res!330662 () Bool)

(assert (=> b!535315 (=> (not res!330662) (not e!310917))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!535315 (= res!330662 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16670 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16670 a!3154)) (= (select (arr!16305 a!3154) resIndex!32) (select (arr!16305 a!3154) j!147))))))

(declare-fun b!535316 () Bool)

(declare-fun e!310915 () Bool)

(assert (=> b!535316 (= e!310917 e!310915)))

(declare-fun res!330671 () Bool)

(assert (=> b!535316 (=> (not res!330671) (not e!310915))))

(declare-datatypes ((SeekEntryResult!4760 0))(
  ( (MissingZero!4760 (index!21264 (_ BitVec 32))) (Found!4760 (index!21265 (_ BitVec 32))) (Intermediate!4760 (undefined!5572 Bool) (index!21266 (_ BitVec 32)) (x!50218 (_ BitVec 32))) (Undefined!4760) (MissingVacant!4760 (index!21267 (_ BitVec 32))) )
))
(declare-fun lt!245617 () SeekEntryResult!4760)

(assert (=> b!535316 (= res!330671 (= lt!245617 (Intermediate!4760 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33932 (_ BitVec 32)) SeekEntryResult!4760)

(assert (=> b!535316 (= lt!245617 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16305 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535317 () Bool)

(assert (=> b!535317 (= e!310915 (and (not (= (select (arr!16305 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16305 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16305 a!3154) index!1177) (select (arr!16305 a!3154) j!147))) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun res!330664 () Bool)

(declare-fun e!310916 () Bool)

(assert (=> start!48710 (=> (not res!330664) (not e!310916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48710 (= res!330664 (validMask!0 mask!3216))))

(assert (=> start!48710 e!310916))

(assert (=> start!48710 true))

(declare-fun array_inv!12188 (array!33932) Bool)

(assert (=> start!48710 (array_inv!12188 a!3154)))

(declare-fun b!535318 () Bool)

(declare-fun res!330667 () Bool)

(assert (=> b!535318 (=> (not res!330667) (not e!310916))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535318 (= res!330667 (and (= (size!16670 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16670 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16670 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535319 () Bool)

(declare-fun res!330666 () Bool)

(assert (=> b!535319 (=> (not res!330666) (not e!310916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535319 (= res!330666 (validKeyInArray!0 (select (arr!16305 a!3154) j!147)))))

(declare-fun b!535320 () Bool)

(declare-fun res!330668 () Bool)

(assert (=> b!535320 (=> (not res!330668) (not e!310916))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535320 (= res!330668 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535321 () Bool)

(declare-fun res!330669 () Bool)

(assert (=> b!535321 (=> (not res!330669) (not e!310915))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535321 (= res!330669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16305 a!3154) j!147) mask!3216) (select (arr!16305 a!3154) j!147) a!3154 mask!3216) lt!245617))))

(declare-fun b!535322 () Bool)

(declare-fun res!330670 () Bool)

(assert (=> b!535322 (=> (not res!330670) (not e!310917))))

(declare-datatypes ((List!10463 0))(
  ( (Nil!10460) (Cons!10459 (h!11402 (_ BitVec 64)) (t!16682 List!10463)) )
))
(declare-fun arrayNoDuplicates!0 (array!33932 (_ BitVec 32) List!10463) Bool)

(assert (=> b!535322 (= res!330670 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10460))))

(declare-fun b!535323 () Bool)

(declare-fun res!330665 () Bool)

(assert (=> b!535323 (=> (not res!330665) (not e!310916))))

(assert (=> b!535323 (= res!330665 (validKeyInArray!0 k!1998))))

(declare-fun b!535324 () Bool)

(assert (=> b!535324 (= e!310916 e!310917)))

(declare-fun res!330663 () Bool)

(assert (=> b!535324 (=> (not res!330663) (not e!310917))))

(declare-fun lt!245616 () SeekEntryResult!4760)

(assert (=> b!535324 (= res!330663 (or (= lt!245616 (MissingZero!4760 i!1153)) (= lt!245616 (MissingVacant!4760 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33932 (_ BitVec 32)) SeekEntryResult!4760)

(assert (=> b!535324 (= lt!245616 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48710 res!330664) b!535318))

(assert (= (and b!535318 res!330667) b!535319))

(assert (= (and b!535319 res!330666) b!535323))

(assert (= (and b!535323 res!330665) b!535320))

(assert (= (and b!535320 res!330668) b!535324))

(assert (= (and b!535324 res!330663) b!535314))

(assert (= (and b!535314 res!330661) b!535322))

(assert (= (and b!535322 res!330670) b!535315))

(assert (= (and b!535315 res!330662) b!535316))

(assert (= (and b!535316 res!330671) b!535321))

(assert (= (and b!535321 res!330669) b!535317))

(declare-fun m!514397 () Bool)

(assert (=> b!535320 m!514397))

(declare-fun m!514399 () Bool)

(assert (=> b!535322 m!514399))

(declare-fun m!514401 () Bool)

(assert (=> b!535323 m!514401))

(declare-fun m!514403 () Bool)

(assert (=> b!535321 m!514403))

(assert (=> b!535321 m!514403))

(declare-fun m!514405 () Bool)

(assert (=> b!535321 m!514405))

(assert (=> b!535321 m!514405))

(assert (=> b!535321 m!514403))

(declare-fun m!514407 () Bool)

(assert (=> b!535321 m!514407))

(declare-fun m!514409 () Bool)

(assert (=> b!535324 m!514409))

(assert (=> b!535316 m!514403))

(assert (=> b!535316 m!514403))

(declare-fun m!514411 () Bool)

(assert (=> b!535316 m!514411))

(assert (=> b!535319 m!514403))

(assert (=> b!535319 m!514403))

(declare-fun m!514413 () Bool)

(assert (=> b!535319 m!514413))

(declare-fun m!514415 () Bool)

(assert (=> b!535317 m!514415))

(assert (=> b!535317 m!514403))

(declare-fun m!514417 () Bool)

(assert (=> start!48710 m!514417))

(declare-fun m!514419 () Bool)

(assert (=> start!48710 m!514419))

(declare-fun m!514421 () Bool)

(assert (=> b!535314 m!514421))

(declare-fun m!514423 () Bool)

(assert (=> b!535315 m!514423))

(assert (=> b!535315 m!514403))

(push 1)

(assert (not b!535320))

(assert (not b!535319))

(assert (not b!535316))

(assert (not start!48710))

(assert (not b!535321))

(assert (not b!535322))

(assert (not b!535324))

(assert (not b!535323))

(assert (not b!535314))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

