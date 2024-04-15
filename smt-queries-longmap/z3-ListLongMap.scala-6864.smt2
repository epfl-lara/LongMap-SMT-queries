; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86430 () Bool)

(assert start!86430)

(declare-fun b!1000415 () Bool)

(declare-fun e!563829 () Bool)

(declare-fun e!563828 () Bool)

(assert (=> b!1000415 (= e!563829 e!563828)))

(declare-fun res!670018 () Bool)

(assert (=> b!1000415 (=> (not res!670018) (not e!563828))))

(declare-datatypes ((SeekEntryResult!9371 0))(
  ( (MissingZero!9371 (index!39855 (_ BitVec 32))) (Found!9371 (index!39856 (_ BitVec 32))) (Intermediate!9371 (undefined!10183 Bool) (index!39857 (_ BitVec 32)) (x!87298 (_ BitVec 32))) (Undefined!9371) (MissingVacant!9371 (index!39858 (_ BitVec 32))) )
))
(declare-fun lt!442107 () SeekEntryResult!9371)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000415 (= res!670018 (or (= lt!442107 (MissingVacant!9371 i!1194)) (= lt!442107 (MissingZero!9371 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-datatypes ((array!63178 0))(
  ( (array!63179 (arr!30414 (Array (_ BitVec 32) (_ BitVec 64))) (size!30918 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63178)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63178 (_ BitVec 32)) SeekEntryResult!9371)

(assert (=> b!1000415 (= lt!442107 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!670020 () Bool)

(assert (=> start!86430 (=> (not res!670020) (not e!563829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86430 (= res!670020 (validMask!0 mask!3464))))

(assert (=> start!86430 e!563829))

(declare-fun array_inv!23557 (array!63178) Bool)

(assert (=> start!86430 (array_inv!23557 a!3219)))

(assert (=> start!86430 true))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!1000416 () Bool)

(declare-fun e!563830 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000416 (= e!563830 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000417 () Bool)

(declare-fun res!670023 () Bool)

(assert (=> b!1000417 (=> (not res!670023) (not e!563828))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000417 (= res!670023 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30918 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30918 a!3219))))))

(declare-fun b!1000418 () Bool)

(declare-fun res!670028 () Bool)

(assert (=> b!1000418 (=> (not res!670028) (not e!563829))))

(declare-fun arrayContainsKey!0 (array!63178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000418 (= res!670028 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000419 () Bool)

(declare-fun res!670027 () Bool)

(assert (=> b!1000419 (=> (not res!670027) (not e!563830))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442108 () SeekEntryResult!9371)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63178 (_ BitVec 32)) SeekEntryResult!9371)

(assert (=> b!1000419 (= res!670027 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30414 a!3219) j!170) a!3219 mask!3464) lt!442108))))

(declare-fun b!1000420 () Bool)

(declare-fun res!670019 () Bool)

(assert (=> b!1000420 (=> (not res!670019) (not e!563829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000420 (= res!670019 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000421 () Bool)

(declare-fun res!670024 () Bool)

(assert (=> b!1000421 (=> (not res!670024) (not e!563829))))

(assert (=> b!1000421 (= res!670024 (and (= (size!30918 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30918 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30918 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000422 () Bool)

(assert (=> b!1000422 (= e!563828 e!563830)))

(declare-fun res!670026 () Bool)

(assert (=> b!1000422 (=> (not res!670026) (not e!563830))))

(declare-fun lt!442106 () SeekEntryResult!9371)

(assert (=> b!1000422 (= res!670026 (= lt!442106 lt!442108))))

(assert (=> b!1000422 (= lt!442108 (Intermediate!9371 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000422 (= lt!442106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30414 a!3219) j!170) mask!3464) (select (arr!30414 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000423 () Bool)

(declare-fun res!670022 () Bool)

(assert (=> b!1000423 (=> (not res!670022) (not e!563828))))

(declare-datatypes ((List!21156 0))(
  ( (Nil!21153) (Cons!21152 (h!22329 (_ BitVec 64)) (t!30148 List!21156)) )
))
(declare-fun arrayNoDuplicates!0 (array!63178 (_ BitVec 32) List!21156) Bool)

(assert (=> b!1000423 (= res!670022 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21153))))

(declare-fun b!1000424 () Bool)

(declare-fun res!670025 () Bool)

(assert (=> b!1000424 (=> (not res!670025) (not e!563829))))

(assert (=> b!1000424 (= res!670025 (validKeyInArray!0 (select (arr!30414 a!3219) j!170)))))

(declare-fun b!1000425 () Bool)

(declare-fun res!670021 () Bool)

(assert (=> b!1000425 (=> (not res!670021) (not e!563828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63178 (_ BitVec 32)) Bool)

(assert (=> b!1000425 (= res!670021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000426 () Bool)

(declare-fun res!670017 () Bool)

(assert (=> b!1000426 (=> (not res!670017) (not e!563830))))

(assert (=> b!1000426 (= res!670017 (not (= lt!442106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30414 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30414 a!3219) i!1194 k0!2224) j!170) (array!63179 (store (arr!30414 a!3219) i!1194 k0!2224) (size!30918 a!3219)) mask!3464))))))

(assert (= (and start!86430 res!670020) b!1000421))

(assert (= (and b!1000421 res!670024) b!1000424))

(assert (= (and b!1000424 res!670025) b!1000420))

(assert (= (and b!1000420 res!670019) b!1000418))

(assert (= (and b!1000418 res!670028) b!1000415))

(assert (= (and b!1000415 res!670018) b!1000425))

(assert (= (and b!1000425 res!670021) b!1000423))

(assert (= (and b!1000423 res!670022) b!1000417))

(assert (= (and b!1000417 res!670023) b!1000422))

(assert (= (and b!1000422 res!670026) b!1000419))

(assert (= (and b!1000419 res!670027) b!1000426))

(assert (= (and b!1000426 res!670017) b!1000416))

(declare-fun m!926053 () Bool)

(assert (=> b!1000419 m!926053))

(assert (=> b!1000419 m!926053))

(declare-fun m!926055 () Bool)

(assert (=> b!1000419 m!926055))

(declare-fun m!926057 () Bool)

(assert (=> start!86430 m!926057))

(declare-fun m!926059 () Bool)

(assert (=> start!86430 m!926059))

(declare-fun m!926061 () Bool)

(assert (=> b!1000415 m!926061))

(assert (=> b!1000422 m!926053))

(assert (=> b!1000422 m!926053))

(declare-fun m!926063 () Bool)

(assert (=> b!1000422 m!926063))

(assert (=> b!1000422 m!926063))

(assert (=> b!1000422 m!926053))

(declare-fun m!926065 () Bool)

(assert (=> b!1000422 m!926065))

(assert (=> b!1000424 m!926053))

(assert (=> b!1000424 m!926053))

(declare-fun m!926067 () Bool)

(assert (=> b!1000424 m!926067))

(declare-fun m!926069 () Bool)

(assert (=> b!1000423 m!926069))

(declare-fun m!926071 () Bool)

(assert (=> b!1000425 m!926071))

(declare-fun m!926073 () Bool)

(assert (=> b!1000418 m!926073))

(declare-fun m!926075 () Bool)

(assert (=> b!1000426 m!926075))

(declare-fun m!926077 () Bool)

(assert (=> b!1000426 m!926077))

(assert (=> b!1000426 m!926077))

(declare-fun m!926079 () Bool)

(assert (=> b!1000426 m!926079))

(assert (=> b!1000426 m!926079))

(assert (=> b!1000426 m!926077))

(declare-fun m!926081 () Bool)

(assert (=> b!1000426 m!926081))

(declare-fun m!926083 () Bool)

(assert (=> b!1000420 m!926083))

(check-sat (not b!1000420) (not b!1000415) (not b!1000423) (not b!1000418) (not b!1000426) (not b!1000424) (not b!1000425) (not b!1000419) (not b!1000422) (not start!86430))
(check-sat)
