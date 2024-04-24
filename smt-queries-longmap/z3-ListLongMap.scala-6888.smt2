; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86812 () Bool)

(assert start!86812)

(declare-fun b!1005163 () Bool)

(declare-fun res!673884 () Bool)

(declare-fun e!566187 () Bool)

(assert (=> b!1005163 (=> (not res!673884) (not e!566187))))

(declare-datatypes ((array!63432 0))(
  ( (array!63433 (arr!30535 (Array (_ BitVec 32) (_ BitVec 64))) (size!31038 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63432)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005163 (= res!673884 (and (= (size!31038 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31038 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31038 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005164 () Bool)

(declare-fun res!673887 () Bool)

(declare-fun e!566185 () Bool)

(assert (=> b!1005164 (=> (not res!673887) (not e!566185))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005164 (= res!673887 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31038 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31038 a!3219))))))

(declare-fun b!1005165 () Bool)

(declare-fun res!673888 () Bool)

(declare-fun e!566184 () Bool)

(assert (=> b!1005165 (=> (not res!673888) (not e!566184))))

(declare-fun lt!444397 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9403 0))(
  ( (MissingZero!9403 (index!39983 (_ BitVec 32))) (Found!9403 (index!39984 (_ BitVec 32))) (Intermediate!9403 (undefined!10215 Bool) (index!39985 (_ BitVec 32)) (x!87547 (_ BitVec 32))) (Undefined!9403) (MissingVacant!9403 (index!39986 (_ BitVec 32))) )
))
(declare-fun lt!444396 () SeekEntryResult!9403)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63432 (_ BitVec 32)) SeekEntryResult!9403)

(assert (=> b!1005165 (= res!673888 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444397 (select (arr!30535 a!3219) j!170) a!3219 mask!3464) lt!444396))))

(declare-fun b!1005166 () Bool)

(declare-fun res!673882 () Bool)

(declare-fun e!566181 () Bool)

(assert (=> b!1005166 (=> (not res!673882) (not e!566181))))

