; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68522 () Bool)

(assert start!68522)

(declare-fun b!796817 () Bool)

(declare-fun res!541345 () Bool)

(declare-fun e!442109 () Bool)

(assert (=> b!796817 (=> (not res!541345) (not e!442109))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796817 (= res!541345 (validKeyInArray!0 k!2044))))

(declare-fun b!796818 () Bool)

(declare-fun res!541337 () Bool)

(assert (=> b!796818 (=> (not res!541337) (not e!442109))))

(declare-datatypes ((array!43312 0))(
  ( (array!43313 (arr!20736 (Array (_ BitVec 32) (_ BitVec 64))) (size!21157 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43312)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796818 (= res!541337 (validKeyInArray!0 (select (arr!20736 a!3170) j!153)))))

(declare-fun b!796819 () Bool)

(declare-fun e!442110 () Bool)

(assert (=> b!796819 (= e!442110 (not true))))

(declare-datatypes ((SeekEntryResult!8327 0))(
  ( (MissingZero!8327 (index!35676 (_ BitVec 32))) (Found!8327 (index!35677 (_ BitVec 32))) (Intermediate!8327 (undefined!9139 Bool) (index!35678 (_ BitVec 32)) (x!66581 (_ BitVec 32))) (Undefined!8327) (MissingVacant!8327 (index!35679 (_ BitVec 32))) )
))
(declare-fun lt!355370 () SeekEntryResult!8327)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796819 (= lt!355370 (Found!8327 index!1236))))

(declare-fun b!796820 () Bool)

(declare-fun res!541341 () Bool)

(declare-fun e!442108 () Bool)

(assert (=> b!796820 (=> (not res!541341) (not e!442108))))

(declare-datatypes ((List!14699 0))(
  ( (Nil!14696) (Cons!14695 (h!15824 (_ BitVec 64)) (t!21014 List!14699)) )
))
(declare-fun arrayNoDuplicates!0 (array!43312 (_ BitVec 32) List!14699) Bool)

(assert (=> b!796820 (= res!541341 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14696))))

(declare-fun b!796821 () Bool)

(declare-fun res!541342 () Bool)

