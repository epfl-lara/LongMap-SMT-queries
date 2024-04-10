; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68702 () Bool)

(assert start!68702)

(declare-fun b!800016 () Bool)

(declare-fun res!544543 () Bool)

(declare-fun e!443596 () Bool)

(assert (=> b!800016 (=> (not res!544543) (not e!443596))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43492 0))(
  ( (array!43493 (arr!20826 (Array (_ BitVec 32) (_ BitVec 64))) (size!21247 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43492)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800016 (= res!544543 (and (= (size!21247 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21247 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21247 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800017 () Bool)

(declare-fun e!443600 () Bool)

(assert (=> b!800017 (= e!443600 false)))

(declare-datatypes ((SeekEntryResult!8417 0))(
  ( (MissingZero!8417 (index!36036 (_ BitVec 32))) (Found!8417 (index!36037 (_ BitVec 32))) (Intermediate!8417 (undefined!9229 Bool) (index!36038 (_ BitVec 32)) (x!66911 (_ BitVec 32))) (Undefined!8417) (MissingVacant!8417 (index!36039 (_ BitVec 32))) )
))
(declare-fun lt!357351 () SeekEntryResult!8417)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!357349 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43492 (_ BitVec 32)) SeekEntryResult!8417)

(assert (=> b!800017 (= lt!357351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357349 vacantBefore!23 (select (arr!20826 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800018 () Bool)

(declare-fun res!544546 () Bool)

(declare-fun e!443599 () Bool)

(assert (=> b!800018 (=> (not res!544546) (not e!443599))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800018 (= res!544546 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21247 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20826 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21247 a!3170)) (= (select (arr!20826 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800019 () Bool)

(declare-fun e!443597 () Bool)

(assert (=> b!800019 (= e!443599 e!443597)))

(declare-fun res!544544 () Bool)

(assert (=> b!800019 (=> (not res!544544) (not e!443597))))

(declare-fun lt!357346 () array!43492)

(declare-fun lt!357353 () (_ BitVec 64))

(declare-fun lt!357352 () SeekEntryResult!8417)

(assert (=> b!800019 (= res!544544 (= lt!357352 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357353 lt!357346 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43492 (_ BitVec 32)) SeekEntryResult!8417)

(assert (=> b!800019 (= lt!357352 (seekEntryOrOpen!0 lt!357353 lt!357346 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!800019 (= lt!357353 (select (store (arr!20826 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800019 (= lt!357346 (array!43493 (store (arr!20826 a!3170) i!1163 k!2044) (size!21247 a!3170)))))

(declare-fun b!800020 () Bool)

(declare-fun res!544539 () Bool)

(assert (=> b!800020 (=> (not res!544539) (not e!443599))))

(declare-datatypes ((List!14789 0))(
  ( (Nil!14786) (Cons!14785 (h!15914 (_ BitVec 64)) (t!21104 List!14789)) )
))
(declare-fun arrayNoDuplicates!0 (array!43492 (_ BitVec 32) List!14789) Bool)

(assert (=> b!800020 (= res!544539 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14786))))

(declare-fun b!800021 () Bool)

(assert (=> b!800021 (= e!443596 e!443599)))

(declare-fun res!544535 () Bool)

(assert (=> b!800021 (=> (not res!544535) (not e!443599))))

(declare-fun lt!357350 () SeekEntryResult!8417)

(assert (=> b!800021 (= res!544535 (or (= lt!357350 (MissingZero!8417 i!1163)) (= lt!357350 (MissingVacant!8417 i!1163))))))

(assert (=> b!800021 (= lt!357350 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800022 () Bool)

(declare-fun res!544540 () Bool)

(assert (=> b!800022 (=> (not res!544540) (not e!443596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800022 (= res!544540 (validKeyInArray!0 (select (arr!20826 a!3170) j!153)))))

(declare-fun b!800023 () Bool)

(declare-fun res!544542 () Bool)

(assert (=> b!800023 (=> (not res!544542) (not e!443600))))

(assert (=> b!800023 (= res!544542 (= lt!357352 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357349 vacantAfter!23 lt!357353 lt!357346 mask!3266)))))

(declare-fun b!800024 () Bool)

(declare-fun res!544537 () Bool)

(assert (=> b!800024 (=> (not res!544537) (not e!443596))))

(declare-fun arrayContainsKey!0 (array!43492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800024 (= res!544537 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800025 () Bool)

(declare-fun res!544541 () Bool)

(assert (=> b!800025 (=> (not res!544541) (not e!443596))))

(assert (=> b!800025 (= res!544541 (validKeyInArray!0 k!2044))))

(declare-fun b!800026 () Bool)

(declare-fun e!443598 () Bool)

(assert (=> b!800026 (= e!443598 e!443600)))

(declare-fun res!544538 () Bool)

(assert (=> b!800026 (=> (not res!544538) (not e!443600))))

(assert (=> b!800026 (= res!544538 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357349 #b00000000000000000000000000000000) (bvslt lt!357349 (size!21247 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800026 (= lt!357349 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800027 () Bool)

(declare-fun res!544536 () Bool)

(assert (=> b!800027 (=> (not res!544536) (not e!443599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43492 (_ BitVec 32)) Bool)

(assert (=> b!800027 (= res!544536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800028 () Bool)

(assert (=> b!800028 (= e!443597 e!443598)))

(declare-fun res!544547 () Bool)

(assert (=> b!800028 (=> (not res!544547) (not e!443598))))

(declare-fun lt!357347 () SeekEntryResult!8417)

(declare-fun lt!357348 () SeekEntryResult!8417)

(assert (=> b!800028 (= res!544547 (and (= lt!357348 lt!357347) (= lt!357347 (Found!8417 j!153)) (not (= (select (arr!20826 a!3170) index!1236) (select (arr!20826 a!3170) j!153)))))))

(assert (=> b!800028 (= lt!357347 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20826 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800028 (= lt!357348 (seekEntryOrOpen!0 (select (arr!20826 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!544545 () Bool)

(assert (=> start!68702 (=> (not res!544545) (not e!443596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68702 (= res!544545 (validMask!0 mask!3266))))

(assert (=> start!68702 e!443596))

(assert (=> start!68702 true))

(declare-fun array_inv!16622 (array!43492) Bool)

(assert (=> start!68702 (array_inv!16622 a!3170)))

(assert (= (and start!68702 res!544545) b!800016))

(assert (= (and b!800016 res!544543) b!800022))

(assert (= (and b!800022 res!544540) b!800025))

(assert (= (and b!800025 res!544541) b!800024))

(assert (= (and b!800024 res!544537) b!800021))

(assert (= (and b!800021 res!544535) b!800027))

(assert (= (and b!800027 res!544536) b!800020))

(assert (= (and b!800020 res!544539) b!800018))

(assert (= (and b!800018 res!544546) b!800019))

(assert (= (and b!800019 res!544544) b!800028))

(assert (= (and b!800028 res!544547) b!800026))

(assert (= (and b!800026 res!544538) b!800023))

(assert (= (and b!800023 res!544542) b!800017))

(declare-fun m!741071 () Bool)

(assert (=> b!800021 m!741071))

(declare-fun m!741073 () Bool)

(assert (=> b!800017 m!741073))

(assert (=> b!800017 m!741073))

(declare-fun m!741075 () Bool)

(assert (=> b!800017 m!741075))

(assert (=> b!800022 m!741073))

(assert (=> b!800022 m!741073))

(declare-fun m!741077 () Bool)

(assert (=> b!800022 m!741077))

(declare-fun m!741079 () Bool)

(assert (=> b!800025 m!741079))

(declare-fun m!741081 () Bool)

(assert (=> b!800020 m!741081))

(declare-fun m!741083 () Bool)

(assert (=> b!800027 m!741083))

(declare-fun m!741085 () Bool)

(assert (=> b!800024 m!741085))

(declare-fun m!741087 () Bool)

(assert (=> b!800019 m!741087))

(declare-fun m!741089 () Bool)

(assert (=> b!800019 m!741089))

(declare-fun m!741091 () Bool)

(assert (=> b!800019 m!741091))

(declare-fun m!741093 () Bool)

(assert (=> b!800019 m!741093))

(declare-fun m!741095 () Bool)

(assert (=> b!800026 m!741095))

(declare-fun m!741097 () Bool)

(assert (=> start!68702 m!741097))

(declare-fun m!741099 () Bool)

(assert (=> start!68702 m!741099))

(declare-fun m!741101 () Bool)

(assert (=> b!800028 m!741101))

(assert (=> b!800028 m!741073))

(assert (=> b!800028 m!741073))

(declare-fun m!741103 () Bool)

(assert (=> b!800028 m!741103))

(assert (=> b!800028 m!741073))

(declare-fun m!741105 () Bool)

(assert (=> b!800028 m!741105))

(declare-fun m!741107 () Bool)

(assert (=> b!800023 m!741107))

(declare-fun m!741109 () Bool)

(assert (=> b!800018 m!741109))

(declare-fun m!741111 () Bool)

(assert (=> b!800018 m!741111))

(push 1)

