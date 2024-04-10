; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54880 () Bool)

(assert start!54880)

(declare-fun b!600317 () Bool)

(declare-fun e!343233 () Bool)

(declare-fun e!343229 () Bool)

(assert (=> b!600317 (= e!343233 e!343229)))

(declare-fun res!385216 () Bool)

(assert (=> b!600317 (=> (not res!385216) (not e!343229))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37115 0))(
  ( (array!37116 (arr!17817 (Array (_ BitVec 32) (_ BitVec 64))) (size!18181 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37115)

(assert (=> b!600317 (= res!385216 (= (select (store (arr!17817 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273062 () array!37115)

(assert (=> b!600317 (= lt!273062 (array!37116 (store (arr!17817 a!2986) i!1108 k!1786) (size!18181 a!2986)))))

(declare-fun b!600318 () Bool)

(declare-fun e!343228 () Bool)

(assert (=> b!600318 (= e!343228 e!343233)))

(declare-fun res!385229 () Bool)

(assert (=> b!600318 (=> (not res!385229) (not e!343233))))

(declare-datatypes ((SeekEntryResult!6257 0))(
  ( (MissingZero!6257 (index!27285 (_ BitVec 32))) (Found!6257 (index!27286 (_ BitVec 32))) (Intermediate!6257 (undefined!7069 Bool) (index!27287 (_ BitVec 32)) (x!56088 (_ BitVec 32))) (Undefined!6257) (MissingVacant!6257 (index!27288 (_ BitVec 32))) )
))
(declare-fun lt!273059 () SeekEntryResult!6257)

(assert (=> b!600318 (= res!385229 (or (= lt!273059 (MissingZero!6257 i!1108)) (= lt!273059 (MissingVacant!6257 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37115 (_ BitVec 32)) SeekEntryResult!6257)

(assert (=> b!600318 (= lt!273059 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!600319 () Bool)

(declare-fun res!385224 () Bool)

(assert (=> b!600319 (=> (not res!385224) (not e!343228))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!600319 (= res!385224 (and (= (size!18181 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18181 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18181 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600320 () Bool)

(declare-fun e!343225 () Bool)

(declare-fun e!343230 () Bool)

(assert (=> b!600320 (= e!343225 e!343230)))

(declare-fun res!385219 () Bool)

(assert (=> b!600320 (=> res!385219 e!343230)))

(assert (=> b!600320 (= res!385219 (or (bvsge (size!18181 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18181 a!2986))))))

(declare-datatypes ((List!11858 0))(
  ( (Nil!11855) (Cons!11854 (h!12899 (_ BitVec 64)) (t!18086 List!11858)) )
))
(declare-fun arrayNoDuplicates!0 (array!37115 (_ BitVec 32) List!11858) Bool)

(assert (=> b!600320 (arrayNoDuplicates!0 lt!273062 j!136 Nil!11855)))

(declare-datatypes ((Unit!18946 0))(
  ( (Unit!18947) )
))
(declare-fun lt!273055 () Unit!18946)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37115 (_ BitVec 32) (_ BitVec 32)) Unit!18946)

(assert (=> b!600320 (= lt!273055 (lemmaNoDuplicateFromThenFromBigger!0 lt!273062 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600320 (arrayNoDuplicates!0 lt!273062 #b00000000000000000000000000000000 Nil!11855)))

(declare-fun lt!273067 () Unit!18946)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11858) Unit!18946)

(assert (=> b!600320 (= lt!273067 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11855))))

(declare-fun arrayContainsKey!0 (array!37115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600320 (arrayContainsKey!0 lt!273062 (select (arr!17817 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273057 () Unit!18946)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18946)

(assert (=> b!600320 (= lt!273057 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273062 (select (arr!17817 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600321 () Bool)

(declare-fun e!343223 () Bool)

(declare-fun e!343224 () Bool)

(assert (=> b!600321 (= e!343223 (not e!343224))))

(declare-fun res!385230 () Bool)

(assert (=> b!600321 (=> res!385230 e!343224)))

(declare-fun lt!273060 () SeekEntryResult!6257)

(assert (=> b!600321 (= res!385230 (not (= lt!273060 (Found!6257 index!984))))))

(declare-fun lt!273056 () Unit!18946)

(declare-fun e!343232 () Unit!18946)

(assert (=> b!600321 (= lt!273056 e!343232)))

(declare-fun c!67919 () Bool)

(assert (=> b!600321 (= c!67919 (= lt!273060 Undefined!6257))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!273061 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37115 (_ BitVec 32)) SeekEntryResult!6257)

(assert (=> b!600321 (= lt!273060 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273061 lt!273062 mask!3053))))

(declare-fun e!343221 () Bool)

(assert (=> b!600321 e!343221))

(declare-fun res!385214 () Bool)

(assert (=> b!600321 (=> (not res!385214) (not e!343221))))

(declare-fun lt!273058 () SeekEntryResult!6257)

(declare-fun lt!273065 () (_ BitVec 32))

(assert (=> b!600321 (= res!385214 (= lt!273058 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273065 vacantSpotIndex!68 lt!273061 lt!273062 mask!3053)))))

(assert (=> b!600321 (= lt!273058 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273065 vacantSpotIndex!68 (select (arr!17817 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600321 (= lt!273061 (select (store (arr!17817 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273064 () Unit!18946)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18946)

(assert (=> b!600321 (= lt!273064 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273065 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600321 (= lt!273065 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!600322 () Bool)

(assert (=> b!600322 (= e!343224 e!343225)))

(declare-fun res!385221 () Bool)

(assert (=> b!600322 (=> res!385221 e!343225)))

(declare-fun lt!273063 () (_ BitVec 64))

(assert (=> b!600322 (= res!385221 (or (not (= (select (arr!17817 a!2986) j!136) lt!273061)) (not (= (select (arr!17817 a!2986) j!136) lt!273063)) (bvsge j!136 index!984)))))

(declare-fun e!343226 () Bool)

(assert (=> b!600322 e!343226))

(declare-fun res!385217 () Bool)

(assert (=> b!600322 (=> (not res!385217) (not e!343226))))

(assert (=> b!600322 (= res!385217 (= lt!273063 (select (arr!17817 a!2986) j!136)))))

(assert (=> b!600322 (= lt!273063 (select (store (arr!17817 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600323 () Bool)

(assert (=> b!600323 (= e!343230 true)))

(declare-fun lt!273066 () Bool)

(declare-fun contains!2974 (List!11858 (_ BitVec 64)) Bool)

(assert (=> b!600323 (= lt!273066 (contains!2974 Nil!11855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600324 () Bool)

(declare-fun res!385223 () Bool)

(assert (=> b!600324 (=> (not res!385223) (not e!343228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600324 (= res!385223 (validKeyInArray!0 k!1786))))

(declare-fun b!600325 () Bool)

(declare-fun res!385222 () Bool)

(assert (=> b!600325 (=> res!385222 e!343230)))

(declare-fun noDuplicate!291 (List!11858) Bool)

(assert (=> b!600325 (= res!385222 (not (noDuplicate!291 Nil!11855)))))

(declare-fun b!600326 () Bool)

(declare-fun res!385227 () Bool)

(assert (=> b!600326 (=> res!385227 e!343230)))

(assert (=> b!600326 (= res!385227 (contains!2974 Nil!11855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600327 () Bool)

(declare-fun res!385228 () Bool)

(assert (=> b!600327 (=> (not res!385228) (not e!343228))))

(assert (=> b!600327 (= res!385228 (validKeyInArray!0 (select (arr!17817 a!2986) j!136)))))

(declare-fun b!600328 () Bool)

(assert (=> b!600328 (= e!343229 e!343223)))

(declare-fun res!385215 () Bool)

(assert (=> b!600328 (=> (not res!385215) (not e!343223))))

(declare-fun lt!273054 () SeekEntryResult!6257)

(assert (=> b!600328 (= res!385215 (and (= lt!273054 (Found!6257 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17817 a!2986) index!984) (select (arr!17817 a!2986) j!136))) (not (= (select (arr!17817 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!600328 (= lt!273054 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17817 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600329 () Bool)

(declare-fun res!385213 () Bool)

(assert (=> b!600329 (=> (not res!385213) (not e!343228))))

(assert (=> b!600329 (= res!385213 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600330 () Bool)

(declare-fun res!385226 () Bool)

(assert (=> b!600330 (=> (not res!385226) (not e!343233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37115 (_ BitVec 32)) Bool)

(assert (=> b!600330 (= res!385226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600331 () Bool)

(declare-fun e!343227 () Bool)

(assert (=> b!600331 (= e!343226 e!343227)))

(declare-fun res!385225 () Bool)

(assert (=> b!600331 (=> res!385225 e!343227)))

(assert (=> b!600331 (= res!385225 (or (not (= (select (arr!17817 a!2986) j!136) lt!273061)) (not (= (select (arr!17817 a!2986) j!136) lt!273063)) (bvsge j!136 index!984)))))

(declare-fun b!600332 () Bool)

(declare-fun Unit!18948 () Unit!18946)

(assert (=> b!600332 (= e!343232 Unit!18948)))

(assert (=> b!600332 false))

(declare-fun b!600333 () Bool)

(declare-fun e!343222 () Bool)

(assert (=> b!600333 (= e!343227 e!343222)))

(declare-fun res!385220 () Bool)

(assert (=> b!600333 (=> (not res!385220) (not e!343222))))

(assert (=> b!600333 (= res!385220 (arrayContainsKey!0 lt!273062 (select (arr!17817 a!2986) j!136) j!136))))

(declare-fun b!600334 () Bool)

(declare-fun res!385232 () Bool)

(assert (=> b!600334 (=> (not res!385232) (not e!343233))))

(assert (=> b!600334 (= res!385232 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17817 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600335 () Bool)

(assert (=> b!600335 (= e!343222 (arrayContainsKey!0 lt!273062 (select (arr!17817 a!2986) j!136) index!984))))

(declare-fun b!600336 () Bool)

(declare-fun res!385218 () Bool)

(assert (=> b!600336 (=> (not res!385218) (not e!343233))))

(assert (=> b!600336 (= res!385218 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11855))))

(declare-fun b!600337 () Bool)

(assert (=> b!600337 (= e!343221 (= lt!273054 lt!273058))))

(declare-fun res!385231 () Bool)

(assert (=> start!54880 (=> (not res!385231) (not e!343228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54880 (= res!385231 (validMask!0 mask!3053))))

(assert (=> start!54880 e!343228))

(assert (=> start!54880 true))

(declare-fun array_inv!13613 (array!37115) Bool)

(assert (=> start!54880 (array_inv!13613 a!2986)))

(declare-fun b!600338 () Bool)

(declare-fun Unit!18949 () Unit!18946)

(assert (=> b!600338 (= e!343232 Unit!18949)))

(assert (= (and start!54880 res!385231) b!600319))

(assert (= (and b!600319 res!385224) b!600327))

(assert (= (and b!600327 res!385228) b!600324))

(assert (= (and b!600324 res!385223) b!600329))

(assert (= (and b!600329 res!385213) b!600318))

(assert (= (and b!600318 res!385229) b!600330))

(assert (= (and b!600330 res!385226) b!600336))

(assert (= (and b!600336 res!385218) b!600334))

(assert (= (and b!600334 res!385232) b!600317))

(assert (= (and b!600317 res!385216) b!600328))

(assert (= (and b!600328 res!385215) b!600321))

(assert (= (and b!600321 res!385214) b!600337))

(assert (= (and b!600321 c!67919) b!600332))

(assert (= (and b!600321 (not c!67919)) b!600338))

(assert (= (and b!600321 (not res!385230)) b!600322))

(assert (= (and b!600322 res!385217) b!600331))

(assert (= (and b!600331 (not res!385225)) b!600333))

(assert (= (and b!600333 res!385220) b!600335))

(assert (= (and b!600322 (not res!385221)) b!600320))

(assert (= (and b!600320 (not res!385219)) b!600325))

(assert (= (and b!600325 (not res!385222)) b!600326))

(assert (= (and b!600326 (not res!385227)) b!600323))

(declare-fun m!577541 () Bool)

(assert (=> b!600330 m!577541))

(declare-fun m!577543 () Bool)

(assert (=> b!600329 m!577543))

(declare-fun m!577545 () Bool)

(assert (=> b!600326 m!577545))

(declare-fun m!577547 () Bool)

(assert (=> b!600327 m!577547))

(assert (=> b!600327 m!577547))

(declare-fun m!577549 () Bool)

(assert (=> b!600327 m!577549))

(declare-fun m!577551 () Bool)

(assert (=> b!600334 m!577551))

(assert (=> b!600331 m!577547))

(declare-fun m!577553 () Bool)

(assert (=> b!600324 m!577553))

(declare-fun m!577555 () Bool)

(assert (=> b!600325 m!577555))

(declare-fun m!577557 () Bool)

(assert (=> b!600323 m!577557))

(declare-fun m!577559 () Bool)

(assert (=> b!600336 m!577559))

(assert (=> b!600335 m!577547))

(assert (=> b!600335 m!577547))

(declare-fun m!577561 () Bool)

(assert (=> b!600335 m!577561))

(declare-fun m!577563 () Bool)

(assert (=> b!600321 m!577563))

(assert (=> b!600321 m!577547))

(declare-fun m!577565 () Bool)

(assert (=> b!600321 m!577565))

(declare-fun m!577567 () Bool)

(assert (=> b!600321 m!577567))

(declare-fun m!577569 () Bool)

(assert (=> b!600321 m!577569))

(assert (=> b!600321 m!577547))

(declare-fun m!577571 () Bool)

(assert (=> b!600321 m!577571))

(declare-fun m!577573 () Bool)

(assert (=> b!600321 m!577573))

(declare-fun m!577575 () Bool)

(assert (=> b!600321 m!577575))

(assert (=> b!600322 m!577547))

(assert (=> b!600322 m!577565))

(declare-fun m!577577 () Bool)

(assert (=> b!600322 m!577577))

(assert (=> b!600333 m!577547))

(assert (=> b!600333 m!577547))

(declare-fun m!577579 () Bool)

(assert (=> b!600333 m!577579))

(declare-fun m!577581 () Bool)

(assert (=> b!600328 m!577581))

(assert (=> b!600328 m!577547))

(assert (=> b!600328 m!577547))

(declare-fun m!577583 () Bool)

(assert (=> b!600328 m!577583))

(declare-fun m!577585 () Bool)

(assert (=> b!600320 m!577585))

(declare-fun m!577587 () Bool)

(assert (=> b!600320 m!577587))

(assert (=> b!600320 m!577547))

(declare-fun m!577589 () Bool)

(assert (=> b!600320 m!577589))

(declare-fun m!577591 () Bool)

(assert (=> b!600320 m!577591))

(assert (=> b!600320 m!577547))

(declare-fun m!577593 () Bool)

(assert (=> b!600320 m!577593))

(assert (=> b!600320 m!577547))

(declare-fun m!577595 () Bool)

(assert (=> b!600320 m!577595))

(declare-fun m!577597 () Bool)

(assert (=> start!54880 m!577597))

(declare-fun m!577599 () Bool)

(assert (=> start!54880 m!577599))

(declare-fun m!577601 () Bool)

(assert (=> b!600318 m!577601))

(assert (=> b!600317 m!577565))

(declare-fun m!577603 () Bool)

(assert (=> b!600317 m!577603))

(push 1)

