; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86894 () Bool)

(assert start!86894)

(declare-fun b!1007549 () Bool)

(declare-fun e!567035 () Bool)

(declare-fun e!567034 () Bool)

(assert (=> b!1007549 (= e!567035 e!567034)))

(declare-fun res!676446 () Bool)

(assert (=> b!1007549 (=> (not res!676446) (not e!567034))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!445258 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9524 0))(
  ( (MissingZero!9524 (index!40467 (_ BitVec 32))) (Found!9524 (index!40468 (_ BitVec 32))) (Intermediate!9524 (undefined!10336 Bool) (index!40469 (_ BitVec 32)) (x!87866 (_ BitVec 32))) (Undefined!9524) (MissingVacant!9524 (index!40470 (_ BitVec 32))) )
))
(declare-fun lt!445255 () SeekEntryResult!9524)

(declare-datatypes ((array!63542 0))(
  ( (array!63543 (arr!30592 (Array (_ BitVec 32) (_ BitVec 64))) (size!31094 (_ BitVec 32))) )
))
(declare-fun lt!445254 () array!63542)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63542 (_ BitVec 32)) SeekEntryResult!9524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007549 (= res!676446 (not (= lt!445255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445258 mask!3464) lt!445258 lt!445254 mask!3464))))))

(declare-fun a!3219 () array!63542)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007549 (= lt!445258 (select (store (arr!30592 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007549 (= lt!445254 (array!63543 (store (arr!30592 a!3219) i!1194 k!2224) (size!31094 a!3219)))))

(declare-fun b!1007550 () Bool)

(declare-fun res!676445 () Bool)

(assert (=> b!1007550 (=> (not res!676445) (not e!567034))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007550 (= res!676445 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007552 () Bool)

(declare-fun res!676447 () Bool)

(declare-fun e!567032 () Bool)

(assert (=> b!1007552 (=> (not res!676447) (not e!567032))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007552 (= res!676447 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31094 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31094 a!3219))))))

(declare-fun b!1007553 () Bool)

(declare-fun e!567037 () Bool)

(assert (=> b!1007553 (= e!567032 e!567037)))

(declare-fun res!676443 () Bool)

(assert (=> b!1007553 (=> (not res!676443) (not e!567037))))

(declare-fun lt!445256 () SeekEntryResult!9524)

(assert (=> b!1007553 (= res!676443 (= lt!445255 lt!445256))))

(assert (=> b!1007553 (= lt!445256 (Intermediate!9524 false resIndex!38 resX!38))))

(assert (=> b!1007553 (= lt!445255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30592 a!3219) j!170) mask!3464) (select (arr!30592 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007554 () Bool)

(declare-fun res!676454 () Bool)

(declare-fun e!567036 () Bool)

(assert (=> b!1007554 (=> (not res!676454) (not e!567036))))

(assert (=> b!1007554 (= res!676454 (and (= (size!31094 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31094 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31094 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007555 () Bool)

(declare-fun res!676450 () Bool)

(assert (=> b!1007555 (=> (not res!676450) (not e!567036))))

(declare-fun arrayContainsKey!0 (array!63542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007555 (= res!676450 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007556 () Bool)

(declare-fun res!676453 () Bool)

(assert (=> b!1007556 (=> (not res!676453) (not e!567036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007556 (= res!676453 (validKeyInArray!0 (select (arr!30592 a!3219) j!170)))))

(declare-fun b!1007557 () Bool)

(declare-fun res!676451 () Bool)

(assert (=> b!1007557 (=> (not res!676451) (not e!567034))))

(declare-fun lt!445253 () SeekEntryResult!9524)

(assert (=> b!1007557 (= res!676451 (not (= lt!445253 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445258 lt!445254 mask!3464))))))

(declare-fun b!1007558 () Bool)

(assert (=> b!1007558 (= e!567036 e!567032)))

(declare-fun res!676452 () Bool)

(assert (=> b!1007558 (=> (not res!676452) (not e!567032))))

(declare-fun lt!445259 () SeekEntryResult!9524)

(assert (=> b!1007558 (= res!676452 (or (= lt!445259 (MissingVacant!9524 i!1194)) (= lt!445259 (MissingZero!9524 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63542 (_ BitVec 32)) SeekEntryResult!9524)

(assert (=> b!1007558 (= lt!445259 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007559 () Bool)

(assert (=> b!1007559 (= e!567034 false)))

(declare-fun lt!445257 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007559 (= lt!445257 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007560 () Bool)

(declare-fun res!676455 () Bool)

(assert (=> b!1007560 (=> (not res!676455) (not e!567032))))

(declare-datatypes ((List!21268 0))(
  ( (Nil!21265) (Cons!21264 (h!22450 (_ BitVec 64)) (t!30269 List!21268)) )
))
(declare-fun arrayNoDuplicates!0 (array!63542 (_ BitVec 32) List!21268) Bool)

(assert (=> b!1007560 (= res!676455 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21265))))

(declare-fun res!676442 () Bool)

(assert (=> start!86894 (=> (not res!676442) (not e!567036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86894 (= res!676442 (validMask!0 mask!3464))))

(assert (=> start!86894 e!567036))

(declare-fun array_inv!23716 (array!63542) Bool)

(assert (=> start!86894 (array_inv!23716 a!3219)))

(assert (=> start!86894 true))

(declare-fun b!1007551 () Bool)

(assert (=> b!1007551 (= e!567037 e!567035)))

(declare-fun res!676449 () Bool)

(assert (=> b!1007551 (=> (not res!676449) (not e!567035))))

(assert (=> b!1007551 (= res!676449 (= lt!445253 lt!445256))))

(assert (=> b!1007551 (= lt!445253 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30592 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007561 () Bool)

(declare-fun res!676448 () Bool)

(assert (=> b!1007561 (=> (not res!676448) (not e!567032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63542 (_ BitVec 32)) Bool)

(assert (=> b!1007561 (= res!676448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007562 () Bool)

(declare-fun res!676444 () Bool)

(assert (=> b!1007562 (=> (not res!676444) (not e!567036))))

(assert (=> b!1007562 (= res!676444 (validKeyInArray!0 k!2224))))

(assert (= (and start!86894 res!676442) b!1007554))

(assert (= (and b!1007554 res!676454) b!1007556))

(assert (= (and b!1007556 res!676453) b!1007562))

(assert (= (and b!1007562 res!676444) b!1007555))

(assert (= (and b!1007555 res!676450) b!1007558))

(assert (= (and b!1007558 res!676452) b!1007561))

(assert (= (and b!1007561 res!676448) b!1007560))

(assert (= (and b!1007560 res!676455) b!1007552))

(assert (= (and b!1007552 res!676447) b!1007553))

(assert (= (and b!1007553 res!676443) b!1007551))

(assert (= (and b!1007551 res!676449) b!1007549))

(assert (= (and b!1007549 res!676446) b!1007557))

(assert (= (and b!1007557 res!676451) b!1007550))

(assert (= (and b!1007550 res!676445) b!1007559))

(declare-fun m!932423 () Bool)

(assert (=> b!1007557 m!932423))

(declare-fun m!932425 () Bool)

(assert (=> b!1007559 m!932425))

(declare-fun m!932427 () Bool)

(assert (=> b!1007560 m!932427))

(declare-fun m!932429 () Bool)

(assert (=> b!1007561 m!932429))

(declare-fun m!932431 () Bool)

(assert (=> b!1007558 m!932431))

(declare-fun m!932433 () Bool)

(assert (=> b!1007553 m!932433))

(assert (=> b!1007553 m!932433))

(declare-fun m!932435 () Bool)

(assert (=> b!1007553 m!932435))

(assert (=> b!1007553 m!932435))

(assert (=> b!1007553 m!932433))

(declare-fun m!932437 () Bool)

(assert (=> b!1007553 m!932437))

(declare-fun m!932439 () Bool)

(assert (=> b!1007549 m!932439))

(assert (=> b!1007549 m!932439))

(declare-fun m!932441 () Bool)

(assert (=> b!1007549 m!932441))

(declare-fun m!932443 () Bool)

(assert (=> b!1007549 m!932443))

(declare-fun m!932445 () Bool)

(assert (=> b!1007549 m!932445))

(declare-fun m!932447 () Bool)

(assert (=> start!86894 m!932447))

(declare-fun m!932449 () Bool)

(assert (=> start!86894 m!932449))

(assert (=> b!1007556 m!932433))

(assert (=> b!1007556 m!932433))

(declare-fun m!932451 () Bool)

(assert (=> b!1007556 m!932451))

(assert (=> b!1007551 m!932433))

(assert (=> b!1007551 m!932433))

(declare-fun m!932453 () Bool)

(assert (=> b!1007551 m!932453))

(declare-fun m!932455 () Bool)

(assert (=> b!1007555 m!932455))

(declare-fun m!932457 () Bool)

(assert (=> b!1007562 m!932457))

(push 1)

