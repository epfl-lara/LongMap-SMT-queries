; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54556 () Bool)

(assert start!54556)

(declare-fun b!596551 () Bool)

(declare-fun e!340834 () Bool)

(declare-fun e!340832 () Bool)

(assert (=> b!596551 (= e!340834 e!340832)))

(declare-fun res!382335 () Bool)

(assert (=> b!596551 (=> (not res!382335) (not e!340832))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6212 0))(
  ( (MissingZero!6212 (index!27096 (_ BitVec 32))) (Found!6212 (index!27097 (_ BitVec 32))) (Intermediate!6212 (undefined!7024 Bool) (index!27098 (_ BitVec 32)) (x!55896 (_ BitVec 32))) (Undefined!6212) (MissingVacant!6212 (index!27099 (_ BitVec 32))) )
))
(declare-fun lt!270951 () SeekEntryResult!6212)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37016 0))(
  ( (array!37017 (arr!17772 (Array (_ BitVec 32) (_ BitVec 64))) (size!18136 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37016)

(assert (=> b!596551 (= res!382335 (and (= lt!270951 (Found!6212 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17772 a!2986) index!984) (select (arr!17772 a!2986) j!136))) (not (= (select (arr!17772 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37016 (_ BitVec 32)) SeekEntryResult!6212)

(assert (=> b!596551 (= lt!270951 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17772 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596552 () Bool)

(declare-fun res!382331 () Bool)

(declare-fun e!340833 () Bool)

(assert (=> b!596552 (=> (not res!382331) (not e!340833))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596552 (= res!382331 (and (= (size!18136 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18136 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18136 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596553 () Bool)

(declare-fun res!382346 () Bool)

(assert (=> b!596553 (=> (not res!382346) (not e!340833))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596553 (= res!382346 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596554 () Bool)

(declare-fun e!340835 () Bool)

(declare-fun e!340839 () Bool)

(assert (=> b!596554 (= e!340835 e!340839)))

(declare-fun res!382341 () Bool)

(assert (=> b!596554 (=> res!382341 e!340839)))

(declare-fun lt!270954 () (_ BitVec 64))

(declare-fun lt!270958 () (_ BitVec 64))

(assert (=> b!596554 (= res!382341 (or (not (= (select (arr!17772 a!2986) j!136) lt!270954)) (not (= (select (arr!17772 a!2986) j!136) lt!270958)) (bvsge j!136 index!984)))))

(declare-fun b!596555 () Bool)

(declare-fun e!340836 () Bool)

(declare-fun e!340842 () Bool)

(assert (=> b!596555 (= e!340836 e!340842)))

(declare-fun res!382330 () Bool)

(assert (=> b!596555 (=> res!382330 e!340842)))

(assert (=> b!596555 (= res!382330 (or (not (= (select (arr!17772 a!2986) j!136) lt!270954)) (not (= (select (arr!17772 a!2986) j!136) lt!270958)) (bvsge j!136 index!984)))))

(assert (=> b!596555 e!340835))

(declare-fun res!382332 () Bool)

(assert (=> b!596555 (=> (not res!382332) (not e!340835))))

(assert (=> b!596555 (= res!382332 (= lt!270958 (select (arr!17772 a!2986) j!136)))))

(assert (=> b!596555 (= lt!270958 (select (store (arr!17772 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!596556 () Bool)

(declare-fun res!382349 () Bool)

(declare-fun e!340838 () Bool)

(assert (=> b!596556 (=> res!382349 e!340838)))

(declare-datatypes ((List!11813 0))(
  ( (Nil!11810) (Cons!11809 (h!12854 (_ BitVec 64)) (t!18041 List!11813)) )
))
(declare-fun contains!2948 (List!11813 (_ BitVec 64)) Bool)

(assert (=> b!596556 (= res!382349 (contains!2948 Nil!11810 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596557 () Bool)

(declare-fun res!382336 () Bool)

(assert (=> b!596557 (=> res!382336 e!340838)))

(assert (=> b!596557 (= res!382336 (contains!2948 Nil!11810 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596559 () Bool)

(assert (=> b!596559 (= e!340832 (not e!340836))))

(declare-fun res!382345 () Bool)

(assert (=> b!596559 (=> res!382345 e!340836)))

(declare-fun lt!270952 () SeekEntryResult!6212)

(assert (=> b!596559 (= res!382345 (not (= lt!270952 (Found!6212 index!984))))))

(declare-datatypes ((Unit!18766 0))(
  ( (Unit!18767) )
))
(declare-fun lt!270960 () Unit!18766)

(declare-fun e!340830 () Unit!18766)

(assert (=> b!596559 (= lt!270960 e!340830)))

(declare-fun c!67478 () Bool)

(assert (=> b!596559 (= c!67478 (= lt!270952 Undefined!6212))))

(declare-fun lt!270957 () array!37016)

(assert (=> b!596559 (= lt!270952 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270954 lt!270957 mask!3053))))

(declare-fun e!340841 () Bool)

(assert (=> b!596559 e!340841))

(declare-fun res!382334 () Bool)

(assert (=> b!596559 (=> (not res!382334) (not e!340841))))

(declare-fun lt!270955 () SeekEntryResult!6212)

(declare-fun lt!270956 () (_ BitVec 32))

(assert (=> b!596559 (= res!382334 (= lt!270955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270956 vacantSpotIndex!68 lt!270954 lt!270957 mask!3053)))))

(assert (=> b!596559 (= lt!270955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270956 vacantSpotIndex!68 (select (arr!17772 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596559 (= lt!270954 (select (store (arr!17772 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270961 () Unit!18766)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37016 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18766)

(assert (=> b!596559 (= lt!270961 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270956 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596559 (= lt!270956 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596560 () Bool)

(assert (=> b!596560 (= e!340841 (= lt!270951 lt!270955))))

(declare-fun b!596561 () Bool)

(declare-fun e!340831 () Bool)

(assert (=> b!596561 (= e!340831 e!340834)))

(declare-fun res!382342 () Bool)

(assert (=> b!596561 (=> (not res!382342) (not e!340834))))

(assert (=> b!596561 (= res!382342 (= (select (store (arr!17772 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596561 (= lt!270957 (array!37017 (store (arr!17772 a!2986) i!1108 k!1786) (size!18136 a!2986)))))

(declare-fun b!596562 () Bool)

(assert (=> b!596562 (= e!340842 e!340838)))

(declare-fun res!382337 () Bool)

(assert (=> b!596562 (=> res!382337 e!340838)))

(assert (=> b!596562 (= res!382337 (or (bvsge (size!18136 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18136 a!2986))))))

(assert (=> b!596562 (arrayContainsKey!0 lt!270957 (select (arr!17772 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270959 () Unit!18766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37016 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18766)

(assert (=> b!596562 (= lt!270959 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270957 (select (arr!17772 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596563 () Bool)

(declare-fun res!382338 () Bool)

(assert (=> b!596563 (=> (not res!382338) (not e!340831))))

(assert (=> b!596563 (= res!382338 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17772 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596564 () Bool)

(declare-fun res!382348 () Bool)

(assert (=> b!596564 (=> (not res!382348) (not e!340831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37016 (_ BitVec 32)) Bool)

(assert (=> b!596564 (= res!382348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596565 () Bool)

(declare-fun res!382344 () Bool)

(assert (=> b!596565 (=> (not res!382344) (not e!340831))))

(declare-fun arrayNoDuplicates!0 (array!37016 (_ BitVec 32) List!11813) Bool)

(assert (=> b!596565 (= res!382344 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11810))))

(declare-fun b!596566 () Bool)

(assert (=> b!596566 (= e!340833 e!340831)))

(declare-fun res!382347 () Bool)

(assert (=> b!596566 (=> (not res!382347) (not e!340831))))

(declare-fun lt!270950 () SeekEntryResult!6212)

(assert (=> b!596566 (= res!382347 (or (= lt!270950 (MissingZero!6212 i!1108)) (= lt!270950 (MissingVacant!6212 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37016 (_ BitVec 32)) SeekEntryResult!6212)

(assert (=> b!596566 (= lt!270950 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596567 () Bool)

(assert (=> b!596567 (= e!340838 true)))

(declare-fun lt!270953 () Bool)

(assert (=> b!596567 (= lt!270953 (contains!2948 Nil!11810 k!1786))))

(declare-fun b!596568 () Bool)

(declare-fun Unit!18768 () Unit!18766)

(assert (=> b!596568 (= e!340830 Unit!18768)))

(assert (=> b!596568 false))

(declare-fun e!340837 () Bool)

(declare-fun b!596569 () Bool)

(assert (=> b!596569 (= e!340837 (arrayContainsKey!0 lt!270957 (select (arr!17772 a!2986) j!136) index!984))))

(declare-fun res!382339 () Bool)

(assert (=> start!54556 (=> (not res!382339) (not e!340833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54556 (= res!382339 (validMask!0 mask!3053))))

(assert (=> start!54556 e!340833))

(assert (=> start!54556 true))

(declare-fun array_inv!13568 (array!37016) Bool)

(assert (=> start!54556 (array_inv!13568 a!2986)))

(declare-fun b!596558 () Bool)

(declare-fun res!382343 () Bool)

(assert (=> b!596558 (=> (not res!382343) (not e!340833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596558 (= res!382343 (validKeyInArray!0 k!1786))))

(declare-fun b!596570 () Bool)

(declare-fun res!382340 () Bool)

(assert (=> b!596570 (=> res!382340 e!340838)))

(declare-fun noDuplicate!267 (List!11813) Bool)

(assert (=> b!596570 (= res!382340 (not (noDuplicate!267 Nil!11810)))))

(declare-fun b!596571 () Bool)

(assert (=> b!596571 (= e!340839 e!340837)))

(declare-fun res!382333 () Bool)

(assert (=> b!596571 (=> (not res!382333) (not e!340837))))

(assert (=> b!596571 (= res!382333 (arrayContainsKey!0 lt!270957 (select (arr!17772 a!2986) j!136) j!136))))

(declare-fun b!596572 () Bool)

(declare-fun Unit!18769 () Unit!18766)

(assert (=> b!596572 (= e!340830 Unit!18769)))

(declare-fun b!596573 () Bool)

(declare-fun res!382329 () Bool)

(assert (=> b!596573 (=> (not res!382329) (not e!340833))))

(assert (=> b!596573 (= res!382329 (validKeyInArray!0 (select (arr!17772 a!2986) j!136)))))

(assert (= (and start!54556 res!382339) b!596552))

(assert (= (and b!596552 res!382331) b!596573))

(assert (= (and b!596573 res!382329) b!596558))

(assert (= (and b!596558 res!382343) b!596553))

(assert (= (and b!596553 res!382346) b!596566))

(assert (= (and b!596566 res!382347) b!596564))

(assert (= (and b!596564 res!382348) b!596565))

(assert (= (and b!596565 res!382344) b!596563))

(assert (= (and b!596563 res!382338) b!596561))

(assert (= (and b!596561 res!382342) b!596551))

(assert (= (and b!596551 res!382335) b!596559))

(assert (= (and b!596559 res!382334) b!596560))

(assert (= (and b!596559 c!67478) b!596568))

(assert (= (and b!596559 (not c!67478)) b!596572))

(assert (= (and b!596559 (not res!382345)) b!596555))

(assert (= (and b!596555 res!382332) b!596554))

(assert (= (and b!596554 (not res!382341)) b!596571))

(assert (= (and b!596571 res!382333) b!596569))

(assert (= (and b!596555 (not res!382330)) b!596562))

(assert (= (and b!596562 (not res!382337)) b!596570))

(assert (= (and b!596570 (not res!382340)) b!596556))

(assert (= (and b!596556 (not res!382349)) b!596557))

(assert (= (and b!596557 (not res!382336)) b!596567))

(declare-fun m!574025 () Bool)

(assert (=> b!596556 m!574025))

(declare-fun m!574027 () Bool)

(assert (=> b!596565 m!574027))

(declare-fun m!574029 () Bool)

(assert (=> b!596553 m!574029))

(declare-fun m!574031 () Bool)

(assert (=> b!596573 m!574031))

(assert (=> b!596573 m!574031))

(declare-fun m!574033 () Bool)

(assert (=> b!596573 m!574033))

(declare-fun m!574035 () Bool)

(assert (=> b!596564 m!574035))

(declare-fun m!574037 () Bool)

(assert (=> start!54556 m!574037))

(declare-fun m!574039 () Bool)

(assert (=> start!54556 m!574039))

(declare-fun m!574041 () Bool)

(assert (=> b!596570 m!574041))

(declare-fun m!574043 () Bool)

(assert (=> b!596558 m!574043))

(assert (=> b!596554 m!574031))

(assert (=> b!596562 m!574031))

(assert (=> b!596562 m!574031))

(declare-fun m!574045 () Bool)

(assert (=> b!596562 m!574045))

(assert (=> b!596562 m!574031))

(declare-fun m!574047 () Bool)

(assert (=> b!596562 m!574047))

(declare-fun m!574049 () Bool)

(assert (=> b!596551 m!574049))

(assert (=> b!596551 m!574031))

(assert (=> b!596551 m!574031))

(declare-fun m!574051 () Bool)

(assert (=> b!596551 m!574051))

(declare-fun m!574053 () Bool)

(assert (=> b!596559 m!574053))

(declare-fun m!574055 () Bool)

(assert (=> b!596559 m!574055))

(assert (=> b!596559 m!574031))

(declare-fun m!574057 () Bool)

(assert (=> b!596559 m!574057))

(declare-fun m!574059 () Bool)

(assert (=> b!596559 m!574059))

(declare-fun m!574061 () Bool)

(assert (=> b!596559 m!574061))

(assert (=> b!596559 m!574031))

(declare-fun m!574063 () Bool)

(assert (=> b!596559 m!574063))

(declare-fun m!574065 () Bool)

(assert (=> b!596559 m!574065))

(assert (=> b!596561 m!574057))

(declare-fun m!574067 () Bool)

(assert (=> b!596561 m!574067))

(assert (=> b!596571 m!574031))

(assert (=> b!596571 m!574031))

(declare-fun m!574069 () Bool)

(assert (=> b!596571 m!574069))

(declare-fun m!574071 () Bool)

(assert (=> b!596563 m!574071))

(declare-fun m!574073 () Bool)

(assert (=> b!596567 m!574073))

(assert (=> b!596569 m!574031))

(assert (=> b!596569 m!574031))

(declare-fun m!574075 () Bool)

(assert (=> b!596569 m!574075))

(assert (=> b!596555 m!574031))

(assert (=> b!596555 m!574057))

(declare-fun m!574077 () Bool)

(assert (=> b!596555 m!574077))

(declare-fun m!574079 () Bool)

(assert (=> b!596557 m!574079))

(declare-fun m!574081 () Bool)

(assert (=> b!596566 m!574081))

(push 1)

