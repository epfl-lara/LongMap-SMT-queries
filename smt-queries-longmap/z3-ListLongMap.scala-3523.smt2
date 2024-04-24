; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48700 () Bool)

(assert start!48700)

(declare-fun b!535301 () Bool)

(declare-fun res!330561 () Bool)

(declare-fun e!310972 () Bool)

(assert (=> b!535301 (=> (not res!330561) (not e!310972))))

(declare-datatypes ((array!33911 0))(
  ( (array!33912 (arr!16294 (Array (_ BitVec 32) (_ BitVec 64))) (size!16658 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33911)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33911 (_ BitVec 32)) Bool)

(assert (=> b!535301 (= res!330561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535302 () Bool)

(declare-fun res!330560 () Bool)

(declare-fun e!310974 () Bool)

(assert (=> b!535302 (=> (not res!330560) (not e!310974))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535302 (= res!330560 (validKeyInArray!0 (select (arr!16294 a!3154) j!147)))))

(declare-fun b!535303 () Bool)

(declare-fun res!330568 () Bool)

(assert (=> b!535303 (=> (not res!330568) (not e!310974))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535303 (= res!330568 (and (= (size!16658 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16658 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16658 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535304 () Bool)

(declare-fun res!330562 () Bool)

(assert (=> b!535304 (=> (not res!330562) (not e!310972))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!535304 (= res!330562 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16658 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16658 a!3154)) (= (select (arr!16294 a!3154) resIndex!32) (select (arr!16294 a!3154) j!147))))))

(declare-fun b!535305 () Bool)

(declare-fun res!330559 () Bool)

(assert (=> b!535305 (=> (not res!330559) (not e!310974))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535305 (= res!330559 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535306 () Bool)

(declare-fun res!330566 () Bool)

(assert (=> b!535306 (=> (not res!330566) (not e!310974))))

(assert (=> b!535306 (= res!330566 (validKeyInArray!0 k0!1998))))

(declare-fun b!535307 () Bool)

(assert (=> b!535307 (= e!310972 false)))

(declare-datatypes ((SeekEntryResult!4708 0))(
  ( (MissingZero!4708 (index!21056 (_ BitVec 32))) (Found!4708 (index!21057 (_ BitVec 32))) (Intermediate!4708 (undefined!5520 Bool) (index!21058 (_ BitVec 32)) (x!50152 (_ BitVec 32))) (Undefined!4708) (MissingVacant!4708 (index!21059 (_ BitVec 32))) )
))
(declare-fun lt!245821 () SeekEntryResult!4708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33911 (_ BitVec 32)) SeekEntryResult!4708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535307 (= lt!245821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16294 a!3154) j!147) mask!3216) (select (arr!16294 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330565 () Bool)

(assert (=> start!48700 (=> (not res!330565) (not e!310974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48700 (= res!330565 (validMask!0 mask!3216))))

(assert (=> start!48700 e!310974))

(assert (=> start!48700 true))

(declare-fun array_inv!12153 (array!33911) Bool)

(assert (=> start!48700 (array_inv!12153 a!3154)))

(declare-fun b!535300 () Bool)

(declare-fun res!330564 () Bool)

(assert (=> b!535300 (=> (not res!330564) (not e!310972))))

(assert (=> b!535300 (= res!330564 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16294 a!3154) j!147) a!3154 mask!3216) (Intermediate!4708 false resIndex!32 resX!32)))))

(declare-fun b!535308 () Bool)

(assert (=> b!535308 (= e!310974 e!310972)))

(declare-fun res!330567 () Bool)

(assert (=> b!535308 (=> (not res!330567) (not e!310972))))

(declare-fun lt!245820 () SeekEntryResult!4708)

(assert (=> b!535308 (= res!330567 (or (= lt!245820 (MissingZero!4708 i!1153)) (= lt!245820 (MissingVacant!4708 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33911 (_ BitVec 32)) SeekEntryResult!4708)

(assert (=> b!535308 (= lt!245820 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535309 () Bool)

(declare-fun res!330563 () Bool)

(assert (=> b!535309 (=> (not res!330563) (not e!310972))))

(declare-datatypes ((List!10320 0))(
  ( (Nil!10317) (Cons!10316 (h!11259 (_ BitVec 64)) (t!16540 List!10320)) )
))
(declare-fun arrayNoDuplicates!0 (array!33911 (_ BitVec 32) List!10320) Bool)

(assert (=> b!535309 (= res!330563 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10317))))

(assert (= (and start!48700 res!330565) b!535303))

(assert (= (and b!535303 res!330568) b!535302))

(assert (= (and b!535302 res!330560) b!535306))

(assert (= (and b!535306 res!330566) b!535305))

(assert (= (and b!535305 res!330559) b!535308))

(assert (= (and b!535308 res!330567) b!535301))

(assert (= (and b!535301 res!330561) b!535309))

(assert (= (and b!535309 res!330563) b!535304))

(assert (= (and b!535304 res!330562) b!535300))

(assert (= (and b!535300 res!330564) b!535307))

(declare-fun m!515143 () Bool)

(assert (=> start!48700 m!515143))

(declare-fun m!515145 () Bool)

(assert (=> start!48700 m!515145))

(declare-fun m!515147 () Bool)

(assert (=> b!535300 m!515147))

(assert (=> b!535300 m!515147))

(declare-fun m!515149 () Bool)

(assert (=> b!535300 m!515149))

(declare-fun m!515151 () Bool)

(assert (=> b!535301 m!515151))

(declare-fun m!515153 () Bool)

(assert (=> b!535309 m!515153))

(declare-fun m!515155 () Bool)

(assert (=> b!535306 m!515155))

(assert (=> b!535307 m!515147))

(assert (=> b!535307 m!515147))

(declare-fun m!515157 () Bool)

(assert (=> b!535307 m!515157))

(assert (=> b!535307 m!515157))

(assert (=> b!535307 m!515147))

(declare-fun m!515159 () Bool)

(assert (=> b!535307 m!515159))

(assert (=> b!535302 m!515147))

(assert (=> b!535302 m!515147))

(declare-fun m!515161 () Bool)

(assert (=> b!535302 m!515161))

(declare-fun m!515163 () Bool)

(assert (=> b!535304 m!515163))

(assert (=> b!535304 m!515147))

(declare-fun m!515165 () Bool)

(assert (=> b!535305 m!515165))

(declare-fun m!515167 () Bool)

(assert (=> b!535308 m!515167))

(check-sat (not b!535305) (not b!535308) (not start!48700) (not b!535301) (not b!535306) (not b!535302) (not b!535307) (not b!535300) (not b!535309))
(check-sat)
