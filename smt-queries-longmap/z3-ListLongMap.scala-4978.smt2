; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68358 () Bool)

(assert start!68358)

(declare-fun b!794288 () Bool)

(declare-fun e!440998 () Bool)

(declare-fun e!441001 () Bool)

(assert (=> b!794288 (= e!440998 e!441001)))

(declare-fun res!538954 () Bool)

(assert (=> b!794288 (=> (not res!538954) (not e!441001))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43165 0))(
  ( (array!43166 (arr!20663 (Array (_ BitVec 32) (_ BitVec 64))) (size!21084 (_ BitVec 32))) )
))
(declare-fun lt!353950 () array!43165)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!353952 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8251 0))(
  ( (MissingZero!8251 (index!35372 (_ BitVec 32))) (Found!8251 (index!35373 (_ BitVec 32))) (Intermediate!8251 (undefined!9063 Bool) (index!35374 (_ BitVec 32)) (x!66308 (_ BitVec 32))) (Undefined!8251) (MissingVacant!8251 (index!35375 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43165 (_ BitVec 32)) SeekEntryResult!8251)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43165 (_ BitVec 32)) SeekEntryResult!8251)

(assert (=> b!794288 (= res!538954 (= (seekEntryOrOpen!0 lt!353952 lt!353950 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353952 lt!353950 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43165)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794288 (= lt!353952 (select (store (arr!20663 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794288 (= lt!353950 (array!43166 (store (arr!20663 a!3170) i!1163 k0!2044) (size!21084 a!3170)))))

(declare-fun b!794289 () Bool)

(declare-fun res!538950 () Bool)

(declare-fun e!440999 () Bool)

(assert (=> b!794289 (=> (not res!538950) (not e!440999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794289 (= res!538950 (validKeyInArray!0 k0!2044))))

(declare-fun b!794290 () Bool)

(assert (=> b!794290 (= e!441001 false)))

(declare-fun lt!353951 () SeekEntryResult!8251)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794290 (= lt!353951 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20663 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!353954 () SeekEntryResult!8251)

(assert (=> b!794290 (= lt!353954 (seekEntryOrOpen!0 (select (arr!20663 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794291 () Bool)

(declare-fun res!538953 () Bool)

(assert (=> b!794291 (=> (not res!538953) (not e!440999))))

(declare-fun arrayContainsKey!0 (array!43165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794291 (= res!538953 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794292 () Bool)

(declare-fun res!538949 () Bool)

(assert (=> b!794292 (=> (not res!538949) (not e!440999))))

(assert (=> b!794292 (= res!538949 (and (= (size!21084 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21084 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21084 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794293 () Bool)

(declare-fun res!538951 () Bool)

(assert (=> b!794293 (=> (not res!538951) (not e!440998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43165 (_ BitVec 32)) Bool)

(assert (=> b!794293 (= res!538951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794294 () Bool)

(assert (=> b!794294 (= e!440999 e!440998)))

(declare-fun res!538955 () Bool)

(assert (=> b!794294 (=> (not res!538955) (not e!440998))))

(declare-fun lt!353953 () SeekEntryResult!8251)

(assert (=> b!794294 (= res!538955 (or (= lt!353953 (MissingZero!8251 i!1163)) (= lt!353953 (MissingVacant!8251 i!1163))))))

(assert (=> b!794294 (= lt!353953 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!538956 () Bool)

(assert (=> start!68358 (=> (not res!538956) (not e!440999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68358 (= res!538956 (validMask!0 mask!3266))))

(assert (=> start!68358 e!440999))

(assert (=> start!68358 true))

(declare-fun array_inv!16546 (array!43165) Bool)

(assert (=> start!68358 (array_inv!16546 a!3170)))

(declare-fun b!794295 () Bool)

(declare-fun res!538948 () Bool)

(assert (=> b!794295 (=> (not res!538948) (not e!440999))))

(assert (=> b!794295 (= res!538948 (validKeyInArray!0 (select (arr!20663 a!3170) j!153)))))

(declare-fun b!794296 () Bool)

(declare-fun res!538947 () Bool)

(assert (=> b!794296 (=> (not res!538947) (not e!440998))))

(declare-datatypes ((List!14665 0))(
  ( (Nil!14662) (Cons!14661 (h!15790 (_ BitVec 64)) (t!20971 List!14665)) )
))
(declare-fun arrayNoDuplicates!0 (array!43165 (_ BitVec 32) List!14665) Bool)

(assert (=> b!794296 (= res!538947 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14662))))

(declare-fun b!794297 () Bool)

(declare-fun res!538952 () Bool)

(assert (=> b!794297 (=> (not res!538952) (not e!440998))))

(assert (=> b!794297 (= res!538952 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21084 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20663 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21084 a!3170)) (= (select (arr!20663 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68358 res!538956) b!794292))

(assert (= (and b!794292 res!538949) b!794295))

(assert (= (and b!794295 res!538948) b!794289))

(assert (= (and b!794289 res!538950) b!794291))

(assert (= (and b!794291 res!538953) b!794294))

(assert (= (and b!794294 res!538955) b!794293))

(assert (= (and b!794293 res!538951) b!794296))

(assert (= (and b!794296 res!538947) b!794297))

(assert (= (and b!794297 res!538952) b!794288))

(assert (= (and b!794288 res!538954) b!794290))

(declare-fun m!734341 () Bool)

(assert (=> b!794288 m!734341))

(declare-fun m!734343 () Bool)

(assert (=> b!794288 m!734343))

(declare-fun m!734345 () Bool)

(assert (=> b!794288 m!734345))

(declare-fun m!734347 () Bool)

(assert (=> b!794288 m!734347))

(declare-fun m!734349 () Bool)

(assert (=> b!794294 m!734349))

(declare-fun m!734351 () Bool)

(assert (=> b!794289 m!734351))

(declare-fun m!734353 () Bool)

(assert (=> b!794293 m!734353))

(declare-fun m!734355 () Bool)

(assert (=> b!794295 m!734355))

(assert (=> b!794295 m!734355))

(declare-fun m!734357 () Bool)

(assert (=> b!794295 m!734357))

(declare-fun m!734359 () Bool)

(assert (=> b!794296 m!734359))

(declare-fun m!734361 () Bool)

(assert (=> b!794291 m!734361))

(declare-fun m!734363 () Bool)

(assert (=> b!794297 m!734363))

(declare-fun m!734365 () Bool)

(assert (=> b!794297 m!734365))

(declare-fun m!734367 () Bool)

(assert (=> start!68358 m!734367))

(declare-fun m!734369 () Bool)

(assert (=> start!68358 m!734369))

(assert (=> b!794290 m!734355))

(assert (=> b!794290 m!734355))

(declare-fun m!734371 () Bool)

(assert (=> b!794290 m!734371))

(assert (=> b!794290 m!734355))

(declare-fun m!734373 () Bool)

(assert (=> b!794290 m!734373))

(check-sat (not b!794293) (not b!794294) (not b!794296) (not b!794295) (not b!794291) (not start!68358) (not b!794288) (not b!794289) (not b!794290))
(check-sat)
