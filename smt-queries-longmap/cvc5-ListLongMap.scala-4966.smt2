; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68306 () Bool)

(assert start!68306)

(declare-fun b!793528 () Bool)

(declare-fun e!440792 () Bool)

(assert (=> b!793528 (= e!440792 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!353723 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8219 0))(
  ( (MissingZero!8219 (index!35244 (_ BitVec 32))) (Found!8219 (index!35245 (_ BitVec 32))) (Intermediate!8219 (undefined!9031 Bool) (index!35246 (_ BitVec 32)) (x!66185 (_ BitVec 32))) (Undefined!8219) (MissingVacant!8219 (index!35247 (_ BitVec 32))) )
))
(declare-fun lt!353722 () SeekEntryResult!8219)

(declare-datatypes ((array!43096 0))(
  ( (array!43097 (arr!20628 (Array (_ BitVec 32) (_ BitVec 64))) (size!21049 (_ BitVec 32))) )
))
(declare-fun lt!353725 () array!43096)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43096 (_ BitVec 32)) SeekEntryResult!8219)

(assert (=> b!793528 (= lt!353722 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353723 lt!353725 mask!3266))))

(declare-fun lt!353724 () SeekEntryResult!8219)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43096 (_ BitVec 32)) SeekEntryResult!8219)

(assert (=> b!793528 (= lt!353724 (seekEntryOrOpen!0 lt!353723 lt!353725 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43096)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793528 (= lt!353723 (select (store (arr!20628 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793528 (= lt!353725 (array!43097 (store (arr!20628 a!3170) i!1163 k!2044) (size!21049 a!3170)))))

(declare-fun b!793529 () Bool)

(declare-fun res!538054 () Bool)

(declare-fun e!440791 () Bool)

(assert (=> b!793529 (=> (not res!538054) (not e!440791))))

(declare-fun arrayContainsKey!0 (array!43096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793529 (= res!538054 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793530 () Bool)

(declare-fun res!538049 () Bool)

(assert (=> b!793530 (=> (not res!538049) (not e!440791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793530 (= res!538049 (validKeyInArray!0 k!2044))))

(declare-fun b!793531 () Bool)

(declare-fun res!538047 () Bool)

(assert (=> b!793531 (=> (not res!538047) (not e!440791))))

(assert (=> b!793531 (= res!538047 (validKeyInArray!0 (select (arr!20628 a!3170) j!153)))))

(declare-fun b!793532 () Bool)

(assert (=> b!793532 (= e!440791 e!440792)))

(declare-fun res!538053 () Bool)

(assert (=> b!793532 (=> (not res!538053) (not e!440792))))

(declare-fun lt!353726 () SeekEntryResult!8219)

(assert (=> b!793532 (= res!538053 (or (= lt!353726 (MissingZero!8219 i!1163)) (= lt!353726 (MissingVacant!8219 i!1163))))))

(assert (=> b!793532 (= lt!353726 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793533 () Bool)

(declare-fun res!538048 () Bool)

(assert (=> b!793533 (=> (not res!538048) (not e!440792))))

(declare-datatypes ((List!14591 0))(
  ( (Nil!14588) (Cons!14587 (h!15716 (_ BitVec 64)) (t!20906 List!14591)) )
))
(declare-fun arrayNoDuplicates!0 (array!43096 (_ BitVec 32) List!14591) Bool)

(assert (=> b!793533 (= res!538048 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14588))))

(declare-fun b!793535 () Bool)

(declare-fun res!538050 () Bool)

(assert (=> b!793535 (=> (not res!538050) (not e!440792))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!793535 (= res!538050 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21049 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20628 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21049 a!3170)) (= (select (arr!20628 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793536 () Bool)

(declare-fun res!538052 () Bool)

(assert (=> b!793536 (=> (not res!538052) (not e!440791))))

(assert (=> b!793536 (= res!538052 (and (= (size!21049 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21049 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21049 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793534 () Bool)

(declare-fun res!538051 () Bool)

(assert (=> b!793534 (=> (not res!538051) (not e!440792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43096 (_ BitVec 32)) Bool)

(assert (=> b!793534 (= res!538051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!538055 () Bool)

(assert (=> start!68306 (=> (not res!538055) (not e!440791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68306 (= res!538055 (validMask!0 mask!3266))))

(assert (=> start!68306 e!440791))

(assert (=> start!68306 true))

(declare-fun array_inv!16424 (array!43096) Bool)

(assert (=> start!68306 (array_inv!16424 a!3170)))

(assert (= (and start!68306 res!538055) b!793536))

(assert (= (and b!793536 res!538052) b!793531))

(assert (= (and b!793531 res!538047) b!793530))

(assert (= (and b!793530 res!538049) b!793529))

(assert (= (and b!793529 res!538054) b!793532))

(assert (= (and b!793532 res!538053) b!793534))

(assert (= (and b!793534 res!538051) b!793533))

(assert (= (and b!793533 res!538048) b!793535))

(assert (= (and b!793535 res!538050) b!793528))

(declare-fun m!734003 () Bool)

(assert (=> b!793530 m!734003))

(declare-fun m!734005 () Bool)

(assert (=> b!793531 m!734005))

(assert (=> b!793531 m!734005))

(declare-fun m!734007 () Bool)

(assert (=> b!793531 m!734007))

(declare-fun m!734009 () Bool)

(assert (=> b!793529 m!734009))

(declare-fun m!734011 () Bool)

(assert (=> b!793532 m!734011))

(declare-fun m!734013 () Bool)

(assert (=> b!793528 m!734013))

(declare-fun m!734015 () Bool)

(assert (=> b!793528 m!734015))

(declare-fun m!734017 () Bool)

(assert (=> b!793528 m!734017))

(declare-fun m!734019 () Bool)

(assert (=> b!793528 m!734019))

(declare-fun m!734021 () Bool)

(assert (=> b!793535 m!734021))

(declare-fun m!734023 () Bool)

(assert (=> b!793535 m!734023))

(declare-fun m!734025 () Bool)

(assert (=> b!793534 m!734025))

(declare-fun m!734027 () Bool)

(assert (=> b!793533 m!734027))

(declare-fun m!734029 () Bool)

(assert (=> start!68306 m!734029))

(declare-fun m!734031 () Bool)

(assert (=> start!68306 m!734031))

(push 1)

