; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86402 () Bool)

(assert start!86402)

(declare-fun b!1000012 () Bool)

(declare-fun res!669500 () Bool)

(declare-fun e!563743 () Bool)

(assert (=> b!1000012 (=> (not res!669500) (not e!563743))))

(declare-datatypes ((array!63203 0))(
  ( (array!63204 (arr!30427 (Array (_ BitVec 32) (_ BitVec 64))) (size!30929 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63203)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9359 0))(
  ( (MissingZero!9359 (index!39807 (_ BitVec 32))) (Found!9359 (index!39808 (_ BitVec 32))) (Intermediate!9359 (undefined!10171 Bool) (index!39809 (_ BitVec 32)) (x!87243 (_ BitVec 32))) (Undefined!9359) (MissingVacant!9359 (index!39810 (_ BitVec 32))) )
))
(declare-fun lt!442176 () SeekEntryResult!9359)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63203 (_ BitVec 32)) SeekEntryResult!9359)

(assert (=> b!1000012 (= res!669500 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30427 a!3219) j!170) a!3219 mask!3464) lt!442176))))

(declare-fun b!1000013 () Bool)

(declare-fun res!669496 () Bool)

(assert (=> b!1000013 (=> (not res!669496) (not e!563743))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun lt!442178 () SeekEntryResult!9359)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000013 (= res!669496 (not (= lt!442178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30427 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30427 a!3219) i!1194 k!2224) j!170) (array!63204 (store (arr!30427 a!3219) i!1194 k!2224) (size!30929 a!3219)) mask!3464))))))

(declare-fun b!1000014 () Bool)

