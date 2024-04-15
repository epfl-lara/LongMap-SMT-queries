; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68696 () Bool)

(assert start!68696)

(declare-fun b!800039 () Bool)

(declare-fun res!544703 () Bool)

(declare-fun e!443567 () Bool)

(assert (=> b!800039 (=> (not res!544703) (not e!443567))))

(declare-datatypes ((array!43503 0))(
  ( (array!43504 (arr!20832 (Array (_ BitVec 32) (_ BitVec 64))) (size!21253 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43503)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800039 (= res!544703 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800040 () Bool)

(declare-fun res!544705 () Bool)

(declare-fun e!443569 () Bool)

(assert (=> b!800040 (=> (not res!544705) (not e!443569))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800040 (= res!544705 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21253 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20832 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21253 a!3170)) (= (select (arr!20832 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800041 () Bool)

(declare-fun e!443570 () Bool)

(assert (=> b!800041 (= e!443569 e!443570)))

(declare-fun res!544704 () Bool)

(assert (=> b!800041 (=> (not res!544704) (not e!443570))))

(declare-fun lt!357280 () array!43503)

(declare-fun lt!357274 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8420 0))(
  ( (MissingZero!8420 (index!36048 (_ BitVec 32))) (Found!8420 (index!36049 (_ BitVec 32))) (Intermediate!8420 (undefined!9232 Bool) (index!36050 (_ BitVec 32)) (x!66925 (_ BitVec 32))) (Undefined!8420) (MissingVacant!8420 (index!36051 (_ BitVec 32))) )
))
(declare-fun lt!357277 () SeekEntryResult!8420)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43503 (_ BitVec 32)) SeekEntryResult!8420)

(assert (=> b!800041 (= res!544704 (= lt!357277 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357274 lt!357280 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43503 (_ BitVec 32)) SeekEntryResult!8420)

(assert (=> b!800041 (= lt!357277 (seekEntryOrOpen!0 lt!357274 lt!357280 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!800041 (= lt!357274 (select (store (arr!20832 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800041 (= lt!357280 (array!43504 (store (arr!20832 a!3170) i!1163 k!2044) (size!21253 a!3170)))))

(declare-fun b!800042 () Bool)

(declare-fun res!544707 () Bool)

(assert (=> b!800042 (=> (not res!544707) (not e!443569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43503 (_ BitVec 32)) Bool)

(assert (=> b!800042 (= res!544707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800043 () Bool)

(assert (=> b!800043 (= e!443567 e!443569)))

(declare-fun res!544699 () Bool)

(assert (=> b!800043 (=> (not res!544699) (not e!443569))))

(declare-fun lt!357281 () SeekEntryResult!8420)

(assert (=> b!800043 (= res!544699 (or (= lt!357281 (MissingZero!8420 i!1163)) (= lt!357281 (MissingVacant!8420 i!1163))))))

(assert (=> b!800043 (= lt!357281 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800044 () Bool)

(declare-fun res!544698 () Bool)

(declare-fun e!443571 () Bool)

(assert (=> b!800044 (=> (not res!544698) (not e!443571))))

(declare-fun lt!357278 () (_ BitVec 32))

(assert (=> b!800044 (= res!544698 (= lt!357277 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357278 vacantAfter!23 lt!357274 lt!357280 mask!3266)))))

(declare-fun b!800045 () Bool)

(assert (=> b!800045 (= e!443571 false)))

(declare-fun lt!357279 () SeekEntryResult!8420)

(assert (=> b!800045 (= lt!357279 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357278 vacantBefore!23 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800046 () Bool)

(declare-fun e!443572 () Bool)

(assert (=> b!800046 (= e!443570 e!443572)))

(declare-fun res!544709 () Bool)

(assert (=> b!800046 (=> (not res!544709) (not e!443572))))

(declare-fun lt!357276 () SeekEntryResult!8420)

(declare-fun lt!357275 () SeekEntryResult!8420)

(assert (=> b!800046 (= res!544709 (and (= lt!357275 lt!357276) (= lt!357276 (Found!8420 j!153)) (not (= (select (arr!20832 a!3170) index!1236) (select (arr!20832 a!3170) j!153)))))))

(assert (=> b!800046 (= lt!357276 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800046 (= lt!357275 (seekEntryOrOpen!0 (select (arr!20832 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800047 () Bool)

(declare-fun res!544700 () Bool)

(assert (=> b!800047 (=> (not res!544700) (not e!443567))))

(assert (=> b!800047 (= res!544700 (and (= (size!21253 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21253 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21253 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800048 () Bool)

(assert (=> b!800048 (= e!443572 e!443571)))

(declare-fun res!544708 () Bool)

(assert (=> b!800048 (=> (not res!544708) (not e!443571))))

(assert (=> b!800048 (= res!544708 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357278 #b00000000000000000000000000000000) (bvslt lt!357278 (size!21253 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800048 (= lt!357278 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544702 () Bool)

(assert (=> start!68696 (=> (not res!544702) (not e!443567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68696 (= res!544702 (validMask!0 mask!3266))))

(assert (=> start!68696 e!443567))

(assert (=> start!68696 true))

(declare-fun array_inv!16715 (array!43503) Bool)

(assert (=> start!68696 (array_inv!16715 a!3170)))

(declare-fun b!800049 () Bool)

(declare-fun res!544710 () Bool)

(assert (=> b!800049 (=> (not res!544710) (not e!443569))))

(declare-datatypes ((List!14834 0))(
  ( (Nil!14831) (Cons!14830 (h!15959 (_ BitVec 64)) (t!21140 List!14834)) )
))
(declare-fun arrayNoDuplicates!0 (array!43503 (_ BitVec 32) List!14834) Bool)

(assert (=> b!800049 (= res!544710 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14831))))

(declare-fun b!800050 () Bool)

(declare-fun res!544701 () Bool)

(assert (=> b!800050 (=> (not res!544701) (not e!443567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800050 (= res!544701 (validKeyInArray!0 k!2044))))

(declare-fun b!800051 () Bool)

(declare-fun res!544706 () Bool)

(assert (=> b!800051 (=> (not res!544706) (not e!443567))))

(assert (=> b!800051 (= res!544706 (validKeyInArray!0 (select (arr!20832 a!3170) j!153)))))

(assert (= (and start!68696 res!544702) b!800047))

(assert (= (and b!800047 res!544700) b!800051))

(assert (= (and b!800051 res!544706) b!800050))

(assert (= (and b!800050 res!544701) b!800039))

(assert (= (and b!800039 res!544703) b!800043))

(assert (= (and b!800043 res!544699) b!800042))

(assert (= (and b!800042 res!544707) b!800049))

(assert (= (and b!800049 res!544710) b!800040))

(assert (= (and b!800040 res!544705) b!800041))

(assert (= (and b!800041 res!544704) b!800046))

(assert (= (and b!800046 res!544709) b!800048))

(assert (= (and b!800048 res!544708) b!800044))

(assert (= (and b!800044 res!544698) b!800045))

(declare-fun m!740623 () Bool)

(assert (=> b!800042 m!740623))

(declare-fun m!740625 () Bool)

(assert (=> b!800050 m!740625))

(declare-fun m!740627 () Bool)

(assert (=> b!800048 m!740627))

(declare-fun m!740629 () Bool)

(assert (=> b!800044 m!740629))

(declare-fun m!740631 () Bool)

(assert (=> b!800046 m!740631))

(declare-fun m!740633 () Bool)

(assert (=> b!800046 m!740633))

(assert (=> b!800046 m!740633))

(declare-fun m!740635 () Bool)

(assert (=> b!800046 m!740635))

(assert (=> b!800046 m!740633))

(declare-fun m!740637 () Bool)

(assert (=> b!800046 m!740637))

(declare-fun m!740639 () Bool)

(assert (=> b!800049 m!740639))

(declare-fun m!740641 () Bool)

(assert (=> b!800040 m!740641))

(declare-fun m!740643 () Bool)

(assert (=> b!800040 m!740643))

(declare-fun m!740645 () Bool)

(assert (=> b!800043 m!740645))

(declare-fun m!740647 () Bool)

(assert (=> b!800039 m!740647))

(assert (=> b!800045 m!740633))

(assert (=> b!800045 m!740633))

(declare-fun m!740649 () Bool)

(assert (=> b!800045 m!740649))

(declare-fun m!740651 () Bool)

(assert (=> b!800041 m!740651))

(declare-fun m!740653 () Bool)

(assert (=> b!800041 m!740653))

(declare-fun m!740655 () Bool)

(assert (=> b!800041 m!740655))

(declare-fun m!740657 () Bool)

(assert (=> b!800041 m!740657))

(assert (=> b!800051 m!740633))

(assert (=> b!800051 m!740633))

(declare-fun m!740659 () Bool)

(assert (=> b!800051 m!740659))

(declare-fun m!740661 () Bool)

(assert (=> start!68696 m!740661))

(declare-fun m!740663 () Bool)

(assert (=> start!68696 m!740663))

(push 1)

(assert (not b!800046))

(assert (not b!800042))

(assert (not b!800048))

(assert (not b!800051))

(assert (not b!800044))

(assert (not b!800043))

(assert (not b!800039))

(assert (not b!800041))

(assert (not b!800045))

(assert (not b!800049))

(assert (not b!800050))

(assert (not start!68696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

