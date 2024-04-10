; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53536 () Bool)

(assert start!53536)

(declare-fun b!582786 () Bool)

(declare-fun e!334102 () Bool)

(assert (=> b!582786 (= e!334102 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5933 0))(
  ( (MissingZero!5933 (index!25959 (_ BitVec 32))) (Found!5933 (index!25960 (_ BitVec 32))) (Intermediate!5933 (undefined!6745 Bool) (index!25961 (_ BitVec 32)) (x!54810 (_ BitVec 32))) (Undefined!5933) (MissingVacant!5933 (index!25962 (_ BitVec 32))) )
))
(declare-fun lt!265192 () SeekEntryResult!5933)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36437 0))(
  ( (array!36438 (arr!17493 (Array (_ BitVec 32) (_ BitVec 64))) (size!17857 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36437)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36437 (_ BitVec 32)) SeekEntryResult!5933)

(assert (=> b!582786 (= lt!265192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17493 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582787 () Bool)

(declare-fun res!370607 () Bool)

(assert (=> b!582787 (=> (not res!370607) (not e!334102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36437 (_ BitVec 32)) Bool)

(assert (=> b!582787 (= res!370607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!582788 () Bool)

(declare-fun res!370608 () Bool)

(declare-fun e!334103 () Bool)

(assert (=> b!582788 (=> (not res!370608) (not e!334103))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582788 (= res!370608 (validKeyInArray!0 k!1786))))

(declare-fun b!582789 () Bool)

(declare-fun res!370603 () Bool)

(assert (=> b!582789 (=> (not res!370603) (not e!334103))))

(assert (=> b!582789 (= res!370603 (validKeyInArray!0 (select (arr!17493 a!2986) j!136)))))

(declare-fun b!582790 () Bool)

(declare-fun res!370605 () Bool)

(assert (=> b!582790 (=> (not res!370605) (not e!334103))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582790 (= res!370605 (and (= (size!17857 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17857 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17857 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582791 () Bool)

(declare-fun res!370610 () Bool)

(assert (=> b!582791 (=> (not res!370610) (not e!334102))))

(assert (=> b!582791 (= res!370610 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17493 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17493 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!370604 () Bool)

(assert (=> start!53536 (=> (not res!370604) (not e!334103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53536 (= res!370604 (validMask!0 mask!3053))))

(assert (=> start!53536 e!334103))

(assert (=> start!53536 true))

(declare-fun array_inv!13289 (array!36437) Bool)

(assert (=> start!53536 (array_inv!13289 a!2986)))

(declare-fun b!582792 () Bool)

(assert (=> b!582792 (= e!334103 e!334102)))

(declare-fun res!370602 () Bool)

(assert (=> b!582792 (=> (not res!370602) (not e!334102))))

(declare-fun lt!265191 () SeekEntryResult!5933)

(assert (=> b!582792 (= res!370602 (or (= lt!265191 (MissingZero!5933 i!1108)) (= lt!265191 (MissingVacant!5933 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36437 (_ BitVec 32)) SeekEntryResult!5933)

(assert (=> b!582792 (= lt!265191 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!582793 () Bool)

(declare-fun res!370609 () Bool)

(assert (=> b!582793 (=> (not res!370609) (not e!334102))))

(declare-datatypes ((List!11534 0))(
  ( (Nil!11531) (Cons!11530 (h!12575 (_ BitVec 64)) (t!17762 List!11534)) )
))
(declare-fun arrayNoDuplicates!0 (array!36437 (_ BitVec 32) List!11534) Bool)

(assert (=> b!582793 (= res!370609 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11531))))

(declare-fun b!582794 () Bool)

(declare-fun res!370606 () Bool)

(assert (=> b!582794 (=> (not res!370606) (not e!334103))))

(declare-fun arrayContainsKey!0 (array!36437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582794 (= res!370606 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!53536 res!370604) b!582790))

(assert (= (and b!582790 res!370605) b!582789))

(assert (= (and b!582789 res!370603) b!582788))

(assert (= (and b!582788 res!370608) b!582794))

(assert (= (and b!582794 res!370606) b!582792))

(assert (= (and b!582792 res!370602) b!582787))

(assert (= (and b!582787 res!370607) b!582793))

(assert (= (and b!582793 res!370609) b!582791))

(assert (= (and b!582791 res!370610) b!582786))

(declare-fun m!561277 () Bool)

(assert (=> b!582786 m!561277))

(assert (=> b!582786 m!561277))

(declare-fun m!561279 () Bool)

(assert (=> b!582786 m!561279))

(declare-fun m!561281 () Bool)

(assert (=> b!582788 m!561281))

(declare-fun m!561283 () Bool)

(assert (=> b!582792 m!561283))

(declare-fun m!561285 () Bool)

(assert (=> b!582787 m!561285))

(declare-fun m!561287 () Bool)

(assert (=> b!582791 m!561287))

(declare-fun m!561289 () Bool)

(assert (=> b!582791 m!561289))

(declare-fun m!561291 () Bool)

(assert (=> b!582791 m!561291))

(assert (=> b!582789 m!561277))

(assert (=> b!582789 m!561277))

(declare-fun m!561293 () Bool)

(assert (=> b!582789 m!561293))

(declare-fun m!561295 () Bool)

(assert (=> b!582793 m!561295))

(declare-fun m!561297 () Bool)

(assert (=> b!582794 m!561297))

(declare-fun m!561299 () Bool)

(assert (=> start!53536 m!561299))

(declare-fun m!561301 () Bool)

(assert (=> start!53536 m!561301))

(push 1)

(assert (not b!582792))

(assert (not b!582786))

(assert (not b!582788))

(assert (not b!582793))

(assert (not b!582794))

(assert (not start!53536))

(assert (not b!582789))

(assert (not b!582787))

(check-sat)

