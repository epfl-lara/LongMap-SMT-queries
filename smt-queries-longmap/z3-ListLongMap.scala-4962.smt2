; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68406 () Bool)

(assert start!68406)

(declare-fun b!793887 () Bool)

(declare-fun res!538037 () Bool)

(declare-fun e!441104 () Bool)

(assert (=> b!793887 (=> (not res!538037) (not e!441104))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43070 0))(
  ( (array!43071 (arr!20611 (Array (_ BitVec 32) (_ BitVec 64))) (size!21031 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43070)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!793887 (= res!538037 (and (= (size!21031 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21031 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21031 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793888 () Bool)

(declare-fun res!538038 () Bool)

(assert (=> b!793888 (=> (not res!538038) (not e!441104))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793888 (= res!538038 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793889 () Bool)

(declare-fun res!538036 () Bool)

(declare-fun e!441105 () Bool)

(assert (=> b!793889 (=> (not res!538036) (not e!441105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43070 (_ BitVec 32)) Bool)

(assert (=> b!793889 (= res!538036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793890 () Bool)

(assert (=> b!793890 (= e!441105 false)))

(declare-fun lt!353943 () Bool)

(declare-datatypes ((List!14481 0))(
  ( (Nil!14478) (Cons!14477 (h!15612 (_ BitVec 64)) (t!20788 List!14481)) )
))
(declare-fun arrayNoDuplicates!0 (array!43070 (_ BitVec 32) List!14481) Bool)

(assert (=> b!793890 (= lt!353943 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14478))))

(declare-fun res!538034 () Bool)

(assert (=> start!68406 (=> (not res!538034) (not e!441104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68406 (= res!538034 (validMask!0 mask!3266))))

(assert (=> start!68406 e!441104))

(assert (=> start!68406 true))

(declare-fun array_inv!16470 (array!43070) Bool)

(assert (=> start!68406 (array_inv!16470 a!3170)))

(declare-fun b!793891 () Bool)

(declare-fun res!538033 () Bool)

(assert (=> b!793891 (=> (not res!538033) (not e!441104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793891 (= res!538033 (validKeyInArray!0 (select (arr!20611 a!3170) j!153)))))

(declare-fun b!793892 () Bool)

(assert (=> b!793892 (= e!441104 e!441105)))

(declare-fun res!538035 () Bool)

(assert (=> b!793892 (=> (not res!538035) (not e!441105))))

(declare-datatypes ((SeekEntryResult!8158 0))(
  ( (MissingZero!8158 (index!35000 (_ BitVec 32))) (Found!8158 (index!35001 (_ BitVec 32))) (Intermediate!8158 (undefined!8970 Bool) (index!35002 (_ BitVec 32)) (x!66103 (_ BitVec 32))) (Undefined!8158) (MissingVacant!8158 (index!35003 (_ BitVec 32))) )
))
(declare-fun lt!353944 () SeekEntryResult!8158)

(assert (=> b!793892 (= res!538035 (or (= lt!353944 (MissingZero!8158 i!1163)) (= lt!353944 (MissingVacant!8158 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43070 (_ BitVec 32)) SeekEntryResult!8158)

(assert (=> b!793892 (= lt!353944 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793893 () Bool)

(declare-fun res!538032 () Bool)

(assert (=> b!793893 (=> (not res!538032) (not e!441104))))

(assert (=> b!793893 (= res!538032 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68406 res!538034) b!793887))

(assert (= (and b!793887 res!538037) b!793891))

(assert (= (and b!793891 res!538033) b!793893))

(assert (= (and b!793893 res!538032) b!793888))

(assert (= (and b!793888 res!538038) b!793892))

(assert (= (and b!793892 res!538035) b!793889))

(assert (= (and b!793889 res!538036) b!793890))

(declare-fun m!734795 () Bool)

(assert (=> b!793893 m!734795))

(declare-fun m!734797 () Bool)

(assert (=> start!68406 m!734797))

(declare-fun m!734799 () Bool)

(assert (=> start!68406 m!734799))

(declare-fun m!734801 () Bool)

(assert (=> b!793889 m!734801))

(declare-fun m!734803 () Bool)

(assert (=> b!793888 m!734803))

(declare-fun m!734805 () Bool)

(assert (=> b!793891 m!734805))

(assert (=> b!793891 m!734805))

(declare-fun m!734807 () Bool)

(assert (=> b!793891 m!734807))

(declare-fun m!734809 () Bool)

(assert (=> b!793892 m!734809))

(declare-fun m!734811 () Bool)

(assert (=> b!793890 m!734811))

(check-sat (not b!793892) (not start!68406) (not b!793888) (not b!793890) (not b!793891) (not b!793893) (not b!793889))
(check-sat)
