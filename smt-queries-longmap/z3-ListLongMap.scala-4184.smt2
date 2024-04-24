; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57072 () Bool)

(assert start!57072)

(declare-fun b!631578 () Bool)

(declare-fun e!361110 () Bool)

(declare-fun e!361104 () Bool)

(assert (=> b!631578 (= e!361110 e!361104)))

(declare-fun res!408384 () Bool)

(assert (=> b!631578 (=> (not res!408384) (not e!361104))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6673 0))(
  ( (MissingZero!6673 (index!28982 (_ BitVec 32))) (Found!6673 (index!28983 (_ BitVec 32))) (Intermediate!6673 (undefined!7485 Bool) (index!28984 (_ BitVec 32)) (x!57870 (_ BitVec 32))) (Undefined!6673) (MissingVacant!6673 (index!28985 (_ BitVec 32))) )
))
(declare-fun lt!291805 () SeekEntryResult!6673)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38091 0))(
  ( (array!38092 (arr!18277 (Array (_ BitVec 32) (_ BitVec 64))) (size!18641 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38091)

(assert (=> b!631578 (= res!408384 (and (= lt!291805 (Found!6673 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18277 a!2986) index!984) (select (arr!18277 a!2986) j!136))) (not (= (select (arr!18277 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38091 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!631578 (= lt!291805 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631579 () Bool)

(declare-fun res!408378 () Bool)

(declare-fun e!361105 () Bool)

(assert (=> b!631579 (=> (not res!408378) (not e!361105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38091 (_ BitVec 32)) Bool)

(assert (=> b!631579 (= res!408378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!631580 () Bool)

(declare-fun e!361109 () Bool)

(assert (=> b!631580 (= e!361109 e!361105)))

(declare-fun res!408388 () Bool)

(assert (=> b!631580 (=> (not res!408388) (not e!361105))))

(declare-fun lt!291808 () SeekEntryResult!6673)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!631580 (= res!408388 (or (= lt!291808 (MissingZero!6673 i!1108)) (= lt!291808 (MissingVacant!6673 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38091 (_ BitVec 32)) SeekEntryResult!6673)

(assert (=> b!631580 (= lt!291808 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!631581 () Bool)

(assert (=> b!631581 (= e!361105 e!361110)))

(declare-fun res!408385 () Bool)

(assert (=> b!631581 (=> (not res!408385) (not e!361110))))

(assert (=> b!631581 (= res!408385 (= (select (store (arr!18277 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!291804 () array!38091)

(assert (=> b!631581 (= lt!291804 (array!38092 (store (arr!18277 a!2986) i!1108 k0!1786) (size!18641 a!2986)))))

(declare-fun b!631582 () Bool)

(declare-datatypes ((Unit!21201 0))(
  ( (Unit!21202) )
))
(declare-fun e!361107 () Unit!21201)

(declare-fun Unit!21203 () Unit!21201)

(assert (=> b!631582 (= e!361107 Unit!21203)))

(declare-fun b!631583 () Bool)

(declare-fun res!408387 () Bool)

(assert (=> b!631583 (=> (not res!408387) (not e!361109))))

(assert (=> b!631583 (= res!408387 (and (= (size!18641 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18641 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18641 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!631585 () Bool)

(declare-fun e!361108 () Bool)

(declare-fun lt!291801 () SeekEntryResult!6673)

(assert (=> b!631585 (= e!361108 (= lt!291805 lt!291801))))

(declare-fun b!631586 () Bool)

(declare-fun Unit!21204 () Unit!21201)

(assert (=> b!631586 (= e!361107 Unit!21204)))

(assert (=> b!631586 false))

(declare-fun b!631587 () Bool)

(declare-fun lt!291800 () SeekEntryResult!6673)

(assert (=> b!631587 (= e!361104 (not (or (not (= lt!291800 (Found!6673 index!984))) (= (select (store (arr!18277 a!2986) i!1108 k0!1786) index!984) (select (arr!18277 a!2986) j!136)))))))

(declare-fun lt!291802 () Unit!21201)

(assert (=> b!631587 (= lt!291802 e!361107)))

(declare-fun c!71969 () Bool)

(assert (=> b!631587 (= c!71969 (= lt!291800 Undefined!6673))))

(declare-fun lt!291806 () (_ BitVec 64))

(assert (=> b!631587 (= lt!291800 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291806 lt!291804 mask!3053))))

(assert (=> b!631587 e!361108))

(declare-fun res!408379 () Bool)

(assert (=> b!631587 (=> (not res!408379) (not e!361108))))

(declare-fun lt!291807 () (_ BitVec 32))

(assert (=> b!631587 (= res!408379 (= lt!291801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 lt!291806 lt!291804 mask!3053)))))

(assert (=> b!631587 (= lt!291801 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!631587 (= lt!291806 (select (store (arr!18277 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291803 () Unit!21201)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21201)

(assert (=> b!631587 (= lt!291803 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!631587 (= lt!291807 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!631588 () Bool)

(declare-fun res!408377 () Bool)

(assert (=> b!631588 (=> (not res!408377) (not e!361109))))

(declare-fun arrayContainsKey!0 (array!38091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!631588 (= res!408377 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!631589 () Bool)

(declare-fun res!408386 () Bool)

(assert (=> b!631589 (=> (not res!408386) (not e!361105))))

(assert (=> b!631589 (= res!408386 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18277 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!631584 () Bool)

(declare-fun res!408382 () Bool)

(assert (=> b!631584 (=> (not res!408382) (not e!361105))))

(declare-datatypes ((List!12225 0))(
  ( (Nil!12222) (Cons!12221 (h!13269 (_ BitVec 64)) (t!18445 List!12225)) )
))
(declare-fun arrayNoDuplicates!0 (array!38091 (_ BitVec 32) List!12225) Bool)

(assert (=> b!631584 (= res!408382 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12222))))

(declare-fun res!408380 () Bool)

(assert (=> start!57072 (=> (not res!408380) (not e!361109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57072 (= res!408380 (validMask!0 mask!3053))))

(assert (=> start!57072 e!361109))

(assert (=> start!57072 true))

(declare-fun array_inv!14136 (array!38091) Bool)

(assert (=> start!57072 (array_inv!14136 a!2986)))

(declare-fun b!631590 () Bool)

(declare-fun res!408383 () Bool)

(assert (=> b!631590 (=> (not res!408383) (not e!361109))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!631590 (= res!408383 (validKeyInArray!0 (select (arr!18277 a!2986) j!136)))))

(declare-fun b!631591 () Bool)

(declare-fun res!408381 () Bool)

(assert (=> b!631591 (=> (not res!408381) (not e!361109))))

(assert (=> b!631591 (= res!408381 (validKeyInArray!0 k0!1786))))

(assert (= (and start!57072 res!408380) b!631583))

(assert (= (and b!631583 res!408387) b!631590))

(assert (= (and b!631590 res!408383) b!631591))

(assert (= (and b!631591 res!408381) b!631588))

(assert (= (and b!631588 res!408377) b!631580))

(assert (= (and b!631580 res!408388) b!631579))

(assert (= (and b!631579 res!408378) b!631584))

(assert (= (and b!631584 res!408382) b!631589))

(assert (= (and b!631589 res!408386) b!631581))

(assert (= (and b!631581 res!408385) b!631578))

(assert (= (and b!631578 res!408384) b!631587))

(assert (= (and b!631587 res!408379) b!631585))

(assert (= (and b!631587 c!71969) b!631586))

(assert (= (and b!631587 (not c!71969)) b!631582))

(declare-fun m!606817 () Bool)

(assert (=> b!631584 m!606817))

(declare-fun m!606819 () Bool)

(assert (=> b!631587 m!606819))

(declare-fun m!606821 () Bool)

(assert (=> b!631587 m!606821))

(declare-fun m!606823 () Bool)

(assert (=> b!631587 m!606823))

(declare-fun m!606825 () Bool)

(assert (=> b!631587 m!606825))

(assert (=> b!631587 m!606819))

(declare-fun m!606827 () Bool)

(assert (=> b!631587 m!606827))

(declare-fun m!606829 () Bool)

(assert (=> b!631587 m!606829))

(declare-fun m!606831 () Bool)

(assert (=> b!631587 m!606831))

(declare-fun m!606833 () Bool)

(assert (=> b!631587 m!606833))

(declare-fun m!606835 () Bool)

(assert (=> b!631587 m!606835))

(declare-fun m!606837 () Bool)

(assert (=> b!631578 m!606837))

(assert (=> b!631578 m!606819))

(assert (=> b!631578 m!606819))

(declare-fun m!606839 () Bool)

(assert (=> b!631578 m!606839))

(declare-fun m!606841 () Bool)

(assert (=> b!631580 m!606841))

(declare-fun m!606843 () Bool)

(assert (=> start!57072 m!606843))

(declare-fun m!606845 () Bool)

(assert (=> start!57072 m!606845))

(declare-fun m!606847 () Bool)

(assert (=> b!631579 m!606847))

(declare-fun m!606849 () Bool)

(assert (=> b!631588 m!606849))

(declare-fun m!606851 () Bool)

(assert (=> b!631591 m!606851))

(assert (=> b!631590 m!606819))

(assert (=> b!631590 m!606819))

(declare-fun m!606853 () Bool)

(assert (=> b!631590 m!606853))

(declare-fun m!606855 () Bool)

(assert (=> b!631589 m!606855))

(assert (=> b!631581 m!606829))

(declare-fun m!606857 () Bool)

(assert (=> b!631581 m!606857))

(check-sat (not b!631578) (not b!631588) (not start!57072) (not b!631590) (not b!631584) (not b!631580) (not b!631587) (not b!631591) (not b!631579))
(check-sat)
(get-model)

(declare-fun d!89431 () Bool)

(declare-fun res!408465 () Bool)

(declare-fun e!361157 () Bool)

(assert (=> d!89431 (=> res!408465 e!361157)))

(assert (=> d!89431 (= res!408465 (= (select (arr!18277 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89431 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!361157)))

(declare-fun b!631680 () Bool)

(declare-fun e!361158 () Bool)

(assert (=> b!631680 (= e!361157 e!361158)))

(declare-fun res!408466 () Bool)

(assert (=> b!631680 (=> (not res!408466) (not e!361158))))

(assert (=> b!631680 (= res!408466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18641 a!2986)))))

(declare-fun b!631681 () Bool)

(assert (=> b!631681 (= e!361158 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89431 (not res!408465)) b!631680))

(assert (= (and b!631680 res!408466) b!631681))

(declare-fun m!606943 () Bool)

(assert (=> d!89431 m!606943))

(declare-fun m!606945 () Bool)

(assert (=> b!631681 m!606945))

(assert (=> b!631588 d!89431))

(declare-fun b!631694 () Bool)

(declare-fun c!71983 () Bool)

(declare-fun lt!291868 () (_ BitVec 64))

(assert (=> b!631694 (= c!71983 (= lt!291868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361166 () SeekEntryResult!6673)

(declare-fun e!361165 () SeekEntryResult!6673)

(assert (=> b!631694 (= e!361166 e!361165)))

(declare-fun b!631696 () Bool)

(declare-fun e!361167 () SeekEntryResult!6673)

(assert (=> b!631696 (= e!361167 e!361166)))

(declare-fun c!71982 () Bool)

(assert (=> b!631696 (= c!71982 (= lt!291868 (select (arr!18277 a!2986) j!136)))))

(declare-fun b!631697 () Bool)

(assert (=> b!631697 (= e!361165 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!631698 () Bool)

(assert (=> b!631698 (= e!361166 (Found!6673 index!984))))

(declare-fun b!631699 () Bool)

(assert (=> b!631699 (= e!361165 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631695 () Bool)

(assert (=> b!631695 (= e!361167 Undefined!6673)))

(declare-fun d!89433 () Bool)

(declare-fun lt!291867 () SeekEntryResult!6673)

(get-info :version)

(assert (=> d!89433 (and (or ((_ is Undefined!6673) lt!291867) (not ((_ is Found!6673) lt!291867)) (and (bvsge (index!28983 lt!291867) #b00000000000000000000000000000000) (bvslt (index!28983 lt!291867) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291867) ((_ is Found!6673) lt!291867) (not ((_ is MissingVacant!6673) lt!291867)) (not (= (index!28985 lt!291867) vacantSpotIndex!68)) (and (bvsge (index!28985 lt!291867) #b00000000000000000000000000000000) (bvslt (index!28985 lt!291867) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291867) (ite ((_ is Found!6673) lt!291867) (= (select (arr!18277 a!2986) (index!28983 lt!291867)) (select (arr!18277 a!2986) j!136)) (and ((_ is MissingVacant!6673) lt!291867) (= (index!28985 lt!291867) vacantSpotIndex!68) (= (select (arr!18277 a!2986) (index!28985 lt!291867)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89433 (= lt!291867 e!361167)))

(declare-fun c!71984 () Bool)

(assert (=> d!89433 (= c!71984 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89433 (= lt!291868 (select (arr!18277 a!2986) index!984))))

(assert (=> d!89433 (validMask!0 mask!3053)))

(assert (=> d!89433 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053) lt!291867)))

(assert (= (and d!89433 c!71984) b!631695))

(assert (= (and d!89433 (not c!71984)) b!631696))

(assert (= (and b!631696 c!71982) b!631698))

(assert (= (and b!631696 (not c!71982)) b!631694))

(assert (= (and b!631694 c!71983) b!631697))

(assert (= (and b!631694 (not c!71983)) b!631699))

(declare-fun m!606947 () Bool)

(assert (=> b!631699 m!606947))

(assert (=> b!631699 m!606947))

(assert (=> b!631699 m!606819))

(declare-fun m!606949 () Bool)

(assert (=> b!631699 m!606949))

(declare-fun m!606951 () Bool)

(assert (=> d!89433 m!606951))

(declare-fun m!606953 () Bool)

(assert (=> d!89433 m!606953))

(assert (=> d!89433 m!606837))

(assert (=> d!89433 m!606843))

(assert (=> b!631578 d!89433))

(declare-fun b!631700 () Bool)

(declare-fun c!71986 () Bool)

(declare-fun lt!291870 () (_ BitVec 64))

(assert (=> b!631700 (= c!71986 (= lt!291870 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361169 () SeekEntryResult!6673)

(declare-fun e!361168 () SeekEntryResult!6673)

(assert (=> b!631700 (= e!361169 e!361168)))

(declare-fun b!631702 () Bool)

(declare-fun e!361170 () SeekEntryResult!6673)

(assert (=> b!631702 (= e!361170 e!361169)))

(declare-fun c!71985 () Bool)

(assert (=> b!631702 (= c!71985 (= lt!291870 (select (arr!18277 a!2986) j!136)))))

(declare-fun b!631703 () Bool)

(assert (=> b!631703 (= e!361168 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!631704 () Bool)

(assert (=> b!631704 (= e!361169 (Found!6673 lt!291807))))

(declare-fun b!631705 () Bool)

(assert (=> b!631705 (= e!361168 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291807 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!631701 () Bool)

(assert (=> b!631701 (= e!361170 Undefined!6673)))

(declare-fun lt!291869 () SeekEntryResult!6673)

(declare-fun d!89435 () Bool)

(assert (=> d!89435 (and (or ((_ is Undefined!6673) lt!291869) (not ((_ is Found!6673) lt!291869)) (and (bvsge (index!28983 lt!291869) #b00000000000000000000000000000000) (bvslt (index!28983 lt!291869) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291869) ((_ is Found!6673) lt!291869) (not ((_ is MissingVacant!6673) lt!291869)) (not (= (index!28985 lt!291869) vacantSpotIndex!68)) (and (bvsge (index!28985 lt!291869) #b00000000000000000000000000000000) (bvslt (index!28985 lt!291869) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291869) (ite ((_ is Found!6673) lt!291869) (= (select (arr!18277 a!2986) (index!28983 lt!291869)) (select (arr!18277 a!2986) j!136)) (and ((_ is MissingVacant!6673) lt!291869) (= (index!28985 lt!291869) vacantSpotIndex!68) (= (select (arr!18277 a!2986) (index!28985 lt!291869)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89435 (= lt!291869 e!361170)))

(declare-fun c!71987 () Bool)

(assert (=> d!89435 (= c!71987 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89435 (= lt!291870 (select (arr!18277 a!2986) lt!291807))))

(assert (=> d!89435 (validMask!0 mask!3053)))

(assert (=> d!89435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053) lt!291869)))

(assert (= (and d!89435 c!71987) b!631701))

(assert (= (and d!89435 (not c!71987)) b!631702))

(assert (= (and b!631702 c!71985) b!631704))

(assert (= (and b!631702 (not c!71985)) b!631700))

(assert (= (and b!631700 c!71986) b!631703))

(assert (= (and b!631700 (not c!71986)) b!631705))

(declare-fun m!606955 () Bool)

(assert (=> b!631705 m!606955))

(assert (=> b!631705 m!606955))

(assert (=> b!631705 m!606819))

(declare-fun m!606957 () Bool)

(assert (=> b!631705 m!606957))

(declare-fun m!606959 () Bool)

(assert (=> d!89435 m!606959))

(declare-fun m!606961 () Bool)

(assert (=> d!89435 m!606961))

(declare-fun m!606963 () Bool)

(assert (=> d!89435 m!606963))

(assert (=> d!89435 m!606843))

(assert (=> b!631587 d!89435))

(declare-fun b!631706 () Bool)

(declare-fun c!71989 () Bool)

(declare-fun lt!291872 () (_ BitVec 64))

(assert (=> b!631706 (= c!71989 (= lt!291872 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361172 () SeekEntryResult!6673)

(declare-fun e!361171 () SeekEntryResult!6673)

(assert (=> b!631706 (= e!361172 e!361171)))

(declare-fun b!631708 () Bool)

(declare-fun e!361173 () SeekEntryResult!6673)

(assert (=> b!631708 (= e!361173 e!361172)))

(declare-fun c!71988 () Bool)

(assert (=> b!631708 (= c!71988 (= lt!291872 lt!291806))))

(declare-fun b!631709 () Bool)

(assert (=> b!631709 (= e!361171 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!631710 () Bool)

(assert (=> b!631710 (= e!361172 (Found!6673 lt!291807))))

(declare-fun b!631711 () Bool)

(assert (=> b!631711 (= e!361171 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!291807 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!291806 lt!291804 mask!3053))))

(declare-fun b!631707 () Bool)

(assert (=> b!631707 (= e!361173 Undefined!6673)))

(declare-fun d!89437 () Bool)

(declare-fun lt!291871 () SeekEntryResult!6673)

(assert (=> d!89437 (and (or ((_ is Undefined!6673) lt!291871) (not ((_ is Found!6673) lt!291871)) (and (bvsge (index!28983 lt!291871) #b00000000000000000000000000000000) (bvslt (index!28983 lt!291871) (size!18641 lt!291804)))) (or ((_ is Undefined!6673) lt!291871) ((_ is Found!6673) lt!291871) (not ((_ is MissingVacant!6673) lt!291871)) (not (= (index!28985 lt!291871) vacantSpotIndex!68)) (and (bvsge (index!28985 lt!291871) #b00000000000000000000000000000000) (bvslt (index!28985 lt!291871) (size!18641 lt!291804)))) (or ((_ is Undefined!6673) lt!291871) (ite ((_ is Found!6673) lt!291871) (= (select (arr!18277 lt!291804) (index!28983 lt!291871)) lt!291806) (and ((_ is MissingVacant!6673) lt!291871) (= (index!28985 lt!291871) vacantSpotIndex!68) (= (select (arr!18277 lt!291804) (index!28985 lt!291871)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89437 (= lt!291871 e!361173)))

(declare-fun c!71990 () Bool)

(assert (=> d!89437 (= c!71990 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!89437 (= lt!291872 (select (arr!18277 lt!291804) lt!291807))))

(assert (=> d!89437 (validMask!0 mask!3053)))

(assert (=> d!89437 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 lt!291806 lt!291804 mask!3053) lt!291871)))

(assert (= (and d!89437 c!71990) b!631707))

(assert (= (and d!89437 (not c!71990)) b!631708))

(assert (= (and b!631708 c!71988) b!631710))

(assert (= (and b!631708 (not c!71988)) b!631706))

(assert (= (and b!631706 c!71989) b!631709))

(assert (= (and b!631706 (not c!71989)) b!631711))

(assert (=> b!631711 m!606955))

(assert (=> b!631711 m!606955))

(declare-fun m!606965 () Bool)

(assert (=> b!631711 m!606965))

(declare-fun m!606967 () Bool)

(assert (=> d!89437 m!606967))

(declare-fun m!606969 () Bool)

(assert (=> d!89437 m!606969))

(declare-fun m!606971 () Bool)

(assert (=> d!89437 m!606971))

(assert (=> d!89437 m!606843))

(assert (=> b!631587 d!89437))

(declare-fun b!631712 () Bool)

(declare-fun c!71992 () Bool)

(declare-fun lt!291874 () (_ BitVec 64))

(assert (=> b!631712 (= c!71992 (= lt!291874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361175 () SeekEntryResult!6673)

(declare-fun e!361174 () SeekEntryResult!6673)

(assert (=> b!631712 (= e!361175 e!361174)))

(declare-fun b!631714 () Bool)

(declare-fun e!361176 () SeekEntryResult!6673)

(assert (=> b!631714 (= e!361176 e!361175)))

(declare-fun c!71991 () Bool)

(assert (=> b!631714 (= c!71991 (= lt!291874 lt!291806))))

(declare-fun b!631715 () Bool)

(assert (=> b!631715 (= e!361174 (MissingVacant!6673 vacantSpotIndex!68))))

(declare-fun b!631716 () Bool)

(assert (=> b!631716 (= e!361175 (Found!6673 index!984))))

(declare-fun b!631717 () Bool)

(assert (=> b!631717 (= e!361174 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!291806 lt!291804 mask!3053))))

(declare-fun b!631713 () Bool)

(assert (=> b!631713 (= e!361176 Undefined!6673)))

(declare-fun d!89439 () Bool)

(declare-fun lt!291873 () SeekEntryResult!6673)

(assert (=> d!89439 (and (or ((_ is Undefined!6673) lt!291873) (not ((_ is Found!6673) lt!291873)) (and (bvsge (index!28983 lt!291873) #b00000000000000000000000000000000) (bvslt (index!28983 lt!291873) (size!18641 lt!291804)))) (or ((_ is Undefined!6673) lt!291873) ((_ is Found!6673) lt!291873) (not ((_ is MissingVacant!6673) lt!291873)) (not (= (index!28985 lt!291873) vacantSpotIndex!68)) (and (bvsge (index!28985 lt!291873) #b00000000000000000000000000000000) (bvslt (index!28985 lt!291873) (size!18641 lt!291804)))) (or ((_ is Undefined!6673) lt!291873) (ite ((_ is Found!6673) lt!291873) (= (select (arr!18277 lt!291804) (index!28983 lt!291873)) lt!291806) (and ((_ is MissingVacant!6673) lt!291873) (= (index!28985 lt!291873) vacantSpotIndex!68) (= (select (arr!18277 lt!291804) (index!28985 lt!291873)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!89439 (= lt!291873 e!361176)))

(declare-fun c!71993 () Bool)

(assert (=> d!89439 (= c!71993 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!89439 (= lt!291874 (select (arr!18277 lt!291804) index!984))))

(assert (=> d!89439 (validMask!0 mask!3053)))

(assert (=> d!89439 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291806 lt!291804 mask!3053) lt!291873)))

(assert (= (and d!89439 c!71993) b!631713))

(assert (= (and d!89439 (not c!71993)) b!631714))

(assert (= (and b!631714 c!71991) b!631716))

(assert (= (and b!631714 (not c!71991)) b!631712))

(assert (= (and b!631712 c!71992) b!631715))

(assert (= (and b!631712 (not c!71992)) b!631717))

(assert (=> b!631717 m!606947))

(assert (=> b!631717 m!606947))

(declare-fun m!606973 () Bool)

(assert (=> b!631717 m!606973))

(declare-fun m!606975 () Bool)

(assert (=> d!89439 m!606975))

(declare-fun m!606977 () Bool)

(assert (=> d!89439 m!606977))

(declare-fun m!606979 () Bool)

(assert (=> d!89439 m!606979))

(assert (=> d!89439 m!606843))

(assert (=> b!631587 d!89439))

(declare-fun d!89441 () Bool)

(declare-fun lt!291877 () (_ BitVec 32))

(assert (=> d!89441 (and (bvsge lt!291877 #b00000000000000000000000000000000) (bvslt lt!291877 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89441 (= lt!291877 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!89441 (validMask!0 mask!3053)))

(assert (=> d!89441 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!291877)))

(declare-fun bs!19046 () Bool)

(assert (= bs!19046 d!89441))

(declare-fun m!606981 () Bool)

(assert (=> bs!19046 m!606981))

(assert (=> bs!19046 m!606843))

(assert (=> b!631587 d!89441))

(declare-fun d!89443 () Bool)

(declare-fun e!361179 () Bool)

(assert (=> d!89443 e!361179))

(declare-fun res!408469 () Bool)

(assert (=> d!89443 (=> (not res!408469) (not e!361179))))

(assert (=> d!89443 (= res!408469 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18641 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18641 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18641 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18641 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18641 a!2986))))))

(declare-fun lt!291880 () Unit!21201)

(declare-fun choose!9 (array!38091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21201)

(assert (=> d!89443 (= lt!291880 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89443 (validMask!0 mask!3053)))

(assert (=> d!89443 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 mask!3053) lt!291880)))

(declare-fun b!631720 () Bool)

(assert (=> b!631720 (= e!361179 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 (select (arr!18277 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291807 vacantSpotIndex!68 (select (store (arr!18277 a!2986) i!1108 k0!1786) j!136) (array!38092 (store (arr!18277 a!2986) i!1108 k0!1786) (size!18641 a!2986)) mask!3053)))))

(assert (= (and d!89443 res!408469) b!631720))

(declare-fun m!606983 () Bool)

(assert (=> d!89443 m!606983))

(assert (=> d!89443 m!606843))

(assert (=> b!631720 m!606819))

(assert (=> b!631720 m!606819))

(assert (=> b!631720 m!606821))

(assert (=> b!631720 m!606829))

(assert (=> b!631720 m!606825))

(declare-fun m!606985 () Bool)

(assert (=> b!631720 m!606985))

(assert (=> b!631720 m!606825))

(assert (=> b!631587 d!89443))

(declare-fun d!89447 () Bool)

(assert (=> d!89447 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631591 d!89447))

(declare-fun d!89449 () Bool)

(declare-fun lt!291904 () SeekEntryResult!6673)

(assert (=> d!89449 (and (or ((_ is Undefined!6673) lt!291904) (not ((_ is Found!6673) lt!291904)) (and (bvsge (index!28983 lt!291904) #b00000000000000000000000000000000) (bvslt (index!28983 lt!291904) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291904) ((_ is Found!6673) lt!291904) (not ((_ is MissingZero!6673) lt!291904)) (and (bvsge (index!28982 lt!291904) #b00000000000000000000000000000000) (bvslt (index!28982 lt!291904) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291904) ((_ is Found!6673) lt!291904) ((_ is MissingZero!6673) lt!291904) (not ((_ is MissingVacant!6673) lt!291904)) (and (bvsge (index!28985 lt!291904) #b00000000000000000000000000000000) (bvslt (index!28985 lt!291904) (size!18641 a!2986)))) (or ((_ is Undefined!6673) lt!291904) (ite ((_ is Found!6673) lt!291904) (= (select (arr!18277 a!2986) (index!28983 lt!291904)) k0!1786) (ite ((_ is MissingZero!6673) lt!291904) (= (select (arr!18277 a!2986) (index!28982 lt!291904)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6673) lt!291904) (= (select (arr!18277 a!2986) (index!28985 lt!291904)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!361206 () SeekEntryResult!6673)

(assert (=> d!89449 (= lt!291904 e!361206)))

(declare-fun c!72014 () Bool)

(declare-fun lt!291902 () SeekEntryResult!6673)

(assert (=> d!89449 (= c!72014 (and ((_ is Intermediate!6673) lt!291902) (undefined!7485 lt!291902)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38091 (_ BitVec 32)) SeekEntryResult!6673)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89449 (= lt!291902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89449 (validMask!0 mask!3053)))

(assert (=> d!89449 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!291904)))

(declare-fun b!631763 () Bool)

(declare-fun c!72012 () Bool)

(declare-fun lt!291903 () (_ BitVec 64))

(assert (=> b!631763 (= c!72012 (= lt!291903 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!361204 () SeekEntryResult!6673)

(declare-fun e!361205 () SeekEntryResult!6673)

(assert (=> b!631763 (= e!361204 e!361205)))

(declare-fun b!631764 () Bool)

(assert (=> b!631764 (= e!361204 (Found!6673 (index!28984 lt!291902)))))

(declare-fun b!631765 () Bool)

(assert (=> b!631765 (= e!361206 e!361204)))

(assert (=> b!631765 (= lt!291903 (select (arr!18277 a!2986) (index!28984 lt!291902)))))

(declare-fun c!72013 () Bool)

(assert (=> b!631765 (= c!72013 (= lt!291903 k0!1786))))

(declare-fun b!631766 () Bool)

(assert (=> b!631766 (= e!361206 Undefined!6673)))

(declare-fun b!631767 () Bool)

(assert (=> b!631767 (= e!361205 (MissingZero!6673 (index!28984 lt!291902)))))

(declare-fun b!631768 () Bool)

(assert (=> b!631768 (= e!361205 (seekKeyOrZeroReturnVacant!0 (x!57870 lt!291902) (index!28984 lt!291902) (index!28984 lt!291902) k0!1786 a!2986 mask!3053))))

(assert (= (and d!89449 c!72014) b!631766))

(assert (= (and d!89449 (not c!72014)) b!631765))

(assert (= (and b!631765 c!72013) b!631764))

(assert (= (and b!631765 (not c!72013)) b!631763))

(assert (= (and b!631763 c!72012) b!631767))

(assert (= (and b!631763 (not c!72012)) b!631768))

(declare-fun m!607005 () Bool)

(assert (=> d!89449 m!607005))

(declare-fun m!607009 () Bool)

(assert (=> d!89449 m!607009))

(declare-fun m!607011 () Bool)

(assert (=> d!89449 m!607011))

(assert (=> d!89449 m!606843))

(assert (=> d!89449 m!607011))

(declare-fun m!607013 () Bool)

(assert (=> d!89449 m!607013))

(declare-fun m!607015 () Bool)

(assert (=> d!89449 m!607015))

(declare-fun m!607017 () Bool)

(assert (=> b!631765 m!607017))

(declare-fun m!607019 () Bool)

(assert (=> b!631768 m!607019))

(assert (=> b!631580 d!89449))

(declare-fun b!631810 () Bool)

(declare-fun e!361241 () Bool)

(declare-fun e!361240 () Bool)

(assert (=> b!631810 (= e!361241 e!361240)))

(declare-fun lt!291920 () (_ BitVec 64))

(assert (=> b!631810 (= lt!291920 (select (arr!18277 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!291922 () Unit!21201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38091 (_ BitVec 64) (_ BitVec 32)) Unit!21201)

(assert (=> b!631810 (= lt!291922 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!291920 #b00000000000000000000000000000000))))

(assert (=> b!631810 (arrayContainsKey!0 a!2986 lt!291920 #b00000000000000000000000000000000)))

(declare-fun lt!291921 () Unit!21201)

(assert (=> b!631810 (= lt!291921 lt!291922)))

(declare-fun res!408500 () Bool)

(assert (=> b!631810 (= res!408500 (= (seekEntryOrOpen!0 (select (arr!18277 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6673 #b00000000000000000000000000000000)))))

(assert (=> b!631810 (=> (not res!408500) (not e!361240))))

(declare-fun d!89463 () Bool)

(declare-fun res!408502 () Bool)

(declare-fun e!361242 () Bool)

(assert (=> d!89463 (=> res!408502 e!361242)))

(assert (=> d!89463 (= res!408502 (bvsge #b00000000000000000000000000000000 (size!18641 a!2986)))))

(assert (=> d!89463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!361242)))

(declare-fun b!631811 () Bool)

(declare-fun call!33342 () Bool)

(assert (=> b!631811 (= e!361241 call!33342)))

(declare-fun b!631812 () Bool)

(assert (=> b!631812 (= e!361240 call!33342)))

(declare-fun b!631813 () Bool)

(assert (=> b!631813 (= e!361242 e!361241)))

(declare-fun c!72023 () Bool)

(assert (=> b!631813 (= c!72023 (validKeyInArray!0 (select (arr!18277 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33339 () Bool)

(assert (=> bm!33339 (= call!33342 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(assert (= (and d!89463 (not res!408502)) b!631813))

(assert (= (and b!631813 c!72023) b!631810))

(assert (= (and b!631813 (not c!72023)) b!631811))

(assert (= (and b!631810 res!408500) b!631812))

(assert (= (or b!631812 b!631811) bm!33339))

(assert (=> b!631810 m!606943))

(declare-fun m!607029 () Bool)

(assert (=> b!631810 m!607029))

(declare-fun m!607035 () Bool)

(assert (=> b!631810 m!607035))

(assert (=> b!631810 m!606943))

(declare-fun m!607039 () Bool)

(assert (=> b!631810 m!607039))

(assert (=> b!631813 m!606943))

(assert (=> b!631813 m!606943))

(declare-fun m!607043 () Bool)

(assert (=> b!631813 m!607043))

(declare-fun m!607047 () Bool)

(assert (=> bm!33339 m!607047))

(assert (=> b!631579 d!89463))

(declare-fun b!631830 () Bool)

(declare-fun e!361256 () Bool)

(declare-fun e!361254 () Bool)

(assert (=> b!631830 (= e!361256 e!361254)))

(declare-fun c!72029 () Bool)

(assert (=> b!631830 (= c!72029 (validKeyInArray!0 (select (arr!18277 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631831 () Bool)

(declare-fun call!33345 () Bool)

(assert (=> b!631831 (= e!361254 call!33345)))

(declare-fun d!89473 () Bool)

(declare-fun res!408509 () Bool)

(declare-fun e!361257 () Bool)

(assert (=> d!89473 (=> res!408509 e!361257)))

(assert (=> d!89473 (= res!408509 (bvsge #b00000000000000000000000000000000 (size!18641 a!2986)))))

(assert (=> d!89473 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12222) e!361257)))

(declare-fun b!631832 () Bool)

(declare-fun e!361255 () Bool)

(declare-fun contains!3066 (List!12225 (_ BitVec 64)) Bool)

(assert (=> b!631832 (= e!361255 (contains!3066 Nil!12222 (select (arr!18277 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!631833 () Bool)

(assert (=> b!631833 (= e!361254 call!33345)))

(declare-fun bm!33342 () Bool)

(assert (=> bm!33342 (= call!33345 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72029 (Cons!12221 (select (arr!18277 a!2986) #b00000000000000000000000000000000) Nil!12222) Nil!12222)))))

(declare-fun b!631834 () Bool)

(assert (=> b!631834 (= e!361257 e!361256)))

(declare-fun res!408510 () Bool)

(assert (=> b!631834 (=> (not res!408510) (not e!361256))))

(assert (=> b!631834 (= res!408510 (not e!361255))))

(declare-fun res!408511 () Bool)

(assert (=> b!631834 (=> (not res!408511) (not e!361255))))

(assert (=> b!631834 (= res!408511 (validKeyInArray!0 (select (arr!18277 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89473 (not res!408509)) b!631834))

(assert (= (and b!631834 res!408511) b!631832))

(assert (= (and b!631834 res!408510) b!631830))

(assert (= (and b!631830 c!72029) b!631831))

(assert (= (and b!631830 (not c!72029)) b!631833))

(assert (= (or b!631831 b!631833) bm!33342))

(assert (=> b!631830 m!606943))

(assert (=> b!631830 m!606943))

(assert (=> b!631830 m!607043))

(assert (=> b!631832 m!606943))

(assert (=> b!631832 m!606943))

(declare-fun m!607059 () Bool)

(assert (=> b!631832 m!607059))

(assert (=> bm!33342 m!606943))

(declare-fun m!607061 () Bool)

(assert (=> bm!33342 m!607061))

(assert (=> b!631834 m!606943))

(assert (=> b!631834 m!606943))

(assert (=> b!631834 m!607043))

(assert (=> b!631584 d!89473))

(declare-fun d!89477 () Bool)

(assert (=> d!89477 (= (validKeyInArray!0 (select (arr!18277 a!2986) j!136)) (and (not (= (select (arr!18277 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18277 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!631590 d!89477))

(declare-fun d!89479 () Bool)

(assert (=> d!89479 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57072 d!89479))

(declare-fun d!89493 () Bool)

(assert (=> d!89493 (= (array_inv!14136 a!2986) (bvsge (size!18641 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57072 d!89493))

(check-sat (not d!89443) (not b!631813) (not b!631681) (not b!631699) (not b!631711) (not d!89439) (not d!89449) (not b!631768) (not b!631720) (not b!631810) (not d!89435) (not bm!33339) (not b!631705) (not d!89437) (not d!89441) (not b!631717) (not b!631834) (not b!631830) (not d!89433) (not bm!33342) (not b!631832))
(check-sat)
