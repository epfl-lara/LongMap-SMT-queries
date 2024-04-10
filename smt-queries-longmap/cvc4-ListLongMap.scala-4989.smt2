; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68448 () Bool)

(assert start!68448)

(declare-fun b!795615 () Bool)

(declare-fun res!540142 () Bool)

(declare-fun e!441574 () Bool)

(assert (=> b!795615 (=> (not res!540142) (not e!441574))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795615 (= res!540142 (validKeyInArray!0 k!2044))))

(declare-fun b!795616 () Bool)

(declare-fun res!540140 () Bool)

(assert (=> b!795616 (=> (not res!540140) (not e!441574))))

(declare-datatypes ((array!43238 0))(
  ( (array!43239 (arr!20699 (Array (_ BitVec 32) (_ BitVec 64))) (size!21120 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43238)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795616 (= res!540140 (validKeyInArray!0 (select (arr!20699 a!3170) j!153)))))

(declare-fun b!795617 () Bool)

(declare-datatypes ((SeekEntryResult!8290 0))(
  ( (MissingZero!8290 (index!35528 (_ BitVec 32))) (Found!8290 (index!35529 (_ BitVec 32))) (Intermediate!8290 (undefined!9102 Bool) (index!35530 (_ BitVec 32)) (x!66440 (_ BitVec 32))) (Undefined!8290) (MissingVacant!8290 (index!35531 (_ BitVec 32))) )
))
(declare-fun lt!354665 () SeekEntryResult!8290)

(declare-fun lt!354661 () SeekEntryResult!8290)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun e!441572 () Bool)

(assert (=> b!795617 (= e!441572 (and (= lt!354661 lt!354665) (= lt!354665 (Found!8290 j!153)) (= (select (arr!20699 a!3170) index!1236) (select (arr!20699 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43238 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!795617 (= lt!354665 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20699 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43238 (_ BitVec 32)) SeekEntryResult!8290)

(assert (=> b!795617 (= lt!354661 (seekEntryOrOpen!0 (select (arr!20699 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795619 () Bool)

(declare-fun res!540135 () Bool)

(assert (=> b!795619 (=> (not res!540135) (not e!441574))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795619 (= res!540135 (and (= (size!21120 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21120 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21120 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795620 () Bool)

(declare-fun e!441575 () Bool)

(assert (=> b!795620 (= e!441575 e!441572)))

(declare-fun res!540143 () Bool)

(assert (=> b!795620 (=> (not res!540143) (not e!441572))))

(declare-fun lt!354662 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354663 () array!43238)

(assert (=> b!795620 (= res!540143 (= (seekEntryOrOpen!0 lt!354662 lt!354663 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354662 lt!354663 mask!3266)))))

(assert (=> b!795620 (= lt!354662 (select (store (arr!20699 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795620 (= lt!354663 (array!43239 (store (arr!20699 a!3170) i!1163 k!2044) (size!21120 a!3170)))))

(declare-fun b!795621 () Bool)

(declare-fun res!540138 () Bool)

(assert (=> b!795621 (=> (not res!540138) (not e!441574))))

(declare-fun arrayContainsKey!0 (array!43238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795621 (= res!540138 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795622 () Bool)

(declare-fun res!540134 () Bool)

(assert (=> b!795622 (=> (not res!540134) (not e!441575))))

(declare-datatypes ((List!14662 0))(
  ( (Nil!14659) (Cons!14658 (h!15787 (_ BitVec 64)) (t!20977 List!14662)) )
))
(declare-fun arrayNoDuplicates!0 (array!43238 (_ BitVec 32) List!14662) Bool)

(assert (=> b!795622 (= res!540134 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14659))))

(declare-fun b!795623 () Bool)

(declare-fun res!540137 () Bool)

(assert (=> b!795623 (=> (not res!540137) (not e!441575))))

(assert (=> b!795623 (= res!540137 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21120 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20699 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21120 a!3170)) (= (select (arr!20699 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795624 () Bool)

(declare-fun res!540141 () Bool)

(assert (=> b!795624 (=> (not res!540141) (not e!441575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43238 (_ BitVec 32)) Bool)

(assert (=> b!795624 (= res!540141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!540136 () Bool)

(assert (=> start!68448 (=> (not res!540136) (not e!441574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68448 (= res!540136 (validMask!0 mask!3266))))

(assert (=> start!68448 e!441574))

(assert (=> start!68448 true))

(declare-fun array_inv!16495 (array!43238) Bool)

(assert (=> start!68448 (array_inv!16495 a!3170)))

(declare-fun b!795618 () Bool)

(assert (=> b!795618 (= e!441574 e!441575)))

(declare-fun res!540139 () Bool)

(assert (=> b!795618 (=> (not res!540139) (not e!441575))))

(declare-fun lt!354664 () SeekEntryResult!8290)

(assert (=> b!795618 (= res!540139 (or (= lt!354664 (MissingZero!8290 i!1163)) (= lt!354664 (MissingVacant!8290 i!1163))))))

(assert (=> b!795618 (= lt!354664 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68448 res!540136) b!795619))

(assert (= (and b!795619 res!540135) b!795616))

(assert (= (and b!795616 res!540140) b!795615))

(assert (= (and b!795615 res!540142) b!795621))

(assert (= (and b!795621 res!540138) b!795618))

(assert (= (and b!795618 res!540139) b!795624))

(assert (= (and b!795624 res!540141) b!795622))

(assert (= (and b!795622 res!540134) b!795623))

(assert (= (and b!795623 res!540137) b!795620))

(assert (= (and b!795620 res!540143) b!795617))

(declare-fun m!736283 () Bool)

(assert (=> b!795622 m!736283))

(declare-fun m!736285 () Bool)

(assert (=> b!795618 m!736285))

(declare-fun m!736287 () Bool)

(assert (=> b!795621 m!736287))

(declare-fun m!736289 () Bool)

(assert (=> b!795624 m!736289))

(declare-fun m!736291 () Bool)

(assert (=> start!68448 m!736291))

(declare-fun m!736293 () Bool)

(assert (=> start!68448 m!736293))

(declare-fun m!736295 () Bool)

(assert (=> b!795615 m!736295))

(declare-fun m!736297 () Bool)

(assert (=> b!795616 m!736297))

(assert (=> b!795616 m!736297))

(declare-fun m!736299 () Bool)

(assert (=> b!795616 m!736299))

(declare-fun m!736301 () Bool)

(assert (=> b!795617 m!736301))

(assert (=> b!795617 m!736297))

(assert (=> b!795617 m!736297))

(declare-fun m!736303 () Bool)

(assert (=> b!795617 m!736303))

(assert (=> b!795617 m!736297))

(declare-fun m!736305 () Bool)

(assert (=> b!795617 m!736305))

(declare-fun m!736307 () Bool)

(assert (=> b!795620 m!736307))

(declare-fun m!736309 () Bool)

(assert (=> b!795620 m!736309))

(declare-fun m!736311 () Bool)

(assert (=> b!795620 m!736311))

(declare-fun m!736313 () Bool)

(assert (=> b!795620 m!736313))

(declare-fun m!736315 () Bool)

(assert (=> b!795623 m!736315))

(declare-fun m!736317 () Bool)

(assert (=> b!795623 m!736317))

(push 1)

(assert (not b!795620))

(assert (not b!795617))

(assert (not b!795624))

(assert (not start!68448))

(assert (not b!795616))

(assert (not b!795622))

(assert (not b!795615))

(assert (not b!795618))

(assert (not b!795621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

