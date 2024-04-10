; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54508 () Bool)

(assert start!54508)

(declare-fun b!594895 () Bool)

(declare-datatypes ((Unit!18670 0))(
  ( (Unit!18671) )
))
(declare-fun e!339895 () Unit!18670)

(declare-fun Unit!18672 () Unit!18670)

(assert (=> b!594895 (= e!339895 Unit!18672)))

(assert (=> b!594895 false))

(declare-fun b!594896 () Bool)

(declare-fun Unit!18673 () Unit!18670)

(assert (=> b!594896 (= e!339895 Unit!18673)))

(declare-fun b!594897 () Bool)

(declare-fun e!339903 () Bool)

(declare-fun e!339899 () Bool)

(assert (=> b!594897 (= e!339903 e!339899)))

(declare-fun res!380835 () Bool)

(assert (=> b!594897 (=> (not res!380835) (not e!339899))))

(declare-datatypes ((SeekEntryResult!6188 0))(
  ( (MissingZero!6188 (index!27000 (_ BitVec 32))) (Found!6188 (index!27001 (_ BitVec 32))) (Intermediate!6188 (undefined!7000 Bool) (index!27002 (_ BitVec 32)) (x!55808 (_ BitVec 32))) (Undefined!6188) (MissingVacant!6188 (index!27003 (_ BitVec 32))) )
))
(declare-fun lt!270087 () SeekEntryResult!6188)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594897 (= res!380835 (or (= lt!270087 (MissingZero!6188 i!1108)) (= lt!270087 (MissingVacant!6188 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!36968 0))(
  ( (array!36969 (arr!17748 (Array (_ BitVec 32) (_ BitVec 64))) (size!18112 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36968)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36968 (_ BitVec 32)) SeekEntryResult!6188)

(assert (=> b!594897 (= lt!270087 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!594898 () Bool)

(declare-fun res!380827 () Bool)

(assert (=> b!594898 (=> (not res!380827) (not e!339903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594898 (= res!380827 (validKeyInArray!0 k!1786))))

(declare-fun b!594899 () Bool)

(declare-fun res!380821 () Bool)

(declare-fun e!339894 () Bool)

(assert (=> b!594899 (=> res!380821 e!339894)))

(declare-datatypes ((List!11789 0))(
  ( (Nil!11786) (Cons!11785 (h!12830 (_ BitVec 64)) (t!18017 List!11789)) )
))
(declare-fun contains!2924 (List!11789 (_ BitVec 64)) Bool)

(assert (=> b!594899 (= res!380821 (contains!2924 Nil!11786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594900 () Bool)

(declare-fun res!380836 () Bool)

(assert (=> b!594900 (=> (not res!380836) (not e!339903))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!594900 (= res!380836 (and (= (size!18112 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18112 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18112 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594901 () Bool)

(declare-fun e!339906 () Bool)

(assert (=> b!594901 (= e!339906 e!339894)))

(declare-fun res!380820 () Bool)

(assert (=> b!594901 (=> res!380820 e!339894)))

(assert (=> b!594901 (= res!380820 (or (bvsge (size!18112 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18112 a!2986))))))

(declare-fun lt!270094 () array!36968)

(declare-fun arrayContainsKey!0 (array!36968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594901 (arrayContainsKey!0 lt!270094 (select (arr!17748 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270091 () Unit!18670)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36968 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18670)

(assert (=> b!594901 (= lt!270091 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270094 (select (arr!17748 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594902 () Bool)

(declare-fun res!380832 () Bool)

(assert (=> b!594902 (=> (not res!380832) (not e!339899))))

(declare-fun arrayNoDuplicates!0 (array!36968 (_ BitVec 32) List!11789) Bool)

(assert (=> b!594902 (= res!380832 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11786))))

(declare-fun b!594903 () Bool)

(declare-fun e!339905 () Bool)

(declare-fun lt!270096 () SeekEntryResult!6188)

(declare-fun lt!270089 () SeekEntryResult!6188)

(assert (=> b!594903 (= e!339905 (= lt!270096 lt!270089))))

(declare-fun b!594904 () Bool)

(assert (=> b!594904 (= e!339894 true)))

(declare-fun lt!270095 () Bool)

(assert (=> b!594904 (= lt!270095 (contains!2924 Nil!11786 k!1786))))

(declare-fun b!594905 () Bool)

(declare-fun e!339900 () Bool)

(assert (=> b!594905 (= e!339900 e!339906)))

(declare-fun res!380826 () Bool)

(assert (=> b!594905 (=> res!380826 e!339906)))

(declare-fun lt!270088 () (_ BitVec 64))

(declare-fun lt!270090 () (_ BitVec 64))

(assert (=> b!594905 (= res!380826 (or (not (= (select (arr!17748 a!2986) j!136) lt!270090)) (not (= (select (arr!17748 a!2986) j!136) lt!270088)) (bvsge j!136 index!984)))))

(declare-fun e!339904 () Bool)

(assert (=> b!594905 e!339904))

(declare-fun res!380829 () Bool)

(assert (=> b!594905 (=> (not res!380829) (not e!339904))))

(assert (=> b!594905 (= res!380829 (= lt!270088 (select (arr!17748 a!2986) j!136)))))

(assert (=> b!594905 (= lt!270088 (select (store (arr!17748 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!594906 () Bool)

(declare-fun e!339902 () Bool)

(assert (=> b!594906 (= e!339902 (arrayContainsKey!0 lt!270094 (select (arr!17748 a!2986) j!136) index!984))))

(declare-fun b!594907 () Bool)

(declare-fun e!339897 () Bool)

(assert (=> b!594907 (= e!339904 e!339897)))

(declare-fun res!380824 () Bool)

(assert (=> b!594907 (=> res!380824 e!339897)))

(assert (=> b!594907 (= res!380824 (or (not (= (select (arr!17748 a!2986) j!136) lt!270090)) (not (= (select (arr!17748 a!2986) j!136) lt!270088)) (bvsge j!136 index!984)))))

(declare-fun res!380831 () Bool)

(assert (=> start!54508 (=> (not res!380831) (not e!339903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54508 (= res!380831 (validMask!0 mask!3053))))

(assert (=> start!54508 e!339903))

(assert (=> start!54508 true))

(declare-fun array_inv!13544 (array!36968) Bool)

(assert (=> start!54508 (array_inv!13544 a!2986)))

(declare-fun b!594908 () Bool)

(declare-fun res!380823 () Bool)

(assert (=> b!594908 (=> (not res!380823) (not e!339903))))

(assert (=> b!594908 (= res!380823 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594909 () Bool)

(declare-fun res!380833 () Bool)

(assert (=> b!594909 (=> res!380833 e!339894)))

(declare-fun noDuplicate!243 (List!11789) Bool)

(assert (=> b!594909 (= res!380833 (not (noDuplicate!243 Nil!11786)))))

(declare-fun b!594910 () Bool)

(declare-fun res!380834 () Bool)

(assert (=> b!594910 (=> (not res!380834) (not e!339903))))

(assert (=> b!594910 (= res!380834 (validKeyInArray!0 (select (arr!17748 a!2986) j!136)))))

(declare-fun b!594911 () Bool)

(declare-fun e!339898 () Bool)

(assert (=> b!594911 (= e!339898 (not e!339900))))

(declare-fun res!380822 () Bool)

(assert (=> b!594911 (=> res!380822 e!339900)))

(declare-fun lt!270097 () SeekEntryResult!6188)

(assert (=> b!594911 (= res!380822 (not (= lt!270097 (Found!6188 index!984))))))

(declare-fun lt!270092 () Unit!18670)

(assert (=> b!594911 (= lt!270092 e!339895)))

(declare-fun c!67406 () Bool)

(assert (=> b!594911 (= c!67406 (= lt!270097 Undefined!6188))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36968 (_ BitVec 32)) SeekEntryResult!6188)

(assert (=> b!594911 (= lt!270097 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270090 lt!270094 mask!3053))))

(assert (=> b!594911 e!339905))

(declare-fun res!380819 () Bool)

(assert (=> b!594911 (=> (not res!380819) (not e!339905))))

(declare-fun lt!270093 () (_ BitVec 32))

(assert (=> b!594911 (= res!380819 (= lt!270089 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270093 vacantSpotIndex!68 lt!270090 lt!270094 mask!3053)))))

(assert (=> b!594911 (= lt!270089 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270093 vacantSpotIndex!68 (select (arr!17748 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594911 (= lt!270090 (select (store (arr!17748 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270086 () Unit!18670)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36968 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18670)

(assert (=> b!594911 (= lt!270086 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270093 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594911 (= lt!270093 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!594912 () Bool)

(declare-fun res!380828 () Bool)

(assert (=> b!594912 (=> (not res!380828) (not e!339899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36968 (_ BitVec 32)) Bool)

(assert (=> b!594912 (= res!380828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594913 () Bool)

(declare-fun e!339901 () Bool)

(assert (=> b!594913 (= e!339901 e!339898)))

(declare-fun res!380817 () Bool)

(assert (=> b!594913 (=> (not res!380817) (not e!339898))))

(assert (=> b!594913 (= res!380817 (and (= lt!270096 (Found!6188 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17748 a!2986) index!984) (select (arr!17748 a!2986) j!136))) (not (= (select (arr!17748 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!594913 (= lt!270096 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17748 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594914 () Bool)

(assert (=> b!594914 (= e!339897 e!339902)))

(declare-fun res!380818 () Bool)

(assert (=> b!594914 (=> (not res!380818) (not e!339902))))

(assert (=> b!594914 (= res!380818 (arrayContainsKey!0 lt!270094 (select (arr!17748 a!2986) j!136) j!136))))

(declare-fun b!594915 () Bool)

(declare-fun res!380825 () Bool)

(assert (=> b!594915 (=> (not res!380825) (not e!339899))))

(assert (=> b!594915 (= res!380825 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17748 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594916 () Bool)

(declare-fun res!380837 () Bool)

(assert (=> b!594916 (=> res!380837 e!339894)))

(assert (=> b!594916 (= res!380837 (contains!2924 Nil!11786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594917 () Bool)

(assert (=> b!594917 (= e!339899 e!339901)))

(declare-fun res!380830 () Bool)

(assert (=> b!594917 (=> (not res!380830) (not e!339901))))

(assert (=> b!594917 (= res!380830 (= (select (store (arr!17748 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594917 (= lt!270094 (array!36969 (store (arr!17748 a!2986) i!1108 k!1786) (size!18112 a!2986)))))

(assert (= (and start!54508 res!380831) b!594900))

(assert (= (and b!594900 res!380836) b!594910))

(assert (= (and b!594910 res!380834) b!594898))

(assert (= (and b!594898 res!380827) b!594908))

(assert (= (and b!594908 res!380823) b!594897))

(assert (= (and b!594897 res!380835) b!594912))

(assert (= (and b!594912 res!380828) b!594902))

(assert (= (and b!594902 res!380832) b!594915))

(assert (= (and b!594915 res!380825) b!594917))

(assert (= (and b!594917 res!380830) b!594913))

(assert (= (and b!594913 res!380817) b!594911))

(assert (= (and b!594911 res!380819) b!594903))

(assert (= (and b!594911 c!67406) b!594895))

(assert (= (and b!594911 (not c!67406)) b!594896))

(assert (= (and b!594911 (not res!380822)) b!594905))

(assert (= (and b!594905 res!380829) b!594907))

(assert (= (and b!594907 (not res!380824)) b!594914))

(assert (= (and b!594914 res!380818) b!594906))

(assert (= (and b!594905 (not res!380826)) b!594901))

(assert (= (and b!594901 (not res!380820)) b!594909))

(assert (= (and b!594909 (not res!380833)) b!594916))

(assert (= (and b!594916 (not res!380837)) b!594899))

(assert (= (and b!594899 (not res!380821)) b!594904))

(declare-fun m!572633 () Bool)

(assert (=> b!594907 m!572633))

(assert (=> b!594906 m!572633))

(assert (=> b!594906 m!572633))

(declare-fun m!572635 () Bool)

(assert (=> b!594906 m!572635))

(declare-fun m!572637 () Bool)

(assert (=> b!594915 m!572637))

(declare-fun m!572639 () Bool)

(assert (=> b!594897 m!572639))

(assert (=> b!594911 m!572633))

(declare-fun m!572641 () Bool)

(assert (=> b!594911 m!572641))

(declare-fun m!572643 () Bool)

(assert (=> b!594911 m!572643))

(declare-fun m!572645 () Bool)

(assert (=> b!594911 m!572645))

(assert (=> b!594911 m!572633))

(declare-fun m!572647 () Bool)

(assert (=> b!594911 m!572647))

(declare-fun m!572649 () Bool)

(assert (=> b!594911 m!572649))

(declare-fun m!572651 () Bool)

(assert (=> b!594911 m!572651))

(declare-fun m!572653 () Bool)

(assert (=> b!594911 m!572653))

(declare-fun m!572655 () Bool)

(assert (=> b!594916 m!572655))

(assert (=> b!594917 m!572647))

(declare-fun m!572657 () Bool)

(assert (=> b!594917 m!572657))

(declare-fun m!572659 () Bool)

(assert (=> start!54508 m!572659))

(declare-fun m!572661 () Bool)

(assert (=> start!54508 m!572661))

(declare-fun m!572663 () Bool)

(assert (=> b!594913 m!572663))

(assert (=> b!594913 m!572633))

(assert (=> b!594913 m!572633))

(declare-fun m!572665 () Bool)

(assert (=> b!594913 m!572665))

(assert (=> b!594901 m!572633))

(assert (=> b!594901 m!572633))

(declare-fun m!572667 () Bool)

(assert (=> b!594901 m!572667))

(assert (=> b!594901 m!572633))

(declare-fun m!572669 () Bool)

(assert (=> b!594901 m!572669))

(declare-fun m!572671 () Bool)

(assert (=> b!594904 m!572671))

(declare-fun m!572673 () Bool)

(assert (=> b!594912 m!572673))

(declare-fun m!572675 () Bool)

(assert (=> b!594902 m!572675))

(declare-fun m!572677 () Bool)

(assert (=> b!594898 m!572677))

(assert (=> b!594914 m!572633))

(assert (=> b!594914 m!572633))

(declare-fun m!572679 () Bool)

(assert (=> b!594914 m!572679))

(declare-fun m!572681 () Bool)

(assert (=> b!594909 m!572681))

(assert (=> b!594905 m!572633))

(assert (=> b!594905 m!572647))

(declare-fun m!572683 () Bool)

(assert (=> b!594905 m!572683))

(declare-fun m!572685 () Bool)

(assert (=> b!594908 m!572685))

(declare-fun m!572687 () Bool)

(assert (=> b!594899 m!572687))

(assert (=> b!594910 m!572633))

(assert (=> b!594910 m!572633))

(declare-fun m!572689 () Bool)

(assert (=> b!594910 m!572689))

(push 1)

