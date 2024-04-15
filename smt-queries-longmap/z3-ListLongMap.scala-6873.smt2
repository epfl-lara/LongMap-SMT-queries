; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86484 () Bool)

(assert start!86484)

(declare-fun b!1001539 () Bool)

(declare-fun e!564307 () Bool)

(declare-fun e!564302 () Bool)

(assert (=> b!1001539 (= e!564307 e!564302)))

(declare-fun res!671150 () Bool)

(assert (=> b!1001539 (=> (not res!671150) (not e!564302))))

(declare-datatypes ((SeekEntryResult!9398 0))(
  ( (MissingZero!9398 (index!39963 (_ BitVec 32))) (Found!9398 (index!39964 (_ BitVec 32))) (Intermediate!9398 (undefined!10210 Bool) (index!39965 (_ BitVec 32)) (x!87397 (_ BitVec 32))) (Undefined!9398) (MissingVacant!9398 (index!39966 (_ BitVec 32))) )
))
(declare-fun lt!442605 () SeekEntryResult!9398)

(declare-fun lt!442604 () SeekEntryResult!9398)

(assert (=> b!1001539 (= res!671150 (= lt!442605 lt!442604))))

(declare-datatypes ((array!63232 0))(
  ( (array!63233 (arr!30441 (Array (_ BitVec 32) (_ BitVec 64))) (size!30945 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63232)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63232 (_ BitVec 32)) SeekEntryResult!9398)

(assert (=> b!1001539 (= lt!442605 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30441 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001540 () Bool)

(declare-fun e!564306 () Bool)

(assert (=> b!1001540 (= e!564306 e!564307)))

(declare-fun res!671155 () Bool)

(assert (=> b!1001540 (=> (not res!671155) (not e!564307))))

(declare-fun lt!442602 () SeekEntryResult!9398)

(assert (=> b!1001540 (= res!671155 (= lt!442602 lt!442604))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001540 (= lt!442604 (Intermediate!9398 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001540 (= lt!442602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30441 a!3219) j!170) mask!3464) (select (arr!30441 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001541 () Bool)

(declare-fun res!671143 () Bool)

(assert (=> b!1001541 (=> (not res!671143) (not e!564306))))

(declare-datatypes ((List!21183 0))(
  ( (Nil!21180) (Cons!21179 (h!22356 (_ BitVec 64)) (t!30175 List!21183)) )
))
(declare-fun arrayNoDuplicates!0 (array!63232 (_ BitVec 32) List!21183) Bool)

(assert (=> b!1001541 (= res!671143 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21180))))

(declare-fun b!1001543 () Bool)

(declare-fun res!671144 () Bool)

(declare-fun e!564305 () Bool)

(assert (=> b!1001543 (=> (not res!671144) (not e!564305))))

(declare-fun lt!442609 () (_ BitVec 64))

(declare-fun lt!442608 () array!63232)

(assert (=> b!1001543 (= res!671144 (not (= lt!442605 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442609 lt!442608 mask!3464))))))

(declare-fun b!1001544 () Bool)

(declare-fun res!671145 () Bool)

(declare-fun e!564304 () Bool)

(assert (=> b!1001544 (=> (not res!671145) (not e!564304))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001544 (= res!671145 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001545 () Bool)

(declare-fun res!671154 () Bool)

(declare-fun e!564303 () Bool)

(assert (=> b!1001545 (=> (not res!671154) (not e!564303))))

(declare-fun lt!442603 () (_ BitVec 32))

(assert (=> b!1001545 (= res!671154 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442603 (select (arr!30441 a!3219) j!170) a!3219 mask!3464) lt!442604))))

(declare-fun b!1001546 () Bool)

(assert (=> b!1001546 (= e!564302 e!564305)))

(declare-fun res!671147 () Bool)

(assert (=> b!1001546 (=> (not res!671147) (not e!564305))))

(assert (=> b!1001546 (= res!671147 (not (= lt!442602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442609 mask!3464) lt!442609 lt!442608 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001546 (= lt!442609 (select (store (arr!30441 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1001546 (= lt!442608 (array!63233 (store (arr!30441 a!3219) i!1194 k0!2224) (size!30945 a!3219)))))

(declare-fun b!1001547 () Bool)

(declare-fun res!671141 () Bool)

(assert (=> b!1001547 (=> (not res!671141) (not e!564304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001547 (= res!671141 (validKeyInArray!0 (select (arr!30441 a!3219) j!170)))))

(declare-fun b!1001548 () Bool)

(declare-fun res!671152 () Bool)

(assert (=> b!1001548 (=> (not res!671152) (not e!564306))))

(assert (=> b!1001548 (= res!671152 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30945 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30945 a!3219))))))

(declare-fun b!1001549 () Bool)

(declare-fun res!671146 () Bool)

(assert (=> b!1001549 (=> (not res!671146) (not e!564304))))

(assert (=> b!1001549 (= res!671146 (and (= (size!30945 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30945 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30945 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001550 () Bool)

(assert (=> b!1001550 (= e!564305 e!564303)))

(declare-fun res!671142 () Bool)

(assert (=> b!1001550 (=> (not res!671142) (not e!564303))))

(assert (=> b!1001550 (= res!671142 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442603 #b00000000000000000000000000000000) (bvslt lt!442603 (size!30945 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001550 (= lt!442603 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001551 () Bool)

(assert (=> b!1001551 (= e!564304 e!564306)))

(declare-fun res!671149 () Bool)

(assert (=> b!1001551 (=> (not res!671149) (not e!564306))))

(declare-fun lt!442607 () SeekEntryResult!9398)

(assert (=> b!1001551 (= res!671149 (or (= lt!442607 (MissingVacant!9398 i!1194)) (= lt!442607 (MissingZero!9398 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63232 (_ BitVec 32)) SeekEntryResult!9398)

(assert (=> b!1001551 (= lt!442607 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001552 () Bool)

(declare-fun res!671153 () Bool)

(assert (=> b!1001552 (=> (not res!671153) (not e!564304))))

(assert (=> b!1001552 (= res!671153 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001542 () Bool)

(assert (=> b!1001542 (= e!564303 false)))

(declare-fun lt!442606 () SeekEntryResult!9398)

(assert (=> b!1001542 (= lt!442606 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442603 lt!442609 lt!442608 mask!3464))))

(declare-fun res!671156 () Bool)

(assert (=> start!86484 (=> (not res!671156) (not e!564304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86484 (= res!671156 (validMask!0 mask!3464))))

(assert (=> start!86484 e!564304))

(declare-fun array_inv!23584 (array!63232) Bool)

(assert (=> start!86484 (array_inv!23584 a!3219)))

(assert (=> start!86484 true))

(declare-fun b!1001553 () Bool)

(declare-fun res!671148 () Bool)

(assert (=> b!1001553 (=> (not res!671148) (not e!564306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63232 (_ BitVec 32)) Bool)

(assert (=> b!1001553 (= res!671148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001554 () Bool)

(declare-fun res!671151 () Bool)

(assert (=> b!1001554 (=> (not res!671151) (not e!564305))))

(assert (=> b!1001554 (= res!671151 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86484 res!671156) b!1001549))

(assert (= (and b!1001549 res!671146) b!1001547))

(assert (= (and b!1001547 res!671141) b!1001552))

(assert (= (and b!1001552 res!671153) b!1001544))

(assert (= (and b!1001544 res!671145) b!1001551))

(assert (= (and b!1001551 res!671149) b!1001553))

(assert (= (and b!1001553 res!671148) b!1001541))

(assert (= (and b!1001541 res!671143) b!1001548))

(assert (= (and b!1001548 res!671152) b!1001540))

(assert (= (and b!1001540 res!671155) b!1001539))

(assert (= (and b!1001539 res!671150) b!1001546))

(assert (= (and b!1001546 res!671147) b!1001543))

(assert (= (and b!1001543 res!671144) b!1001554))

(assert (= (and b!1001554 res!671151) b!1001550))

(assert (= (and b!1001550 res!671142) b!1001545))

(assert (= (and b!1001545 res!671154) b!1001542))

(declare-fun m!927019 () Bool)

(assert (=> b!1001550 m!927019))

(declare-fun m!927021 () Bool)

(assert (=> b!1001551 m!927021))

(declare-fun m!927023 () Bool)

(assert (=> b!1001546 m!927023))

(assert (=> b!1001546 m!927023))

(declare-fun m!927025 () Bool)

(assert (=> b!1001546 m!927025))

(declare-fun m!927027 () Bool)

(assert (=> b!1001546 m!927027))

(declare-fun m!927029 () Bool)

(assert (=> b!1001546 m!927029))

(declare-fun m!927031 () Bool)

(assert (=> b!1001553 m!927031))

(declare-fun m!927033 () Bool)

(assert (=> b!1001542 m!927033))

(declare-fun m!927035 () Bool)

(assert (=> b!1001552 m!927035))

(declare-fun m!927037 () Bool)

(assert (=> b!1001543 m!927037))

(declare-fun m!927039 () Bool)

(assert (=> b!1001540 m!927039))

(assert (=> b!1001540 m!927039))

(declare-fun m!927041 () Bool)

(assert (=> b!1001540 m!927041))

(assert (=> b!1001540 m!927041))

(assert (=> b!1001540 m!927039))

(declare-fun m!927043 () Bool)

(assert (=> b!1001540 m!927043))

(declare-fun m!927045 () Bool)

(assert (=> b!1001541 m!927045))

(assert (=> b!1001547 m!927039))

(assert (=> b!1001547 m!927039))

(declare-fun m!927047 () Bool)

(assert (=> b!1001547 m!927047))

(assert (=> b!1001539 m!927039))

(assert (=> b!1001539 m!927039))

(declare-fun m!927049 () Bool)

(assert (=> b!1001539 m!927049))

(assert (=> b!1001545 m!927039))

(assert (=> b!1001545 m!927039))

(declare-fun m!927051 () Bool)

(assert (=> b!1001545 m!927051))

(declare-fun m!927053 () Bool)

(assert (=> b!1001544 m!927053))

(declare-fun m!927055 () Bool)

(assert (=> start!86484 m!927055))

(declare-fun m!927057 () Bool)

(assert (=> start!86484 m!927057))

(check-sat (not b!1001550) (not b!1001541) (not b!1001545) (not b!1001552) (not b!1001540) (not b!1001553) (not b!1001546) (not b!1001543) (not start!86484) (not b!1001544) (not b!1001547) (not b!1001539) (not b!1001551) (not b!1001542))
(check-sat)
