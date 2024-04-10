; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58888 () Bool)

(assert start!58888)

(declare-fun b!649888 () Bool)

(declare-fun e!372789 () Bool)

(declare-fun e!372785 () Bool)

(assert (=> b!649888 (= e!372789 e!372785)))

(declare-fun res!421322 () Bool)

(assert (=> b!649888 (=> (not res!421322) (not e!372785))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38550 0))(
  ( (array!38551 (arr!18481 (Array (_ BitVec 32) (_ BitVec 64))) (size!18845 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38550)

(assert (=> b!649888 (= res!421322 (= (select (store (arr!18481 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!301898 () array!38550)

(assert (=> b!649888 (= lt!301898 (array!38551 (store (arr!18481 a!2986) i!1108 k0!1786) (size!18845 a!2986)))))

(declare-fun b!649889 () Bool)

(declare-fun e!372787 () Bool)

(assert (=> b!649889 (= e!372787 e!372789)))

(declare-fun res!421323 () Bool)

(assert (=> b!649889 (=> (not res!421323) (not e!372789))))

(declare-datatypes ((SeekEntryResult!6921 0))(
  ( (MissingZero!6921 (index!30031 (_ BitVec 32))) (Found!6921 (index!30032 (_ BitVec 32))) (Intermediate!6921 (undefined!7733 Bool) (index!30033 (_ BitVec 32)) (x!58814 (_ BitVec 32))) (Undefined!6921) (MissingVacant!6921 (index!30034 (_ BitVec 32))) )
))
(declare-fun lt!301896 () SeekEntryResult!6921)

(assert (=> b!649889 (= res!421323 (or (= lt!301896 (MissingZero!6921 i!1108)) (= lt!301896 (MissingVacant!6921 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38550 (_ BitVec 32)) SeekEntryResult!6921)

(assert (=> b!649889 (= lt!301896 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!649890 () Bool)

(declare-fun res!421325 () Bool)

(assert (=> b!649890 (=> (not res!421325) (not e!372787))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!649890 (= res!421325 (validKeyInArray!0 (select (arr!18481 a!2986) j!136)))))

(declare-fun b!649891 () Bool)

(declare-datatypes ((Unit!22152 0))(
  ( (Unit!22153) )
))
(declare-fun e!372794 () Unit!22152)

(declare-fun Unit!22154 () Unit!22152)

(assert (=> b!649891 (= e!372794 Unit!22154)))

(declare-fun b!649893 () Bool)

(declare-fun e!372786 () Bool)

(declare-fun lt!301891 () SeekEntryResult!6921)

(declare-fun lt!301892 () SeekEntryResult!6921)

(assert (=> b!649893 (= e!372786 (= lt!301891 lt!301892))))

(declare-fun b!649894 () Bool)

(declare-fun e!372798 () Bool)

(declare-fun e!372790 () Bool)

(assert (=> b!649894 (= e!372798 (not e!372790))))

(declare-fun res!421318 () Bool)

(assert (=> b!649894 (=> res!421318 e!372790)))

(declare-fun lt!301900 () SeekEntryResult!6921)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!649894 (= res!421318 (not (= lt!301900 (Found!6921 index!984))))))

(declare-fun lt!301889 () Unit!22152)

(assert (=> b!649894 (= lt!301889 e!372794)))

(declare-fun c!74656 () Bool)

(assert (=> b!649894 (= c!74656 (= lt!301900 Undefined!6921))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!301894 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38550 (_ BitVec 32)) SeekEntryResult!6921)

(assert (=> b!649894 (= lt!301900 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301894 lt!301898 mask!3053))))

(assert (=> b!649894 e!372786))

(declare-fun res!421316 () Bool)

(assert (=> b!649894 (=> (not res!421316) (not e!372786))))

(declare-fun lt!301903 () (_ BitVec 32))

(assert (=> b!649894 (= res!421316 (= lt!301892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 lt!301894 lt!301898 mask!3053)))))

(assert (=> b!649894 (= lt!301892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!649894 (= lt!301894 (select (store (arr!18481 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301901 () Unit!22152)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38550 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> b!649894 (= lt!301901 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!649894 (= lt!301903 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!649895 () Bool)

(declare-fun res!421313 () Bool)

(assert (=> b!649895 (=> (not res!421313) (not e!372787))))

(assert (=> b!649895 (= res!421313 (validKeyInArray!0 k0!1786))))

(declare-fun b!649896 () Bool)

(declare-fun res!421326 () Bool)

(assert (=> b!649896 (=> (not res!421326) (not e!372787))))

(declare-fun arrayContainsKey!0 (array!38550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!649896 (= res!421326 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!649897 () Bool)

(declare-fun res!421324 () Bool)

(assert (=> b!649897 (=> (not res!421324) (not e!372789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38550 (_ BitVec 32)) Bool)

(assert (=> b!649897 (= res!421324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!649898 () Bool)

(declare-fun res!421310 () Bool)

(assert (=> b!649898 (=> (not res!421310) (not e!372787))))

(assert (=> b!649898 (= res!421310 (and (= (size!18845 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18845 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18845 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!649899 () Bool)

(declare-fun e!372784 () Bool)

(assert (=> b!649899 (= e!372790 e!372784)))

(declare-fun res!421327 () Bool)

(assert (=> b!649899 (=> res!421327 e!372784)))

(declare-fun lt!301888 () (_ BitVec 64))

(assert (=> b!649899 (= res!421327 (or (not (= (select (arr!18481 a!2986) j!136) lt!301894)) (not (= (select (arr!18481 a!2986) j!136) lt!301888))))))

(declare-fun e!372792 () Bool)

(assert (=> b!649899 e!372792))

(declare-fun res!421311 () Bool)

(assert (=> b!649899 (=> (not res!421311) (not e!372792))))

(assert (=> b!649899 (= res!421311 (= lt!301888 (select (arr!18481 a!2986) j!136)))))

(assert (=> b!649899 (= lt!301888 (select (store (arr!18481 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!649900 () Bool)

(declare-fun e!372788 () Unit!22152)

(declare-fun Unit!22155 () Unit!22152)

(assert (=> b!649900 (= e!372788 Unit!22155)))

(declare-fun b!649901 () Bool)

(declare-fun e!372795 () Bool)

(assert (=> b!649901 (= e!372795 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!649902 () Bool)

(assert (=> b!649902 (= e!372785 e!372798)))

(declare-fun res!421315 () Bool)

(assert (=> b!649902 (=> (not res!421315) (not e!372798))))

(assert (=> b!649902 (= res!421315 (and (= lt!301891 (Found!6921 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18481 a!2986) index!984) (select (arr!18481 a!2986) j!136))) (not (= (select (arr!18481 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!649902 (= lt!301891 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!649903 () Bool)

(declare-fun Unit!22156 () Unit!22152)

(assert (=> b!649903 (= e!372794 Unit!22156)))

(assert (=> b!649903 false))

(declare-fun b!649904 () Bool)

(declare-fun Unit!22157 () Unit!22152)

(assert (=> b!649904 (= e!372788 Unit!22157)))

(declare-fun lt!301897 () Unit!22152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> b!649904 (= lt!301897 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301898 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!649904 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301895 () Unit!22152)

(declare-datatypes ((List!12522 0))(
  ( (Nil!12519) (Cons!12518 (h!13563 (_ BitVec 64)) (t!18750 List!12522)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12522) Unit!22152)

(assert (=> b!649904 (= lt!301895 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(declare-fun arrayNoDuplicates!0 (array!38550 (_ BitVec 32) List!12522) Bool)

(assert (=> b!649904 (arrayNoDuplicates!0 lt!301898 #b00000000000000000000000000000000 Nil!12519)))

(declare-fun lt!301899 () Unit!22152)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38550 (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> b!649904 (= lt!301899 (lemmaNoDuplicateFromThenFromBigger!0 lt!301898 #b00000000000000000000000000000000 j!136))))

(assert (=> b!649904 (arrayNoDuplicates!0 lt!301898 j!136 Nil!12519)))

(declare-fun lt!301902 () Unit!22152)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38550 (_ BitVec 64) (_ BitVec 32) List!12522) Unit!22152)

(assert (=> b!649904 (= lt!301902 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136 Nil!12519))))

(assert (=> b!649904 false))

(declare-fun b!649905 () Bool)

(declare-fun res!421317 () Bool)

(assert (=> b!649905 (=> (not res!421317) (not e!372789))))

(assert (=> b!649905 (= res!421317 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18481 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!649906 () Bool)

(declare-fun res!421328 () Bool)

(assert (=> b!649906 (=> (not res!421328) (not e!372789))))

(assert (=> b!649906 (= res!421328 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12519))))

(declare-fun b!649892 () Bool)

(declare-fun e!372796 () Bool)

(assert (=> b!649892 (= e!372796 (bvslt (size!18845 a!2986) #b01111111111111111111111111111111))))

(assert (=> b!649892 (arrayNoDuplicates!0 lt!301898 #b00000000000000000000000000000000 Nil!12519)))

(declare-fun lt!301893 () Unit!22152)

(assert (=> b!649892 (= lt!301893 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(assert (=> b!649892 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301887 () Unit!22152)

(assert (=> b!649892 (= lt!301887 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372797 () Bool)

(assert (=> b!649892 e!372797))

(declare-fun res!421319 () Bool)

(assert (=> b!649892 (=> (not res!421319) (not e!372797))))

(assert (=> b!649892 (= res!421319 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun res!421314 () Bool)

(assert (=> start!58888 (=> (not res!421314) (not e!372787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58888 (= res!421314 (validMask!0 mask!3053))))

(assert (=> start!58888 e!372787))

(assert (=> start!58888 true))

(declare-fun array_inv!14277 (array!38550) Bool)

(assert (=> start!58888 (array_inv!14277 a!2986)))

(declare-fun b!649907 () Bool)

(declare-fun e!372793 () Bool)

(assert (=> b!649907 (= e!372793 e!372795)))

(declare-fun res!421320 () Bool)

(assert (=> b!649907 (=> (not res!421320) (not e!372795))))

(assert (=> b!649907 (= res!421320 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136))))

(declare-fun b!649908 () Bool)

(assert (=> b!649908 (= e!372792 e!372793)))

(declare-fun res!421321 () Bool)

(assert (=> b!649908 (=> res!421321 e!372793)))

(assert (=> b!649908 (= res!421321 (or (not (= (select (arr!18481 a!2986) j!136) lt!301894)) (not (= (select (arr!18481 a!2986) j!136) lt!301888)) (bvsge j!136 index!984)))))

(declare-fun b!649909 () Bool)

(assert (=> b!649909 (= e!372797 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) index!984))))

(declare-fun b!649910 () Bool)

(assert (=> b!649910 (= e!372784 e!372796)))

(declare-fun res!421312 () Bool)

(assert (=> b!649910 (=> res!421312 e!372796)))

(assert (=> b!649910 (= res!421312 (bvsge index!984 j!136))))

(declare-fun lt!301890 () Unit!22152)

(assert (=> b!649910 (= lt!301890 e!372788)))

(declare-fun c!74657 () Bool)

(assert (=> b!649910 (= c!74657 (bvslt j!136 index!984))))

(assert (= (and start!58888 res!421314) b!649898))

(assert (= (and b!649898 res!421310) b!649890))

(assert (= (and b!649890 res!421325) b!649895))

(assert (= (and b!649895 res!421313) b!649896))

(assert (= (and b!649896 res!421326) b!649889))

(assert (= (and b!649889 res!421323) b!649897))

(assert (= (and b!649897 res!421324) b!649906))

(assert (= (and b!649906 res!421328) b!649905))

(assert (= (and b!649905 res!421317) b!649888))

(assert (= (and b!649888 res!421322) b!649902))

(assert (= (and b!649902 res!421315) b!649894))

(assert (= (and b!649894 res!421316) b!649893))

(assert (= (and b!649894 c!74656) b!649903))

(assert (= (and b!649894 (not c!74656)) b!649891))

(assert (= (and b!649894 (not res!421318)) b!649899))

(assert (= (and b!649899 res!421311) b!649908))

(assert (= (and b!649908 (not res!421321)) b!649907))

(assert (= (and b!649907 res!421320) b!649901))

(assert (= (and b!649899 (not res!421327)) b!649910))

(assert (= (and b!649910 c!74657) b!649904))

(assert (= (and b!649910 (not c!74657)) b!649900))

(assert (= (and b!649910 (not res!421312)) b!649892))

(assert (= (and b!649892 res!421319) b!649909))

(declare-fun m!623109 () Bool)

(assert (=> b!649892 m!623109))

(declare-fun m!623111 () Bool)

(assert (=> b!649892 m!623111))

(declare-fun m!623113 () Bool)

(assert (=> b!649892 m!623113))

(assert (=> b!649892 m!623109))

(assert (=> b!649892 m!623109))

(declare-fun m!623115 () Bool)

(assert (=> b!649892 m!623115))

(declare-fun m!623117 () Bool)

(assert (=> b!649892 m!623117))

(assert (=> b!649892 m!623109))

(declare-fun m!623119 () Bool)

(assert (=> b!649892 m!623119))

(declare-fun m!623121 () Bool)

(assert (=> b!649897 m!623121))

(assert (=> b!649908 m!623109))

(declare-fun m!623123 () Bool)

(assert (=> b!649889 m!623123))

(declare-fun m!623125 () Bool)

(assert (=> b!649905 m!623125))

(declare-fun m!623127 () Bool)

(assert (=> b!649906 m!623127))

(assert (=> b!649907 m!623109))

(assert (=> b!649907 m!623109))

(assert (=> b!649907 m!623119))

(assert (=> b!649890 m!623109))

(assert (=> b!649890 m!623109))

(declare-fun m!623129 () Bool)

(assert (=> b!649890 m!623129))

(declare-fun m!623131 () Bool)

(assert (=> b!649894 m!623131))

(declare-fun m!623133 () Bool)

(assert (=> b!649894 m!623133))

(assert (=> b!649894 m!623109))

(declare-fun m!623135 () Bool)

(assert (=> b!649894 m!623135))

(assert (=> b!649894 m!623109))

(declare-fun m!623137 () Bool)

(assert (=> b!649894 m!623137))

(declare-fun m!623139 () Bool)

(assert (=> b!649894 m!623139))

(declare-fun m!623141 () Bool)

(assert (=> b!649894 m!623141))

(declare-fun m!623143 () Bool)

(assert (=> b!649894 m!623143))

(declare-fun m!623145 () Bool)

(assert (=> start!58888 m!623145))

(declare-fun m!623147 () Bool)

(assert (=> start!58888 m!623147))

(assert (=> b!649904 m!623109))

(declare-fun m!623149 () Bool)

(assert (=> b!649904 m!623149))

(assert (=> b!649904 m!623109))

(declare-fun m!623151 () Bool)

(assert (=> b!649904 m!623151))

(assert (=> b!649904 m!623117))

(assert (=> b!649904 m!623109))

(declare-fun m!623153 () Bool)

(assert (=> b!649904 m!623153))

(assert (=> b!649904 m!623109))

(declare-fun m!623155 () Bool)

(assert (=> b!649904 m!623155))

(declare-fun m!623157 () Bool)

(assert (=> b!649904 m!623157))

(assert (=> b!649904 m!623113))

(declare-fun m!623159 () Bool)

(assert (=> b!649902 m!623159))

(assert (=> b!649902 m!623109))

(assert (=> b!649902 m!623109))

(declare-fun m!623161 () Bool)

(assert (=> b!649902 m!623161))

(assert (=> b!649888 m!623137))

(declare-fun m!623163 () Bool)

(assert (=> b!649888 m!623163))

(assert (=> b!649901 m!623109))

(assert (=> b!649901 m!623109))

(declare-fun m!623165 () Bool)

(assert (=> b!649901 m!623165))

(declare-fun m!623167 () Bool)

(assert (=> b!649896 m!623167))

(declare-fun m!623169 () Bool)

(assert (=> b!649895 m!623169))

(assert (=> b!649899 m!623109))

(assert (=> b!649899 m!623137))

(declare-fun m!623171 () Bool)

(assert (=> b!649899 m!623171))

(assert (=> b!649909 m!623109))

(assert (=> b!649909 m!623109))

(assert (=> b!649909 m!623165))

(check-sat (not b!649902) (not start!58888) (not b!649909) (not b!649894) (not b!649889) (not b!649904) (not b!649895) (not b!649906) (not b!649892) (not b!649901) (not b!649907) (not b!649897) (not b!649896) (not b!649890))
(check-sat)
(get-model)

(declare-fun b!649990 () Bool)

(declare-fun e!372854 () Bool)

(declare-fun call!33731 () Bool)

(assert (=> b!649990 (= e!372854 call!33731)))

(declare-fun b!649991 () Bool)

(assert (=> b!649991 (= e!372854 call!33731)))

(declare-fun b!649992 () Bool)

(declare-fun e!372855 () Bool)

(declare-fun contains!3173 (List!12522 (_ BitVec 64)) Bool)

(assert (=> b!649992 (= e!372855 (contains!3173 Nil!12519 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33728 () Bool)

(declare-fun c!74666 () Bool)

(assert (=> bm!33728 (= call!33731 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74666 (Cons!12518 (select (arr!18481 a!2986) #b00000000000000000000000000000000) Nil!12519) Nil!12519)))))

(declare-fun d!91889 () Bool)

(declare-fun res!421393 () Bool)

(declare-fun e!372852 () Bool)

(assert (=> d!91889 (=> res!421393 e!372852)))

(assert (=> d!91889 (= res!421393 (bvsge #b00000000000000000000000000000000 (size!18845 a!2986)))))

(assert (=> d!91889 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12519) e!372852)))

(declare-fun b!649993 () Bool)

(declare-fun e!372853 () Bool)

(assert (=> b!649993 (= e!372853 e!372854)))

(assert (=> b!649993 (= c!74666 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!649994 () Bool)

(assert (=> b!649994 (= e!372852 e!372853)))

(declare-fun res!421394 () Bool)

(assert (=> b!649994 (=> (not res!421394) (not e!372853))))

(assert (=> b!649994 (= res!421394 (not e!372855))))

(declare-fun res!421392 () Bool)

(assert (=> b!649994 (=> (not res!421392) (not e!372855))))

(assert (=> b!649994 (= res!421392 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!91889 (not res!421393)) b!649994))

(assert (= (and b!649994 res!421392) b!649992))

(assert (= (and b!649994 res!421394) b!649993))

(assert (= (and b!649993 c!74666) b!649991))

(assert (= (and b!649993 (not c!74666)) b!649990))

(assert (= (or b!649991 b!649990) bm!33728))

(declare-fun m!623237 () Bool)

(assert (=> b!649992 m!623237))

(assert (=> b!649992 m!623237))

(declare-fun m!623239 () Bool)

(assert (=> b!649992 m!623239))

(assert (=> bm!33728 m!623237))

(declare-fun m!623241 () Bool)

(assert (=> bm!33728 m!623241))

(assert (=> b!649993 m!623237))

(assert (=> b!649993 m!623237))

(declare-fun m!623243 () Bool)

(assert (=> b!649993 m!623243))

(assert (=> b!649994 m!623237))

(assert (=> b!649994 m!623237))

(assert (=> b!649994 m!623243))

(assert (=> b!649906 d!91889))

(declare-fun d!91891 () Bool)

(assert (=> d!91891 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58888 d!91891))

(declare-fun d!91893 () Bool)

(assert (=> d!91893 (= (array_inv!14277 a!2986) (bvsge (size!18845 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58888 d!91893))

(declare-fun d!91895 () Bool)

(assert (=> d!91895 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649895 d!91895))

(declare-fun bm!33731 () Bool)

(declare-fun call!33734 () Bool)

(assert (=> bm!33731 (= call!33734 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!91897 () Bool)

(declare-fun res!421400 () Bool)

(declare-fun e!372864 () Bool)

(assert (=> d!91897 (=> res!421400 e!372864)))

(assert (=> d!91897 (= res!421400 (bvsge #b00000000000000000000000000000000 (size!18845 a!2986)))))

(assert (=> d!91897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!372864)))

(declare-fun b!650003 () Bool)

(declare-fun e!372863 () Bool)

(assert (=> b!650003 (= e!372864 e!372863)))

(declare-fun c!74669 () Bool)

(assert (=> b!650003 (= c!74669 (validKeyInArray!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!650004 () Bool)

(declare-fun e!372862 () Bool)

(assert (=> b!650004 (= e!372863 e!372862)))

(declare-fun lt!301961 () (_ BitVec 64))

(assert (=> b!650004 (= lt!301961 (select (arr!18481 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!301962 () Unit!22152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38550 (_ BitVec 64) (_ BitVec 32)) Unit!22152)

(assert (=> b!650004 (= lt!301962 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!301961 #b00000000000000000000000000000000))))

(assert (=> b!650004 (arrayContainsKey!0 a!2986 lt!301961 #b00000000000000000000000000000000)))

(declare-fun lt!301963 () Unit!22152)

(assert (=> b!650004 (= lt!301963 lt!301962)))

(declare-fun res!421399 () Bool)

(assert (=> b!650004 (= res!421399 (= (seekEntryOrOpen!0 (select (arr!18481 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6921 #b00000000000000000000000000000000)))))

(assert (=> b!650004 (=> (not res!421399) (not e!372862))))

(declare-fun b!650005 () Bool)

(assert (=> b!650005 (= e!372863 call!33734)))

(declare-fun b!650006 () Bool)

(assert (=> b!650006 (= e!372862 call!33734)))

(assert (= (and d!91897 (not res!421400)) b!650003))

(assert (= (and b!650003 c!74669) b!650004))

(assert (= (and b!650003 (not c!74669)) b!650005))

(assert (= (and b!650004 res!421399) b!650006))

(assert (= (or b!650006 b!650005) bm!33731))

(declare-fun m!623245 () Bool)

(assert (=> bm!33731 m!623245))

(assert (=> b!650003 m!623237))

(assert (=> b!650003 m!623237))

(assert (=> b!650003 m!623243))

(assert (=> b!650004 m!623237))

(declare-fun m!623247 () Bool)

(assert (=> b!650004 m!623247))

(declare-fun m!623249 () Bool)

(assert (=> b!650004 m!623249))

(assert (=> b!650004 m!623237))

(declare-fun m!623251 () Bool)

(assert (=> b!650004 m!623251))

(assert (=> b!649897 d!91897))

(declare-fun d!91899 () Bool)

(declare-fun res!421405 () Bool)

(declare-fun e!372869 () Bool)

(assert (=> d!91899 (=> res!421405 e!372869)))

(assert (=> d!91899 (= res!421405 (= (select (arr!18481 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91899 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!372869)))

(declare-fun b!650011 () Bool)

(declare-fun e!372870 () Bool)

(assert (=> b!650011 (= e!372869 e!372870)))

(declare-fun res!421406 () Bool)

(assert (=> b!650011 (=> (not res!421406) (not e!372870))))

(assert (=> b!650011 (= res!421406 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18845 a!2986)))))

(declare-fun b!650012 () Bool)

(assert (=> b!650012 (= e!372870 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91899 (not res!421405)) b!650011))

(assert (= (and b!650011 res!421406) b!650012))

(assert (=> d!91899 m!623237))

(declare-fun m!623253 () Bool)

(assert (=> b!650012 m!623253))

(assert (=> b!649896 d!91899))

(declare-fun d!91901 () Bool)

(declare-fun res!421407 () Bool)

(declare-fun e!372871 () Bool)

(assert (=> d!91901 (=> res!421407 e!372871)))

(assert (=> d!91901 (= res!421407 (= (select (arr!18481 lt!301898) j!136) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91901 (= (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136) e!372871)))

(declare-fun b!650013 () Bool)

(declare-fun e!372872 () Bool)

(assert (=> b!650013 (= e!372871 e!372872)))

(declare-fun res!421408 () Bool)

(assert (=> b!650013 (=> (not res!421408) (not e!372872))))

(assert (=> b!650013 (= res!421408 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18845 lt!301898)))))

(declare-fun b!650014 () Bool)

(assert (=> b!650014 (= e!372872 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91901 (not res!421407)) b!650013))

(assert (= (and b!650013 res!421408) b!650014))

(declare-fun m!623255 () Bool)

(assert (=> d!91901 m!623255))

(assert (=> b!650014 m!623109))

(declare-fun m!623257 () Bool)

(assert (=> b!650014 m!623257))

(assert (=> b!649907 d!91901))

(assert (=> b!649892 d!91901))

(declare-fun b!650015 () Bool)

(declare-fun e!372875 () Bool)

(declare-fun call!33735 () Bool)

(assert (=> b!650015 (= e!372875 call!33735)))

(declare-fun b!650016 () Bool)

(assert (=> b!650016 (= e!372875 call!33735)))

(declare-fun b!650017 () Bool)

(declare-fun e!372876 () Bool)

(assert (=> b!650017 (= e!372876 (contains!3173 Nil!12519 (select (arr!18481 lt!301898) #b00000000000000000000000000000000)))))

(declare-fun bm!33732 () Bool)

(declare-fun c!74670 () Bool)

(assert (=> bm!33732 (= call!33735 (arrayNoDuplicates!0 lt!301898 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!74670 (Cons!12518 (select (arr!18481 lt!301898) #b00000000000000000000000000000000) Nil!12519) Nil!12519)))))

(declare-fun d!91903 () Bool)

(declare-fun res!421410 () Bool)

(declare-fun e!372873 () Bool)

(assert (=> d!91903 (=> res!421410 e!372873)))

(assert (=> d!91903 (= res!421410 (bvsge #b00000000000000000000000000000000 (size!18845 lt!301898)))))

(assert (=> d!91903 (= (arrayNoDuplicates!0 lt!301898 #b00000000000000000000000000000000 Nil!12519) e!372873)))

(declare-fun b!650018 () Bool)

(declare-fun e!372874 () Bool)

(assert (=> b!650018 (= e!372874 e!372875)))

(assert (=> b!650018 (= c!74670 (validKeyInArray!0 (select (arr!18481 lt!301898) #b00000000000000000000000000000000)))))

(declare-fun b!650019 () Bool)

(assert (=> b!650019 (= e!372873 e!372874)))

(declare-fun res!421411 () Bool)

(assert (=> b!650019 (=> (not res!421411) (not e!372874))))

(assert (=> b!650019 (= res!421411 (not e!372876))))

(declare-fun res!421409 () Bool)

(assert (=> b!650019 (=> (not res!421409) (not e!372876))))

(assert (=> b!650019 (= res!421409 (validKeyInArray!0 (select (arr!18481 lt!301898) #b00000000000000000000000000000000)))))

(assert (= (and d!91903 (not res!421410)) b!650019))

(assert (= (and b!650019 res!421409) b!650017))

(assert (= (and b!650019 res!421411) b!650018))

(assert (= (and b!650018 c!74670) b!650016))

(assert (= (and b!650018 (not c!74670)) b!650015))

(assert (= (or b!650016 b!650015) bm!33732))

(declare-fun m!623259 () Bool)

(assert (=> b!650017 m!623259))

(assert (=> b!650017 m!623259))

(declare-fun m!623261 () Bool)

(assert (=> b!650017 m!623261))

(assert (=> bm!33732 m!623259))

(declare-fun m!623263 () Bool)

(assert (=> bm!33732 m!623263))

(assert (=> b!650018 m!623259))

(assert (=> b!650018 m!623259))

(declare-fun m!623265 () Bool)

(assert (=> b!650018 m!623265))

(assert (=> b!650019 m!623259))

(assert (=> b!650019 m!623259))

(assert (=> b!650019 m!623265))

(assert (=> b!649892 d!91903))

(declare-fun d!91905 () Bool)

(declare-fun res!421412 () Bool)

(declare-fun e!372877 () Bool)

(assert (=> d!91905 (=> res!421412 e!372877)))

(assert (=> d!91905 (= res!421412 (= (select (arr!18481 lt!301898) (bvadd #b00000000000000000000000000000001 index!984)) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91905 (= (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984)) e!372877)))

(declare-fun b!650020 () Bool)

(declare-fun e!372878 () Bool)

(assert (=> b!650020 (= e!372877 e!372878)))

(declare-fun res!421413 () Bool)

(assert (=> b!650020 (=> (not res!421413) (not e!372878))))

(assert (=> b!650020 (= res!421413 (bvslt (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001) (size!18845 lt!301898)))))

(declare-fun b!650021 () Bool)

(assert (=> b!650021 (= e!372878 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91905 (not res!421412)) b!650020))

(assert (= (and b!650020 res!421413) b!650021))

(declare-fun m!623267 () Bool)

(assert (=> d!91905 m!623267))

(assert (=> b!650021 m!623109))

(declare-fun m!623269 () Bool)

(assert (=> b!650021 m!623269))

(assert (=> b!649892 d!91905))

(declare-fun d!91909 () Bool)

(assert (=> d!91909 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!301966 () Unit!22152)

(declare-fun choose!114 (array!38550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> d!91909 (= lt!301966 (choose!114 lt!301898 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> d!91909 (bvsge j!136 #b00000000000000000000000000000000)))

(assert (=> d!91909 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)) lt!301966)))

(declare-fun bs!19390 () Bool)

(assert (= bs!19390 d!91909))

(assert (=> bs!19390 m!623109))

(assert (=> bs!19390 m!623115))

(assert (=> bs!19390 m!623109))

(declare-fun m!623271 () Bool)

(assert (=> bs!19390 m!623271))

(assert (=> b!649892 d!91909))

(declare-fun d!91911 () Bool)

(declare-fun e!372893 () Bool)

(assert (=> d!91911 e!372893))

(declare-fun res!421425 () Bool)

(assert (=> d!91911 (=> (not res!421425) (not e!372893))))

(assert (=> d!91911 (= res!421425 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18845 a!2986))))))

(declare-fun lt!301969 () Unit!22152)

(declare-fun choose!41 (array!38550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12522) Unit!22152)

(assert (=> d!91911 (= lt!301969 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519))))

(assert (=> d!91911 (bvslt (size!18845 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!91911 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12519) lt!301969)))

(declare-fun b!650039 () Bool)

(assert (=> b!650039 (= e!372893 (arrayNoDuplicates!0 (array!38551 (store (arr!18481 a!2986) i!1108 k0!1786) (size!18845 a!2986)) #b00000000000000000000000000000000 Nil!12519))))

(assert (= (and d!91911 res!421425) b!650039))

(declare-fun m!623281 () Bool)

(assert (=> d!91911 m!623281))

(assert (=> b!650039 m!623137))

(declare-fun m!623283 () Bool)

(assert (=> b!650039 m!623283))

(assert (=> b!649892 d!91911))

(declare-fun d!91915 () Bool)

(declare-fun lt!301981 () SeekEntryResult!6921)

(get-info :version)

(assert (=> d!91915 (and (or ((_ is Undefined!6921) lt!301981) (not ((_ is Found!6921) lt!301981)) (and (bvsge (index!30032 lt!301981) #b00000000000000000000000000000000) (bvslt (index!30032 lt!301981) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!301981) ((_ is Found!6921) lt!301981) (not ((_ is MissingVacant!6921) lt!301981)) (not (= (index!30034 lt!301981) vacantSpotIndex!68)) (and (bvsge (index!30034 lt!301981) #b00000000000000000000000000000000) (bvslt (index!30034 lt!301981) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!301981) (ite ((_ is Found!6921) lt!301981) (= (select (arr!18481 a!2986) (index!30032 lt!301981)) (select (arr!18481 a!2986) j!136)) (and ((_ is MissingVacant!6921) lt!301981) (= (index!30034 lt!301981) vacantSpotIndex!68) (= (select (arr!18481 a!2986) (index!30034 lt!301981)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372918 () SeekEntryResult!6921)

(assert (=> d!91915 (= lt!301981 e!372918)))

(declare-fun c!74681 () Bool)

(assert (=> d!91915 (= c!74681 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!301980 () (_ BitVec 64))

(assert (=> d!91915 (= lt!301980 (select (arr!18481 a!2986) lt!301903))))

(assert (=> d!91915 (validMask!0 mask!3053)))

(assert (=> d!91915 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) lt!301981)))

(declare-fun b!650069 () Bool)

(declare-fun e!372919 () SeekEntryResult!6921)

(assert (=> b!650069 (= e!372919 (MissingVacant!6921 vacantSpotIndex!68))))

(declare-fun b!650070 () Bool)

(declare-fun e!372917 () SeekEntryResult!6921)

(assert (=> b!650070 (= e!372917 (Found!6921 lt!301903))))

(declare-fun b!650071 () Bool)

(declare-fun c!74682 () Bool)

(assert (=> b!650071 (= c!74682 (= lt!301980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650071 (= e!372917 e!372919)))

(declare-fun b!650072 () Bool)

(assert (=> b!650072 (= e!372919 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301903 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650073 () Bool)

(assert (=> b!650073 (= e!372918 Undefined!6921)))

(declare-fun b!650074 () Bool)

(assert (=> b!650074 (= e!372918 e!372917)))

(declare-fun c!74680 () Bool)

(assert (=> b!650074 (= c!74680 (= lt!301980 (select (arr!18481 a!2986) j!136)))))

(assert (= (and d!91915 c!74681) b!650073))

(assert (= (and d!91915 (not c!74681)) b!650074))

(assert (= (and b!650074 c!74680) b!650070))

(assert (= (and b!650074 (not c!74680)) b!650071))

(assert (= (and b!650071 c!74682) b!650069))

(assert (= (and b!650071 (not c!74682)) b!650072))

(declare-fun m!623303 () Bool)

(assert (=> d!91915 m!623303))

(declare-fun m!623305 () Bool)

(assert (=> d!91915 m!623305))

(declare-fun m!623307 () Bool)

(assert (=> d!91915 m!623307))

(assert (=> d!91915 m!623145))

(declare-fun m!623309 () Bool)

(assert (=> b!650072 m!623309))

(assert (=> b!650072 m!623309))

(assert (=> b!650072 m!623109))

(declare-fun m!623311 () Bool)

(assert (=> b!650072 m!623311))

(assert (=> b!649894 d!91915))

(declare-fun d!91931 () Bool)

(declare-fun lt!301984 () (_ BitVec 32))

(assert (=> d!91931 (and (bvsge lt!301984 #b00000000000000000000000000000000) (bvslt lt!301984 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91931 (= lt!301984 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!91931 (validMask!0 mask!3053)))

(assert (=> d!91931 (= (nextIndex!0 index!984 x!910 mask!3053) lt!301984)))

(declare-fun bs!19392 () Bool)

(assert (= bs!19392 d!91931))

(declare-fun m!623313 () Bool)

(assert (=> bs!19392 m!623313))

(assert (=> bs!19392 m!623145))

(assert (=> b!649894 d!91931))

(declare-fun d!91933 () Bool)

(declare-fun lt!301986 () SeekEntryResult!6921)

(assert (=> d!91933 (and (or ((_ is Undefined!6921) lt!301986) (not ((_ is Found!6921) lt!301986)) (and (bvsge (index!30032 lt!301986) #b00000000000000000000000000000000) (bvslt (index!30032 lt!301986) (size!18845 lt!301898)))) (or ((_ is Undefined!6921) lt!301986) ((_ is Found!6921) lt!301986) (not ((_ is MissingVacant!6921) lt!301986)) (not (= (index!30034 lt!301986) vacantSpotIndex!68)) (and (bvsge (index!30034 lt!301986) #b00000000000000000000000000000000) (bvslt (index!30034 lt!301986) (size!18845 lt!301898)))) (or ((_ is Undefined!6921) lt!301986) (ite ((_ is Found!6921) lt!301986) (= (select (arr!18481 lt!301898) (index!30032 lt!301986)) lt!301894) (and ((_ is MissingVacant!6921) lt!301986) (= (index!30034 lt!301986) vacantSpotIndex!68) (= (select (arr!18481 lt!301898) (index!30034 lt!301986)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372929 () SeekEntryResult!6921)

(assert (=> d!91933 (= lt!301986 e!372929)))

(declare-fun c!74686 () Bool)

(assert (=> d!91933 (= c!74686 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!301985 () (_ BitVec 64))

(assert (=> d!91933 (= lt!301985 (select (arr!18481 lt!301898) index!984))))

(assert (=> d!91933 (validMask!0 mask!3053)))

(assert (=> d!91933 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301894 lt!301898 mask!3053) lt!301986)))

(declare-fun b!650085 () Bool)

(declare-fun e!372930 () SeekEntryResult!6921)

(assert (=> b!650085 (= e!372930 (MissingVacant!6921 vacantSpotIndex!68))))

(declare-fun b!650086 () Bool)

(declare-fun e!372928 () SeekEntryResult!6921)

(assert (=> b!650086 (= e!372928 (Found!6921 index!984))))

(declare-fun b!650087 () Bool)

(declare-fun c!74687 () Bool)

(assert (=> b!650087 (= c!74687 (= lt!301985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650087 (= e!372928 e!372930)))

(declare-fun b!650088 () Bool)

(assert (=> b!650088 (= e!372930 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!301894 lt!301898 mask!3053))))

(declare-fun b!650089 () Bool)

(assert (=> b!650089 (= e!372929 Undefined!6921)))

(declare-fun b!650090 () Bool)

(assert (=> b!650090 (= e!372929 e!372928)))

(declare-fun c!74685 () Bool)

(assert (=> b!650090 (= c!74685 (= lt!301985 lt!301894))))

(assert (= (and d!91933 c!74686) b!650089))

(assert (= (and d!91933 (not c!74686)) b!650090))

(assert (= (and b!650090 c!74685) b!650086))

(assert (= (and b!650090 (not c!74685)) b!650087))

(assert (= (and b!650087 c!74687) b!650085))

(assert (= (and b!650087 (not c!74687)) b!650088))

(declare-fun m!623315 () Bool)

(assert (=> d!91933 m!623315))

(declare-fun m!623317 () Bool)

(assert (=> d!91933 m!623317))

(declare-fun m!623319 () Bool)

(assert (=> d!91933 m!623319))

(assert (=> d!91933 m!623145))

(assert (=> b!650088 m!623131))

(assert (=> b!650088 m!623131))

(declare-fun m!623321 () Bool)

(assert (=> b!650088 m!623321))

(assert (=> b!649894 d!91933))

(declare-fun d!91935 () Bool)

(declare-fun e!372953 () Bool)

(assert (=> d!91935 e!372953))

(declare-fun res!421461 () Bool)

(assert (=> d!91935 (=> (not res!421461) (not e!372953))))

(assert (=> d!91935 (= res!421461 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18845 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18845 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18845 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18845 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18845 a!2986))))))

(declare-fun lt!302004 () Unit!22152)

(declare-fun choose!9 (array!38550 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> d!91935 (= lt!302004 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 mask!3053))))

(assert (=> d!91935 (validMask!0 mask!3053)))

(assert (=> d!91935 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 mask!3053) lt!302004)))

(declare-fun b!650123 () Bool)

(assert (=> b!650123 (= e!372953 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 (select (store (arr!18481 a!2986) i!1108 k0!1786) j!136) (array!38551 (store (arr!18481 a!2986) i!1108 k0!1786) (size!18845 a!2986)) mask!3053)))))

(assert (= (and d!91935 res!421461) b!650123))

(declare-fun m!623359 () Bool)

(assert (=> d!91935 m!623359))

(assert (=> d!91935 m!623145))

(assert (=> b!650123 m!623109))

(assert (=> b!650123 m!623133))

(assert (=> b!650123 m!623109))

(assert (=> b!650123 m!623135))

(assert (=> b!650123 m!623133))

(declare-fun m!623361 () Bool)

(assert (=> b!650123 m!623361))

(assert (=> b!650123 m!623137))

(assert (=> b!649894 d!91935))

(declare-fun d!91949 () Bool)

(declare-fun lt!302012 () SeekEntryResult!6921)

(assert (=> d!91949 (and (or ((_ is Undefined!6921) lt!302012) (not ((_ is Found!6921) lt!302012)) (and (bvsge (index!30032 lt!302012) #b00000000000000000000000000000000) (bvslt (index!30032 lt!302012) (size!18845 lt!301898)))) (or ((_ is Undefined!6921) lt!302012) ((_ is Found!6921) lt!302012) (not ((_ is MissingVacant!6921) lt!302012)) (not (= (index!30034 lt!302012) vacantSpotIndex!68)) (and (bvsge (index!30034 lt!302012) #b00000000000000000000000000000000) (bvslt (index!30034 lt!302012) (size!18845 lt!301898)))) (or ((_ is Undefined!6921) lt!302012) (ite ((_ is Found!6921) lt!302012) (= (select (arr!18481 lt!301898) (index!30032 lt!302012)) lt!301894) (and ((_ is MissingVacant!6921) lt!302012) (= (index!30034 lt!302012) vacantSpotIndex!68) (= (select (arr!18481 lt!301898) (index!30034 lt!302012)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372961 () SeekEntryResult!6921)

(assert (=> d!91949 (= lt!302012 e!372961)))

(declare-fun c!74701 () Bool)

(assert (=> d!91949 (= c!74701 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!302011 () (_ BitVec 64))

(assert (=> d!91949 (= lt!302011 (select (arr!18481 lt!301898) lt!301903))))

(assert (=> d!91949 (validMask!0 mask!3053)))

(assert (=> d!91949 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301903 vacantSpotIndex!68 lt!301894 lt!301898 mask!3053) lt!302012)))

(declare-fun b!650130 () Bool)

(declare-fun e!372962 () SeekEntryResult!6921)

(assert (=> b!650130 (= e!372962 (MissingVacant!6921 vacantSpotIndex!68))))

(declare-fun b!650131 () Bool)

(declare-fun e!372958 () SeekEntryResult!6921)

(assert (=> b!650131 (= e!372958 (Found!6921 lt!301903))))

(declare-fun b!650132 () Bool)

(declare-fun c!74702 () Bool)

(assert (=> b!650132 (= c!74702 (= lt!302011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650132 (= e!372958 e!372962)))

(declare-fun b!650133 () Bool)

(assert (=> b!650133 (= e!372962 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!301903 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!301894 lt!301898 mask!3053))))

(declare-fun b!650134 () Bool)

(assert (=> b!650134 (= e!372961 Undefined!6921)))

(declare-fun b!650135 () Bool)

(assert (=> b!650135 (= e!372961 e!372958)))

(declare-fun c!74700 () Bool)

(assert (=> b!650135 (= c!74700 (= lt!302011 lt!301894))))

(assert (= (and d!91949 c!74701) b!650134))

(assert (= (and d!91949 (not c!74701)) b!650135))

(assert (= (and b!650135 c!74700) b!650131))

(assert (= (and b!650135 (not c!74700)) b!650132))

(assert (= (and b!650132 c!74702) b!650130))

(assert (= (and b!650132 (not c!74702)) b!650133))

(declare-fun m!623363 () Bool)

(assert (=> d!91949 m!623363))

(declare-fun m!623365 () Bool)

(assert (=> d!91949 m!623365))

(declare-fun m!623367 () Bool)

(assert (=> d!91949 m!623367))

(assert (=> d!91949 m!623145))

(assert (=> b!650133 m!623309))

(assert (=> b!650133 m!623309))

(declare-fun m!623369 () Bool)

(assert (=> b!650133 m!623369))

(assert (=> b!649894 d!91949))

(declare-fun d!91951 () Bool)

(assert (=> d!91951 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!302013 () Unit!22152)

(assert (=> d!91951 (= lt!302013 (choose!114 lt!301898 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!91951 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!91951 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301898 (select (arr!18481 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!302013)))

(declare-fun bs!19394 () Bool)

(assert (= bs!19394 d!91951))

(assert (=> bs!19394 m!623109))

(assert (=> bs!19394 m!623149))

(assert (=> bs!19394 m!623109))

(declare-fun m!623371 () Bool)

(assert (=> bs!19394 m!623371))

(assert (=> b!649904 d!91951))

(declare-fun d!91953 () Bool)

(declare-fun res!421466 () Bool)

(declare-fun e!372963 () Bool)

(assert (=> d!91953 (=> res!421466 e!372963)))

(assert (=> d!91953 (= res!421466 (= (select (arr!18481 lt!301898) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91953 (= (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!372963)))

(declare-fun b!650138 () Bool)

(declare-fun e!372964 () Bool)

(assert (=> b!650138 (= e!372963 e!372964)))

(declare-fun res!421467 () Bool)

(assert (=> b!650138 (=> (not res!421467) (not e!372964))))

(assert (=> b!650138 (= res!421467 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18845 lt!301898)))))

(declare-fun b!650139 () Bool)

(assert (=> b!650139 (= e!372964 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!91953 (not res!421466)) b!650138))

(assert (= (and b!650138 res!421467) b!650139))

(declare-fun m!623373 () Bool)

(assert (=> d!91953 m!623373))

(assert (=> b!650139 m!623109))

(declare-fun m!623375 () Bool)

(assert (=> b!650139 m!623375))

(assert (=> b!649904 d!91953))

(assert (=> b!649904 d!91903))

(declare-fun d!91955 () Bool)

(assert (=> d!91955 (arrayNoDuplicates!0 lt!301898 j!136 Nil!12519)))

(declare-fun lt!302019 () Unit!22152)

(declare-fun choose!39 (array!38550 (_ BitVec 32) (_ BitVec 32)) Unit!22152)

(assert (=> d!91955 (= lt!302019 (choose!39 lt!301898 #b00000000000000000000000000000000 j!136))))

(assert (=> d!91955 (bvslt (size!18845 lt!301898) #b01111111111111111111111111111111)))

(assert (=> d!91955 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!301898 #b00000000000000000000000000000000 j!136) lt!302019)))

(declare-fun bs!19395 () Bool)

(assert (= bs!19395 d!91955))

(assert (=> bs!19395 m!623151))

(declare-fun m!623389 () Bool)

(assert (=> bs!19395 m!623389))

(assert (=> b!649904 d!91955))

(declare-fun b!650144 () Bool)

(declare-fun e!372970 () Bool)

(declare-fun call!33745 () Bool)

(assert (=> b!650144 (= e!372970 call!33745)))

(declare-fun b!650145 () Bool)

(assert (=> b!650145 (= e!372970 call!33745)))

(declare-fun b!650146 () Bool)

(declare-fun e!372971 () Bool)

(assert (=> b!650146 (= e!372971 (contains!3173 Nil!12519 (select (arr!18481 lt!301898) j!136)))))

(declare-fun c!74704 () Bool)

(declare-fun bm!33742 () Bool)

(assert (=> bm!33742 (= call!33745 (arrayNoDuplicates!0 lt!301898 (bvadd j!136 #b00000000000000000000000000000001) (ite c!74704 (Cons!12518 (select (arr!18481 lt!301898) j!136) Nil!12519) Nil!12519)))))

(declare-fun d!91959 () Bool)

(declare-fun res!421471 () Bool)

(declare-fun e!372968 () Bool)

(assert (=> d!91959 (=> res!421471 e!372968)))

(assert (=> d!91959 (= res!421471 (bvsge j!136 (size!18845 lt!301898)))))

(assert (=> d!91959 (= (arrayNoDuplicates!0 lt!301898 j!136 Nil!12519) e!372968)))

(declare-fun b!650147 () Bool)

(declare-fun e!372969 () Bool)

(assert (=> b!650147 (= e!372969 e!372970)))

(assert (=> b!650147 (= c!74704 (validKeyInArray!0 (select (arr!18481 lt!301898) j!136)))))

(declare-fun b!650148 () Bool)

(assert (=> b!650148 (= e!372968 e!372969)))

(declare-fun res!421472 () Bool)

(assert (=> b!650148 (=> (not res!421472) (not e!372969))))

(assert (=> b!650148 (= res!421472 (not e!372971))))

(declare-fun res!421470 () Bool)

(assert (=> b!650148 (=> (not res!421470) (not e!372971))))

(assert (=> b!650148 (= res!421470 (validKeyInArray!0 (select (arr!18481 lt!301898) j!136)))))

(assert (= (and d!91959 (not res!421471)) b!650148))

(assert (= (and b!650148 res!421470) b!650146))

(assert (= (and b!650148 res!421472) b!650147))

(assert (= (and b!650147 c!74704) b!650145))

(assert (= (and b!650147 (not c!74704)) b!650144))

(assert (= (or b!650145 b!650144) bm!33742))

(assert (=> b!650146 m!623255))

(assert (=> b!650146 m!623255))

(declare-fun m!623393 () Bool)

(assert (=> b!650146 m!623393))

(assert (=> bm!33742 m!623255))

(declare-fun m!623395 () Bool)

(assert (=> bm!33742 m!623395))

(assert (=> b!650147 m!623255))

(assert (=> b!650147 m!623255))

(declare-fun m!623397 () Bool)

(assert (=> b!650147 m!623397))

(assert (=> b!650148 m!623255))

(assert (=> b!650148 m!623255))

(assert (=> b!650148 m!623397))

(assert (=> b!649904 d!91959))

(declare-fun d!91965 () Bool)

(assert (=> d!91965 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18845 lt!301898)) (not (= (select (arr!18481 lt!301898) j!136) (select (arr!18481 a!2986) j!136))))))

(declare-fun lt!302026 () Unit!22152)

(declare-fun choose!21 (array!38550 (_ BitVec 64) (_ BitVec 32) List!12522) Unit!22152)

(assert (=> d!91965 (= lt!302026 (choose!21 lt!301898 (select (arr!18481 a!2986) j!136) j!136 Nil!12519))))

(assert (=> d!91965 (bvslt (size!18845 lt!301898) #b01111111111111111111111111111111)))

(assert (=> d!91965 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301898 (select (arr!18481 a!2986) j!136) j!136 Nil!12519) lt!302026)))

(declare-fun bs!19396 () Bool)

(assert (= bs!19396 d!91965))

(assert (=> bs!19396 m!623255))

(assert (=> bs!19396 m!623109))

(declare-fun m!623399 () Bool)

(assert (=> bs!19396 m!623399))

(assert (=> b!649904 d!91965))

(assert (=> b!649904 d!91911))

(declare-fun d!91967 () Bool)

(assert (=> d!91967 (= (validKeyInArray!0 (select (arr!18481 a!2986) j!136)) (and (not (= (select (arr!18481 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18481 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!649890 d!91967))

(declare-fun d!91969 () Bool)

(declare-fun res!421475 () Bool)

(declare-fun e!372983 () Bool)

(assert (=> d!91969 (=> res!421475 e!372983)))

(assert (=> d!91969 (= res!421475 (= (select (arr!18481 lt!301898) index!984) (select (arr!18481 a!2986) j!136)))))

(assert (=> d!91969 (= (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) index!984) e!372983)))

(declare-fun b!650169 () Bool)

(declare-fun e!372984 () Bool)

(assert (=> b!650169 (= e!372983 e!372984)))

(declare-fun res!421476 () Bool)

(assert (=> b!650169 (=> (not res!421476) (not e!372984))))

(assert (=> b!650169 (= res!421476 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18845 lt!301898)))))

(declare-fun b!650170 () Bool)

(assert (=> b!650170 (= e!372984 (arrayContainsKey!0 lt!301898 (select (arr!18481 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91969 (not res!421475)) b!650169))

(assert (= (and b!650169 res!421476) b!650170))

(assert (=> d!91969 m!623319))

(assert (=> b!650170 m!623109))

(declare-fun m!623401 () Bool)

(assert (=> b!650170 m!623401))

(assert (=> b!649901 d!91969))

(declare-fun lt!302030 () SeekEntryResult!6921)

(declare-fun d!91971 () Bool)

(assert (=> d!91971 (and (or ((_ is Undefined!6921) lt!302030) (not ((_ is Found!6921) lt!302030)) (and (bvsge (index!30032 lt!302030) #b00000000000000000000000000000000) (bvslt (index!30032 lt!302030) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!302030) ((_ is Found!6921) lt!302030) (not ((_ is MissingVacant!6921) lt!302030)) (not (= (index!30034 lt!302030) vacantSpotIndex!68)) (and (bvsge (index!30034 lt!302030) #b00000000000000000000000000000000) (bvslt (index!30034 lt!302030) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!302030) (ite ((_ is Found!6921) lt!302030) (= (select (arr!18481 a!2986) (index!30032 lt!302030)) (select (arr!18481 a!2986) j!136)) (and ((_ is MissingVacant!6921) lt!302030) (= (index!30034 lt!302030) vacantSpotIndex!68) (= (select (arr!18481 a!2986) (index!30034 lt!302030)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!372986 () SeekEntryResult!6921)

(assert (=> d!91971 (= lt!302030 e!372986)))

(declare-fun c!74715 () Bool)

(assert (=> d!91971 (= c!74715 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!302029 () (_ BitVec 64))

(assert (=> d!91971 (= lt!302029 (select (arr!18481 a!2986) index!984))))

(assert (=> d!91971 (validMask!0 mask!3053)))

(assert (=> d!91971 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053) lt!302030)))

(declare-fun b!650171 () Bool)

(declare-fun e!372987 () SeekEntryResult!6921)

(assert (=> b!650171 (= e!372987 (MissingVacant!6921 vacantSpotIndex!68))))

(declare-fun b!650172 () Bool)

(declare-fun e!372985 () SeekEntryResult!6921)

(assert (=> b!650172 (= e!372985 (Found!6921 index!984))))

(declare-fun b!650173 () Bool)

(declare-fun c!74716 () Bool)

(assert (=> b!650173 (= c!74716 (= lt!302029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!650173 (= e!372985 e!372987)))

(declare-fun b!650174 () Bool)

(assert (=> b!650174 (= e!372987 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18481 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!650175 () Bool)

(assert (=> b!650175 (= e!372986 Undefined!6921)))

(declare-fun b!650176 () Bool)

(assert (=> b!650176 (= e!372986 e!372985)))

(declare-fun c!74714 () Bool)

(assert (=> b!650176 (= c!74714 (= lt!302029 (select (arr!18481 a!2986) j!136)))))

(assert (= (and d!91971 c!74715) b!650175))

(assert (= (and d!91971 (not c!74715)) b!650176))

(assert (= (and b!650176 c!74714) b!650172))

(assert (= (and b!650176 (not c!74714)) b!650173))

(assert (= (and b!650173 c!74716) b!650171))

(assert (= (and b!650173 (not c!74716)) b!650174))

(declare-fun m!623409 () Bool)

(assert (=> d!91971 m!623409))

(declare-fun m!623411 () Bool)

(assert (=> d!91971 m!623411))

(assert (=> d!91971 m!623159))

(assert (=> d!91971 m!623145))

(assert (=> b!650174 m!623131))

(assert (=> b!650174 m!623131))

(assert (=> b!650174 m!623109))

(declare-fun m!623413 () Bool)

(assert (=> b!650174 m!623413))

(assert (=> b!649902 d!91971))

(assert (=> b!649909 d!91969))

(declare-fun b!650230 () Bool)

(declare-fun c!74743 () Bool)

(declare-fun lt!302057 () (_ BitVec 64))

(assert (=> b!650230 (= c!74743 (= lt!302057 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!373018 () SeekEntryResult!6921)

(declare-fun e!373017 () SeekEntryResult!6921)

(assert (=> b!650230 (= e!373018 e!373017)))

(declare-fun b!650232 () Bool)

(declare-fun lt!302055 () SeekEntryResult!6921)

(assert (=> b!650232 (= e!373018 (Found!6921 (index!30033 lt!302055)))))

(declare-fun b!650233 () Bool)

(assert (=> b!650233 (= e!373017 (MissingZero!6921 (index!30033 lt!302055)))))

(declare-fun b!650234 () Bool)

(assert (=> b!650234 (= e!373017 (seekKeyOrZeroReturnVacant!0 (x!58814 lt!302055) (index!30033 lt!302055) (index!30033 lt!302055) k0!1786 a!2986 mask!3053))))

(declare-fun b!650235 () Bool)

(declare-fun e!373019 () SeekEntryResult!6921)

(assert (=> b!650235 (= e!373019 e!373018)))

(assert (=> b!650235 (= lt!302057 (select (arr!18481 a!2986) (index!30033 lt!302055)))))

(declare-fun c!74742 () Bool)

(assert (=> b!650235 (= c!74742 (= lt!302057 k0!1786))))

(declare-fun d!91975 () Bool)

(declare-fun lt!302056 () SeekEntryResult!6921)

(assert (=> d!91975 (and (or ((_ is Undefined!6921) lt!302056) (not ((_ is Found!6921) lt!302056)) (and (bvsge (index!30032 lt!302056) #b00000000000000000000000000000000) (bvslt (index!30032 lt!302056) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!302056) ((_ is Found!6921) lt!302056) (not ((_ is MissingZero!6921) lt!302056)) (and (bvsge (index!30031 lt!302056) #b00000000000000000000000000000000) (bvslt (index!30031 lt!302056) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!302056) ((_ is Found!6921) lt!302056) ((_ is MissingZero!6921) lt!302056) (not ((_ is MissingVacant!6921) lt!302056)) (and (bvsge (index!30034 lt!302056) #b00000000000000000000000000000000) (bvslt (index!30034 lt!302056) (size!18845 a!2986)))) (or ((_ is Undefined!6921) lt!302056) (ite ((_ is Found!6921) lt!302056) (= (select (arr!18481 a!2986) (index!30032 lt!302056)) k0!1786) (ite ((_ is MissingZero!6921) lt!302056) (= (select (arr!18481 a!2986) (index!30031 lt!302056)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6921) lt!302056) (= (select (arr!18481 a!2986) (index!30034 lt!302056)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!91975 (= lt!302056 e!373019)))

(declare-fun c!74741 () Bool)

(assert (=> d!91975 (= c!74741 (and ((_ is Intermediate!6921) lt!302055) (undefined!7733 lt!302055)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38550 (_ BitVec 32)) SeekEntryResult!6921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!91975 (= lt!302055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!91975 (validMask!0 mask!3053)))

(assert (=> d!91975 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!302056)))

(declare-fun b!650231 () Bool)

(assert (=> b!650231 (= e!373019 Undefined!6921)))

(assert (= (and d!91975 c!74741) b!650231))

(assert (= (and d!91975 (not c!74741)) b!650235))

(assert (= (and b!650235 c!74742) b!650232))

(assert (= (and b!650235 (not c!74742)) b!650230))

(assert (= (and b!650230 c!74743) b!650233))

(assert (= (and b!650230 (not c!74743)) b!650234))

(declare-fun m!623455 () Bool)

(assert (=> b!650234 m!623455))

(declare-fun m!623457 () Bool)

(assert (=> b!650235 m!623457))

(assert (=> d!91975 m!623145))

(declare-fun m!623459 () Bool)

(assert (=> d!91975 m!623459))

(declare-fun m!623461 () Bool)

(assert (=> d!91975 m!623461))

(declare-fun m!623463 () Bool)

(assert (=> d!91975 m!623463))

(assert (=> d!91975 m!623461))

(declare-fun m!623465 () Bool)

(assert (=> d!91975 m!623465))

(declare-fun m!623467 () Bool)

(assert (=> d!91975 m!623467))

(assert (=> b!649889 d!91975))

(check-sat (not d!91971) (not b!650133) (not d!91949) (not d!91915) (not bm!33728) (not bm!33732) (not b!650017) (not b!650170) (not b!650012) (not b!650003) (not b!650146) (not b!650072) (not d!91951) (not d!91955) (not b!649993) (not d!91931) (not b!650039) (not bm!33731) (not b!650088) (not b!650018) (not b!649994) (not d!91909) (not d!91965) (not d!91935) (not b!650019) (not b!650014) (not b!650021) (not d!91933) (not b!650148) (not b!650139) (not d!91975) (not b!650123) (not b!650234) (not bm!33742) (not d!91911) (not b!649992) (not b!650004) (not b!650147) (not b!650174))
(check-sat)
