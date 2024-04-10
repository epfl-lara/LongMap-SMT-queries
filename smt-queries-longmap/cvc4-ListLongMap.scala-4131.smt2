; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56336 () Bool)

(assert start!56336)

(declare-fun b!624707 () Bool)

(declare-fun res!402865 () Bool)

(declare-fun e!358179 () Bool)

(assert (=> b!624707 (=> (not res!402865) (not e!358179))))

(declare-datatypes ((array!37761 0))(
  ( (array!37762 (arr!18125 (Array (_ BitVec 32) (_ BitVec 64))) (size!18489 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37761)

(declare-datatypes ((List!12166 0))(
  ( (Nil!12163) (Cons!12162 (h!13207 (_ BitVec 64)) (t!18394 List!12166)) )
))
(declare-fun arrayNoDuplicates!0 (array!37761 (_ BitVec 32) List!12166) Bool)

(assert (=> b!624707 (= res!402865 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12163))))

(declare-fun res!402858 () Bool)

(declare-fun e!358178 () Bool)

(assert (=> start!56336 (=> (not res!402858) (not e!358178))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56336 (= res!402858 (validMask!0 mask!3053))))

(assert (=> start!56336 e!358178))

(assert (=> start!56336 true))

(declare-fun array_inv!13921 (array!37761) Bool)

(assert (=> start!56336 (array_inv!13921 a!2986)))

(declare-fun b!624708 () Bool)

(assert (=> b!624708 (= e!358178 e!358179)))

(declare-fun res!402866 () Bool)

(assert (=> b!624708 (=> (not res!402866) (not e!358179))))

(declare-datatypes ((SeekEntryResult!6565 0))(
  ( (MissingZero!6565 (index!28544 (_ BitVec 32))) (Found!6565 (index!28545 (_ BitVec 32))) (Intermediate!6565 (undefined!7377 Bool) (index!28546 (_ BitVec 32)) (x!57296 (_ BitVec 32))) (Undefined!6565) (MissingVacant!6565 (index!28547 (_ BitVec 32))) )
))
(declare-fun lt!289648 () SeekEntryResult!6565)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624708 (= res!402866 (or (= lt!289648 (MissingZero!6565 i!1108)) (= lt!289648 (MissingVacant!6565 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37761 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!624708 (= lt!289648 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624709 () Bool)

(declare-fun res!402859 () Bool)

(assert (=> b!624709 (=> (not res!402859) (not e!358179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37761 (_ BitVec 32)) Bool)

(assert (=> b!624709 (= res!402859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624710 () Bool)

(declare-fun res!402860 () Bool)

(assert (=> b!624710 (=> (not res!402860) (not e!358178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624710 (= res!402860 (validKeyInArray!0 k!1786))))

(declare-fun b!624711 () Bool)

(declare-fun res!402864 () Bool)

(assert (=> b!624711 (=> (not res!402864) (not e!358178))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624711 (= res!402864 (validKeyInArray!0 (select (arr!18125 a!2986) j!136)))))

(declare-fun b!624712 () Bool)

(declare-fun res!402861 () Bool)

(assert (=> b!624712 (=> (not res!402861) (not e!358179))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37761 (_ BitVec 32)) SeekEntryResult!6565)

(assert (=> b!624712 (= res!402861 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18125 a!2986) j!136) a!2986 mask!3053) (Found!6565 j!136)))))

(declare-fun b!624713 () Bool)

(declare-fun res!402857 () Bool)

(assert (=> b!624713 (=> (not res!402857) (not e!358178))))

(assert (=> b!624713 (= res!402857 (and (= (size!18489 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18489 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18489 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624714 () Bool)

(declare-fun res!402862 () Bool)

(assert (=> b!624714 (=> (not res!402862) (not e!358179))))

(assert (=> b!624714 (= res!402862 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18125 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18125 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624715 () Bool)

(declare-fun res!402863 () Bool)

(assert (=> b!624715 (=> (not res!402863) (not e!358178))))

(declare-fun arrayContainsKey!0 (array!37761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624715 (= res!402863 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624716 () Bool)

(assert (=> b!624716 (= e!358179 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (= (and start!56336 res!402858) b!624713))

(assert (= (and b!624713 res!402857) b!624711))

(assert (= (and b!624711 res!402864) b!624710))

(assert (= (and b!624710 res!402860) b!624715))

(assert (= (and b!624715 res!402863) b!624708))

(assert (= (and b!624708 res!402866) b!624709))

(assert (= (and b!624709 res!402859) b!624707))

(assert (= (and b!624707 res!402865) b!624714))

(assert (= (and b!624714 res!402862) b!624712))

(assert (= (and b!624712 res!402861) b!624716))

(declare-fun m!600387 () Bool)

(assert (=> b!624714 m!600387))

(declare-fun m!600389 () Bool)

(assert (=> b!624714 m!600389))

(declare-fun m!600391 () Bool)

(assert (=> b!624714 m!600391))

(declare-fun m!600393 () Bool)

(assert (=> b!624715 m!600393))

(declare-fun m!600395 () Bool)

(assert (=> b!624711 m!600395))

(assert (=> b!624711 m!600395))

(declare-fun m!600397 () Bool)

(assert (=> b!624711 m!600397))

(declare-fun m!600399 () Bool)

(assert (=> b!624710 m!600399))

(declare-fun m!600401 () Bool)

(assert (=> b!624708 m!600401))

(declare-fun m!600403 () Bool)

(assert (=> b!624707 m!600403))

(assert (=> b!624712 m!600395))

(assert (=> b!624712 m!600395))

(declare-fun m!600405 () Bool)

(assert (=> b!624712 m!600405))

(declare-fun m!600407 () Bool)

(assert (=> start!56336 m!600407))

(declare-fun m!600409 () Bool)

(assert (=> start!56336 m!600409))

(declare-fun m!600411 () Bool)

(assert (=> b!624709 m!600411))

(push 1)

(assert (not b!624709))

(assert (not b!624708))

(assert (not b!624715))

(assert (not b!624710))

(assert (not start!56336))

(assert (not b!624712))

(assert (not b!624707))

(assert (not b!624711))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!624800 () Bool)

(declare-fun e!358237 () Bool)

(declare-fun e!358238 () Bool)

(assert (=> b!624800 (= e!358237 e!358238)))

(declare-fun c!71318 () Bool)

(assert (=> b!624800 (= c!71318 (validKeyInArray!0 (select (arr!18125 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624801 () Bool)

(declare-fun call!33212 () Bool)

(assert (=> b!624801 (= e!358238 call!33212)))

(declare-fun d!88769 () Bool)

(declare-fun res!402899 () Bool)

(declare-fun e!358240 () Bool)

(assert (=> d!88769 (=> res!402899 e!358240)))

(assert (=> d!88769 (= res!402899 (bvsge #b00000000000000000000000000000000 (size!18489 a!2986)))))

(assert (=> d!88769 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12163) e!358240)))

(declare-fun b!624802 () Bool)

(assert (=> b!624802 (= e!358238 call!33212)))

(declare-fun b!624803 () Bool)

(assert (=> b!624803 (= e!358240 e!358237)))

(declare-fun res!402900 () Bool)

(assert (=> b!624803 (=> (not res!402900) (not e!358237))))

(declare-fun e!358239 () Bool)

(assert (=> b!624803 (= res!402900 (not e!358239))))

(declare-fun res!402898 () Bool)

(assert (=> b!624803 (=> (not res!402898) (not e!358239))))

(assert (=> b!624803 (= res!402898 (validKeyInArray!0 (select (arr!18125 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624804 () Bool)

(declare-fun contains!3076 (List!12166 (_ BitVec 64)) Bool)

(assert (=> b!624804 (= e!358239 (contains!3076 Nil!12163 (select (arr!18125 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33209 () Bool)

(assert (=> bm!33209 (= call!33212 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71318 (Cons!12162 (select (arr!18125 a!2986) #b00000000000000000000000000000000) Nil!12163) Nil!12163)))))

(assert (= (and d!88769 (not res!402899)) b!624803))

(assert (= (and b!624803 res!402898) b!624804))

(assert (= (and b!624803 res!402900) b!624800))

(assert (= (and b!624800 c!71318) b!624802))

(assert (= (and b!624800 (not c!71318)) b!624801))

(assert (= (or b!624802 b!624801) bm!33209))

(declare-fun m!600455 () Bool)

(assert (=> b!624800 m!600455))

(assert (=> b!624800 m!600455))

(declare-fun m!600457 () Bool)

(assert (=> b!624800 m!600457))

(assert (=> b!624803 m!600455))

(assert (=> b!624803 m!600455))

(assert (=> b!624803 m!600457))

(assert (=> b!624804 m!600455))

(assert (=> b!624804 m!600455))

(declare-fun m!600459 () Bool)

(assert (=> b!624804 m!600459))

(assert (=> bm!33209 m!600455))

(declare-fun m!600461 () Bool)

(assert (=> bm!33209 m!600461))

(assert (=> b!624707 d!88769))

(declare-fun b!624837 () Bool)

(declare-fun e!358258 () SeekEntryResult!6565)

(declare-fun e!358260 () SeekEntryResult!6565)

(assert (=> b!624837 (= e!358258 e!358260)))

(declare-fun lt!289691 () (_ BitVec 64))

(declare-fun c!71335 () Bool)

(assert (=> b!624837 (= c!71335 (= lt!289691 (select (arr!18125 a!2986) j!136)))))

(declare-fun b!624838 () Bool)

(assert (=> b!624838 (= e!358260 (Found!6565 index!984))))

(declare-fun lt!289690 () SeekEntryResult!6565)

(declare-fun d!88773 () Bool)

(assert (=> d!88773 (and (or (is-Undefined!6565 lt!289690) (not (is-Found!6565 lt!289690)) (and (bvsge (index!28545 lt!289690) #b00000000000000000000000000000000) (bvslt (index!28545 lt!289690) (size!18489 a!2986)))) (or (is-Undefined!6565 lt!289690) (is-Found!6565 lt!289690) (not (is-MissingVacant!6565 lt!289690)) (not (= (index!28547 lt!289690) vacantSpotIndex!68)) (and (bvsge (index!28547 lt!289690) #b00000000000000000000000000000000) (bvslt (index!28547 lt!289690) (size!18489 a!2986)))) (or (is-Undefined!6565 lt!289690) (ite (is-Found!6565 lt!289690) (= (select (arr!18125 a!2986) (index!28545 lt!289690)) (select (arr!18125 a!2986) j!136)) (and (is-MissingVacant!6565 lt!289690) (= (index!28547 lt!289690) vacantSpotIndex!68) (= (select (arr!18125 a!2986) (index!28547 lt!289690)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88773 (= lt!289690 e!358258)))

(declare-fun c!71334 () Bool)

(assert (=> d!88773 (= c!71334 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88773 (= lt!289691 (select (arr!18125 a!2986) index!984))))

(assert (=> d!88773 (validMask!0 mask!3053)))

(assert (=> d!88773 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18125 a!2986) j!136) a!2986 mask!3053) lt!289690)))

(declare-fun b!624839 () Bool)

(assert (=> b!624839 (= e!358258 Undefined!6565)))

(declare-fun b!624840 () Bool)

(declare-fun c!71336 () Bool)

(assert (=> b!624840 (= c!71336 (= lt!289691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358259 () SeekEntryResult!6565)

(assert (=> b!624840 (= e!358260 e!358259)))

(declare-fun b!624841 () Bool)

(assert (=> b!624841 (= e!358259 (MissingVacant!6565 vacantSpotIndex!68))))

(declare-fun b!624842 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!624842 (= e!358259 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18125 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!88773 c!71334) b!624839))

(assert (= (and d!88773 (not c!71334)) b!624837))

(assert (= (and b!624837 c!71335) b!624838))

(assert (= (and b!624837 (not c!71335)) b!624840))

(assert (= (and b!624840 c!71336) b!624841))

(assert (= (and b!624840 (not c!71336)) b!624842))

(declare-fun m!600475 () Bool)

(assert (=> d!88773 m!600475))

(declare-fun m!600477 () Bool)

(assert (=> d!88773 m!600477))

(declare-fun m!600479 () Bool)

(assert (=> d!88773 m!600479))

(assert (=> d!88773 m!600407))

(declare-fun m!600481 () Bool)

(assert (=> b!624842 m!600481))

(assert (=> b!624842 m!600481))

(assert (=> b!624842 m!600395))

(declare-fun m!600487 () Bool)

(assert (=> b!624842 m!600487))

(assert (=> b!624712 d!88773))

(declare-fun d!88785 () Bool)

(assert (=> d!88785 (= (validKeyInArray!0 (select (arr!18125 a!2986) j!136)) (and (not (= (select (arr!18125 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18125 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624711 d!88785))

(declare-fun d!88789 () Bool)

(assert (=> d!88789 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624710 d!88789))

(declare-fun d!88791 () Bool)

(declare-fun res!402907 () Bool)

(declare-fun e!358268 () Bool)

(assert (=> d!88791 (=> res!402907 e!358268)))

(assert (=> d!88791 (= res!402907 (= (select (arr!18125 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88791 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!358268)))

(declare-fun b!624853 () Bool)

(declare-fun e!358269 () Bool)

(assert (=> b!624853 (= e!358268 e!358269)))

(declare-fun res!402908 () Bool)

(assert (=> b!624853 (=> (not res!402908) (not e!358269))))

