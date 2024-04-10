; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68184 () Bool)

(assert start!68184)

(declare-fun b!792513 () Bool)

(declare-fun res!537104 () Bool)

(declare-fun e!440343 () Bool)

(assert (=> b!792513 (=> (not res!537104) (not e!440343))))

(declare-datatypes ((List!14554 0))(
  ( (Nil!14551) (Cons!14550 (h!15679 (_ BitVec 64)) (t!20869 List!14554)) )
))
(declare-fun noDuplicate!1289 (List!14554) Bool)

(assert (=> b!792513 (= res!537104 (noDuplicate!1289 Nil!14551))))

(declare-fun res!537108 () Bool)

(declare-fun e!440344 () Bool)

(assert (=> start!68184 (=> (not res!537108) (not e!440344))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68184 (= res!537108 (validMask!0 mask!3266))))

(assert (=> start!68184 e!440344))

(assert (=> start!68184 true))

(declare-datatypes ((array!43019 0))(
  ( (array!43020 (arr!20591 (Array (_ BitVec 32) (_ BitVec 64))) (size!21012 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43019)

(declare-fun array_inv!16387 (array!43019) Bool)

(assert (=> start!68184 (array_inv!16387 a!3170)))

(declare-fun b!792514 () Bool)

(declare-fun res!537107 () Bool)

(assert (=> b!792514 (=> (not res!537107) (not e!440343))))

(assert (=> b!792514 (= res!537107 (and (bvsle #b00000000000000000000000000000000 (size!21012 a!3170)) (bvslt (size!21012 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792515 () Bool)

(declare-fun res!537105 () Bool)

(assert (=> b!792515 (=> (not res!537105) (not e!440344))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792515 (= res!537105 (validKeyInArray!0 (select (arr!20591 a!3170) j!153)))))

(declare-fun b!792516 () Bool)

(declare-fun e!440342 () Bool)

(assert (=> b!792516 (= e!440343 e!440342)))

(declare-fun res!537113 () Bool)

(assert (=> b!792516 (=> res!537113 e!440342)))

(declare-fun contains!4120 (List!14554 (_ BitVec 64)) Bool)

(assert (=> b!792516 (= res!537113 (contains!4120 Nil!14551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792517 () Bool)

(assert (=> b!792517 (= e!440342 (contains!4120 Nil!14551 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792518 () Bool)

(assert (=> b!792518 (= e!440344 e!440343)))

(declare-fun res!537109 () Bool)

(assert (=> b!792518 (=> (not res!537109) (not e!440343))))

(declare-datatypes ((SeekEntryResult!8182 0))(
  ( (MissingZero!8182 (index!35096 (_ BitVec 32))) (Found!8182 (index!35097 (_ BitVec 32))) (Intermediate!8182 (undefined!8994 Bool) (index!35098 (_ BitVec 32)) (x!66044 (_ BitVec 32))) (Undefined!8182) (MissingVacant!8182 (index!35099 (_ BitVec 32))) )
))
(declare-fun lt!353492 () SeekEntryResult!8182)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792518 (= res!537109 (or (= lt!353492 (MissingZero!8182 i!1163)) (= lt!353492 (MissingVacant!8182 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43019 (_ BitVec 32)) SeekEntryResult!8182)

(assert (=> b!792518 (= lt!353492 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792519 () Bool)

(declare-fun res!537110 () Bool)

(assert (=> b!792519 (=> (not res!537110) (not e!440344))))

(assert (=> b!792519 (= res!537110 (and (= (size!21012 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21012 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21012 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792520 () Bool)

(declare-fun res!537112 () Bool)

(assert (=> b!792520 (=> (not res!537112) (not e!440344))))

(assert (=> b!792520 (= res!537112 (validKeyInArray!0 k!2044))))

(declare-fun b!792521 () Bool)

(declare-fun res!537106 () Bool)

(assert (=> b!792521 (=> (not res!537106) (not e!440343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43019 (_ BitVec 32)) Bool)

(assert (=> b!792521 (= res!537106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792522 () Bool)

(declare-fun res!537111 () Bool)

(assert (=> b!792522 (=> (not res!537111) (not e!440344))))

(declare-fun arrayContainsKey!0 (array!43019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792522 (= res!537111 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68184 res!537108) b!792519))

(assert (= (and b!792519 res!537110) b!792515))

(assert (= (and b!792515 res!537105) b!792520))

(assert (= (and b!792520 res!537112) b!792522))

(assert (= (and b!792522 res!537111) b!792518))

(assert (= (and b!792518 res!537109) b!792521))

(assert (= (and b!792521 res!537106) b!792514))

(assert (= (and b!792514 res!537107) b!792513))

(assert (= (and b!792513 res!537104) b!792516))

(assert (= (and b!792516 (not res!537113)) b!792517))

(declare-fun m!733069 () Bool)

(assert (=> b!792522 m!733069))

(declare-fun m!733071 () Bool)

(assert (=> b!792515 m!733071))

(assert (=> b!792515 m!733071))

(declare-fun m!733073 () Bool)

(assert (=> b!792515 m!733073))

(declare-fun m!733075 () Bool)

(assert (=> b!792518 m!733075))

(declare-fun m!733077 () Bool)

(assert (=> b!792521 m!733077))

(declare-fun m!733079 () Bool)

(assert (=> b!792513 m!733079))

(declare-fun m!733081 () Bool)

(assert (=> b!792517 m!733081))

(declare-fun m!733083 () Bool)

(assert (=> b!792516 m!733083))

(declare-fun m!733085 () Bool)

(assert (=> start!68184 m!733085))

(declare-fun m!733087 () Bool)

(assert (=> start!68184 m!733087))

(declare-fun m!733089 () Bool)

(assert (=> b!792520 m!733089))

(push 1)

(assert (not b!792522))

(assert (not b!792518))

(assert (not b!792521))

(assert (not b!792513))

(assert (not b!792517))

(assert (not b!792515))

(assert (not start!68184))

(assert (not b!792520))

(assert (not b!792516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103225 () Bool)

(declare-fun res!537118 () Bool)

(declare-fun e!440350 () Bool)

(assert (=> d!103225 (=> res!537118 e!440350)))

(assert (=> d!103225 (= res!537118 (= (select (arr!20591 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103225 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!440350)))

(declare-fun b!792527 () Bool)

(declare-fun e!440351 () Bool)

(assert (=> b!792527 (= e!440350 e!440351)))

(declare-fun res!537119 () Bool)

(assert (=> b!792527 (=> (not res!537119) (not e!440351))))

(assert (=> b!792527 (= res!537119 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21012 a!3170)))))

(declare-fun b!792528 () Bool)

(assert (=> b!792528 (= e!440351 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103225 (not res!537118)) b!792527))

(assert (= (and b!792527 res!537119) b!792528))

(declare-fun m!733091 () Bool)

(assert (=> d!103225 m!733091))

(declare-fun m!733093 () Bool)

(assert (=> b!792528 m!733093))

(assert (=> b!792522 d!103225))

(declare-fun d!103231 () Bool)

(declare-fun lt!353501 () Bool)

(declare-fun content!382 (List!14554) (Set (_ BitVec 64)))

(assert (=> d!103231 (= lt!353501 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!382 Nil!14551)))))

(declare-fun e!440363 () Bool)

(assert (=> d!103231 (= lt!353501 e!440363)))

(declare-fun res!537129 () Bool)

(assert (=> d!103231 (=> (not res!537129) (not e!440363))))

(assert (=> d!103231 (= res!537129 (is-Cons!14550 Nil!14551))))

(assert (=> d!103231 (= (contains!4120 Nil!14551 #b1000000000000000000000000000000000000000000000000000000000000000) lt!353501)))

(declare-fun b!792541 () Bool)

(declare-fun e!440362 () Bool)

(assert (=> b!792541 (= e!440363 e!440362)))

(declare-fun res!537128 () Bool)

(assert (=> b!792541 (=> res!537128 e!440362)))

(assert (=> b!792541 (= res!537128 (= (h!15679 Nil!14551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792542 () Bool)

(assert (=> b!792542 (= e!440362 (contains!4120 (t!20869 Nil!14551) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103231 res!537129) b!792541))

(assert (= (and b!792541 (not res!537128)) b!792542))

(declare-fun m!733095 () Bool)

(assert (=> d!103231 m!733095))

(declare-fun m!733097 () Bool)

(assert (=> d!103231 m!733097))

(declare-fun m!733099 () Bool)

(assert (=> b!792542 m!733099))

(assert (=> b!792517 d!103231))

(declare-fun bm!35342 () Bool)

(declare-fun call!35345 () Bool)

(assert (=> bm!35342 (= call!35345 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103233 () Bool)

(declare-fun res!537146 () Bool)

(declare-fun e!440385 () Bool)

(assert (=> d!103233 (=> res!537146 e!440385)))

(assert (=> d!103233 (= res!537146 (bvsge #b00000000000000000000000000000000 (size!21012 a!3170)))))

(assert (=> d!103233 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440385)))

(declare-fun b!792569 () Bool)

(declare-fun e!440387 () Bool)

(assert (=> b!792569 (= e!440387 call!35345)))

(declare-fun b!792570 () Bool)

(assert (=> b!792570 (= e!440385 e!440387)))

(declare-fun c!88122 () Bool)

(assert (=> b!792570 (= c!88122 (validKeyInArray!0 (select (arr!20591 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792571 () Bool)

(declare-fun e!440386 () Bool)

(assert (=> b!792571 (= e!440387 e!440386)))

(declare-fun lt!353522 () (_ BitVec 64))

(assert (=> b!792571 (= lt!353522 (select (arr!20591 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27454 0))(
  ( (Unit!27455) )
))
(declare-fun lt!353520 () Unit!27454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43019 (_ BitVec 64) (_ BitVec 32)) Unit!27454)

(assert (=> b!792571 (= lt!353520 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353522 #b00000000000000000000000000000000))))

(assert (=> b!792571 (arrayContainsKey!0 a!3170 lt!353522 #b00000000000000000000000000000000)))

(declare-fun lt!353521 () Unit!27454)

(assert (=> b!792571 (= lt!353521 lt!353520)))

(declare-fun res!537147 () Bool)

(assert (=> b!792571 (= res!537147 (= (seekEntryOrOpen!0 (select (arr!20591 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8182 #b00000000000000000000000000000000)))))

(assert (=> b!792571 (=> (not res!537147) (not e!440386))))

(declare-fun b!792572 () Bool)

(assert (=> b!792572 (= e!440386 call!35345)))

(assert (= (and d!103233 (not res!537146)) b!792570))

(assert (= (and b!792570 c!88122) b!792571))

(assert (= (and b!792570 (not c!88122)) b!792569))

(assert (= (and b!792571 res!537147) b!792572))

(assert (= (or b!792572 b!792569) bm!35342))

(declare-fun m!733119 () Bool)

(assert (=> bm!35342 m!733119))

(assert (=> b!792570 m!733091))

(assert (=> b!792570 m!733091))

(declare-fun m!733121 () Bool)

(assert (=> b!792570 m!733121))

(assert (=> b!792571 m!733091))

(declare-fun m!733123 () Bool)

(assert (=> b!792571 m!733123))

(declare-fun m!733125 () Bool)

(assert (=> b!792571 m!733125))

(assert (=> b!792571 m!733091))

(declare-fun m!733127 () Bool)

(assert (=> b!792571 m!733127))

(assert (=> b!792521 d!103233))

(declare-fun d!103239 () Bool)

(declare-fun lt!353526 () Bool)

(assert (=> d!103239 (= lt!353526 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!382 Nil!14551)))))

(declare-fun e!440392 () Bool)

(assert (=> d!103239 (= lt!353526 e!440392)))

(declare-fun res!537151 () Bool)

(assert (=> d!103239 (=> (not res!537151) (not e!440392))))

(assert (=> d!103239 (= res!537151 (is-Cons!14550 Nil!14551))))

(assert (=> d!103239 (= (contains!4120 Nil!14551 #b0000000000000000000000000000000000000000000000000000000000000000) lt!353526)))

(declare-fun b!792577 () Bool)

(declare-fun e!440391 () Bool)

(assert (=> b!792577 (= e!440392 e!440391)))

(declare-fun res!537150 () Bool)

(assert (=> b!792577 (=> res!537150 e!440391)))

(assert (=> b!792577 (= res!537150 (= (h!15679 Nil!14551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!792578 () Bool)

(assert (=> b!792578 (= e!440391 (contains!4120 (t!20869 Nil!14551) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!103239 res!537151) b!792577))

(assert (= (and b!792577 (not res!537150)) b!792578))

(assert (=> d!103239 m!733095))

(declare-fun m!733129 () Bool)

(assert (=> d!103239 m!733129))

(declare-fun m!733131 () Bool)

(assert (=> b!792578 m!733131))

(assert (=> b!792516 d!103239))

(declare-fun d!103241 () Bool)

(assert (=> d!103241 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68184 d!103241))

(declare-fun d!103251 () Bool)

(assert (=> d!103251 (= (array_inv!16387 a!3170) (bvsge (size!21012 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68184 d!103251))

(declare-fun d!103253 () Bool)

(assert (=> d!103253 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792520 d!103253))

(declare-fun d!103255 () Bool)

(assert (=> d!103255 (= (validKeyInArray!0 (select (arr!20591 a!3170) j!153)) (and (not (= (select (arr!20591 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20591 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792515 d!103255))

(declare-fun b!792637 () Bool)

(declare-fun e!440438 () SeekEntryResult!8182)

(declare-fun lt!353549 () SeekEntryResult!8182)

(assert (=> b!792637 (= e!440438 (Found!8182 (index!35098 lt!353549)))))

(declare-fun b!792638 () Bool)

(declare-fun c!88139 () Bool)

(declare-fun lt!353547 () (_ BitVec 64))

(assert (=> b!792638 (= c!88139 (= lt!353547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440436 () SeekEntryResult!8182)

(assert (=> b!792638 (= e!440438 e!440436)))

(declare-fun b!792639 () Bool)

(assert (=> b!792639 (= e!440436 (MissingZero!8182 (index!35098 lt!353549)))))

(declare-fun b!792640 () Bool)

(declare-fun e!440437 () SeekEntryResult!8182)

(assert (=> b!792640 (= e!440437 e!440438)))

(assert (=> b!792640 (= lt!353547 (select (arr!20591 a!3170) (index!35098 lt!353549)))))

(declare-fun c!88140 () Bool)

(assert (=> b!792640 (= c!88140 (= lt!353547 k!2044))))

(declare-fun d!103257 () Bool)

(declare-fun lt!353548 () SeekEntryResult!8182)

(assert (=> d!103257 (and (or (is-Undefined!8182 lt!353548) (not (is-Found!8182 lt!353548)) (and (bvsge (index!35097 lt!353548) #b00000000000000000000000000000000) (bvslt (index!35097 lt!353548) (size!21012 a!3170)))) (or (is-Undefined!8182 lt!353548) (is-Found!8182 lt!353548) (not (is-MissingZero!8182 lt!353548)) (and (bvsge (index!35096 lt!353548) #b00000000000000000000000000000000) (bvslt (index!35096 lt!353548) (size!21012 a!3170)))) (or (is-Undefined!8182 lt!353548) (is-Found!8182 lt!353548) (is-MissingZero!8182 lt!353548) (not (is-MissingVacant!8182 lt!353548)) (and (bvsge (index!35099 lt!353548) #b00000000000000000000000000000000) (bvslt (index!35099 lt!353548) (size!21012 a!3170)))) (or (is-Undefined!8182 lt!353548) (ite (is-Found!8182 lt!353548) (= (select (arr!20591 a!3170) (index!35097 lt!353548)) k!2044) (ite (is-MissingZero!8182 lt!353548) (= (select (arr!20591 a!3170) (index!35096 lt!353548)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8182 lt!353548) (= (select (arr!20591 a!3170) (index!35099 lt!353548)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103257 (= lt!353548 e!440437)))

(declare-fun c!88141 () Bool)

(assert (=> d!103257 (= c!88141 (and (is-Intermediate!8182 lt!353549) (undefined!8994 lt!353549)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43019 (_ BitVec 32)) SeekEntryResult!8182)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103257 (= lt!353549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103257 (validMask!0 mask!3266)))

(assert (=> d!103257 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!353548)))

(declare-fun b!792641 () Bool)

(assert (=> b!792641 (= e!440437 Undefined!8182)))

(declare-fun b!792642 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43019 (_ BitVec 32)) SeekEntryResult!8182)

(assert (=> b!792642 (= e!440436 (seekKeyOrZeroReturnVacant!0 (x!66044 lt!353549) (index!35098 lt!353549) (index!35098 lt!353549) k!2044 a!3170 mask!3266))))

(assert (= (and d!103257 c!88141) b!792641))

(assert (= (and d!103257 (not c!88141)) b!792640))

(assert (= (and b!792640 c!88140) b!792637))

(assert (= (and b!792640 (not c!88140)) b!792638))

(assert (= (and b!792638 c!88139) b!792639))

(assert (= (and b!792638 (not c!88139)) b!792642))

(declare-fun m!733181 () Bool)

(assert (=> b!792640 m!733181))

(assert (=> d!103257 m!733085))

(declare-fun m!733183 () Bool)

(assert (=> d!103257 m!733183))

(declare-fun m!733185 () Bool)

(assert (=> d!103257 m!733185))

(declare-fun m!733187 () Bool)

(assert (=> d!103257 m!733187))

(declare-fun m!733189 () Bool)

(assert (=> d!103257 m!733189))

(declare-fun m!733191 () Bool)

(assert (=> d!103257 m!733191))

(assert (=> d!103257 m!733187))

(declare-fun m!733193 () Bool)

(assert (=> b!792642 m!733193))

(assert (=> b!792518 d!103257))

(declare-fun d!103279 () Bool)

(declare-fun res!537190 () Bool)

(declare-fun e!440449 () Bool)

(assert (=> d!103279 (=> res!537190 e!440449)))

(assert (=> d!103279 (= res!537190 (is-Nil!14551 Nil!14551))))

(assert (=> d!103279 (= (noDuplicate!1289 Nil!14551) e!440449)))

(declare-fun b!792653 () Bool)

(declare-fun e!440450 () Bool)

(assert (=> b!792653 (= e!440449 e!440450)))

(declare-fun res!537191 () Bool)

(assert (=> b!792653 (=> (not res!537191) (not e!440450))))

(assert (=> b!792653 (= res!537191 (not (contains!4120 (t!20869 Nil!14551) (h!15679 Nil!14551))))))

(declare-fun b!792654 () Bool)

(assert (=> b!792654 (= e!440450 (noDuplicate!1289 (t!20869 Nil!14551)))))

(assert (= (and d!103279 (not res!537190)) b!792653))

(assert (= (and b!792653 res!537191) b!792654))

(declare-fun m!733199 () Bool)

(assert (=> b!792653 m!733199))

(declare-fun m!733201 () Bool)

(assert (=> b!792654 m!733201))

(assert (=> b!792513 d!103279))

(push 1)