(assert (=> b!1005166 (= res!673882 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1005168 () Bool)

(declare-fun res!673886 () Bool)

(assert (=> b!1005168 (=> (not res!673886) (not e!566187))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005168 (= res!673886 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005169 () Bool)

(declare-fun res!673890 () Bool)

(assert (=> b!1005169 (=> (not res!673890) (not e!566181))))

(declare-fun lt!444398 () (_ BitVec 64))

(declare-fun lt!444401 () array!63432)

(declare-fun lt!444394 () SeekEntryResult!9403)

(assert (=> b!1005169 (= res!673890 (not (= lt!444394 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444398 lt!444401 mask!3464))))))

(declare-fun b!1005170 () Bool)

(assert (=> b!1005170 (= e!566187 e!566185)))

(declare-fun res!673891 () Bool)

(assert (=> b!1005170 (=> (not res!673891) (not e!566185))))

(declare-fun lt!444395 () SeekEntryResult!9403)

(assert (=> b!1005170 (= res!673891 (or (= lt!444395 (MissingVacant!9403 i!1194)) (= lt!444395 (MissingZero!9403 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63432 (_ BitVec 32)) SeekEntryResult!9403)

(assert (=> b!1005170 (= lt!444395 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005171 () Bool)

(declare-fun res!673892 () Bool)

(assert (=> b!1005171 (=> (not res!673892) (not e!566185))))

(declare-datatypes ((List!21182 0))(
  ( (Nil!21179) (Cons!21178 (h!22364 (_ BitVec 64)) (t!30175 List!21182)) )
))
(declare-fun arrayNoDuplicates!0 (array!63432 (_ BitVec 32) List!21182) Bool)

(assert (=> b!1005171 (= res!673892 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21179))))

(declare-fun b!1005172 () Bool)

(declare-fun res!673894 () Bool)

(assert (=> b!1005172 (=> (not res!673894) (not e!566187))))

(declare-fun arrayContainsKey!0 (array!63432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005172 (= res!673894 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005173 () Bool)

(declare-fun res!673881 () Bool)

(assert (=> b!1005173 (=> (not res!673881) (not e!566185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63432 (_ BitVec 32)) Bool)

(assert (=> b!1005173 (= res!673881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005174 () Bool)

(assert (=> b!1005174 (= e!566181 e!566184)))

(declare-fun res!673883 () Bool)

(assert (=> b!1005174 (=> (not res!673883) (not e!566184))))

(assert (=> b!1005174 (= res!673883 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444397 #b00000000000000000000000000000000) (bvslt lt!444397 (size!31038 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005174 (= lt!444397 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1005175 () Bool)

(declare-fun res!673880 () Bool)

(assert (=> b!1005175 (=> (not res!673880) (not e!566187))))

(assert (=> b!1005175 (= res!673880 (validKeyInArray!0 (select (arr!30535 a!3219) j!170)))))

(declare-fun b!1005176 () Bool)

(declare-fun e!566186 () Bool)

(assert (=> b!1005176 (= e!566185 e!566186)))

(declare-fun res!673895 () Bool)

(assert (=> b!1005176 (=> (not res!673895) (not e!566186))))

(declare-fun lt!444400 () SeekEntryResult!9403)

(assert (=> b!1005176 (= res!673895 (= lt!444400 lt!444396))))

(assert (=> b!1005176 (= lt!444396 (Intermediate!9403 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005176 (= lt!444400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30535 a!3219) j!170) mask!3464) (select (arr!30535 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005167 () Bool)

(declare-fun e!566183 () Bool)

(assert (=> b!1005167 (= e!566186 e!566183)))

(declare-fun res!673889 () Bool)

(assert (=> b!1005167 (=> (not res!673889) (not e!566183))))

(assert (=> b!1005167 (= res!673889 (= lt!444394 lt!444396))))

(assert (=> b!1005167 (= lt!444394 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30535 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!673885 () Bool)

(assert (=> start!86812 (=> (not res!673885) (not e!566187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86812 (= res!673885 (validMask!0 mask!3464))))

(assert (=> start!86812 e!566187))

(declare-fun array_inv!23671 (array!63432) Bool)

(assert (=> start!86812 (array_inv!23671 a!3219)))

(assert (=> start!86812 true))

(declare-fun b!1005177 () Bool)

(assert (=> b!1005177 (= e!566184 false)))

(declare-fun lt!444399 () SeekEntryResult!9403)

(assert (=> b!1005177 (= lt!444399 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444397 lt!444398 lt!444401 mask!3464))))

(declare-fun b!1005178 () Bool)

(assert (=> b!1005178 (= e!566183 e!566181)))

(declare-fun res!673893 () Bool)

(assert (=> b!1005178 (=> (not res!673893) (not e!566181))))

(assert (=> b!1005178 (= res!673893 (not (= lt!444400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444398 mask!3464) lt!444398 lt!444401 mask!3464))))))

(assert (=> b!1005178 (= lt!444398 (select (store (arr!30535 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005178 (= lt!444401 (array!63433 (store (arr!30535 a!3219) i!1194 k0!2224) (size!31038 a!3219)))))

(assert (= (and start!86812 res!673885) b!1005163))

(assert (= (and b!1005163 res!673884) b!1005175))

(assert (= (and b!1005175 res!673880) b!1005168))

(assert (= (and b!1005168 res!673886) b!1005172))

(assert (= (and b!1005172 res!673894) b!1005170))

(assert (= (and b!1005170 res!673891) b!1005173))

(assert (= (and b!1005173 res!673881) b!1005171))

(assert (= (and b!1005171 res!673892) b!1005164))

(assert (= (and b!1005164 res!673887) b!1005176))

(assert (= (and b!1005176 res!673895) b!1005167))

(assert (= (and b!1005167 res!673889) b!1005178))

(assert (= (and b!1005178 res!673893) b!1005169))

(assert (= (and b!1005169 res!673890) b!1005166))

(assert (= (and b!1005166 res!673882) b!1005174))

(assert (= (and b!1005174 res!673883) b!1005165))

(assert (= (and b!1005165 res!673888) b!1005177))

(declare-fun m!931073 () Bool)

(assert (=> b!1005169 m!931073))

(declare-fun m!931075 () Bool)

(assert (=> b!1005176 m!931075))

(assert (=> b!1005176 m!931075))

(declare-fun m!931077 () Bool)

(assert (=> b!1005176 m!931077))

(assert (=> b!1005176 m!931077))

(assert (=> b!1005176 m!931075))

(declare-fun m!931079 () Bool)

(assert (=> b!1005176 m!931079))

(assert (=> b!1005167 m!931075))

(assert (=> b!1005167 m!931075))

(declare-fun m!931081 () Bool)

(assert (=> b!1005167 m!931081))

(declare-fun m!931083 () Bool)

(assert (=> b!1005177 m!931083))

(declare-fun m!931085 () Bool)

(assert (=> b!1005173 m!931085))

(assert (=> b!1005165 m!931075))

(assert (=> b!1005165 m!931075))

(declare-fun m!931087 () Bool)

(assert (=> b!1005165 m!931087))

(declare-fun m!931089 () Bool)

(assert (=> b!1005171 m!931089))

(declare-fun m!931091 () Bool)

(assert (=> start!86812 m!931091))

(declare-fun m!931093 () Bool)

(assert (=> start!86812 m!931093))

(assert (=> b!1005175 m!931075))

(assert (=> b!1005175 m!931075))

(declare-fun m!931095 () Bool)

(assert (=> b!1005175 m!931095))

(declare-fun m!931097 () Bool)

(assert (=> b!1005168 m!931097))

(declare-fun m!931099 () Bool)

(assert (=> b!1005174 m!931099))

(declare-fun m!931101 () Bool)

(assert (=> b!1005170 m!931101))

(declare-fun m!931103 () Bool)

(assert (=> b!1005178 m!931103))

(assert (=> b!1005178 m!931103))

(declare-fun m!931105 () Bool)

(assert (=> b!1005178 m!931105))

(declare-fun m!931107 () Bool)

(assert (=> b!1005178 m!931107))

(declare-fun m!931109 () Bool)

(assert (=> b!1005178 m!931109))

(declare-fun m!931111 () Bool)

(assert (=> b!1005172 m!931111))

(check-sat (not b!1005173) (not b!1005170) (not b!1005174) (not b!1005165) (not start!86812) (not b!1005167) (not b!1005169) (not b!1005177) (not b!1005175) (not b!1005176) (not b!1005171) (not b!1005172) (not b!1005178) (not b!1005168))
(check-sat)
