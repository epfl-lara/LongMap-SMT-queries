; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86750 () Bool)

(assert start!86750)

(declare-fun b!1005660 () Bool)

(declare-fun res!674756 () Bool)

(declare-fun e!566236 () Bool)

(assert (=> b!1005660 (=> (not res!674756) (not e!566236))))

(declare-datatypes ((array!63449 0))(
  ( (array!63450 (arr!30547 (Array (_ BitVec 32) (_ BitVec 64))) (size!31049 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63449)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005660 (= res!674756 (validKeyInArray!0 (select (arr!30547 a!3219) j!170)))))

(declare-fun b!1005661 () Bool)

(declare-fun res!674757 () Bool)

(declare-fun e!566235 () Bool)

(assert (=> b!1005661 (=> (not res!674757) (not e!566235))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005661 (= res!674757 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31049 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31049 a!3219))))))

(declare-fun b!1005662 () Bool)

(declare-fun res!674752 () Bool)

(assert (=> b!1005662 (=> (not res!674752) (not e!566235))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9479 0))(
  ( (MissingZero!9479 (index!40287 (_ BitVec 32))) (Found!9479 (index!40288 (_ BitVec 32))) (Intermediate!9479 (undefined!10291 Bool) (index!40289 (_ BitVec 32)) (x!87695 (_ BitVec 32))) (Undefined!9479) (MissingVacant!9479 (index!40290 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63449 (_ BitVec 32)) SeekEntryResult!9479)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005662 (= res!674752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) (select (arr!30547 a!3219) j!170) a!3219 mask!3464) (Intermediate!9479 false resIndex!38 resX!38)))))

(declare-fun b!1005663 () Bool)

(assert (=> b!1005663 (= e!566235 false)))

(declare-fun lt!444598 () SeekEntryResult!9479)

(assert (=> b!1005663 (= lt!444598 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30547 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005664 () Bool)

(assert (=> b!1005664 (= e!566236 e!566235)))

(declare-fun res!674754 () Bool)

(assert (=> b!1005664 (=> (not res!674754) (not e!566235))))

(declare-fun lt!444599 () SeekEntryResult!9479)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005664 (= res!674754 (or (= lt!444599 (MissingVacant!9479 i!1194)) (= lt!444599 (MissingZero!9479 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63449 (_ BitVec 32)) SeekEntryResult!9479)

(assert (=> b!1005664 (= lt!444599 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005665 () Bool)

(declare-fun res!674748 () Bool)

(assert (=> b!1005665 (=> (not res!674748) (not e!566236))))

(assert (=> b!1005665 (= res!674748 (validKeyInArray!0 k!2224))))

(declare-fun res!674749 () Bool)

(assert (=> start!86750 (=> (not res!674749) (not e!566236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86750 (= res!674749 (validMask!0 mask!3464))))

(assert (=> start!86750 e!566236))

(declare-fun array_inv!23671 (array!63449) Bool)

(assert (=> start!86750 (array_inv!23671 a!3219)))

(assert (=> start!86750 true))

(declare-fun b!1005666 () Bool)

(declare-fun res!674751 () Bool)

(assert (=> b!1005666 (=> (not res!674751) (not e!566235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63449 (_ BitVec 32)) Bool)

(assert (=> b!1005666 (= res!674751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005667 () Bool)

(declare-fun res!674753 () Bool)

(assert (=> b!1005667 (=> (not res!674753) (not e!566236))))

(assert (=> b!1005667 (= res!674753 (and (= (size!31049 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31049 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31049 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005668 () Bool)

(declare-fun res!674750 () Bool)

(assert (=> b!1005668 (=> (not res!674750) (not e!566235))))

(declare-datatypes ((List!21223 0))(
  ( (Nil!21220) (Cons!21219 (h!22402 (_ BitVec 64)) (t!30224 List!21223)) )
))
(declare-fun arrayNoDuplicates!0 (array!63449 (_ BitVec 32) List!21223) Bool)

(assert (=> b!1005668 (= res!674750 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21220))))

(declare-fun b!1005669 () Bool)

(declare-fun res!674755 () Bool)

(assert (=> b!1005669 (=> (not res!674755) (not e!566236))))

(declare-fun arrayContainsKey!0 (array!63449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005669 (= res!674755 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86750 res!674749) b!1005667))

(assert (= (and b!1005667 res!674753) b!1005660))

(assert (= (and b!1005660 res!674756) b!1005665))

(assert (= (and b!1005665 res!674748) b!1005669))

(assert (= (and b!1005669 res!674755) b!1005664))

(assert (= (and b!1005664 res!674754) b!1005666))

(assert (= (and b!1005666 res!674751) b!1005668))

(assert (= (and b!1005668 res!674750) b!1005661))

(assert (= (and b!1005661 res!674757) b!1005662))

(assert (= (and b!1005662 res!674752) b!1005663))

(declare-fun m!930857 () Bool)

(assert (=> b!1005664 m!930857))

(declare-fun m!930859 () Bool)

(assert (=> start!86750 m!930859))

(declare-fun m!930861 () Bool)

(assert (=> start!86750 m!930861))

(declare-fun m!930863 () Bool)

(assert (=> b!1005660 m!930863))

(assert (=> b!1005660 m!930863))

(declare-fun m!930865 () Bool)

(assert (=> b!1005660 m!930865))

(declare-fun m!930867 () Bool)

(assert (=> b!1005668 m!930867))

(declare-fun m!930869 () Bool)

(assert (=> b!1005666 m!930869))

(declare-fun m!930871 () Bool)

(assert (=> b!1005665 m!930871))

(declare-fun m!930873 () Bool)

(assert (=> b!1005669 m!930873))

(assert (=> b!1005663 m!930863))

(assert (=> b!1005663 m!930863))

(declare-fun m!930875 () Bool)

(assert (=> b!1005663 m!930875))

(assert (=> b!1005662 m!930863))

(assert (=> b!1005662 m!930863))

(declare-fun m!930877 () Bool)

(assert (=> b!1005662 m!930877))

(assert (=> b!1005662 m!930877))

(assert (=> b!1005662 m!930863))

(declare-fun m!930879 () Bool)

(assert (=> b!1005662 m!930879))

(push 1)

