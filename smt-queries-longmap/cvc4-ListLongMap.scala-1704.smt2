; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31314 () Bool)

(assert start!31314)

(declare-fun b!314079 () Bool)

(declare-fun res!169974 () Bool)

(declare-fun e!195679 () Bool)

(assert (=> b!314079 (=> (not res!169974) (not e!195679))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314079 (= res!169974 (validKeyInArray!0 k!2441))))

(declare-fun b!314080 () Bool)

(declare-fun res!169976 () Bool)

(assert (=> b!314080 (=> (not res!169976) (not e!195679))))

(declare-datatypes ((array!16030 0))(
  ( (array!16031 (arr!7591 (Array (_ BitVec 32) (_ BitVec 64))) (size!7943 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16030)

(declare-fun arrayContainsKey!0 (array!16030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314080 (= res!169976 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314081 () Bool)

(declare-fun res!169972 () Bool)

(assert (=> b!314081 (=> (not res!169972) (not e!195679))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314081 (= res!169972 (and (= (size!7943 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7943 a!3293))))))

(declare-fun b!314082 () Bool)

(declare-fun e!195678 () Bool)

(assert (=> b!314082 (= e!195679 e!195678)))

(declare-fun res!169973 () Bool)

(assert (=> b!314082 (=> (not res!169973) (not e!195678))))

(declare-datatypes ((SeekEntryResult!2731 0))(
  ( (MissingZero!2731 (index!13100 (_ BitVec 32))) (Found!2731 (index!13101 (_ BitVec 32))) (Intermediate!2731 (undefined!3543 Bool) (index!13102 (_ BitVec 32)) (x!31323 (_ BitVec 32))) (Undefined!2731) (MissingVacant!2731 (index!13103 (_ BitVec 32))) )
))
(declare-fun lt!153792 () SeekEntryResult!2731)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16030 (_ BitVec 32)) SeekEntryResult!2731)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314082 (= res!169973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153792))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314082 (= lt!153792 (Intermediate!2731 false resIndex!52 resX!52))))

(declare-fun b!314083 () Bool)

(declare-fun res!169970 () Bool)

(assert (=> b!314083 (=> (not res!169970) (not e!195678))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314083 (= res!169970 (and (= (select (arr!7591 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7943 a!3293))))))

(declare-fun b!314084 () Bool)

(declare-fun res!169975 () Bool)

(assert (=> b!314084 (=> (not res!169975) (not e!195678))))

(assert (=> b!314084 (= res!169975 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!153792))))

(declare-fun b!314085 () Bool)

(declare-fun res!169977 () Bool)

(assert (=> b!314085 (=> (not res!169977) (not e!195679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16030 (_ BitVec 32)) Bool)

(assert (=> b!314085 (= res!169977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314086 () Bool)

(declare-fun res!169971 () Bool)

(assert (=> b!314086 (=> (not res!169971) (not e!195679))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16030 (_ BitVec 32)) SeekEntryResult!2731)

(assert (=> b!314086 (= res!169971 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2731 i!1240)))))

(declare-fun res!169969 () Bool)

(assert (=> start!31314 (=> (not res!169969) (not e!195679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31314 (= res!169969 (validMask!0 mask!3709))))

(assert (=> start!31314 e!195679))

(declare-fun array_inv!5554 (array!16030) Bool)

(assert (=> start!31314 (array_inv!5554 a!3293)))

(assert (=> start!31314 true))

(declare-fun b!314087 () Bool)

(assert (=> b!314087 (= e!195678 (bvslt (bvsub #b01111111111111111111111111111110 x!1427) #b00000000000000000000000000000000))))

(assert (= (and start!31314 res!169969) b!314081))

(assert (= (and b!314081 res!169972) b!314079))

(assert (= (and b!314079 res!169974) b!314080))

(assert (= (and b!314080 res!169976) b!314086))

(assert (= (and b!314086 res!169971) b!314085))

(assert (= (and b!314085 res!169977) b!314082))

(assert (= (and b!314082 res!169973) b!314083))

(assert (= (and b!314083 res!169970) b!314084))

(assert (= (and b!314084 res!169975) b!314087))

(declare-fun m!323757 () Bool)

(assert (=> b!314080 m!323757))

(declare-fun m!323759 () Bool)

(assert (=> b!314084 m!323759))

(declare-fun m!323761 () Bool)

(assert (=> b!314082 m!323761))

(assert (=> b!314082 m!323761))

(declare-fun m!323763 () Bool)

(assert (=> b!314082 m!323763))

(declare-fun m!323765 () Bool)

(assert (=> b!314083 m!323765))

(declare-fun m!323767 () Bool)

(assert (=> b!314079 m!323767))

(declare-fun m!323769 () Bool)

(assert (=> b!314085 m!323769))

(declare-fun m!323771 () Bool)

(assert (=> b!314086 m!323771))

(declare-fun m!323773 () Bool)

(assert (=> start!31314 m!323773))

(declare-fun m!323775 () Bool)

(assert (=> start!31314 m!323775))

(push 1)

(assert (not b!314082))

(assert (not b!314085))

(assert (not b!314080))

(assert (not b!314079))

(assert (not start!31314))

(assert (not b!314086))

(assert (not b!314084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!314192 () Bool)

(declare-fun lt!153835 () SeekEntryResult!2731)

(assert (=> b!314192 (and (bvsge (index!13102 lt!153835) #b00000000000000000000000000000000) (bvslt (index!13102 lt!153835) (size!7943 a!3293)))))

(declare-fun e!195746 () Bool)

(assert (=> b!314192 (= e!195746 (= (select (arr!7591 a!3293) (index!13102 lt!153835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!68717 () Bool)

(declare-fun e!195748 () Bool)

(assert (=> d!68717 e!195748))

(declare-fun c!49698 () Bool)

(assert (=> d!68717 (= c!49698 (and (is-Intermediate!2731 lt!153835) (undefined!3543 lt!153835)))))

(declare-fun e!195749 () SeekEntryResult!2731)

(assert (=> d!68717 (= lt!153835 e!195749)))

(declare-fun c!49700 () Bool)

(assert (=> d!68717 (= c!49700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153836 () (_ BitVec 64))

(assert (=> d!68717 (= lt!153836 (select (arr!7591 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!68717 (validMask!0 mask!3709)))

(assert (=> d!68717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153835)))

(declare-fun b!314193 () Bool)

(declare-fun e!195747 () SeekEntryResult!2731)

(assert (=> b!314193 (= e!195747 (Intermediate!2731 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314194 () Bool)

(assert (=> b!314194 (= e!195749 e!195747)))

(declare-fun c!49699 () Bool)

(assert (=> b!314194 (= c!49699 (or (= lt!153836 k!2441) (= (bvadd lt!153836 lt!153836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314195 () Bool)

(assert (=> b!314195 (= e!195749 (Intermediate!2731 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314196 () Bool)

(assert (=> b!314196 (and (bvsge (index!13102 lt!153835) #b00000000000000000000000000000000) (bvslt (index!13102 lt!153835) (size!7943 a!3293)))))

(declare-fun res!170020 () Bool)

(assert (=> b!314196 (= res!170020 (= (select (arr!7591 a!3293) (index!13102 lt!153835)) k!2441))))

(assert (=> b!314196 (=> res!170020 e!195746)))

(declare-fun e!195750 () Bool)

(assert (=> b!314196 (= e!195750 e!195746)))

(declare-fun b!314197 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314197 (= e!195747 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!314198 () Bool)

(assert (=> b!314198 (= e!195748 e!195750)))

(declare-fun res!170021 () Bool)

(assert (=> b!314198 (= res!170021 (and (is-Intermediate!2731 lt!153835) (not (undefined!3543 lt!153835)) (bvslt (x!31323 lt!153835) #b01111111111111111111111111111110) (bvsge (x!31323 lt!153835) #b00000000000000000000000000000000) (bvsge (x!31323 lt!153835) #b00000000000000000000000000000000)))))

(assert (=> b!314198 (=> (not res!170021) (not e!195750))))

(declare-fun b!314199 () Bool)

(assert (=> b!314199 (= e!195748 (bvsge (x!31323 lt!153835) #b01111111111111111111111111111110))))

(declare-fun b!314200 () Bool)

(assert (=> b!314200 (and (bvsge (index!13102 lt!153835) #b00000000000000000000000000000000) (bvslt (index!13102 lt!153835) (size!7943 a!3293)))))

(declare-fun res!170019 () Bool)

(assert (=> b!314200 (= res!170019 (= (select (arr!7591 a!3293) (index!13102 lt!153835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314200 (=> res!170019 e!195746)))

(assert (= (and d!68717 c!49700) b!314195))

(assert (= (and d!68717 (not c!49700)) b!314194))

(assert (= (and b!314194 c!49699) b!314193))

(assert (= (and b!314194 (not c!49699)) b!314197))

(assert (= (and d!68717 c!49698) b!314199))

(assert (= (and d!68717 (not c!49698)) b!314198))

(assert (= (and b!314198 res!170021) b!314196))

(assert (= (and b!314196 (not res!170020)) b!314200))

(assert (= (and b!314200 (not res!170019)) b!314192))

(declare-fun m!323829 () Bool)

(assert (=> b!314200 m!323829))

(assert (=> d!68717 m!323761))

(declare-fun m!323833 () Bool)

(assert (=> d!68717 m!323833))

(assert (=> d!68717 m!323773))

(assert (=> b!314197 m!323761))

(declare-fun m!323835 () Bool)

(assert (=> b!314197 m!323835))

(assert (=> b!314197 m!323835))

(declare-fun m!323837 () Bool)

(assert (=> b!314197 m!323837))

(assert (=> b!314192 m!323829))

(assert (=> b!314196 m!323829))

(assert (=> b!314082 d!68717))

(declare-fun d!68741 () Bool)

(declare-fun lt!153845 () (_ BitVec 32))

(declare-fun lt!153844 () (_ BitVec 32))

(assert (=> d!68741 (= lt!153845 (bvmul (bvxor lt!153844 (bvlshr lt!153844 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68741 (= lt!153844 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68741 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170024 (let ((h!5359 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31327 (bvmul (bvxor h!5359 (bvlshr h!5359 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31327 (bvlshr x!31327 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170024 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170024 #b00000000000000000000000000000000))))))

