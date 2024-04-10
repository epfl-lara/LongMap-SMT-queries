; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86404 () Bool)

(assert start!86404)

(declare-fun b!1000048 () Bool)

(declare-fun res!669531 () Bool)

(declare-fun e!563755 () Bool)

(assert (=> b!1000048 (=> (not res!669531) (not e!563755))))

(declare-datatypes ((array!63205 0))(
  ( (array!63206 (arr!30428 (Array (_ BitVec 32) (_ BitVec 64))) (size!30930 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63205)

(declare-datatypes ((List!21104 0))(
  ( (Nil!21101) (Cons!21100 (h!22277 (_ BitVec 64)) (t!30105 List!21104)) )
))
(declare-fun arrayNoDuplicates!0 (array!63205 (_ BitVec 32) List!21104) Bool)

(assert (=> b!1000048 (= res!669531 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21101))))

(declare-fun b!1000049 () Bool)

(declare-fun res!669535 () Bool)

(declare-fun e!563757 () Bool)

(assert (=> b!1000049 (=> (not res!669535) (not e!563757))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9360 0))(
  ( (MissingZero!9360 (index!39811 (_ BitVec 32))) (Found!9360 (index!39812 (_ BitVec 32))) (Intermediate!9360 (undefined!10172 Bool) (index!39813 (_ BitVec 32)) (x!87244 (_ BitVec 32))) (Undefined!9360) (MissingVacant!9360 (index!39814 (_ BitVec 32))) )
))
(declare-fun lt!442185 () SeekEntryResult!9360)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63205 (_ BitVec 32)) SeekEntryResult!9360)

(assert (=> b!1000049 (= res!669535 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30428 a!3219) j!170) a!3219 mask!3464) lt!442185))))

(declare-fun b!1000050 () Bool)

(assert (=> b!1000050 (= e!563755 e!563757)))

(declare-fun res!669532 () Bool)

(assert (=> b!1000050 (=> (not res!669532) (not e!563757))))

(declare-fun lt!442187 () SeekEntryResult!9360)

(assert (=> b!1000050 (= res!669532 (= lt!442187 lt!442185))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000050 (= lt!442185 (Intermediate!9360 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000050 (= lt!442187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30428 a!3219) j!170) mask!3464) (select (arr!30428 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000051 () Bool)

(declare-fun res!669537 () Bool)

(assert (=> b!1000051 (=> (not res!669537) (not e!563757))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1000051 (= res!669537 (not (= lt!442187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30428 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30428 a!3219) i!1194 k0!2224) j!170) (array!63206 (store (arr!30428 a!3219) i!1194 k0!2224) (size!30930 a!3219)) mask!3464))))))

(declare-fun res!669527 () Bool)

(declare-fun e!563758 () Bool)

