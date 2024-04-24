; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48904 () Bool)

(assert start!48904)

(declare-fun b!538411 () Bool)

(declare-fun res!333518 () Bool)

(declare-fun e!312229 () Bool)

(assert (=> b!538411 (=> (not res!333518) (not e!312229))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34064 0))(
  ( (array!34065 (arr!16369 (Array (_ BitVec 32) (_ BitVec 64))) (size!16733 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34064)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538411 (= res!333518 (and (= (size!16733 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16733 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16733 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538412 () Bool)

(declare-fun e!312234 () Bool)

(declare-fun e!312233 () Bool)

(assert (=> b!538412 (= e!312234 e!312233)))

(declare-fun res!333522 () Bool)

(assert (=> b!538412 (=> (not res!333522) (not e!312233))))

(declare-datatypes ((SeekEntryResult!4783 0))(
  ( (MissingZero!4783 (index!21356 (_ BitVec 32))) (Found!4783 (index!21357 (_ BitVec 32))) (Intermediate!4783 (undefined!5595 Bool) (index!21358 (_ BitVec 32)) (x!50433 (_ BitVec 32))) (Undefined!4783) (MissingVacant!4783 (index!21359 (_ BitVec 32))) )
))
(declare-fun lt!246758 () SeekEntryResult!4783)

(declare-fun lt!246759 () SeekEntryResult!4783)

(declare-fun lt!246754 () SeekEntryResult!4783)

(assert (=> b!538412 (= res!333522 (and (= lt!246754 lt!246758) (= lt!246759 lt!246754)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246755 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4783)

(assert (=> b!538412 (= lt!246754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246755 (select (arr!16369 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538413 () Bool)

(declare-fun e!312232 () Bool)

(declare-fun e!312230 () Bool)

(assert (=> b!538413 (= e!312232 e!312230)))

(declare-fun res!333516 () Bool)

(assert (=> b!538413 (=> (not res!333516) (not e!312230))))

(declare-fun lt!246757 () SeekEntryResult!4783)

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!538413 (= res!333516 (and (= lt!246759 lt!246757) (not (= (select (arr!16369 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16369 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16369 a!3154) index!1177) (select (arr!16369 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538413 (= lt!246759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16369 a!3154) j!147) mask!3216) (select (arr!16369 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538414 () Bool)

(declare-fun e!312231 () Bool)

(assert (=> b!538414 (= e!312229 e!312231)))

(declare-fun res!333515 () Bool)

(assert (=> b!538414 (=> (not res!333515) (not e!312231))))

(declare-fun lt!246760 () SeekEntryResult!4783)

(assert (=> b!538414 (= res!333515 (or (= lt!246760 (MissingZero!4783 i!1153)) (= lt!246760 (MissingVacant!4783 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34064 (_ BitVec 32)) SeekEntryResult!4783)

(assert (=> b!538414 (= lt!246760 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538415 () Bool)

(declare-fun res!333513 () Bool)

(assert (=> b!538415 (=> (not res!333513) (not e!312231))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538415 (= res!333513 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16733 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16733 a!3154)) (= (select (arr!16369 a!3154) resIndex!32) (select (arr!16369 a!3154) j!147))))))

(declare-fun b!538416 () Bool)

(declare-fun res!333523 () Bool)

(assert (=> b!538416 (=> (not res!333523) (not e!312229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538416 (= res!333523 (validKeyInArray!0 k0!1998))))

(declare-fun b!538417 () Bool)

(assert (=> b!538417 (= e!312230 e!312234)))

(declare-fun res!333517 () Bool)

(assert (=> b!538417 (=> (not res!333517) (not e!312234))))

(assert (=> b!538417 (= res!333517 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246755 #b00000000000000000000000000000000) (bvslt lt!246755 (size!16733 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538417 (= lt!246755 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538418 () Bool)

(assert (=> b!538418 (= e!312231 e!312232)))

(declare-fun res!333512 () Bool)

(assert (=> b!538418 (=> (not res!333512) (not e!312232))))

(assert (=> b!538418 (= res!333512 (= lt!246757 lt!246758))))

(assert (=> b!538418 (= lt!246758 (Intermediate!4783 false resIndex!32 resX!32))))

(assert (=> b!538418 (= lt!246757 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16369 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!333521 () Bool)

(assert (=> start!48904 (=> (not res!333521) (not e!312229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48904 (= res!333521 (validMask!0 mask!3216))))

(assert (=> start!48904 e!312229))

(assert (=> start!48904 true))

(declare-fun array_inv!12228 (array!34064) Bool)

(assert (=> start!48904 (array_inv!12228 a!3154)))

(declare-fun b!538419 () Bool)

(assert (=> b!538419 (= e!312233 (not true))))

(assert (=> b!538419 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246755 (select (store (arr!16369 a!3154) i!1153 k0!1998) j!147) (array!34065 (store (arr!16369 a!3154) i!1153 k0!1998) (size!16733 a!3154)) mask!3216) lt!246758)))

(declare-datatypes ((Unit!16823 0))(
  ( (Unit!16824) )
))
(declare-fun lt!246756 () Unit!16823)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34064 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16823)

(assert (=> b!538419 (= lt!246756 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246755 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538420 () Bool)

(declare-fun res!333511 () Bool)

(assert (=> b!538420 (=> (not res!333511) (not e!312231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34064 (_ BitVec 32)) Bool)

(assert (=> b!538420 (= res!333511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538421 () Bool)

(declare-fun res!333514 () Bool)

(assert (=> b!538421 (=> (not res!333514) (not e!312231))))

(declare-datatypes ((List!10395 0))(
  ( (Nil!10392) (Cons!10391 (h!11337 (_ BitVec 64)) (t!16615 List!10395)) )
))
(declare-fun arrayNoDuplicates!0 (array!34064 (_ BitVec 32) List!10395) Bool)

(assert (=> b!538421 (= res!333514 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10392))))

(declare-fun b!538422 () Bool)

(declare-fun res!333519 () Bool)

(assert (=> b!538422 (=> (not res!333519) (not e!312229))))

(declare-fun arrayContainsKey!0 (array!34064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538422 (= res!333519 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538423 () Bool)

(declare-fun res!333520 () Bool)

(assert (=> b!538423 (=> (not res!333520) (not e!312229))))

(assert (=> b!538423 (= res!333520 (validKeyInArray!0 (select (arr!16369 a!3154) j!147)))))

(assert (= (and start!48904 res!333521) b!538411))

(assert (= (and b!538411 res!333518) b!538423))

(assert (= (and b!538423 res!333520) b!538416))

(assert (= (and b!538416 res!333523) b!538422))

(assert (= (and b!538422 res!333519) b!538414))

(assert (= (and b!538414 res!333515) b!538420))

(assert (= (and b!538420 res!333511) b!538421))

(assert (= (and b!538421 res!333514) b!538415))

(assert (= (and b!538415 res!333513) b!538418))

(assert (= (and b!538418 res!333512) b!538413))

(assert (= (and b!538413 res!333516) b!538417))

(assert (= (and b!538417 res!333517) b!538412))

(assert (= (and b!538412 res!333522) b!538419))

(declare-fun m!517627 () Bool)

(assert (=> b!538415 m!517627))

(declare-fun m!517629 () Bool)

(assert (=> b!538415 m!517629))

(declare-fun m!517631 () Bool)

(assert (=> b!538416 m!517631))

(declare-fun m!517633 () Bool)

(assert (=> b!538422 m!517633))

(declare-fun m!517635 () Bool)

(assert (=> start!48904 m!517635))

(declare-fun m!517637 () Bool)

(assert (=> start!48904 m!517637))

(declare-fun m!517639 () Bool)

(assert (=> b!538417 m!517639))

(declare-fun m!517641 () Bool)

(assert (=> b!538420 m!517641))

(assert (=> b!538418 m!517629))

(assert (=> b!538418 m!517629))

(declare-fun m!517643 () Bool)

(assert (=> b!538418 m!517643))

(assert (=> b!538423 m!517629))

(assert (=> b!538423 m!517629))

(declare-fun m!517645 () Bool)

(assert (=> b!538423 m!517645))

(assert (=> b!538412 m!517629))

(assert (=> b!538412 m!517629))

(declare-fun m!517647 () Bool)

(assert (=> b!538412 m!517647))

(declare-fun m!517649 () Bool)

(assert (=> b!538414 m!517649))

(declare-fun m!517651 () Bool)

(assert (=> b!538419 m!517651))

(declare-fun m!517653 () Bool)

(assert (=> b!538419 m!517653))

(assert (=> b!538419 m!517653))

(declare-fun m!517655 () Bool)

(assert (=> b!538419 m!517655))

(declare-fun m!517657 () Bool)

(assert (=> b!538419 m!517657))

(declare-fun m!517659 () Bool)

(assert (=> b!538413 m!517659))

(assert (=> b!538413 m!517629))

(assert (=> b!538413 m!517629))

(declare-fun m!517661 () Bool)

(assert (=> b!538413 m!517661))

(assert (=> b!538413 m!517661))

(assert (=> b!538413 m!517629))

(declare-fun m!517663 () Bool)

(assert (=> b!538413 m!517663))

(declare-fun m!517665 () Bool)

(assert (=> b!538421 m!517665))

(check-sat (not b!538423) (not b!538419) (not b!538420) (not b!538422) (not b!538417) (not start!48904) (not b!538418) (not b!538416) (not b!538412) (not b!538413) (not b!538421) (not b!538414))
(check-sat)
