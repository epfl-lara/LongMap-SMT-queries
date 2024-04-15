; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48702 () Bool)

(assert start!48702)

(declare-fun b!535182 () Bool)

(declare-fun res!330531 () Bool)

(declare-fun e!310869 () Bool)

(assert (=> b!535182 (=> (not res!330531) (not e!310869))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535182 (= res!330531 (validKeyInArray!0 k0!1998))))

(declare-fun b!535183 () Bool)

(declare-fun res!330537 () Bool)

(declare-fun e!310868 () Bool)

(assert (=> b!535183 (=> (not res!330537) (not e!310868))))

(declare-datatypes ((array!33924 0))(
  ( (array!33925 (arr!16301 (Array (_ BitVec 32) (_ BitVec 64))) (size!16666 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33924)

(declare-datatypes ((List!10459 0))(
  ( (Nil!10456) (Cons!10455 (h!11398 (_ BitVec 64)) (t!16678 List!10459)) )
))
(declare-fun arrayNoDuplicates!0 (array!33924 (_ BitVec 32) List!10459) Bool)

(assert (=> b!535183 (= res!330537 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10456))))

(declare-fun res!330539 () Bool)

(assert (=> start!48702 (=> (not res!330539) (not e!310869))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48702 (= res!330539 (validMask!0 mask!3216))))

(assert (=> start!48702 e!310869))

(assert (=> start!48702 true))

(declare-fun array_inv!12184 (array!33924) Bool)

(assert (=> start!48702 (array_inv!12184 a!3154)))

(declare-fun b!535184 () Bool)

(declare-fun res!330530 () Bool)

(assert (=> b!535184 (=> (not res!330530) (not e!310869))))

(declare-fun arrayContainsKey!0 (array!33924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535184 (= res!330530 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535185 () Bool)

(declare-fun res!330529 () Bool)

(assert (=> b!535185 (=> (not res!330529) (not e!310868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33924 (_ BitVec 32)) Bool)

(assert (=> b!535185 (= res!330529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535186 () Bool)

(declare-fun res!330532 () Bool)

(assert (=> b!535186 (=> (not res!330532) (not e!310869))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!535186 (= res!330532 (validKeyInArray!0 (select (arr!16301 a!3154) j!147)))))

(declare-fun b!535187 () Bool)

(assert (=> b!535187 (= e!310869 e!310868)))

(declare-fun res!330534 () Bool)

(assert (=> b!535187 (=> (not res!330534) (not e!310868))))

(declare-datatypes ((SeekEntryResult!4756 0))(
  ( (MissingZero!4756 (index!21248 (_ BitVec 32))) (Found!4756 (index!21249 (_ BitVec 32))) (Intermediate!4756 (undefined!5568 Bool) (index!21250 (_ BitVec 32)) (x!50206 (_ BitVec 32))) (Undefined!4756) (MissingVacant!4756 (index!21251 (_ BitVec 32))) )
))
(declare-fun lt!245592 () SeekEntryResult!4756)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535187 (= res!330534 (or (= lt!245592 (MissingZero!4756 i!1153)) (= lt!245592 (MissingVacant!4756 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33924 (_ BitVec 32)) SeekEntryResult!4756)

(assert (=> b!535187 (= lt!245592 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun e!310867 () Bool)

(declare-fun b!535188 () Bool)

(assert (=> b!535188 (= e!310867 (and (not (= (select (arr!16301 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16301 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16301 a!3154) index!1177) (select (arr!16301 a!3154) j!147))) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!535189 () Bool)

(declare-fun res!330535 () Bool)

(assert (=> b!535189 (=> (not res!330535) (not e!310869))))

(assert (=> b!535189 (= res!330535 (and (= (size!16666 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16666 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16666 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535190 () Bool)

(assert (=> b!535190 (= e!310868 e!310867)))

(declare-fun res!330538 () Bool)

(assert (=> b!535190 (=> (not res!330538) (not e!310867))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!245593 () SeekEntryResult!4756)

(assert (=> b!535190 (= res!330538 (= lt!245593 (Intermediate!4756 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33924 (_ BitVec 32)) SeekEntryResult!4756)

(assert (=> b!535190 (= lt!245593 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16301 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535191 () Bool)

(declare-fun res!330533 () Bool)

(assert (=> b!535191 (=> (not res!330533) (not e!310867))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535191 (= res!330533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16301 a!3154) j!147) mask!3216) (select (arr!16301 a!3154) j!147) a!3154 mask!3216) lt!245593))))

(declare-fun b!535192 () Bool)

(declare-fun res!330536 () Bool)

(assert (=> b!535192 (=> (not res!330536) (not e!310868))))

(assert (=> b!535192 (= res!330536 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16666 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16666 a!3154)) (= (select (arr!16301 a!3154) resIndex!32) (select (arr!16301 a!3154) j!147))))))

(assert (= (and start!48702 res!330539) b!535189))

(assert (= (and b!535189 res!330535) b!535186))

(assert (= (and b!535186 res!330532) b!535182))

(assert (= (and b!535182 res!330531) b!535184))

(assert (= (and b!535184 res!330530) b!535187))

(assert (= (and b!535187 res!330534) b!535185))

(assert (= (and b!535185 res!330529) b!535183))

(assert (= (and b!535183 res!330537) b!535192))

(assert (= (and b!535192 res!330536) b!535190))

(assert (= (and b!535190 res!330538) b!535191))

(assert (= (and b!535191 res!330533) b!535188))

(declare-fun m!514285 () Bool)

(assert (=> b!535185 m!514285))

(declare-fun m!514287 () Bool)

(assert (=> b!535192 m!514287))

(declare-fun m!514289 () Bool)

(assert (=> b!535192 m!514289))

(assert (=> b!535186 m!514289))

(assert (=> b!535186 m!514289))

(declare-fun m!514291 () Bool)

(assert (=> b!535186 m!514291))

(declare-fun m!514293 () Bool)

(assert (=> b!535188 m!514293))

(assert (=> b!535188 m!514289))

(declare-fun m!514295 () Bool)

(assert (=> start!48702 m!514295))

(declare-fun m!514297 () Bool)

(assert (=> start!48702 m!514297))

(declare-fun m!514299 () Bool)

(assert (=> b!535184 m!514299))

(assert (=> b!535191 m!514289))

(assert (=> b!535191 m!514289))

(declare-fun m!514301 () Bool)

(assert (=> b!535191 m!514301))

(assert (=> b!535191 m!514301))

(assert (=> b!535191 m!514289))

(declare-fun m!514303 () Bool)

(assert (=> b!535191 m!514303))

(assert (=> b!535190 m!514289))

(assert (=> b!535190 m!514289))

(declare-fun m!514305 () Bool)

(assert (=> b!535190 m!514305))

(declare-fun m!514307 () Bool)

(assert (=> b!535187 m!514307))

(declare-fun m!514309 () Bool)

(assert (=> b!535182 m!514309))

(declare-fun m!514311 () Bool)

(assert (=> b!535183 m!514311))

(check-sat (not b!535186) (not b!535191) (not start!48702) (not b!535187) (not b!535185) (not b!535190) (not b!535184) (not b!535182) (not b!535183))
(check-sat)
