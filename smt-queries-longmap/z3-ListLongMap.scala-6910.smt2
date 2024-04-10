; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86878 () Bool)

(assert start!86878)

(declare-fun b!1007213 () Bool)

(declare-fun res!676111 () Bool)

(declare-fun e!566890 () Bool)

(assert (=> b!1007213 (=> (not res!676111) (not e!566890))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007213 (= res!676111 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007214 () Bool)

(declare-fun res!676110 () Bool)

(assert (=> b!1007214 (=> (not res!676110) (not e!566890))))

(declare-datatypes ((SeekEntryResult!9516 0))(
  ( (MissingZero!9516 (index!40435 (_ BitVec 32))) (Found!9516 (index!40436 (_ BitVec 32))) (Intermediate!9516 (undefined!10328 Bool) (index!40437 (_ BitVec 32)) (x!87834 (_ BitVec 32))) (Undefined!9516) (MissingVacant!9516 (index!40438 (_ BitVec 32))) )
))
(declare-fun lt!445085 () SeekEntryResult!9516)

(declare-fun lt!445091 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-datatypes ((array!63526 0))(
  ( (array!63527 (arr!30584 (Array (_ BitVec 32) (_ BitVec 64))) (size!31086 (_ BitVec 32))) )
))
(declare-fun lt!445087 () array!63526)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63526 (_ BitVec 32)) SeekEntryResult!9516)

(assert (=> b!1007214 (= res!676110 (not (= lt!445085 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445091 lt!445087 mask!3464))))))

(declare-fun b!1007215 () Bool)

(assert (=> b!1007215 (= e!566890 false)))

(declare-fun lt!445086 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007215 (= lt!445086 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007216 () Bool)

(declare-fun e!566893 () Bool)

(declare-fun e!566889 () Bool)

(assert (=> b!1007216 (= e!566893 e!566889)))

(declare-fun res!676116 () Bool)

(assert (=> b!1007216 (=> (not res!676116) (not e!566889))))

(declare-fun lt!445088 () SeekEntryResult!9516)

(declare-fun lt!445089 () SeekEntryResult!9516)

(assert (=> b!1007216 (= res!676116 (= lt!445088 lt!445089))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007216 (= lt!445089 (Intermediate!9516 false resIndex!38 resX!38))))

(declare-fun a!3219 () array!63526)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007216 (= lt!445088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30584 a!3219) j!170) mask!3464) (select (arr!30584 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007217 () Bool)

(declare-fun res!676118 () Bool)

(assert (=> b!1007217 (=> (not res!676118) (not e!566893))))

(declare-datatypes ((List!21260 0))(
  ( (Nil!21257) (Cons!21256 (h!22442 (_ BitVec 64)) (t!30261 List!21260)) )
))
(declare-fun arrayNoDuplicates!0 (array!63526 (_ BitVec 32) List!21260) Bool)

(assert (=> b!1007217 (= res!676118 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21257))))

(declare-fun b!1007218 () Bool)

(declare-fun e!566888 () Bool)

(assert (=> b!1007218 (= e!566889 e!566888)))

(declare-fun res!676114 () Bool)

(assert (=> b!1007218 (=> (not res!676114) (not e!566888))))

(assert (=> b!1007218 (= res!676114 (= lt!445085 lt!445089))))

