; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86452 () Bool)

(assert start!86452)

(declare-fun b!1000894 () Bool)

(declare-fun res!670379 () Bool)

(declare-fun e!564050 () Bool)

(assert (=> b!1000894 (=> (not res!670379) (not e!564050))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000894 (= res!670379 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000895 () Bool)

(declare-fun res!670372 () Bool)

(assert (=> b!1000895 (=> (not res!670372) (not e!564050))))

(declare-datatypes ((array!63253 0))(
  ( (array!63254 (arr!30452 (Array (_ BitVec 32) (_ BitVec 64))) (size!30954 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63253)

(declare-fun arrayContainsKey!0 (array!63253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000895 (= res!670372 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000896 () Bool)

(declare-fun res!670380 () Bool)

(declare-fun e!564049 () Bool)

(assert (=> b!1000896 (=> (not res!670380) (not e!564049))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9384 0))(
  ( (MissingZero!9384 (index!39907 (_ BitVec 32))) (Found!9384 (index!39908 (_ BitVec 32))) (Intermediate!9384 (undefined!10196 Bool) (index!39909 (_ BitVec 32)) (x!87332 (_ BitVec 32))) (Undefined!9384) (MissingVacant!9384 (index!39910 (_ BitVec 32))) )
))
(declare-fun lt!442418 () SeekEntryResult!9384)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63253 (_ BitVec 32)) SeekEntryResult!9384)

(assert (=> b!1000896 (= res!670380 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30452 a!3219) j!170) a!3219 mask!3464) lt!442418))))

(declare-fun b!1000897 () Bool)

(declare-fun res!670378 () Bool)

(declare-fun e!564048 () Bool)

(assert (=> b!1000897 (=> (not res!670378) (not e!564048))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000897 (= res!670378 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30954 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30954 a!3219))))))

(declare-fun b!1000898 () Bool)

(declare-fun e!564052 () Bool)

(assert (=> b!1000898 (= e!564052 false)))

(declare-fun lt!442419 () (_ BitVec 64))

(declare-fun lt!442416 () SeekEntryResult!9384)

(declare-fun lt!442421 () array!63253)

(assert (=> b!1000898 (= lt!442416 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442419 lt!442421 mask!3464))))

(declare-fun res!670375 () Bool)

