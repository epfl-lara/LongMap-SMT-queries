; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86524 () Bool)

(assert start!86524)

(declare-fun b!1002525 () Bool)

(declare-fun e!564772 () Bool)

(declare-fun e!564771 () Bool)

(assert (=> b!1002525 (= e!564772 e!564771)))

(declare-fun res!672006 () Bool)

(assert (=> b!1002525 (=> (not res!672006) (not e!564771))))

(declare-datatypes ((SeekEntryResult!9420 0))(
  ( (MissingZero!9420 (index!40051 (_ BitVec 32))) (Found!9420 (index!40052 (_ BitVec 32))) (Intermediate!9420 (undefined!10232 Bool) (index!40053 (_ BitVec 32)) (x!87464 (_ BitVec 32))) (Undefined!9420) (MissingVacant!9420 (index!40054 (_ BitVec 32))) )
))
(declare-fun lt!443219 () SeekEntryResult!9420)

(declare-fun lt!443218 () SeekEntryResult!9420)

(assert (=> b!1002525 (= res!672006 (= lt!443219 lt!443218))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002525 (= lt!443218 (Intermediate!9420 false resIndex!38 resX!38))))

(declare-datatypes ((array!63325 0))(
  ( (array!63326 (arr!30488 (Array (_ BitVec 32) (_ BitVec 64))) (size!30990 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63325)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63325 (_ BitVec 32)) SeekEntryResult!9420)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002525 (= lt!443219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30488 a!3219) j!170) mask!3464) (select (arr!30488 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002526 () Bool)

(declare-fun e!564769 () Bool)

(assert (=> b!1002526 (= e!564769 e!564772)))

(declare-fun res!672018 () Bool)

(assert (=> b!1002526 (=> (not res!672018) (not e!564772))))

(declare-fun lt!443220 () SeekEntryResult!9420)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002526 (= res!672018 (or (= lt!443220 (MissingVacant!9420 i!1194)) (= lt!443220 (MissingZero!9420 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63325 (_ BitVec 32)) SeekEntryResult!9420)

(assert (=> b!1002526 (= lt!443220 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002527 () Bool)

(declare-fun e!564770 () Bool)

(assert (=> b!1002527 (= e!564770 false)))

(declare-fun lt!443223 () (_ BitVec 64))

(declare-fun lt!443222 () SeekEntryResult!9420)

(declare-fun lt!443225 () array!63325)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443224 () (_ BitVec 32))

(assert (=> b!1002527 (= lt!443222 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443224 lt!443223 lt!443225 mask!3464))))

(declare-fun res!672008 () Bool)

(assert (=> start!86524 (=> (not res!672008) (not e!564769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86524 (= res!672008 (validMask!0 mask!3464))))

(assert (=> start!86524 e!564769))

(declare-fun array_inv!23612 (array!63325) Bool)

(assert (=> start!86524 (array_inv!23612 a!3219)))

(assert (=> start!86524 true))

(declare-fun b!1002528 () Bool)

(declare-fun res!672017 () Bool)

(assert (=> b!1002528 (=> (not res!672017) (not e!564769))))

(assert (=> b!1002528 (= res!672017 (and (= (size!30990 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30990 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30990 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002529 () Bool)

(declare-fun res!672011 () Bool)

(declare-fun e!564774 () Bool)

(assert (=> b!1002529 (=> (not res!672011) (not e!564774))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443221 () SeekEntryResult!9420)

(assert (=> b!1002529 (= res!672011 (not (= lt!443221 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443223 lt!443225 mask!3464))))))

(declare-fun b!1002530 () Bool)

(declare-fun res!672016 () Bool)

(assert (=> b!1002530 (=> (not res!672016) (not e!564772))))

(assert (=> b!1002530 (= res!672016 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30990 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30990 a!3219))))))

(declare-fun b!1002531 () Bool)

(declare-fun res!672014 () Bool)

(assert (=> b!1002531 (=> (not res!672014) (not e!564774))))

(assert (=> b!1002531 (= res!672014 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002532 () Bool)

(declare-fun e!564775 () Bool)

(assert (=> b!1002532 (= e!564771 e!564775)))

(declare-fun res!672012 () Bool)

(assert (=> b!1002532 (=> (not res!672012) (not e!564775))))

(assert (=> b!1002532 (= res!672012 (= lt!443221 lt!443218))))

(assert (=> b!1002532 (= lt!443221 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30488 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002533 () Bool)

(declare-fun res!672005 () Bool)

(assert (=> b!1002533 (=> (not res!672005) (not e!564769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002533 (= res!672005 (validKeyInArray!0 (select (arr!30488 a!3219) j!170)))))

(declare-fun b!1002534 () Bool)

(declare-fun res!672003 () Bool)

(assert (=> b!1002534 (=> (not res!672003) (not e!564770))))

(assert (=> b!1002534 (= res!672003 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443224 (select (arr!30488 a!3219) j!170) a!3219 mask!3464) lt!443218))))

(declare-fun b!1002535 () Bool)

(declare-fun res!672007 () Bool)

(assert (=> b!1002535 (=> (not res!672007) (not e!564769))))

(declare-fun arrayContainsKey!0 (array!63325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002535 (= res!672007 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002536 () Bool)

(declare-fun res!672010 () Bool)

(assert (=> b!1002536 (=> (not res!672010) (not e!564772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63325 (_ BitVec 32)) Bool)

(assert (=> b!1002536 (= res!672010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002537 () Bool)

(assert (=> b!1002537 (= e!564775 e!564774)))

(declare-fun res!672015 () Bool)

(assert (=> b!1002537 (=> (not res!672015) (not e!564774))))

(assert (=> b!1002537 (= res!672015 (not (= lt!443219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443223 mask!3464) lt!443223 lt!443225 mask!3464))))))

(assert (=> b!1002537 (= lt!443223 (select (store (arr!30488 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002537 (= lt!443225 (array!63326 (store (arr!30488 a!3219) i!1194 k0!2224) (size!30990 a!3219)))))

(declare-fun b!1002538 () Bool)

(assert (=> b!1002538 (= e!564774 e!564770)))

(declare-fun res!672013 () Bool)

(assert (=> b!1002538 (=> (not res!672013) (not e!564770))))

(assert (=> b!1002538 (= res!672013 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443224 #b00000000000000000000000000000000) (bvslt lt!443224 (size!30990 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002538 (= lt!443224 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002539 () Bool)

(declare-fun res!672009 () Bool)

(assert (=> b!1002539 (=> (not res!672009) (not e!564772))))

(declare-datatypes ((List!21164 0))(
  ( (Nil!21161) (Cons!21160 (h!22337 (_ BitVec 64)) (t!30165 List!21164)) )
))
(declare-fun arrayNoDuplicates!0 (array!63325 (_ BitVec 32) List!21164) Bool)

(assert (=> b!1002539 (= res!672009 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21161))))

(declare-fun b!1002540 () Bool)

(declare-fun res!672004 () Bool)

(assert (=> b!1002540 (=> (not res!672004) (not e!564769))))

(assert (=> b!1002540 (= res!672004 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86524 res!672008) b!1002528))

(assert (= (and b!1002528 res!672017) b!1002533))

(assert (= (and b!1002533 res!672005) b!1002540))

(assert (= (and b!1002540 res!672004) b!1002535))

(assert (= (and b!1002535 res!672007) b!1002526))

(assert (= (and b!1002526 res!672018) b!1002536))

(assert (= (and b!1002536 res!672010) b!1002539))

(assert (= (and b!1002539 res!672009) b!1002530))

(assert (= (and b!1002530 res!672016) b!1002525))

(assert (= (and b!1002525 res!672006) b!1002532))

(assert (= (and b!1002532 res!672012) b!1002537))

(assert (= (and b!1002537 res!672015) b!1002529))

(assert (= (and b!1002529 res!672011) b!1002531))

(assert (= (and b!1002531 res!672014) b!1002538))

(assert (= (and b!1002538 res!672013) b!1002534))

(assert (= (and b!1002534 res!672003) b!1002527))

(declare-fun m!928389 () Bool)

(assert (=> b!1002539 m!928389))

(declare-fun m!928391 () Bool)

(assert (=> b!1002533 m!928391))

(assert (=> b!1002533 m!928391))

(declare-fun m!928393 () Bool)

(assert (=> b!1002533 m!928393))

(assert (=> b!1002532 m!928391))

(assert (=> b!1002532 m!928391))

(declare-fun m!928395 () Bool)

(assert (=> b!1002532 m!928395))

(declare-fun m!928397 () Bool)

(assert (=> b!1002535 m!928397))

(declare-fun m!928399 () Bool)

(assert (=> b!1002537 m!928399))

(assert (=> b!1002537 m!928399))

(declare-fun m!928401 () Bool)

(assert (=> b!1002537 m!928401))

(declare-fun m!928403 () Bool)

(assert (=> b!1002537 m!928403))

(declare-fun m!928405 () Bool)

(assert (=> b!1002537 m!928405))

(declare-fun m!928407 () Bool)

(assert (=> b!1002526 m!928407))

(declare-fun m!928409 () Bool)

(assert (=> b!1002529 m!928409))

(declare-fun m!928411 () Bool)

(assert (=> start!86524 m!928411))

(declare-fun m!928413 () Bool)

(assert (=> start!86524 m!928413))

(declare-fun m!928415 () Bool)

(assert (=> b!1002536 m!928415))

(declare-fun m!928417 () Bool)

(assert (=> b!1002538 m!928417))

(declare-fun m!928419 () Bool)

(assert (=> b!1002527 m!928419))

(assert (=> b!1002534 m!928391))

(assert (=> b!1002534 m!928391))

(declare-fun m!928421 () Bool)

(assert (=> b!1002534 m!928421))

(assert (=> b!1002525 m!928391))

(assert (=> b!1002525 m!928391))

(declare-fun m!928423 () Bool)

(assert (=> b!1002525 m!928423))

(assert (=> b!1002525 m!928423))

(assert (=> b!1002525 m!928391))

(declare-fun m!928425 () Bool)

(assert (=> b!1002525 m!928425))

(declare-fun m!928427 () Bool)

(assert (=> b!1002540 m!928427))

(check-sat (not b!1002535) (not b!1002537) (not b!1002538) (not b!1002527) (not b!1002539) (not b!1002526) (not b!1002536) (not b!1002529) (not b!1002534) (not b!1002532) (not b!1002533) (not b!1002540) (not b!1002525) (not start!86524))
(check-sat)
