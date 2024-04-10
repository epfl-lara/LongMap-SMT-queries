; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86068 () Bool)

(assert start!86068)

(declare-fun b!997028 () Bool)

(declare-fun res!667143 () Bool)

(declare-fun e!562390 () Bool)

(assert (=> b!997028 (=> (not res!667143) (not e!562390))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997028 (= res!667143 (validKeyInArray!0 k0!2224))))

(declare-fun b!997029 () Bool)

(declare-fun res!667144 () Bool)

(declare-fun e!562393 () Bool)

(assert (=> b!997029 (=> (not res!667144) (not e!562393))))

(declare-datatypes ((array!63073 0))(
  ( (array!63074 (arr!30368 (Array (_ BitVec 32) (_ BitVec 64))) (size!30870 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63073)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63073 (_ BitVec 32)) Bool)

(assert (=> b!997029 (= res!667144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997031 () Bool)

(declare-fun res!667148 () Bool)

(declare-fun e!562392 () Bool)

(assert (=> b!997031 (=> (not res!667148) (not e!562392))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9300 0))(
  ( (MissingZero!9300 (index!39571 (_ BitVec 32))) (Found!9300 (index!39572 (_ BitVec 32))) (Intermediate!9300 (undefined!10112 Bool) (index!39573 (_ BitVec 32)) (x!87000 (_ BitVec 32))) (Undefined!9300) (MissingVacant!9300 (index!39574 (_ BitVec 32))) )
))
(declare-fun lt!441332 () SeekEntryResult!9300)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63073 (_ BitVec 32)) SeekEntryResult!9300)

(assert (=> b!997031 (= res!667148 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30368 a!3219) j!170) a!3219 mask!3464) lt!441332))))

(declare-fun b!997032 () Bool)

(declare-fun res!667151 () Bool)

(assert (=> b!997032 (=> (not res!667151) (not e!562393))))

(declare-datatypes ((List!21044 0))(
  ( (Nil!21041) (Cons!21040 (h!22205 (_ BitVec 64)) (t!30045 List!21044)) )
))
(declare-fun arrayNoDuplicates!0 (array!63073 (_ BitVec 32) List!21044) Bool)

(assert (=> b!997032 (= res!667151 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21041))))

(declare-fun b!997033 () Bool)

(declare-fun res!667145 () Bool)

(assert (=> b!997033 (=> (not res!667145) (not e!562390))))

(declare-fun arrayContainsKey!0 (array!63073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997033 (= res!667145 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997034 () Bool)

(assert (=> b!997034 (= e!562392 (bvslt mask!3464 #b00000000000000000000000000000000))))

(declare-fun res!667149 () Bool)

(assert (=> start!86068 (=> (not res!667149) (not e!562390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86068 (= res!667149 (validMask!0 mask!3464))))

(assert (=> start!86068 e!562390))

(declare-fun array_inv!23492 (array!63073) Bool)

(assert (=> start!86068 (array_inv!23492 a!3219)))

(assert (=> start!86068 true))

(declare-fun b!997030 () Bool)

(declare-fun res!667147 () Bool)

(assert (=> b!997030 (=> (not res!667147) (not e!562393))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997030 (= res!667147 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30870 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30870 a!3219))))))

(declare-fun b!997035 () Bool)

(assert (=> b!997035 (= e!562393 e!562392)))

(declare-fun res!667142 () Bool)

(assert (=> b!997035 (=> (not res!667142) (not e!562392))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997035 (= res!667142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30368 a!3219) j!170) mask!3464) (select (arr!30368 a!3219) j!170) a!3219 mask!3464) lt!441332))))

(assert (=> b!997035 (= lt!441332 (Intermediate!9300 false resIndex!38 resX!38))))

(declare-fun b!997036 () Bool)

(assert (=> b!997036 (= e!562390 e!562393)))

(declare-fun res!667146 () Bool)

(assert (=> b!997036 (=> (not res!667146) (not e!562393))))

(declare-fun lt!441331 () SeekEntryResult!9300)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997036 (= res!667146 (or (= lt!441331 (MissingVacant!9300 i!1194)) (= lt!441331 (MissingZero!9300 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63073 (_ BitVec 32)) SeekEntryResult!9300)

(assert (=> b!997036 (= lt!441331 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997037 () Bool)

(declare-fun res!667152 () Bool)

(assert (=> b!997037 (=> (not res!667152) (not e!562390))))

(assert (=> b!997037 (= res!667152 (and (= (size!30870 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30870 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30870 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997038 () Bool)

(declare-fun res!667150 () Bool)

(assert (=> b!997038 (=> (not res!667150) (not e!562390))))

(assert (=> b!997038 (= res!667150 (validKeyInArray!0 (select (arr!30368 a!3219) j!170)))))

(assert (= (and start!86068 res!667149) b!997037))

(assert (= (and b!997037 res!667152) b!997038))

(assert (= (and b!997038 res!667150) b!997028))

(assert (= (and b!997028 res!667143) b!997033))

(assert (= (and b!997033 res!667145) b!997036))

(assert (= (and b!997036 res!667146) b!997029))

(assert (= (and b!997029 res!667144) b!997032))

(assert (= (and b!997032 res!667151) b!997030))

(assert (= (and b!997030 res!667147) b!997035))

(assert (= (and b!997035 res!667142) b!997031))

(assert (= (and b!997031 res!667148) b!997034))

(declare-fun m!924005 () Bool)

(assert (=> b!997032 m!924005))

(declare-fun m!924007 () Bool)

(assert (=> b!997028 m!924007))

(declare-fun m!924009 () Bool)

(assert (=> b!997033 m!924009))

(declare-fun m!924011 () Bool)

(assert (=> b!997029 m!924011))

(declare-fun m!924013 () Bool)

(assert (=> b!997031 m!924013))

(assert (=> b!997031 m!924013))

(declare-fun m!924015 () Bool)

(assert (=> b!997031 m!924015))

(assert (=> b!997035 m!924013))

(assert (=> b!997035 m!924013))

(declare-fun m!924017 () Bool)

(assert (=> b!997035 m!924017))

(assert (=> b!997035 m!924017))

(assert (=> b!997035 m!924013))

(declare-fun m!924019 () Bool)

(assert (=> b!997035 m!924019))

(assert (=> b!997038 m!924013))

(assert (=> b!997038 m!924013))

(declare-fun m!924021 () Bool)

(assert (=> b!997038 m!924021))

(declare-fun m!924023 () Bool)

(assert (=> b!997036 m!924023))

(declare-fun m!924025 () Bool)

(assert (=> start!86068 m!924025))

(declare-fun m!924027 () Bool)

(assert (=> start!86068 m!924027))

(check-sat (not b!997031) (not b!997029) (not b!997038) (not b!997033) (not b!997032) (not b!997035) (not b!997028) (not start!86068) (not b!997036))
(check-sat)
