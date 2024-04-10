; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48488 () Bool)

(assert start!48488)

(declare-fun b!532619 () Bool)

(declare-fun res!327967 () Bool)

(declare-fun e!310076 () Bool)

(assert (=> b!532619 (=> (not res!327967) (not e!310076))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33751 0))(
  ( (array!33752 (arr!16216 (Array (_ BitVec 32) (_ BitVec 64))) (size!16580 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33751)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532619 (= res!327967 (and (= (size!16580 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16580 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16580 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532620 () Bool)

(declare-fun res!327970 () Bool)

(assert (=> b!532620 (=> (not res!327970) (not e!310076))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532620 (= res!327970 (validKeyInArray!0 k0!1998))))

(declare-fun b!532621 () Bool)

(declare-fun e!310075 () Bool)

(assert (=> b!532621 (= e!310076 e!310075)))

(declare-fun res!327966 () Bool)

(assert (=> b!532621 (=> (not res!327966) (not e!310075))))

(declare-datatypes ((SeekEntryResult!4674 0))(
  ( (MissingZero!4674 (index!20920 (_ BitVec 32))) (Found!4674 (index!20921 (_ BitVec 32))) (Intermediate!4674 (undefined!5486 Bool) (index!20922 (_ BitVec 32)) (x!49891 (_ BitVec 32))) (Undefined!4674) (MissingVacant!4674 (index!20923 (_ BitVec 32))) )
))
(declare-fun lt!245248 () SeekEntryResult!4674)

(assert (=> b!532621 (= res!327966 (or (= lt!245248 (MissingZero!4674 i!1153)) (= lt!245248 (MissingVacant!4674 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33751 (_ BitVec 32)) SeekEntryResult!4674)

(assert (=> b!532621 (= lt!245248 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532622 () Bool)

(declare-fun res!327974 () Bool)

(assert (=> b!532622 (=> (not res!327974) (not e!310076))))

(declare-fun arrayContainsKey!0 (array!33751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532622 (= res!327974 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327971 () Bool)

(assert (=> start!48488 (=> (not res!327971) (not e!310076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48488 (= res!327971 (validMask!0 mask!3216))))

(assert (=> start!48488 e!310076))

(assert (=> start!48488 true))

(declare-fun array_inv!12012 (array!33751) Bool)

(assert (=> start!48488 (array_inv!12012 a!3154)))

(declare-fun b!532623 () Bool)

(declare-fun res!327973 () Bool)

(assert (=> b!532623 (=> (not res!327973) (not e!310075))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33751 (_ BitVec 32)) SeekEntryResult!4674)

(assert (=> b!532623 (= res!327973 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16216 a!3154) j!147) a!3154 mask!3216) (Intermediate!4674 false resIndex!32 resX!32)))))

(declare-fun b!532624 () Bool)

(declare-fun res!327972 () Bool)

(assert (=> b!532624 (=> (not res!327972) (not e!310075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33751 (_ BitVec 32)) Bool)

(assert (=> b!532624 (= res!327972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532625 () Bool)

(assert (=> b!532625 (= e!310075 false)))

(declare-fun lt!245247 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532625 (= lt!245247 (toIndex!0 (select (arr!16216 a!3154) j!147) mask!3216))))

(declare-fun b!532626 () Bool)

(declare-fun res!327969 () Bool)

(assert (=> b!532626 (=> (not res!327969) (not e!310076))))

(assert (=> b!532626 (= res!327969 (validKeyInArray!0 (select (arr!16216 a!3154) j!147)))))

(declare-fun b!532627 () Bool)

(declare-fun res!327968 () Bool)

(assert (=> b!532627 (=> (not res!327968) (not e!310075))))

(declare-datatypes ((List!10335 0))(
  ( (Nil!10332) (Cons!10331 (h!11271 (_ BitVec 64)) (t!16563 List!10335)) )
))
(declare-fun arrayNoDuplicates!0 (array!33751 (_ BitVec 32) List!10335) Bool)

(assert (=> b!532627 (= res!327968 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10332))))

(declare-fun b!532628 () Bool)

(declare-fun res!327965 () Bool)

(assert (=> b!532628 (=> (not res!327965) (not e!310075))))

(assert (=> b!532628 (= res!327965 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16580 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16580 a!3154)) (= (select (arr!16216 a!3154) resIndex!32) (select (arr!16216 a!3154) j!147))))))

(assert (= (and start!48488 res!327971) b!532619))

(assert (= (and b!532619 res!327967) b!532626))

(assert (= (and b!532626 res!327969) b!532620))

(assert (= (and b!532620 res!327970) b!532622))

(assert (= (and b!532622 res!327974) b!532621))

(assert (= (and b!532621 res!327966) b!532624))

(assert (= (and b!532624 res!327972) b!532627))

(assert (= (and b!532627 res!327968) b!532628))

(assert (= (and b!532628 res!327965) b!532623))

(assert (= (and b!532623 res!327973) b!532625))

(declare-fun m!512733 () Bool)

(assert (=> b!532628 m!512733))

(declare-fun m!512735 () Bool)

(assert (=> b!532628 m!512735))

(declare-fun m!512737 () Bool)

(assert (=> b!532627 m!512737))

(assert (=> b!532626 m!512735))

(assert (=> b!532626 m!512735))

(declare-fun m!512739 () Bool)

(assert (=> b!532626 m!512739))

(assert (=> b!532623 m!512735))

(assert (=> b!532623 m!512735))

(declare-fun m!512741 () Bool)

(assert (=> b!532623 m!512741))

(declare-fun m!512743 () Bool)

(assert (=> start!48488 m!512743))

(declare-fun m!512745 () Bool)

(assert (=> start!48488 m!512745))

(declare-fun m!512747 () Bool)

(assert (=> b!532622 m!512747))

(assert (=> b!532625 m!512735))

(assert (=> b!532625 m!512735))

(declare-fun m!512749 () Bool)

(assert (=> b!532625 m!512749))

(declare-fun m!512751 () Bool)

(assert (=> b!532620 m!512751))

(declare-fun m!512753 () Bool)

(assert (=> b!532624 m!512753))

(declare-fun m!512755 () Bool)

(assert (=> b!532621 m!512755))

(check-sat (not b!532625) (not b!532626) (not b!532627) (not start!48488) (not b!532620) (not b!532623) (not b!532624) (not b!532621) (not b!532622))
(check-sat)
