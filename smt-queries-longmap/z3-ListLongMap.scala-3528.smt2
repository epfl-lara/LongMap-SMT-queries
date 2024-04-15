; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48726 () Bool)

(assert start!48726)

(declare-fun b!535600 () Bool)

(declare-fun e!311023 () Bool)

(declare-fun e!311022 () Bool)

(assert (=> b!535600 (= e!311023 e!311022)))

(declare-fun res!330952 () Bool)

(assert (=> b!535600 (=> (not res!330952) (not e!311022))))

(declare-fun lt!245687 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((array!33948 0))(
  ( (array!33949 (arr!16313 (Array (_ BitVec 32) (_ BitVec 64))) (size!16678 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33948)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535600 (= res!330952 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245687 #b00000000000000000000000000000000) (bvslt lt!245687 (size!16678 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535600 (= lt!245687 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535601 () Bool)

(declare-fun res!330956 () Bool)

(declare-fun e!311021 () Bool)

(assert (=> b!535601 (=> (not res!330956) (not e!311021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33948 (_ BitVec 32)) Bool)

(assert (=> b!535601 (= res!330956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535602 () Bool)

(declare-fun res!330953 () Bool)

(assert (=> b!535602 (=> (not res!330953) (not e!311021))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!535602 (= res!330953 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16678 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16678 a!3154)) (= (select (arr!16313 a!3154) resIndex!32) (select (arr!16313 a!3154) j!147))))))

(declare-fun b!535603 () Bool)

(declare-fun res!330957 () Bool)

(assert (=> b!535603 (=> (not res!330957) (not e!311023))))

(assert (=> b!535603 (= res!330957 (and (not (= (select (arr!16313 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16313 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16313 a!3154) index!1177) (select (arr!16313 a!3154) j!147)))))))

(declare-fun b!535604 () Bool)

(declare-fun res!330955 () Bool)

(assert (=> b!535604 (=> (not res!330955) (not e!311023))))

(declare-datatypes ((SeekEntryResult!4768 0))(
  ( (MissingZero!4768 (index!21296 (_ BitVec 32))) (Found!4768 (index!21297 (_ BitVec 32))) (Intermediate!4768 (undefined!5580 Bool) (index!21298 (_ BitVec 32)) (x!50250 (_ BitVec 32))) (Undefined!4768) (MissingVacant!4768 (index!21299 (_ BitVec 32))) )
))
(declare-fun lt!245689 () SeekEntryResult!4768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33948 (_ BitVec 32)) SeekEntryResult!4768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535604 (= res!330955 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16313 a!3154) j!147) mask!3216) (select (arr!16313 a!3154) j!147) a!3154 mask!3216) lt!245689))))

(declare-fun b!535605 () Bool)

(declare-fun res!330947 () Bool)

(declare-fun e!311025 () Bool)

