; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68502 () Bool)

(assert start!68502)

(declare-fun b!796478 () Bool)

(declare-fun res!541003 () Bool)

(declare-fun e!441949 () Bool)

(assert (=> b!796478 (=> (not res!541003) (not e!441949))))

(declare-datatypes ((array!43292 0))(
  ( (array!43293 (arr!20726 (Array (_ BitVec 32) (_ BitVec 64))) (size!21147 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43292)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796478 (= res!541003 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796479 () Bool)

(declare-fun e!441953 () Bool)

(declare-fun e!441951 () Bool)

(assert (=> b!796479 (= e!441953 e!441951)))

(declare-fun res!540998 () Bool)

(assert (=> b!796479 (=> (not res!540998) (not e!441951))))

(declare-datatypes ((SeekEntryResult!8317 0))(
  ( (MissingZero!8317 (index!35636 (_ BitVec 32))) (Found!8317 (index!35637 (_ BitVec 32))) (Intermediate!8317 (undefined!9129 Bool) (index!35638 (_ BitVec 32)) (x!66539 (_ BitVec 32))) (Undefined!8317) (MissingVacant!8317 (index!35639 (_ BitVec 32))) )
))
(declare-fun lt!355159 () SeekEntryResult!8317)

(declare-fun lt!355155 () SeekEntryResult!8317)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796479 (= res!540998 (and (= lt!355155 lt!355159) (= lt!355159 (Found!8317 j!153)) (= (select (arr!20726 a!3170) index!1236) (select (arr!20726 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43292 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!796479 (= lt!355159 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20726 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43292 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!796479 (= lt!355155 (seekEntryOrOpen!0 (select (arr!20726 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796480 () Bool)

(declare-fun res!540999 () Bool)

(assert (=> b!796480 (=> (not res!540999) (not e!441949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796480 (= res!540999 (validKeyInArray!0 k!2044))))

(declare-fun b!796481 () Bool)

(declare-fun res!541007 () Bool)

(declare-fun e!441952 () Bool)

(assert (=> b!796481 (=> (not res!541007) (not e!441952))))

(declare-datatypes ((List!14689 0))(
  ( (Nil!14686) (Cons!14685 (h!15814 (_ BitVec 64)) (t!21004 List!14689)) )
))
(declare-fun arrayNoDuplicates!0 (array!43292 (_ BitVec 32) List!14689) Bool)

(assert (=> b!796481 (= res!541007 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14686))))

(declare-fun b!796482 () Bool)

(declare-fun res!541004 () Bool)

(assert (=> b!796482 (=> (not res!541004) (not e!441952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43292 (_ BitVec 32)) Bool)

(assert (=> b!796482 (= res!541004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796483 () Bool)

(declare-fun res!540997 () Bool)

(assert (=> b!796483 (=> (not res!540997) (not e!441949))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796483 (= res!540997 (and (= (size!21147 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21147 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21147 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796484 () Bool)

(assert (=> b!796484 (= e!441951 (not true))))

(declare-fun lt!355157 () SeekEntryResult!8317)

(assert (=> b!796484 (= lt!355157 (Found!8317 index!1236))))

(declare-fun res!541005 () Bool)

(assert (=> start!68502 (=> (not res!541005) (not e!441949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68502 (= res!541005 (validMask!0 mask!3266))))

(assert (=> start!68502 e!441949))

(assert (=> start!68502 true))

(declare-fun array_inv!16522 (array!43292) Bool)

(assert (=> start!68502 (array_inv!16522 a!3170)))

(declare-fun b!796485 () Bool)

(declare-fun res!541000 () Bool)

(assert (=> b!796485 (=> (not res!541000) (not e!441949))))

(assert (=> b!796485 (= res!541000 (validKeyInArray!0 (select (arr!20726 a!3170) j!153)))))

(declare-fun b!796486 () Bool)

(assert (=> b!796486 (= e!441952 e!441953)))

(declare-fun res!541006 () Bool)

(assert (=> b!796486 (=> (not res!541006) (not e!441953))))

(declare-fun lt!355154 () SeekEntryResult!8317)

(assert (=> b!796486 (= res!541006 (= lt!355154 lt!355157))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355158 () array!43292)

(declare-fun lt!355156 () (_ BitVec 64))

(assert (=> b!796486 (= lt!355157 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355156 lt!355158 mask!3266))))

(assert (=> b!796486 (= lt!355154 (seekEntryOrOpen!0 lt!355156 lt!355158 mask!3266))))

(assert (=> b!796486 (= lt!355156 (select (store (arr!20726 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796486 (= lt!355158 (array!43293 (store (arr!20726 a!3170) i!1163 k!2044) (size!21147 a!3170)))))

(declare-fun b!796487 () Bool)

(declare-fun res!541002 () Bool)

(assert (=> b!796487 (=> (not res!541002) (not e!441952))))

(assert (=> b!796487 (= res!541002 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21147 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20726 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21147 a!3170)) (= (select (arr!20726 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796488 () Bool)

(assert (=> b!796488 (= e!441949 e!441952)))

(declare-fun res!541001 () Bool)

(assert (=> b!796488 (=> (not res!541001) (not e!441952))))

(declare-fun lt!355160 () SeekEntryResult!8317)

(assert (=> b!796488 (= res!541001 (or (= lt!355160 (MissingZero!8317 i!1163)) (= lt!355160 (MissingVacant!8317 i!1163))))))

(assert (=> b!796488 (= lt!355160 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68502 res!541005) b!796483))

(assert (= (and b!796483 res!540997) b!796485))

(assert (= (and b!796485 res!541000) b!796480))

(assert (= (and b!796480 res!540999) b!796478))

(assert (= (and b!796478 res!541003) b!796488))

(assert (= (and b!796488 res!541001) b!796482))

(assert (= (and b!796482 res!541004) b!796481))

(assert (= (and b!796481 res!541007) b!796487))

(assert (= (and b!796487 res!541002) b!796486))

(assert (= (and b!796486 res!541006) b!796479))

(assert (= (and b!796479 res!540998) b!796484))

(declare-fun m!737267 () Bool)

(assert (=> b!796479 m!737267))

(declare-fun m!737269 () Bool)

(assert (=> b!796479 m!737269))

(assert (=> b!796479 m!737269))

(declare-fun m!737271 () Bool)

(assert (=> b!796479 m!737271))

(assert (=> b!796479 m!737269))

(declare-fun m!737273 () Bool)

(assert (=> b!796479 m!737273))

(declare-fun m!737275 () Bool)

(assert (=> b!796482 m!737275))

(declare-fun m!737277 () Bool)

(assert (=> start!68502 m!737277))

(declare-fun m!737279 () Bool)

(assert (=> start!68502 m!737279))

(declare-fun m!737281 () Bool)

(assert (=> b!796481 m!737281))

(declare-fun m!737283 () Bool)

(assert (=> b!796478 m!737283))

(declare-fun m!737285 () Bool)

(assert (=> b!796486 m!737285))

(declare-fun m!737287 () Bool)

(assert (=> b!796486 m!737287))

(declare-fun m!737289 () Bool)

(assert (=> b!796486 m!737289))

(declare-fun m!737291 () Bool)

(assert (=> b!796486 m!737291))

(declare-fun m!737293 () Bool)

(assert (=> b!796488 m!737293))

(assert (=> b!796485 m!737269))

(assert (=> b!796485 m!737269))

(declare-fun m!737295 () Bool)

(assert (=> b!796485 m!737295))

(declare-fun m!737297 () Bool)

(assert (=> b!796480 m!737297))

(declare-fun m!737299 () Bool)

(assert (=> b!796487 m!737299))

(declare-fun m!737301 () Bool)

(assert (=> b!796487 m!737301))

(push 1)

(assert (not b!796480))

(assert (not b!796479))

(assert (not b!796486))

