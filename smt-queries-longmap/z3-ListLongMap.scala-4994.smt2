; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68476 () Bool)

(assert start!68476)

(declare-fun b!796049 () Bool)

(declare-fun res!540577 () Bool)

(declare-fun e!441758 () Bool)

(assert (=> b!796049 (=> (not res!540577) (not e!441758))))

(declare-datatypes ((array!43266 0))(
  ( (array!43267 (arr!20713 (Array (_ BitVec 32) (_ BitVec 64))) (size!21134 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43266)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43266 (_ BitVec 32)) Bool)

(assert (=> b!796049 (= res!540577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796050 () Bool)

(declare-fun res!540568 () Bool)

(assert (=> b!796050 (=> (not res!540568) (not e!441758))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796050 (= res!540568 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21134 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20713 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21134 a!3170)) (= (select (arr!20713 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796051 () Bool)

(declare-fun e!441756 () Bool)

(assert (=> b!796051 (= e!441756 e!441758)))

(declare-fun res!540573 () Bool)

(assert (=> b!796051 (=> (not res!540573) (not e!441758))))

(declare-datatypes ((SeekEntryResult!8304 0))(
  ( (MissingZero!8304 (index!35584 (_ BitVec 32))) (Found!8304 (index!35585 (_ BitVec 32))) (Intermediate!8304 (undefined!9116 Bool) (index!35586 (_ BitVec 32)) (x!66494 (_ BitVec 32))) (Undefined!8304) (MissingVacant!8304 (index!35587 (_ BitVec 32))) )
))
(declare-fun lt!354887 () SeekEntryResult!8304)

(assert (=> b!796051 (= res!540573 (or (= lt!354887 (MissingZero!8304 i!1163)) (= lt!354887 (MissingVacant!8304 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43266 (_ BitVec 32)) SeekEntryResult!8304)

(assert (=> b!796051 (= lt!354887 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796052 () Bool)

(declare-fun res!540578 () Bool)

(assert (=> b!796052 (=> (not res!540578) (not e!441756))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796052 (= res!540578 (validKeyInArray!0 (select (arr!20713 a!3170) j!153)))))

(declare-fun res!540576 () Bool)

(assert (=> start!68476 (=> (not res!540576) (not e!441756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68476 (= res!540576 (validMask!0 mask!3266))))

(assert (=> start!68476 e!441756))

(assert (=> start!68476 true))

(declare-fun array_inv!16509 (array!43266) Bool)

(assert (=> start!68476 (array_inv!16509 a!3170)))

(declare-fun b!796053 () Bool)

(declare-fun e!441757 () Bool)

(assert (=> b!796053 (= e!441757 (not true))))

(declare-fun lt!354881 () SeekEntryResult!8304)

(assert (=> b!796053 (= lt!354881 (Found!8304 index!1236))))

(declare-fun b!796054 () Bool)

(declare-fun res!540572 () Bool)

(assert (=> b!796054 (=> (not res!540572) (not e!441756))))

(declare-fun arrayContainsKey!0 (array!43266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796054 (= res!540572 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796055 () Bool)

(declare-fun e!441755 () Bool)

(assert (=> b!796055 (= e!441758 e!441755)))

(declare-fun res!540575 () Bool)

(assert (=> b!796055 (=> (not res!540575) (not e!441755))))

(declare-fun lt!354885 () SeekEntryResult!8304)

(assert (=> b!796055 (= res!540575 (= lt!354885 lt!354881))))

(declare-fun lt!354886 () array!43266)

(declare-fun lt!354883 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43266 (_ BitVec 32)) SeekEntryResult!8304)

(assert (=> b!796055 (= lt!354881 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354883 lt!354886 mask!3266))))

(assert (=> b!796055 (= lt!354885 (seekEntryOrOpen!0 lt!354883 lt!354886 mask!3266))))

(assert (=> b!796055 (= lt!354883 (select (store (arr!20713 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796055 (= lt!354886 (array!43267 (store (arr!20713 a!3170) i!1163 k0!2044) (size!21134 a!3170)))))

(declare-fun b!796056 () Bool)

(assert (=> b!796056 (= e!441755 e!441757)))

(declare-fun res!540574 () Bool)

(assert (=> b!796056 (=> (not res!540574) (not e!441757))))

(declare-fun lt!354882 () SeekEntryResult!8304)

(declare-fun lt!354884 () SeekEntryResult!8304)

(assert (=> b!796056 (= res!540574 (and (= lt!354884 lt!354882) (= lt!354882 (Found!8304 j!153)) (= (select (arr!20713 a!3170) index!1236) (select (arr!20713 a!3170) j!153))))))

(assert (=> b!796056 (= lt!354882 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20713 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796056 (= lt!354884 (seekEntryOrOpen!0 (select (arr!20713 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796057 () Bool)

(declare-fun res!540571 () Bool)

(assert (=> b!796057 (=> (not res!540571) (not e!441756))))

(assert (=> b!796057 (= res!540571 (and (= (size!21134 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21134 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21134 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796058 () Bool)

(declare-fun res!540570 () Bool)

(assert (=> b!796058 (=> (not res!540570) (not e!441756))))

(assert (=> b!796058 (= res!540570 (validKeyInArray!0 k0!2044))))

(declare-fun b!796059 () Bool)

(declare-fun res!540569 () Bool)

(assert (=> b!796059 (=> (not res!540569) (not e!441758))))

(declare-datatypes ((List!14676 0))(
  ( (Nil!14673) (Cons!14672 (h!15801 (_ BitVec 64)) (t!20991 List!14676)) )
))
(declare-fun arrayNoDuplicates!0 (array!43266 (_ BitVec 32) List!14676) Bool)

(assert (=> b!796059 (= res!540569 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14673))))

(assert (= (and start!68476 res!540576) b!796057))

(assert (= (and b!796057 res!540571) b!796052))

(assert (= (and b!796052 res!540578) b!796058))

(assert (= (and b!796058 res!540570) b!796054))

(assert (= (and b!796054 res!540572) b!796051))

(assert (= (and b!796051 res!540573) b!796049))

(assert (= (and b!796049 res!540577) b!796059))

(assert (= (and b!796059 res!540569) b!796050))

(assert (= (and b!796050 res!540568) b!796055))

(assert (= (and b!796055 res!540575) b!796056))

(assert (= (and b!796056 res!540574) b!796053))

(declare-fun m!736799 () Bool)

(assert (=> b!796050 m!736799))

(declare-fun m!736801 () Bool)

(assert (=> b!796050 m!736801))

(declare-fun m!736803 () Bool)

(assert (=> b!796051 m!736803))

(declare-fun m!736805 () Bool)

(assert (=> b!796049 m!736805))

(declare-fun m!736807 () Bool)

(assert (=> start!68476 m!736807))

(declare-fun m!736809 () Bool)

(assert (=> start!68476 m!736809))

(declare-fun m!736811 () Bool)

(assert (=> b!796059 m!736811))

(declare-fun m!736813 () Bool)

(assert (=> b!796058 m!736813))

(declare-fun m!736815 () Bool)

(assert (=> b!796056 m!736815))

(declare-fun m!736817 () Bool)

(assert (=> b!796056 m!736817))

(assert (=> b!796056 m!736817))

(declare-fun m!736819 () Bool)

(assert (=> b!796056 m!736819))

(assert (=> b!796056 m!736817))

(declare-fun m!736821 () Bool)

(assert (=> b!796056 m!736821))

(assert (=> b!796052 m!736817))

(assert (=> b!796052 m!736817))

(declare-fun m!736823 () Bool)

(assert (=> b!796052 m!736823))

(declare-fun m!736825 () Bool)

(assert (=> b!796054 m!736825))

(declare-fun m!736827 () Bool)

(assert (=> b!796055 m!736827))

(declare-fun m!736829 () Bool)

(assert (=> b!796055 m!736829))

(declare-fun m!736831 () Bool)

(assert (=> b!796055 m!736831))

(declare-fun m!736833 () Bool)

(assert (=> b!796055 m!736833))

(check-sat (not b!796049) (not b!796054) (not b!796051) (not b!796052) (not b!796056) (not start!68476) (not b!796059) (not b!796055) (not b!796058))
(check-sat)