(assert (=> b!535605 (=> (not res!330947) (not e!311025))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535605 (= res!330947 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535606 () Bool)

(declare-fun res!330959 () Bool)

(assert (=> b!535606 (=> (not res!330959) (not e!311025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535606 (= res!330959 (validKeyInArray!0 k0!1998))))

(declare-fun b!535607 () Bool)

(declare-fun res!330948 () Bool)

(assert (=> b!535607 (=> (not res!330948) (not e!311025))))

(assert (=> b!535607 (= res!330948 (validKeyInArray!0 (select (arr!16313 a!3154) j!147)))))

(declare-fun b!535608 () Bool)

(assert (=> b!535608 (= e!311021 e!311023)))

(declare-fun res!330951 () Bool)

(assert (=> b!535608 (=> (not res!330951) (not e!311023))))

(assert (=> b!535608 (= res!330951 (= lt!245689 (Intermediate!4768 false resIndex!32 resX!32)))))

(assert (=> b!535608 (= lt!245689 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16313 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535609 () Bool)

(assert (=> b!535609 (= e!311022 false)))

(declare-fun lt!245686 () SeekEntryResult!4768)

(assert (=> b!535609 (= lt!245686 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245687 (select (arr!16313 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535610 () Bool)

(assert (=> b!535610 (= e!311025 e!311021)))

(declare-fun res!330958 () Bool)

(assert (=> b!535610 (=> (not res!330958) (not e!311021))))

(declare-fun lt!245688 () SeekEntryResult!4768)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535610 (= res!330958 (or (= lt!245688 (MissingZero!4768 i!1153)) (= lt!245688 (MissingVacant!4768 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33948 (_ BitVec 32)) SeekEntryResult!4768)

(assert (=> b!535610 (= lt!245688 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!330949 () Bool)

(assert (=> start!48726 (=> (not res!330949) (not e!311025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48726 (= res!330949 (validMask!0 mask!3216))))

(assert (=> start!48726 e!311025))

(assert (=> start!48726 true))

(declare-fun array_inv!12196 (array!33948) Bool)

(assert (=> start!48726 (array_inv!12196 a!3154)))

(declare-fun b!535611 () Bool)

(declare-fun res!330950 () Bool)

(assert (=> b!535611 (=> (not res!330950) (not e!311025))))

(assert (=> b!535611 (= res!330950 (and (= (size!16678 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16678 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16678 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535612 () Bool)

(declare-fun res!330954 () Bool)

(assert (=> b!535612 (=> (not res!330954) (not e!311021))))

(declare-datatypes ((List!10471 0))(
  ( (Nil!10468) (Cons!10467 (h!11410 (_ BitVec 64)) (t!16690 List!10471)) )
))
(declare-fun arrayNoDuplicates!0 (array!33948 (_ BitVec 32) List!10471) Bool)

(assert (=> b!535612 (= res!330954 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10468))))

(assert (= (and start!48726 res!330949) b!535611))

(assert (= (and b!535611 res!330950) b!535607))

(assert (= (and b!535607 res!330948) b!535606))

(assert (= (and b!535606 res!330959) b!535605))

(assert (= (and b!535605 res!330947) b!535610))

(assert (= (and b!535610 res!330958) b!535601))

(assert (= (and b!535601 res!330956) b!535612))

(assert (= (and b!535612 res!330954) b!535602))

(assert (= (and b!535602 res!330953) b!535608))

(assert (= (and b!535608 res!330951) b!535604))

(assert (= (and b!535604 res!330955) b!535603))

(assert (= (and b!535603 res!330957) b!535600))

(assert (= (and b!535600 res!330952) b!535609))

(declare-fun m!514633 () Bool)

(assert (=> b!535612 m!514633))

(declare-fun m!514635 () Bool)

(assert (=> b!535606 m!514635))

(declare-fun m!514637 () Bool)

(assert (=> b!535607 m!514637))

(assert (=> b!535607 m!514637))

(declare-fun m!514639 () Bool)

(assert (=> b!535607 m!514639))

(assert (=> b!535604 m!514637))

(assert (=> b!535604 m!514637))

(declare-fun m!514641 () Bool)

(assert (=> b!535604 m!514641))

(assert (=> b!535604 m!514641))

(assert (=> b!535604 m!514637))

(declare-fun m!514643 () Bool)

(assert (=> b!535604 m!514643))

(declare-fun m!514645 () Bool)

(assert (=> b!535602 m!514645))

(assert (=> b!535602 m!514637))

(declare-fun m!514647 () Bool)

(assert (=> b!535610 m!514647))

(assert (=> b!535609 m!514637))

(assert (=> b!535609 m!514637))

(declare-fun m!514649 () Bool)

(assert (=> b!535609 m!514649))

(declare-fun m!514651 () Bool)

(assert (=> b!535605 m!514651))

(assert (=> b!535608 m!514637))

(assert (=> b!535608 m!514637))

(declare-fun m!514653 () Bool)

(assert (=> b!535608 m!514653))

(declare-fun m!514655 () Bool)

(assert (=> b!535601 m!514655))

(declare-fun m!514657 () Bool)

(assert (=> b!535603 m!514657))

(assert (=> b!535603 m!514637))

(declare-fun m!514659 () Bool)

(assert (=> b!535600 m!514659))

(declare-fun m!514661 () Bool)

(assert (=> start!48726 m!514661))

(declare-fun m!514663 () Bool)

(assert (=> start!48726 m!514663))

(check-sat (not b!535612) (not b!535608) (not b!535607) (not b!535601) (not start!48726) (not b!535605) (not b!535600) (not b!535610) (not b!535604) (not b!535609) (not b!535606))
(check-sat)
