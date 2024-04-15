; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48474 () Bool)

(assert start!48474)

(declare-fun b!532318 () Bool)

(declare-fun res!327813 () Bool)

(declare-fun e!309892 () Bool)

(assert (=> b!532318 (=> (not res!327813) (not e!309892))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532318 (= res!327813 (validKeyInArray!0 k0!1998))))

(declare-fun b!532319 () Bool)

(declare-fun e!309893 () Bool)

(assert (=> b!532319 (= e!309893 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33747 0))(
  ( (array!33748 (arr!16214 (Array (_ BitVec 32) (_ BitVec 64))) (size!16579 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33747)

(declare-fun lt!245008 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532319 (= lt!245008 (toIndex!0 (select (arr!16214 a!3154) j!147) mask!3216))))

(declare-fun b!532320 () Bool)

(declare-fun res!327811 () Bool)

(assert (=> b!532320 (=> (not res!327811) (not e!309893))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532320 (= res!327811 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16579 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16579 a!3154)) (= (select (arr!16214 a!3154) resIndex!32) (select (arr!16214 a!3154) j!147))))))

(declare-fun b!532321 () Bool)

(declare-fun res!327809 () Bool)

(assert (=> b!532321 (=> (not res!327809) (not e!309892))))

(assert (=> b!532321 (= res!327809 (validKeyInArray!0 (select (arr!16214 a!3154) j!147)))))

(declare-fun b!532322 () Bool)

(declare-fun res!327814 () Bool)

(assert (=> b!532322 (=> (not res!327814) (not e!309893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33747 (_ BitVec 32)) Bool)

(assert (=> b!532322 (= res!327814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532323 () Bool)

(declare-fun res!327806 () Bool)

(assert (=> b!532323 (=> (not res!327806) (not e!309892))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532323 (= res!327806 (and (= (size!16579 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16579 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16579 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532324 () Bool)

(declare-fun res!327810 () Bool)

(assert (=> b!532324 (=> (not res!327810) (not e!309893))))

(declare-datatypes ((SeekEntryResult!4669 0))(
  ( (MissingZero!4669 (index!20900 (_ BitVec 32))) (Found!4669 (index!20901 (_ BitVec 32))) (Intermediate!4669 (undefined!5481 Bool) (index!20902 (_ BitVec 32)) (x!49881 (_ BitVec 32))) (Undefined!4669) (MissingVacant!4669 (index!20903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33747 (_ BitVec 32)) SeekEntryResult!4669)

(assert (=> b!532324 (= res!327810 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16214 a!3154) j!147) a!3154 mask!3216) (Intermediate!4669 false resIndex!32 resX!32)))))

(declare-fun b!532325 () Bool)

(assert (=> b!532325 (= e!309892 e!309893)))

(declare-fun res!327812 () Bool)

(assert (=> b!532325 (=> (not res!327812) (not e!309893))))

(declare-fun lt!245007 () SeekEntryResult!4669)

(assert (=> b!532325 (= res!327812 (or (= lt!245007 (MissingZero!4669 i!1153)) (= lt!245007 (MissingVacant!4669 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33747 (_ BitVec 32)) SeekEntryResult!4669)

(assert (=> b!532325 (= lt!245007 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532326 () Bool)

(declare-fun res!327807 () Bool)

(assert (=> b!532326 (=> (not res!327807) (not e!309893))))

(declare-datatypes ((List!10372 0))(
  ( (Nil!10369) (Cons!10368 (h!11308 (_ BitVec 64)) (t!16591 List!10372)) )
))
(declare-fun arrayNoDuplicates!0 (array!33747 (_ BitVec 32) List!10372) Bool)

(assert (=> b!532326 (= res!327807 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10369))))

(declare-fun b!532327 () Bool)

(declare-fun res!327808 () Bool)

(assert (=> b!532327 (=> (not res!327808) (not e!309892))))

(declare-fun arrayContainsKey!0 (array!33747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532327 (= res!327808 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!327815 () Bool)

(assert (=> start!48474 (=> (not res!327815) (not e!309892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48474 (= res!327815 (validMask!0 mask!3216))))

(assert (=> start!48474 e!309892))

(assert (=> start!48474 true))

(declare-fun array_inv!12097 (array!33747) Bool)

(assert (=> start!48474 (array_inv!12097 a!3154)))

(assert (= (and start!48474 res!327815) b!532323))

(assert (= (and b!532323 res!327806) b!532321))

(assert (= (and b!532321 res!327809) b!532318))

(assert (= (and b!532318 res!327813) b!532327))

(assert (= (and b!532327 res!327808) b!532325))

(assert (= (and b!532325 res!327812) b!532322))

(assert (= (and b!532322 res!327814) b!532326))

(assert (= (and b!532326 res!327807) b!532320))

(assert (= (and b!532320 res!327811) b!532324))

(assert (= (and b!532324 res!327810) b!532319))

(declare-fun m!511957 () Bool)

(assert (=> b!532320 m!511957))

(declare-fun m!511959 () Bool)

(assert (=> b!532320 m!511959))

(assert (=> b!532324 m!511959))

(assert (=> b!532324 m!511959))

(declare-fun m!511961 () Bool)

(assert (=> b!532324 m!511961))

(declare-fun m!511963 () Bool)

(assert (=> b!532327 m!511963))

(assert (=> b!532321 m!511959))

(assert (=> b!532321 m!511959))

(declare-fun m!511965 () Bool)

(assert (=> b!532321 m!511965))

(declare-fun m!511967 () Bool)

(assert (=> b!532325 m!511967))

(declare-fun m!511969 () Bool)

(assert (=> b!532318 m!511969))

(declare-fun m!511971 () Bool)

(assert (=> b!532326 m!511971))

(declare-fun m!511973 () Bool)

(assert (=> start!48474 m!511973))

(declare-fun m!511975 () Bool)

(assert (=> start!48474 m!511975))

(declare-fun m!511977 () Bool)

(assert (=> b!532322 m!511977))

(assert (=> b!532319 m!511959))

(assert (=> b!532319 m!511959))

(declare-fun m!511979 () Bool)

(assert (=> b!532319 m!511979))

(check-sat (not b!532325) (not b!532322) (not b!532326) (not b!532318) (not b!532321) (not b!532327) (not start!48474) (not b!532319) (not b!532324))
(check-sat)
