; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86418 () Bool)

(assert start!86418)

(declare-fun b!1000206 () Bool)

(declare-fun e!563756 () Bool)

(declare-fun e!563757 () Bool)

(assert (=> b!1000206 (= e!563756 e!563757)))

(declare-fun res!669818 () Bool)

(assert (=> b!1000206 (=> (not res!669818) (not e!563757))))

(declare-datatypes ((SeekEntryResult!9365 0))(
  ( (MissingZero!9365 (index!39831 (_ BitVec 32))) (Found!9365 (index!39832 (_ BitVec 32))) (Intermediate!9365 (undefined!10177 Bool) (index!39833 (_ BitVec 32)) (x!87276 (_ BitVec 32))) (Undefined!9365) (MissingVacant!9365 (index!39834 (_ BitVec 32))) )
))
(declare-fun lt!442054 () SeekEntryResult!9365)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000206 (= res!669818 (or (= lt!442054 (MissingVacant!9365 i!1194)) (= lt!442054 (MissingZero!9365 i!1194))))))

(declare-datatypes ((array!63166 0))(
  ( (array!63167 (arr!30408 (Array (_ BitVec 32) (_ BitVec 64))) (size!30912 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63166)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63166 (_ BitVec 32)) SeekEntryResult!9365)

(assert (=> b!1000206 (= lt!442054 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1000207 () Bool)

(declare-fun res!669816 () Bool)

(assert (=> b!1000207 (=> (not res!669816) (not e!563757))))

(declare-datatypes ((List!21150 0))(
  ( (Nil!21147) (Cons!21146 (h!22323 (_ BitVec 64)) (t!30142 List!21150)) )
))
(declare-fun arrayNoDuplicates!0 (array!63166 (_ BitVec 32) List!21150) Bool)

(assert (=> b!1000207 (= res!669816 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21147))))

(declare-fun b!1000208 () Bool)

(declare-fun res!669812 () Bool)

(assert (=> b!1000208 (=> (not res!669812) (not e!563756))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1000208 (= res!669812 (and (= (size!30912 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30912 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30912 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000209 () Bool)

(declare-fun res!669810 () Bool)

(assert (=> b!1000209 (=> (not res!669810) (not e!563756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000209 (= res!669810 (validKeyInArray!0 k0!2224))))

(declare-fun b!1000210 () Bool)

(declare-fun res!669815 () Bool)

(assert (=> b!1000210 (=> (not res!669815) (not e!563756))))

(assert (=> b!1000210 (= res!669815 (validKeyInArray!0 (select (arr!30408 a!3219) j!170)))))

(declare-fun b!1000211 () Bool)

(declare-fun e!563758 () Bool)

(assert (=> b!1000211 (= e!563757 e!563758)))

(declare-fun res!669809 () Bool)

(assert (=> b!1000211 (=> (not res!669809) (not e!563758))))

(declare-fun lt!442052 () SeekEntryResult!9365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63166 (_ BitVec 32)) SeekEntryResult!9365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000211 (= res!669809 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30408 a!3219) j!170) mask!3464) (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!442052))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000211 (= lt!442052 (Intermediate!9365 false resIndex!38 resX!38))))

(declare-fun b!1000212 () Bool)

(assert (=> b!1000212 (= e!563758 false)))

(declare-fun lt!442053 () SeekEntryResult!9365)

(assert (=> b!1000212 (= lt!442053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30408 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30408 a!3219) i!1194 k0!2224) j!170) (array!63167 (store (arr!30408 a!3219) i!1194 k0!2224) (size!30912 a!3219)) mask!3464))))

(declare-fun res!669814 () Bool)

(assert (=> start!86418 (=> (not res!669814) (not e!563756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86418 (= res!669814 (validMask!0 mask!3464))))

(assert (=> start!86418 e!563756))

(declare-fun array_inv!23551 (array!63166) Bool)

(assert (=> start!86418 (array_inv!23551 a!3219)))

(assert (=> start!86418 true))

(declare-fun b!1000213 () Bool)

(declare-fun res!669817 () Bool)

(assert (=> b!1000213 (=> (not res!669817) (not e!563756))))

(declare-fun arrayContainsKey!0 (array!63166 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000213 (= res!669817 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000214 () Bool)

(declare-fun res!669811 () Bool)

(assert (=> b!1000214 (=> (not res!669811) (not e!563758))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1000214 (= res!669811 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30408 a!3219) j!170) a!3219 mask!3464) lt!442052))))

(declare-fun b!1000215 () Bool)

(declare-fun res!669813 () Bool)

(assert (=> b!1000215 (=> (not res!669813) (not e!563757))))

(assert (=> b!1000215 (= res!669813 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30912 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30912 a!3219))))))

