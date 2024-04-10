; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68180 () Bool)

(assert start!68180)

(declare-fun b!792453 () Bool)

(declare-fun res!537050 () Bool)

(declare-fun e!440320 () Bool)

(assert (=> b!792453 (=> (not res!537050) (not e!440320))))

(declare-datatypes ((array!43015 0))(
  ( (array!43016 (arr!20589 (Array (_ BitVec 32) (_ BitVec 64))) (size!21010 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43015)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43015 (_ BitVec 32)) Bool)

(assert (=> b!792453 (= res!537050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792454 () Bool)

(declare-fun res!537048 () Bool)

(declare-fun e!440321 () Bool)

(assert (=> b!792454 (=> (not res!537048) (not e!440321))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792454 (= res!537048 (validKeyInArray!0 (select (arr!20589 a!3170) j!153)))))

(declare-fun b!792455 () Bool)

(declare-fun e!440319 () Bool)

(assert (=> b!792455 (= e!440320 e!440319)))

(declare-fun res!537044 () Bool)

(assert (=> b!792455 (=> res!537044 e!440319)))

(declare-datatypes ((List!14552 0))(
  ( (Nil!14549) (Cons!14548 (h!15677 (_ BitVec 64)) (t!20867 List!14552)) )
))
(declare-fun contains!4118 (List!14552 (_ BitVec 64)) Bool)

(assert (=> b!792455 (= res!537044 (contains!4118 Nil!14549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792456 () Bool)

(assert (=> b!792456 (= e!440319 (contains!4118 Nil!14549 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792457 () Bool)

(declare-fun res!537046 () Bool)

(assert (=> b!792457 (=> (not res!537046) (not e!440321))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792457 (= res!537046 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792458 () Bool)

(declare-fun res!537053 () Bool)

(assert (=> b!792458 (=> (not res!537053) (not e!440321))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792458 (= res!537053 (and (= (size!21010 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21010 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21010 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792459 () Bool)

(declare-fun res!537052 () Bool)

(assert (=> b!792459 (=> (not res!537052) (not e!440320))))

(declare-fun noDuplicate!1287 (List!14552) Bool)

(assert (=> b!792459 (= res!537052 (noDuplicate!1287 Nil!14549))))

(declare-fun b!792460 () Bool)

(declare-fun res!537051 () Bool)

(assert (=> b!792460 (=> (not res!537051) (not e!440321))))

(assert (=> b!792460 (= res!537051 (validKeyInArray!0 k!2044))))

(declare-fun res!537045 () Bool)

(assert (=> start!68180 (=> (not res!537045) (not e!440321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68180 (= res!537045 (validMask!0 mask!3266))))

(assert (=> start!68180 e!440321))

(assert (=> start!68180 true))

(declare-fun array_inv!16385 (array!43015) Bool)

(assert (=> start!68180 (array_inv!16385 a!3170)))

(declare-fun b!792461 () Bool)

(declare-fun res!537047 () Bool)

(assert (=> b!792461 (=> (not res!537047) (not e!440320))))

(assert (=> b!792461 (= res!537047 (and (bvsle #b00000000000000000000000000000000 (size!21010 a!3170)) (bvslt (size!21010 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792462 () Bool)

(assert (=> b!792462 (= e!440321 e!440320)))

(declare-fun res!537049 () Bool)

(assert (=> b!792462 (=> (not res!537049) (not e!440320))))

(declare-datatypes ((SeekEntryResult!8180 0))(
  ( (MissingZero!8180 (index!35088 (_ BitVec 32))) (Found!8180 (index!35089 (_ BitVec 32))) (Intermediate!8180 (undefined!8992 Bool) (index!35090 (_ BitVec 32)) (x!66042 (_ BitVec 32))) (Undefined!8180) (MissingVacant!8180 (index!35091 (_ BitVec 32))) )
))
(declare-fun lt!353486 () SeekEntryResult!8180)

(assert (=> b!792462 (= res!537049 (or (= lt!353486 (MissingZero!8180 i!1163)) (= lt!353486 (MissingVacant!8180 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43015 (_ BitVec 32)) SeekEntryResult!8180)

(assert (=> b!792462 (= lt!353486 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68180 res!537045) b!792458))

(assert (= (and b!792458 res!537053) b!792454))

(assert (= (and b!792454 res!537048) b!792460))

(assert (= (and b!792460 res!537051) b!792457))

(assert (= (and b!792457 res!537046) b!792462))

(assert (= (and b!792462 res!537049) b!792453))

(assert (= (and b!792453 res!537050) b!792461))

(assert (= (and b!792461 res!537047) b!792459))

(assert (= (and b!792459 res!537052) b!792455))

(assert (= (and b!792455 (not res!537044)) b!792456))

(declare-fun m!733025 () Bool)

(assert (=> b!792454 m!733025))

(assert (=> b!792454 m!733025))

(declare-fun m!733027 () Bool)

(assert (=> b!792454 m!733027))

(declare-fun m!733029 () Bool)

(assert (=> b!792462 m!733029))

(declare-fun m!733031 () Bool)

(assert (=> start!68180 m!733031))

(declare-fun m!733033 () Bool)

(assert (=> start!68180 m!733033))

(declare-fun m!733035 () Bool)

(assert (=> b!792455 m!733035))

(declare-fun m!733037 () Bool)

(assert (=> b!792460 m!733037))

(declare-fun m!733039 () Bool)

(assert (=> b!792457 m!733039))

(declare-fun m!733041 () Bool)

(assert (=> b!792453 m!733041))

(declare-fun m!733043 () Bool)

(assert (=> b!792456 m!733043))

(declare-fun m!733045 () Bool)

(assert (=> b!792459 m!733045))

(push 1)

(assert (not start!68180))

(assert (not b!792460))

(assert (not b!792453))

(assert (not b!792459))

(assert (not b!792462))

(assert (not b!792457))

(assert (not b!792456))

(assert (not b!792454))

(assert (not b!792455))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!792543 () Bool)

(declare-fun e!440365 () Bool)

(declare-fun e!440364 () Bool)

(assert (=> b!792543 (= e!440365 e!440364)))

(declare-fun c!88117 () Bool)

(assert (=> b!792543 (= c!88117 (validKeyInArray!0 (select (arr!20589 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792544 () Bool)

(declare-fun call!35340 () Bool)

(assert (=> b!792544 (= e!440364 call!35340)))

(declare-fun bm!35337 () Bool)

(assert (=> bm!35337 (= call!35340 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!792545 () Bool)

(declare-fun e!440366 () Bool)

(assert (=> b!792545 (= e!440364 e!440366)))

(declare-fun lt!353504 () (_ BitVec 64))

(assert (=> b!792545 (= lt!353504 (select (arr!20589 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27452 0))(
  ( (Unit!27453) )
))
(declare-fun lt!353502 () Unit!27452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43015 (_ BitVec 64) (_ BitVec 32)) Unit!27452)

(assert (=> b!792545 (= lt!353502 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353504 #b00000000000000000000000000000000))))

(assert (=> b!792545 (arrayContainsKey!0 a!3170 lt!353504 #b00000000000000000000000000000000)))

(declare-fun lt!353503 () Unit!27452)

(assert (=> b!792545 (= lt!353503 lt!353502)))

(declare-fun res!537131 () Bool)

(assert (=> b!792545 (= res!537131 (= (seekEntryOrOpen!0 (select (arr!20589 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8180 #b00000000000000000000000000000000)))))

(assert (=> b!792545 (=> (not res!537131) (not e!440366))))

(declare-fun b!792546 () Bool)

(assert (=> b!792546 (= e!440366 call!35340)))

(declare-fun d!103223 () Bool)

(declare-fun res!537130 () Bool)

(assert (=> d!103223 (=> res!537130 e!440365)))

(assert (=> d!103223 (= res!537130 (bvsge #b00000000000000000000000000000000 (size!21010 a!3170)))))

(assert (=> d!103223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440365)))

(assert (= (and d!103223 (not res!537130)) b!792543))

(assert (= (and b!792543 c!88117) b!792545))

(assert (= (and b!792543 (not c!88117)) b!792544))

(assert (= (and b!792545 res!537131) b!792546))

(assert (= (or b!792546 b!792544) bm!35337))

(declare-fun m!733101 () Bool)

(assert (=> b!792543 m!733101))

(assert (=> b!792543 m!733101))

(declare-fun m!733103 () Bool)

(assert (=> b!792543 m!733103))

(declare-fun m!733105 () Bool)

(assert (=> bm!35337 m!733105))

(assert (=> b!792545 m!733101))

(declare-fun m!733107 () Bool)

(assert (=> b!792545 m!733107))

(declare-fun m!733109 () Bool)

(assert (=> b!792545 m!733109))

(assert (=> b!792545 m!733101))

(declare-fun m!733111 () Bool)

(assert (=> b!792545 m!733111))

(assert (=> b!792453 d!103223))

(declare-fun d!103235 () Bool)

(declare-fun lt!353507 () Bool)

(declare-fun content!383 (List!14552) (Set (_ BitVec 64)))

(assert (=> d!103235 (= lt!353507 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!383 Nil!14549)))))

(declare-fun e!440375 () Bool)

(assert (=> d!103235 (= lt!353507 e!440375)))

(declare-fun res!537140 () Bool)

(assert (=> d!103235 (=> (not res!537140) (not e!440375))))

(assert (=> d!103235 (= res!537140 (is-Cons!14548 Nil!14549))))

(assert (=> d!103235 (= (contains!4118 Nil!14549 #b1000000000000000000000000000000000000000000000000000000000000000) lt!353507)))

(declare-fun b!792555 () Bool)

(declare-fun e!440376 () Bool)

(assert (=> b!792555 (= e!440375 e!440376)))

(declare-fun res!537141 () Bool)

(assert (=> b!792555 (=> res!537141 e!440376)))

(assert (=> b!792555 (= res!537141 (= (h!15677 Nil!14549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792556 () Bool)

(assert (=> b!792556 (= e!440376 (contains!4118 (t!20867 Nil!14549) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103235 res!537140) b!792555))

(assert (= (and b!792555 (not res!537141)) b!792556))

(declare-fun m!733113 () Bool)

(assert (=> d!103235 m!733113))

(declare-fun m!733115 () Bool)

(assert (=> d!103235 m!733115))

(declare-fun m!733117 () Bool)

(assert (=> b!792556 m!733117))

(assert (=> b!792456 d!103235))

(declare-fun d!103237 () Bool)

(assert (=> d!103237 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68180 d!103237))

(declare-fun d!103247 () Bool)

(assert (=> d!103247 (= (array_inv!16385 a!3170) (bvsge (size!21010 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68180 d!103247))

(declare-fun b!792611 () Bool)

(declare-fun e!440421 () SeekEntryResult!8180)

(declare-fun e!440419 () SeekEntryResult!8180)

(assert (=> b!792611 (= e!440421 e!440419)))

(declare-fun lt!353537 () (_ BitVec 64))

(declare-fun lt!353539 () SeekEntryResult!8180)

(assert (=> b!792611 (= lt!353537 (select (arr!20589 a!3170) (index!35090 lt!353539)))))

(declare-fun c!88131 () Bool)

(assert (=> b!792611 (= c!88131 (= lt!353537 k!2044))))

(declare-fun d!103249 () Bool)

(declare-fun lt!353538 () SeekEntryResult!8180)

(assert (=> d!103249 (and (or (is-Undefined!8180 lt!353538) (not (is-Found!8180 lt!353538)) (and (bvsge (index!35089 lt!353538) #b00000000000000000000000000000000) (bvslt (index!35089 lt!353538) (size!21010 a!3170)))) (or (is-Undefined!8180 lt!353538) (is-Found!8180 lt!353538) (not (is-MissingZero!8180 lt!353538)) (and (bvsge (index!35088 lt!353538) #b00000000000000000000000000000000) (bvslt (index!35088 lt!353538) (size!21010 a!3170)))) (or (is-Undefined!8180 lt!353538) (is-Found!8180 lt!353538) (is-MissingZero!8180 lt!353538) (not (is-MissingVacant!8180 lt!353538)) (and (bvsge (index!35091 lt!353538) #b00000000000000000000000000000000) (bvslt (index!35091 lt!353538) (size!21010 a!3170)))) (or (is-Undefined!8180 lt!353538) (ite (is-Found!8180 lt!353538) (= (select (arr!20589 a!3170) (index!35089 lt!353538)) k!2044) (ite (is-MissingZero!8180 lt!353538) (= (select (arr!20589 a!3170) (index!35088 lt!353538)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8180 lt!353538) (= (select (arr!20589 a!3170) (index!35091 lt!353538)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103249 (= lt!353538 e!440421)))

(declare-fun c!88130 () Bool)

(assert (=> d!103249 (= c!88130 (and (is-Intermediate!8180 lt!353539) (undefined!8992 lt!353539)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43015 (_ BitVec 32)) SeekEntryResult!8180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103249 (= lt!353539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103249 (validMask!0 mask!3266)))

(assert (=> d!103249 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!353538)))

(declare-fun b!792612 () Bool)

(assert (=> b!792612 (= e!440419 (Found!8180 (index!35090 lt!353539)))))

(declare-fun b!792613 () Bool)

(declare-fun e!440420 () SeekEntryResult!8180)

(assert (=> b!792613 (= e!440420 (MissingZero!8180 (index!35090 lt!353539)))))

(declare-fun b!792614 () Bool)

(assert (=> b!792614 (= e!440421 Undefined!8180)))

(declare-fun b!792615 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43015 (_ BitVec 32)) SeekEntryResult!8180)

(assert (=> b!792615 (= e!440420 (seekKeyOrZeroReturnVacant!0 (x!66042 lt!353539) (index!35090 lt!353539) (index!35090 lt!353539) k!2044 a!3170 mask!3266))))

(declare-fun b!792616 () Bool)

(declare-fun c!88132 () Bool)

(assert (=> b!792616 (= c!88132 (= lt!353537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!792616 (= e!440419 e!440420)))

(assert (= (and d!103249 c!88130) b!792614))

(assert (= (and d!103249 (not c!88130)) b!792611))

(assert (= (and b!792611 c!88131) b!792612))

(assert (= (and b!792611 (not c!88131)) b!792616))

(assert (= (and b!792616 c!88132) b!792613))

(assert (= (and b!792616 (not c!88132)) b!792615))

(declare-fun m!733161 () Bool)

(assert (=> b!792611 m!733161))

(declare-fun m!733163 () Bool)

(assert (=> d!103249 m!733163))

(declare-fun m!733165 () Bool)

(assert (=> d!103249 m!733165))

(declare-fun m!733167 () Bool)

(assert (=> d!103249 m!733167))

(assert (=> d!103249 m!733163))

(declare-fun m!733169 () Bool)

(assert (=> d!103249 m!733169))

(declare-fun m!733171 () Bool)

(assert (=> d!103249 m!733171))

(assert (=> d!103249 m!733031))

(declare-fun m!733173 () Bool)

(assert (=> b!792615 m!733173))

(assert (=> b!792462 d!103249))

(declare-fun d!103271 () Bool)

(declare-fun res!537176 () Bool)

(declare-fun e!440432 () Bool)

(assert (=> d!103271 (=> res!537176 e!440432)))

(assert (=> d!103271 (= res!537176 (= (select (arr!20589 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103271 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!440432)))

(declare-fun b!792633 () Bool)

(declare-fun e!440433 () Bool)

(assert (=> b!792633 (= e!440432 e!440433)))

(declare-fun res!537177 () Bool)

(assert (=> b!792633 (=> (not res!537177) (not e!440433))))

(assert (=> b!792633 (= res!537177 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21010 a!3170)))))

(declare-fun b!792634 () Bool)

(assert (=> b!792634 (= e!440433 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103271 (not res!537176)) b!792633))

(assert (= (and b!792633 res!537177) b!792634))

(assert (=> d!103271 m!733101))

(declare-fun m!733175 () Bool)

(assert (=> b!792634 m!733175))

(assert (=> b!792457 d!103271))

(declare-fun d!103273 () Bool)

(assert (=> d!103273 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792460 d!103273))

(declare-fun d!103275 () Bool)

(declare-fun lt!353546 () Bool)

(assert (=> d!103275 (= lt!353546 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!383 Nil!14549)))))

(declare-fun e!440434 () Bool)

(assert (=> d!103275 (= lt!353546 e!440434)))

(declare-fun res!537178 () Bool)

(assert (=> d!103275 (=> (not res!537178) (not e!440434))))

(assert (=> d!103275 (= res!537178 (is-Cons!14548 Nil!14549))))

(assert (=> d!103275 (= (contains!4118 Nil!14549 #b0000000000000000000000000000000000000000000000000000000000000000) lt!353546)))

(declare-fun b!792635 () Bool)

(declare-fun e!440435 () Bool)

(assert (=> b!792635 (= e!440434 e!440435)))

(declare-fun res!537179 () Bool)

(assert (=> b!792635 (=> res!537179 e!440435)))

(assert (=> b!792635 (= res!537179 (= (h!15677 Nil!14549) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792636 () Bool)

(assert (=> b!792636 (= e!440435 (contains!4118 (t!20867 Nil!14549) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103275 res!537178) b!792635))

(assert (= (and b!792635 (not res!537179)) b!792636))

(assert (=> d!103275 m!733113))

(declare-fun m!733177 () Bool)

(assert (=> d!103275 m!733177))

(declare-fun m!733179 () Bool)

(assert (=> b!792636 m!733179))

(assert (=> b!792455 d!103275))

(declare-fun d!103277 () Bool)

(declare-fun res!537184 () Bool)

(declare-fun e!440443 () Bool)

(assert (=> d!103277 (=> res!537184 e!440443)))

(assert (=> d!103277 (= res!537184 (is-Nil!14549 Nil!14549))))

(assert (=> d!103277 (= (noDuplicate!1287 Nil!14549) e!440443)))

(declare-fun b!792647 () Bool)

(declare-fun e!440444 () Bool)

(assert (=> b!792647 (= e!440443 e!440444)))

(declare-fun res!537185 () Bool)

(assert (=> b!792647 (=> (not res!537185) (not e!440444))))

(assert (=> b!792647 (= res!537185 (not (contains!4118 (t!20867 Nil!14549) (h!15677 Nil!14549))))))

(declare-fun b!792648 () Bool)

(assert (=> b!792648 (= e!440444 (noDuplicate!1287 (t!20867 Nil!14549)))))

(assert (= (and d!103277 (not res!537184)) b!792647))

(assert (= (and b!792647 res!537185) b!792648))

(declare-fun m!733195 () Bool)

(assert (=> b!792647 m!733195))

(declare-fun m!733197 () Bool)

(assert (=> b!792648 m!733197))

(assert (=> b!792459 d!103277))

(declare-fun d!103281 () Bool)

(assert (=> d!103281 (= (validKeyInArray!0 (select (arr!20589 a!3170) j!153)) (and (not (= (select (arr!20589 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20589 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792454 d!103281))

(push 1)

(assert (not b!792545))

(assert (not b!792648))

(assert (not b!792556))

(assert (not d!103235))

(assert (not b!792543))

(assert (not b!792615))

(assert (not b!792636))

(assert (not b!792647))

(assert (not b!792634))

(assert (not bm!35337))

(assert (not d!103275))

(assert (not d!103249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

