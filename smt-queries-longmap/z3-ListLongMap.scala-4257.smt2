; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59154 () Bool)

(assert start!59154)

(declare-fun b!652173 () Bool)

(declare-datatypes ((Unit!22251 0))(
  ( (Unit!22252) )
))
(declare-fun e!374307 () Unit!22251)

(declare-fun Unit!22253 () Unit!22251)

(assert (=> b!652173 (= e!374307 Unit!22253)))

(declare-fun b!652174 () Bool)

(declare-fun e!374305 () Bool)

(declare-fun e!374295 () Bool)

(assert (=> b!652174 (= e!374305 e!374295)))

(declare-fun res!422829 () Bool)

(assert (=> b!652174 (=> (not res!422829) (not e!374295))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38592 0))(
  ( (array!38593 (arr!18496 (Array (_ BitVec 32) (_ BitVec 64))) (size!18860 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38592)

(assert (=> b!652174 (= res!422829 (= (select (store (arr!18496 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!303332 () array!38592)

(assert (=> b!652174 (= lt!303332 (array!38593 (store (arr!18496 a!2986) i!1108 k0!1786) (size!18860 a!2986)))))

(declare-fun b!652175 () Bool)

(declare-fun Unit!22254 () Unit!22251)

(assert (=> b!652175 (= e!374307 Unit!22254)))

(assert (=> b!652175 false))

(declare-fun b!652176 () Bool)

(declare-fun e!374296 () Unit!22251)

(declare-fun Unit!22255 () Unit!22251)

(assert (=> b!652176 (= e!374296 Unit!22255)))

(declare-fun b!652178 () Bool)

(declare-fun e!374303 () Bool)

(assert (=> b!652178 (= e!374303 e!374305)))

(declare-fun res!422836 () Bool)

(assert (=> b!652178 (=> (not res!422836) (not e!374305))))

(declare-datatypes ((SeekEntryResult!6892 0))(
  ( (MissingZero!6892 (index!29921 (_ BitVec 32))) (Found!6892 (index!29922 (_ BitVec 32))) (Intermediate!6892 (undefined!7704 Bool) (index!29923 (_ BitVec 32)) (x!58862 (_ BitVec 32))) (Undefined!6892) (MissingVacant!6892 (index!29924 (_ BitVec 32))) )
))
(declare-fun lt!303338 () SeekEntryResult!6892)

(assert (=> b!652178 (= res!422836 (or (= lt!303338 (MissingZero!6892 i!1108)) (= lt!303338 (MissingVacant!6892 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38592 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!652178 (= lt!303338 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!652179 () Bool)

(declare-fun e!374300 () Bool)

(declare-fun e!374297 () Bool)

(assert (=> b!652179 (= e!374300 e!374297)))

(declare-fun res!422834 () Bool)

(assert (=> b!652179 (=> res!422834 e!374297)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!303339 () (_ BitVec 64))

(declare-fun lt!303342 () (_ BitVec 64))

(assert (=> b!652179 (= res!422834 (or (not (= (select (arr!18496 a!2986) j!136) lt!303342)) (not (= (select (arr!18496 a!2986) j!136) lt!303339))))))

(declare-fun e!374298 () Bool)

(assert (=> b!652179 e!374298))

(declare-fun res!422827 () Bool)

(assert (=> b!652179 (=> (not res!422827) (not e!374298))))

(assert (=> b!652179 (= res!422827 (= lt!303339 (select (arr!18496 a!2986) j!136)))))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!652179 (= lt!303339 (select (store (arr!18496 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!652180 () Bool)

(declare-fun res!422820 () Bool)

(assert (=> b!652180 (=> (not res!422820) (not e!374303))))

(declare-fun arrayContainsKey!0 (array!38592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!652180 (= res!422820 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!652181 () Bool)

(declare-fun res!422823 () Bool)

(assert (=> b!652181 (=> (not res!422823) (not e!374303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!652181 (= res!422823 (validKeyInArray!0 k0!1786))))

(declare-fun b!652182 () Bool)

(declare-fun e!374293 () Bool)

(assert (=> b!652182 (= e!374293 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) index!984))))

(declare-fun b!652183 () Bool)

(declare-fun e!374302 () Bool)

(assert (=> b!652183 (= e!374302 (not e!374300))))

(declare-fun res!422822 () Bool)

(assert (=> b!652183 (=> res!422822 e!374300)))

(declare-fun lt!303341 () SeekEntryResult!6892)

(assert (=> b!652183 (= res!422822 (not (= lt!303341 (Found!6892 index!984))))))

(declare-fun lt!303329 () Unit!22251)

(assert (=> b!652183 (= lt!303329 e!374307)))

(declare-fun c!75047 () Bool)

(assert (=> b!652183 (= c!75047 (= lt!303341 Undefined!6892))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38592 (_ BitVec 32)) SeekEntryResult!6892)

(assert (=> b!652183 (= lt!303341 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!303342 lt!303332 mask!3053))))

(declare-fun e!374294 () Bool)

(assert (=> b!652183 e!374294))

(declare-fun res!422828 () Bool)

(assert (=> b!652183 (=> (not res!422828) (not e!374294))))

(declare-fun lt!303327 () SeekEntryResult!6892)

(declare-fun lt!303335 () (_ BitVec 32))

(assert (=> b!652183 (= res!422828 (= lt!303327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303335 vacantSpotIndex!68 lt!303342 lt!303332 mask!3053)))))

(assert (=> b!652183 (= lt!303327 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!303335 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!652183 (= lt!303342 (select (store (arr!18496 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!303340 () Unit!22251)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38592 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22251)

(assert (=> b!652183 (= lt!303340 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!303335 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!652183 (= lt!303335 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!652184 () Bool)

(declare-fun lt!303337 () SeekEntryResult!6892)

(assert (=> b!652184 (= e!374294 (= lt!303337 lt!303327))))

(declare-fun b!652185 () Bool)

(assert (=> b!652185 (= e!374295 e!374302)))

(declare-fun res!422835 () Bool)

(assert (=> b!652185 (=> (not res!422835) (not e!374302))))

(assert (=> b!652185 (= res!422835 (and (= lt!303337 (Found!6892 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18496 a!2986) index!984) (select (arr!18496 a!2986) j!136))) (not (= (select (arr!18496 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!652185 (= lt!303337 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18496 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!652186 () Bool)

(declare-fun res!422821 () Bool)

(assert (=> b!652186 (=> (not res!422821) (not e!374305))))

(assert (=> b!652186 (= res!422821 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18496 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!652187 () Bool)

(declare-fun Unit!22256 () Unit!22251)

(assert (=> b!652187 (= e!374296 Unit!22256)))

(declare-fun lt!303334 () Unit!22251)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22251)

(assert (=> b!652187 (= lt!303334 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303332 (select (arr!18496 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!652187 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!303333 () Unit!22251)

(declare-datatypes ((List!12444 0))(
  ( (Nil!12441) (Cons!12440 (h!13488 (_ BitVec 64)) (t!18664 List!12444)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38592 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12444) Unit!22251)

(assert (=> b!652187 (= lt!303333 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12441))))

(declare-fun arrayNoDuplicates!0 (array!38592 (_ BitVec 32) List!12444) Bool)

(assert (=> b!652187 (arrayNoDuplicates!0 lt!303332 #b00000000000000000000000000000000 Nil!12441)))

(declare-fun lt!303336 () Unit!22251)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38592 (_ BitVec 32) (_ BitVec 32)) Unit!22251)

(assert (=> b!652187 (= lt!303336 (lemmaNoDuplicateFromThenFromBigger!0 lt!303332 #b00000000000000000000000000000000 j!136))))

(assert (=> b!652187 (arrayNoDuplicates!0 lt!303332 j!136 Nil!12441)))

(declare-fun lt!303330 () Unit!22251)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38592 (_ BitVec 64) (_ BitVec 32) List!12444) Unit!22251)

(assert (=> b!652187 (= lt!303330 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!303332 (select (arr!18496 a!2986) j!136) j!136 Nil!12441))))

(assert (=> b!652187 false))

(declare-fun b!652188 () Bool)

(declare-fun e!374301 () Bool)

(assert (=> b!652188 (= e!374301 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) index!984))))

(declare-fun b!652189 () Bool)

(declare-fun res!422826 () Bool)

(assert (=> b!652189 (=> (not res!422826) (not e!374305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38592 (_ BitVec 32)) Bool)

(assert (=> b!652189 (= res!422826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!652190 () Bool)

(declare-fun e!374304 () Bool)

(assert (=> b!652190 (= e!374304 e!374301)))

(declare-fun res!422818 () Bool)

(assert (=> b!652190 (=> (not res!422818) (not e!374301))))

(assert (=> b!652190 (= res!422818 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) j!136))))

(declare-fun b!652191 () Bool)

(declare-fun res!422830 () Bool)

(assert (=> b!652191 (=> (not res!422830) (not e!374303))))

(assert (=> b!652191 (= res!422830 (and (= (size!18860 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18860 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18860 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!652177 () Bool)

(declare-fun e!374306 () Bool)

(assert (=> b!652177 (= e!374306 true)))

(assert (=> b!652177 (arrayNoDuplicates!0 lt!303332 index!984 Nil!12441)))

(declare-fun lt!303326 () Unit!22251)

(assert (=> b!652177 (= lt!303326 (lemmaNoDuplicateFromThenFromBigger!0 lt!303332 #b00000000000000000000000000000000 index!984))))

(assert (=> b!652177 (arrayNoDuplicates!0 lt!303332 #b00000000000000000000000000000000 Nil!12441)))

(declare-fun lt!303328 () Unit!22251)

(assert (=> b!652177 (= lt!303328 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12441))))

(assert (=> b!652177 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!303343 () Unit!22251)

(assert (=> b!652177 (= lt!303343 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!303332 (select (arr!18496 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!652177 e!374293))

(declare-fun res!422825 () Bool)

(assert (=> b!652177 (=> (not res!422825) (not e!374293))))

(assert (=> b!652177 (= res!422825 (arrayContainsKey!0 lt!303332 (select (arr!18496 a!2986) j!136) j!136))))

(declare-fun res!422831 () Bool)

(assert (=> start!59154 (=> (not res!422831) (not e!374303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!59154 (= res!422831 (validMask!0 mask!3053))))

(assert (=> start!59154 e!374303))

(assert (=> start!59154 true))

(declare-fun array_inv!14355 (array!38592) Bool)

(assert (=> start!59154 (array_inv!14355 a!2986)))

(declare-fun b!652192 () Bool)

(declare-fun res!422824 () Bool)

(assert (=> b!652192 (=> (not res!422824) (not e!374303))))

(assert (=> b!652192 (= res!422824 (validKeyInArray!0 (select (arr!18496 a!2986) j!136)))))

(declare-fun b!652193 () Bool)

(assert (=> b!652193 (= e!374297 e!374306)))

(declare-fun res!422819 () Bool)

(assert (=> b!652193 (=> res!422819 e!374306)))

(assert (=> b!652193 (= res!422819 (bvsge index!984 j!136))))

(declare-fun lt!303331 () Unit!22251)

(assert (=> b!652193 (= lt!303331 e!374296)))

(declare-fun c!75046 () Bool)

(assert (=> b!652193 (= c!75046 (bvslt j!136 index!984))))

(declare-fun b!652194 () Bool)

(declare-fun res!422833 () Bool)

(assert (=> b!652194 (=> (not res!422833) (not e!374305))))

(assert (=> b!652194 (= res!422833 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12441))))

(declare-fun b!652195 () Bool)

(assert (=> b!652195 (= e!374298 e!374304)))

(declare-fun res!422832 () Bool)

(assert (=> b!652195 (=> res!422832 e!374304)))

(assert (=> b!652195 (= res!422832 (or (not (= (select (arr!18496 a!2986) j!136) lt!303342)) (not (= (select (arr!18496 a!2986) j!136) lt!303339)) (bvsge j!136 index!984)))))

(assert (= (and start!59154 res!422831) b!652191))

(assert (= (and b!652191 res!422830) b!652192))

(assert (= (and b!652192 res!422824) b!652181))

(assert (= (and b!652181 res!422823) b!652180))

(assert (= (and b!652180 res!422820) b!652178))

(assert (= (and b!652178 res!422836) b!652189))

(assert (= (and b!652189 res!422826) b!652194))

(assert (= (and b!652194 res!422833) b!652186))

(assert (= (and b!652186 res!422821) b!652174))

(assert (= (and b!652174 res!422829) b!652185))

(assert (= (and b!652185 res!422835) b!652183))

(assert (= (and b!652183 res!422828) b!652184))

(assert (= (and b!652183 c!75047) b!652175))

(assert (= (and b!652183 (not c!75047)) b!652173))

(assert (= (and b!652183 (not res!422822)) b!652179))

(assert (= (and b!652179 res!422827) b!652195))

(assert (= (and b!652195 (not res!422832)) b!652190))

(assert (= (and b!652190 res!422818) b!652188))

(assert (= (and b!652179 (not res!422834)) b!652193))

(assert (= (and b!652193 c!75046) b!652187))

(assert (= (and b!652193 (not c!75046)) b!652176))

(assert (= (and b!652193 (not res!422819)) b!652177))

(assert (= (and b!652177 res!422825) b!652182))

(declare-fun m!625765 () Bool)

(assert (=> b!652179 m!625765))

(declare-fun m!625767 () Bool)

(assert (=> b!652179 m!625767))

(declare-fun m!625769 () Bool)

(assert (=> b!652179 m!625769))

(assert (=> b!652195 m!625765))

(declare-fun m!625771 () Bool)

(assert (=> b!652186 m!625771))

(declare-fun m!625773 () Bool)

(assert (=> b!652189 m!625773))

(assert (=> b!652174 m!625767))

(declare-fun m!625775 () Bool)

(assert (=> b!652174 m!625775))

(declare-fun m!625777 () Bool)

(assert (=> b!652183 m!625777))

(declare-fun m!625779 () Bool)

(assert (=> b!652183 m!625779))

(assert (=> b!652183 m!625765))

(assert (=> b!652183 m!625767))

(declare-fun m!625781 () Bool)

(assert (=> b!652183 m!625781))

(assert (=> b!652183 m!625765))

(declare-fun m!625783 () Bool)

(assert (=> b!652183 m!625783))

(declare-fun m!625785 () Bool)

(assert (=> b!652183 m!625785))

(declare-fun m!625787 () Bool)

(assert (=> b!652183 m!625787))

(assert (=> b!652182 m!625765))

(assert (=> b!652182 m!625765))

(declare-fun m!625789 () Bool)

(assert (=> b!652182 m!625789))

(declare-fun m!625791 () Bool)

(assert (=> b!652180 m!625791))

(assert (=> b!652177 m!625765))

(declare-fun m!625793 () Bool)

(assert (=> b!652177 m!625793))

(assert (=> b!652177 m!625765))

(declare-fun m!625795 () Bool)

(assert (=> b!652177 m!625795))

(declare-fun m!625797 () Bool)

(assert (=> b!652177 m!625797))

(assert (=> b!652177 m!625765))

(declare-fun m!625799 () Bool)

(assert (=> b!652177 m!625799))

(assert (=> b!652177 m!625765))

(declare-fun m!625801 () Bool)

(assert (=> b!652177 m!625801))

(declare-fun m!625803 () Bool)

(assert (=> b!652177 m!625803))

(declare-fun m!625805 () Bool)

(assert (=> b!652177 m!625805))

(declare-fun m!625807 () Bool)

(assert (=> start!59154 m!625807))

(declare-fun m!625809 () Bool)

(assert (=> start!59154 m!625809))

(declare-fun m!625811 () Bool)

(assert (=> b!652178 m!625811))

(declare-fun m!625813 () Bool)

(assert (=> b!652185 m!625813))

(assert (=> b!652185 m!625765))

(assert (=> b!652185 m!625765))

(declare-fun m!625815 () Bool)

(assert (=> b!652185 m!625815))

(assert (=> b!652188 m!625765))

(assert (=> b!652188 m!625765))

(assert (=> b!652188 m!625789))

(declare-fun m!625817 () Bool)

(assert (=> b!652194 m!625817))

(assert (=> b!652192 m!625765))

(assert (=> b!652192 m!625765))

(declare-fun m!625819 () Bool)

(assert (=> b!652192 m!625819))

(declare-fun m!625821 () Bool)

(assert (=> b!652181 m!625821))

(assert (=> b!652190 m!625765))

(assert (=> b!652190 m!625765))

(assert (=> b!652190 m!625793))

(declare-fun m!625823 () Bool)

(assert (=> b!652187 m!625823))

(assert (=> b!652187 m!625765))

(assert (=> b!652187 m!625797))

(assert (=> b!652187 m!625765))

(declare-fun m!625825 () Bool)

(assert (=> b!652187 m!625825))

(assert (=> b!652187 m!625765))

(declare-fun m!625827 () Bool)

(assert (=> b!652187 m!625827))

(declare-fun m!625829 () Bool)

(assert (=> b!652187 m!625829))

(assert (=> b!652187 m!625765))

(declare-fun m!625831 () Bool)

(assert (=> b!652187 m!625831))

(assert (=> b!652187 m!625805))

(check-sat (not b!652182) (not b!652190) (not b!652188) (not b!652194) (not b!652178) (not b!652187) (not b!652185) (not b!652183) (not b!652181) (not b!652177) (not start!59154) (not b!652192) (not b!652180) (not b!652189))
(check-sat)
