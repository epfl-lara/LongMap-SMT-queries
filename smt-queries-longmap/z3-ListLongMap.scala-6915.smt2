; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87136 () Bool)

(assert start!87136)

(declare-fun b!1009047 () Bool)

(declare-fun res!677181 () Bool)

(declare-fun e!567947 () Bool)

(assert (=> b!1009047 (=> (not res!677181) (not e!567947))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((array!63603 0))(
  ( (array!63604 (arr!30616 (Array (_ BitVec 32) (_ BitVec 64))) (size!31119 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63603)

(assert (=> b!1009047 (= res!677181 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31119 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31119 a!3219))))))

(declare-fun res!677180 () Bool)

(declare-fun e!567946 () Bool)

(assert (=> start!87136 (=> (not res!677180) (not e!567946))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87136 (= res!677180 (validMask!0 mask!3464))))

(assert (=> start!87136 e!567946))

(declare-fun array_inv!23752 (array!63603) Bool)

(assert (=> start!87136 (array_inv!23752 a!3219)))

(assert (=> start!87136 true))

(declare-fun b!1009048 () Bool)

(declare-fun res!677182 () Bool)

(assert (=> b!1009048 (=> (not res!677182) (not e!567946))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1009048 (= res!677182 (and (= (size!31119 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31119 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31119 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009049 () Bool)

(declare-fun e!567945 () Bool)

(declare-fun e!567948 () Bool)

(assert (=> b!1009049 (= e!567945 e!567948)))

(declare-fun res!677190 () Bool)

(assert (=> b!1009049 (=> (not res!677190) (not e!567948))))

(declare-fun lt!445864 () array!63603)

(declare-datatypes ((SeekEntryResult!9484 0))(
  ( (MissingZero!9484 (index!40307 (_ BitVec 32))) (Found!9484 (index!40308 (_ BitVec 32))) (Intermediate!9484 (undefined!10296 Bool) (index!40309 (_ BitVec 32)) (x!87862 (_ BitVec 32))) (Undefined!9484) (MissingVacant!9484 (index!40310 (_ BitVec 32))) )
))
(declare-fun lt!445865 () SeekEntryResult!9484)

(declare-fun lt!445862 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63603 (_ BitVec 32)) SeekEntryResult!9484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009049 (= res!677190 (not (= lt!445865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445862 mask!3464) lt!445862 lt!445864 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009049 (= lt!445862 (select (store (arr!30616 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009049 (= lt!445864 (array!63604 (store (arr!30616 a!3219) i!1194 k0!2224) (size!31119 a!3219)))))

(declare-fun b!1009050 () Bool)

(assert (=> b!1009050 (= e!567946 e!567947)))

(declare-fun res!677192 () Bool)

(assert (=> b!1009050 (=> (not res!677192) (not e!567947))))

(declare-fun lt!445863 () SeekEntryResult!9484)

(assert (=> b!1009050 (= res!677192 (or (= lt!445863 (MissingVacant!9484 i!1194)) (= lt!445863 (MissingZero!9484 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63603 (_ BitVec 32)) SeekEntryResult!9484)

(assert (=> b!1009050 (= lt!445863 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009051 () Bool)

(declare-fun res!677187 () Bool)

(assert (=> b!1009051 (=> (not res!677187) (not e!567946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009051 (= res!677187 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009052 () Bool)

(assert (=> b!1009052 (= e!567948 false)))

(declare-fun lt!445859 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009052 (= lt!445859 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009053 () Bool)

(declare-fun res!677189 () Bool)

(assert (=> b!1009053 (=> (not res!677189) (not e!567948))))

(assert (=> b!1009053 (= res!677189 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009054 () Bool)

(declare-fun res!677188 () Bool)

(assert (=> b!1009054 (=> (not res!677188) (not e!567947))))

(declare-datatypes ((List!21263 0))(
  ( (Nil!21260) (Cons!21259 (h!22454 (_ BitVec 64)) (t!30256 List!21263)) )
))
(declare-fun arrayNoDuplicates!0 (array!63603 (_ BitVec 32) List!21263) Bool)

(assert (=> b!1009054 (= res!677188 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21260))))

(declare-fun b!1009055 () Bool)

(declare-fun e!567943 () Bool)

(assert (=> b!1009055 (= e!567947 e!567943)))

(declare-fun res!677183 () Bool)

(assert (=> b!1009055 (=> (not res!677183) (not e!567943))))

(declare-fun lt!445861 () SeekEntryResult!9484)

(assert (=> b!1009055 (= res!677183 (= lt!445865 lt!445861))))

(assert (=> b!1009055 (= lt!445861 (Intermediate!9484 false resIndex!38 resX!38))))

(assert (=> b!1009055 (= lt!445865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30616 a!3219) j!170) mask!3464) (select (arr!30616 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009056 () Bool)

(declare-fun res!677191 () Bool)

(assert (=> b!1009056 (=> (not res!677191) (not e!567946))))

(assert (=> b!1009056 (= res!677191 (validKeyInArray!0 (select (arr!30616 a!3219) j!170)))))

(declare-fun b!1009057 () Bool)

(declare-fun res!677179 () Bool)

(assert (=> b!1009057 (=> (not res!677179) (not e!567946))))

(declare-fun arrayContainsKey!0 (array!63603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009057 (= res!677179 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009058 () Bool)

(assert (=> b!1009058 (= e!567943 e!567945)))

(declare-fun res!677184 () Bool)

(assert (=> b!1009058 (=> (not res!677184) (not e!567945))))

(declare-fun lt!445860 () SeekEntryResult!9484)

(assert (=> b!1009058 (= res!677184 (= lt!445860 lt!445861))))

(assert (=> b!1009058 (= lt!445860 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30616 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009059 () Bool)

(declare-fun res!677186 () Bool)

(assert (=> b!1009059 (=> (not res!677186) (not e!567948))))

(assert (=> b!1009059 (= res!677186 (not (= lt!445860 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445862 lt!445864 mask!3464))))))

(declare-fun b!1009060 () Bool)

(declare-fun res!677185 () Bool)

(assert (=> b!1009060 (=> (not res!677185) (not e!567947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63603 (_ BitVec 32)) Bool)

(assert (=> b!1009060 (= res!677185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!87136 res!677180) b!1009048))

(assert (= (and b!1009048 res!677182) b!1009056))

(assert (= (and b!1009056 res!677191) b!1009051))

(assert (= (and b!1009051 res!677187) b!1009057))

(assert (= (and b!1009057 res!677179) b!1009050))

(assert (= (and b!1009050 res!677192) b!1009060))

(assert (= (and b!1009060 res!677185) b!1009054))

(assert (= (and b!1009054 res!677188) b!1009047))

(assert (= (and b!1009047 res!677181) b!1009055))

(assert (= (and b!1009055 res!677183) b!1009058))

(assert (= (and b!1009058 res!677184) b!1009049))

(assert (= (and b!1009049 res!677190) b!1009059))

(assert (= (and b!1009059 res!677186) b!1009053))

(assert (= (and b!1009053 res!677189) b!1009052))

(declare-fun m!934163 () Bool)

(assert (=> b!1009049 m!934163))

(assert (=> b!1009049 m!934163))

(declare-fun m!934165 () Bool)

(assert (=> b!1009049 m!934165))

(declare-fun m!934167 () Bool)

(assert (=> b!1009049 m!934167))

(declare-fun m!934169 () Bool)

(assert (=> b!1009049 m!934169))

(declare-fun m!934171 () Bool)

(assert (=> b!1009059 m!934171))

(declare-fun m!934173 () Bool)

(assert (=> b!1009055 m!934173))

(assert (=> b!1009055 m!934173))

(declare-fun m!934175 () Bool)

(assert (=> b!1009055 m!934175))

(assert (=> b!1009055 m!934175))

(assert (=> b!1009055 m!934173))

(declare-fun m!934177 () Bool)

(assert (=> b!1009055 m!934177))

(declare-fun m!934179 () Bool)

(assert (=> b!1009054 m!934179))

(declare-fun m!934181 () Bool)

(assert (=> b!1009060 m!934181))

(declare-fun m!934183 () Bool)

(assert (=> b!1009057 m!934183))

(assert (=> b!1009058 m!934173))

(assert (=> b!1009058 m!934173))

(declare-fun m!934185 () Bool)

(assert (=> b!1009058 m!934185))

(declare-fun m!934187 () Bool)

(assert (=> b!1009052 m!934187))

(assert (=> b!1009056 m!934173))

(assert (=> b!1009056 m!934173))

(declare-fun m!934189 () Bool)

(assert (=> b!1009056 m!934189))

(declare-fun m!934191 () Bool)

(assert (=> b!1009050 m!934191))

(declare-fun m!934193 () Bool)

(assert (=> b!1009051 m!934193))

(declare-fun m!934195 () Bool)

(assert (=> start!87136 m!934195))

(declare-fun m!934197 () Bool)

(assert (=> start!87136 m!934197))

(check-sat (not b!1009055) (not b!1009058) (not b!1009050) (not b!1009060) (not b!1009056) (not start!87136) (not b!1009049) (not b!1009054) (not b!1009051) (not b!1009057) (not b!1009059) (not b!1009052))
(check-sat)
