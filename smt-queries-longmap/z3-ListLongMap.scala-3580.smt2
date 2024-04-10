; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49268 () Bool)

(assert start!49268)

(declare-fun b!542322 () Bool)

(declare-fun res!336875 () Bool)

(declare-fun e!313926 () Bool)

(assert (=> b!542322 (=> (not res!336875) (not e!313926))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34276 0))(
  ( (array!34277 (arr!16471 (Array (_ BitVec 32) (_ BitVec 64))) (size!16835 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34276)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542322 (= res!336875 (and (= (size!16835 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16835 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16835 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542323 () Bool)

(declare-fun e!313929 () Bool)

(declare-fun e!313928 () Bool)

(assert (=> b!542323 (= e!313929 e!313928)))

(declare-fun res!336879 () Bool)

(assert (=> b!542323 (=> (not res!336879) (not e!313928))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4929 0))(
  ( (MissingZero!4929 (index!21940 (_ BitVec 32))) (Found!4929 (index!21941 (_ BitVec 32))) (Intermediate!4929 (undefined!5741 Bool) (index!21942 (_ BitVec 32)) (x!50856 (_ BitVec 32))) (Undefined!4929) (MissingVacant!4929 (index!21943 (_ BitVec 32))) )
))
(declare-fun lt!247892 () SeekEntryResult!4929)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542323 (= res!336879 (= lt!247892 (Intermediate!4929 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34276 (_ BitVec 32)) SeekEntryResult!4929)

(assert (=> b!542323 (= lt!247892 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16471 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542324 () Bool)

(assert (=> b!542324 (= e!313926 e!313929)))

(declare-fun res!336876 () Bool)

(assert (=> b!542324 (=> (not res!336876) (not e!313929))))

(declare-fun lt!247894 () SeekEntryResult!4929)

(assert (=> b!542324 (= res!336876 (or (= lt!247894 (MissingZero!4929 i!1153)) (= lt!247894 (MissingVacant!4929 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34276 (_ BitVec 32)) SeekEntryResult!4929)

(assert (=> b!542324 (= lt!247894 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542325 () Bool)

(declare-fun res!336883 () Bool)

(assert (=> b!542325 (=> (not res!336883) (not e!313926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542325 (= res!336883 (validKeyInArray!0 (select (arr!16471 a!3154) j!147)))))

(declare-fun b!542326 () Bool)

(declare-fun res!336884 () Bool)

(assert (=> b!542326 (=> (not res!336884) (not e!313928))))

(assert (=> b!542326 (= res!336884 (and (not (= (select (arr!16471 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16471 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16471 a!3154) index!1177) (select (arr!16471 a!3154) j!147)))))))

(declare-fun b!542327 () Bool)

(declare-fun res!336873 () Bool)

(assert (=> b!542327 (=> (not res!336873) (not e!313929))))

(assert (=> b!542327 (= res!336873 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16835 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16835 a!3154)) (= (select (arr!16471 a!3154) resIndex!32) (select (arr!16471 a!3154) j!147))))))

(declare-fun b!542328 () Bool)

(declare-fun res!336881 () Bool)

(assert (=> b!542328 (=> (not res!336881) (not e!313926))))

(declare-fun arrayContainsKey!0 (array!34276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542328 (= res!336881 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542329 () Bool)

(declare-fun res!336877 () Bool)

(assert (=> b!542329 (=> (not res!336877) (not e!313928))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542329 (= res!336877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16471 a!3154) j!147) mask!3216) (select (arr!16471 a!3154) j!147) a!3154 mask!3216) lt!247892))))

(declare-fun b!542330 () Bool)

(declare-fun res!336882 () Bool)

(assert (=> b!542330 (=> (not res!336882) (not e!313929))))

(declare-datatypes ((List!10590 0))(
  ( (Nil!10587) (Cons!10586 (h!11541 (_ BitVec 64)) (t!16818 List!10590)) )
))
(declare-fun arrayNoDuplicates!0 (array!34276 (_ BitVec 32) List!10590) Bool)

(assert (=> b!542330 (= res!336882 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10587))))

(declare-fun b!542331 () Bool)

(declare-fun res!336874 () Bool)

(assert (=> b!542331 (=> (not res!336874) (not e!313929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34276 (_ BitVec 32)) Bool)

(assert (=> b!542331 (= res!336874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542332 () Bool)

(declare-fun res!336880 () Bool)

(assert (=> b!542332 (=> (not res!336880) (not e!313926))))

(assert (=> b!542332 (= res!336880 (validKeyInArray!0 k0!1998))))

(declare-fun res!336878 () Bool)

(assert (=> start!49268 (=> (not res!336878) (not e!313926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49268 (= res!336878 (validMask!0 mask!3216))))

(assert (=> start!49268 e!313926))

(assert (=> start!49268 true))

(declare-fun array_inv!12267 (array!34276) Bool)

(assert (=> start!49268 (array_inv!12267 a!3154)))

(declare-fun b!542333 () Bool)

(assert (=> b!542333 (= e!313928 false)))

(declare-fun lt!247893 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542333 (= lt!247893 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!49268 res!336878) b!542322))

(assert (= (and b!542322 res!336875) b!542325))

(assert (= (and b!542325 res!336883) b!542332))

(assert (= (and b!542332 res!336880) b!542328))

(assert (= (and b!542328 res!336881) b!542324))

(assert (= (and b!542324 res!336876) b!542331))

(assert (= (and b!542331 res!336874) b!542330))

(assert (= (and b!542330 res!336882) b!542327))

(assert (= (and b!542327 res!336873) b!542323))

(assert (= (and b!542323 res!336879) b!542329))

(assert (= (and b!542329 res!336877) b!542326))

(assert (= (and b!542326 res!336884) b!542333))

(declare-fun m!520599 () Bool)

(assert (=> start!49268 m!520599))

(declare-fun m!520601 () Bool)

(assert (=> start!49268 m!520601))

(declare-fun m!520603 () Bool)

(assert (=> b!542328 m!520603))

(declare-fun m!520605 () Bool)

(assert (=> b!542327 m!520605))

(declare-fun m!520607 () Bool)

(assert (=> b!542327 m!520607))

(assert (=> b!542325 m!520607))

(assert (=> b!542325 m!520607))

(declare-fun m!520609 () Bool)

(assert (=> b!542325 m!520609))

(declare-fun m!520611 () Bool)

(assert (=> b!542332 m!520611))

(declare-fun m!520613 () Bool)

(assert (=> b!542324 m!520613))

(declare-fun m!520615 () Bool)

(assert (=> b!542326 m!520615))

(assert (=> b!542326 m!520607))

(assert (=> b!542329 m!520607))

(assert (=> b!542329 m!520607))

(declare-fun m!520617 () Bool)

(assert (=> b!542329 m!520617))

(assert (=> b!542329 m!520617))

(assert (=> b!542329 m!520607))

(declare-fun m!520619 () Bool)

(assert (=> b!542329 m!520619))

(declare-fun m!520621 () Bool)

(assert (=> b!542333 m!520621))

(declare-fun m!520623 () Bool)

(assert (=> b!542331 m!520623))

(assert (=> b!542323 m!520607))

(assert (=> b!542323 m!520607))

(declare-fun m!520625 () Bool)

(assert (=> b!542323 m!520625))

(declare-fun m!520627 () Bool)

(assert (=> b!542330 m!520627))

(check-sat (not b!542329) (not b!542325) (not start!49268) (not b!542323) (not b!542331) (not b!542324) (not b!542328) (not b!542332) (not b!542330) (not b!542333))
(check-sat)
