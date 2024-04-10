; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68668 () Bool)

(assert start!68668)

(declare-fun b!799353 () Bool)

(declare-fun e!443294 () Bool)

(assert (=> b!799353 (= e!443294 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356945 () (_ BitVec 32))

(declare-datatypes ((array!43458 0))(
  ( (array!43459 (arr!20809 (Array (_ BitVec 32) (_ BitVec 64))) (size!21230 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43458)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8400 0))(
  ( (MissingZero!8400 (index!35968 (_ BitVec 32))) (Found!8400 (index!35969 (_ BitVec 32))) (Intermediate!8400 (undefined!9212 Bool) (index!35970 (_ BitVec 32)) (x!66846 (_ BitVec 32))) (Undefined!8400) (MissingVacant!8400 (index!35971 (_ BitVec 32))) )
))
(declare-fun lt!356940 () SeekEntryResult!8400)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43458 (_ BitVec 32)) SeekEntryResult!8400)

(assert (=> b!799353 (= lt!356940 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356945 vacantBefore!23 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799354 () Bool)

(declare-fun res!543875 () Bool)

(declare-fun e!443292 () Bool)

(assert (=> b!799354 (=> (not res!543875) (not e!443292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43458 (_ BitVec 32)) Bool)

(assert (=> b!799354 (= res!543875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799355 () Bool)

(declare-fun res!543882 () Bool)

(assert (=> b!799355 (=> (not res!543882) (not e!443292))))

(declare-datatypes ((List!14772 0))(
  ( (Nil!14769) (Cons!14768 (h!15897 (_ BitVec 64)) (t!21087 List!14772)) )
))
(declare-fun arrayNoDuplicates!0 (array!43458 (_ BitVec 32) List!14772) Bool)

(assert (=> b!799355 (= res!543882 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14769))))

(declare-fun b!799356 () Bool)

(declare-fun res!543873 () Bool)

(declare-fun e!443289 () Bool)

(assert (=> b!799356 (=> (not res!543873) (not e!443289))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799356 (= res!543873 (validKeyInArray!0 k0!2044))))

(declare-fun b!799358 () Bool)

(declare-fun res!543876 () Bool)

(assert (=> b!799358 (=> (not res!543876) (not e!443289))))

(assert (=> b!799358 (= res!543876 (validKeyInArray!0 (select (arr!20809 a!3170) j!153)))))

(declare-fun b!799359 () Bool)

(declare-fun res!543874 () Bool)

(assert (=> b!799359 (=> (not res!543874) (not e!443289))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799359 (= res!543874 (and (= (size!21230 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21230 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21230 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799360 () Bool)

(declare-fun res!543877 () Bool)

(assert (=> b!799360 (=> (not res!543877) (not e!443292))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799360 (= res!543877 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21230 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20809 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21230 a!3170)) (= (select (arr!20809 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799361 () Bool)

(declare-fun e!443290 () Bool)

(assert (=> b!799361 (= e!443290 e!443294)))

(declare-fun res!543879 () Bool)

(assert (=> b!799361 (=> (not res!543879) (not e!443294))))

(assert (=> b!799361 (= res!543879 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356945 #b00000000000000000000000000000000) (bvslt lt!356945 (size!21230 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799361 (= lt!356945 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!799362 () Bool)

(assert (=> b!799362 (= e!443289 e!443292)))

(declare-fun res!543883 () Bool)

(assert (=> b!799362 (=> (not res!543883) (not e!443292))))

(declare-fun lt!356938 () SeekEntryResult!8400)

(assert (=> b!799362 (= res!543883 (or (= lt!356938 (MissingZero!8400 i!1163)) (= lt!356938 (MissingVacant!8400 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43458 (_ BitVec 32)) SeekEntryResult!8400)

(assert (=> b!799362 (= lt!356938 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799363 () Bool)

(declare-fun e!443291 () Bool)

(assert (=> b!799363 (= e!443291 e!443290)))

(declare-fun res!543878 () Bool)

(assert (=> b!799363 (=> (not res!543878) (not e!443290))))

(declare-fun lt!356939 () SeekEntryResult!8400)

(declare-fun lt!356944 () SeekEntryResult!8400)

(assert (=> b!799363 (= res!543878 (and (= lt!356939 lt!356944) (= lt!356944 (Found!8400 j!153)) (not (= (select (arr!20809 a!3170) index!1236) (select (arr!20809 a!3170) j!153)))))))

(assert (=> b!799363 (= lt!356944 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799363 (= lt!356939 (seekEntryOrOpen!0 (select (arr!20809 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!543884 () Bool)

(assert (=> start!68668 (=> (not res!543884) (not e!443289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68668 (= res!543884 (validMask!0 mask!3266))))

(assert (=> start!68668 e!443289))

(assert (=> start!68668 true))

(declare-fun array_inv!16605 (array!43458) Bool)

(assert (=> start!68668 (array_inv!16605 a!3170)))

(declare-fun b!799357 () Bool)

(assert (=> b!799357 (= e!443292 e!443291)))

(declare-fun res!543881 () Bool)

(assert (=> b!799357 (=> (not res!543881) (not e!443291))))

(declare-fun lt!356941 () SeekEntryResult!8400)

(declare-fun lt!356942 () array!43458)

(declare-fun lt!356943 () (_ BitVec 64))

(assert (=> b!799357 (= res!543881 (= lt!356941 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356943 lt!356942 mask!3266)))))

(assert (=> b!799357 (= lt!356941 (seekEntryOrOpen!0 lt!356943 lt!356942 mask!3266))))

(assert (=> b!799357 (= lt!356943 (select (store (arr!20809 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799357 (= lt!356942 (array!43459 (store (arr!20809 a!3170) i!1163 k0!2044) (size!21230 a!3170)))))

(declare-fun b!799364 () Bool)

(declare-fun res!543880 () Bool)

(assert (=> b!799364 (=> (not res!543880) (not e!443289))))

(declare-fun arrayContainsKey!0 (array!43458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799364 (= res!543880 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799365 () Bool)

(declare-fun res!543872 () Bool)

(assert (=> b!799365 (=> (not res!543872) (not e!443294))))

(assert (=> b!799365 (= res!543872 (= lt!356941 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356945 vacantAfter!23 lt!356943 lt!356942 mask!3266)))))

(assert (= (and start!68668 res!543884) b!799359))

(assert (= (and b!799359 res!543874) b!799358))

(assert (= (and b!799358 res!543876) b!799356))

(assert (= (and b!799356 res!543873) b!799364))

(assert (= (and b!799364 res!543880) b!799362))

(assert (= (and b!799362 res!543883) b!799354))

(assert (= (and b!799354 res!543875) b!799355))

(assert (= (and b!799355 res!543882) b!799360))

(assert (= (and b!799360 res!543877) b!799357))

(assert (= (and b!799357 res!543881) b!799363))

(assert (= (and b!799363 res!543878) b!799361))

(assert (= (and b!799361 res!543879) b!799365))

(assert (= (and b!799365 res!543872) b!799353))

(declare-fun m!740357 () Bool)

(assert (=> b!799362 m!740357))

(declare-fun m!740359 () Bool)

(assert (=> b!799353 m!740359))

(assert (=> b!799353 m!740359))

(declare-fun m!740361 () Bool)

(assert (=> b!799353 m!740361))

(declare-fun m!740363 () Bool)

(assert (=> b!799354 m!740363))

(declare-fun m!740365 () Bool)

(assert (=> b!799355 m!740365))

(declare-fun m!740367 () Bool)

(assert (=> b!799364 m!740367))

(declare-fun m!740369 () Bool)

(assert (=> start!68668 m!740369))

(declare-fun m!740371 () Bool)

(assert (=> start!68668 m!740371))

(declare-fun m!740373 () Bool)

(assert (=> b!799360 m!740373))

(declare-fun m!740375 () Bool)

(assert (=> b!799360 m!740375))

(declare-fun m!740377 () Bool)

(assert (=> b!799361 m!740377))

(declare-fun m!740379 () Bool)

(assert (=> b!799365 m!740379))

(assert (=> b!799358 m!740359))

(assert (=> b!799358 m!740359))

(declare-fun m!740381 () Bool)

(assert (=> b!799358 m!740381))

(declare-fun m!740383 () Bool)

(assert (=> b!799363 m!740383))

(assert (=> b!799363 m!740359))

(assert (=> b!799363 m!740359))

(declare-fun m!740385 () Bool)

(assert (=> b!799363 m!740385))

(assert (=> b!799363 m!740359))

(declare-fun m!740387 () Bool)

(assert (=> b!799363 m!740387))

(declare-fun m!740389 () Bool)

(assert (=> b!799357 m!740389))

(declare-fun m!740391 () Bool)

(assert (=> b!799357 m!740391))

(declare-fun m!740393 () Bool)

(assert (=> b!799357 m!740393))

(declare-fun m!740395 () Bool)

(assert (=> b!799357 m!740395))

(declare-fun m!740397 () Bool)

(assert (=> b!799356 m!740397))

(check-sat (not b!799357) (not b!799358) (not b!799353) (not b!799354) (not b!799356) (not b!799364) (not b!799363) (not b!799365) (not start!68668) (not b!799362) (not b!799361) (not b!799355))
(check-sat)
