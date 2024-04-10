; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68494 () Bool)

(assert start!68494)

(declare-fun b!796346 () Bool)

(declare-fun e!441893 () Bool)

(declare-fun e!441889 () Bool)

(assert (=> b!796346 (= e!441893 e!441889)))

(declare-fun res!540867 () Bool)

(assert (=> b!796346 (=> (not res!540867) (not e!441889))))

(declare-datatypes ((SeekEntryResult!8313 0))(
  ( (MissingZero!8313 (index!35620 (_ BitVec 32))) (Found!8313 (index!35621 (_ BitVec 32))) (Intermediate!8313 (undefined!9125 Bool) (index!35622 (_ BitVec 32)) (x!66527 (_ BitVec 32))) (Undefined!8313) (MissingVacant!8313 (index!35623 (_ BitVec 32))) )
))
(declare-fun lt!355071 () SeekEntryResult!8313)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796346 (= res!540867 (or (= lt!355071 (MissingZero!8313 i!1163)) (= lt!355071 (MissingVacant!8313 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43284 0))(
  ( (array!43285 (arr!20722 (Array (_ BitVec 32) (_ BitVec 64))) (size!21143 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43284)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43284 (_ BitVec 32)) SeekEntryResult!8313)

(assert (=> b!796346 (= lt!355071 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796347 () Bool)

(declare-fun res!540874 () Bool)

(assert (=> b!796347 (=> (not res!540874) (not e!441889))))

(declare-datatypes ((List!14685 0))(
  ( (Nil!14682) (Cons!14681 (h!15810 (_ BitVec 64)) (t!21000 List!14685)) )
))
(declare-fun arrayNoDuplicates!0 (array!43284 (_ BitVec 32) List!14685) Bool)

(assert (=> b!796347 (= res!540874 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14682))))

(declare-fun b!796348 () Bool)

(declare-fun res!540873 () Bool)

(assert (=> b!796348 (=> (not res!540873) (not e!441893))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796348 (= res!540873 (and (= (size!21143 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21143 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21143 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796349 () Bool)

(declare-fun e!441890 () Bool)

(declare-fun e!441891 () Bool)

(assert (=> b!796349 (= e!441890 e!441891)))

(declare-fun res!540871 () Bool)

(assert (=> b!796349 (=> (not res!540871) (not e!441891))))

(declare-fun lt!355075 () SeekEntryResult!8313)

(declare-fun lt!355074 () SeekEntryResult!8313)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796349 (= res!540871 (and (= lt!355075 lt!355074) (= lt!355074 (Found!8313 j!153)) (= (select (arr!20722 a!3170) index!1236) (select (arr!20722 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43284 (_ BitVec 32)) SeekEntryResult!8313)

(assert (=> b!796349 (= lt!355074 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20722 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796349 (= lt!355075 (seekEntryOrOpen!0 (select (arr!20722 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796350 () Bool)

(assert (=> b!796350 (= e!441889 e!441890)))

(declare-fun res!540875 () Bool)

(assert (=> b!796350 (=> (not res!540875) (not e!441890))))

(declare-fun lt!355076 () SeekEntryResult!8313)

(declare-fun lt!355070 () SeekEntryResult!8313)

(assert (=> b!796350 (= res!540875 (= lt!355076 lt!355070))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355073 () array!43284)

(declare-fun lt!355072 () (_ BitVec 64))

(assert (=> b!796350 (= lt!355070 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355072 lt!355073 mask!3266))))

(assert (=> b!796350 (= lt!355076 (seekEntryOrOpen!0 lt!355072 lt!355073 mask!3266))))

(assert (=> b!796350 (= lt!355072 (select (store (arr!20722 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796350 (= lt!355073 (array!43285 (store (arr!20722 a!3170) i!1163 k0!2044) (size!21143 a!3170)))))

(declare-fun res!540866 () Bool)

(assert (=> start!68494 (=> (not res!540866) (not e!441893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68494 (= res!540866 (validMask!0 mask!3266))))

(assert (=> start!68494 e!441893))

(assert (=> start!68494 true))

(declare-fun array_inv!16518 (array!43284) Bool)

(assert (=> start!68494 (array_inv!16518 a!3170)))

(declare-fun b!796351 () Bool)

(declare-fun res!540870 () Bool)

(assert (=> b!796351 (=> (not res!540870) (not e!441893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796351 (= res!540870 (validKeyInArray!0 k0!2044))))

(declare-fun b!796352 () Bool)

(declare-fun res!540869 () Bool)

(assert (=> b!796352 (=> (not res!540869) (not e!441893))))

(declare-fun arrayContainsKey!0 (array!43284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796352 (= res!540869 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796353 () Bool)

(declare-fun res!540865 () Bool)

(assert (=> b!796353 (=> (not res!540865) (not e!441889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43284 (_ BitVec 32)) Bool)

(assert (=> b!796353 (= res!540865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796354 () Bool)

(assert (=> b!796354 (= e!441891 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!796354 (= lt!355070 (Found!8313 index!1236))))

(declare-fun b!796355 () Bool)

(declare-fun res!540868 () Bool)

(assert (=> b!796355 (=> (not res!540868) (not e!441889))))

(assert (=> b!796355 (= res!540868 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21143 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20722 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21143 a!3170)) (= (select (arr!20722 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796356 () Bool)

(declare-fun res!540872 () Bool)

(assert (=> b!796356 (=> (not res!540872) (not e!441893))))

(assert (=> b!796356 (= res!540872 (validKeyInArray!0 (select (arr!20722 a!3170) j!153)))))

(assert (= (and start!68494 res!540866) b!796348))

(assert (= (and b!796348 res!540873) b!796356))

(assert (= (and b!796356 res!540872) b!796351))

(assert (= (and b!796351 res!540870) b!796352))

(assert (= (and b!796352 res!540869) b!796346))

(assert (= (and b!796346 res!540867) b!796353))

(assert (= (and b!796353 res!540865) b!796347))

(assert (= (and b!796347 res!540874) b!796355))

(assert (= (and b!796355 res!540868) b!796350))

(assert (= (and b!796350 res!540875) b!796349))

(assert (= (and b!796349 res!540871) b!796354))

(declare-fun m!737123 () Bool)

(assert (=> b!796347 m!737123))

(declare-fun m!737125 () Bool)

(assert (=> b!796351 m!737125))

(declare-fun m!737127 () Bool)

(assert (=> b!796346 m!737127))

(declare-fun m!737129 () Bool)

(assert (=> b!796353 m!737129))

(declare-fun m!737131 () Bool)

(assert (=> b!796355 m!737131))

(declare-fun m!737133 () Bool)

(assert (=> b!796355 m!737133))

(declare-fun m!737135 () Bool)

(assert (=> b!796352 m!737135))

(declare-fun m!737137 () Bool)

(assert (=> b!796349 m!737137))

(declare-fun m!737139 () Bool)

(assert (=> b!796349 m!737139))

(assert (=> b!796349 m!737139))

(declare-fun m!737141 () Bool)

(assert (=> b!796349 m!737141))

(assert (=> b!796349 m!737139))

(declare-fun m!737143 () Bool)

(assert (=> b!796349 m!737143))

(assert (=> b!796356 m!737139))

(assert (=> b!796356 m!737139))

(declare-fun m!737145 () Bool)

(assert (=> b!796356 m!737145))

(declare-fun m!737147 () Bool)

(assert (=> b!796350 m!737147))

(declare-fun m!737149 () Bool)

(assert (=> b!796350 m!737149))

(declare-fun m!737151 () Bool)

(assert (=> b!796350 m!737151))

(declare-fun m!737153 () Bool)

(assert (=> b!796350 m!737153))

(declare-fun m!737155 () Bool)

(assert (=> start!68494 m!737155))

(declare-fun m!737157 () Bool)

(assert (=> start!68494 m!737157))

(check-sat (not b!796347) (not b!796353) (not b!796349) (not b!796346) (not b!796356) (not b!796351) (not b!796350) (not b!796352) (not start!68494))
(check-sat)
