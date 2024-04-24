; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87142 () Bool)

(assert start!87142)

(declare-fun b!1009173 () Bool)

(declare-fun res!677306 () Bool)

(declare-fun e!567998 () Bool)

(assert (=> b!1009173 (=> (not res!677306) (not e!567998))))

(declare-datatypes ((array!63609 0))(
  ( (array!63610 (arr!30619 (Array (_ BitVec 32) (_ BitVec 64))) (size!31122 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63609)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009173 (= res!677306 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009174 () Bool)

(declare-fun res!677315 () Bool)

(assert (=> b!1009174 (=> (not res!677315) (not e!567998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009174 (= res!677315 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009175 () Bool)

(declare-fun e!567997 () Bool)

(declare-fun e!568001 () Bool)

(assert (=> b!1009175 (= e!567997 e!568001)))

(declare-fun res!677305 () Bool)

(assert (=> b!1009175 (=> (not res!677305) (not e!568001))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!445928 () array!63609)

(declare-datatypes ((SeekEntryResult!9487 0))(
  ( (MissingZero!9487 (index!40319 (_ BitVec 32))) (Found!9487 (index!40320 (_ BitVec 32))) (Intermediate!9487 (undefined!10299 Bool) (index!40321 (_ BitVec 32)) (x!87873 (_ BitVec 32))) (Undefined!9487) (MissingVacant!9487 (index!40322 (_ BitVec 32))) )
))
(declare-fun lt!445923 () SeekEntryResult!9487)

(declare-fun lt!445925 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63609 (_ BitVec 32)) SeekEntryResult!9487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009175 (= res!677305 (not (= lt!445923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445925 mask!3464) lt!445925 lt!445928 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009175 (= lt!445925 (select (store (arr!30619 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009175 (= lt!445928 (array!63610 (store (arr!30619 a!3219) i!1194 k0!2224) (size!31122 a!3219)))))

(declare-fun b!1009177 () Bool)

(declare-fun res!677308 () Bool)

(assert (=> b!1009177 (=> (not res!677308) (not e!568001))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009177 (= res!677308 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009178 () Bool)

(assert (=> b!1009178 (= e!568001 false)))

(declare-fun lt!445926 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009178 (= lt!445926 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009179 () Bool)

(declare-fun res!677317 () Bool)

(declare-fun e!568002 () Bool)

(assert (=> b!1009179 (=> (not res!677317) (not e!568002))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009179 (= res!677317 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31122 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31122 a!3219))))))

(declare-fun b!1009180 () Bool)

(declare-fun res!677311 () Bool)

(assert (=> b!1009180 (=> (not res!677311) (not e!568002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63609 (_ BitVec 32)) Bool)

(assert (=> b!1009180 (= res!677311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009181 () Bool)

(declare-fun res!677318 () Bool)

(assert (=> b!1009181 (=> (not res!677318) (not e!568002))))

(declare-datatypes ((List!21266 0))(
  ( (Nil!21263) (Cons!21262 (h!22457 (_ BitVec 64)) (t!30259 List!21266)) )
))
(declare-fun arrayNoDuplicates!0 (array!63609 (_ BitVec 32) List!21266) Bool)

(assert (=> b!1009181 (= res!677318 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21263))))

(declare-fun b!1009182 () Bool)

(declare-fun e!567999 () Bool)

(assert (=> b!1009182 (= e!567999 e!567997)))

(declare-fun res!677312 () Bool)

(assert (=> b!1009182 (=> (not res!677312) (not e!567997))))

(declare-fun lt!445927 () SeekEntryResult!9487)

(declare-fun lt!445924 () SeekEntryResult!9487)

(assert (=> b!1009182 (= res!677312 (= lt!445927 lt!445924))))

(assert (=> b!1009182 (= lt!445927 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30619 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!677314 () Bool)

(assert (=> start!87142 (=> (not res!677314) (not e!567998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87142 (= res!677314 (validMask!0 mask!3464))))

(assert (=> start!87142 e!567998))

(declare-fun array_inv!23755 (array!63609) Bool)

(assert (=> start!87142 (array_inv!23755 a!3219)))

(assert (=> start!87142 true))

(declare-fun b!1009176 () Bool)

(assert (=> b!1009176 (= e!567998 e!568002)))

(declare-fun res!677309 () Bool)

(assert (=> b!1009176 (=> (not res!677309) (not e!568002))))

(declare-fun lt!445922 () SeekEntryResult!9487)

(assert (=> b!1009176 (= res!677309 (or (= lt!445922 (MissingVacant!9487 i!1194)) (= lt!445922 (MissingZero!9487 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63609 (_ BitVec 32)) SeekEntryResult!9487)

(assert (=> b!1009176 (= lt!445922 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009183 () Bool)

(declare-fun res!677310 () Bool)

(assert (=> b!1009183 (=> (not res!677310) (not e!567998))))

(assert (=> b!1009183 (= res!677310 (and (= (size!31122 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31122 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31122 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009184 () Bool)

(assert (=> b!1009184 (= e!568002 e!567999)))

(declare-fun res!677313 () Bool)

(assert (=> b!1009184 (=> (not res!677313) (not e!567999))))

(assert (=> b!1009184 (= res!677313 (= lt!445923 lt!445924))))

(assert (=> b!1009184 (= lt!445924 (Intermediate!9487 false resIndex!38 resX!38))))

(assert (=> b!1009184 (= lt!445923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30619 a!3219) j!170) mask!3464) (select (arr!30619 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009185 () Bool)

(declare-fun res!677307 () Bool)

(assert (=> b!1009185 (=> (not res!677307) (not e!567998))))

(assert (=> b!1009185 (= res!677307 (validKeyInArray!0 (select (arr!30619 a!3219) j!170)))))

(declare-fun b!1009186 () Bool)

(declare-fun res!677316 () Bool)

(assert (=> b!1009186 (=> (not res!677316) (not e!568001))))

(assert (=> b!1009186 (= res!677316 (not (= lt!445927 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445925 lt!445928 mask!3464))))))

(assert (= (and start!87142 res!677314) b!1009183))

(assert (= (and b!1009183 res!677310) b!1009185))

(assert (= (and b!1009185 res!677307) b!1009174))

(assert (= (and b!1009174 res!677315) b!1009173))

(assert (= (and b!1009173 res!677306) b!1009176))

(assert (= (and b!1009176 res!677309) b!1009180))

(assert (= (and b!1009180 res!677311) b!1009181))

(assert (= (and b!1009181 res!677318) b!1009179))

(assert (= (and b!1009179 res!677317) b!1009184))

(assert (= (and b!1009184 res!677313) b!1009182))

(assert (= (and b!1009182 res!677312) b!1009175))

(assert (= (and b!1009175 res!677305) b!1009186))

(assert (= (and b!1009186 res!677316) b!1009177))

(assert (= (and b!1009177 res!677308) b!1009178))

(declare-fun m!934271 () Bool)

(assert (=> b!1009186 m!934271))

(declare-fun m!934273 () Bool)

(assert (=> b!1009180 m!934273))

(declare-fun m!934275 () Bool)

(assert (=> b!1009174 m!934275))

(declare-fun m!934277 () Bool)

(assert (=> b!1009182 m!934277))

(assert (=> b!1009182 m!934277))

(declare-fun m!934279 () Bool)

(assert (=> b!1009182 m!934279))

(declare-fun m!934281 () Bool)

(assert (=> start!87142 m!934281))

(declare-fun m!934283 () Bool)

(assert (=> start!87142 m!934283))

(assert (=> b!1009185 m!934277))

(assert (=> b!1009185 m!934277))

(declare-fun m!934285 () Bool)

(assert (=> b!1009185 m!934285))

(declare-fun m!934287 () Bool)

(assert (=> b!1009173 m!934287))

(assert (=> b!1009184 m!934277))

(assert (=> b!1009184 m!934277))

(declare-fun m!934289 () Bool)

(assert (=> b!1009184 m!934289))

(assert (=> b!1009184 m!934289))

(assert (=> b!1009184 m!934277))

(declare-fun m!934291 () Bool)

(assert (=> b!1009184 m!934291))

(declare-fun m!934293 () Bool)

(assert (=> b!1009176 m!934293))

(declare-fun m!934295 () Bool)

(assert (=> b!1009181 m!934295))

(declare-fun m!934297 () Bool)

(assert (=> b!1009178 m!934297))

(declare-fun m!934299 () Bool)

(assert (=> b!1009175 m!934299))

(assert (=> b!1009175 m!934299))

(declare-fun m!934301 () Bool)

(assert (=> b!1009175 m!934301))

(declare-fun m!934303 () Bool)

(assert (=> b!1009175 m!934303))

(declare-fun m!934305 () Bool)

(assert (=> b!1009175 m!934305))

(check-sat (not b!1009181) (not b!1009182) (not b!1009184) (not b!1009176) (not b!1009180) (not b!1009185) (not b!1009186) (not b!1009175) (not b!1009173) (not b!1009174) (not b!1009178) (not start!87142))
(check-sat)
