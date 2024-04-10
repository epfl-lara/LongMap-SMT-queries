; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86516 () Bool)

(assert start!86516)

(declare-fun b!1002333 () Bool)

(declare-fun e!564685 () Bool)

(declare-fun e!564689 () Bool)

(assert (=> b!1002333 (= e!564685 e!564689)))

(declare-fun res!671811 () Bool)

(assert (=> b!1002333 (=> (not res!671811) (not e!564689))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443125 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9416 0))(
  ( (MissingZero!9416 (index!40035 (_ BitVec 32))) (Found!9416 (index!40036 (_ BitVec 32))) (Intermediate!9416 (undefined!10228 Bool) (index!40037 (_ BitVec 32)) (x!87452 (_ BitVec 32))) (Undefined!9416) (MissingVacant!9416 (index!40038 (_ BitVec 32))) )
))
(declare-fun lt!443128 () SeekEntryResult!9416)

(declare-datatypes ((array!63317 0))(
  ( (array!63318 (arr!30484 (Array (_ BitVec 32) (_ BitVec 64))) (size!30986 (_ BitVec 32))) )
))
(declare-fun lt!443124 () array!63317)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63317 (_ BitVec 32)) SeekEntryResult!9416)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002333 (= res!671811 (not (= lt!443128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443125 mask!3464) lt!443125 lt!443124 mask!3464))))))

(declare-fun a!3219 () array!63317)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002333 (= lt!443125 (select (store (arr!30484 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002333 (= lt!443124 (array!63318 (store (arr!30484 a!3219) i!1194 k!2224) (size!30986 a!3219)))))

(declare-fun b!1002334 () Bool)

(declare-fun e!564691 () Bool)

(assert (=> b!1002334 (= e!564691 false)))

(declare-fun lt!443129 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443123 () SeekEntryResult!9416)

(assert (=> b!1002334 (= lt!443123 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443129 lt!443125 lt!443124 mask!3464))))

(declare-fun b!1002335 () Bool)

(declare-fun res!671819 () Bool)

(declare-fun e!564690 () Bool)

(assert (=> b!1002335 (=> (not res!671819) (not e!564690))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002335 (= res!671819 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30986 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30986 a!3219))))))

(declare-fun b!1002336 () Bool)

(declare-fun res!671818 () Bool)

(assert (=> b!1002336 (=> (not res!671818) (not e!564689))))

