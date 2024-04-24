; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48958 () Bool)

(assert start!48958)

(declare-fun b!539303 () Bool)

(declare-fun res!334405 () Bool)

(declare-fun e!312690 () Bool)

(assert (=> b!539303 (=> (not res!334405) (not e!312690))))

(declare-datatypes ((array!34118 0))(
  ( (array!34119 (arr!16396 (Array (_ BitVec 32) (_ BitVec 64))) (size!16760 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34118)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34118 (_ BitVec 32)) Bool)

(assert (=> b!539303 (= res!334405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539304 () Bool)

(declare-fun res!334403 () Bool)

(declare-fun e!312689 () Bool)

(assert (=> b!539304 (=> (not res!334403) (not e!312689))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539304 (= res!334403 (and (= (size!16760 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16760 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16760 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539305 () Bool)

(declare-fun res!334404 () Bool)

(assert (=> b!539305 (=> (not res!334404) (not e!312689))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539305 (= res!334404 (validKeyInArray!0 k0!1998))))

(declare-fun res!334411 () Bool)

(assert (=> start!48958 (=> (not res!334411) (not e!312689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48958 (= res!334411 (validMask!0 mask!3216))))

(assert (=> start!48958 e!312689))

(assert (=> start!48958 true))

(declare-fun array_inv!12255 (array!34118) Bool)

(assert (=> start!48958 (array_inv!12255 a!3154)))

(declare-fun b!539306 () Bool)

(declare-fun res!334408 () Bool)

(assert (=> b!539306 (=> (not res!334408) (not e!312690))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539306 (= res!334408 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16760 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16760 a!3154)) (= (select (arr!16396 a!3154) resIndex!32) (select (arr!16396 a!3154) j!147))))))

(declare-fun b!539307 () Bool)

(declare-fun res!334406 () Bool)

(assert (=> b!539307 (=> (not res!334406) (not e!312689))))

(declare-fun arrayContainsKey!0 (array!34118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539307 (= res!334406 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539308 () Bool)

(assert (=> b!539308 (= e!312690 false)))

(declare-datatypes ((SeekEntryResult!4810 0))(
  ( (MissingZero!4810 (index!21464 (_ BitVec 32))) (Found!4810 (index!21465 (_ BitVec 32))) (Intermediate!4810 (undefined!5622 Bool) (index!21466 (_ BitVec 32)) (x!50532 (_ BitVec 32))) (Undefined!4810) (MissingVacant!4810 (index!21467 (_ BitVec 32))) )
))
(declare-fun lt!247177 () SeekEntryResult!4810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34118 (_ BitVec 32)) SeekEntryResult!4810)

(assert (=> b!539308 (= lt!247177 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16396 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539309 () Bool)

(declare-fun res!334409 () Bool)

(assert (=> b!539309 (=> (not res!334409) (not e!312689))))

(assert (=> b!539309 (= res!334409 (validKeyInArray!0 (select (arr!16396 a!3154) j!147)))))

(declare-fun b!539310 () Bool)

(assert (=> b!539310 (= e!312689 e!312690)))

(declare-fun res!334407 () Bool)

(assert (=> b!539310 (=> (not res!334407) (not e!312690))))

(declare-fun lt!247176 () SeekEntryResult!4810)

(assert (=> b!539310 (= res!334407 (or (= lt!247176 (MissingZero!4810 i!1153)) (= lt!247176 (MissingVacant!4810 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34118 (_ BitVec 32)) SeekEntryResult!4810)

(assert (=> b!539310 (= lt!247176 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539311 () Bool)

(declare-fun res!334410 () Bool)

(assert (=> b!539311 (=> (not res!334410) (not e!312690))))

(declare-datatypes ((List!10422 0))(
  ( (Nil!10419) (Cons!10418 (h!11364 (_ BitVec 64)) (t!16642 List!10422)) )
))
(declare-fun arrayNoDuplicates!0 (array!34118 (_ BitVec 32) List!10422) Bool)

(assert (=> b!539311 (= res!334410 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10419))))

(assert (= (and start!48958 res!334411) b!539304))

(assert (= (and b!539304 res!334403) b!539309))

(assert (= (and b!539309 res!334409) b!539305))

(assert (= (and b!539305 res!334404) b!539307))

(assert (= (and b!539307 res!334406) b!539310))

(assert (= (and b!539310 res!334407) b!539303))

(assert (= (and b!539303 res!334405) b!539311))

(assert (= (and b!539311 res!334410) b!539306))

(assert (= (and b!539306 res!334408) b!539308))

(declare-fun m!518515 () Bool)

(assert (=> b!539309 m!518515))

(assert (=> b!539309 m!518515))

(declare-fun m!518517 () Bool)

(assert (=> b!539309 m!518517))

(declare-fun m!518519 () Bool)

(assert (=> b!539311 m!518519))

(declare-fun m!518521 () Bool)

(assert (=> b!539307 m!518521))

(declare-fun m!518523 () Bool)

(assert (=> b!539303 m!518523))

(declare-fun m!518525 () Bool)

(assert (=> b!539305 m!518525))

(declare-fun m!518527 () Bool)

(assert (=> start!48958 m!518527))

(declare-fun m!518529 () Bool)

(assert (=> start!48958 m!518529))

(declare-fun m!518531 () Bool)

(assert (=> b!539310 m!518531))

(assert (=> b!539308 m!518515))

(assert (=> b!539308 m!518515))

(declare-fun m!518533 () Bool)

(assert (=> b!539308 m!518533))

(declare-fun m!518535 () Bool)

(assert (=> b!539306 m!518535))

(assert (=> b!539306 m!518515))

(check-sat (not b!539310) (not b!539303) (not b!539305) (not b!539309) (not b!539311) (not b!539308) (not start!48958) (not b!539307))
(check-sat)
