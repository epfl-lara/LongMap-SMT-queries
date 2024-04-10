; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86496 () Bool)

(assert start!86496)

(declare-fun b!1001853 () Bool)

(declare-fun e!564480 () Bool)

(declare-fun e!564478 () Bool)

(assert (=> b!1001853 (= e!564480 e!564478)))

(declare-fun res!671345 () Bool)

(assert (=> b!1001853 (=> (not res!671345) (not e!564478))))

(declare-datatypes ((array!63297 0))(
  ( (array!63298 (arr!30474 (Array (_ BitVec 32) (_ BitVec 64))) (size!30976 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63297)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!442882 () (_ BitVec 32))

(assert (=> b!1001853 (= res!671345 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442882 #b00000000000000000000000000000000) (bvslt lt!442882 (size!30976 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001853 (= lt!442882 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001854 () Bool)

(declare-fun e!564481 () Bool)

(declare-fun e!564477 () Bool)

(assert (=> b!1001854 (= e!564481 e!564477)))

(declare-fun res!671340 () Bool)

(assert (=> b!1001854 (=> (not res!671340) (not e!564477))))

(declare-datatypes ((SeekEntryResult!9406 0))(
  ( (MissingZero!9406 (index!39995 (_ BitVec 32))) (Found!9406 (index!39996 (_ BitVec 32))) (Intermediate!9406 (undefined!10218 Bool) (index!39997 (_ BitVec 32)) (x!87410 (_ BitVec 32))) (Undefined!9406) (MissingVacant!9406 (index!39998 (_ BitVec 32))) )
))
(declare-fun lt!442887 () SeekEntryResult!9406)

(declare-fun lt!442884 () SeekEntryResult!9406)

(assert (=> b!1001854 (= res!671340 (= lt!442887 lt!442884))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63297 (_ BitVec 32)) SeekEntryResult!9406)

(assert (=> b!1001854 (= lt!442887 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30474 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001855 () Bool)

(declare-fun res!671337 () Bool)

(declare-fun e!564476 () Bool)

(assert (=> b!1001855 (=> (not res!671337) (not e!564476))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001855 (= res!671337 (validKeyInArray!0 k!2224))))

(declare-fun b!1001856 () Bool)

(declare-fun res!671346 () Bool)

(declare-fun e!564479 () Bool)

(assert (=> b!1001856 (=> (not res!671346) (not e!564479))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001856 (= res!671346 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30976 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30976 a!3219))))))

(declare-fun b!1001857 () Bool)

(declare-fun res!671331 () Bool)

(assert (=> b!1001857 (=> (not res!671331) (not e!564480))))

(declare-fun lt!442885 () array!63297)

(declare-fun lt!442886 () (_ BitVec 64))

(assert (=> b!1001857 (= res!671331 (not (= lt!442887 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442886 lt!442885 mask!3464))))))

(declare-fun b!1001858 () Bool)

(assert (=> b!1001858 (= e!564477 e!564480)))

(declare-fun res!671332 () Bool)

(assert (=> b!1001858 (=> (not res!671332) (not e!564480))))

(declare-fun lt!442883 () SeekEntryResult!9406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001858 (= res!671332 (not (= lt!442883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442886 mask!3464) lt!442886 lt!442885 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001858 (= lt!442886 (select (store (arr!30474 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001858 (= lt!442885 (array!63298 (store (arr!30474 a!3219) i!1194 k!2224) (size!30976 a!3219)))))

(declare-fun b!1001859 () Bool)

(declare-fun res!671341 () Bool)

(assert (=> b!1001859 (=> (not res!671341) (not e!564480))))

(assert (=> b!1001859 (= res!671341 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001860 () Bool)

(assert (=> b!1001860 (= e!564478 false)))

(declare-fun lt!442888 () SeekEntryResult!9406)

(assert (=> b!1001860 (= lt!442888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442882 lt!442886 lt!442885 mask!3464))))

(declare-fun b!1001861 () Bool)

(declare-fun res!671334 () Bool)

(assert (=> b!1001861 (=> (not res!671334) (not e!564479))))

(declare-datatypes ((List!21150 0))(
  ( (Nil!21147) (Cons!21146 (h!22323 (_ BitVec 64)) (t!30151 List!21150)) )
))
(declare-fun arrayNoDuplicates!0 (array!63297 (_ BitVec 32) List!21150) Bool)

(assert (=> b!1001861 (= res!671334 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21147))))

(declare-fun b!1001862 () Bool)

(assert (=> b!1001862 (= e!564476 e!564479)))

(declare-fun res!671344 () Bool)

(assert (=> b!1001862 (=> (not res!671344) (not e!564479))))

(declare-fun lt!442889 () SeekEntryResult!9406)

(assert (=> b!1001862 (= res!671344 (or (= lt!442889 (MissingVacant!9406 i!1194)) (= lt!442889 (MissingZero!9406 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63297 (_ BitVec 32)) SeekEntryResult!9406)

(assert (=> b!1001862 (= lt!442889 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun res!671343 () Bool)

(assert (=> start!86496 (=> (not res!671343) (not e!564476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86496 (= res!671343 (validMask!0 mask!3464))))

(assert (=> start!86496 e!564476))

(declare-fun array_inv!23598 (array!63297) Bool)

(assert (=> start!86496 (array_inv!23598 a!3219)))

(assert (=> start!86496 true))

(declare-fun b!1001863 () Bool)

(declare-fun res!671338 () Bool)

(assert (=> b!1001863 (=> (not res!671338) (not e!564476))))

(assert (=> b!1001863 (= res!671338 (validKeyInArray!0 (select (arr!30474 a!3219) j!170)))))

(declare-fun b!1001864 () Bool)

(declare-fun res!671342 () Bool)

(assert (=> b!1001864 (=> (not res!671342) (not e!564476))))

(declare-fun arrayContainsKey!0 (array!63297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001864 (= res!671342 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001865 () Bool)

(assert (=> b!1001865 (= e!564479 e!564481)))

(declare-fun res!671333 () Bool)

(assert (=> b!1001865 (=> (not res!671333) (not e!564481))))

(assert (=> b!1001865 (= res!671333 (= lt!442883 lt!442884))))

(assert (=> b!1001865 (= lt!442884 (Intermediate!9406 false resIndex!38 resX!38))))

(assert (=> b!1001865 (= lt!442883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30474 a!3219) j!170) mask!3464) (select (arr!30474 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001866 () Bool)

(declare-fun res!671335 () Bool)

(assert (=> b!1001866 (=> (not res!671335) (not e!564478))))

(assert (=> b!1001866 (= res!671335 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442882 (select (arr!30474 a!3219) j!170) a!3219 mask!3464) lt!442884))))

(declare-fun b!1001867 () Bool)

(declare-fun res!671339 () Bool)

(assert (=> b!1001867 (=> (not res!671339) (not e!564479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63297 (_ BitVec 32)) Bool)

(assert (=> b!1001867 (= res!671339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001868 () Bool)

(declare-fun res!671336 () Bool)

(assert (=> b!1001868 (=> (not res!671336) (not e!564476))))

(assert (=> b!1001868 (= res!671336 (and (= (size!30976 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30976 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30976 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86496 res!671343) b!1001868))

(assert (= (and b!1001868 res!671336) b!1001863))

(assert (= (and b!1001863 res!671338) b!1001855))

(assert (= (and b!1001855 res!671337) b!1001864))

(assert (= (and b!1001864 res!671342) b!1001862))

(assert (= (and b!1001862 res!671344) b!1001867))

(assert (= (and b!1001867 res!671339) b!1001861))

(assert (= (and b!1001861 res!671334) b!1001856))

(assert (= (and b!1001856 res!671346) b!1001865))

(assert (= (and b!1001865 res!671333) b!1001854))

(assert (= (and b!1001854 res!671340) b!1001858))

(assert (= (and b!1001858 res!671332) b!1001857))

(assert (= (and b!1001857 res!671331) b!1001859))

(assert (= (and b!1001859 res!671341) b!1001853))

(assert (= (and b!1001853 res!671345) b!1001866))

(assert (= (and b!1001866 res!671335) b!1001860))

(declare-fun m!927829 () Bool)

(assert (=> b!1001857 m!927829))

(declare-fun m!927831 () Bool)

(assert (=> b!1001855 m!927831))

(declare-fun m!927833 () Bool)

(assert (=> b!1001865 m!927833))

(assert (=> b!1001865 m!927833))

(declare-fun m!927835 () Bool)

(assert (=> b!1001865 m!927835))

(assert (=> b!1001865 m!927835))

(assert (=> b!1001865 m!927833))

(declare-fun m!927837 () Bool)

(assert (=> b!1001865 m!927837))

(declare-fun m!927839 () Bool)

(assert (=> b!1001860 m!927839))

(declare-fun m!927841 () Bool)

(assert (=> b!1001853 m!927841))

(declare-fun m!927843 () Bool)

(assert (=> b!1001867 m!927843))

(assert (=> b!1001854 m!927833))

(assert (=> b!1001854 m!927833))

(declare-fun m!927845 () Bool)

(assert (=> b!1001854 m!927845))

(declare-fun m!927847 () Bool)

(assert (=> b!1001862 m!927847))

(declare-fun m!927849 () Bool)

(assert (=> b!1001861 m!927849))

(declare-fun m!927851 () Bool)

(assert (=> b!1001858 m!927851))

(assert (=> b!1001858 m!927851))

(declare-fun m!927853 () Bool)

(assert (=> b!1001858 m!927853))

(declare-fun m!927855 () Bool)

(assert (=> b!1001858 m!927855))

(declare-fun m!927857 () Bool)

(assert (=> b!1001858 m!927857))

(assert (=> b!1001866 m!927833))

(assert (=> b!1001866 m!927833))

(declare-fun m!927859 () Bool)

(assert (=> b!1001866 m!927859))

(assert (=> b!1001863 m!927833))

(assert (=> b!1001863 m!927833))

(declare-fun m!927861 () Bool)

(assert (=> b!1001863 m!927861))

(declare-fun m!927863 () Bool)

(assert (=> start!86496 m!927863))

(declare-fun m!927865 () Bool)

(assert (=> start!86496 m!927865))

(declare-fun m!927867 () Bool)

(assert (=> b!1001864 m!927867))

(push 1)

(assert (not b!1001854))

(assert (not b!1001866))

(assert (not b!1001862))

(assert (not b!1001865))

(assert (not b!1001858))

(assert (not start!86496))

(assert (not b!1001864))

(assert (not b!1001857))

(assert (not b!1001853))

(assert (not b!1001860))

(assert (not b!1001867))

(assert (not b!1001863))

(assert (not b!1001861))

(assert (not b!1001855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

