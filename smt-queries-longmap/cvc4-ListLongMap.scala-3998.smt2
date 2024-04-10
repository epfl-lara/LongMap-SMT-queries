; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54182 () Bool)

(assert start!54182)

(declare-fun b!592313 () Bool)

(declare-datatypes ((Unit!18582 0))(
  ( (Unit!18583) )
))
(declare-fun e!338239 () Unit!18582)

(declare-fun Unit!18584 () Unit!18582)

(assert (=> b!592313 (= e!338239 Unit!18584)))

(assert (=> b!592313 false))

(declare-fun res!379163 () Bool)

(declare-fun e!338245 () Bool)

(assert (=> start!54182 (=> (not res!379163) (not e!338245))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54182 (= res!379163 (validMask!0 mask!3053))))

(assert (=> start!54182 e!338245))

(assert (=> start!54182 true))

(declare-datatypes ((array!36912 0))(
  ( (array!36913 (arr!17726 (Array (_ BitVec 32) (_ BitVec 64))) (size!18090 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36912)

(declare-fun array_inv!13522 (array!36912) Bool)

(assert (=> start!54182 (array_inv!13522 a!2986)))

(declare-fun b!592314 () Bool)

(declare-fun res!379167 () Bool)

(assert (=> b!592314 (=> (not res!379167) (not e!338245))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592314 (= res!379167 (and (= (size!18090 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18090 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18090 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592315 () Bool)

(declare-fun e!338240 () Bool)

(assert (=> b!592315 (= e!338245 e!338240)))

(declare-fun res!379165 () Bool)

(assert (=> b!592315 (=> (not res!379165) (not e!338240))))

(declare-datatypes ((SeekEntryResult!6166 0))(
  ( (MissingZero!6166 (index!26900 (_ BitVec 32))) (Found!6166 (index!26901 (_ BitVec 32))) (Intermediate!6166 (undefined!6978 Bool) (index!26902 (_ BitVec 32)) (x!55686 (_ BitVec 32))) (Undefined!6166) (MissingVacant!6166 (index!26903 (_ BitVec 32))) )
))
(declare-fun lt!268863 () SeekEntryResult!6166)

(assert (=> b!592315 (= res!379165 (or (= lt!268863 (MissingZero!6166 i!1108)) (= lt!268863 (MissingVacant!6166 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36912 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!592315 (= lt!268863 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!592316 () Bool)

(declare-fun e!338250 () Bool)

(assert (=> b!592316 (= e!338240 e!338250)))

(declare-fun res!379162 () Bool)

(assert (=> b!592316 (=> (not res!379162) (not e!338250))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!592316 (= res!379162 (= (select (store (arr!17726 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268862 () array!36912)

(assert (=> b!592316 (= lt!268862 (array!36913 (store (arr!17726 a!2986) i!1108 k!1786) (size!18090 a!2986)))))

(declare-fun b!592317 () Bool)

(declare-fun e!338241 () Bool)

(assert (=> b!592317 (= e!338250 e!338241)))

(declare-fun res!379161 () Bool)

(assert (=> b!592317 (=> (not res!379161) (not e!338241))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!268864 () SeekEntryResult!6166)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592317 (= res!379161 (and (= lt!268864 (Found!6166 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17726 a!2986) index!984) (select (arr!17726 a!2986) j!136))) (not (= (select (arr!17726 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36912 (_ BitVec 32)) SeekEntryResult!6166)

(assert (=> b!592317 (= lt!268864 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592318 () Bool)

(declare-fun e!338248 () Bool)

(declare-fun e!338249 () Bool)

(assert (=> b!592318 (= e!338248 e!338249)))

(declare-fun res!379174 () Bool)

(assert (=> b!592318 (=> (not res!379174) (not e!338249))))

(declare-fun arrayContainsKey!0 (array!36912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592318 (= res!379174 (arrayContainsKey!0 lt!268862 (select (arr!17726 a!2986) j!136) j!136))))

(declare-fun b!592319 () Bool)

(declare-fun e!338246 () Bool)

(declare-fun e!338244 () Bool)

(assert (=> b!592319 (= e!338246 e!338244)))

(declare-fun res!379164 () Bool)

(assert (=> b!592319 (=> res!379164 e!338244)))

(declare-fun lt!268860 () (_ BitVec 64))

(declare-fun lt!268867 () (_ BitVec 64))

(assert (=> b!592319 (= res!379164 (or (not (= (select (arr!17726 a!2986) j!136) lt!268860)) (not (= (select (arr!17726 a!2986) j!136) lt!268867)) (bvsge j!136 index!984)))))

(declare-fun e!338243 () Bool)

(assert (=> b!592319 e!338243))

(declare-fun res!379172 () Bool)

(assert (=> b!592319 (=> (not res!379172) (not e!338243))))

(assert (=> b!592319 (= res!379172 (= lt!268867 (select (arr!17726 a!2986) j!136)))))

(assert (=> b!592319 (= lt!268867 (select (store (arr!17726 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!592320 () Bool)

(declare-fun res!379169 () Bool)

(assert (=> b!592320 (=> (not res!379169) (not e!338245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592320 (= res!379169 (validKeyInArray!0 k!1786))))

(declare-fun b!592321 () Bool)

(assert (=> b!592321 (= e!338249 (arrayContainsKey!0 lt!268862 (select (arr!17726 a!2986) j!136) index!984))))

(declare-fun b!592322 () Bool)

(declare-fun res!379159 () Bool)

(assert (=> b!592322 (=> (not res!379159) (not e!338240))))

(assert (=> b!592322 (= res!379159 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17726 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592323 () Bool)

(declare-fun e!338247 () Bool)

(declare-fun lt!268865 () SeekEntryResult!6166)

(assert (=> b!592323 (= e!338247 (= lt!268864 lt!268865))))

(declare-fun b!592324 () Bool)

(declare-fun res!379175 () Bool)

(assert (=> b!592324 (=> (not res!379175) (not e!338245))))

(assert (=> b!592324 (= res!379175 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592325 () Bool)

(assert (=> b!592325 (= e!338243 e!338248)))

(declare-fun res!379171 () Bool)

(assert (=> b!592325 (=> res!379171 e!338248)))

(assert (=> b!592325 (= res!379171 (or (not (= (select (arr!17726 a!2986) j!136) lt!268860)) (not (= (select (arr!17726 a!2986) j!136) lt!268867)) (bvsge j!136 index!984)))))

(declare-fun b!592326 () Bool)

(declare-fun res!379168 () Bool)

(assert (=> b!592326 (=> (not res!379168) (not e!338240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36912 (_ BitVec 32)) Bool)

(assert (=> b!592326 (= res!379168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!592327 () Bool)

(declare-fun res!379170 () Bool)

(assert (=> b!592327 (=> (not res!379170) (not e!338245))))

(assert (=> b!592327 (= res!379170 (validKeyInArray!0 (select (arr!17726 a!2986) j!136)))))

(declare-fun b!592328 () Bool)

(assert (=> b!592328 (= e!338244 (or (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 j!136) (size!18090 a!2986))))))

(assert (=> b!592328 (arrayContainsKey!0 lt!268862 (select (arr!17726 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!268868 () Unit!18582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36912 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18582)

(assert (=> b!592328 (= lt!268868 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!268862 (select (arr!17726 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592329 () Bool)

(assert (=> b!592329 (= e!338241 (not e!338246))))

(declare-fun res!379160 () Bool)

(assert (=> b!592329 (=> res!379160 e!338246)))

(declare-fun lt!268861 () SeekEntryResult!6166)

(assert (=> b!592329 (= res!379160 (not (= lt!268861 (Found!6166 index!984))))))

(declare-fun lt!268866 () Unit!18582)

(assert (=> b!592329 (= lt!268866 e!338239)))

(declare-fun c!66944 () Bool)

(assert (=> b!592329 (= c!66944 (= lt!268861 Undefined!6166))))

(assert (=> b!592329 (= lt!268861 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268860 lt!268862 mask!3053))))

(assert (=> b!592329 e!338247))

(declare-fun res!379166 () Bool)

(assert (=> b!592329 (=> (not res!379166) (not e!338247))))

(declare-fun lt!268870 () (_ BitVec 32))

(assert (=> b!592329 (= res!379166 (= lt!268865 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268870 vacantSpotIndex!68 lt!268860 lt!268862 mask!3053)))))

(assert (=> b!592329 (= lt!268865 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268870 vacantSpotIndex!68 (select (arr!17726 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!592329 (= lt!268860 (select (store (arr!17726 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!268869 () Unit!18582)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36912 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18582)

(assert (=> b!592329 (= lt!268869 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268870 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592329 (= lt!268870 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592330 () Bool)

(declare-fun res!379173 () Bool)

(assert (=> b!592330 (=> (not res!379173) (not e!338240))))

(declare-datatypes ((List!11767 0))(
  ( (Nil!11764) (Cons!11763 (h!12808 (_ BitVec 64)) (t!17995 List!11767)) )
))
(declare-fun arrayNoDuplicates!0 (array!36912 (_ BitVec 32) List!11767) Bool)

(assert (=> b!592330 (= res!379173 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11764))))

(declare-fun b!592331 () Bool)

(declare-fun Unit!18585 () Unit!18582)

(assert (=> b!592331 (= e!338239 Unit!18585)))

(assert (= (and start!54182 res!379163) b!592314))

(assert (= (and b!592314 res!379167) b!592327))

(assert (= (and b!592327 res!379170) b!592320))

(assert (= (and b!592320 res!379169) b!592324))

(assert (= (and b!592324 res!379175) b!592315))

(assert (= (and b!592315 res!379165) b!592326))

(assert (= (and b!592326 res!379168) b!592330))

(assert (= (and b!592330 res!379173) b!592322))

(assert (= (and b!592322 res!379159) b!592316))

(assert (= (and b!592316 res!379162) b!592317))

(assert (= (and b!592317 res!379161) b!592329))

(assert (= (and b!592329 res!379166) b!592323))

(assert (= (and b!592329 c!66944) b!592313))

(assert (= (and b!592329 (not c!66944)) b!592331))

(assert (= (and b!592329 (not res!379160)) b!592319))

(assert (= (and b!592319 res!379172) b!592325))

(assert (= (and b!592325 (not res!379171)) b!592318))

(assert (= (and b!592318 res!379174) b!592321))

(assert (= (and b!592319 (not res!379164)) b!592328))

(declare-fun m!570437 () Bool)

(assert (=> b!592328 m!570437))

(assert (=> b!592328 m!570437))

(declare-fun m!570439 () Bool)

(assert (=> b!592328 m!570439))

(assert (=> b!592328 m!570437))

(declare-fun m!570441 () Bool)

(assert (=> b!592328 m!570441))

(assert (=> b!592325 m!570437))

(declare-fun m!570443 () Bool)

(assert (=> start!54182 m!570443))

(declare-fun m!570445 () Bool)

(assert (=> start!54182 m!570445))

(assert (=> b!592321 m!570437))

(assert (=> b!592321 m!570437))

(declare-fun m!570447 () Bool)

(assert (=> b!592321 m!570447))

(declare-fun m!570449 () Bool)

(assert (=> b!592324 m!570449))

(declare-fun m!570451 () Bool)

(assert (=> b!592322 m!570451))

(declare-fun m!570453 () Bool)

(assert (=> b!592326 m!570453))

(declare-fun m!570455 () Bool)

(assert (=> b!592317 m!570455))

(assert (=> b!592317 m!570437))

(assert (=> b!592317 m!570437))

(declare-fun m!570457 () Bool)

(assert (=> b!592317 m!570457))

(declare-fun m!570459 () Bool)

(assert (=> b!592329 m!570459))

(declare-fun m!570461 () Bool)

(assert (=> b!592329 m!570461))

(declare-fun m!570463 () Bool)

(assert (=> b!592329 m!570463))

(declare-fun m!570465 () Bool)

(assert (=> b!592329 m!570465))

(declare-fun m!570467 () Bool)

(assert (=> b!592329 m!570467))

(declare-fun m!570469 () Bool)

(assert (=> b!592329 m!570469))

(assert (=> b!592329 m!570437))

(assert (=> b!592329 m!570437))

(declare-fun m!570471 () Bool)

(assert (=> b!592329 m!570471))

(assert (=> b!592327 m!570437))

(assert (=> b!592327 m!570437))

(declare-fun m!570473 () Bool)

(assert (=> b!592327 m!570473))

(declare-fun m!570475 () Bool)

(assert (=> b!592320 m!570475))

(declare-fun m!570477 () Bool)

(assert (=> b!592315 m!570477))

(declare-fun m!570479 () Bool)

(assert (=> b!592330 m!570479))

(assert (=> b!592316 m!570461))

(declare-fun m!570481 () Bool)

(assert (=> b!592316 m!570481))

(assert (=> b!592319 m!570437))

(assert (=> b!592319 m!570461))

(declare-fun m!570483 () Bool)

(assert (=> b!592319 m!570483))

(assert (=> b!592318 m!570437))

(assert (=> b!592318 m!570437))

(declare-fun m!570485 () Bool)

(assert (=> b!592318 m!570485))

(push 1)

(assert (not b!592327))

(assert (not b!592330))

(assert (not b!592317))

(assert (not b!592324))

(assert (not b!592326))

(assert (not b!592318))

(assert (not b!592315))

(assert (not b!592320))

(assert (not b!592329))

(assert (not start!54182))

(assert (not b!592321))

(assert (not b!592328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

