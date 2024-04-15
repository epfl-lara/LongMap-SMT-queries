; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58214 () Bool)

(assert start!58214)

(declare-fun b!642837 () Bool)

(declare-fun e!368184 () Bool)

(declare-fun e!368177 () Bool)

(assert (=> b!642837 (= e!368184 e!368177)))

(declare-fun res!416455 () Bool)

(assert (=> b!642837 (=> (not res!416455) (not e!368177))))

(declare-datatypes ((array!38403 0))(
  ( (array!38404 (arr!18416 (Array (_ BitVec 32) (_ BitVec 64))) (size!18781 (_ BitVec 32))) )
))
(declare-fun lt!297671 () array!38403)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!38403)

(declare-fun arrayContainsKey!0 (array!38403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642837 (= res!416455 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) j!136))))

(declare-fun b!642838 () Bool)

(declare-fun res!416458 () Bool)

(declare-fun e!368176 () Bool)

(assert (=> b!642838 (=> (not res!416458) (not e!368176))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642838 (= res!416458 (validKeyInArray!0 (select (arr!18416 a!2986) j!136)))))

(declare-fun b!642839 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!642839 (= e!368177 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) index!984))))

(declare-fun b!642840 () Bool)

(declare-fun res!416451 () Bool)

(declare-fun e!368189 () Bool)

