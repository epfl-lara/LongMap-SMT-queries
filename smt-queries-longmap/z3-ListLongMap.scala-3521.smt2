; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48698 () Bool)

(assert start!48698)

(declare-fun b!535189 () Bool)

(declare-fun res!330403 () Bool)

(declare-fun e!310954 () Bool)

(assert (=> b!535189 (=> (not res!330403) (not e!310954))))

(declare-datatypes ((array!33910 0))(
  ( (array!33911 (arr!16294 (Array (_ BitVec 32) (_ BitVec 64))) (size!16658 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33910)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33910 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535189 (= res!330403 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535190 () Bool)

(declare-fun e!310956 () Bool)

(declare-fun e!310953 () Bool)

(assert (=> b!535190 (= e!310956 e!310953)))

(declare-fun res!330398 () Bool)

(assert (=> b!535190 (=> (not res!330398) (not e!310953))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4752 0))(
  ( (MissingZero!4752 (index!21232 (_ BitVec 32))) (Found!4752 (index!21233 (_ BitVec 32))) (Intermediate!4752 (undefined!5564 Bool) (index!21234 (_ BitVec 32)) (x!50183 (_ BitVec 32))) (Undefined!4752) (MissingVacant!4752 (index!21235 (_ BitVec 32))) )
))
(declare-fun lt!245778 () SeekEntryResult!4752)

(assert (=> b!535190 (= res!330398 (= lt!245778 (Intermediate!4752 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33910 (_ BitVec 32)) SeekEntryResult!4752)

(assert (=> b!535190 (= lt!245778 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16294 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330395 () Bool)

(assert (=> start!48698 (=> (not res!330395) (not e!310954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48698 (= res!330395 (validMask!0 mask!3216))))

(assert (=> start!48698 e!310954))

(assert (=> start!48698 true))

(declare-fun array_inv!12090 (array!33910) Bool)

(assert (=> start!48698 (array_inv!12090 a!3154)))

(declare-fun b!535191 () Bool)

(declare-fun res!330400 () Bool)

(assert (=> b!535191 (=> (not res!330400) (not e!310956))))

(declare-datatypes ((List!10413 0))(
  ( (Nil!10410) (Cons!10409 (h!11352 (_ BitVec 64)) (t!16641 List!10413)) )
))
(declare-fun arrayNoDuplicates!0 (array!33910 (_ BitVec 32) List!10413) Bool)

(assert (=> b!535191 (= res!330400 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10410))))

(declare-fun b!535192 () Bool)

(declare-fun res!330394 () Bool)

(assert (=> b!535192 (=> (not res!330394) (not e!310953))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535192 (= res!330394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16294 a!3154) j!147) mask!3216) (select (arr!16294 a!3154) j!147) a!3154 mask!3216) lt!245778))))

(declare-fun b!535193 () Bool)

(declare-fun res!330401 () Bool)

(assert (=> b!535193 (=> (not res!330401) (not e!310954))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535193 (= res!330401 (validKeyInArray!0 (select (arr!16294 a!3154) j!147)))))

(declare-fun b!535194 () Bool)

(declare-fun res!330396 () Bool)

(assert (=> b!535194 (=> (not res!330396) (not e!310956))))

(assert (=> b!535194 (= res!330396 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16658 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16658 a!3154)) (= (select (arr!16294 a!3154) resIndex!32) (select (arr!16294 a!3154) j!147))))))

(declare-fun b!535195 () Bool)

(declare-fun res!330404 () Bool)

(assert (=> b!535195 (=> (not res!330404) (not e!310956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33910 (_ BitVec 32)) Bool)

(assert (=> b!535195 (= res!330404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535196 () Bool)

(assert (=> b!535196 (= e!310954 e!310956)))

(declare-fun res!330399 () Bool)

(assert (=> b!535196 (=> (not res!330399) (not e!310956))))

(declare-fun lt!245779 () SeekEntryResult!4752)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535196 (= res!330399 (or (= lt!245779 (MissingZero!4752 i!1153)) (= lt!245779 (MissingVacant!4752 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33910 (_ BitVec 32)) SeekEntryResult!4752)

(assert (=> b!535196 (= lt!245779 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535197 () Bool)

(assert (=> b!535197 (= e!310953 (and (not (= (select (arr!16294 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16294 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16294 a!3154) index!1177) (select (arr!16294 a!3154) j!147)) (= index!1177 resIndex!32) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!535198 () Bool)

(declare-fun res!330402 () Bool)

(assert (=> b!535198 (=> (not res!330402) (not e!310954))))

(assert (=> b!535198 (= res!330402 (and (= (size!16658 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16658 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16658 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535199 () Bool)

(declare-fun res!330397 () Bool)

(assert (=> b!535199 (=> (not res!330397) (not e!310954))))

(assert (=> b!535199 (= res!330397 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48698 res!330395) b!535198))

(assert (= (and b!535198 res!330402) b!535193))

(assert (= (and b!535193 res!330401) b!535199))

(assert (= (and b!535199 res!330397) b!535189))

(assert (= (and b!535189 res!330403) b!535196))

(assert (= (and b!535196 res!330399) b!535195))

(assert (= (and b!535195 res!330404) b!535191))

(assert (= (and b!535191 res!330400) b!535194))

(assert (= (and b!535194 res!330396) b!535190))

(assert (= (and b!535190 res!330398) b!535192))

(assert (= (and b!535192 res!330394) b!535197))

(declare-fun m!514801 () Bool)

(assert (=> b!535197 m!514801))

(declare-fun m!514803 () Bool)

(assert (=> b!535197 m!514803))

(declare-fun m!514805 () Bool)

(assert (=> start!48698 m!514805))

(declare-fun m!514807 () Bool)

(assert (=> start!48698 m!514807))

(declare-fun m!514809 () Bool)

(assert (=> b!535189 m!514809))

(assert (=> b!535192 m!514803))

(assert (=> b!535192 m!514803))

(declare-fun m!514811 () Bool)

(assert (=> b!535192 m!514811))

(assert (=> b!535192 m!514811))

(assert (=> b!535192 m!514803))

(declare-fun m!514813 () Bool)

(assert (=> b!535192 m!514813))

(declare-fun m!514815 () Bool)

(assert (=> b!535194 m!514815))

(assert (=> b!535194 m!514803))

(declare-fun m!514817 () Bool)

(assert (=> b!535195 m!514817))

(assert (=> b!535193 m!514803))

(assert (=> b!535193 m!514803))

(declare-fun m!514819 () Bool)

(assert (=> b!535193 m!514819))

(declare-fun m!514821 () Bool)

(assert (=> b!535191 m!514821))

(declare-fun m!514823 () Bool)

(assert (=> b!535199 m!514823))

(declare-fun m!514825 () Bool)

(assert (=> b!535196 m!514825))

(assert (=> b!535190 m!514803))

(assert (=> b!535190 m!514803))

(declare-fun m!514827 () Bool)

(assert (=> b!535190 m!514827))

(check-sat (not b!535191) (not b!535190) (not b!535195) (not b!535192) (not b!535199) (not start!48698) (not b!535193) (not b!535196) (not b!535189))
(check-sat)
