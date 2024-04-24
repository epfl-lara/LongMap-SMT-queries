; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86200 () Bool)

(assert start!86200)

(declare-fun b!997328 () Bool)

(declare-fun e!562793 () Bool)

(declare-fun e!562794 () Bool)

(assert (=> b!997328 (= e!562793 e!562794)))

(declare-fun res!666877 () Bool)

(assert (=> b!997328 (=> (not res!666877) (not e!562794))))

(declare-datatypes ((SeekEntryResult!9232 0))(
  ( (MissingZero!9232 (index!39299 (_ BitVec 32))) (Found!9232 (index!39300 (_ BitVec 32))) (Intermediate!9232 (undefined!10044 Bool) (index!39301 (_ BitVec 32)) (x!86890 (_ BitVec 32))) (Undefined!9232) (MissingVacant!9232 (index!39302 (_ BitVec 32))) )
))
(declare-fun lt!441593 () SeekEntryResult!9232)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997328 (= res!666877 (or (= lt!441593 (MissingVacant!9232 i!1194)) (= lt!441593 (MissingZero!9232 i!1194))))))

(declare-datatypes ((array!63075 0))(
  ( (array!63076 (arr!30364 (Array (_ BitVec 32) (_ BitVec 64))) (size!30867 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63075)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63075 (_ BitVec 32)) SeekEntryResult!9232)

(assert (=> b!997328 (= lt!441593 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997329 () Bool)

(declare-fun res!666878 () Bool)

(assert (=> b!997329 (=> (not res!666878) (not e!562793))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!997329 (= res!666878 (and (= (size!30867 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30867 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30867 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997330 () Bool)

(assert (=> b!997330 (= e!562794 false)))

(declare-fun lt!441592 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997330 (= lt!441592 (toIndex!0 (select (arr!30364 a!3219) j!170) mask!3464))))

(declare-fun b!997331 () Bool)

(declare-fun res!666876 () Bool)

(assert (=> b!997331 (=> (not res!666876) (not e!562793))))

(declare-fun arrayContainsKey!0 (array!63075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997331 (= res!666876 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997332 () Bool)

(declare-fun res!666882 () Bool)

(assert (=> b!997332 (=> (not res!666882) (not e!562793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997332 (= res!666882 (validKeyInArray!0 (select (arr!30364 a!3219) j!170)))))

(declare-fun b!997333 () Bool)

(declare-fun res!666884 () Bool)

(assert (=> b!997333 (=> (not res!666884) (not e!562793))))

(assert (=> b!997333 (= res!666884 (validKeyInArray!0 k0!2224))))

(declare-fun b!997334 () Bool)

(declare-fun res!666879 () Bool)

(assert (=> b!997334 (=> (not res!666879) (not e!562794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63075 (_ BitVec 32)) Bool)

(assert (=> b!997334 (= res!666879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997335 () Bool)

(declare-fun res!666883 () Bool)

(assert (=> b!997335 (=> (not res!666883) (not e!562794))))

(declare-datatypes ((List!21011 0))(
  ( (Nil!21008) (Cons!21007 (h!22178 (_ BitVec 64)) (t!30004 List!21011)) )
))
(declare-fun arrayNoDuplicates!0 (array!63075 (_ BitVec 32) List!21011) Bool)

(assert (=> b!997335 (= res!666883 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21008))))

(declare-fun res!666881 () Bool)

(assert (=> start!86200 (=> (not res!666881) (not e!562793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86200 (= res!666881 (validMask!0 mask!3464))))

(assert (=> start!86200 e!562793))

(declare-fun array_inv!23500 (array!63075) Bool)

(assert (=> start!86200 (array_inv!23500 a!3219)))

(assert (=> start!86200 true))

(declare-fun b!997336 () Bool)

(declare-fun res!666880 () Bool)

(assert (=> b!997336 (=> (not res!666880) (not e!562794))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997336 (= res!666880 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30867 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30867 a!3219))))))

(assert (= (and start!86200 res!666881) b!997329))

(assert (= (and b!997329 res!666878) b!997332))

(assert (= (and b!997332 res!666882) b!997333))

(assert (= (and b!997333 res!666884) b!997331))

(assert (= (and b!997331 res!666876) b!997328))

(assert (= (and b!997328 res!666877) b!997334))

(assert (= (and b!997334 res!666879) b!997335))

(assert (= (and b!997335 res!666883) b!997336))

(assert (= (and b!997336 res!666880) b!997330))

(declare-fun m!924863 () Bool)

(assert (=> start!86200 m!924863))

(declare-fun m!924865 () Bool)

(assert (=> start!86200 m!924865))

(declare-fun m!924867 () Bool)

(assert (=> b!997328 m!924867))

(declare-fun m!924869 () Bool)

(assert (=> b!997333 m!924869))

(declare-fun m!924871 () Bool)

(assert (=> b!997332 m!924871))

(assert (=> b!997332 m!924871))

(declare-fun m!924873 () Bool)

(assert (=> b!997332 m!924873))

(declare-fun m!924875 () Bool)

(assert (=> b!997335 m!924875))

(declare-fun m!924877 () Bool)

(assert (=> b!997331 m!924877))

(declare-fun m!924879 () Bool)

(assert (=> b!997334 m!924879))

(assert (=> b!997330 m!924871))

(assert (=> b!997330 m!924871))

(declare-fun m!924881 () Bool)

(assert (=> b!997330 m!924881))

(check-sat (not b!997328) (not b!997331) (not b!997332) (not b!997330) (not start!86200) (not b!997335) (not b!997333) (not b!997334))
(check-sat)
