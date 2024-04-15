; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68286 () Bool)

(assert start!68286)

(declare-fun b!793278 () Bool)

(declare-fun res!537940 () Bool)

(declare-fun e!440636 () Bool)

(assert (=> b!793278 (=> (not res!537940) (not e!440636))))

(declare-datatypes ((array!43093 0))(
  ( (array!43094 (arr!20627 (Array (_ BitVec 32) (_ BitVec 64))) (size!21048 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43093)

(declare-datatypes ((List!14629 0))(
  ( (Nil!14626) (Cons!14625 (h!15754 (_ BitVec 64)) (t!20935 List!14629)) )
))
(declare-fun arrayNoDuplicates!0 (array!43093 (_ BitVec 32) List!14629) Bool)

(assert (=> b!793278 (= res!537940 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14626))))

(declare-fun b!793279 () Bool)

(declare-fun res!537941 () Bool)

(declare-fun e!440637 () Bool)

(assert (=> b!793279 (=> (not res!537941) (not e!440637))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793279 (= res!537941 (validKeyInArray!0 k0!2044))))

(declare-fun b!793280 () Bool)

(declare-fun res!537945 () Bool)

(assert (=> b!793280 (=> (not res!537945) (not e!440637))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793280 (= res!537945 (validKeyInArray!0 (select (arr!20627 a!3170) j!153)))))

(declare-fun b!793281 () Bool)

(declare-fun res!537939 () Bool)

(assert (=> b!793281 (=> (not res!537939) (not e!440637))))

(declare-fun arrayContainsKey!0 (array!43093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793281 (= res!537939 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793282 () Bool)

(assert (=> b!793282 (= e!440637 e!440636)))

(declare-fun res!537942 () Bool)

(assert (=> b!793282 (=> (not res!537942) (not e!440636))))

(declare-datatypes ((SeekEntryResult!8215 0))(
  ( (MissingZero!8215 (index!35228 (_ BitVec 32))) (Found!8215 (index!35229 (_ BitVec 32))) (Intermediate!8215 (undefined!9027 Bool) (index!35230 (_ BitVec 32)) (x!66176 (_ BitVec 32))) (Undefined!8215) (MissingVacant!8215 (index!35231 (_ BitVec 32))) )
))
(declare-fun lt!353482 () SeekEntryResult!8215)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793282 (= res!537942 (or (= lt!353482 (MissingZero!8215 i!1163)) (= lt!353482 (MissingVacant!8215 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43093 (_ BitVec 32)) SeekEntryResult!8215)

(assert (=> b!793282 (= lt!353482 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793283 () Bool)

(declare-fun res!537938 () Bool)

(assert (=> b!793283 (=> (not res!537938) (not e!440636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43093 (_ BitVec 32)) Bool)

(assert (=> b!793283 (= res!537938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537943 () Bool)

(assert (=> start!68286 (=> (not res!537943) (not e!440637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68286 (= res!537943 (validMask!0 mask!3266))))

(assert (=> start!68286 e!440637))

(assert (=> start!68286 true))

(declare-fun array_inv!16510 (array!43093) Bool)

(assert (=> start!68286 (array_inv!16510 a!3170)))

(declare-fun b!793284 () Bool)

(declare-fun res!537944 () Bool)

(assert (=> b!793284 (=> (not res!537944) (not e!440637))))

(assert (=> b!793284 (= res!537944 (and (= (size!21048 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21048 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21048 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793285 () Bool)

(assert (=> b!793285 (= e!440636 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353486 () SeekEntryResult!8215)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353485 () array!43093)

(declare-fun lt!353483 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43093 (_ BitVec 32)) SeekEntryResult!8215)

(assert (=> b!793285 (= lt!353486 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353483 lt!353485 mask!3266))))

(declare-fun lt!353484 () SeekEntryResult!8215)

(assert (=> b!793285 (= lt!353484 (seekEntryOrOpen!0 lt!353483 lt!353485 mask!3266))))

(assert (=> b!793285 (= lt!353483 (select (store (arr!20627 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!793285 (= lt!353485 (array!43094 (store (arr!20627 a!3170) i!1163 k0!2044) (size!21048 a!3170)))))

(declare-fun b!793286 () Bool)

(declare-fun res!537937 () Bool)

(assert (=> b!793286 (=> (not res!537937) (not e!440636))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793286 (= res!537937 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21048 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20627 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21048 a!3170)) (= (select (arr!20627 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68286 res!537943) b!793284))

(assert (= (and b!793284 res!537944) b!793280))

(assert (= (and b!793280 res!537945) b!793279))

(assert (= (and b!793279 res!537941) b!793281))

(assert (= (and b!793281 res!537939) b!793282))

(assert (= (and b!793282 res!537942) b!793283))

(assert (= (and b!793283 res!537938) b!793278))

(assert (= (and b!793278 res!537940) b!793286))

(assert (= (and b!793286 res!537937) b!793285))

(declare-fun m!733261 () Bool)

(assert (=> b!793285 m!733261))

(declare-fun m!733263 () Bool)

(assert (=> b!793285 m!733263))

(declare-fun m!733265 () Bool)

(assert (=> b!793285 m!733265))

(declare-fun m!733267 () Bool)

(assert (=> b!793285 m!733267))

(declare-fun m!733269 () Bool)

(assert (=> b!793283 m!733269))

(declare-fun m!733271 () Bool)

(assert (=> start!68286 m!733271))

(declare-fun m!733273 () Bool)

(assert (=> start!68286 m!733273))

(declare-fun m!733275 () Bool)

(assert (=> b!793281 m!733275))

(declare-fun m!733277 () Bool)

(assert (=> b!793282 m!733277))

(declare-fun m!733279 () Bool)

(assert (=> b!793286 m!733279))

(declare-fun m!733281 () Bool)

(assert (=> b!793286 m!733281))

(declare-fun m!733283 () Bool)

(assert (=> b!793278 m!733283))

(declare-fun m!733285 () Bool)

(assert (=> b!793279 m!733285))

(declare-fun m!733287 () Bool)

(assert (=> b!793280 m!733287))

(assert (=> b!793280 m!733287))

(declare-fun m!733289 () Bool)

(assert (=> b!793280 m!733289))

(check-sat (not start!68286) (not b!793283) (not b!793285) (not b!793281) (not b!793280) (not b!793279) (not b!793278) (not b!793282))
(check-sat)
