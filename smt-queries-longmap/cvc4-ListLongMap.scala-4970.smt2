; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68334 () Bool)

(assert start!68334)

(declare-fun b!793915 () Bool)

(declare-fun res!538442 () Bool)

(declare-fun e!440926 () Bool)

(assert (=> b!793915 (=> (not res!538442) (not e!440926))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43124 0))(
  ( (array!43125 (arr!20642 (Array (_ BitVec 32) (_ BitVec 64))) (size!21063 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43124)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793915 (= res!538442 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21063 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20642 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21063 a!3170)) (= (select (arr!20642 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793916 () Bool)

(declare-fun res!538439 () Bool)

(declare-fun e!440927 () Bool)

(assert (=> b!793916 (=> (not res!538439) (not e!440927))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793916 (= res!538439 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793917 () Bool)

(declare-fun res!538441 () Bool)

(assert (=> b!793917 (=> (not res!538441) (not e!440926))))

(declare-datatypes ((List!14605 0))(
  ( (Nil!14602) (Cons!14601 (h!15730 (_ BitVec 64)) (t!20920 List!14605)) )
))
(declare-fun arrayNoDuplicates!0 (array!43124 (_ BitVec 32) List!14605) Bool)

(assert (=> b!793917 (= res!538441 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14602))))

(declare-fun b!793918 () Bool)

(assert (=> b!793918 (= e!440926 false)))

(declare-fun lt!353915 () array!43124)

(declare-datatypes ((SeekEntryResult!8233 0))(
  ( (MissingZero!8233 (index!35300 (_ BitVec 32))) (Found!8233 (index!35301 (_ BitVec 32))) (Intermediate!8233 (undefined!9045 Bool) (index!35302 (_ BitVec 32)) (x!66231 (_ BitVec 32))) (Undefined!8233) (MissingVacant!8233 (index!35303 (_ BitVec 32))) )
))
(declare-fun lt!353917 () SeekEntryResult!8233)

(declare-fun lt!353918 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43124 (_ BitVec 32)) SeekEntryResult!8233)

(assert (=> b!793918 (= lt!353917 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353918 lt!353915 mask!3266))))

(declare-fun lt!353916 () SeekEntryResult!8233)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43124 (_ BitVec 32)) SeekEntryResult!8233)

(assert (=> b!793918 (= lt!353916 (seekEntryOrOpen!0 lt!353918 lt!353915 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793918 (= lt!353918 (select (store (arr!20642 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793918 (= lt!353915 (array!43125 (store (arr!20642 a!3170) i!1163 k!2044) (size!21063 a!3170)))))

(declare-fun b!793919 () Bool)

(declare-fun res!538434 () Bool)

(assert (=> b!793919 (=> (not res!538434) (not e!440927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793919 (= res!538434 (validKeyInArray!0 (select (arr!20642 a!3170) j!153)))))

(declare-fun b!793920 () Bool)

(declare-fun res!538440 () Bool)

(assert (=> b!793920 (=> (not res!538440) (not e!440927))))

(assert (=> b!793920 (= res!538440 (and (= (size!21063 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21063 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21063 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!538438 () Bool)

(assert (=> start!68334 (=> (not res!538438) (not e!440927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68334 (= res!538438 (validMask!0 mask!3266))))

(assert (=> start!68334 e!440927))

(assert (=> start!68334 true))

(declare-fun array_inv!16438 (array!43124) Bool)

(assert (=> start!68334 (array_inv!16438 a!3170)))

(declare-fun b!793921 () Bool)

(assert (=> b!793921 (= e!440927 e!440926)))

(declare-fun res!538437 () Bool)

(assert (=> b!793921 (=> (not res!538437) (not e!440926))))

(declare-fun lt!353914 () SeekEntryResult!8233)

(assert (=> b!793921 (= res!538437 (or (= lt!353914 (MissingZero!8233 i!1163)) (= lt!353914 (MissingVacant!8233 i!1163))))))

(assert (=> b!793921 (= lt!353914 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793922 () Bool)

(declare-fun res!538435 () Bool)

(assert (=> b!793922 (=> (not res!538435) (not e!440927))))

(assert (=> b!793922 (= res!538435 (validKeyInArray!0 k!2044))))

(declare-fun b!793923 () Bool)

(declare-fun res!538436 () Bool)

(assert (=> b!793923 (=> (not res!538436) (not e!440926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43124 (_ BitVec 32)) Bool)

(assert (=> b!793923 (= res!538436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68334 res!538438) b!793920))

(assert (= (and b!793920 res!538440) b!793919))

(assert (= (and b!793919 res!538434) b!793922))

(assert (= (and b!793922 res!538435) b!793916))

(assert (= (and b!793916 res!538439) b!793921))

(assert (= (and b!793921 res!538437) b!793923))

(assert (= (and b!793923 res!538436) b!793917))

(assert (= (and b!793917 res!538441) b!793915))

(assert (= (and b!793915 res!538442) b!793918))

(declare-fun m!734423 () Bool)

(assert (=> b!793923 m!734423))

(declare-fun m!734425 () Bool)

(assert (=> b!793918 m!734425))

(declare-fun m!734427 () Bool)

(assert (=> b!793918 m!734427))

(declare-fun m!734429 () Bool)

(assert (=> b!793918 m!734429))

(declare-fun m!734431 () Bool)

(assert (=> b!793918 m!734431))

(declare-fun m!734433 () Bool)

(assert (=> b!793917 m!734433))

(declare-fun m!734435 () Bool)

(assert (=> b!793916 m!734435))

(declare-fun m!734437 () Bool)

(assert (=> start!68334 m!734437))

(declare-fun m!734439 () Bool)

(assert (=> start!68334 m!734439))

(declare-fun m!734441 () Bool)

(assert (=> b!793915 m!734441))

(declare-fun m!734443 () Bool)

(assert (=> b!793915 m!734443))

(declare-fun m!734445 () Bool)

(assert (=> b!793921 m!734445))

(declare-fun m!734447 () Bool)

(assert (=> b!793922 m!734447))

(declare-fun m!734449 () Bool)

(assert (=> b!793919 m!734449))

(assert (=> b!793919 m!734449))

(declare-fun m!734451 () Bool)

(assert (=> b!793919 m!734451))

(push 1)

(assert (not b!793919))

(assert (not b!793918))

(assert (not b!793917))

(assert (not b!793922))

