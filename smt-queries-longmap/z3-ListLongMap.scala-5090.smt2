; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69266 () Bool)

(assert start!69266)

(declare-fun res!550640 () Bool)

(declare-fun e!446905 () Bool)

(assert (=> start!69266 (=> (not res!550640) (not e!446905))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69266 (= res!550640 (validMask!0 mask!3266))))

(assert (=> start!69266 e!446905))

(assert (=> start!69266 true))

(declare-datatypes ((array!43843 0))(
  ( (array!43844 (arr!20995 (Array (_ BitVec 32) (_ BitVec 64))) (size!21415 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43843)

(declare-fun array_inv!16854 (array!43843) Bool)

(assert (=> start!69266 (array_inv!16854 a!3170)))

(declare-fun b!806858 () Bool)

(declare-fun e!446904 () Bool)

(declare-fun e!446903 () Bool)

(assert (=> b!806858 (= e!446904 e!446903)))

(declare-fun res!550639 () Bool)

(assert (=> b!806858 (=> (not res!550639) (not e!446903))))

(declare-datatypes ((SeekEntryResult!8542 0))(
  ( (MissingZero!8542 (index!36536 (_ BitVec 32))) (Found!8542 (index!36537 (_ BitVec 32))) (Intermediate!8542 (undefined!9354 Bool) (index!36538 (_ BitVec 32)) (x!67517 (_ BitVec 32))) (Undefined!8542) (MissingVacant!8542 (index!36539 (_ BitVec 32))) )
))
(declare-fun lt!361266 () SeekEntryResult!8542)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361262 () SeekEntryResult!8542)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806858 (= res!550639 (and (= lt!361266 lt!361262) (= lt!361262 (Found!8542 j!153)) (= (select (arr!20995 a!3170) index!1236) (select (arr!20995 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43843 (_ BitVec 32)) SeekEntryResult!8542)

(assert (=> b!806858 (= lt!361262 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20995 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43843 (_ BitVec 32)) SeekEntryResult!8542)

(assert (=> b!806858 (= lt!361266 (seekEntryOrOpen!0 (select (arr!20995 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806859 () Bool)

(declare-fun res!550634 () Bool)

(assert (=> b!806859 (=> (not res!550634) (not e!446905))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806859 (= res!550634 (and (= (size!21415 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21415 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21415 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806860 () Bool)

(declare-fun res!550633 () Bool)

(declare-fun e!446902 () Bool)

(assert (=> b!806860 (=> (not res!550633) (not e!446902))))

(declare-datatypes ((List!14865 0))(
  ( (Nil!14862) (Cons!14861 (h!15996 (_ BitVec 64)) (t!21172 List!14865)) )
))
(declare-fun arrayNoDuplicates!0 (array!43843 (_ BitVec 32) List!14865) Bool)

(assert (=> b!806860 (= res!550633 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14862))))

(declare-fun b!806861 () Bool)

(declare-fun res!550632 () Bool)

(assert (=> b!806861 (=> (not res!550632) (not e!446902))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806861 (= res!550632 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21415 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20995 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21415 a!3170)) (= (select (arr!20995 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806862 () Bool)

(assert (=> b!806862 (= e!446903 (not true))))

(declare-fun lt!361265 () SeekEntryResult!8542)

(assert (=> b!806862 (= lt!361265 (Found!8542 index!1236))))

(declare-fun b!806863 () Bool)

(declare-fun res!550638 () Bool)

(assert (=> b!806863 (=> (not res!550638) (not e!446905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806863 (= res!550638 (validKeyInArray!0 (select (arr!20995 a!3170) j!153)))))

(declare-fun b!806864 () Bool)

(assert (=> b!806864 (= e!446905 e!446902)))

(declare-fun res!550637 () Bool)

(assert (=> b!806864 (=> (not res!550637) (not e!446902))))

(declare-fun lt!361263 () SeekEntryResult!8542)

(assert (=> b!806864 (= res!550637 (or (= lt!361263 (MissingZero!8542 i!1163)) (= lt!361263 (MissingVacant!8542 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806864 (= lt!361263 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806865 () Bool)

(assert (=> b!806865 (= e!446902 e!446904)))

(declare-fun res!550636 () Bool)

(assert (=> b!806865 (=> (not res!550636) (not e!446904))))

(declare-fun lt!361268 () SeekEntryResult!8542)

(assert (=> b!806865 (= res!550636 (= lt!361268 lt!361265))))

(declare-fun lt!361264 () (_ BitVec 64))

(declare-fun lt!361267 () array!43843)

(assert (=> b!806865 (= lt!361265 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361264 lt!361267 mask!3266))))

(assert (=> b!806865 (= lt!361268 (seekEntryOrOpen!0 lt!361264 lt!361267 mask!3266))))

(assert (=> b!806865 (= lt!361264 (select (store (arr!20995 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806865 (= lt!361267 (array!43844 (store (arr!20995 a!3170) i!1163 k0!2044) (size!21415 a!3170)))))

(declare-fun b!806866 () Bool)

(declare-fun res!550641 () Bool)

(assert (=> b!806866 (=> (not res!550641) (not e!446905))))

(declare-fun arrayContainsKey!0 (array!43843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806866 (= res!550641 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806867 () Bool)

(declare-fun res!550631 () Bool)

(assert (=> b!806867 (=> (not res!550631) (not e!446902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43843 (_ BitVec 32)) Bool)

(assert (=> b!806867 (= res!550631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806868 () Bool)

(declare-fun res!550635 () Bool)

(assert (=> b!806868 (=> (not res!550635) (not e!446905))))

(assert (=> b!806868 (= res!550635 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69266 res!550640) b!806859))

(assert (= (and b!806859 res!550634) b!806863))

(assert (= (and b!806863 res!550638) b!806868))

(assert (= (and b!806868 res!550635) b!806866))

(assert (= (and b!806866 res!550641) b!806864))

(assert (= (and b!806864 res!550637) b!806867))

(assert (= (and b!806867 res!550631) b!806860))

(assert (= (and b!806860 res!550633) b!806861))

(assert (= (and b!806861 res!550632) b!806865))

(assert (= (and b!806865 res!550636) b!806858))

(assert (= (and b!806858 res!550639) b!806862))

(declare-fun m!749173 () Bool)

(assert (=> b!806865 m!749173))

(declare-fun m!749175 () Bool)

(assert (=> b!806865 m!749175))

(declare-fun m!749177 () Bool)

(assert (=> b!806865 m!749177))

(declare-fun m!749179 () Bool)

(assert (=> b!806865 m!749179))

(declare-fun m!749181 () Bool)

(assert (=> b!806864 m!749181))

(declare-fun m!749183 () Bool)

(assert (=> b!806868 m!749183))

(declare-fun m!749185 () Bool)

(assert (=> b!806860 m!749185))

(declare-fun m!749187 () Bool)

(assert (=> b!806861 m!749187))

(declare-fun m!749189 () Bool)

(assert (=> b!806861 m!749189))

(declare-fun m!749191 () Bool)

(assert (=> b!806867 m!749191))

(declare-fun m!749193 () Bool)

(assert (=> b!806866 m!749193))

(declare-fun m!749195 () Bool)

(assert (=> b!806858 m!749195))

(declare-fun m!749197 () Bool)

(assert (=> b!806858 m!749197))

(assert (=> b!806858 m!749197))

(declare-fun m!749199 () Bool)

(assert (=> b!806858 m!749199))

(assert (=> b!806858 m!749197))

(declare-fun m!749201 () Bool)

(assert (=> b!806858 m!749201))

(declare-fun m!749203 () Bool)

(assert (=> start!69266 m!749203))

(declare-fun m!749205 () Bool)

(assert (=> start!69266 m!749205))

(assert (=> b!806863 m!749197))

(assert (=> b!806863 m!749197))

(declare-fun m!749207 () Bool)

(assert (=> b!806863 m!749207))

(check-sat (not b!806864) (not b!806863) (not b!806860) (not b!806865) (not b!806867) (not b!806858) (not start!69266) (not b!806868) (not b!806866))
(check-sat)
