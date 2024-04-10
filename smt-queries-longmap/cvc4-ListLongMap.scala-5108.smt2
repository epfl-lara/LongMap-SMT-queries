; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69258 () Bool)

(assert start!69258)

(declare-fun b!808097 () Bool)

(declare-fun e!447350 () Bool)

(declare-fun e!447352 () Bool)

(assert (=> b!808097 (= e!447350 e!447352)))

(declare-fun res!552223 () Bool)

(assert (=> b!808097 (=> (not res!552223) (not e!447352))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8647 0))(
  ( (MissingZero!8647 (index!36956 (_ BitVec 32))) (Found!8647 (index!36957 (_ BitVec 32))) (Intermediate!8647 (undefined!9459 Bool) (index!36958 (_ BitVec 32)) (x!67755 (_ BitVec 32))) (Undefined!8647) (MissingVacant!8647 (index!36959 (_ BitVec 32))) )
))
(declare-fun lt!362093 () SeekEntryResult!8647)

(declare-fun lt!362090 () SeekEntryResult!8647)

(declare-datatypes ((array!43958 0))(
  ( (array!43959 (arr!21056 (Array (_ BitVec 32) (_ BitVec 64))) (size!21477 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43958)

(assert (=> b!808097 (= res!552223 (and (= lt!362090 lt!362093) (= lt!362093 (Found!8647 j!153)) (not (= (select (arr!21056 a!3170) index!1236) (select (arr!21056 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43958 (_ BitVec 32)) SeekEntryResult!8647)

(assert (=> b!808097 (= lt!362093 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21056 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43958 (_ BitVec 32)) SeekEntryResult!8647)

(assert (=> b!808097 (= lt!362090 (seekEntryOrOpen!0 (select (arr!21056 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!808098 () Bool)

(declare-fun res!552224 () Bool)

(declare-fun e!447349 () Bool)

(assert (=> b!808098 (=> (not res!552224) (not e!447349))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!808098 (= res!552224 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21477 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21056 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21477 a!3170)) (= (select (arr!21056 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808099 () Bool)

(declare-fun res!552220 () Bool)

(assert (=> b!808099 (=> (not res!552220) (not e!447349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43958 (_ BitVec 32)) Bool)

(assert (=> b!808099 (= res!552220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808100 () Bool)

(declare-fun res!552221 () Bool)

(declare-fun e!447351 () Bool)

(assert (=> b!808100 (=> (not res!552221) (not e!447351))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808100 (= res!552221 (validKeyInArray!0 k!2044))))

(declare-fun b!808101 () Bool)

(declare-fun res!552230 () Bool)

(assert (=> b!808101 (=> (not res!552230) (not e!447349))))

(declare-datatypes ((List!15019 0))(
  ( (Nil!15016) (Cons!15015 (h!16144 (_ BitVec 64)) (t!21334 List!15019)) )
))
(declare-fun arrayNoDuplicates!0 (array!43958 (_ BitVec 32) List!15019) Bool)

(assert (=> b!808101 (= res!552230 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15016))))

(declare-fun b!808102 () Bool)

(declare-fun res!552228 () Bool)

(assert (=> b!808102 (=> (not res!552228) (not e!447351))))

(assert (=> b!808102 (= res!552228 (validKeyInArray!0 (select (arr!21056 a!3170) j!153)))))

(declare-fun b!808103 () Bool)

(assert (=> b!808103 (= e!447351 e!447349)))

(declare-fun res!552225 () Bool)

(assert (=> b!808103 (=> (not res!552225) (not e!447349))))

(declare-fun lt!362091 () SeekEntryResult!8647)

(assert (=> b!808103 (= res!552225 (or (= lt!362091 (MissingZero!8647 i!1163)) (= lt!362091 (MissingVacant!8647 i!1163))))))

(assert (=> b!808103 (= lt!362091 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!808104 () Bool)

(assert (=> b!808104 (= e!447352 false)))

(declare-fun lt!362092 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808104 (= lt!362092 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!552229 () Bool)

(assert (=> start!69258 (=> (not res!552229) (not e!447351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69258 (= res!552229 (validMask!0 mask!3266))))

(assert (=> start!69258 e!447351))

(assert (=> start!69258 true))

(declare-fun array_inv!16852 (array!43958) Bool)

(assert (=> start!69258 (array_inv!16852 a!3170)))

(declare-fun b!808105 () Bool)

(declare-fun res!552227 () Bool)

(assert (=> b!808105 (=> (not res!552227) (not e!447351))))

(declare-fun arrayContainsKey!0 (array!43958 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808105 (= res!552227 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808106 () Bool)

(assert (=> b!808106 (= e!447349 e!447350)))

(declare-fun res!552226 () Bool)

(assert (=> b!808106 (=> (not res!552226) (not e!447350))))

(declare-fun lt!362089 () (_ BitVec 64))

(declare-fun lt!362088 () array!43958)

(assert (=> b!808106 (= res!552226 (= (seekEntryOrOpen!0 lt!362089 lt!362088 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362089 lt!362088 mask!3266)))))

(assert (=> b!808106 (= lt!362089 (select (store (arr!21056 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!808106 (= lt!362088 (array!43959 (store (arr!21056 a!3170) i!1163 k!2044) (size!21477 a!3170)))))

(declare-fun b!808107 () Bool)

(declare-fun res!552222 () Bool)

(assert (=> b!808107 (=> (not res!552222) (not e!447351))))

(assert (=> b!808107 (= res!552222 (and (= (size!21477 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21477 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21477 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69258 res!552229) b!808107))

(assert (= (and b!808107 res!552222) b!808102))

(assert (= (and b!808102 res!552228) b!808100))

(assert (= (and b!808100 res!552221) b!808105))

(assert (= (and b!808105 res!552227) b!808103))

(assert (= (and b!808103 res!552225) b!808099))

(assert (= (and b!808099 res!552220) b!808101))

(assert (= (and b!808101 res!552230) b!808098))

(assert (= (and b!808098 res!552224) b!808106))

(assert (= (and b!808106 res!552226) b!808097))

(assert (= (and b!808097 res!552223) b!808104))

(declare-fun m!750231 () Bool)

(assert (=> b!808104 m!750231))

(declare-fun m!750233 () Bool)

(assert (=> b!808103 m!750233))

(declare-fun m!750235 () Bool)

(assert (=> start!69258 m!750235))

(declare-fun m!750237 () Bool)

(assert (=> start!69258 m!750237))

(declare-fun m!750239 () Bool)

(assert (=> b!808101 m!750239))

(declare-fun m!750241 () Bool)

(assert (=> b!808105 m!750241))

(declare-fun m!750243 () Bool)

(assert (=> b!808097 m!750243))

(declare-fun m!750245 () Bool)

(assert (=> b!808097 m!750245))

(assert (=> b!808097 m!750245))

(declare-fun m!750247 () Bool)

(assert (=> b!808097 m!750247))

(assert (=> b!808097 m!750245))

(declare-fun m!750249 () Bool)

(assert (=> b!808097 m!750249))

(assert (=> b!808102 m!750245))

(assert (=> b!808102 m!750245))

(declare-fun m!750251 () Bool)

(assert (=> b!808102 m!750251))

(declare-fun m!750253 () Bool)

(assert (=> b!808100 m!750253))

(declare-fun m!750255 () Bool)

(assert (=> b!808106 m!750255))

(declare-fun m!750257 () Bool)

(assert (=> b!808106 m!750257))

(declare-fun m!750259 () Bool)

(assert (=> b!808106 m!750259))

(declare-fun m!750261 () Bool)

(assert (=> b!808106 m!750261))

(declare-fun m!750263 () Bool)

(assert (=> b!808099 m!750263))

(declare-fun m!750265 () Bool)

(assert (=> b!808098 m!750265))

(declare-fun m!750267 () Bool)

(assert (=> b!808098 m!750267))

(push 1)

(assert (not b!808105))

(assert (not b!808099))

