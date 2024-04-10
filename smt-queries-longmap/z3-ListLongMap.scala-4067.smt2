; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55902 () Bool)

(assert start!55902)

(declare-fun b!611711 () Bool)

(declare-datatypes ((Unit!19612 0))(
  ( (Unit!19613) )
))
(declare-fun e!350567 () Unit!19612)

(declare-fun Unit!19614 () Unit!19612)

(assert (=> b!611711 (= e!350567 Unit!19614)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!279887 () Unit!19612)

(declare-datatypes ((array!37372 0))(
  ( (array!37373 (arr!17932 (Array (_ BitVec 32) (_ BitVec 64))) (size!18296 (_ BitVec 32))) )
))
(declare-fun lt!279883 () array!37372)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19612)

(assert (=> b!611711 (= lt!279887 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279883 (select (arr!17932 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!37372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611711 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!279879 () Unit!19612)

(declare-datatypes ((List!11973 0))(
  ( (Nil!11970) (Cons!11969 (h!13014 (_ BitVec 64)) (t!18201 List!11973)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37372 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11973) Unit!19612)

(assert (=> b!611711 (= lt!279879 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11970))))

(declare-fun arrayNoDuplicates!0 (array!37372 (_ BitVec 32) List!11973) Bool)

(assert (=> b!611711 (arrayNoDuplicates!0 lt!279883 #b00000000000000000000000000000000 Nil!11970)))

(declare-fun lt!279882 () Unit!19612)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37372 (_ BitVec 32) (_ BitVec 32)) Unit!19612)

(assert (=> b!611711 (= lt!279882 (lemmaNoDuplicateFromThenFromBigger!0 lt!279883 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611711 (arrayNoDuplicates!0 lt!279883 j!136 Nil!11970)))

(declare-fun lt!279889 () Unit!19612)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37372 (_ BitVec 64) (_ BitVec 32) List!11973) Unit!19612)

(assert (=> b!611711 (= lt!279889 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279883 (select (arr!17932 a!2986) j!136) j!136 Nil!11970))))

(assert (=> b!611711 false))

(declare-fun b!611712 () Bool)

(declare-fun e!350573 () Bool)

(declare-fun e!350565 () Bool)

(assert (=> b!611712 (= e!350573 e!350565)))

(declare-fun res!393414 () Bool)

(assert (=> b!611712 (=> res!393414 e!350565)))

(declare-fun lt!279895 () (_ BitVec 64))

(declare-fun lt!279894 () (_ BitVec 64))

(assert (=> b!611712 (= res!393414 (or (not (= (select (arr!17932 a!2986) j!136) lt!279895)) (not (= (select (arr!17932 a!2986) j!136) lt!279894))))))

(declare-fun e!350564 () Bool)

(assert (=> b!611712 e!350564))

(declare-fun res!393412 () Bool)

(assert (=> b!611712 (=> (not res!393412) (not e!350564))))

(assert (=> b!611712 (= res!393412 (= lt!279894 (select (arr!17932 a!2986) j!136)))))

(assert (=> b!611712 (= lt!279894 (select (store (arr!17932 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!611713 () Bool)

(declare-fun e!350570 () Bool)

(declare-fun e!350574 () Bool)

(assert (=> b!611713 (= e!350570 e!350574)))

(declare-fun res!393418 () Bool)

(assert (=> b!611713 (=> (not res!393418) (not e!350574))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611713 (= res!393418 (= (select (store (arr!17932 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611713 (= lt!279883 (array!37373 (store (arr!17932 a!2986) i!1108 k0!1786) (size!18296 a!2986)))))

(declare-fun b!611714 () Bool)

(declare-fun e!350572 () Bool)

(declare-datatypes ((SeekEntryResult!6372 0))(
  ( (MissingZero!6372 (index!27772 (_ BitVec 32))) (Found!6372 (index!27773 (_ BitVec 32))) (Intermediate!6372 (undefined!7184 Bool) (index!27774 (_ BitVec 32)) (x!56588 (_ BitVec 32))) (Undefined!6372) (MissingVacant!6372 (index!27775 (_ BitVec 32))) )
))
(declare-fun lt!279890 () SeekEntryResult!6372)

(declare-fun lt!279892 () SeekEntryResult!6372)

(assert (=> b!611714 (= e!350572 (= lt!279890 lt!279892))))

(declare-fun b!611715 () Bool)

(declare-fun e!350563 () Bool)

(assert (=> b!611715 (= e!350563 e!350570)))

(declare-fun res!393407 () Bool)

(assert (=> b!611715 (=> (not res!393407) (not e!350570))))

(declare-fun lt!279893 () SeekEntryResult!6372)

(assert (=> b!611715 (= res!393407 (or (= lt!279893 (MissingZero!6372 i!1108)) (= lt!279893 (MissingVacant!6372 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37372 (_ BitVec 32)) SeekEntryResult!6372)

(assert (=> b!611715 (= lt!279893 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!611716 () Bool)

(declare-fun e!350561 () Bool)

(assert (=> b!611716 (= e!350565 e!350561)))

(declare-fun res!393409 () Bool)

(assert (=> b!611716 (=> res!393409 e!350561)))

(assert (=> b!611716 (= res!393409 (bvsge index!984 j!136))))

(declare-fun lt!279884 () Unit!19612)

(assert (=> b!611716 (= lt!279884 e!350567)))

(declare-fun c!69521 () Bool)

(assert (=> b!611716 (= c!69521 (bvslt j!136 index!984))))

(declare-fun b!611717 () Bool)

(declare-fun res!393410 () Bool)

(assert (=> b!611717 (=> (not res!393410) (not e!350563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611717 (= res!393410 (validKeyInArray!0 k0!1786))))

(declare-fun b!611718 () Bool)

(declare-fun e!350562 () Unit!19612)

(declare-fun Unit!19615 () Unit!19612)

(assert (=> b!611718 (= e!350562 Unit!19615)))

(declare-fun b!611719 () Bool)

(declare-fun e!350571 () Bool)

(assert (=> b!611719 (= e!350564 e!350571)))

(declare-fun res!393422 () Bool)

(assert (=> b!611719 (=> res!393422 e!350571)))

(assert (=> b!611719 (= res!393422 (or (not (= (select (arr!17932 a!2986) j!136) lt!279895)) (not (= (select (arr!17932 a!2986) j!136) lt!279894)) (bvsge j!136 index!984)))))

(declare-fun b!611720 () Bool)

(assert (=> b!611720 (= e!350561 true)))

(assert (=> b!611720 (arrayNoDuplicates!0 lt!279883 #b00000000000000000000000000000000 Nil!11970)))

(declare-fun lt!279885 () Unit!19612)

(assert (=> b!611720 (= lt!279885 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11970))))

(assert (=> b!611720 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279880 () Unit!19612)

(assert (=> b!611720 (= lt!279880 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279883 (select (arr!17932 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350569 () Bool)

(assert (=> b!611720 e!350569))

(declare-fun res!393404 () Bool)

(assert (=> b!611720 (=> (not res!393404) (not e!350569))))

(assert (=> b!611720 (= res!393404 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) j!136))))

(declare-fun b!611721 () Bool)

(declare-fun Unit!19616 () Unit!19612)

(assert (=> b!611721 (= e!350567 Unit!19616)))

(declare-fun b!611722 () Bool)

(declare-fun res!393415 () Bool)

(assert (=> b!611722 (=> (not res!393415) (not e!350570))))

(assert (=> b!611722 (= res!393415 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11970))))

(declare-fun res!393408 () Bool)

(assert (=> start!55902 (=> (not res!393408) (not e!350563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55902 (= res!393408 (validMask!0 mask!3053))))

(assert (=> start!55902 e!350563))

(assert (=> start!55902 true))

(declare-fun array_inv!13728 (array!37372) Bool)

(assert (=> start!55902 (array_inv!13728 a!2986)))

(declare-fun b!611710 () Bool)

(declare-fun res!393417 () Bool)

(assert (=> b!611710 (=> (not res!393417) (not e!350570))))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!611710 (= res!393417 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17932 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611723 () Bool)

(declare-fun res!393405 () Bool)

(assert (=> b!611723 (=> (not res!393405) (not e!350563))))

(assert (=> b!611723 (= res!393405 (validKeyInArray!0 (select (arr!17932 a!2986) j!136)))))

(declare-fun b!611724 () Bool)

(declare-fun res!393413 () Bool)

(assert (=> b!611724 (=> (not res!393413) (not e!350570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37372 (_ BitVec 32)) Bool)

(assert (=> b!611724 (= res!393413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611725 () Bool)

(declare-fun res!393411 () Bool)

(assert (=> b!611725 (=> (not res!393411) (not e!350563))))

(assert (=> b!611725 (= res!393411 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!611726 () Bool)

(declare-fun res!393421 () Bool)

(assert (=> b!611726 (=> (not res!393421) (not e!350563))))

(assert (=> b!611726 (= res!393421 (and (= (size!18296 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18296 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18296 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611727 () Bool)

(declare-fun e!350568 () Bool)

(assert (=> b!611727 (= e!350568 (not e!350573))))

(declare-fun res!393416 () Bool)

(assert (=> b!611727 (=> res!393416 e!350573)))

(declare-fun lt!279881 () SeekEntryResult!6372)

(assert (=> b!611727 (= res!393416 (not (= lt!279881 (Found!6372 index!984))))))

(declare-fun lt!279891 () Unit!19612)

(assert (=> b!611727 (= lt!279891 e!350562)))

(declare-fun c!69520 () Bool)

(assert (=> b!611727 (= c!69520 (= lt!279881 Undefined!6372))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37372 (_ BitVec 32)) SeekEntryResult!6372)

(assert (=> b!611727 (= lt!279881 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279895 lt!279883 mask!3053))))

(assert (=> b!611727 e!350572))

(declare-fun res!393420 () Bool)

(assert (=> b!611727 (=> (not res!393420) (not e!350572))))

(declare-fun lt!279888 () (_ BitVec 32))

(assert (=> b!611727 (= res!393420 (= lt!279892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279888 vacantSpotIndex!68 lt!279895 lt!279883 mask!3053)))))

(assert (=> b!611727 (= lt!279892 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279888 vacantSpotIndex!68 (select (arr!17932 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611727 (= lt!279895 (select (store (arr!17932 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!279886 () Unit!19612)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19612)

(assert (=> b!611727 (= lt!279886 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279888 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611727 (= lt!279888 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611728 () Bool)

(assert (=> b!611728 (= e!350574 e!350568)))

(declare-fun res!393419 () Bool)

(assert (=> b!611728 (=> (not res!393419) (not e!350568))))

(assert (=> b!611728 (= res!393419 (and (= lt!279890 (Found!6372 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17932 a!2986) index!984) (select (arr!17932 a!2986) j!136))) (not (= (select (arr!17932 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!611728 (= lt!279890 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17932 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611729 () Bool)

(assert (=> b!611729 (= e!350569 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) index!984))))

(declare-fun b!611730 () Bool)

(declare-fun e!350560 () Bool)

(assert (=> b!611730 (= e!350560 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) index!984))))

(declare-fun b!611731 () Bool)

(assert (=> b!611731 (= e!350571 e!350560)))

(declare-fun res!393406 () Bool)

(assert (=> b!611731 (=> (not res!393406) (not e!350560))))

(assert (=> b!611731 (= res!393406 (arrayContainsKey!0 lt!279883 (select (arr!17932 a!2986) j!136) j!136))))

(declare-fun b!611732 () Bool)

(declare-fun Unit!19617 () Unit!19612)

(assert (=> b!611732 (= e!350562 Unit!19617)))

(assert (=> b!611732 false))

(assert (= (and start!55902 res!393408) b!611726))

(assert (= (and b!611726 res!393421) b!611723))

(assert (= (and b!611723 res!393405) b!611717))

(assert (= (and b!611717 res!393410) b!611725))

(assert (= (and b!611725 res!393411) b!611715))

(assert (= (and b!611715 res!393407) b!611724))

(assert (= (and b!611724 res!393413) b!611722))

(assert (= (and b!611722 res!393415) b!611710))

(assert (= (and b!611710 res!393417) b!611713))

(assert (= (and b!611713 res!393418) b!611728))

(assert (= (and b!611728 res!393419) b!611727))

(assert (= (and b!611727 res!393420) b!611714))

(assert (= (and b!611727 c!69520) b!611732))

(assert (= (and b!611727 (not c!69520)) b!611718))

(assert (= (and b!611727 (not res!393416)) b!611712))

(assert (= (and b!611712 res!393412) b!611719))

(assert (= (and b!611719 (not res!393422)) b!611731))

(assert (= (and b!611731 res!393406) b!611730))

(assert (= (and b!611712 (not res!393414)) b!611716))

(assert (= (and b!611716 c!69521) b!611711))

(assert (= (and b!611716 (not c!69521)) b!611721))

(assert (= (and b!611716 (not res!393409)) b!611720))

(assert (= (and b!611720 res!393404) b!611729))

(declare-fun m!588111 () Bool)

(assert (=> b!611713 m!588111))

(declare-fun m!588113 () Bool)

(assert (=> b!611713 m!588113))

(declare-fun m!588115 () Bool)

(assert (=> b!611725 m!588115))

(declare-fun m!588117 () Bool)

(assert (=> b!611711 m!588117))

(declare-fun m!588119 () Bool)

(assert (=> b!611711 m!588119))

(assert (=> b!611711 m!588117))

(declare-fun m!588121 () Bool)

(assert (=> b!611711 m!588121))

(assert (=> b!611711 m!588117))

(declare-fun m!588123 () Bool)

(assert (=> b!611711 m!588123))

(declare-fun m!588125 () Bool)

(assert (=> b!611711 m!588125))

(declare-fun m!588127 () Bool)

(assert (=> b!611711 m!588127))

(declare-fun m!588129 () Bool)

(assert (=> b!611711 m!588129))

(assert (=> b!611711 m!588117))

(declare-fun m!588131 () Bool)

(assert (=> b!611711 m!588131))

(assert (=> b!611720 m!588117))

(assert (=> b!611720 m!588117))

(declare-fun m!588133 () Bool)

(assert (=> b!611720 m!588133))

(assert (=> b!611720 m!588117))

(declare-fun m!588135 () Bool)

(assert (=> b!611720 m!588135))

(assert (=> b!611720 m!588117))

(declare-fun m!588137 () Bool)

(assert (=> b!611720 m!588137))

(assert (=> b!611720 m!588127))

(assert (=> b!611720 m!588129))

(assert (=> b!611712 m!588117))

(assert (=> b!611712 m!588111))

(declare-fun m!588139 () Bool)

(assert (=> b!611712 m!588139))

(declare-fun m!588141 () Bool)

(assert (=> b!611722 m!588141))

(declare-fun m!588143 () Bool)

(assert (=> b!611728 m!588143))

(assert (=> b!611728 m!588117))

(assert (=> b!611728 m!588117))

(declare-fun m!588145 () Bool)

(assert (=> b!611728 m!588145))

(assert (=> b!611729 m!588117))

(assert (=> b!611729 m!588117))

(declare-fun m!588147 () Bool)

(assert (=> b!611729 m!588147))

(declare-fun m!588149 () Bool)

(assert (=> b!611727 m!588149))

(declare-fun m!588151 () Bool)

(assert (=> b!611727 m!588151))

(assert (=> b!611727 m!588117))

(declare-fun m!588153 () Bool)

(assert (=> b!611727 m!588153))

(assert (=> b!611727 m!588111))

(assert (=> b!611727 m!588117))

(declare-fun m!588155 () Bool)

(assert (=> b!611727 m!588155))

(declare-fun m!588157 () Bool)

(assert (=> b!611727 m!588157))

(declare-fun m!588159 () Bool)

(assert (=> b!611727 m!588159))

(declare-fun m!588161 () Bool)

(assert (=> b!611710 m!588161))

(assert (=> b!611730 m!588117))

(assert (=> b!611730 m!588117))

(assert (=> b!611730 m!588147))

(declare-fun m!588163 () Bool)

(assert (=> b!611717 m!588163))

(assert (=> b!611723 m!588117))

(assert (=> b!611723 m!588117))

(declare-fun m!588165 () Bool)

(assert (=> b!611723 m!588165))

(declare-fun m!588167 () Bool)

(assert (=> b!611724 m!588167))

(declare-fun m!588169 () Bool)

(assert (=> start!55902 m!588169))

(declare-fun m!588171 () Bool)

(assert (=> start!55902 m!588171))

(assert (=> b!611731 m!588117))

(assert (=> b!611731 m!588117))

(assert (=> b!611731 m!588133))

(declare-fun m!588173 () Bool)

(assert (=> b!611715 m!588173))

(assert (=> b!611719 m!588117))

(check-sat (not b!611722) (not b!611724) (not b!611729) (not b!611723) (not b!611727) (not b!611717) (not b!611731) (not b!611730) (not b!611728) (not b!611725) (not start!55902) (not b!611720) (not b!611715) (not b!611711))
(check-sat)
