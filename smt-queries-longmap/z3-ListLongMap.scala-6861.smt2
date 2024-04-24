; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86596 () Bool)

(assert start!86596)

(declare-fun b!1001249 () Bool)

(declare-fun res!670161 () Bool)

(declare-fun e!564456 () Bool)

(assert (=> b!1001249 (=> (not res!670161) (not e!564456))))

(declare-datatypes ((array!63267 0))(
  ( (array!63268 (arr!30454 (Array (_ BitVec 32) (_ BitVec 64))) (size!30957 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63267)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63267 (_ BitVec 32)) Bool)

(assert (=> b!1001249 (= res!670161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001250 () Bool)

(declare-fun e!564459 () Bool)

(assert (=> b!1001250 (= e!564459 e!564456)))

(declare-fun res!670170 () Bool)

(assert (=> b!1001250 (=> (not res!670170) (not e!564456))))

(declare-datatypes ((SeekEntryResult!9322 0))(
  ( (MissingZero!9322 (index!39659 (_ BitVec 32))) (Found!9322 (index!39660 (_ BitVec 32))) (Intermediate!9322 (undefined!10134 Bool) (index!39661 (_ BitVec 32)) (x!87244 (_ BitVec 32))) (Undefined!9322) (MissingVacant!9322 (index!39662 (_ BitVec 32))) )
))
(declare-fun lt!442625 () SeekEntryResult!9322)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001250 (= res!670170 (or (= lt!442625 (MissingVacant!9322 i!1194)) (= lt!442625 (MissingZero!9322 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63267 (_ BitVec 32)) SeekEntryResult!9322)

(assert (=> b!1001250 (= lt!442625 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!670164 () Bool)

(assert (=> start!86596 (=> (not res!670164) (not e!564459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86596 (= res!670164 (validMask!0 mask!3464))))

(assert (=> start!86596 e!564459))

(declare-fun array_inv!23590 (array!63267) Bool)

(assert (=> start!86596 (array_inv!23590 a!3219)))

(assert (=> start!86596 true))

(declare-fun b!1001251 () Bool)

(declare-fun e!564457 () Bool)

(assert (=> b!1001251 (= e!564456 e!564457)))

(declare-fun res!670165 () Bool)

(assert (=> b!1001251 (=> (not res!670165) (not e!564457))))

(declare-fun lt!442623 () SeekEntryResult!9322)

(declare-fun lt!442624 () SeekEntryResult!9322)

(assert (=> b!1001251 (= res!670165 (= lt!442623 lt!442624))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001251 (= lt!442624 (Intermediate!9322 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63267 (_ BitVec 32)) SeekEntryResult!9322)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001251 (= lt!442623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30454 a!3219) j!170) mask!3464) (select (arr!30454 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001252 () Bool)

(declare-fun res!670168 () Bool)

(assert (=> b!1001252 (=> (not res!670168) (not e!564456))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1001252 (= res!670168 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30957 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30957 a!3219))))))

(declare-fun b!1001253 () Bool)

(declare-fun res!670163 () Bool)

(assert (=> b!1001253 (=> (not res!670163) (not e!564459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001253 (= res!670163 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001254 () Bool)

(declare-fun res!670172 () Bool)

(assert (=> b!1001254 (=> (not res!670172) (not e!564459))))

(declare-fun arrayContainsKey!0 (array!63267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001254 (= res!670172 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001255 () Bool)

(declare-fun res!670169 () Bool)

(assert (=> b!1001255 (=> (not res!670169) (not e!564457))))

(assert (=> b!1001255 (= res!670169 (not (= lt!442623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30454 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30454 a!3219) i!1194 k0!2224) j!170) (array!63268 (store (arr!30454 a!3219) i!1194 k0!2224) (size!30957 a!3219)) mask!3464))))))

(declare-fun b!1001256 () Bool)

(declare-fun res!670167 () Bool)

(assert (=> b!1001256 (=> (not res!670167) (not e!564459))))

(assert (=> b!1001256 (= res!670167 (and (= (size!30957 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30957 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30957 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001257 () Bool)

(declare-fun res!670162 () Bool)

(assert (=> b!1001257 (=> (not res!670162) (not e!564459))))

(assert (=> b!1001257 (= res!670162 (validKeyInArray!0 (select (arr!30454 a!3219) j!170)))))

(declare-fun b!1001258 () Bool)

(assert (=> b!1001258 (= e!564457 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun b!1001259 () Bool)

(declare-fun res!670171 () Bool)

(assert (=> b!1001259 (=> (not res!670171) (not e!564457))))

(assert (=> b!1001259 (= res!670171 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30454 a!3219) j!170) a!3219 mask!3464) lt!442624))))

(declare-fun b!1001260 () Bool)

(declare-fun res!670166 () Bool)

(assert (=> b!1001260 (=> (not res!670166) (not e!564456))))

(declare-datatypes ((List!21101 0))(
  ( (Nil!21098) (Cons!21097 (h!22280 (_ BitVec 64)) (t!30094 List!21101)) )
))
(declare-fun arrayNoDuplicates!0 (array!63267 (_ BitVec 32) List!21101) Bool)

(assert (=> b!1001260 (= res!670166 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21098))))

(assert (= (and start!86596 res!670164) b!1001256))

(assert (= (and b!1001256 res!670167) b!1001257))

(assert (= (and b!1001257 res!670162) b!1001253))

(assert (= (and b!1001253 res!670163) b!1001254))

(assert (= (and b!1001254 res!670172) b!1001250))

(assert (= (and b!1001250 res!670170) b!1001249))

(assert (= (and b!1001249 res!670161) b!1001260))

(assert (= (and b!1001260 res!670166) b!1001252))

(assert (= (and b!1001252 res!670168) b!1001251))

(assert (= (and b!1001251 res!670165) b!1001259))

(assert (= (and b!1001259 res!670171) b!1001255))

(assert (= (and b!1001255 res!670169) b!1001258))

(declare-fun m!927833 () Bool)

(assert (=> b!1001251 m!927833))

(assert (=> b!1001251 m!927833))

(declare-fun m!927835 () Bool)

(assert (=> b!1001251 m!927835))

(assert (=> b!1001251 m!927835))

(assert (=> b!1001251 m!927833))

(declare-fun m!927837 () Bool)

(assert (=> b!1001251 m!927837))

(declare-fun m!927839 () Bool)

(assert (=> start!86596 m!927839))

(declare-fun m!927841 () Bool)

(assert (=> start!86596 m!927841))

(declare-fun m!927843 () Bool)

(assert (=> b!1001255 m!927843))

(declare-fun m!927845 () Bool)

(assert (=> b!1001255 m!927845))

(assert (=> b!1001255 m!927845))

(declare-fun m!927847 () Bool)

(assert (=> b!1001255 m!927847))

(assert (=> b!1001255 m!927847))

(assert (=> b!1001255 m!927845))

(declare-fun m!927849 () Bool)

(assert (=> b!1001255 m!927849))

(declare-fun m!927851 () Bool)

(assert (=> b!1001253 m!927851))

(declare-fun m!927853 () Bool)

(assert (=> b!1001254 m!927853))

(declare-fun m!927855 () Bool)

(assert (=> b!1001250 m!927855))

(declare-fun m!927857 () Bool)

(assert (=> b!1001249 m!927857))

(assert (=> b!1001257 m!927833))

(assert (=> b!1001257 m!927833))

(declare-fun m!927859 () Bool)

(assert (=> b!1001257 m!927859))

(assert (=> b!1001259 m!927833))

(assert (=> b!1001259 m!927833))

(declare-fun m!927861 () Bool)

(assert (=> b!1001259 m!927861))

(declare-fun m!927863 () Bool)

(assert (=> b!1001260 m!927863))

(check-sat (not b!1001254) (not b!1001251) (not b!1001249) (not b!1001253) (not b!1001259) (not b!1001255) (not b!1001250) (not start!86596) (not b!1001257) (not b!1001260))
(check-sat)
