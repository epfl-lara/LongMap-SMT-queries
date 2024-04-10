; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48482 () Bool)

(assert start!48482)

(declare-fun b!532529 () Bool)

(declare-fun e!310048 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532529 (= e!310048 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun lt!245229 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33745 0))(
  ( (array!33746 (arr!16213 (Array (_ BitVec 32) (_ BitVec 64))) (size!16577 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532529 (= lt!245229 (toIndex!0 (select (arr!16213 a!3154) j!147) mask!3216))))

(declare-fun b!532530 () Bool)

(declare-fun e!310050 () Bool)

(assert (=> b!532530 (= e!310050 e!310048)))

(declare-fun res!327879 () Bool)

(assert (=> b!532530 (=> (not res!327879) (not e!310048))))

(declare-datatypes ((SeekEntryResult!4671 0))(
  ( (MissingZero!4671 (index!20908 (_ BitVec 32))) (Found!4671 (index!20909 (_ BitVec 32))) (Intermediate!4671 (undefined!5483 Bool) (index!20910 (_ BitVec 32)) (x!49880 (_ BitVec 32))) (Undefined!4671) (MissingVacant!4671 (index!20911 (_ BitVec 32))) )
))
(declare-fun lt!245230 () SeekEntryResult!4671)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532530 (= res!327879 (or (= lt!245230 (MissingZero!4671 i!1153)) (= lt!245230 (MissingVacant!4671 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33745 (_ BitVec 32)) SeekEntryResult!4671)

(assert (=> b!532530 (= lt!245230 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532531 () Bool)

(declare-fun res!327881 () Bool)

(assert (=> b!532531 (=> (not res!327881) (not e!310050))))

(assert (=> b!532531 (= res!327881 (and (= (size!16577 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16577 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16577 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327883 () Bool)

(assert (=> start!48482 (=> (not res!327883) (not e!310050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48482 (= res!327883 (validMask!0 mask!3216))))

(assert (=> start!48482 e!310050))

(assert (=> start!48482 true))

(declare-fun array_inv!12009 (array!33745) Bool)

(assert (=> start!48482 (array_inv!12009 a!3154)))

(declare-fun b!532532 () Bool)

(declare-fun res!327875 () Bool)

(assert (=> b!532532 (=> (not res!327875) (not e!310048))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532532 (= res!327875 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16577 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16577 a!3154)) (= (select (arr!16213 a!3154) resIndex!32) (select (arr!16213 a!3154) j!147))))))

(declare-fun b!532533 () Bool)

(declare-fun res!327876 () Bool)

(assert (=> b!532533 (=> (not res!327876) (not e!310048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33745 (_ BitVec 32)) Bool)

(assert (=> b!532533 (= res!327876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532534 () Bool)

(declare-fun res!327877 () Bool)

(assert (=> b!532534 (=> (not res!327877) (not e!310048))))

(declare-datatypes ((List!10332 0))(
  ( (Nil!10329) (Cons!10328 (h!11268 (_ BitVec 64)) (t!16560 List!10332)) )
))
(declare-fun arrayNoDuplicates!0 (array!33745 (_ BitVec 32) List!10332) Bool)

(assert (=> b!532534 (= res!327877 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10329))))

(declare-fun b!532535 () Bool)

(declare-fun res!327884 () Bool)

(assert (=> b!532535 (=> (not res!327884) (not e!310050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532535 (= res!327884 (validKeyInArray!0 (select (arr!16213 a!3154) j!147)))))

(declare-fun b!532536 () Bool)

(declare-fun res!327880 () Bool)

(assert (=> b!532536 (=> (not res!327880) (not e!310048))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33745 (_ BitVec 32)) SeekEntryResult!4671)

(assert (=> b!532536 (= res!327880 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16213 a!3154) j!147) a!3154 mask!3216) (Intermediate!4671 false resIndex!32 resX!32)))))

(declare-fun b!532537 () Bool)

(declare-fun res!327878 () Bool)

(assert (=> b!532537 (=> (not res!327878) (not e!310050))))

(declare-fun arrayContainsKey!0 (array!33745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532537 (= res!327878 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532538 () Bool)

(declare-fun res!327882 () Bool)

(assert (=> b!532538 (=> (not res!327882) (not e!310050))))

(assert (=> b!532538 (= res!327882 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48482 res!327883) b!532531))

(assert (= (and b!532531 res!327881) b!532535))

(assert (= (and b!532535 res!327884) b!532538))

(assert (= (and b!532538 res!327882) b!532537))

(assert (= (and b!532537 res!327878) b!532530))

(assert (= (and b!532530 res!327879) b!532533))

(assert (= (and b!532533 res!327876) b!532534))

(assert (= (and b!532534 res!327877) b!532532))

(assert (= (and b!532532 res!327875) b!532536))

(assert (= (and b!532536 res!327880) b!532529))

(declare-fun m!512661 () Bool)

(assert (=> b!532538 m!512661))

(declare-fun m!512663 () Bool)

(assert (=> b!532533 m!512663))

(declare-fun m!512665 () Bool)

(assert (=> start!48482 m!512665))

(declare-fun m!512667 () Bool)

(assert (=> start!48482 m!512667))

(declare-fun m!512669 () Bool)

(assert (=> b!532535 m!512669))

(assert (=> b!532535 m!512669))

(declare-fun m!512671 () Bool)

(assert (=> b!532535 m!512671))

(declare-fun m!512673 () Bool)

(assert (=> b!532530 m!512673))

(assert (=> b!532536 m!512669))

(assert (=> b!532536 m!512669))

(declare-fun m!512675 () Bool)

(assert (=> b!532536 m!512675))

(declare-fun m!512677 () Bool)

(assert (=> b!532534 m!512677))

(declare-fun m!512679 () Bool)

(assert (=> b!532537 m!512679))

(assert (=> b!532529 m!512669))

(assert (=> b!532529 m!512669))

(declare-fun m!512681 () Bool)

(assert (=> b!532529 m!512681))

(declare-fun m!512683 () Bool)

(assert (=> b!532532 m!512683))

(assert (=> b!532532 m!512669))

(check-sat (not b!532537) (not b!532534) (not b!532529) (not b!532533) (not b!532536) (not b!532535) (not b!532538) (not start!48482) (not b!532530))
(check-sat)
