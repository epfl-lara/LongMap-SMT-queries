; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54916 () Bool)

(assert start!54916)

(declare-fun b!601485 () Bool)

(declare-fun res!386233 () Bool)

(declare-fun e!343930 () Bool)

(assert (=> b!601485 (=> (not res!386233) (not e!343930))))

(declare-datatypes ((array!37151 0))(
  ( (array!37152 (arr!17835 (Array (_ BitVec 32) (_ BitVec 64))) (size!18199 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37151)

(declare-datatypes ((List!11876 0))(
  ( (Nil!11873) (Cons!11872 (h!12917 (_ BitVec 64)) (t!18104 List!11876)) )
))
(declare-fun arrayNoDuplicates!0 (array!37151 (_ BitVec 32) List!11876) Bool)

(assert (=> b!601485 (= res!386233 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11873))))

(declare-fun b!601486 () Bool)

(declare-fun res!386249 () Bool)

(declare-fun e!343927 () Bool)

(assert (=> b!601486 (=> (not res!386249) (not e!343927))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601486 (= res!386249 (validKeyInArray!0 (select (arr!17835 a!2986) j!136)))))

(declare-fun b!601487 () Bool)

(declare-datatypes ((Unit!19030 0))(
  ( (Unit!19031) )
))
(declare-fun e!343933 () Unit!19030)

(declare-fun Unit!19032 () Unit!19030)

(assert (=> b!601487 (= e!343933 Unit!19032)))

(assert (=> b!601487 false))

(declare-fun res!386246 () Bool)

(assert (=> start!54916 (=> (not res!386246) (not e!343927))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54916 (= res!386246 (validMask!0 mask!3053))))

(assert (=> start!54916 e!343927))

(assert (=> start!54916 true))

(declare-fun array_inv!13631 (array!37151) Bool)

(assert (=> start!54916 (array_inv!13631 a!2986)))

(declare-fun b!601488 () Bool)

(declare-fun e!343924 () Bool)

(declare-fun e!343925 () Bool)

(assert (=> b!601488 (= e!343924 e!343925)))

(declare-fun res!386248 () Bool)

(assert (=> b!601488 (=> res!386248 e!343925)))

(declare-fun lt!273835 () (_ BitVec 64))

(declare-fun lt!273837 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601488 (= res!386248 (or (not (= (select (arr!17835 a!2986) j!136) lt!273835)) (not (= (select (arr!17835 a!2986) j!136) lt!273837)) (bvsge j!136 index!984)))))

(declare-fun b!601489 () Bool)

(declare-fun e!343931 () Bool)

(declare-fun e!343935 () Bool)

(assert (=> b!601489 (= e!343931 (not e!343935))))

(declare-fun res!386240 () Bool)

(assert (=> b!601489 (=> res!386240 e!343935)))

(declare-datatypes ((SeekEntryResult!6275 0))(
  ( (MissingZero!6275 (index!27357 (_ BitVec 32))) (Found!6275 (index!27358 (_ BitVec 32))) (Intermediate!6275 (undefined!7087 Bool) (index!27359 (_ BitVec 32)) (x!56154 (_ BitVec 32))) (Undefined!6275) (MissingVacant!6275 (index!27360 (_ BitVec 32))) )
))
(declare-fun lt!273838 () SeekEntryResult!6275)

(assert (=> b!601489 (= res!386240 (not (= lt!273838 (Found!6275 index!984))))))

(declare-fun lt!273834 () Unit!19030)

(assert (=> b!601489 (= lt!273834 e!343933)))

(declare-fun c!67993 () Bool)

(assert (=> b!601489 (= c!67993 (= lt!273838 Undefined!6275))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273836 () array!37151)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37151 (_ BitVec 32)) SeekEntryResult!6275)

(assert (=> b!601489 (= lt!273838 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273835 lt!273836 mask!3053))))

(declare-fun e!343926 () Bool)

(assert (=> b!601489 e!343926))

(declare-fun res!386245 () Bool)

(assert (=> b!601489 (=> (not res!386245) (not e!343926))))

(declare-fun lt!273842 () SeekEntryResult!6275)

(declare-fun lt!273839 () (_ BitVec 32))

(assert (=> b!601489 (= res!386245 (= lt!273842 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 lt!273835 lt!273836 mask!3053)))))

