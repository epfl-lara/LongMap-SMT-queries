; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68670 () Bool)

(assert start!68670)

(declare-fun b!799532 () Bool)

(declare-fun e!443333 () Bool)

(declare-fun e!443336 () Bool)

(assert (=> b!799532 (= e!443333 e!443336)))

(declare-fun res!544193 () Bool)

(assert (=> b!799532 (=> (not res!544193) (not e!443336))))

(declare-datatypes ((SeekEntryResult!8407 0))(
  ( (MissingZero!8407 (index!35996 (_ BitVec 32))) (Found!8407 (index!35997 (_ BitVec 32))) (Intermediate!8407 (undefined!9219 Bool) (index!35998 (_ BitVec 32)) (x!66880 (_ BitVec 32))) (Undefined!8407) (MissingVacant!8407 (index!35999 (_ BitVec 32))) )
))
(declare-fun lt!356968 () SeekEntryResult!8407)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799532 (= res!544193 (or (= lt!356968 (MissingZero!8407 i!1163)) (= lt!356968 (MissingVacant!8407 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43477 0))(
  ( (array!43478 (arr!20819 (Array (_ BitVec 32) (_ BitVec 64))) (size!21240 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43477)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43477 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!799532 (= lt!356968 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799533 () Bool)

(declare-fun res!544194 () Bool)

(assert (=> b!799533 (=> (not res!544194) (not e!443333))))

(declare-fun arrayContainsKey!0 (array!43477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799533 (= res!544194 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799534 () Bool)

(declare-fun res!544199 () Bool)

(declare-fun e!443337 () Bool)

(assert (=> b!799534 (=> (not res!544199) (not e!443337))))

(declare-fun lt!356966 () (_ BitVec 64))

(declare-fun lt!356962 () (_ BitVec 32))

(declare-fun lt!356969 () SeekEntryResult!8407)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356965 () array!43477)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43477 (_ BitVec 32)) SeekEntryResult!8407)

(assert (=> b!799534 (= res!544199 (= lt!356969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356962 vacantAfter!23 lt!356966 lt!356965 mask!3266)))))

(declare-fun res!544192 () Bool)

(assert (=> start!68670 (=> (not res!544192) (not e!443333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68670 (= res!544192 (validMask!0 mask!3266))))

(assert (=> start!68670 e!443333))

(assert (=> start!68670 true))

(declare-fun array_inv!16702 (array!43477) Bool)

(assert (=> start!68670 (array_inv!16702 a!3170)))

(declare-fun b!799535 () Bool)

(declare-fun res!544203 () Bool)

(assert (=> b!799535 (=> (not res!544203) (not e!443336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43477 (_ BitVec 32)) Bool)

(assert (=> b!799535 (= res!544203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799536 () Bool)

(declare-fun e!443338 () Bool)

(assert (=> b!799536 (= e!443338 e!443337)))

(declare-fun res!544198 () Bool)

(assert (=> b!799536 (=> (not res!544198) (not e!443337))))

(assert (=> b!799536 (= res!544198 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356962 #b00000000000000000000000000000000) (bvslt lt!356962 (size!21240 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799536 (= lt!356962 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799537 () Bool)

(declare-fun res!544200 () Bool)

(assert (=> b!799537 (=> (not res!544200) (not e!443333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799537 (= res!544200 (validKeyInArray!0 k0!2044))))

(declare-fun b!799538 () Bool)

(declare-fun res!544195 () Bool)

(assert (=> b!799538 (=> (not res!544195) (not e!443336))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799538 (= res!544195 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21240 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20819 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21240 a!3170)) (= (select (arr!20819 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799539 () Bool)

(declare-fun res!544191 () Bool)

(assert (=> b!799539 (=> (not res!544191) (not e!443336))))

(declare-datatypes ((List!14821 0))(
  ( (Nil!14818) (Cons!14817 (h!15946 (_ BitVec 64)) (t!21127 List!14821)) )
))
(declare-fun arrayNoDuplicates!0 (array!43477 (_ BitVec 32) List!14821) Bool)

(assert (=> b!799539 (= res!544191 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14818))))

(declare-fun b!799540 () Bool)

(declare-fun e!443335 () Bool)

(assert (=> b!799540 (= e!443335 e!443338)))

(declare-fun res!544196 () Bool)

(assert (=> b!799540 (=> (not res!544196) (not e!443338))))

(declare-fun lt!356964 () SeekEntryResult!8407)

(declare-fun lt!356967 () SeekEntryResult!8407)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799540 (= res!544196 (and (= lt!356964 lt!356967) (= lt!356967 (Found!8407 j!153)) (not (= (select (arr!20819 a!3170) index!1236) (select (arr!20819 a!3170) j!153)))))))

(assert (=> b!799540 (= lt!356967 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799540 (= lt!356964 (seekEntryOrOpen!0 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799541 () Bool)

(assert (=> b!799541 (= e!443337 false)))

(declare-fun lt!356963 () SeekEntryResult!8407)

(assert (=> b!799541 (= lt!356963 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356962 vacantBefore!23 (select (arr!20819 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799542 () Bool)

(assert (=> b!799542 (= e!443336 e!443335)))

(declare-fun res!544201 () Bool)

(assert (=> b!799542 (=> (not res!544201) (not e!443335))))

(assert (=> b!799542 (= res!544201 (= lt!356969 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356966 lt!356965 mask!3266)))))

(assert (=> b!799542 (= lt!356969 (seekEntryOrOpen!0 lt!356966 lt!356965 mask!3266))))

(assert (=> b!799542 (= lt!356966 (select (store (arr!20819 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799542 (= lt!356965 (array!43478 (store (arr!20819 a!3170) i!1163 k0!2044) (size!21240 a!3170)))))

(declare-fun b!799543 () Bool)

(declare-fun res!544197 () Bool)

(assert (=> b!799543 (=> (not res!544197) (not e!443333))))

(assert (=> b!799543 (= res!544197 (validKeyInArray!0 (select (arr!20819 a!3170) j!153)))))

(declare-fun b!799544 () Bool)

(declare-fun res!544202 () Bool)

(assert (=> b!799544 (=> (not res!544202) (not e!443333))))

(assert (=> b!799544 (= res!544202 (and (= (size!21240 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21240 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21240 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68670 res!544192) b!799544))

(assert (= (and b!799544 res!544202) b!799543))

(assert (= (and b!799543 res!544197) b!799537))

(assert (= (and b!799537 res!544200) b!799533))

(assert (= (and b!799533 res!544194) b!799532))

(assert (= (and b!799532 res!544193) b!799535))

(assert (= (and b!799535 res!544203) b!799539))

(assert (= (and b!799539 res!544191) b!799538))

(assert (= (and b!799538 res!544195) b!799542))

(assert (= (and b!799542 res!544201) b!799540))

(assert (= (and b!799540 res!544196) b!799536))

(assert (= (and b!799536 res!544198) b!799534))

(assert (= (and b!799534 res!544199) b!799541))

(declare-fun m!740077 () Bool)

(assert (=> b!799532 m!740077))

(declare-fun m!740079 () Bool)

(assert (=> b!799538 m!740079))

(declare-fun m!740081 () Bool)

(assert (=> b!799538 m!740081))

(declare-fun m!740083 () Bool)

(assert (=> start!68670 m!740083))

(declare-fun m!740085 () Bool)

(assert (=> start!68670 m!740085))

(declare-fun m!740087 () Bool)

(assert (=> b!799539 m!740087))

(declare-fun m!740089 () Bool)

(assert (=> b!799542 m!740089))

(declare-fun m!740091 () Bool)

(assert (=> b!799542 m!740091))

(declare-fun m!740093 () Bool)

(assert (=> b!799542 m!740093))

(declare-fun m!740095 () Bool)

(assert (=> b!799542 m!740095))

(declare-fun m!740097 () Bool)

(assert (=> b!799543 m!740097))

(assert (=> b!799543 m!740097))

(declare-fun m!740099 () Bool)

(assert (=> b!799543 m!740099))

(declare-fun m!740101 () Bool)

(assert (=> b!799533 m!740101))

(declare-fun m!740103 () Bool)

(assert (=> b!799536 m!740103))

(declare-fun m!740105 () Bool)

(assert (=> b!799540 m!740105))

(assert (=> b!799540 m!740097))

(assert (=> b!799540 m!740097))

(declare-fun m!740107 () Bool)

(assert (=> b!799540 m!740107))

(assert (=> b!799540 m!740097))

(declare-fun m!740109 () Bool)

(assert (=> b!799540 m!740109))

(assert (=> b!799541 m!740097))

(assert (=> b!799541 m!740097))

(declare-fun m!740111 () Bool)

(assert (=> b!799541 m!740111))

(declare-fun m!740113 () Bool)

(assert (=> b!799535 m!740113))

(declare-fun m!740115 () Bool)

(assert (=> b!799534 m!740115))

(declare-fun m!740117 () Bool)

(assert (=> b!799537 m!740117))

(check-sat (not start!68670) (not b!799534) (not b!799536) (not b!799541) (not b!799537) (not b!799543) (not b!799533) (not b!799540) (not b!799532) (not b!799542) (not b!799535) (not b!799539))
(check-sat)
