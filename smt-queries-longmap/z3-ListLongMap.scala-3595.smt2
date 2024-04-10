; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49442 () Bool)

(assert start!49442)

(declare-fun b!544413 () Bool)

(declare-fun e!314768 () Bool)

(declare-fun e!314769 () Bool)

(assert (=> b!544413 (= e!314768 e!314769)))

(declare-fun res!338682 () Bool)

(assert (=> b!544413 (=> (not res!338682) (not e!314769))))

(declare-datatypes ((SeekEntryResult!4974 0))(
  ( (MissingZero!4974 (index!22120 (_ BitVec 32))) (Found!4974 (index!22121 (_ BitVec 32))) (Intermediate!4974 (undefined!5786 Bool) (index!22122 (_ BitVec 32)) (x!51036 (_ BitVec 32))) (Undefined!4974) (MissingVacant!4974 (index!22123 (_ BitVec 32))) )
))
(declare-fun lt!248483 () SeekEntryResult!4974)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544413 (= res!338682 (= lt!248483 (Intermediate!4974 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34369 0))(
  ( (array!34370 (arr!16516 (Array (_ BitVec 32) (_ BitVec 64))) (size!16880 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34369)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34369 (_ BitVec 32)) SeekEntryResult!4974)

(assert (=> b!544413 (= lt!248483 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16516 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544414 () Bool)

(declare-fun res!338687 () Bool)

(assert (=> b!544414 (=> (not res!338687) (not e!314768))))

(assert (=> b!544414 (= res!338687 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16880 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16880 a!3154)) (= (select (arr!16516 a!3154) resIndex!32) (select (arr!16516 a!3154) j!147))))))

(declare-fun b!544415 () Bool)

(declare-fun res!338686 () Bool)

(declare-fun e!314767 () Bool)

(assert (=> b!544415 (=> (not res!338686) (not e!314767))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544415 (= res!338686 (and (= (size!16880 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16880 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16880 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544416 () Bool)

(declare-fun res!338684 () Bool)

(assert (=> b!544416 (=> (not res!338684) (not e!314767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544416 (= res!338684 (validKeyInArray!0 (select (arr!16516 a!3154) j!147)))))

(declare-fun b!544418 () Bool)

(assert (=> b!544418 (= e!314767 e!314768)))

(declare-fun res!338679 () Bool)

(assert (=> b!544418 (=> (not res!338679) (not e!314768))))

(declare-fun lt!248484 () SeekEntryResult!4974)

(assert (=> b!544418 (= res!338679 (or (= lt!248484 (MissingZero!4974 i!1153)) (= lt!248484 (MissingVacant!4974 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34369 (_ BitVec 32)) SeekEntryResult!4974)

(assert (=> b!544418 (= lt!248484 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544419 () Bool)

(declare-fun res!338680 () Bool)

(assert (=> b!544419 (=> (not res!338680) (not e!314767))))

(assert (=> b!544419 (= res!338680 (validKeyInArray!0 k0!1998))))

(declare-fun b!544420 () Bool)

(declare-fun res!338678 () Bool)

(assert (=> b!544420 (=> (not res!338678) (not e!314769))))

(assert (=> b!544420 (= res!338678 (and (not (= (select (arr!16516 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16516 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16516 a!3154) index!1177) (select (arr!16516 a!3154) j!147)))))))

(declare-fun b!544421 () Bool)

(assert (=> b!544421 (= e!314769 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvslt (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000)))))

(declare-fun lt!248485 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544421 (= lt!248485 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544422 () Bool)

(declare-fun res!338676 () Bool)

(assert (=> b!544422 (=> (not res!338676) (not e!314768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34369 (_ BitVec 32)) Bool)

(assert (=> b!544422 (= res!338676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544423 () Bool)

(declare-fun res!338685 () Bool)

(assert (=> b!544423 (=> (not res!338685) (not e!314769))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544423 (= res!338685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16516 a!3154) j!147) mask!3216) (select (arr!16516 a!3154) j!147) a!3154 mask!3216) lt!248483))))

(declare-fun b!544424 () Bool)

(declare-fun res!338681 () Bool)

(assert (=> b!544424 (=> (not res!338681) (not e!314768))))

(declare-datatypes ((List!10635 0))(
  ( (Nil!10632) (Cons!10631 (h!11589 (_ BitVec 64)) (t!16863 List!10635)) )
))
(declare-fun arrayNoDuplicates!0 (array!34369 (_ BitVec 32) List!10635) Bool)

(assert (=> b!544424 (= res!338681 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10632))))

(declare-fun b!544417 () Bool)

(declare-fun res!338683 () Bool)

(assert (=> b!544417 (=> (not res!338683) (not e!314767))))

(declare-fun arrayContainsKey!0 (array!34369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544417 (= res!338683 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338677 () Bool)

(assert (=> start!49442 (=> (not res!338677) (not e!314767))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49442 (= res!338677 (validMask!0 mask!3216))))

(assert (=> start!49442 e!314767))

(assert (=> start!49442 true))

(declare-fun array_inv!12312 (array!34369) Bool)

(assert (=> start!49442 (array_inv!12312 a!3154)))

(assert (= (and start!49442 res!338677) b!544415))

(assert (= (and b!544415 res!338686) b!544416))

(assert (= (and b!544416 res!338684) b!544419))

(assert (= (and b!544419 res!338680) b!544417))

(assert (= (and b!544417 res!338683) b!544418))

(assert (= (and b!544418 res!338679) b!544422))

(assert (= (and b!544422 res!338676) b!544424))

(assert (= (and b!544424 res!338681) b!544414))

(assert (= (and b!544414 res!338687) b!544413))

(assert (= (and b!544413 res!338682) b!544423))

(assert (= (and b!544423 res!338685) b!544420))

(assert (= (and b!544420 res!338678) b!544421))

(declare-fun m!522315 () Bool)

(assert (=> b!544417 m!522315))

(declare-fun m!522317 () Bool)

(assert (=> b!544413 m!522317))

(assert (=> b!544413 m!522317))

(declare-fun m!522319 () Bool)

(assert (=> b!544413 m!522319))

(declare-fun m!522321 () Bool)

(assert (=> b!544420 m!522321))

(assert (=> b!544420 m!522317))

(assert (=> b!544416 m!522317))

(assert (=> b!544416 m!522317))

(declare-fun m!522323 () Bool)

(assert (=> b!544416 m!522323))

(declare-fun m!522325 () Bool)

(assert (=> b!544419 m!522325))

(declare-fun m!522327 () Bool)

(assert (=> b!544424 m!522327))

(declare-fun m!522329 () Bool)

(assert (=> b!544421 m!522329))

(declare-fun m!522331 () Bool)

(assert (=> start!49442 m!522331))

(declare-fun m!522333 () Bool)

(assert (=> start!49442 m!522333))

(declare-fun m!522335 () Bool)

(assert (=> b!544414 m!522335))

(assert (=> b!544414 m!522317))

(declare-fun m!522337 () Bool)

(assert (=> b!544418 m!522337))

(declare-fun m!522339 () Bool)

(assert (=> b!544422 m!522339))

(assert (=> b!544423 m!522317))

(assert (=> b!544423 m!522317))

(declare-fun m!522341 () Bool)

(assert (=> b!544423 m!522341))

(assert (=> b!544423 m!522341))

(assert (=> b!544423 m!522317))

(declare-fun m!522343 () Bool)

(assert (=> b!544423 m!522343))

(check-sat (not b!544423) (not b!544422) (not b!544421) (not start!49442) (not b!544417) (not b!544424) (not b!544416) (not b!544418) (not b!544419) (not b!544413))
(check-sat)
