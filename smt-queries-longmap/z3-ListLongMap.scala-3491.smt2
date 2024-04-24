; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48406 () Bool)

(assert start!48406)

(declare-fun b!531934 () Bool)

(declare-fun e!309768 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!531934 (= e!309768 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!531936 () Bool)

(declare-fun e!309766 () Bool)

(assert (=> b!531936 (= e!309766 e!309768)))

(declare-fun res!327484 () Bool)

(assert (=> b!531936 (=> (not res!327484) (not e!309768))))

(declare-datatypes ((SeekEntryResult!4612 0))(
  ( (MissingZero!4612 (index!20672 (_ BitVec 32))) (Found!4612 (index!20673 (_ BitVec 32))) (Intermediate!4612 (undefined!5424 Bool) (index!20674 (_ BitVec 32)) (x!49791 (_ BitVec 32))) (Undefined!4612) (MissingVacant!4612 (index!20675 (_ BitVec 32))) )
))
(declare-fun lt!245125 () SeekEntryResult!4612)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531936 (= res!327484 (or (= lt!245125 (MissingZero!4612 i!1153)) (= lt!245125 (MissingVacant!4612 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33713 0))(
  ( (array!33714 (arr!16198 (Array (_ BitVec 32) (_ BitVec 64))) (size!16562 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33713)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33713 (_ BitVec 32)) SeekEntryResult!4612)

(assert (=> b!531936 (= lt!245125 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531937 () Bool)

(declare-fun res!327485 () Bool)

(assert (=> b!531937 (=> (not res!327485) (not e!309766))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531937 (= res!327485 (validKeyInArray!0 (select (arr!16198 a!3154) j!147)))))

(declare-fun b!531938 () Bool)

(declare-fun res!327479 () Bool)

(assert (=> b!531938 (=> (not res!327479) (not e!309768))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531938 (= res!327479 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16562 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16562 a!3154)) (= (select (arr!16198 a!3154) resIndex!32) (select (arr!16198 a!3154) j!147))))))

(declare-fun b!531939 () Bool)

(declare-fun res!327486 () Bool)

(assert (=> b!531939 (=> (not res!327486) (not e!309768))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33713 (_ BitVec 32)) SeekEntryResult!4612)

(assert (=> b!531939 (= res!327486 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16198 a!3154) j!147) a!3154 mask!3216) (Intermediate!4612 false resIndex!32 resX!32)))))

(declare-fun b!531940 () Bool)

(declare-fun res!327487 () Bool)

(assert (=> b!531940 (=> (not res!327487) (not e!309768))))

(declare-datatypes ((List!10224 0))(
  ( (Nil!10221) (Cons!10220 (h!11160 (_ BitVec 64)) (t!16444 List!10224)) )
))
(declare-fun arrayNoDuplicates!0 (array!33713 (_ BitVec 32) List!10224) Bool)

(assert (=> b!531940 (= res!327487 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10221))))

(declare-fun b!531941 () Bool)

(declare-fun res!327478 () Bool)

(assert (=> b!531941 (=> (not res!327478) (not e!309766))))

(declare-fun arrayContainsKey!0 (array!33713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531941 (= res!327478 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531942 () Bool)

(declare-fun res!327480 () Bool)

(assert (=> b!531942 (=> (not res!327480) (not e!309766))))

(assert (=> b!531942 (= res!327480 (and (= (size!16562 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16562 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16562 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531943 () Bool)

(declare-fun res!327482 () Bool)

(assert (=> b!531943 (=> (not res!327482) (not e!309768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33713 (_ BitVec 32)) Bool)

(assert (=> b!531943 (= res!327482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327481 () Bool)

(assert (=> start!48406 (=> (not res!327481) (not e!309766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48406 (= res!327481 (validMask!0 mask!3216))))

(assert (=> start!48406 e!309766))

(assert (=> start!48406 true))

(declare-fun array_inv!12057 (array!33713) Bool)

(assert (=> start!48406 (array_inv!12057 a!3154)))

(declare-fun b!531935 () Bool)

(declare-fun res!327483 () Bool)

(assert (=> b!531935 (=> (not res!327483) (not e!309766))))

(assert (=> b!531935 (= res!327483 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48406 res!327481) b!531942))

(assert (= (and b!531942 res!327480) b!531937))

(assert (= (and b!531937 res!327485) b!531935))

(assert (= (and b!531935 res!327483) b!531941))

(assert (= (and b!531941 res!327478) b!531936))

(assert (= (and b!531936 res!327484) b!531943))

(assert (= (and b!531943 res!327482) b!531940))

(assert (= (and b!531940 res!327487) b!531938))

(assert (= (and b!531938 res!327479) b!531939))

(assert (= (and b!531939 res!327486) b!531934))

(declare-fun m!512497 () Bool)

(assert (=> b!531940 m!512497))

(declare-fun m!512499 () Bool)

(assert (=> b!531943 m!512499))

(declare-fun m!512501 () Bool)

(assert (=> start!48406 m!512501))

(declare-fun m!512503 () Bool)

(assert (=> start!48406 m!512503))

(declare-fun m!512505 () Bool)

(assert (=> b!531939 m!512505))

(assert (=> b!531939 m!512505))

(declare-fun m!512507 () Bool)

(assert (=> b!531939 m!512507))

(assert (=> b!531937 m!512505))

(assert (=> b!531937 m!512505))

(declare-fun m!512509 () Bool)

(assert (=> b!531937 m!512509))

(declare-fun m!512511 () Bool)

(assert (=> b!531938 m!512511))

(assert (=> b!531938 m!512505))

(declare-fun m!512513 () Bool)

(assert (=> b!531941 m!512513))

(declare-fun m!512515 () Bool)

(assert (=> b!531936 m!512515))

(declare-fun m!512517 () Bool)

(assert (=> b!531935 m!512517))

(check-sat (not start!48406) (not b!531939) (not b!531935) (not b!531940) (not b!531941) (not b!531936) (not b!531943) (not b!531937))
(check-sat)
