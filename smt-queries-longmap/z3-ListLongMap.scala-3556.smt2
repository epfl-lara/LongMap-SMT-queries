; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48952 () Bool)

(assert start!48952)

(declare-fun b!539236 () Bool)

(declare-fun res!334342 () Bool)

(declare-fun e!312662 () Bool)

(assert (=> b!539236 (=> (not res!334342) (not e!312662))))

(declare-datatypes ((array!34112 0))(
  ( (array!34113 (arr!16393 (Array (_ BitVec 32) (_ BitVec 64))) (size!16757 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34112)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539236 (= res!334342 (validKeyInArray!0 (select (arr!16393 a!3154) j!147)))))

(declare-fun b!539237 () Bool)

(declare-fun res!334340 () Bool)

(assert (=> b!539237 (=> (not res!334340) (not e!312662))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539237 (= res!334340 (and (= (size!16757 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16757 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16757 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334336 () Bool)

(assert (=> start!48952 (=> (not res!334336) (not e!312662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48952 (= res!334336 (validMask!0 mask!3216))))

(assert (=> start!48952 e!312662))

(assert (=> start!48952 true))

(declare-fun array_inv!12252 (array!34112) Bool)

(assert (=> start!48952 (array_inv!12252 a!3154)))

(declare-fun b!539238 () Bool)

(declare-fun res!334341 () Bool)

(declare-fun e!312661 () Bool)

(assert (=> b!539238 (=> (not res!334341) (not e!312661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34112 (_ BitVec 32)) Bool)

(assert (=> b!539238 (= res!334341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539239 () Bool)

(declare-fun res!334338 () Bool)

(assert (=> b!539239 (=> (not res!334338) (not e!312662))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34112 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539239 (= res!334338 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539240 () Bool)

(assert (=> b!539240 (= e!312662 e!312661)))

(declare-fun res!334337 () Bool)

(assert (=> b!539240 (=> (not res!334337) (not e!312661))))

(declare-datatypes ((SeekEntryResult!4807 0))(
  ( (MissingZero!4807 (index!21452 (_ BitVec 32))) (Found!4807 (index!21453 (_ BitVec 32))) (Intermediate!4807 (undefined!5619 Bool) (index!21454 (_ BitVec 32)) (x!50521 (_ BitVec 32))) (Undefined!4807) (MissingVacant!4807 (index!21455 (_ BitVec 32))) )
))
(declare-fun lt!247159 () SeekEntryResult!4807)

(assert (=> b!539240 (= res!334337 (or (= lt!247159 (MissingZero!4807 i!1153)) (= lt!247159 (MissingVacant!4807 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34112 (_ BitVec 32)) SeekEntryResult!4807)

(assert (=> b!539240 (= lt!247159 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539241 () Bool)

(assert (=> b!539241 (= e!312661 false)))

(declare-fun lt!247158 () Bool)

(declare-datatypes ((List!10419 0))(
  ( (Nil!10416) (Cons!10415 (h!11361 (_ BitVec 64)) (t!16639 List!10419)) )
))
(declare-fun arrayNoDuplicates!0 (array!34112 (_ BitVec 32) List!10419) Bool)

(assert (=> b!539241 (= lt!247158 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10416))))

(declare-fun b!539242 () Bool)

(declare-fun res!334339 () Bool)

(assert (=> b!539242 (=> (not res!334339) (not e!312662))))

(assert (=> b!539242 (= res!334339 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48952 res!334336) b!539237))

(assert (= (and b!539237 res!334340) b!539236))

(assert (= (and b!539236 res!334342) b!539242))

(assert (= (and b!539242 res!334339) b!539239))

(assert (= (and b!539239 res!334338) b!539240))

(assert (= (and b!539240 res!334337) b!539238))

(assert (= (and b!539238 res!334341) b!539241))

(declare-fun m!518461 () Bool)

(assert (=> b!539238 m!518461))

(declare-fun m!518463 () Bool)

(assert (=> b!539242 m!518463))

(declare-fun m!518465 () Bool)

(assert (=> b!539236 m!518465))

(assert (=> b!539236 m!518465))

(declare-fun m!518467 () Bool)

(assert (=> b!539236 m!518467))

(declare-fun m!518469 () Bool)

(assert (=> b!539241 m!518469))

(declare-fun m!518471 () Bool)

(assert (=> b!539239 m!518471))

(declare-fun m!518473 () Bool)

(assert (=> b!539240 m!518473))

(declare-fun m!518475 () Bool)

(assert (=> start!48952 m!518475))

(declare-fun m!518477 () Bool)

(assert (=> start!48952 m!518477))

(check-sat (not b!539238) (not b!539239) (not b!539236) (not b!539242) (not b!539240) (not start!48952) (not b!539241))
(check-sat)
