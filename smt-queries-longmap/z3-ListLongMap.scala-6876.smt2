; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86512 () Bool)

(assert start!86512)

(declare-fun b!1002237 () Bool)

(declare-fun res!671722 () Bool)

(declare-fun e!564644 () Bool)

(assert (=> b!1002237 (=> (not res!671722) (not e!564644))))

(declare-datatypes ((array!63313 0))(
  ( (array!63314 (arr!30482 (Array (_ BitVec 32) (_ BitVec 64))) (size!30984 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63313)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002237 (= res!671722 (and (= (size!30984 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30984 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30984 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002238 () Bool)

(declare-fun e!564647 () Bool)

(assert (=> b!1002238 (= e!564644 e!564647)))

(declare-fun res!671715 () Bool)

(assert (=> b!1002238 (=> (not res!671715) (not e!564647))))

(declare-datatypes ((SeekEntryResult!9414 0))(
  ( (MissingZero!9414 (index!40027 (_ BitVec 32))) (Found!9414 (index!40028 (_ BitVec 32))) (Intermediate!9414 (undefined!10226 Bool) (index!40029 (_ BitVec 32)) (x!87442 (_ BitVec 32))) (Undefined!9414) (MissingVacant!9414 (index!40030 (_ BitVec 32))) )
))
(declare-fun lt!443076 () SeekEntryResult!9414)

(assert (=> b!1002238 (= res!671715 (or (= lt!443076 (MissingVacant!9414 i!1194)) (= lt!443076 (MissingZero!9414 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63313 (_ BitVec 32)) SeekEntryResult!9414)

(assert (=> b!1002238 (= lt!443076 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002239 () Bool)

(declare-fun res!671726 () Bool)

(assert (=> b!1002239 (=> (not res!671726) (not e!564644))))

(declare-fun arrayContainsKey!0 (array!63313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002239 (= res!671726 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002240 () Bool)

(declare-fun res!671719 () Bool)

(assert (=> b!1002240 (=> (not res!671719) (not e!564644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002240 (= res!671719 (validKeyInArray!0 (select (arr!30482 a!3219) j!170)))))

(declare-fun b!1002241 () Bool)

(declare-fun res!671724 () Bool)

(declare-fun e!564643 () Bool)

(assert (=> b!1002241 (=> (not res!671724) (not e!564643))))

(declare-fun lt!443074 () (_ BitVec 32))

(declare-fun lt!443080 () SeekEntryResult!9414)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63313 (_ BitVec 32)) SeekEntryResult!9414)

(assert (=> b!1002241 (= res!671724 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443074 (select (arr!30482 a!3219) j!170) a!3219 mask!3464) lt!443080))))

(declare-fun b!1002242 () Bool)

(declare-fun res!671730 () Bool)

(assert (=> b!1002242 (=> (not res!671730) (not e!564647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63313 (_ BitVec 32)) Bool)

(assert (=> b!1002242 (= res!671730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1002243 () Bool)

(declare-fun e!564645 () Bool)

(declare-fun e!564649 () Bool)

(assert (=> b!1002243 (= e!564645 e!564649)))

(declare-fun res!671718 () Bool)

(assert (=> b!1002243 (=> (not res!671718) (not e!564649))))

(declare-fun lt!443077 () SeekEntryResult!9414)

(assert (=> b!1002243 (= res!671718 (= lt!443077 lt!443080))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1002243 (= lt!443077 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30482 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002244 () Bool)

(declare-fun e!564648 () Bool)

(assert (=> b!1002244 (= e!564649 e!564648)))

(declare-fun res!671723 () Bool)

(assert (=> b!1002244 (=> (not res!671723) (not e!564648))))

(declare-fun lt!443081 () array!63313)

(declare-fun lt!443075 () SeekEntryResult!9414)

(declare-fun lt!443078 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002244 (= res!671723 (not (= lt!443075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443078 mask!3464) lt!443078 lt!443081 mask!3464))))))

(assert (=> b!1002244 (= lt!443078 (select (store (arr!30482 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002244 (= lt!443081 (array!63314 (store (arr!30482 a!3219) i!1194 k0!2224) (size!30984 a!3219)))))

(declare-fun b!1002245 () Bool)

(assert (=> b!1002245 (= e!564643 false)))

(declare-fun lt!443079 () SeekEntryResult!9414)

(assert (=> b!1002245 (= lt!443079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443074 lt!443078 lt!443081 mask!3464))))

(declare-fun b!1002246 () Bool)

(declare-fun res!671721 () Bool)

(assert (=> b!1002246 (=> (not res!671721) (not e!564647))))

(declare-datatypes ((List!21158 0))(
  ( (Nil!21155) (Cons!21154 (h!22331 (_ BitVec 64)) (t!30159 List!21158)) )
))
(declare-fun arrayNoDuplicates!0 (array!63313 (_ BitVec 32) List!21158) Bool)

(assert (=> b!1002246 (= res!671721 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21155))))

(declare-fun b!1002247 () Bool)

(declare-fun res!671728 () Bool)

(assert (=> b!1002247 (=> (not res!671728) (not e!564648))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002247 (= res!671728 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002249 () Bool)

(declare-fun res!671725 () Bool)

(assert (=> b!1002249 (=> (not res!671725) (not e!564644))))

(assert (=> b!1002249 (= res!671725 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002250 () Bool)

(assert (=> b!1002250 (= e!564648 e!564643)))

(declare-fun res!671716 () Bool)

(assert (=> b!1002250 (=> (not res!671716) (not e!564643))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1002250 (= res!671716 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443074 #b00000000000000000000000000000000) (bvslt lt!443074 (size!30984 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002250 (= lt!443074 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002248 () Bool)

(declare-fun res!671727 () Bool)

(assert (=> b!1002248 (=> (not res!671727) (not e!564647))))

(assert (=> b!1002248 (= res!671727 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30984 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30984 a!3219))))))

(declare-fun res!671717 () Bool)

(assert (=> start!86512 (=> (not res!671717) (not e!564644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86512 (= res!671717 (validMask!0 mask!3464))))

(assert (=> start!86512 e!564644))

(declare-fun array_inv!23606 (array!63313) Bool)

(assert (=> start!86512 (array_inv!23606 a!3219)))

(assert (=> start!86512 true))

(declare-fun b!1002251 () Bool)

(declare-fun res!671720 () Bool)

(assert (=> b!1002251 (=> (not res!671720) (not e!564648))))

(assert (=> b!1002251 (= res!671720 (not (= lt!443077 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443078 lt!443081 mask!3464))))))

(declare-fun b!1002252 () Bool)

(assert (=> b!1002252 (= e!564647 e!564645)))

(declare-fun res!671729 () Bool)

(assert (=> b!1002252 (=> (not res!671729) (not e!564645))))

(assert (=> b!1002252 (= res!671729 (= lt!443075 lt!443080))))

(assert (=> b!1002252 (= lt!443080 (Intermediate!9414 false resIndex!38 resX!38))))

(assert (=> b!1002252 (= lt!443075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30482 a!3219) j!170) mask!3464) (select (arr!30482 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86512 res!671717) b!1002237))

(assert (= (and b!1002237 res!671722) b!1002240))

(assert (= (and b!1002240 res!671719) b!1002249))

(assert (= (and b!1002249 res!671725) b!1002239))

(assert (= (and b!1002239 res!671726) b!1002238))

(assert (= (and b!1002238 res!671715) b!1002242))

(assert (= (and b!1002242 res!671730) b!1002246))

(assert (= (and b!1002246 res!671721) b!1002248))

(assert (= (and b!1002248 res!671727) b!1002252))

(assert (= (and b!1002252 res!671729) b!1002243))

(assert (= (and b!1002243 res!671718) b!1002244))

(assert (= (and b!1002244 res!671723) b!1002251))

(assert (= (and b!1002251 res!671720) b!1002247))

(assert (= (and b!1002247 res!671728) b!1002250))

(assert (= (and b!1002250 res!671716) b!1002241))

(assert (= (and b!1002241 res!671724) b!1002245))

(declare-fun m!928149 () Bool)

(assert (=> b!1002249 m!928149))

(declare-fun m!928151 () Bool)

(assert (=> b!1002245 m!928151))

(declare-fun m!928153 () Bool)

(assert (=> b!1002240 m!928153))

(assert (=> b!1002240 m!928153))

(declare-fun m!928155 () Bool)

(assert (=> b!1002240 m!928155))

(assert (=> b!1002243 m!928153))

(assert (=> b!1002243 m!928153))

(declare-fun m!928157 () Bool)

(assert (=> b!1002243 m!928157))

(assert (=> b!1002252 m!928153))

(assert (=> b!1002252 m!928153))

(declare-fun m!928159 () Bool)

(assert (=> b!1002252 m!928159))

(assert (=> b!1002252 m!928159))

(assert (=> b!1002252 m!928153))

(declare-fun m!928161 () Bool)

(assert (=> b!1002252 m!928161))

(assert (=> b!1002241 m!928153))

(assert (=> b!1002241 m!928153))

(declare-fun m!928163 () Bool)

(assert (=> b!1002241 m!928163))

(declare-fun m!928165 () Bool)

(assert (=> b!1002250 m!928165))

(declare-fun m!928167 () Bool)

(assert (=> b!1002251 m!928167))

(declare-fun m!928169 () Bool)

(assert (=> b!1002244 m!928169))

(assert (=> b!1002244 m!928169))

(declare-fun m!928171 () Bool)

(assert (=> b!1002244 m!928171))

(declare-fun m!928173 () Bool)

(assert (=> b!1002244 m!928173))

(declare-fun m!928175 () Bool)

(assert (=> b!1002244 m!928175))

(declare-fun m!928177 () Bool)

(assert (=> b!1002246 m!928177))

(declare-fun m!928179 () Bool)

(assert (=> b!1002239 m!928179))

(declare-fun m!928181 () Bool)

(assert (=> start!86512 m!928181))

(declare-fun m!928183 () Bool)

(assert (=> start!86512 m!928183))

(declare-fun m!928185 () Bool)

(assert (=> b!1002238 m!928185))

(declare-fun m!928187 () Bool)

(assert (=> b!1002242 m!928187))

(check-sat (not b!1002240) (not start!86512) (not b!1002239) (not b!1002250) (not b!1002243) (not b!1002245) (not b!1002251) (not b!1002252) (not b!1002244) (not b!1002238) (not b!1002242) (not b!1002249) (not b!1002241) (not b!1002246))
(check-sat)
