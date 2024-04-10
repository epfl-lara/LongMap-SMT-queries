; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48926 () Bool)

(assert start!48926)

(declare-fun b!539301 () Bool)

(declare-fun res!334509 () Bool)

(declare-fun e!312624 () Bool)

(assert (=> b!539301 (=> (not res!334509) (not e!312624))))

(declare-datatypes ((array!34138 0))(
  ( (array!34139 (arr!16408 (Array (_ BitVec 32) (_ BitVec 64))) (size!16772 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34138)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539301 (= res!334509 (validKeyInArray!0 (select (arr!16408 a!3154) j!147)))))

(declare-fun b!539303 () Bool)

(declare-fun res!334511 () Bool)

(assert (=> b!539303 (=> (not res!334511) (not e!312624))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!539303 (= res!334511 (validKeyInArray!0 k0!1998))))

(declare-fun b!539304 () Bool)

(declare-fun res!334510 () Bool)

(declare-fun e!312623 () Bool)

(assert (=> b!539304 (=> (not res!334510) (not e!312623))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34138 (_ BitVec 32)) Bool)

(assert (=> b!539304 (= res!334510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539305 () Bool)

(declare-fun res!334507 () Bool)

(assert (=> b!539305 (=> (not res!334507) (not e!312623))))

(declare-datatypes ((List!10527 0))(
  ( (Nil!10524) (Cons!10523 (h!11466 (_ BitVec 64)) (t!16755 List!10527)) )
))
(declare-fun arrayNoDuplicates!0 (array!34138 (_ BitVec 32) List!10527) Bool)

(assert (=> b!539305 (= res!334507 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10524))))

(declare-fun b!539306 () Bool)

(declare-fun res!334514 () Bool)

(assert (=> b!539306 (=> (not res!334514) (not e!312624))))

(declare-fun arrayContainsKey!0 (array!34138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539306 (= res!334514 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539307 () Bool)

(declare-fun res!334513 () Bool)

(assert (=> b!539307 (=> (not res!334513) (not e!312624))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539307 (= res!334513 (and (= (size!16772 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16772 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16772 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334506 () Bool)

(assert (=> start!48926 (=> (not res!334506) (not e!312624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48926 (= res!334506 (validMask!0 mask!3216))))

(assert (=> start!48926 e!312624))

(assert (=> start!48926 true))

(declare-fun array_inv!12204 (array!34138) Bool)

(assert (=> start!48926 (array_inv!12204 a!3154)))

(declare-fun b!539302 () Bool)

(assert (=> b!539302 (= e!312623 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4866 0))(
  ( (MissingZero!4866 (index!21688 (_ BitVec 32))) (Found!4866 (index!21689 (_ BitVec 32))) (Intermediate!4866 (undefined!5678 Bool) (index!21690 (_ BitVec 32)) (x!50601 (_ BitVec 32))) (Undefined!4866) (MissingVacant!4866 (index!21691 (_ BitVec 32))) )
))
(declare-fun lt!247111 () SeekEntryResult!4866)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34138 (_ BitVec 32)) SeekEntryResult!4866)

(assert (=> b!539302 (= lt!247111 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16408 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539308 () Bool)

(assert (=> b!539308 (= e!312624 e!312623)))

(declare-fun res!334508 () Bool)

(assert (=> b!539308 (=> (not res!334508) (not e!312623))))

(declare-fun lt!247110 () SeekEntryResult!4866)

(assert (=> b!539308 (= res!334508 (or (= lt!247110 (MissingZero!4866 i!1153)) (= lt!247110 (MissingVacant!4866 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34138 (_ BitVec 32)) SeekEntryResult!4866)

(assert (=> b!539308 (= lt!247110 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539309 () Bool)

(declare-fun res!334512 () Bool)

(assert (=> b!539309 (=> (not res!334512) (not e!312623))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539309 (= res!334512 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16772 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16772 a!3154)) (= (select (arr!16408 a!3154) resIndex!32) (select (arr!16408 a!3154) j!147))))))

(assert (= (and start!48926 res!334506) b!539307))

(assert (= (and b!539307 res!334513) b!539301))

(assert (= (and b!539301 res!334509) b!539303))

(assert (= (and b!539303 res!334511) b!539306))

(assert (= (and b!539306 res!334514) b!539308))

(assert (= (and b!539308 res!334508) b!539304))

(assert (= (and b!539304 res!334510) b!539305))

(assert (= (and b!539305 res!334507) b!539309))

(assert (= (and b!539309 res!334512) b!539302))

(declare-fun m!518353 () Bool)

(assert (=> b!539301 m!518353))

(assert (=> b!539301 m!518353))

(declare-fun m!518355 () Bool)

(assert (=> b!539301 m!518355))

(declare-fun m!518357 () Bool)

(assert (=> start!48926 m!518357))

(declare-fun m!518359 () Bool)

(assert (=> start!48926 m!518359))

(assert (=> b!539302 m!518353))

(assert (=> b!539302 m!518353))

(declare-fun m!518361 () Bool)

(assert (=> b!539302 m!518361))

(declare-fun m!518363 () Bool)

(assert (=> b!539309 m!518363))

(assert (=> b!539309 m!518353))

(declare-fun m!518365 () Bool)

(assert (=> b!539303 m!518365))

(declare-fun m!518367 () Bool)

(assert (=> b!539308 m!518367))

(declare-fun m!518369 () Bool)

(assert (=> b!539304 m!518369))

(declare-fun m!518371 () Bool)

(assert (=> b!539305 m!518371))

(declare-fun m!518373 () Bool)

(assert (=> b!539306 m!518373))

(check-sat (not b!539304) (not b!539302) (not b!539305) (not b!539306) (not b!539301) (not b!539308) (not b!539303) (not start!48926))
(check-sat)
