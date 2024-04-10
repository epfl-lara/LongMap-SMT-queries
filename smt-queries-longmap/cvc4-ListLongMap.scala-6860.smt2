; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86418 () Bool)

(assert start!86418)

(declare-fun res!669763 () Bool)

(declare-fun e!563841 () Bool)

(assert (=> start!86418 (=> (not res!669763) (not e!563841))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86418 (= res!669763 (validMask!0 mask!3464))))

(assert (=> start!86418 e!563841))

(declare-datatypes ((array!63219 0))(
  ( (array!63220 (arr!30435 (Array (_ BitVec 32) (_ BitVec 64))) (size!30937 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63219)

(declare-fun array_inv!23559 (array!63219) Bool)

(assert (=> start!86418 (array_inv!23559 a!3219)))

(assert (=> start!86418 true))

(declare-fun b!1000283 () Bool)

(declare-fun res!669766 () Bool)

(assert (=> b!1000283 (=> (not res!669766) (not e!563841))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000283 (= res!669766 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000284 () Bool)

(declare-fun e!563839 () Bool)

(declare-fun e!563842 () Bool)

(assert (=> b!1000284 (= e!563839 e!563842)))

(declare-fun res!669769 () Bool)

(assert (=> b!1000284 (=> (not res!669769) (not e!563842))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9367 0))(
  ( (MissingZero!9367 (index!39839 (_ BitVec 32))) (Found!9367 (index!39840 (_ BitVec 32))) (Intermediate!9367 (undefined!10179 Bool) (index!39841 (_ BitVec 32)) (x!87267 (_ BitVec 32))) (Undefined!9367) (MissingVacant!9367 (index!39842 (_ BitVec 32))) )
))
(declare-fun lt!442249 () SeekEntryResult!9367)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63219 (_ BitVec 32)) SeekEntryResult!9367)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000284 (= res!669769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30435 a!3219) j!170) mask!3464) (select (arr!30435 a!3219) j!170) a!3219 mask!3464) lt!442249))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000284 (= lt!442249 (Intermediate!9367 false resIndex!38 resX!38))))

(declare-fun b!1000285 () Bool)

(declare-fun res!669762 () Bool)

