; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86770 () Bool)

(assert start!86770)

(declare-fun b!1005960 () Bool)

(declare-fun e!566325 () Bool)

(declare-fun e!566326 () Bool)

(assert (=> b!1005960 (= e!566325 e!566326)))

(declare-fun res!675057 () Bool)

(assert (=> b!1005960 (=> (not res!675057) (not e!566326))))

(declare-datatypes ((SeekEntryResult!9489 0))(
  ( (MissingZero!9489 (index!40327 (_ BitVec 32))) (Found!9489 (index!40328 (_ BitVec 32))) (Intermediate!9489 (undefined!10301 Bool) (index!40329 (_ BitVec 32)) (x!87729 (_ BitVec 32))) (Undefined!9489) (MissingVacant!9489 (index!40330 (_ BitVec 32))) )
))
(declare-fun lt!444659 () SeekEntryResult!9489)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005960 (= res!675057 (or (= lt!444659 (MissingVacant!9489 i!1194)) (= lt!444659 (MissingZero!9489 i!1194))))))

(declare-datatypes ((array!63469 0))(
  ( (array!63470 (arr!30557 (Array (_ BitVec 32) (_ BitVec 64))) (size!31059 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63469)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63469 (_ BitVec 32)) SeekEntryResult!9489)

(assert (=> b!1005960 (= lt!444659 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005961 () Bool)

(declare-fun res!675054 () Bool)

(assert (=> b!1005961 (=> (not res!675054) (not e!566325))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005961 (= res!675054 (validKeyInArray!0 (select (arr!30557 a!3219) j!170)))))

(declare-fun b!1005962 () Bool)

(declare-fun res!675048 () Bool)

(assert (=> b!1005962 (=> (not res!675048) (not e!566326))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005962 (= res!675048 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31059 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31059 a!3219))))))

(declare-fun b!1005963 () Bool)

(declare-fun res!675056 () Bool)

(assert (=> b!1005963 (=> (not res!675056) (not e!566325))))

(assert (=> b!1005963 (= res!675056 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005964 () Bool)

(declare-fun res!675049 () Bool)

(assert (=> b!1005964 (=> (not res!675049) (not e!566325))))

(assert (=> b!1005964 (= res!675049 (and (= (size!31059 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31059 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31059 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!675051 () Bool)

(assert (=> start!86770 (=> (not res!675051) (not e!566325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86770 (= res!675051 (validMask!0 mask!3464))))

(assert (=> start!86770 e!566325))

(declare-fun array_inv!23681 (array!63469) Bool)

(assert (=> start!86770 (array_inv!23681 a!3219)))

(assert (=> start!86770 true))

(declare-fun b!1005965 () Bool)

(declare-fun res!675050 () Bool)

(assert (=> b!1005965 (=> (not res!675050) (not e!566326))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63469 (_ BitVec 32)) SeekEntryResult!9489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005965 (= res!675050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30557 a!3219) j!170) mask!3464) (select (arr!30557 a!3219) j!170) a!3219 mask!3464) (Intermediate!9489 false resIndex!38 resX!38)))))

(declare-fun b!1005966 () Bool)

(declare-fun res!675055 () Bool)

(assert (=> b!1005966 (=> (not res!675055) (not e!566326))))

(declare-datatypes ((List!21233 0))(
  ( (Nil!21230) (Cons!21229 (h!22412 (_ BitVec 64)) (t!30234 List!21233)) )
))
(declare-fun arrayNoDuplicates!0 (array!63469 (_ BitVec 32) List!21233) Bool)

(assert (=> b!1005966 (= res!675055 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21230))))

(declare-fun b!1005967 () Bool)

(declare-fun res!675052 () Bool)

(assert (=> b!1005967 (=> (not res!675052) (not e!566325))))

(declare-fun arrayContainsKey!0 (array!63469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005967 (= res!675052 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005968 () Bool)

(assert (=> b!1005968 (= e!566326 false)))

(declare-fun lt!444658 () SeekEntryResult!9489)

(assert (=> b!1005968 (= lt!444658 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30557 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005969 () Bool)

(declare-fun res!675053 () Bool)

(assert (=> b!1005969 (=> (not res!675053) (not e!566326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63469 (_ BitVec 32)) Bool)

(assert (=> b!1005969 (= res!675053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86770 res!675051) b!1005964))

(assert (= (and b!1005964 res!675049) b!1005961))

(assert (= (and b!1005961 res!675054) b!1005963))

(assert (= (and b!1005963 res!675056) b!1005967))

(assert (= (and b!1005967 res!675052) b!1005960))

(assert (= (and b!1005960 res!675057) b!1005969))

(assert (= (and b!1005969 res!675053) b!1005966))

(assert (= (and b!1005966 res!675055) b!1005962))

(assert (= (and b!1005962 res!675048) b!1005965))

(assert (= (and b!1005965 res!675050) b!1005968))

(declare-fun m!931097 () Bool)

(assert (=> b!1005960 m!931097))

(declare-fun m!931099 () Bool)

(assert (=> b!1005968 m!931099))

(assert (=> b!1005968 m!931099))

(declare-fun m!931101 () Bool)

(assert (=> b!1005968 m!931101))

(declare-fun m!931103 () Bool)

(assert (=> b!1005963 m!931103))

(assert (=> b!1005961 m!931099))

(assert (=> b!1005961 m!931099))

(declare-fun m!931105 () Bool)

(assert (=> b!1005961 m!931105))

(declare-fun m!931107 () Bool)

(assert (=> b!1005969 m!931107))

(declare-fun m!931109 () Bool)

(assert (=> b!1005966 m!931109))

(assert (=> b!1005965 m!931099))

(assert (=> b!1005965 m!931099))

(declare-fun m!931111 () Bool)

(assert (=> b!1005965 m!931111))

(assert (=> b!1005965 m!931111))

(assert (=> b!1005965 m!931099))

(declare-fun m!931113 () Bool)

(assert (=> b!1005965 m!931113))

(declare-fun m!931115 () Bool)

(assert (=> start!86770 m!931115))

(declare-fun m!931117 () Bool)

(assert (=> start!86770 m!931117))

(declare-fun m!931119 () Bool)

(assert (=> b!1005967 m!931119))

(check-sat (not b!1005963) (not b!1005967) (not b!1005965) (not start!86770) (not b!1005966) (not b!1005960) (not b!1005961) (not b!1005968) (not b!1005969))
(check-sat)
