; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56010 () Bool)

(assert start!56010)

(declare-fun b!616027 () Bool)

(declare-datatypes ((Unit!20046 0))(
  ( (Unit!20047) )
))
(declare-fun e!353195 () Unit!20046)

(declare-fun Unit!20048 () Unit!20046)

(assert (=> b!616027 (= e!353195 Unit!20048)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun b!616028 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37494 0))(
  ( (array!37495 (arr!17993 (Array (_ BitVec 32) (_ BitVec 64))) (size!18358 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37494)

(declare-fun e!353199 () Bool)

(declare-fun lt!283169 () array!37494)

(declare-fun arrayContainsKey!0 (array!37494 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!616028 (= e!353199 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) index!984))))

(declare-fun b!616030 () Bool)

(declare-fun res!396869 () Bool)

(declare-fun e!353208 () Bool)

(assert (=> b!616030 (=> (not res!396869) (not e!353208))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37494 (_ BitVec 32)) Bool)

(assert (=> b!616030 (= res!396869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!616031 () Bool)

(declare-fun res!396870 () Bool)

(declare-fun e!353205 () Bool)

(assert (=> b!616031 (=> (not res!396870) (not e!353205))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!616031 (= res!396870 (validKeyInArray!0 k0!1786))))

(declare-fun b!616032 () Bool)

(declare-fun e!353203 () Bool)

(declare-fun e!353198 () Bool)

(assert (=> b!616032 (= e!353203 (not e!353198))))

(declare-fun res!396872 () Bool)

(assert (=> b!616032 (=> res!396872 e!353198)))

(assert (=> b!616032 (= res!396872 (bvslt mask!3053 #b00000000000000000000000000000000))))

(declare-fun lt!283178 () Unit!20046)

(declare-fun e!353202 () Unit!20046)

(assert (=> b!616032 (= lt!283178 e!353202)))

(declare-fun c!69954 () Bool)

(declare-datatypes ((SeekEntryResult!6430 0))(
  ( (MissingZero!6430 (index!28004 (_ BitVec 32))) (Found!6430 (index!28005 (_ BitVec 32))) (Intermediate!6430 (undefined!7242 Bool) (index!28006 (_ BitVec 32)) (x!56809 (_ BitVec 32))) (Undefined!6430) (MissingVacant!6430 (index!28007 (_ BitVec 32))) )
))
(declare-fun lt!283166 () SeekEntryResult!6430)

(assert (=> b!616032 (= c!69954 (= lt!283166 (Found!6430 index!984)))))

(declare-fun lt!283177 () Unit!20046)

(assert (=> b!616032 (= lt!283177 e!353195)))

(declare-fun c!69952 () Bool)

(assert (=> b!616032 (= c!69952 (= lt!283166 Undefined!6430))))

(declare-fun lt!283173 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37494 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!616032 (= lt!283166 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!283173 lt!283169 mask!3053))))

(declare-fun e!353201 () Bool)

(assert (=> b!616032 e!353201))

(declare-fun res!396875 () Bool)

(assert (=> b!616032 (=> (not res!396875) (not e!353201))))

(declare-fun lt!283167 () (_ BitVec 32))

(declare-fun lt!283175 () SeekEntryResult!6430)

(assert (=> b!616032 (= res!396875 (= lt!283175 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283167 vacantSpotIndex!68 lt!283173 lt!283169 mask!3053)))))

(assert (=> b!616032 (= lt!283175 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!283167 vacantSpotIndex!68 (select (arr!17993 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!616032 (= lt!283173 (select (store (arr!17993 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!283174 () Unit!20046)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37494 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20046)

(assert (=> b!616032 (= lt!283174 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!283167 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!616032 (= lt!283167 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!616033 () Bool)

(assert (=> b!616033 false))

(declare-fun lt!283180 () Unit!20046)

(declare-datatypes ((List!12073 0))(
  ( (Nil!12070) (Cons!12069 (h!13114 (_ BitVec 64)) (t!18292 List!12073)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37494 (_ BitVec 64) (_ BitVec 32) List!12073) Unit!20046)

(assert (=> b!616033 (= lt!283180 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283169 (select (arr!17993 a!2986) j!136) index!984 Nil!12070))))

(declare-fun arrayNoDuplicates!0 (array!37494 (_ BitVec 32) List!12073) Bool)

(assert (=> b!616033 (arrayNoDuplicates!0 lt!283169 index!984 Nil!12070)))

(declare-fun lt!283165 () Unit!20046)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37494 (_ BitVec 32) (_ BitVec 32)) Unit!20046)

(assert (=> b!616033 (= lt!283165 (lemmaNoDuplicateFromThenFromBigger!0 lt!283169 #b00000000000000000000000000000000 index!984))))

(assert (=> b!616033 (arrayNoDuplicates!0 lt!283169 #b00000000000000000000000000000000 Nil!12070)))

(declare-fun lt!283164 () Unit!20046)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12073) Unit!20046)

(assert (=> b!616033 (= lt!283164 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12070))))

(assert (=> b!616033 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!283182 () Unit!20046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37494 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20046)

(assert (=> b!616033 (= lt!283182 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283169 (select (arr!17993 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!616033 e!353199))

(declare-fun res!396859 () Bool)

(assert (=> b!616033 (=> (not res!396859) (not e!353199))))

(assert (=> b!616033 (= res!396859 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) j!136))))

(declare-fun e!353194 () Unit!20046)

(declare-fun Unit!20049 () Unit!20046)

(assert (=> b!616033 (= e!353194 Unit!20049)))

(declare-fun b!616034 () Bool)

(assert (=> b!616034 false))

(declare-fun lt!283168 () Unit!20046)

(assert (=> b!616034 (= lt!283168 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!283169 (select (arr!17993 a!2986) j!136) j!136 Nil!12070))))

(assert (=> b!616034 (arrayNoDuplicates!0 lt!283169 j!136 Nil!12070)))

(declare-fun lt!283170 () Unit!20046)

(assert (=> b!616034 (= lt!283170 (lemmaNoDuplicateFromThenFromBigger!0 lt!283169 #b00000000000000000000000000000000 j!136))))

(assert (=> b!616034 (arrayNoDuplicates!0 lt!283169 #b00000000000000000000000000000000 Nil!12070)))

(declare-fun lt!283179 () Unit!20046)

(assert (=> b!616034 (= lt!283179 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12070))))

(assert (=> b!616034 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!283176 () Unit!20046)

(assert (=> b!616034 (= lt!283176 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!283169 (select (arr!17993 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!353206 () Unit!20046)

(declare-fun Unit!20050 () Unit!20046)

(assert (=> b!616034 (= e!353206 Unit!20050)))

(declare-fun b!616035 () Bool)

(declare-fun res!396871 () Bool)

(assert (=> b!616035 (= res!396871 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) j!136))))

(declare-fun e!353196 () Bool)

(assert (=> b!616035 (=> (not res!396871) (not e!353196))))

(declare-fun e!353197 () Bool)

(assert (=> b!616035 (= e!353197 e!353196)))

(declare-fun b!616036 () Bool)

(declare-fun res!396863 () Bool)

(assert (=> b!616036 (=> (not res!396863) (not e!353208))))

(assert (=> b!616036 (= res!396863 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17993 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!616037 () Bool)

(declare-fun res!396864 () Bool)

(assert (=> b!616037 (=> (not res!396864) (not e!353205))))

(assert (=> b!616037 (= res!396864 (validKeyInArray!0 (select (arr!17993 a!2986) j!136)))))

(declare-fun b!616038 () Bool)

(declare-fun res!396862 () Bool)

(assert (=> b!616038 (=> (not res!396862) (not e!353205))))

(assert (=> b!616038 (= res!396862 (and (= (size!18358 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18358 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18358 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!616039 () Bool)

(assert (=> b!616039 (= e!353198 (validKeyInArray!0 lt!283173))))

(declare-fun b!616040 () Bool)

(declare-fun Unit!20051 () Unit!20046)

(assert (=> b!616040 (= e!353202 Unit!20051)))

(declare-fun res!396866 () Bool)

(assert (=> b!616040 (= res!396866 (= (select (store (arr!17993 a!2986) i!1108 k0!1786) index!984) (select (arr!17993 a!2986) j!136)))))

(declare-fun e!353200 () Bool)

(assert (=> b!616040 (=> (not res!396866) (not e!353200))))

(assert (=> b!616040 e!353200))

(declare-fun c!69953 () Bool)

(assert (=> b!616040 (= c!69953 (bvslt j!136 index!984))))

(declare-fun lt!283181 () Unit!20046)

(assert (=> b!616040 (= lt!283181 e!353206)))

(declare-fun c!69951 () Bool)

(assert (=> b!616040 (= c!69951 (bvslt index!984 j!136))))

(declare-fun lt!283171 () Unit!20046)

(assert (=> b!616040 (= lt!283171 e!353194)))

(assert (=> b!616040 false))

(declare-fun b!616041 () Bool)

(declare-fun Unit!20052 () Unit!20046)

(assert (=> b!616041 (= e!353202 Unit!20052)))

(declare-fun b!616042 () Bool)

(declare-fun res!396860 () Bool)

(assert (=> b!616042 (=> (not res!396860) (not e!353205))))

(assert (=> b!616042 (= res!396860 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!616043 () Bool)

(declare-fun Unit!20053 () Unit!20046)

(assert (=> b!616043 (= e!353194 Unit!20053)))

(declare-fun b!616044 () Bool)

(declare-fun lt!283172 () SeekEntryResult!6430)

(assert (=> b!616044 (= e!353201 (= lt!283172 lt!283175))))

(declare-fun b!616045 () Bool)

(declare-fun e!353207 () Bool)

(assert (=> b!616045 (= e!353207 e!353203)))

(declare-fun res!396874 () Bool)

(assert (=> b!616045 (=> (not res!396874) (not e!353203))))

(assert (=> b!616045 (= res!396874 (and (= lt!283172 (Found!6430 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17993 a!2986) index!984) (select (arr!17993 a!2986) j!136))) (not (= (select (arr!17993 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!616045 (= lt!283172 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17993 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!616029 () Bool)

(declare-fun Unit!20054 () Unit!20046)

(assert (=> b!616029 (= e!353195 Unit!20054)))

(assert (=> b!616029 false))

(declare-fun res!396868 () Bool)

(assert (=> start!56010 (=> (not res!396868) (not e!353205))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56010 (= res!396868 (validMask!0 mask!3053))))

(assert (=> start!56010 e!353205))

(assert (=> start!56010 true))

(declare-fun array_inv!13876 (array!37494) Bool)

(assert (=> start!56010 (array_inv!13876 a!2986)))

(declare-fun b!616046 () Bool)

(assert (=> b!616046 (= e!353205 e!353208)))

(declare-fun res!396873 () Bool)

(assert (=> b!616046 (=> (not res!396873) (not e!353208))))

(declare-fun lt!283183 () SeekEntryResult!6430)

(assert (=> b!616046 (= res!396873 (or (= lt!283183 (MissingZero!6430 i!1108)) (= lt!283183 (MissingVacant!6430 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37494 (_ BitVec 32)) SeekEntryResult!6430)

(assert (=> b!616046 (= lt!283183 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!616047 () Bool)

(declare-fun res!396865 () Bool)

(assert (=> b!616047 (=> (not res!396865) (not e!353208))))

(assert (=> b!616047 (= res!396865 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12070))))

(declare-fun b!616048 () Bool)

(assert (=> b!616048 (= e!353208 e!353207)))

(declare-fun res!396861 () Bool)

(assert (=> b!616048 (=> (not res!396861) (not e!353207))))

(assert (=> b!616048 (= res!396861 (= (select (store (arr!17993 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!616048 (= lt!283169 (array!37495 (store (arr!17993 a!2986) i!1108 k0!1786) (size!18358 a!2986)))))

(declare-fun b!616049 () Bool)

(declare-fun Unit!20055 () Unit!20046)

(assert (=> b!616049 (= e!353206 Unit!20055)))

(declare-fun b!616050 () Bool)

(assert (=> b!616050 (= e!353196 (arrayContainsKey!0 lt!283169 (select (arr!17993 a!2986) j!136) index!984))))

(declare-fun b!616051 () Bool)

(declare-fun res!396867 () Bool)

(assert (=> b!616051 (= res!396867 (bvsge j!136 index!984))))

(assert (=> b!616051 (=> res!396867 e!353197)))

(assert (=> b!616051 (= e!353200 e!353197)))

(assert (= (and start!56010 res!396868) b!616038))

(assert (= (and b!616038 res!396862) b!616037))

(assert (= (and b!616037 res!396864) b!616031))

(assert (= (and b!616031 res!396870) b!616042))

(assert (= (and b!616042 res!396860) b!616046))

(assert (= (and b!616046 res!396873) b!616030))

(assert (= (and b!616030 res!396869) b!616047))

(assert (= (and b!616047 res!396865) b!616036))

(assert (= (and b!616036 res!396863) b!616048))

(assert (= (and b!616048 res!396861) b!616045))

(assert (= (and b!616045 res!396874) b!616032))

(assert (= (and b!616032 res!396875) b!616044))

(assert (= (and b!616032 c!69952) b!616029))

(assert (= (and b!616032 (not c!69952)) b!616027))

(assert (= (and b!616032 c!69954) b!616040))

(assert (= (and b!616032 (not c!69954)) b!616041))

(assert (= (and b!616040 res!396866) b!616051))

(assert (= (and b!616051 (not res!396867)) b!616035))

(assert (= (and b!616035 res!396871) b!616050))

(assert (= (and b!616040 c!69953) b!616034))

(assert (= (and b!616040 (not c!69953)) b!616049))

(assert (= (and b!616040 c!69951) b!616033))

(assert (= (and b!616040 (not c!69951)) b!616043))

(assert (= (and b!616033 res!396859) b!616028))

(assert (= (and b!616032 (not res!396872)) b!616039))

(declare-fun m!591703 () Bool)

(assert (=> b!616033 m!591703))

(declare-fun m!591705 () Bool)

(assert (=> b!616033 m!591705))

(declare-fun m!591707 () Bool)

(assert (=> b!616033 m!591707))

(assert (=> b!616033 m!591705))

(declare-fun m!591709 () Bool)

(assert (=> b!616033 m!591709))

(assert (=> b!616033 m!591705))

(assert (=> b!616033 m!591705))

(declare-fun m!591711 () Bool)

(assert (=> b!616033 m!591711))

(declare-fun m!591713 () Bool)

(assert (=> b!616033 m!591713))

(assert (=> b!616033 m!591705))

(declare-fun m!591715 () Bool)

(assert (=> b!616033 m!591715))

(declare-fun m!591717 () Bool)

(assert (=> b!616033 m!591717))

(declare-fun m!591719 () Bool)

(assert (=> b!616033 m!591719))

(assert (=> b!616035 m!591705))

(assert (=> b!616035 m!591705))

(assert (=> b!616035 m!591711))

(declare-fun m!591721 () Bool)

(assert (=> b!616031 m!591721))

(declare-fun m!591723 () Bool)

(assert (=> b!616048 m!591723))

(declare-fun m!591725 () Bool)

(assert (=> b!616048 m!591725))

(declare-fun m!591727 () Bool)

(assert (=> b!616046 m!591727))

(declare-fun m!591729 () Bool)

(assert (=> b!616032 m!591729))

(declare-fun m!591731 () Bool)

(assert (=> b!616032 m!591731))

(assert (=> b!616032 m!591705))

(assert (=> b!616032 m!591705))

(declare-fun m!591733 () Bool)

(assert (=> b!616032 m!591733))

(declare-fun m!591735 () Bool)

(assert (=> b!616032 m!591735))

(declare-fun m!591737 () Bool)

(assert (=> b!616032 m!591737))

(assert (=> b!616032 m!591723))

(declare-fun m!591739 () Bool)

(assert (=> b!616032 m!591739))

(declare-fun m!591741 () Bool)

(assert (=> start!56010 m!591741))

(declare-fun m!591743 () Bool)

(assert (=> start!56010 m!591743))

(declare-fun m!591745 () Bool)

(assert (=> b!616039 m!591745))

(assert (=> b!616034 m!591703))

(assert (=> b!616034 m!591705))

(declare-fun m!591747 () Bool)

(assert (=> b!616034 m!591747))

(assert (=> b!616034 m!591705))

(assert (=> b!616034 m!591705))

(declare-fun m!591749 () Bool)

(assert (=> b!616034 m!591749))

(assert (=> b!616034 m!591705))

(declare-fun m!591751 () Bool)

(assert (=> b!616034 m!591751))

(assert (=> b!616034 m!591717))

(declare-fun m!591753 () Bool)

(assert (=> b!616034 m!591753))

(declare-fun m!591755 () Bool)

(assert (=> b!616034 m!591755))

(assert (=> b!616050 m!591705))

(assert (=> b!616050 m!591705))

(declare-fun m!591757 () Bool)

(assert (=> b!616050 m!591757))

(declare-fun m!591759 () Bool)

(assert (=> b!616047 m!591759))

(declare-fun m!591761 () Bool)

(assert (=> b!616045 m!591761))

(assert (=> b!616045 m!591705))

(assert (=> b!616045 m!591705))

(declare-fun m!591763 () Bool)

(assert (=> b!616045 m!591763))

(assert (=> b!616037 m!591705))

(assert (=> b!616037 m!591705))

(declare-fun m!591765 () Bool)

(assert (=> b!616037 m!591765))

(assert (=> b!616028 m!591705))

(assert (=> b!616028 m!591705))

(assert (=> b!616028 m!591757))

(declare-fun m!591767 () Bool)

(assert (=> b!616036 m!591767))

(assert (=> b!616040 m!591723))

(declare-fun m!591769 () Bool)

(assert (=> b!616040 m!591769))

(assert (=> b!616040 m!591705))

(declare-fun m!591771 () Bool)

(assert (=> b!616042 m!591771))

(declare-fun m!591773 () Bool)

(assert (=> b!616030 m!591773))

(check-sat (not b!616030) (not b!616039) (not b!616035) (not b!616033) (not b!616032) (not b!616042) (not b!616045) (not b!616047) (not b!616028) (not b!616046) (not b!616037) (not start!56010) (not b!616050) (not b!616031) (not b!616034))
(check-sat)