(assert (=> b!642840 (=> (not res!416451) (not e!368189))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642840 (= res!416451 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18416 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642841 () Bool)

(declare-fun e!368179 () Bool)

(declare-datatypes ((SeekEntryResult!6853 0))(
  ( (MissingZero!6853 (index!29741 (_ BitVec 32))) (Found!6853 (index!29742 (_ BitVec 32))) (Intermediate!6853 (undefined!7665 Bool) (index!29743 (_ BitVec 32)) (x!58519 (_ BitVec 32))) (Undefined!6853) (MissingVacant!6853 (index!29744 (_ BitVec 32))) )
))
(declare-fun lt!297670 () SeekEntryResult!6853)

(declare-fun lt!297662 () SeekEntryResult!6853)

(assert (=> b!642841 (= e!368179 (= lt!297670 lt!297662))))

(declare-fun b!642842 () Bool)

(declare-fun res!416461 () Bool)

(assert (=> b!642842 (=> (not res!416461) (not e!368189))))

(declare-datatypes ((List!12496 0))(
  ( (Nil!12493) (Cons!12492 (h!13537 (_ BitVec 64)) (t!18715 List!12496)) )
))
(declare-fun arrayNoDuplicates!0 (array!38403 (_ BitVec 32) List!12496) Bool)

(assert (=> b!642842 (= res!416461 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12493))))

(declare-fun b!642843 () Bool)

(declare-fun e!368186 () Bool)

(declare-fun e!368188 () Bool)

(assert (=> b!642843 (= e!368186 e!368188)))

(declare-fun res!416459 () Bool)

(assert (=> b!642843 (=> (not res!416459) (not e!368188))))

(assert (=> b!642843 (= res!416459 (and (= lt!297670 (Found!6853 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18416 a!2986) index!984) (select (arr!18416 a!2986) j!136))) (not (= (select (arr!18416 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38403 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!642843 (= lt!297670 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!416449 () Bool)

(assert (=> start!58214 (=> (not res!416449) (not e!368176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58214 (= res!416449 (validMask!0 mask!3053))))

(assert (=> start!58214 e!368176))

(assert (=> start!58214 true))

(declare-fun array_inv!14299 (array!38403) Bool)

(assert (=> start!58214 (array_inv!14299 a!2986)))

(declare-fun b!642844 () Bool)

(declare-fun res!416460 () Bool)

(assert (=> b!642844 (=> (not res!416460) (not e!368176))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!642844 (= res!416460 (validKeyInArray!0 k0!1786))))

(declare-fun b!642845 () Bool)

(declare-datatypes ((Unit!21746 0))(
  ( (Unit!21747) )
))
(declare-fun e!368180 () Unit!21746)

(declare-fun Unit!21748 () Unit!21746)

(assert (=> b!642845 (= e!368180 Unit!21748)))

(assert (=> b!642845 false))

(declare-fun b!642846 () Bool)

(declare-fun e!368183 () Bool)

(declare-fun e!368182 () Bool)

(assert (=> b!642846 (= e!368183 e!368182)))

(declare-fun res!416448 () Bool)

(assert (=> b!642846 (=> res!416448 e!368182)))

(assert (=> b!642846 (= res!416448 (bvsge index!984 j!136))))

(declare-fun lt!297664 () Unit!21746)

(declare-fun e!368181 () Unit!21746)

(assert (=> b!642846 (= lt!297664 e!368181)))

(declare-fun c!73563 () Bool)

(assert (=> b!642846 (= c!73563 (bvslt j!136 index!984))))

(declare-fun b!642847 () Bool)

(declare-fun res!416463 () Bool)

(assert (=> b!642847 (=> (not res!416463) (not e!368189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38403 (_ BitVec 32)) Bool)

(assert (=> b!642847 (= res!416463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642848 () Bool)

(declare-fun Unit!21749 () Unit!21746)

(assert (=> b!642848 (= e!368181 Unit!21749)))

(declare-fun lt!297658 () Unit!21746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642848 (= lt!297658 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297671 (select (arr!18416 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!642848 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!297661 () Unit!21746)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12496) Unit!21746)

(assert (=> b!642848 (= lt!297661 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12493))))

(assert (=> b!642848 (arrayNoDuplicates!0 lt!297671 #b00000000000000000000000000000000 Nil!12493)))

(declare-fun lt!297663 () Unit!21746)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38403 (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642848 (= lt!297663 (lemmaNoDuplicateFromThenFromBigger!0 lt!297671 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642848 (arrayNoDuplicates!0 lt!297671 j!136 Nil!12493)))

(declare-fun lt!297659 () Unit!21746)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38403 (_ BitVec 64) (_ BitVec 32) List!12496) Unit!21746)

(assert (=> b!642848 (= lt!297659 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297671 (select (arr!18416 a!2986) j!136) j!136 Nil!12493))))

(assert (=> b!642848 false))

(declare-fun b!642849 () Bool)

(declare-fun Unit!21750 () Unit!21746)

(assert (=> b!642849 (= e!368181 Unit!21750)))

(declare-fun b!642850 () Bool)

(declare-fun Unit!21751 () Unit!21746)

(assert (=> b!642850 (= e!368180 Unit!21751)))

(declare-fun b!642851 () Bool)

(declare-fun e!368178 () Bool)

(assert (=> b!642851 (= e!368188 (not e!368178))))

(declare-fun res!416452 () Bool)

(assert (=> b!642851 (=> res!416452 e!368178)))

(declare-fun lt!297669 () SeekEntryResult!6853)

(assert (=> b!642851 (= res!416452 (not (= lt!297669 (Found!6853 index!984))))))

(declare-fun lt!297668 () Unit!21746)

(assert (=> b!642851 (= lt!297668 e!368180)))

(declare-fun c!73562 () Bool)

(assert (=> b!642851 (= c!73562 (= lt!297669 Undefined!6853))))

(declare-fun lt!297666 () (_ BitVec 64))

(assert (=> b!642851 (= lt!297669 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297666 lt!297671 mask!3053))))

(assert (=> b!642851 e!368179))

(declare-fun res!416450 () Bool)

(assert (=> b!642851 (=> (not res!416450) (not e!368179))))

(declare-fun lt!297667 () (_ BitVec 32))

(assert (=> b!642851 (= res!416450 (= lt!297662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 lt!297666 lt!297671 mask!3053)))))

(assert (=> b!642851 (= lt!297662 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642851 (= lt!297666 (select (store (arr!18416 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297672 () Unit!21746)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> b!642851 (= lt!297672 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642851 (= lt!297667 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!642852 () Bool)

(declare-fun res!416457 () Bool)

(assert (=> b!642852 (=> (not res!416457) (not e!368176))))

(assert (=> b!642852 (= res!416457 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642853 () Bool)

(declare-fun e!368185 () Bool)

(assert (=> b!642853 (= e!368185 e!368184)))

(declare-fun res!416464 () Bool)

(assert (=> b!642853 (=> res!416464 e!368184)))

(declare-fun lt!297660 () (_ BitVec 64))

(assert (=> b!642853 (= res!416464 (or (not (= (select (arr!18416 a!2986) j!136) lt!297666)) (not (= (select (arr!18416 a!2986) j!136) lt!297660)) (bvsge j!136 index!984)))))

(declare-fun b!642854 () Bool)

(assert (=> b!642854 (= e!368176 e!368189)))

(declare-fun res!416462 () Bool)

(assert (=> b!642854 (=> (not res!416462) (not e!368189))))

(declare-fun lt!297665 () SeekEntryResult!6853)

(assert (=> b!642854 (= res!416462 (or (= lt!297665 (MissingZero!6853 i!1108)) (= lt!297665 (MissingVacant!6853 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38403 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!642854 (= lt!297665 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642855 () Bool)

(assert (=> b!642855 (= e!368189 e!368186)))

(declare-fun res!416447 () Bool)

(assert (=> b!642855 (=> (not res!416447) (not e!368186))))

(assert (=> b!642855 (= res!416447 (= (select (store (arr!18416 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642855 (= lt!297671 (array!38404 (store (arr!18416 a!2986) i!1108 k0!1786) (size!18781 a!2986)))))

(declare-fun b!642856 () Bool)

(assert (=> b!642856 (= e!368178 e!368183)))

(declare-fun res!416454 () Bool)

(assert (=> b!642856 (=> res!416454 e!368183)))

(assert (=> b!642856 (= res!416454 (or (not (= (select (arr!18416 a!2986) j!136) lt!297666)) (not (= (select (arr!18416 a!2986) j!136) lt!297660))))))

(assert (=> b!642856 e!368185))

(declare-fun res!416453 () Bool)

(assert (=> b!642856 (=> (not res!416453) (not e!368185))))

(assert (=> b!642856 (= res!416453 (= lt!297660 (select (arr!18416 a!2986) j!136)))))

(assert (=> b!642856 (= lt!297660 (select (store (arr!18416 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642857 () Bool)

(declare-fun res!416456 () Bool)

(assert (=> b!642857 (=> (not res!416456) (not e!368176))))

(assert (=> b!642857 (= res!416456 (and (= (size!18781 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18781 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642858 () Bool)

(assert (=> b!642858 (= e!368182 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) index!984))))

(assert (=> b!642858 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) j!136)))

(assert (= (and start!58214 res!416449) b!642857))

(assert (= (and b!642857 res!416456) b!642838))

(assert (= (and b!642838 res!416458) b!642844))

(assert (= (and b!642844 res!416460) b!642852))

(assert (= (and b!642852 res!416457) b!642854))

(assert (= (and b!642854 res!416462) b!642847))

(assert (= (and b!642847 res!416463) b!642842))

(assert (= (and b!642842 res!416461) b!642840))

(assert (= (and b!642840 res!416451) b!642855))

(assert (= (and b!642855 res!416447) b!642843))

(assert (= (and b!642843 res!416459) b!642851))

(assert (= (and b!642851 res!416450) b!642841))

(assert (= (and b!642851 c!73562) b!642845))

(assert (= (and b!642851 (not c!73562)) b!642850))

(assert (= (and b!642851 (not res!416452)) b!642856))

(assert (= (and b!642856 res!416453) b!642853))

(assert (= (and b!642853 (not res!416464)) b!642837))

(assert (= (and b!642837 res!416455) b!642839))

(assert (= (and b!642856 (not res!416454)) b!642846))

(assert (= (and b!642846 c!73563) b!642848))

(assert (= (and b!642846 (not c!73563)) b!642849))

(assert (= (and b!642846 (not res!416448)) b!642858))

(declare-fun m!616095 () Bool)

(assert (=> b!642838 m!616095))

(assert (=> b!642838 m!616095))

(declare-fun m!616097 () Bool)

(assert (=> b!642838 m!616097))

(declare-fun m!616099 () Bool)

(assert (=> b!642844 m!616099))

(declare-fun m!616101 () Bool)

(assert (=> b!642848 m!616101))

(declare-fun m!616103 () Bool)

(assert (=> b!642848 m!616103))

(assert (=> b!642848 m!616095))

(declare-fun m!616105 () Bool)

(assert (=> b!642848 m!616105))

(assert (=> b!642848 m!616095))

(declare-fun m!616107 () Bool)

(assert (=> b!642848 m!616107))

(declare-fun m!616109 () Bool)

(assert (=> b!642848 m!616109))

(assert (=> b!642848 m!616095))

(declare-fun m!616111 () Bool)

(assert (=> b!642848 m!616111))

(assert (=> b!642848 m!616095))

(declare-fun m!616113 () Bool)

(assert (=> b!642848 m!616113))

(declare-fun m!616115 () Bool)

(assert (=> b!642843 m!616115))

(assert (=> b!642843 m!616095))

(assert (=> b!642843 m!616095))

(declare-fun m!616117 () Bool)

(assert (=> b!642843 m!616117))

(assert (=> b!642839 m!616095))

(assert (=> b!642839 m!616095))

(declare-fun m!616119 () Bool)

(assert (=> b!642839 m!616119))

(declare-fun m!616121 () Bool)

(assert (=> b!642842 m!616121))

(assert (=> b!642858 m!616095))

(assert (=> b!642858 m!616095))

(assert (=> b!642858 m!616119))

(assert (=> b!642858 m!616095))

(declare-fun m!616123 () Bool)

(assert (=> b!642858 m!616123))

(declare-fun m!616125 () Bool)

(assert (=> b!642855 m!616125))

(declare-fun m!616127 () Bool)

(assert (=> b!642855 m!616127))

(declare-fun m!616129 () Bool)

(assert (=> b!642847 m!616129))

(assert (=> b!642853 m!616095))

(assert (=> b!642856 m!616095))

(assert (=> b!642856 m!616125))

(declare-fun m!616131 () Bool)

(assert (=> b!642856 m!616131))

(declare-fun m!616133 () Bool)

(assert (=> b!642840 m!616133))

(assert (=> b!642837 m!616095))

(assert (=> b!642837 m!616095))

(assert (=> b!642837 m!616123))

(declare-fun m!616135 () Bool)

(assert (=> b!642852 m!616135))

(declare-fun m!616137 () Bool)

(assert (=> b!642851 m!616137))

(declare-fun m!616139 () Bool)

(assert (=> b!642851 m!616139))

(declare-fun m!616141 () Bool)

(assert (=> b!642851 m!616141))

(assert (=> b!642851 m!616125))

(declare-fun m!616143 () Bool)

(assert (=> b!642851 m!616143))

(declare-fun m!616145 () Bool)

(assert (=> b!642851 m!616145))

(assert (=> b!642851 m!616095))

(declare-fun m!616147 () Bool)

(assert (=> b!642851 m!616147))

(assert (=> b!642851 m!616095))

(declare-fun m!616149 () Bool)

(assert (=> start!58214 m!616149))

(declare-fun m!616151 () Bool)

(assert (=> start!58214 m!616151))

(declare-fun m!616153 () Bool)

(assert (=> b!642854 m!616153))

(check-sat (not b!642851) (not b!642837) (not b!642843) (not b!642854) (not start!58214) (not b!642842) (not b!642844) (not b!642838) (not b!642848) (not b!642852) (not b!642858) (not b!642839) (not b!642847))
(check-sat)
(get-model)

(declare-fun d!90707 () Bool)

(declare-fun lt!297769 () SeekEntryResult!6853)

(get-info :version)

(assert (=> d!90707 (and (or ((_ is Undefined!6853) lt!297769) (not ((_ is Found!6853) lt!297769)) (and (bvsge (index!29742 lt!297769) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297769) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297769) ((_ is Found!6853) lt!297769) (not ((_ is MissingZero!6853) lt!297769)) (and (bvsge (index!29741 lt!297769) #b00000000000000000000000000000000) (bvslt (index!29741 lt!297769) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297769) ((_ is Found!6853) lt!297769) ((_ is MissingZero!6853) lt!297769) (not ((_ is MissingVacant!6853) lt!297769)) (and (bvsge (index!29744 lt!297769) #b00000000000000000000000000000000) (bvslt (index!29744 lt!297769) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297769) (ite ((_ is Found!6853) lt!297769) (= (select (arr!18416 a!2986) (index!29742 lt!297769)) k0!1786) (ite ((_ is MissingZero!6853) lt!297769) (= (select (arr!18416 a!2986) (index!29741 lt!297769)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6853) lt!297769) (= (select (arr!18416 a!2986) (index!29744 lt!297769)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!368281 () SeekEntryResult!6853)

(assert (=> d!90707 (= lt!297769 e!368281)))

(declare-fun c!73583 () Bool)

(declare-fun lt!297771 () SeekEntryResult!6853)

(assert (=> d!90707 (= c!73583 (and ((_ is Intermediate!6853) lt!297771) (undefined!7665 lt!297771)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38403 (_ BitVec 32)) SeekEntryResult!6853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90707 (= lt!297771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90707 (validMask!0 mask!3053)))

(assert (=> d!90707 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297769)))

(declare-fun e!368280 () SeekEntryResult!6853)

(declare-fun b!643003 () Bool)

(assert (=> b!643003 (= e!368280 (seekKeyOrZeroReturnVacant!0 (x!58519 lt!297771) (index!29743 lt!297771) (index!29743 lt!297771) k0!1786 a!2986 mask!3053))))

(declare-fun b!643004 () Bool)

(assert (=> b!643004 (= e!368280 (MissingZero!6853 (index!29743 lt!297771)))))

(declare-fun b!643005 () Bool)

(assert (=> b!643005 (= e!368281 Undefined!6853)))

(declare-fun b!643006 () Bool)

(declare-fun e!368282 () SeekEntryResult!6853)

(assert (=> b!643006 (= e!368281 e!368282)))

(declare-fun lt!297770 () (_ BitVec 64))

(assert (=> b!643006 (= lt!297770 (select (arr!18416 a!2986) (index!29743 lt!297771)))))

(declare-fun c!73584 () Bool)

(assert (=> b!643006 (= c!73584 (= lt!297770 k0!1786))))

(declare-fun b!643007 () Bool)

(declare-fun c!73582 () Bool)

(assert (=> b!643007 (= c!73582 (= lt!297770 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643007 (= e!368282 e!368280)))

(declare-fun b!643008 () Bool)

(assert (=> b!643008 (= e!368282 (Found!6853 (index!29743 lt!297771)))))

(assert (= (and d!90707 c!73583) b!643005))

(assert (= (and d!90707 (not c!73583)) b!643006))

(assert (= (and b!643006 c!73584) b!643008))

(assert (= (and b!643006 (not c!73584)) b!643007))

(assert (= (and b!643007 c!73582) b!643004))

(assert (= (and b!643007 (not c!73582)) b!643003))

(declare-fun m!616275 () Bool)

(assert (=> d!90707 m!616275))

(declare-fun m!616277 () Bool)

(assert (=> d!90707 m!616277))

(declare-fun m!616279 () Bool)

(assert (=> d!90707 m!616279))

(assert (=> d!90707 m!616149))

(declare-fun m!616281 () Bool)

(assert (=> d!90707 m!616281))

(assert (=> d!90707 m!616279))

(declare-fun m!616283 () Bool)

(assert (=> d!90707 m!616283))

(declare-fun m!616285 () Bool)

(assert (=> b!643003 m!616285))

(declare-fun m!616287 () Bool)

(assert (=> b!643006 m!616287))

(assert (=> b!642854 d!90707))

(declare-fun d!90709 () Bool)

(assert (=> d!90709 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642844 d!90709))

(declare-fun b!643019 () Bool)

(declare-fun e!368292 () Bool)

(declare-fun e!368294 () Bool)

(assert (=> b!643019 (= e!368292 e!368294)))

(declare-fun c!73587 () Bool)

(assert (=> b!643019 (= c!73587 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643020 () Bool)

(declare-fun call!33559 () Bool)

(assert (=> b!643020 (= e!368294 call!33559)))

(declare-fun d!90711 () Bool)

(declare-fun res!416579 () Bool)

(declare-fun e!368291 () Bool)

(assert (=> d!90711 (=> res!416579 e!368291)))

(assert (=> d!90711 (= res!416579 (bvsge #b00000000000000000000000000000000 (size!18781 a!2986)))))

(assert (=> d!90711 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12493) e!368291)))

(declare-fun b!643021 () Bool)

(assert (=> b!643021 (= e!368291 e!368292)))

(declare-fun res!416581 () Bool)

(assert (=> b!643021 (=> (not res!416581) (not e!368292))))

(declare-fun e!368293 () Bool)

(assert (=> b!643021 (= res!416581 (not e!368293))))

(declare-fun res!416580 () Bool)

(assert (=> b!643021 (=> (not res!416580) (not e!368293))))

(assert (=> b!643021 (= res!416580 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33556 () Bool)

(assert (=> bm!33556 (= call!33559 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73587 (Cons!12492 (select (arr!18416 a!2986) #b00000000000000000000000000000000) Nil!12493) Nil!12493)))))

(declare-fun b!643022 () Bool)

(assert (=> b!643022 (= e!368294 call!33559)))

(declare-fun b!643023 () Bool)

(declare-fun contains!3125 (List!12496 (_ BitVec 64)) Bool)

(assert (=> b!643023 (= e!368293 (contains!3125 Nil!12493 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!90711 (not res!416579)) b!643021))

(assert (= (and b!643021 res!416580) b!643023))

(assert (= (and b!643021 res!416581) b!643019))

(assert (= (and b!643019 c!73587) b!643020))

(assert (= (and b!643019 (not c!73587)) b!643022))

(assert (= (or b!643020 b!643022) bm!33556))

(declare-fun m!616289 () Bool)

(assert (=> b!643019 m!616289))

(assert (=> b!643019 m!616289))

(declare-fun m!616291 () Bool)

(assert (=> b!643019 m!616291))

(assert (=> b!643021 m!616289))

(assert (=> b!643021 m!616289))

(assert (=> b!643021 m!616291))

(assert (=> bm!33556 m!616289))

(declare-fun m!616293 () Bool)

(assert (=> bm!33556 m!616293))

(assert (=> b!643023 m!616289))

(assert (=> b!643023 m!616289))

(declare-fun m!616295 () Bool)

(assert (=> b!643023 m!616295))

(assert (=> b!642842 d!90711))

(declare-fun b!643036 () Bool)

(declare-fun e!368303 () SeekEntryResult!6853)

(assert (=> b!643036 (= e!368303 (Found!6853 index!984))))

(declare-fun b!643037 () Bool)

(declare-fun e!368302 () SeekEntryResult!6853)

(assert (=> b!643037 (= e!368302 (MissingVacant!6853 vacantSpotIndex!68))))

(declare-fun b!643038 () Bool)

(assert (=> b!643038 (= e!368302 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!297777 () SeekEntryResult!6853)

(declare-fun d!90713 () Bool)

(assert (=> d!90713 (and (or ((_ is Undefined!6853) lt!297777) (not ((_ is Found!6853) lt!297777)) (and (bvsge (index!29742 lt!297777) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297777) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297777) ((_ is Found!6853) lt!297777) (not ((_ is MissingVacant!6853) lt!297777)) (not (= (index!29744 lt!297777) vacantSpotIndex!68)) (and (bvsge (index!29744 lt!297777) #b00000000000000000000000000000000) (bvslt (index!29744 lt!297777) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297777) (ite ((_ is Found!6853) lt!297777) (= (select (arr!18416 a!2986) (index!29742 lt!297777)) (select (arr!18416 a!2986) j!136)) (and ((_ is MissingVacant!6853) lt!297777) (= (index!29744 lt!297777) vacantSpotIndex!68) (= (select (arr!18416 a!2986) (index!29744 lt!297777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368301 () SeekEntryResult!6853)

(assert (=> d!90713 (= lt!297777 e!368301)))

(declare-fun c!73594 () Bool)

(assert (=> d!90713 (= c!73594 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!297776 () (_ BitVec 64))

(assert (=> d!90713 (= lt!297776 (select (arr!18416 a!2986) index!984))))

(assert (=> d!90713 (validMask!0 mask!3053)))

(assert (=> d!90713 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053) lt!297777)))

(declare-fun b!643039 () Bool)

(assert (=> b!643039 (= e!368301 e!368303)))

(declare-fun c!73596 () Bool)

(assert (=> b!643039 (= c!73596 (= lt!297776 (select (arr!18416 a!2986) j!136)))))

(declare-fun b!643040 () Bool)

(assert (=> b!643040 (= e!368301 Undefined!6853)))

(declare-fun b!643041 () Bool)

(declare-fun c!73595 () Bool)

(assert (=> b!643041 (= c!73595 (= lt!297776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643041 (= e!368303 e!368302)))

(assert (= (and d!90713 c!73594) b!643040))

(assert (= (and d!90713 (not c!73594)) b!643039))

(assert (= (and b!643039 c!73596) b!643036))

(assert (= (and b!643039 (not c!73596)) b!643041))

(assert (= (and b!643041 c!73595) b!643037))

(assert (= (and b!643041 (not c!73595)) b!643038))

(assert (=> b!643038 m!616137))

(assert (=> b!643038 m!616137))

(assert (=> b!643038 m!616095))

(declare-fun m!616297 () Bool)

(assert (=> b!643038 m!616297))

(declare-fun m!616299 () Bool)

(assert (=> d!90713 m!616299))

(declare-fun m!616301 () Bool)

(assert (=> d!90713 m!616301))

(assert (=> d!90713 m!616115))

(assert (=> d!90713 m!616149))

(assert (=> b!642843 d!90713))

(declare-fun d!90717 () Bool)

(declare-fun res!416586 () Bool)

(declare-fun e!368308 () Bool)

(assert (=> d!90717 (=> res!416586 e!368308)))

(assert (=> d!90717 (= res!416586 (= (select (arr!18416 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!90717 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368308)))

(declare-fun b!643046 () Bool)

(declare-fun e!368309 () Bool)

(assert (=> b!643046 (= e!368308 e!368309)))

(declare-fun res!416587 () Bool)

(assert (=> b!643046 (=> (not res!416587) (not e!368309))))

(assert (=> b!643046 (= res!416587 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18781 a!2986)))))

(declare-fun b!643047 () Bool)

(assert (=> b!643047 (= e!368309 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!90717 (not res!416586)) b!643046))

(assert (= (and b!643046 res!416587) b!643047))

(assert (=> d!90717 m!616289))

(declare-fun m!616303 () Bool)

(assert (=> b!643047 m!616303))

(assert (=> b!642852 d!90717))

(declare-fun d!90719 () Bool)

(declare-fun e!368334 () Bool)

(assert (=> d!90719 e!368334))

(declare-fun res!416608 () Bool)

(assert (=> d!90719 (=> (not res!416608) (not e!368334))))

(assert (=> d!90719 (= res!416608 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18781 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18781 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18781 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986))))))

(declare-fun lt!297783 () Unit!21746)

(declare-fun choose!9 (array!38403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> d!90719 (= lt!297783 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90719 (validMask!0 mask!3053)))

(assert (=> d!90719 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 mask!3053) lt!297783)))

(declare-fun b!643076 () Bool)

(assert (=> b!643076 (= e!368334 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 (select (store (arr!18416 a!2986) i!1108 k0!1786) j!136) (array!38404 (store (arr!18416 a!2986) i!1108 k0!1786) (size!18781 a!2986)) mask!3053)))))

(assert (= (and d!90719 res!416608) b!643076))

(declare-fun m!616327 () Bool)

(assert (=> d!90719 m!616327))

(assert (=> d!90719 m!616149))

(assert (=> b!643076 m!616139))

(assert (=> b!643076 m!616095))

(assert (=> b!643076 m!616139))

(declare-fun m!616329 () Bool)

(assert (=> b!643076 m!616329))

(assert (=> b!643076 m!616125))

(assert (=> b!643076 m!616095))

(assert (=> b!643076 m!616147))

(assert (=> b!642851 d!90719))

(declare-fun d!90729 () Bool)

(declare-fun lt!297789 () (_ BitVec 32))

(assert (=> d!90729 (and (bvsge lt!297789 #b00000000000000000000000000000000) (bvslt lt!297789 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90729 (= lt!297789 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!90729 (validMask!0 mask!3053)))

(assert (=> d!90729 (= (nextIndex!0 index!984 x!910 mask!3053) lt!297789)))

(declare-fun bs!19214 () Bool)

(assert (= bs!19214 d!90729))

(declare-fun m!616333 () Bool)

(assert (=> bs!19214 m!616333))

(assert (=> bs!19214 m!616149))

(assert (=> b!642851 d!90729))

(declare-fun b!643077 () Bool)

(declare-fun e!368337 () SeekEntryResult!6853)

(assert (=> b!643077 (= e!368337 (Found!6853 lt!297667))))

(declare-fun b!643078 () Bool)

(declare-fun e!368336 () SeekEntryResult!6853)

(assert (=> b!643078 (= e!368336 (MissingVacant!6853 vacantSpotIndex!68))))

(declare-fun b!643079 () Bool)

(assert (=> b!643079 (= e!368336 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297667 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!297666 lt!297671 mask!3053))))

(declare-fun lt!297791 () SeekEntryResult!6853)

(declare-fun d!90735 () Bool)

(assert (=> d!90735 (and (or ((_ is Undefined!6853) lt!297791) (not ((_ is Found!6853) lt!297791)) (and (bvsge (index!29742 lt!297791) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297791) (size!18781 lt!297671)))) (or ((_ is Undefined!6853) lt!297791) ((_ is Found!6853) lt!297791) (not ((_ is MissingVacant!6853) lt!297791)) (not (= (index!29744 lt!297791) vacantSpotIndex!68)) (and (bvsge (index!29744 lt!297791) #b00000000000000000000000000000000) (bvslt (index!29744 lt!297791) (size!18781 lt!297671)))) (or ((_ is Undefined!6853) lt!297791) (ite ((_ is Found!6853) lt!297791) (= (select (arr!18416 lt!297671) (index!29742 lt!297791)) lt!297666) (and ((_ is MissingVacant!6853) lt!297791) (= (index!29744 lt!297791) vacantSpotIndex!68) (= (select (arr!18416 lt!297671) (index!29744 lt!297791)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368335 () SeekEntryResult!6853)

(assert (=> d!90735 (= lt!297791 e!368335)))

(declare-fun c!73601 () Bool)

(assert (=> d!90735 (= c!73601 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!297790 () (_ BitVec 64))

(assert (=> d!90735 (= lt!297790 (select (arr!18416 lt!297671) lt!297667))))

(assert (=> d!90735 (validMask!0 mask!3053)))

(assert (=> d!90735 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 lt!297666 lt!297671 mask!3053) lt!297791)))

(declare-fun b!643080 () Bool)

(assert (=> b!643080 (= e!368335 e!368337)))

(declare-fun c!73603 () Bool)

(assert (=> b!643080 (= c!73603 (= lt!297790 lt!297666))))

(declare-fun b!643081 () Bool)

(assert (=> b!643081 (= e!368335 Undefined!6853)))

(declare-fun b!643082 () Bool)

(declare-fun c!73602 () Bool)

(assert (=> b!643082 (= c!73602 (= lt!297790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643082 (= e!368337 e!368336)))

(assert (= (and d!90735 c!73601) b!643081))

(assert (= (and d!90735 (not c!73601)) b!643080))

(assert (= (and b!643080 c!73603) b!643077))

(assert (= (and b!643080 (not c!73603)) b!643082))

(assert (= (and b!643082 c!73602) b!643078))

(assert (= (and b!643082 (not c!73602)) b!643079))

(declare-fun m!616335 () Bool)

(assert (=> b!643079 m!616335))

(assert (=> b!643079 m!616335))

(declare-fun m!616337 () Bool)

(assert (=> b!643079 m!616337))

(declare-fun m!616339 () Bool)

(assert (=> d!90735 m!616339))

(declare-fun m!616341 () Bool)

(assert (=> d!90735 m!616341))

(declare-fun m!616343 () Bool)

(assert (=> d!90735 m!616343))

(assert (=> d!90735 m!616149))

(assert (=> b!642851 d!90735))

(declare-fun b!643085 () Bool)

(declare-fun e!368342 () SeekEntryResult!6853)

(assert (=> b!643085 (= e!368342 (Found!6853 lt!297667))))

(declare-fun b!643086 () Bool)

(declare-fun e!368341 () SeekEntryResult!6853)

(assert (=> b!643086 (= e!368341 (MissingVacant!6853 vacantSpotIndex!68))))

(declare-fun b!643087 () Bool)

(assert (=> b!643087 (= e!368341 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297667 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!90737 () Bool)

(declare-fun lt!297795 () SeekEntryResult!6853)

(assert (=> d!90737 (and (or ((_ is Undefined!6853) lt!297795) (not ((_ is Found!6853) lt!297795)) (and (bvsge (index!29742 lt!297795) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297795) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297795) ((_ is Found!6853) lt!297795) (not ((_ is MissingVacant!6853) lt!297795)) (not (= (index!29744 lt!297795) vacantSpotIndex!68)) (and (bvsge (index!29744 lt!297795) #b00000000000000000000000000000000) (bvslt (index!29744 lt!297795) (size!18781 a!2986)))) (or ((_ is Undefined!6853) lt!297795) (ite ((_ is Found!6853) lt!297795) (= (select (arr!18416 a!2986) (index!29742 lt!297795)) (select (arr!18416 a!2986) j!136)) (and ((_ is MissingVacant!6853) lt!297795) (= (index!29744 lt!297795) vacantSpotIndex!68) (= (select (arr!18416 a!2986) (index!29744 lt!297795)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368340 () SeekEntryResult!6853)

(assert (=> d!90737 (= lt!297795 e!368340)))

(declare-fun c!73604 () Bool)

(assert (=> d!90737 (= c!73604 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!297794 () (_ BitVec 64))

(assert (=> d!90737 (= lt!297794 (select (arr!18416 a!2986) lt!297667))))

(assert (=> d!90737 (validMask!0 mask!3053)))

(assert (=> d!90737 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297667 vacantSpotIndex!68 (select (arr!18416 a!2986) j!136) a!2986 mask!3053) lt!297795)))

(declare-fun b!643088 () Bool)

(assert (=> b!643088 (= e!368340 e!368342)))

(declare-fun c!73606 () Bool)

(assert (=> b!643088 (= c!73606 (= lt!297794 (select (arr!18416 a!2986) j!136)))))

(declare-fun b!643089 () Bool)

(assert (=> b!643089 (= e!368340 Undefined!6853)))

(declare-fun b!643090 () Bool)

(declare-fun c!73605 () Bool)

(assert (=> b!643090 (= c!73605 (= lt!297794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643090 (= e!368342 e!368341)))

(assert (= (and d!90737 c!73604) b!643089))

(assert (= (and d!90737 (not c!73604)) b!643088))

(assert (= (and b!643088 c!73606) b!643085))

(assert (= (and b!643088 (not c!73606)) b!643090))

(assert (= (and b!643090 c!73605) b!643086))

(assert (= (and b!643090 (not c!73605)) b!643087))

(assert (=> b!643087 m!616335))

(assert (=> b!643087 m!616335))

(assert (=> b!643087 m!616095))

(declare-fun m!616345 () Bool)

(assert (=> b!643087 m!616345))

(declare-fun m!616347 () Bool)

(assert (=> d!90737 m!616347))

(declare-fun m!616349 () Bool)

(assert (=> d!90737 m!616349))

(declare-fun m!616351 () Bool)

(assert (=> d!90737 m!616351))

(assert (=> d!90737 m!616149))

(assert (=> b!642851 d!90737))

(declare-fun b!643091 () Bool)

(declare-fun e!368345 () SeekEntryResult!6853)

(assert (=> b!643091 (= e!368345 (Found!6853 index!984))))

(declare-fun b!643092 () Bool)

(declare-fun e!368344 () SeekEntryResult!6853)

(assert (=> b!643092 (= e!368344 (MissingVacant!6853 vacantSpotIndex!68))))

(declare-fun b!643093 () Bool)

(assert (=> b!643093 (= e!368344 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!297666 lt!297671 mask!3053))))

(declare-fun d!90739 () Bool)

(declare-fun lt!297797 () SeekEntryResult!6853)

(assert (=> d!90739 (and (or ((_ is Undefined!6853) lt!297797) (not ((_ is Found!6853) lt!297797)) (and (bvsge (index!29742 lt!297797) #b00000000000000000000000000000000) (bvslt (index!29742 lt!297797) (size!18781 lt!297671)))) (or ((_ is Undefined!6853) lt!297797) ((_ is Found!6853) lt!297797) (not ((_ is MissingVacant!6853) lt!297797)) (not (= (index!29744 lt!297797) vacantSpotIndex!68)) (and (bvsge (index!29744 lt!297797) #b00000000000000000000000000000000) (bvslt (index!29744 lt!297797) (size!18781 lt!297671)))) (or ((_ is Undefined!6853) lt!297797) (ite ((_ is Found!6853) lt!297797) (= (select (arr!18416 lt!297671) (index!29742 lt!297797)) lt!297666) (and ((_ is MissingVacant!6853) lt!297797) (= (index!29744 lt!297797) vacantSpotIndex!68) (= (select (arr!18416 lt!297671) (index!29744 lt!297797)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!368343 () SeekEntryResult!6853)

(assert (=> d!90739 (= lt!297797 e!368343)))

(declare-fun c!73607 () Bool)

(assert (=> d!90739 (= c!73607 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!297796 () (_ BitVec 64))

(assert (=> d!90739 (= lt!297796 (select (arr!18416 lt!297671) index!984))))

(assert (=> d!90739 (validMask!0 mask!3053)))

(assert (=> d!90739 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297666 lt!297671 mask!3053) lt!297797)))

(declare-fun b!643094 () Bool)

(assert (=> b!643094 (= e!368343 e!368345)))

(declare-fun c!73609 () Bool)

(assert (=> b!643094 (= c!73609 (= lt!297796 lt!297666))))

(declare-fun b!643095 () Bool)

(assert (=> b!643095 (= e!368343 Undefined!6853)))

(declare-fun b!643096 () Bool)

(declare-fun c!73608 () Bool)

(assert (=> b!643096 (= c!73608 (= lt!297796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!643096 (= e!368345 e!368344)))

(assert (= (and d!90739 c!73607) b!643095))

(assert (= (and d!90739 (not c!73607)) b!643094))

(assert (= (and b!643094 c!73609) b!643091))

(assert (= (and b!643094 (not c!73609)) b!643096))

(assert (= (and b!643096 c!73608) b!643092))

(assert (= (and b!643096 (not c!73608)) b!643093))

(assert (=> b!643093 m!616137))

(assert (=> b!643093 m!616137))

(declare-fun m!616357 () Bool)

(assert (=> b!643093 m!616357))

(declare-fun m!616359 () Bool)

(assert (=> d!90739 m!616359))

(declare-fun m!616361 () Bool)

(assert (=> d!90739 m!616361))

(declare-fun m!616363 () Bool)

(assert (=> d!90739 m!616363))

(assert (=> d!90739 m!616149))

(assert (=> b!642851 d!90739))

(declare-fun d!90743 () Bool)

(assert (=> d!90743 (= (validKeyInArray!0 (select (arr!18416 a!2986) j!136)) (and (not (= (select (arr!18416 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18416 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642838 d!90743))

(declare-fun d!90745 () Bool)

(declare-fun res!416616 () Bool)

(declare-fun e!368351 () Bool)

(assert (=> d!90745 (=> res!416616 e!368351)))

(assert (=> d!90745 (= res!416616 (= (select (arr!18416 lt!297671) index!984) (select (arr!18416 a!2986) j!136)))))

(assert (=> d!90745 (= (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) index!984) e!368351)))

(declare-fun b!643102 () Bool)

(declare-fun e!368352 () Bool)

(assert (=> b!643102 (= e!368351 e!368352)))

(declare-fun res!416617 () Bool)

(assert (=> b!643102 (=> (not res!416617) (not e!368352))))

(assert (=> b!643102 (= res!416617 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18781 lt!297671)))))

(declare-fun b!643103 () Bool)

(assert (=> b!643103 (= e!368352 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!90745 (not res!416616)) b!643102))

(assert (= (and b!643102 res!416617) b!643103))

(assert (=> d!90745 m!616363))

(assert (=> b!643103 m!616095))

(declare-fun m!616365 () Bool)

(assert (=> b!643103 m!616365))

(assert (=> b!642839 d!90745))

(declare-fun d!90747 () Bool)

(declare-fun res!416618 () Bool)

(declare-fun e!368353 () Bool)

(assert (=> d!90747 (=> res!416618 e!368353)))

(assert (=> d!90747 (= res!416618 (= (select (arr!18416 lt!297671) j!136) (select (arr!18416 a!2986) j!136)))))

(assert (=> d!90747 (= (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) j!136) e!368353)))

(declare-fun b!643104 () Bool)

(declare-fun e!368354 () Bool)

(assert (=> b!643104 (= e!368353 e!368354)))

(declare-fun res!416619 () Bool)

(assert (=> b!643104 (=> (not res!416619) (not e!368354))))

(assert (=> b!643104 (= res!416619 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18781 lt!297671)))))

(declare-fun b!643105 () Bool)

(assert (=> b!643105 (= e!368354 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90747 (not res!416618)) b!643104))

(assert (= (and b!643104 res!416619) b!643105))

(declare-fun m!616367 () Bool)

(assert (=> d!90747 m!616367))

(assert (=> b!643105 m!616095))

(declare-fun m!616369 () Bool)

(assert (=> b!643105 m!616369))

(assert (=> b!642837 d!90747))

(declare-fun d!90749 () Bool)

(assert (=> d!90749 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58214 d!90749))

(declare-fun d!90759 () Bool)

(assert (=> d!90759 (= (array_inv!14299 a!2986) (bvsge (size!18781 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58214 d!90759))

(assert (=> b!642858 d!90745))

(assert (=> b!642858 d!90747))

(declare-fun d!90761 () Bool)

(assert (=> d!90761 (arrayNoDuplicates!0 lt!297671 j!136 Nil!12493)))

(declare-fun lt!297804 () Unit!21746)

(declare-fun choose!39 (array!38403 (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> d!90761 (= lt!297804 (choose!39 lt!297671 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90761 (bvslt (size!18781 lt!297671) #b01111111111111111111111111111111)))

(assert (=> d!90761 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297671 #b00000000000000000000000000000000 j!136) lt!297804)))

(declare-fun bs!19216 () Bool)

(assert (= bs!19216 d!90761))

(assert (=> bs!19216 m!616101))

(declare-fun m!616379 () Bool)

(assert (=> bs!19216 m!616379))

(assert (=> b!642848 d!90761))

(declare-fun d!90763 () Bool)

(assert (=> d!90763 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18781 lt!297671)) (not (= (select (arr!18416 lt!297671) j!136) (select (arr!18416 a!2986) j!136))))))

(declare-fun lt!297811 () Unit!21746)

(declare-fun choose!21 (array!38403 (_ BitVec 64) (_ BitVec 32) List!12496) Unit!21746)

(assert (=> d!90763 (= lt!297811 (choose!21 lt!297671 (select (arr!18416 a!2986) j!136) j!136 Nil!12493))))

(assert (=> d!90763 (bvslt (size!18781 lt!297671) #b01111111111111111111111111111111)))

(assert (=> d!90763 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297671 (select (arr!18416 a!2986) j!136) j!136 Nil!12493) lt!297811)))

(declare-fun bs!19217 () Bool)

(assert (= bs!19217 d!90763))

(assert (=> bs!19217 m!616367))

(assert (=> bs!19217 m!616095))

(declare-fun m!616381 () Bool)

(assert (=> bs!19217 m!616381))

(assert (=> b!642848 d!90763))

(declare-fun d!90767 () Bool)

(assert (=> d!90767 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297816 () Unit!21746)

(declare-fun choose!114 (array!38403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21746)

(assert (=> d!90767 (= lt!297816 (choose!114 lt!297671 (select (arr!18416 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90767 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90767 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297671 (select (arr!18416 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297816)))

(declare-fun bs!19218 () Bool)

(assert (= bs!19218 d!90767))

(assert (=> bs!19218 m!616095))

(assert (=> bs!19218 m!616111))

(assert (=> bs!19218 m!616095))

(declare-fun m!616389 () Bool)

(assert (=> bs!19218 m!616389))

(assert (=> b!642848 d!90767))

(declare-fun b!643128 () Bool)

(declare-fun e!368369 () Bool)

(declare-fun e!368371 () Bool)

(assert (=> b!643128 (= e!368369 e!368371)))

(declare-fun c!73619 () Bool)

(assert (=> b!643128 (= c!73619 (validKeyInArray!0 (select (arr!18416 lt!297671) j!136)))))

(declare-fun b!643129 () Bool)

(declare-fun call!33564 () Bool)

(assert (=> b!643129 (= e!368371 call!33564)))

(declare-fun d!90773 () Bool)

(declare-fun res!416624 () Bool)

(declare-fun e!368368 () Bool)

(assert (=> d!90773 (=> res!416624 e!368368)))

(assert (=> d!90773 (= res!416624 (bvsge j!136 (size!18781 lt!297671)))))

(assert (=> d!90773 (= (arrayNoDuplicates!0 lt!297671 j!136 Nil!12493) e!368368)))

(declare-fun b!643130 () Bool)

(assert (=> b!643130 (= e!368368 e!368369)))

(declare-fun res!416626 () Bool)

(assert (=> b!643130 (=> (not res!416626) (not e!368369))))

(declare-fun e!368370 () Bool)

(assert (=> b!643130 (= res!416626 (not e!368370))))

(declare-fun res!416625 () Bool)

(assert (=> b!643130 (=> (not res!416625) (not e!368370))))

(assert (=> b!643130 (= res!416625 (validKeyInArray!0 (select (arr!18416 lt!297671) j!136)))))

(declare-fun bm!33561 () Bool)

(assert (=> bm!33561 (= call!33564 (arrayNoDuplicates!0 lt!297671 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73619 (Cons!12492 (select (arr!18416 lt!297671) j!136) Nil!12493) Nil!12493)))))

(declare-fun b!643131 () Bool)

(assert (=> b!643131 (= e!368371 call!33564)))

(declare-fun b!643132 () Bool)

(assert (=> b!643132 (= e!368370 (contains!3125 Nil!12493 (select (arr!18416 lt!297671) j!136)))))

(assert (= (and d!90773 (not res!416624)) b!643130))

(assert (= (and b!643130 res!416625) b!643132))

(assert (= (and b!643130 res!416626) b!643128))

(assert (= (and b!643128 c!73619) b!643129))

(assert (= (and b!643128 (not c!73619)) b!643131))

(assert (= (or b!643129 b!643131) bm!33561))

(assert (=> b!643128 m!616367))

(assert (=> b!643128 m!616367))

(declare-fun m!616391 () Bool)

(assert (=> b!643128 m!616391))

(assert (=> b!643130 m!616367))

(assert (=> b!643130 m!616367))

(assert (=> b!643130 m!616391))

(assert (=> bm!33561 m!616367))

(declare-fun m!616393 () Bool)

(assert (=> bm!33561 m!616393))

(assert (=> b!643132 m!616367))

(assert (=> b!643132 m!616367))

(declare-fun m!616395 () Bool)

(assert (=> b!643132 m!616395))

(assert (=> b!642848 d!90773))

(declare-fun d!90775 () Bool)

(declare-fun res!416627 () Bool)

(declare-fun e!368372 () Bool)

(assert (=> d!90775 (=> res!416627 e!368372)))

(assert (=> d!90775 (= res!416627 (= (select (arr!18416 lt!297671) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18416 a!2986) j!136)))))

(assert (=> d!90775 (= (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368372)))

(declare-fun b!643133 () Bool)

(declare-fun e!368373 () Bool)

(assert (=> b!643133 (= e!368372 e!368373)))

(declare-fun res!416628 () Bool)

(assert (=> b!643133 (=> (not res!416628) (not e!368373))))

(assert (=> b!643133 (= res!416628 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18781 lt!297671)))))

(declare-fun b!643134 () Bool)

(assert (=> b!643134 (= e!368373 (arrayContainsKey!0 lt!297671 (select (arr!18416 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90775 (not res!416627)) b!643133))

(assert (= (and b!643133 res!416628) b!643134))

(declare-fun m!616397 () Bool)

(assert (=> d!90775 m!616397))

(assert (=> b!643134 m!616095))

(declare-fun m!616399 () Bool)

(assert (=> b!643134 m!616399))

(assert (=> b!642848 d!90775))

(declare-fun b!643135 () Bool)

(declare-fun e!368375 () Bool)

(declare-fun e!368377 () Bool)

(assert (=> b!643135 (= e!368375 e!368377)))

(declare-fun c!73620 () Bool)

(assert (=> b!643135 (= c!73620 (validKeyInArray!0 (select (arr!18416 lt!297671) #b00000000000000000000000000000000)))))

(declare-fun b!643136 () Bool)

(declare-fun call!33565 () Bool)

(assert (=> b!643136 (= e!368377 call!33565)))

(declare-fun d!90777 () Bool)

(declare-fun res!416629 () Bool)

(declare-fun e!368374 () Bool)

(assert (=> d!90777 (=> res!416629 e!368374)))

(assert (=> d!90777 (= res!416629 (bvsge #b00000000000000000000000000000000 (size!18781 lt!297671)))))

(assert (=> d!90777 (= (arrayNoDuplicates!0 lt!297671 #b00000000000000000000000000000000 Nil!12493) e!368374)))

(declare-fun b!643137 () Bool)

(assert (=> b!643137 (= e!368374 e!368375)))

(declare-fun res!416631 () Bool)

(assert (=> b!643137 (=> (not res!416631) (not e!368375))))

(declare-fun e!368376 () Bool)

(assert (=> b!643137 (= res!416631 (not e!368376))))

(declare-fun res!416630 () Bool)

(assert (=> b!643137 (=> (not res!416630) (not e!368376))))

(assert (=> b!643137 (= res!416630 (validKeyInArray!0 (select (arr!18416 lt!297671) #b00000000000000000000000000000000)))))

(declare-fun bm!33562 () Bool)

(assert (=> bm!33562 (= call!33565 (arrayNoDuplicates!0 lt!297671 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73620 (Cons!12492 (select (arr!18416 lt!297671) #b00000000000000000000000000000000) Nil!12493) Nil!12493)))))

(declare-fun b!643138 () Bool)

(assert (=> b!643138 (= e!368377 call!33565)))

(declare-fun b!643139 () Bool)

(assert (=> b!643139 (= e!368376 (contains!3125 Nil!12493 (select (arr!18416 lt!297671) #b00000000000000000000000000000000)))))

(assert (= (and d!90777 (not res!416629)) b!643137))

(assert (= (and b!643137 res!416630) b!643139))

(assert (= (and b!643137 res!416631) b!643135))

(assert (= (and b!643135 c!73620) b!643136))

(assert (= (and b!643135 (not c!73620)) b!643138))

(assert (= (or b!643136 b!643138) bm!33562))

(declare-fun m!616401 () Bool)

(assert (=> b!643135 m!616401))

(assert (=> b!643135 m!616401))

(declare-fun m!616403 () Bool)

(assert (=> b!643135 m!616403))

(assert (=> b!643137 m!616401))

(assert (=> b!643137 m!616401))

(assert (=> b!643137 m!616403))

(assert (=> bm!33562 m!616401))

(declare-fun m!616405 () Bool)

(assert (=> bm!33562 m!616405))

(assert (=> b!643139 m!616401))

(assert (=> b!643139 m!616401))

(declare-fun m!616407 () Bool)

(assert (=> b!643139 m!616407))

(assert (=> b!642848 d!90777))

(declare-fun d!90779 () Bool)

(declare-fun e!368380 () Bool)

(assert (=> d!90779 e!368380))

(declare-fun res!416634 () Bool)

(assert (=> d!90779 (=> (not res!416634) (not e!368380))))

(assert (=> d!90779 (= res!416634 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18781 a!2986))))))

(declare-fun lt!297819 () Unit!21746)

(declare-fun choose!41 (array!38403 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12496) Unit!21746)

(assert (=> d!90779 (= lt!297819 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12493))))

(assert (=> d!90779 (bvslt (size!18781 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90779 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12493) lt!297819)))

(declare-fun b!643142 () Bool)

(assert (=> b!643142 (= e!368380 (arrayNoDuplicates!0 (array!38404 (store (arr!18416 a!2986) i!1108 k0!1786) (size!18781 a!2986)) #b00000000000000000000000000000000 Nil!12493))))

(assert (= (and d!90779 res!416634) b!643142))

(declare-fun m!616409 () Bool)

(assert (=> d!90779 m!616409))

(assert (=> b!643142 m!616125))

(declare-fun m!616411 () Bool)

(assert (=> b!643142 m!616411))

(assert (=> b!642848 d!90779))

(declare-fun b!643166 () Bool)

(declare-fun e!368396 () Bool)

(declare-fun call!33568 () Bool)

(assert (=> b!643166 (= e!368396 call!33568)))

(declare-fun bm!33565 () Bool)

(assert (=> bm!33565 (= call!33568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!90781 () Bool)

(declare-fun res!416643 () Bool)

(declare-fun e!368397 () Bool)

(assert (=> d!90781 (=> res!416643 e!368397)))

(assert (=> d!90781 (= res!416643 (bvsge #b00000000000000000000000000000000 (size!18781 a!2986)))))

(assert (=> d!90781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368397)))

(declare-fun b!643167 () Bool)

(declare-fun e!368398 () Bool)

(assert (=> b!643167 (= e!368398 call!33568)))

(declare-fun b!643168 () Bool)

(assert (=> b!643168 (= e!368397 e!368398)))

(declare-fun c!73629 () Bool)

(assert (=> b!643168 (= c!73629 (validKeyInArray!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643169 () Bool)

(assert (=> b!643169 (= e!368398 e!368396)))

(declare-fun lt!297836 () (_ BitVec 64))

(assert (=> b!643169 (= lt!297836 (select (arr!18416 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297835 () Unit!21746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38403 (_ BitVec 64) (_ BitVec 32)) Unit!21746)

(assert (=> b!643169 (= lt!297835 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297836 #b00000000000000000000000000000000))))

(assert (=> b!643169 (arrayContainsKey!0 a!2986 lt!297836 #b00000000000000000000000000000000)))

(declare-fun lt!297837 () Unit!21746)

(assert (=> b!643169 (= lt!297837 lt!297835)))

(declare-fun res!416642 () Bool)

(assert (=> b!643169 (= res!416642 (= (seekEntryOrOpen!0 (select (arr!18416 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6853 #b00000000000000000000000000000000)))))

(assert (=> b!643169 (=> (not res!416642) (not e!368396))))

(assert (= (and d!90781 (not res!416643)) b!643168))

(assert (= (and b!643168 c!73629) b!643169))

(assert (= (and b!643168 (not c!73629)) b!643167))

(assert (= (and b!643169 res!416642) b!643166))

(assert (= (or b!643166 b!643167) bm!33565))

(declare-fun m!616417 () Bool)

(assert (=> bm!33565 m!616417))

(assert (=> b!643168 m!616289))

(assert (=> b!643168 m!616289))

(assert (=> b!643168 m!616291))

(assert (=> b!643169 m!616289))

(declare-fun m!616419 () Bool)

(assert (=> b!643169 m!616419))

(declare-fun m!616421 () Bool)

(assert (=> b!643169 m!616421))

(assert (=> b!643169 m!616289))

(declare-fun m!616423 () Bool)

(assert (=> b!643169 m!616423))

(assert (=> b!642847 d!90781))

(check-sat (not b!643038) (not b!643093) (not b!643076) (not bm!33562) (not b!643132) (not bm!33565) (not d!90737) (not b!643021) (not d!90719) (not d!90713) (not b!643137) (not d!90729) (not d!90739) (not b!643142) (not d!90707) (not b!643003) (not b!643087) (not b!643134) (not d!90763) (not d!90779) (not b!643079) (not bm!33556) (not b!643139) (not b!643169) (not b!643128) (not d!90735) (not b!643105) (not b!643023) (not d!90761) (not bm!33561) (not b!643103) (not b!643168) (not d!90767) (not b!643130) (not b!643019) (not b!643135) (not b!643047))
(check-sat)
