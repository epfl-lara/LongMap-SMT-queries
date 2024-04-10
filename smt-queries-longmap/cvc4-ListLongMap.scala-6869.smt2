; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86472 () Bool)

(assert start!86472)

(declare-fun b!1001280 () Bool)

(declare-fun e!564225 () Bool)

(declare-fun e!564224 () Bool)

(assert (=> b!1001280 (= e!564225 e!564224)))

(declare-fun res!670760 () Bool)

(assert (=> b!1001280 (=> (not res!670760) (not e!564224))))

(declare-datatypes ((SeekEntryResult!9394 0))(
  ( (MissingZero!9394 (index!39947 (_ BitVec 32))) (Found!9394 (index!39948 (_ BitVec 32))) (Intermediate!9394 (undefined!10206 Bool) (index!39949 (_ BitVec 32)) (x!87366 (_ BitVec 32))) (Undefined!9394) (MissingVacant!9394 (index!39950 (_ BitVec 32))) )
))
(declare-fun lt!442596 () SeekEntryResult!9394)

(declare-fun lt!442598 () SeekEntryResult!9394)

(assert (=> b!1001280 (= res!670760 (= lt!442596 lt!442598))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001280 (= lt!442598 (Intermediate!9394 false resIndex!38 resX!38))))

(declare-datatypes ((array!63273 0))(
  ( (array!63274 (arr!30462 (Array (_ BitVec 32) (_ BitVec 64))) (size!30964 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63273)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63273 (_ BitVec 32)) SeekEntryResult!9394)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001280 (= lt!442596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30462 a!3219) j!170) mask!3464) (select (arr!30462 a!3219) j!170) a!3219 mask!3464))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun b!1001281 () Bool)

(declare-fun e!564228 () Bool)