(assert (=> b!796821 (=> (not res!541342) (not e!442108))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796821 (= res!541342 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21157 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20736 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21157 a!3170)) (= (select (arr!20736 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796822 () Bool)

(declare-fun res!541338 () Bool)

(assert (=> b!796822 (=> (not res!541338) (not e!442109))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!796822 (= res!541338 (and (= (size!21157 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21157 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21157 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796823 () Bool)

(declare-fun res!541346 () Bool)

(assert (=> b!796823 (=> (not res!541346) (not e!442109))))

(declare-fun arrayContainsKey!0 (array!43312 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796823 (= res!541346 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796824 () Bool)

(declare-fun res!541340 () Bool)

(assert (=> b!796824 (=> (not res!541340) (not e!442108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43312 (_ BitVec 32)) Bool)

(assert (=> b!796824 (= res!541340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796825 () Bool)

(declare-fun e!442111 () Bool)

(assert (=> b!796825 (= e!442108 e!442111)))

(declare-fun res!541344 () Bool)

(assert (=> b!796825 (=> (not res!541344) (not e!442111))))

(declare-fun lt!355369 () SeekEntryResult!8327)

(assert (=> b!796825 (= res!541344 (= lt!355369 lt!355370))))

(declare-fun lt!355364 () array!43312)

(declare-fun lt!355367 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43312 (_ BitVec 32)) SeekEntryResult!8327)

(assert (=> b!796825 (= lt!355370 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355367 lt!355364 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43312 (_ BitVec 32)) SeekEntryResult!8327)

(assert (=> b!796825 (= lt!355369 (seekEntryOrOpen!0 lt!355367 lt!355364 mask!3266))))

(assert (=> b!796825 (= lt!355367 (select (store (arr!20736 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796825 (= lt!355364 (array!43313 (store (arr!20736 a!3170) i!1163 k!2044) (size!21157 a!3170)))))

(declare-fun b!796826 () Bool)

(assert (=> b!796826 (= e!442109 e!442108)))

(declare-fun res!541343 () Bool)

(assert (=> b!796826 (=> (not res!541343) (not e!442108))))

(declare-fun lt!355365 () SeekEntryResult!8327)

(assert (=> b!796826 (= res!541343 (or (= lt!355365 (MissingZero!8327 i!1163)) (= lt!355365 (MissingVacant!8327 i!1163))))))

(assert (=> b!796826 (= lt!355365 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796827 () Bool)

(assert (=> b!796827 (= e!442111 e!442110)))

(declare-fun res!541339 () Bool)

(assert (=> b!796827 (=> (not res!541339) (not e!442110))))

(declare-fun lt!355368 () SeekEntryResult!8327)

(declare-fun lt!355366 () SeekEntryResult!8327)

(assert (=> b!796827 (= res!541339 (and (= lt!355368 lt!355366) (= lt!355366 (Found!8327 j!153)) (= (select (arr!20736 a!3170) index!1236) (select (arr!20736 a!3170) j!153))))))

(assert (=> b!796827 (= lt!355366 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20736 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796827 (= lt!355368 (seekEntryOrOpen!0 (select (arr!20736 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!541336 () Bool)

(assert (=> start!68522 (=> (not res!541336) (not e!442109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68522 (= res!541336 (validMask!0 mask!3266))))

(assert (=> start!68522 e!442109))

(assert (=> start!68522 true))

(declare-fun array_inv!16532 (array!43312) Bool)

(assert (=> start!68522 (array_inv!16532 a!3170)))

(assert (= (and start!68522 res!541336) b!796822))

(assert (= (and b!796822 res!541338) b!796818))

(assert (= (and b!796818 res!541337) b!796817))

(assert (= (and b!796817 res!541345) b!796823))

(assert (= (and b!796823 res!541346) b!796826))

(assert (= (and b!796826 res!541343) b!796824))

(assert (= (and b!796824 res!541340) b!796820))

(assert (= (and b!796820 res!541341) b!796821))

(assert (= (and b!796821 res!541342) b!796825))

(assert (= (and b!796825 res!541344) b!796827))

(assert (= (and b!796827 res!541339) b!796819))

(declare-fun m!737645 () Bool)

(assert (=> b!796825 m!737645))

(declare-fun m!737647 () Bool)

(assert (=> b!796825 m!737647))

(declare-fun m!737649 () Bool)

(assert (=> b!796825 m!737649))

(declare-fun m!737651 () Bool)

(assert (=> b!796825 m!737651))

(declare-fun m!737653 () Bool)

(assert (=> b!796821 m!737653))

(declare-fun m!737655 () Bool)

(assert (=> b!796821 m!737655))

(declare-fun m!737657 () Bool)

(assert (=> b!796826 m!737657))

(declare-fun m!737659 () Bool)

(assert (=> b!796824 m!737659))

(declare-fun m!737661 () Bool)

(assert (=> start!68522 m!737661))

(declare-fun m!737663 () Bool)

(assert (=> start!68522 m!737663))

(declare-fun m!737665 () Bool)

(assert (=> b!796820 m!737665))

(declare-fun m!737667 () Bool)

(assert (=> b!796818 m!737667))

(assert (=> b!796818 m!737667))

(declare-fun m!737669 () Bool)

(assert (=> b!796818 m!737669))

(declare-fun m!737671 () Bool)

(assert (=> b!796817 m!737671))

(declare-fun m!737673 () Bool)

(assert (=> b!796827 m!737673))

(assert (=> b!796827 m!737667))

(assert (=> b!796827 m!737667))

(declare-fun m!737675 () Bool)

(assert (=> b!796827 m!737675))

(assert (=> b!796827 m!737667))

(declare-fun m!737677 () Bool)

(assert (=> b!796827 m!737677))

(declare-fun m!737679 () Bool)

(assert (=> b!796823 m!737679))

(push 1)

