; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68346 () Bool)

(assert start!68346)

(declare-fun b!794124 () Bool)

(declare-fun res!538783 () Bool)

(declare-fun e!440942 () Bool)

(assert (=> b!794124 (=> (not res!538783) (not e!440942))))

(declare-datatypes ((array!43153 0))(
  ( (array!43154 (arr!20657 (Array (_ BitVec 32) (_ BitVec 64))) (size!21078 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43153)

(declare-datatypes ((List!14659 0))(
  ( (Nil!14656) (Cons!14655 (h!15784 (_ BitVec 64)) (t!20965 List!14659)) )
))
(declare-fun arrayNoDuplicates!0 (array!43153 (_ BitVec 32) List!14659) Bool)

(assert (=> b!794124 (= res!538783 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14656))))

(declare-fun b!794125 () Bool)

(assert (=> b!794125 (= e!440942 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353862 () (_ BitVec 64))

(declare-fun lt!353860 () array!43153)

(declare-datatypes ((SeekEntryResult!8245 0))(
  ( (MissingZero!8245 (index!35348 (_ BitVec 32))) (Found!8245 (index!35349 (_ BitVec 32))) (Intermediate!8245 (undefined!9057 Bool) (index!35350 (_ BitVec 32)) (x!66286 (_ BitVec 32))) (Undefined!8245) (MissingVacant!8245 (index!35351 (_ BitVec 32))) )
))
(declare-fun lt!353864 () SeekEntryResult!8245)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43153 (_ BitVec 32)) SeekEntryResult!8245)

(assert (=> b!794125 (= lt!353864 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353862 lt!353860 mask!3266))))

(declare-fun lt!353863 () SeekEntryResult!8245)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43153 (_ BitVec 32)) SeekEntryResult!8245)

(assert (=> b!794125 (= lt!353863 (seekEntryOrOpen!0 lt!353862 lt!353860 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794125 (= lt!353862 (select (store (arr!20657 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794125 (= lt!353860 (array!43154 (store (arr!20657 a!3170) i!1163 k0!2044) (size!21078 a!3170)))))

(declare-fun b!794126 () Bool)

(declare-fun res!538788 () Bool)

(declare-fun e!440943 () Bool)

(assert (=> b!794126 (=> (not res!538788) (not e!440943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794126 (= res!538788 (validKeyInArray!0 k0!2044))))

(declare-fun b!794127 () Bool)

(declare-fun res!538786 () Bool)

(assert (=> b!794127 (=> (not res!538786) (not e!440943))))

(assert (=> b!794127 (= res!538786 (validKeyInArray!0 (select (arr!20657 a!3170) j!153)))))

(declare-fun res!538791 () Bool)

(assert (=> start!68346 (=> (not res!538791) (not e!440943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68346 (= res!538791 (validMask!0 mask!3266))))

(assert (=> start!68346 e!440943))

(assert (=> start!68346 true))

(declare-fun array_inv!16540 (array!43153) Bool)

(assert (=> start!68346 (array_inv!16540 a!3170)))

(declare-fun b!794128 () Bool)

(assert (=> b!794128 (= e!440943 e!440942)))

(declare-fun res!538785 () Bool)

(assert (=> b!794128 (=> (not res!538785) (not e!440942))))

(declare-fun lt!353861 () SeekEntryResult!8245)

(assert (=> b!794128 (= res!538785 (or (= lt!353861 (MissingZero!8245 i!1163)) (= lt!353861 (MissingVacant!8245 i!1163))))))

(assert (=> b!794128 (= lt!353861 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794129 () Bool)

(declare-fun res!538787 () Bool)

(assert (=> b!794129 (=> (not res!538787) (not e!440943))))

(assert (=> b!794129 (= res!538787 (and (= (size!21078 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21078 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21078 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794130 () Bool)

(declare-fun res!538789 () Bool)

(assert (=> b!794130 (=> (not res!538789) (not e!440942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43153 (_ BitVec 32)) Bool)

(assert (=> b!794130 (= res!538789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794131 () Bool)

(declare-fun res!538790 () Bool)

(assert (=> b!794131 (=> (not res!538790) (not e!440942))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794131 (= res!538790 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21078 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20657 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21078 a!3170)) (= (select (arr!20657 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794132 () Bool)

(declare-fun res!538784 () Bool)

(assert (=> b!794132 (=> (not res!538784) (not e!440943))))

(declare-fun arrayContainsKey!0 (array!43153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794132 (= res!538784 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68346 res!538791) b!794129))

(assert (= (and b!794129 res!538787) b!794127))

(assert (= (and b!794127 res!538786) b!794126))

(assert (= (and b!794126 res!538788) b!794132))

(assert (= (and b!794132 res!538784) b!794128))

(assert (= (and b!794128 res!538785) b!794130))

(assert (= (and b!794130 res!538789) b!794124))

(assert (= (and b!794124 res!538783) b!794131))

(assert (= (and b!794131 res!538790) b!794125))

(declare-fun m!734161 () Bool)

(assert (=> b!794125 m!734161))

(declare-fun m!734163 () Bool)

(assert (=> b!794125 m!734163))

(declare-fun m!734165 () Bool)

(assert (=> b!794125 m!734165))

(declare-fun m!734167 () Bool)

(assert (=> b!794125 m!734167))

(declare-fun m!734169 () Bool)

(assert (=> start!68346 m!734169))

(declare-fun m!734171 () Bool)

(assert (=> start!68346 m!734171))

(declare-fun m!734173 () Bool)

(assert (=> b!794126 m!734173))

(declare-fun m!734175 () Bool)

(assert (=> b!794128 m!734175))

(declare-fun m!734177 () Bool)

(assert (=> b!794127 m!734177))

(assert (=> b!794127 m!734177))

(declare-fun m!734179 () Bool)

(assert (=> b!794127 m!734179))

(declare-fun m!734181 () Bool)

(assert (=> b!794124 m!734181))

(declare-fun m!734183 () Bool)

(assert (=> b!794131 m!734183))

(declare-fun m!734185 () Bool)

(assert (=> b!794131 m!734185))

(declare-fun m!734187 () Bool)

(assert (=> b!794130 m!734187))

(declare-fun m!734189 () Bool)

(assert (=> b!794132 m!734189))

(check-sat (not b!794126) (not b!794130) (not b!794125) (not b!794132) (not b!794127) (not start!68346) (not b!794128) (not b!794124))
(check-sat)