(assert (=> b!1001281 (= e!564228 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1001282 () Bool)

(declare-fun e!564227 () Bool)

(assert (=> b!1001282 (= e!564227 e!564228)))

(declare-fun res!670768 () Bool)

(assert (=> b!1001282 (=> (not res!670768) (not e!564228))))

(declare-fun lt!442599 () (_ BitVec 64))

(declare-fun lt!442601 () array!63273)

(assert (=> b!1001282 (= res!670768 (not (= lt!442596 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442599 mask!3464) lt!442599 lt!442601 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001282 (= lt!442599 (select (store (arr!30462 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001282 (= lt!442601 (array!63274 (store (arr!30462 a!3219) i!1194 k!2224) (size!30964 a!3219)))))

(declare-fun b!1001283 () Bool)

(declare-fun res!670765 () Bool)

(declare-fun e!564229 () Bool)

(assert (=> b!1001283 (=> (not res!670765) (not e!564229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001283 (= res!670765 (validKeyInArray!0 (select (arr!30462 a!3219) j!170)))))

(declare-fun b!1001284 () Bool)

(declare-fun res!670770 () Bool)

(assert (=> b!1001284 (=> (not res!670770) (not e!564229))))

(assert (=> b!1001284 (= res!670770 (and (= (size!30964 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30964 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30964 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001285 () Bool)

(declare-fun res!670759 () Bool)

(assert (=> b!1001285 (=> (not res!670759) (not e!564229))))

(assert (=> b!1001285 (= res!670759 (validKeyInArray!0 k!2224))))

(declare-fun b!1001286 () Bool)

(assert (=> b!1001286 (= e!564229 e!564225)))

(declare-fun res!670767 () Bool)

(assert (=> b!1001286 (=> (not res!670767) (not e!564225))))

(declare-fun lt!442600 () SeekEntryResult!9394)

(assert (=> b!1001286 (= res!670767 (or (= lt!442600 (MissingVacant!9394 i!1194)) (= lt!442600 (MissingZero!9394 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63273 (_ BitVec 32)) SeekEntryResult!9394)

(assert (=> b!1001286 (= lt!442600 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001288 () Bool)

(declare-fun res!670764 () Bool)

(assert (=> b!1001288 (=> (not res!670764) (not e!564225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63273 (_ BitVec 32)) Bool)

(assert (=> b!1001288 (= res!670764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001289 () Bool)

(assert (=> b!1001289 (= e!564224 e!564227)))

(declare-fun res!670766 () Bool)

(assert (=> b!1001289 (=> (not res!670766) (not e!564227))))

(declare-fun lt!442597 () SeekEntryResult!9394)

(assert (=> b!1001289 (= res!670766 (= lt!442597 lt!442598))))

(assert (=> b!1001289 (= lt!442597 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30462 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001290 () Bool)

(declare-fun res!670763 () Bool)

(assert (=> b!1001290 (=> (not res!670763) (not e!564225))))

(assert (=> b!1001290 (= res!670763 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30964 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30964 a!3219))))))

(declare-fun b!1001291 () Bool)

(declare-fun res!670769 () Bool)

(assert (=> b!1001291 (=> (not res!670769) (not e!564225))))

(declare-datatypes ((List!21138 0))(
  ( (Nil!21135) (Cons!21134 (h!22311 (_ BitVec 64)) (t!30139 List!21138)) )
))
(declare-fun arrayNoDuplicates!0 (array!63273 (_ BitVec 32) List!21138) Bool)

(assert (=> b!1001291 (= res!670769 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21135))))

(declare-fun b!1001292 () Bool)

(declare-fun res!670758 () Bool)

(assert (=> b!1001292 (=> (not res!670758) (not e!564229))))

(declare-fun arrayContainsKey!0 (array!63273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001292 (= res!670758 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001287 () Bool)

(declare-fun res!670761 () Bool)

(assert (=> b!1001287 (=> (not res!670761) (not e!564228))))

(assert (=> b!1001287 (= res!670761 (not (= lt!442597 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442599 lt!442601 mask!3464))))))

(declare-fun res!670762 () Bool)

(assert (=> start!86472 (=> (not res!670762) (not e!564229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86472 (= res!670762 (validMask!0 mask!3464))))

(assert (=> start!86472 e!564229))

(declare-fun array_inv!23586 (array!63273) Bool)

(assert (=> start!86472 (array_inv!23586 a!3219)))

(assert (=> start!86472 true))

(assert (= (and start!86472 res!670762) b!1001284))

(assert (= (and b!1001284 res!670770) b!1001283))

(assert (= (and b!1001283 res!670765) b!1001285))

(assert (= (and b!1001285 res!670759) b!1001292))

(assert (= (and b!1001292 res!670758) b!1001286))

(assert (= (and b!1001286 res!670767) b!1001288))

(assert (= (and b!1001288 res!670764) b!1001291))

(assert (= (and b!1001291 res!670769) b!1001290))

(assert (= (and b!1001290 res!670763) b!1001280))

(assert (= (and b!1001280 res!670760) b!1001289))

(assert (= (and b!1001289 res!670766) b!1001282))

(assert (= (and b!1001282 res!670768) b!1001287))

(assert (= (and b!1001287 res!670761) b!1001281))

(declare-fun m!927355 () Bool)

(assert (=> b!1001287 m!927355))

(declare-fun m!927357 () Bool)

(assert (=> b!1001280 m!927357))

(assert (=> b!1001280 m!927357))

(declare-fun m!927359 () Bool)

(assert (=> b!1001280 m!927359))

(assert (=> b!1001280 m!927359))

(assert (=> b!1001280 m!927357))

(declare-fun m!927361 () Bool)

(assert (=> b!1001280 m!927361))

(assert (=> b!1001289 m!927357))

(assert (=> b!1001289 m!927357))

(declare-fun m!927363 () Bool)

(assert (=> b!1001289 m!927363))

(declare-fun m!927365 () Bool)

(assert (=> b!1001291 m!927365))

(declare-fun m!927367 () Bool)

(assert (=> b!1001285 m!927367))

(declare-fun m!927369 () Bool)

(assert (=> b!1001288 m!927369))

(declare-fun m!927371 () Bool)

(assert (=> start!86472 m!927371))

(declare-fun m!927373 () Bool)

(assert (=> start!86472 m!927373))

(assert (=> b!1001283 m!927357))

(assert (=> b!1001283 m!927357))

(declare-fun m!927375 () Bool)

(assert (=> b!1001283 m!927375))

(declare-fun m!927377 () Bool)

(assert (=> b!1001286 m!927377))

(declare-fun m!927379 () Bool)

(assert (=> b!1001282 m!927379))

(assert (=> b!1001282 m!927379))

(declare-fun m!927381 () Bool)

(assert (=> b!1001282 m!927381))

(declare-fun m!927383 () Bool)

(assert (=> b!1001282 m!927383))

(declare-fun m!927385 () Bool)

(assert (=> b!1001282 m!927385))

(declare-fun m!927387 () Bool)

(assert (=> b!1001292 m!927387))

(push 1)

