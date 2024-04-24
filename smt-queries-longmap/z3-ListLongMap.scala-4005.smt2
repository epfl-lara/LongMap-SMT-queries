; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54552 () Bool)

(assert start!54552)

(declare-fun res!380738 () Bool)

(declare-fun e!339917 () Bool)

(assert (=> start!54552 (=> (not res!380738) (not e!339917))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54552 (= res!380738 (validMask!0 mask!3053))))

(assert (=> start!54552 e!339917))

(assert (=> start!54552 true))

(declare-datatypes ((array!36957 0))(
  ( (array!36958 (arr!17740 (Array (_ BitVec 32) (_ BitVec 64))) (size!18104 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36957)

(declare-fun array_inv!13599 (array!36957) Bool)

(assert (=> start!54552 (array_inv!13599 a!2986)))

(declare-fun b!594897 () Bool)

(declare-fun res!380735 () Bool)

(declare-fun e!339916 () Bool)

(assert (=> b!594897 (=> res!380735 e!339916)))

(declare-datatypes ((List!11688 0))(
  ( (Nil!11685) (Cons!11684 (h!12732 (_ BitVec 64)) (t!17908 List!11688)) )
))
(declare-fun contains!2897 (List!11688 (_ BitVec 64)) Bool)

(assert (=> b!594897 (= res!380735 (contains!2897 Nil!11685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594898 () Bool)

(declare-fun e!339910 () Bool)

(declare-fun e!339918 () Bool)

(assert (=> b!594898 (= e!339910 e!339918)))

(declare-fun res!380748 () Bool)

(assert (=> b!594898 (=> res!380748 e!339918)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!270085 () (_ BitVec 64))

(declare-fun lt!270081 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!594898 (= res!380748 (or (not (= (select (arr!17740 a!2986) j!136) lt!270085)) (not (= (select (arr!17740 a!2986) j!136) lt!270081)) (bvsge j!136 index!984)))))

(declare-fun b!594899 () Bool)

(declare-fun res!380749 () Bool)

(assert (=> b!594899 (=> (not res!380749) (not e!339917))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!594899 (= res!380749 (and (= (size!18104 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18104 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18104 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!594900 () Bool)

(declare-fun res!380741 () Bool)

(assert (=> b!594900 (=> (not res!380741) (not e!339917))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!594900 (= res!380741 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!594901 () Bool)

(declare-fun e!339914 () Bool)

(declare-fun e!339912 () Bool)

(assert (=> b!594901 (= e!339914 e!339912)))

(declare-fun res!380746 () Bool)

(assert (=> b!594901 (=> (not res!380746) (not e!339912))))

(declare-datatypes ((SeekEntryResult!6136 0))(
  ( (MissingZero!6136 (index!26792 (_ BitVec 32))) (Found!6136 (index!26793 (_ BitVec 32))) (Intermediate!6136 (undefined!6948 Bool) (index!26794 (_ BitVec 32)) (x!55751 (_ BitVec 32))) (Undefined!6136) (MissingVacant!6136 (index!26795 (_ BitVec 32))) )
))
(declare-fun lt!270090 () SeekEntryResult!6136)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!594901 (= res!380746 (and (= lt!270090 (Found!6136 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17740 a!2986) index!984) (select (arr!17740 a!2986) j!136))) (not (= (select (arr!17740 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36957 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!594901 (= lt!270090 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!594902 () Bool)

(assert (=> b!594902 (= e!339916 true)))

(declare-fun lt!270086 () Bool)

(assert (=> b!594902 (= lt!270086 (contains!2897 Nil!11685 k0!1786))))

(declare-fun b!594903 () Bool)

(declare-fun res!380744 () Bool)

(declare-fun e!339913 () Bool)

(assert (=> b!594903 (=> (not res!380744) (not e!339913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36957 (_ BitVec 32)) Bool)

(assert (=> b!594903 (= res!380744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!594904 () Bool)

(declare-fun e!339915 () Bool)

(assert (=> b!594904 (= e!339912 (not e!339915))))

(declare-fun res!380740 () Bool)

(assert (=> b!594904 (=> res!380740 e!339915)))

(declare-fun lt!270089 () SeekEntryResult!6136)

(assert (=> b!594904 (= res!380740 (not (= lt!270089 (Found!6136 index!984))))))

(declare-datatypes ((Unit!18637 0))(
  ( (Unit!18638) )
))
(declare-fun lt!270088 () Unit!18637)

(declare-fun e!339908 () Unit!18637)

(assert (=> b!594904 (= lt!270088 e!339908)))

(declare-fun c!67451 () Bool)

(assert (=> b!594904 (= c!67451 (= lt!270089 Undefined!6136))))

(declare-fun lt!270084 () array!36957)

(assert (=> b!594904 (= lt!270089 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270085 lt!270084 mask!3053))))

(declare-fun e!339906 () Bool)

(assert (=> b!594904 e!339906))

(declare-fun res!380733 () Bool)

(assert (=> b!594904 (=> (not res!380733) (not e!339906))))

(declare-fun lt!270080 () SeekEntryResult!6136)

(declare-fun lt!270083 () (_ BitVec 32))

(assert (=> b!594904 (= res!380733 (= lt!270080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270083 vacantSpotIndex!68 lt!270085 lt!270084 mask!3053)))))

(assert (=> b!594904 (= lt!270080 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270083 vacantSpotIndex!68 (select (arr!17740 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!594904 (= lt!270085 (select (store (arr!17740 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270082 () Unit!18637)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36957 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18637)

(assert (=> b!594904 (= lt!270082 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270083 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!594904 (= lt!270083 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!594905 () Bool)

(declare-fun res!380752 () Bool)

(assert (=> b!594905 (=> (not res!380752) (not e!339917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!594905 (= res!380752 (validKeyInArray!0 (select (arr!17740 a!2986) j!136)))))

(declare-fun b!594906 () Bool)

(declare-fun e!339911 () Bool)

(assert (=> b!594906 (= e!339911 e!339916)))

(declare-fun res!380751 () Bool)

(assert (=> b!594906 (=> res!380751 e!339916)))

(assert (=> b!594906 (= res!380751 (or (bvsge (size!18104 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18104 a!2986))))))

(assert (=> b!594906 (arrayContainsKey!0 lt!270084 (select (arr!17740 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270091 () Unit!18637)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36957 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18637)

(assert (=> b!594906 (= lt!270091 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270084 (select (arr!17740 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!594907 () Bool)

(declare-fun Unit!18639 () Unit!18637)

(assert (=> b!594907 (= e!339908 Unit!18639)))

(declare-fun b!594908 () Bool)

(assert (=> b!594908 (= e!339915 e!339911)))

(declare-fun res!380734 () Bool)

(assert (=> b!594908 (=> res!380734 e!339911)))

(assert (=> b!594908 (= res!380734 (or (not (= (select (arr!17740 a!2986) j!136) lt!270085)) (not (= (select (arr!17740 a!2986) j!136) lt!270081)) (bvsge j!136 index!984)))))

(assert (=> b!594908 e!339910))

(declare-fun res!380736 () Bool)

(assert (=> b!594908 (=> (not res!380736) (not e!339910))))

(assert (=> b!594908 (= res!380736 (= lt!270081 (select (arr!17740 a!2986) j!136)))))

(assert (=> b!594908 (= lt!270081 (select (store (arr!17740 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!594909 () Bool)

(declare-fun res!380747 () Bool)

(assert (=> b!594909 (=> (not res!380747) (not e!339913))))

(declare-fun arrayNoDuplicates!0 (array!36957 (_ BitVec 32) List!11688) Bool)

(assert (=> b!594909 (= res!380747 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11685))))

(declare-fun b!594910 () Bool)

(declare-fun res!380737 () Bool)

(assert (=> b!594910 (=> res!380737 e!339916)))

(declare-fun noDuplicate!244 (List!11688) Bool)

(assert (=> b!594910 (= res!380737 (not (noDuplicate!244 Nil!11685)))))

(declare-fun b!594911 () Bool)

(declare-fun res!380732 () Bool)

(assert (=> b!594911 (=> res!380732 e!339916)))

(assert (=> b!594911 (= res!380732 (contains!2897 Nil!11685 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!594912 () Bool)

(declare-fun res!380750 () Bool)

(assert (=> b!594912 (=> (not res!380750) (not e!339913))))

(assert (=> b!594912 (= res!380750 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17740 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!594913 () Bool)

(declare-fun res!380743 () Bool)

(assert (=> b!594913 (=> (not res!380743) (not e!339917))))

(assert (=> b!594913 (= res!380743 (validKeyInArray!0 k0!1786))))

(declare-fun b!594914 () Bool)

(assert (=> b!594914 (= e!339913 e!339914)))

(declare-fun res!380739 () Bool)

(assert (=> b!594914 (=> (not res!380739) (not e!339914))))

(assert (=> b!594914 (= res!380739 (= (select (store (arr!17740 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!594914 (= lt!270084 (array!36958 (store (arr!17740 a!2986) i!1108 k0!1786) (size!18104 a!2986)))))

(declare-fun b!594915 () Bool)

(declare-fun Unit!18640 () Unit!18637)

(assert (=> b!594915 (= e!339908 Unit!18640)))

(assert (=> b!594915 false))

(declare-fun b!594916 () Bool)

(assert (=> b!594916 (= e!339906 (= lt!270090 lt!270080))))

(declare-fun b!594917 () Bool)

(assert (=> b!594917 (= e!339917 e!339913)))

(declare-fun res!380745 () Bool)

(assert (=> b!594917 (=> (not res!380745) (not e!339913))))

(declare-fun lt!270087 () SeekEntryResult!6136)

(assert (=> b!594917 (= res!380745 (or (= lt!270087 (MissingZero!6136 i!1108)) (= lt!270087 (MissingVacant!6136 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36957 (_ BitVec 32)) SeekEntryResult!6136)

(assert (=> b!594917 (= lt!270087 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!594918 () Bool)

(declare-fun e!339909 () Bool)

(assert (=> b!594918 (= e!339909 (arrayContainsKey!0 lt!270084 (select (arr!17740 a!2986) j!136) index!984))))

(declare-fun b!594919 () Bool)

(assert (=> b!594919 (= e!339918 e!339909)))

(declare-fun res!380742 () Bool)

(assert (=> b!594919 (=> (not res!380742) (not e!339909))))

(assert (=> b!594919 (= res!380742 (arrayContainsKey!0 lt!270084 (select (arr!17740 a!2986) j!136) j!136))))

(assert (= (and start!54552 res!380738) b!594899))

(assert (= (and b!594899 res!380749) b!594905))

(assert (= (and b!594905 res!380752) b!594913))

(assert (= (and b!594913 res!380743) b!594900))

(assert (= (and b!594900 res!380741) b!594917))

(assert (= (and b!594917 res!380745) b!594903))

(assert (= (and b!594903 res!380744) b!594909))

(assert (= (and b!594909 res!380747) b!594912))

(assert (= (and b!594912 res!380750) b!594914))

(assert (= (and b!594914 res!380739) b!594901))

(assert (= (and b!594901 res!380746) b!594904))

(assert (= (and b!594904 res!380733) b!594916))

(assert (= (and b!594904 c!67451) b!594915))

(assert (= (and b!594904 (not c!67451)) b!594907))

(assert (= (and b!594904 (not res!380740)) b!594908))

(assert (= (and b!594908 res!380736) b!594898))

(assert (= (and b!594898 (not res!380748)) b!594919))

(assert (= (and b!594919 res!380742) b!594918))

(assert (= (and b!594908 (not res!380734)) b!594906))

(assert (= (and b!594906 (not res!380751)) b!594910))

(assert (= (and b!594910 (not res!380737)) b!594897))

(assert (= (and b!594897 (not res!380735)) b!594911))

(assert (= (and b!594911 (not res!380732)) b!594902))

(declare-fun m!572873 () Bool)

(assert (=> b!594901 m!572873))

(declare-fun m!572875 () Bool)

(assert (=> b!594901 m!572875))

(assert (=> b!594901 m!572875))

(declare-fun m!572877 () Bool)

(assert (=> b!594901 m!572877))

(declare-fun m!572879 () Bool)

(assert (=> b!594904 m!572879))

(declare-fun m!572881 () Bool)

(assert (=> b!594904 m!572881))

(assert (=> b!594904 m!572875))

(declare-fun m!572883 () Bool)

(assert (=> b!594904 m!572883))

(declare-fun m!572885 () Bool)

(assert (=> b!594904 m!572885))

(assert (=> b!594904 m!572875))

(declare-fun m!572887 () Bool)

(assert (=> b!594904 m!572887))

(declare-fun m!572889 () Bool)

(assert (=> b!594904 m!572889))

(declare-fun m!572891 () Bool)

(assert (=> b!594904 m!572891))

(declare-fun m!572893 () Bool)

(assert (=> b!594913 m!572893))

(assert (=> b!594914 m!572883))

(declare-fun m!572895 () Bool)

(assert (=> b!594914 m!572895))

(declare-fun m!572897 () Bool)

(assert (=> b!594911 m!572897))

(declare-fun m!572899 () Bool)

(assert (=> start!54552 m!572899))

(declare-fun m!572901 () Bool)

(assert (=> start!54552 m!572901))

(declare-fun m!572903 () Bool)

(assert (=> b!594910 m!572903))

(declare-fun m!572905 () Bool)

(assert (=> b!594912 m!572905))

(declare-fun m!572907 () Bool)

(assert (=> b!594900 m!572907))

(declare-fun m!572909 () Bool)

(assert (=> b!594902 m!572909))

(declare-fun m!572911 () Bool)

(assert (=> b!594897 m!572911))

(assert (=> b!594906 m!572875))

(assert (=> b!594906 m!572875))

(declare-fun m!572913 () Bool)

(assert (=> b!594906 m!572913))

(assert (=> b!594906 m!572875))

(declare-fun m!572915 () Bool)

(assert (=> b!594906 m!572915))

(assert (=> b!594898 m!572875))

(assert (=> b!594908 m!572875))

(assert (=> b!594908 m!572883))

(declare-fun m!572917 () Bool)

(assert (=> b!594908 m!572917))

(declare-fun m!572919 () Bool)

(assert (=> b!594917 m!572919))

(declare-fun m!572921 () Bool)

(assert (=> b!594909 m!572921))

(assert (=> b!594919 m!572875))

(assert (=> b!594919 m!572875))

(declare-fun m!572923 () Bool)

(assert (=> b!594919 m!572923))

(assert (=> b!594905 m!572875))

(assert (=> b!594905 m!572875))

(declare-fun m!572925 () Bool)

(assert (=> b!594905 m!572925))

(assert (=> b!594918 m!572875))

(assert (=> b!594918 m!572875))

(declare-fun m!572927 () Bool)

(assert (=> b!594918 m!572927))

(declare-fun m!572929 () Bool)

(assert (=> b!594903 m!572929))

(check-sat (not start!54552) (not b!594897) (not b!594919) (not b!594906) (not b!594917) (not b!594909) (not b!594903) (not b!594913) (not b!594910) (not b!594904) (not b!594900) (not b!594901) (not b!594905) (not b!594911) (not b!594918) (not b!594902))
(check-sat)
