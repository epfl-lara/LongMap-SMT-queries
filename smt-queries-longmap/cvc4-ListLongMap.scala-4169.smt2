; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56760 () Bool)

(assert start!56760)

(declare-fun b!629016 () Bool)

(declare-fun res!406582 () Bool)

(declare-fun e!359777 () Bool)

(assert (=> b!629016 (=> (not res!406582) (not e!359777))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38001 0))(
  ( (array!38002 (arr!18239 (Array (_ BitVec 32) (_ BitVec 64))) (size!18603 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38001)

(assert (=> b!629016 (= res!406582 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18239 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18239 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!629017 () Bool)

(declare-fun res!406574 () Bool)

(declare-fun e!359779 () Bool)

(assert (=> b!629017 (=> (not res!406574) (not e!359779))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!629017 (= res!406574 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18239 a!2986) index!984) (select (arr!18239 a!2986) j!136))) (not (= (select (arr!18239 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!629018 () Bool)

(declare-fun res!406578 () Bool)

(declare-fun e!359781 () Bool)

(assert (=> b!629018 (=> (not res!406578) (not e!359781))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!629018 (= res!406578 (validKeyInArray!0 k!1786))))

(declare-fun b!629019 () Bool)

(declare-fun e!359780 () Bool)

(assert (=> b!629019 (= e!359779 e!359780)))

(declare-fun res!406577 () Bool)

(assert (=> b!629019 (=> (not res!406577) (not e!359780))))

(declare-fun lt!290617 () (_ BitVec 32))

(assert (=> b!629019 (= res!406577 (and (bvsge lt!290617 #b00000000000000000000000000000000) (bvslt lt!290617 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!629019 (= lt!290617 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!629020 () Bool)

(assert (=> b!629020 (= e!359777 e!359779)))

(declare-fun res!406583 () Bool)

(assert (=> b!629020 (=> (not res!406583) (not e!359779))))

(declare-datatypes ((SeekEntryResult!6679 0))(
  ( (MissingZero!6679 (index!29000 (_ BitVec 32))) (Found!6679 (index!29001 (_ BitVec 32))) (Intermediate!6679 (undefined!7491 Bool) (index!29002 (_ BitVec 32)) (x!57729 (_ BitVec 32))) (Undefined!6679) (MissingVacant!6679 (index!29003 (_ BitVec 32))) )
))
(declare-fun lt!290615 () SeekEntryResult!6679)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38001 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!629020 (= res!406583 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18239 a!2986) j!136) a!2986 mask!3053) lt!290615))))

(assert (=> b!629020 (= lt!290615 (Found!6679 j!136))))

(declare-fun b!629021 () Bool)

(assert (=> b!629021 (= e!359780 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!290617 vacantSpotIndex!68 (select (arr!18239 a!2986) j!136) a!2986 mask!3053) lt!290615)))))

(declare-fun b!629022 () Bool)

(declare-fun res!406576 () Bool)

(assert (=> b!629022 (=> (not res!406576) (not e!359781))))

(declare-fun arrayContainsKey!0 (array!38001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!629022 (= res!406576 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!406572 () Bool)

(assert (=> start!56760 (=> (not res!406572) (not e!359781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56760 (= res!406572 (validMask!0 mask!3053))))

(assert (=> start!56760 e!359781))

(assert (=> start!56760 true))

(declare-fun array_inv!14035 (array!38001) Bool)

(assert (=> start!56760 (array_inv!14035 a!2986)))

(declare-fun b!629023 () Bool)

(assert (=> b!629023 (= e!359781 e!359777)))

(declare-fun res!406580 () Bool)

(assert (=> b!629023 (=> (not res!406580) (not e!359777))))

(declare-fun lt!290616 () SeekEntryResult!6679)

(assert (=> b!629023 (= res!406580 (or (= lt!290616 (MissingZero!6679 i!1108)) (= lt!290616 (MissingVacant!6679 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38001 (_ BitVec 32)) SeekEntryResult!6679)

(assert (=> b!629023 (= lt!290616 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!629024 () Bool)

(declare-fun res!406573 () Bool)

(assert (=> b!629024 (=> (not res!406573) (not e!359777))))

(declare-datatypes ((List!12280 0))(
  ( (Nil!12277) (Cons!12276 (h!13321 (_ BitVec 64)) (t!18508 List!12280)) )
))
(declare-fun arrayNoDuplicates!0 (array!38001 (_ BitVec 32) List!12280) Bool)

(assert (=> b!629024 (= res!406573 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12277))))

(declare-fun b!629025 () Bool)

(declare-fun res!406575 () Bool)

(assert (=> b!629025 (=> (not res!406575) (not e!359781))))

(assert (=> b!629025 (= res!406575 (and (= (size!18603 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18603 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18603 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!629026 () Bool)

(declare-fun res!406579 () Bool)

(assert (=> b!629026 (=> (not res!406579) (not e!359777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38001 (_ BitVec 32)) Bool)

(assert (=> b!629026 (= res!406579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!629027 () Bool)

(declare-fun res!406581 () Bool)

(assert (=> b!629027 (=> (not res!406581) (not e!359781))))

(assert (=> b!629027 (= res!406581 (validKeyInArray!0 (select (arr!18239 a!2986) j!136)))))

(assert (= (and start!56760 res!406572) b!629025))

(assert (= (and b!629025 res!406575) b!629027))

(assert (= (and b!629027 res!406581) b!629018))

(assert (= (and b!629018 res!406578) b!629022))

(assert (= (and b!629022 res!406576) b!629023))

(assert (= (and b!629023 res!406580) b!629026))

(assert (= (and b!629026 res!406579) b!629024))

(assert (= (and b!629024 res!406573) b!629016))

(assert (= (and b!629016 res!406582) b!629020))

(assert (= (and b!629020 res!406583) b!629017))

(assert (= (and b!629017 res!406574) b!629019))

(assert (= (and b!629019 res!406577) b!629021))

(declare-fun m!604111 () Bool)

(assert (=> b!629018 m!604111))

(declare-fun m!604113 () Bool)

(assert (=> b!629021 m!604113))

(assert (=> b!629021 m!604113))

(declare-fun m!604115 () Bool)

(assert (=> b!629021 m!604115))

(assert (=> b!629020 m!604113))

(assert (=> b!629020 m!604113))

(declare-fun m!604117 () Bool)

(assert (=> b!629020 m!604117))

(declare-fun m!604119 () Bool)

(assert (=> b!629022 m!604119))

(declare-fun m!604121 () Bool)

(assert (=> b!629026 m!604121))

(declare-fun m!604123 () Bool)

(assert (=> b!629019 m!604123))

(declare-fun m!604125 () Bool)

(assert (=> b!629023 m!604125))

(assert (=> b!629027 m!604113))

(assert (=> b!629027 m!604113))

(declare-fun m!604127 () Bool)

(assert (=> b!629027 m!604127))

(declare-fun m!604129 () Bool)

(assert (=> b!629016 m!604129))

(declare-fun m!604131 () Bool)

(assert (=> b!629016 m!604131))

(declare-fun m!604133 () Bool)

(assert (=> b!629016 m!604133))

(declare-fun m!604135 () Bool)

(assert (=> b!629024 m!604135))

(declare-fun m!604137 () Bool)

(assert (=> start!56760 m!604137))

(declare-fun m!604139 () Bool)

(assert (=> start!56760 m!604139))

(declare-fun m!604141 () Bool)

(assert (=> b!629017 m!604141))

(assert (=> b!629017 m!604113))

(push 1)

(assert (not b!629026))

(assert (not b!629023))

(assert (not b!629027))

(assert (not b!629024))

(assert (not b!629019))

(assert (not b!629021))

(assert (not b!629018))

(assert (not b!629020))

(assert (not start!56760))

(assert (not b!629022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89069 () Bool)

(declare-fun lt!290629 () (_ BitVec 32))

(assert (=> d!89069 (and (bvsge lt!290629 #b00000000000000000000000000000000) (bvslt lt!290629 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89069 (= lt!290629 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89069 (validMask!0 mask!3053)))

(assert (=> d!89069 (= (nextIndex!0 index!984 x!910 mask!3053) lt!290629)))

(declare-fun bs!18973 () Bool)

(assert (= bs!18973 d!89069))

(declare-fun m!604155 () Bool)

(assert (=> bs!18973 m!604155))

(assert (=> bs!18973 m!604137))

(assert (=> b!629019 d!89069))

(declare-fun b!629125 () Bool)

(declare-fun e!359844 () SeekEntryResult!6679)

(assert (=> b!629125 (= e!359844 (MissingVacant!6679 vacantSpotIndex!68))))

(declare-fun b!629126 () Bool)

(declare-fun e!359843 () SeekEntryResult!6679)

(assert (=> b!629126 (= e!359843 (Found!6679 index!984))))

(declare-fun b!629127 () Bool)

(assert (=> b!629127 (= e!359844 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18239 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!629128 () Bool)

(declare-fun e!359845 () SeekEntryResult!6679)

(assert (=> b!629128 (= e!359845 e!359843)))

(declare-fun c!71626 () Bool)

(declare-fun lt!290657 () (_ BitVec 64))

(assert (=> b!629128 (= c!71626 (= lt!290657 (select (arr!18239 a!2986) j!136)))))

(declare-fun d!89071 () Bool)

(declare-fun lt!290658 () SeekEntryResult!6679)

(assert (=> d!89071 (and (or (is-Undefined!6679 lt!290658) (not (is-Found!6679 lt!290658)) (and (bvsge (index!29001 lt!290658) #b00000000000000000000000000000000) (bvslt (index!29001 lt!290658) (size!18603 a!2986)))) (or (is-Undefined!6679 lt!290658) (is-Found!6679 lt!290658) (not (is-MissingVacant!6679 lt!290658)) (not (= (index!29003 lt!290658) vacantSpotIndex!68)) (and (bvsge (index!29003 lt!290658) #b00000000000000000000000000000000) (bvslt (index!29003 lt!290658) (size!18603 a!2986)))) (or (is-Undefined!6679 lt!290658) (ite (is-Found!6679 lt!290658) (= (select (arr!18239 a!2986) (index!29001 lt!290658)) (select (arr!18239 a!2986) j!136)) (and (is-MissingVacant!6679 lt!290658) (= (index!29003 lt!290658) vacantSpotIndex!68) (= (select (arr!18239 a!2986) (index!29003 lt!290658)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89071 (= lt!290658 e!359845)))

(declare-fun c!71625 () Bool)

(assert (=> d!89071 (= c!71625 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89071 (= lt!290657 (select (arr!18239 a!2986) index!984))))

(assert (=> d!89071 (validMask!0 mask!3053)))

(assert (=> d!89071 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18239 a!2986) j!136) a!2986 mask!3053) lt!290658)))

(declare-fun b!629129 () Bool)

(declare-fun c!71627 () Bool)

(assert (=> b!629129 (= c!71627 (= lt!290657 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!629129 (= e!359843 e!359844)))

(declare-fun b!629130 () Bool)

(assert (=> b!629130 (= e!359845 Undefined!6679)))

(assert (= (and d!89071 c!71625) b!629130))

(assert (= (and d!89071 (not c!71625)) b!629128))

(assert (= (and b!629128 c!71626) b!629126))

(assert (= (and b!629128 (not c!71626)) b!629129))

(assert (= (and b!629129 c!71627) b!629125))

(assert (= (and b!629129 (not c!71627)) b!629127))

(assert (=> b!629127 m!604123))

(assert (=> b!629127 m!604123))

(assert (=> b!629127 m!604113))

(declare-fun m!604199 () Bool)

(assert (=> b!629127 m!604199))

(declare-fun m!604201 () Bool)

(assert (=> d!89071 m!604201))

(declare-fun m!604203 () Bool)

(assert (=> d!89071 m!604203))

(assert (=> d!89071 m!604141))

(assert (=> d!89071 m!604137))

(assert (=> b!629020 d!89071))

(declare-fun b!629141 () Bool)

(declare-fun e!359855 () Bool)

(declare-fun e!359856 () Bool)

(assert (=> b!629141 (= e!359855 e!359856)))

(declare-fun c!71630 () Bool)

(assert (=> b!629141 (= c!71630 (validKeyInArray!0 (select (arr!18239 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!629142 () Bool)

(declare-fun e!359854 () Bool)

(declare-fun call!33284 () Bool)

(assert (=> b!629142 (= e!359854 call!33284)))

(declare-fun bm!33281 () Bool)

(assert (=> bm!33281 (= call!33284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89089 () Bool)

