; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86770 () Bool)

(assert start!86770)

(declare-fun b!1004155 () Bool)

(declare-fun res!672873 () Bool)

(declare-fun e!565743 () Bool)

(assert (=> b!1004155 (=> (not res!672873) (not e!565743))))

(declare-datatypes ((array!63390 0))(
  ( (array!63391 (arr!30514 (Array (_ BitVec 32) (_ BitVec 64))) (size!31017 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63390)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004155 (= res!672873 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31017 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31017 a!3219))))))

(declare-fun b!1004156 () Bool)

(declare-fun res!672883 () Bool)

(declare-fun e!565745 () Bool)

(assert (=> b!1004156 (=> (not res!672883) (not e!565745))))

(declare-datatypes ((SeekEntryResult!9382 0))(
  ( (MissingZero!9382 (index!39899 (_ BitVec 32))) (Found!9382 (index!39900 (_ BitVec 32))) (Intermediate!9382 (undefined!10194 Bool) (index!39901 (_ BitVec 32)) (x!87470 (_ BitVec 32))) (Undefined!9382) (MissingVacant!9382 (index!39902 (_ BitVec 32))) )
))
(declare-fun lt!443890 () SeekEntryResult!9382)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!443896 () (_ BitVec 64))

(declare-fun lt!443893 () array!63390)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63390 (_ BitVec 32)) SeekEntryResult!9382)

(assert (=> b!1004156 (= res!672883 (not (= lt!443890 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443896 lt!443893 mask!3464))))))

(declare-fun b!1004157 () Bool)

(declare-fun e!565746 () Bool)

(assert (=> b!1004157 (= e!565746 e!565743)))

(declare-fun res!672876 () Bool)

(assert (=> b!1004157 (=> (not res!672876) (not e!565743))))

