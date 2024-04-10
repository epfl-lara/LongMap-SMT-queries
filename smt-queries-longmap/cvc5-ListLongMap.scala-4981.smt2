; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68396 () Bool)

(assert start!68396)

(declare-fun res!539342 () Bool)

(declare-fun e!441262 () Bool)

(assert (=> start!68396 (=> (not res!539342) (not e!441262))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68396 (= res!539342 (validMask!0 mask!3266))))

(assert (=> start!68396 e!441262))

(assert (=> start!68396 true))

(declare-datatypes ((array!43186 0))(
  ( (array!43187 (arr!20673 (Array (_ BitVec 32) (_ BitVec 64))) (size!21094 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43186)

(declare-fun array_inv!16469 (array!43186) Bool)

(assert (=> start!68396 (array_inv!16469 a!3170)))

(declare-fun b!794819 () Bool)

(declare-fun res!539345 () Bool)

(assert (=> b!794819 (=> (not res!539345) (not e!441262))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794819 (= res!539345 (and (= (size!21094 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21094 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21094 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794820 () Bool)

(declare-fun res!539341 () Bool)

(assert (=> b!794820 (=> (not res!539341) (not e!441262))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794820 (= res!539341 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794821 () Bool)

(declare-fun res!539348 () Bool)

(declare-fun e!441260 () Bool)

(assert (=> b!794821 (=> (not res!539348) (not e!441260))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794821 (= res!539348 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21094 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20673 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21094 a!3170)) (= (select (arr!20673 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794822 () Bool)

(declare-fun res!539343 () Bool)

(assert (=> b!794822 (=> (not res!539343) (not e!441260))))

(declare-datatypes ((List!14636 0))(
  ( (Nil!14633) (Cons!14632 (h!15761 (_ BitVec 64)) (t!20951 List!14636)) )
))
(declare-fun arrayNoDuplicates!0 (array!43186 (_ BitVec 32) List!14636) Bool)

(assert (=> b!794822 (= res!539343 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14633))))

(declare-fun b!794823 () Bool)

(declare-fun res!539338 () Bool)

(assert (=> b!794823 (=> (not res!539338) (not e!441260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43186 (_ BitVec 32)) Bool)

(assert (=> b!794823 (= res!539338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794824 () Bool)

(declare-fun res!539346 () Bool)

(declare-fun e!441263 () Bool)

(assert (=> b!794824 (=> (not res!539346) (not e!441263))))

(declare-datatypes ((SeekEntryResult!8264 0))(
  ( (MissingZero!8264 (index!35424 (_ BitVec 32))) (Found!8264 (index!35425 (_ BitVec 32))) (Intermediate!8264 (undefined!9076 Bool) (index!35426 (_ BitVec 32)) (x!66350 (_ BitVec 32))) (Undefined!8264) (MissingVacant!8264 (index!35427 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43186 (_ BitVec 32)) SeekEntryResult!8264)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43186 (_ BitVec 32)) SeekEntryResult!8264)

(assert (=> b!794824 (= res!539346 (= (seekEntryOrOpen!0 (select (arr!20673 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20673 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794825 () Bool)

(assert (=> b!794825 (= e!441262 e!441260)))

(declare-fun res!539344 () Bool)

(assert (=> b!794825 (=> (not res!539344) (not e!441260))))

(declare-fun lt!354304 () SeekEntryResult!8264)

(assert (=> b!794825 (= res!539344 (or (= lt!354304 (MissingZero!8264 i!1163)) (= lt!354304 (MissingVacant!8264 i!1163))))))

(assert (=> b!794825 (= lt!354304 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794826 () Bool)

(declare-fun res!539339 () Bool)

(assert (=> b!794826 (=> (not res!539339) (not e!441262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794826 (= res!539339 (validKeyInArray!0 k!2044))))

(declare-fun b!794827 () Bool)

(assert (=> b!794827 (= e!441260 e!441263)))

(declare-fun res!539347 () Bool)

(assert (=> b!794827 (=> (not res!539347) (not e!441263))))

(declare-fun lt!354305 () (_ BitVec 64))

(declare-fun lt!354303 () array!43186)

(assert (=> b!794827 (= res!539347 (= (seekEntryOrOpen!0 lt!354305 lt!354303 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354305 lt!354303 mask!3266)))))

(assert (=> b!794827 (= lt!354305 (select (store (arr!20673 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794827 (= lt!354303 (array!43187 (store (arr!20673 a!3170) i!1163 k!2044) (size!21094 a!3170)))))

(declare-fun b!794828 () Bool)

(declare-fun res!539340 () Bool)

(assert (=> b!794828 (=> (not res!539340) (not e!441262))))

(assert (=> b!794828 (= res!539340 (validKeyInArray!0 (select (arr!20673 a!3170) j!153)))))

(declare-fun b!794829 () Bool)

(assert (=> b!794829 (= e!441263 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (= (and start!68396 res!539342) b!794819))

(assert (= (and b!794819 res!539345) b!794828))

(assert (= (and b!794828 res!539340) b!794826))

(assert (= (and b!794826 res!539339) b!794820))

(assert (= (and b!794820 res!539341) b!794825))

(assert (= (and b!794825 res!539344) b!794823))

(assert (= (and b!794823 res!539338) b!794822))

(assert (= (and b!794822 res!539343) b!794821))

(assert (= (and b!794821 res!539348) b!794827))

(assert (= (and b!794827 res!539347) b!794824))

(assert (= (and b!794824 res!539346) b!794829))

(declare-fun m!735389 () Bool)

(assert (=> b!794820 m!735389))

(declare-fun m!735391 () Bool)

(assert (=> b!794821 m!735391))

(declare-fun m!735393 () Bool)

(assert (=> b!794821 m!735393))

(declare-fun m!735395 () Bool)

(assert (=> b!794828 m!735395))

(assert (=> b!794828 m!735395))

(declare-fun m!735397 () Bool)

(assert (=> b!794828 m!735397))

(assert (=> b!794824 m!735395))

(assert (=> b!794824 m!735395))

(declare-fun m!735399 () Bool)

(assert (=> b!794824 m!735399))

(assert (=> b!794824 m!735395))

(declare-fun m!735401 () Bool)

(assert (=> b!794824 m!735401))

(declare-fun m!735403 () Bool)

(assert (=> b!794827 m!735403))

(declare-fun m!735405 () Bool)

(assert (=> b!794827 m!735405))

(declare-fun m!735407 () Bool)

(assert (=> b!794827 m!735407))

(declare-fun m!735409 () Bool)

(assert (=> b!794827 m!735409))

(declare-fun m!735411 () Bool)

(assert (=> b!794826 m!735411))

(declare-fun m!735413 () Bool)

(assert (=> start!68396 m!735413))

(declare-fun m!735415 () Bool)

(assert (=> start!68396 m!735415))

(declare-fun m!735417 () Bool)

(assert (=> b!794823 m!735417))

(declare-fun m!735419 () Bool)

(assert (=> b!794822 m!735419))

(declare-fun m!735421 () Bool)

(assert (=> b!794825 m!735421))

(push 1)

(assert (not b!794827))

(assert (not b!794824))

(assert (not start!68396))

(assert (not b!794826))

(assert (not b!794823))

(assert (not b!794822))

(assert (not b!794820))

(assert (not b!794828))

(assert (not b!794825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

