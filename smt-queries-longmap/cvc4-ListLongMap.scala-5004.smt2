; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68538 () Bool)

(assert start!68538)

(declare-fun b!797090 () Bool)

(declare-fun res!541618 () Bool)

(declare-fun e!442239 () Bool)

(assert (=> b!797090 (=> (not res!541618) (not e!442239))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797090 (= res!541618 (validKeyInArray!0 k!2044))))

(declare-fun b!797091 () Bool)

(declare-fun res!541614 () Bool)

(assert (=> b!797091 (=> (not res!541614) (not e!442239))))

(declare-datatypes ((array!43328 0))(
  ( (array!43329 (arr!20744 (Array (_ BitVec 32) (_ BitVec 64))) (size!21165 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43328)

(declare-fun arrayContainsKey!0 (array!43328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797091 (= res!541614 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!541611 () Bool)

(assert (=> start!68538 (=> (not res!541611) (not e!442239))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68538 (= res!541611 (validMask!0 mask!3266))))

(assert (=> start!68538 e!442239))

(assert (=> start!68538 true))

(declare-fun array_inv!16540 (array!43328) Bool)

(assert (=> start!68538 (array_inv!16540 a!3170)))

(declare-fun b!797092 () Bool)

(declare-fun e!442240 () Bool)

(assert (=> b!797092 (= e!442240 (not true))))

(declare-datatypes ((SeekEntryResult!8335 0))(
  ( (MissingZero!8335 (index!35708 (_ BitVec 32))) (Found!8335 (index!35709 (_ BitVec 32))) (Intermediate!8335 (undefined!9147 Bool) (index!35710 (_ BitVec 32)) (x!66605 (_ BitVec 32))) (Undefined!8335) (MissingVacant!8335 (index!35711 (_ BitVec 32))) )
))
(declare-fun lt!355547 () SeekEntryResult!8335)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797092 (= lt!355547 (Found!8335 index!1236))))

(declare-fun b!797093 () Bool)

(declare-fun e!442237 () Bool)

(assert (=> b!797093 (= e!442239 e!442237)))

(declare-fun res!541617 () Bool)

(assert (=> b!797093 (=> (not res!541617) (not e!442237))))

(declare-fun lt!355544 () SeekEntryResult!8335)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797093 (= res!541617 (or (= lt!355544 (MissingZero!8335 i!1163)) (= lt!355544 (MissingVacant!8335 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43328 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!797093 (= lt!355544 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797094 () Bool)

(declare-fun e!442241 () Bool)

(assert (=> b!797094 (= e!442241 e!442240)))

(declare-fun res!541613 () Bool)

(assert (=> b!797094 (=> (not res!541613) (not e!442240))))

(declare-fun lt!355546 () SeekEntryResult!8335)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!355545 () SeekEntryResult!8335)

(assert (=> b!797094 (= res!541613 (and (= lt!355545 lt!355546) (= lt!355546 (Found!8335 j!153)) (= (select (arr!20744 a!3170) index!1236) (select (arr!20744 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43328 (_ BitVec 32)) SeekEntryResult!8335)

(assert (=> b!797094 (= lt!355546 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20744 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797094 (= lt!355545 (seekEntryOrOpen!0 (select (arr!20744 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797095 () Bool)

(declare-fun res!541609 () Bool)

(assert (=> b!797095 (=> (not res!541609) (not e!442239))))

(assert (=> b!797095 (= res!541609 (and (= (size!21165 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21165 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21165 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797096 () Bool)

(declare-fun res!541616 () Bool)

(assert (=> b!797096 (=> (not res!541616) (not e!442237))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!797096 (= res!541616 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21165 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20744 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21165 a!3170)) (= (select (arr!20744 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797097 () Bool)

(declare-fun res!541615 () Bool)

(assert (=> b!797097 (=> (not res!541615) (not e!442239))))

(assert (=> b!797097 (= res!541615 (validKeyInArray!0 (select (arr!20744 a!3170) j!153)))))

(declare-fun b!797098 () Bool)

(declare-fun res!541619 () Bool)

(assert (=> b!797098 (=> (not res!541619) (not e!442237))))

(declare-datatypes ((List!14707 0))(
  ( (Nil!14704) (Cons!14703 (h!15832 (_ BitVec 64)) (t!21022 List!14707)) )
))
(declare-fun arrayNoDuplicates!0 (array!43328 (_ BitVec 32) List!14707) Bool)

(assert (=> b!797098 (= res!541619 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14704))))

(declare-fun b!797099 () Bool)

(declare-fun res!541612 () Bool)

(assert (=> b!797099 (=> (not res!541612) (not e!442237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43328 (_ BitVec 32)) Bool)

(assert (=> b!797099 (= res!541612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797100 () Bool)

(assert (=> b!797100 (= e!442237 e!442241)))

(declare-fun res!541610 () Bool)

(assert (=> b!797100 (=> (not res!541610) (not e!442241))))

(declare-fun lt!355542 () SeekEntryResult!8335)

(assert (=> b!797100 (= res!541610 (= lt!355542 lt!355547))))

(declare-fun lt!355541 () (_ BitVec 64))

(declare-fun lt!355543 () array!43328)

(assert (=> b!797100 (= lt!355547 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355541 lt!355543 mask!3266))))

(assert (=> b!797100 (= lt!355542 (seekEntryOrOpen!0 lt!355541 lt!355543 mask!3266))))

(assert (=> b!797100 (= lt!355541 (select (store (arr!20744 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797100 (= lt!355543 (array!43329 (store (arr!20744 a!3170) i!1163 k!2044) (size!21165 a!3170)))))

(assert (= (and start!68538 res!541611) b!797095))

(assert (= (and b!797095 res!541609) b!797097))

(assert (= (and b!797097 res!541615) b!797090))

(assert (= (and b!797090 res!541618) b!797091))

(assert (= (and b!797091 res!541614) b!797093))

(assert (= (and b!797093 res!541617) b!797099))

(assert (= (and b!797099 res!541612) b!797098))

(assert (= (and b!797098 res!541619) b!797096))

(assert (= (and b!797096 res!541616) b!797100))

(assert (= (and b!797100 res!541610) b!797094))

(assert (= (and b!797094 res!541613) b!797092))

(declare-fun m!737933 () Bool)

(assert (=> b!797090 m!737933))

(declare-fun m!737935 () Bool)

(assert (=> b!797098 m!737935))

(declare-fun m!737937 () Bool)

(assert (=> b!797096 m!737937))

(declare-fun m!737939 () Bool)

(assert (=> b!797096 m!737939))

(declare-fun m!737941 () Bool)

(assert (=> b!797091 m!737941))

(declare-fun m!737943 () Bool)

(assert (=> b!797094 m!737943))

(declare-fun m!737945 () Bool)

(assert (=> b!797094 m!737945))

(assert (=> b!797094 m!737945))

(declare-fun m!737947 () Bool)

(assert (=> b!797094 m!737947))

(assert (=> b!797094 m!737945))

(declare-fun m!737949 () Bool)

(assert (=> b!797094 m!737949))

(assert (=> b!797097 m!737945))

(assert (=> b!797097 m!737945))

(declare-fun m!737951 () Bool)

(assert (=> b!797097 m!737951))

(declare-fun m!737953 () Bool)

(assert (=> start!68538 m!737953))

(declare-fun m!737955 () Bool)

(assert (=> start!68538 m!737955))

(declare-fun m!737957 () Bool)

(assert (=> b!797099 m!737957))

(declare-fun m!737959 () Bool)

(assert (=> b!797100 m!737959))

(declare-fun m!737961 () Bool)

(assert (=> b!797100 m!737961))

(declare-fun m!737963 () Bool)

(assert (=> b!797100 m!737963))

(declare-fun m!737965 () Bool)

(assert (=> b!797100 m!737965))

(declare-fun m!737967 () Bool)

(assert (=> b!797093 m!737967))

(push 1)