(assert (=> b!1000014 (= e!563743 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000015 () Bool)

(declare-fun res!669499 () Bool)

(declare-fun e!563745 () Bool)

(assert (=> b!1000015 (=> (not res!669499) (not e!563745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63203 (_ BitVec 32)) Bool)

(assert (=> b!1000015 (= res!669499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000016 () Bool)

(declare-fun res!669490 () Bool)

(declare-fun e!563746 () Bool)

(assert (=> b!1000016 (=> (not res!669490) (not e!563746))))

(declare-fun arrayContainsKey!0 (array!63203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000016 (= res!669490 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000017 () Bool)

(declare-fun res!669493 () Bool)

(assert (=> b!1000017 (=> (not res!669493) (not e!563745))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000017 (= res!669493 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30929 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30929 a!3219))))))

(declare-fun b!1000019 () Bool)

(declare-fun res!669495 () Bool)

(assert (=> b!1000019 (=> (not res!669495) (not e!563746))))

(assert (=> b!1000019 (= res!669495 (and (= (size!30929 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30929 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30929 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000020 () Bool)

(assert (=> b!1000020 (= e!563745 e!563743)))

(declare-fun res!669494 () Bool)

(assert (=> b!1000020 (=> (not res!669494) (not e!563743))))

(assert (=> b!1000020 (= res!669494 (= lt!442178 lt!442176))))

(assert (=> b!1000020 (= lt!442176 (Intermediate!9359 false resIndex!38 resX!38))))

(assert (=> b!1000020 (= lt!442178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30427 a!3219) j!170) mask!3464) (select (arr!30427 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000021 () Bool)

(declare-fun res!669492 () Bool)

(assert (=> b!1000021 (=> (not res!669492) (not e!563745))))

(declare-datatypes ((List!21103 0))(
  ( (Nil!21100) (Cons!21099 (h!22276 (_ BitVec 64)) (t!30104 List!21103)) )
))
(declare-fun arrayNoDuplicates!0 (array!63203 (_ BitVec 32) List!21103) Bool)

(assert (=> b!1000021 (= res!669492 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21100))))

(declare-fun b!1000022 () Bool)

(declare-fun res!669491 () Bool)

(assert (=> b!1000022 (=> (not res!669491) (not e!563746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000022 (= res!669491 (validKeyInArray!0 k!2224))))

(declare-fun b!1000023 () Bool)

(declare-fun res!669501 () Bool)

(assert (=> b!1000023 (=> (not res!669501) (not e!563746))))

(assert (=> b!1000023 (= res!669501 (validKeyInArray!0 (select (arr!30427 a!3219) j!170)))))

(declare-fun b!1000018 () Bool)

(assert (=> b!1000018 (= e!563746 e!563745)))

(declare-fun res!669497 () Bool)

(assert (=> b!1000018 (=> (not res!669497) (not e!563745))))

(declare-fun lt!442177 () SeekEntryResult!9359)

(assert (=> b!1000018 (= res!669497 (or (= lt!442177 (MissingVacant!9359 i!1194)) (= lt!442177 (MissingZero!9359 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63203 (_ BitVec 32)) SeekEntryResult!9359)

(assert (=> b!1000018 (= lt!442177 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!669498 () Bool)

(assert (=> start!86402 (=> (not res!669498) (not e!563746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86402 (= res!669498 (validMask!0 mask!3464))))

(assert (=> start!86402 e!563746))

(declare-fun array_inv!23551 (array!63203) Bool)

(assert (=> start!86402 (array_inv!23551 a!3219)))

(assert (=> start!86402 true))

(assert (= (and start!86402 res!669498) b!1000019))

(assert (= (and b!1000019 res!669495) b!1000023))

(assert (= (and b!1000023 res!669501) b!1000022))

(assert (= (and b!1000022 res!669491) b!1000016))

(assert (= (and b!1000016 res!669490) b!1000018))

(assert (= (and b!1000018 res!669497) b!1000015))

(assert (= (and b!1000015 res!669499) b!1000021))

(assert (= (and b!1000021 res!669492) b!1000017))

(assert (= (and b!1000017 res!669493) b!1000020))

(assert (= (and b!1000020 res!669494) b!1000012))

(assert (= (and b!1000012 res!669500) b!1000013))

(assert (= (and b!1000013 res!669496) b!1000014))

(declare-fun m!926207 () Bool)

(assert (=> b!1000018 m!926207))

(declare-fun m!926209 () Bool)

(assert (=> b!1000021 m!926209))

(declare-fun m!926211 () Bool)

(assert (=> b!1000022 m!926211))

(declare-fun m!926213 () Bool)

(assert (=> b!1000012 m!926213))

(assert (=> b!1000012 m!926213))

(declare-fun m!926215 () Bool)

(assert (=> b!1000012 m!926215))

(assert (=> b!1000023 m!926213))

(assert (=> b!1000023 m!926213))

(declare-fun m!926217 () Bool)

(assert (=> b!1000023 m!926217))

(declare-fun m!926219 () Bool)

(assert (=> b!1000016 m!926219))

(declare-fun m!926221 () Bool)

(assert (=> start!86402 m!926221))

(declare-fun m!926223 () Bool)

(assert (=> start!86402 m!926223))

(assert (=> b!1000020 m!926213))

(assert (=> b!1000020 m!926213))

(declare-fun m!926225 () Bool)

(assert (=> b!1000020 m!926225))

(assert (=> b!1000020 m!926225))

(assert (=> b!1000020 m!926213))

(declare-fun m!926227 () Bool)

(assert (=> b!1000020 m!926227))

(declare-fun m!926229 () Bool)

(assert (=> b!1000015 m!926229))

(declare-fun m!926231 () Bool)

(assert (=> b!1000013 m!926231))

(declare-fun m!926233 () Bool)

(assert (=> b!1000013 m!926233))

(assert (=> b!1000013 m!926233))

(declare-fun m!926235 () Bool)

(assert (=> b!1000013 m!926235))

(assert (=> b!1000013 m!926235))

(assert (=> b!1000013 m!926233))

(declare-fun m!926237 () Bool)

(assert (=> b!1000013 m!926237))

(push 1)

