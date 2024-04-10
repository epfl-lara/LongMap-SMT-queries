; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48644 () Bool)

(assert start!48644)

(declare-fun b!534356 () Bool)

(declare-fun res!329566 () Bool)

(declare-fun e!310687 () Bool)

(assert (=> b!534356 (=> (not res!329566) (not e!310687))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33856 0))(
  ( (array!33857 (arr!16267 (Array (_ BitVec 32) (_ BitVec 64))) (size!16631 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33856)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!534356 (= res!329566 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16631 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16631 a!3154)) (= (select (arr!16267 a!3154) resIndex!32) (select (arr!16267 a!3154) j!147))))))

(declare-fun b!534358 () Bool)

(declare-fun e!310689 () Bool)

(assert (=> b!534358 (= e!310689 e!310687)))

(declare-fun res!329567 () Bool)

(assert (=> b!534358 (=> (not res!329567) (not e!310687))))

(declare-datatypes ((SeekEntryResult!4725 0))(
  ( (MissingZero!4725 (index!21124 (_ BitVec 32))) (Found!4725 (index!21125 (_ BitVec 32))) (Intermediate!4725 (undefined!5537 Bool) (index!21126 (_ BitVec 32)) (x!50084 (_ BitVec 32))) (Undefined!4725) (MissingVacant!4725 (index!21127 (_ BitVec 32))) )
))
(declare-fun lt!245617 () SeekEntryResult!4725)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534358 (= res!329567 (or (= lt!245617 (MissingZero!4725 i!1153)) (= lt!245617 (MissingVacant!4725 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33856 (_ BitVec 32)) SeekEntryResult!4725)

(assert (=> b!534358 (= lt!245617 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534359 () Bool)

(declare-fun res!329561 () Bool)

(assert (=> b!534359 (=> (not res!329561) (not e!310689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534359 (= res!329561 (validKeyInArray!0 k0!1998))))

(declare-fun b!534360 () Bool)

(declare-fun res!329565 () Bool)

(assert (=> b!534360 (=> (not res!329565) (not e!310689))))

(assert (=> b!534360 (= res!329565 (and (= (size!16631 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16631 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16631 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534361 () Bool)

(declare-fun res!329564 () Bool)

(assert (=> b!534361 (=> (not res!329564) (not e!310689))))

(assert (=> b!534361 (= res!329564 (validKeyInArray!0 (select (arr!16267 a!3154) j!147)))))

(declare-fun b!534362 () Bool)

(declare-fun res!329570 () Bool)

(assert (=> b!534362 (=> (not res!329570) (not e!310689))))

(declare-fun arrayContainsKey!0 (array!33856 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534362 (= res!329570 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534363 () Bool)

(declare-fun res!329562 () Bool)

(assert (=> b!534363 (=> (not res!329562) (not e!310687))))

(declare-datatypes ((List!10386 0))(
  ( (Nil!10383) (Cons!10382 (h!11325 (_ BitVec 64)) (t!16614 List!10386)) )
))
(declare-fun arrayNoDuplicates!0 (array!33856 (_ BitVec 32) List!10386) Bool)

(assert (=> b!534363 (= res!329562 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10383))))

(declare-fun res!329569 () Bool)

(assert (=> start!48644 (=> (not res!329569) (not e!310689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48644 (= res!329569 (validMask!0 mask!3216))))

(assert (=> start!48644 e!310689))

(assert (=> start!48644 true))

(declare-fun array_inv!12063 (array!33856) Bool)

(assert (=> start!48644 (array_inv!12063 a!3154)))

(declare-fun b!534357 () Bool)

(assert (=> b!534357 (= e!310687 false)))

(declare-fun lt!245616 () SeekEntryResult!4725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33856 (_ BitVec 32)) SeekEntryResult!4725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534357 (= lt!245616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16267 a!3154) j!147) mask!3216) (select (arr!16267 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534364 () Bool)

(declare-fun res!329563 () Bool)

(assert (=> b!534364 (=> (not res!329563) (not e!310687))))

(assert (=> b!534364 (= res!329563 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16267 a!3154) j!147) a!3154 mask!3216) (Intermediate!4725 false resIndex!32 resX!32)))))

(declare-fun b!534365 () Bool)

(declare-fun res!329568 () Bool)

(assert (=> b!534365 (=> (not res!329568) (not e!310687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33856 (_ BitVec 32)) Bool)

(assert (=> b!534365 (= res!329568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48644 res!329569) b!534360))

(assert (= (and b!534360 res!329565) b!534361))

(assert (= (and b!534361 res!329564) b!534359))

(assert (= (and b!534359 res!329561) b!534362))

(assert (= (and b!534362 res!329570) b!534358))

(assert (= (and b!534358 res!329567) b!534365))

(assert (= (and b!534365 res!329568) b!534363))

(assert (= (and b!534363 res!329562) b!534356))

(assert (= (and b!534356 res!329566) b!534364))

(assert (= (and b!534364 res!329563) b!534357))

(declare-fun m!514085 () Bool)

(assert (=> b!534359 m!514085))

(declare-fun m!514087 () Bool)

(assert (=> b!534357 m!514087))

(assert (=> b!534357 m!514087))

(declare-fun m!514089 () Bool)

(assert (=> b!534357 m!514089))

(assert (=> b!534357 m!514089))

(assert (=> b!534357 m!514087))

(declare-fun m!514091 () Bool)

(assert (=> b!534357 m!514091))

(assert (=> b!534364 m!514087))

(assert (=> b!534364 m!514087))

(declare-fun m!514093 () Bool)

(assert (=> b!534364 m!514093))

(assert (=> b!534361 m!514087))

(assert (=> b!534361 m!514087))

(declare-fun m!514095 () Bool)

(assert (=> b!534361 m!514095))

(declare-fun m!514097 () Bool)

(assert (=> start!48644 m!514097))

(declare-fun m!514099 () Bool)

(assert (=> start!48644 m!514099))

(declare-fun m!514101 () Bool)

(assert (=> b!534363 m!514101))

(declare-fun m!514103 () Bool)

(assert (=> b!534358 m!514103))

(declare-fun m!514105 () Bool)

(assert (=> b!534365 m!514105))

(declare-fun m!514107 () Bool)

(assert (=> b!534362 m!514107))

(declare-fun m!514109 () Bool)

(assert (=> b!534356 m!514109))

(assert (=> b!534356 m!514087))

(check-sat (not b!534361) (not b!534363) (not b!534364) (not b!534365) (not b!534357) (not b!534359) (not b!534362) (not b!534358) (not start!48644))
(check-sat)
