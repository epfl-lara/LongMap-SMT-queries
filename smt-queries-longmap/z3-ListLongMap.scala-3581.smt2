; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49318 () Bool)

(assert start!49318)

(declare-fun b!542594 () Bool)

(declare-fun res!337051 () Bool)

(declare-fun e!314082 () Bool)

(assert (=> b!542594 (=> (not res!337051) (not e!314082))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34274 0))(
  ( (array!34275 (arr!16468 (Array (_ BitVec 32) (_ BitVec 64))) (size!16832 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34274)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542594 (= res!337051 (and (= (size!16832 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16832 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16832 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542595 () Bool)

(declare-fun e!314079 () Bool)

(declare-fun e!314080 () Bool)

(assert (=> b!542595 (= e!314079 e!314080)))

(declare-fun res!337044 () Bool)

(assert (=> b!542595 (=> (not res!337044) (not e!314080))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4882 0))(
  ( (MissingZero!4882 (index!21752 (_ BitVec 32))) (Found!4882 (index!21753 (_ BitVec 32))) (Intermediate!4882 (undefined!5694 Bool) (index!21754 (_ BitVec 32)) (x!50820 (_ BitVec 32))) (Undefined!4882) (MissingVacant!4882 (index!21755 (_ BitVec 32))) )
))
(declare-fun lt!248020 () SeekEntryResult!4882)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542595 (= res!337044 (= lt!248020 (Intermediate!4882 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34274 (_ BitVec 32)) SeekEntryResult!4882)

(assert (=> b!542595 (= lt!248020 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542596 () Bool)

(declare-fun res!337045 () Bool)

(assert (=> b!542596 (=> (not res!337045) (not e!314079))))

(assert (=> b!542596 (= res!337045 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16832 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16832 a!3154)) (= (select (arr!16468 a!3154) resIndex!32) (select (arr!16468 a!3154) j!147))))))

(declare-fun b!542597 () Bool)

(assert (=> b!542597 (= e!314080 false)))

(declare-fun lt!248018 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542597 (= lt!248018 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun res!337048 () Bool)

(assert (=> start!49318 (=> (not res!337048) (not e!314082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49318 (= res!337048 (validMask!0 mask!3216))))

(assert (=> start!49318 e!314082))

(assert (=> start!49318 true))

(declare-fun array_inv!12327 (array!34274) Bool)

(assert (=> start!49318 (array_inv!12327 a!3154)))

(declare-fun b!542598 () Bool)

(declare-fun res!337050 () Bool)

(assert (=> b!542598 (=> (not res!337050) (not e!314082))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542598 (= res!337050 (validKeyInArray!0 k0!1998))))

(declare-fun b!542599 () Bool)

(declare-fun res!337047 () Bool)

(assert (=> b!542599 (=> (not res!337047) (not e!314082))))

(assert (=> b!542599 (= res!337047 (validKeyInArray!0 (select (arr!16468 a!3154) j!147)))))

(declare-fun b!542600 () Bool)

(declare-fun res!337049 () Bool)

(assert (=> b!542600 (=> (not res!337049) (not e!314082))))

(declare-fun arrayContainsKey!0 (array!34274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542600 (= res!337049 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542601 () Bool)

(declare-fun res!337041 () Bool)

(assert (=> b!542601 (=> (not res!337041) (not e!314079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34274 (_ BitVec 32)) Bool)

(assert (=> b!542601 (= res!337041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542602 () Bool)

(assert (=> b!542602 (= e!314082 e!314079)))

(declare-fun res!337042 () Bool)

(assert (=> b!542602 (=> (not res!337042) (not e!314079))))

(declare-fun lt!248019 () SeekEntryResult!4882)

(assert (=> b!542602 (= res!337042 (or (= lt!248019 (MissingZero!4882 i!1153)) (= lt!248019 (MissingVacant!4882 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34274 (_ BitVec 32)) SeekEntryResult!4882)

(assert (=> b!542602 (= lt!248019 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542603 () Bool)

(declare-fun res!337046 () Bool)

(assert (=> b!542603 (=> (not res!337046) (not e!314079))))

(declare-datatypes ((List!10494 0))(
  ( (Nil!10491) (Cons!10490 (h!11448 (_ BitVec 64)) (t!16714 List!10494)) )
))
(declare-fun arrayNoDuplicates!0 (array!34274 (_ BitVec 32) List!10494) Bool)

(assert (=> b!542603 (= res!337046 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10491))))

(declare-fun b!542604 () Bool)

(declare-fun res!337040 () Bool)

(assert (=> b!542604 (=> (not res!337040) (not e!314080))))

(assert (=> b!542604 (= res!337040 (and (not (= (select (arr!16468 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) index!1177) (select (arr!16468 a!3154) j!147)))))))

(declare-fun b!542605 () Bool)

(declare-fun res!337043 () Bool)

(assert (=> b!542605 (=> (not res!337043) (not e!314080))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542605 (= res!337043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!248020))))

(assert (= (and start!49318 res!337048) b!542594))

(assert (= (and b!542594 res!337051) b!542599))

(assert (= (and b!542599 res!337047) b!542598))

(assert (= (and b!542598 res!337050) b!542600))

(assert (= (and b!542600 res!337049) b!542602))

(assert (= (and b!542602 res!337042) b!542601))

(assert (= (and b!542601 res!337041) b!542603))

(assert (= (and b!542603 res!337046) b!542596))

(assert (= (and b!542596 res!337045) b!542595))

(assert (= (and b!542595 res!337044) b!542605))

(assert (= (and b!542605 res!337043) b!542604))

(assert (= (and b!542604 res!337040) b!542597))

(declare-fun m!520981 () Bool)

(assert (=> b!542603 m!520981))

(declare-fun m!520983 () Bool)

(assert (=> start!49318 m!520983))

(declare-fun m!520985 () Bool)

(assert (=> start!49318 m!520985))

(declare-fun m!520987 () Bool)

(assert (=> b!542598 m!520987))

(declare-fun m!520989 () Bool)

(assert (=> b!542605 m!520989))

(assert (=> b!542605 m!520989))

(declare-fun m!520991 () Bool)

(assert (=> b!542605 m!520991))

(assert (=> b!542605 m!520991))

(assert (=> b!542605 m!520989))

(declare-fun m!520993 () Bool)

(assert (=> b!542605 m!520993))

(declare-fun m!520995 () Bool)

(assert (=> b!542597 m!520995))

(declare-fun m!520997 () Bool)

(assert (=> b!542602 m!520997))

(assert (=> b!542595 m!520989))

(assert (=> b!542595 m!520989))

(declare-fun m!520999 () Bool)

(assert (=> b!542595 m!520999))

(declare-fun m!521001 () Bool)

(assert (=> b!542601 m!521001))

(declare-fun m!521003 () Bool)

(assert (=> b!542604 m!521003))

(assert (=> b!542604 m!520989))

(declare-fun m!521005 () Bool)

(assert (=> b!542600 m!521005))

(declare-fun m!521007 () Bool)

(assert (=> b!542596 m!521007))

(assert (=> b!542596 m!520989))

(assert (=> b!542599 m!520989))

(assert (=> b!542599 m!520989))

(declare-fun m!521009 () Bool)

(assert (=> b!542599 m!521009))

(check-sat (not b!542605) (not b!542600) (not b!542603) (not b!542597) (not b!542602) (not b!542598) (not b!542595) (not b!542601) (not start!49318) (not b!542599))
(check-sat)
