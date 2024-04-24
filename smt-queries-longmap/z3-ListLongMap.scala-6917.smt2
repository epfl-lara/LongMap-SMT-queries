; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87148 () Bool)

(assert start!87148)

(declare-fun b!1009299 () Bool)

(declare-fun e!568051 () Bool)

(declare-fun e!568054 () Bool)

(assert (=> b!1009299 (= e!568051 e!568054)))

(declare-fun res!677438 () Bool)

(assert (=> b!1009299 (=> (not res!677438) (not e!568054))))

(declare-fun lt!445986 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((array!63615 0))(
  ( (array!63616 (arr!30622 (Array (_ BitVec 32) (_ BitVec 64))) (size!31125 (_ BitVec 32))) )
))
(declare-fun lt!445990 () array!63615)

(declare-datatypes ((SeekEntryResult!9490 0))(
  ( (MissingZero!9490 (index!40331 (_ BitVec 32))) (Found!9490 (index!40332 (_ BitVec 32))) (Intermediate!9490 (undefined!10302 Bool) (index!40333 (_ BitVec 32)) (x!87884 (_ BitVec 32))) (Undefined!9490) (MissingVacant!9490 (index!40334 (_ BitVec 32))) )
))
(declare-fun lt!445985 () SeekEntryResult!9490)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63615 (_ BitVec 32)) SeekEntryResult!9490)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009299 (= res!677438 (not (= lt!445985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445986 mask!3464) lt!445986 lt!445990 mask!3464))))))

