; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86474 () Bool)

(assert start!86474)

(declare-fun b!1001325 () Bool)

(declare-fun e!564247 () Bool)

(declare-fun e!564249 () Bool)

(assert (=> b!1001325 (= e!564247 e!564249)))

(declare-fun res!670810 () Bool)

(assert (=> b!1001325 (=> (not res!670810) (not e!564249))))

(declare-datatypes ((SeekEntryResult!9395 0))(
  ( (MissingZero!9395 (index!39951 (_ BitVec 32))) (Found!9395 (index!39952 (_ BitVec 32))) (Intermediate!9395 (undefined!10207 Bool) (index!39953 (_ BitVec 32)) (x!87375 (_ BitVec 32))) (Undefined!9395) (MissingVacant!9395 (index!39954 (_ BitVec 32))) )
))
(declare-fun lt!442622 () SeekEntryResult!9395)

(declare-fun lt!442620 () SeekEntryResult!9395)

(assert (=> b!1001325 (= res!670810 (= lt!442622 lt!442620))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001325 (= lt!442620 (Intermediate!9395 false resIndex!38 resX!38))))

(declare-datatypes ((array!63275 0))(
  ( (array!63276 (arr!30463 (Array (_ BitVec 32) (_ BitVec 64))) (size!30965 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63275)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63275 (_ BitVec 32)) SeekEntryResult!9395)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001325 (= lt!442622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30463 a!3219) j!170) mask!3464) (select (arr!30463 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001326 () Bool)

(declare-fun res!670808 () Bool)

(declare-fun e!564244 () Bool)

(assert (=> b!1001326 (=> (not res!670808) (not e!564244))))

(declare-fun lt!442623 () SeekEntryResult!9395)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!442619 () array!63275)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!442624 () (_ BitVec 64))

(assert (=> b!1001326 (= res!670808 (not (= lt!442623 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442624 lt!442619 mask!3464))))))

(declare-fun b!1001327 () Bool)

(declare-fun res!670803 () Bool)