(assert (=> b!1007218 (= lt!445085 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30584 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007219 () Bool)

(declare-fun res!676112 () Bool)

(assert (=> b!1007219 (=> (not res!676112) (not e!566893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63526 (_ BitVec 32)) Bool)

(assert (=> b!1007219 (= res!676112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007221 () Bool)

(declare-fun res!676109 () Bool)

(assert (=> b!1007221 (=> (not res!676109) (not e!566893))))

(assert (=> b!1007221 (= res!676109 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31086 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31086 a!3219))))))

(declare-fun b!1007222 () Bool)

(declare-fun res!676113 () Bool)

(declare-fun e!566891 () Bool)

(assert (=> b!1007222 (=> (not res!676113) (not e!566891))))

(assert (=> b!1007222 (= res!676113 (and (= (size!31086 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31086 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31086 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007223 () Bool)

(declare-fun res!676119 () Bool)

(assert (=> b!1007223 (=> (not res!676119) (not e!566891))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007223 (= res!676119 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007224 () Bool)

(declare-fun res!676115 () Bool)

(assert (=> b!1007224 (=> (not res!676115) (not e!566891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007224 (= res!676115 (validKeyInArray!0 (select (arr!30584 a!3219) j!170)))))

(declare-fun b!1007225 () Bool)

(declare-fun res!676106 () Bool)

(assert (=> b!1007225 (=> (not res!676106) (not e!566891))))

(assert (=> b!1007225 (= res!676106 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007226 () Bool)

(assert (=> b!1007226 (= e!566888 e!566890)))

(declare-fun res!676108 () Bool)

(assert (=> b!1007226 (=> (not res!676108) (not e!566890))))

(assert (=> b!1007226 (= res!676108 (not (= lt!445088 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445091 mask!3464) lt!445091 lt!445087 mask!3464))))))

(assert (=> b!1007226 (= lt!445091 (select (store (arr!30584 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007226 (= lt!445087 (array!63527 (store (arr!30584 a!3219) i!1194 k0!2224) (size!31086 a!3219)))))

(declare-fun res!676117 () Bool)

(assert (=> start!86878 (=> (not res!676117) (not e!566891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86878 (= res!676117 (validMask!0 mask!3464))))

(assert (=> start!86878 e!566891))

(declare-fun array_inv!23708 (array!63526) Bool)

(assert (=> start!86878 (array_inv!23708 a!3219)))

(assert (=> start!86878 true))

(declare-fun b!1007220 () Bool)

(assert (=> b!1007220 (= e!566891 e!566893)))

(declare-fun res!676107 () Bool)

(assert (=> b!1007220 (=> (not res!676107) (not e!566893))))

(declare-fun lt!445090 () SeekEntryResult!9516)

(assert (=> b!1007220 (= res!676107 (or (= lt!445090 (MissingVacant!9516 i!1194)) (= lt!445090 (MissingZero!9516 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63526 (_ BitVec 32)) SeekEntryResult!9516)

(assert (=> b!1007220 (= lt!445090 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86878 res!676117) b!1007222))

(assert (= (and b!1007222 res!676113) b!1007224))

(assert (= (and b!1007224 res!676115) b!1007225))

(assert (= (and b!1007225 res!676106) b!1007223))

(assert (= (and b!1007223 res!676119) b!1007220))

(assert (= (and b!1007220 res!676107) b!1007219))

(assert (= (and b!1007219 res!676112) b!1007217))

(assert (= (and b!1007217 res!676118) b!1007221))

(assert (= (and b!1007221 res!676109) b!1007216))

(assert (= (and b!1007216 res!676116) b!1007218))

(assert (= (and b!1007218 res!676114) b!1007226))

(assert (= (and b!1007226 res!676108) b!1007214))

(assert (= (and b!1007214 res!676110) b!1007213))

(assert (= (and b!1007213 res!676111) b!1007215))

(declare-fun m!932135 () Bool)

(assert (=> b!1007217 m!932135))

(declare-fun m!932137 () Bool)

(assert (=> b!1007220 m!932137))

(declare-fun m!932139 () Bool)

(assert (=> b!1007226 m!932139))

(assert (=> b!1007226 m!932139))

(declare-fun m!932141 () Bool)

(assert (=> b!1007226 m!932141))

(declare-fun m!932143 () Bool)

(assert (=> b!1007226 m!932143))

(declare-fun m!932145 () Bool)

(assert (=> b!1007226 m!932145))

(declare-fun m!932147 () Bool)

(assert (=> b!1007219 m!932147))

(declare-fun m!932149 () Bool)

(assert (=> b!1007216 m!932149))

(assert (=> b!1007216 m!932149))

(declare-fun m!932151 () Bool)

(assert (=> b!1007216 m!932151))

(assert (=> b!1007216 m!932151))

(assert (=> b!1007216 m!932149))

(declare-fun m!932153 () Bool)

(assert (=> b!1007216 m!932153))

(assert (=> b!1007218 m!932149))

(assert (=> b!1007218 m!932149))

(declare-fun m!932155 () Bool)

(assert (=> b!1007218 m!932155))

(declare-fun m!932157 () Bool)

(assert (=> b!1007225 m!932157))

(declare-fun m!932159 () Bool)

(assert (=> b!1007215 m!932159))

(declare-fun m!932161 () Bool)

(assert (=> b!1007223 m!932161))

(declare-fun m!932163 () Bool)

(assert (=> b!1007214 m!932163))

(declare-fun m!932165 () Bool)

(assert (=> start!86878 m!932165))

(declare-fun m!932167 () Bool)

(assert (=> start!86878 m!932167))

(assert (=> b!1007224 m!932149))

(assert (=> b!1007224 m!932149))

(declare-fun m!932169 () Bool)

(assert (=> b!1007224 m!932169))

(check-sat (not b!1007225) (not b!1007220) (not b!1007226) (not b!1007216) (not b!1007217) (not b!1007218) (not start!86878) (not b!1007214) (not b!1007219) (not b!1007223) (not b!1007215) (not b!1007224))
(check-sat)
