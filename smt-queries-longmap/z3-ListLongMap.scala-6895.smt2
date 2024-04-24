; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86962 () Bool)

(assert start!86962)

(declare-fun b!1006652 () Bool)

(declare-fun res!674979 () Bool)

(declare-fun e!566956 () Bool)

(assert (=> b!1006652 (=> (not res!674979) (not e!566956))))

(declare-datatypes ((array!63480 0))(
  ( (array!63481 (arr!30556 (Array (_ BitVec 32) (_ BitVec 64))) (size!31059 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63480)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006652 (= res!674979 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006653 () Bool)

(declare-fun res!674983 () Bool)

(assert (=> b!1006653 (=> (not res!674983) (not e!566956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006653 (= res!674983 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006654 () Bool)

(declare-fun res!674985 () Bool)

(declare-fun e!566958 () Bool)

(assert (=> b!1006654 (=> (not res!674985) (not e!566958))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006654 (= res!674985 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31059 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31059 a!3219))))))

(declare-fun b!1006655 () Bool)

(assert (=> b!1006655 (= e!566958 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!445024 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006655 (= lt!445024 (toIndex!0 (select (arr!30556 a!3219) j!170) mask!3464))))

(declare-fun b!1006656 () Bool)

(declare-fun res!674980 () Bool)

(assert (=> b!1006656 (=> (not res!674980) (not e!566958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63480 (_ BitVec 32)) Bool)

(assert (=> b!1006656 (= res!674980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!674986 () Bool)

(assert (=> start!86962 (=> (not res!674986) (not e!566956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86962 (= res!674986 (validMask!0 mask!3464))))

(assert (=> start!86962 e!566956))

(declare-fun array_inv!23692 (array!63480) Bool)

(assert (=> start!86962 (array_inv!23692 a!3219)))

(assert (=> start!86962 true))

(declare-fun b!1006657 () Bool)

(assert (=> b!1006657 (= e!566956 e!566958)))

(declare-fun res!674984 () Bool)

(assert (=> b!1006657 (=> (not res!674984) (not e!566958))))

(declare-datatypes ((SeekEntryResult!9424 0))(
  ( (MissingZero!9424 (index!40067 (_ BitVec 32))) (Found!9424 (index!40068 (_ BitVec 32))) (Intermediate!9424 (undefined!10236 Bool) (index!40069 (_ BitVec 32)) (x!87636 (_ BitVec 32))) (Undefined!9424) (MissingVacant!9424 (index!40070 (_ BitVec 32))) )
))
(declare-fun lt!445025 () SeekEntryResult!9424)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006657 (= res!674984 (or (= lt!445025 (MissingVacant!9424 i!1194)) (= lt!445025 (MissingZero!9424 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63480 (_ BitVec 32)) SeekEntryResult!9424)

(assert (=> b!1006657 (= lt!445025 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006658 () Bool)

(declare-fun res!674982 () Bool)

(assert (=> b!1006658 (=> (not res!674982) (not e!566956))))

(assert (=> b!1006658 (= res!674982 (validKeyInArray!0 (select (arr!30556 a!3219) j!170)))))

(declare-fun b!1006659 () Bool)

(declare-fun res!674987 () Bool)

(assert (=> b!1006659 (=> (not res!674987) (not e!566956))))

(assert (=> b!1006659 (= res!674987 (and (= (size!31059 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31059 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31059 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006660 () Bool)

(declare-fun res!674981 () Bool)

(assert (=> b!1006660 (=> (not res!674981) (not e!566958))))

(declare-datatypes ((List!21203 0))(
  ( (Nil!21200) (Cons!21199 (h!22391 (_ BitVec 64)) (t!30196 List!21203)) )
))
(declare-fun arrayNoDuplicates!0 (array!63480 (_ BitVec 32) List!21203) Bool)

(assert (=> b!1006660 (= res!674981 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21200))))

(assert (= (and start!86962 res!674986) b!1006659))

(assert (= (and b!1006659 res!674987) b!1006658))

(assert (= (and b!1006658 res!674982) b!1006653))

(assert (= (and b!1006653 res!674983) b!1006652))

(assert (= (and b!1006652 res!674979) b!1006657))

(assert (= (and b!1006657 res!674984) b!1006656))

(assert (= (and b!1006656 res!674980) b!1006660))

(assert (= (and b!1006660 res!674981) b!1006654))

(assert (= (and b!1006654 res!674985) b!1006655))

(declare-fun m!932183 () Bool)

(assert (=> b!1006655 m!932183))

(assert (=> b!1006655 m!932183))

(declare-fun m!932185 () Bool)

(assert (=> b!1006655 m!932185))

(declare-fun m!932187 () Bool)

(assert (=> b!1006656 m!932187))

(declare-fun m!932189 () Bool)

(assert (=> start!86962 m!932189))

(declare-fun m!932191 () Bool)

(assert (=> start!86962 m!932191))

(declare-fun m!932193 () Bool)

(assert (=> b!1006652 m!932193))

(declare-fun m!932195 () Bool)

(assert (=> b!1006653 m!932195))

(assert (=> b!1006658 m!932183))

(assert (=> b!1006658 m!932183))

(declare-fun m!932197 () Bool)

(assert (=> b!1006658 m!932197))

(declare-fun m!932199 () Bool)

(assert (=> b!1006660 m!932199))

(declare-fun m!932201 () Bool)

(assert (=> b!1006657 m!932201))

(check-sat (not start!86962) (not b!1006655) (not b!1006656) (not b!1006652) (not b!1006657) (not b!1006660) (not b!1006658) (not b!1006653))
(check-sat)
