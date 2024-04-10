; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53642 () Bool)

(assert start!53642)

(declare-fun b!584466 () Bool)

(declare-fun res!372284 () Bool)

(declare-fun e!334661 () Bool)

(assert (=> b!584466 (=> (not res!372284) (not e!334661))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36543 0))(
  ( (array!36544 (arr!17546 (Array (_ BitVec 32) (_ BitVec 64))) (size!17910 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36543)

(assert (=> b!584466 (= res!372284 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17546 a!2986) index!984) (select (arr!17546 a!2986) j!136))) (not (= (select (arr!17546 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!584467 () Bool)

(declare-fun e!334660 () Bool)

(assert (=> b!584467 (= e!334660 e!334661)))

(declare-fun res!372292 () Bool)

(assert (=> b!584467 (=> (not res!372292) (not e!334661))))

(declare-datatypes ((SeekEntryResult!5986 0))(
  ( (MissingZero!5986 (index!26171 (_ BitVec 32))) (Found!5986 (index!26172 (_ BitVec 32))) (Intermediate!5986 (undefined!6798 Bool) (index!26173 (_ BitVec 32)) (x!54999 (_ BitVec 32))) (Undefined!5986) (MissingVacant!5986 (index!26174 (_ BitVec 32))) )
))
(declare-fun lt!265580 () SeekEntryResult!5986)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!584467 (= res!372292 (or (= lt!265580 (MissingZero!5986 i!1108)) (= lt!265580 (MissingVacant!5986 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36543 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!584467 (= lt!265580 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!584468 () Bool)

(declare-fun res!372283 () Bool)

(assert (=> b!584468 (=> (not res!372283) (not e!334660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!584468 (= res!372283 (validKeyInArray!0 k!1786))))

(declare-fun b!584469 () Bool)

(declare-fun res!372293 () Bool)

(assert (=> b!584469 (=> (not res!372293) (not e!334660))))

(assert (=> b!584469 (= res!372293 (and (= (size!17910 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17910 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17910 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!584470 () Bool)

(declare-fun res!372288 () Bool)

(assert (=> b!584470 (=> (not res!372288) (not e!334661))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36543 (_ BitVec 32)) SeekEntryResult!5986)

(assert (=> b!584470 (= res!372288 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17546 a!2986) j!136) a!2986 mask!3053) (Found!5986 j!136)))))

(declare-fun b!584471 () Bool)

(declare-fun res!372286 () Bool)

(assert (=> b!584471 (=> (not res!372286) (not e!334660))))

(declare-fun arrayContainsKey!0 (array!36543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!584471 (= res!372286 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!584472 () Bool)

(declare-fun res!372290 () Bool)

(assert (=> b!584472 (=> (not res!372290) (not e!334661))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36543 (_ BitVec 32)) Bool)

(assert (=> b!584472 (= res!372290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!372287 () Bool)

(assert (=> start!53642 (=> (not res!372287) (not e!334660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53642 (= res!372287 (validMask!0 mask!3053))))

(assert (=> start!53642 e!334660))

(assert (=> start!53642 true))

(declare-fun array_inv!13342 (array!36543) Bool)

(assert (=> start!53642 (array_inv!13342 a!2986)))

(declare-fun b!584473 () Bool)

(declare-fun res!372291 () Bool)

(assert (=> b!584473 (=> (not res!372291) (not e!334661))))

(declare-datatypes ((List!11587 0))(
  ( (Nil!11584) (Cons!11583 (h!12628 (_ BitVec 64)) (t!17815 List!11587)) )
))
(declare-fun arrayNoDuplicates!0 (array!36543 (_ BitVec 32) List!11587) Bool)

(assert (=> b!584473 (= res!372291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11584))))

(declare-fun b!584474 () Bool)

(declare-fun e!334662 () Bool)

(assert (=> b!584474 (= e!334662 false)))

(declare-fun lt!265582 () (_ BitVec 32))

(declare-fun lt!265581 () SeekEntryResult!5986)

(assert (=> b!584474 (= lt!265581 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265582 vacantSpotIndex!68 (select (arr!17546 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!584475 () Bool)

(assert (=> b!584475 (= e!334661 e!334662)))

(declare-fun res!372282 () Bool)

(assert (=> b!584475 (=> (not res!372282) (not e!334662))))

(assert (=> b!584475 (= res!372282 (and (bvsge lt!265582 #b00000000000000000000000000000000) (bvslt lt!265582 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!584475 (= lt!265582 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!584476 () Bool)

(declare-fun res!372285 () Bool)

(assert (=> b!584476 (=> (not res!372285) (not e!334661))))

(assert (=> b!584476 (= res!372285 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17546 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17546 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!584477 () Bool)

(declare-fun res!372289 () Bool)

(assert (=> b!584477 (=> (not res!372289) (not e!334660))))

(assert (=> b!584477 (= res!372289 (validKeyInArray!0 (select (arr!17546 a!2986) j!136)))))

(assert (= (and start!53642 res!372287) b!584469))

(assert (= (and b!584469 res!372293) b!584477))

(assert (= (and b!584477 res!372289) b!584468))

(assert (= (and b!584468 res!372283) b!584471))

(assert (= (and b!584471 res!372286) b!584467))

(assert (= (and b!584467 res!372292) b!584472))

(assert (= (and b!584472 res!372290) b!584473))

(assert (= (and b!584473 res!372291) b!584476))

(assert (= (and b!584476 res!372285) b!584470))

(assert (= (and b!584470 res!372288) b!584466))

(assert (= (and b!584466 res!372284) b!584475))

(assert (= (and b!584475 res!372282) b!584474))

(declare-fun m!562817 () Bool)

(assert (=> b!584472 m!562817))

(declare-fun m!562819 () Bool)

(assert (=> b!584467 m!562819))

(declare-fun m!562821 () Bool)

(assert (=> b!584468 m!562821))

(declare-fun m!562823 () Bool)

(assert (=> b!584476 m!562823))

(declare-fun m!562825 () Bool)

(assert (=> b!584476 m!562825))

(declare-fun m!562827 () Bool)

(assert (=> b!584476 m!562827))

(declare-fun m!562829 () Bool)

(assert (=> start!53642 m!562829))

(declare-fun m!562831 () Bool)

(assert (=> start!53642 m!562831))

(declare-fun m!562833 () Bool)

(assert (=> b!584466 m!562833))

(declare-fun m!562835 () Bool)

(assert (=> b!584466 m!562835))

(declare-fun m!562837 () Bool)

(assert (=> b!584471 m!562837))

(assert (=> b!584474 m!562835))

(assert (=> b!584474 m!562835))

(declare-fun m!562839 () Bool)

(assert (=> b!584474 m!562839))

(declare-fun m!562841 () Bool)

(assert (=> b!584473 m!562841))

(assert (=> b!584477 m!562835))

(assert (=> b!584477 m!562835))

(declare-fun m!562843 () Bool)

(assert (=> b!584477 m!562843))

(assert (=> b!584470 m!562835))

(assert (=> b!584470 m!562835))

(declare-fun m!562845 () Bool)

(assert (=> b!584470 m!562845))

(declare-fun m!562847 () Bool)

(assert (=> b!584475 m!562847))

(push 1)

(assert (not b!584475))

(assert (not b!584477))

(assert (not b!584471))

(assert (not b!584468))

(assert (not b!584472))

(assert (not b!584470))

(assert (not b!584467))

(assert (not start!53642))

