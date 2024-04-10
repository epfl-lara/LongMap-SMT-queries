; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86520 () Bool)

(assert start!86520)

(declare-fun b!1002429 () Bool)

(declare-fun res!671919 () Bool)

(declare-fun e!564728 () Bool)

(assert (=> b!1002429 (=> (not res!671919) (not e!564728))))

(declare-datatypes ((array!63321 0))(
  ( (array!63322 (arr!30486 (Array (_ BitVec 32) (_ BitVec 64))) (size!30988 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63321)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002429 (= res!671919 (validKeyInArray!0 (select (arr!30486 a!3219) j!170)))))

(declare-fun b!1002430 () Bool)

(declare-fun res!671921 () Bool)

(assert (=> b!1002430 (=> (not res!671921) (not e!564728))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002430 (= res!671921 (and (= (size!30988 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30988 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30988 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002431 () Bool)

(declare-fun e!564733 () Bool)

(assert (=> b!1002431 (= e!564733 false)))

(declare-fun lt!443170 () array!63321)

(declare-fun lt!443173 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9418 0))(
  ( (MissingZero!9418 (index!40043 (_ BitVec 32))) (Found!9418 (index!40044 (_ BitVec 32))) (Intermediate!9418 (undefined!10230 Bool) (index!40045 (_ BitVec 32)) (x!87454 (_ BitVec 32))) (Undefined!9418) (MissingVacant!9418 (index!40046 (_ BitVec 32))) )
))
(declare-fun lt!443177 () SeekEntryResult!9418)

(declare-fun lt!443175 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63321 (_ BitVec 32)) SeekEntryResult!9418)

(assert (=> b!1002431 (= lt!443177 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443173 lt!443175 lt!443170 mask!3464))))

(declare-fun b!1002432 () Bool)

(declare-fun res!671917 () Bool)

(assert (=> b!1002432 (=> (not res!671917) (not e!564728))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1002432 (= res!671917 (validKeyInArray!0 k!2224))))

(declare-fun b!1002433 () Bool)

(declare-fun e!564730 () Bool)

(assert (=> b!1002433 (= e!564728 e!564730)))

(declare-fun res!671909 () Bool)

(assert (=> b!1002433 (=> (not res!671909) (not e!564730))))

(declare-fun lt!443176 () SeekEntryResult!9418)

(assert (=> b!1002433 (= res!671909 (or (= lt!443176 (MissingVacant!9418 i!1194)) (= lt!443176 (MissingZero!9418 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63321 (_ BitVec 32)) SeekEntryResult!9418)

(assert (=> b!1002433 (= lt!443176 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1002434 () Bool)

(declare-fun res!671910 () Bool)

(assert (=> b!1002434 (=> (not res!671910) (not e!564730))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002434 (= res!671910 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30988 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30988 a!3219))))))

(declare-fun b!1002436 () Bool)

(declare-fun res!671914 () Bool)

(declare-fun e!564732 () Bool)

(assert (=> b!1002436 (=> (not res!671914) (not e!564732))))

(assert (=> b!1002436 (= res!671914 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002437 () Bool)

(declare-fun e!564731 () Bool)

(assert (=> b!1002437 (= e!564731 e!564732)))

(declare-fun res!671916 () Bool)

(assert (=> b!1002437 (=> (not res!671916) (not e!564732))))

(declare-fun lt!443171 () SeekEntryResult!9418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002437 (= res!671916 (not (= lt!443171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443175 mask!3464) lt!443175 lt!443170 mask!3464))))))

(assert (=> b!1002437 (= lt!443175 (select (store (arr!30486 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1002437 (= lt!443170 (array!63322 (store (arr!30486 a!3219) i!1194 k!2224) (size!30988 a!3219)))))

(declare-fun b!1002438 () Bool)

(assert (=> b!1002438 (= e!564732 e!564733)))

(declare-fun res!671918 () Bool)

(assert (=> b!1002438 (=> (not res!671918) (not e!564733))))

(assert (=> b!1002438 (= res!671918 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443173 #b00000000000000000000000000000000) (bvslt lt!443173 (size!30988 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002438 (= lt!443173 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002439 () Bool)

(declare-fun e!564727 () Bool)

(assert (=> b!1002439 (= e!564730 e!564727)))

(declare-fun res!671911 () Bool)

(assert (=> b!1002439 (=> (not res!671911) (not e!564727))))

(declare-fun lt!443172 () SeekEntryResult!9418)

(assert (=> b!1002439 (= res!671911 (= lt!443171 lt!443172))))

(assert (=> b!1002439 (= lt!443172 (Intermediate!9418 false resIndex!38 resX!38))))

(assert (=> b!1002439 (= lt!443171 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30486 a!3219) j!170) mask!3464) (select (arr!30486 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002440 () Bool)

(assert (=> b!1002440 (= e!564727 e!564731)))

(declare-fun res!671913 () Bool)

(assert (=> b!1002440 (=> (not res!671913) (not e!564731))))

(declare-fun lt!443174 () SeekEntryResult!9418)

(assert (=> b!1002440 (= res!671913 (= lt!443174 lt!443172))))

(assert (=> b!1002440 (= lt!443174 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30486 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!671908 () Bool)

(assert (=> start!86520 (=> (not res!671908) (not e!564728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86520 (= res!671908 (validMask!0 mask!3464))))

(assert (=> start!86520 e!564728))

(declare-fun array_inv!23610 (array!63321) Bool)

(assert (=> start!86520 (array_inv!23610 a!3219)))

(assert (=> start!86520 true))

(declare-fun b!1002435 () Bool)

(declare-fun res!671912 () Bool)

(assert (=> b!1002435 (=> (not res!671912) (not e!564730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63321 (_ BitVec 32)) Bool)

(assert (=> b!1002435 (= res!671912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002441 () Bool)

(declare-fun res!671915 () Bool)

(assert (=> b!1002441 (=> (not res!671915) (not e!564730))))

(declare-datatypes ((List!21162 0))(
  ( (Nil!21159) (Cons!21158 (h!22335 (_ BitVec 64)) (t!30163 List!21162)) )
))
(declare-fun arrayNoDuplicates!0 (array!63321 (_ BitVec 32) List!21162) Bool)

(assert (=> b!1002441 (= res!671915 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21159))))

(declare-fun b!1002442 () Bool)

(declare-fun res!671920 () Bool)

(assert (=> b!1002442 (=> (not res!671920) (not e!564733))))

(assert (=> b!1002442 (= res!671920 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443173 (select (arr!30486 a!3219) j!170) a!3219 mask!3464) lt!443172))))

(declare-fun b!1002443 () Bool)

(declare-fun res!671907 () Bool)

(assert (=> b!1002443 (=> (not res!671907) (not e!564728))))

(declare-fun arrayContainsKey!0 (array!63321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002443 (= res!671907 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002444 () Bool)

(declare-fun res!671922 () Bool)

(assert (=> b!1002444 (=> (not res!671922) (not e!564732))))

(assert (=> b!1002444 (= res!671922 (not (= lt!443174 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443175 lt!443170 mask!3464))))))

(assert (= (and start!86520 res!671908) b!1002430))

(assert (= (and b!1002430 res!671921) b!1002429))

(assert (= (and b!1002429 res!671919) b!1002432))

(assert (= (and b!1002432 res!671917) b!1002443))

(assert (= (and b!1002443 res!671907) b!1002433))

(assert (= (and b!1002433 res!671909) b!1002435))

(assert (= (and b!1002435 res!671912) b!1002441))

(assert (= (and b!1002441 res!671915) b!1002434))

(assert (= (and b!1002434 res!671910) b!1002439))

(assert (= (and b!1002439 res!671911) b!1002440))

(assert (= (and b!1002440 res!671913) b!1002437))

(assert (= (and b!1002437 res!671916) b!1002444))

(assert (= (and b!1002444 res!671922) b!1002436))

(assert (= (and b!1002436 res!671914) b!1002438))

(assert (= (and b!1002438 res!671918) b!1002442))

(assert (= (and b!1002442 res!671920) b!1002431))

(declare-fun m!928309 () Bool)

(assert (=> b!1002429 m!928309))

(assert (=> b!1002429 m!928309))

(declare-fun m!928311 () Bool)

(assert (=> b!1002429 m!928311))

(declare-fun m!928313 () Bool)

(assert (=> b!1002444 m!928313))

(declare-fun m!928315 () Bool)

(assert (=> b!1002437 m!928315))

(assert (=> b!1002437 m!928315))

(declare-fun m!928317 () Bool)

(assert (=> b!1002437 m!928317))

(declare-fun m!928319 () Bool)

(assert (=> b!1002437 m!928319))

(declare-fun m!928321 () Bool)

(assert (=> b!1002437 m!928321))

(declare-fun m!928323 () Bool)

(assert (=> start!86520 m!928323))

(declare-fun m!928325 () Bool)

(assert (=> start!86520 m!928325))

(declare-fun m!928327 () Bool)

(assert (=> b!1002433 m!928327))

(assert (=> b!1002442 m!928309))

(assert (=> b!1002442 m!928309))

(declare-fun m!928329 () Bool)

(assert (=> b!1002442 m!928329))

(declare-fun m!928331 () Bool)

(assert (=> b!1002432 m!928331))

(declare-fun m!928333 () Bool)

(assert (=> b!1002435 m!928333))

(assert (=> b!1002439 m!928309))

(assert (=> b!1002439 m!928309))

(declare-fun m!928335 () Bool)

(assert (=> b!1002439 m!928335))

(assert (=> b!1002439 m!928335))

(assert (=> b!1002439 m!928309))

(declare-fun m!928337 () Bool)

(assert (=> b!1002439 m!928337))

(declare-fun m!928339 () Bool)

(assert (=> b!1002438 m!928339))

(declare-fun m!928341 () Bool)

(assert (=> b!1002431 m!928341))

(declare-fun m!928343 () Bool)

(assert (=> b!1002443 m!928343))

(assert (=> b!1002440 m!928309))

(assert (=> b!1002440 m!928309))

(declare-fun m!928345 () Bool)

(assert (=> b!1002440 m!928345))

(declare-fun m!928347 () Bool)

(assert (=> b!1002441 m!928347))

(push 1)

