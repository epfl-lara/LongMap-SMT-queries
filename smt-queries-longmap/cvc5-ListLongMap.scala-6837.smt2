; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86060 () Bool)

(assert start!86060)

(declare-fun b!996910 () Bool)

(declare-fun res!667027 () Bool)

(declare-fun e!562351 () Bool)

(assert (=> b!996910 (=> (not res!667027) (not e!562351))))

(declare-datatypes ((array!63065 0))(
  ( (array!63066 (arr!30364 (Array (_ BitVec 32) (_ BitVec 64))) (size!30866 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63065)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996910 (= res!667027 (and (= (size!30866 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30866 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30866 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996912 () Bool)

(declare-fun e!562350 () Bool)

(assert (=> b!996912 (= e!562350 false)))

(declare-datatypes ((SeekEntryResult!9296 0))(
  ( (MissingZero!9296 (index!39555 (_ BitVec 32))) (Found!9296 (index!39556 (_ BitVec 32))) (Intermediate!9296 (undefined!10108 Bool) (index!39557 (_ BitVec 32)) (x!86988 (_ BitVec 32))) (Undefined!9296) (MissingVacant!9296 (index!39558 (_ BitVec 32))) )
))
(declare-fun lt!441307 () SeekEntryResult!9296)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63065 (_ BitVec 32)) SeekEntryResult!9296)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996912 (= lt!441307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30364 a!3219) j!170) mask!3464) (select (arr!30364 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996913 () Bool)

(declare-fun res!667032 () Bool)

(assert (=> b!996913 (=> (not res!667032) (not e!562351))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996913 (= res!667032 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996914 () Bool)

(declare-fun res!667030 () Bool)

(assert (=> b!996914 (=> (not res!667030) (not e!562350))))

(declare-datatypes ((List!21040 0))(
  ( (Nil!21037) (Cons!21036 (h!22201 (_ BitVec 64)) (t!30041 List!21040)) )
))
(declare-fun arrayNoDuplicates!0 (array!63065 (_ BitVec 32) List!21040) Bool)

(assert (=> b!996914 (= res!667030 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21037))))

(declare-fun b!996915 () Bool)

(declare-fun res!667029 () Bool)

(assert (=> b!996915 (=> (not res!667029) (not e!562350))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996915 (= res!667029 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30866 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30866 a!3219))))))

(declare-fun b!996916 () Bool)

(declare-fun res!667031 () Bool)

(assert (=> b!996916 (=> (not res!667031) (not e!562350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63065 (_ BitVec 32)) Bool)

(assert (=> b!996916 (= res!667031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996917 () Bool)

(declare-fun res!667025 () Bool)

(assert (=> b!996917 (=> (not res!667025) (not e!562351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996917 (= res!667025 (validKeyInArray!0 (select (arr!30364 a!3219) j!170)))))

(declare-fun b!996918 () Bool)

(assert (=> b!996918 (= e!562351 e!562350)))

(declare-fun res!667028 () Bool)

(assert (=> b!996918 (=> (not res!667028) (not e!562350))))

(declare-fun lt!441308 () SeekEntryResult!9296)

(assert (=> b!996918 (= res!667028 (or (= lt!441308 (MissingVacant!9296 i!1194)) (= lt!441308 (MissingZero!9296 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63065 (_ BitVec 32)) SeekEntryResult!9296)

(assert (=> b!996918 (= lt!441308 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996911 () Bool)

(declare-fun res!667026 () Bool)

(assert (=> b!996911 (=> (not res!667026) (not e!562351))))

(assert (=> b!996911 (= res!667026 (validKeyInArray!0 k!2224))))

(declare-fun res!667024 () Bool)

(assert (=> start!86060 (=> (not res!667024) (not e!562351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86060 (= res!667024 (validMask!0 mask!3464))))

(assert (=> start!86060 e!562351))

(declare-fun array_inv!23488 (array!63065) Bool)

(assert (=> start!86060 (array_inv!23488 a!3219)))

(assert (=> start!86060 true))

(assert (= (and start!86060 res!667024) b!996910))

(assert (= (and b!996910 res!667027) b!996917))

(assert (= (and b!996917 res!667025) b!996911))

(assert (= (and b!996911 res!667026) b!996913))

(assert (= (and b!996913 res!667032) b!996918))

(assert (= (and b!996918 res!667028) b!996916))

(assert (= (and b!996916 res!667031) b!996914))

(assert (= (and b!996914 res!667030) b!996915))

(assert (= (and b!996915 res!667029) b!996912))

(declare-fun m!923915 () Bool)

(assert (=> b!996912 m!923915))

(assert (=> b!996912 m!923915))

(declare-fun m!923917 () Bool)

(assert (=> b!996912 m!923917))

(assert (=> b!996912 m!923917))

(assert (=> b!996912 m!923915))

(declare-fun m!923919 () Bool)

(assert (=> b!996912 m!923919))

(assert (=> b!996917 m!923915))

(assert (=> b!996917 m!923915))

(declare-fun m!923921 () Bool)

(assert (=> b!996917 m!923921))

(declare-fun m!923923 () Bool)

(assert (=> b!996918 m!923923))

(declare-fun m!923925 () Bool)

(assert (=> b!996914 m!923925))

(declare-fun m!923927 () Bool)

(assert (=> b!996911 m!923927))

(declare-fun m!923929 () Bool)

(assert (=> start!86060 m!923929))

(declare-fun m!923931 () Bool)

(assert (=> start!86060 m!923931))

(declare-fun m!923933 () Bool)

(assert (=> b!996916 m!923933))

(declare-fun m!923935 () Bool)

(assert (=> b!996913 m!923935))

(push 1)