(declare-fun a!3219 () array!63615)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009299 (= lt!445986 (select (store (arr!30622 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009299 (= lt!445990 (array!63616 (store (arr!30622 a!3219) i!1194 k0!2224) (size!31125 a!3219)))))

(declare-fun b!1009301 () Bool)

(declare-fun res!677443 () Bool)

(declare-fun e!568053 () Bool)

(assert (=> b!1009301 (=> (not res!677443) (not e!568053))))

(declare-fun arrayContainsKey!0 (array!63615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009301 (= res!677443 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009302 () Bool)

(assert (=> b!1009302 (= e!568054 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!445987 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009302 (= lt!445987 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009303 () Bool)

(declare-fun res!677436 () Bool)

(declare-fun e!568055 () Bool)

(assert (=> b!1009303 (=> (not res!677436) (not e!568055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63615 (_ BitVec 32)) Bool)

(assert (=> b!1009303 (= res!677436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009304 () Bool)

(declare-fun res!677431 () Bool)

(assert (=> b!1009304 (=> (not res!677431) (not e!568053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009304 (= res!677431 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009305 () Bool)

(declare-fun res!677433 () Bool)

(assert (=> b!1009305 (=> (not res!677433) (not e!568053))))

(assert (=> b!1009305 (= res!677433 (validKeyInArray!0 (select (arr!30622 a!3219) j!170)))))

(declare-fun b!1009306 () Bool)

(declare-fun res!677439 () Bool)

(assert (=> b!1009306 (=> (not res!677439) (not e!568055))))

(declare-datatypes ((List!21269 0))(
  ( (Nil!21266) (Cons!21265 (h!22460 (_ BitVec 64)) (t!30262 List!21269)) )
))
(declare-fun arrayNoDuplicates!0 (array!63615 (_ BitVec 32) List!21269) Bool)

(assert (=> b!1009306 (= res!677439 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21266))))

(declare-fun b!1009307 () Bool)

(declare-fun res!677437 () Bool)

(assert (=> b!1009307 (=> (not res!677437) (not e!568054))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009307 (= res!677437 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009308 () Bool)

(declare-fun res!677442 () Bool)

(assert (=> b!1009308 (=> (not res!677442) (not e!568055))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009308 (= res!677442 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31125 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31125 a!3219))))))

(declare-fun b!1009309 () Bool)

(declare-fun res!677432 () Bool)

(assert (=> b!1009309 (=> (not res!677432) (not e!568053))))

(assert (=> b!1009309 (= res!677432 (and (= (size!31125 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31125 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31125 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009310 () Bool)

(declare-fun res!677441 () Bool)

(assert (=> b!1009310 (=> (not res!677441) (not e!568054))))

(declare-fun lt!445989 () SeekEntryResult!9490)

(assert (=> b!1009310 (= res!677441 (not (= lt!445989 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445986 lt!445990 mask!3464))))))

(declare-fun res!677435 () Bool)

(assert (=> start!87148 (=> (not res!677435) (not e!568053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87148 (= res!677435 (validMask!0 mask!3464))))

(assert (=> start!87148 e!568053))

(declare-fun array_inv!23758 (array!63615) Bool)

(assert (=> start!87148 (array_inv!23758 a!3219)))

(assert (=> start!87148 true))

(declare-fun b!1009300 () Bool)

(declare-fun e!568052 () Bool)

(assert (=> b!1009300 (= e!568055 e!568052)))

(declare-fun res!677440 () Bool)

(assert (=> b!1009300 (=> (not res!677440) (not e!568052))))

(declare-fun lt!445988 () SeekEntryResult!9490)

(assert (=> b!1009300 (= res!677440 (= lt!445985 lt!445988))))

(assert (=> b!1009300 (= lt!445988 (Intermediate!9490 false resIndex!38 resX!38))))

(assert (=> b!1009300 (= lt!445985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009311 () Bool)

(assert (=> b!1009311 (= e!568053 e!568055)))

(declare-fun res!677444 () Bool)

(assert (=> b!1009311 (=> (not res!677444) (not e!568055))))

(declare-fun lt!445991 () SeekEntryResult!9490)

(assert (=> b!1009311 (= res!677444 (or (= lt!445991 (MissingVacant!9490 i!1194)) (= lt!445991 (MissingZero!9490 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63615 (_ BitVec 32)) SeekEntryResult!9490)

(assert (=> b!1009311 (= lt!445991 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009312 () Bool)

(assert (=> b!1009312 (= e!568052 e!568051)))

(declare-fun res!677434 () Bool)

(assert (=> b!1009312 (=> (not res!677434) (not e!568051))))

(assert (=> b!1009312 (= res!677434 (= lt!445989 lt!445988))))

(assert (=> b!1009312 (= lt!445989 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87148 res!677435) b!1009309))

(assert (= (and b!1009309 res!677432) b!1009305))

(assert (= (and b!1009305 res!677433) b!1009304))

(assert (= (and b!1009304 res!677431) b!1009301))

(assert (= (and b!1009301 res!677443) b!1009311))

(assert (= (and b!1009311 res!677444) b!1009303))

(assert (= (and b!1009303 res!677436) b!1009306))

(assert (= (and b!1009306 res!677439) b!1009308))

(assert (= (and b!1009308 res!677442) b!1009300))

(assert (= (and b!1009300 res!677440) b!1009312))

(assert (= (and b!1009312 res!677434) b!1009299))

(assert (= (and b!1009299 res!677438) b!1009310))

(assert (= (and b!1009310 res!677441) b!1009307))

(assert (= (and b!1009307 res!677437) b!1009302))

(declare-fun m!934379 () Bool)

(assert (=> b!1009302 m!934379))

(declare-fun m!934381 () Bool)

(assert (=> start!87148 m!934381))

(declare-fun m!934383 () Bool)

(assert (=> start!87148 m!934383))

(declare-fun m!934385 () Bool)

(assert (=> b!1009299 m!934385))

(assert (=> b!1009299 m!934385))

(declare-fun m!934387 () Bool)

(assert (=> b!1009299 m!934387))

(declare-fun m!934389 () Bool)

(assert (=> b!1009299 m!934389))

(declare-fun m!934391 () Bool)

(assert (=> b!1009299 m!934391))

(declare-fun m!934393 () Bool)

(assert (=> b!1009300 m!934393))

(assert (=> b!1009300 m!934393))

(declare-fun m!934395 () Bool)

(assert (=> b!1009300 m!934395))

(assert (=> b!1009300 m!934395))

(assert (=> b!1009300 m!934393))

(declare-fun m!934397 () Bool)

(assert (=> b!1009300 m!934397))

(assert (=> b!1009312 m!934393))

(assert (=> b!1009312 m!934393))

(declare-fun m!934399 () Bool)

(assert (=> b!1009312 m!934399))

(assert (=> b!1009305 m!934393))

(assert (=> b!1009305 m!934393))

(declare-fun m!934401 () Bool)

(assert (=> b!1009305 m!934401))

(declare-fun m!934403 () Bool)

(assert (=> b!1009310 m!934403))

(declare-fun m!934405 () Bool)

(assert (=> b!1009311 m!934405))

(declare-fun m!934407 () Bool)

(assert (=> b!1009306 m!934407))

(declare-fun m!934409 () Bool)

(assert (=> b!1009304 m!934409))

(declare-fun m!934411 () Bool)

(assert (=> b!1009303 m!934411))

(declare-fun m!934413 () Bool)

(assert (=> b!1009301 m!934413))

(check-sat (not b!1009306) (not b!1009312) (not b!1009302) (not b!1009305) (not b!1009301) (not start!87148) (not b!1009299) (not b!1009300) (not b!1009311) (not b!1009310) (not b!1009304) (not b!1009303))
(check-sat)
