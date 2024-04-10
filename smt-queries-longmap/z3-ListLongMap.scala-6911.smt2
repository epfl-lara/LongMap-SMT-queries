; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86884 () Bool)

(assert start!86884)

(declare-fun res!676237 () Bool)

(declare-fun e!566945 () Bool)

(assert (=> start!86884 (=> (not res!676237) (not e!566945))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86884 (= res!676237 (validMask!0 mask!3464))))

(assert (=> start!86884 e!566945))

(declare-datatypes ((array!63532 0))(
  ( (array!63533 (arr!30587 (Array (_ BitVec 32) (_ BitVec 64))) (size!31089 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63532)

(declare-fun array_inv!23711 (array!63532) Bool)

(assert (=> start!86884 (array_inv!23711 a!3219)))

(assert (=> start!86884 true))

(declare-fun b!1007339 () Bool)

(declare-fun res!676238 () Bool)

(assert (=> b!1007339 (=> (not res!676238) (not e!566945))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007339 (= res!676238 (and (= (size!31089 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31089 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31089 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007340 () Bool)

(declare-fun res!676242 () Bool)

(assert (=> b!1007340 (=> (not res!676242) (not e!566945))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007340 (= res!676242 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007341 () Bool)

(declare-fun e!566944 () Bool)

(declare-fun e!566947 () Bool)

(assert (=> b!1007341 (= e!566944 e!566947)))

(declare-fun res!676234 () Bool)

(assert (=> b!1007341 (=> (not res!676234) (not e!566947))))

(declare-datatypes ((SeekEntryResult!9519 0))(
  ( (MissingZero!9519 (index!40447 (_ BitVec 32))) (Found!9519 (index!40448 (_ BitVec 32))) (Intermediate!9519 (undefined!10331 Bool) (index!40449 (_ BitVec 32)) (x!87845 (_ BitVec 32))) (Undefined!9519) (MissingVacant!9519 (index!40450 (_ BitVec 32))) )
))
(declare-fun lt!445150 () SeekEntryResult!9519)

(declare-fun lt!445152 () SeekEntryResult!9519)

(assert (=> b!1007341 (= res!676234 (= lt!445150 lt!445152))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63532 (_ BitVec 32)) SeekEntryResult!9519)

(assert (=> b!1007341 (= lt!445150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30587 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007342 () Bool)

(declare-fun res!676245 () Bool)

(declare-fun e!566943 () Bool)

(assert (=> b!1007342 (=> (not res!676245) (not e!566943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63532 (_ BitVec 32)) Bool)

(assert (=> b!1007342 (= res!676245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007343 () Bool)

(assert (=> b!1007343 (= e!566945 e!566943)))

(declare-fun res!676236 () Bool)

(assert (=> b!1007343 (=> (not res!676236) (not e!566943))))

(declare-fun lt!445148 () SeekEntryResult!9519)

(assert (=> b!1007343 (= res!676236 (or (= lt!445148 (MissingVacant!9519 i!1194)) (= lt!445148 (MissingZero!9519 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63532 (_ BitVec 32)) SeekEntryResult!9519)

(assert (=> b!1007343 (= lt!445148 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007344 () Bool)

(declare-fun res!676240 () Bool)

(assert (=> b!1007344 (=> (not res!676240) (not e!566943))))

(declare-datatypes ((List!21263 0))(
  ( (Nil!21260) (Cons!21259 (h!22445 (_ BitVec 64)) (t!30264 List!21263)) )
))
(declare-fun arrayNoDuplicates!0 (array!63532 (_ BitVec 32) List!21263) Bool)

(assert (=> b!1007344 (= res!676240 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21260))))

(declare-fun b!1007345 () Bool)

(declare-fun res!676233 () Bool)

(declare-fun e!566946 () Bool)

(assert (=> b!1007345 (=> (not res!676233) (not e!566946))))

(declare-fun lt!445149 () (_ BitVec 64))

(declare-fun lt!445151 () array!63532)

(assert (=> b!1007345 (= res!676233 (not (= lt!445150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445149 lt!445151 mask!3464))))))

(declare-fun b!1007346 () Bool)

(declare-fun res!676244 () Bool)

(assert (=> b!1007346 (=> (not res!676244) (not e!566945))))

(assert (=> b!1007346 (= res!676244 (validKeyInArray!0 (select (arr!30587 a!3219) j!170)))))

(declare-fun b!1007347 () Bool)

(declare-fun res!676243 () Bool)

(assert (=> b!1007347 (=> (not res!676243) (not e!566946))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007347 (= res!676243 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007348 () Bool)

(assert (=> b!1007348 (= e!566943 e!566944)))

(declare-fun res!676232 () Bool)

(assert (=> b!1007348 (=> (not res!676232) (not e!566944))))

(declare-fun lt!445154 () SeekEntryResult!9519)

(assert (=> b!1007348 (= res!676232 (= lt!445154 lt!445152))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007348 (= lt!445152 (Intermediate!9519 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007348 (= lt!445154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30587 a!3219) j!170) mask!3464) (select (arr!30587 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007349 () Bool)

(assert (=> b!1007349 (= e!566946 false)))

(declare-fun lt!445153 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007349 (= lt!445153 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007350 () Bool)

(assert (=> b!1007350 (= e!566947 e!566946)))

(declare-fun res!676241 () Bool)

(assert (=> b!1007350 (=> (not res!676241) (not e!566946))))

(assert (=> b!1007350 (= res!676241 (not (= lt!445154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445149 mask!3464) lt!445149 lt!445151 mask!3464))))))

(assert (=> b!1007350 (= lt!445149 (select (store (arr!30587 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007350 (= lt!445151 (array!63533 (store (arr!30587 a!3219) i!1194 k0!2224) (size!31089 a!3219)))))

(declare-fun b!1007351 () Bool)

(declare-fun res!676235 () Bool)

(assert (=> b!1007351 (=> (not res!676235) (not e!566945))))

(declare-fun arrayContainsKey!0 (array!63532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007351 (= res!676235 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007352 () Bool)

(declare-fun res!676239 () Bool)

(assert (=> b!1007352 (=> (not res!676239) (not e!566943))))

(assert (=> b!1007352 (= res!676239 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31089 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31089 a!3219))))))

(assert (= (and start!86884 res!676237) b!1007339))

(assert (= (and b!1007339 res!676238) b!1007346))

(assert (= (and b!1007346 res!676244) b!1007340))

(assert (= (and b!1007340 res!676242) b!1007351))

(assert (= (and b!1007351 res!676235) b!1007343))

(assert (= (and b!1007343 res!676236) b!1007342))

(assert (= (and b!1007342 res!676245) b!1007344))

(assert (= (and b!1007344 res!676240) b!1007352))

(assert (= (and b!1007352 res!676239) b!1007348))

(assert (= (and b!1007348 res!676232) b!1007341))

(assert (= (and b!1007341 res!676234) b!1007350))

(assert (= (and b!1007350 res!676241) b!1007345))

(assert (= (and b!1007345 res!676233) b!1007347))

(assert (= (and b!1007347 res!676243) b!1007349))

(declare-fun m!932243 () Bool)

(assert (=> b!1007344 m!932243))

(declare-fun m!932245 () Bool)

(assert (=> b!1007345 m!932245))

(declare-fun m!932247 () Bool)

(assert (=> b!1007348 m!932247))

(assert (=> b!1007348 m!932247))

(declare-fun m!932249 () Bool)

(assert (=> b!1007348 m!932249))

(assert (=> b!1007348 m!932249))

(assert (=> b!1007348 m!932247))

(declare-fun m!932251 () Bool)

(assert (=> b!1007348 m!932251))

(assert (=> b!1007346 m!932247))

(assert (=> b!1007346 m!932247))

(declare-fun m!932253 () Bool)

(assert (=> b!1007346 m!932253))

(declare-fun m!932255 () Bool)

(assert (=> b!1007349 m!932255))

(declare-fun m!932257 () Bool)

(assert (=> b!1007350 m!932257))

(assert (=> b!1007350 m!932257))

(declare-fun m!932259 () Bool)

(assert (=> b!1007350 m!932259))

(declare-fun m!932261 () Bool)

(assert (=> b!1007350 m!932261))

(declare-fun m!932263 () Bool)

(assert (=> b!1007350 m!932263))

(assert (=> b!1007341 m!932247))

(assert (=> b!1007341 m!932247))

(declare-fun m!932265 () Bool)

(assert (=> b!1007341 m!932265))

(declare-fun m!932267 () Bool)

(assert (=> b!1007342 m!932267))

(declare-fun m!932269 () Bool)

(assert (=> start!86884 m!932269))

(declare-fun m!932271 () Bool)

(assert (=> start!86884 m!932271))

(declare-fun m!932273 () Bool)

(assert (=> b!1007340 m!932273))

(declare-fun m!932275 () Bool)

(assert (=> b!1007351 m!932275))

(declare-fun m!932277 () Bool)

(assert (=> b!1007343 m!932277))

(check-sat (not b!1007348) (not b!1007351) (not b!1007342) (not start!86884) (not b!1007345) (not b!1007346) (not b!1007343) (not b!1007350) (not b!1007340) (not b!1007341) (not b!1007344) (not b!1007349))
(check-sat)
