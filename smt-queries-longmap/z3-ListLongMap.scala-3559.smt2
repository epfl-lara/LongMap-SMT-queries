; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48970 () Bool)

(assert start!48970)

(declare-fun b!539474 () Bool)

(declare-fun res!334578 () Bool)

(declare-fun e!312744 () Bool)

(assert (=> b!539474 (=> (not res!334578) (not e!312744))))

(declare-datatypes ((array!34130 0))(
  ( (array!34131 (arr!16402 (Array (_ BitVec 32) (_ BitVec 64))) (size!16766 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34130)

(declare-datatypes ((List!10428 0))(
  ( (Nil!10425) (Cons!10424 (h!11370 (_ BitVec 64)) (t!16648 List!10428)) )
))
(declare-fun arrayNoDuplicates!0 (array!34130 (_ BitVec 32) List!10428) Bool)

(assert (=> b!539474 (= res!334578 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10425))))

(declare-fun res!334576 () Bool)

(declare-fun e!312742 () Bool)

(assert (=> start!48970 (=> (not res!334576) (not e!312742))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48970 (= res!334576 (validMask!0 mask!3216))))

(assert (=> start!48970 e!312742))

(assert (=> start!48970 true))

(declare-fun array_inv!12261 (array!34130) Bool)

(assert (=> start!48970 (array_inv!12261 a!3154)))

(declare-fun b!539475 () Bool)

(declare-fun res!334579 () Bool)

(assert (=> b!539475 (=> (not res!334579) (not e!312742))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539475 (= res!334579 (validKeyInArray!0 k0!1998))))

(declare-fun b!539476 () Bool)

(assert (=> b!539476 (= e!312742 e!312744)))

(declare-fun res!334580 () Bool)

(assert (=> b!539476 (=> (not res!334580) (not e!312744))))

(declare-datatypes ((SeekEntryResult!4816 0))(
  ( (MissingZero!4816 (index!21488 (_ BitVec 32))) (Found!4816 (index!21489 (_ BitVec 32))) (Intermediate!4816 (undefined!5628 Bool) (index!21490 (_ BitVec 32)) (x!50554 (_ BitVec 32))) (Undefined!4816) (MissingVacant!4816 (index!21491 (_ BitVec 32))) )
))
(declare-fun lt!247213 () SeekEntryResult!4816)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539476 (= res!334580 (or (= lt!247213 (MissingZero!4816 i!1153)) (= lt!247213 (MissingVacant!4816 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34130 (_ BitVec 32)) SeekEntryResult!4816)

(assert (=> b!539476 (= lt!247213 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539477 () Bool)

(declare-fun res!334577 () Bool)

(assert (=> b!539477 (=> (not res!334577) (not e!312744))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539477 (= res!334577 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16766 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16766 a!3154)) (= (select (arr!16402 a!3154) resIndex!32) (select (arr!16402 a!3154) j!147))))))

(declare-fun b!539478 () Bool)

(declare-fun res!334581 () Bool)

(assert (=> b!539478 (=> (not res!334581) (not e!312742))))

(declare-fun arrayContainsKey!0 (array!34130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539478 (= res!334581 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539479 () Bool)

(declare-fun res!334574 () Bool)

(assert (=> b!539479 (=> (not res!334574) (not e!312742))))

(assert (=> b!539479 (= res!334574 (and (= (size!16766 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16766 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16766 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539480 () Bool)

(declare-fun res!334575 () Bool)

(assert (=> b!539480 (=> (not res!334575) (not e!312742))))

(assert (=> b!539480 (= res!334575 (validKeyInArray!0 (select (arr!16402 a!3154) j!147)))))

(declare-fun b!539481 () Bool)

(assert (=> b!539481 (= e!312744 false)))

(declare-fun lt!247212 () SeekEntryResult!4816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34130 (_ BitVec 32)) SeekEntryResult!4816)

(assert (=> b!539481 (= lt!247212 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16402 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539482 () Bool)

(declare-fun res!334582 () Bool)

(assert (=> b!539482 (=> (not res!334582) (not e!312744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34130 (_ BitVec 32)) Bool)

(assert (=> b!539482 (= res!334582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48970 res!334576) b!539479))

(assert (= (and b!539479 res!334574) b!539480))

(assert (= (and b!539480 res!334575) b!539475))

(assert (= (and b!539475 res!334579) b!539478))

(assert (= (and b!539478 res!334581) b!539476))

(assert (= (and b!539476 res!334580) b!539482))

(assert (= (and b!539482 res!334582) b!539474))

(assert (= (and b!539474 res!334578) b!539477))

(assert (= (and b!539477 res!334577) b!539481))

(declare-fun m!518653 () Bool)

(assert (=> b!539474 m!518653))

(declare-fun m!518655 () Bool)

(assert (=> b!539475 m!518655))

(declare-fun m!518657 () Bool)

(assert (=> start!48970 m!518657))

(declare-fun m!518659 () Bool)

(assert (=> start!48970 m!518659))

(declare-fun m!518661 () Bool)

(assert (=> b!539481 m!518661))

(assert (=> b!539481 m!518661))

(declare-fun m!518663 () Bool)

(assert (=> b!539481 m!518663))

(declare-fun m!518665 () Bool)

(assert (=> b!539477 m!518665))

(assert (=> b!539477 m!518661))

(declare-fun m!518667 () Bool)

(assert (=> b!539478 m!518667))

(assert (=> b!539480 m!518661))

(assert (=> b!539480 m!518661))

(declare-fun m!518669 () Bool)

(assert (=> b!539480 m!518669))

(declare-fun m!518671 () Bool)

(assert (=> b!539476 m!518671))

(declare-fun m!518673 () Bool)

(assert (=> b!539482 m!518673))

(check-sat (not b!539481) (not b!539475) (not b!539478) (not b!539474) (not b!539482) (not b!539476) (not b!539480) (not start!48970))
(check-sat)
