; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86442 () Bool)

(assert start!86442)

(declare-fun b!1000705 () Bool)

(declare-fun res!670185 () Bool)

(declare-fun e!563985 () Bool)

(assert (=> b!1000705 (=> (not res!670185) (not e!563985))))

(declare-datatypes ((array!63243 0))(
  ( (array!63244 (arr!30447 (Array (_ BitVec 32) (_ BitVec 64))) (size!30949 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63243)

(declare-datatypes ((List!21123 0))(
  ( (Nil!21120) (Cons!21119 (h!22296 (_ BitVec 64)) (t!30124 List!21123)) )
))
(declare-fun arrayNoDuplicates!0 (array!63243 (_ BitVec 32) List!21123) Bool)

(assert (=> b!1000705 (= res!670185 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21120))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!1000706 () Bool)

(declare-fun e!563983 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(assert (=> b!1000706 (= e!563983 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsgt x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1000707 () Bool)

(assert (=> b!1000707 (= e!563985 e!563983)))

(declare-fun res!670193 () Bool)

(assert (=> b!1000707 (=> (not res!670193) (not e!563983))))

(declare-datatypes ((SeekEntryResult!9379 0))(
  ( (MissingZero!9379 (index!39887 (_ BitVec 32))) (Found!9379 (index!39888 (_ BitVec 32))) (Intermediate!9379 (undefined!10191 Bool) (index!39889 (_ BitVec 32)) (x!87311 (_ BitVec 32))) (Undefined!9379) (MissingVacant!9379 (index!39890 (_ BitVec 32))) )
))
(declare-fun lt!442358 () SeekEntryResult!9379)

(declare-fun lt!442357 () SeekEntryResult!9379)

(assert (=> b!1000707 (= res!670193 (= lt!442358 lt!442357))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000707 (= lt!442357 (Intermediate!9379 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63243 (_ BitVec 32)) SeekEntryResult!9379)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000707 (= lt!442358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30447 a!3219) j!170) mask!3464) (select (arr!30447 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1000708 () Bool)

(declare-fun res!670187 () Bool)

(declare-fun e!563984 () Bool)

(assert (=> b!1000708 (=> (not res!670187) (not e!563984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000708 (= res!670187 (validKeyInArray!0 (select (arr!30447 a!3219) j!170)))))

(declare-fun b!1000709 () Bool)

(declare-fun res!670189 () Bool)

(assert (=> b!1000709 (=> (not res!670189) (not e!563985))))

(assert (=> b!1000709 (= res!670189 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30949 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30949 a!3219))))))

(declare-fun b!1000711 () Bool)

(assert (=> b!1000711 (= e!563984 e!563985)))

(declare-fun res!670184 () Bool)

(assert (=> b!1000711 (=> (not res!670184) (not e!563985))))

(declare-fun lt!442356 () SeekEntryResult!9379)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000711 (= res!670184 (or (= lt!442356 (MissingVacant!9379 i!1194)) (= lt!442356 (MissingZero!9379 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63243 (_ BitVec 32)) SeekEntryResult!9379)

(assert (=> b!1000711 (= lt!442356 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000712 () Bool)

(declare-fun res!670191 () Bool)

(assert (=> b!1000712 (=> (not res!670191) (not e!563984))))

(assert (=> b!1000712 (= res!670191 (validKeyInArray!0 k!2224))))

(declare-fun b!1000713 () Bool)

(declare-fun res!670188 () Bool)

(assert (=> b!1000713 (=> (not res!670188) (not e!563984))))

(assert (=> b!1000713 (= res!670188 (and (= (size!30949 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30949 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30949 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000714 () Bool)

(declare-fun res!670190 () Bool)

(assert (=> b!1000714 (=> (not res!670190) (not e!563983))))

(assert (=> b!1000714 (= res!670190 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30447 a!3219) j!170) a!3219 mask!3464) lt!442357))))

(declare-fun b!1000715 () Bool)

(declare-fun res!670194 () Bool)

(assert (=> b!1000715 (=> (not res!670194) (not e!563984))))

(declare-fun arrayContainsKey!0 (array!63243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000715 (= res!670194 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000716 () Bool)

(declare-fun res!670192 () Bool)

(assert (=> b!1000716 (=> (not res!670192) (not e!563985))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63243 (_ BitVec 32)) Bool)

(assert (=> b!1000716 (= res!670192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000710 () Bool)

(declare-fun res!670183 () Bool)

(assert (=> b!1000710 (=> (not res!670183) (not e!563983))))

(assert (=> b!1000710 (= res!670183 (not (= lt!442358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30447 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30447 a!3219) i!1194 k!2224) j!170) (array!63244 (store (arr!30447 a!3219) i!1194 k!2224) (size!30949 a!3219)) mask!3464))))))

(declare-fun res!670186 () Bool)

(assert (=> start!86442 (=> (not res!670186) (not e!563984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86442 (= res!670186 (validMask!0 mask!3464))))

(assert (=> start!86442 e!563984))

(declare-fun array_inv!23571 (array!63243) Bool)

(assert (=> start!86442 (array_inv!23571 a!3219)))

(assert (=> start!86442 true))

(assert (= (and start!86442 res!670186) b!1000713))

(assert (= (and b!1000713 res!670188) b!1000708))

(assert (= (and b!1000708 res!670187) b!1000712))

(assert (= (and b!1000712 res!670191) b!1000715))

(assert (= (and b!1000715 res!670194) b!1000711))

(assert (= (and b!1000711 res!670184) b!1000716))

(assert (= (and b!1000716 res!670192) b!1000705))

(assert (= (and b!1000705 res!670185) b!1000709))

(assert (= (and b!1000709 res!670189) b!1000707))

(assert (= (and b!1000707 res!670193) b!1000714))

(assert (= (and b!1000714 res!670190) b!1000710))

(assert (= (and b!1000710 res!670183) b!1000706))

(declare-fun m!926847 () Bool)

(assert (=> b!1000710 m!926847))

(declare-fun m!926849 () Bool)

(assert (=> b!1000710 m!926849))

(assert (=> b!1000710 m!926849))

(declare-fun m!926851 () Bool)

(assert (=> b!1000710 m!926851))

(assert (=> b!1000710 m!926851))

(assert (=> b!1000710 m!926849))

(declare-fun m!926853 () Bool)

(assert (=> b!1000710 m!926853))

(declare-fun m!926855 () Bool)

(assert (=> b!1000708 m!926855))

(assert (=> b!1000708 m!926855))

(declare-fun m!926857 () Bool)

(assert (=> b!1000708 m!926857))

(declare-fun m!926859 () Bool)

(assert (=> b!1000716 m!926859))

(declare-fun m!926861 () Bool)

(assert (=> b!1000705 m!926861))

(assert (=> b!1000707 m!926855))

(assert (=> b!1000707 m!926855))

(declare-fun m!926863 () Bool)

(assert (=> b!1000707 m!926863))

(assert (=> b!1000707 m!926863))

(assert (=> b!1000707 m!926855))

(declare-fun m!926865 () Bool)

(assert (=> b!1000707 m!926865))

(declare-fun m!926867 () Bool)

(assert (=> b!1000711 m!926867))

(declare-fun m!926869 () Bool)

(assert (=> start!86442 m!926869))

(declare-fun m!926871 () Bool)

(assert (=> start!86442 m!926871))

(declare-fun m!926873 () Bool)

(assert (=> b!1000715 m!926873))

(declare-fun m!926875 () Bool)

(assert (=> b!1000712 m!926875))

(assert (=> b!1000714 m!926855))

(assert (=> b!1000714 m!926855))

(declare-fun m!926877 () Bool)

(assert (=> b!1000714 m!926877))

(push 1)

(assert (not b!1000705))

(assert (not b!1000715))

(assert (not b!1000708))

