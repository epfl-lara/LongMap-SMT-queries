; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86134 () Bool)

(assert start!86134)

(declare-fun b!997482 () Bool)

(declare-fun res!667437 () Bool)

(declare-fun e!562625 () Bool)

(assert (=> b!997482 (=> (not res!667437) (not e!562625))))

(declare-datatypes ((array!63088 0))(
  ( (array!63089 (arr!30374 (Array (_ BitVec 32) (_ BitVec 64))) (size!30876 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63088)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997482 (= res!667437 (and (= (size!30876 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30876 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30876 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997483 () Bool)

(declare-fun e!562626 () Bool)

(assert (=> b!997483 (= e!562626 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9306 0))(
  ( (MissingZero!9306 (index!39595 (_ BitVec 32))) (Found!9306 (index!39596 (_ BitVec 32))) (Intermediate!9306 (undefined!10118 Bool) (index!39597 (_ BitVec 32)) (x!87028 (_ BitVec 32))) (Undefined!9306) (MissingVacant!9306 (index!39598 (_ BitVec 32))) )
))
(declare-fun lt!441464 () SeekEntryResult!9306)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63088 (_ BitVec 32)) SeekEntryResult!9306)

(assert (=> b!997483 (= lt!441464 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30374 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997484 () Bool)

(declare-fun res!667439 () Bool)

(assert (=> b!997484 (=> (not res!667439) (not e!562626))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997484 (= res!667439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30374 a!3219) j!170) mask!3464) (select (arr!30374 a!3219) j!170) a!3219 mask!3464) (Intermediate!9306 false resIndex!38 resX!38)))))

(declare-fun b!997486 () Bool)

(declare-fun res!667443 () Bool)

(assert (=> b!997486 (=> (not res!667443) (not e!562625))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997486 (= res!667443 (validKeyInArray!0 k0!2224))))

(declare-fun b!997487 () Bool)

(assert (=> b!997487 (= e!562625 e!562626)))

(declare-fun res!667438 () Bool)

(assert (=> b!997487 (=> (not res!667438) (not e!562626))))

(declare-fun lt!441463 () SeekEntryResult!9306)

(assert (=> b!997487 (= res!667438 (or (= lt!441463 (MissingVacant!9306 i!1194)) (= lt!441463 (MissingZero!9306 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63088 (_ BitVec 32)) SeekEntryResult!9306)

(assert (=> b!997487 (= lt!441463 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997488 () Bool)

(declare-fun res!667445 () Bool)

(assert (=> b!997488 (=> (not res!667445) (not e!562625))))

(declare-fun arrayContainsKey!0 (array!63088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997488 (= res!667445 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997489 () Bool)

(declare-fun res!667446 () Bool)

(assert (=> b!997489 (=> (not res!667446) (not e!562626))))

(assert (=> b!997489 (= res!667446 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30876 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30876 a!3219))))))

(declare-fun b!997485 () Bool)

(declare-fun res!667442 () Bool)

(assert (=> b!997485 (=> (not res!667442) (not e!562626))))

(declare-datatypes ((List!21050 0))(
  ( (Nil!21047) (Cons!21046 (h!22214 (_ BitVec 64)) (t!30051 List!21050)) )
))
(declare-fun arrayNoDuplicates!0 (array!63088 (_ BitVec 32) List!21050) Bool)

(assert (=> b!997485 (= res!667442 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21047))))

(declare-fun res!667441 () Bool)

(assert (=> start!86134 (=> (not res!667441) (not e!562625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86134 (= res!667441 (validMask!0 mask!3464))))

(assert (=> start!86134 e!562625))

(declare-fun array_inv!23498 (array!63088) Bool)

(assert (=> start!86134 (array_inv!23498 a!3219)))

(assert (=> start!86134 true))

(declare-fun b!997490 () Bool)

(declare-fun res!667440 () Bool)

(assert (=> b!997490 (=> (not res!667440) (not e!562626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63088 (_ BitVec 32)) Bool)

(assert (=> b!997490 (= res!667440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997491 () Bool)

(declare-fun res!667444 () Bool)

(assert (=> b!997491 (=> (not res!667444) (not e!562625))))

(assert (=> b!997491 (= res!667444 (validKeyInArray!0 (select (arr!30374 a!3219) j!170)))))

(assert (= (and start!86134 res!667441) b!997482))

(assert (= (and b!997482 res!667437) b!997491))

(assert (= (and b!997491 res!667444) b!997486))

(assert (= (and b!997486 res!667443) b!997488))

(assert (= (and b!997488 res!667445) b!997487))

(assert (= (and b!997487 res!667438) b!997490))

(assert (= (and b!997490 res!667440) b!997485))

(assert (= (and b!997485 res!667442) b!997489))

(assert (= (and b!997489 res!667446) b!997484))

(assert (= (and b!997484 res!667439) b!997483))

(declare-fun m!924293 () Bool)

(assert (=> b!997486 m!924293))

(declare-fun m!924295 () Bool)

(assert (=> b!997485 m!924295))

(declare-fun m!924297 () Bool)

(assert (=> b!997491 m!924297))

(assert (=> b!997491 m!924297))

(declare-fun m!924299 () Bool)

(assert (=> b!997491 m!924299))

(declare-fun m!924301 () Bool)

(assert (=> b!997490 m!924301))

(declare-fun m!924303 () Bool)

(assert (=> b!997487 m!924303))

(declare-fun m!924305 () Bool)

(assert (=> start!86134 m!924305))

(declare-fun m!924307 () Bool)

(assert (=> start!86134 m!924307))

(declare-fun m!924309 () Bool)

(assert (=> b!997488 m!924309))

(assert (=> b!997484 m!924297))

(assert (=> b!997484 m!924297))

(declare-fun m!924311 () Bool)

(assert (=> b!997484 m!924311))

(assert (=> b!997484 m!924311))

(assert (=> b!997484 m!924297))

(declare-fun m!924313 () Bool)

(assert (=> b!997484 m!924313))

(assert (=> b!997483 m!924297))

(assert (=> b!997483 m!924297))

(declare-fun m!924315 () Bool)

(assert (=> b!997483 m!924315))

(check-sat (not b!997484) (not b!997487) (not b!997483) (not b!997485) (not b!997486) (not b!997490) (not start!86134) (not b!997488) (not b!997491))
(check-sat)
