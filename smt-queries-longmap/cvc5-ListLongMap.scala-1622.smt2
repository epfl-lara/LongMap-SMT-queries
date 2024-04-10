; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30458 () Bool)

(assert start!30458)

(declare-fun res!162348 () Bool)

(declare-fun e!191585 () Bool)

(assert (=> start!30458 (=> (not res!162348) (not e!191585))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30458 (= res!162348 (validMask!0 mask!3709))))

(assert (=> start!30458 e!191585))

(declare-datatypes ((array!15513 0))(
  ( (array!15514 (arr!7343 (Array (_ BitVec 32) (_ BitVec 64))) (size!7695 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15513)

(declare-fun array_inv!5306 (array!15513) Bool)

(assert (=> start!30458 (array_inv!5306 a!3293)))

(assert (=> start!30458 true))

(declare-fun b!304998 () Bool)

(declare-fun e!191586 () Bool)

(declare-fun e!191587 () Bool)

(assert (=> b!304998 (= e!191586 e!191587)))

(declare-fun res!162350 () Bool)

(assert (=> b!304998 (=> (not res!162350) (not e!191587))))

(declare-datatypes ((SeekEntryResult!2483 0))(
  ( (MissingZero!2483 (index!12108 (_ BitVec 32))) (Found!2483 (index!12109 (_ BitVec 32))) (Intermediate!2483 (undefined!3295 Bool) (index!12110 (_ BitVec 32)) (x!30365 (_ BitVec 32))) (Undefined!2483) (MissingVacant!2483 (index!12111 (_ BitVec 32))) )
))
(declare-fun lt!150577 () SeekEntryResult!2483)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!150578 () SeekEntryResult!2483)

(assert (=> b!304998 (= res!162350 (and (= lt!150577 lt!150578) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7343 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7343 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7343 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15513 (_ BitVec 32)) SeekEntryResult!2483)

(assert (=> b!304998 (= lt!150577 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304999 () Bool)

(declare-fun res!162351 () Bool)

(assert (=> b!304999 (=> (not res!162351) (not e!191585))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15513 (_ BitVec 32)) SeekEntryResult!2483)

(assert (=> b!304999 (= res!162351 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2483 i!1240)))))

(declare-fun b!305000 () Bool)

(declare-fun res!162347 () Bool)

(assert (=> b!305000 (=> (not res!162347) (not e!191586))))

(assert (=> b!305000 (= res!162347 (and (= (select (arr!7343 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7695 a!3293))))))

(declare-fun b!305001 () Bool)

(declare-fun res!162349 () Bool)

(assert (=> b!305001 (=> (not res!162349) (not e!191585))))

(declare-fun arrayContainsKey!0 (array!15513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305001 (= res!162349 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305002 () Bool)

(declare-fun res!162346 () Bool)

(assert (=> b!305002 (=> (not res!162346) (not e!191585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15513 (_ BitVec 32)) Bool)

(assert (=> b!305002 (= res!162346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305003 () Bool)

(declare-fun lt!150579 () (_ BitVec 32))

(assert (=> b!305003 (= e!191587 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (and (bvsge lt!150579 #b00000000000000000000000000000000) (bvslt lt!150579 (bvadd #b00000000000000000000000000000001 mask!3709))))))))

(assert (=> b!305003 (= lt!150577 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150579 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305003 (= lt!150579 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!305004 () Bool)

(assert (=> b!305004 (= e!191585 e!191586)))

(declare-fun res!162343 () Bool)

(assert (=> b!305004 (=> (not res!162343) (not e!191586))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305004 (= res!162343 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150578))))

(assert (=> b!305004 (= lt!150578 (Intermediate!2483 false resIndex!52 resX!52))))

(declare-fun b!305005 () Bool)

(declare-fun res!162344 () Bool)

(assert (=> b!305005 (=> (not res!162344) (not e!191585))))

(assert (=> b!305005 (= res!162344 (and (= (size!7695 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7695 a!3293))))))

(declare-fun b!305006 () Bool)

(declare-fun res!162345 () Bool)

(assert (=> b!305006 (=> (not res!162345) (not e!191585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305006 (= res!162345 (validKeyInArray!0 k!2441))))

(assert (= (and start!30458 res!162348) b!305005))

(assert (= (and b!305005 res!162344) b!305006))

(assert (= (and b!305006 res!162345) b!305001))

(assert (= (and b!305001 res!162349) b!304999))

(assert (= (and b!304999 res!162351) b!305002))

(assert (= (and b!305002 res!162346) b!305004))

(assert (= (and b!305004 res!162343) b!305000))

(assert (= (and b!305000 res!162347) b!304998))

(assert (= (and b!304998 res!162350) b!305003))

(declare-fun m!316073 () Bool)

(assert (=> b!304998 m!316073))

(declare-fun m!316075 () Bool)

(assert (=> b!304998 m!316075))

(declare-fun m!316077 () Bool)

(assert (=> b!305001 m!316077))

(declare-fun m!316079 () Bool)

(assert (=> b!305002 m!316079))

(declare-fun m!316081 () Bool)

(assert (=> b!304999 m!316081))

(declare-fun m!316083 () Bool)

(assert (=> b!305000 m!316083))

(declare-fun m!316085 () Bool)

(assert (=> start!30458 m!316085))

(declare-fun m!316087 () Bool)

(assert (=> start!30458 m!316087))

(declare-fun m!316089 () Bool)

(assert (=> b!305003 m!316089))

(declare-fun m!316091 () Bool)

(assert (=> b!305003 m!316091))

(declare-fun m!316093 () Bool)

(assert (=> b!305006 m!316093))

(declare-fun m!316095 () Bool)

(assert (=> b!305004 m!316095))

(assert (=> b!305004 m!316095))

(declare-fun m!316097 () Bool)

(assert (=> b!305004 m!316097))

(push 1)

(assert (not b!304999))

(assert (not b!305001))

(assert (not b!305006))

(assert (not start!30458))

(assert (not b!304998))

(assert (not b!305003))

(assert (not b!305004))

(assert (not b!305002))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!305106 () Bool)

(declare-fun e!191637 () SeekEntryResult!2483)

(assert (=> b!305106 (= e!191637 (Intermediate!2483 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!305107 () Bool)

(declare-fun e!191638 () SeekEntryResult!2483)

(assert (=> b!305107 (= e!191637 e!191638)))

(declare-fun c!48944 () Bool)

(declare-fun lt!150609 () (_ BitVec 64))

(assert (=> b!305107 (= c!48944 (or (= lt!150609 k!2441) (= (bvadd lt!150609 lt!150609) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305108 () Bool)

(declare-fun lt!150608 () SeekEntryResult!2483)

(assert (=> b!305108 (and (bvsge (index!12110 lt!150608) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150608) (size!7695 a!3293)))))

(declare-fun e!191639 () Bool)

(assert (=> b!305108 (= e!191639 (= (select (arr!7343 a!3293) (index!12110 lt!150608)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305109 () Bool)

(assert (=> b!305109 (= e!191638 (Intermediate!2483 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!68133 () Bool)

(declare-fun e!191640 () Bool)

(assert (=> d!68133 e!191640))

(declare-fun c!48945 () Bool)

(assert (=> d!68133 (= c!48945 (and (is-Intermediate!2483 lt!150608) (undefined!3295 lt!150608)))))

(assert (=> d!68133 (= lt!150608 e!191637)))

(declare-fun c!48943 () Bool)

(assert (=> d!68133 (= c!48943 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68133 (= lt!150609 (select (arr!7343 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68133 (validMask!0 mask!3709)))

(assert (=> d!68133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150608)))

(declare-fun b!305110 () Bool)

(assert (=> b!305110 (and (bvsge (index!12110 lt!150608) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150608) (size!7695 a!3293)))))

(declare-fun res!162421 () Bool)

(assert (=> b!305110 (= res!162421 (= (select (arr!7343 a!3293) (index!12110 lt!150608)) k!2441))))

(assert (=> b!305110 (=> res!162421 e!191639)))

(declare-fun e!191641 () Bool)

(assert (=> b!305110 (= e!191641 e!191639)))

(declare-fun b!305111 () Bool)

(assert (=> b!305111 (and (bvsge (index!12110 lt!150608) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150608) (size!7695 a!3293)))))

(declare-fun res!162423 () Bool)

(assert (=> b!305111 (= res!162423 (= (select (arr!7343 a!3293) (index!12110 lt!150608)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305111 (=> res!162423 e!191639)))

(declare-fun b!305112 () Bool)

(assert (=> b!305112 (= e!191638 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305113 () Bool)

(assert (=> b!305113 (= e!191640 e!191641)))

(declare-fun res!162422 () Bool)

(assert (=> b!305113 (= res!162422 (and (is-Intermediate!2483 lt!150608) (not (undefined!3295 lt!150608)) (bvslt (x!30365 lt!150608) #b01111111111111111111111111111110) (bvsge (x!30365 lt!150608) #b00000000000000000000000000000000) (bvsge (x!30365 lt!150608) #b00000000000000000000000000000000)))))

(assert (=> b!305113 (=> (not res!162422) (not e!191641))))

(declare-fun b!305114 () Bool)

(assert (=> b!305114 (= e!191640 (bvsge (x!30365 lt!150608) #b01111111111111111111111111111110))))

(assert (= (and d!68133 c!48943) b!305106))

(assert (= (and d!68133 (not c!48943)) b!305107))

(assert (= (and b!305107 c!48944) b!305109))

(assert (= (and b!305107 (not c!48944)) b!305112))

(assert (= (and d!68133 c!48945) b!305114))

(assert (= (and d!68133 (not c!48945)) b!305113))

(assert (= (and b!305113 res!162422) b!305110))

(assert (= (and b!305110 (not res!162421)) b!305111))

(assert (= (and b!305111 (not res!162423)) b!305108))

(assert (=> d!68133 m!316095))

(declare-fun m!316155 () Bool)

(assert (=> d!68133 m!316155))

(assert (=> d!68133 m!316085))

(declare-fun m!316157 () Bool)

(assert (=> b!305108 m!316157))

(assert (=> b!305112 m!316095))

(declare-fun m!316159 () Bool)

(assert (=> b!305112 m!316159))

(assert (=> b!305112 m!316159))

(declare-fun m!316161 () Bool)

(assert (=> b!305112 m!316161))

(assert (=> b!305110 m!316157))

(assert (=> b!305111 m!316157))

(assert (=> b!305004 d!68133))

(declare-fun d!68139 () Bool)

(declare-fun lt!150625 () (_ BitVec 32))

(declare-fun lt!150624 () (_ BitVec 32))

(assert (=> d!68139 (= lt!150625 (bvmul (bvxor lt!150624 (bvlshr lt!150624 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68139 (= lt!150624 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68139 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!162424 (let ((h!5337 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!30370 (bvmul (bvxor h!5337 (bvlshr h!5337 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!30370 (bvlshr x!30370 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!162424 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!162424 #b00000000000000000000000000000000))))))

(assert (=> d!68139 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!150625 (bvlshr lt!150625 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!305004 d!68139))

(declare-fun b!305196 () Bool)

(declare-fun e!191690 () SeekEntryResult!2483)

(declare-fun lt!150652 () SeekEntryResult!2483)

(assert (=> b!305196 (= e!191690 (MissingZero!2483 (index!12110 lt!150652)))))

(declare-fun b!305197 () Bool)

(declare-fun e!191689 () SeekEntryResult!2483)

(assert (=> b!305197 (= e!191689 (Found!2483 (index!12110 lt!150652)))))

(declare-fun b!305199 () Bool)

(declare-fun e!191688 () SeekEntryResult!2483)

(assert (=> b!305199 (= e!191688 Undefined!2483)))

(declare-fun b!305200 () Bool)

(assert (=> b!305200 (= e!191688 e!191689)))

(declare-fun lt!150650 () (_ BitVec 64))

(assert (=> b!305200 (= lt!150650 (select (arr!7343 a!3293) (index!12110 lt!150652)))))

(declare-fun c!48977 () Bool)

(assert (=> b!305200 (= c!48977 (= lt!150650 k!2441))))

(declare-fun b!305201 () Bool)

(declare-fun c!48976 () Bool)

(assert (=> b!305201 (= c!48976 (= lt!150650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305201 (= e!191689 e!191690)))

(declare-fun d!68141 () Bool)

(declare-fun lt!150651 () SeekEntryResult!2483)

(assert (=> d!68141 (and (or (is-Undefined!2483 lt!150651) (not (is-Found!2483 lt!150651)) (and (bvsge (index!12109 lt!150651) #b00000000000000000000000000000000) (bvslt (index!12109 lt!150651) (size!7695 a!3293)))) (or (is-Undefined!2483 lt!150651) (is-Found!2483 lt!150651) (not (is-MissingZero!2483 lt!150651)) (and (bvsge (index!12108 lt!150651) #b00000000000000000000000000000000) (bvslt (index!12108 lt!150651) (size!7695 a!3293)))) (or (is-Undefined!2483 lt!150651) (is-Found!2483 lt!150651) (is-MissingZero!2483 lt!150651) (not (is-MissingVacant!2483 lt!150651)) (and (bvsge (index!12111 lt!150651) #b00000000000000000000000000000000) (bvslt (index!12111 lt!150651) (size!7695 a!3293)))) (or (is-Undefined!2483 lt!150651) (ite (is-Found!2483 lt!150651) (= (select (arr!7343 a!3293) (index!12109 lt!150651)) k!2441) (ite (is-MissingZero!2483 lt!150651) (= (select (arr!7343 a!3293) (index!12108 lt!150651)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2483 lt!150651) (= (select (arr!7343 a!3293) (index!12111 lt!150651)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!68141 (= lt!150651 e!191688)))

(declare-fun c!48978 () Bool)

(assert (=> d!68141 (= c!48978 (and (is-Intermediate!2483 lt!150652) (undefined!3295 lt!150652)))))

(assert (=> d!68141 (= lt!150652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!68141 (validMask!0 mask!3709)))

(assert (=> d!68141 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!150651)))

(declare-fun b!305198 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15513 (_ BitVec 32)) SeekEntryResult!2483)

(assert (=> b!305198 (= e!191690 (seekKeyOrZeroReturnVacant!0 (x!30365 lt!150652) (index!12110 lt!150652) (index!12110 lt!150652) k!2441 a!3293 mask!3709))))

(assert (= (and d!68141 c!48978) b!305199))

(assert (= (and d!68141 (not c!48978)) b!305200))

(assert (= (and b!305200 c!48977) b!305197))

(assert (= (and b!305200 (not c!48977)) b!305201))

(assert (= (and b!305201 c!48976) b!305196))

(assert (= (and b!305201 (not c!48976)) b!305198))

(declare-fun m!316199 () Bool)

(assert (=> b!305200 m!316199))

(assert (=> d!68141 m!316085))

(declare-fun m!316201 () Bool)

(assert (=> d!68141 m!316201))

(assert (=> d!68141 m!316095))

(assert (=> d!68141 m!316095))

(assert (=> d!68141 m!316097))

(declare-fun m!316203 () Bool)

(assert (=> d!68141 m!316203))

(declare-fun m!316205 () Bool)

(assert (=> d!68141 m!316205))

(declare-fun m!316207 () Bool)

(assert (=> b!305198 m!316207))

(assert (=> b!304999 d!68141))

(declare-fun b!305202 () Bool)

(declare-fun e!191691 () SeekEntryResult!2483)

(assert (=> b!305202 (= e!191691 (Intermediate!2483 true index!1781 x!1427))))

(declare-fun b!305203 () Bool)

(declare-fun e!191692 () SeekEntryResult!2483)

(assert (=> b!305203 (= e!191691 e!191692)))

(declare-fun c!48980 () Bool)

(declare-fun lt!150654 () (_ BitVec 64))

(assert (=> b!305203 (= c!48980 (or (= lt!150654 k!2441) (= (bvadd lt!150654 lt!150654) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305204 () Bool)

(declare-fun lt!150653 () SeekEntryResult!2483)

(assert (=> b!305204 (and (bvsge (index!12110 lt!150653) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150653) (size!7695 a!3293)))))

(declare-fun e!191693 () Bool)

(assert (=> b!305204 (= e!191693 (= (select (arr!7343 a!3293) (index!12110 lt!150653)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305205 () Bool)

(assert (=> b!305205 (= e!191692 (Intermediate!2483 false index!1781 x!1427))))

(declare-fun d!68163 () Bool)

(declare-fun e!191694 () Bool)

(assert (=> d!68163 e!191694))

(declare-fun c!48981 () Bool)

(assert (=> d!68163 (= c!48981 (and (is-Intermediate!2483 lt!150653) (undefined!3295 lt!150653)))))

(assert (=> d!68163 (= lt!150653 e!191691)))

(declare-fun c!48979 () Bool)

(assert (=> d!68163 (= c!48979 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!68163 (= lt!150654 (select (arr!7343 a!3293) index!1781))))

(assert (=> d!68163 (validMask!0 mask!3709)))

(assert (=> d!68163 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150653)))

(declare-fun b!305206 () Bool)

(assert (=> b!305206 (and (bvsge (index!12110 lt!150653) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150653) (size!7695 a!3293)))))

(declare-fun res!162447 () Bool)

(assert (=> b!305206 (= res!162447 (= (select (arr!7343 a!3293) (index!12110 lt!150653)) k!2441))))

(assert (=> b!305206 (=> res!162447 e!191693)))

(declare-fun e!191695 () Bool)

(assert (=> b!305206 (= e!191695 e!191693)))

(declare-fun b!305207 () Bool)

(assert (=> b!305207 (and (bvsge (index!12110 lt!150653) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150653) (size!7695 a!3293)))))

(declare-fun res!162449 () Bool)

(assert (=> b!305207 (= res!162449 (= (select (arr!7343 a!3293) (index!12110 lt!150653)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305207 (=> res!162449 e!191693)))

(declare-fun b!305208 () Bool)

(assert (=> b!305208 (= e!191692 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305209 () Bool)

(assert (=> b!305209 (= e!191694 e!191695)))

(declare-fun res!162448 () Bool)

(assert (=> b!305209 (= res!162448 (and (is-Intermediate!2483 lt!150653) (not (undefined!3295 lt!150653)) (bvslt (x!30365 lt!150653) #b01111111111111111111111111111110) (bvsge (x!30365 lt!150653) #b00000000000000000000000000000000) (bvsge (x!30365 lt!150653) x!1427)))))

(assert (=> b!305209 (=> (not res!162448) (not e!191695))))

(declare-fun b!305210 () Bool)

(assert (=> b!305210 (= e!191694 (bvsge (x!30365 lt!150653) #b01111111111111111111111111111110))))

(assert (= (and d!68163 c!48979) b!305202))

(assert (= (and d!68163 (not c!48979)) b!305203))

(assert (= (and b!305203 c!48980) b!305205))

(assert (= (and b!305203 (not c!48980)) b!305208))

(assert (= (and d!68163 c!48981) b!305210))

(assert (= (and d!68163 (not c!48981)) b!305209))

(assert (= (and b!305209 res!162448) b!305206))

(assert (= (and b!305206 (not res!162447)) b!305207))

(assert (= (and b!305207 (not res!162449)) b!305204))

(assert (=> d!68163 m!316073))

(assert (=> d!68163 m!316085))

(declare-fun m!316209 () Bool)

(assert (=> b!305204 m!316209))

(assert (=> b!305208 m!316091))

(assert (=> b!305208 m!316091))

(declare-fun m!316211 () Bool)

(assert (=> b!305208 m!316211))

(assert (=> b!305206 m!316209))

(assert (=> b!305207 m!316209))

(assert (=> b!304998 d!68163))

(declare-fun b!305219 () Bool)

(declare-fun e!191702 () SeekEntryResult!2483)

(assert (=> b!305219 (= e!191702 (Intermediate!2483 true lt!150579 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!305220 () Bool)

(declare-fun e!191703 () SeekEntryResult!2483)

(assert (=> b!305220 (= e!191702 e!191703)))

(declare-fun c!48985 () Bool)

(declare-fun lt!150662 () (_ BitVec 64))

(assert (=> b!305220 (= c!48985 (or (= lt!150662 k!2441) (= (bvadd lt!150662 lt!150662) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305221 () Bool)

(declare-fun lt!150661 () SeekEntryResult!2483)

(assert (=> b!305221 (and (bvsge (index!12110 lt!150661) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150661) (size!7695 a!3293)))))

(declare-fun e!191704 () Bool)

(assert (=> b!305221 (= e!191704 (= (select (arr!7343 a!3293) (index!12110 lt!150661)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!305222 () Bool)

(assert (=> b!305222 (= e!191703 (Intermediate!2483 false lt!150579 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!68165 () Bool)

(declare-fun e!191705 () Bool)

(assert (=> d!68165 e!191705))

(declare-fun c!48986 () Bool)

(assert (=> d!68165 (= c!48986 (and (is-Intermediate!2483 lt!150661) (undefined!3295 lt!150661)))))

(assert (=> d!68165 (= lt!150661 e!191702)))

(declare-fun c!48984 () Bool)

(assert (=> d!68165 (= c!48984 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!68165 (= lt!150662 (select (arr!7343 a!3293) lt!150579))))

(assert (=> d!68165 (validMask!0 mask!3709)))

(assert (=> d!68165 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!150579 k!2441 a!3293 mask!3709) lt!150661)))

(declare-fun b!305223 () Bool)

(assert (=> b!305223 (and (bvsge (index!12110 lt!150661) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150661) (size!7695 a!3293)))))

(declare-fun res!162454 () Bool)

(assert (=> b!305223 (= res!162454 (= (select (arr!7343 a!3293) (index!12110 lt!150661)) k!2441))))

(assert (=> b!305223 (=> res!162454 e!191704)))

(declare-fun e!191706 () Bool)

(assert (=> b!305223 (= e!191706 e!191704)))

(declare-fun b!305224 () Bool)

(assert (=> b!305224 (and (bvsge (index!12110 lt!150661) #b00000000000000000000000000000000) (bvslt (index!12110 lt!150661) (size!7695 a!3293)))))

(declare-fun res!162456 () Bool)

(assert (=> b!305224 (= res!162456 (= (select (arr!7343 a!3293) (index!12110 lt!150661)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!305224 (=> res!162456 e!191704)))

(declare-fun b!305225 () Bool)

(assert (=> b!305225 (= e!191703 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!150579 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!305226 () Bool)

(assert (=> b!305226 (= e!191705 e!191706)))

(declare-fun res!162455 () Bool)

(assert (=> b!305226 (= res!162455 (and (is-Intermediate!2483 lt!150661) (not (undefined!3295 lt!150661)) (bvslt (x!30365 lt!150661) #b01111111111111111111111111111110) (bvsge (x!30365 lt!150661) #b00000000000000000000000000000000) (bvsge (x!30365 lt!150661) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!305226 (=> (not res!162455) (not e!191706))))

(declare-fun b!305227 () Bool)

(assert (=> b!305227 (= e!191705 (bvsge (x!30365 lt!150661) #b01111111111111111111111111111110))))

(assert (= (and d!68165 c!48984) b!305219))

(assert (= (and d!68165 (not c!48984)) b!305220))

(assert (= (and b!305220 c!48985) b!305222))

(assert (= (and b!305220 (not c!48985)) b!305225))

(assert (= (and d!68165 c!48986) b!305227))

(assert (= (and d!68165 (not c!48986)) b!305226))

(assert (= (and b!305226 res!162455) b!305223))

(assert (= (and b!305223 (not res!162454)) b!305224))

(assert (= (and b!305224 (not res!162456)) b!305221))

(declare-fun m!316213 () Bool)

(assert (=> d!68165 m!316213))

(assert (=> d!68165 m!316085))

(declare-fun m!316215 () Bool)

(assert (=> b!305221 m!316215))

(declare-fun m!316217 () Bool)

(assert (=> b!305225 m!316217))

(assert (=> b!305225 m!316217))

(declare-fun m!316219 () Bool)

(assert (=> b!305225 m!316219))

(assert (=> b!305223 m!316215))

(assert (=> b!305224 m!316215))

(assert (=> b!305003 d!68165))

(declare-fun d!68167 () Bool)

(declare-fun lt!150670 () (_ BitVec 32))

(assert (=> d!68167 (and (bvsge lt!150670 #b00000000000000000000000000000000) (bvslt lt!150670 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68167 (= lt!150670 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68167 (validMask!0 mask!3709)))

(assert (=> d!68167 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!150670)))

(declare-fun bs!10743 () Bool)

(assert (= bs!10743 d!68167))

(declare-fun m!316231 () Bool)

(assert (=> bs!10743 m!316231))

(assert (=> bs!10743 m!316085))

(assert (=> b!305003 d!68167))

(declare-fun b!305276 () Bool)

(declare-fun e!191736 () Bool)

(declare-fun call!25906 () Bool)

(assert (=> b!305276 (= e!191736 call!25906)))

(declare-fun b!305277 () Bool)

(declare-fun e!191737 () Bool)

(declare-fun e!191735 () Bool)

(assert (=> b!305277 (= e!191737 e!191735)))

(declare-fun c!49005 () Bool)

(assert (=> b!305277 (= c!49005 (validKeyInArray!0 (select (arr!7343 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68171 () Bool)

(declare-fun res!162470 () Bool)

(assert (=> d!68171 (=> res!162470 e!191737)))

(assert (=> d!68171 (= res!162470 (bvsge #b00000000000000000000000000000000 (size!7695 a!3293)))))

(assert (=> d!68171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!191737)))

(declare-fun bm!25903 () Bool)

(assert (=> bm!25903 (= call!25906 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!305278 () Bool)

(assert (=> b!305278 (= e!191735 e!191736)))

(declare-fun lt!150697 () (_ BitVec 64))

(assert (=> b!305278 (= lt!150697 (select (arr!7343 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9397 0))(
  ( (Unit!9398) )
))
(declare-fun lt!150696 () Unit!9397)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15513 (_ BitVec 64) (_ BitVec 32)) Unit!9397)

(assert (=> b!305278 (= lt!150696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!150697 #b00000000000000000000000000000000))))

(assert (=> b!305278 (arrayContainsKey!0 a!3293 lt!150697 #b00000000000000000000000000000000)))

(declare-fun lt!150695 () Unit!9397)

(assert (=> b!305278 (= lt!150695 lt!150696)))

(declare-fun res!162471 () Bool)

(assert (=> b!305278 (= res!162471 (= (seekEntryOrOpen!0 (select (arr!7343 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2483 #b00000000000000000000000000000000)))))

(assert (=> b!305278 (=> (not res!162471) (not e!191736))))

(declare-fun b!305279 () Bool)

(assert (=> b!305279 (= e!191735 call!25906)))

(assert (= (and d!68171 (not res!162470)) b!305277))

(assert (= (and b!305277 c!49005) b!305278))

(assert (= (and b!305277 (not c!49005)) b!305279))

(assert (= (and b!305278 res!162471) b!305276))

(assert (= (or b!305276 b!305279) bm!25903))

(declare-fun m!316261 () Bool)

(assert (=> b!305277 m!316261))

(assert (=> b!305277 m!316261))

(declare-fun m!316263 () Bool)

(assert (=> b!305277 m!316263))

(declare-fun m!316265 () Bool)

(assert (=> bm!25903 m!316265))

(assert (=> b!305278 m!316261))

(declare-fun m!316267 () Bool)

(assert (=> b!305278 m!316267))

(declare-fun m!316269 () Bool)

(assert (=> b!305278 m!316269))

(assert (=> b!305278 m!316261))

(declare-fun m!316271 () Bool)

(assert (=> b!305278 m!316271))

(assert (=> b!305002 d!68171))

(declare-fun d!68183 () Bool)

(assert (=> d!68183 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!305006 d!68183))

(declare-fun d!68185 () Bool)

(declare-fun res!162476 () Bool)

(declare-fun e!191742 () Bool)

(assert (=> d!68185 (=> res!162476 e!191742)))

(assert (=> d!68185 (= res!162476 (= (select (arr!7343 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!68185 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!191742)))

(declare-fun b!305284 () Bool)

(declare-fun e!191743 () Bool)

(assert (=> b!305284 (= e!191742 e!191743)))

(declare-fun res!162477 () Bool)

(assert (=> b!305284 (=> (not res!162477) (not e!191743))))

(assert (=> b!305284 (= res!162477 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7695 a!3293)))))

(declare-fun b!305285 () Bool)

(assert (=> b!305285 (= e!191743 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68185 (not res!162476)) b!305284))

(assert (= (and b!305284 res!162477) b!305285))

(assert (=> d!68185 m!316261))

(declare-fun m!316273 () Bool)

(assert (=> b!305285 m!316273))

(assert (=> b!305001 d!68185))

(declare-fun d!68187 () Bool)

(assert (=> d!68187 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30458 d!68187))

(declare-fun d!68191 () Bool)

(assert (=> d!68191 (= (array_inv!5306 a!3293) (bvsge (size!7695 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30458 d!68191))

(push 1)

(assert (not b!305225))

(assert (not d!68133))

(assert (not d!68141))

(assert (not b!305277))

(assert (not d!68163))

(assert (not bm!25903))

(assert (not d!68167))

(assert (not d!68165))

(assert (not b!305278))

(assert (not b!305285))

(assert (not b!305208))

(assert (not b!305198))

(assert (not b!305112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

