; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86392 () Bool)

(assert start!86392)

(declare-fun b!999112 () Bool)

(declare-fun res!668345 () Bool)

(declare-fun e!563544 () Bool)

(assert (=> b!999112 (=> (not res!668345) (not e!563544))))

(declare-datatypes ((array!63165 0))(
  ( (array!63166 (arr!30406 (Array (_ BitVec 32) (_ BitVec 64))) (size!30909 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63165)

(declare-datatypes ((List!21053 0))(
  ( (Nil!21050) (Cons!21049 (h!22226 (_ BitVec 64)) (t!30046 List!21053)) )
))
(declare-fun arrayNoDuplicates!0 (array!63165 (_ BitVec 32) List!21053) Bool)

(assert (=> b!999112 (= res!668345 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21050))))

(declare-fun b!999113 () Bool)

(declare-fun res!668351 () Bool)

(declare-fun e!563542 () Bool)

(assert (=> b!999113 (=> (not res!668351) (not e!563542))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999113 (= res!668351 (and (= (size!30909 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30909 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30909 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999114 () Bool)

(assert (=> b!999114 (= e!563544 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9274 0))(
  ( (MissingZero!9274 (index!39467 (_ BitVec 32))) (Found!9274 (index!39468 (_ BitVec 32))) (Intermediate!9274 (undefined!10086 Bool) (index!39469 (_ BitVec 32)) (x!87056 (_ BitVec 32))) (Undefined!9274) (MissingVacant!9274 (index!39470 (_ BitVec 32))) )
))
(declare-fun lt!442018 () SeekEntryResult!9274)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63165 (_ BitVec 32)) SeekEntryResult!9274)

(assert (=> b!999114 (= lt!442018 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30406 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999115 () Bool)

(declare-fun res!668343 () Bool)

(assert (=> b!999115 (=> (not res!668343) (not e!563544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63165 (_ BitVec 32)) Bool)

(assert (=> b!999115 (= res!668343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999116 () Bool)

(declare-fun res!668348 () Bool)

(assert (=> b!999116 (=> (not res!668348) (not e!563542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999116 (= res!668348 (validKeyInArray!0 (select (arr!30406 a!3219) j!170)))))

(declare-fun b!999118 () Bool)

(declare-fun res!668346 () Bool)

(assert (=> b!999118 (=> (not res!668346) (not e!563544))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999118 (= res!668346 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30909 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30909 a!3219))))))

(declare-fun b!999119 () Bool)

(declare-fun res!668342 () Bool)

(assert (=> b!999119 (=> (not res!668342) (not e!563542))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!999119 (= res!668342 (validKeyInArray!0 k0!2224))))

(declare-fun b!999120 () Bool)

(declare-fun res!668349 () Bool)

(assert (=> b!999120 (=> (not res!668349) (not e!563542))))

(declare-fun arrayContainsKey!0 (array!63165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999120 (= res!668349 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999121 () Bool)

(declare-fun res!668347 () Bool)

(assert (=> b!999121 (=> (not res!668347) (not e!563544))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999121 (= res!668347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30406 a!3219) j!170) mask!3464) (select (arr!30406 a!3219) j!170) a!3219 mask!3464) (Intermediate!9274 false resIndex!38 resX!38)))))

(declare-fun b!999117 () Bool)

(assert (=> b!999117 (= e!563542 e!563544)))

(declare-fun res!668350 () Bool)

(assert (=> b!999117 (=> (not res!668350) (not e!563544))))

(declare-fun lt!442019 () SeekEntryResult!9274)

(assert (=> b!999117 (= res!668350 (or (= lt!442019 (MissingVacant!9274 i!1194)) (= lt!442019 (MissingZero!9274 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63165 (_ BitVec 32)) SeekEntryResult!9274)

(assert (=> b!999117 (= lt!442019 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!668344 () Bool)

(assert (=> start!86392 (=> (not res!668344) (not e!563542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86392 (= res!668344 (validMask!0 mask!3464))))

(assert (=> start!86392 e!563542))

(declare-fun array_inv!23542 (array!63165) Bool)

(assert (=> start!86392 (array_inv!23542 a!3219)))

(assert (=> start!86392 true))

(assert (= (and start!86392 res!668344) b!999113))

(assert (= (and b!999113 res!668351) b!999116))

(assert (= (and b!999116 res!668348) b!999119))

(assert (= (and b!999119 res!668342) b!999120))

(assert (= (and b!999120 res!668349) b!999117))

(assert (= (and b!999117 res!668350) b!999115))

(assert (= (and b!999115 res!668343) b!999112))

(assert (= (and b!999112 res!668345) b!999118))

(assert (= (and b!999118 res!668346) b!999121))

(assert (= (and b!999121 res!668347) b!999114))

(declare-fun m!926111 () Bool)

(assert (=> b!999120 m!926111))

(declare-fun m!926113 () Bool)

(assert (=> start!86392 m!926113))

(declare-fun m!926115 () Bool)

(assert (=> start!86392 m!926115))

(declare-fun m!926117 () Bool)

(assert (=> b!999112 m!926117))

(declare-fun m!926119 () Bool)

(assert (=> b!999114 m!926119))

(assert (=> b!999114 m!926119))

(declare-fun m!926121 () Bool)

(assert (=> b!999114 m!926121))

(declare-fun m!926123 () Bool)

(assert (=> b!999117 m!926123))

(assert (=> b!999121 m!926119))

(assert (=> b!999121 m!926119))

(declare-fun m!926125 () Bool)

(assert (=> b!999121 m!926125))

(assert (=> b!999121 m!926125))

(assert (=> b!999121 m!926119))

(declare-fun m!926127 () Bool)

(assert (=> b!999121 m!926127))

(assert (=> b!999116 m!926119))

(assert (=> b!999116 m!926119))

(declare-fun m!926129 () Bool)

(assert (=> b!999116 m!926129))

(declare-fun m!926131 () Bool)

(assert (=> b!999115 m!926131))

(declare-fun m!926133 () Bool)

(assert (=> b!999119 m!926133))

(check-sat (not b!999114) (not b!999117) (not b!999116) (not b!999119) (not b!999115) (not b!999120) (not b!999112) (not start!86392) (not b!999121))
(check-sat)
