; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86776 () Bool)

(assert start!86776)

(declare-fun b!1006055 () Bool)

(declare-fun res!675152 () Bool)

(declare-fun e!566359 () Bool)

(assert (=> b!1006055 (=> (not res!675152) (not e!566359))))

(declare-datatypes ((array!63475 0))(
  ( (array!63476 (arr!30560 (Array (_ BitVec 32) (_ BitVec 64))) (size!31062 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63475)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006055 (= res!675152 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006056 () Bool)

(declare-fun res!675149 () Bool)

(declare-fun e!566357 () Bool)

(assert (=> b!1006056 (=> (not res!675149) (not e!566357))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006056 (= res!675149 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31062 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31062 a!3219))))))

(declare-fun res!675145 () Bool)

(assert (=> start!86776 (=> (not res!675145) (not e!566359))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86776 (= res!675145 (validMask!0 mask!3464))))

(assert (=> start!86776 e!566359))

(declare-fun array_inv!23684 (array!63475) Bool)

(assert (=> start!86776 (array_inv!23684 a!3219)))

(assert (=> start!86776 true))

(declare-fun b!1006057 () Bool)

(declare-fun res!675151 () Bool)

(assert (=> b!1006057 (=> (not res!675151) (not e!566357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63475 (_ BitVec 32)) Bool)

(assert (=> b!1006057 (= res!675151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006058 () Bool)

(declare-fun e!566358 () Bool)

(assert (=> b!1006058 (= e!566357 e!566358)))

(declare-fun res!675147 () Bool)

(assert (=> b!1006058 (=> (not res!675147) (not e!566358))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9492 0))(
  ( (MissingZero!9492 (index!40339 (_ BitVec 32))) (Found!9492 (index!40340 (_ BitVec 32))) (Intermediate!9492 (undefined!10304 Bool) (index!40341 (_ BitVec 32)) (x!87740 (_ BitVec 32))) (Undefined!9492) (MissingVacant!9492 (index!40342 (_ BitVec 32))) )
))
(declare-fun lt!444681 () SeekEntryResult!9492)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63475 (_ BitVec 32)) SeekEntryResult!9492)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006058 (= res!675147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30560 a!3219) j!170) mask!3464) (select (arr!30560 a!3219) j!170) a!3219 mask!3464) lt!444681))))

(assert (=> b!1006058 (= lt!444681 (Intermediate!9492 false resIndex!38 resX!38))))

(declare-fun b!1006059 () Bool)

(assert (=> b!1006059 (= e!566359 e!566357)))

(declare-fun res!675146 () Bool)

(assert (=> b!1006059 (=> (not res!675146) (not e!566357))))

(declare-fun lt!444682 () SeekEntryResult!9492)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006059 (= res!675146 (or (= lt!444682 (MissingVacant!9492 i!1194)) (= lt!444682 (MissingZero!9492 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63475 (_ BitVec 32)) SeekEntryResult!9492)

(assert (=> b!1006059 (= lt!444682 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006060 () Bool)

(assert (=> b!1006060 (= e!566358 false)))

(declare-fun lt!444683 () (_ BitVec 32))

(assert (=> b!1006060 (= lt!444683 (toIndex!0 (select (store (arr!30560 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1006061 () Bool)

(declare-fun res!675144 () Bool)

(assert (=> b!1006061 (=> (not res!675144) (not e!566359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006061 (= res!675144 (validKeyInArray!0 (select (arr!30560 a!3219) j!170)))))

(declare-fun b!1006062 () Bool)

(declare-fun res!675153 () Bool)

(assert (=> b!1006062 (=> (not res!675153) (not e!566358))))

(assert (=> b!1006062 (= res!675153 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30560 a!3219) j!170) a!3219 mask!3464) lt!444681))))

(declare-fun b!1006063 () Bool)

(declare-fun res!675148 () Bool)

(assert (=> b!1006063 (=> (not res!675148) (not e!566357))))

(declare-datatypes ((List!21236 0))(
  ( (Nil!21233) (Cons!21232 (h!22415 (_ BitVec 64)) (t!30237 List!21236)) )
))
(declare-fun arrayNoDuplicates!0 (array!63475 (_ BitVec 32) List!21236) Bool)

(assert (=> b!1006063 (= res!675148 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21233))))

(declare-fun b!1006064 () Bool)

(declare-fun res!675150 () Bool)

(assert (=> b!1006064 (=> (not res!675150) (not e!566359))))

(assert (=> b!1006064 (= res!675150 (and (= (size!31062 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31062 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31062 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006065 () Bool)

(declare-fun res!675143 () Bool)

(assert (=> b!1006065 (=> (not res!675143) (not e!566359))))

(assert (=> b!1006065 (= res!675143 (validKeyInArray!0 k0!2224))))

(assert (= (and start!86776 res!675145) b!1006064))

(assert (= (and b!1006064 res!675150) b!1006061))

(assert (= (and b!1006061 res!675144) b!1006065))

(assert (= (and b!1006065 res!675143) b!1006055))

(assert (= (and b!1006055 res!675152) b!1006059))

(assert (= (and b!1006059 res!675146) b!1006057))

(assert (= (and b!1006057 res!675151) b!1006063))

(assert (= (and b!1006063 res!675148) b!1006056))

(assert (= (and b!1006056 res!675149) b!1006058))

(assert (= (and b!1006058 res!675147) b!1006062))

(assert (= (and b!1006062 res!675153) b!1006060))

(declare-fun m!931175 () Bool)

(assert (=> b!1006062 m!931175))

(assert (=> b!1006062 m!931175))

(declare-fun m!931177 () Bool)

(assert (=> b!1006062 m!931177))

(declare-fun m!931179 () Bool)

(assert (=> b!1006059 m!931179))

(declare-fun m!931181 () Bool)

(assert (=> b!1006060 m!931181))

(declare-fun m!931183 () Bool)

(assert (=> b!1006060 m!931183))

(assert (=> b!1006060 m!931183))

(declare-fun m!931185 () Bool)

(assert (=> b!1006060 m!931185))

(declare-fun m!931187 () Bool)

(assert (=> b!1006055 m!931187))

(declare-fun m!931189 () Bool)

(assert (=> b!1006065 m!931189))

(declare-fun m!931191 () Bool)

(assert (=> b!1006057 m!931191))

(declare-fun m!931193 () Bool)

(assert (=> start!86776 m!931193))

(declare-fun m!931195 () Bool)

(assert (=> start!86776 m!931195))

(assert (=> b!1006058 m!931175))

(assert (=> b!1006058 m!931175))

(declare-fun m!931197 () Bool)

(assert (=> b!1006058 m!931197))

(assert (=> b!1006058 m!931197))

(assert (=> b!1006058 m!931175))

(declare-fun m!931199 () Bool)

(assert (=> b!1006058 m!931199))

(declare-fun m!931201 () Bool)

(assert (=> b!1006063 m!931201))

(assert (=> b!1006061 m!931175))

(assert (=> b!1006061 m!931175))

(declare-fun m!931203 () Bool)

(assert (=> b!1006061 m!931203))

(check-sat (not b!1006063) (not b!1006062) (not b!1006057) (not b!1006055) (not b!1006060) (not start!86776) (not b!1006065) (not b!1006061) (not b!1006059) (not b!1006058))
(check-sat)
