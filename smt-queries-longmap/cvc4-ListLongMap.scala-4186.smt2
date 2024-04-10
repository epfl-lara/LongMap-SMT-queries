; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57096 () Bool)

(assert start!57096)

(declare-fun b!631992 () Bool)

(declare-datatypes ((Unit!21254 0))(
  ( (Unit!21255) )
))
(declare-fun e!361332 () Unit!21254)

(declare-fun Unit!21256 () Unit!21254)

(assert (=> b!631992 (= e!361332 Unit!21256)))

(assert (=> b!631992 false))

(declare-fun b!631993 () Bool)

(declare-fun res!408650 () Bool)

(declare-fun e!361337 () Bool)

(assert (=> b!631993 (=> (not res!408650) (not e!361337))))

(declare-datatypes ((array!38115 0))(
  ( (array!38116 (arr!18290 (Array (_ BitVec 32) (_ BitVec 64))) (size!18654 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38115)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631993 (= res!408650 (validKeyInArray!0 (select (arr!18290 a!2986) j!136)))))

(declare-fun b!631994 () Bool)

(declare-fun e!361336 () Bool)

(assert (=> b!631994 (= e!361336 true)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!631994 (= (select (store (arr!18290 a!2986) i!1108 k!1786) index!984) (select (arr!18290 a!2986) j!136))))

(declare-fun b!631995 () Bool)

(declare-fun e!361335 () Bool)

(declare-fun e!361334 () Bool)

(assert (=> b!631995 (= e!361335 e!361334)))

(declare-fun res!408653 () Bool)

(assert (=> b!631995 (=> (not res!408653) (not e!361334))))

(declare-datatypes ((SeekEntryResult!6730 0))(
  ( (MissingZero!6730 (index!29213 (_ BitVec 32))) (Found!6730 (index!29214 (_ BitVec 32))) (Intermediate!6730 (undefined!7542 Bool) (index!29215 (_ BitVec 32)) (x!57949 (_ BitVec 32))) (Undefined!6730) (MissingVacant!6730 (index!29216 (_ BitVec 32))) )
))
(declare-fun lt!292029 () SeekEntryResult!6730)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!631995 (= res!408653 (and (= lt!292029 (Found!6730 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18290 a!2986) index!984) (select (arr!18290 a!2986) j!136))) (not (= (select (arr!18290 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38115 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!631995 (= lt!292029 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18290 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631996 () Bool)

(declare-fun e!361338 () Bool)

(assert (=> b!631996 (= e!361337 e!361338)))

(declare-fun res!408661 () Bool)

(assert (=> b!631996 (=> (not res!408661) (not e!361338))))

(declare-fun lt!292025 () SeekEntryResult!6730)

(assert (=> b!631996 (= res!408661 (or (= lt!292025 (MissingZero!6730 i!1108)) (= lt!292025 (MissingVacant!6730 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38115 (_ BitVec 32)) SeekEntryResult!6730)

(assert (=> b!631996 (= lt!292025 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!631997 () Bool)

(declare-fun res!408662 () Bool)

(assert (=> b!631997 (=> (not res!408662) (not e!361337))))

(assert (=> b!631997 (= res!408662 (and (= (size!18654 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18654 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18654 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631998 () Bool)

(declare-fun res!408659 () Bool)

(assert (=> b!631998 (=> (not res!408659) (not e!361338))))

(declare-datatypes ((List!12331 0))(
  ( (Nil!12328) (Cons!12327 (h!13372 (_ BitVec 64)) (t!18559 List!12331)) )
))
(declare-fun arrayNoDuplicates!0 (array!38115 (_ BitVec 32) List!12331) Bool)

(assert (=> b!631998 (= res!408659 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12328))))

(declare-fun b!631999 () Bool)

(declare-fun res!408657 () Bool)

(assert (=> b!631999 (=> (not res!408657) (not e!361337))))

(assert (=> b!631999 (= res!408657 (validKeyInArray!0 k!1786))))

(declare-fun b!632000 () Bool)

(assert (=> b!632000 (= e!361334 (not e!361336))))

(declare-fun res!408655 () Bool)

(assert (=> b!632000 (=> res!408655 e!361336)))

(declare-fun lt!292028 () SeekEntryResult!6730)

(assert (=> b!632000 (= res!408655 (not (= lt!292028 (Found!6730 index!984))))))

(declare-fun lt!292022 () Unit!21254)

(assert (=> b!632000 (= lt!292022 e!361332)))

(declare-fun c!72038 () Bool)

(assert (=> b!632000 (= c!72038 (= lt!292028 Undefined!6730))))

(declare-fun lt!292026 () (_ BitVec 64))

(declare-fun lt!292024 () array!38115)

(assert (=> b!632000 (= lt!292028 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292026 lt!292024 mask!3053))))

(declare-fun e!361331 () Bool)

(assert (=> b!632000 e!361331))

(declare-fun res!408652 () Bool)

(assert (=> b!632000 (=> (not res!408652) (not e!361331))))

(declare-fun lt!292030 () (_ BitVec 32))

(declare-fun lt!292027 () SeekEntryResult!6730)

(assert (=> b!632000 (= res!408652 (= lt!292027 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292030 vacantSpotIndex!68 lt!292026 lt!292024 mask!3053)))))

(assert (=> b!632000 (= lt!292027 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292030 vacantSpotIndex!68 (select (arr!18290 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632000 (= lt!292026 (select (store (arr!18290 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!292023 () Unit!21254)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38115 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21254)

(assert (=> b!632000 (= lt!292023 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292030 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632000 (= lt!292030 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!632001 () Bool)

(declare-fun res!408658 () Bool)

(assert (=> b!632001 (=> (not res!408658) (not e!361338))))

(assert (=> b!632001 (= res!408658 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18290 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632002 () Bool)

(assert (=> b!632002 (= e!361338 e!361335)))

(declare-fun res!408651 () Bool)

(assert (=> b!632002 (=> (not res!408651) (not e!361335))))

(assert (=> b!632002 (= res!408651 (= (select (store (arr!18290 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632002 (= lt!292024 (array!38116 (store (arr!18290 a!2986) i!1108 k!1786) (size!18654 a!2986)))))

(declare-fun res!408660 () Bool)

(assert (=> start!57096 (=> (not res!408660) (not e!361337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57096 (= res!408660 (validMask!0 mask!3053))))

(assert (=> start!57096 e!361337))

(assert (=> start!57096 true))

(declare-fun array_inv!14086 (array!38115) Bool)

(assert (=> start!57096 (array_inv!14086 a!2986)))

(declare-fun b!632003 () Bool)

(assert (=> b!632003 (= e!361331 (= lt!292029 lt!292027))))

(declare-fun b!632004 () Bool)

(declare-fun res!408654 () Bool)

(assert (=> b!632004 (=> (not res!408654) (not e!361338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38115 (_ BitVec 32)) Bool)

(assert (=> b!632004 (= res!408654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632005 () Bool)

(declare-fun res!408656 () Bool)

(assert (=> b!632005 (=> (not res!408656) (not e!361337))))

(declare-fun arrayContainsKey!0 (array!38115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632005 (= res!408656 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!632006 () Bool)

(declare-fun Unit!21257 () Unit!21254)

(assert (=> b!632006 (= e!361332 Unit!21257)))

(assert (= (and start!57096 res!408660) b!631997))

(assert (= (and b!631997 res!408662) b!631993))

(assert (= (and b!631993 res!408650) b!631999))

(assert (= (and b!631999 res!408657) b!632005))

(assert (= (and b!632005 res!408656) b!631996))

(assert (= (and b!631996 res!408661) b!632004))

(assert (= (and b!632004 res!408654) b!631998))

(assert (= (and b!631998 res!408659) b!632001))

(assert (= (and b!632001 res!408658) b!632002))

(assert (= (and b!632002 res!408651) b!631995))

(assert (= (and b!631995 res!408653) b!632000))

(assert (= (and b!632000 res!408652) b!632003))

(assert (= (and b!632000 c!72038) b!631992))

(assert (= (and b!632000 (not c!72038)) b!632006))

(assert (= (and b!632000 (not res!408655)) b!631994))

(declare-fun m!606849 () Bool)

(assert (=> b!631999 m!606849))

(declare-fun m!606851 () Bool)

(assert (=> b!631995 m!606851))

(declare-fun m!606853 () Bool)

(assert (=> b!631995 m!606853))

(assert (=> b!631995 m!606853))

(declare-fun m!606855 () Bool)

(assert (=> b!631995 m!606855))

(declare-fun m!606857 () Bool)

(assert (=> b!632004 m!606857))

(declare-fun m!606859 () Bool)

(assert (=> b!631996 m!606859))

(declare-fun m!606861 () Bool)

(assert (=> b!631994 m!606861))

(declare-fun m!606863 () Bool)

(assert (=> b!631994 m!606863))

(assert (=> b!631994 m!606853))

(declare-fun m!606865 () Bool)

(assert (=> b!632000 m!606865))

(declare-fun m!606867 () Bool)

(assert (=> b!632000 m!606867))

(assert (=> b!632000 m!606853))

(declare-fun m!606869 () Bool)

(assert (=> b!632000 m!606869))

(declare-fun m!606871 () Bool)

(assert (=> b!632000 m!606871))

(declare-fun m!606873 () Bool)

(assert (=> b!632000 m!606873))

(assert (=> b!632000 m!606853))

(declare-fun m!606875 () Bool)

(assert (=> b!632000 m!606875))

(assert (=> b!632000 m!606861))

(declare-fun m!606877 () Bool)

(assert (=> b!631998 m!606877))

(assert (=> b!631993 m!606853))

(assert (=> b!631993 m!606853))

(declare-fun m!606879 () Bool)

(assert (=> b!631993 m!606879))

(declare-fun m!606881 () Bool)

(assert (=> b!632005 m!606881))

(declare-fun m!606883 () Bool)

(assert (=> b!632001 m!606883))

(assert (=> b!632002 m!606861))

(declare-fun m!606885 () Bool)

(assert (=> b!632002 m!606885))

(declare-fun m!606887 () Bool)

(assert (=> start!57096 m!606887))

(declare-fun m!606889 () Bool)

(assert (=> start!57096 m!606889))

(push 1)

