; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68834 () Bool)

(assert start!68834)

(declare-fun b!802451 () Bool)

(declare-fun res!546978 () Bool)

(declare-fun e!444718 () Bool)

(assert (=> b!802451 (=> (not res!546978) (not e!444718))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43624 0))(
  ( (array!43625 (arr!20892 (Array (_ BitVec 32) (_ BitVec 64))) (size!21313 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43624)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802451 (= res!546978 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21313 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20892 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21313 a!3170)) (= (select (arr!20892 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802452 () Bool)

(declare-fun e!444722 () Bool)

(assert (=> b!802452 (= e!444722 (not true))))

(declare-fun lt!358858 () (_ BitVec 64))

(declare-fun lt!358861 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358862 () array!43624)

(declare-datatypes ((SeekEntryResult!8483 0))(
  ( (MissingZero!8483 (index!36300 (_ BitVec 32))) (Found!8483 (index!36301 (_ BitVec 32))) (Intermediate!8483 (undefined!9295 Bool) (index!36302 (_ BitVec 32)) (x!67153 (_ BitVec 32))) (Undefined!8483) (MissingVacant!8483 (index!36303 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43624 (_ BitVec 32)) SeekEntryResult!8483)

(assert (=> b!802452 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358861 vacantAfter!23 lt!358858 lt!358862 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358861 vacantBefore!23 (select (arr!20892 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27506 0))(
  ( (Unit!27507) )
))
(declare-fun lt!358856 () Unit!27506)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43624 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27506)

(assert (=> b!802452 (= lt!358856 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358861 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802452 (= lt!358861 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802453 () Bool)

(declare-fun e!444721 () Bool)

(assert (=> b!802453 (= e!444721 e!444718)))

(declare-fun res!546980 () Bool)

(assert (=> b!802453 (=> (not res!546980) (not e!444718))))

(declare-fun lt!358859 () SeekEntryResult!8483)

(assert (=> b!802453 (= res!546980 (or (= lt!358859 (MissingZero!8483 i!1163)) (= lt!358859 (MissingVacant!8483 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43624 (_ BitVec 32)) SeekEntryResult!8483)

(assert (=> b!802453 (= lt!358859 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802454 () Bool)

(declare-fun res!546972 () Bool)

(assert (=> b!802454 (=> (not res!546972) (not e!444721))))

(declare-fun arrayContainsKey!0 (array!43624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802454 (= res!546972 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802455 () Bool)

(declare-fun res!546979 () Bool)

(assert (=> b!802455 (=> (not res!546979) (not e!444718))))

(declare-datatypes ((List!14855 0))(
  ( (Nil!14852) (Cons!14851 (h!15980 (_ BitVec 64)) (t!21170 List!14855)) )
))
(declare-fun arrayNoDuplicates!0 (array!43624 (_ BitVec 32) List!14855) Bool)

(assert (=> b!802455 (= res!546979 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14852))))

(declare-fun res!546973 () Bool)

(assert (=> start!68834 (=> (not res!546973) (not e!444721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68834 (= res!546973 (validMask!0 mask!3266))))

(assert (=> start!68834 e!444721))

(assert (=> start!68834 true))

(declare-fun array_inv!16688 (array!43624) Bool)

(assert (=> start!68834 (array_inv!16688 a!3170)))

(declare-fun b!802456 () Bool)

(declare-fun e!444720 () Bool)

(assert (=> b!802456 (= e!444718 e!444720)))

(declare-fun res!546976 () Bool)

(assert (=> b!802456 (=> (not res!546976) (not e!444720))))

(assert (=> b!802456 (= res!546976 (= (seekEntryOrOpen!0 lt!358858 lt!358862 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358858 lt!358862 mask!3266)))))

(assert (=> b!802456 (= lt!358858 (select (store (arr!20892 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802456 (= lt!358862 (array!43625 (store (arr!20892 a!3170) i!1163 k!2044) (size!21313 a!3170)))))

(declare-fun b!802457 () Bool)

(declare-fun res!546974 () Bool)

(assert (=> b!802457 (=> (not res!546974) (not e!444721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802457 (= res!546974 (validKeyInArray!0 (select (arr!20892 a!3170) j!153)))))

(declare-fun b!802458 () Bool)

(declare-fun res!546970 () Bool)

(assert (=> b!802458 (=> (not res!546970) (not e!444718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43624 (_ BitVec 32)) Bool)

(assert (=> b!802458 (= res!546970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802459 () Bool)

(assert (=> b!802459 (= e!444720 e!444722)))

(declare-fun res!546977 () Bool)

(assert (=> b!802459 (=> (not res!546977) (not e!444722))))

(declare-fun lt!358857 () SeekEntryResult!8483)

(declare-fun lt!358860 () SeekEntryResult!8483)

(assert (=> b!802459 (= res!546977 (and (= lt!358857 lt!358860) (= lt!358860 (Found!8483 j!153)) (not (= (select (arr!20892 a!3170) index!1236) (select (arr!20892 a!3170) j!153)))))))

(assert (=> b!802459 (= lt!358860 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20892 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802459 (= lt!358857 (seekEntryOrOpen!0 (select (arr!20892 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802460 () Bool)

(declare-fun res!546975 () Bool)

(assert (=> b!802460 (=> (not res!546975) (not e!444721))))

(assert (=> b!802460 (= res!546975 (and (= (size!21313 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21313 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21313 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802461 () Bool)

(declare-fun res!546971 () Bool)

(assert (=> b!802461 (=> (not res!546971) (not e!444721))))

(assert (=> b!802461 (= res!546971 (validKeyInArray!0 k!2044))))

(assert (= (and start!68834 res!546973) b!802460))

(assert (= (and b!802460 res!546975) b!802457))

(assert (= (and b!802457 res!546974) b!802461))

(assert (= (and b!802461 res!546971) b!802454))

(assert (= (and b!802454 res!546972) b!802453))

(assert (= (and b!802453 res!546980) b!802458))

(assert (= (and b!802458 res!546970) b!802455))

(assert (= (and b!802455 res!546979) b!802451))

(assert (= (and b!802451 res!546978) b!802456))

(assert (= (and b!802456 res!546976) b!802459))

(assert (= (and b!802459 res!546977) b!802452))

(declare-fun m!743909 () Bool)

(assert (=> b!802456 m!743909))

(declare-fun m!743911 () Bool)

(assert (=> b!802456 m!743911))

(declare-fun m!743913 () Bool)

(assert (=> b!802456 m!743913))

(declare-fun m!743915 () Bool)

(assert (=> b!802456 m!743915))

(declare-fun m!743917 () Bool)

(assert (=> b!802458 m!743917))

(declare-fun m!743919 () Bool)

(assert (=> b!802457 m!743919))

(assert (=> b!802457 m!743919))

(declare-fun m!743921 () Bool)

(assert (=> b!802457 m!743921))

(declare-fun m!743923 () Bool)

(assert (=> b!802454 m!743923))

(declare-fun m!743925 () Bool)

(assert (=> b!802455 m!743925))

(declare-fun m!743927 () Bool)

(assert (=> b!802451 m!743927))

(declare-fun m!743929 () Bool)

(assert (=> b!802451 m!743929))

(declare-fun m!743931 () Bool)

(assert (=> b!802459 m!743931))

(assert (=> b!802459 m!743919))

(assert (=> b!802459 m!743919))

(declare-fun m!743933 () Bool)

(assert (=> b!802459 m!743933))

(assert (=> b!802459 m!743919))

(declare-fun m!743935 () Bool)

(assert (=> b!802459 m!743935))

(assert (=> b!802452 m!743919))

(declare-fun m!743937 () Bool)

(assert (=> b!802452 m!743937))

(declare-fun m!743939 () Bool)

(assert (=> b!802452 m!743939))

(declare-fun m!743941 () Bool)

(assert (=> b!802452 m!743941))

(declare-fun m!743943 () Bool)

(assert (=> b!802452 m!743943))

(assert (=> b!802452 m!743919))

(declare-fun m!743945 () Bool)

(assert (=> start!68834 m!743945))

(declare-fun m!743947 () Bool)

(assert (=> start!68834 m!743947))

(declare-fun m!743949 () Bool)

(assert (=> b!802461 m!743949))

(declare-fun m!743951 () Bool)

(assert (=> b!802453 m!743951))

(push 1)

