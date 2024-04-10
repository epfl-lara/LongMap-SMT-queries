; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68708 () Bool)

(assert start!68708)

(declare-fun b!800133 () Bool)

(declare-fun e!443651 () Bool)

(declare-fun e!443653 () Bool)

(assert (=> b!800133 (= e!443651 e!443653)))

(declare-fun res!544652 () Bool)

(assert (=> b!800133 (=> (not res!544652) (not e!443653))))

(declare-datatypes ((SeekEntryResult!8420 0))(
  ( (MissingZero!8420 (index!36048 (_ BitVec 32))) (Found!8420 (index!36049 (_ BitVec 32))) (Intermediate!8420 (undefined!9232 Bool) (index!36050 (_ BitVec 32)) (x!66922 (_ BitVec 32))) (Undefined!8420) (MissingVacant!8420 (index!36051 (_ BitVec 32))) )
))
(declare-fun lt!357424 () SeekEntryResult!8420)

(declare-datatypes ((array!43498 0))(
  ( (array!43499 (arr!20829 (Array (_ BitVec 32) (_ BitVec 64))) (size!21250 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43498)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357421 () SeekEntryResult!8420)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800133 (= res!544652 (and (= lt!357421 lt!357424) (= lt!357424 (Found!8420 j!153)) (not (= (select (arr!20829 a!3170) index!1236) (select (arr!20829 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43498 (_ BitVec 32)) SeekEntryResult!8420)

(assert (=> b!800133 (= lt!357424 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20829 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43498 (_ BitVec 32)) SeekEntryResult!8420)

(assert (=> b!800133 (= lt!357421 (seekEntryOrOpen!0 (select (arr!20829 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800134 () Bool)

(declare-fun res!544661 () Bool)

(declare-fun e!443652 () Bool)

(assert (=> b!800134 (=> (not res!544661) (not e!443652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800134 (= res!544661 (validKeyInArray!0 (select (arr!20829 a!3170) j!153)))))

(declare-fun b!800135 () Bool)

(declare-fun res!544655 () Bool)

(assert (=> b!800135 (=> (not res!544655) (not e!443652))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800135 (= res!544655 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800136 () Bool)

(declare-fun e!443650 () Bool)

(assert (=> b!800136 (= e!443652 e!443650)))

(declare-fun res!544664 () Bool)

(assert (=> b!800136 (=> (not res!544664) (not e!443650))))

(declare-fun lt!357418 () SeekEntryResult!8420)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800136 (= res!544664 (or (= lt!357418 (MissingZero!8420 i!1163)) (= lt!357418 (MissingVacant!8420 i!1163))))))

(assert (=> b!800136 (= lt!357418 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800137 () Bool)

(declare-fun res!544657 () Bool)

(assert (=> b!800137 (=> (not res!544657) (not e!443650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43498 (_ BitVec 32)) Bool)

(assert (=> b!800137 (= res!544657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800138 () Bool)

(declare-fun e!443649 () Bool)

(assert (=> b!800138 (= e!443653 e!443649)))

(declare-fun res!544658 () Bool)

(assert (=> b!800138 (=> (not res!544658) (not e!443649))))

(declare-fun lt!357422 () (_ BitVec 32))

(assert (=> b!800138 (= res!544658 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357422 #b00000000000000000000000000000000) (bvslt lt!357422 (size!21250 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800138 (= lt!357422 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800139 () Bool)

(declare-fun res!544660 () Bool)

(assert (=> b!800139 (=> (not res!544660) (not e!443650))))

(declare-datatypes ((List!14792 0))(
  ( (Nil!14789) (Cons!14788 (h!15917 (_ BitVec 64)) (t!21107 List!14792)) )
))
(declare-fun arrayNoDuplicates!0 (array!43498 (_ BitVec 32) List!14792) Bool)

(assert (=> b!800139 (= res!544660 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14789))))

(declare-fun b!800141 () Bool)

(declare-fun res!544659 () Bool)

(assert (=> b!800141 (=> (not res!544659) (not e!443649))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357423 () SeekEntryResult!8420)

(declare-fun lt!357419 () array!43498)

(declare-fun lt!357420 () (_ BitVec 64))

(assert (=> b!800141 (= res!544659 (= lt!357423 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357422 vacantAfter!23 lt!357420 lt!357419 mask!3266)))))

(declare-fun b!800142 () Bool)

(declare-fun res!544663 () Bool)

(assert (=> b!800142 (=> (not res!544663) (not e!443652))))

(assert (=> b!800142 (= res!544663 (validKeyInArray!0 k!2044))))

(declare-fun b!800143 () Bool)

(assert (=> b!800143 (= e!443650 e!443651)))

(declare-fun res!544662 () Bool)

(assert (=> b!800143 (=> (not res!544662) (not e!443651))))

(assert (=> b!800143 (= res!544662 (= lt!357423 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357420 lt!357419 mask!3266)))))

(assert (=> b!800143 (= lt!357423 (seekEntryOrOpen!0 lt!357420 lt!357419 mask!3266))))

(assert (=> b!800143 (= lt!357420 (select (store (arr!20829 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800143 (= lt!357419 (array!43499 (store (arr!20829 a!3170) i!1163 k!2044) (size!21250 a!3170)))))

(declare-fun b!800144 () Bool)

(assert (=> b!800144 (= e!443649 false)))

(declare-fun lt!357425 () SeekEntryResult!8420)

(assert (=> b!800144 (= lt!357425 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357422 vacantBefore!23 (select (arr!20829 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800145 () Bool)

(declare-fun res!544654 () Bool)

(assert (=> b!800145 (=> (not res!544654) (not e!443652))))

(assert (=> b!800145 (= res!544654 (and (= (size!21250 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21250 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21250 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!544653 () Bool)

(assert (=> start!68708 (=> (not res!544653) (not e!443652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68708 (= res!544653 (validMask!0 mask!3266))))

(assert (=> start!68708 e!443652))

(assert (=> start!68708 true))

(declare-fun array_inv!16625 (array!43498) Bool)

(assert (=> start!68708 (array_inv!16625 a!3170)))

(declare-fun b!800140 () Bool)

(declare-fun res!544656 () Bool)

(assert (=> b!800140 (=> (not res!544656) (not e!443650))))

(assert (=> b!800140 (= res!544656 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21250 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20829 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21250 a!3170)) (= (select (arr!20829 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68708 res!544653) b!800145))

(assert (= (and b!800145 res!544654) b!800134))

(assert (= (and b!800134 res!544661) b!800142))

(assert (= (and b!800142 res!544663) b!800135))

(assert (= (and b!800135 res!544655) b!800136))

(assert (= (and b!800136 res!544664) b!800137))

(assert (= (and b!800137 res!544657) b!800139))

(assert (= (and b!800139 res!544660) b!800140))

(assert (= (and b!800140 res!544656) b!800143))

(assert (= (and b!800143 res!544662) b!800133))

(assert (= (and b!800133 res!544652) b!800138))

(assert (= (and b!800138 res!544658) b!800141))

(assert (= (and b!800141 res!544659) b!800144))

(declare-fun m!741197 () Bool)

(assert (=> b!800142 m!741197))

(declare-fun m!741199 () Bool)

(assert (=> b!800135 m!741199))

(declare-fun m!741201 () Bool)

(assert (=> b!800140 m!741201))

(declare-fun m!741203 () Bool)

(assert (=> b!800140 m!741203))

(declare-fun m!741205 () Bool)

(assert (=> b!800141 m!741205))

(declare-fun m!741207 () Bool)

(assert (=> b!800133 m!741207))

(declare-fun m!741209 () Bool)

(assert (=> b!800133 m!741209))

(assert (=> b!800133 m!741209))

(declare-fun m!741211 () Bool)

(assert (=> b!800133 m!741211))

(assert (=> b!800133 m!741209))

(declare-fun m!741213 () Bool)

(assert (=> b!800133 m!741213))

(declare-fun m!741215 () Bool)

(assert (=> b!800138 m!741215))

(assert (=> b!800134 m!741209))

(assert (=> b!800134 m!741209))

(declare-fun m!741217 () Bool)

(assert (=> b!800134 m!741217))

(declare-fun m!741219 () Bool)

(assert (=> b!800143 m!741219))

(declare-fun m!741221 () Bool)

(assert (=> b!800143 m!741221))

(declare-fun m!741223 () Bool)

(assert (=> b!800143 m!741223))

(declare-fun m!741225 () Bool)

(assert (=> b!800143 m!741225))

(declare-fun m!741227 () Bool)

(assert (=> b!800139 m!741227))

(declare-fun m!741229 () Bool)

(assert (=> b!800137 m!741229))

(declare-fun m!741231 () Bool)

(assert (=> start!68708 m!741231))

(declare-fun m!741233 () Bool)

(assert (=> start!68708 m!741233))

(assert (=> b!800144 m!741209))

(assert (=> b!800144 m!741209))

(declare-fun m!741235 () Bool)

(assert (=> b!800144 m!741235))

(declare-fun m!741237 () Bool)

(assert (=> b!800136 m!741237))

(push 1)

