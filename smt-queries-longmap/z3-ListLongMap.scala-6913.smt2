; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86896 () Bool)

(assert start!86896)

(declare-fun b!1007591 () Bool)

(declare-fun res!676490 () Bool)

(declare-fun e!567055 () Bool)

(assert (=> b!1007591 (=> (not res!676490) (not e!567055))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007591 (= res!676490 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007592 () Bool)

(declare-fun res!676486 () Bool)

(declare-fun e!567054 () Bool)

(assert (=> b!1007592 (=> (not res!676486) (not e!567054))))

(declare-datatypes ((array!63544 0))(
  ( (array!63545 (arr!30593 (Array (_ BitVec 32) (_ BitVec 64))) (size!31095 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63544)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007592 (= res!676486 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31095 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31095 a!3219))))))

(declare-fun b!1007593 () Bool)

(declare-fun res!676493 () Bool)

(assert (=> b!1007593 (=> (not res!676493) (not e!567055))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1007593 (= res!676493 (validKeyInArray!0 (select (arr!30593 a!3219) j!170)))))

(declare-fun b!1007594 () Bool)

(declare-fun res!676496 () Bool)

(assert (=> b!1007594 (=> (not res!676496) (not e!567055))))

(declare-fun arrayContainsKey!0 (array!63544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007594 (= res!676496 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007595 () Bool)

(declare-fun res!676489 () Bool)

(assert (=> b!1007595 (=> (not res!676489) (not e!567054))))

(declare-datatypes ((List!21269 0))(
  ( (Nil!21266) (Cons!21265 (h!22451 (_ BitVec 64)) (t!30270 List!21269)) )
))
(declare-fun arrayNoDuplicates!0 (array!63544 (_ BitVec 32) List!21269) Bool)

(assert (=> b!1007595 (= res!676489 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21266))))

(declare-fun b!1007596 () Bool)

(assert (=> b!1007596 (= e!567055 e!567054)))

(declare-fun res!676485 () Bool)

(assert (=> b!1007596 (=> (not res!676485) (not e!567054))))

(declare-datatypes ((SeekEntryResult!9525 0))(
  ( (MissingZero!9525 (index!40471 (_ BitVec 32))) (Found!9525 (index!40472 (_ BitVec 32))) (Intermediate!9525 (undefined!10337 Bool) (index!40473 (_ BitVec 32)) (x!87867 (_ BitVec 32))) (Undefined!9525) (MissingVacant!9525 (index!40474 (_ BitVec 32))) )
))
(declare-fun lt!445277 () SeekEntryResult!9525)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007596 (= res!676485 (or (= lt!445277 (MissingVacant!9525 i!1194)) (= lt!445277 (MissingZero!9525 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63544 (_ BitVec 32)) SeekEntryResult!9525)

(assert (=> b!1007596 (= lt!445277 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!676495 () Bool)

(assert (=> start!86896 (=> (not res!676495) (not e!567055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86896 (= res!676495 (validMask!0 mask!3464))))

(assert (=> start!86896 e!567055))

(declare-fun array_inv!23717 (array!63544) Bool)

(assert (=> start!86896 (array_inv!23717 a!3219)))

(assert (=> start!86896 true))

(declare-fun b!1007597 () Bool)

(declare-fun e!567051 () Bool)

(assert (=> b!1007597 (= e!567054 e!567051)))

(declare-fun res!676487 () Bool)

(assert (=> b!1007597 (=> (not res!676487) (not e!567051))))

(declare-fun lt!445280 () SeekEntryResult!9525)

(declare-fun lt!445278 () SeekEntryResult!9525)

(assert (=> b!1007597 (= res!676487 (= lt!445280 lt!445278))))

(assert (=> b!1007597 (= lt!445278 (Intermediate!9525 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63544 (_ BitVec 32)) SeekEntryResult!9525)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007597 (= lt!445280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007598 () Bool)

(declare-fun res!676492 () Bool)

(assert (=> b!1007598 (=> (not res!676492) (not e!567055))))

(assert (=> b!1007598 (= res!676492 (and (= (size!31095 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31095 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31095 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007599 () Bool)

(declare-fun e!567050 () Bool)

(declare-fun e!567053 () Bool)

(assert (=> b!1007599 (= e!567050 e!567053)))

(declare-fun res!676497 () Bool)

(assert (=> b!1007599 (=> (not res!676497) (not e!567053))))

(declare-fun lt!445274 () (_ BitVec 64))

(declare-fun lt!445279 () array!63544)

(assert (=> b!1007599 (= res!676497 (not (= lt!445280 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445274 mask!3464) lt!445274 lt!445279 mask!3464))))))

(assert (=> b!1007599 (= lt!445274 (select (store (arr!30593 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007599 (= lt!445279 (array!63545 (store (arr!30593 a!3219) i!1194 k0!2224) (size!31095 a!3219)))))

(declare-fun b!1007600 () Bool)

(declare-fun res!676484 () Bool)

(assert (=> b!1007600 (=> (not res!676484) (not e!567054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63544 (_ BitVec 32)) Bool)

(assert (=> b!1007600 (= res!676484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007601 () Bool)

(declare-fun res!676488 () Bool)

(assert (=> b!1007601 (=> (not res!676488) (not e!567053))))

(declare-fun lt!445276 () SeekEntryResult!9525)

(assert (=> b!1007601 (= res!676488 (not (= lt!445276 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445274 lt!445279 mask!3464))))))

(declare-fun b!1007602 () Bool)

(assert (=> b!1007602 (= e!567053 false)))

(declare-fun lt!445275 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007602 (= lt!445275 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007603 () Bool)

(assert (=> b!1007603 (= e!567051 e!567050)))

(declare-fun res!676491 () Bool)

(assert (=> b!1007603 (=> (not res!676491) (not e!567050))))

(assert (=> b!1007603 (= res!676491 (= lt!445276 lt!445278))))

(assert (=> b!1007603 (= lt!445276 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007604 () Bool)

(declare-fun res!676494 () Bool)

(assert (=> b!1007604 (=> (not res!676494) (not e!567053))))

(assert (=> b!1007604 (= res!676494 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86896 res!676495) b!1007598))

(assert (= (and b!1007598 res!676492) b!1007593))

(assert (= (and b!1007593 res!676493) b!1007591))

(assert (= (and b!1007591 res!676490) b!1007594))

(assert (= (and b!1007594 res!676496) b!1007596))

(assert (= (and b!1007596 res!676485) b!1007600))

(assert (= (and b!1007600 res!676484) b!1007595))

(assert (= (and b!1007595 res!676489) b!1007592))

(assert (= (and b!1007592 res!676486) b!1007597))

(assert (= (and b!1007597 res!676487) b!1007603))

(assert (= (and b!1007603 res!676491) b!1007599))

(assert (= (and b!1007599 res!676497) b!1007601))

(assert (= (and b!1007601 res!676488) b!1007604))

(assert (= (and b!1007604 res!676494) b!1007602))

(declare-fun m!932459 () Bool)

(assert (=> b!1007597 m!932459))

(assert (=> b!1007597 m!932459))

(declare-fun m!932461 () Bool)

(assert (=> b!1007597 m!932461))

(assert (=> b!1007597 m!932461))

(assert (=> b!1007597 m!932459))

(declare-fun m!932463 () Bool)

(assert (=> b!1007597 m!932463))

(declare-fun m!932465 () Bool)

(assert (=> b!1007596 m!932465))

(declare-fun m!932467 () Bool)

(assert (=> b!1007599 m!932467))

(assert (=> b!1007599 m!932467))

(declare-fun m!932469 () Bool)

(assert (=> b!1007599 m!932469))

(declare-fun m!932471 () Bool)

(assert (=> b!1007599 m!932471))

(declare-fun m!932473 () Bool)

(assert (=> b!1007599 m!932473))

(assert (=> b!1007593 m!932459))

(assert (=> b!1007593 m!932459))

(declare-fun m!932475 () Bool)

(assert (=> b!1007593 m!932475))

(declare-fun m!932477 () Bool)

(assert (=> b!1007595 m!932477))

(declare-fun m!932479 () Bool)

(assert (=> b!1007594 m!932479))

(declare-fun m!932481 () Bool)

(assert (=> b!1007591 m!932481))

(declare-fun m!932483 () Bool)

(assert (=> start!86896 m!932483))

(declare-fun m!932485 () Bool)

(assert (=> start!86896 m!932485))

(assert (=> b!1007603 m!932459))

(assert (=> b!1007603 m!932459))

(declare-fun m!932487 () Bool)

(assert (=> b!1007603 m!932487))

(declare-fun m!932489 () Bool)

(assert (=> b!1007600 m!932489))

(declare-fun m!932491 () Bool)

(assert (=> b!1007601 m!932491))

(declare-fun m!932493 () Bool)

(assert (=> b!1007602 m!932493))

(check-sat (not b!1007595) (not b!1007601) (not b!1007594) (not start!86896) (not b!1007591) (not b!1007593) (not b!1007599) (not b!1007597) (not b!1007596) (not b!1007603) (not b!1007600) (not b!1007602))
(check-sat)