(assert (=> b!1001327 (=> (not res!670803) (not e!564247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63275 (_ BitVec 32)) Bool)

(assert (=> b!1001327 (= res!670803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001328 () Bool)

(declare-fun e!564250 () Bool)

(assert (=> b!1001328 (= e!564250 e!564244)))

(declare-fun res!670805 () Bool)

(assert (=> b!1001328 (=> (not res!670805) (not e!564244))))

(assert (=> b!1001328 (= res!670805 (not (= lt!442622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442624 mask!3464) lt!442624 lt!442619 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001328 (= lt!442624 (select (store (arr!30463 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001328 (= lt!442619 (array!63276 (store (arr!30463 a!3219) i!1194 k!2224) (size!30965 a!3219)))))

(declare-fun b!1001329 () Bool)

(declare-fun e!564246 () Bool)

(assert (=> b!1001329 (= e!564246 false)))

(declare-fun lt!442625 () (_ BitVec 32))

(declare-fun lt!442621 () SeekEntryResult!9395)

(assert (=> b!1001329 (= lt!442621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442625 lt!442624 lt!442619 mask!3464))))

(declare-fun b!1001330 () Bool)

(declare-fun res!670811 () Bool)

(assert (=> b!1001330 (=> (not res!670811) (not e!564244))))

(assert (=> b!1001330 (= res!670811 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001331 () Bool)

(declare-fun e!564248 () Bool)

(assert (=> b!1001331 (= e!564248 e!564247)))

(declare-fun res!670804 () Bool)

(assert (=> b!1001331 (=> (not res!670804) (not e!564247))))

(declare-fun lt!442618 () SeekEntryResult!9395)

(assert (=> b!1001331 (= res!670804 (or (= lt!442618 (MissingVacant!9395 i!1194)) (= lt!442618 (MissingZero!9395 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63275 (_ BitVec 32)) SeekEntryResult!9395)

(assert (=> b!1001331 (= lt!442618 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001332 () Bool)

(declare-fun res!670815 () Bool)

(assert (=> b!1001332 (=> (not res!670815) (not e!564248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001332 (= res!670815 (validKeyInArray!0 k!2224))))

(declare-fun b!1001333 () Bool)

(declare-fun res!670816 () Bool)

(assert (=> b!1001333 (=> (not res!670816) (not e!564246))))

(assert (=> b!1001333 (= res!670816 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442625 (select (arr!30463 a!3219) j!170) a!3219 mask!3464) lt!442620))))

(declare-fun b!1001334 () Bool)

(declare-fun res!670817 () Bool)

(assert (=> b!1001334 (=> (not res!670817) (not e!564247))))

(assert (=> b!1001334 (= res!670817 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30965 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30965 a!3219))))))

(declare-fun b!1001335 () Bool)

(assert (=> b!1001335 (= e!564249 e!564250)))

(declare-fun res!670814 () Bool)

(assert (=> b!1001335 (=> (not res!670814) (not e!564250))))

(assert (=> b!1001335 (= res!670814 (= lt!442623 lt!442620))))

(assert (=> b!1001335 (= lt!442623 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30463 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001336 () Bool)

(assert (=> b!1001336 (= e!564244 e!564246)))

(declare-fun res!670807 () Bool)

(assert (=> b!1001336 (=> (not res!670807) (not e!564246))))

(assert (=> b!1001336 (= res!670807 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442625 #b00000000000000000000000000000000) (bvslt lt!442625 (size!30965 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001336 (= lt!442625 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001337 () Bool)

(declare-fun res!670806 () Bool)

(assert (=> b!1001337 (=> (not res!670806) (not e!564247))))

(declare-datatypes ((List!21139 0))(
  ( (Nil!21136) (Cons!21135 (h!22312 (_ BitVec 64)) (t!30140 List!21139)) )
))
(declare-fun arrayNoDuplicates!0 (array!63275 (_ BitVec 32) List!21139) Bool)

(assert (=> b!1001337 (= res!670806 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21136))))

(declare-fun b!1001338 () Bool)

(declare-fun res!670812 () Bool)

(assert (=> b!1001338 (=> (not res!670812) (not e!564248))))

(assert (=> b!1001338 (= res!670812 (and (= (size!30965 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30965 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30965 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!670809 () Bool)

(assert (=> start!86474 (=> (not res!670809) (not e!564248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86474 (= res!670809 (validMask!0 mask!3464))))

(assert (=> start!86474 e!564248))

(declare-fun array_inv!23587 (array!63275) Bool)

(assert (=> start!86474 (array_inv!23587 a!3219)))

(assert (=> start!86474 true))

(declare-fun b!1001339 () Bool)

(declare-fun res!670813 () Bool)

(assert (=> b!1001339 (=> (not res!670813) (not e!564248))))

(assert (=> b!1001339 (= res!670813 (validKeyInArray!0 (select (arr!30463 a!3219) j!170)))))

(declare-fun b!1001340 () Bool)

(declare-fun res!670818 () Bool)

(assert (=> b!1001340 (=> (not res!670818) (not e!564248))))

(declare-fun arrayContainsKey!0 (array!63275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001340 (= res!670818 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86474 res!670809) b!1001338))

(assert (= (and b!1001338 res!670812) b!1001339))

(assert (= (and b!1001339 res!670813) b!1001332))

(assert (= (and b!1001332 res!670815) b!1001340))

(assert (= (and b!1001340 res!670818) b!1001331))

(assert (= (and b!1001331 res!670804) b!1001327))

(assert (= (and b!1001327 res!670803) b!1001337))

(assert (= (and b!1001337 res!670806) b!1001334))

(assert (= (and b!1001334 res!670817) b!1001325))

(assert (= (and b!1001325 res!670810) b!1001335))

(assert (= (and b!1001335 res!670814) b!1001328))

(assert (= (and b!1001328 res!670805) b!1001326))

(assert (= (and b!1001326 res!670808) b!1001330))

(assert (= (and b!1001330 res!670811) b!1001336))

(assert (= (and b!1001336 res!670807) b!1001333))

(assert (= (and b!1001333 res!670816) b!1001329))

(declare-fun m!927389 () Bool)

(assert (=> b!1001332 m!927389))

(declare-fun m!927391 () Bool)

(assert (=> b!1001337 m!927391))

(declare-fun m!927393 () Bool)

(assert (=> b!1001333 m!927393))

(assert (=> b!1001333 m!927393))

(declare-fun m!927395 () Bool)

(assert (=> b!1001333 m!927395))

(declare-fun m!927397 () Bool)

(assert (=> start!86474 m!927397))

(declare-fun m!927399 () Bool)

(assert (=> start!86474 m!927399))

(declare-fun m!927401 () Bool)

(assert (=> b!1001326 m!927401))

(declare-fun m!927403 () Bool)

(assert (=> b!1001329 m!927403))

(assert (=> b!1001335 m!927393))

(assert (=> b!1001335 m!927393))

(declare-fun m!927405 () Bool)

(assert (=> b!1001335 m!927405))

(declare-fun m!927407 () Bool)

(assert (=> b!1001331 m!927407))

(assert (=> b!1001325 m!927393))

(assert (=> b!1001325 m!927393))

(declare-fun m!927409 () Bool)

(assert (=> b!1001325 m!927409))

(assert (=> b!1001325 m!927409))

(assert (=> b!1001325 m!927393))

(declare-fun m!927411 () Bool)

(assert (=> b!1001325 m!927411))

(declare-fun m!927413 () Bool)

(assert (=> b!1001340 m!927413))

(declare-fun m!927415 () Bool)

(assert (=> b!1001328 m!927415))

(assert (=> b!1001328 m!927415))

(declare-fun m!927417 () Bool)

(assert (=> b!1001328 m!927417))

(declare-fun m!927419 () Bool)

(assert (=> b!1001328 m!927419))

(declare-fun m!927421 () Bool)

(assert (=> b!1001328 m!927421))

(declare-fun m!927423 () Bool)

(assert (=> b!1001336 m!927423))

(declare-fun m!927425 () Bool)

(assert (=> b!1001327 m!927425))

(assert (=> b!1001339 m!927393))

(assert (=> b!1001339 m!927393))

(declare-fun m!927427 () Bool)

(assert (=> b!1001339 m!927427))

(push 1)

