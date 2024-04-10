; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68510 () Bool)

(assert start!68510)

(declare-fun b!796610 () Bool)

(declare-fun res!541129 () Bool)

(declare-fun e!442010 () Bool)

(assert (=> b!796610 (=> (not res!541129) (not e!442010))))

(declare-datatypes ((array!43300 0))(
  ( (array!43301 (arr!20730 (Array (_ BitVec 32) (_ BitVec 64))) (size!21151 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43300)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796610 (= res!541129 (validKeyInArray!0 (select (arr!20730 a!3170) j!153)))))

(declare-fun b!796611 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun e!442012 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796611 (= e!442012 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20730 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((SeekEntryResult!8321 0))(
  ( (MissingZero!8321 (index!35652 (_ BitVec 32))) (Found!8321 (index!35653 (_ BitVec 32))) (Intermediate!8321 (undefined!9133 Bool) (index!35654 (_ BitVec 32)) (x!66559 (_ BitVec 32))) (Undefined!8321) (MissingVacant!8321 (index!35655 (_ BitVec 32))) )
))
(declare-fun lt!355240 () SeekEntryResult!8321)

(assert (=> b!796611 (= lt!355240 (Found!8321 index!1236))))

(declare-fun b!796612 () Bool)

(declare-fun res!541136 () Bool)

(declare-fun e!442009 () Bool)

(assert (=> b!796612 (=> (not res!541136) (not e!442009))))

(declare-datatypes ((List!14693 0))(
  ( (Nil!14690) (Cons!14689 (h!15818 (_ BitVec 64)) (t!21008 List!14693)) )
))
(declare-fun arrayNoDuplicates!0 (array!43300 (_ BitVec 32) List!14693) Bool)

(assert (=> b!796612 (= res!541136 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14690))))

(declare-fun b!796613 () Bool)

(assert (=> b!796613 (= e!442010 e!442009)))

(declare-fun res!541130 () Bool)

(assert (=> b!796613 (=> (not res!541130) (not e!442009))))

(declare-fun lt!355238 () SeekEntryResult!8321)

(assert (=> b!796613 (= res!541130 (or (= lt!355238 (MissingZero!8321 i!1163)) (= lt!355238 (MissingVacant!8321 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43300 (_ BitVec 32)) SeekEntryResult!8321)

(assert (=> b!796613 (= lt!355238 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796614 () Bool)

(declare-fun e!442013 () Bool)

(assert (=> b!796614 (= e!442009 e!442013)))

(declare-fun res!541139 () Bool)

(assert (=> b!796614 (=> (not res!541139) (not e!442013))))

(declare-fun lt!355241 () SeekEntryResult!8321)

(assert (=> b!796614 (= res!541139 (= lt!355241 lt!355240))))

(declare-fun lt!355239 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355244 () array!43300)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43300 (_ BitVec 32)) SeekEntryResult!8321)

(assert (=> b!796614 (= lt!355240 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355239 lt!355244 mask!3266))))

(assert (=> b!796614 (= lt!355241 (seekEntryOrOpen!0 lt!355239 lt!355244 mask!3266))))

(assert (=> b!796614 (= lt!355239 (select (store (arr!20730 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796614 (= lt!355244 (array!43301 (store (arr!20730 a!3170) i!1163 k!2044) (size!21151 a!3170)))))

(declare-fun b!796615 () Bool)

(declare-fun res!541138 () Bool)

(assert (=> b!796615 (=> (not res!541138) (not e!442010))))

(assert (=> b!796615 (= res!541138 (validKeyInArray!0 k!2044))))

(declare-fun b!796616 () Bool)

(declare-fun res!541131 () Bool)

(assert (=> b!796616 (=> (not res!541131) (not e!442010))))

(assert (=> b!796616 (= res!541131 (and (= (size!21151 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21151 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21151 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!541137 () Bool)

(assert (=> start!68510 (=> (not res!541137) (not e!442010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68510 (= res!541137 (validMask!0 mask!3266))))

(assert (=> start!68510 e!442010))

(assert (=> start!68510 true))

(declare-fun array_inv!16526 (array!43300) Bool)

(assert (=> start!68510 (array_inv!16526 a!3170)))

(declare-fun b!796617 () Bool)

(declare-fun res!541133 () Bool)

(assert (=> b!796617 (=> (not res!541133) (not e!442009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43300 (_ BitVec 32)) Bool)

(assert (=> b!796617 (= res!541133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796618 () Bool)

(declare-fun res!541132 () Bool)

(assert (=> b!796618 (=> (not res!541132) (not e!442009))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796618 (= res!541132 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21151 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20730 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21151 a!3170)) (= (select (arr!20730 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796619 () Bool)

(assert (=> b!796619 (= e!442013 e!442012)))

(declare-fun res!541135 () Bool)

(assert (=> b!796619 (=> (not res!541135) (not e!442012))))

(declare-fun lt!355242 () SeekEntryResult!8321)

(declare-fun lt!355243 () SeekEntryResult!8321)

(assert (=> b!796619 (= res!541135 (and (= lt!355242 lt!355243) (= lt!355243 (Found!8321 j!153)) (= (select (arr!20730 a!3170) index!1236) (select (arr!20730 a!3170) j!153))))))

(assert (=> b!796619 (= lt!355243 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20730 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796619 (= lt!355242 (seekEntryOrOpen!0 (select (arr!20730 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796620 () Bool)

(declare-fun res!541134 () Bool)

(assert (=> b!796620 (=> (not res!541134) (not e!442010))))

(declare-fun arrayContainsKey!0 (array!43300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796620 (= res!541134 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68510 res!541137) b!796616))

(assert (= (and b!796616 res!541131) b!796610))

(assert (= (and b!796610 res!541129) b!796615))

(assert (= (and b!796615 res!541138) b!796620))

(assert (= (and b!796620 res!541134) b!796613))

(assert (= (and b!796613 res!541130) b!796617))

(assert (= (and b!796617 res!541133) b!796612))

(assert (= (and b!796612 res!541136) b!796618))

(assert (= (and b!796618 res!541132) b!796614))

(assert (= (and b!796614 res!541139) b!796619))

(assert (= (and b!796619 res!541135) b!796611))

(declare-fun m!737411 () Bool)

(assert (=> b!796613 m!737411))

(declare-fun m!737413 () Bool)

(assert (=> b!796612 m!737413))

(declare-fun m!737415 () Bool)

(assert (=> b!796617 m!737415))

(declare-fun m!737417 () Bool)

(assert (=> b!796611 m!737417))

(declare-fun m!737419 () Bool)

(assert (=> b!796611 m!737419))

(declare-fun m!737421 () Bool)

(assert (=> b!796618 m!737421))

(declare-fun m!737423 () Bool)

(assert (=> b!796618 m!737423))

(declare-fun m!737425 () Bool)

(assert (=> b!796619 m!737425))

(declare-fun m!737427 () Bool)

(assert (=> b!796619 m!737427))

(assert (=> b!796619 m!737427))

(declare-fun m!737429 () Bool)

(assert (=> b!796619 m!737429))

(assert (=> b!796619 m!737427))

(declare-fun m!737431 () Bool)

(assert (=> b!796619 m!737431))

(declare-fun m!737433 () Bool)

(assert (=> b!796620 m!737433))

(declare-fun m!737435 () Bool)

(assert (=> b!796615 m!737435))

(assert (=> b!796610 m!737427))

(assert (=> b!796610 m!737427))

(declare-fun m!737437 () Bool)

(assert (=> b!796610 m!737437))

(declare-fun m!737439 () Bool)

(assert (=> b!796614 m!737439))

(declare-fun m!737441 () Bool)

(assert (=> b!796614 m!737441))

(assert (=> b!796614 m!737417))

(declare-fun m!737443 () Bool)

(assert (=> b!796614 m!737443))

(declare-fun m!737445 () Bool)

(assert (=> start!68510 m!737445))

(declare-fun m!737447 () Bool)

(assert (=> start!68510 m!737447))

(push 1)

