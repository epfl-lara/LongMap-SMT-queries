; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68368 () Bool)

(assert start!68368)

(declare-fun b!794401 () Bool)

(declare-fun res!538927 () Bool)

(declare-fun e!441105 () Bool)

(assert (=> b!794401 (=> (not res!538927) (not e!441105))))

(declare-datatypes ((array!43158 0))(
  ( (array!43159 (arr!20659 (Array (_ BitVec 32) (_ BitVec 64))) (size!21080 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43158)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43158 (_ BitVec 32)) Bool)

(assert (=> b!794401 (= res!538927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794402 () Bool)

(declare-fun res!538922 () Bool)

(assert (=> b!794402 (=> (not res!538922) (not e!441105))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794402 (= res!538922 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21080 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20659 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21080 a!3170)) (= (select (arr!20659 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794403 () Bool)

(declare-fun res!538925 () Bool)

(declare-fun e!441107 () Bool)

(assert (=> b!794403 (=> (not res!538925) (not e!441107))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794403 (= res!538925 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794404 () Bool)

(declare-fun res!538928 () Bool)

(assert (=> b!794404 (=> (not res!538928) (not e!441105))))

(declare-datatypes ((List!14622 0))(
  ( (Nil!14619) (Cons!14618 (h!15747 (_ BitVec 64)) (t!20937 List!14622)) )
))
(declare-fun arrayNoDuplicates!0 (array!43158 (_ BitVec 32) List!14622) Bool)

(assert (=> b!794404 (= res!538928 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14619))))

(declare-fun b!794405 () Bool)

(declare-fun res!538924 () Bool)

(assert (=> b!794405 (=> (not res!538924) (not e!441107))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794405 (= res!538924 (and (= (size!21080 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21080 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21080 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794407 () Bool)

(assert (=> b!794407 (= e!441107 e!441105)))

(declare-fun res!538921 () Bool)

(assert (=> b!794407 (=> (not res!538921) (not e!441105))))

(declare-datatypes ((SeekEntryResult!8250 0))(
  ( (MissingZero!8250 (index!35368 (_ BitVec 32))) (Found!8250 (index!35369 (_ BitVec 32))) (Intermediate!8250 (undefined!9062 Bool) (index!35370 (_ BitVec 32)) (x!66296 (_ BitVec 32))) (Undefined!8250) (MissingVacant!8250 (index!35371 (_ BitVec 32))) )
))
(declare-fun lt!354115 () SeekEntryResult!8250)

(assert (=> b!794407 (= res!538921 (or (= lt!354115 (MissingZero!8250 i!1163)) (= lt!354115 (MissingVacant!8250 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43158 (_ BitVec 32)) SeekEntryResult!8250)

(assert (=> b!794407 (= lt!354115 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794408 () Bool)

(assert (=> b!794408 (= e!441105 false)))

(declare-fun lt!354118 () (_ BitVec 64))

(declare-fun lt!354117 () SeekEntryResult!8250)

(declare-fun lt!354116 () array!43158)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43158 (_ BitVec 32)) SeekEntryResult!8250)

(assert (=> b!794408 (= lt!354117 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354118 lt!354116 mask!3266))))

(declare-fun lt!354119 () SeekEntryResult!8250)

(assert (=> b!794408 (= lt!354119 (seekEntryOrOpen!0 lt!354118 lt!354116 mask!3266))))

(assert (=> b!794408 (= lt!354118 (select (store (arr!20659 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794408 (= lt!354116 (array!43159 (store (arr!20659 a!3170) i!1163 k0!2044) (size!21080 a!3170)))))

(declare-fun b!794409 () Bool)

(declare-fun res!538920 () Bool)

(assert (=> b!794409 (=> (not res!538920) (not e!441107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794409 (= res!538920 (validKeyInArray!0 k0!2044))))

(declare-fun b!794406 () Bool)

(declare-fun res!538926 () Bool)

(assert (=> b!794406 (=> (not res!538926) (not e!441107))))

(assert (=> b!794406 (= res!538926 (validKeyInArray!0 (select (arr!20659 a!3170) j!153)))))

(declare-fun res!538923 () Bool)

(assert (=> start!68368 (=> (not res!538923) (not e!441107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68368 (= res!538923 (validMask!0 mask!3266))))

(assert (=> start!68368 e!441107))

(assert (=> start!68368 true))

(declare-fun array_inv!16455 (array!43158) Bool)

(assert (=> start!68368 (array_inv!16455 a!3170)))

(assert (= (and start!68368 res!538923) b!794405))

(assert (= (and b!794405 res!538924) b!794406))

(assert (= (and b!794406 res!538926) b!794409))

(assert (= (and b!794409 res!538920) b!794403))

(assert (= (and b!794403 res!538925) b!794407))

(assert (= (and b!794407 res!538921) b!794401))

(assert (= (and b!794401 res!538927) b!794404))

(assert (= (and b!794404 res!538928) b!794402))

(assert (= (and b!794402 res!538922) b!794408))

(declare-fun m!734933 () Bool)

(assert (=> b!794403 m!734933))

(declare-fun m!734935 () Bool)

(assert (=> b!794404 m!734935))

(declare-fun m!734937 () Bool)

(assert (=> b!794406 m!734937))

(assert (=> b!794406 m!734937))

(declare-fun m!734939 () Bool)

(assert (=> b!794406 m!734939))

(declare-fun m!734941 () Bool)

(assert (=> b!794402 m!734941))

(declare-fun m!734943 () Bool)

(assert (=> b!794402 m!734943))

(declare-fun m!734945 () Bool)

(assert (=> start!68368 m!734945))

(declare-fun m!734947 () Bool)

(assert (=> start!68368 m!734947))

(declare-fun m!734949 () Bool)

(assert (=> b!794407 m!734949))

(declare-fun m!734951 () Bool)

(assert (=> b!794408 m!734951))

(declare-fun m!734953 () Bool)

(assert (=> b!794408 m!734953))

(declare-fun m!734955 () Bool)

(assert (=> b!794408 m!734955))

(declare-fun m!734957 () Bool)

(assert (=> b!794408 m!734957))

(declare-fun m!734959 () Bool)

(assert (=> b!794409 m!734959))

(declare-fun m!734961 () Bool)

(assert (=> b!794401 m!734961))

(check-sat (not start!68368) (not b!794404) (not b!794403) (not b!794408) (not b!794406) (not b!794409) (not b!794407) (not b!794401))
(check-sat)