(assert (=> start!86404 (=> (not res!669527) (not e!563758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86404 (= res!669527 (validMask!0 mask!3464))))

(assert (=> start!86404 e!563758))

(declare-fun array_inv!23552 (array!63205) Bool)

(assert (=> start!86404 (array_inv!23552 a!3219)))

(assert (=> start!86404 true))

(declare-fun b!1000052 () Bool)

(declare-fun res!669534 () Bool)

(assert (=> b!1000052 (=> (not res!669534) (not e!563758))))

(declare-fun arrayContainsKey!0 (array!63205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000052 (= res!669534 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000053 () Bool)

(declare-fun res!669530 () Bool)

(assert (=> b!1000053 (=> (not res!669530) (not e!563758))))

(assert (=> b!1000053 (= res!669530 (and (= (size!30930 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30930 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30930 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000054 () Bool)

(declare-fun res!669536 () Bool)

(assert (=> b!1000054 (=> (not res!669536) (not e!563755))))

(assert (=> b!1000054 (= res!669536 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30930 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30930 a!3219))))))

(declare-fun b!1000055 () Bool)

(assert (=> b!1000055 (= e!563758 e!563755)))

(declare-fun res!669526 () Bool)

(assert (=> b!1000055 (=> (not res!669526) (not e!563755))))

(declare-fun lt!442186 () SeekEntryResult!9360)

(assert (=> b!1000055 (= res!669526 (or (= lt!442186 (MissingVacant!9360 i!1194)) (= lt!442186 (MissingZero!9360 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63205 (_ BitVec 32)) SeekEntryResult!9360)

(assert (=> b!1000055 (= lt!442186 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000056 () Bool)

(declare-fun res!669529 () Bool)

(assert (=> b!1000056 (=> (not res!669529) (not e!563758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000056 (= res!669529 (validKeyInArray!0 (select (arr!30428 a!3219) j!170)))))

(declare-fun b!1000057 () Bool)

(declare-fun res!669533 () Bool)

(assert (=> b!1000057 (=> (not res!669533) (not e!563758))))

(assert (=> b!1000057 (= res!669533 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000058 () Bool)

(assert (=> b!1000058 (= e!563757 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000059 () Bool)

(declare-fun res!669528 () Bool)

(assert (=> b!1000059 (=> (not res!669528) (not e!563755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63205 (_ BitVec 32)) Bool)

(assert (=> b!1000059 (= res!669528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86404 res!669527) b!1000053))

(assert (= (and b!1000053 res!669530) b!1000056))

(assert (= (and b!1000056 res!669529) b!1000057))

(assert (= (and b!1000057 res!669533) b!1000052))

(assert (= (and b!1000052 res!669534) b!1000055))

(assert (= (and b!1000055 res!669526) b!1000059))

(assert (= (and b!1000059 res!669528) b!1000048))

(assert (= (and b!1000048 res!669531) b!1000054))

(assert (= (and b!1000054 res!669536) b!1000050))

(assert (= (and b!1000050 res!669532) b!1000049))

(assert (= (and b!1000049 res!669535) b!1000051))

(assert (= (and b!1000051 res!669537) b!1000058))

(declare-fun m!926239 () Bool)

(assert (=> start!86404 m!926239))

(declare-fun m!926241 () Bool)

(assert (=> start!86404 m!926241))

(declare-fun m!926243 () Bool)

(assert (=> b!1000055 m!926243))

(declare-fun m!926245 () Bool)

(assert (=> b!1000049 m!926245))

(assert (=> b!1000049 m!926245))

(declare-fun m!926247 () Bool)

(assert (=> b!1000049 m!926247))

(declare-fun m!926249 () Bool)

(assert (=> b!1000052 m!926249))

(assert (=> b!1000056 m!926245))

(assert (=> b!1000056 m!926245))

(declare-fun m!926251 () Bool)

(assert (=> b!1000056 m!926251))

(assert (=> b!1000050 m!926245))

(assert (=> b!1000050 m!926245))

(declare-fun m!926253 () Bool)

(assert (=> b!1000050 m!926253))

(assert (=> b!1000050 m!926253))

(assert (=> b!1000050 m!926245))

(declare-fun m!926255 () Bool)

(assert (=> b!1000050 m!926255))

(declare-fun m!926257 () Bool)

(assert (=> b!1000048 m!926257))

(declare-fun m!926259 () Bool)

(assert (=> b!1000059 m!926259))

(declare-fun m!926261 () Bool)

(assert (=> b!1000051 m!926261))

(declare-fun m!926263 () Bool)

(assert (=> b!1000051 m!926263))

(assert (=> b!1000051 m!926263))

(declare-fun m!926265 () Bool)

(assert (=> b!1000051 m!926265))

(assert (=> b!1000051 m!926265))

(assert (=> b!1000051 m!926263))

(declare-fun m!926267 () Bool)

(assert (=> b!1000051 m!926267))

(declare-fun m!926269 () Bool)

(assert (=> b!1000057 m!926269))

(check-sat (not b!1000052) (not b!1000050) (not b!1000059) (not start!86404) (not b!1000055) (not b!1000056) (not b!1000048) (not b!1000051) (not b!1000049) (not b!1000057))
(check-sat)
