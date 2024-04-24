; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86386 () Bool)

(assert start!86386)

(declare-fun b!999023 () Bool)

(declare-fun res!668254 () Bool)

(declare-fun e!563517 () Bool)

(assert (=> b!999023 (=> (not res!668254) (not e!563517))))

(declare-datatypes ((array!63159 0))(
  ( (array!63160 (arr!30403 (Array (_ BitVec 32) (_ BitVec 64))) (size!30906 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63159)

(declare-datatypes ((List!21050 0))(
  ( (Nil!21047) (Cons!21046 (h!22223 (_ BitVec 64)) (t!30043 List!21050)) )
))
(declare-fun arrayNoDuplicates!0 (array!63159 (_ BitVec 32) List!21050) Bool)

(assert (=> b!999023 (= res!668254 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21047))))

(declare-fun b!999024 () Bool)

(declare-fun e!563515 () Bool)

(assert (=> b!999024 (= e!563515 e!563517)))

(declare-fun res!668259 () Bool)

(assert (=> b!999024 (=> (not res!668259) (not e!563517))))

(declare-datatypes ((SeekEntryResult!9271 0))(
  ( (MissingZero!9271 (index!39455 (_ BitVec 32))) (Found!9271 (index!39456 (_ BitVec 32))) (Intermediate!9271 (undefined!10083 Bool) (index!39457 (_ BitVec 32)) (x!87045 (_ BitVec 32))) (Undefined!9271) (MissingVacant!9271 (index!39458 (_ BitVec 32))) )
))
(declare-fun lt!442001 () SeekEntryResult!9271)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999024 (= res!668259 (or (= lt!442001 (MissingVacant!9271 i!1194)) (= lt!442001 (MissingZero!9271 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63159 (_ BitVec 32)) SeekEntryResult!9271)

(assert (=> b!999024 (= lt!442001 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!999025 () Bool)

(declare-fun res!668257 () Bool)

(assert (=> b!999025 (=> (not res!668257) (not e!563517))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!999025 (= res!668257 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30906 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30906 a!3219))))))

(declare-fun b!999026 () Bool)

(declare-fun res!668255 () Bool)

(assert (=> b!999026 (=> (not res!668255) (not e!563515))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999026 (= res!668255 (validKeyInArray!0 (select (arr!30403 a!3219) j!170)))))

(declare-fun b!999027 () Bool)

(assert (=> b!999027 (= e!563517 false)))

(declare-fun lt!442000 () SeekEntryResult!9271)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63159 (_ BitVec 32)) SeekEntryResult!9271)

(assert (=> b!999027 (= lt!442000 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30403 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999028 () Bool)

(declare-fun res!668252 () Bool)

(assert (=> b!999028 (=> (not res!668252) (not e!563515))))

(assert (=> b!999028 (= res!668252 (and (= (size!30906 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30906 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30906 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999029 () Bool)

(declare-fun res!668253 () Bool)

(assert (=> b!999029 (=> (not res!668253) (not e!563515))))

(assert (=> b!999029 (= res!668253 (validKeyInArray!0 k0!2224))))

(declare-fun res!668258 () Bool)

(assert (=> start!86386 (=> (not res!668258) (not e!563515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86386 (= res!668258 (validMask!0 mask!3464))))

(assert (=> start!86386 e!563515))

(declare-fun array_inv!23539 (array!63159) Bool)

(assert (=> start!86386 (array_inv!23539 a!3219)))

(assert (=> start!86386 true))

(declare-fun b!999022 () Bool)

(declare-fun res!668260 () Bool)

(assert (=> b!999022 (=> (not res!668260) (not e!563515))))

(declare-fun arrayContainsKey!0 (array!63159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999022 (= res!668260 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999030 () Bool)

(declare-fun res!668261 () Bool)

(assert (=> b!999030 (=> (not res!668261) (not e!563517))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999030 (= res!668261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30403 a!3219) j!170) mask!3464) (select (arr!30403 a!3219) j!170) a!3219 mask!3464) (Intermediate!9271 false resIndex!38 resX!38)))))

(declare-fun b!999031 () Bool)

(declare-fun res!668256 () Bool)

(assert (=> b!999031 (=> (not res!668256) (not e!563517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63159 (_ BitVec 32)) Bool)

(assert (=> b!999031 (= res!668256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86386 res!668258) b!999028))

(assert (= (and b!999028 res!668252) b!999026))

(assert (= (and b!999026 res!668255) b!999029))

(assert (= (and b!999029 res!668253) b!999022))

(assert (= (and b!999022 res!668260) b!999024))

(assert (= (and b!999024 res!668259) b!999031))

(assert (= (and b!999031 res!668256) b!999023))

(assert (= (and b!999023 res!668254) b!999025))

(assert (= (and b!999025 res!668257) b!999030))

(assert (= (and b!999030 res!668261) b!999027))

(declare-fun m!926039 () Bool)

(assert (=> start!86386 m!926039))

(declare-fun m!926041 () Bool)

(assert (=> start!86386 m!926041))

(declare-fun m!926043 () Bool)

(assert (=> b!999031 m!926043))

(declare-fun m!926045 () Bool)

(assert (=> b!999024 m!926045))

(declare-fun m!926047 () Bool)

(assert (=> b!999026 m!926047))

(assert (=> b!999026 m!926047))

(declare-fun m!926049 () Bool)

(assert (=> b!999026 m!926049))

(assert (=> b!999027 m!926047))

(assert (=> b!999027 m!926047))

(declare-fun m!926051 () Bool)

(assert (=> b!999027 m!926051))

(declare-fun m!926053 () Bool)

(assert (=> b!999029 m!926053))

(declare-fun m!926055 () Bool)

(assert (=> b!999023 m!926055))

(assert (=> b!999030 m!926047))

(assert (=> b!999030 m!926047))

(declare-fun m!926057 () Bool)

(assert (=> b!999030 m!926057))

(assert (=> b!999030 m!926057))

(assert (=> b!999030 m!926047))

(declare-fun m!926059 () Bool)

(assert (=> b!999030 m!926059))

(declare-fun m!926061 () Bool)

(assert (=> b!999022 m!926061))

(check-sat (not b!999031) (not b!999023) (not b!999027) (not b!999022) (not start!86386) (not b!999030) (not b!999026) (not b!999029) (not b!999024))
(check-sat)
