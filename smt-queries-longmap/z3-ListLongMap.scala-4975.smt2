; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68340 () Bool)

(assert start!68340)

(declare-fun res!538695 () Bool)

(declare-fun e!440909 () Bool)

(assert (=> start!68340 (=> (not res!538695) (not e!440909))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68340 (= res!538695 (validMask!0 mask!3266))))

(assert (=> start!68340 e!440909))

(assert (=> start!68340 true))

(declare-datatypes ((array!43147 0))(
  ( (array!43148 (arr!20654 (Array (_ BitVec 32) (_ BitVec 64))) (size!21075 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43147)

(declare-fun array_inv!16537 (array!43147) Bool)

(assert (=> start!68340 (array_inv!16537 a!3170)))

(declare-fun b!794036 () Bool)

(declare-fun res!538701 () Bool)

(assert (=> b!794036 (=> (not res!538701) (not e!440909))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794036 (= res!538701 (validKeyInArray!0 k0!2044))))

(declare-fun e!440908 () Bool)

(declare-fun b!794037 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794037 (= e!440908 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!794038 () Bool)

(declare-fun res!538703 () Bool)

(declare-fun e!440911 () Bool)

(assert (=> b!794038 (=> (not res!538703) (not e!440911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43147 (_ BitVec 32)) Bool)

(assert (=> b!794038 (= res!538703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794039 () Bool)

(declare-fun res!538698 () Bool)

(assert (=> b!794039 (=> (not res!538698) (not e!440911))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!794039 (= res!538698 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21075 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20654 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21075 a!3170)) (= (select (arr!20654 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794040 () Bool)

(assert (=> b!794040 (= e!440909 e!440911)))

(declare-fun res!538696 () Bool)

(assert (=> b!794040 (=> (not res!538696) (not e!440911))))

(declare-datatypes ((SeekEntryResult!8242 0))(
  ( (MissingZero!8242 (index!35336 (_ BitVec 32))) (Found!8242 (index!35337 (_ BitVec 32))) (Intermediate!8242 (undefined!9054 Bool) (index!35338 (_ BitVec 32)) (x!66275 (_ BitVec 32))) (Undefined!8242) (MissingVacant!8242 (index!35339 (_ BitVec 32))) )
))
(declare-fun lt!353831 () SeekEntryResult!8242)

(assert (=> b!794040 (= res!538696 (or (= lt!353831 (MissingZero!8242 i!1163)) (= lt!353831 (MissingVacant!8242 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43147 (_ BitVec 32)) SeekEntryResult!8242)

(assert (=> b!794040 (= lt!353831 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794041 () Bool)

(declare-fun res!538704 () Bool)

(assert (=> b!794041 (=> (not res!538704) (not e!440909))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794041 (= res!538704 (and (= (size!21075 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21075 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21075 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794042 () Bool)

(declare-fun res!538697 () Bool)

(assert (=> b!794042 (=> (not res!538697) (not e!440909))))

(assert (=> b!794042 (= res!538697 (validKeyInArray!0 (select (arr!20654 a!3170) j!153)))))

(declare-fun b!794043 () Bool)

(declare-fun res!538700 () Bool)

(assert (=> b!794043 (=> (not res!538700) (not e!440911))))

(declare-datatypes ((List!14656 0))(
  ( (Nil!14653) (Cons!14652 (h!15781 (_ BitVec 64)) (t!20962 List!14656)) )
))
(declare-fun arrayNoDuplicates!0 (array!43147 (_ BitVec 32) List!14656) Bool)

(assert (=> b!794043 (= res!538700 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14653))))

(declare-fun b!794044 () Bool)

(assert (=> b!794044 (= e!440911 e!440908)))

(declare-fun res!538702 () Bool)

(assert (=> b!794044 (=> (not res!538702) (not e!440908))))

(declare-fun lt!353830 () array!43147)

(declare-fun lt!353829 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43147 (_ BitVec 32)) SeekEntryResult!8242)

(assert (=> b!794044 (= res!538702 (= (seekEntryOrOpen!0 lt!353829 lt!353830 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353829 lt!353830 mask!3266)))))

(assert (=> b!794044 (= lt!353829 (select (store (arr!20654 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794044 (= lt!353830 (array!43148 (store (arr!20654 a!3170) i!1163 k0!2044) (size!21075 a!3170)))))

(declare-fun b!794045 () Bool)

(declare-fun res!538699 () Bool)

(assert (=> b!794045 (=> (not res!538699) (not e!440909))))

(declare-fun arrayContainsKey!0 (array!43147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794045 (= res!538699 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68340 res!538695) b!794041))

(assert (= (and b!794041 res!538704) b!794042))

(assert (= (and b!794042 res!538697) b!794036))

(assert (= (and b!794036 res!538701) b!794045))

(assert (= (and b!794045 res!538699) b!794040))

(assert (= (and b!794040 res!538696) b!794038))

(assert (= (and b!794038 res!538703) b!794043))

(assert (= (and b!794043 res!538700) b!794039))

(assert (= (and b!794039 res!538698) b!794044))

(assert (= (and b!794044 res!538702) b!794037))

(declare-fun m!734071 () Bool)

(assert (=> b!794040 m!734071))

(declare-fun m!734073 () Bool)

(assert (=> b!794044 m!734073))

(declare-fun m!734075 () Bool)

(assert (=> b!794044 m!734075))

(declare-fun m!734077 () Bool)

(assert (=> b!794044 m!734077))

(declare-fun m!734079 () Bool)

(assert (=> b!794044 m!734079))

(declare-fun m!734081 () Bool)

(assert (=> b!794043 m!734081))

(declare-fun m!734083 () Bool)

(assert (=> b!794036 m!734083))

(declare-fun m!734085 () Bool)

(assert (=> b!794038 m!734085))

(declare-fun m!734087 () Bool)

(assert (=> start!68340 m!734087))

(declare-fun m!734089 () Bool)

(assert (=> start!68340 m!734089))

(declare-fun m!734091 () Bool)

(assert (=> b!794042 m!734091))

(assert (=> b!794042 m!734091))

(declare-fun m!734093 () Bool)

(assert (=> b!794042 m!734093))

(declare-fun m!734095 () Bool)

(assert (=> b!794045 m!734095))

(declare-fun m!734097 () Bool)

(assert (=> b!794039 m!734097))

(declare-fun m!734099 () Bool)

(assert (=> b!794039 m!734099))

(check-sat (not b!794044) (not b!794042) (not b!794045) (not b!794043) (not b!794040) (not b!794038) (not b!794036) (not start!68340))
(check-sat)
