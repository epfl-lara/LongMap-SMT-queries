; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86400 () Bool)

(assert start!86400)

(declare-fun b!999976 () Bool)

(declare-fun res!669458 () Bool)

(declare-fun e!563734 () Bool)

(assert (=> b!999976 (=> (not res!669458) (not e!563734))))

(declare-datatypes ((array!63201 0))(
  ( (array!63202 (arr!30426 (Array (_ BitVec 32) (_ BitVec 64))) (size!30928 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63201)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!999976 (= res!669458 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30928 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30928 a!3219))))))

(declare-fun b!999977 () Bool)

(declare-fun e!563731 () Bool)

(assert (=> b!999977 (= e!563731 e!563734)))

(declare-fun res!669454 () Bool)

(assert (=> b!999977 (=> (not res!669454) (not e!563734))))

(declare-datatypes ((SeekEntryResult!9358 0))(
  ( (MissingZero!9358 (index!39803 (_ BitVec 32))) (Found!9358 (index!39804 (_ BitVec 32))) (Intermediate!9358 (undefined!10170 Bool) (index!39805 (_ BitVec 32)) (x!87234 (_ BitVec 32))) (Undefined!9358) (MissingVacant!9358 (index!39806 (_ BitVec 32))) )
))
(declare-fun lt!442167 () SeekEntryResult!9358)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999977 (= res!669454 (or (= lt!442167 (MissingVacant!9358 i!1194)) (= lt!442167 (MissingZero!9358 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63201 (_ BitVec 32)) SeekEntryResult!9358)

(assert (=> b!999977 (= lt!442167 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999978 () Bool)

(declare-fun res!669455 () Bool)

(declare-fun e!563732 () Bool)

(assert (=> b!999978 (=> (not res!669455) (not e!563732))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442169 () SeekEntryResult!9358)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63201 (_ BitVec 32)) SeekEntryResult!9358)

(assert (=> b!999978 (= res!669455 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30426 a!3219) j!170) a!3219 mask!3464) lt!442169))))

(declare-fun b!999979 () Bool)

