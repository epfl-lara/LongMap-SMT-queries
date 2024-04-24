; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86974 () Bool)

(assert start!86974)

(declare-fun res!675150 () Bool)

(declare-fun e!567011 () Bool)

(assert (=> start!86974 (=> (not res!675150) (not e!567011))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86974 (= res!675150 (validMask!0 mask!3464))))

(assert (=> start!86974 e!567011))

(declare-datatypes ((array!63492 0))(
  ( (array!63493 (arr!30562 (Array (_ BitVec 32) (_ BitVec 64))) (size!31065 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63492)

(declare-fun array_inv!23698 (array!63492) Bool)

(assert (=> start!86974 (array_inv!23698 a!3219)))

(assert (=> start!86974 true))

(declare-fun b!1006816 () Bool)

(declare-fun res!675146 () Bool)

(declare-fun e!567010 () Bool)

(assert (=> b!1006816 (=> (not res!675146) (not e!567010))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1006816 (= res!675146 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31065 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31065 a!3219))))))

(declare-fun b!1006817 () Bool)

(declare-fun res!675145 () Bool)

(assert (=> b!1006817 (=> (not res!675145) (not e!567010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63492 (_ BitVec 32)) Bool)

(assert (=> b!1006817 (= res!675145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006818 () Bool)

(declare-fun res!675151 () Bool)

(assert (=> b!1006818 (=> (not res!675151) (not e!567011))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006818 (= res!675151 (and (= (size!31065 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31065 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31065 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006819 () Bool)

(declare-fun res!675143 () Bool)

(assert (=> b!1006819 (=> (not res!675143) (not e!567011))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006819 (= res!675143 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006820 () Bool)

(declare-fun res!675148 () Bool)

(assert (=> b!1006820 (=> (not res!675148) (not e!567010))))

(declare-datatypes ((List!21209 0))(
  ( (Nil!21206) (Cons!21205 (h!22397 (_ BitVec 64)) (t!30202 List!21209)) )
))
(declare-fun arrayNoDuplicates!0 (array!63492 (_ BitVec 32) List!21209) Bool)

(assert (=> b!1006820 (= res!675148 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21206))))

(declare-fun b!1006821 () Bool)

(declare-fun res!675144 () Bool)

(assert (=> b!1006821 (=> (not res!675144) (not e!567011))))

(declare-fun arrayContainsKey!0 (array!63492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006821 (= res!675144 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006822 () Bool)

(declare-fun res!675149 () Bool)

(assert (=> b!1006822 (=> (not res!675149) (not e!567011))))

(assert (=> b!1006822 (= res!675149 (validKeyInArray!0 (select (arr!30562 a!3219) j!170)))))

(declare-fun b!1006823 () Bool)

(declare-fun res!675147 () Bool)

(assert (=> b!1006823 (=> (not res!675147) (not e!567010))))

(declare-datatypes ((SeekEntryResult!9430 0))(
  ( (MissingZero!9430 (index!40091 (_ BitVec 32))) (Found!9430 (index!40092 (_ BitVec 32))) (Intermediate!9430 (undefined!10242 Bool) (index!40093 (_ BitVec 32)) (x!87658 (_ BitVec 32))) (Undefined!9430) (MissingVacant!9430 (index!40094 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63492 (_ BitVec 32)) SeekEntryResult!9430)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006823 (= res!675147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30562 a!3219) j!170) mask!3464) (select (arr!30562 a!3219) j!170) a!3219 mask!3464) (Intermediate!9430 false resIndex!38 resX!38)))))

(declare-fun b!1006824 () Bool)

(assert (=> b!1006824 (= e!567010 false)))

(declare-fun lt!445060 () SeekEntryResult!9430)

(assert (=> b!1006824 (= lt!445060 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30562 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006825 () Bool)

(assert (=> b!1006825 (= e!567011 e!567010)))

(declare-fun res!675152 () Bool)

(assert (=> b!1006825 (=> (not res!675152) (not e!567010))))

(declare-fun lt!445061 () SeekEntryResult!9430)

(assert (=> b!1006825 (= res!675152 (or (= lt!445061 (MissingVacant!9430 i!1194)) (= lt!445061 (MissingZero!9430 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63492 (_ BitVec 32)) SeekEntryResult!9430)

(assert (=> b!1006825 (= lt!445061 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(assert (= (and start!86974 res!675150) b!1006818))

(assert (= (and b!1006818 res!675151) b!1006822))

(assert (= (and b!1006822 res!675149) b!1006819))

(assert (= (and b!1006819 res!675143) b!1006821))

(assert (= (and b!1006821 res!675144) b!1006825))

(assert (= (and b!1006825 res!675152) b!1006817))

(assert (= (and b!1006817 res!675145) b!1006820))

(assert (= (and b!1006820 res!675148) b!1006816))

(assert (= (and b!1006816 res!675146) b!1006823))

(assert (= (and b!1006823 res!675147) b!1006824))

(declare-fun m!932309 () Bool)

(assert (=> b!1006823 m!932309))

(assert (=> b!1006823 m!932309))

(declare-fun m!932311 () Bool)

(assert (=> b!1006823 m!932311))

(assert (=> b!1006823 m!932311))

(assert (=> b!1006823 m!932309))

(declare-fun m!932313 () Bool)

(assert (=> b!1006823 m!932313))

(assert (=> b!1006822 m!932309))

(assert (=> b!1006822 m!932309))

(declare-fun m!932315 () Bool)

(assert (=> b!1006822 m!932315))

(declare-fun m!932317 () Bool)

(assert (=> b!1006821 m!932317))

(declare-fun m!932319 () Bool)

(assert (=> start!86974 m!932319))

(declare-fun m!932321 () Bool)

(assert (=> start!86974 m!932321))

(declare-fun m!932323 () Bool)

(assert (=> b!1006825 m!932323))

(declare-fun m!932325 () Bool)

(assert (=> b!1006819 m!932325))

(declare-fun m!932327 () Bool)

(assert (=> b!1006820 m!932327))

(assert (=> b!1006824 m!932309))

(assert (=> b!1006824 m!932309))

(declare-fun m!932329 () Bool)

(assert (=> b!1006824 m!932329))

(declare-fun m!932331 () Bool)

(assert (=> b!1006817 m!932331))

(check-sat (not b!1006819) (not b!1006820) (not b!1006822) (not b!1006821) (not b!1006824) (not b!1006825) (not b!1006823) (not start!86974) (not b!1006817))
(check-sat)
