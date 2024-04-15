; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86928 () Bool)

(assert start!86928)

(declare-fun b!1008213 () Bool)

(declare-fun res!677234 () Bool)

(declare-fun e!567281 () Bool)

(assert (=> b!1008213 (=> (not res!677234) (not e!567281))))

(declare-datatypes ((array!63523 0))(
  ( (array!63524 (arr!30582 (Array (_ BitVec 32) (_ BitVec 64))) (size!31086 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63523)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008213 (= res!677234 (validKeyInArray!0 (select (arr!30582 a!3219) j!170)))))

(declare-fun b!1008214 () Bool)

(declare-fun res!677240 () Bool)

(declare-fun e!567280 () Bool)

(assert (=> b!1008214 (=> (not res!677240) (not e!567280))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1008214 (= res!677240 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31086 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31086 a!3219))))))

(declare-fun b!1008215 () Bool)

(declare-fun res!677232 () Bool)

(assert (=> b!1008215 (=> (not res!677232) (not e!567281))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!1008215 (= res!677232 (and (= (size!31086 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31086 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31086 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008216 () Bool)

(declare-fun e!567283 () Bool)

(assert (=> b!1008216 (= e!567280 e!567283)))

(declare-fun res!677241 () Bool)

(assert (=> b!1008216 (=> (not res!677241) (not e!567283))))

(declare-datatypes ((SeekEntryResult!9539 0))(
  ( (MissingZero!9539 (index!40527 (_ BitVec 32))) (Found!9539 (index!40528 (_ BitVec 32))) (Intermediate!9539 (undefined!10351 Bool) (index!40529 (_ BitVec 32)) (x!87932 (_ BitVec 32))) (Undefined!9539) (MissingVacant!9539 (index!40530 (_ BitVec 32))) )
))
(declare-fun lt!445466 () SeekEntryResult!9539)

(declare-fun lt!445465 () SeekEntryResult!9539)

(assert (=> b!1008216 (= res!677241 (= lt!445466 lt!445465))))

(assert (=> b!1008216 (= lt!445465 (Intermediate!9539 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63523 (_ BitVec 32)) SeekEntryResult!9539)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008216 (= lt!445466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30582 a!3219) j!170) mask!3464) (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008217 () Bool)

(declare-fun e!567284 () Bool)

(assert (=> b!1008217 (= e!567283 e!567284)))

(declare-fun res!677243 () Bool)

(assert (=> b!1008217 (=> (not res!677243) (not e!567284))))

(declare-fun lt!445463 () SeekEntryResult!9539)

(assert (=> b!1008217 (= res!677243 (= lt!445463 lt!445465))))

(assert (=> b!1008217 (= lt!445463 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30582 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008218 () Bool)

(declare-fun res!677237 () Bool)

(declare-fun e!567279 () Bool)

(assert (=> b!1008218 (=> (not res!677237) (not e!567279))))

(assert (=> b!1008218 (= res!677237 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008219 () Bool)

(declare-fun res!677235 () Bool)

(assert (=> b!1008219 (=> (not res!677235) (not e!567281))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1008219 (= res!677235 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008220 () Bool)

(declare-fun res!677231 () Bool)

(assert (=> b!1008220 (=> (not res!677231) (not e!567279))))

(declare-fun lt!445468 () array!63523)

(declare-fun lt!445464 () (_ BitVec 64))

(assert (=> b!1008220 (= res!677231 (not (= lt!445463 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445464 lt!445468 mask!3464))))))

(declare-fun b!1008221 () Bool)

(assert (=> b!1008221 (= e!567281 e!567280)))

(declare-fun res!677242 () Bool)

(assert (=> b!1008221 (=> (not res!677242) (not e!567280))))

(declare-fun lt!445467 () SeekEntryResult!9539)

(assert (=> b!1008221 (= res!677242 (or (= lt!445467 (MissingVacant!9539 i!1194)) (= lt!445467 (MissingZero!9539 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63523 (_ BitVec 32)) SeekEntryResult!9539)

(assert (=> b!1008221 (= lt!445467 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008222 () Bool)

(assert (=> b!1008222 (= e!567284 e!567279)))

(declare-fun res!677239 () Bool)

(assert (=> b!1008222 (=> (not res!677239) (not e!567279))))

(assert (=> b!1008222 (= res!677239 (not (= lt!445466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445464 mask!3464) lt!445464 lt!445468 mask!3464))))))

(assert (=> b!1008222 (= lt!445464 (select (store (arr!30582 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008222 (= lt!445468 (array!63524 (store (arr!30582 a!3219) i!1194 k0!2224) (size!31086 a!3219)))))

(declare-fun res!677233 () Bool)

(assert (=> start!86928 (=> (not res!677233) (not e!567281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86928 (= res!677233 (validMask!0 mask!3464))))

(assert (=> start!86928 e!567281))

(declare-fun array_inv!23725 (array!63523) Bool)

(assert (=> start!86928 (array_inv!23725 a!3219)))

(assert (=> start!86928 true))

(declare-fun b!1008223 () Bool)

(declare-fun res!677236 () Bool)

(assert (=> b!1008223 (=> (not res!677236) (not e!567280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63523 (_ BitVec 32)) Bool)

(assert (=> b!1008223 (= res!677236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008224 () Bool)

(declare-fun res!677230 () Bool)

(assert (=> b!1008224 (=> (not res!677230) (not e!567280))))

(declare-datatypes ((List!21324 0))(
  ( (Nil!21321) (Cons!21320 (h!22506 (_ BitVec 64)) (t!30316 List!21324)) )
))
(declare-fun arrayNoDuplicates!0 (array!63523 (_ BitVec 32) List!21324) Bool)

(assert (=> b!1008224 (= res!677230 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21321))))

(declare-fun b!1008225 () Bool)

(assert (=> b!1008225 (= e!567279 false)))

(declare-fun lt!445462 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008225 (= lt!445462 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008226 () Bool)

(declare-fun res!677238 () Bool)

(assert (=> b!1008226 (=> (not res!677238) (not e!567281))))

(declare-fun arrayContainsKey!0 (array!63523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008226 (= res!677238 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86928 res!677233) b!1008215))

(assert (= (and b!1008215 res!677232) b!1008213))

(assert (= (and b!1008213 res!677234) b!1008219))

(assert (= (and b!1008219 res!677235) b!1008226))

(assert (= (and b!1008226 res!677238) b!1008221))

(assert (= (and b!1008221 res!677242) b!1008223))

(assert (= (and b!1008223 res!677236) b!1008224))

(assert (= (and b!1008224 res!677230) b!1008214))

(assert (= (and b!1008214 res!677240) b!1008216))

(assert (= (and b!1008216 res!677241) b!1008217))

(assert (= (and b!1008217 res!677243) b!1008222))

(assert (= (and b!1008222 res!677239) b!1008220))

(assert (= (and b!1008220 res!677231) b!1008218))

(assert (= (and b!1008218 res!677237) b!1008225))

(declare-fun m!932449 () Bool)

(assert (=> b!1008224 m!932449))

(declare-fun m!932451 () Bool)

(assert (=> b!1008216 m!932451))

(assert (=> b!1008216 m!932451))

(declare-fun m!932453 () Bool)

(assert (=> b!1008216 m!932453))

(assert (=> b!1008216 m!932453))

(assert (=> b!1008216 m!932451))

(declare-fun m!932455 () Bool)

(assert (=> b!1008216 m!932455))

(declare-fun m!932457 () Bool)

(assert (=> b!1008219 m!932457))

(declare-fun m!932459 () Bool)

(assert (=> b!1008223 m!932459))

(declare-fun m!932461 () Bool)

(assert (=> b!1008220 m!932461))

(assert (=> b!1008217 m!932451))

(assert (=> b!1008217 m!932451))

(declare-fun m!932463 () Bool)

(assert (=> b!1008217 m!932463))

(declare-fun m!932465 () Bool)

(assert (=> start!86928 m!932465))

(declare-fun m!932467 () Bool)

(assert (=> start!86928 m!932467))

(declare-fun m!932469 () Bool)

(assert (=> b!1008226 m!932469))

(assert (=> b!1008213 m!932451))

(assert (=> b!1008213 m!932451))

(declare-fun m!932471 () Bool)

(assert (=> b!1008213 m!932471))

(declare-fun m!932473 () Bool)

(assert (=> b!1008225 m!932473))

(declare-fun m!932475 () Bool)

(assert (=> b!1008222 m!932475))

(assert (=> b!1008222 m!932475))

(declare-fun m!932477 () Bool)

(assert (=> b!1008222 m!932477))

(declare-fun m!932479 () Bool)

(assert (=> b!1008222 m!932479))

(declare-fun m!932481 () Bool)

(assert (=> b!1008222 m!932481))

(declare-fun m!932483 () Bool)

(assert (=> b!1008221 m!932483))

(check-sat (not b!1008220) (not b!1008213) (not b!1008224) (not b!1008217) (not b!1008223) (not b!1008216) (not b!1008219) (not b!1008225) (not b!1008221) (not b!1008226) (not b!1008222) (not start!86928))
(check-sat)