(assert (=> b!1002336 (= res!671818 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002337 () Bool)

(declare-fun res!671820 () Bool)

(declare-fun e!564688 () Bool)

(assert (=> b!1002337 (=> (not res!671820) (not e!564688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002337 (= res!671820 (validKeyInArray!0 k!2224))))

(declare-fun b!1002338 () Bool)

(declare-fun res!671812 () Bool)

(assert (=> b!1002338 (=> (not res!671812) (not e!564690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63317 (_ BitVec 32)) Bool)

(assert (=> b!1002338 (= res!671812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002340 () Bool)

(declare-fun res!671813 () Bool)

(assert (=> b!1002340 (=> (not res!671813) (not e!564690))))

(declare-datatypes ((List!21160 0))(
  ( (Nil!21157) (Cons!21156 (h!22333 (_ BitVec 64)) (t!30161 List!21160)) )
))
(declare-fun arrayNoDuplicates!0 (array!63317 (_ BitVec 32) List!21160) Bool)

(assert (=> b!1002340 (= res!671813 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21157))))

(declare-fun b!1002341 () Bool)

(declare-fun e!564686 () Bool)

(assert (=> b!1002341 (= e!564690 e!564686)))

(declare-fun res!671823 () Bool)

(assert (=> b!1002341 (=> (not res!671823) (not e!564686))))

(declare-fun lt!443126 () SeekEntryResult!9416)

(assert (=> b!1002341 (= res!671823 (= lt!443128 lt!443126))))

(assert (=> b!1002341 (= lt!443126 (Intermediate!9416 false resIndex!38 resX!38))))

(assert (=> b!1002341 (= lt!443128 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30484 a!3219) j!170) mask!3464) (select (arr!30484 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002342 () Bool)

(declare-fun res!671824 () Bool)

(assert (=> b!1002342 (=> (not res!671824) (not e!564688))))

(assert (=> b!1002342 (= res!671824 (and (= (size!30986 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30986 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30986 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002343 () Bool)

(assert (=> b!1002343 (= e!564688 e!564690)))

(declare-fun res!671815 () Bool)

(assert (=> b!1002343 (=> (not res!671815) (not e!564690))))

(declare-fun lt!443127 () SeekEntryResult!9416)

(assert (=> b!1002343 (= res!671815 (or (= lt!443127 (MissingVacant!9416 i!1194)) (= lt!443127 (MissingZero!9416 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63317 (_ BitVec 32)) SeekEntryResult!9416)

(assert (=> b!1002343 (= lt!443127 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002344 () Bool)

(declare-fun res!671816 () Bool)

(assert (=> b!1002344 (=> (not res!671816) (not e!564691))))

(assert (=> b!1002344 (= res!671816 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443129 (select (arr!30484 a!3219) j!170) a!3219 mask!3464) lt!443126))))

(declare-fun res!671814 () Bool)

(assert (=> start!86516 (=> (not res!671814) (not e!564688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86516 (= res!671814 (validMask!0 mask!3464))))

(assert (=> start!86516 e!564688))

(declare-fun array_inv!23608 (array!63317) Bool)

(assert (=> start!86516 (array_inv!23608 a!3219)))

(assert (=> start!86516 true))

(declare-fun b!1002339 () Bool)

(declare-fun res!671821 () Bool)

(assert (=> b!1002339 (=> (not res!671821) (not e!564689))))

(declare-fun lt!443122 () SeekEntryResult!9416)

(assert (=> b!1002339 (= res!671821 (not (= lt!443122 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443125 lt!443124 mask!3464))))))

(declare-fun b!1002345 () Bool)

(assert (=> b!1002345 (= e!564686 e!564685)))

(declare-fun res!671825 () Bool)

(assert (=> b!1002345 (=> (not res!671825) (not e!564685))))

(assert (=> b!1002345 (= res!671825 (= lt!443122 lt!443126))))

(assert (=> b!1002345 (= lt!443122 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30484 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002346 () Bool)

(declare-fun res!671826 () Bool)

(assert (=> b!1002346 (=> (not res!671826) (not e!564688))))

(declare-fun arrayContainsKey!0 (array!63317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002346 (= res!671826 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002347 () Bool)

(assert (=> b!1002347 (= e!564689 e!564691)))

(declare-fun res!671822 () Bool)

(assert (=> b!1002347 (=> (not res!671822) (not e!564691))))

(assert (=> b!1002347 (= res!671822 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443129 #b00000000000000000000000000000000) (bvslt lt!443129 (size!30986 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002347 (= lt!443129 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002348 () Bool)

(declare-fun res!671817 () Bool)

(assert (=> b!1002348 (=> (not res!671817) (not e!564688))))

(assert (=> b!1002348 (= res!671817 (validKeyInArray!0 (select (arr!30484 a!3219) j!170)))))

(assert (= (and start!86516 res!671814) b!1002342))

(assert (= (and b!1002342 res!671824) b!1002348))

(assert (= (and b!1002348 res!671817) b!1002337))

(assert (= (and b!1002337 res!671820) b!1002346))

(assert (= (and b!1002346 res!671826) b!1002343))

(assert (= (and b!1002343 res!671815) b!1002338))

(assert (= (and b!1002338 res!671812) b!1002340))

(assert (= (and b!1002340 res!671813) b!1002335))

(assert (= (and b!1002335 res!671819) b!1002341))

(assert (= (and b!1002341 res!671823) b!1002345))

(assert (= (and b!1002345 res!671825) b!1002333))

(assert (= (and b!1002333 res!671811) b!1002339))

(assert (= (and b!1002339 res!671821) b!1002336))

(assert (= (and b!1002336 res!671818) b!1002347))

(assert (= (and b!1002347 res!671822) b!1002344))

(assert (= (and b!1002344 res!671816) b!1002334))

(declare-fun m!928229 () Bool)

(assert (=> b!1002338 m!928229))

(declare-fun m!928231 () Bool)

(assert (=> b!1002347 m!928231))

(declare-fun m!928233 () Bool)

(assert (=> b!1002334 m!928233))

(declare-fun m!928235 () Bool)

(assert (=> b!1002339 m!928235))

(declare-fun m!928237 () Bool)

(assert (=> b!1002348 m!928237))

(assert (=> b!1002348 m!928237))

(declare-fun m!928239 () Bool)

(assert (=> b!1002348 m!928239))

(declare-fun m!928241 () Bool)

(assert (=> b!1002333 m!928241))

(assert (=> b!1002333 m!928241))

(declare-fun m!928243 () Bool)

(assert (=> b!1002333 m!928243))

(declare-fun m!928245 () Bool)

(assert (=> b!1002333 m!928245))

(declare-fun m!928247 () Bool)

(assert (=> b!1002333 m!928247))

(assert (=> b!1002344 m!928237))

(assert (=> b!1002344 m!928237))

(declare-fun m!928249 () Bool)

(assert (=> b!1002344 m!928249))

(declare-fun m!928251 () Bool)

(assert (=> b!1002340 m!928251))

(assert (=> b!1002341 m!928237))

(assert (=> b!1002341 m!928237))

(declare-fun m!928253 () Bool)

(assert (=> b!1002341 m!928253))

(assert (=> b!1002341 m!928253))

(assert (=> b!1002341 m!928237))

(declare-fun m!928255 () Bool)

(assert (=> b!1002341 m!928255))

(declare-fun m!928257 () Bool)

(assert (=> b!1002343 m!928257))

(declare-fun m!928259 () Bool)

(assert (=> b!1002346 m!928259))

(declare-fun m!928261 () Bool)

(assert (=> b!1002337 m!928261))

(declare-fun m!928263 () Bool)

(assert (=> start!86516 m!928263))

(declare-fun m!928265 () Bool)

(assert (=> start!86516 m!928265))

(assert (=> b!1002345 m!928237))

(assert (=> b!1002345 m!928237))

(declare-fun m!928267 () Bool)

(assert (=> b!1002345 m!928267))

(push 1)

