; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86558 () Bool)

(assert start!86558)

(declare-fun b!1003341 () Bool)

(declare-fun res!672825 () Bool)

(declare-fun e!565126 () Bool)

(assert (=> b!1003341 (=> (not res!672825) (not e!565126))))

(declare-datatypes ((array!63359 0))(
  ( (array!63360 (arr!30505 (Array (_ BitVec 32) (_ BitVec 64))) (size!31007 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63359)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003341 (= res!672825 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003342 () Bool)

(declare-fun e!565129 () Bool)

(assert (=> b!1003342 (= e!565126 e!565129)))

(declare-fun res!672831 () Bool)

(assert (=> b!1003342 (=> (not res!672831) (not e!565129))))

(declare-datatypes ((SeekEntryResult!9437 0))(
  ( (MissingZero!9437 (index!40119 (_ BitVec 32))) (Found!9437 (index!40120 (_ BitVec 32))) (Intermediate!9437 (undefined!10249 Bool) (index!40121 (_ BitVec 32)) (x!87529 (_ BitVec 32))) (Undefined!9437) (MissingVacant!9437 (index!40122 (_ BitVec 32))) )
))
(declare-fun lt!443628 () SeekEntryResult!9437)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003342 (= res!672831 (or (= lt!443628 (MissingVacant!9437 i!1194)) (= lt!443628 (MissingZero!9437 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63359 (_ BitVec 32)) SeekEntryResult!9437)

(assert (=> b!1003342 (= lt!443628 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003344 () Bool)

(declare-fun res!672830 () Bool)

(assert (=> b!1003344 (=> (not res!672830) (not e!565126))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003344 (= res!672830 (and (= (size!31007 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31007 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31007 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003345 () Bool)

(declare-fun e!565130 () Bool)

(declare-fun e!565131 () Bool)

(assert (=> b!1003345 (= e!565130 e!565131)))

(declare-fun res!672824 () Bool)

(assert (=> b!1003345 (=> (not res!672824) (not e!565131))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443627 () (_ BitVec 32))

(assert (=> b!1003345 (= res!672824 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443627 #b00000000000000000000000000000000) (bvslt lt!443627 (size!31007 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003345 (= lt!443627 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003346 () Bool)

(assert (=> b!1003346 (= e!565131 false)))

(declare-fun lt!443633 () SeekEntryResult!9437)

(declare-fun lt!443630 () array!63359)

(declare-fun lt!443632 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63359 (_ BitVec 32)) SeekEntryResult!9437)

(assert (=> b!1003346 (= lt!443633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443627 lt!443632 lt!443630 mask!3464))))

(declare-fun b!1003347 () Bool)

(declare-fun res!672832 () Bool)

(assert (=> b!1003347 (=> (not res!672832) (not e!565130))))

(declare-fun lt!443626 () SeekEntryResult!9437)

(assert (=> b!1003347 (= res!672832 (not (= lt!443626 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443632 lt!443630 mask!3464))))))

(declare-fun b!1003348 () Bool)

(declare-fun res!672829 () Bool)

(assert (=> b!1003348 (=> (not res!672829) (not e!565129))))

(declare-datatypes ((List!21181 0))(
  ( (Nil!21178) (Cons!21177 (h!22354 (_ BitVec 64)) (t!30182 List!21181)) )
))
(declare-fun arrayNoDuplicates!0 (array!63359 (_ BitVec 32) List!21181) Bool)

(assert (=> b!1003348 (= res!672829 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21178))))

(declare-fun b!1003349 () Bool)

(declare-fun res!672823 () Bool)

(assert (=> b!1003349 (=> (not res!672823) (not e!565131))))

(declare-fun lt!443629 () SeekEntryResult!9437)

(assert (=> b!1003349 (= res!672823 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443627 (select (arr!30505 a!3219) j!170) a!3219 mask!3464) lt!443629))))

(declare-fun b!1003343 () Bool)

(declare-fun res!672826 () Bool)

(assert (=> b!1003343 (=> (not res!672826) (not e!565126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003343 (= res!672826 (validKeyInArray!0 k!2224))))

(declare-fun res!672827 () Bool)

(assert (=> start!86558 (=> (not res!672827) (not e!565126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86558 (= res!672827 (validMask!0 mask!3464))))

(assert (=> start!86558 e!565126))

(declare-fun array_inv!23629 (array!63359) Bool)

(assert (=> start!86558 (array_inv!23629 a!3219)))

(assert (=> start!86558 true))

(declare-fun b!1003350 () Bool)

(declare-fun e!565128 () Bool)

(declare-fun e!565127 () Bool)

(assert (=> b!1003350 (= e!565128 e!565127)))

(declare-fun res!672828 () Bool)

(assert (=> b!1003350 (=> (not res!672828) (not e!565127))))

(assert (=> b!1003350 (= res!672828 (= lt!443626 lt!443629))))

(assert (=> b!1003350 (= lt!443626 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30505 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003351 () Bool)

(declare-fun res!672820 () Bool)

(assert (=> b!1003351 (=> (not res!672820) (not e!565129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63359 (_ BitVec 32)) Bool)

(assert (=> b!1003351 (= res!672820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003352 () Bool)

(assert (=> b!1003352 (= e!565127 e!565130)))

(declare-fun res!672834 () Bool)

(assert (=> b!1003352 (=> (not res!672834) (not e!565130))))

(declare-fun lt!443631 () SeekEntryResult!9437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003352 (= res!672834 (not (= lt!443631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443632 mask!3464) lt!443632 lt!443630 mask!3464))))))

(assert (=> b!1003352 (= lt!443632 (select (store (arr!30505 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003352 (= lt!443630 (array!63360 (store (arr!30505 a!3219) i!1194 k!2224) (size!31007 a!3219)))))

(declare-fun b!1003353 () Bool)

(declare-fun res!672821 () Bool)

(assert (=> b!1003353 (=> (not res!672821) (not e!565130))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003353 (= res!672821 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003354 () Bool)

(declare-fun res!672819 () Bool)

(assert (=> b!1003354 (=> (not res!672819) (not e!565129))))

(assert (=> b!1003354 (= res!672819 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31007 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31007 a!3219))))))

(declare-fun b!1003355 () Bool)

(assert (=> b!1003355 (= e!565129 e!565128)))

(declare-fun res!672822 () Bool)

(assert (=> b!1003355 (=> (not res!672822) (not e!565128))))

(assert (=> b!1003355 (= res!672822 (= lt!443631 lt!443629))))

(assert (=> b!1003355 (= lt!443629 (Intermediate!9437 false resIndex!38 resX!38))))

(assert (=> b!1003355 (= lt!443631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30505 a!3219) j!170) mask!3464) (select (arr!30505 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003356 () Bool)

(declare-fun res!672833 () Bool)

(assert (=> b!1003356 (=> (not res!672833) (not e!565126))))

(assert (=> b!1003356 (= res!672833 (validKeyInArray!0 (select (arr!30505 a!3219) j!170)))))

(assert (= (and start!86558 res!672827) b!1003344))

(assert (= (and b!1003344 res!672830) b!1003356))

(assert (= (and b!1003356 res!672833) b!1003343))

(assert (= (and b!1003343 res!672826) b!1003341))

(assert (= (and b!1003341 res!672825) b!1003342))

(assert (= (and b!1003342 res!672831) b!1003351))

(assert (= (and b!1003351 res!672820) b!1003348))

(assert (= (and b!1003348 res!672829) b!1003354))

(assert (= (and b!1003354 res!672819) b!1003355))

(assert (= (and b!1003355 res!672822) b!1003350))

(assert (= (and b!1003350 res!672828) b!1003352))

(assert (= (and b!1003352 res!672834) b!1003347))

(assert (= (and b!1003347 res!672832) b!1003353))

(assert (= (and b!1003353 res!672821) b!1003345))

(assert (= (and b!1003345 res!672824) b!1003349))

(assert (= (and b!1003349 res!672823) b!1003346))

(declare-fun m!929069 () Bool)

(assert (=> b!1003346 m!929069))

(declare-fun m!929071 () Bool)

(assert (=> b!1003348 m!929071))

(declare-fun m!929073 () Bool)

(assert (=> b!1003342 m!929073))

(declare-fun m!929075 () Bool)

(assert (=> b!1003356 m!929075))

(assert (=> b!1003356 m!929075))

(declare-fun m!929077 () Bool)

(assert (=> b!1003356 m!929077))

(assert (=> b!1003355 m!929075))

(assert (=> b!1003355 m!929075))

(declare-fun m!929079 () Bool)

(assert (=> b!1003355 m!929079))

(assert (=> b!1003355 m!929079))

(assert (=> b!1003355 m!929075))

(declare-fun m!929081 () Bool)

(assert (=> b!1003355 m!929081))

(declare-fun m!929083 () Bool)

(assert (=> b!1003352 m!929083))

(assert (=> b!1003352 m!929083))

(declare-fun m!929085 () Bool)

(assert (=> b!1003352 m!929085))

(declare-fun m!929087 () Bool)

(assert (=> b!1003352 m!929087))

(declare-fun m!929089 () Bool)

(assert (=> b!1003352 m!929089))

(declare-fun m!929091 () Bool)

(assert (=> start!86558 m!929091))

(declare-fun m!929093 () Bool)

(assert (=> start!86558 m!929093))

(declare-fun m!929095 () Bool)

(assert (=> b!1003341 m!929095))

(declare-fun m!929097 () Bool)

(assert (=> b!1003351 m!929097))

(assert (=> b!1003350 m!929075))

(assert (=> b!1003350 m!929075))

(declare-fun m!929099 () Bool)

(assert (=> b!1003350 m!929099))

(declare-fun m!929101 () Bool)

(assert (=> b!1003343 m!929101))

(assert (=> b!1003349 m!929075))

(assert (=> b!1003349 m!929075))

(declare-fun m!929103 () Bool)

(assert (=> b!1003349 m!929103))

(declare-fun m!929105 () Bool)

(assert (=> b!1003347 m!929105))

(declare-fun m!929107 () Bool)

(assert (=> b!1003345 m!929107))

(push 1)

