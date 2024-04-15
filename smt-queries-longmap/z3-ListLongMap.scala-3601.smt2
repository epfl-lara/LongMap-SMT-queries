; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49584 () Bool)

(assert start!49584)

(declare-fun b!545312 () Bool)

(declare-fun res!339383 () Bool)

(declare-fun e!315179 () Bool)

(assert (=> b!545312 (=> (not res!339383) (not e!315179))))

(declare-datatypes ((array!34407 0))(
  ( (array!34408 (arr!16532 (Array (_ BitVec 32) (_ BitVec 64))) (size!16897 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34407)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34407 (_ BitVec 32)) Bool)

(assert (=> b!545312 (= res!339383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545313 () Bool)

(declare-fun e!315180 () Bool)

(declare-fun e!315182 () Bool)

(assert (=> b!545313 (= e!315180 e!315182)))

(declare-fun res!339389 () Bool)

(assert (=> b!545313 (=> (not res!339389) (not e!315182))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248663 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545313 (= res!339389 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248663 #b00000000000000000000000000000000) (bvslt lt!248663 (size!16897 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545313 (= lt!248663 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545314 () Bool)

(declare-fun e!315183 () Bool)

(assert (=> b!545314 (= e!315183 e!315180)))

(declare-fun res!339384 () Bool)

(assert (=> b!545314 (=> (not res!339384) (not e!315180))))

(declare-datatypes ((SeekEntryResult!4987 0))(
  ( (MissingZero!4987 (index!22172 (_ BitVec 32))) (Found!4987 (index!22173 (_ BitVec 32))) (Intermediate!4987 (undefined!5799 Bool) (index!22174 (_ BitVec 32)) (x!51110 (_ BitVec 32))) (Undefined!4987) (MissingVacant!4987 (index!22175 (_ BitVec 32))) )
))
(declare-fun lt!248665 () SeekEntryResult!4987)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!248660 () SeekEntryResult!4987)

(assert (=> b!545314 (= res!339384 (and (= lt!248660 lt!248665) (not (= (select (arr!16532 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16532 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16532 a!3154) index!1177) (select (arr!16532 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34407 (_ BitVec 32)) SeekEntryResult!4987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545314 (= lt!248660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16532 a!3154) j!147) mask!3216) (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545315 () Bool)

(declare-fun res!339390 () Bool)

(declare-fun e!315181 () Bool)

(assert (=> b!545315 (=> (not res!339390) (not e!315181))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545315 (= res!339390 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545316 () Bool)

(declare-fun res!339381 () Bool)

(assert (=> b!545316 (=> (not res!339381) (not e!315181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545316 (= res!339381 (validKeyInArray!0 (select (arr!16532 a!3154) j!147)))))

(declare-fun res!339387 () Bool)

(assert (=> start!49584 (=> (not res!339387) (not e!315181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49584 (= res!339387 (validMask!0 mask!3216))))

(assert (=> start!49584 e!315181))

(assert (=> start!49584 true))

(declare-fun array_inv!12415 (array!34407) Bool)

(assert (=> start!49584 (array_inv!12415 a!3154)))

(declare-fun lt!248662 () SeekEntryResult!4987)

(declare-fun b!545317 () Bool)

(declare-fun lt!248661 () SeekEntryResult!4987)

(assert (=> b!545317 (= e!315182 (and (= lt!248662 lt!248661) (= lt!248660 lt!248662) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1030)) (bvsub #b01111111111111111111111111111110 x!1030))))))

(assert (=> b!545317 (= lt!248662 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248663 (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545318 () Bool)

(assert (=> b!545318 (= e!315179 e!315183)))

(declare-fun res!339392 () Bool)

(assert (=> b!545318 (=> (not res!339392) (not e!315183))))

(assert (=> b!545318 (= res!339392 (= lt!248665 lt!248661))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545318 (= lt!248661 (Intermediate!4987 false resIndex!32 resX!32))))

(assert (=> b!545318 (= lt!248665 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545319 () Bool)

(declare-fun res!339388 () Bool)

(assert (=> b!545319 (=> (not res!339388) (not e!315179))))

(declare-datatypes ((List!10690 0))(
  ( (Nil!10687) (Cons!10686 (h!11650 (_ BitVec 64)) (t!16909 List!10690)) )
))
(declare-fun arrayNoDuplicates!0 (array!34407 (_ BitVec 32) List!10690) Bool)

(assert (=> b!545319 (= res!339388 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10687))))

(declare-fun b!545320 () Bool)

(declare-fun res!339385 () Bool)

(assert (=> b!545320 (=> (not res!339385) (not e!315181))))

(assert (=> b!545320 (= res!339385 (validKeyInArray!0 k0!1998))))

(declare-fun b!545321 () Bool)

(assert (=> b!545321 (= e!315181 e!315179)))

(declare-fun res!339386 () Bool)

(assert (=> b!545321 (=> (not res!339386) (not e!315179))))

(declare-fun lt!248664 () SeekEntryResult!4987)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545321 (= res!339386 (or (= lt!248664 (MissingZero!4987 i!1153)) (= lt!248664 (MissingVacant!4987 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34407 (_ BitVec 32)) SeekEntryResult!4987)

(assert (=> b!545321 (= lt!248664 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545322 () Bool)

(declare-fun res!339382 () Bool)

(assert (=> b!545322 (=> (not res!339382) (not e!315179))))

(assert (=> b!545322 (= res!339382 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16897 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16897 a!3154)) (= (select (arr!16532 a!3154) resIndex!32) (select (arr!16532 a!3154) j!147))))))

(declare-fun b!545323 () Bool)

(declare-fun res!339391 () Bool)

(assert (=> b!545323 (=> (not res!339391) (not e!315181))))

(assert (=> b!545323 (= res!339391 (and (= (size!16897 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16897 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16897 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49584 res!339387) b!545323))

(assert (= (and b!545323 res!339391) b!545316))

(assert (= (and b!545316 res!339381) b!545320))

(assert (= (and b!545320 res!339385) b!545315))

(assert (= (and b!545315 res!339390) b!545321))

(assert (= (and b!545321 res!339386) b!545312))

(assert (= (and b!545312 res!339383) b!545319))

(assert (= (and b!545319 res!339388) b!545322))

(assert (= (and b!545322 res!339382) b!545318))

(assert (= (and b!545318 res!339392) b!545314))

(assert (= (and b!545314 res!339384) b!545313))

(assert (= (and b!545313 res!339389) b!545317))

(declare-fun m!522385 () Bool)

(assert (=> b!545315 m!522385))

(declare-fun m!522387 () Bool)

(assert (=> b!545313 m!522387))

(declare-fun m!522389 () Bool)

(assert (=> b!545314 m!522389))

(declare-fun m!522391 () Bool)

(assert (=> b!545314 m!522391))

(assert (=> b!545314 m!522391))

(declare-fun m!522393 () Bool)

(assert (=> b!545314 m!522393))

(assert (=> b!545314 m!522393))

(assert (=> b!545314 m!522391))

(declare-fun m!522395 () Bool)

(assert (=> b!545314 m!522395))

(declare-fun m!522397 () Bool)

(assert (=> b!545312 m!522397))

(assert (=> b!545317 m!522391))

(assert (=> b!545317 m!522391))

(declare-fun m!522399 () Bool)

(assert (=> b!545317 m!522399))

(assert (=> b!545316 m!522391))

(assert (=> b!545316 m!522391))

(declare-fun m!522401 () Bool)

(assert (=> b!545316 m!522401))

(declare-fun m!522403 () Bool)

(assert (=> b!545321 m!522403))

(declare-fun m!522405 () Bool)

(assert (=> b!545320 m!522405))

(declare-fun m!522407 () Bool)

(assert (=> b!545319 m!522407))

(declare-fun m!522409 () Bool)

(assert (=> start!49584 m!522409))

(declare-fun m!522411 () Bool)

(assert (=> start!49584 m!522411))

(assert (=> b!545318 m!522391))

(assert (=> b!545318 m!522391))

(declare-fun m!522413 () Bool)

(assert (=> b!545318 m!522413))

(declare-fun m!522415 () Bool)

(assert (=> b!545322 m!522415))

(assert (=> b!545322 m!522391))

(check-sat (not b!545319) (not b!545314) (not b!545318) (not b!545312) (not b!545316) (not b!545320) (not start!49584) (not b!545317) (not b!545313) (not b!545315) (not b!545321))
(check-sat)
