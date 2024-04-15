; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86916 () Bool)

(assert start!86916)

(declare-fun b!1007961 () Bool)

(declare-fun e!567172 () Bool)

(declare-fun e!567174 () Bool)

(assert (=> b!1007961 (= e!567172 e!567174)))

(declare-fun res!676991 () Bool)

(assert (=> b!1007961 (=> (not res!676991) (not e!567174))))

(declare-datatypes ((SeekEntryResult!9533 0))(
  ( (MissingZero!9533 (index!40503 (_ BitVec 32))) (Found!9533 (index!40504 (_ BitVec 32))) (Intermediate!9533 (undefined!10345 Bool) (index!40505 (_ BitVec 32)) (x!87910 (_ BitVec 32))) (Undefined!9533) (MissingVacant!9533 (index!40506 (_ BitVec 32))) )
))
(declare-fun lt!445336 () SeekEntryResult!9533)

(declare-fun lt!445341 () SeekEntryResult!9533)

(assert (=> b!1007961 (= res!676991 (= lt!445336 lt!445341))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007961 (= lt!445341 (Intermediate!9533 false resIndex!38 resX!38))))

(declare-datatypes ((array!63511 0))(
  ( (array!63512 (arr!30576 (Array (_ BitVec 32) (_ BitVec 64))) (size!31080 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63511)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63511 (_ BitVec 32)) SeekEntryResult!9533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007961 (= lt!445336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30576 a!3219) j!170) mask!3464) (select (arr!30576 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007962 () Bool)

(declare-fun e!567173 () Bool)

(declare-fun e!567175 () Bool)

(assert (=> b!1007962 (= e!567173 e!567175)))

(declare-fun res!676985 () Bool)

(assert (=> b!1007962 (=> (not res!676985) (not e!567175))))

(declare-fun lt!445340 () array!63511)

(declare-fun lt!445338 () (_ BitVec 64))

(assert (=> b!1007962 (= res!676985 (not (= lt!445336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445338 mask!3464) lt!445338 lt!445340 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1007962 (= lt!445338 (select (store (arr!30576 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007962 (= lt!445340 (array!63512 (store (arr!30576 a!3219) i!1194 k0!2224) (size!31080 a!3219)))))

(declare-fun b!1007963 () Bool)

(declare-fun res!676981 () Bool)

(assert (=> b!1007963 (=> (not res!676981) (not e!567175))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1007963 (= res!676981 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007964 () Bool)

(declare-fun res!676987 () Bool)

(assert (=> b!1007964 (=> (not res!676987) (not e!567172))))

(declare-datatypes ((List!21318 0))(
  ( (Nil!21315) (Cons!21314 (h!22500 (_ BitVec 64)) (t!30310 List!21318)) )
))
(declare-fun arrayNoDuplicates!0 (array!63511 (_ BitVec 32) List!21318) Bool)

(assert (=> b!1007964 (= res!676987 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21315))))

(declare-fun b!1007966 () Bool)

(declare-fun res!676980 () Bool)

(declare-fun e!567171 () Bool)

(assert (=> b!1007966 (=> (not res!676980) (not e!567171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007966 (= res!676980 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007967 () Bool)

(declare-fun res!676978 () Bool)

(assert (=> b!1007967 (=> (not res!676978) (not e!567171))))

(assert (=> b!1007967 (= res!676978 (and (= (size!31080 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31080 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31080 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007968 () Bool)

(assert (=> b!1007968 (= e!567174 e!567173)))

(declare-fun res!676988 () Bool)

(assert (=> b!1007968 (=> (not res!676988) (not e!567173))))

(declare-fun lt!445337 () SeekEntryResult!9533)

(assert (=> b!1007968 (= res!676988 (= lt!445337 lt!445341))))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007968 (= lt!445337 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30576 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007969 () Bool)

(declare-fun res!676979 () Bool)

(assert (=> b!1007969 (=> (not res!676979) (not e!567172))))

(assert (=> b!1007969 (= res!676979 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31080 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31080 a!3219))))))

(declare-fun b!1007970 () Bool)

(assert (=> b!1007970 (= e!567171 e!567172)))

(declare-fun res!676983 () Bool)

(assert (=> b!1007970 (=> (not res!676983) (not e!567172))))

(declare-fun lt!445339 () SeekEntryResult!9533)

(assert (=> b!1007970 (= res!676983 (or (= lt!445339 (MissingVacant!9533 i!1194)) (= lt!445339 (MissingZero!9533 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63511 (_ BitVec 32)) SeekEntryResult!9533)

(assert (=> b!1007970 (= lt!445339 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007971 () Bool)

(declare-fun res!676989 () Bool)

(assert (=> b!1007971 (=> (not res!676989) (not e!567171))))

(declare-fun arrayContainsKey!0 (array!63511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007971 (= res!676989 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007972 () Bool)

(declare-fun res!676982 () Bool)

(assert (=> b!1007972 (=> (not res!676982) (not e!567175))))

(assert (=> b!1007972 (= res!676982 (not (= lt!445337 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445338 lt!445340 mask!3464))))))

(declare-fun b!1007965 () Bool)

(assert (=> b!1007965 (= e!567175 false)))

(declare-fun lt!445342 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007965 (= lt!445342 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!676984 () Bool)

(assert (=> start!86916 (=> (not res!676984) (not e!567171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86916 (= res!676984 (validMask!0 mask!3464))))

(assert (=> start!86916 e!567171))

(declare-fun array_inv!23719 (array!63511) Bool)

(assert (=> start!86916 (array_inv!23719 a!3219)))

(assert (=> start!86916 true))

(declare-fun b!1007973 () Bool)

(declare-fun res!676990 () Bool)

(assert (=> b!1007973 (=> (not res!676990) (not e!567171))))

(assert (=> b!1007973 (= res!676990 (validKeyInArray!0 (select (arr!30576 a!3219) j!170)))))

(declare-fun b!1007974 () Bool)

(declare-fun res!676986 () Bool)

(assert (=> b!1007974 (=> (not res!676986) (not e!567172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63511 (_ BitVec 32)) Bool)

(assert (=> b!1007974 (= res!676986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86916 res!676984) b!1007967))

(assert (= (and b!1007967 res!676978) b!1007973))

(assert (= (and b!1007973 res!676990) b!1007966))

(assert (= (and b!1007966 res!676980) b!1007971))

(assert (= (and b!1007971 res!676989) b!1007970))

(assert (= (and b!1007970 res!676983) b!1007974))

(assert (= (and b!1007974 res!676986) b!1007964))

(assert (= (and b!1007964 res!676987) b!1007969))

(assert (= (and b!1007969 res!676979) b!1007961))

(assert (= (and b!1007961 res!676991) b!1007968))

(assert (= (and b!1007968 res!676988) b!1007962))

(assert (= (and b!1007962 res!676985) b!1007972))

(assert (= (and b!1007972 res!676982) b!1007963))

(assert (= (and b!1007963 res!676981) b!1007965))

(declare-fun m!932233 () Bool)

(assert (=> b!1007968 m!932233))

(assert (=> b!1007968 m!932233))

(declare-fun m!932235 () Bool)

(assert (=> b!1007968 m!932235))

(declare-fun m!932237 () Bool)

(assert (=> b!1007964 m!932237))

(declare-fun m!932239 () Bool)

(assert (=> b!1007966 m!932239))

(declare-fun m!932241 () Bool)

(assert (=> b!1007972 m!932241))

(declare-fun m!932243 () Bool)

(assert (=> b!1007971 m!932243))

(assert (=> b!1007973 m!932233))

(assert (=> b!1007973 m!932233))

(declare-fun m!932245 () Bool)

(assert (=> b!1007973 m!932245))

(declare-fun m!932247 () Bool)

(assert (=> b!1007965 m!932247))

(declare-fun m!932249 () Bool)

(assert (=> b!1007962 m!932249))

(assert (=> b!1007962 m!932249))

(declare-fun m!932251 () Bool)

(assert (=> b!1007962 m!932251))

(declare-fun m!932253 () Bool)

(assert (=> b!1007962 m!932253))

(declare-fun m!932255 () Bool)

(assert (=> b!1007962 m!932255))

(declare-fun m!932257 () Bool)

(assert (=> start!86916 m!932257))

(declare-fun m!932259 () Bool)

(assert (=> start!86916 m!932259))

(assert (=> b!1007961 m!932233))

(assert (=> b!1007961 m!932233))

(declare-fun m!932261 () Bool)

(assert (=> b!1007961 m!932261))

(assert (=> b!1007961 m!932261))

(assert (=> b!1007961 m!932233))

(declare-fun m!932263 () Bool)

(assert (=> b!1007961 m!932263))

(declare-fun m!932265 () Bool)

(assert (=> b!1007974 m!932265))

(declare-fun m!932267 () Bool)

(assert (=> b!1007970 m!932267))

(check-sat (not b!1007971) (not b!1007974) (not b!1007970) (not b!1007962) (not start!86916) (not b!1007968) (not b!1007966) (not b!1007964) (not b!1007972) (not b!1007973) (not b!1007961) (not b!1007965))
(check-sat)
