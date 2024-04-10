; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86018 () Bool)

(assert start!86018)

(declare-fun b!996316 () Bool)

(declare-fun res!666435 () Bool)

(declare-fun e!562161 () Bool)

(assert (=> b!996316 (=> (not res!666435) (not e!562161))))

(declare-datatypes ((array!63023 0))(
  ( (array!63024 (arr!30343 (Array (_ BitVec 32) (_ BitVec 64))) (size!30845 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63023)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996316 (= res!666435 (and (= (size!30845 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30845 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30845 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!666438 () Bool)

(assert (=> start!86018 (=> (not res!666438) (not e!562161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86018 (= res!666438 (validMask!0 mask!3464))))

(assert (=> start!86018 e!562161))

(declare-fun array_inv!23467 (array!63023) Bool)

(assert (=> start!86018 (array_inv!23467 a!3219)))

(assert (=> start!86018 true))

(declare-fun b!996317 () Bool)

(declare-fun res!666432 () Bool)

(assert (=> b!996317 (=> (not res!666432) (not e!562161))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996317 (= res!666432 (validKeyInArray!0 k!2224))))

(declare-fun b!996318 () Bool)

(declare-fun res!666436 () Bool)

(declare-fun e!562162 () Bool)

(assert (=> b!996318 (=> (not res!666436) (not e!562162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63023 (_ BitVec 32)) Bool)

(assert (=> b!996318 (= res!666436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996319 () Bool)

(assert (=> b!996319 (= e!562161 e!562162)))

(declare-fun res!666434 () Bool)

(assert (=> b!996319 (=> (not res!666434) (not e!562162))))

(declare-datatypes ((SeekEntryResult!9275 0))(
  ( (MissingZero!9275 (index!39471 (_ BitVec 32))) (Found!9275 (index!39472 (_ BitVec 32))) (Intermediate!9275 (undefined!10087 Bool) (index!39473 (_ BitVec 32)) (x!86911 (_ BitVec 32))) (Undefined!9275) (MissingVacant!9275 (index!39474 (_ BitVec 32))) )
))
(declare-fun lt!441208 () SeekEntryResult!9275)

(assert (=> b!996319 (= res!666434 (or (= lt!441208 (MissingVacant!9275 i!1194)) (= lt!441208 (MissingZero!9275 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63023 (_ BitVec 32)) SeekEntryResult!9275)

(assert (=> b!996319 (= lt!441208 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996320 () Bool)

(declare-fun res!666430 () Bool)

(assert (=> b!996320 (=> (not res!666430) (not e!562161))))

(assert (=> b!996320 (= res!666430 (validKeyInArray!0 (select (arr!30343 a!3219) j!170)))))

(declare-fun b!996321 () Bool)

(declare-fun res!666437 () Bool)

(assert (=> b!996321 (=> (not res!666437) (not e!562162))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996321 (= res!666437 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30845 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30845 a!3219))))))

(declare-fun b!996322 () Bool)

(declare-fun res!666433 () Bool)

(assert (=> b!996322 (=> (not res!666433) (not e!562161))))

(declare-fun arrayContainsKey!0 (array!63023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996322 (= res!666433 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996323 () Bool)

(declare-fun res!666431 () Bool)

(assert (=> b!996323 (=> (not res!666431) (not e!562162))))

(declare-datatypes ((List!21019 0))(
  ( (Nil!21016) (Cons!21015 (h!22180 (_ BitVec 64)) (t!30020 List!21019)) )
))
(declare-fun arrayNoDuplicates!0 (array!63023 (_ BitVec 32) List!21019) Bool)

(assert (=> b!996323 (= res!666431 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21016))))

(declare-fun b!996324 () Bool)

(assert (=> b!996324 (= e!562162 false)))

(declare-fun lt!441209 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996324 (= lt!441209 (toIndex!0 (select (arr!30343 a!3219) j!170) mask!3464))))

(assert (= (and start!86018 res!666438) b!996316))

(assert (= (and b!996316 res!666435) b!996320))

(assert (= (and b!996320 res!666430) b!996317))

(assert (= (and b!996317 res!666432) b!996322))

(assert (= (and b!996322 res!666433) b!996319))

(assert (= (and b!996319 res!666434) b!996318))

(assert (= (and b!996318 res!666436) b!996323))

(assert (= (and b!996323 res!666431) b!996321))

(assert (= (and b!996321 res!666437) b!996324))

(declare-fun m!923465 () Bool)

(assert (=> start!86018 m!923465))

(declare-fun m!923467 () Bool)

(assert (=> start!86018 m!923467))

(declare-fun m!923469 () Bool)

(assert (=> b!996317 m!923469))

(declare-fun m!923471 () Bool)

(assert (=> b!996322 m!923471))

(declare-fun m!923473 () Bool)

(assert (=> b!996319 m!923473))

(declare-fun m!923475 () Bool)

(assert (=> b!996318 m!923475))

(declare-fun m!923477 () Bool)

(assert (=> b!996320 m!923477))

(assert (=> b!996320 m!923477))

(declare-fun m!923479 () Bool)

(assert (=> b!996320 m!923479))

(assert (=> b!996324 m!923477))

(assert (=> b!996324 m!923477))

(declare-fun m!923481 () Bool)

(assert (=> b!996324 m!923481))

(declare-fun m!923483 () Bool)

(assert (=> b!996323 m!923483))

(push 1)

