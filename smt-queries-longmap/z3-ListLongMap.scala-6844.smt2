; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86202 () Bool)

(assert start!86202)

(declare-fun b!997873 () Bool)

(declare-fun res!667800 () Bool)

(declare-fun e!562781 () Bool)

(assert (=> b!997873 (=> (not res!667800) (not e!562781))))

(declare-datatypes ((array!63052 0))(
  ( (array!63053 (arr!30354 (Array (_ BitVec 32) (_ BitVec 64))) (size!30858 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63052)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997873 (= res!667800 (validKeyInArray!0 (select (arr!30354 a!3219) j!170)))))

(declare-fun b!997874 () Bool)

(declare-fun e!562780 () Bool)

(assert (=> b!997874 (= e!562781 e!562780)))

(declare-fun res!667799 () Bool)

(assert (=> b!997874 (=> (not res!667799) (not e!562780))))

(declare-datatypes ((SeekEntryResult!9311 0))(
  ( (MissingZero!9311 (index!39615 (_ BitVec 32))) (Found!9311 (index!39616 (_ BitVec 32))) (Intermediate!9311 (undefined!10123 Bool) (index!39617 (_ BitVec 32)) (x!87066 (_ BitVec 32))) (Undefined!9311) (MissingVacant!9311 (index!39618 (_ BitVec 32))) )
))
(declare-fun lt!441402 () SeekEntryResult!9311)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997874 (= res!667799 (or (= lt!441402 (MissingVacant!9311 i!1194)) (= lt!441402 (MissingZero!9311 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63052 (_ BitVec 32)) SeekEntryResult!9311)

(assert (=> b!997874 (= lt!441402 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997875 () Bool)

(assert (=> b!997875 (= e!562780 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441403 () SeekEntryResult!9311)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63052 (_ BitVec 32)) SeekEntryResult!9311)

(assert (=> b!997875 (= lt!441403 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30354 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997876 () Bool)

(declare-fun res!667802 () Bool)

(assert (=> b!997876 (=> (not res!667802) (not e!562781))))

(assert (=> b!997876 (= res!667802 (validKeyInArray!0 k0!2224))))

(declare-fun b!997877 () Bool)

(declare-fun res!667801 () Bool)

(assert (=> b!997877 (=> (not res!667801) (not e!562781))))

(assert (=> b!997877 (= res!667801 (and (= (size!30858 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30858 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30858 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997878 () Bool)

(declare-fun res!667797 () Bool)

(assert (=> b!997878 (=> (not res!667797) (not e!562780))))

(declare-datatypes ((List!21096 0))(
  ( (Nil!21093) (Cons!21092 (h!22263 (_ BitVec 64)) (t!30088 List!21096)) )
))
(declare-fun arrayNoDuplicates!0 (array!63052 (_ BitVec 32) List!21096) Bool)

(assert (=> b!997878 (= res!667797 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21093))))

(declare-fun res!667798 () Bool)

(assert (=> start!86202 (=> (not res!667798) (not e!562781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86202 (= res!667798 (validMask!0 mask!3464))))

(assert (=> start!86202 e!562781))

(declare-fun array_inv!23497 (array!63052) Bool)

(assert (=> start!86202 (array_inv!23497 a!3219)))

(assert (=> start!86202 true))

(declare-fun b!997879 () Bool)

(declare-fun res!667796 () Bool)

(assert (=> b!997879 (=> (not res!667796) (not e!562781))))

(declare-fun arrayContainsKey!0 (array!63052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997879 (= res!667796 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997880 () Bool)

(declare-fun res!667794 () Bool)

(assert (=> b!997880 (=> (not res!667794) (not e!562780))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997880 (= res!667794 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30354 a!3219) j!170) mask!3464) (select (arr!30354 a!3219) j!170) a!3219 mask!3464) (Intermediate!9311 false resIndex!38 resX!38)))))

(declare-fun b!997881 () Bool)

(declare-fun res!667795 () Bool)

(assert (=> b!997881 (=> (not res!667795) (not e!562780))))

(assert (=> b!997881 (= res!667795 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30858 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30858 a!3219))))))

(declare-fun b!997882 () Bool)

(declare-fun res!667793 () Bool)

(assert (=> b!997882 (=> (not res!667793) (not e!562780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63052 (_ BitVec 32)) Bool)

(assert (=> b!997882 (= res!667793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86202 res!667798) b!997877))

(assert (= (and b!997877 res!667801) b!997873))

(assert (= (and b!997873 res!667800) b!997876))

(assert (= (and b!997876 res!667802) b!997879))

(assert (= (and b!997879 res!667796) b!997874))

(assert (= (and b!997874 res!667799) b!997882))

(assert (= (and b!997882 res!667793) b!997878))

(assert (= (and b!997878 res!667797) b!997881))

(assert (= (and b!997881 res!667795) b!997880))

(assert (= (and b!997880 res!667794) b!997875))

(declare-fun m!923971 () Bool)

(assert (=> start!86202 m!923971))

(declare-fun m!923973 () Bool)

(assert (=> start!86202 m!923973))

(declare-fun m!923975 () Bool)

(assert (=> b!997876 m!923975))

(declare-fun m!923977 () Bool)

(assert (=> b!997873 m!923977))

(assert (=> b!997873 m!923977))

(declare-fun m!923979 () Bool)

(assert (=> b!997873 m!923979))

(assert (=> b!997880 m!923977))

(assert (=> b!997880 m!923977))

(declare-fun m!923981 () Bool)

(assert (=> b!997880 m!923981))

(assert (=> b!997880 m!923981))

(assert (=> b!997880 m!923977))

(declare-fun m!923983 () Bool)

(assert (=> b!997880 m!923983))

(declare-fun m!923985 () Bool)

(assert (=> b!997879 m!923985))

(declare-fun m!923987 () Bool)

(assert (=> b!997874 m!923987))

(assert (=> b!997875 m!923977))

(assert (=> b!997875 m!923977))

(declare-fun m!923989 () Bool)

(assert (=> b!997875 m!923989))

(declare-fun m!923991 () Bool)

(assert (=> b!997878 m!923991))

(declare-fun m!923993 () Bool)

(assert (=> b!997882 m!923993))

(check-sat (not b!997879) (not b!997882) (not b!997875) (not b!997874) (not b!997878) (not b!997873) (not b!997876) (not b!997880) (not start!86202))
(check-sat)
