; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57174 () Bool)

(assert start!57174)

(declare-fun b!632788 () Bool)

(declare-fun e!361774 () Bool)

(declare-fun e!361777 () Bool)

(assert (=> b!632788 (= e!361774 e!361777)))

(declare-fun res!409264 () Bool)

(assert (=> b!632788 (=> (not res!409264) (not e!361777))))

(declare-datatypes ((SeekEntryResult!6694 0))(
  ( (MissingZero!6694 (index!29069 (_ BitVec 32))) (Found!6694 (index!29070 (_ BitVec 32))) (Intermediate!6694 (undefined!7506 Bool) (index!29071 (_ BitVec 32)) (x!57956 (_ BitVec 32))) (Undefined!6694) (MissingVacant!6694 (index!29072 (_ BitVec 32))) )
))
(declare-fun lt!292482 () SeekEntryResult!6694)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!632788 (= res!409264 (or (= lt!292482 (MissingZero!6694 i!1108)) (= lt!292482 (MissingVacant!6694 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38136 0))(
  ( (array!38137 (arr!18298 (Array (_ BitVec 32) (_ BitVec 64))) (size!18662 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38136)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38136 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!632788 (= lt!292482 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!632789 () Bool)

(declare-fun res!409275 () Bool)

(assert (=> b!632789 (=> (not res!409275) (not e!361777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38136 (_ BitVec 32)) Bool)

(assert (=> b!632789 (= res!409275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!632790 () Bool)

(declare-fun e!361780 () Bool)

(declare-fun e!361776 () Bool)

(assert (=> b!632790 (= e!361780 e!361776)))

(declare-fun res!409272 () Bool)

(assert (=> b!632790 (=> res!409272 e!361776)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!292476 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!632790 (= res!409272 (or (not (= (select (arr!18298 a!2986) j!136) lt!292476)) (not (= (select (arr!18298 a!2986) j!136) (select (store (arr!18298 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(assert (=> b!632790 (= (select (store (arr!18298 a!2986) i!1108 k0!1786) index!984) (select (arr!18298 a!2986) j!136))))

(declare-fun b!632791 () Bool)

(declare-datatypes ((Unit!21285 0))(
  ( (Unit!21286) )
))
(declare-fun e!361782 () Unit!21285)

(declare-fun Unit!21287 () Unit!21285)

(assert (=> b!632791 (= e!361782 Unit!21287)))

(declare-fun b!632792 () Bool)

(declare-fun e!361781 () Bool)

(declare-fun e!361778 () Bool)

(assert (=> b!632792 (= e!361781 e!361778)))

(declare-fun res!409267 () Bool)

(assert (=> b!632792 (=> (not res!409267) (not e!361778))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!292477 () SeekEntryResult!6694)

(assert (=> b!632792 (= res!409267 (and (= lt!292477 (Found!6694 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18298 a!2986) index!984) (select (arr!18298 a!2986) j!136))) (not (= (select (arr!18298 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38136 (_ BitVec 32)) SeekEntryResult!6694)

(assert (=> b!632792 (= lt!292477 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632793 () Bool)

(declare-fun res!409274 () Bool)

(assert (=> b!632793 (=> (not res!409274) (not e!361774))))

(assert (=> b!632793 (= res!409274 (and (= (size!18662 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18662 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18662 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!632794 () Bool)

(declare-fun res!409270 () Bool)

(assert (=> b!632794 (=> (not res!409270) (not e!361774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!632794 (= res!409270 (validKeyInArray!0 (select (arr!18298 a!2986) j!136)))))

(declare-fun b!632795 () Bool)

(assert (=> b!632795 (= e!361778 (not e!361780))))

(declare-fun res!409265 () Bool)

(assert (=> b!632795 (=> res!409265 e!361780)))

(declare-fun lt!292478 () SeekEntryResult!6694)

(assert (=> b!632795 (= res!409265 (not (= lt!292478 (Found!6694 index!984))))))

(declare-fun lt!292475 () Unit!21285)

(assert (=> b!632795 (= lt!292475 e!361782)))

(declare-fun c!72131 () Bool)

(assert (=> b!632795 (= c!72131 (= lt!292478 Undefined!6694))))

(declare-fun lt!292483 () array!38136)

(assert (=> b!632795 (= lt!292478 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292476 lt!292483 mask!3053))))

(declare-fun e!361775 () Bool)

(assert (=> b!632795 e!361775))

(declare-fun res!409273 () Bool)

(assert (=> b!632795 (=> (not res!409273) (not e!361775))))

(declare-fun lt!292480 () (_ BitVec 32))

(declare-fun lt!292481 () SeekEntryResult!6694)

(assert (=> b!632795 (= res!409273 (= lt!292481 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 lt!292476 lt!292483 mask!3053)))))

(assert (=> b!632795 (= lt!292481 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!632795 (= lt!292476 (select (store (arr!18298 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292479 () Unit!21285)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21285)

(assert (=> b!632795 (= lt!292479 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!632795 (= lt!292480 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!632796 () Bool)

(declare-fun arrayContainsKey!0 (array!38136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!632796 (= e!361776 (arrayContainsKey!0 lt!292483 (select (arr!18298 a!2986) j!136) j!136))))

(declare-fun b!632797 () Bool)

(declare-fun res!409268 () Bool)

(assert (=> b!632797 (=> (not res!409268) (not e!361774))))

(assert (=> b!632797 (= res!409268 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!409269 () Bool)

(assert (=> start!57174 (=> (not res!409269) (not e!361774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57174 (= res!409269 (validMask!0 mask!3053))))

(assert (=> start!57174 e!361774))

(assert (=> start!57174 true))

(declare-fun array_inv!14157 (array!38136) Bool)

(assert (=> start!57174 (array_inv!14157 a!2986)))

(declare-fun b!632798 () Bool)

(declare-fun res!409271 () Bool)

(assert (=> b!632798 (=> (not res!409271) (not e!361777))))

(assert (=> b!632798 (= res!409271 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18298 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!632799 () Bool)

(declare-fun res!409276 () Bool)

(assert (=> b!632799 (=> (not res!409276) (not e!361774))))

(assert (=> b!632799 (= res!409276 (validKeyInArray!0 k0!1786))))

(declare-fun b!632800 () Bool)

(declare-fun Unit!21288 () Unit!21285)

(assert (=> b!632800 (= e!361782 Unit!21288)))

(assert (=> b!632800 false))

(declare-fun b!632801 () Bool)

(assert (=> b!632801 (= e!361775 (= lt!292477 lt!292481))))

(declare-fun b!632802 () Bool)

(declare-fun res!409266 () Bool)

(assert (=> b!632802 (=> (not res!409266) (not e!361777))))

(declare-datatypes ((List!12246 0))(
  ( (Nil!12243) (Cons!12242 (h!13290 (_ BitVec 64)) (t!18466 List!12246)) )
))
(declare-fun arrayNoDuplicates!0 (array!38136 (_ BitVec 32) List!12246) Bool)

(assert (=> b!632802 (= res!409266 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12243))))

(declare-fun b!632803 () Bool)

(assert (=> b!632803 (= e!361777 e!361781)))

(declare-fun res!409263 () Bool)

(assert (=> b!632803 (=> (not res!409263) (not e!361781))))

(assert (=> b!632803 (= res!409263 (= (select (store (arr!18298 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632803 (= lt!292483 (array!38137 (store (arr!18298 a!2986) i!1108 k0!1786) (size!18662 a!2986)))))

(assert (= (and start!57174 res!409269) b!632793))

(assert (= (and b!632793 res!409274) b!632794))

(assert (= (and b!632794 res!409270) b!632799))

(assert (= (and b!632799 res!409276) b!632797))

(assert (= (and b!632797 res!409268) b!632788))

(assert (= (and b!632788 res!409264) b!632789))

(assert (= (and b!632789 res!409275) b!632802))

(assert (= (and b!632802 res!409266) b!632798))

(assert (= (and b!632798 res!409271) b!632803))

(assert (= (and b!632803 res!409263) b!632792))

(assert (= (and b!632792 res!409267) b!632795))

(assert (= (and b!632795 res!409273) b!632801))

(assert (= (and b!632795 c!72131) b!632800))

(assert (= (and b!632795 (not c!72131)) b!632791))

(assert (= (and b!632795 (not res!409265)) b!632790))

(assert (= (and b!632790 (not res!409272)) b!632796))

(declare-fun m!607915 () Bool)

(assert (=> b!632797 m!607915))

(declare-fun m!607917 () Bool)

(assert (=> b!632798 m!607917))

(declare-fun m!607919 () Bool)

(assert (=> b!632794 m!607919))

(assert (=> b!632794 m!607919))

(declare-fun m!607921 () Bool)

(assert (=> b!632794 m!607921))

(declare-fun m!607923 () Bool)

(assert (=> b!632803 m!607923))

(declare-fun m!607925 () Bool)

(assert (=> b!632803 m!607925))

(declare-fun m!607927 () Bool)

(assert (=> b!632792 m!607927))

(assert (=> b!632792 m!607919))

(assert (=> b!632792 m!607919))

(declare-fun m!607929 () Bool)

(assert (=> b!632792 m!607929))

(declare-fun m!607931 () Bool)

(assert (=> b!632802 m!607931))

(assert (=> b!632790 m!607919))

(assert (=> b!632790 m!607923))

(declare-fun m!607933 () Bool)

(assert (=> b!632790 m!607933))

(declare-fun m!607935 () Bool)

(assert (=> b!632799 m!607935))

(declare-fun m!607937 () Bool)

(assert (=> b!632789 m!607937))

(declare-fun m!607939 () Bool)

(assert (=> start!57174 m!607939))

(declare-fun m!607941 () Bool)

(assert (=> start!57174 m!607941))

(declare-fun m!607943 () Bool)

(assert (=> b!632795 m!607943))

(declare-fun m!607945 () Bool)

(assert (=> b!632795 m!607945))

(assert (=> b!632795 m!607919))

(assert (=> b!632795 m!607919))

(declare-fun m!607947 () Bool)

(assert (=> b!632795 m!607947))

(assert (=> b!632795 m!607923))

(declare-fun m!607949 () Bool)

(assert (=> b!632795 m!607949))

(declare-fun m!607951 () Bool)

(assert (=> b!632795 m!607951))

(declare-fun m!607953 () Bool)

(assert (=> b!632795 m!607953))

(declare-fun m!607955 () Bool)

(assert (=> b!632788 m!607955))

(assert (=> b!632796 m!607919))

(assert (=> b!632796 m!607919))

(declare-fun m!607957 () Bool)

(assert (=> b!632796 m!607957))

(check-sat (not b!632789) (not b!632802) (not b!632788) (not b!632799) (not b!632797) (not b!632795) (not b!632794) (not start!57174) (not b!632796) (not b!632792))
(check-sat)
(get-model)

(declare-fun b!632912 () Bool)

(declare-fun e!361845 () SeekEntryResult!6694)

(assert (=> b!632912 (= e!361845 Undefined!6694)))

(declare-fun d!89529 () Bool)

(declare-fun lt!292546 () SeekEntryResult!6694)

(get-info :version)

(assert (=> d!89529 (and (or ((_ is Undefined!6694) lt!292546) (not ((_ is Found!6694) lt!292546)) (and (bvsge (index!29070 lt!292546) #b00000000000000000000000000000000) (bvslt (index!29070 lt!292546) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292546) ((_ is Found!6694) lt!292546) (not ((_ is MissingZero!6694) lt!292546)) (and (bvsge (index!29069 lt!292546) #b00000000000000000000000000000000) (bvslt (index!29069 lt!292546) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292546) ((_ is Found!6694) lt!292546) ((_ is MissingZero!6694) lt!292546) (not ((_ is MissingVacant!6694) lt!292546)) (and (bvsge (index!29072 lt!292546) #b00000000000000000000000000000000) (bvslt (index!29072 lt!292546) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292546) (ite ((_ is Found!6694) lt!292546) (= (select (arr!18298 a!2986) (index!29070 lt!292546)) k0!1786) (ite ((_ is MissingZero!6694) lt!292546) (= (select (arr!18298 a!2986) (index!29069 lt!292546)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6694) lt!292546) (= (select (arr!18298 a!2986) (index!29072 lt!292546)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!89529 (= lt!292546 e!361845)))

(declare-fun c!72146 () Bool)

(declare-fun lt!292545 () SeekEntryResult!6694)

(assert (=> d!89529 (= c!72146 (and ((_ is Intermediate!6694) lt!292545) (undefined!7506 lt!292545)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38136 (_ BitVec 32)) SeekEntryResult!6694)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89529 (= lt!292545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89529 (validMask!0 mask!3053)))

(assert (=> d!89529 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292546)))

(declare-fun b!632913 () Bool)

(declare-fun e!361843 () SeekEntryResult!6694)

(assert (=> b!632913 (= e!361843 (Found!6694 (index!29071 lt!292545)))))

(declare-fun b!632914 () Bool)

(declare-fun c!72145 () Bool)

(declare-fun lt!292544 () (_ BitVec 64))

(assert (=> b!632914 (= c!72145 (= lt!292544 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361844 () SeekEntryResult!6694)

(assert (=> b!632914 (= e!361843 e!361844)))

(declare-fun b!632915 () Bool)

(assert (=> b!632915 (= e!361844 (seekKeyOrZeroReturnVacant!0 (x!57956 lt!292545) (index!29071 lt!292545) (index!29071 lt!292545) k0!1786 a!2986 mask!3053))))

(declare-fun b!632916 () Bool)

(assert (=> b!632916 (= e!361845 e!361843)))

(assert (=> b!632916 (= lt!292544 (select (arr!18298 a!2986) (index!29071 lt!292545)))))

(declare-fun c!72144 () Bool)

(assert (=> b!632916 (= c!72144 (= lt!292544 k0!1786))))

(declare-fun b!632917 () Bool)

(assert (=> b!632917 (= e!361844 (MissingZero!6694 (index!29071 lt!292545)))))

(assert (= (and d!89529 c!72146) b!632912))

(assert (= (and d!89529 (not c!72146)) b!632916))

(assert (= (and b!632916 c!72144) b!632913))

(assert (= (and b!632916 (not c!72144)) b!632914))

(assert (= (and b!632914 c!72145) b!632917))

(assert (= (and b!632914 (not c!72145)) b!632915))

(declare-fun m!608047 () Bool)

(assert (=> d!89529 m!608047))

(declare-fun m!608049 () Bool)

(assert (=> d!89529 m!608049))

(declare-fun m!608051 () Bool)

(assert (=> d!89529 m!608051))

(declare-fun m!608053 () Bool)

(assert (=> d!89529 m!608053))

(assert (=> d!89529 m!608053))

(declare-fun m!608055 () Bool)

(assert (=> d!89529 m!608055))

(assert (=> d!89529 m!607939))

(declare-fun m!608057 () Bool)

(assert (=> b!632915 m!608057))

(declare-fun m!608059 () Bool)

(assert (=> b!632916 m!608059))

(assert (=> b!632788 d!89529))

(declare-fun d!89531 () Bool)

(declare-fun res!409365 () Bool)

(declare-fun e!361850 () Bool)

(assert (=> d!89531 (=> res!409365 e!361850)))

(assert (=> d!89531 (= res!409365 (= (select (arr!18298 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89531 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361850)))

(declare-fun b!632922 () Bool)

(declare-fun e!361851 () Bool)

(assert (=> b!632922 (= e!361850 e!361851)))

(declare-fun res!409366 () Bool)

(assert (=> b!632922 (=> (not res!409366) (not e!361851))))

(assert (=> b!632922 (= res!409366 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18662 a!2986)))))

(declare-fun b!632923 () Bool)

(assert (=> b!632923 (= e!361851 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89531 (not res!409365)) b!632922))

(assert (= (and b!632922 res!409366) b!632923))

(declare-fun m!608061 () Bool)

(assert (=> d!89531 m!608061))

(declare-fun m!608063 () Bool)

(assert (=> b!632923 m!608063))

(assert (=> b!632797 d!89531))

(declare-fun b!632936 () Bool)

(declare-fun e!361859 () SeekEntryResult!6694)

(assert (=> b!632936 (= e!361859 (Found!6694 index!984))))

(declare-fun b!632937 () Bool)

(declare-fun e!361860 () SeekEntryResult!6694)

(assert (=> b!632937 (= e!361860 (MissingVacant!6694 vacantSpotIndex!68))))

(declare-fun lt!292552 () SeekEntryResult!6694)

(declare-fun d!89533 () Bool)

(assert (=> d!89533 (and (or ((_ is Undefined!6694) lt!292552) (not ((_ is Found!6694) lt!292552)) (and (bvsge (index!29070 lt!292552) #b00000000000000000000000000000000) (bvslt (index!29070 lt!292552) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292552) ((_ is Found!6694) lt!292552) (not ((_ is MissingVacant!6694) lt!292552)) (not (= (index!29072 lt!292552) vacantSpotIndex!68)) (and (bvsge (index!29072 lt!292552) #b00000000000000000000000000000000) (bvslt (index!29072 lt!292552) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292552) (ite ((_ is Found!6694) lt!292552) (= (select (arr!18298 a!2986) (index!29070 lt!292552)) (select (arr!18298 a!2986) j!136)) (and ((_ is MissingVacant!6694) lt!292552) (= (index!29072 lt!292552) vacantSpotIndex!68) (= (select (arr!18298 a!2986) (index!29072 lt!292552)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361858 () SeekEntryResult!6694)

(assert (=> d!89533 (= lt!292552 e!361858)))

(declare-fun c!72154 () Bool)

(assert (=> d!89533 (= c!72154 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!292551 () (_ BitVec 64))

(assert (=> d!89533 (= lt!292551 (select (arr!18298 a!2986) index!984))))

(assert (=> d!89533 (validMask!0 mask!3053)))

(assert (=> d!89533 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053) lt!292552)))

(declare-fun b!632938 () Bool)

(assert (=> b!632938 (= e!361860 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632939 () Bool)

(declare-fun c!72153 () Bool)

(assert (=> b!632939 (= c!72153 (= lt!292551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632939 (= e!361859 e!361860)))

(declare-fun b!632940 () Bool)

(assert (=> b!632940 (= e!361858 Undefined!6694)))

(declare-fun b!632941 () Bool)

(assert (=> b!632941 (= e!361858 e!361859)))

(declare-fun c!72155 () Bool)

(assert (=> b!632941 (= c!72155 (= lt!292551 (select (arr!18298 a!2986) j!136)))))

(assert (= (and d!89533 c!72154) b!632940))

(assert (= (and d!89533 (not c!72154)) b!632941))

(assert (= (and b!632941 c!72155) b!632936))

(assert (= (and b!632941 (not c!72155)) b!632939))

(assert (= (and b!632939 c!72153) b!632937))

(assert (= (and b!632939 (not c!72153)) b!632938))

(declare-fun m!608065 () Bool)

(assert (=> d!89533 m!608065))

(declare-fun m!608067 () Bool)

(assert (=> d!89533 m!608067))

(assert (=> d!89533 m!607927))

(assert (=> d!89533 m!607939))

(declare-fun m!608069 () Bool)

(assert (=> b!632938 m!608069))

(assert (=> b!632938 m!608069))

(assert (=> b!632938 m!607919))

(declare-fun m!608071 () Bool)

(assert (=> b!632938 m!608071))

(assert (=> b!632792 d!89533))

(declare-fun b!632952 () Bool)

(declare-fun e!361870 () Bool)

(declare-fun e!361872 () Bool)

(assert (=> b!632952 (= e!361870 e!361872)))

(declare-fun c!72158 () Bool)

(assert (=> b!632952 (= c!72158 (validKeyInArray!0 (select (arr!18298 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632953 () Bool)

(declare-fun e!361869 () Bool)

(assert (=> b!632953 (= e!361869 e!361870)))

(declare-fun res!409373 () Bool)

(assert (=> b!632953 (=> (not res!409373) (not e!361870))))

(declare-fun e!361871 () Bool)

(assert (=> b!632953 (= res!409373 (not e!361871))))

(declare-fun res!409374 () Bool)

(assert (=> b!632953 (=> (not res!409374) (not e!361871))))

(assert (=> b!632953 (= res!409374 (validKeyInArray!0 (select (arr!18298 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632954 () Bool)

(declare-fun contains!3067 (List!12246 (_ BitVec 64)) Bool)

(assert (=> b!632954 (= e!361871 (contains!3067 Nil!12243 (select (arr!18298 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!632955 () Bool)

(declare-fun call!33351 () Bool)

(assert (=> b!632955 (= e!361872 call!33351)))

(declare-fun b!632956 () Bool)

(assert (=> b!632956 (= e!361872 call!33351)))

(declare-fun d!89535 () Bool)

(declare-fun res!409375 () Bool)

(assert (=> d!89535 (=> res!409375 e!361869)))

(assert (=> d!89535 (= res!409375 (bvsge #b00000000000000000000000000000000 (size!18662 a!2986)))))

(assert (=> d!89535 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12243) e!361869)))

(declare-fun bm!33348 () Bool)

(assert (=> bm!33348 (= call!33351 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72158 (Cons!12242 (select (arr!18298 a!2986) #b00000000000000000000000000000000) Nil!12243) Nil!12243)))))

(assert (= (and d!89535 (not res!409375)) b!632953))

(assert (= (and b!632953 res!409374) b!632954))

(assert (= (and b!632953 res!409373) b!632952))

(assert (= (and b!632952 c!72158) b!632956))

(assert (= (and b!632952 (not c!72158)) b!632955))

(assert (= (or b!632956 b!632955) bm!33348))

(assert (=> b!632952 m!608061))

(assert (=> b!632952 m!608061))

(declare-fun m!608073 () Bool)

(assert (=> b!632952 m!608073))

(assert (=> b!632953 m!608061))

(assert (=> b!632953 m!608061))

(assert (=> b!632953 m!608073))

(assert (=> b!632954 m!608061))

(assert (=> b!632954 m!608061))

(declare-fun m!608075 () Bool)

(assert (=> b!632954 m!608075))

(assert (=> bm!33348 m!608061))

(declare-fun m!608077 () Bool)

(assert (=> bm!33348 m!608077))

(assert (=> b!632802 d!89535))

(declare-fun d!89541 () Bool)

(declare-fun res!409376 () Bool)

(declare-fun e!361873 () Bool)

(assert (=> d!89541 (=> res!409376 e!361873)))

(assert (=> d!89541 (= res!409376 (= (select (arr!18298 lt!292483) j!136) (select (arr!18298 a!2986) j!136)))))

(assert (=> d!89541 (= (arrayContainsKey!0 lt!292483 (select (arr!18298 a!2986) j!136) j!136) e!361873)))

(declare-fun b!632957 () Bool)

(declare-fun e!361874 () Bool)

(assert (=> b!632957 (= e!361873 e!361874)))

(declare-fun res!409377 () Bool)

(assert (=> b!632957 (=> (not res!409377) (not e!361874))))

(assert (=> b!632957 (= res!409377 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18662 lt!292483)))))

(declare-fun b!632958 () Bool)

(assert (=> b!632958 (= e!361874 (arrayContainsKey!0 lt!292483 (select (arr!18298 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89541 (not res!409376)) b!632957))

(assert (= (and b!632957 res!409377) b!632958))

(declare-fun m!608079 () Bool)

(assert (=> d!89541 m!608079))

(assert (=> b!632958 m!607919))

(declare-fun m!608081 () Bool)

(assert (=> b!632958 m!608081))

(assert (=> b!632796 d!89541))

(declare-fun b!632959 () Bool)

(declare-fun e!361876 () SeekEntryResult!6694)

(assert (=> b!632959 (= e!361876 (Found!6694 lt!292480))))

(declare-fun b!632960 () Bool)

(declare-fun e!361877 () SeekEntryResult!6694)

(assert (=> b!632960 (= e!361877 (MissingVacant!6694 vacantSpotIndex!68))))

(declare-fun lt!292554 () SeekEntryResult!6694)

(declare-fun d!89543 () Bool)

(assert (=> d!89543 (and (or ((_ is Undefined!6694) lt!292554) (not ((_ is Found!6694) lt!292554)) (and (bvsge (index!29070 lt!292554) #b00000000000000000000000000000000) (bvslt (index!29070 lt!292554) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292554) ((_ is Found!6694) lt!292554) (not ((_ is MissingVacant!6694) lt!292554)) (not (= (index!29072 lt!292554) vacantSpotIndex!68)) (and (bvsge (index!29072 lt!292554) #b00000000000000000000000000000000) (bvslt (index!29072 lt!292554) (size!18662 a!2986)))) (or ((_ is Undefined!6694) lt!292554) (ite ((_ is Found!6694) lt!292554) (= (select (arr!18298 a!2986) (index!29070 lt!292554)) (select (arr!18298 a!2986) j!136)) (and ((_ is MissingVacant!6694) lt!292554) (= (index!29072 lt!292554) vacantSpotIndex!68) (= (select (arr!18298 a!2986) (index!29072 lt!292554)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361875 () SeekEntryResult!6694)

(assert (=> d!89543 (= lt!292554 e!361875)))

(declare-fun c!72160 () Bool)

(assert (=> d!89543 (= c!72160 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!292553 () (_ BitVec 64))

(assert (=> d!89543 (= lt!292553 (select (arr!18298 a!2986) lt!292480))))

(assert (=> d!89543 (validMask!0 mask!3053)))

(assert (=> d!89543 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053) lt!292554)))

(declare-fun b!632961 () Bool)

(assert (=> b!632961 (= e!361877 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292480 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!632962 () Bool)

(declare-fun c!72159 () Bool)

(assert (=> b!632962 (= c!72159 (= lt!292553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632962 (= e!361876 e!361877)))

(declare-fun b!632963 () Bool)

(assert (=> b!632963 (= e!361875 Undefined!6694)))

(declare-fun b!632964 () Bool)

(assert (=> b!632964 (= e!361875 e!361876)))

(declare-fun c!72161 () Bool)

(assert (=> b!632964 (= c!72161 (= lt!292553 (select (arr!18298 a!2986) j!136)))))

(assert (= (and d!89543 c!72160) b!632963))

(assert (= (and d!89543 (not c!72160)) b!632964))

(assert (= (and b!632964 c!72161) b!632959))

(assert (= (and b!632964 (not c!72161)) b!632962))

(assert (= (and b!632962 c!72159) b!632960))

(assert (= (and b!632962 (not c!72159)) b!632961))

(declare-fun m!608083 () Bool)

(assert (=> d!89543 m!608083))

(declare-fun m!608085 () Bool)

(assert (=> d!89543 m!608085))

(declare-fun m!608087 () Bool)

(assert (=> d!89543 m!608087))

(assert (=> d!89543 m!607939))

(declare-fun m!608089 () Bool)

(assert (=> b!632961 m!608089))

(assert (=> b!632961 m!608089))

(assert (=> b!632961 m!607919))

(declare-fun m!608091 () Bool)

(assert (=> b!632961 m!608091))

(assert (=> b!632795 d!89543))

(declare-fun d!89545 () Bool)

(declare-fun e!361898 () Bool)

(assert (=> d!89545 e!361898))

(declare-fun res!409389 () Bool)

(assert (=> d!89545 (=> (not res!409389) (not e!361898))))

(assert (=> d!89545 (= res!409389 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18662 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18662 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18662 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18662 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18662 a!2986))))))

(declare-fun lt!292563 () Unit!21285)

(declare-fun choose!9 (array!38136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21285)

(assert (=> d!89545 (= lt!292563 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89545 (validMask!0 mask!3053)))

(assert (=> d!89545 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 mask!3053) lt!292563)))

(declare-fun b!632994 () Bool)

(assert (=> b!632994 (= e!361898 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 (select (arr!18298 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 (select (store (arr!18298 a!2986) i!1108 k0!1786) j!136) (array!38137 (store (arr!18298 a!2986) i!1108 k0!1786) (size!18662 a!2986)) mask!3053)))))

(assert (= (and d!89545 res!409389) b!632994))

(declare-fun m!608101 () Bool)

(assert (=> d!89545 m!608101))

(assert (=> d!89545 m!607939))

(assert (=> b!632994 m!607923))

(assert (=> b!632994 m!607919))

(assert (=> b!632994 m!607945))

(assert (=> b!632994 m!607945))

(declare-fun m!608103 () Bool)

(assert (=> b!632994 m!608103))

(assert (=> b!632994 m!607919))

(assert (=> b!632994 m!607947))

(assert (=> b!632795 d!89545))

(declare-fun b!632995 () Bool)

(declare-fun e!361900 () SeekEntryResult!6694)

(assert (=> b!632995 (= e!361900 (Found!6694 index!984))))

(declare-fun b!632996 () Bool)

(declare-fun e!361901 () SeekEntryResult!6694)

(assert (=> b!632996 (= e!361901 (MissingVacant!6694 vacantSpotIndex!68))))

(declare-fun d!89549 () Bool)

(declare-fun lt!292565 () SeekEntryResult!6694)

(assert (=> d!89549 (and (or ((_ is Undefined!6694) lt!292565) (not ((_ is Found!6694) lt!292565)) (and (bvsge (index!29070 lt!292565) #b00000000000000000000000000000000) (bvslt (index!29070 lt!292565) (size!18662 lt!292483)))) (or ((_ is Undefined!6694) lt!292565) ((_ is Found!6694) lt!292565) (not ((_ is MissingVacant!6694) lt!292565)) (not (= (index!29072 lt!292565) vacantSpotIndex!68)) (and (bvsge (index!29072 lt!292565) #b00000000000000000000000000000000) (bvslt (index!29072 lt!292565) (size!18662 lt!292483)))) (or ((_ is Undefined!6694) lt!292565) (ite ((_ is Found!6694) lt!292565) (= (select (arr!18298 lt!292483) (index!29070 lt!292565)) lt!292476) (and ((_ is MissingVacant!6694) lt!292565) (= (index!29072 lt!292565) vacantSpotIndex!68) (= (select (arr!18298 lt!292483) (index!29072 lt!292565)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361899 () SeekEntryResult!6694)

(assert (=> d!89549 (= lt!292565 e!361899)))

(declare-fun c!72172 () Bool)

(assert (=> d!89549 (= c!72172 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!292564 () (_ BitVec 64))

(assert (=> d!89549 (= lt!292564 (select (arr!18298 lt!292483) index!984))))

(assert (=> d!89549 (validMask!0 mask!3053)))

(assert (=> d!89549 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292476 lt!292483 mask!3053) lt!292565)))

(declare-fun b!632997 () Bool)

(assert (=> b!632997 (= e!361901 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!292476 lt!292483 mask!3053))))

(declare-fun b!632998 () Bool)

(declare-fun c!72171 () Bool)

(assert (=> b!632998 (= c!72171 (= lt!292564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!632998 (= e!361900 e!361901)))

(declare-fun b!632999 () Bool)

(assert (=> b!632999 (= e!361899 Undefined!6694)))

(declare-fun b!633000 () Bool)

(assert (=> b!633000 (= e!361899 e!361900)))

(declare-fun c!72173 () Bool)

(assert (=> b!633000 (= c!72173 (= lt!292564 lt!292476))))

(assert (= (and d!89549 c!72172) b!632999))

(assert (= (and d!89549 (not c!72172)) b!633000))

(assert (= (and b!633000 c!72173) b!632995))

(assert (= (and b!633000 (not c!72173)) b!632998))

(assert (= (and b!632998 c!72171) b!632996))

(assert (= (and b!632998 (not c!72171)) b!632997))

(declare-fun m!608105 () Bool)

(assert (=> d!89549 m!608105))

(declare-fun m!608107 () Bool)

(assert (=> d!89549 m!608107))

(declare-fun m!608109 () Bool)

(assert (=> d!89549 m!608109))

(assert (=> d!89549 m!607939))

(assert (=> b!632997 m!608069))

(assert (=> b!632997 m!608069))

(declare-fun m!608111 () Bool)

(assert (=> b!632997 m!608111))

(assert (=> b!632795 d!89549))

(declare-fun d!89551 () Bool)

(declare-fun lt!292575 () (_ BitVec 32))

(assert (=> d!89551 (and (bvsge lt!292575 #b00000000000000000000000000000000) (bvslt lt!292575 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89551 (= lt!292575 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89551 (validMask!0 mask!3053)))

(assert (=> d!89551 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!292575)))

(declare-fun bs!19070 () Bool)

(assert (= bs!19070 d!89551))

(declare-fun m!608127 () Bool)

(assert (=> bs!19070 m!608127))

(assert (=> bs!19070 m!607939))

(assert (=> b!632795 d!89551))

(declare-fun b!633021 () Bool)

(declare-fun e!361914 () SeekEntryResult!6694)

(assert (=> b!633021 (= e!361914 (Found!6694 lt!292480))))

(declare-fun b!633022 () Bool)

(declare-fun e!361915 () SeekEntryResult!6694)

(assert (=> b!633022 (= e!361915 (MissingVacant!6694 vacantSpotIndex!68))))

(declare-fun d!89555 () Bool)

(declare-fun lt!292577 () SeekEntryResult!6694)

(assert (=> d!89555 (and (or ((_ is Undefined!6694) lt!292577) (not ((_ is Found!6694) lt!292577)) (and (bvsge (index!29070 lt!292577) #b00000000000000000000000000000000) (bvslt (index!29070 lt!292577) (size!18662 lt!292483)))) (or ((_ is Undefined!6694) lt!292577) ((_ is Found!6694) lt!292577) (not ((_ is MissingVacant!6694) lt!292577)) (not (= (index!29072 lt!292577) vacantSpotIndex!68)) (and (bvsge (index!29072 lt!292577) #b00000000000000000000000000000000) (bvslt (index!29072 lt!292577) (size!18662 lt!292483)))) (or ((_ is Undefined!6694) lt!292577) (ite ((_ is Found!6694) lt!292577) (= (select (arr!18298 lt!292483) (index!29070 lt!292577)) lt!292476) (and ((_ is MissingVacant!6694) lt!292577) (= (index!29072 lt!292577) vacantSpotIndex!68) (= (select (arr!18298 lt!292483) (index!29072 lt!292577)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!361913 () SeekEntryResult!6694)

(assert (=> d!89555 (= lt!292577 e!361913)))

(declare-fun c!72184 () Bool)

(assert (=> d!89555 (= c!72184 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!292576 () (_ BitVec 64))

(assert (=> d!89555 (= lt!292576 (select (arr!18298 lt!292483) lt!292480))))

(assert (=> d!89555 (validMask!0 mask!3053)))

(assert (=> d!89555 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292480 vacantSpotIndex!68 lt!292476 lt!292483 mask!3053) lt!292577)))

(declare-fun b!633023 () Bool)

(assert (=> b!633023 (= e!361915 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292480 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!292476 lt!292483 mask!3053))))

(declare-fun b!633024 () Bool)

(declare-fun c!72183 () Bool)

(assert (=> b!633024 (= c!72183 (= lt!292576 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633024 (= e!361914 e!361915)))

(declare-fun b!633025 () Bool)

(assert (=> b!633025 (= e!361913 Undefined!6694)))

(declare-fun b!633026 () Bool)

(assert (=> b!633026 (= e!361913 e!361914)))

(declare-fun c!72185 () Bool)

(assert (=> b!633026 (= c!72185 (= lt!292576 lt!292476))))

(assert (= (and d!89555 c!72184) b!633025))

(assert (= (and d!89555 (not c!72184)) b!633026))

(assert (= (and b!633026 c!72185) b!633021))

(assert (= (and b!633026 (not c!72185)) b!633024))

(assert (= (and b!633024 c!72183) b!633022))

(assert (= (and b!633024 (not c!72183)) b!633023))

(declare-fun m!608129 () Bool)

(assert (=> d!89555 m!608129))

(declare-fun m!608131 () Bool)

(assert (=> d!89555 m!608131))

(declare-fun m!608133 () Bool)

(assert (=> d!89555 m!608133))

(assert (=> d!89555 m!607939))

(assert (=> b!633023 m!608089))

(assert (=> b!633023 m!608089))

(declare-fun m!608135 () Bool)

(assert (=> b!633023 m!608135))

(assert (=> b!632795 d!89555))

(declare-fun bm!33356 () Bool)

(declare-fun call!33359 () Bool)

(assert (=> bm!33356 (= call!33359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!633059 () Bool)

(declare-fun e!361942 () Bool)

(assert (=> b!633059 (= e!361942 call!33359)))

(declare-fun d!89557 () Bool)

(declare-fun res!409411 () Bool)

(declare-fun e!361941 () Bool)

(assert (=> d!89557 (=> res!409411 e!361941)))

(assert (=> d!89557 (= res!409411 (bvsge #b00000000000000000000000000000000 (size!18662 a!2986)))))

(assert (=> d!89557 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361941)))

(declare-fun b!633060 () Bool)

(declare-fun e!361943 () Bool)

(assert (=> b!633060 (= e!361942 e!361943)))

(declare-fun lt!292592 () (_ BitVec 64))

(assert (=> b!633060 (= lt!292592 (select (arr!18298 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292593 () Unit!21285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38136 (_ BitVec 64) (_ BitVec 32)) Unit!21285)

(assert (=> b!633060 (= lt!292593 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292592 #b00000000000000000000000000000000))))

(assert (=> b!633060 (arrayContainsKey!0 a!2986 lt!292592 #b00000000000000000000000000000000)))

(declare-fun lt!292594 () Unit!21285)

(assert (=> b!633060 (= lt!292594 lt!292593)))

(declare-fun res!409410 () Bool)

(assert (=> b!633060 (= res!409410 (= (seekEntryOrOpen!0 (select (arr!18298 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6694 #b00000000000000000000000000000000)))))

(assert (=> b!633060 (=> (not res!409410) (not e!361943))))

(declare-fun b!633061 () Bool)

(assert (=> b!633061 (= e!361941 e!361942)))

(declare-fun c!72193 () Bool)

(assert (=> b!633061 (= c!72193 (validKeyInArray!0 (select (arr!18298 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633062 () Bool)

(assert (=> b!633062 (= e!361943 call!33359)))

(assert (= (and d!89557 (not res!409411)) b!633061))

(assert (= (and b!633061 c!72193) b!633060))

(assert (= (and b!633061 (not c!72193)) b!633059))

(assert (= (and b!633060 res!409410) b!633062))

(assert (= (or b!633062 b!633059) bm!33356))

(declare-fun m!608153 () Bool)

(assert (=> bm!33356 m!608153))

(assert (=> b!633060 m!608061))

(declare-fun m!608155 () Bool)

(assert (=> b!633060 m!608155))

(declare-fun m!608157 () Bool)

(assert (=> b!633060 m!608157))

(assert (=> b!633060 m!608061))

(declare-fun m!608159 () Bool)

(assert (=> b!633060 m!608159))

(assert (=> b!633061 m!608061))

(assert (=> b!633061 m!608061))

(assert (=> b!633061 m!608073))

(assert (=> b!632789 d!89557))

(declare-fun d!89569 () Bool)

(assert (=> d!89569 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57174 d!89569))

(declare-fun d!89583 () Bool)

(assert (=> d!89583 (= (array_inv!14157 a!2986) (bvsge (size!18662 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57174 d!89583))

(declare-fun d!89585 () Bool)

(assert (=> d!89585 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632799 d!89585))

(declare-fun d!89587 () Bool)

(assert (=> d!89587 (= (validKeyInArray!0 (select (arr!18298 a!2986) j!136)) (and (not (= (select (arr!18298 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18298 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!632794 d!89587))

(check-sat (not d!89549) (not bm!33356) (not b!633060) (not d!89543) (not b!632954) (not d!89555) (not b!632994) (not d!89533) (not b!633061) (not b!632923) (not b!633023) (not d!89545) (not b!632938) (not b!632952) (not d!89551) (not b!632961) (not bm!33348) (not b!632953) (not d!89529) (not b!632915) (not b!632997) (not b!632958))
(check-sat)
