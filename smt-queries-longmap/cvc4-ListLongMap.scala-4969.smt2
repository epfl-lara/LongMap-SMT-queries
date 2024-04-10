; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68328 () Bool)

(assert start!68328)

(declare-fun b!793834 () Bool)

(declare-fun res!538359 () Bool)

(declare-fun e!440899 () Bool)

(assert (=> b!793834 (=> (not res!538359) (not e!440899))))

(declare-datatypes ((array!43118 0))(
  ( (array!43119 (arr!20639 (Array (_ BitVec 32) (_ BitVec 64))) (size!21060 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43118)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43118 (_ BitVec 32)) Bool)

(assert (=> b!793834 (= res!538359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793835 () Bool)

(declare-fun res!538356 () Bool)

(assert (=> b!793835 (=> (not res!538356) (not e!440899))))

(declare-datatypes ((List!14602 0))(
  ( (Nil!14599) (Cons!14598 (h!15727 (_ BitVec 64)) (t!20917 List!14602)) )
))
(declare-fun arrayNoDuplicates!0 (array!43118 (_ BitVec 32) List!14602) Bool)

(assert (=> b!793835 (= res!538356 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14599))))

(declare-fun b!793836 () Bool)

(declare-fun res!538361 () Bool)

(assert (=> b!793836 (=> (not res!538361) (not e!440899))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793836 (= res!538361 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21060 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20639 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21060 a!3170)) (= (select (arr!20639 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793837 () Bool)

(declare-fun e!440900 () Bool)

(assert (=> b!793837 (= e!440900 e!440899)))

(declare-fun res!538357 () Bool)

(assert (=> b!793837 (=> (not res!538357) (not e!440899))))

(declare-datatypes ((SeekEntryResult!8230 0))(
  ( (MissingZero!8230 (index!35288 (_ BitVec 32))) (Found!8230 (index!35289 (_ BitVec 32))) (Intermediate!8230 (undefined!9042 Bool) (index!35290 (_ BitVec 32)) (x!66220 (_ BitVec 32))) (Undefined!8230) (MissingVacant!8230 (index!35291 (_ BitVec 32))) )
))
(declare-fun lt!353869 () SeekEntryResult!8230)

(assert (=> b!793837 (= res!538357 (or (= lt!353869 (MissingZero!8230 i!1163)) (= lt!353869 (MissingVacant!8230 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43118 (_ BitVec 32)) SeekEntryResult!8230)

(assert (=> b!793837 (= lt!353869 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793838 () Bool)

(assert (=> b!793838 (= e!440899 false)))

(declare-fun lt!353871 () (_ BitVec 64))

(declare-fun lt!353873 () array!43118)

(declare-fun lt!353872 () SeekEntryResult!8230)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43118 (_ BitVec 32)) SeekEntryResult!8230)

(assert (=> b!793838 (= lt!353872 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353871 lt!353873 mask!3266))))

(declare-fun lt!353870 () SeekEntryResult!8230)

(assert (=> b!793838 (= lt!353870 (seekEntryOrOpen!0 lt!353871 lt!353873 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793838 (= lt!353871 (select (store (arr!20639 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793838 (= lt!353873 (array!43119 (store (arr!20639 a!3170) i!1163 k!2044) (size!21060 a!3170)))))

(declare-fun res!538360 () Bool)

(assert (=> start!68328 (=> (not res!538360) (not e!440900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68328 (= res!538360 (validMask!0 mask!3266))))

(assert (=> start!68328 e!440900))

(assert (=> start!68328 true))

(declare-fun array_inv!16435 (array!43118) Bool)

(assert (=> start!68328 (array_inv!16435 a!3170)))

(declare-fun b!793839 () Bool)

(declare-fun res!538353 () Bool)

(assert (=> b!793839 (=> (not res!538353) (not e!440900))))

(assert (=> b!793839 (= res!538353 (and (= (size!21060 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21060 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21060 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793840 () Bool)

(declare-fun res!538358 () Bool)

(assert (=> b!793840 (=> (not res!538358) (not e!440900))))

(declare-fun arrayContainsKey!0 (array!43118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793840 (= res!538358 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793841 () Bool)

(declare-fun res!538355 () Bool)

(assert (=> b!793841 (=> (not res!538355) (not e!440900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793841 (= res!538355 (validKeyInArray!0 (select (arr!20639 a!3170) j!153)))))

(declare-fun b!793842 () Bool)

(declare-fun res!538354 () Bool)

(assert (=> b!793842 (=> (not res!538354) (not e!440900))))

(assert (=> b!793842 (= res!538354 (validKeyInArray!0 k!2044))))

(assert (= (and start!68328 res!538360) b!793839))

(assert (= (and b!793839 res!538353) b!793841))

(assert (= (and b!793841 res!538355) b!793842))

(assert (= (and b!793842 res!538354) b!793840))

(assert (= (and b!793840 res!538358) b!793837))

(assert (= (and b!793837 res!538357) b!793834))

(assert (= (and b!793834 res!538359) b!793835))

(assert (= (and b!793835 res!538356) b!793836))

(assert (= (and b!793836 res!538361) b!793838))

(declare-fun m!734333 () Bool)

(assert (=> b!793837 m!734333))

(declare-fun m!734335 () Bool)

(assert (=> start!68328 m!734335))

(declare-fun m!734337 () Bool)

(assert (=> start!68328 m!734337))

(declare-fun m!734339 () Bool)

(assert (=> b!793838 m!734339))

(declare-fun m!734341 () Bool)

(assert (=> b!793838 m!734341))

(declare-fun m!734343 () Bool)

(assert (=> b!793838 m!734343))

(declare-fun m!734345 () Bool)

(assert (=> b!793838 m!734345))

(declare-fun m!734347 () Bool)

(assert (=> b!793835 m!734347))

(declare-fun m!734349 () Bool)

(assert (=> b!793840 m!734349))

(declare-fun m!734351 () Bool)

(assert (=> b!793841 m!734351))

(assert (=> b!793841 m!734351))

(declare-fun m!734353 () Bool)

(assert (=> b!793841 m!734353))

(declare-fun m!734355 () Bool)

(assert (=> b!793842 m!734355))

(declare-fun m!734357 () Bool)

(assert (=> b!793836 m!734357))

(declare-fun m!734359 () Bool)

(assert (=> b!793836 m!734359))

(declare-fun m!734361 () Bool)

(assert (=> b!793834 m!734361))

(push 1)

(assert (not b!793840))

(assert (not b!793835))

(assert (not start!68328))

(assert (not b!793837))

(assert (not b!793838))

(assert (not b!793841))

(assert (not b!793834))

