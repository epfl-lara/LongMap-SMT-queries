; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68296 () Bool)

(assert start!68296)

(declare-fun b!793397 () Bool)

(declare-fun e!440747 () Bool)

(declare-fun e!440746 () Bool)

(assert (=> b!793397 (= e!440747 e!440746)))

(declare-fun res!537919 () Bool)

(assert (=> b!793397 (=> (not res!537919) (not e!440746))))

(declare-datatypes ((SeekEntryResult!8214 0))(
  ( (MissingZero!8214 (index!35224 (_ BitVec 32))) (Found!8214 (index!35225 (_ BitVec 32))) (Intermediate!8214 (undefined!9026 Bool) (index!35226 (_ BitVec 32)) (x!66164 (_ BitVec 32))) (Undefined!8214) (MissingVacant!8214 (index!35227 (_ BitVec 32))) )
))
(declare-fun lt!353699 () SeekEntryResult!8214)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793397 (= res!537919 (or (= lt!353699 (MissingZero!8214 i!1163)) (= lt!353699 (MissingVacant!8214 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43086 0))(
  ( (array!43087 (arr!20623 (Array (_ BitVec 32) (_ BitVec 64))) (size!21044 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43086)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43086 (_ BitVec 32)) SeekEntryResult!8214)

(assert (=> b!793397 (= lt!353699 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793398 () Bool)

(declare-fun res!537916 () Bool)

(assert (=> b!793398 (=> (not res!537916) (not e!440747))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793398 (= res!537916 (and (= (size!21044 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21044 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21044 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793399 () Bool)

(declare-fun res!537918 () Bool)

(assert (=> b!793399 (=> (not res!537918) (not e!440747))))

(declare-fun arrayContainsKey!0 (array!43086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793399 (= res!537918 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!537917 () Bool)

(assert (=> start!68296 (=> (not res!537917) (not e!440747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68296 (= res!537917 (validMask!0 mask!3266))))

(assert (=> start!68296 e!440747))

(assert (=> start!68296 true))

(declare-fun array_inv!16419 (array!43086) Bool)

(assert (=> start!68296 (array_inv!16419 a!3170)))

(declare-fun b!793400 () Bool)

(declare-fun res!537921 () Bool)

(assert (=> b!793400 (=> (not res!537921) (not e!440746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43086 (_ BitVec 32)) Bool)

(assert (=> b!793400 (= res!537921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793401 () Bool)

(declare-fun res!537922 () Bool)

(assert (=> b!793401 (=> (not res!537922) (not e!440747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793401 (= res!537922 (validKeyInArray!0 k0!2044))))

(declare-fun b!793402 () Bool)

(declare-fun res!537923 () Bool)

(assert (=> b!793402 (=> (not res!537923) (not e!440747))))

(assert (=> b!793402 (= res!537923 (validKeyInArray!0 (select (arr!20623 a!3170) j!153)))))

(declare-fun b!793403 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793403 (= e!440746 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21044 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20623 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21044 a!3170)) (= (select (arr!20623 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20623 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!793404 () Bool)

(declare-fun res!537920 () Bool)

(assert (=> b!793404 (=> (not res!537920) (not e!440746))))

(declare-datatypes ((List!14586 0))(
  ( (Nil!14583) (Cons!14582 (h!15711 (_ BitVec 64)) (t!20901 List!14586)) )
))
(declare-fun arrayNoDuplicates!0 (array!43086 (_ BitVec 32) List!14586) Bool)

(assert (=> b!793404 (= res!537920 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14583))))

(assert (= (and start!68296 res!537917) b!793398))

(assert (= (and b!793398 res!537916) b!793402))

(assert (= (and b!793402 res!537923) b!793401))

(assert (= (and b!793401 res!537922) b!793399))

(assert (= (and b!793399 res!537918) b!793397))

(assert (= (and b!793397 res!537919) b!793400))

(assert (= (and b!793400 res!537921) b!793404))

(assert (= (and b!793404 res!537920) b!793403))

(declare-fun m!733861 () Bool)

(assert (=> b!793404 m!733861))

(declare-fun m!733863 () Bool)

(assert (=> b!793401 m!733863))

(declare-fun m!733865 () Bool)

(assert (=> start!68296 m!733865))

(declare-fun m!733867 () Bool)

(assert (=> start!68296 m!733867))

(declare-fun m!733869 () Bool)

(assert (=> b!793403 m!733869))

(declare-fun m!733871 () Bool)

(assert (=> b!793403 m!733871))

(declare-fun m!733873 () Bool)

(assert (=> b!793403 m!733873))

(declare-fun m!733875 () Bool)

(assert (=> b!793403 m!733875))

(declare-fun m!733877 () Bool)

(assert (=> b!793402 m!733877))

(assert (=> b!793402 m!733877))

(declare-fun m!733879 () Bool)

(assert (=> b!793402 m!733879))

(declare-fun m!733881 () Bool)

(assert (=> b!793399 m!733881))

(declare-fun m!733883 () Bool)

(assert (=> b!793400 m!733883))

(declare-fun m!733885 () Bool)

(assert (=> b!793397 m!733885))

(check-sat (not b!793402) (not b!793404) (not b!793401) (not b!793400) (not b!793399) (not start!68296) (not b!793397))
(check-sat)
