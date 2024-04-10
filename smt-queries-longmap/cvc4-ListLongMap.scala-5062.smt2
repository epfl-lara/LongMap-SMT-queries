; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68886 () Bool)

(assert start!68886)

(declare-fun b!803363 () Bool)

(declare-fun e!445165 () Bool)

(declare-fun e!445164 () Bool)

(assert (=> b!803363 (= e!445165 e!445164)))

(declare-fun res!547885 () Bool)

(assert (=> b!803363 (=> (not res!547885) (not e!445164))))

(declare-datatypes ((SeekEntryResult!8509 0))(
  ( (MissingZero!8509 (index!36404 (_ BitVec 32))) (Found!8509 (index!36405 (_ BitVec 32))) (Intermediate!8509 (undefined!9321 Bool) (index!36406 (_ BitVec 32)) (x!67243 (_ BitVec 32))) (Undefined!8509) (MissingVacant!8509 (index!36407 (_ BitVec 32))) )
))
(declare-fun lt!359539 () SeekEntryResult!8509)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803363 (= res!547885 (or (= lt!359539 (MissingZero!8509 i!1163)) (= lt!359539 (MissingVacant!8509 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43676 0))(
  ( (array!43677 (arr!20918 (Array (_ BitVec 32) (_ BitVec 64))) (size!21339 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43676)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43676 (_ BitVec 32)) SeekEntryResult!8509)

(assert (=> b!803363 (= lt!359539 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803364 () Bool)

(declare-fun res!547889 () Bool)

(assert (=> b!803364 (=> (not res!547889) (not e!445165))))

(declare-fun arrayContainsKey!0 (array!43676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803364 (= res!547889 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803365 () Bool)

(declare-fun res!547882 () Bool)

(assert (=> b!803365 (=> (not res!547882) (not e!445165))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803365 (= res!547882 (and (= (size!21339 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21339 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21339 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803367 () Bool)

(declare-fun e!445166 () Bool)

(assert (=> b!803367 (= e!445164 e!445166)))

(declare-fun res!547886 () Bool)

(assert (=> b!803367 (=> (not res!547886) (not e!445166))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359537 () (_ BitVec 64))

(declare-fun lt!359542 () array!43676)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43676 (_ BitVec 32)) SeekEntryResult!8509)

(assert (=> b!803367 (= res!547886 (= (seekEntryOrOpen!0 lt!359537 lt!359542 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359537 lt!359542 mask!3266)))))

(assert (=> b!803367 (= lt!359537 (select (store (arr!20918 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803367 (= lt!359542 (array!43677 (store (arr!20918 a!3170) i!1163 k!2044) (size!21339 a!3170)))))

(declare-fun b!803368 () Bool)

(declare-fun res!547887 () Bool)

(assert (=> b!803368 (=> (not res!547887) (not e!445164))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803368 (= res!547887 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21339 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20918 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21339 a!3170)) (= (select (arr!20918 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803369 () Bool)

(declare-fun res!547891 () Bool)

(assert (=> b!803369 (=> (not res!547891) (not e!445165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803369 (= res!547891 (validKeyInArray!0 k!2044))))

(declare-fun b!803370 () Bool)

(declare-fun res!547883 () Bool)

(assert (=> b!803370 (=> (not res!547883) (not e!445165))))

(assert (=> b!803370 (= res!547883 (validKeyInArray!0 (select (arr!20918 a!3170) j!153)))))

(declare-fun b!803371 () Bool)

(declare-fun res!547888 () Bool)

(assert (=> b!803371 (=> (not res!547888) (not e!445164))))

(declare-datatypes ((List!14881 0))(
  ( (Nil!14878) (Cons!14877 (h!16006 (_ BitVec 64)) (t!21196 List!14881)) )
))
(declare-fun arrayNoDuplicates!0 (array!43676 (_ BitVec 32) List!14881) Bool)

(assert (=> b!803371 (= res!547888 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14878))))

(declare-fun b!803372 () Bool)

(declare-fun e!445163 () Bool)

(assert (=> b!803372 (= e!445163 (not true))))

(declare-fun lt!359543 () (_ BitVec 32))

(assert (=> b!803372 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359543 vacantAfter!23 lt!359537 lt!359542 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359543 vacantBefore!23 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27558 0))(
  ( (Unit!27559) )
))
(declare-fun lt!359538 () Unit!27558)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43676 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27558)

(assert (=> b!803372 (= lt!359538 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359543 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803372 (= lt!359543 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803373 () Bool)

(assert (=> b!803373 (= e!445166 e!445163)))

(declare-fun res!547892 () Bool)

(assert (=> b!803373 (=> (not res!547892) (not e!445163))))

(declare-fun lt!359540 () SeekEntryResult!8509)

(declare-fun lt!359541 () SeekEntryResult!8509)

(assert (=> b!803373 (= res!547892 (and (= lt!359541 lt!359540) (= lt!359540 (Found!8509 j!153)) (not (= (select (arr!20918 a!3170) index!1236) (select (arr!20918 a!3170) j!153)))))))

(assert (=> b!803373 (= lt!359540 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803373 (= lt!359541 (seekEntryOrOpen!0 (select (arr!20918 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!547884 () Bool)

(assert (=> start!68886 (=> (not res!547884) (not e!445165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68886 (= res!547884 (validMask!0 mask!3266))))

(assert (=> start!68886 e!445165))

(assert (=> start!68886 true))

(declare-fun array_inv!16714 (array!43676) Bool)

(assert (=> start!68886 (array_inv!16714 a!3170)))

(declare-fun b!803366 () Bool)

(declare-fun res!547890 () Bool)

(assert (=> b!803366 (=> (not res!547890) (not e!445164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43676 (_ BitVec 32)) Bool)

(assert (=> b!803366 (= res!547890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68886 res!547884) b!803365))

(assert (= (and b!803365 res!547882) b!803370))

(assert (= (and b!803370 res!547883) b!803369))

(assert (= (and b!803369 res!547891) b!803364))

(assert (= (and b!803364 res!547889) b!803363))

(assert (= (and b!803363 res!547885) b!803366))

(assert (= (and b!803366 res!547890) b!803371))

(assert (= (and b!803371 res!547888) b!803368))

(assert (= (and b!803368 res!547887) b!803367))

(assert (= (and b!803367 res!547886) b!803373))

(assert (= (and b!803373 res!547892) b!803372))

(declare-fun m!745071 () Bool)

(assert (=> b!803364 m!745071))

(declare-fun m!745073 () Bool)

(assert (=> b!803367 m!745073))

(declare-fun m!745075 () Bool)

(assert (=> b!803367 m!745075))

(declare-fun m!745077 () Bool)

(assert (=> b!803367 m!745077))

(declare-fun m!745079 () Bool)

(assert (=> b!803367 m!745079))

(declare-fun m!745081 () Bool)

(assert (=> b!803372 m!745081))

(declare-fun m!745083 () Bool)

(assert (=> b!803372 m!745083))

(assert (=> b!803372 m!745081))

(declare-fun m!745085 () Bool)

(assert (=> b!803372 m!745085))

(declare-fun m!745087 () Bool)

(assert (=> b!803372 m!745087))

(declare-fun m!745089 () Bool)

(assert (=> b!803372 m!745089))

(declare-fun m!745091 () Bool)

(assert (=> b!803373 m!745091))

(assert (=> b!803373 m!745081))

(assert (=> b!803373 m!745081))

(declare-fun m!745093 () Bool)

(assert (=> b!803373 m!745093))

(assert (=> b!803373 m!745081))

(declare-fun m!745095 () Bool)

(assert (=> b!803373 m!745095))

(declare-fun m!745097 () Bool)

(assert (=> b!803363 m!745097))

(declare-fun m!745099 () Bool)

(assert (=> start!68886 m!745099))

(declare-fun m!745101 () Bool)

(assert (=> start!68886 m!745101))

(declare-fun m!745103 () Bool)

(assert (=> b!803368 m!745103))

(declare-fun m!745105 () Bool)

(assert (=> b!803368 m!745105))

(assert (=> b!803370 m!745081))

(assert (=> b!803370 m!745081))

(declare-fun m!745107 () Bool)

(assert (=> b!803370 m!745107))

(declare-fun m!745109 () Bool)

(assert (=> b!803371 m!745109))

(declare-fun m!745111 () Bool)

(assert (=> b!803366 m!745111))

(declare-fun m!745113 () Bool)

(assert (=> b!803369 m!745113))

(push 1)

