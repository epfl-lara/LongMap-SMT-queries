; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58226 () Bool)

(assert start!58226)

(declare-fun b!643133 () Bool)

(declare-fun e!368369 () Bool)

(declare-fun e!368379 () Bool)

(assert (=> b!643133 (= e!368369 e!368379)))

(declare-fun res!416585 () Bool)

(assert (=> b!643133 (=> res!416585 e!368379)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297918 () (_ BitVec 64))

(declare-datatypes ((array!38404 0))(
  ( (array!38405 (arr!18417 (Array (_ BitVec 32) (_ BitVec 64))) (size!18781 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38404)

(declare-fun lt!297914 () (_ BitVec 64))

(assert (=> b!643133 (= res!416585 (or (not (= (select (arr!18417 a!2986) j!136) lt!297918)) (not (= (select (arr!18417 a!2986) j!136) lt!297914))))))

(declare-fun e!368372 () Bool)

(assert (=> b!643133 e!368372))

(declare-fun res!416589 () Bool)

(assert (=> b!643133 (=> (not res!416589) (not e!368372))))

(assert (=> b!643133 (= res!416589 (= lt!297914 (select (arr!18417 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!643133 (= lt!297914 (select (store (arr!18417 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!643134 () Bool)

(declare-datatypes ((Unit!21768 0))(
  ( (Unit!21769) )
))
(declare-fun e!368367 () Unit!21768)

(declare-fun Unit!21770 () Unit!21768)

(assert (=> b!643134 (= e!368367 Unit!21770)))

(declare-fun b!643135 () Bool)

(declare-fun e!368374 () Bool)

(assert (=> b!643135 (= e!368374 (not e!368369))))

(declare-fun res!416583 () Bool)

(assert (=> b!643135 (=> res!416583 e!368369)))

(declare-datatypes ((SeekEntryResult!6857 0))(
  ( (MissingZero!6857 (index!29757 (_ BitVec 32))) (Found!6857 (index!29758 (_ BitVec 32))) (Intermediate!6857 (undefined!7669 Bool) (index!29759 (_ BitVec 32)) (x!58528 (_ BitVec 32))) (Undefined!6857) (MissingVacant!6857 (index!29760 (_ BitVec 32))) )
))
(declare-fun lt!297928 () SeekEntryResult!6857)

(assert (=> b!643135 (= res!416583 (not (= lt!297928 (Found!6857 index!984))))))

(declare-fun lt!297924 () Unit!21768)

(assert (=> b!643135 (= lt!297924 e!368367)))

(declare-fun c!73643 () Bool)

(assert (=> b!643135 (= c!73643 (= lt!297928 Undefined!6857))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!297917 () array!38404)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38404 (_ BitVec 32)) SeekEntryResult!6857)

(assert (=> b!643135 (= lt!297928 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297918 lt!297917 mask!3053))))

(declare-fun e!368373 () Bool)

(assert (=> b!643135 e!368373))

(declare-fun res!416600 () Bool)

(assert (=> b!643135 (=> (not res!416600) (not e!368373))))

(declare-fun lt!297922 () SeekEntryResult!6857)

(declare-fun lt!297916 () (_ BitVec 32))

(assert (=> b!643135 (= res!416600 (= lt!297922 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 lt!297918 lt!297917 mask!3053)))))

(assert (=> b!643135 (= lt!297922 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 (select (arr!18417 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!643135 (= lt!297918 (select (store (arr!18417 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!297927 () Unit!21768)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38404 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21768)

(assert (=> b!643135 (= lt!297927 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!643135 (= lt!297916 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!643136 () Bool)

(declare-fun e!368366 () Bool)

(declare-fun arrayContainsKey!0 (array!38404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!643136 (= e!368366 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) index!984))))

(assert (=> b!643136 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) j!136)))

(declare-fun b!643137 () Bool)

(declare-fun e!368371 () Bool)

(declare-fun e!368377 () Bool)

(assert (=> b!643137 (= e!368371 e!368377)))

(declare-fun res!416590 () Bool)

(assert (=> b!643137 (=> (not res!416590) (not e!368377))))

(assert (=> b!643137 (= res!416590 (= (select (store (arr!18417 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643137 (= lt!297917 (array!38405 (store (arr!18417 a!2986) i!1108 k!1786) (size!18781 a!2986)))))

(declare-fun b!643138 () Bool)

(declare-fun e!368375 () Bool)

(assert (=> b!643138 (= e!368375 e!368371)))

(declare-fun res!416587 () Bool)

(assert (=> b!643138 (=> (not res!416587) (not e!368371))))

(declare-fun lt!297923 () SeekEntryResult!6857)

(assert (=> b!643138 (= res!416587 (or (= lt!297923 (MissingZero!6857 i!1108)) (= lt!297923 (MissingVacant!6857 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38404 (_ BitVec 32)) SeekEntryResult!6857)

(assert (=> b!643138 (= lt!297923 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!643139 () Bool)

(declare-fun Unit!21771 () Unit!21768)

(assert (=> b!643139 (= e!368367 Unit!21771)))

(assert (=> b!643139 false))

(declare-fun b!643140 () Bool)

(declare-fun e!368378 () Bool)

(declare-fun e!368376 () Bool)

(assert (=> b!643140 (= e!368378 e!368376)))

(declare-fun res!416584 () Bool)

(assert (=> b!643140 (=> (not res!416584) (not e!368376))))

(assert (=> b!643140 (= res!416584 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) j!136))))

(declare-fun b!643141 () Bool)

(declare-fun res!416594 () Bool)

(assert (=> b!643141 (=> (not res!416594) (not e!368371))))

(declare-datatypes ((List!12458 0))(
  ( (Nil!12455) (Cons!12454 (h!13499 (_ BitVec 64)) (t!18686 List!12458)) )
))
(declare-fun arrayNoDuplicates!0 (array!38404 (_ BitVec 32) List!12458) Bool)

(assert (=> b!643141 (= res!416594 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12455))))

(declare-fun b!643142 () Bool)

(declare-fun res!416598 () Bool)

(assert (=> b!643142 (=> (not res!416598) (not e!368375))))

(assert (=> b!643142 (= res!416598 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!643143 () Bool)

(assert (=> b!643143 (= e!368372 e!368378)))

(declare-fun res!416592 () Bool)

(assert (=> b!643143 (=> res!416592 e!368378)))

(assert (=> b!643143 (= res!416592 (or (not (= (select (arr!18417 a!2986) j!136) lt!297918)) (not (= (select (arr!18417 a!2986) j!136) lt!297914)) (bvsge j!136 index!984)))))

(declare-fun b!643144 () Bool)

(declare-fun res!416599 () Bool)

(assert (=> b!643144 (=> (not res!416599) (not e!368371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38404 (_ BitVec 32)) Bool)

(assert (=> b!643144 (= res!416599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!643145 () Bool)

(declare-fun res!416586 () Bool)

(assert (=> b!643145 (=> (not res!416586) (not e!368375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!643145 (= res!416586 (validKeyInArray!0 k!1786))))

(declare-fun b!643146 () Bool)

(declare-fun e!368368 () Unit!21768)

(declare-fun Unit!21772 () Unit!21768)

(assert (=> b!643146 (= e!368368 Unit!21772)))

(declare-fun b!643147 () Bool)

(declare-fun Unit!21773 () Unit!21768)

(assert (=> b!643147 (= e!368368 Unit!21773)))

(declare-fun lt!297921 () Unit!21768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21768)

(assert (=> b!643147 (= lt!297921 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297917 (select (arr!18417 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!643147 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297926 () Unit!21768)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12458) Unit!21768)

(assert (=> b!643147 (= lt!297926 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12455))))

(assert (=> b!643147 (arrayNoDuplicates!0 lt!297917 #b00000000000000000000000000000000 Nil!12455)))

(declare-fun lt!297925 () Unit!21768)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38404 (_ BitVec 32) (_ BitVec 32)) Unit!21768)

(assert (=> b!643147 (= lt!297925 (lemmaNoDuplicateFromThenFromBigger!0 lt!297917 #b00000000000000000000000000000000 j!136))))

(assert (=> b!643147 (arrayNoDuplicates!0 lt!297917 j!136 Nil!12455)))

(declare-fun lt!297919 () Unit!21768)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38404 (_ BitVec 64) (_ BitVec 32) List!12458) Unit!21768)

(assert (=> b!643147 (= lt!297919 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297917 (select (arr!18417 a!2986) j!136) j!136 Nil!12455))))

(assert (=> b!643147 false))

(declare-fun b!643148 () Bool)

(assert (=> b!643148 (= e!368376 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) index!984))))

(declare-fun b!643149 () Bool)

(declare-fun res!416595 () Bool)

(assert (=> b!643149 (=> (not res!416595) (not e!368375))))

(assert (=> b!643149 (= res!416595 (validKeyInArray!0 (select (arr!18417 a!2986) j!136)))))

(declare-fun b!643150 () Bool)

(assert (=> b!643150 (= e!368377 e!368374)))

(declare-fun res!416596 () Bool)

(assert (=> b!643150 (=> (not res!416596) (not e!368374))))

(declare-fun lt!297920 () SeekEntryResult!6857)

(assert (=> b!643150 (= res!416596 (and (= lt!297920 (Found!6857 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18417 a!2986) index!984) (select (arr!18417 a!2986) j!136))) (not (= (select (arr!18417 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!643150 (= lt!297920 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18417 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643151 () Bool)

(declare-fun res!416597 () Bool)

(assert (=> b!643151 (=> (not res!416597) (not e!368375))))

(assert (=> b!643151 (= res!416597 (and (= (size!18781 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18781 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!643152 () Bool)

(assert (=> b!643152 (= e!368379 e!368366)))

(declare-fun res!416588 () Bool)

(assert (=> b!643152 (=> res!416588 e!368366)))

(assert (=> b!643152 (= res!416588 (bvsge index!984 j!136))))

(declare-fun lt!297915 () Unit!21768)

(assert (=> b!643152 (= lt!297915 e!368368)))

(declare-fun c!73642 () Bool)

(assert (=> b!643152 (= c!73642 (bvslt j!136 index!984))))

(declare-fun b!643153 () Bool)

(assert (=> b!643153 (= e!368373 (= lt!297920 lt!297922))))

(declare-fun res!416593 () Bool)

(assert (=> start!58226 (=> (not res!416593) (not e!368375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58226 (= res!416593 (validMask!0 mask!3053))))

(assert (=> start!58226 e!368375))

(assert (=> start!58226 true))

(declare-fun array_inv!14213 (array!38404) Bool)

(assert (=> start!58226 (array_inv!14213 a!2986)))

(declare-fun b!643154 () Bool)

(declare-fun res!416591 () Bool)

(assert (=> b!643154 (=> (not res!416591) (not e!368371))))

(assert (=> b!643154 (= res!416591 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18417 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!58226 res!416593) b!643151))

(assert (= (and b!643151 res!416597) b!643149))

(assert (= (and b!643149 res!416595) b!643145))

(assert (= (and b!643145 res!416586) b!643142))

(assert (= (and b!643142 res!416598) b!643138))

(assert (= (and b!643138 res!416587) b!643144))

(assert (= (and b!643144 res!416599) b!643141))

(assert (= (and b!643141 res!416594) b!643154))

(assert (= (and b!643154 res!416591) b!643137))

(assert (= (and b!643137 res!416590) b!643150))

(assert (= (and b!643150 res!416596) b!643135))

(assert (= (and b!643135 res!416600) b!643153))

(assert (= (and b!643135 c!73643) b!643139))

(assert (= (and b!643135 (not c!73643)) b!643134))

(assert (= (and b!643135 (not res!416583)) b!643133))

(assert (= (and b!643133 res!416589) b!643143))

(assert (= (and b!643143 (not res!416592)) b!643140))

(assert (= (and b!643140 res!416584) b!643148))

(assert (= (and b!643133 (not res!416585)) b!643152))

(assert (= (and b!643152 c!73642) b!643147))

(assert (= (and b!643152 (not c!73642)) b!643146))

(assert (= (and b!643152 (not res!416588)) b!643136))

(declare-fun m!616877 () Bool)

(assert (=> b!643142 m!616877))

(declare-fun m!616879 () Bool)

(assert (=> b!643136 m!616879))

(assert (=> b!643136 m!616879))

(declare-fun m!616881 () Bool)

(assert (=> b!643136 m!616881))

(assert (=> b!643136 m!616879))

(declare-fun m!616883 () Bool)

(assert (=> b!643136 m!616883))

(assert (=> b!643143 m!616879))

(declare-fun m!616885 () Bool)

(assert (=> b!643138 m!616885))

(assert (=> b!643148 m!616879))

(assert (=> b!643148 m!616879))

(assert (=> b!643148 m!616881))

(declare-fun m!616887 () Bool)

(assert (=> b!643154 m!616887))

(declare-fun m!616889 () Bool)

(assert (=> b!643141 m!616889))

(assert (=> b!643149 m!616879))

(assert (=> b!643149 m!616879))

(declare-fun m!616891 () Bool)

(assert (=> b!643149 m!616891))

(assert (=> b!643147 m!616879))

(declare-fun m!616893 () Bool)

(assert (=> b!643147 m!616893))

(assert (=> b!643147 m!616879))

(declare-fun m!616895 () Bool)

(assert (=> b!643147 m!616895))

(declare-fun m!616897 () Bool)

(assert (=> b!643147 m!616897))

(assert (=> b!643147 m!616879))

(declare-fun m!616899 () Bool)

(assert (=> b!643147 m!616899))

(assert (=> b!643147 m!616879))

(declare-fun m!616901 () Bool)

(assert (=> b!643147 m!616901))

(declare-fun m!616903 () Bool)

(assert (=> b!643147 m!616903))

(declare-fun m!616905 () Bool)

(assert (=> b!643147 m!616905))

(declare-fun m!616907 () Bool)

(assert (=> b!643135 m!616907))

(declare-fun m!616909 () Bool)

(assert (=> b!643135 m!616909))

(assert (=> b!643135 m!616879))

(declare-fun m!616911 () Bool)

(assert (=> b!643135 m!616911))

(declare-fun m!616913 () Bool)

(assert (=> b!643135 m!616913))

(declare-fun m!616915 () Bool)

(assert (=> b!643135 m!616915))

(assert (=> b!643135 m!616879))

(declare-fun m!616917 () Bool)

(assert (=> b!643135 m!616917))

(declare-fun m!616919 () Bool)

(assert (=> b!643135 m!616919))

(assert (=> b!643137 m!616913))

(declare-fun m!616921 () Bool)

(assert (=> b!643137 m!616921))

(declare-fun m!616923 () Bool)

(assert (=> b!643144 m!616923))

(assert (=> b!643140 m!616879))

(assert (=> b!643140 m!616879))

(assert (=> b!643140 m!616883))

(assert (=> b!643133 m!616879))

(assert (=> b!643133 m!616913))

(declare-fun m!616925 () Bool)

(assert (=> b!643133 m!616925))

(declare-fun m!616927 () Bool)

(assert (=> start!58226 m!616927))

(declare-fun m!616929 () Bool)

(assert (=> start!58226 m!616929))

(declare-fun m!616931 () Bool)

(assert (=> b!643145 m!616931))

(declare-fun m!616933 () Bool)

(assert (=> b!643150 m!616933))

(assert (=> b!643150 m!616879))

(assert (=> b!643150 m!616879))

(declare-fun m!616935 () Bool)

(assert (=> b!643150 m!616935))

(push 1)

(assert (not b!643150))

(assert (not start!58226))

(assert (not b!643149))

(assert (not b!643135))

(assert (not b!643142))

(assert (not b!643144))

(assert (not b!643141))

(assert (not b!643138))

(assert (not b!643136))

(assert (not b!643147))

(assert (not b!643148))

(assert (not b!643145))

(assert (not b!643140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!90933 () Bool)

(declare-fun res!416713 () Bool)

(declare-fun e!368486 () Bool)

(assert (=> d!90933 (=> res!416713 e!368486)))

(assert (=> d!90933 (= res!416713 (= (select (arr!18417 lt!297917) index!984) (select (arr!18417 a!2986) j!136)))))

(assert (=> d!90933 (= (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) index!984) e!368486)))

(declare-fun b!643327 () Bool)

(declare-fun e!368487 () Bool)

(assert (=> b!643327 (= e!368486 e!368487)))

(declare-fun res!416714 () Bool)

(assert (=> b!643327 (=> (not res!416714) (not e!368487))))

(assert (=> b!643327 (= res!416714 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18781 lt!297917)))))

(declare-fun b!643328 () Bool)

(assert (=> b!643328 (= e!368487 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90933 (not res!416713)) b!643327))

(assert (= (and b!643327 res!416714) b!643328))

(declare-fun m!617077 () Bool)

(assert (=> d!90933 m!617077))

(assert (=> b!643328 m!616879))

(declare-fun m!617079 () Bool)

(assert (=> b!643328 m!617079))

(assert (=> b!643148 d!90933))

(declare-fun d!90937 () Bool)

(assert (=> d!90937 (= (validKeyInArray!0 (select (arr!18417 a!2986) j!136)) (and (not (= (select (arr!18417 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18417 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643149 d!90937))

(declare-fun b!643397 () Bool)

(declare-fun e!368545 () SeekEntryResult!6857)

(declare-fun lt!298054 () SeekEntryResult!6857)

(assert (=> b!643397 (= e!368545 (Found!6857 (index!29759 lt!298054)))))

(declare-fun b!643398 () Bool)

(declare-fun c!73689 () Bool)

(declare-fun lt!298052 () (_ BitVec 64))

(assert (=> b!643398 (= c!73689 (= lt!298052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368544 () SeekEntryResult!6857)

(assert (=> b!643398 (= e!368545 e!368544)))

(declare-fun b!643399 () Bool)

(declare-fun e!368543 () SeekEntryResult!6857)

(assert (=> b!643399 (= e!368543 Undefined!6857)))

(declare-fun b!643400 () Bool)

(assert (=> b!643400 (= e!368544 (MissingZero!6857 (index!29759 lt!298054)))))

(declare-fun d!90939 () Bool)

(declare-fun lt!298053 () SeekEntryResult!6857)

(assert (=> d!90939 (and (or (is-Undefined!6857 lt!298053) (not (is-Found!6857 lt!298053)) (and (bvsge (index!29758 lt!298053) #b00000000000000000000000000000000) (bvslt (index!29758 lt!298053) (size!18781 a!2986)))) (or (is-Undefined!6857 lt!298053) (is-Found!6857 lt!298053) (not (is-MissingZero!6857 lt!298053)) (and (bvsge (index!29757 lt!298053) #b00000000000000000000000000000000) (bvslt (index!29757 lt!298053) (size!18781 a!2986)))) (or (is-Undefined!6857 lt!298053) (is-Found!6857 lt!298053) (is-MissingZero!6857 lt!298053) (not (is-MissingVacant!6857 lt!298053)) (and (bvsge (index!29760 lt!298053) #b00000000000000000000000000000000) (bvslt (index!29760 lt!298053) (size!18781 a!2986)))) (or (is-Undefined!6857 lt!298053) (ite (is-Found!6857 lt!298053) (= (select (arr!18417 a!2986) (index!29758 lt!298053)) k!1786) (ite (is-MissingZero!6857 lt!298053) (= (select (arr!18417 a!2986) (index!29757 lt!298053)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6857 lt!298053) (= (select (arr!18417 a!2986) (index!29760 lt!298053)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!90939 (= lt!298053 e!368543)))

(declare-fun c!73688 () Bool)

(assert (=> d!90939 (= c!73688 (and (is-Intermediate!6857 lt!298054) (undefined!7669 lt!298054)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38404 (_ BitVec 32)) SeekEntryResult!6857)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90939 (= lt!298054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!90939 (validMask!0 mask!3053)))

(assert (=> d!90939 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!298053)))

(declare-fun b!643401 () Bool)

(assert (=> b!643401 (= e!368544 (seekKeyOrZeroReturnVacant!0 (x!58528 lt!298054) (index!29759 lt!298054) (index!29759 lt!298054) k!1786 a!2986 mask!3053))))

(declare-fun b!643402 () Bool)

(assert (=> b!643402 (= e!368543 e!368545)))

(assert (=> b!643402 (= lt!298052 (select (arr!18417 a!2986) (index!29759 lt!298054)))))

(declare-fun c!73687 () Bool)

(assert (=> b!643402 (= c!73687 (= lt!298052 k!1786))))

(assert (= (and d!90939 c!73688) b!643399))

(assert (= (and d!90939 (not c!73688)) b!643402))

(assert (= (and b!643402 c!73687) b!643397))

(assert (= (and b!643402 (not c!73687)) b!643398))

(assert (= (and b!643398 c!73689) b!643400))

(assert (= (and b!643398 (not c!73689)) b!643401))

(declare-fun m!617133 () Bool)

(assert (=> d!90939 m!617133))

(assert (=> d!90939 m!616927))

(declare-fun m!617135 () Bool)

(assert (=> d!90939 m!617135))

(declare-fun m!617137 () Bool)

(assert (=> d!90939 m!617137))

(declare-fun m!617139 () Bool)

(assert (=> d!90939 m!617139))

(declare-fun m!617141 () Bool)

(assert (=> d!90939 m!617141))

(assert (=> d!90939 m!617139))

(declare-fun m!617143 () Bool)

(assert (=> b!643401 m!617143))

(declare-fun m!617145 () Bool)

(assert (=> b!643402 m!617145))

(assert (=> b!643138 d!90939))

(declare-fun b!643446 () Bool)

(declare-fun e!368573 () SeekEntryResult!6857)

(assert (=> b!643446 (= e!368573 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297916 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297918 lt!297917 mask!3053))))

(declare-fun b!643447 () Bool)

(assert (=> b!643447 (= e!368573 (MissingVacant!6857 vacantSpotIndex!68))))

(declare-fun b!643448 () Bool)

(declare-fun e!368575 () SeekEntryResult!6857)

(assert (=> b!643448 (= e!368575 (Found!6857 lt!297916))))

(declare-fun b!643449 () Bool)

(declare-fun c!73708 () Bool)

(declare-fun lt!298072 () (_ BitVec 64))

(assert (=> b!643449 (= c!73708 (= lt!298072 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643449 (= e!368575 e!368573)))

(declare-fun b!643450 () Bool)

(declare-fun e!368574 () SeekEntryResult!6857)

(assert (=> b!643450 (= e!368574 e!368575)))

(declare-fun c!73706 () Bool)

(assert (=> b!643450 (= c!73706 (= lt!298072 lt!297918))))

(declare-fun b!643451 () Bool)

(assert (=> b!643451 (= e!368574 Undefined!6857)))

(declare-fun lt!298073 () SeekEntryResult!6857)

(declare-fun d!90967 () Bool)

(assert (=> d!90967 (and (or (is-Undefined!6857 lt!298073) (not (is-Found!6857 lt!298073)) (and (bvsge (index!29758 lt!298073) #b00000000000000000000000000000000) (bvslt (index!29758 lt!298073) (size!18781 lt!297917)))) (or (is-Undefined!6857 lt!298073) (is-Found!6857 lt!298073) (not (is-MissingVacant!6857 lt!298073)) (not (= (index!29760 lt!298073) vacantSpotIndex!68)) (and (bvsge (index!29760 lt!298073) #b00000000000000000000000000000000) (bvslt (index!29760 lt!298073) (size!18781 lt!297917)))) (or (is-Undefined!6857 lt!298073) (ite (is-Found!6857 lt!298073) (= (select (arr!18417 lt!297917) (index!29758 lt!298073)) lt!297918) (and (is-MissingVacant!6857 lt!298073) (= (index!29760 lt!298073) vacantSpotIndex!68) (= (select (arr!18417 lt!297917) (index!29760 lt!298073)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90967 (= lt!298073 e!368574)))

(declare-fun c!73707 () Bool)

(assert (=> d!90967 (= c!73707 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90967 (= lt!298072 (select (arr!18417 lt!297917) lt!297916))))

(assert (=> d!90967 (validMask!0 mask!3053)))

(assert (=> d!90967 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 lt!297918 lt!297917 mask!3053) lt!298073)))

(assert (= (and d!90967 c!73707) b!643451))

(assert (= (and d!90967 (not c!73707)) b!643450))

(assert (= (and b!643450 c!73706) b!643448))

(assert (= (and b!643450 (not c!73706)) b!643449))

(assert (= (and b!643449 c!73708) b!643447))

(assert (= (and b!643449 (not c!73708)) b!643446))

(declare-fun m!617181 () Bool)

(assert (=> b!643446 m!617181))

(assert (=> b!643446 m!617181))

(declare-fun m!617183 () Bool)

(assert (=> b!643446 m!617183))

(declare-fun m!617185 () Bool)

(assert (=> d!90967 m!617185))

(declare-fun m!617187 () Bool)

(assert (=> d!90967 m!617187))

(declare-fun m!617189 () Bool)

(assert (=> d!90967 m!617189))

(assert (=> d!90967 m!616927))

(assert (=> b!643135 d!90967))

(declare-fun d!90983 () Bool)

(declare-fun lt!298080 () (_ BitVec 32))

(assert (=> d!90983 (and (bvsge lt!298080 #b00000000000000000000000000000000) (bvslt lt!298080 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90983 (= lt!298080 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90983 (validMask!0 mask!3053)))

(assert (=> d!90983 (= (nextIndex!0 index!984 x!910 mask!3053) lt!298080)))

(declare-fun bs!19246 () Bool)

(assert (= bs!19246 d!90983))

(declare-fun m!617191 () Bool)

(assert (=> bs!19246 m!617191))

(assert (=> bs!19246 m!616927))

(assert (=> b!643135 d!90983))

(declare-fun d!90985 () Bool)

(declare-fun e!368603 () Bool)

(assert (=> d!90985 e!368603))

(declare-fun res!416781 () Bool)

(assert (=> d!90985 (=> (not res!416781) (not e!368603))))

(assert (=> d!90985 (= res!416781 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18781 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18781 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18781 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986))))))

(declare-fun lt!298099 () Unit!21768)

(declare-fun choose!9 (array!38404 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21768)

(assert (=> d!90985 (= lt!298099 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90985 (validMask!0 mask!3053)))

(assert (=> d!90985 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 mask!3053) lt!298099)))

(declare-fun b!643493 () Bool)

(assert (=> b!643493 (= e!368603 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 (select (arr!18417 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 (select (store (arr!18417 a!2986) i!1108 k!1786) j!136) (array!38405 (store (arr!18417 a!2986) i!1108 k!1786) (size!18781 a!2986)) mask!3053)))))

(assert (= (and d!90985 res!416781) b!643493))

(declare-fun m!617241 () Bool)

(assert (=> d!90985 m!617241))

(assert (=> d!90985 m!616927))

(assert (=> b!643493 m!616879))

(assert (=> b!643493 m!616879))

(assert (=> b!643493 m!616917))

(assert (=> b!643493 m!616913))

(assert (=> b!643493 m!616909))

(assert (=> b!643493 m!616909))

(declare-fun m!617243 () Bool)

(assert (=> b!643493 m!617243))

(assert (=> b!643135 d!90985))

(declare-fun e!368604 () SeekEntryResult!6857)

(declare-fun b!643494 () Bool)

(assert (=> b!643494 (= e!368604 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297916 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18417 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643495 () Bool)

(assert (=> b!643495 (= e!368604 (MissingVacant!6857 vacantSpotIndex!68))))

(declare-fun b!643496 () Bool)

(declare-fun e!368606 () SeekEntryResult!6857)

(assert (=> b!643496 (= e!368606 (Found!6857 lt!297916))))

(declare-fun b!643497 () Bool)

(declare-fun c!73725 () Bool)

(declare-fun lt!298100 () (_ BitVec 64))

(assert (=> b!643497 (= c!73725 (= lt!298100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643497 (= e!368606 e!368604)))

(declare-fun b!643498 () Bool)

(declare-fun e!368605 () SeekEntryResult!6857)

(assert (=> b!643498 (= e!368605 e!368606)))

(declare-fun c!73723 () Bool)

(assert (=> b!643498 (= c!73723 (= lt!298100 (select (arr!18417 a!2986) j!136)))))

(declare-fun b!643499 () Bool)

(assert (=> b!643499 (= e!368605 Undefined!6857)))

(declare-fun d!91001 () Bool)

(declare-fun lt!298101 () SeekEntryResult!6857)

(assert (=> d!91001 (and (or (is-Undefined!6857 lt!298101) (not (is-Found!6857 lt!298101)) (and (bvsge (index!29758 lt!298101) #b00000000000000000000000000000000) (bvslt (index!29758 lt!298101) (size!18781 a!2986)))) (or (is-Undefined!6857 lt!298101) (is-Found!6857 lt!298101) (not (is-MissingVacant!6857 lt!298101)) (not (= (index!29760 lt!298101) vacantSpotIndex!68)) (and (bvsge (index!29760 lt!298101) #b00000000000000000000000000000000) (bvslt (index!29760 lt!298101) (size!18781 a!2986)))) (or (is-Undefined!6857 lt!298101) (ite (is-Found!6857 lt!298101) (= (select (arr!18417 a!2986) (index!29758 lt!298101)) (select (arr!18417 a!2986) j!136)) (and (is-MissingVacant!6857 lt!298101) (= (index!29760 lt!298101) vacantSpotIndex!68) (= (select (arr!18417 a!2986) (index!29760 lt!298101)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91001 (= lt!298101 e!368605)))

(declare-fun c!73724 () Bool)

(assert (=> d!91001 (= c!73724 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!91001 (= lt!298100 (select (arr!18417 a!2986) lt!297916))))

(assert (=> d!91001 (validMask!0 mask!3053)))

(assert (=> d!91001 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297916 vacantSpotIndex!68 (select (arr!18417 a!2986) j!136) a!2986 mask!3053) lt!298101)))

(assert (= (and d!91001 c!73724) b!643499))

(assert (= (and d!91001 (not c!73724)) b!643498))

(assert (= (and b!643498 c!73723) b!643496))

(assert (= (and b!643498 (not c!73723)) b!643497))

(assert (= (and b!643497 c!73725) b!643495))

(assert (= (and b!643497 (not c!73725)) b!643494))

(assert (=> b!643494 m!617181))

(assert (=> b!643494 m!617181))

(assert (=> b!643494 m!616879))

(declare-fun m!617245 () Bool)

(assert (=> b!643494 m!617245))

(declare-fun m!617247 () Bool)

(assert (=> d!91001 m!617247))

(declare-fun m!617249 () Bool)

(assert (=> d!91001 m!617249))

(declare-fun m!617251 () Bool)

(assert (=> d!91001 m!617251))

(assert (=> d!91001 m!616927))

(assert (=> b!643135 d!91001))

(declare-fun b!643500 () Bool)

(declare-fun e!368607 () SeekEntryResult!6857)

(assert (=> b!643500 (= e!368607 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297918 lt!297917 mask!3053))))

(declare-fun b!643501 () Bool)

(assert (=> b!643501 (= e!368607 (MissingVacant!6857 vacantSpotIndex!68))))

(declare-fun b!643502 () Bool)

(declare-fun e!368609 () SeekEntryResult!6857)

(assert (=> b!643502 (= e!368609 (Found!6857 index!984))))

(declare-fun b!643503 () Bool)

(declare-fun c!73728 () Bool)

(declare-fun lt!298104 () (_ BitVec 64))

(assert (=> b!643503 (= c!73728 (= lt!298104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643503 (= e!368609 e!368607)))

(declare-fun b!643504 () Bool)

(declare-fun e!368608 () SeekEntryResult!6857)

(assert (=> b!643504 (= e!368608 e!368609)))

(declare-fun c!73726 () Bool)

(assert (=> b!643504 (= c!73726 (= lt!298104 lt!297918))))

(declare-fun b!643505 () Bool)

(assert (=> b!643505 (= e!368608 Undefined!6857)))

(declare-fun lt!298105 () SeekEntryResult!6857)

(declare-fun d!91003 () Bool)

(assert (=> d!91003 (and (or (is-Undefined!6857 lt!298105) (not (is-Found!6857 lt!298105)) (and (bvsge (index!29758 lt!298105) #b00000000000000000000000000000000) (bvslt (index!29758 lt!298105) (size!18781 lt!297917)))) (or (is-Undefined!6857 lt!298105) (is-Found!6857 lt!298105) (not (is-MissingVacant!6857 lt!298105)) (not (= (index!29760 lt!298105) vacantSpotIndex!68)) (and (bvsge (index!29760 lt!298105) #b00000000000000000000000000000000) (bvslt (index!29760 lt!298105) (size!18781 lt!297917)))) (or (is-Undefined!6857 lt!298105) (ite (is-Found!6857 lt!298105) (= (select (arr!18417 lt!297917) (index!29758 lt!298105)) lt!297918) (and (is-MissingVacant!6857 lt!298105) (= (index!29760 lt!298105) vacantSpotIndex!68) (= (select (arr!18417 lt!297917) (index!29760 lt!298105)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!91003 (= lt!298105 e!368608)))

(declare-fun c!73727 () Bool)

(assert (=> d!91003 (= c!73727 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!91003 (= lt!298104 (select (arr!18417 lt!297917) index!984))))

(assert (=> d!91003 (validMask!0 mask!3053)))

(assert (=> d!91003 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297918 lt!297917 mask!3053) lt!298105)))

(assert (= (and d!91003 c!73727) b!643505))

(assert (= (and d!91003 (not c!73727)) b!643504))

(assert (= (and b!643504 c!73726) b!643502))

(assert (= (and b!643504 (not c!73726)) b!643503))

(assert (= (and b!643503 c!73728) b!643501))

(assert (= (and b!643503 (not c!73728)) b!643500))

(assert (=> b!643500 m!616907))

(assert (=> b!643500 m!616907))

(declare-fun m!617253 () Bool)

(assert (=> b!643500 m!617253))

(declare-fun m!617255 () Bool)

(assert (=> d!91003 m!617255))

(declare-fun m!617257 () Bool)

(assert (=> d!91003 m!617257))

(assert (=> d!91003 m!617077))

(assert (=> d!91003 m!616927))

(assert (=> b!643135 d!91003))

(declare-fun d!91005 () Bool)

(assert (=> d!91005 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!643145 d!91005))

(declare-fun d!91009 () Bool)

(assert (=> d!91009 (arrayContainsKey!0 lt!297917 (select (arr!18417 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!298111 () Unit!21768)

(declare-fun choose!114 (array!38404 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21768)

(assert (=> d!91009 (= lt!298111 (choose!114 lt!297917 (select (arr!18417 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91009 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91009 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297917 (select (arr!18417 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!298111)))

(declare-fun bs!19250 () Bool)

(assert (= bs!19250 d!91009))

(assert (=> bs!19250 m!616879))

(assert (=> bs!19250 m!616899))

(assert (=> bs!19250 m!616879))

(declare-fun m!617261 () Bool)

(assert (=> bs!19250 m!617261))

(assert (=> b!643147 d!91009))

(declare-fun b!643519 () Bool)

(declare-fun e!368624 () Bool)

(declare-fun e!368623 () Bool)

(assert (=> b!643519 (= e!368624 e!368623)))

(declare-fun c!73731 () Bool)

(assert (=> b!643519 (= c!73731 (validKeyInArray!0 (select (arr!18417 lt!297917) j!136)))))

(declare-fun b!643520 () Bool)

(declare-fun call!33600 () Bool)

(assert (=> b!643520 (= e!368623 call!33600)))

(declare-fun b!643521 () Bool)

(declare-fun e!368622 () Bool)

(assert (=> b!643521 (= e!368622 e!368624)))

(declare-fun res!416792 () Bool)

(assert (=> b!643521 (=> (not res!416792) (not e!368624))))

(declare-fun e!368621 () Bool)

(assert (=> b!643521 (= res!416792 (not e!368621))))

(declare-fun res!416791 () Bool)

(assert (=> b!643521 (=> (not res!416791) (not e!368621))))

(assert (=> b!643521 (= res!416791 (validKeyInArray!0 (select (arr!18417 lt!297917) j!136)))))

(declare-fun b!643522 () Bool)

(declare-fun contains!3143 (List!12458 (_ BitVec 64)) Bool)

(assert (=> b!643522 (= e!368621 (contains!3143 Nil!12455 (select (arr!18417 lt!297917) j!136)))))

(declare-fun d!91011 () Bool)

(declare-fun res!416793 () Bool)

(assert (=> d!91011 (=> res!416793 e!368622)))

(assert (=> d!91011 (= res!416793 (bvsge j!136 (size!18781 lt!297917)))))

(assert (=> d!91011 (= (arrayNoDuplicates!0 lt!297917 j!136 Nil!12455) e!368622)))

(declare-fun b!643523 () Bool)

(assert (=> b!643523 (= e!368623 call!33600)))

(declare-fun bm!33597 () Bool)

(assert (=> bm!33597 (= call!33600 (arrayNoDuplicates!0 lt!297917 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73731 (Cons!12454 (select (arr!18417 lt!297917) j!136) Nil!12455) Nil!12455)))))

(assert (= (and d!91011 (not res!416793)) b!643521))

(assert (= (and b!643521 res!416791) b!643522))

(assert (= (and b!643521 res!416792) b!643519))

(assert (= (and b!643519 c!73731) b!643523))

(assert (= (and b!643519 (not c!73731)) b!643520))

(assert (= (or b!643523 b!643520) bm!33597))

(declare-fun m!617269 () Bool)

(assert (=> b!643519 m!617269))

(assert (=> b!643519 m!617269))

(declare-fun m!617271 () Bool)

(assert (=> b!643519 m!617271))

(assert (=> b!643521 m!617269))

(assert (=> b!643521 m!617269))

(assert (=> b!643521 m!617271))

(assert (=> b!643522 m!617269))

(assert (=> b!643522 m!617269))

(declare-fun m!617273 () Bool)

(assert (=> b!643522 m!617273))