(assert (=> b!999979 (= e!563732 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!999981 () Bool)

(declare-fun res!669463 () Bool)

(assert (=> b!999981 (=> (not res!669463) (not e!563731))))

(assert (=> b!999981 (= res!669463 (and (= (size!30928 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30928 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30928 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999982 () Bool)

(assert (=> b!999982 (= e!563734 e!563732)))

(declare-fun res!669464 () Bool)

(assert (=> b!999982 (=> (not res!669464) (not e!563732))))

(declare-fun lt!442168 () SeekEntryResult!9358)

(assert (=> b!999982 (= res!669464 (= lt!442168 lt!442169))))

(assert (=> b!999982 (= lt!442169 (Intermediate!9358 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999982 (= lt!442168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30426 a!3219) j!170) mask!3464) (select (arr!30426 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!999983 () Bool)

(declare-fun res!669461 () Bool)

(assert (=> b!999983 (=> (not res!669461) (not e!563731))))

(declare-fun arrayContainsKey!0 (array!63201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999983 (= res!669461 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999984 () Bool)

(declare-fun res!669462 () Bool)

(assert (=> b!999984 (=> (not res!669462) (not e!563732))))

(assert (=> b!999984 (= res!669462 (not (= lt!442168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30426 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30426 a!3219) i!1194 k!2224) j!170) (array!63202 (store (arr!30426 a!3219) i!1194 k!2224) (size!30928 a!3219)) mask!3464))))))

(declare-fun b!999985 () Bool)

(declare-fun res!669457 () Bool)

(assert (=> b!999985 (=> (not res!669457) (not e!563734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63201 (_ BitVec 32)) Bool)

(assert (=> b!999985 (= res!669457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!669459 () Bool)

(assert (=> start!86400 (=> (not res!669459) (not e!563731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86400 (= res!669459 (validMask!0 mask!3464))))

(assert (=> start!86400 e!563731))

(declare-fun array_inv!23550 (array!63201) Bool)

(assert (=> start!86400 (array_inv!23550 a!3219)))

(assert (=> start!86400 true))

(declare-fun b!999980 () Bool)

(declare-fun res!669456 () Bool)

(assert (=> b!999980 (=> (not res!669456) (not e!563731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999980 (= res!669456 (validKeyInArray!0 (select (arr!30426 a!3219) j!170)))))

(declare-fun b!999986 () Bool)

(declare-fun res!669465 () Bool)

(assert (=> b!999986 (=> (not res!669465) (not e!563734))))

(declare-datatypes ((List!21102 0))(
  ( (Nil!21099) (Cons!21098 (h!22275 (_ BitVec 64)) (t!30103 List!21102)) )
))
(declare-fun arrayNoDuplicates!0 (array!63201 (_ BitVec 32) List!21102) Bool)

(assert (=> b!999986 (= res!669465 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21099))))

(declare-fun b!999987 () Bool)

(declare-fun res!669460 () Bool)

(assert (=> b!999987 (=> (not res!669460) (not e!563731))))

(assert (=> b!999987 (= res!669460 (validKeyInArray!0 k!2224))))

(assert (= (and start!86400 res!669459) b!999981))

(assert (= (and b!999981 res!669463) b!999980))

(assert (= (and b!999980 res!669456) b!999987))

(assert (= (and b!999987 res!669460) b!999983))

(assert (= (and b!999983 res!669461) b!999977))

(assert (= (and b!999977 res!669454) b!999985))

(assert (= (and b!999985 res!669457) b!999986))

(assert (= (and b!999986 res!669465) b!999976))

(assert (= (and b!999976 res!669458) b!999982))

(assert (= (and b!999982 res!669464) b!999978))

(assert (= (and b!999978 res!669455) b!999984))

(assert (= (and b!999984 res!669462) b!999979))

(declare-fun m!926175 () Bool)

(assert (=> start!86400 m!926175))

(declare-fun m!926177 () Bool)

(assert (=> start!86400 m!926177))

(declare-fun m!926179 () Bool)

(assert (=> b!999978 m!926179))

(assert (=> b!999978 m!926179))

(declare-fun m!926181 () Bool)

(assert (=> b!999978 m!926181))

(declare-fun m!926183 () Bool)

(assert (=> b!999987 m!926183))

(declare-fun m!926185 () Bool)

(assert (=> b!999977 m!926185))

(declare-fun m!926187 () Bool)

(assert (=> b!999984 m!926187))

(declare-fun m!926189 () Bool)

(assert (=> b!999984 m!926189))

(assert (=> b!999984 m!926189))

(declare-fun m!926191 () Bool)

(assert (=> b!999984 m!926191))

(assert (=> b!999984 m!926191))

(assert (=> b!999984 m!926189))

(declare-fun m!926193 () Bool)

(assert (=> b!999984 m!926193))

(declare-fun m!926195 () Bool)

(assert (=> b!999985 m!926195))

(assert (=> b!999980 m!926179))

(assert (=> b!999980 m!926179))

(declare-fun m!926197 () Bool)

(assert (=> b!999980 m!926197))

(declare-fun m!926199 () Bool)

(assert (=> b!999986 m!926199))

(declare-fun m!926201 () Bool)

(assert (=> b!999983 m!926201))

(assert (=> b!999982 m!926179))

(assert (=> b!999982 m!926179))

(declare-fun m!926203 () Bool)

(assert (=> b!999982 m!926203))

(assert (=> b!999982 m!926203))

(assert (=> b!999982 m!926179))

(declare-fun m!926205 () Bool)

(assert (=> b!999982 m!926205))

(push 1)

(assert (not b!999984))

(assert (not b!999977))

(assert (not b!999982))

(assert (not b!999985))

(assert (not b!999983))

(assert (not b!999986))

(assert (not b!999978))

(assert (not b!999980))

(assert (not start!86400))

(assert (not b!999987))

(check-sat)

(pop 1)

(push 1)

(check-sat)

