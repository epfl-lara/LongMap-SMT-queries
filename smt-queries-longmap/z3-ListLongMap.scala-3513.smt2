; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48640 () Bool)

(assert start!48640)

(declare-fun res!329615 () Bool)

(declare-fun e!310666 () Bool)

(assert (=> start!48640 (=> (not res!329615) (not e!310666))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48640 (= res!329615 (validMask!0 mask!3216))))

(assert (=> start!48640 e!310666))

(assert (=> start!48640 true))

(declare-datatypes ((array!33851 0))(
  ( (array!33852 (arr!16264 (Array (_ BitVec 32) (_ BitVec 64))) (size!16628 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33851)

(declare-fun array_inv!12123 (array!33851) Bool)

(assert (=> start!48640 (array_inv!12123 a!3154)))

(declare-fun b!534355 () Bool)

(declare-fun e!310668 () Bool)

(assert (=> b!534355 (= e!310668 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4678 0))(
  ( (MissingZero!4678 (index!20936 (_ BitVec 32))) (Found!4678 (index!20937 (_ BitVec 32))) (Intermediate!4678 (undefined!5490 Bool) (index!20938 (_ BitVec 32)) (x!50042 (_ BitVec 32))) (Undefined!4678) (MissingVacant!4678 (index!20939 (_ BitVec 32))) )
))
(declare-fun lt!245640 () SeekEntryResult!4678)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33851 (_ BitVec 32)) SeekEntryResult!4678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534355 (= lt!245640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16264 a!3154) j!147) mask!3216) (select (arr!16264 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534356 () Bool)

(declare-fun res!329619 () Bool)

(assert (=> b!534356 (=> (not res!329619) (not e!310668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33851 (_ BitVec 32)) Bool)

(assert (=> b!534356 (= res!329619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534357 () Bool)

(assert (=> b!534357 (= e!310666 e!310668)))

(declare-fun res!329616 () Bool)

(assert (=> b!534357 (=> (not res!329616) (not e!310668))))

(declare-fun lt!245641 () SeekEntryResult!4678)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534357 (= res!329616 (or (= lt!245641 (MissingZero!4678 i!1153)) (= lt!245641 (MissingVacant!4678 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33851 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!534357 (= lt!245641 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534358 () Bool)

(declare-fun res!329618 () Bool)

(assert (=> b!534358 (=> (not res!329618) (not e!310666))))

(declare-fun arrayContainsKey!0 (array!33851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534358 (= res!329618 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534359 () Bool)

(declare-fun res!329617 () Bool)

(assert (=> b!534359 (=> (not res!329617) (not e!310666))))

(assert (=> b!534359 (= res!329617 (and (= (size!16628 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16628 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16628 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534360 () Bool)

(declare-fun res!329620 () Bool)

(assert (=> b!534360 (=> (not res!329620) (not e!310668))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!534360 (= res!329620 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16628 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16628 a!3154)) (= (select (arr!16264 a!3154) resIndex!32) (select (arr!16264 a!3154) j!147))))))

(declare-fun b!534361 () Bool)

(declare-fun res!329621 () Bool)

(assert (=> b!534361 (=> (not res!329621) (not e!310668))))

(declare-datatypes ((List!10290 0))(
  ( (Nil!10287) (Cons!10286 (h!11229 (_ BitVec 64)) (t!16510 List!10290)) )
))
(declare-fun arrayNoDuplicates!0 (array!33851 (_ BitVec 32) List!10290) Bool)

(assert (=> b!534361 (= res!329621 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10287))))

(declare-fun b!534362 () Bool)

(declare-fun res!329622 () Bool)

(assert (=> b!534362 (=> (not res!329622) (not e!310668))))

(assert (=> b!534362 (= res!329622 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16264 a!3154) j!147) a!3154 mask!3216) (Intermediate!4678 false resIndex!32 resX!32)))))

(declare-fun b!534363 () Bool)

(declare-fun res!329614 () Bool)

(assert (=> b!534363 (=> (not res!329614) (not e!310666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534363 (= res!329614 (validKeyInArray!0 (select (arr!16264 a!3154) j!147)))))

(declare-fun b!534364 () Bool)

(declare-fun res!329623 () Bool)

(assert (=> b!534364 (=> (not res!329623) (not e!310666))))

(assert (=> b!534364 (= res!329623 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48640 res!329615) b!534359))

(assert (= (and b!534359 res!329617) b!534363))

(assert (= (and b!534363 res!329614) b!534364))

(assert (= (and b!534364 res!329623) b!534358))

(assert (= (and b!534358 res!329618) b!534357))

(assert (= (and b!534357 res!329616) b!534356))

(assert (= (and b!534356 res!329619) b!534361))

(assert (= (and b!534361 res!329621) b!534360))

(assert (= (and b!534360 res!329620) b!534362))

(assert (= (and b!534362 res!329622) b!534355))

(declare-fun m!514321 () Bool)

(assert (=> b!534360 m!514321))

(declare-fun m!514323 () Bool)

(assert (=> b!534360 m!514323))

(assert (=> b!534363 m!514323))

(assert (=> b!534363 m!514323))

(declare-fun m!514325 () Bool)

(assert (=> b!534363 m!514325))

(declare-fun m!514327 () Bool)

(assert (=> b!534358 m!514327))

(declare-fun m!514329 () Bool)

(assert (=> b!534357 m!514329))

(assert (=> b!534362 m!514323))

(assert (=> b!534362 m!514323))

(declare-fun m!514331 () Bool)

(assert (=> b!534362 m!514331))

(declare-fun m!514333 () Bool)

(assert (=> start!48640 m!514333))

(declare-fun m!514335 () Bool)

(assert (=> start!48640 m!514335))

(declare-fun m!514337 () Bool)

(assert (=> b!534364 m!514337))

(declare-fun m!514339 () Bool)

(assert (=> b!534361 m!514339))

(declare-fun m!514341 () Bool)

(assert (=> b!534356 m!514341))

(assert (=> b!534355 m!514323))

(assert (=> b!534355 m!514323))

(declare-fun m!514343 () Bool)

(assert (=> b!534355 m!514343))

(assert (=> b!534355 m!514343))

(assert (=> b!534355 m!514323))

(declare-fun m!514345 () Bool)

(assert (=> b!534355 m!514345))

(check-sat (not b!534362) (not b!534356) (not b!534355) (not b!534357) (not b!534363) (not b!534364) (not b!534361) (not b!534358) (not start!48640))
(check-sat)
