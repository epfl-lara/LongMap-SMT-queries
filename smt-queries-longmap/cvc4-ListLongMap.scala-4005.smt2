; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54506 () Bool)

(assert start!54506)

(declare-fun b!594826 () Bool)

(declare-fun res!380766 () Bool)

(declare-fun e!339860 () Bool)

(assert (=> b!594826 (=> (not res!380766) (not e!339860))))

(declare-datatypes ((array!36966 0))(
  ( (array!36967 (arr!17747 (Array (_ BitVec 32) (_ BitVec 64))) (size!18111 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36966)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36966 (_ BitVec 32)) Bool)

(assert (=> b!594826 (= res!380766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594827 () Bool)

(declare-fun res!380757 () Bool)

(declare-fun e!339866 () Bool)

(assert (=> b!594827 (=> res!380757 e!339866)))

(declare-datatypes ((List!11788 0))(
  ( (Nil!11785) (Cons!11784 (h!12829 (_ BitVec 64)) (t!18016 List!11788)) )
))
(declare-fun contains!2923 (List!11788 (_ BitVec 64)) Bool)

(assert (=> b!594827 (= res!380757 (contains!2923 Nil!11785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594828 () Bool)

(declare-fun res!380771 () Bool)

(assert (=> b!594828 (=> (not res!380771) (not e!339860))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594828 (= res!380771 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17747 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594829 () Bool)

(declare-fun e!339865 () Bool)

(declare-fun e!339863 () Bool)

(assert (=> b!594829 (= e!339865 e!339863)))

(declare-fun res!380773 () Bool)

(assert (=> b!594829 (=> res!380773 e!339863)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270056 () (_ BitVec 64))

(declare-fun lt!270052 () (_ BitVec 64))

(assert (=> b!594829 (= res!380773 (or (not (= (select (arr!17747 a!2986) j!136) lt!270056)) (not (= (select (arr!17747 a!2986) j!136) lt!270052)) (bvsge j!136 index!984)))))

(declare-fun b!594830 () Bool)

(declare-fun res!380761 () Bool)

(declare-fun e!339867 () Bool)

(assert (=> b!594830 (=> (not res!380761) (not e!339867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594830 (= res!380761 (validKeyInArray!0 (select (arr!17747 a!2986) j!136)))))

(declare-fun b!594831 () Bool)

(declare-fun e!339857 () Bool)

(declare-fun e!339858 () Bool)

(assert (=> b!594831 (= e!339857 e!339858)))

(declare-fun res!380768 () Bool)

(assert (=> b!594831 (=> res!380768 e!339858)))

(assert (=> b!594831 (= res!380768 (or (not (= (select (arr!17747 a!2986) j!136) lt!270056)) (not (= (select (arr!17747 a!2986) j!136) lt!270052)) (bvsge j!136 index!984)))))

(assert (=> b!594831 e!339865))

(declare-fun res!380760 () Bool)

(assert (=> b!594831 (=> (not res!380760) (not e!339865))))

(assert (=> b!594831 (= res!380760 (= lt!270052 (select (arr!17747 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!594831 (= lt!270052 (select (store (arr!17747 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594832 () Bool)

(declare-fun res!380772 () Bool)

(assert (=> b!594832 (=> (not res!380772) (not e!339867))))

(assert (=> b!594832 (= res!380772 (and (= (size!18111 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18111 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18111 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594833 () Bool)

(declare-datatypes ((Unit!18666 0))(
  ( (Unit!18667) )
))
(declare-fun e!339862 () Unit!18666)

(declare-fun Unit!18668 () Unit!18666)

(assert (=> b!594833 (= e!339862 Unit!18668)))

(declare-fun b!594834 () Bool)

(assert (=> b!594834 (= e!339866 true)))

(declare-fun lt!270051 () Bool)

(assert (=> b!594834 (= lt!270051 (contains!2923 Nil!11785 k!1786))))

(declare-fun b!594835 () Bool)

(declare-fun res!380756 () Bool)

(assert (=> b!594835 (=> res!380756 e!339866)))

(declare-fun noDuplicate!242 (List!11788) Bool)

(assert (=> b!594835 (= res!380756 (not (noDuplicate!242 Nil!11785)))))

(declare-fun b!594836 () Bool)

(declare-fun e!339864 () Bool)

(assert (=> b!594836 (= e!339860 e!339864)))

(declare-fun res!380764 () Bool)

(assert (=> b!594836 (=> (not res!380764) (not e!339864))))

(assert (=> b!594836 (= res!380764 (= (select (store (arr!17747 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270054 () array!36966)

(assert (=> b!594836 (= lt!270054 (array!36967 (store (arr!17747 a!2986) i!1108 k!1786) (size!18111 a!2986)))))

(declare-fun b!594838 () Bool)

(declare-fun res!380774 () Bool)

(assert (=> b!594838 (=> (not res!380774) (not e!339860))))

(declare-fun arrayNoDuplicates!0 (array!36966 (_ BitVec 32) List!11788) Bool)

(assert (=> b!594838 (= res!380774 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11785))))

(declare-fun b!594839 () Bool)

(declare-fun e!339855 () Bool)

(assert (=> b!594839 (= e!339855 (not e!339857))))

(declare-fun res!380755 () Bool)

(assert (=> b!594839 (=> res!380755 e!339857)))

(declare-datatypes ((SeekEntryResult!6187 0))(
  ( (MissingZero!6187 (index!26996 (_ BitVec 32))) (Found!6187 (index!26997 (_ BitVec 32))) (Intermediate!6187 (undefined!6999 Bool) (index!26998 (_ BitVec 32)) (x!55799 (_ BitVec 32))) (Undefined!6187) (MissingVacant!6187 (index!26999 (_ BitVec 32))) )
))
(declare-fun lt!270061 () SeekEntryResult!6187)

(assert (=> b!594839 (= res!380755 (not (= lt!270061 (Found!6187 index!984))))))

(declare-fun lt!270059 () Unit!18666)

(assert (=> b!594839 (= lt!270059 e!339862)))

(declare-fun c!67403 () Bool)

(assert (=> b!594839 (= c!67403 (= lt!270061 Undefined!6187))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36966 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!594839 (= lt!270061 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270056 lt!270054 mask!3053))))

(declare-fun e!339859 () Bool)

(assert (=> b!594839 e!339859))

(declare-fun res!380759 () Bool)

(assert (=> b!594839 (=> (not res!380759) (not e!339859))))

(declare-fun lt!270058 () (_ BitVec 32))

(declare-fun lt!270060 () SeekEntryResult!6187)

(assert (=> b!594839 (= res!380759 (= lt!270060 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270058 vacantSpotIndex!68 lt!270056 lt!270054 mask!3053)))))

(assert (=> b!594839 (= lt!270060 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270058 vacantSpotIndex!68 (select (arr!17747 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594839 (= lt!270056 (select (store (arr!17747 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270050 () Unit!18666)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36966 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18666)

(assert (=> b!594839 (= lt!270050 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270058 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594839 (= lt!270058 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594840 () Bool)

(assert (=> b!594840 (= e!339867 e!339860)))

(declare-fun res!380765 () Bool)

(assert (=> b!594840 (=> (not res!380765) (not e!339860))))

(declare-fun lt!270053 () SeekEntryResult!6187)

(assert (=> b!594840 (= res!380765 (or (= lt!270053 (MissingZero!6187 i!1108)) (= lt!270053 (MissingVacant!6187 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36966 (_ BitVec 32)) SeekEntryResult!6187)

(assert (=> b!594840 (= lt!270053 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594841 () Bool)

(declare-fun res!380762 () Bool)

(assert (=> b!594841 (=> res!380762 e!339866)))

(assert (=> b!594841 (= res!380762 (contains!2923 Nil!11785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594842 () Bool)

(assert (=> b!594842 (= e!339864 e!339855)))

(declare-fun res!380769 () Bool)

(assert (=> b!594842 (=> (not res!380769) (not e!339855))))

(declare-fun lt!270057 () SeekEntryResult!6187)

(assert (=> b!594842 (= res!380769 (and (= lt!270057 (Found!6187 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17747 a!2986) index!984) (select (arr!17747 a!2986) j!136))) (not (= (select (arr!17747 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594842 (= lt!270057 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17747 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594843 () Bool)

(declare-fun res!380767 () Bool)

(assert (=> b!594843 (=> (not res!380767) (not e!339867))))

(assert (=> b!594843 (= res!380767 (validKeyInArray!0 k!1786))))

(declare-fun b!594844 () Bool)

(assert (=> b!594844 (= e!339859 (= lt!270057 lt!270060))))

(declare-fun res!380754 () Bool)

(assert (=> start!54506 (=> (not res!380754) (not e!339867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54506 (= res!380754 (validMask!0 mask!3053))))

(assert (=> start!54506 e!339867))

(assert (=> start!54506 true))

(declare-fun array_inv!13543 (array!36966) Bool)

(assert (=> start!54506 (array_inv!13543 a!2986)))

(declare-fun b!594837 () Bool)

(declare-fun res!380763 () Bool)

(assert (=> b!594837 (=> (not res!380763) (not e!339867))))

(declare-fun arrayContainsKey!0 (array!36966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594837 (= res!380763 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594845 () Bool)

(declare-fun Unit!18669 () Unit!18666)

(assert (=> b!594845 (= e!339862 Unit!18669)))

(assert (=> b!594845 false))

(declare-fun b!594846 () Bool)

(declare-fun e!339856 () Bool)

(assert (=> b!594846 (= e!339863 e!339856)))

(declare-fun res!380770 () Bool)

(assert (=> b!594846 (=> (not res!380770) (not e!339856))))

(assert (=> b!594846 (= res!380770 (arrayContainsKey!0 lt!270054 (select (arr!17747 a!2986) j!136) j!136))))

(declare-fun b!594847 () Bool)

(assert (=> b!594847 (= e!339858 e!339866)))

(declare-fun res!380758 () Bool)

(assert (=> b!594847 (=> res!380758 e!339866)))

(assert (=> b!594847 (= res!380758 (or (bvsge (size!18111 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18111 a!2986))))))

(assert (=> b!594847 (arrayContainsKey!0 lt!270054 (select (arr!17747 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270055 () Unit!18666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36966 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18666)

(assert (=> b!594847 (= lt!270055 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270054 (select (arr!17747 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594848 () Bool)

(assert (=> b!594848 (= e!339856 (arrayContainsKey!0 lt!270054 (select (arr!17747 a!2986) j!136) index!984))))

(assert (= (and start!54506 res!380754) b!594832))

(assert (= (and b!594832 res!380772) b!594830))

(assert (= (and b!594830 res!380761) b!594843))

(assert (= (and b!594843 res!380767) b!594837))

(assert (= (and b!594837 res!380763) b!594840))

(assert (= (and b!594840 res!380765) b!594826))

(assert (= (and b!594826 res!380766) b!594838))

(assert (= (and b!594838 res!380774) b!594828))

(assert (= (and b!594828 res!380771) b!594836))

(assert (= (and b!594836 res!380764) b!594842))

(assert (= (and b!594842 res!380769) b!594839))

(assert (= (and b!594839 res!380759) b!594844))

(assert (= (and b!594839 c!67403) b!594845))

(assert (= (and b!594839 (not c!67403)) b!594833))

(assert (= (and b!594839 (not res!380755)) b!594831))

(assert (= (and b!594831 res!380760) b!594829))

(assert (= (and b!594829 (not res!380773)) b!594846))

(assert (= (and b!594846 res!380770) b!594848))

(assert (= (and b!594831 (not res!380768)) b!594847))

(assert (= (and b!594847 (not res!380758)) b!594835))

(assert (= (and b!594835 (not res!380756)) b!594827))

(assert (= (and b!594827 (not res!380757)) b!594841))

(assert (= (and b!594841 (not res!380762)) b!594834))

(declare-fun m!572575 () Bool)

(assert (=> start!54506 m!572575))

(declare-fun m!572577 () Bool)

(assert (=> start!54506 m!572577))

(declare-fun m!572579 () Bool)

(assert (=> b!594846 m!572579))

(assert (=> b!594846 m!572579))

(declare-fun m!572581 () Bool)

(assert (=> b!594846 m!572581))

(declare-fun m!572583 () Bool)

(assert (=> b!594841 m!572583))

(declare-fun m!572585 () Bool)

(assert (=> b!594836 m!572585))

(declare-fun m!572587 () Bool)

(assert (=> b!594836 m!572587))

(declare-fun m!572589 () Bool)

(assert (=> b!594837 m!572589))

(declare-fun m!572591 () Bool)

(assert (=> b!594835 m!572591))

(declare-fun m!572593 () Bool)

(assert (=> b!594838 m!572593))

(assert (=> b!594829 m!572579))

(declare-fun m!572595 () Bool)

(assert (=> b!594826 m!572595))

(assert (=> b!594847 m!572579))

(assert (=> b!594847 m!572579))

(declare-fun m!572597 () Bool)

(assert (=> b!594847 m!572597))

(assert (=> b!594847 m!572579))

(declare-fun m!572599 () Bool)

(assert (=> b!594847 m!572599))

(declare-fun m!572601 () Bool)

(assert (=> b!594839 m!572601))

(declare-fun m!572603 () Bool)

(assert (=> b!594839 m!572603))

(assert (=> b!594839 m!572579))

(assert (=> b!594839 m!572579))

(declare-fun m!572605 () Bool)

(assert (=> b!594839 m!572605))

(assert (=> b!594839 m!572585))

(declare-fun m!572607 () Bool)

(assert (=> b!594839 m!572607))

(declare-fun m!572609 () Bool)

(assert (=> b!594839 m!572609))

(declare-fun m!572611 () Bool)

(assert (=> b!594839 m!572611))

(assert (=> b!594848 m!572579))

(assert (=> b!594848 m!572579))

(declare-fun m!572613 () Bool)

(assert (=> b!594848 m!572613))

(declare-fun m!572615 () Bool)

(assert (=> b!594834 m!572615))

(declare-fun m!572617 () Bool)

(assert (=> b!594842 m!572617))

(assert (=> b!594842 m!572579))

(assert (=> b!594842 m!572579))

(declare-fun m!572619 () Bool)

(assert (=> b!594842 m!572619))

(declare-fun m!572621 () Bool)

(assert (=> b!594840 m!572621))

(declare-fun m!572623 () Bool)

(assert (=> b!594827 m!572623))

(declare-fun m!572625 () Bool)

(assert (=> b!594828 m!572625))

(assert (=> b!594830 m!572579))

(assert (=> b!594830 m!572579))

(declare-fun m!572627 () Bool)

(assert (=> b!594830 m!572627))

(assert (=> b!594831 m!572579))

(assert (=> b!594831 m!572585))

(declare-fun m!572629 () Bool)

(assert (=> b!594831 m!572629))

(declare-fun m!572631 () Bool)

(assert (=> b!594843 m!572631))

(push 1)

