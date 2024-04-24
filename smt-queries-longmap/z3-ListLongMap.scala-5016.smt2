; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68730 () Bool)

(assert start!68730)

(declare-fun res!543088 () Bool)

(declare-fun e!443243 () Bool)

(assert (=> start!68730 (=> (not res!543088) (not e!443243))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68730 (= res!543088 (validMask!0 mask!3266))))

(assert (=> start!68730 e!443243))

(assert (=> start!68730 true))

(declare-datatypes ((array!43394 0))(
  ( (array!43395 (arr!20773 (Array (_ BitVec 32) (_ BitVec 64))) (size!21193 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43394)

(declare-fun array_inv!16632 (array!43394) Bool)

(assert (=> start!68730 (array_inv!16632 a!3170)))

(declare-fun b!798935 () Bool)

(declare-fun e!443245 () Bool)

(declare-fun e!443242 () Bool)

(assert (=> b!798935 (= e!443245 e!443242)))

(declare-fun res!543083 () Bool)

(assert (=> b!798935 (=> (not res!543083) (not e!443242))))

(declare-datatypes ((SeekEntryResult!8320 0))(
  ( (MissingZero!8320 (index!35648 (_ BitVec 32))) (Found!8320 (index!35649 (_ BitVec 32))) (Intermediate!8320 (undefined!9132 Bool) (index!35650 (_ BitVec 32)) (x!66697 (_ BitVec 32))) (Undefined!8320) (MissingVacant!8320 (index!35651 (_ BitVec 32))) )
))
(declare-fun lt!356591 () SeekEntryResult!8320)

(declare-fun lt!356595 () SeekEntryResult!8320)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798935 (= res!543083 (and (= lt!356595 lt!356591) (= lt!356591 (Found!8320 j!153)) (= (select (arr!20773 a!3170) index!1236) (select (arr!20773 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43394 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!798935 (= lt!356591 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20773 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43394 (_ BitVec 32)) SeekEntryResult!8320)

(assert (=> b!798935 (= lt!356595 (seekEntryOrOpen!0 (select (arr!20773 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798936 () Bool)

(declare-fun res!543089 () Bool)

(assert (=> b!798936 (=> (not res!543089) (not e!443243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798936 (= res!543089 (validKeyInArray!0 (select (arr!20773 a!3170) j!153)))))

(declare-fun b!798937 () Bool)

(declare-fun res!543082 () Bool)

(assert (=> b!798937 (=> (not res!543082) (not e!443243))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!798937 (= res!543082 (validKeyInArray!0 k0!2044))))

(declare-fun b!798938 () Bool)

(assert (=> b!798938 (= e!443242 (not true))))

(declare-fun lt!356596 () SeekEntryResult!8320)

(assert (=> b!798938 (= lt!356596 (Found!8320 index!1236))))

(declare-fun b!798939 () Bool)

(declare-fun res!543087 () Bool)

(declare-fun e!443244 () Bool)

(assert (=> b!798939 (=> (not res!543087) (not e!443244))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798939 (= res!543087 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21193 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20773 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21193 a!3170)) (= (select (arr!20773 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798940 () Bool)

(declare-fun res!543080 () Bool)

(assert (=> b!798940 (=> (not res!543080) (not e!443244))))

(declare-datatypes ((List!14643 0))(
  ( (Nil!14640) (Cons!14639 (h!15774 (_ BitVec 64)) (t!20950 List!14643)) )
))
(declare-fun arrayNoDuplicates!0 (array!43394 (_ BitVec 32) List!14643) Bool)

(assert (=> b!798940 (= res!543080 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14640))))

(declare-fun b!798941 () Bool)

(assert (=> b!798941 (= e!443243 e!443244)))

(declare-fun res!543085 () Bool)

(assert (=> b!798941 (=> (not res!543085) (not e!443244))))

(declare-fun lt!356590 () SeekEntryResult!8320)

(assert (=> b!798941 (= res!543085 (or (= lt!356590 (MissingZero!8320 i!1163)) (= lt!356590 (MissingVacant!8320 i!1163))))))

(assert (=> b!798941 (= lt!356590 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798942 () Bool)

(assert (=> b!798942 (= e!443244 e!443245)))

(declare-fun res!543084 () Bool)

(assert (=> b!798942 (=> (not res!543084) (not e!443245))))

(declare-fun lt!356593 () SeekEntryResult!8320)

(assert (=> b!798942 (= res!543084 (= lt!356593 lt!356596))))

(declare-fun lt!356594 () array!43394)

(declare-fun lt!356592 () (_ BitVec 64))

(assert (=> b!798942 (= lt!356596 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356592 lt!356594 mask!3266))))

(assert (=> b!798942 (= lt!356593 (seekEntryOrOpen!0 lt!356592 lt!356594 mask!3266))))

(assert (=> b!798942 (= lt!356592 (select (store (arr!20773 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798942 (= lt!356594 (array!43395 (store (arr!20773 a!3170) i!1163 k0!2044) (size!21193 a!3170)))))

(declare-fun b!798943 () Bool)

(declare-fun res!543086 () Bool)

(assert (=> b!798943 (=> (not res!543086) (not e!443244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43394 (_ BitVec 32)) Bool)

(assert (=> b!798943 (= res!543086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798944 () Bool)

(declare-fun res!543081 () Bool)

(assert (=> b!798944 (=> (not res!543081) (not e!443243))))

(assert (=> b!798944 (= res!543081 (and (= (size!21193 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21193 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21193 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798945 () Bool)

(declare-fun res!543090 () Bool)

(assert (=> b!798945 (=> (not res!543090) (not e!443243))))

(declare-fun arrayContainsKey!0 (array!43394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798945 (= res!543090 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68730 res!543088) b!798944))

(assert (= (and b!798944 res!543081) b!798936))

(assert (= (and b!798936 res!543089) b!798937))

(assert (= (and b!798937 res!543082) b!798945))

(assert (= (and b!798945 res!543090) b!798941))

(assert (= (and b!798941 res!543085) b!798943))

(assert (= (and b!798943 res!543086) b!798940))

(assert (= (and b!798940 res!543080) b!798939))

(assert (= (and b!798939 res!543087) b!798942))

(assert (= (and b!798942 res!543084) b!798935))

(assert (= (and b!798935 res!543083) b!798938))

(declare-fun m!740255 () Bool)

(assert (=> b!798941 m!740255))

(declare-fun m!740257 () Bool)

(assert (=> b!798936 m!740257))

(assert (=> b!798936 m!740257))

(declare-fun m!740259 () Bool)

(assert (=> b!798936 m!740259))

(declare-fun m!740261 () Bool)

(assert (=> start!68730 m!740261))

(declare-fun m!740263 () Bool)

(assert (=> start!68730 m!740263))

(declare-fun m!740265 () Bool)

(assert (=> b!798940 m!740265))

(declare-fun m!740267 () Bool)

(assert (=> b!798945 m!740267))

(declare-fun m!740269 () Bool)

(assert (=> b!798943 m!740269))

(declare-fun m!740271 () Bool)

(assert (=> b!798935 m!740271))

(assert (=> b!798935 m!740257))

(assert (=> b!798935 m!740257))

(declare-fun m!740273 () Bool)

(assert (=> b!798935 m!740273))

(assert (=> b!798935 m!740257))

(declare-fun m!740275 () Bool)

(assert (=> b!798935 m!740275))

(declare-fun m!740277 () Bool)

(assert (=> b!798942 m!740277))

(declare-fun m!740279 () Bool)

(assert (=> b!798942 m!740279))

(declare-fun m!740281 () Bool)

(assert (=> b!798942 m!740281))

(declare-fun m!740283 () Bool)

(assert (=> b!798942 m!740283))

(declare-fun m!740285 () Bool)

(assert (=> b!798939 m!740285))

(declare-fun m!740287 () Bool)

(assert (=> b!798939 m!740287))

(declare-fun m!740289 () Bool)

(assert (=> b!798937 m!740289))

(check-sat (not b!798942) (not b!798937) (not b!798935) (not b!798936) (not b!798941) (not b!798943) (not b!798945) (not start!68730) (not b!798940))
(check-sat)
