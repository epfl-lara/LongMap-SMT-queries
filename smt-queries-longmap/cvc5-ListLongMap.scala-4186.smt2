; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57092 () Bool)

(assert start!57092)

(declare-fun b!631902 () Bool)

(declare-fun e!361287 () Bool)

(declare-fun e!361285 () Bool)

(assert (=> b!631902 (= e!361287 e!361285)))

(declare-fun res!408581 () Bool)

(assert (=> b!631902 (=> (not res!408581) (not e!361285))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38111 0))(
  ( (array!38112 (arr!18288 (Array (_ BitVec 32) (_ BitVec 64))) (size!18652 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38111)

(assert (=> b!631902 (= res!408581 (= (select (store (arr!18288 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291972 () array!38111)

(assert (=> b!631902 (= lt!291972 (array!38112 (store (arr!18288 a!2986) i!1108 k!1786) (size!18652 a!2986)))))

(declare-fun b!631903 () Bool)

(declare-fun e!361289 () Bool)

(assert (=> b!631903 (= e!361289 e!361287)))

(declare-fun res!408576 () Bool)

(assert (=> b!631903 (=> (not res!408576) (not e!361287))))

(declare-datatypes ((SeekEntryResult!6728 0))(
  ( (MissingZero!6728 (index!29205 (_ BitVec 32))) (Found!6728 (index!29206 (_ BitVec 32))) (Intermediate!6728 (undefined!7540 Bool) (index!29207 (_ BitVec 32)) (x!57947 (_ BitVec 32))) (Undefined!6728) (MissingVacant!6728 (index!29208 (_ BitVec 32))) )
))
(declare-fun lt!291971 () SeekEntryResult!6728)

(assert (=> b!631903 (= res!408576 (or (= lt!291971 (MissingZero!6728 i!1108)) (= lt!291971 (MissingVacant!6728 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38111 (_ BitVec 32)) SeekEntryResult!6728)

(assert (=> b!631903 (= lt!291971 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631904 () Bool)

(declare-fun e!361284 () Bool)

(declare-fun e!361286 () Bool)

(assert (=> b!631904 (= e!361284 (not e!361286))))

(declare-fun res!408572 () Bool)

(assert (=> b!631904 (=> res!408572 e!361286)))

(declare-fun lt!291970 () SeekEntryResult!6728)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631904 (= res!408572 (not (= lt!291970 (Found!6728 index!984))))))

(declare-datatypes ((Unit!21246 0))(
  ( (Unit!21247) )
))
(declare-fun lt!291975 () Unit!21246)

(declare-fun e!361283 () Unit!21246)

(assert (=> b!631904 (= lt!291975 e!361283)))

(declare-fun c!72032 () Bool)

(assert (=> b!631904 (= c!72032 (= lt!291970 Undefined!6728))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!291968 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38111 (_ BitVec 32)) SeekEntryResult!6728)

(assert (=> b!631904 (= lt!291970 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291968 lt!291972 mask!3053))))

(declare-fun e!361290 () Bool)

(assert (=> b!631904 e!361290))

(declare-fun res!408583 () Bool)

(assert (=> b!631904 (=> (not res!408583) (not e!361290))))

(declare-fun lt!291974 () (_ BitVec 32))

(declare-fun lt!291969 () SeekEntryResult!6728)

(assert (=> b!631904 (= res!408583 (= lt!291969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291974 vacantSpotIndex!68 lt!291968 lt!291972 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!631904 (= lt!291969 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291974 vacantSpotIndex!68 (select (arr!18288 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631904 (= lt!291968 (select (store (arr!18288 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!291976 () Unit!21246)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38111 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21246)

(assert (=> b!631904 (= lt!291976 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291974 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631904 (= lt!291974 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!631905 () Bool)

(declare-fun res!408577 () Bool)

(assert (=> b!631905 (=> (not res!408577) (not e!361287))))

(assert (=> b!631905 (= res!408577 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18288 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631907 () Bool)

(declare-fun res!408573 () Bool)

(assert (=> b!631907 (=> (not res!408573) (not e!361289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631907 (= res!408573 (validKeyInArray!0 (select (arr!18288 a!2986) j!136)))))

(declare-fun b!631908 () Bool)

(declare-fun res!408584 () Bool)

(assert (=> b!631908 (=> (not res!408584) (not e!361289))))

(declare-fun arrayContainsKey!0 (array!38111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631908 (= res!408584 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631909 () Bool)

(assert (=> b!631909 (= e!361286 true)))

(assert (=> b!631909 (= (select (store (arr!18288 a!2986) i!1108 k!1786) index!984) (select (arr!18288 a!2986) j!136))))

(declare-fun b!631910 () Bool)

(declare-fun res!408580 () Bool)

(assert (=> b!631910 (=> (not res!408580) (not e!361287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38111 (_ BitVec 32)) Bool)

(assert (=> b!631910 (= res!408580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631911 () Bool)

(declare-fun res!408574 () Bool)

(assert (=> b!631911 (=> (not res!408574) (not e!361289))))

(assert (=> b!631911 (= res!408574 (validKeyInArray!0 k!1786))))

(declare-fun b!631912 () Bool)

(declare-fun res!408582 () Bool)

(assert (=> b!631912 (=> (not res!408582) (not e!361287))))

(declare-datatypes ((List!12329 0))(
  ( (Nil!12326) (Cons!12325 (h!13370 (_ BitVec 64)) (t!18557 List!12329)) )
))
(declare-fun arrayNoDuplicates!0 (array!38111 (_ BitVec 32) List!12329) Bool)

(assert (=> b!631912 (= res!408582 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12326))))

(declare-fun b!631913 () Bool)

(declare-fun res!408578 () Bool)

(assert (=> b!631913 (=> (not res!408578) (not e!361289))))

(assert (=> b!631913 (= res!408578 (and (= (size!18652 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18652 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18652 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!408575 () Bool)

(assert (=> start!57092 (=> (not res!408575) (not e!361289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57092 (= res!408575 (validMask!0 mask!3053))))

(assert (=> start!57092 e!361289))

(assert (=> start!57092 true))

(declare-fun array_inv!14084 (array!38111) Bool)

(assert (=> start!57092 (array_inv!14084 a!2986)))

(declare-fun b!631906 () Bool)

(declare-fun lt!291973 () SeekEntryResult!6728)

(assert (=> b!631906 (= e!361290 (= lt!291973 lt!291969))))

(declare-fun b!631914 () Bool)

(declare-fun Unit!21248 () Unit!21246)

(assert (=> b!631914 (= e!361283 Unit!21248)))

(declare-fun b!631915 () Bool)

(declare-fun Unit!21249 () Unit!21246)

(assert (=> b!631915 (= e!361283 Unit!21249)))

(assert (=> b!631915 false))

(declare-fun b!631916 () Bool)

(assert (=> b!631916 (= e!361285 e!361284)))

(declare-fun res!408579 () Bool)

(assert (=> b!631916 (=> (not res!408579) (not e!361284))))

(assert (=> b!631916 (= res!408579 (and (= lt!291973 (Found!6728 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18288 a!2986) index!984) (select (arr!18288 a!2986) j!136))) (not (= (select (arr!18288 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!631916 (= lt!291973 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18288 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!57092 res!408575) b!631913))

(assert (= (and b!631913 res!408578) b!631907))

(assert (= (and b!631907 res!408573) b!631911))

(assert (= (and b!631911 res!408574) b!631908))

(assert (= (and b!631908 res!408584) b!631903))

(assert (= (and b!631903 res!408576) b!631910))

(assert (= (and b!631910 res!408580) b!631912))

(assert (= (and b!631912 res!408582) b!631905))

(assert (= (and b!631905 res!408577) b!631902))

(assert (= (and b!631902 res!408581) b!631916))

(assert (= (and b!631916 res!408579) b!631904))

(assert (= (and b!631904 res!408583) b!631906))

(assert (= (and b!631904 c!72032) b!631915))

(assert (= (and b!631904 (not c!72032)) b!631914))

(assert (= (and b!631904 (not res!408572)) b!631909))

(declare-fun m!606765 () Bool)

(assert (=> b!631908 m!606765))

(declare-fun m!606767 () Bool)

(assert (=> b!631916 m!606767))

(declare-fun m!606769 () Bool)

(assert (=> b!631916 m!606769))

(assert (=> b!631916 m!606769))

(declare-fun m!606771 () Bool)

(assert (=> b!631916 m!606771))

(declare-fun m!606773 () Bool)

(assert (=> b!631905 m!606773))

(declare-fun m!606775 () Bool)

(assert (=> b!631910 m!606775))

(declare-fun m!606777 () Bool)

(assert (=> b!631902 m!606777))

(declare-fun m!606779 () Bool)

(assert (=> b!631902 m!606779))

(declare-fun m!606781 () Bool)

(assert (=> b!631911 m!606781))

(declare-fun m!606783 () Bool)

(assert (=> b!631912 m!606783))

(declare-fun m!606785 () Bool)

(assert (=> b!631904 m!606785))

(declare-fun m!606787 () Bool)

(assert (=> b!631904 m!606787))

(assert (=> b!631904 m!606769))

(declare-fun m!606789 () Bool)

(assert (=> b!631904 m!606789))

(declare-fun m!606791 () Bool)

(assert (=> b!631904 m!606791))

(declare-fun m!606793 () Bool)

(assert (=> b!631904 m!606793))

(assert (=> b!631904 m!606769))

(declare-fun m!606795 () Bool)

(assert (=> b!631904 m!606795))

(assert (=> b!631904 m!606777))

(declare-fun m!606797 () Bool)

(assert (=> b!631903 m!606797))

(declare-fun m!606799 () Bool)

(assert (=> start!57092 m!606799))

(declare-fun m!606801 () Bool)

(assert (=> start!57092 m!606801))

(assert (=> b!631907 m!606769))

(assert (=> b!631907 m!606769))

(declare-fun m!606803 () Bool)

(assert (=> b!631907 m!606803))

(assert (=> b!631909 m!606777))

(declare-fun m!606805 () Bool)

(assert (=> b!631909 m!606805))

(assert (=> b!631909 m!606769))

(push 1)