(assert (=> b!1000285 (=> (not res!669762) (not e!563841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000285 (= res!669762 (validKeyInArray!0 k!2224))))

(declare-fun b!1000286 () Bool)

(assert (=> b!1000286 (= e!563841 e!563839)))

(declare-fun res!669770 () Bool)

(assert (=> b!1000286 (=> (not res!669770) (not e!563839))))

(declare-fun lt!442248 () SeekEntryResult!9367)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000286 (= res!669770 (or (= lt!442248 (MissingVacant!9367 i!1194)) (= lt!442248 (MissingZero!9367 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63219 (_ BitVec 32)) SeekEntryResult!9367)

(assert (=> b!1000286 (= lt!442248 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000287 () Bool)

(declare-fun res!669767 () Bool)

(assert (=> b!1000287 (=> (not res!669767) (not e!563839))))

(declare-datatypes ((List!21111 0))(
  ( (Nil!21108) (Cons!21107 (h!22284 (_ BitVec 64)) (t!30112 List!21111)) )
))
(declare-fun arrayNoDuplicates!0 (array!63219 (_ BitVec 32) List!21111) Bool)

(assert (=> b!1000287 (= res!669767 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21108))))

(declare-fun b!1000288 () Bool)

(declare-fun res!669764 () Bool)

(assert (=> b!1000288 (=> (not res!669764) (not e!563841))))

(assert (=> b!1000288 (= res!669764 (and (= (size!30937 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30937 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30937 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000289 () Bool)

(assert (=> b!1000289 (= e!563842 false)))

(declare-fun lt!442250 () SeekEntryResult!9367)

(assert (=> b!1000289 (= lt!442250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30435 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30435 a!3219) i!1194 k!2224) j!170) (array!63220 (store (arr!30435 a!3219) i!1194 k!2224) (size!30937 a!3219)) mask!3464))))

(declare-fun b!1000290 () Bool)

(declare-fun res!669761 () Bool)

(assert (=> b!1000290 (=> (not res!669761) (not e!563839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63219 (_ BitVec 32)) Bool)

(assert (=> b!1000290 (= res!669761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000291 () Bool)

(declare-fun res!669765 () Bool)

(assert (=> b!1000291 (=> (not res!669765) (not e!563839))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1000291 (= res!669765 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30937 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30937 a!3219))))))

(declare-fun b!1000292 () Bool)

(declare-fun res!669771 () Bool)

(assert (=> b!1000292 (=> (not res!669771) (not e!563842))))

(assert (=> b!1000292 (= res!669771 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30435 a!3219) j!170) a!3219 mask!3464) lt!442249))))

(declare-fun b!1000293 () Bool)

(declare-fun res!669768 () Bool)

(assert (=> b!1000293 (=> (not res!669768) (not e!563841))))

(assert (=> b!1000293 (= res!669768 (validKeyInArray!0 (select (arr!30435 a!3219) j!170)))))

(assert (= (and start!86418 res!669763) b!1000288))

(assert (= (and b!1000288 res!669764) b!1000293))

(assert (= (and b!1000293 res!669768) b!1000285))

(assert (= (and b!1000285 res!669762) b!1000283))

(assert (= (and b!1000283 res!669766) b!1000286))

(assert (= (and b!1000286 res!669770) b!1000290))

(assert (= (and b!1000290 res!669761) b!1000287))

(assert (= (and b!1000287 res!669767) b!1000291))

(assert (= (and b!1000291 res!669765) b!1000284))

(assert (= (and b!1000284 res!669769) b!1000292))

(assert (= (and b!1000292 res!669771) b!1000289))

(declare-fun m!926463 () Bool)

(assert (=> start!86418 m!926463))

(declare-fun m!926465 () Bool)

(assert (=> start!86418 m!926465))

(declare-fun m!926467 () Bool)

(assert (=> b!1000292 m!926467))

(assert (=> b!1000292 m!926467))

(declare-fun m!926469 () Bool)

(assert (=> b!1000292 m!926469))

(declare-fun m!926471 () Bool)

(assert (=> b!1000285 m!926471))

(declare-fun m!926473 () Bool)

(assert (=> b!1000289 m!926473))

(declare-fun m!926475 () Bool)

(assert (=> b!1000289 m!926475))

(assert (=> b!1000289 m!926475))

(declare-fun m!926477 () Bool)

(assert (=> b!1000289 m!926477))

(assert (=> b!1000289 m!926477))

(assert (=> b!1000289 m!926475))

(declare-fun m!926479 () Bool)

(assert (=> b!1000289 m!926479))

(declare-fun m!926481 () Bool)

(assert (=> b!1000290 m!926481))

(assert (=> b!1000284 m!926467))

(assert (=> b!1000284 m!926467))

(declare-fun m!926483 () Bool)

(assert (=> b!1000284 m!926483))

(assert (=> b!1000284 m!926483))

(assert (=> b!1000284 m!926467))

(declare-fun m!926485 () Bool)

(assert (=> b!1000284 m!926485))

(declare-fun m!926487 () Bool)

(assert (=> b!1000286 m!926487))

(declare-fun m!926489 () Bool)

(assert (=> b!1000287 m!926489))

(assert (=> b!1000293 m!926467))

(assert (=> b!1000293 m!926467))

(declare-fun m!926491 () Bool)

(assert (=> b!1000293 m!926491))

(declare-fun m!926493 () Bool)

(assert (=> b!1000283 m!926493))

(push 1)

(assert (not b!1000293))

(assert (not b!1000290))

(assert (not start!86418))

(assert (not b!1000289))

