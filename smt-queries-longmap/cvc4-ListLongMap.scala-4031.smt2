; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54896 () Bool)

(assert start!54896)

(declare-fun b!600845 () Bool)

(declare-fun e!343536 () Bool)

(declare-fun e!343535 () Bool)

(assert (=> b!600845 (= e!343536 e!343535)))

(declare-fun res!385699 () Bool)

(assert (=> b!600845 (=> (not res!385699) (not e!343535))))

(declare-datatypes ((SeekEntryResult!6265 0))(
  ( (MissingZero!6265 (index!27317 (_ BitVec 32))) (Found!6265 (index!27318 (_ BitVec 32))) (Intermediate!6265 (undefined!7077 Bool) (index!27319 (_ BitVec 32)) (x!56112 (_ BitVec 32))) (Undefined!6265) (MissingVacant!6265 (index!27320 (_ BitVec 32))) )
))
(declare-fun lt!273401 () SeekEntryResult!6265)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600845 (= res!385699 (or (= lt!273401 (MissingZero!6265 i!1108)) (= lt!273401 (MissingVacant!6265 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37131 0))(
  ( (array!37132 (arr!17825 (Array (_ BitVec 32) (_ BitVec 64))) (size!18189 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37131)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37131 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!600845 (= lt!273401 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600846 () Bool)

(declare-fun res!385694 () Bool)

(assert (=> b!600846 (=> (not res!385694) (not e!343536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600846 (= res!385694 (validKeyInArray!0 k!1786))))

(declare-fun b!600847 () Bool)

(declare-fun res!385709 () Bool)

(assert (=> b!600847 (=> (not res!385709) (not e!343535))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!600847 (= res!385709 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17825 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600848 () Bool)

(declare-fun res!385698 () Bool)

(assert (=> b!600848 (=> (not res!385698) (not e!343536))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!600848 (= res!385698 (and (= (size!18189 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18189 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18189 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600849 () Bool)

(declare-fun res!385700 () Bool)

(assert (=> b!600849 (=> (not res!385700) (not e!343536))))

(declare-fun arrayContainsKey!0 (array!37131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600849 (= res!385700 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600850 () Bool)

(declare-fun e!343537 () Bool)

(declare-fun e!343545 () Bool)

(assert (=> b!600850 (= e!343537 e!343545)))

(declare-fun res!385701 () Bool)

(assert (=> b!600850 (=> (not res!385701) (not e!343545))))

(declare-fun lt!273395 () array!37131)

(assert (=> b!600850 (= res!385701 (arrayContainsKey!0 lt!273395 (select (arr!17825 a!2986) j!136) j!136))))

(declare-fun b!600851 () Bool)

(declare-datatypes ((Unit!18978 0))(
  ( (Unit!18979) )
))
(declare-fun e!343534 () Unit!18978)

(declare-fun Unit!18980 () Unit!18978)

(assert (=> b!600851 (= e!343534 Unit!18980)))

(assert (=> b!600851 false))

(declare-fun b!600852 () Bool)

(declare-fun Unit!18981 () Unit!18978)

(assert (=> b!600852 (= e!343534 Unit!18981)))

(declare-fun b!600853 () Bool)

(declare-fun e!343533 () Bool)

(declare-fun e!343541 () Bool)

(assert (=> b!600853 (= e!343533 e!343541)))

(declare-fun res!385693 () Bool)

(assert (=> b!600853 (=> res!385693 e!343541)))

(declare-fun lt!273402 () (_ BitVec 64))

(declare-fun lt!273394 () (_ BitVec 64))

(assert (=> b!600853 (= res!385693 (or (not (= (select (arr!17825 a!2986) j!136) lt!273402)) (not (= (select (arr!17825 a!2986) j!136) lt!273394)) (bvsge j!136 index!984)))))

(declare-fun e!343543 () Bool)

(assert (=> b!600853 e!343543))

(declare-fun res!385708 () Bool)

(assert (=> b!600853 (=> (not res!385708) (not e!343543))))

(assert (=> b!600853 (= res!385708 (= lt!273394 (select (arr!17825 a!2986) j!136)))))

(assert (=> b!600853 (= lt!273394 (select (store (arr!17825 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600854 () Bool)

(declare-fun e!343540 () Bool)

(assert (=> b!600854 (= e!343540 (not e!343533))))

(declare-fun res!385710 () Bool)

(assert (=> b!600854 (=> res!385710 e!343533)))

(declare-fun lt!273391 () SeekEntryResult!6265)

(assert (=> b!600854 (= res!385710 (not (= lt!273391 (Found!6265 index!984))))))

(declare-fun lt!273397 () Unit!18978)

(assert (=> b!600854 (= lt!273397 e!343534)))

(declare-fun c!67943 () Bool)

(assert (=> b!600854 (= c!67943 (= lt!273391 Undefined!6265))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37131 (_ BitVec 32)) SeekEntryResult!6265)

(assert (=> b!600854 (= lt!273391 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273402 lt!273395 mask!3053))))

(declare-fun e!343538 () Bool)

(assert (=> b!600854 e!343538))

(declare-fun res!385711 () Bool)

(assert (=> b!600854 (=> (not res!385711) (not e!343538))))

(declare-fun lt!273398 () SeekEntryResult!6265)

(declare-fun lt!273393 () (_ BitVec 32))

(assert (=> b!600854 (= res!385711 (= lt!273398 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273393 vacantSpotIndex!68 lt!273402 lt!273395 mask!3053)))))

(assert (=> b!600854 (= lt!273398 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273393 vacantSpotIndex!68 (select (arr!17825 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600854 (= lt!273402 (select (store (arr!17825 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273390 () Unit!18978)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37131 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18978)

(assert (=> b!600854 (= lt!273390 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273393 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600854 (= lt!273393 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600855 () Bool)

(declare-fun res!385696 () Bool)

(assert (=> b!600855 (=> (not res!385696) (not e!343535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37131 (_ BitVec 32)) Bool)

(assert (=> b!600855 (= res!385696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600856 () Bool)

(declare-fun res!385703 () Bool)

(assert (=> b!600856 (=> (not res!385703) (not e!343536))))

(assert (=> b!600856 (= res!385703 (validKeyInArray!0 (select (arr!17825 a!2986) j!136)))))

(declare-fun b!600857 () Bool)

(declare-fun e!343544 () Bool)

(assert (=> b!600857 (= e!343541 e!343544)))

(declare-fun res!385704 () Bool)

(assert (=> b!600857 (=> res!385704 e!343544)))

(assert (=> b!600857 (= res!385704 (or (bvsge (size!18189 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18189 a!2986))))))

(declare-datatypes ((List!11866 0))(
  ( (Nil!11863) (Cons!11862 (h!12907 (_ BitVec 64)) (t!18094 List!11866)) )
))
(declare-fun arrayNoDuplicates!0 (array!37131 (_ BitVec 32) List!11866) Bool)

(assert (=> b!600857 (arrayNoDuplicates!0 lt!273395 j!136 Nil!11863)))

(declare-fun lt!273392 () Unit!18978)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37131 (_ BitVec 32) (_ BitVec 32)) Unit!18978)

(assert (=> b!600857 (= lt!273392 (lemmaNoDuplicateFromThenFromBigger!0 lt!273395 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600857 (arrayNoDuplicates!0 lt!273395 #b00000000000000000000000000000000 Nil!11863)))

(declare-fun lt!273400 () Unit!18978)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11866) Unit!18978)

(assert (=> b!600857 (= lt!273400 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11863))))

(assert (=> b!600857 (arrayContainsKey!0 lt!273395 (select (arr!17825 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273396 () Unit!18978)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37131 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18978)

(assert (=> b!600857 (= lt!273396 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273395 (select (arr!17825 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600858 () Bool)

(declare-fun e!343542 () Bool)

(assert (=> b!600858 (= e!343535 e!343542)))

(declare-fun res!385705 () Bool)

(assert (=> b!600858 (=> (not res!385705) (not e!343542))))

(assert (=> b!600858 (= res!385705 (= (select (store (arr!17825 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600858 (= lt!273395 (array!37132 (store (arr!17825 a!2986) i!1108 k!1786) (size!18189 a!2986)))))

(declare-fun b!600859 () Bool)

(declare-fun res!385707 () Bool)

(assert (=> b!600859 (=> (not res!385707) (not e!343535))))

(assert (=> b!600859 (= res!385707 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11863))))

(declare-fun b!600860 () Bool)

(declare-fun lt!273403 () SeekEntryResult!6265)

(assert (=> b!600860 (= e!343538 (= lt!273403 lt!273398))))

(declare-fun b!600861 () Bool)

(declare-fun res!385702 () Bool)

(assert (=> b!600861 (=> res!385702 e!343544)))

(declare-fun noDuplicate!299 (List!11866) Bool)

(assert (=> b!600861 (= res!385702 (not (noDuplicate!299 Nil!11863)))))

(declare-fun b!600862 () Bool)

(assert (=> b!600862 (= e!343543 e!343537)))

(declare-fun res!385712 () Bool)

(assert (=> b!600862 (=> res!385712 e!343537)))

(assert (=> b!600862 (= res!385712 (or (not (= (select (arr!17825 a!2986) j!136) lt!273402)) (not (= (select (arr!17825 a!2986) j!136) lt!273394)) (bvsge j!136 index!984)))))

(declare-fun b!600863 () Bool)

(assert (=> b!600863 (= e!343544 true)))

(declare-fun lt!273399 () Bool)

(declare-fun contains!2982 (List!11866 (_ BitVec 64)) Bool)

(assert (=> b!600863 (= lt!273399 (contains!2982 Nil!11863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600864 () Bool)

(assert (=> b!600864 (= e!343542 e!343540)))

(declare-fun res!385697 () Bool)

(assert (=> b!600864 (=> (not res!385697) (not e!343540))))

(assert (=> b!600864 (= res!385697 (and (= lt!273403 (Found!6265 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17825 a!2986) index!984) (select (arr!17825 a!2986) j!136))) (not (= (select (arr!17825 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600864 (= lt!273403 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17825 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!385706 () Bool)

(assert (=> start!54896 (=> (not res!385706) (not e!343536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54896 (= res!385706 (validMask!0 mask!3053))))

(assert (=> start!54896 e!343536))

(assert (=> start!54896 true))

(declare-fun array_inv!13621 (array!37131) Bool)

(assert (=> start!54896 (array_inv!13621 a!2986)))

(declare-fun b!600865 () Bool)

(declare-fun res!385695 () Bool)

(assert (=> b!600865 (=> res!385695 e!343544)))

(assert (=> b!600865 (= res!385695 (contains!2982 Nil!11863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600866 () Bool)

(assert (=> b!600866 (= e!343545 (arrayContainsKey!0 lt!273395 (select (arr!17825 a!2986) j!136) index!984))))

(assert (= (and start!54896 res!385706) b!600848))

(assert (= (and b!600848 res!385698) b!600856))

(assert (= (and b!600856 res!385703) b!600846))

(assert (= (and b!600846 res!385694) b!600849))

(assert (= (and b!600849 res!385700) b!600845))

(assert (= (and b!600845 res!385699) b!600855))

(assert (= (and b!600855 res!385696) b!600859))

(assert (= (and b!600859 res!385707) b!600847))

(assert (= (and b!600847 res!385709) b!600858))

(assert (= (and b!600858 res!385705) b!600864))

(assert (= (and b!600864 res!385697) b!600854))

(assert (= (and b!600854 res!385711) b!600860))

(assert (= (and b!600854 c!67943) b!600851))

(assert (= (and b!600854 (not c!67943)) b!600852))

(assert (= (and b!600854 (not res!385710)) b!600853))

(assert (= (and b!600853 res!385708) b!600862))

(assert (= (and b!600862 (not res!385712)) b!600850))

(assert (= (and b!600850 res!385701) b!600866))

(assert (= (and b!600853 (not res!385693)) b!600857))

(assert (= (and b!600857 (not res!385704)) b!600861))

(assert (= (and b!600861 (not res!385702)) b!600865))

(assert (= (and b!600865 (not res!385695)) b!600863))

(declare-fun m!578053 () Bool)

(assert (=> b!600857 m!578053))

(assert (=> b!600857 m!578053))

(declare-fun m!578055 () Bool)

(assert (=> b!600857 m!578055))

(declare-fun m!578057 () Bool)

(assert (=> b!600857 m!578057))

(assert (=> b!600857 m!578053))

(declare-fun m!578059 () Bool)

(assert (=> b!600857 m!578059))

(declare-fun m!578061 () Bool)

(assert (=> b!600857 m!578061))

(declare-fun m!578063 () Bool)

(assert (=> b!600857 m!578063))

(declare-fun m!578065 () Bool)

(assert (=> b!600857 m!578065))

(assert (=> b!600866 m!578053))

(assert (=> b!600866 m!578053))

(declare-fun m!578067 () Bool)

(assert (=> b!600866 m!578067))

(declare-fun m!578069 () Bool)

(assert (=> b!600847 m!578069))

(declare-fun m!578071 () Bool)

(assert (=> b!600863 m!578071))

(declare-fun m!578073 () Bool)

(assert (=> b!600865 m!578073))

(declare-fun m!578075 () Bool)

(assert (=> b!600855 m!578075))

(assert (=> b!600853 m!578053))

(declare-fun m!578077 () Bool)

(assert (=> b!600853 m!578077))

(declare-fun m!578079 () Bool)

(assert (=> b!600853 m!578079))

(assert (=> b!600856 m!578053))

(assert (=> b!600856 m!578053))

(declare-fun m!578081 () Bool)

(assert (=> b!600856 m!578081))

(declare-fun m!578083 () Bool)

(assert (=> b!600845 m!578083))

(assert (=> b!600862 m!578053))

(declare-fun m!578085 () Bool)

(assert (=> b!600861 m!578085))

(declare-fun m!578087 () Bool)

(assert (=> b!600846 m!578087))

(declare-fun m!578089 () Bool)

(assert (=> start!54896 m!578089))

(declare-fun m!578091 () Bool)

(assert (=> start!54896 m!578091))

(declare-fun m!578093 () Bool)

(assert (=> b!600849 m!578093))

(assert (=> b!600850 m!578053))

(assert (=> b!600850 m!578053))

(declare-fun m!578095 () Bool)

(assert (=> b!600850 m!578095))

(declare-fun m!578097 () Bool)

(assert (=> b!600854 m!578097))

(declare-fun m!578099 () Bool)

(assert (=> b!600854 m!578099))

(assert (=> b!600854 m!578053))

(assert (=> b!600854 m!578077))

(declare-fun m!578101 () Bool)

(assert (=> b!600854 m!578101))

(declare-fun m!578103 () Bool)

(assert (=> b!600854 m!578103))

(declare-fun m!578105 () Bool)

(assert (=> b!600854 m!578105))

(assert (=> b!600854 m!578053))

(declare-fun m!578107 () Bool)

(assert (=> b!600854 m!578107))

(declare-fun m!578109 () Bool)

(assert (=> b!600864 m!578109))

(assert (=> b!600864 m!578053))

(assert (=> b!600864 m!578053))

(declare-fun m!578111 () Bool)

(assert (=> b!600864 m!578111))

(declare-fun m!578113 () Bool)

(assert (=> b!600859 m!578113))

(assert (=> b!600858 m!578077))

(declare-fun m!578115 () Bool)

(assert (=> b!600858 m!578115))

(push 1)

