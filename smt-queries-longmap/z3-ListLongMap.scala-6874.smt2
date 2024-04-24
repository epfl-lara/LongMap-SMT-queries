; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86728 () Bool)

(assert start!86728)

(declare-fun b!1003147 () Bool)

(declare-fun res!671871 () Bool)

(declare-fun e!565304 () Bool)

(assert (=> b!1003147 (=> (not res!671871) (not e!565304))))

(declare-datatypes ((array!63348 0))(
  ( (array!63349 (arr!30493 (Array (_ BitVec 32) (_ BitVec 64))) (size!30996 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63348)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003147 (= res!671871 (and (= (size!30996 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30996 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30996 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003148 () Bool)

(declare-fun e!565303 () Bool)

(assert (=> b!1003148 (= e!565304 e!565303)))

(declare-fun res!671875 () Bool)

(assert (=> b!1003148 (=> (not res!671875) (not e!565303))))

(declare-datatypes ((SeekEntryResult!9361 0))(
  ( (MissingZero!9361 (index!39815 (_ BitVec 32))) (Found!9361 (index!39816 (_ BitVec 32))) (Intermediate!9361 (undefined!10173 Bool) (index!39817 (_ BitVec 32)) (x!87393 (_ BitVec 32))) (Undefined!9361) (MissingVacant!9361 (index!39818 (_ BitVec 32))) )
))
(declare-fun lt!443389 () SeekEntryResult!9361)

(assert (=> b!1003148 (= res!671875 (or (= lt!443389 (MissingVacant!9361 i!1194)) (= lt!443389 (MissingZero!9361 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63348 (_ BitVec 32)) SeekEntryResult!9361)

(assert (=> b!1003148 (= lt!443389 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003149 () Bool)

(declare-fun res!671869 () Bool)

(declare-fun e!565300 () Bool)

(assert (=> b!1003149 (=> (not res!671869) (not e!565300))))

(declare-fun lt!443392 () (_ BitVec 32))

(declare-fun lt!443391 () SeekEntryResult!9361)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63348 (_ BitVec 32)) SeekEntryResult!9361)

(assert (=> b!1003149 (= res!671869 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443392 (select (arr!30493 a!3219) j!170) a!3219 mask!3464) lt!443391))))

(declare-fun b!1003150 () Bool)

(declare-fun e!565305 () Bool)

(declare-fun e!565302 () Bool)

(assert (=> b!1003150 (= e!565305 e!565302)))

(declare-fun res!671872 () Bool)

(assert (=> b!1003150 (=> (not res!671872) (not e!565302))))

(declare-fun lt!443390 () SeekEntryResult!9361)

(declare-fun lt!443387 () (_ BitVec 64))

(declare-fun lt!443393 () array!63348)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003150 (= res!671872 (not (= lt!443390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443387 mask!3464) lt!443387 lt!443393 mask!3464))))))

(assert (=> b!1003150 (= lt!443387 (select (store (arr!30493 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003150 (= lt!443393 (array!63349 (store (arr!30493 a!3219) i!1194 k0!2224) (size!30996 a!3219)))))

(declare-fun b!1003151 () Bool)

(declare-fun res!671865 () Bool)

(assert (=> b!1003151 (=> (not res!671865) (not e!565304))))

(declare-fun arrayContainsKey!0 (array!63348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003151 (= res!671865 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003152 () Bool)

(declare-fun res!671866 () Bool)

(assert (=> b!1003152 (=> (not res!671866) (not e!565304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003152 (= res!671866 (validKeyInArray!0 (select (arr!30493 a!3219) j!170)))))

(declare-fun b!1003153 () Bool)

(declare-fun res!671878 () Bool)

(assert (=> b!1003153 (=> (not res!671878) (not e!565303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63348 (_ BitVec 32)) Bool)

(assert (=> b!1003153 (= res!671878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003154 () Bool)

(declare-fun res!671867 () Bool)

(assert (=> b!1003154 (=> (not res!671867) (not e!565303))))

(declare-datatypes ((List!21140 0))(
  ( (Nil!21137) (Cons!21136 (h!22322 (_ BitVec 64)) (t!30133 List!21140)) )
))
(declare-fun arrayNoDuplicates!0 (array!63348 (_ BitVec 32) List!21140) Bool)

(assert (=> b!1003154 (= res!671867 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21137))))

(declare-fun b!1003156 () Bool)

(declare-fun res!671868 () Bool)

(assert (=> b!1003156 (=> (not res!671868) (not e!565302))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1003156 (= res!671868 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003157 () Bool)

(assert (=> b!1003157 (= e!565302 e!565300)))

(declare-fun res!671864 () Bool)

(assert (=> b!1003157 (=> (not res!671864) (not e!565300))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003157 (= res!671864 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443392 #b00000000000000000000000000000000) (bvslt lt!443392 (size!30996 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003157 (= lt!443392 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1003158 () Bool)

(declare-fun e!565301 () Bool)

(assert (=> b!1003158 (= e!565303 e!565301)))

(declare-fun res!671870 () Bool)

(assert (=> b!1003158 (=> (not res!671870) (not e!565301))))

(assert (=> b!1003158 (= res!671870 (= lt!443390 lt!443391))))

(assert (=> b!1003158 (= lt!443391 (Intermediate!9361 false resIndex!38 resX!38))))

(assert (=> b!1003158 (= lt!443390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30493 a!3219) j!170) mask!3464) (select (arr!30493 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003159 () Bool)

(declare-fun res!671879 () Bool)

(assert (=> b!1003159 (=> (not res!671879) (not e!565302))))

(declare-fun lt!443386 () SeekEntryResult!9361)

(assert (=> b!1003159 (= res!671879 (not (= lt!443386 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443387 lt!443393 mask!3464))))))

(declare-fun b!1003160 () Bool)

(assert (=> b!1003160 (= e!565301 e!565305)))

(declare-fun res!671873 () Bool)

(assert (=> b!1003160 (=> (not res!671873) (not e!565305))))

(assert (=> b!1003160 (= res!671873 (= lt!443386 lt!443391))))

(assert (=> b!1003160 (= lt!443386 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30493 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003161 () Bool)

(declare-fun res!671877 () Bool)

(assert (=> b!1003161 (=> (not res!671877) (not e!565304))))

(assert (=> b!1003161 (= res!671877 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003162 () Bool)

(declare-fun res!671874 () Bool)

(assert (=> b!1003162 (=> (not res!671874) (not e!565303))))

(assert (=> b!1003162 (= res!671874 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30996 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30996 a!3219))))))

(declare-fun b!1003155 () Bool)

(assert (=> b!1003155 (= e!565300 false)))

(declare-fun lt!443388 () SeekEntryResult!9361)

(assert (=> b!1003155 (= lt!443388 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443392 lt!443387 lt!443393 mask!3464))))

(declare-fun res!671876 () Bool)

(assert (=> start!86728 (=> (not res!671876) (not e!565304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86728 (= res!671876 (validMask!0 mask!3464))))

(assert (=> start!86728 e!565304))

(declare-fun array_inv!23629 (array!63348) Bool)

(assert (=> start!86728 (array_inv!23629 a!3219)))

(assert (=> start!86728 true))

(assert (= (and start!86728 res!671876) b!1003147))

(assert (= (and b!1003147 res!671871) b!1003152))

(assert (= (and b!1003152 res!671866) b!1003161))

(assert (= (and b!1003161 res!671877) b!1003151))

(assert (= (and b!1003151 res!671865) b!1003148))

(assert (= (and b!1003148 res!671875) b!1003153))

(assert (= (and b!1003153 res!671878) b!1003154))

(assert (= (and b!1003154 res!671867) b!1003162))

(assert (= (and b!1003162 res!671874) b!1003158))

(assert (= (and b!1003158 res!671870) b!1003160))

(assert (= (and b!1003160 res!671873) b!1003150))

(assert (= (and b!1003150 res!671872) b!1003159))

(assert (= (and b!1003159 res!671879) b!1003156))

(assert (= (and b!1003156 res!671868) b!1003157))

(assert (= (and b!1003157 res!671864) b!1003149))

(assert (= (and b!1003149 res!671869) b!1003155))

(declare-fun m!929393 () Bool)

(assert (=> b!1003153 m!929393))

(declare-fun m!929395 () Bool)

(assert (=> b!1003154 m!929395))

(declare-fun m!929397 () Bool)

(assert (=> b!1003152 m!929397))

(assert (=> b!1003152 m!929397))

(declare-fun m!929399 () Bool)

(assert (=> b!1003152 m!929399))

(declare-fun m!929401 () Bool)

(assert (=> start!86728 m!929401))

(declare-fun m!929403 () Bool)

(assert (=> start!86728 m!929403))

(declare-fun m!929405 () Bool)

(assert (=> b!1003161 m!929405))

(declare-fun m!929407 () Bool)

(assert (=> b!1003157 m!929407))

(declare-fun m!929409 () Bool)

(assert (=> b!1003155 m!929409))

(declare-fun m!929411 () Bool)

(assert (=> b!1003150 m!929411))

(assert (=> b!1003150 m!929411))

(declare-fun m!929413 () Bool)

(assert (=> b!1003150 m!929413))

(declare-fun m!929415 () Bool)

(assert (=> b!1003150 m!929415))

(declare-fun m!929417 () Bool)

(assert (=> b!1003150 m!929417))

(assert (=> b!1003158 m!929397))

(assert (=> b!1003158 m!929397))

(declare-fun m!929419 () Bool)

(assert (=> b!1003158 m!929419))

(assert (=> b!1003158 m!929419))

(assert (=> b!1003158 m!929397))

(declare-fun m!929421 () Bool)

(assert (=> b!1003158 m!929421))

(declare-fun m!929423 () Bool)

(assert (=> b!1003159 m!929423))

(assert (=> b!1003160 m!929397))

(assert (=> b!1003160 m!929397))

(declare-fun m!929425 () Bool)

(assert (=> b!1003160 m!929425))

(declare-fun m!929427 () Bool)

(assert (=> b!1003151 m!929427))

(declare-fun m!929429 () Bool)

(assert (=> b!1003148 m!929429))

(assert (=> b!1003149 m!929397))

(assert (=> b!1003149 m!929397))

(declare-fun m!929431 () Bool)

(assert (=> b!1003149 m!929431))

(check-sat (not b!1003158) (not b!1003152) (not b!1003160) (not b!1003148) (not b!1003154) (not b!1003153) (not b!1003149) (not b!1003159) (not b!1003151) (not b!1003157) (not b!1003155) (not b!1003150) (not start!86728) (not b!1003161))
(check-sat)
