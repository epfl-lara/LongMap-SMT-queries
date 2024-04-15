; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48906 () Bool)

(assert start!48906)

(declare-fun b!538915 () Bool)

(declare-fun e!312414 () Bool)

(assert (=> b!538915 (= e!312414 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34128 0))(
  ( (array!34129 (arr!16403 (Array (_ BitVec 32) (_ BitVec 64))) (size!16768 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34128)

(declare-fun lt!246852 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538915 (= lt!246852 (toIndex!0 (select (arr!16403 a!3154) j!147) mask!3216))))

(declare-fun b!538916 () Bool)

(declare-fun res!334266 () Bool)

(assert (=> b!538916 (=> (not res!334266) (not e!312414))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538916 (= res!334266 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16768 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16768 a!3154)) (= (select (arr!16403 a!3154) resIndex!32) (select (arr!16403 a!3154) j!147))))))

(declare-fun b!538917 () Bool)

(declare-fun res!334270 () Bool)

(declare-fun e!312413 () Bool)

(assert (=> b!538917 (=> (not res!334270) (not e!312413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538917 (= res!334270 (validKeyInArray!0 (select (arr!16403 a!3154) j!147)))))

(declare-fun b!538918 () Bool)

(declare-fun res!334264 () Bool)

(assert (=> b!538918 (=> (not res!334264) (not e!312413))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538918 (= res!334264 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538919 () Bool)

(assert (=> b!538919 (= e!312413 e!312414)))

(declare-fun res!334262 () Bool)

(assert (=> b!538919 (=> (not res!334262) (not e!312414))))

(declare-datatypes ((SeekEntryResult!4858 0))(
  ( (MissingZero!4858 (index!21656 (_ BitVec 32))) (Found!4858 (index!21657 (_ BitVec 32))) (Intermediate!4858 (undefined!5670 Bool) (index!21658 (_ BitVec 32)) (x!50580 (_ BitVec 32))) (Undefined!4858) (MissingVacant!4858 (index!21659 (_ BitVec 32))) )
))
(declare-fun lt!246853 () SeekEntryResult!4858)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538919 (= res!334262 (or (= lt!246853 (MissingZero!4858 i!1153)) (= lt!246853 (MissingVacant!4858 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34128 (_ BitVec 32)) SeekEntryResult!4858)

(assert (=> b!538919 (= lt!246853 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538920 () Bool)

(declare-fun res!334263 () Bool)

(assert (=> b!538920 (=> (not res!334263) (not e!312413))))

(assert (=> b!538920 (= res!334263 (validKeyInArray!0 k0!1998))))

(declare-fun b!538921 () Bool)

(declare-fun res!334271 () Bool)

(assert (=> b!538921 (=> (not res!334271) (not e!312414))))

(declare-datatypes ((List!10561 0))(
  ( (Nil!10558) (Cons!10557 (h!11500 (_ BitVec 64)) (t!16780 List!10561)) )
))
(declare-fun arrayNoDuplicates!0 (array!34128 (_ BitVec 32) List!10561) Bool)

(assert (=> b!538921 (= res!334271 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10558))))

(declare-fun b!538922 () Bool)

(declare-fun res!334269 () Bool)

(assert (=> b!538922 (=> (not res!334269) (not e!312413))))

(assert (=> b!538922 (= res!334269 (and (= (size!16768 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16768 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16768 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334267 () Bool)

(assert (=> start!48906 (=> (not res!334267) (not e!312413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48906 (= res!334267 (validMask!0 mask!3216))))

(assert (=> start!48906 e!312413))

(assert (=> start!48906 true))

(declare-fun array_inv!12286 (array!34128) Bool)

(assert (=> start!48906 (array_inv!12286 a!3154)))

(declare-fun b!538923 () Bool)

(declare-fun res!334268 () Bool)

(assert (=> b!538923 (=> (not res!334268) (not e!312414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34128 (_ BitVec 32)) Bool)

(assert (=> b!538923 (= res!334268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538924 () Bool)

(declare-fun res!334265 () Bool)

(assert (=> b!538924 (=> (not res!334265) (not e!312414))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34128 (_ BitVec 32)) SeekEntryResult!4858)

(assert (=> b!538924 (= res!334265 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16403 a!3154) j!147) a!3154 mask!3216) (Intermediate!4858 false resIndex!32 resX!32)))))

(assert (= (and start!48906 res!334267) b!538922))

(assert (= (and b!538922 res!334269) b!538917))

(assert (= (and b!538917 res!334270) b!538920))

(assert (= (and b!538920 res!334263) b!538918))

(assert (= (and b!538918 res!334264) b!538919))

(assert (= (and b!538919 res!334262) b!538923))

(assert (= (and b!538923 res!334268) b!538921))

(assert (= (and b!538921 res!334271) b!538916))

(assert (= (and b!538916 res!334266) b!538924))

(assert (= (and b!538924 res!334265) b!538915))

(declare-fun m!517507 () Bool)

(assert (=> b!538918 m!517507))

(declare-fun m!517509 () Bool)

(assert (=> start!48906 m!517509))

(declare-fun m!517511 () Bool)

(assert (=> start!48906 m!517511))

(declare-fun m!517513 () Bool)

(assert (=> b!538921 m!517513))

(declare-fun m!517515 () Bool)

(assert (=> b!538916 m!517515))

(declare-fun m!517517 () Bool)

(assert (=> b!538916 m!517517))

(assert (=> b!538924 m!517517))

(assert (=> b!538924 m!517517))

(declare-fun m!517519 () Bool)

(assert (=> b!538924 m!517519))

(assert (=> b!538915 m!517517))

(assert (=> b!538915 m!517517))

(declare-fun m!517521 () Bool)

(assert (=> b!538915 m!517521))

(declare-fun m!517523 () Bool)

(assert (=> b!538920 m!517523))

(declare-fun m!517525 () Bool)

(assert (=> b!538923 m!517525))

(declare-fun m!517527 () Bool)

(assert (=> b!538919 m!517527))

(assert (=> b!538917 m!517517))

(assert (=> b!538917 m!517517))

(declare-fun m!517529 () Bool)

(assert (=> b!538917 m!517529))

(check-sat (not b!538919) (not b!538915) (not start!48906) (not b!538924) (not b!538920) (not b!538923) (not b!538918) (not b!538921) (not b!538917))
(check-sat)