(assert (=> start!86452 (=> (not res!670375) (not e!564050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86452 (= res!670375 (validMask!0 mask!3464))))

(assert (=> start!86452 e!564050))

(declare-fun array_inv!23576 (array!63253) Bool)

(assert (=> start!86452 (array_inv!23576 a!3219)))

(assert (=> start!86452 true))

(declare-fun b!1000899 () Bool)

(declare-fun res!670383 () Bool)

(assert (=> b!1000899 (=> (not res!670383) (not e!564050))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000899 (= res!670383 (and (= (size!30954 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30954 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30954 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000900 () Bool)

(assert (=> b!1000900 (= e!564048 e!564049)))

(declare-fun res!670377 () Bool)

(assert (=> b!1000900 (=> (not res!670377) (not e!564049))))

(declare-fun lt!442420 () SeekEntryResult!9384)

(assert (=> b!1000900 (= res!670377 (= lt!442420 lt!442418))))

(assert (=> b!1000900 (= lt!442418 (Intermediate!9384 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000900 (= lt!442420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30452 a!3219) j!170) mask!3464) (select (arr!30452 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000901 () Bool)

(declare-fun res!670374 () Bool)

(assert (=> b!1000901 (=> (not res!670374) (not e!564048))))

(declare-datatypes ((List!21128 0))(
  ( (Nil!21125) (Cons!21124 (h!22301 (_ BitVec 64)) (t!30129 List!21128)) )
))
(declare-fun arrayNoDuplicates!0 (array!63253 (_ BitVec 32) List!21128) Bool)

(assert (=> b!1000901 (= res!670374 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21125))))

(declare-fun b!1000902 () Bool)

(declare-fun res!670373 () Bool)

(assert (=> b!1000902 (=> (not res!670373) (not e!564050))))

(assert (=> b!1000902 (= res!670373 (validKeyInArray!0 (select (arr!30452 a!3219) j!170)))))

(declare-fun b!1000903 () Bool)

(assert (=> b!1000903 (= e!564050 e!564048)))

(declare-fun res!670381 () Bool)

(assert (=> b!1000903 (=> (not res!670381) (not e!564048))))

(declare-fun lt!442417 () SeekEntryResult!9384)

(assert (=> b!1000903 (= res!670381 (or (= lt!442417 (MissingVacant!9384 i!1194)) (= lt!442417 (MissingZero!9384 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63253 (_ BitVec 32)) SeekEntryResult!9384)

(assert (=> b!1000903 (= lt!442417 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000904 () Bool)

(assert (=> b!1000904 (= e!564049 e!564052)))

(declare-fun res!670382 () Bool)

(assert (=> b!1000904 (=> (not res!670382) (not e!564052))))

(assert (=> b!1000904 (= res!670382 (not (= lt!442420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442419 mask!3464) lt!442419 lt!442421 mask!3464))))))

(assert (=> b!1000904 (= lt!442419 (select (store (arr!30452 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1000904 (= lt!442421 (array!63254 (store (arr!30452 a!3219) i!1194 k0!2224) (size!30954 a!3219)))))

(declare-fun b!1000905 () Bool)

(declare-fun res!670376 () Bool)

(assert (=> b!1000905 (=> (not res!670376) (not e!564048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63253 (_ BitVec 32)) Bool)

(assert (=> b!1000905 (= res!670376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86452 res!670375) b!1000899))

(assert (= (and b!1000899 res!670383) b!1000902))

(assert (= (and b!1000902 res!670373) b!1000894))

(assert (= (and b!1000894 res!670379) b!1000895))

(assert (= (and b!1000895 res!670372) b!1000903))

(assert (= (and b!1000903 res!670381) b!1000905))

(assert (= (and b!1000905 res!670376) b!1000901))

(assert (= (and b!1000901 res!670374) b!1000897))

(assert (= (and b!1000897 res!670378) b!1000900))

(assert (= (and b!1000900 res!670377) b!1000896))

(assert (= (and b!1000896 res!670380) b!1000904))

(assert (= (and b!1000904 res!670382) b!1000898))

(declare-fun m!927015 () Bool)

(assert (=> b!1000900 m!927015))

(assert (=> b!1000900 m!927015))

(declare-fun m!927017 () Bool)

(assert (=> b!1000900 m!927017))

(assert (=> b!1000900 m!927017))

(assert (=> b!1000900 m!927015))

(declare-fun m!927019 () Bool)

(assert (=> b!1000900 m!927019))

(declare-fun m!927021 () Bool)

(assert (=> b!1000898 m!927021))

(declare-fun m!927023 () Bool)

(assert (=> b!1000901 m!927023))

(assert (=> b!1000902 m!927015))

(assert (=> b!1000902 m!927015))

(declare-fun m!927025 () Bool)

(assert (=> b!1000902 m!927025))

(declare-fun m!927027 () Bool)

(assert (=> b!1000895 m!927027))

(declare-fun m!927029 () Bool)

(assert (=> b!1000905 m!927029))

(assert (=> b!1000896 m!927015))

(assert (=> b!1000896 m!927015))

(declare-fun m!927031 () Bool)

(assert (=> b!1000896 m!927031))

(declare-fun m!927033 () Bool)

(assert (=> b!1000904 m!927033))

(assert (=> b!1000904 m!927033))

(declare-fun m!927035 () Bool)

(assert (=> b!1000904 m!927035))

(declare-fun m!927037 () Bool)

(assert (=> b!1000904 m!927037))

(declare-fun m!927039 () Bool)

(assert (=> b!1000904 m!927039))

(declare-fun m!927041 () Bool)

(assert (=> b!1000894 m!927041))

(declare-fun m!927043 () Bool)

(assert (=> start!86452 m!927043))

(declare-fun m!927045 () Bool)

(assert (=> start!86452 m!927045))

(declare-fun m!927047 () Bool)

(assert (=> b!1000903 m!927047))

(check-sat (not b!1000905) (not b!1000901) (not b!1000903) (not b!1000894) (not b!1000904) (not b!1000896) (not start!86452) (not b!1000900) (not b!1000902) (not b!1000898) (not b!1000895))
(check-sat)
