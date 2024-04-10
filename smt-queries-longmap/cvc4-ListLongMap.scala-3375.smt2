; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46486 () Bool)

(assert start!46486)

(declare-fun b!513979 () Bool)

(declare-fun res!314098 () Bool)

(declare-fun e!300122 () Bool)

(assert (=> b!513979 (=> (not res!314098) (not e!300122))))

(declare-datatypes ((array!32969 0))(
  ( (array!32970 (arr!15857 (Array (_ BitVec 32) (_ BitVec 64))) (size!16221 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32969)

(declare-datatypes ((List!10015 0))(
  ( (Nil!10012) (Cons!10011 (h!10900 (_ BitVec 64)) (t!16243 List!10015)) )
))
(declare-fun arrayNoDuplicates!0 (array!32969 (_ BitVec 32) List!10015) Bool)

(assert (=> b!513979 (= res!314098 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10012))))

(declare-fun res!314093 () Bool)

(declare-fun e!300124 () Bool)

(assert (=> start!46486 (=> (not res!314093) (not e!300124))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46486 (= res!314093 (validMask!0 mask!3524))))

(assert (=> start!46486 e!300124))

(assert (=> start!46486 true))

(declare-fun array_inv!11653 (array!32969) Bool)

(assert (=> start!46486 (array_inv!11653 a!3235)))

(declare-fun b!513980 () Bool)

(assert (=> b!513980 (= e!300124 e!300122)))

(declare-fun res!314102 () Bool)

(assert (=> b!513980 (=> (not res!314102) (not e!300122))))

(declare-datatypes ((SeekEntryResult!4324 0))(
  ( (MissingZero!4324 (index!19484 (_ BitVec 32))) (Found!4324 (index!19485 (_ BitVec 32))) (Intermediate!4324 (undefined!5136 Bool) (index!19486 (_ BitVec 32)) (x!48437 (_ BitVec 32))) (Undefined!4324) (MissingVacant!4324 (index!19487 (_ BitVec 32))) )
))
(declare-fun lt!235310 () SeekEntryResult!4324)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513980 (= res!314102 (or (= lt!235310 (MissingZero!4324 i!1204)) (= lt!235310 (MissingVacant!4324 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32969 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!513980 (= lt!235310 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513981 () Bool)

(declare-fun res!314100 () Bool)

(declare-fun e!300126 () Bool)

(assert (=> b!513981 (=> res!314100 e!300126)))

(declare-fun lt!235308 () SeekEntryResult!4324)

(assert (=> b!513981 (= res!314100 (or (undefined!5136 lt!235308) (not (is-Intermediate!4324 lt!235308))))))

(declare-fun b!513982 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513982 (= e!300126 (or (= (select (arr!15857 a!3235) (index!19486 lt!235308)) (select (arr!15857 a!3235) j!176)) (= (select (arr!15857 a!3235) (index!19486 lt!235308)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19486 lt!235308) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235308) (size!16221 a!3235)))))))

(assert (=> b!513982 (bvslt (x!48437 lt!235308) #b01111111111111111111111111111110)))

(declare-fun b!513983 () Bool)

(declare-fun res!314101 () Bool)

(assert (=> b!513983 (=> (not res!314101) (not e!300124))))

(assert (=> b!513983 (= res!314101 (and (= (size!16221 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16221 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16221 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513984 () Bool)

(declare-fun res!314092 () Bool)

(assert (=> b!513984 (=> (not res!314092) (not e!300124))))

(declare-fun arrayContainsKey!0 (array!32969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513984 (= res!314092 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513985 () Bool)

(assert (=> b!513985 (= e!300122 (not e!300126))))

(declare-fun res!314096 () Bool)

(assert (=> b!513985 (=> res!314096 e!300126)))

(declare-fun lt!235311 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32969 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!513985 (= res!314096 (= lt!235308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235311 (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)) mask!3524)))))

(declare-fun lt!235309 () (_ BitVec 32))

(assert (=> b!513985 (= lt!235308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235309 (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513985 (= lt!235311 (toIndex!0 (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513985 (= lt!235309 (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524))))

(declare-fun e!300125 () Bool)

(assert (=> b!513985 e!300125))

(declare-fun res!314095 () Bool)

(assert (=> b!513985 (=> (not res!314095) (not e!300125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32969 (_ BitVec 32)) Bool)

(assert (=> b!513985 (= res!314095 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15906 0))(
  ( (Unit!15907) )
))
(declare-fun lt!235312 () Unit!15906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15906)

(assert (=> b!513985 (= lt!235312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513986 () Bool)

(declare-fun res!314094 () Bool)

(assert (=> b!513986 (=> (not res!314094) (not e!300124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513986 (= res!314094 (validKeyInArray!0 k!2280))))

(declare-fun b!513987 () Bool)

(assert (=> b!513987 (= e!300125 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) (Found!4324 j!176)))))

(declare-fun b!513988 () Bool)

(declare-fun res!314099 () Bool)

(assert (=> b!513988 (=> (not res!314099) (not e!300122))))

(assert (=> b!513988 (= res!314099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513989 () Bool)

(declare-fun res!314097 () Bool)

(assert (=> b!513989 (=> (not res!314097) (not e!300124))))

(assert (=> b!513989 (= res!314097 (validKeyInArray!0 (select (arr!15857 a!3235) j!176)))))

(assert (= (and start!46486 res!314093) b!513983))

(assert (= (and b!513983 res!314101) b!513989))

(assert (= (and b!513989 res!314097) b!513986))

(assert (= (and b!513986 res!314094) b!513984))

(assert (= (and b!513984 res!314092) b!513980))

(assert (= (and b!513980 res!314102) b!513988))

(assert (= (and b!513988 res!314099) b!513979))

(assert (= (and b!513979 res!314098) b!513985))

(assert (= (and b!513985 res!314095) b!513987))

(assert (= (and b!513985 (not res!314096)) b!513981))

(assert (= (and b!513981 (not res!314100)) b!513982))

(declare-fun m!495487 () Bool)

(assert (=> b!513980 m!495487))

(declare-fun m!495489 () Bool)

(assert (=> b!513988 m!495489))

(declare-fun m!495491 () Bool)

(assert (=> b!513987 m!495491))

(assert (=> b!513987 m!495491))

(declare-fun m!495493 () Bool)

(assert (=> b!513987 m!495493))

(declare-fun m!495495 () Bool)

(assert (=> b!513982 m!495495))

(assert (=> b!513982 m!495491))

(declare-fun m!495497 () Bool)

(assert (=> b!513979 m!495497))

(declare-fun m!495499 () Bool)

(assert (=> start!46486 m!495499))

(declare-fun m!495501 () Bool)

(assert (=> start!46486 m!495501))

(declare-fun m!495503 () Bool)

(assert (=> b!513986 m!495503))

(declare-fun m!495505 () Bool)

(assert (=> b!513985 m!495505))

(declare-fun m!495507 () Bool)

(assert (=> b!513985 m!495507))

(declare-fun m!495509 () Bool)

(assert (=> b!513985 m!495509))

(assert (=> b!513985 m!495509))

(declare-fun m!495511 () Bool)

(assert (=> b!513985 m!495511))

(assert (=> b!513985 m!495491))

(declare-fun m!495513 () Bool)

(assert (=> b!513985 m!495513))

(assert (=> b!513985 m!495491))

(declare-fun m!495515 () Bool)

(assert (=> b!513985 m!495515))

(assert (=> b!513985 m!495491))

(declare-fun m!495517 () Bool)

(assert (=> b!513985 m!495517))

(assert (=> b!513985 m!495509))

(declare-fun m!495519 () Bool)

(assert (=> b!513985 m!495519))

(declare-fun m!495521 () Bool)

(assert (=> b!513984 m!495521))

(assert (=> b!513989 m!495491))

(assert (=> b!513989 m!495491))

(declare-fun m!495523 () Bool)

(assert (=> b!513989 m!495523))

(push 1)

(assert (not b!513988))

(assert (not b!513980))

(assert (not b!513984))

(assert (not b!513979))

(assert (not b!513986))

(assert (not b!513987))

(assert (not b!513985))

(assert (not start!46486))

(assert (not b!513989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!514071 () Bool)

(declare-fun e!300182 () SeekEntryResult!4324)

(assert (=> b!514071 (= e!300182 Undefined!4324)))

(declare-fun d!79281 () Bool)

(declare-fun lt!235356 () SeekEntryResult!4324)

(assert (=> d!79281 (and (or (is-Undefined!4324 lt!235356) (not (is-Found!4324 lt!235356)) (and (bvsge (index!19485 lt!235356) #b00000000000000000000000000000000) (bvslt (index!19485 lt!235356) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235356) (is-Found!4324 lt!235356) (not (is-MissingZero!4324 lt!235356)) (and (bvsge (index!19484 lt!235356) #b00000000000000000000000000000000) (bvslt (index!19484 lt!235356) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235356) (is-Found!4324 lt!235356) (is-MissingZero!4324 lt!235356) (not (is-MissingVacant!4324 lt!235356)) (and (bvsge (index!19487 lt!235356) #b00000000000000000000000000000000) (bvslt (index!19487 lt!235356) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235356) (ite (is-Found!4324 lt!235356) (= (select (arr!15857 a!3235) (index!19485 lt!235356)) (select (arr!15857 a!3235) j!176)) (ite (is-MissingZero!4324 lt!235356) (= (select (arr!15857 a!3235) (index!19484 lt!235356)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4324 lt!235356) (= (select (arr!15857 a!3235) (index!19487 lt!235356)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79281 (= lt!235356 e!300182)))

(declare-fun c!60256 () Bool)

(declare-fun lt!235357 () SeekEntryResult!4324)

(assert (=> d!79281 (= c!60256 (and (is-Intermediate!4324 lt!235357) (undefined!5136 lt!235357)))))

(assert (=> d!79281 (= lt!235357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79281 (validMask!0 mask!3524)))

(assert (=> d!79281 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) lt!235356)))

(declare-fun b!514072 () Bool)

(declare-fun e!300183 () SeekEntryResult!4324)

(assert (=> b!514072 (= e!300182 e!300183)))

(declare-fun lt!235355 () (_ BitVec 64))

(assert (=> b!514072 (= lt!235355 (select (arr!15857 a!3235) (index!19486 lt!235357)))))

(declare-fun c!60255 () Bool)

(assert (=> b!514072 (= c!60255 (= lt!235355 (select (arr!15857 a!3235) j!176)))))

(declare-fun b!514073 () Bool)

(assert (=> b!514073 (= e!300183 (Found!4324 (index!19486 lt!235357)))))

(declare-fun b!514074 () Bool)

(declare-fun c!60257 () Bool)

(assert (=> b!514074 (= c!60257 (= lt!235355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300181 () SeekEntryResult!4324)

(assert (=> b!514074 (= e!300183 e!300181)))

(declare-fun b!514075 () Bool)

(assert (=> b!514075 (= e!300181 (MissingZero!4324 (index!19486 lt!235357)))))

(declare-fun b!514076 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32969 (_ BitVec 32)) SeekEntryResult!4324)

(assert (=> b!514076 (= e!300181 (seekKeyOrZeroReturnVacant!0 (x!48437 lt!235357) (index!19486 lt!235357) (index!19486 lt!235357) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79281 c!60256) b!514071))

(assert (= (and d!79281 (not c!60256)) b!514072))

(assert (= (and b!514072 c!60255) b!514073))

(assert (= (and b!514072 (not c!60255)) b!514074))

(assert (= (and b!514074 c!60257) b!514075))

(assert (= (and b!514074 (not c!60257)) b!514076))

(declare-fun m!495581 () Bool)

(assert (=> d!79281 m!495581))

(assert (=> d!79281 m!495491))

(assert (=> d!79281 m!495513))

(assert (=> d!79281 m!495499))

(declare-fun m!495583 () Bool)

(assert (=> d!79281 m!495583))

(assert (=> d!79281 m!495513))

(assert (=> d!79281 m!495491))

(declare-fun m!495585 () Bool)

(assert (=> d!79281 m!495585))

(declare-fun m!495587 () Bool)

(assert (=> d!79281 m!495587))

(declare-fun m!495589 () Bool)

(assert (=> b!514072 m!495589))

(assert (=> b!514076 m!495491))

(declare-fun m!495591 () Bool)

(assert (=> b!514076 m!495591))

(assert (=> b!513987 d!79281))

(declare-fun d!79303 () Bool)

(assert (=> d!79303 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46486 d!79303))

(declare-fun d!79309 () Bool)

(assert (=> d!79309 (= (array_inv!11653 a!3235) (bvsge (size!16221 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46486 d!79309))

(declare-fun d!79311 () Bool)

(assert (=> d!79311 (= (validKeyInArray!0 (select (arr!15857 a!3235) j!176)) (and (not (= (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15857 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513989 d!79311))

(declare-fun b!514134 () Bool)

(declare-fun e!300219 () Bool)

(declare-fun e!300218 () Bool)

(assert (=> b!514134 (= e!300219 e!300218)))

(declare-fun lt!235385 () (_ BitVec 64))

(assert (=> b!514134 (= lt!235385 (select (arr!15857 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235384 () Unit!15906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32969 (_ BitVec 64) (_ BitVec 32)) Unit!15906)

(assert (=> b!514134 (= lt!235384 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235385 #b00000000000000000000000000000000))))

(assert (=> b!514134 (arrayContainsKey!0 a!3235 lt!235385 #b00000000000000000000000000000000)))

(declare-fun lt!235383 () Unit!15906)

(assert (=> b!514134 (= lt!235383 lt!235384)))

(declare-fun res!314154 () Bool)

(assert (=> b!514134 (= res!314154 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4324 #b00000000000000000000000000000000)))))

(assert (=> b!514134 (=> (not res!314154) (not e!300218))))

(declare-fun b!514135 () Bool)

(declare-fun call!31590 () Bool)

(assert (=> b!514135 (= e!300218 call!31590)))

(declare-fun b!514136 () Bool)

(declare-fun e!300220 () Bool)

(assert (=> b!514136 (= e!300220 e!300219)))

(declare-fun c!60276 () Bool)

(assert (=> b!514136 (= c!60276 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514137 () Bool)

(assert (=> b!514137 (= e!300219 call!31590)))

(declare-fun d!79313 () Bool)

(declare-fun res!314153 () Bool)

(assert (=> d!79313 (=> res!314153 e!300220)))

(assert (=> d!79313 (= res!314153 (bvsge #b00000000000000000000000000000000 (size!16221 a!3235)))))

(assert (=> d!79313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300220)))

(declare-fun bm!31587 () Bool)

(assert (=> bm!31587 (= call!31590 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79313 (not res!314153)) b!514136))

(assert (= (and b!514136 c!60276) b!514134))

(assert (= (and b!514136 (not c!60276)) b!514137))

(assert (= (and b!514134 res!314154) b!514135))

(assert (= (or b!514135 b!514137) bm!31587))

(declare-fun m!495607 () Bool)

(assert (=> b!514134 m!495607))

(declare-fun m!495609 () Bool)

(assert (=> b!514134 m!495609))

(declare-fun m!495611 () Bool)

(assert (=> b!514134 m!495611))

(assert (=> b!514134 m!495607))

(declare-fun m!495613 () Bool)

(assert (=> b!514134 m!495613))

(assert (=> b!514136 m!495607))

(assert (=> b!514136 m!495607))

(declare-fun m!495615 () Bool)

(assert (=> b!514136 m!495615))

(declare-fun m!495617 () Bool)

(assert (=> bm!31587 m!495617))

(assert (=> b!513988 d!79313))

(declare-fun d!79317 () Bool)

(declare-fun lt!235400 () (_ BitVec 32))

(declare-fun lt!235399 () (_ BitVec 32))

(assert (=> d!79317 (= lt!235400 (bvmul (bvxor lt!235399 (bvlshr lt!235399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79317 (= lt!235399 ((_ extract 31 0) (bvand (bvxor (select (arr!15857 a!3235) j!176) (bvlshr (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79317 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314158 (let ((h!10903 ((_ extract 31 0) (bvand (bvxor (select (arr!15857 a!3235) j!176) (bvlshr (select (arr!15857 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48442 (bvmul (bvxor h!10903 (bvlshr h!10903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48442 (bvlshr x!48442 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314158 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314158 #b00000000000000000000000000000000))))))

(assert (=> d!79317 (= (toIndex!0 (select (arr!15857 a!3235) j!176) mask!3524) (bvand (bvxor lt!235400 (bvlshr lt!235400 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513985 d!79317))

(declare-fun lt!235416 () SeekEntryResult!4324)

(declare-fun b!514208 () Bool)

(assert (=> b!514208 (and (bvsge (index!19486 lt!235416) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235416) (size!16221 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)))))))

(declare-fun res!314190 () Bool)

(assert (=> b!514208 (= res!314190 (= (select (arr!15857 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235))) (index!19486 lt!235416)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300271 () Bool)

(assert (=> b!514208 (=> res!314190 e!300271)))

(declare-fun b!514209 () Bool)

(declare-fun e!300270 () SeekEntryResult!4324)

(declare-fun e!300267 () SeekEntryResult!4324)

(assert (=> b!514209 (= e!300270 e!300267)))

(declare-fun c!60297 () Bool)

(declare-fun lt!235415 () (_ BitVec 64))

(assert (=> b!514209 (= c!60297 (or (= lt!235415 (select (store (arr!15857 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235415 lt!235415) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514210 () Bool)

(assert (=> b!514210 (and (bvsge (index!19486 lt!235416) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235416) (size!16221 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)))))))

(assert (=> b!514210 (= e!300271 (= (select (arr!15857 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235))) (index!19486 lt!235416)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79327 () Bool)

(declare-fun e!300269 () Bool)

(assert (=> d!79327 e!300269))

(declare-fun c!60296 () Bool)

(assert (=> d!79327 (= c!60296 (and (is-Intermediate!4324 lt!235416) (undefined!5136 lt!235416)))))

(assert (=> d!79327 (= lt!235416 e!300270)))

(declare-fun c!60298 () Bool)

(assert (=> d!79327 (= c!60298 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79327 (= lt!235415 (select (arr!15857 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235))) lt!235311))))

(assert (=> d!79327 (validMask!0 mask!3524)))

(assert (=> d!79327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235311 (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)) mask!3524) lt!235416)))

(declare-fun b!514211 () Bool)

(assert (=> b!514211 (and (bvsge (index!19486 lt!235416) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235416) (size!16221 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)))))))

(declare-fun res!314189 () Bool)

(assert (=> b!514211 (= res!314189 (= (select (arr!15857 (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235))) (index!19486 lt!235416)) (select (store (arr!15857 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!514211 (=> res!314189 e!300271)))

(declare-fun e!300268 () Bool)

(assert (=> b!514211 (= e!300268 e!300271)))

(declare-fun b!514212 () Bool)

(assert (=> b!514212 (= e!300267 (Intermediate!4324 false lt!235311 #b00000000000000000000000000000000))))

(declare-fun b!514213 () Bool)

(assert (=> b!514213 (= e!300270 (Intermediate!4324 true lt!235311 #b00000000000000000000000000000000))))

(declare-fun b!514214 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514214 (= e!300267 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235311 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) (array!32970 (store (arr!15857 a!3235) i!1204 k!2280) (size!16221 a!3235)) mask!3524))))

(declare-fun b!514215 () Bool)

(assert (=> b!514215 (= e!300269 (bvsge (x!48437 lt!235416) #b01111111111111111111111111111110))))

(declare-fun b!514216 () Bool)

(assert (=> b!514216 (= e!300269 e!300268)))

(declare-fun res!314188 () Bool)

(assert (=> b!514216 (= res!314188 (and (is-Intermediate!4324 lt!235416) (not (undefined!5136 lt!235416)) (bvslt (x!48437 lt!235416) #b01111111111111111111111111111110) (bvsge (x!48437 lt!235416) #b00000000000000000000000000000000) (bvsge (x!48437 lt!235416) #b00000000000000000000000000000000)))))

(assert (=> b!514216 (=> (not res!314188) (not e!300268))))

(assert (= (and d!79327 c!60298) b!514213))

(assert (= (and d!79327 (not c!60298)) b!514209))

(assert (= (and b!514209 c!60297) b!514212))

(assert (= (and b!514209 (not c!60297)) b!514214))

(assert (= (and d!79327 c!60296) b!514215))

(assert (= (and d!79327 (not c!60296)) b!514216))

(assert (= (and b!514216 res!314188) b!514211))

(assert (= (and b!514211 (not res!314189)) b!514208))

(assert (= (and b!514208 (not res!314190)) b!514210))

(declare-fun m!495659 () Bool)

(assert (=> b!514210 m!495659))

(declare-fun m!495661 () Bool)

(assert (=> d!79327 m!495661))

(assert (=> d!79327 m!495499))

(declare-fun m!495663 () Bool)

(assert (=> b!514214 m!495663))

(assert (=> b!514214 m!495663))

(assert (=> b!514214 m!495509))

(declare-fun m!495665 () Bool)

(assert (=> b!514214 m!495665))

(assert (=> b!514208 m!495659))

(assert (=> b!514211 m!495659))

(assert (=> b!513985 d!79327))

(declare-fun b!514217 () Bool)

(declare-fun e!300273 () Bool)

(declare-fun e!300272 () Bool)

(assert (=> b!514217 (= e!300273 e!300272)))

(declare-fun lt!235419 () (_ BitVec 64))

(assert (=> b!514217 (= lt!235419 (select (arr!15857 a!3235) j!176))))

(declare-fun lt!235418 () Unit!15906)

(assert (=> b!514217 (= lt!235418 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235419 j!176))))

(assert (=> b!514217 (arrayContainsKey!0 a!3235 lt!235419 #b00000000000000000000000000000000)))

(declare-fun lt!235417 () Unit!15906)

(assert (=> b!514217 (= lt!235417 lt!235418)))

(declare-fun res!314192 () Bool)

(assert (=> b!514217 (= res!314192 (= (seekEntryOrOpen!0 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) (Found!4324 j!176)))))

(assert (=> b!514217 (=> (not res!314192) (not e!300272))))

(declare-fun b!514218 () Bool)

(declare-fun call!31595 () Bool)

(assert (=> b!514218 (= e!300272 call!31595)))

(declare-fun b!514219 () Bool)

(declare-fun e!300274 () Bool)

(assert (=> b!514219 (= e!300274 e!300273)))

(declare-fun c!60299 () Bool)

(assert (=> b!514219 (= c!60299 (validKeyInArray!0 (select (arr!15857 a!3235) j!176)))))

(declare-fun b!514220 () Bool)

(assert (=> b!514220 (= e!300273 call!31595)))

(declare-fun d!79339 () Bool)

(declare-fun res!314191 () Bool)

(assert (=> d!79339 (=> res!314191 e!300274)))

(assert (=> d!79339 (= res!314191 (bvsge j!176 (size!16221 a!3235)))))

(assert (=> d!79339 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300274)))

(declare-fun bm!31592 () Bool)

(assert (=> bm!31592 (= call!31595 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79339 (not res!314191)) b!514219))

(assert (= (and b!514219 c!60299) b!514217))

(assert (= (and b!514219 (not c!60299)) b!514220))

(assert (= (and b!514217 res!314192) b!514218))

(assert (= (or b!514218 b!514220) bm!31592))

(assert (=> b!514217 m!495491))

(declare-fun m!495667 () Bool)

(assert (=> b!514217 m!495667))

(declare-fun m!495669 () Bool)

(assert (=> b!514217 m!495669))

(assert (=> b!514217 m!495491))

(assert (=> b!514217 m!495493))

(assert (=> b!514219 m!495491))

(assert (=> b!514219 m!495491))

(assert (=> b!514219 m!495523))

(declare-fun m!495671 () Bool)

(assert (=> bm!31592 m!495671))

(assert (=> b!513985 d!79339))

(declare-fun b!514221 () Bool)

(declare-fun lt!235421 () SeekEntryResult!4324)

(assert (=> b!514221 (and (bvsge (index!19486 lt!235421) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235421) (size!16221 a!3235)))))

(declare-fun res!314195 () Bool)

(assert (=> b!514221 (= res!314195 (= (select (arr!15857 a!3235) (index!19486 lt!235421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300279 () Bool)

(assert (=> b!514221 (=> res!314195 e!300279)))

(declare-fun b!514222 () Bool)

(declare-fun e!300278 () SeekEntryResult!4324)

(declare-fun e!300275 () SeekEntryResult!4324)

(assert (=> b!514222 (= e!300278 e!300275)))

(declare-fun lt!235420 () (_ BitVec 64))

(declare-fun c!60301 () Bool)

(assert (=> b!514222 (= c!60301 (or (= lt!235420 (select (arr!15857 a!3235) j!176)) (= (bvadd lt!235420 lt!235420) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514223 () Bool)

(assert (=> b!514223 (and (bvsge (index!19486 lt!235421) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235421) (size!16221 a!3235)))))

(assert (=> b!514223 (= e!300279 (= (select (arr!15857 a!3235) (index!19486 lt!235421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79341 () Bool)

(declare-fun e!300277 () Bool)

(assert (=> d!79341 e!300277))

(declare-fun c!60300 () Bool)

(assert (=> d!79341 (= c!60300 (and (is-Intermediate!4324 lt!235421) (undefined!5136 lt!235421)))))

(assert (=> d!79341 (= lt!235421 e!300278)))

(declare-fun c!60302 () Bool)

(assert (=> d!79341 (= c!60302 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79341 (= lt!235420 (select (arr!15857 a!3235) lt!235309))))

(assert (=> d!79341 (validMask!0 mask!3524)))

(assert (=> d!79341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235309 (select (arr!15857 a!3235) j!176) a!3235 mask!3524) lt!235421)))

(declare-fun b!514224 () Bool)

(assert (=> b!514224 (and (bvsge (index!19486 lt!235421) #b00000000000000000000000000000000) (bvslt (index!19486 lt!235421) (size!16221 a!3235)))))

(declare-fun res!314194 () Bool)

(assert (=> b!514224 (= res!314194 (= (select (arr!15857 a!3235) (index!19486 lt!235421)) (select (arr!15857 a!3235) j!176)))))

(assert (=> b!514224 (=> res!314194 e!300279)))

(declare-fun e!300276 () Bool)

(assert (=> b!514224 (= e!300276 e!300279)))

(declare-fun b!514225 () Bool)

(assert (=> b!514225 (= e!300275 (Intermediate!4324 false lt!235309 #b00000000000000000000000000000000))))

(declare-fun b!514226 () Bool)

(assert (=> b!514226 (= e!300278 (Intermediate!4324 true lt!235309 #b00000000000000000000000000000000))))

(declare-fun b!514227 () Bool)

(assert (=> b!514227 (= e!300275 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235309 #b00000000000000000000000000000000 mask!3524) (select (arr!15857 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514228 () Bool)

(assert (=> b!514228 (= e!300277 (bvsge (x!48437 lt!235421) #b01111111111111111111111111111110))))

(declare-fun b!514229 () Bool)

(assert (=> b!514229 (= e!300277 e!300276)))

(declare-fun res!314193 () Bool)

(assert (=> b!514229 (= res!314193 (and (is-Intermediate!4324 lt!235421) (not (undefined!5136 lt!235421)) (bvslt (x!48437 lt!235421) #b01111111111111111111111111111110) (bvsge (x!48437 lt!235421) #b00000000000000000000000000000000) (bvsge (x!48437 lt!235421) #b00000000000000000000000000000000)))))

(assert (=> b!514229 (=> (not res!314193) (not e!300276))))

(assert (= (and d!79341 c!60302) b!514226))

(assert (= (and d!79341 (not c!60302)) b!514222))

(assert (= (and b!514222 c!60301) b!514225))

(assert (= (and b!514222 (not c!60301)) b!514227))

(assert (= (and d!79341 c!60300) b!514228))

(assert (= (and d!79341 (not c!60300)) b!514229))

(assert (= (and b!514229 res!314193) b!514224))

(assert (= (and b!514224 (not res!314194)) b!514221))

(assert (= (and b!514221 (not res!314195)) b!514223))

(declare-fun m!495673 () Bool)

(assert (=> b!514223 m!495673))

(declare-fun m!495675 () Bool)

(assert (=> d!79341 m!495675))

(assert (=> d!79341 m!495499))

(declare-fun m!495677 () Bool)

(assert (=> b!514227 m!495677))

(assert (=> b!514227 m!495677))

(assert (=> b!514227 m!495491))

(declare-fun m!495679 () Bool)

(assert (=> b!514227 m!495679))

(assert (=> b!514221 m!495673))

(assert (=> b!514224 m!495673))

(assert (=> b!513985 d!79341))

(declare-fun d!79343 () Bool)

(assert (=> d!79343 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235430 () Unit!15906)

(declare-fun choose!38 (array!32969 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15906)

(assert (=> d!79343 (= lt!235430 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79343 (validMask!0 mask!3524)))

(assert (=> d!79343 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235430)))

(declare-fun bs!16263 () Bool)

(assert (= bs!16263 d!79343))

(assert (=> bs!16263 m!495515))

(declare-fun m!495681 () Bool)

(assert (=> bs!16263 m!495681))

(assert (=> bs!16263 m!495499))

(assert (=> b!513985 d!79343))

(declare-fun d!79345 () Bool)

(declare-fun lt!235432 () (_ BitVec 32))

(declare-fun lt!235431 () (_ BitVec 32))

(assert (=> d!79345 (= lt!235432 (bvmul (bvxor lt!235431 (bvlshr lt!235431 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79345 (= lt!235431 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79345 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314158 (let ((h!10903 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48442 (bvmul (bvxor h!10903 (bvlshr h!10903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48442 (bvlshr x!48442 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314158 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314158 #b00000000000000000000000000000000))))))

(assert (=> d!79345 (= (toIndex!0 (select (store (arr!15857 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235432 (bvlshr lt!235432 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513985 d!79345))

(declare-fun d!79347 () Bool)

(declare-fun res!314200 () Bool)

(declare-fun e!300290 () Bool)

(assert (=> d!79347 (=> res!314200 e!300290)))

(assert (=> d!79347 (= res!314200 (= (select (arr!15857 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79347 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300290)))

(declare-fun b!514246 () Bool)

(declare-fun e!300291 () Bool)

(assert (=> b!514246 (= e!300290 e!300291)))

(declare-fun res!314201 () Bool)

(assert (=> b!514246 (=> (not res!314201) (not e!300291))))

(assert (=> b!514246 (= res!314201 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16221 a!3235)))))

(declare-fun b!514247 () Bool)

(assert (=> b!514247 (= e!300291 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79347 (not res!314200)) b!514246))

(assert (= (and b!514246 res!314201) b!514247))

(assert (=> d!79347 m!495607))

(declare-fun m!495683 () Bool)

(assert (=> b!514247 m!495683))

(assert (=> b!513984 d!79347))

(declare-fun bm!31595 () Bool)

(declare-fun call!31598 () Bool)

(declare-fun c!60317 () Bool)

(assert (=> bm!31595 (= call!31598 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60317 (Cons!10011 (select (arr!15857 a!3235) #b00000000000000000000000000000000) Nil!10012) Nil!10012)))))

(declare-fun b!514270 () Bool)

(declare-fun e!300306 () Bool)

(assert (=> b!514270 (= e!300306 call!31598)))

(declare-fun b!514271 () Bool)

(declare-fun e!300309 () Bool)

(assert (=> b!514271 (= e!300309 e!300306)))

(assert (=> b!514271 (= c!60317 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79349 () Bool)

(declare-fun res!314208 () Bool)

(declare-fun e!300308 () Bool)

(assert (=> d!79349 (=> res!314208 e!300308)))

(assert (=> d!79349 (= res!314208 (bvsge #b00000000000000000000000000000000 (size!16221 a!3235)))))

(assert (=> d!79349 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10012) e!300308)))

(declare-fun b!514272 () Bool)

(assert (=> b!514272 (= e!300308 e!300309)))

(declare-fun res!314210 () Bool)

(assert (=> b!514272 (=> (not res!314210) (not e!300309))))

(declare-fun e!300307 () Bool)

(assert (=> b!514272 (= res!314210 (not e!300307))))

(declare-fun res!314209 () Bool)

(assert (=> b!514272 (=> (not res!314209) (not e!300307))))

(assert (=> b!514272 (= res!314209 (validKeyInArray!0 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514273 () Bool)

(assert (=> b!514273 (= e!300306 call!31598)))

(declare-fun b!514274 () Bool)

(declare-fun contains!2735 (List!10015 (_ BitVec 64)) Bool)

(assert (=> b!514274 (= e!300307 (contains!2735 Nil!10012 (select (arr!15857 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79349 (not res!314208)) b!514272))

(assert (= (and b!514272 res!314209) b!514274))

(assert (= (and b!514272 res!314210) b!514271))

(assert (= (and b!514271 c!60317) b!514273))

(assert (= (and b!514271 (not c!60317)) b!514270))

(assert (= (or b!514273 b!514270) bm!31595))

(assert (=> bm!31595 m!495607))

(declare-fun m!495711 () Bool)

(assert (=> bm!31595 m!495711))

(assert (=> b!514271 m!495607))

(assert (=> b!514271 m!495607))

(assert (=> b!514271 m!495615))

(assert (=> b!514272 m!495607))

(assert (=> b!514272 m!495607))

(assert (=> b!514272 m!495615))

(assert (=> b!514274 m!495607))

(assert (=> b!514274 m!495607))

(declare-fun m!495713 () Bool)

(assert (=> b!514274 m!495713))

(assert (=> b!513979 d!79349))

(declare-fun d!79353 () Bool)

(assert (=> d!79353 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513986 d!79353))

(declare-fun b!514275 () Bool)

(declare-fun e!300311 () SeekEntryResult!4324)

(assert (=> b!514275 (= e!300311 Undefined!4324)))

(declare-fun d!79355 () Bool)

(declare-fun lt!235440 () SeekEntryResult!4324)

(assert (=> d!79355 (and (or (is-Undefined!4324 lt!235440) (not (is-Found!4324 lt!235440)) (and (bvsge (index!19485 lt!235440) #b00000000000000000000000000000000) (bvslt (index!19485 lt!235440) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235440) (is-Found!4324 lt!235440) (not (is-MissingZero!4324 lt!235440)) (and (bvsge (index!19484 lt!235440) #b00000000000000000000000000000000) (bvslt (index!19484 lt!235440) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235440) (is-Found!4324 lt!235440) (is-MissingZero!4324 lt!235440) (not (is-MissingVacant!4324 lt!235440)) (and (bvsge (index!19487 lt!235440) #b00000000000000000000000000000000) (bvslt (index!19487 lt!235440) (size!16221 a!3235)))) (or (is-Undefined!4324 lt!235440) (ite (is-Found!4324 lt!235440) (= (select (arr!15857 a!3235) (index!19485 lt!235440)) k!2280) (ite (is-MissingZero!4324 lt!235440) (= (select (arr!15857 a!3235) (index!19484 lt!235440)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4324 lt!235440) (= (select (arr!15857 a!3235) (index!19487 lt!235440)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79355 (= lt!235440 e!300311)))

(declare-fun c!60319 () Bool)

(declare-fun lt!235441 () SeekEntryResult!4324)

(assert (=> d!79355 (= c!60319 (and (is-Intermediate!4324 lt!235441) (undefined!5136 lt!235441)))))

(assert (=> d!79355 (= lt!235441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79355 (validMask!0 mask!3524)))

(assert (=> d!79355 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235440)))

(declare-fun b!514276 () Bool)

(declare-fun e!300312 () SeekEntryResult!4324)

(assert (=> b!514276 (= e!300311 e!300312)))

(declare-fun lt!235439 () (_ BitVec 64))

(assert (=> b!514276 (= lt!235439 (select (arr!15857 a!3235) (index!19486 lt!235441)))))

(declare-fun c!60318 () Bool)

(assert (=> b!514276 (= c!60318 (= lt!235439 k!2280))))

(declare-fun b!514277 () Bool)

(assert (=> b!514277 (= e!300312 (Found!4324 (index!19486 lt!235441)))))

(declare-fun b!514278 () Bool)

(declare-fun c!60320 () Bool)

(assert (=> b!514278 (= c!60320 (= lt!235439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300310 () SeekEntryResult!4324)

(assert (=> b!514278 (= e!300312 e!300310)))

(declare-fun b!514279 () Bool)

(assert (=> b!514279 (= e!300310 (MissingZero!4324 (index!19486 lt!235441)))))

(declare-fun b!514280 () Bool)

(assert (=> b!514280 (= e!300310 (seekKeyOrZeroReturnVacant!0 (x!48437 lt!235441) (index!19486 lt!235441) (index!19486 lt!235441) k!2280 a!3235 mask!3524))))

(assert (= (and d!79355 c!60319) b!514275))

(assert (= (and d!79355 (not c!60319)) b!514276))

(assert (= (and b!514276 c!60318) b!514277))

(assert (= (and b!514276 (not c!60318)) b!514278))

(assert (= (and b!514278 c!60320) b!514279))

(assert (= (and b!514278 (not c!60320)) b!514280))

(declare-fun m!495715 () Bool)

(assert (=> d!79355 m!495715))

(declare-fun m!495717 () Bool)

(assert (=> d!79355 m!495717))

(assert (=> d!79355 m!495499))

(declare-fun m!495719 () Bool)

(assert (=> d!79355 m!495719))

(assert (=> d!79355 m!495717))

(declare-fun m!495721 () Bool)

(assert (=> d!79355 m!495721))

(declare-fun m!495723 () Bool)

(assert (=> d!79355 m!495723))

(declare-fun m!495725 () Bool)

(assert (=> b!514276 m!495725))

(declare-fun m!495727 () Bool)

(assert (=> b!514280 m!495727))

(assert (=> b!513980 d!79355))

(push 1)

(assert (not b!514247))

(assert (not d!79281))

(assert (not d!79355))

(assert (not bm!31592))

(assert (not d!79341))

(assert (not d!79327))

(assert (not b!514134))

(assert (not d!79343))

(assert (not b!514214))

(assert (not b!514280))

(assert (not b!514136))

(assert (not bm!31595))

(assert (not b!514274))

(assert (not bm!31587))

(assert (not b!514219))

(assert (not b!514217))

(assert (not b!514076))

(assert (not b!514272))

(assert (not b!514227))

(assert (not b!514271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

