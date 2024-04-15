; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49080 () Bool)

(assert start!49080)

(declare-fun b!540445 () Bool)

(declare-fun res!335475 () Bool)

(declare-fun e!313073 () Bool)

(assert (=> b!540445 (=> (not res!335475) (not e!313073))))

(declare-datatypes ((array!34200 0))(
  ( (array!34201 (arr!16436 (Array (_ BitVec 32) (_ BitVec 64))) (size!16801 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34200)

(declare-datatypes ((List!10594 0))(
  ( (Nil!10591) (Cons!10590 (h!11539 (_ BitVec 64)) (t!16813 List!10594)) )
))
(declare-fun arrayNoDuplicates!0 (array!34200 (_ BitVec 32) List!10594) Bool)

(assert (=> b!540445 (= res!335475 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10591))))

(declare-fun b!540446 () Bool)

(declare-fun res!335479 () Bool)

(declare-fun e!313074 () Bool)

(assert (=> b!540446 (=> (not res!335479) (not e!313074))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540446 (= res!335479 (validKeyInArray!0 k0!1998))))

(declare-fun b!540447 () Bool)

(declare-fun res!335477 () Bool)

(assert (=> b!540447 (=> (not res!335477) (not e!313074))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!540447 (= res!335477 (validKeyInArray!0 (select (arr!16436 a!3154) j!147)))))

(declare-fun b!540448 () Bool)

(declare-fun res!335483 () Bool)

(assert (=> b!540448 (=> (not res!335483) (not e!313074))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540448 (= res!335483 (and (= (size!16801 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16801 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16801 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540449 () Bool)

(declare-fun res!335478 () Bool)

(assert (=> b!540449 (=> (not res!335478) (not e!313073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34200 (_ BitVec 32)) Bool)

(assert (=> b!540449 (= res!335478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540450 () Bool)

(declare-fun res!335480 () Bool)

(assert (=> b!540450 (=> (not res!335480) (not e!313073))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540450 (= res!335480 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16801 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16801 a!3154)) (= (select (arr!16436 a!3154) resIndex!32) (select (arr!16436 a!3154) j!147))))))

(declare-fun res!335482 () Bool)

(assert (=> start!49080 (=> (not res!335482) (not e!313074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49080 (= res!335482 (validMask!0 mask!3216))))

(assert (=> start!49080 e!313074))

(assert (=> start!49080 true))

(declare-fun array_inv!12319 (array!34200) Bool)

(assert (=> start!49080 (array_inv!12319 a!3154)))

(declare-fun b!540451 () Bool)

(assert (=> b!540451 (= e!313073 false)))

(declare-datatypes ((SeekEntryResult!4891 0))(
  ( (MissingZero!4891 (index!21788 (_ BitVec 32))) (Found!4891 (index!21789 (_ BitVec 32))) (Intermediate!4891 (undefined!5703 Bool) (index!21790 (_ BitVec 32)) (x!50713 (_ BitVec 32))) (Undefined!4891) (MissingVacant!4891 (index!21791 (_ BitVec 32))) )
))
(declare-fun lt!247243 () SeekEntryResult!4891)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34200 (_ BitVec 32)) SeekEntryResult!4891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540451 (= lt!247243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16436 a!3154) j!147) mask!3216) (select (arr!16436 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540452 () Bool)

(declare-fun res!335474 () Bool)

(assert (=> b!540452 (=> (not res!335474) (not e!313074))))

(declare-fun arrayContainsKey!0 (array!34200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540452 (= res!335474 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540453 () Bool)

(assert (=> b!540453 (= e!313074 e!313073)))

(declare-fun res!335476 () Bool)

(assert (=> b!540453 (=> (not res!335476) (not e!313073))))

(declare-fun lt!247242 () SeekEntryResult!4891)

(assert (=> b!540453 (= res!335476 (or (= lt!247242 (MissingZero!4891 i!1153)) (= lt!247242 (MissingVacant!4891 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34200 (_ BitVec 32)) SeekEntryResult!4891)

(assert (=> b!540453 (= lt!247242 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540454 () Bool)

(declare-fun res!335481 () Bool)

(assert (=> b!540454 (=> (not res!335481) (not e!313073))))

(assert (=> b!540454 (= res!335481 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16436 a!3154) j!147) a!3154 mask!3216) (Intermediate!4891 false resIndex!32 resX!32)))))

(assert (= (and start!49080 res!335482) b!540448))

(assert (= (and b!540448 res!335483) b!540447))

(assert (= (and b!540447 res!335477) b!540446))

(assert (= (and b!540446 res!335479) b!540452))

(assert (= (and b!540452 res!335474) b!540453))

(assert (= (and b!540453 res!335476) b!540449))

(assert (= (and b!540449 res!335478) b!540445))

(assert (= (and b!540445 res!335475) b!540450))

(assert (= (and b!540450 res!335480) b!540454))

(assert (= (and b!540454 res!335481) b!540451))

(declare-fun m!518635 () Bool)

(assert (=> b!540450 m!518635))

(declare-fun m!518637 () Bool)

(assert (=> b!540450 m!518637))

(declare-fun m!518639 () Bool)

(assert (=> b!540453 m!518639))

(declare-fun m!518641 () Bool)

(assert (=> b!540446 m!518641))

(declare-fun m!518643 () Bool)

(assert (=> b!540449 m!518643))

(assert (=> b!540447 m!518637))

(assert (=> b!540447 m!518637))

(declare-fun m!518645 () Bool)

(assert (=> b!540447 m!518645))

(declare-fun m!518647 () Bool)

(assert (=> b!540452 m!518647))

(declare-fun m!518649 () Bool)

(assert (=> start!49080 m!518649))

(declare-fun m!518651 () Bool)

(assert (=> start!49080 m!518651))

(declare-fun m!518653 () Bool)

(assert (=> b!540445 m!518653))

(assert (=> b!540454 m!518637))

(assert (=> b!540454 m!518637))

(declare-fun m!518655 () Bool)

(assert (=> b!540454 m!518655))

(assert (=> b!540451 m!518637))

(assert (=> b!540451 m!518637))

(declare-fun m!518657 () Bool)

(assert (=> b!540451 m!518657))

(assert (=> b!540451 m!518657))

(assert (=> b!540451 m!518637))

(declare-fun m!518659 () Bool)

(assert (=> b!540451 m!518659))

(check-sat (not b!540453) (not b!540452) (not b!540454) (not b!540451) (not b!540449) (not b!540447) (not b!540446) (not start!49080) (not b!540445))
(check-sat)