(declare-fun lt!443895 () SeekEntryResult!9382)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004157 (= res!672876 (or (= lt!443895 (MissingVacant!9382 i!1194)) (= lt!443895 (MissingZero!9382 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63390 (_ BitVec 32)) SeekEntryResult!9382)

(assert (=> b!1004157 (= lt!443895 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!672886 () Bool)

(assert (=> start!86770 (=> (not res!672886) (not e!565746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86770 (= res!672886 (validMask!0 mask!3464))))

(assert (=> start!86770 e!565746))

(declare-fun array_inv!23650 (array!63390) Bool)

(assert (=> start!86770 (array_inv!23650 a!3219)))

(assert (=> start!86770 true))

(declare-fun b!1004158 () Bool)

(declare-fun res!672875 () Bool)

(assert (=> b!1004158 (=> (not res!672875) (not e!565746))))

(declare-fun arrayContainsKey!0 (array!63390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004158 (= res!672875 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004159 () Bool)

(declare-fun res!672882 () Bool)

(declare-fun e!565742 () Bool)

(assert (=> b!1004159 (=> (not res!672882) (not e!565742))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!443891 () (_ BitVec 32))

(declare-fun lt!443897 () SeekEntryResult!9382)

(assert (=> b!1004159 (= res!672882 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443891 (select (arr!30514 a!3219) j!170) a!3219 mask!3464) lt!443897))))

(declare-fun b!1004160 () Bool)

(declare-fun res!672880 () Bool)

(assert (=> b!1004160 (=> (not res!672880) (not e!565743))))

(declare-datatypes ((List!21161 0))(
  ( (Nil!21158) (Cons!21157 (h!22343 (_ BitVec 64)) (t!30154 List!21161)) )
))
(declare-fun arrayNoDuplicates!0 (array!63390 (_ BitVec 32) List!21161) Bool)

(assert (=> b!1004160 (= res!672880 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21158))))

(declare-fun b!1004161 () Bool)

(declare-fun e!565744 () Bool)

(assert (=> b!1004161 (= e!565743 e!565744)))

(declare-fun res!672877 () Bool)

(assert (=> b!1004161 (=> (not res!672877) (not e!565744))))

(declare-fun lt!443892 () SeekEntryResult!9382)

(assert (=> b!1004161 (= res!672877 (= lt!443892 lt!443897))))

(assert (=> b!1004161 (= lt!443897 (Intermediate!9382 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004161 (= lt!443892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30514 a!3219) j!170) mask!3464) (select (arr!30514 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004162 () Bool)

(declare-fun res!672879 () Bool)

(assert (=> b!1004162 (=> (not res!672879) (not e!565746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004162 (= res!672879 (validKeyInArray!0 (select (arr!30514 a!3219) j!170)))))

(declare-fun b!1004163 () Bool)

(declare-fun res!672878 () Bool)

(assert (=> b!1004163 (=> (not res!672878) (not e!565746))))

(assert (=> b!1004163 (= res!672878 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004164 () Bool)

(declare-fun res!672872 () Bool)

(assert (=> b!1004164 (=> (not res!672872) (not e!565746))))

(assert (=> b!1004164 (= res!672872 (and (= (size!31017 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31017 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31017 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004165 () Bool)

(assert (=> b!1004165 (= e!565742 false)))

(declare-fun lt!443894 () SeekEntryResult!9382)

(assert (=> b!1004165 (= lt!443894 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443891 lt!443896 lt!443893 mask!3464))))

(declare-fun b!1004166 () Bool)

(declare-fun res!672874 () Bool)

(assert (=> b!1004166 (=> (not res!672874) (not e!565745))))

(assert (=> b!1004166 (= res!672874 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004167 () Bool)

(declare-fun e!565741 () Bool)

(assert (=> b!1004167 (= e!565744 e!565741)))

(declare-fun res!672887 () Bool)

(assert (=> b!1004167 (=> (not res!672887) (not e!565741))))

(assert (=> b!1004167 (= res!672887 (= lt!443890 lt!443897))))

(assert (=> b!1004167 (= lt!443890 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30514 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004168 () Bool)

(assert (=> b!1004168 (= e!565741 e!565745)))

(declare-fun res!672881 () Bool)

(assert (=> b!1004168 (=> (not res!672881) (not e!565745))))

(assert (=> b!1004168 (= res!672881 (not (= lt!443892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443896 mask!3464) lt!443896 lt!443893 mask!3464))))))

(assert (=> b!1004168 (= lt!443896 (select (store (arr!30514 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004168 (= lt!443893 (array!63391 (store (arr!30514 a!3219) i!1194 k0!2224) (size!31017 a!3219)))))

(declare-fun b!1004169 () Bool)

(declare-fun res!672884 () Bool)

(assert (=> b!1004169 (=> (not res!672884) (not e!565743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63390 (_ BitVec 32)) Bool)

(assert (=> b!1004169 (= res!672884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004170 () Bool)

(assert (=> b!1004170 (= e!565745 e!565742)))

(declare-fun res!672885 () Bool)

(assert (=> b!1004170 (=> (not res!672885) (not e!565742))))

(assert (=> b!1004170 (= res!672885 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443891 #b00000000000000000000000000000000) (bvslt lt!443891 (size!31017 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004170 (= lt!443891 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(assert (= (and start!86770 res!672886) b!1004164))

(assert (= (and b!1004164 res!672872) b!1004162))

(assert (= (and b!1004162 res!672879) b!1004163))

(assert (= (and b!1004163 res!672878) b!1004158))

(assert (= (and b!1004158 res!672875) b!1004157))

(assert (= (and b!1004157 res!672876) b!1004169))

(assert (= (and b!1004169 res!672884) b!1004160))

(assert (= (and b!1004160 res!672880) b!1004155))

(assert (= (and b!1004155 res!672873) b!1004161))

(assert (= (and b!1004161 res!672877) b!1004167))

(assert (= (and b!1004167 res!672887) b!1004168))

(assert (= (and b!1004168 res!672881) b!1004156))

(assert (= (and b!1004156 res!672883) b!1004166))

(assert (= (and b!1004166 res!672874) b!1004170))

(assert (= (and b!1004170 res!672885) b!1004159))

(assert (= (and b!1004159 res!672882) b!1004165))

(declare-fun m!930233 () Bool)

(assert (=> b!1004165 m!930233))

(declare-fun m!930235 () Bool)

(assert (=> b!1004158 m!930235))

(declare-fun m!930237 () Bool)

(assert (=> b!1004157 m!930237))

(declare-fun m!930239 () Bool)

(assert (=> b!1004163 m!930239))

(declare-fun m!930241 () Bool)

(assert (=> b!1004159 m!930241))

(assert (=> b!1004159 m!930241))

(declare-fun m!930243 () Bool)

(assert (=> b!1004159 m!930243))

(assert (=> b!1004167 m!930241))

(assert (=> b!1004167 m!930241))

(declare-fun m!930245 () Bool)

(assert (=> b!1004167 m!930245))

(declare-fun m!930247 () Bool)

(assert (=> b!1004160 m!930247))

(declare-fun m!930249 () Bool)

(assert (=> b!1004168 m!930249))

(assert (=> b!1004168 m!930249))

(declare-fun m!930251 () Bool)

(assert (=> b!1004168 m!930251))

(declare-fun m!930253 () Bool)

(assert (=> b!1004168 m!930253))

(declare-fun m!930255 () Bool)

(assert (=> b!1004168 m!930255))

(assert (=> b!1004161 m!930241))

(assert (=> b!1004161 m!930241))

(declare-fun m!930257 () Bool)

(assert (=> b!1004161 m!930257))

(assert (=> b!1004161 m!930257))

(assert (=> b!1004161 m!930241))

(declare-fun m!930259 () Bool)

(assert (=> b!1004161 m!930259))

(assert (=> b!1004162 m!930241))

(assert (=> b!1004162 m!930241))

(declare-fun m!930261 () Bool)

(assert (=> b!1004162 m!930261))

(declare-fun m!930263 () Bool)

(assert (=> b!1004156 m!930263))

(declare-fun m!930265 () Bool)

(assert (=> b!1004169 m!930265))

(declare-fun m!930267 () Bool)

(assert (=> start!86770 m!930267))

(declare-fun m!930269 () Bool)

(assert (=> start!86770 m!930269))

(declare-fun m!930271 () Bool)

(assert (=> b!1004170 m!930271))

(check-sat (not b!1004163) (not b!1004157) (not b!1004160) (not b!1004170) (not b!1004162) (not b!1004156) (not b!1004165) (not b!1004168) (not start!86770) (not b!1004167) (not b!1004159) (not b!1004161) (not b!1004169) (not b!1004158))
(check-sat)
