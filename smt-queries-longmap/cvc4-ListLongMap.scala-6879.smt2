; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86532 () Bool)

(assert start!86532)

(declare-fun b!1002717 () Bool)

(declare-fun res!672198 () Bool)

(declare-fun e!564856 () Bool)

(assert (=> b!1002717 (=> (not res!672198) (not e!564856))))

(declare-datatypes ((array!63333 0))(
  ( (array!63334 (arr!30492 (Array (_ BitVec 32) (_ BitVec 64))) (size!30994 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63333)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!1002717 (= res!672198 (and (= (size!30994 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30994 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30994 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002718 () Bool)

(declare-fun res!672203 () Bool)

(declare-fun e!564858 () Bool)

(assert (=> b!1002718 (=> (not res!672203) (not e!564858))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002718 (= res!672203 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002720 () Bool)

(declare-fun e!564853 () Bool)

(assert (=> b!1002720 (= e!564858 e!564853)))

(declare-fun res!672208 () Bool)

(assert (=> b!1002720 (=> (not res!672208) (not e!564853))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!443316 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002720 (= res!672208 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443316 #b00000000000000000000000000000000) (bvslt lt!443316 (size!30994 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002720 (= lt!443316 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002721 () Bool)

(declare-fun res!672197 () Bool)

(assert (=> b!1002721 (=> (not res!672197) (not e!564856))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002721 (= res!672197 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002722 () Bool)

(declare-fun res!672199 () Bool)

(declare-fun e!564857 () Bool)

(assert (=> b!1002722 (=> (not res!672199) (not e!564857))))

(assert (=> b!1002722 (= res!672199 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30994 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30994 a!3219))))))

(declare-fun b!1002723 () Bool)

(declare-fun res!672195 () Bool)

(assert (=> b!1002723 (=> (not res!672195) (not e!564853))))

(declare-datatypes ((SeekEntryResult!9424 0))(
  ( (MissingZero!9424 (index!40067 (_ BitVec 32))) (Found!9424 (index!40068 (_ BitVec 32))) (Intermediate!9424 (undefined!10236 Bool) (index!40069 (_ BitVec 32)) (x!87476 (_ BitVec 32))) (Undefined!9424) (MissingVacant!9424 (index!40070 (_ BitVec 32))) )
))
(declare-fun lt!443318 () SeekEntryResult!9424)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63333 (_ BitVec 32)) SeekEntryResult!9424)

(assert (=> b!1002723 (= res!672195 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443316 (select (arr!30492 a!3219) j!170) a!3219 mask!3464) lt!443318))))

(declare-fun b!1002724 () Bool)

(declare-fun res!672205 () Bool)

(assert (=> b!1002724 (=> (not res!672205) (not e!564856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002724 (= res!672205 (validKeyInArray!0 k!2224))))

(declare-fun b!1002725 () Bool)

(declare-fun res!672207 () Bool)

(assert (=> b!1002725 (=> (not res!672207) (not e!564858))))

(declare-fun lt!443321 () (_ BitVec 64))

(declare-fun lt!443320 () SeekEntryResult!9424)

(declare-fun lt!443319 () array!63333)

(assert (=> b!1002725 (= res!672207 (not (= lt!443320 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443321 lt!443319 mask!3464))))))

(declare-fun b!1002726 () Bool)

(assert (=> b!1002726 (= e!564853 false)))

(declare-fun lt!443315 () SeekEntryResult!9424)

(assert (=> b!1002726 (= lt!443315 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443316 lt!443321 lt!443319 mask!3464))))

(declare-fun res!672209 () Bool)

(assert (=> start!86532 (=> (not res!672209) (not e!564856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86532 (= res!672209 (validMask!0 mask!3464))))

(assert (=> start!86532 e!564856))

(declare-fun array_inv!23616 (array!63333) Bool)

(assert (=> start!86532 (array_inv!23616 a!3219)))

(assert (=> start!86532 true))

(declare-fun b!1002719 () Bool)

(declare-fun res!672196 () Bool)

(assert (=> b!1002719 (=> (not res!672196) (not e!564857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63333 (_ BitVec 32)) Bool)

(assert (=> b!1002719 (= res!672196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002727 () Bool)

(declare-fun e!564854 () Bool)

(declare-fun e!564859 () Bool)

(assert (=> b!1002727 (= e!564854 e!564859)))

(declare-fun res!672201 () Bool)

(assert (=> b!1002727 (=> (not res!672201) (not e!564859))))

(assert (=> b!1002727 (= res!672201 (= lt!443320 lt!443318))))

(assert (=> b!1002727 (= lt!443320 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30492 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002728 () Bool)

(declare-fun res!672206 () Bool)

(assert (=> b!1002728 (=> (not res!672206) (not e!564856))))

(assert (=> b!1002728 (= res!672206 (validKeyInArray!0 (select (arr!30492 a!3219) j!170)))))

(declare-fun b!1002729 () Bool)

(assert (=> b!1002729 (= e!564859 e!564858)))

(declare-fun res!672200 () Bool)

(assert (=> b!1002729 (=> (not res!672200) (not e!564858))))

(declare-fun lt!443314 () SeekEntryResult!9424)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002729 (= res!672200 (not (= lt!443314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443321 mask!3464) lt!443321 lt!443319 mask!3464))))))

(assert (=> b!1002729 (= lt!443321 (select (store (arr!30492 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002729 (= lt!443319 (array!63334 (store (arr!30492 a!3219) i!1194 k!2224) (size!30994 a!3219)))))

(declare-fun b!1002730 () Bool)

(assert (=> b!1002730 (= e!564856 e!564857)))

(declare-fun res!672202 () Bool)

(assert (=> b!1002730 (=> (not res!672202) (not e!564857))))

(declare-fun lt!443317 () SeekEntryResult!9424)

(assert (=> b!1002730 (= res!672202 (or (= lt!443317 (MissingVacant!9424 i!1194)) (= lt!443317 (MissingZero!9424 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63333 (_ BitVec 32)) SeekEntryResult!9424)

(assert (=> b!1002730 (= lt!443317 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002731 () Bool)

(assert (=> b!1002731 (= e!564857 e!564854)))

(declare-fun res!672204 () Bool)

(assert (=> b!1002731 (=> (not res!672204) (not e!564854))))

(assert (=> b!1002731 (= res!672204 (= lt!443314 lt!443318))))

(assert (=> b!1002731 (= lt!443318 (Intermediate!9424 false resIndex!38 resX!38))))

(assert (=> b!1002731 (= lt!443314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30492 a!3219) j!170) mask!3464) (select (arr!30492 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002732 () Bool)

(declare-fun res!672210 () Bool)

(assert (=> b!1002732 (=> (not res!672210) (not e!564857))))

(declare-datatypes ((List!21168 0))(
  ( (Nil!21165) (Cons!21164 (h!22341 (_ BitVec 64)) (t!30169 List!21168)) )
))
(declare-fun arrayNoDuplicates!0 (array!63333 (_ BitVec 32) List!21168) Bool)

(assert (=> b!1002732 (= res!672210 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21165))))

(assert (= (and start!86532 res!672209) b!1002717))

(assert (= (and b!1002717 res!672198) b!1002728))

(assert (= (and b!1002728 res!672206) b!1002724))

(assert (= (and b!1002724 res!672205) b!1002721))

(assert (= (and b!1002721 res!672197) b!1002730))

(assert (= (and b!1002730 res!672202) b!1002719))

(assert (= (and b!1002719 res!672196) b!1002732))

(assert (= (and b!1002732 res!672210) b!1002722))

(assert (= (and b!1002722 res!672199) b!1002731))

(assert (= (and b!1002731 res!672204) b!1002727))

(assert (= (and b!1002727 res!672201) b!1002729))

(assert (= (and b!1002729 res!672200) b!1002725))

(assert (= (and b!1002725 res!672207) b!1002718))

(assert (= (and b!1002718 res!672203) b!1002720))

(assert (= (and b!1002720 res!672208) b!1002723))

(assert (= (and b!1002723 res!672195) b!1002726))

(declare-fun m!928549 () Bool)

(assert (=> b!1002719 m!928549))

(declare-fun m!928551 () Bool)

(assert (=> b!1002724 m!928551))

(declare-fun m!928553 () Bool)

(assert (=> b!1002721 m!928553))

(declare-fun m!928555 () Bool)

(assert (=> b!1002725 m!928555))

(declare-fun m!928557 () Bool)

(assert (=> b!1002723 m!928557))

(assert (=> b!1002723 m!928557))

(declare-fun m!928559 () Bool)

(assert (=> b!1002723 m!928559))

(declare-fun m!928561 () Bool)

(assert (=> b!1002720 m!928561))

(declare-fun m!928563 () Bool)

(assert (=> b!1002726 m!928563))

(assert (=> b!1002728 m!928557))

(assert (=> b!1002728 m!928557))

(declare-fun m!928565 () Bool)

(assert (=> b!1002728 m!928565))

(assert (=> b!1002727 m!928557))

(assert (=> b!1002727 m!928557))

(declare-fun m!928567 () Bool)

(assert (=> b!1002727 m!928567))

(assert (=> b!1002731 m!928557))

(assert (=> b!1002731 m!928557))

(declare-fun m!928569 () Bool)

(assert (=> b!1002731 m!928569))

(assert (=> b!1002731 m!928569))

(assert (=> b!1002731 m!928557))

(declare-fun m!928571 () Bool)

(assert (=> b!1002731 m!928571))

(declare-fun m!928573 () Bool)

(assert (=> start!86532 m!928573))

(declare-fun m!928575 () Bool)

(assert (=> start!86532 m!928575))

(declare-fun m!928577 () Bool)

(assert (=> b!1002732 m!928577))

(declare-fun m!928579 () Bool)

(assert (=> b!1002730 m!928579))

(declare-fun m!928581 () Bool)

(assert (=> b!1002729 m!928581))

(assert (=> b!1002729 m!928581))

(declare-fun m!928583 () Bool)

(assert (=> b!1002729 m!928583))

(declare-fun m!928585 () Bool)

(assert (=> b!1002729 m!928585))

(declare-fun m!928587 () Bool)

(assert (=> b!1002729 m!928587))

(push 1)

(assert (not b!1002729))

