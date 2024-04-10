; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86880 () Bool)

(assert start!86880)

(declare-fun b!1007255 () Bool)

(declare-fun e!566908 () Bool)

(declare-fun e!566911 () Bool)

(assert (=> b!1007255 (= e!566908 e!566911)))

(declare-fun res!676152 () Bool)

(assert (=> b!1007255 (=> (not res!676152) (not e!566911))))

(declare-datatypes ((SeekEntryResult!9517 0))(
  ( (MissingZero!9517 (index!40439 (_ BitVec 32))) (Found!9517 (index!40440 (_ BitVec 32))) (Intermediate!9517 (undefined!10329 Bool) (index!40441 (_ BitVec 32)) (x!87835 (_ BitVec 32))) (Undefined!9517) (MissingVacant!9517 (index!40442 (_ BitVec 32))) )
))
(declare-fun lt!445109 () SeekEntryResult!9517)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007255 (= res!676152 (or (= lt!445109 (MissingVacant!9517 i!1194)) (= lt!445109 (MissingZero!9517 i!1194))))))

(declare-datatypes ((array!63528 0))(
  ( (array!63529 (arr!30585 (Array (_ BitVec 32) (_ BitVec 64))) (size!31087 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63528)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63528 (_ BitVec 32)) SeekEntryResult!9517)

(assert (=> b!1007255 (= lt!445109 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007256 () Bool)

(declare-fun res!676157 () Bool)

(assert (=> b!1007256 (=> (not res!676157) (not e!566908))))

(declare-fun arrayContainsKey!0 (array!63528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007256 (= res!676157 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007257 () Bool)

(declare-fun e!566907 () Bool)

(assert (=> b!1007257 (= e!566907 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445108 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007257 (= lt!445108 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007258 () Bool)

(declare-fun res!676156 () Bool)

(assert (=> b!1007258 (=> (not res!676156) (not e!566911))))

(declare-datatypes ((List!21261 0))(
  ( (Nil!21258) (Cons!21257 (h!22443 (_ BitVec 64)) (t!30262 List!21261)) )
))
(declare-fun arrayNoDuplicates!0 (array!63528 (_ BitVec 32) List!21261) Bool)

(assert (=> b!1007258 (= res!676156 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21258))))

(declare-fun b!1007259 () Bool)

(declare-fun res!676154 () Bool)

(assert (=> b!1007259 (=> (not res!676154) (not e!566911))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007259 (= res!676154 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31087 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31087 a!3219))))))

(declare-fun b!1007260 () Bool)

(declare-fun res!676161 () Bool)

(assert (=> b!1007260 (=> (not res!676161) (not e!566908))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1007260 (= res!676161 (and (= (size!31087 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31087 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31087 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007261 () Bool)

(declare-fun res!676158 () Bool)

(assert (=> b!1007261 (=> (not res!676158) (not e!566907))))

(declare-fun lt!445107 () (_ BitVec 64))

(declare-fun lt!445112 () SeekEntryResult!9517)

(declare-fun lt!445110 () array!63528)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63528 (_ BitVec 32)) SeekEntryResult!9517)

(assert (=> b!1007261 (= res!676158 (not (= lt!445112 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445107 lt!445110 mask!3464))))))

(declare-fun b!1007262 () Bool)

(declare-fun res!676149 () Bool)

(assert (=> b!1007262 (=> (not res!676149) (not e!566907))))

(assert (=> b!1007262 (= res!676149 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007263 () Bool)

(declare-fun e!566909 () Bool)

(declare-fun e!566910 () Bool)

(assert (=> b!1007263 (= e!566909 e!566910)))

(declare-fun res!676148 () Bool)

(assert (=> b!1007263 (=> (not res!676148) (not e!566910))))

(declare-fun lt!445111 () SeekEntryResult!9517)

(assert (=> b!1007263 (= res!676148 (= lt!445112 lt!445111))))

(assert (=> b!1007263 (= lt!445112 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30585 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!676155 () Bool)

(assert (=> start!86880 (=> (not res!676155) (not e!566908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86880 (= res!676155 (validMask!0 mask!3464))))

(assert (=> start!86880 e!566908))

(declare-fun array_inv!23709 (array!63528) Bool)

(assert (=> start!86880 (array_inv!23709 a!3219)))

(assert (=> start!86880 true))

(declare-fun b!1007264 () Bool)

(assert (=> b!1007264 (= e!566911 e!566909)))

(declare-fun res!676159 () Bool)

(assert (=> b!1007264 (=> (not res!676159) (not e!566909))))

(declare-fun lt!445106 () SeekEntryResult!9517)

(assert (=> b!1007264 (= res!676159 (= lt!445106 lt!445111))))

(assert (=> b!1007264 (= lt!445111 (Intermediate!9517 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007264 (= lt!445106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30585 a!3219) j!170) mask!3464) (select (arr!30585 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007265 () Bool)

(declare-fun res!676153 () Bool)

(assert (=> b!1007265 (=> (not res!676153) (not e!566911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63528 (_ BitVec 32)) Bool)

(assert (=> b!1007265 (= res!676153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007266 () Bool)

(declare-fun res!676151 () Bool)

(assert (=> b!1007266 (=> (not res!676151) (not e!566908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007266 (= res!676151 (validKeyInArray!0 (select (arr!30585 a!3219) j!170)))))

(declare-fun b!1007267 () Bool)

(assert (=> b!1007267 (= e!566910 e!566907)))

(declare-fun res!676160 () Bool)

(assert (=> b!1007267 (=> (not res!676160) (not e!566907))))

(assert (=> b!1007267 (= res!676160 (not (= lt!445106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445107 mask!3464) lt!445107 lt!445110 mask!3464))))))

(assert (=> b!1007267 (= lt!445107 (select (store (arr!30585 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007267 (= lt!445110 (array!63529 (store (arr!30585 a!3219) i!1194 k!2224) (size!31087 a!3219)))))

(declare-fun b!1007268 () Bool)

(declare-fun res!676150 () Bool)

(assert (=> b!1007268 (=> (not res!676150) (not e!566908))))

(assert (=> b!1007268 (= res!676150 (validKeyInArray!0 k!2224))))

(assert (= (and start!86880 res!676155) b!1007260))

(assert (= (and b!1007260 res!676161) b!1007266))

(assert (= (and b!1007266 res!676151) b!1007268))

(assert (= (and b!1007268 res!676150) b!1007256))

(assert (= (and b!1007256 res!676157) b!1007255))

(assert (= (and b!1007255 res!676152) b!1007265))

(assert (= (and b!1007265 res!676153) b!1007258))

(assert (= (and b!1007258 res!676156) b!1007259))

(assert (= (and b!1007259 res!676154) b!1007264))

(assert (= (and b!1007264 res!676159) b!1007263))

(assert (= (and b!1007263 res!676148) b!1007267))

(assert (= (and b!1007267 res!676160) b!1007261))

(assert (= (and b!1007261 res!676158) b!1007262))

(assert (= (and b!1007262 res!676149) b!1007257))

(declare-fun m!932171 () Bool)

(assert (=> b!1007266 m!932171))

(assert (=> b!1007266 m!932171))

(declare-fun m!932173 () Bool)

(assert (=> b!1007266 m!932173))

(declare-fun m!932175 () Bool)

(assert (=> b!1007265 m!932175))

(declare-fun m!932177 () Bool)

(assert (=> b!1007256 m!932177))

(declare-fun m!932179 () Bool)

(assert (=> start!86880 m!932179))

(declare-fun m!932181 () Bool)

(assert (=> start!86880 m!932181))

(declare-fun m!932183 () Bool)

(assert (=> b!1007255 m!932183))

(declare-fun m!932185 () Bool)

(assert (=> b!1007267 m!932185))

(assert (=> b!1007267 m!932185))

(declare-fun m!932187 () Bool)

(assert (=> b!1007267 m!932187))

(declare-fun m!932189 () Bool)

(assert (=> b!1007267 m!932189))

(declare-fun m!932191 () Bool)

(assert (=> b!1007267 m!932191))

(assert (=> b!1007263 m!932171))

(assert (=> b!1007263 m!932171))

(declare-fun m!932193 () Bool)

(assert (=> b!1007263 m!932193))

(declare-fun m!932195 () Bool)

(assert (=> b!1007261 m!932195))

(assert (=> b!1007264 m!932171))

(assert (=> b!1007264 m!932171))

(declare-fun m!932197 () Bool)

(assert (=> b!1007264 m!932197))

(assert (=> b!1007264 m!932197))

(assert (=> b!1007264 m!932171))

(declare-fun m!932199 () Bool)

(assert (=> b!1007264 m!932199))

(declare-fun m!932201 () Bool)

(assert (=> b!1007258 m!932201))

(declare-fun m!932203 () Bool)

(assert (=> b!1007257 m!932203))

(declare-fun m!932205 () Bool)

(assert (=> b!1007268 m!932205))

(push 1)