(assert (=> b!601489 (= lt!273842 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!601489 (= lt!273835 (select (store (arr!17835 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273833 () Unit!19030)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37151 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> b!601489 (= lt!273833 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601489 (= lt!273839 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601490 () Bool)

(declare-fun e!343929 () Bool)

(assert (=> b!601490 (= e!343929 (or (bvsge index!984 j!136) (bvslt (size!18199 a!2986) #b01111111111111111111111111111111)))))

(declare-fun lt!273844 () Unit!19030)

(declare-fun e!343923 () Unit!19030)

(assert (=> b!601490 (= lt!273844 e!343923)))

(declare-fun c!67994 () Bool)

(assert (=> b!601490 (= c!67994 (bvslt j!136 index!984))))

(declare-fun b!601491 () Bool)

(declare-fun res!386236 () Bool)

(assert (=> b!601491 (=> (not res!386236) (not e!343927))))

(assert (=> b!601491 (= res!386236 (validKeyInArray!0 k!1786))))

(declare-fun b!601492 () Bool)

(declare-fun e!343928 () Bool)

(assert (=> b!601492 (= e!343925 e!343928)))

(declare-fun res!386237 () Bool)

(assert (=> b!601492 (=> (not res!386237) (not e!343928))))

(declare-fun arrayContainsKey!0 (array!37151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601492 (= res!386237 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) j!136))))

(declare-fun b!601493 () Bool)

(declare-fun e!343932 () Bool)

(assert (=> b!601493 (= e!343930 e!343932)))

(declare-fun res!386238 () Bool)

(assert (=> b!601493 (=> (not res!386238) (not e!343932))))

(assert (=> b!601493 (= res!386238 (= (select (store (arr!17835 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601493 (= lt!273836 (array!37152 (store (arr!17835 a!2986) i!1108 k!1786) (size!18199 a!2986)))))

(declare-fun b!601494 () Bool)

(declare-fun res!386247 () Bool)

(assert (=> b!601494 (=> (not res!386247) (not e!343930))))

(assert (=> b!601494 (= res!386247 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17835 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601495 () Bool)

(assert (=> b!601495 (= e!343935 e!343929)))

(declare-fun res!386241 () Bool)

(assert (=> b!601495 (=> res!386241 e!343929)))

(assert (=> b!601495 (= res!386241 (or (not (= (select (arr!17835 a!2986) j!136) lt!273835)) (not (= (select (arr!17835 a!2986) j!136) lt!273837))))))

(assert (=> b!601495 e!343924))

(declare-fun res!386235 () Bool)

(assert (=> b!601495 (=> (not res!386235) (not e!343924))))

(assert (=> b!601495 (= res!386235 (= lt!273837 (select (arr!17835 a!2986) j!136)))))

(assert (=> b!601495 (= lt!273837 (select (store (arr!17835 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601496 () Bool)

(declare-fun res!386239 () Bool)

(assert (=> b!601496 (=> (not res!386239) (not e!343930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37151 (_ BitVec 32)) Bool)

(assert (=> b!601496 (= res!386239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601497 () Bool)

(declare-fun res!386242 () Bool)

(assert (=> b!601497 (=> (not res!386242) (not e!343927))))

(assert (=> b!601497 (= res!386242 (and (= (size!18199 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601498 () Bool)

(declare-fun res!386244 () Bool)

(assert (=> b!601498 (=> (not res!386244) (not e!343927))))

(assert (=> b!601498 (= res!386244 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601499 () Bool)

(assert (=> b!601499 (= e!343928 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) index!984))))

(declare-fun b!601500 () Bool)

(assert (=> b!601500 (= e!343932 e!343931)))

(declare-fun res!386243 () Bool)

(assert (=> b!601500 (=> (not res!386243) (not e!343931))))

(declare-fun lt!273843 () SeekEntryResult!6275)

(assert (=> b!601500 (= res!386243 (and (= lt!273843 (Found!6275 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17835 a!2986) index!984) (select (arr!17835 a!2986) j!136))) (not (= (select (arr!17835 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601500 (= lt!273843 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601501 () Bool)

(assert (=> b!601501 (= e!343927 e!343930)))

(declare-fun res!386234 () Bool)

(assert (=> b!601501 (=> (not res!386234) (not e!343930))))

(declare-fun lt!273832 () SeekEntryResult!6275)

(assert (=> b!601501 (= res!386234 (or (= lt!273832 (MissingZero!6275 i!1108)) (= lt!273832 (MissingVacant!6275 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37151 (_ BitVec 32)) SeekEntryResult!6275)

(assert (=> b!601501 (= lt!273832 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601502 () Bool)

(assert (=> b!601502 (= e!343926 (= lt!273843 lt!273842))))

(declare-fun b!601503 () Bool)

(declare-fun Unit!19033 () Unit!19030)

(assert (=> b!601503 (= e!343923 Unit!19033)))

(declare-fun b!601504 () Bool)

(declare-fun Unit!19034 () Unit!19030)

(assert (=> b!601504 (= e!343933 Unit!19034)))

(declare-fun b!601505 () Bool)

(declare-fun Unit!19035 () Unit!19030)

(assert (=> b!601505 (= e!343923 Unit!19035)))

(declare-fun lt!273831 () Unit!19030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> b!601505 (= lt!273831 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273836 (select (arr!17835 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601505 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273840 () Unit!19030)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11876) Unit!19030)

(assert (=> b!601505 (= lt!273840 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11873))))

(assert (=> b!601505 (arrayNoDuplicates!0 lt!273836 #b00000000000000000000000000000000 Nil!11873)))

(declare-fun lt!273841 () Unit!19030)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37151 (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> b!601505 (= lt!273841 (lemmaNoDuplicateFromThenFromBigger!0 lt!273836 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601505 (arrayNoDuplicates!0 lt!273836 j!136 Nil!11873)))

(declare-fun lt!273830 () Unit!19030)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37151 (_ BitVec 64) (_ BitVec 32) List!11876) Unit!19030)

(assert (=> b!601505 (= lt!273830 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273836 (select (arr!17835 a!2986) j!136) j!136 Nil!11873))))

(assert (=> b!601505 false))

(assert (= (and start!54916 res!386246) b!601497))

(assert (= (and b!601497 res!386242) b!601486))

(assert (= (and b!601486 res!386249) b!601491))

(assert (= (and b!601491 res!386236) b!601498))

(assert (= (and b!601498 res!386244) b!601501))

(assert (= (and b!601501 res!386234) b!601496))

(assert (= (and b!601496 res!386239) b!601485))

(assert (= (and b!601485 res!386233) b!601494))

(assert (= (and b!601494 res!386247) b!601493))

(assert (= (and b!601493 res!386238) b!601500))

(assert (= (and b!601500 res!386243) b!601489))

(assert (= (and b!601489 res!386245) b!601502))

(assert (= (and b!601489 c!67993) b!601487))

(assert (= (and b!601489 (not c!67993)) b!601504))

(assert (= (and b!601489 (not res!386240)) b!601495))

(assert (= (and b!601495 res!386235) b!601488))

(assert (= (and b!601488 (not res!386248)) b!601492))

(assert (= (and b!601492 res!386237) b!601499))

(assert (= (and b!601495 (not res!386241)) b!601490))

(assert (= (and b!601490 c!67994) b!601505))

(assert (= (and b!601490 (not c!67994)) b!601503))

(declare-fun m!578669 () Bool)

(assert (=> b!601493 m!578669))

(declare-fun m!578671 () Bool)

(assert (=> b!601493 m!578671))

(declare-fun m!578673 () Bool)

(assert (=> start!54916 m!578673))

(declare-fun m!578675 () Bool)

(assert (=> start!54916 m!578675))

(declare-fun m!578677 () Bool)

(assert (=> b!601485 m!578677))

(declare-fun m!578679 () Bool)

(assert (=> b!601500 m!578679))

(declare-fun m!578681 () Bool)

(assert (=> b!601500 m!578681))

(assert (=> b!601500 m!578681))

(declare-fun m!578683 () Bool)

(assert (=> b!601500 m!578683))

(assert (=> b!601492 m!578681))

(assert (=> b!601492 m!578681))

(declare-fun m!578685 () Bool)

(assert (=> b!601492 m!578685))

(assert (=> b!601495 m!578681))

(assert (=> b!601495 m!578669))

(declare-fun m!578687 () Bool)

(assert (=> b!601495 m!578687))

(assert (=> b!601488 m!578681))

(declare-fun m!578689 () Bool)

(assert (=> b!601505 m!578689))

(assert (=> b!601505 m!578681))

(declare-fun m!578691 () Bool)

(assert (=> b!601505 m!578691))

(assert (=> b!601505 m!578681))

(assert (=> b!601505 m!578681))

(declare-fun m!578693 () Bool)

(assert (=> b!601505 m!578693))

(assert (=> b!601505 m!578681))

(declare-fun m!578695 () Bool)

(assert (=> b!601505 m!578695))

(declare-fun m!578697 () Bool)

(assert (=> b!601505 m!578697))

(declare-fun m!578699 () Bool)

(assert (=> b!601505 m!578699))

(declare-fun m!578701 () Bool)

(assert (=> b!601505 m!578701))

(declare-fun m!578703 () Bool)

(assert (=> b!601496 m!578703))

(declare-fun m!578705 () Bool)

(assert (=> b!601489 m!578705))

(declare-fun m!578707 () Bool)

(assert (=> b!601489 m!578707))

(assert (=> b!601489 m!578681))

(assert (=> b!601489 m!578669))

(assert (=> b!601489 m!578681))

(declare-fun m!578709 () Bool)

(assert (=> b!601489 m!578709))

(declare-fun m!578711 () Bool)

(assert (=> b!601489 m!578711))

(declare-fun m!578713 () Bool)

(assert (=> b!601489 m!578713))

(declare-fun m!578715 () Bool)

(assert (=> b!601489 m!578715))

(assert (=> b!601499 m!578681))

(assert (=> b!601499 m!578681))

(declare-fun m!578717 () Bool)

(assert (=> b!601499 m!578717))

(assert (=> b!601486 m!578681))

(assert (=> b!601486 m!578681))

(declare-fun m!578719 () Bool)

(assert (=> b!601486 m!578719))

(declare-fun m!578721 () Bool)

(assert (=> b!601491 m!578721))

(declare-fun m!578723 () Bool)

(assert (=> b!601494 m!578723))

(declare-fun m!578725 () Bool)

(assert (=> b!601501 m!578725))

(declare-fun m!578727 () Bool)

(assert (=> b!601498 m!578727))

(push 1)

(assert (not b!601501))

(assert (not b!601492))

(assert (not b!601489))

(assert (not start!54916))

(assert (not b!601499))

(assert (not b!601496))

(assert (not b!601498))

(assert (not b!601486))

(assert (not b!601485))

(assert (not b!601500))

(assert (not b!601505))

(assert (not b!601491))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!87147 () Bool)

(assert (=> d!87147 (= (validKeyInArray!0 (select (arr!17835 a!2986) j!136)) (and (not (= (select (arr!17835 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17835 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!601486 d!87147))

(declare-fun d!87149 () Bool)

(declare-fun res!386371 () Bool)

(declare-fun e!344045 () Bool)

(assert (=> d!87149 (=> res!386371 e!344045)))

(assert (=> d!87149 (= res!386371 (= (select (arr!17835 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!87149 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!344045)))

(declare-fun b!601675 () Bool)

(declare-fun e!344046 () Bool)

(assert (=> b!601675 (= e!344045 e!344046)))

(declare-fun res!386372 () Bool)

(assert (=> b!601675 (=> (not res!386372) (not e!344046))))

(assert (=> b!601675 (= res!386372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18199 a!2986)))))

(declare-fun b!601676 () Bool)

(assert (=> b!601676 (= e!344046 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87149 (not res!386371)) b!601675))

(assert (= (and b!601675 res!386372) b!601676))

(declare-fun m!578865 () Bool)

(assert (=> d!87149 m!578865))

(declare-fun m!578867 () Bool)

(assert (=> b!601676 m!578867))

(assert (=> b!601498 d!87149))

(declare-fun d!87155 () Bool)

(declare-fun res!386373 () Bool)

(declare-fun e!344047 () Bool)

(assert (=> d!87155 (=> res!386373 e!344047)))

(assert (=> d!87155 (= res!386373 (= (select (arr!17835 lt!273836) index!984) (select (arr!17835 a!2986) j!136)))))

(assert (=> d!87155 (= (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) index!984) e!344047)))

(declare-fun b!601677 () Bool)

(declare-fun e!344048 () Bool)

(assert (=> b!601677 (= e!344047 e!344048)))

(declare-fun res!386374 () Bool)

(assert (=> b!601677 (=> (not res!386374) (not e!344048))))

(assert (=> b!601677 (= res!386374 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18199 lt!273836)))))

(declare-fun b!601678 () Bool)

(assert (=> b!601678 (= e!344048 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87155 (not res!386373)) b!601677))

(assert (= (and b!601677 res!386374) b!601678))

(declare-fun m!578869 () Bool)

(assert (=> d!87155 m!578869))

(assert (=> b!601678 m!578681))

(declare-fun m!578871 () Bool)

(assert (=> b!601678 m!578871))

(assert (=> b!601499 d!87155))

(declare-fun d!87157 () Bool)

(assert (=> d!87157 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273943 () Unit!19030)

(declare-fun choose!114 (array!37151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> d!87157 (= lt!273943 (choose!114 lt!273836 (select (arr!17835 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87157 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87157 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273836 (select (arr!17835 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!273943)))

(declare-fun bs!18439 () Bool)

(assert (= bs!18439 d!87157))

(assert (=> bs!18439 m!578681))

(assert (=> bs!18439 m!578691))

(assert (=> bs!18439 m!578681))

(declare-fun m!578873 () Bool)

(assert (=> bs!18439 m!578873))

(assert (=> b!601505 d!87157))

(declare-fun d!87161 () Bool)

(declare-fun res!386375 () Bool)

(declare-fun e!344049 () Bool)

(assert (=> d!87161 (=> res!386375 e!344049)))

(assert (=> d!87161 (= res!386375 (= (select (arr!17835 lt!273836) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17835 a!2986) j!136)))))

(assert (=> d!87161 (= (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!344049)))

(declare-fun b!601679 () Bool)

(declare-fun e!344050 () Bool)

(assert (=> b!601679 (= e!344049 e!344050)))

(declare-fun res!386376 () Bool)

(assert (=> b!601679 (=> (not res!386376) (not e!344050))))

(assert (=> b!601679 (= res!386376 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18199 lt!273836)))))

(declare-fun b!601680 () Bool)

(assert (=> b!601680 (= e!344050 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87161 (not res!386375)) b!601679))

(assert (= (and b!601679 res!386376) b!601680))

(declare-fun m!578875 () Bool)

(assert (=> d!87161 m!578875))

(assert (=> b!601680 m!578681))

(declare-fun m!578877 () Bool)

(assert (=> b!601680 m!578877))

(assert (=> b!601505 d!87161))

(declare-fun d!87163 () Bool)

(assert (=> d!87163 (arrayNoDuplicates!0 lt!273836 j!136 Nil!11873)))

(declare-fun lt!273957 () Unit!19030)

(declare-fun choose!39 (array!37151 (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> d!87163 (= lt!273957 (choose!39 lt!273836 #b00000000000000000000000000000000 j!136))))

(assert (=> d!87163 (bvslt (size!18199 lt!273836) #b01111111111111111111111111111111)))

(assert (=> d!87163 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!273836 #b00000000000000000000000000000000 j!136) lt!273957)))

(declare-fun bs!18441 () Bool)

(assert (= bs!18441 d!87163))

(assert (=> bs!18441 m!578699))

(declare-fun m!578899 () Bool)

(assert (=> bs!18441 m!578899))

(assert (=> b!601505 d!87163))

(declare-fun d!87171 () Bool)

(assert (=> d!87171 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 lt!273836)) (not (= (select (arr!17835 lt!273836) j!136) (select (arr!17835 a!2986) j!136))))))

(declare-fun lt!273962 () Unit!19030)

(declare-fun choose!21 (array!37151 (_ BitVec 64) (_ BitVec 32) List!11876) Unit!19030)

(assert (=> d!87171 (= lt!273962 (choose!21 lt!273836 (select (arr!17835 a!2986) j!136) j!136 Nil!11873))))

(assert (=> d!87171 (bvslt (size!18199 lt!273836) #b01111111111111111111111111111111)))

(assert (=> d!87171 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273836 (select (arr!17835 a!2986) j!136) j!136 Nil!11873) lt!273962)))

(declare-fun bs!18442 () Bool)

(assert (= bs!18442 d!87171))

(declare-fun m!578901 () Bool)

(assert (=> bs!18442 m!578901))

(assert (=> bs!18442 m!578681))

(declare-fun m!578903 () Bool)

(assert (=> bs!18442 m!578903))

(assert (=> b!601505 d!87171))

(declare-fun d!87173 () Bool)

(declare-fun e!344074 () Bool)

(assert (=> d!87173 e!344074))

(declare-fun res!386385 () Bool)

(assert (=> d!87173 (=> (not res!386385) (not e!344074))))

(assert (=> d!87173 (= res!386385 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986))))))

(declare-fun lt!273965 () Unit!19030)

(declare-fun choose!41 (array!37151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11876) Unit!19030)

(assert (=> d!87173 (= lt!273965 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11873))))

(assert (=> d!87173 (bvslt (size!18199 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87173 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11873) lt!273965)))

(declare-fun b!601719 () Bool)

(assert (=> b!601719 (= e!344074 (arrayNoDuplicates!0 (array!37152 (store (arr!17835 a!2986) i!1108 k!1786) (size!18199 a!2986)) #b00000000000000000000000000000000 Nil!11873))))

(assert (= (and d!87173 res!386385) b!601719))

(declare-fun m!578915 () Bool)

(assert (=> d!87173 m!578915))

(assert (=> b!601719 m!578669))

(declare-fun m!578917 () Bool)

(assert (=> b!601719 m!578917))

(assert (=> b!601505 d!87173))

(declare-fun bm!32969 () Bool)

(declare-fun c!68039 () Bool)

(declare-fun call!32972 () Bool)

(assert (=> bm!32969 (= call!32972 (arrayNoDuplicates!0 lt!273836 (bvadd j!136 #b00000000000000000000000000000001) (ite c!68039 (Cons!11872 (select (arr!17835 lt!273836) j!136) Nil!11873) Nil!11873)))))

(declare-fun b!601741 () Bool)

(declare-fun e!344092 () Bool)

(declare-fun e!344093 () Bool)

(assert (=> b!601741 (= e!344092 e!344093)))

(assert (=> b!601741 (= c!68039 (validKeyInArray!0 (select (arr!17835 lt!273836) j!136)))))

(declare-fun b!601742 () Bool)

(assert (=> b!601742 (= e!344093 call!32972)))

(declare-fun b!601743 () Bool)

(assert (=> b!601743 (= e!344093 call!32972)))

(declare-fun b!601744 () Bool)

(declare-fun e!344091 () Bool)

(declare-fun contains!2987 (List!11876 (_ BitVec 64)) Bool)

(assert (=> b!601744 (= e!344091 (contains!2987 Nil!11873 (select (arr!17835 lt!273836) j!136)))))

(declare-fun b!601745 () Bool)

(declare-fun e!344094 () Bool)

(assert (=> b!601745 (= e!344094 e!344092)))

(declare-fun res!386397 () Bool)

(assert (=> b!601745 (=> (not res!386397) (not e!344092))))

(assert (=> b!601745 (= res!386397 (not e!344091))))

(declare-fun res!386398 () Bool)

(assert (=> b!601745 (=> (not res!386398) (not e!344091))))

(assert (=> b!601745 (= res!386398 (validKeyInArray!0 (select (arr!17835 lt!273836) j!136)))))

(declare-fun d!87179 () Bool)

(declare-fun res!386399 () Bool)

(assert (=> d!87179 (=> res!386399 e!344094)))

(assert (=> d!87179 (= res!386399 (bvsge j!136 (size!18199 lt!273836)))))

(assert (=> d!87179 (= (arrayNoDuplicates!0 lt!273836 j!136 Nil!11873) e!344094)))

(assert (= (and d!87179 (not res!386399)) b!601745))

(assert (= (and b!601745 res!386398) b!601744))

(assert (= (and b!601745 res!386397) b!601741))

(assert (= (and b!601741 c!68039) b!601743))

(assert (= (and b!601741 (not c!68039)) b!601742))

(assert (= (or b!601743 b!601742) bm!32969))

(assert (=> bm!32969 m!578901))

(declare-fun m!578936 () Bool)

(assert (=> bm!32969 m!578936))

(assert (=> b!601741 m!578901))

(assert (=> b!601741 m!578901))

(declare-fun m!578939 () Bool)

(assert (=> b!601741 m!578939))

(assert (=> b!601744 m!578901))

(assert (=> b!601744 m!578901))

(declare-fun m!578941 () Bool)

(assert (=> b!601744 m!578941))

(assert (=> b!601745 m!578901))

(assert (=> b!601745 m!578901))

(assert (=> b!601745 m!578939))

(assert (=> b!601505 d!87179))

(declare-fun bm!32970 () Bool)

(declare-fun call!32973 () Bool)

(declare-fun c!68040 () Bool)

(assert (=> bm!32970 (= call!32973 (arrayNoDuplicates!0 lt!273836 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68040 (Cons!11872 (select (arr!17835 lt!273836) #b00000000000000000000000000000000) Nil!11873) Nil!11873)))))

(declare-fun b!601748 () Bool)

(declare-fun e!344098 () Bool)

(declare-fun e!344099 () Bool)

(assert (=> b!601748 (= e!344098 e!344099)))

(assert (=> b!601748 (= c!68040 (validKeyInArray!0 (select (arr!17835 lt!273836) #b00000000000000000000000000000000)))))

(declare-fun b!601749 () Bool)

(assert (=> b!601749 (= e!344099 call!32973)))

(declare-fun b!601750 () Bool)

(assert (=> b!601750 (= e!344099 call!32973)))

(declare-fun b!601751 () Bool)

(declare-fun e!344097 () Bool)

(assert (=> b!601751 (= e!344097 (contains!2987 Nil!11873 (select (arr!17835 lt!273836) #b00000000000000000000000000000000)))))

(declare-fun b!601752 () Bool)

(declare-fun e!344100 () Bool)

(assert (=> b!601752 (= e!344100 e!344098)))

(declare-fun res!386402 () Bool)

(assert (=> b!601752 (=> (not res!386402) (not e!344098))))

(assert (=> b!601752 (= res!386402 (not e!344097))))

(declare-fun res!386403 () Bool)

(assert (=> b!601752 (=> (not res!386403) (not e!344097))))

(assert (=> b!601752 (= res!386403 (validKeyInArray!0 (select (arr!17835 lt!273836) #b00000000000000000000000000000000)))))

(declare-fun d!87191 () Bool)

(declare-fun res!386404 () Bool)

(assert (=> d!87191 (=> res!386404 e!344100)))

(assert (=> d!87191 (= res!386404 (bvsge #b00000000000000000000000000000000 (size!18199 lt!273836)))))

(assert (=> d!87191 (= (arrayNoDuplicates!0 lt!273836 #b00000000000000000000000000000000 Nil!11873) e!344100)))

(assert (= (and d!87191 (not res!386404)) b!601752))

(assert (= (and b!601752 res!386403) b!601751))

(assert (= (and b!601752 res!386402) b!601748))

(assert (= (and b!601748 c!68040) b!601750))

(assert (= (and b!601748 (not c!68040)) b!601749))

(assert (= (or b!601750 b!601749) bm!32970))

(declare-fun m!578943 () Bool)

(assert (=> bm!32970 m!578943))

(declare-fun m!578945 () Bool)

(assert (=> bm!32970 m!578945))

(assert (=> b!601748 m!578943))

(assert (=> b!601748 m!578943))

(declare-fun m!578947 () Bool)

(assert (=> b!601748 m!578947))

(assert (=> b!601751 m!578943))

(assert (=> b!601751 m!578943))

(declare-fun m!578949 () Bool)

(assert (=> b!601751 m!578949))

(assert (=> b!601752 m!578943))

(assert (=> b!601752 m!578943))

(assert (=> b!601752 m!578947))

(assert (=> b!601505 d!87191))

(declare-fun bm!32971 () Bool)

(declare-fun call!32974 () Bool)

(declare-fun c!68041 () Bool)

(assert (=> bm!32971 (= call!32974 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!68041 (Cons!11872 (select (arr!17835 a!2986) #b00000000000000000000000000000000) Nil!11873) Nil!11873)))))

(declare-fun b!601753 () Bool)

(declare-fun e!344102 () Bool)

(declare-fun e!344103 () Bool)

(assert (=> b!601753 (= e!344102 e!344103)))

(assert (=> b!601753 (= c!68041 (validKeyInArray!0 (select (arr!17835 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601754 () Bool)

(assert (=> b!601754 (= e!344103 call!32974)))

(declare-fun b!601755 () Bool)

(assert (=> b!601755 (= e!344103 call!32974)))

(declare-fun b!601756 () Bool)

(declare-fun e!344101 () Bool)

(assert (=> b!601756 (= e!344101 (contains!2987 Nil!11873 (select (arr!17835 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!601757 () Bool)

(declare-fun e!344104 () Bool)

(assert (=> b!601757 (= e!344104 e!344102)))

(declare-fun res!386405 () Bool)

(assert (=> b!601757 (=> (not res!386405) (not e!344102))))

(assert (=> b!601757 (= res!386405 (not e!344101))))

(declare-fun res!386406 () Bool)

(assert (=> b!601757 (=> (not res!386406) (not e!344101))))

(assert (=> b!601757 (= res!386406 (validKeyInArray!0 (select (arr!17835 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87193 () Bool)

(declare-fun res!386407 () Bool)

(assert (=> d!87193 (=> res!386407 e!344104)))

(assert (=> d!87193 (= res!386407 (bvsge #b00000000000000000000000000000000 (size!18199 a!2986)))))

(assert (=> d!87193 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11873) e!344104)))

(assert (= (and d!87193 (not res!386407)) b!601757))

(assert (= (and b!601757 res!386406) b!601756))

(assert (= (and b!601757 res!386405) b!601753))

(assert (= (and b!601753 c!68041) b!601755))

(assert (= (and b!601753 (not c!68041)) b!601754))

(assert (= (or b!601755 b!601754) bm!32971))

(assert (=> bm!32971 m!578865))

(declare-fun m!578951 () Bool)

(assert (=> bm!32971 m!578951))

(assert (=> b!601753 m!578865))

(assert (=> b!601753 m!578865))

(declare-fun m!578953 () Bool)

(assert (=> b!601753 m!578953))

(assert (=> b!601756 m!578865))

(assert (=> b!601756 m!578865))

(declare-fun m!578955 () Bool)

(assert (=> b!601756 m!578955))

(assert (=> b!601757 m!578865))

(assert (=> b!601757 m!578865))

(assert (=> b!601757 m!578953))

(assert (=> b!601485 d!87193))

(declare-fun bm!32974 () Bool)

(declare-fun call!32977 () Bool)

(assert (=> bm!32974 (= call!32977 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!601778 () Bool)

(declare-fun e!344119 () Bool)

(declare-fun e!344118 () Bool)

(assert (=> b!601778 (= e!344119 e!344118)))

(declare-fun lt!273984 () (_ BitVec 64))

(assert (=> b!601778 (= lt!273984 (select (arr!17835 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!273985 () Unit!19030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37151 (_ BitVec 64) (_ BitVec 32)) Unit!19030)

(assert (=> b!601778 (= lt!273985 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!273984 #b00000000000000000000000000000000))))

(assert (=> b!601778 (arrayContainsKey!0 a!2986 lt!273984 #b00000000000000000000000000000000)))

(declare-fun lt!273986 () Unit!19030)

(assert (=> b!601778 (= lt!273986 lt!273985)))

(declare-fun res!386413 () Bool)

(assert (=> b!601778 (= res!386413 (= (seekEntryOrOpen!0 (select (arr!17835 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6275 #b00000000000000000000000000000000)))))

(assert (=> b!601778 (=> (not res!386413) (not e!344118))))

(declare-fun b!601779 () Bool)

(declare-fun e!344117 () Bool)

(assert (=> b!601779 (= e!344117 e!344119)))

(declare-fun c!68050 () Bool)

(assert (=> b!601779 (= c!68050 (validKeyInArray!0 (select (arr!17835 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!87199 () Bool)

(declare-fun res!386412 () Bool)

(assert (=> d!87199 (=> res!386412 e!344117)))

(assert (=> d!87199 (= res!386412 (bvsge #b00000000000000000000000000000000 (size!18199 a!2986)))))

(assert (=> d!87199 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!344117)))

(declare-fun b!601780 () Bool)

(assert (=> b!601780 (= e!344118 call!32977)))

(declare-fun b!601781 () Bool)

(assert (=> b!601781 (= e!344119 call!32977)))

(assert (= (and d!87199 (not res!386412)) b!601779))

(assert (= (and b!601779 c!68050) b!601778))

(assert (= (and b!601779 (not c!68050)) b!601781))

(assert (= (and b!601778 res!386413) b!601780))

(assert (= (or b!601780 b!601781) bm!32974))

(declare-fun m!578977 () Bool)

(assert (=> bm!32974 m!578977))

(assert (=> b!601778 m!578865))

(declare-fun m!578979 () Bool)

(assert (=> b!601778 m!578979))

(declare-fun m!578981 () Bool)

(assert (=> b!601778 m!578981))

(assert (=> b!601778 m!578865))

(declare-fun m!578983 () Bool)

(assert (=> b!601778 m!578983))

(assert (=> b!601779 m!578865))

(assert (=> b!601779 m!578865))

(assert (=> b!601779 m!578953))

(assert (=> b!601496 d!87199))

(declare-fun d!87207 () Bool)

(declare-fun res!386414 () Bool)

(declare-fun e!344120 () Bool)

(assert (=> d!87207 (=> res!386414 e!344120)))

(assert (=> d!87207 (= res!386414 (= (select (arr!17835 lt!273836) j!136) (select (arr!17835 a!2986) j!136)))))

(assert (=> d!87207 (= (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) j!136) e!344120)))

(declare-fun b!601782 () Bool)

(declare-fun e!344121 () Bool)

(assert (=> b!601782 (= e!344120 e!344121)))

(declare-fun res!386415 () Bool)

(assert (=> b!601782 (=> (not res!386415) (not e!344121))))

(assert (=> b!601782 (= res!386415 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18199 lt!273836)))))

(declare-fun b!601783 () Bool)

(assert (=> b!601783 (= e!344121 (arrayContainsKey!0 lt!273836 (select (arr!17835 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87207 (not res!386414)) b!601782))

(assert (= (and b!601782 res!386415) b!601783))

(assert (=> d!87207 m!578901))

(assert (=> b!601783 m!578681))

(declare-fun m!578985 () Bool)

(assert (=> b!601783 m!578985))

(assert (=> b!601492 d!87207))

(declare-fun d!87209 () Bool)

(assert (=> d!87209 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54916 d!87209))

(declare-fun d!87219 () Bool)

(assert (=> d!87219 (= (array_inv!13631 a!2986) (bvsge (size!18199 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54916 d!87219))

(declare-fun b!601862 () Bool)

(declare-fun e!344177 () SeekEntryResult!6275)

(assert (=> b!601862 (= e!344177 (Found!6275 lt!273839))))

(declare-fun b!601863 () Bool)

(declare-fun e!344178 () SeekEntryResult!6275)

(assert (=> b!601863 (= e!344178 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273839 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!273835 lt!273836 mask!3053))))

(declare-fun b!601864 () Bool)

(declare-fun e!344176 () SeekEntryResult!6275)

(assert (=> b!601864 (= e!344176 e!344177)))

(declare-fun c!68075 () Bool)

(declare-fun lt!274027 () (_ BitVec 64))

(assert (=> b!601864 (= c!68075 (= lt!274027 lt!273835))))

(declare-fun b!601865 () Bool)

(assert (=> b!601865 (= e!344176 Undefined!6275)))

(declare-fun lt!274026 () SeekEntryResult!6275)

(declare-fun d!87221 () Bool)

(assert (=> d!87221 (and (or (is-Undefined!6275 lt!274026) (not (is-Found!6275 lt!274026)) (and (bvsge (index!27358 lt!274026) #b00000000000000000000000000000000) (bvslt (index!27358 lt!274026) (size!18199 lt!273836)))) (or (is-Undefined!6275 lt!274026) (is-Found!6275 lt!274026) (not (is-MissingVacant!6275 lt!274026)) (not (= (index!27360 lt!274026) vacantSpotIndex!68)) (and (bvsge (index!27360 lt!274026) #b00000000000000000000000000000000) (bvslt (index!27360 lt!274026) (size!18199 lt!273836)))) (or (is-Undefined!6275 lt!274026) (ite (is-Found!6275 lt!274026) (= (select (arr!17835 lt!273836) (index!27358 lt!274026)) lt!273835) (and (is-MissingVacant!6275 lt!274026) (= (index!27360 lt!274026) vacantSpotIndex!68) (= (select (arr!17835 lt!273836) (index!27360 lt!274026)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87221 (= lt!274026 e!344176)))

(declare-fun c!68076 () Bool)

(assert (=> d!87221 (= c!68076 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87221 (= lt!274027 (select (arr!17835 lt!273836) lt!273839))))

(assert (=> d!87221 (validMask!0 mask!3053)))

(assert (=> d!87221 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 lt!273835 lt!273836 mask!3053) lt!274026)))

(declare-fun b!601866 () Bool)

(assert (=> b!601866 (= e!344178 (MissingVacant!6275 vacantSpotIndex!68))))

(declare-fun b!601867 () Bool)

(declare-fun c!68077 () Bool)

(assert (=> b!601867 (= c!68077 (= lt!274027 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601867 (= e!344177 e!344178)))

(assert (= (and d!87221 c!68076) b!601865))

(assert (= (and d!87221 (not c!68076)) b!601864))

(assert (= (and b!601864 c!68075) b!601862))

(assert (= (and b!601864 (not c!68075)) b!601867))

(assert (= (and b!601867 c!68077) b!601866))

(assert (= (and b!601867 (not c!68077)) b!601863))

(declare-fun m!579067 () Bool)

(assert (=> b!601863 m!579067))

(assert (=> b!601863 m!579067))

(declare-fun m!579071 () Bool)

(assert (=> b!601863 m!579071))

(declare-fun m!579073 () Bool)

(assert (=> d!87221 m!579073))

(declare-fun m!579075 () Bool)

(assert (=> d!87221 m!579075))

(declare-fun m!579077 () Bool)

(assert (=> d!87221 m!579077))

(assert (=> d!87221 m!578673))

(assert (=> b!601489 d!87221))

(declare-fun b!601868 () Bool)

(declare-fun e!344180 () SeekEntryResult!6275)

(assert (=> b!601868 (= e!344180 (Found!6275 index!984))))

(declare-fun e!344181 () SeekEntryResult!6275)

(declare-fun b!601869 () Bool)

(assert (=> b!601869 (= e!344181 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!273835 lt!273836 mask!3053))))

(declare-fun b!601870 () Bool)

(declare-fun e!344179 () SeekEntryResult!6275)

(assert (=> b!601870 (= e!344179 e!344180)))

(declare-fun c!68078 () Bool)

(declare-fun lt!274029 () (_ BitVec 64))

(assert (=> b!601870 (= c!68078 (= lt!274029 lt!273835))))

(declare-fun b!601871 () Bool)

(assert (=> b!601871 (= e!344179 Undefined!6275)))

(declare-fun d!87249 () Bool)

(declare-fun lt!274028 () SeekEntryResult!6275)

(assert (=> d!87249 (and (or (is-Undefined!6275 lt!274028) (not (is-Found!6275 lt!274028)) (and (bvsge (index!27358 lt!274028) #b00000000000000000000000000000000) (bvslt (index!27358 lt!274028) (size!18199 lt!273836)))) (or (is-Undefined!6275 lt!274028) (is-Found!6275 lt!274028) (not (is-MissingVacant!6275 lt!274028)) (not (= (index!27360 lt!274028) vacantSpotIndex!68)) (and (bvsge (index!27360 lt!274028) #b00000000000000000000000000000000) (bvslt (index!27360 lt!274028) (size!18199 lt!273836)))) (or (is-Undefined!6275 lt!274028) (ite (is-Found!6275 lt!274028) (= (select (arr!17835 lt!273836) (index!27358 lt!274028)) lt!273835) (and (is-MissingVacant!6275 lt!274028) (= (index!27360 lt!274028) vacantSpotIndex!68) (= (select (arr!17835 lt!273836) (index!27360 lt!274028)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87249 (= lt!274028 e!344179)))

(declare-fun c!68079 () Bool)

(assert (=> d!87249 (= c!68079 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87249 (= lt!274029 (select (arr!17835 lt!273836) index!984))))

(assert (=> d!87249 (validMask!0 mask!3053)))

(assert (=> d!87249 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273835 lt!273836 mask!3053) lt!274028)))

(declare-fun b!601872 () Bool)

(assert (=> b!601872 (= e!344181 (MissingVacant!6275 vacantSpotIndex!68))))

(declare-fun b!601873 () Bool)

(declare-fun c!68080 () Bool)

(assert (=> b!601873 (= c!68080 (= lt!274029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601873 (= e!344180 e!344181)))

(assert (= (and d!87249 c!68079) b!601871))

(assert (= (and d!87249 (not c!68079)) b!601870))

(assert (= (and b!601870 c!68078) b!601868))

(assert (= (and b!601870 (not c!68078)) b!601873))

(assert (= (and b!601873 c!68080) b!601872))

(assert (= (and b!601873 (not c!68080)) b!601869))

(assert (=> b!601869 m!578705))

(assert (=> b!601869 m!578705))

(declare-fun m!579079 () Bool)

(assert (=> b!601869 m!579079))

(declare-fun m!579081 () Bool)

(assert (=> d!87249 m!579081))

(declare-fun m!579083 () Bool)

(assert (=> d!87249 m!579083))

(assert (=> d!87249 m!578869))

(assert (=> d!87249 m!578673))

(assert (=> b!601489 d!87249))

(declare-fun d!87251 () Bool)

(declare-fun lt!274034 () (_ BitVec 32))

(assert (=> d!87251 (and (bvsge lt!274034 #b00000000000000000000000000000000) (bvslt lt!274034 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87251 (= lt!274034 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87251 (validMask!0 mask!3053)))

(assert (=> d!87251 (= (nextIndex!0 index!984 x!910 mask!3053) lt!274034)))

(declare-fun bs!18450 () Bool)

(assert (= bs!18450 d!87251))

(declare-fun m!579085 () Bool)

(assert (=> bs!18450 m!579085))

(assert (=> bs!18450 m!578673))

(assert (=> b!601489 d!87251))

(declare-fun d!87253 () Bool)

(declare-fun e!344205 () Bool)

(assert (=> d!87253 e!344205))

(declare-fun res!386463 () Bool)

(assert (=> d!87253 (=> (not res!386463) (not e!344205))))

(assert (=> d!87253 (= res!386463 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18199 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18199 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18199 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18199 a!2986))))))

(declare-fun lt!274056 () Unit!19030)

(declare-fun choose!9 (array!37151 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19030)

(assert (=> d!87253 (= lt!274056 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87253 (validMask!0 mask!3053)))

(assert (=> d!87253 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 mask!3053) lt!274056)))

(declare-fun b!601903 () Bool)

(assert (=> b!601903 (= e!344205 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 (select (store (arr!17835 a!2986) i!1108 k!1786) j!136) (array!37152 (store (arr!17835 a!2986) i!1108 k!1786) (size!18199 a!2986)) mask!3053)))))

(assert (= (and d!87253 res!386463) b!601903))

(declare-fun m!579109 () Bool)

(assert (=> d!87253 m!579109))

(assert (=> d!87253 m!578673))

(assert (=> b!601903 m!578707))

(assert (=> b!601903 m!578707))

(declare-fun m!579111 () Bool)

(assert (=> b!601903 m!579111))

(assert (=> b!601903 m!578669))

(assert (=> b!601903 m!578681))

(assert (=> b!601903 m!578709))

(assert (=> b!601903 m!578681))

(assert (=> b!601489 d!87253))

(declare-fun b!601904 () Bool)

(declare-fun e!344207 () SeekEntryResult!6275)

(assert (=> b!601904 (= e!344207 (Found!6275 lt!273839))))

(declare-fun b!601905 () Bool)

(declare-fun e!344208 () SeekEntryResult!6275)

(assert (=> b!601905 (= e!344208 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!273839 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601906 () Bool)

(declare-fun e!344206 () SeekEntryResult!6275)

(assert (=> b!601906 (= e!344206 e!344207)))

(declare-fun lt!274058 () (_ BitVec 64))

(declare-fun c!68087 () Bool)

(assert (=> b!601906 (= c!68087 (= lt!274058 (select (arr!17835 a!2986) j!136)))))

(declare-fun b!601907 () Bool)

(assert (=> b!601907 (= e!344206 Undefined!6275)))

(declare-fun d!87263 () Bool)

(declare-fun lt!274057 () SeekEntryResult!6275)

(assert (=> d!87263 (and (or (is-Undefined!6275 lt!274057) (not (is-Found!6275 lt!274057)) (and (bvsge (index!27358 lt!274057) #b00000000000000000000000000000000) (bvslt (index!27358 lt!274057) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274057) (is-Found!6275 lt!274057) (not (is-MissingVacant!6275 lt!274057)) (not (= (index!27360 lt!274057) vacantSpotIndex!68)) (and (bvsge (index!27360 lt!274057) #b00000000000000000000000000000000) (bvslt (index!27360 lt!274057) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274057) (ite (is-Found!6275 lt!274057) (= (select (arr!17835 a!2986) (index!27358 lt!274057)) (select (arr!17835 a!2986) j!136)) (and (is-MissingVacant!6275 lt!274057) (= (index!27360 lt!274057) vacantSpotIndex!68) (= (select (arr!17835 a!2986) (index!27360 lt!274057)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87263 (= lt!274057 e!344206)))

(declare-fun c!68088 () Bool)

(assert (=> d!87263 (= c!68088 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!87263 (= lt!274058 (select (arr!17835 a!2986) lt!273839))))

(assert (=> d!87263 (validMask!0 mask!3053)))

(assert (=> d!87263 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273839 vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053) lt!274057)))

(declare-fun b!601908 () Bool)

(assert (=> b!601908 (= e!344208 (MissingVacant!6275 vacantSpotIndex!68))))

(declare-fun b!601909 () Bool)

(declare-fun c!68089 () Bool)

(assert (=> b!601909 (= c!68089 (= lt!274058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601909 (= e!344207 e!344208)))

(assert (= (and d!87263 c!68088) b!601907))

(assert (= (and d!87263 (not c!68088)) b!601906))

(assert (= (and b!601906 c!68087) b!601904))

(assert (= (and b!601906 (not c!68087)) b!601909))

(assert (= (and b!601909 c!68089) b!601908))

(assert (= (and b!601909 (not c!68089)) b!601905))

(assert (=> b!601905 m!579067))

(assert (=> b!601905 m!579067))

(assert (=> b!601905 m!578681))

(declare-fun m!579113 () Bool)

(assert (=> b!601905 m!579113))

(declare-fun m!579115 () Bool)

(assert (=> d!87263 m!579115))

(declare-fun m!579117 () Bool)

(assert (=> d!87263 m!579117))

(declare-fun m!579119 () Bool)

(assert (=> d!87263 m!579119))

(assert (=> d!87263 m!578673))

(assert (=> b!601489 d!87263))

(declare-fun b!601910 () Bool)

(declare-fun e!344210 () SeekEntryResult!6275)

(assert (=> b!601910 (= e!344210 (Found!6275 index!984))))

(declare-fun e!344211 () SeekEntryResult!6275)

(declare-fun b!601911 () Bool)

(assert (=> b!601911 (= e!344211 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601912 () Bool)

(declare-fun e!344209 () SeekEntryResult!6275)

(assert (=> b!601912 (= e!344209 e!344210)))

(declare-fun c!68090 () Bool)

(declare-fun lt!274060 () (_ BitVec 64))

(assert (=> b!601912 (= c!68090 (= lt!274060 (select (arr!17835 a!2986) j!136)))))

(declare-fun b!601913 () Bool)

(assert (=> b!601913 (= e!344209 Undefined!6275)))

(declare-fun lt!274059 () SeekEntryResult!6275)

(declare-fun d!87265 () Bool)

(assert (=> d!87265 (and (or (is-Undefined!6275 lt!274059) (not (is-Found!6275 lt!274059)) (and (bvsge (index!27358 lt!274059) #b00000000000000000000000000000000) (bvslt (index!27358 lt!274059) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274059) (is-Found!6275 lt!274059) (not (is-MissingVacant!6275 lt!274059)) (not (= (index!27360 lt!274059) vacantSpotIndex!68)) (and (bvsge (index!27360 lt!274059) #b00000000000000000000000000000000) (bvslt (index!27360 lt!274059) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274059) (ite (is-Found!6275 lt!274059) (= (select (arr!17835 a!2986) (index!27358 lt!274059)) (select (arr!17835 a!2986) j!136)) (and (is-MissingVacant!6275 lt!274059) (= (index!27360 lt!274059) vacantSpotIndex!68) (= (select (arr!17835 a!2986) (index!27360 lt!274059)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!87265 (= lt!274059 e!344209)))

(declare-fun c!68091 () Bool)

(assert (=> d!87265 (= c!68091 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!87265 (= lt!274060 (select (arr!17835 a!2986) index!984))))

(assert (=> d!87265 (validMask!0 mask!3053)))

(assert (=> d!87265 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17835 a!2986) j!136) a!2986 mask!3053) lt!274059)))

(declare-fun b!601914 () Bool)

(assert (=> b!601914 (= e!344211 (MissingVacant!6275 vacantSpotIndex!68))))

(declare-fun b!601915 () Bool)

(declare-fun c!68092 () Bool)

(assert (=> b!601915 (= c!68092 (= lt!274060 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601915 (= e!344210 e!344211)))

(assert (= (and d!87265 c!68091) b!601913))

(assert (= (and d!87265 (not c!68091)) b!601912))

(assert (= (and b!601912 c!68090) b!601910))

(assert (= (and b!601912 (not c!68090)) b!601915))

(assert (= (and b!601915 c!68092) b!601914))

(assert (= (and b!601915 (not c!68092)) b!601911))

(assert (=> b!601911 m!578705))

(assert (=> b!601911 m!578705))

(assert (=> b!601911 m!578681))

(declare-fun m!579121 () Bool)

(assert (=> b!601911 m!579121))

(declare-fun m!579123 () Bool)

(assert (=> d!87265 m!579123))

(declare-fun m!579125 () Bool)

(assert (=> d!87265 m!579125))

(assert (=> d!87265 m!578679))

(assert (=> d!87265 m!578673))

(assert (=> b!601500 d!87265))

(declare-fun b!601953 () Bool)

(declare-fun e!344234 () SeekEntryResult!6275)

(declare-fun lt!274078 () SeekEntryResult!6275)

(assert (=> b!601953 (= e!344234 (MissingZero!6275 (index!27359 lt!274078)))))

(declare-fun b!601954 () Bool)

(declare-fun e!344235 () SeekEntryResult!6275)

(assert (=> b!601954 (= e!344235 Undefined!6275)))

(declare-fun d!87267 () Bool)

(declare-fun lt!274077 () SeekEntryResult!6275)

(assert (=> d!87267 (and (or (is-Undefined!6275 lt!274077) (not (is-Found!6275 lt!274077)) (and (bvsge (index!27358 lt!274077) #b00000000000000000000000000000000) (bvslt (index!27358 lt!274077) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274077) (is-Found!6275 lt!274077) (not (is-MissingZero!6275 lt!274077)) (and (bvsge (index!27357 lt!274077) #b00000000000000000000000000000000) (bvslt (index!27357 lt!274077) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274077) (is-Found!6275 lt!274077) (is-MissingZero!6275 lt!274077) (not (is-MissingVacant!6275 lt!274077)) (and (bvsge (index!27360 lt!274077) #b00000000000000000000000000000000) (bvslt (index!27360 lt!274077) (size!18199 a!2986)))) (or (is-Undefined!6275 lt!274077) (ite (is-Found!6275 lt!274077) (= (select (arr!17835 a!2986) (index!27358 lt!274077)) k!1786) (ite (is-MissingZero!6275 lt!274077) (= (select (arr!17835 a!2986) (index!27357 lt!274077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6275 lt!274077) (= (select (arr!17835 a!2986) (index!27360 lt!274077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87267 (= lt!274077 e!344235)))

(declare-fun c!68111 () Bool)

(assert (=> d!87267 (= c!68111 (and (is-Intermediate!6275 lt!274078) (undefined!7087 lt!274078)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37151 (_ BitVec 32)) SeekEntryResult!6275)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87267 (= lt!274078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!87267 (validMask!0 mask!3053)))

(assert (=> d!87267 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!274077)))

