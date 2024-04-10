; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86914 () Bool)

(assert start!86914)

(declare-fun res!676872 () Bool)

(declare-fun e!567217 () Bool)

(assert (=> start!86914 (=> (not res!676872) (not e!567217))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86914 (= res!676872 (validMask!0 mask!3464))))

(assert (=> start!86914 e!567217))

(declare-datatypes ((array!63562 0))(
  ( (array!63563 (arr!30602 (Array (_ BitVec 32) (_ BitVec 64))) (size!31104 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63562)

(declare-fun array_inv!23726 (array!63562) Bool)

(assert (=> start!86914 (array_inv!23726 a!3219)))

(assert (=> start!86914 true))

(declare-fun b!1007969 () Bool)

(declare-fun e!567216 () Bool)

(declare-fun e!567212 () Bool)

(assert (=> b!1007969 (= e!567216 e!567212)))

(declare-fun res!676873 () Bool)

(assert (=> b!1007969 (=> (not res!676873) (not e!567212))))

(declare-datatypes ((SeekEntryResult!9534 0))(
  ( (MissingZero!9534 (index!40507 (_ BitVec 32))) (Found!9534 (index!40508 (_ BitVec 32))) (Intermediate!9534 (undefined!10346 Bool) (index!40509 (_ BitVec 32)) (x!87900 (_ BitVec 32))) (Undefined!9534) (MissingVacant!9534 (index!40510 (_ BitVec 32))) )
))
(declare-fun lt!445466 () SeekEntryResult!9534)

(declare-fun lt!445465 () SeekEntryResult!9534)

(assert (=> b!1007969 (= res!676873 (= lt!445466 lt!445465))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007969 (= lt!445465 (Intermediate!9534 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63562 (_ BitVec 32)) SeekEntryResult!9534)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007969 (= lt!445466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30602 a!3219) j!170) mask!3464) (select (arr!30602 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007970 () Bool)

(declare-fun res!676863 () Bool)

(assert (=> b!1007970 (=> (not res!676863) (not e!567217))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007970 (= res!676863 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007971 () Bool)

(declare-fun res!676865 () Bool)

(declare-fun e!567213 () Bool)

(assert (=> b!1007971 (=> (not res!676865) (not e!567213))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445464 () SeekEntryResult!9534)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!445467 () array!63562)

(declare-fun lt!445463 () (_ BitVec 64))

(assert (=> b!1007971 (= res!676865 (not (= lt!445464 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445463 lt!445467 mask!3464))))))

(declare-fun b!1007972 () Bool)

(declare-fun e!567215 () Bool)

(assert (=> b!1007972 (= e!567212 e!567215)))

(declare-fun res!676866 () Bool)

(assert (=> b!1007972 (=> (not res!676866) (not e!567215))))

(assert (=> b!1007972 (= res!676866 (= lt!445464 lt!445465))))

(assert (=> b!1007972 (= lt!445464 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30602 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007973 () Bool)

(assert (=> b!1007973 (= e!567213 false)))

(declare-fun lt!445469 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007973 (= lt!445469 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007974 () Bool)

(assert (=> b!1007974 (= e!567217 e!567216)))

(declare-fun res!676868 () Bool)

(assert (=> b!1007974 (=> (not res!676868) (not e!567216))))

(declare-fun lt!445468 () SeekEntryResult!9534)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007974 (= res!676868 (or (= lt!445468 (MissingVacant!9534 i!1194)) (= lt!445468 (MissingZero!9534 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63562 (_ BitVec 32)) SeekEntryResult!9534)

(assert (=> b!1007974 (= lt!445468 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007975 () Bool)

(declare-fun res!676867 () Bool)

(assert (=> b!1007975 (=> (not res!676867) (not e!567216))))

(declare-datatypes ((List!21278 0))(
  ( (Nil!21275) (Cons!21274 (h!22460 (_ BitVec 64)) (t!30279 List!21278)) )
))
(declare-fun arrayNoDuplicates!0 (array!63562 (_ BitVec 32) List!21278) Bool)

(assert (=> b!1007975 (= res!676867 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21275))))

(declare-fun b!1007976 () Bool)

(declare-fun res!676871 () Bool)

(assert (=> b!1007976 (=> (not res!676871) (not e!567216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63562 (_ BitVec 32)) Bool)

(assert (=> b!1007976 (= res!676871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007977 () Bool)

(declare-fun res!676874 () Bool)

(assert (=> b!1007977 (=> (not res!676874) (not e!567213))))

(assert (=> b!1007977 (= res!676874 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007978 () Bool)

(declare-fun res!676864 () Bool)

(assert (=> b!1007978 (=> (not res!676864) (not e!567217))))

(assert (=> b!1007978 (= res!676864 (validKeyInArray!0 (select (arr!30602 a!3219) j!170)))))

(declare-fun b!1007979 () Bool)

(declare-fun res!676862 () Bool)

(assert (=> b!1007979 (=> (not res!676862) (not e!567216))))

(assert (=> b!1007979 (= res!676862 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31104 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31104 a!3219))))))

(declare-fun b!1007980 () Bool)

(declare-fun res!676870 () Bool)

(assert (=> b!1007980 (=> (not res!676870) (not e!567217))))

(assert (=> b!1007980 (= res!676870 (and (= (size!31104 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31104 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31104 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007981 () Bool)

(assert (=> b!1007981 (= e!567215 e!567213)))

(declare-fun res!676869 () Bool)

(assert (=> b!1007981 (=> (not res!676869) (not e!567213))))

(assert (=> b!1007981 (= res!676869 (not (= lt!445466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445463 mask!3464) lt!445463 lt!445467 mask!3464))))))

(assert (=> b!1007981 (= lt!445463 (select (store (arr!30602 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007981 (= lt!445467 (array!63563 (store (arr!30602 a!3219) i!1194 k0!2224) (size!31104 a!3219)))))

(declare-fun b!1007982 () Bool)

(declare-fun res!676875 () Bool)

(assert (=> b!1007982 (=> (not res!676875) (not e!567217))))

(declare-fun arrayContainsKey!0 (array!63562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007982 (= res!676875 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86914 res!676872) b!1007980))

(assert (= (and b!1007980 res!676870) b!1007978))

(assert (= (and b!1007978 res!676864) b!1007970))

(assert (= (and b!1007970 res!676863) b!1007982))

(assert (= (and b!1007982 res!676875) b!1007974))

(assert (= (and b!1007974 res!676868) b!1007976))

(assert (= (and b!1007976 res!676871) b!1007975))

(assert (= (and b!1007975 res!676867) b!1007979))

(assert (= (and b!1007979 res!676862) b!1007969))

(assert (= (and b!1007969 res!676873) b!1007972))

(assert (= (and b!1007972 res!676866) b!1007981))

(assert (= (and b!1007981 res!676869) b!1007971))

(assert (= (and b!1007971 res!676865) b!1007977))

(assert (= (and b!1007977 res!676874) b!1007973))

(declare-fun m!932783 () Bool)

(assert (=> b!1007969 m!932783))

(assert (=> b!1007969 m!932783))

(declare-fun m!932785 () Bool)

(assert (=> b!1007969 m!932785))

(assert (=> b!1007969 m!932785))

(assert (=> b!1007969 m!932783))

(declare-fun m!932787 () Bool)

(assert (=> b!1007969 m!932787))

(declare-fun m!932789 () Bool)

(assert (=> b!1007971 m!932789))

(declare-fun m!932791 () Bool)

(assert (=> b!1007973 m!932791))

(assert (=> b!1007972 m!932783))

(assert (=> b!1007972 m!932783))

(declare-fun m!932793 () Bool)

(assert (=> b!1007972 m!932793))

(declare-fun m!932795 () Bool)

(assert (=> b!1007976 m!932795))

(declare-fun m!932797 () Bool)

(assert (=> b!1007974 m!932797))

(declare-fun m!932799 () Bool)

(assert (=> b!1007981 m!932799))

(assert (=> b!1007981 m!932799))

(declare-fun m!932801 () Bool)

(assert (=> b!1007981 m!932801))

(declare-fun m!932803 () Bool)

(assert (=> b!1007981 m!932803))

(declare-fun m!932805 () Bool)

(assert (=> b!1007981 m!932805))

(declare-fun m!932807 () Bool)

(assert (=> start!86914 m!932807))

(declare-fun m!932809 () Bool)

(assert (=> start!86914 m!932809))

(declare-fun m!932811 () Bool)

(assert (=> b!1007975 m!932811))

(assert (=> b!1007978 m!932783))

(assert (=> b!1007978 m!932783))

(declare-fun m!932813 () Bool)

(assert (=> b!1007978 m!932813))

(declare-fun m!932815 () Bool)

(assert (=> b!1007970 m!932815))

(declare-fun m!932817 () Bool)

(assert (=> b!1007982 m!932817))

(check-sat (not b!1007969) (not b!1007978) (not b!1007972) (not b!1007970) (not b!1007975) (not b!1007982) (not b!1007974) (not b!1007981) (not b!1007973) (not start!86914) (not b!1007971) (not b!1007976))
(check-sat)
