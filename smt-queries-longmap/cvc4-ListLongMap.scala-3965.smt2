; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53864 () Bool)

(assert start!53864)

(declare-fun b!587482 () Bool)

(declare-fun e!335641 () Bool)

(declare-fun e!335643 () Bool)

(assert (=> b!587482 (= e!335641 e!335643)))

(declare-fun res!375118 () Bool)

(assert (=> b!587482 (=> (not res!375118) (not e!335643))))

(declare-datatypes ((SeekEntryResult!6067 0))(
  ( (MissingZero!6067 (index!26498 (_ BitVec 32))) (Found!6067 (index!26499 (_ BitVec 32))) (Intermediate!6067 (undefined!6879 Bool) (index!26500 (_ BitVec 32)) (x!55305 (_ BitVec 32))) (Undefined!6067) (MissingVacant!6067 (index!26501 (_ BitVec 32))) )
))
(declare-fun lt!266413 () SeekEntryResult!6067)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587482 (= res!375118 (or (= lt!266413 (MissingZero!6067 i!1108)) (= lt!266413 (MissingVacant!6067 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36708 0))(
  ( (array!36709 (arr!17627 (Array (_ BitVec 32) (_ BitVec 64))) (size!17991 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36708)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36708 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!587482 (= lt!266413 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587483 () Bool)

(declare-fun res!375125 () Bool)

(assert (=> b!587483 (=> (not res!375125) (not e!335643))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!587483 (= res!375125 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17627 a!2986) index!984) (select (arr!17627 a!2986) j!136))) (not (= (select (arr!17627 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587484 () Bool)

(declare-fun lt!266412 () (_ BitVec 32))

(assert (=> b!587484 (= e!335643 (not (or (bvslt mask!3053 #b00000000000000000000000000000000) (bvslt lt!266412 #b00000000000000000000000000000000) (bvsge lt!266412 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36708 (_ BitVec 32)) SeekEntryResult!6067)

(assert (=> b!587484 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266412 vacantSpotIndex!68 (select (arr!17627 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266412 vacantSpotIndex!68 (select (store (arr!17627 a!2986) i!1108 k!1786) j!136) (array!36709 (store (arr!17627 a!2986) i!1108 k!1786) (size!17991 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18254 0))(
  ( (Unit!18255) )
))
(declare-fun lt!266411 () Unit!18254)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36708 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18254)

(assert (=> b!587484 (= lt!266411 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266412 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587484 (= lt!266412 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587485 () Bool)

(declare-fun res!375123 () Bool)

(assert (=> b!587485 (=> (not res!375123) (not e!335643))))

(declare-datatypes ((List!11668 0))(
  ( (Nil!11665) (Cons!11664 (h!12709 (_ BitVec 64)) (t!17896 List!11668)) )
))
(declare-fun arrayNoDuplicates!0 (array!36708 (_ BitVec 32) List!11668) Bool)

(assert (=> b!587485 (= res!375123 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11665))))

(declare-fun b!587486 () Bool)

(declare-fun res!375120 () Bool)

(assert (=> b!587486 (=> (not res!375120) (not e!335641))))

(assert (=> b!587486 (= res!375120 (and (= (size!17991 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17991 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17991 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587487 () Bool)

(declare-fun res!375128 () Bool)

(assert (=> b!587487 (=> (not res!375128) (not e!335641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587487 (= res!375128 (validKeyInArray!0 (select (arr!17627 a!2986) j!136)))))

(declare-fun b!587488 () Bool)

(declare-fun res!375124 () Bool)

(assert (=> b!587488 (=> (not res!375124) (not e!335641))))

(declare-fun arrayContainsKey!0 (array!36708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587488 (= res!375124 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587489 () Bool)

(declare-fun res!375127 () Bool)

(assert (=> b!587489 (=> (not res!375127) (not e!335643))))

(assert (=> b!587489 (= res!375127 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17627 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17627 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375119 () Bool)

(assert (=> start!53864 (=> (not res!375119) (not e!335641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53864 (= res!375119 (validMask!0 mask!3053))))

(assert (=> start!53864 e!335641))

(assert (=> start!53864 true))

(declare-fun array_inv!13423 (array!36708) Bool)

(assert (=> start!53864 (array_inv!13423 a!2986)))

(declare-fun b!587490 () Bool)

(declare-fun res!375122 () Bool)

(assert (=> b!587490 (=> (not res!375122) (not e!335641))))

(assert (=> b!587490 (= res!375122 (validKeyInArray!0 k!1786))))

(declare-fun b!587491 () Bool)

(declare-fun res!375126 () Bool)

(assert (=> b!587491 (=> (not res!375126) (not e!335643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36708 (_ BitVec 32)) Bool)

(assert (=> b!587491 (= res!375126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587492 () Bool)

(declare-fun res!375121 () Bool)

(assert (=> b!587492 (=> (not res!375121) (not e!335643))))

(assert (=> b!587492 (= res!375121 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17627 a!2986) j!136) a!2986 mask!3053) (Found!6067 j!136)))))

(assert (= (and start!53864 res!375119) b!587486))

(assert (= (and b!587486 res!375120) b!587487))

(assert (= (and b!587487 res!375128) b!587490))

(assert (= (and b!587490 res!375122) b!587488))

(assert (= (and b!587488 res!375124) b!587482))

(assert (= (and b!587482 res!375118) b!587491))

(assert (= (and b!587491 res!375126) b!587485))

(assert (= (and b!587485 res!375123) b!587489))

(assert (= (and b!587489 res!375127) b!587492))

(assert (= (and b!587492 res!375121) b!587483))

(assert (= (and b!587483 res!375125) b!587484))

(declare-fun m!565889 () Bool)

(assert (=> b!587490 m!565889))

(declare-fun m!565891 () Bool)

(assert (=> b!587484 m!565891))

(declare-fun m!565893 () Bool)

(assert (=> b!587484 m!565893))

(declare-fun m!565895 () Bool)

(assert (=> b!587484 m!565895))

(declare-fun m!565897 () Bool)

(assert (=> b!587484 m!565897))

(declare-fun m!565899 () Bool)

(assert (=> b!587484 m!565899))

(assert (=> b!587484 m!565897))

(declare-fun m!565901 () Bool)

(assert (=> b!587484 m!565901))

(assert (=> b!587484 m!565893))

(declare-fun m!565903 () Bool)

(assert (=> b!587484 m!565903))

(declare-fun m!565905 () Bool)

(assert (=> b!587485 m!565905))

(declare-fun m!565907 () Bool)

(assert (=> b!587489 m!565907))

(assert (=> b!587489 m!565899))

(declare-fun m!565909 () Bool)

(assert (=> b!587489 m!565909))

(declare-fun m!565911 () Bool)

(assert (=> b!587482 m!565911))

(assert (=> b!587492 m!565897))

(assert (=> b!587492 m!565897))

(declare-fun m!565913 () Bool)

(assert (=> b!587492 m!565913))

(declare-fun m!565915 () Bool)

(assert (=> b!587488 m!565915))

(assert (=> b!587487 m!565897))

(assert (=> b!587487 m!565897))

(declare-fun m!565917 () Bool)

(assert (=> b!587487 m!565917))

(declare-fun m!565919 () Bool)

(assert (=> b!587483 m!565919))

(assert (=> b!587483 m!565897))

(declare-fun m!565921 () Bool)

(assert (=> start!53864 m!565921))

(declare-fun m!565923 () Bool)

(assert (=> start!53864 m!565923))

(declare-fun m!565925 () Bool)

(assert (=> b!587491 m!565925))

(push 1)

(assert (not b!587490))

(assert (not b!587482))

(assert (not b!587492))

(assert (not b!587485))

(assert (not b!587491))

(assert (not b!587488))

(assert (not b!587487))

(assert (not b!587484))

(assert (not start!53864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

