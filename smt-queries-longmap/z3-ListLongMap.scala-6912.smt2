; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86880 () Bool)

(assert start!86880)

(declare-fun b!1007205 () Bool)

(declare-fun res!676229 () Bool)

(declare-fun e!566849 () Bool)

(assert (=> b!1007205 (=> (not res!676229) (not e!566849))))

(declare-datatypes ((array!63475 0))(
  ( (array!63476 (arr!30558 (Array (_ BitVec 32) (_ BitVec 64))) (size!31062 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63475)

(declare-datatypes ((List!21300 0))(
  ( (Nil!21297) (Cons!21296 (h!22482 (_ BitVec 64)) (t!30292 List!21300)) )
))
(declare-fun arrayNoDuplicates!0 (array!63475 (_ BitVec 32) List!21300) Bool)

(assert (=> b!1007205 (= res!676229 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21297))))

(declare-fun b!1007206 () Bool)

(declare-fun e!566852 () Bool)

(declare-fun e!566848 () Bool)

(assert (=> b!1007206 (= e!566852 e!566848)))

(declare-fun res!676226 () Bool)

(assert (=> b!1007206 (=> (not res!676226) (not e!566848))))

(declare-datatypes ((SeekEntryResult!9515 0))(
  ( (MissingZero!9515 (index!40431 (_ BitVec 32))) (Found!9515 (index!40432 (_ BitVec 32))) (Intermediate!9515 (undefined!10327 Bool) (index!40433 (_ BitVec 32)) (x!87844 (_ BitVec 32))) (Undefined!9515) (MissingVacant!9515 (index!40434 (_ BitVec 32))) )
))
(declare-fun lt!444958 () SeekEntryResult!9515)

(declare-fun lt!444961 () SeekEntryResult!9515)

(assert (=> b!1007206 (= res!676226 (= lt!444958 lt!444961))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63475 (_ BitVec 32)) SeekEntryResult!9515)

(assert (=> b!1007206 (= lt!444958 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30558 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007207 () Bool)

(declare-fun res!676223 () Bool)

(assert (=> b!1007207 (=> (not res!676223) (not e!566849))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007207 (= res!676223 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31062 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31062 a!3219))))))

(declare-fun b!1007208 () Bool)

(assert (=> b!1007208 (= e!566849 e!566852)))

(declare-fun res!676230 () Bool)

(assert (=> b!1007208 (=> (not res!676230) (not e!566852))))

(declare-fun lt!444964 () SeekEntryResult!9515)

(assert (=> b!1007208 (= res!676230 (= lt!444964 lt!444961))))

(assert (=> b!1007208 (= lt!444961 (Intermediate!9515 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007208 (= lt!444964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30558 a!3219) j!170) mask!3464) (select (arr!30558 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!676232 () Bool)

(declare-fun e!566847 () Bool)

(assert (=> start!86880 (=> (not res!676232) (not e!566847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86880 (= res!676232 (validMask!0 mask!3464))))

(assert (=> start!86880 e!566847))

(declare-fun array_inv!23701 (array!63475) Bool)

(assert (=> start!86880 (array_inv!23701 a!3219)))

(assert (=> start!86880 true))

(declare-fun b!1007209 () Bool)

(declare-fun res!676222 () Bool)

(assert (=> b!1007209 (=> (not res!676222) (not e!566847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007209 (= res!676222 (validKeyInArray!0 (select (arr!30558 a!3219) j!170)))))

(declare-fun b!1007210 () Bool)

(declare-fun res!676227 () Bool)

(assert (=> b!1007210 (=> (not res!676227) (not e!566847))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007210 (= res!676227 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007211 () Bool)

(declare-fun res!676234 () Bool)

(assert (=> b!1007211 (=> (not res!676234) (not e!566847))))

(assert (=> b!1007211 (= res!676234 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007212 () Bool)

(declare-fun res!676224 () Bool)

(declare-fun e!566851 () Bool)

(assert (=> b!1007212 (=> (not res!676224) (not e!566851))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007212 (= res!676224 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007213 () Bool)

(declare-fun res!676233 () Bool)

(assert (=> b!1007213 (=> (not res!676233) (not e!566849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63475 (_ BitVec 32)) Bool)

(assert (=> b!1007213 (= res!676233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007214 () Bool)

(assert (=> b!1007214 (= e!566851 false)))

(declare-fun lt!444959 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007214 (= lt!444959 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007215 () Bool)

(declare-fun res!676235 () Bool)

(assert (=> b!1007215 (=> (not res!676235) (not e!566851))))

(declare-fun lt!444962 () (_ BitVec 64))

(declare-fun lt!444963 () array!63475)

(assert (=> b!1007215 (= res!676235 (not (= lt!444958 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444962 lt!444963 mask!3464))))))

(declare-fun b!1007216 () Bool)

(assert (=> b!1007216 (= e!566848 e!566851)))

(declare-fun res!676231 () Bool)

(assert (=> b!1007216 (=> (not res!676231) (not e!566851))))

(assert (=> b!1007216 (= res!676231 (not (= lt!444964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444962 mask!3464) lt!444962 lt!444963 mask!3464))))))

(assert (=> b!1007216 (= lt!444962 (select (store (arr!30558 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007216 (= lt!444963 (array!63476 (store (arr!30558 a!3219) i!1194 k0!2224) (size!31062 a!3219)))))

(declare-fun b!1007217 () Bool)

(assert (=> b!1007217 (= e!566847 e!566849)))

(declare-fun res!676225 () Bool)

(assert (=> b!1007217 (=> (not res!676225) (not e!566849))))

(declare-fun lt!444960 () SeekEntryResult!9515)

(assert (=> b!1007217 (= res!676225 (or (= lt!444960 (MissingVacant!9515 i!1194)) (= lt!444960 (MissingZero!9515 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63475 (_ BitVec 32)) SeekEntryResult!9515)

(assert (=> b!1007217 (= lt!444960 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007218 () Bool)

(declare-fun res!676228 () Bool)

(assert (=> b!1007218 (=> (not res!676228) (not e!566847))))

(assert (=> b!1007218 (= res!676228 (and (= (size!31062 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31062 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31062 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86880 res!676232) b!1007218))

(assert (= (and b!1007218 res!676228) b!1007209))

(assert (= (and b!1007209 res!676222) b!1007211))

(assert (= (and b!1007211 res!676234) b!1007210))

(assert (= (and b!1007210 res!676227) b!1007217))

(assert (= (and b!1007217 res!676225) b!1007213))

(assert (= (and b!1007213 res!676233) b!1007205))

(assert (= (and b!1007205 res!676229) b!1007207))

(assert (= (and b!1007207 res!676223) b!1007208))

(assert (= (and b!1007208 res!676230) b!1007206))

(assert (= (and b!1007206 res!676226) b!1007216))

(assert (= (and b!1007216 res!676231) b!1007215))

(assert (= (and b!1007215 res!676235) b!1007212))

(assert (= (and b!1007212 res!676224) b!1007214))

(declare-fun m!931585 () Bool)

(assert (=> b!1007208 m!931585))

(assert (=> b!1007208 m!931585))

(declare-fun m!931587 () Bool)

(assert (=> b!1007208 m!931587))

(assert (=> b!1007208 m!931587))

(assert (=> b!1007208 m!931585))

(declare-fun m!931589 () Bool)

(assert (=> b!1007208 m!931589))

(assert (=> b!1007209 m!931585))

(assert (=> b!1007209 m!931585))

(declare-fun m!931591 () Bool)

(assert (=> b!1007209 m!931591))

(declare-fun m!931593 () Bool)

(assert (=> b!1007215 m!931593))

(declare-fun m!931595 () Bool)

(assert (=> b!1007205 m!931595))

(declare-fun m!931597 () Bool)

(assert (=> b!1007211 m!931597))

(declare-fun m!931599 () Bool)

(assert (=> b!1007217 m!931599))

(declare-fun m!931601 () Bool)

(assert (=> b!1007214 m!931601))

(assert (=> b!1007206 m!931585))

(assert (=> b!1007206 m!931585))

(declare-fun m!931603 () Bool)

(assert (=> b!1007206 m!931603))

(declare-fun m!931605 () Bool)

(assert (=> start!86880 m!931605))

(declare-fun m!931607 () Bool)

(assert (=> start!86880 m!931607))

(declare-fun m!931609 () Bool)

(assert (=> b!1007213 m!931609))

(declare-fun m!931611 () Bool)

(assert (=> b!1007210 m!931611))

(declare-fun m!931613 () Bool)

(assert (=> b!1007216 m!931613))

(assert (=> b!1007216 m!931613))

(declare-fun m!931615 () Bool)

(assert (=> b!1007216 m!931615))

(declare-fun m!931617 () Bool)

(assert (=> b!1007216 m!931617))

(declare-fun m!931619 () Bool)

(assert (=> b!1007216 m!931619))

(check-sat (not start!86880) (not b!1007214) (not b!1007209) (not b!1007215) (not b!1007205) (not b!1007216) (not b!1007213) (not b!1007210) (not b!1007217) (not b!1007211) (not b!1007208) (not b!1007206))
(check-sat)
