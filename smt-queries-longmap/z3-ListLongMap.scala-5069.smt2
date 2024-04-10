; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68926 () Bool)

(assert start!68926)

(declare-fun b!804050 () Bool)

(declare-fun res!548569 () Bool)

(declare-fun e!445489 () Bool)

(assert (=> b!804050 (=> (not res!548569) (not e!445489))))

(declare-datatypes ((array!43716 0))(
  ( (array!43717 (arr!20938 (Array (_ BitVec 32) (_ BitVec 64))) (size!21359 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43716)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804050 (= res!548569 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!548579 () Bool)

(assert (=> start!68926 (=> (not res!548579) (not e!445489))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68926 (= res!548579 (validMask!0 mask!3266))))

(assert (=> start!68926 e!445489))

(assert (=> start!68926 true))

(declare-fun array_inv!16734 (array!43716) Bool)

(assert (=> start!68926 (array_inv!16734 a!3170)))

(declare-fun b!804051 () Bool)

(declare-fun e!445491 () Bool)

(declare-fun e!445493 () Bool)

(assert (=> b!804051 (= e!445491 e!445493)))

(declare-fun res!548577 () Bool)

(assert (=> b!804051 (=> (not res!548577) (not e!445493))))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8529 0))(
  ( (MissingZero!8529 (index!36484 (_ BitVec 32))) (Found!8529 (index!36485 (_ BitVec 32))) (Intermediate!8529 (undefined!9341 Bool) (index!36486 (_ BitVec 32)) (x!67319 (_ BitVec 32))) (Undefined!8529) (MissingVacant!8529 (index!36487 (_ BitVec 32))) )
))
(declare-fun lt!360039 () SeekEntryResult!8529)

(declare-fun lt!360044 () SeekEntryResult!8529)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804051 (= res!548577 (and (= lt!360039 lt!360044) (= lt!360044 (Found!8529 j!153)) (not (= (select (arr!20938 a!3170) index!1236) (select (arr!20938 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43716 (_ BitVec 32)) SeekEntryResult!8529)

(assert (=> b!804051 (= lt!360044 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20938 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43716 (_ BitVec 32)) SeekEntryResult!8529)

(assert (=> b!804051 (= lt!360039 (seekEntryOrOpen!0 (select (arr!20938 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804052 () Bool)

(assert (=> b!804052 (= e!445493 (not true))))

(declare-fun lt!360043 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360040 () array!43716)

(declare-fun lt!360042 () (_ BitVec 64))

(assert (=> b!804052 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360043 vacantAfter!23 lt!360042 lt!360040 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360043 vacantBefore!23 (select (arr!20938 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27598 0))(
  ( (Unit!27599) )
))
(declare-fun lt!360041 () Unit!27598)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43716 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27598)

(assert (=> b!804052 (= lt!360041 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360043 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804052 (= lt!360043 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!804053 () Bool)

(declare-fun e!445490 () Bool)

(assert (=> b!804053 (= e!445489 e!445490)))

(declare-fun res!548572 () Bool)

(assert (=> b!804053 (=> (not res!548572) (not e!445490))))

(declare-fun lt!360038 () SeekEntryResult!8529)

(assert (=> b!804053 (= res!548572 (or (= lt!360038 (MissingZero!8529 i!1163)) (= lt!360038 (MissingVacant!8529 i!1163))))))

(assert (=> b!804053 (= lt!360038 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804054 () Bool)

(declare-fun res!548571 () Bool)

(assert (=> b!804054 (=> (not res!548571) (not e!445489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804054 (= res!548571 (validKeyInArray!0 k0!2044))))

(declare-fun b!804055 () Bool)

(declare-fun res!548573 () Bool)

(assert (=> b!804055 (=> (not res!548573) (not e!445489))))

(assert (=> b!804055 (= res!548573 (and (= (size!21359 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21359 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21359 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804056 () Bool)

(declare-fun res!548570 () Bool)

(assert (=> b!804056 (=> (not res!548570) (not e!445490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43716 (_ BitVec 32)) Bool)

(assert (=> b!804056 (= res!548570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804057 () Bool)

(declare-fun res!548578 () Bool)

(assert (=> b!804057 (=> (not res!548578) (not e!445489))))

(assert (=> b!804057 (= res!548578 (validKeyInArray!0 (select (arr!20938 a!3170) j!153)))))

(declare-fun b!804058 () Bool)

(assert (=> b!804058 (= e!445490 e!445491)))

(declare-fun res!548575 () Bool)

(assert (=> b!804058 (=> (not res!548575) (not e!445491))))

(assert (=> b!804058 (= res!548575 (= (seekEntryOrOpen!0 lt!360042 lt!360040 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360042 lt!360040 mask!3266)))))

(assert (=> b!804058 (= lt!360042 (select (store (arr!20938 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804058 (= lt!360040 (array!43717 (store (arr!20938 a!3170) i!1163 k0!2044) (size!21359 a!3170)))))

(declare-fun b!804059 () Bool)

(declare-fun res!548574 () Bool)

(assert (=> b!804059 (=> (not res!548574) (not e!445490))))

(assert (=> b!804059 (= res!548574 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21359 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20938 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21359 a!3170)) (= (select (arr!20938 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804060 () Bool)

(declare-fun res!548576 () Bool)

(assert (=> b!804060 (=> (not res!548576) (not e!445490))))

(declare-datatypes ((List!14901 0))(
  ( (Nil!14898) (Cons!14897 (h!16026 (_ BitVec 64)) (t!21216 List!14901)) )
))
(declare-fun arrayNoDuplicates!0 (array!43716 (_ BitVec 32) List!14901) Bool)

(assert (=> b!804060 (= res!548576 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14898))))

(assert (= (and start!68926 res!548579) b!804055))

(assert (= (and b!804055 res!548573) b!804057))

(assert (= (and b!804057 res!548578) b!804054))

(assert (= (and b!804054 res!548571) b!804050))

(assert (= (and b!804050 res!548569) b!804053))

(assert (= (and b!804053 res!548572) b!804056))

(assert (= (and b!804056 res!548570) b!804060))

(assert (= (and b!804060 res!548576) b!804059))

(assert (= (and b!804059 res!548574) b!804058))

(assert (= (and b!804058 res!548575) b!804051))

(assert (= (and b!804051 res!548577) b!804052))

(declare-fun m!745951 () Bool)

(assert (=> b!804058 m!745951))

(declare-fun m!745953 () Bool)

(assert (=> b!804058 m!745953))

(declare-fun m!745955 () Bool)

(assert (=> b!804058 m!745955))

(declare-fun m!745957 () Bool)

(assert (=> b!804058 m!745957))

(declare-fun m!745959 () Bool)

(assert (=> b!804050 m!745959))

(declare-fun m!745961 () Bool)

(assert (=> b!804060 m!745961))

(declare-fun m!745963 () Bool)

(assert (=> b!804056 m!745963))

(declare-fun m!745965 () Bool)

(assert (=> start!68926 m!745965))

(declare-fun m!745967 () Bool)

(assert (=> start!68926 m!745967))

(declare-fun m!745969 () Bool)

(assert (=> b!804053 m!745969))

(declare-fun m!745971 () Bool)

(assert (=> b!804059 m!745971))

(declare-fun m!745973 () Bool)

(assert (=> b!804059 m!745973))

(declare-fun m!745975 () Bool)

(assert (=> b!804051 m!745975))

(declare-fun m!745977 () Bool)

(assert (=> b!804051 m!745977))

(assert (=> b!804051 m!745977))

(declare-fun m!745979 () Bool)

(assert (=> b!804051 m!745979))

(assert (=> b!804051 m!745977))

(declare-fun m!745981 () Bool)

(assert (=> b!804051 m!745981))

(assert (=> b!804057 m!745977))

(assert (=> b!804057 m!745977))

(declare-fun m!745983 () Bool)

(assert (=> b!804057 m!745983))

(declare-fun m!745985 () Bool)

(assert (=> b!804054 m!745985))

(assert (=> b!804052 m!745977))

(declare-fun m!745987 () Bool)

(assert (=> b!804052 m!745987))

(declare-fun m!745989 () Bool)

(assert (=> b!804052 m!745989))

(assert (=> b!804052 m!745977))

(declare-fun m!745991 () Bool)

(assert (=> b!804052 m!745991))

(declare-fun m!745993 () Bool)

(assert (=> b!804052 m!745993))

(check-sat (not b!804052) (not b!804054) (not b!804056) (not b!804058) (not b!804050) (not b!804051) (not b!804057) (not b!804053) (not b!804060) (not start!68926))
(check-sat)
