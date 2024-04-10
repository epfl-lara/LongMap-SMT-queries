; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53918 () Bool)

(assert start!53918)

(declare-fun b!588373 () Bool)

(declare-fun res!376019 () Bool)

(declare-fun e!335992 () Bool)

(assert (=> b!588373 (=> (not res!376019) (not e!335992))))

(declare-datatypes ((array!36762 0))(
  ( (array!36763 (arr!17654 (Array (_ BitVec 32) (_ BitVec 64))) (size!18018 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36762)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36762 (_ BitVec 32)) Bool)

(assert (=> b!588373 (= res!376019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588374 () Bool)

(declare-fun res!376016 () Bool)

(declare-fun e!335993 () Bool)

(assert (=> b!588374 (=> (not res!376016) (not e!335993))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!588374 (= res!376016 (and (= (size!18018 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18018 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18018 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588375 () Bool)

(declare-fun res!376017 () Bool)

(assert (=> b!588375 (=> (not res!376017) (not e!335992))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588375 (= res!376017 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17654 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17654 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!376011 () Bool)

(assert (=> start!53918 (=> (not res!376011) (not e!335993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53918 (= res!376011 (validMask!0 mask!3053))))

(assert (=> start!53918 e!335993))

(assert (=> start!53918 true))

(declare-fun array_inv!13450 (array!36762) Bool)

(assert (=> start!53918 (array_inv!13450 a!2986)))

(declare-fun b!588376 () Bool)

(declare-fun res!376013 () Bool)

(assert (=> b!588376 (=> (not res!376013) (not e!335992))))

(declare-datatypes ((List!11695 0))(
  ( (Nil!11692) (Cons!11691 (h!12736 (_ BitVec 64)) (t!17923 List!11695)) )
))
(declare-fun arrayNoDuplicates!0 (array!36762 (_ BitVec 32) List!11695) Bool)

(assert (=> b!588376 (= res!376013 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11692))))

(declare-fun b!588377 () Bool)

(declare-fun res!376009 () Bool)

(assert (=> b!588377 (=> (not res!376009) (not e!335993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588377 (= res!376009 (validKeyInArray!0 (select (arr!17654 a!2986) j!136)))))

(declare-fun b!588378 () Bool)

(declare-fun e!335991 () Bool)

(declare-datatypes ((SeekEntryResult!6094 0))(
  ( (MissingZero!6094 (index!26606 (_ BitVec 32))) (Found!6094 (index!26607 (_ BitVec 32))) (Intermediate!6094 (undefined!6906 Bool) (index!26608 (_ BitVec 32)) (x!55404 (_ BitVec 32))) (Undefined!6094) (MissingVacant!6094 (index!26609 (_ BitVec 32))) )
))
(declare-fun lt!266760 () SeekEntryResult!6094)

(declare-fun lt!266762 () SeekEntryResult!6094)

(assert (=> b!588378 (= e!335991 (= lt!266760 lt!266762))))

(declare-fun b!588379 () Bool)

(declare-fun res!376010 () Bool)

(assert (=> b!588379 (=> (not res!376010) (not e!335993))))

(declare-fun arrayContainsKey!0 (array!36762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588379 (= res!376010 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588380 () Bool)

(declare-fun res!376012 () Bool)

(assert (=> b!588380 (=> (not res!376012) (not e!335993))))

(assert (=> b!588380 (= res!376012 (validKeyInArray!0 k!1786))))

(declare-fun b!588381 () Bool)

(assert (=> b!588381 (= e!335993 e!335992)))

(declare-fun res!376018 () Bool)

(assert (=> b!588381 (=> (not res!376018) (not e!335992))))

(declare-fun lt!266761 () SeekEntryResult!6094)

(assert (=> b!588381 (= res!376018 (or (= lt!266761 (MissingZero!6094 i!1108)) (= lt!266761 (MissingVacant!6094 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36762 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!588381 (= lt!266761 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!588382 () Bool)

(declare-fun e!335994 () Bool)

(assert (=> b!588382 (= e!335992 e!335994)))

(declare-fun res!376015 () Bool)

(assert (=> b!588382 (=> (not res!376015) (not e!335994))))

(assert (=> b!588382 (= res!376015 (and (= lt!266760 (Found!6094 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17654 a!2986) index!984) (select (arr!17654 a!2986) j!136))) (not (= (select (arr!17654 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36762 (_ BitVec 32)) SeekEntryResult!6094)

(assert (=> b!588382 (= lt!266760 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17654 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588383 () Bool)

(assert (=> b!588383 (= e!335994 (not true))))

(assert (=> b!588383 e!335991))

(declare-fun res!376014 () Bool)

(assert (=> b!588383 (=> (not res!376014) (not e!335991))))

(declare-fun lt!266764 () (_ BitVec 32))

(assert (=> b!588383 (= res!376014 (= lt!266762 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266764 vacantSpotIndex!68 (select (store (arr!17654 a!2986) i!1108 k!1786) j!136) (array!36763 (store (arr!17654 a!2986) i!1108 k!1786) (size!18018 a!2986)) mask!3053)))))

(assert (=> b!588383 (= lt!266762 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266764 vacantSpotIndex!68 (select (arr!17654 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18308 0))(
  ( (Unit!18309) )
))
(declare-fun lt!266763 () Unit!18308)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36762 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18308)

(assert (=> b!588383 (= lt!266763 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266764 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588383 (= lt!266764 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!53918 res!376011) b!588374))

(assert (= (and b!588374 res!376016) b!588377))

(assert (= (and b!588377 res!376009) b!588380))

(assert (= (and b!588380 res!376012) b!588379))

(assert (= (and b!588379 res!376010) b!588381))

(assert (= (and b!588381 res!376018) b!588373))

(assert (= (and b!588373 res!376019) b!588376))

(assert (= (and b!588376 res!376013) b!588375))

(assert (= (and b!588375 res!376017) b!588382))

(assert (= (and b!588382 res!376015) b!588383))

(assert (= (and b!588383 res!376014) b!588378))

(declare-fun m!566915 () Bool)

(assert (=> b!588382 m!566915))

(declare-fun m!566917 () Bool)

(assert (=> b!588382 m!566917))

(assert (=> b!588382 m!566917))

(declare-fun m!566919 () Bool)

(assert (=> b!588382 m!566919))

(declare-fun m!566921 () Bool)

(assert (=> b!588373 m!566921))

(declare-fun m!566923 () Bool)

(assert (=> b!588375 m!566923))

(declare-fun m!566925 () Bool)

(assert (=> b!588375 m!566925))

(declare-fun m!566927 () Bool)

(assert (=> b!588375 m!566927))

(declare-fun m!566929 () Bool)

(assert (=> b!588379 m!566929))

(declare-fun m!566931 () Bool)

(assert (=> b!588381 m!566931))

(declare-fun m!566933 () Bool)

(assert (=> b!588380 m!566933))

(declare-fun m!566935 () Bool)

(assert (=> b!588376 m!566935))

(declare-fun m!566937 () Bool)

(assert (=> start!53918 m!566937))

(declare-fun m!566939 () Bool)

(assert (=> start!53918 m!566939))

(declare-fun m!566941 () Bool)

(assert (=> b!588383 m!566941))

(declare-fun m!566943 () Bool)

(assert (=> b!588383 m!566943))

(assert (=> b!588383 m!566917))

(assert (=> b!588383 m!566925))

(declare-fun m!566945 () Bool)

(assert (=> b!588383 m!566945))

(assert (=> b!588383 m!566917))

(declare-fun m!566947 () Bool)

(assert (=> b!588383 m!566947))

(assert (=> b!588383 m!566943))

(declare-fun m!566949 () Bool)

(assert (=> b!588383 m!566949))

(assert (=> b!588377 m!566917))

(assert (=> b!588377 m!566917))

(declare-fun m!566951 () Bool)

(assert (=> b!588377 m!566951))

(push 1)

(assert (not b!588380))

(assert (not b!588383))

(assert (not b!588377))

(assert (not b!588381))

(assert (not b!588373))

(assert (not b!588382))

(assert (not start!53918))

