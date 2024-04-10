; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53590 () Bool)

(assert start!53590)

(declare-fun b!583530 () Bool)

(declare-fun e!334349 () Bool)

(assert (=> b!583530 (= e!334349 false)))

(declare-datatypes ((SeekEntryResult!5960 0))(
  ( (MissingZero!5960 (index!26067 (_ BitVec 32))) (Found!5960 (index!26068 (_ BitVec 32))) (Intermediate!5960 (undefined!6772 Bool) (index!26069 (_ BitVec 32)) (x!54909 (_ BitVec 32))) (Undefined!5960) (MissingVacant!5960 (index!26070 (_ BitVec 32))) )
))
(declare-fun lt!265346 () SeekEntryResult!5960)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!265347 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36491 0))(
  ( (array!36492 (arr!17520 (Array (_ BitVec 32) (_ BitVec 64))) (size!17884 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36491)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36491 (_ BitVec 32)) SeekEntryResult!5960)

(assert (=> b!583530 (= lt!265346 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265347 vacantSpotIndex!68 (select (arr!17520 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583532 () Bool)

(declare-fun res!371348 () Bool)

(declare-fun e!334348 () Bool)

(assert (=> b!583532 (=> (not res!371348) (not e!334348))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!583532 (= res!371348 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17520 a!2986) j!136) a!2986 mask!3053) (Found!5960 j!136)))))

(declare-fun b!583533 () Bool)

(declare-fun res!371347 () Bool)

(declare-fun e!334347 () Bool)

(assert (=> b!583533 (=> (not res!371347) (not e!334347))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36491 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583533 (= res!371347 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583534 () Bool)

(assert (=> b!583534 (= e!334347 e!334348)))

(declare-fun res!371357 () Bool)

(assert (=> b!583534 (=> (not res!371357) (not e!334348))))

(declare-fun lt!265348 () SeekEntryResult!5960)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!583534 (= res!371357 (or (= lt!265348 (MissingZero!5960 i!1108)) (= lt!265348 (MissingVacant!5960 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36491 (_ BitVec 32)) SeekEntryResult!5960)

(assert (=> b!583534 (= lt!265348 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!583535 () Bool)

(declare-fun res!371350 () Bool)

(assert (=> b!583535 (=> (not res!371350) (not e!334348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36491 (_ BitVec 32)) Bool)

(assert (=> b!583535 (= res!371350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583536 () Bool)

(declare-fun res!371352 () Bool)

(assert (=> b!583536 (=> (not res!371352) (not e!334347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583536 (= res!371352 (validKeyInArray!0 (select (arr!17520 a!2986) j!136)))))

(declare-fun b!583537 () Bool)

(declare-fun res!371349 () Bool)

(assert (=> b!583537 (=> (not res!371349) (not e!334348))))

(assert (=> b!583537 (= res!371349 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17520 a!2986) index!984) (select (arr!17520 a!2986) j!136))) (not (= (select (arr!17520 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun res!371354 () Bool)

(assert (=> start!53590 (=> (not res!371354) (not e!334347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53590 (= res!371354 (validMask!0 mask!3053))))

(assert (=> start!53590 e!334347))

(assert (=> start!53590 true))

(declare-fun array_inv!13316 (array!36491) Bool)

(assert (=> start!53590 (array_inv!13316 a!2986)))

(declare-fun b!583531 () Bool)

(assert (=> b!583531 (= e!334348 e!334349)))

(declare-fun res!371353 () Bool)

(assert (=> b!583531 (=> (not res!371353) (not e!334349))))

(assert (=> b!583531 (= res!371353 (and (bvsge lt!265347 #b00000000000000000000000000000000) (bvslt lt!265347 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!583531 (= lt!265347 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!583538 () Bool)

(declare-fun res!371351 () Bool)

(assert (=> b!583538 (=> (not res!371351) (not e!334347))))

(assert (=> b!583538 (= res!371351 (validKeyInArray!0 k!1786))))

(declare-fun b!583539 () Bool)

(declare-fun res!371346 () Bool)

(assert (=> b!583539 (=> (not res!371346) (not e!334348))))

(assert (=> b!583539 (= res!371346 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17520 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17520 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583540 () Bool)

(declare-fun res!371356 () Bool)

(assert (=> b!583540 (=> (not res!371356) (not e!334348))))

(declare-datatypes ((List!11561 0))(
  ( (Nil!11558) (Cons!11557 (h!12602 (_ BitVec 64)) (t!17789 List!11561)) )
))
(declare-fun arrayNoDuplicates!0 (array!36491 (_ BitVec 32) List!11561) Bool)

(assert (=> b!583540 (= res!371356 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11558))))

(declare-fun b!583541 () Bool)

(declare-fun res!371355 () Bool)

(assert (=> b!583541 (=> (not res!371355) (not e!334347))))

(assert (=> b!583541 (= res!371355 (and (= (size!17884 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17884 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17884 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53590 res!371354) b!583541))

(assert (= (and b!583541 res!371355) b!583536))

(assert (= (and b!583536 res!371352) b!583538))

(assert (= (and b!583538 res!371351) b!583533))

(assert (= (and b!583533 res!371347) b!583534))

(assert (= (and b!583534 res!371357) b!583535))

(assert (= (and b!583535 res!371350) b!583540))

(assert (= (and b!583540 res!371356) b!583539))

(assert (= (and b!583539 res!371346) b!583532))

(assert (= (and b!583532 res!371348) b!583537))

(assert (= (and b!583537 res!371349) b!583531))

(assert (= (and b!583531 res!371353) b!583530))

(declare-fun m!561985 () Bool)

(assert (=> b!583531 m!561985))

(declare-fun m!561987 () Bool)

(assert (=> b!583535 m!561987))

(declare-fun m!561989 () Bool)

(assert (=> b!583530 m!561989))

(assert (=> b!583530 m!561989))

(declare-fun m!561991 () Bool)

(assert (=> b!583530 m!561991))

(declare-fun m!561993 () Bool)

(assert (=> b!583539 m!561993))

(declare-fun m!561995 () Bool)

(assert (=> b!583539 m!561995))

(declare-fun m!561997 () Bool)

(assert (=> b!583539 m!561997))

(declare-fun m!561999 () Bool)

(assert (=> b!583533 m!561999))

(assert (=> b!583536 m!561989))

(assert (=> b!583536 m!561989))

(declare-fun m!562001 () Bool)

(assert (=> b!583536 m!562001))

(declare-fun m!562003 () Bool)

(assert (=> b!583537 m!562003))

(assert (=> b!583537 m!561989))

(assert (=> b!583532 m!561989))

(assert (=> b!583532 m!561989))

(declare-fun m!562005 () Bool)

(assert (=> b!583532 m!562005))

(declare-fun m!562007 () Bool)

(assert (=> b!583538 m!562007))

(declare-fun m!562009 () Bool)

(assert (=> b!583534 m!562009))

(declare-fun m!562011 () Bool)

(assert (=> b!583540 m!562011))

(declare-fun m!562013 () Bool)

(assert (=> start!53590 m!562013))

(declare-fun m!562015 () Bool)

(assert (=> start!53590 m!562015))

(push 1)