(declare-fun b!1000216 () Bool)

(declare-fun res!669808 () Bool)

(assert (=> b!1000216 (=> (not res!669808) (not e!563757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63166 (_ BitVec 32)) Bool)

(assert (=> b!1000216 (= res!669808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86418 res!669814) b!1000208))

(assert (= (and b!1000208 res!669812) b!1000210))

(assert (= (and b!1000210 res!669815) b!1000209))

(assert (= (and b!1000209 res!669810) b!1000213))

(assert (= (and b!1000213 res!669817) b!1000206))

(assert (= (and b!1000206 res!669818) b!1000216))

(assert (= (and b!1000216 res!669808) b!1000207))

(assert (= (and b!1000207 res!669816) b!1000215))

(assert (= (and b!1000215 res!669813) b!1000211))

(assert (= (and b!1000211 res!669809) b!1000214))

(assert (= (and b!1000214 res!669811) b!1000212))

(declare-fun m!925861 () Bool)

(assert (=> b!1000212 m!925861))

(declare-fun m!925863 () Bool)

(assert (=> b!1000212 m!925863))

(assert (=> b!1000212 m!925863))

(declare-fun m!925865 () Bool)

(assert (=> b!1000212 m!925865))

(assert (=> b!1000212 m!925865))

(assert (=> b!1000212 m!925863))

(declare-fun m!925867 () Bool)

(assert (=> b!1000212 m!925867))

(declare-fun m!925869 () Bool)

(assert (=> b!1000207 m!925869))

(declare-fun m!925871 () Bool)

(assert (=> b!1000206 m!925871))

(declare-fun m!925873 () Bool)

(assert (=> b!1000209 m!925873))

(declare-fun m!925875 () Bool)

(assert (=> start!86418 m!925875))

(declare-fun m!925877 () Bool)

(assert (=> start!86418 m!925877))

(declare-fun m!925879 () Bool)

(assert (=> b!1000214 m!925879))

(assert (=> b!1000214 m!925879))

(declare-fun m!925881 () Bool)

(assert (=> b!1000214 m!925881))

(declare-fun m!925883 () Bool)

(assert (=> b!1000213 m!925883))

(assert (=> b!1000211 m!925879))

(assert (=> b!1000211 m!925879))

(declare-fun m!925885 () Bool)

(assert (=> b!1000211 m!925885))

(assert (=> b!1000211 m!925885))

(assert (=> b!1000211 m!925879))

(declare-fun m!925887 () Bool)

(assert (=> b!1000211 m!925887))

(assert (=> b!1000210 m!925879))

(assert (=> b!1000210 m!925879))

(declare-fun m!925889 () Bool)

(assert (=> b!1000210 m!925889))

(declare-fun m!925891 () Bool)

(assert (=> b!1000216 m!925891))

(check-sat (not b!1000214) (not b!1000216) (not b!1000209) (not b!1000206) (not b!1000211) (not b!1000207) (not b!1000212) (not b!1000213) (not start!86418) (not b!1000210))
(check-sat)
