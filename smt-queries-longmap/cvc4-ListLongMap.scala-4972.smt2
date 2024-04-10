; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68346 () Bool)

(assert start!68346)

(declare-fun b!794086 () Bool)

(declare-fun res!538608 () Bool)

(declare-fun e!440990 () Bool)

(assert (=> b!794086 (=> (not res!538608) (not e!440990))))

(declare-datatypes ((array!43136 0))(
  ( (array!43137 (arr!20648 (Array (_ BitVec 32) (_ BitVec 64))) (size!21069 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43136)

(declare-datatypes ((List!14611 0))(
  ( (Nil!14608) (Cons!14607 (h!15736 (_ BitVec 64)) (t!20926 List!14611)) )
))
(declare-fun arrayNoDuplicates!0 (array!43136 (_ BitVec 32) List!14611) Bool)

(assert (=> b!794086 (= res!538608 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14608))))

(declare-fun b!794087 () Bool)

(assert (=> b!794087 (= e!440990 false)))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!353990 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8239 0))(
  ( (MissingZero!8239 (index!35324 (_ BitVec 32))) (Found!8239 (index!35325 (_ BitVec 32))) (Intermediate!8239 (undefined!9051 Bool) (index!35326 (_ BitVec 32)) (x!66253 (_ BitVec 32))) (Undefined!8239) (MissingVacant!8239 (index!35327 (_ BitVec 32))) )
))
(declare-fun lt!353987 () SeekEntryResult!8239)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!353986 () array!43136)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43136 (_ BitVec 32)) SeekEntryResult!8239)

(assert (=> b!794087 (= lt!353987 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353990 lt!353986 mask!3266))))

(declare-fun lt!353989 () SeekEntryResult!8239)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43136 (_ BitVec 32)) SeekEntryResult!8239)

(assert (=> b!794087 (= lt!353989 (seekEntryOrOpen!0 lt!353990 lt!353986 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794087 (= lt!353990 (select (store (arr!20648 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794087 (= lt!353986 (array!43137 (store (arr!20648 a!3170) i!1163 k!2044) (size!21069 a!3170)))))

(declare-fun b!794088 () Bool)

(declare-fun res!538612 () Bool)

(assert (=> b!794088 (=> (not res!538612) (not e!440990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43136 (_ BitVec 32)) Bool)

(assert (=> b!794088 (= res!538612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794089 () Bool)

(declare-fun res!538613 () Bool)

(declare-fun e!440989 () Bool)

(assert (=> b!794089 (=> (not res!538613) (not e!440989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794089 (= res!538613 (validKeyInArray!0 (select (arr!20648 a!3170) j!153)))))

(declare-fun b!794090 () Bool)

(assert (=> b!794090 (= e!440989 e!440990)))

(declare-fun res!538605 () Bool)

(assert (=> b!794090 (=> (not res!538605) (not e!440990))))

(declare-fun lt!353988 () SeekEntryResult!8239)

(assert (=> b!794090 (= res!538605 (or (= lt!353988 (MissingZero!8239 i!1163)) (= lt!353988 (MissingVacant!8239 i!1163))))))

(assert (=> b!794090 (= lt!353988 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794092 () Bool)

(declare-fun res!538607 () Bool)

(assert (=> b!794092 (=> (not res!538607) (not e!440990))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794092 (= res!538607 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21069 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20648 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21069 a!3170)) (= (select (arr!20648 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794093 () Bool)

(declare-fun res!538609 () Bool)

(assert (=> b!794093 (=> (not res!538609) (not e!440989))))

(assert (=> b!794093 (= res!538609 (and (= (size!21069 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21069 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21069 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794094 () Bool)

(declare-fun res!538611 () Bool)

(assert (=> b!794094 (=> (not res!538611) (not e!440989))))

(declare-fun arrayContainsKey!0 (array!43136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794094 (= res!538611 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!538606 () Bool)

(assert (=> start!68346 (=> (not res!538606) (not e!440989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68346 (= res!538606 (validMask!0 mask!3266))))

(assert (=> start!68346 e!440989))

(assert (=> start!68346 true))

(declare-fun array_inv!16444 (array!43136) Bool)

(assert (=> start!68346 (array_inv!16444 a!3170)))

(declare-fun b!794091 () Bool)

(declare-fun res!538610 () Bool)

(assert (=> b!794091 (=> (not res!538610) (not e!440989))))

(assert (=> b!794091 (= res!538610 (validKeyInArray!0 k!2044))))

(assert (= (and start!68346 res!538606) b!794093))

(assert (= (and b!794093 res!538609) b!794089))

(assert (= (and b!794089 res!538613) b!794091))

(assert (= (and b!794091 res!538610) b!794094))

(assert (= (and b!794094 res!538611) b!794090))

(assert (= (and b!794090 res!538605) b!794088))

(assert (= (and b!794088 res!538612) b!794086))

(assert (= (and b!794086 res!538608) b!794092))

(assert (= (and b!794092 res!538607) b!794087))

(declare-fun m!734603 () Bool)

(assert (=> b!794086 m!734603))

(declare-fun m!734605 () Bool)

(assert (=> b!794088 m!734605))

(declare-fun m!734607 () Bool)

(assert (=> start!68346 m!734607))

(declare-fun m!734609 () Bool)

(assert (=> start!68346 m!734609))

(declare-fun m!734611 () Bool)

(assert (=> b!794094 m!734611))

(declare-fun m!734613 () Bool)

(assert (=> b!794091 m!734613))

(declare-fun m!734615 () Bool)

(assert (=> b!794092 m!734615))

(declare-fun m!734617 () Bool)

(assert (=> b!794092 m!734617))

(declare-fun m!734619 () Bool)

(assert (=> b!794087 m!734619))

(declare-fun m!734621 () Bool)

(assert (=> b!794087 m!734621))

(declare-fun m!734623 () Bool)

(assert (=> b!794087 m!734623))

(declare-fun m!734625 () Bool)

(assert (=> b!794087 m!734625))

(declare-fun m!734627 () Bool)

(assert (=> b!794090 m!734627))

(declare-fun m!734629 () Bool)

(assert (=> b!794089 m!734629))

(assert (=> b!794089 m!734629))

(declare-fun m!734631 () Bool)

(assert (=> b!794089 m!734631))

(push 1)

