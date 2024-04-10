; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56510 () Bool)

(assert start!56510)

(declare-fun b!626249 () Bool)

(declare-fun res!404098 () Bool)

(declare-fun e!358825 () Bool)

(assert (=> b!626249 (=> (not res!404098) (not e!358825))))

(declare-datatypes ((array!37847 0))(
  ( (array!37848 (arr!18165 (Array (_ BitVec 32) (_ BitVec 64))) (size!18529 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37847)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37847 (_ BitVec 32)) Bool)

(assert (=> b!626249 (= res!404098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626250 () Bool)

(declare-fun res!404093 () Bool)

(declare-fun e!358827 () Bool)

(assert (=> b!626250 (=> (not res!404093) (not e!358827))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626250 (= res!404093 (validKeyInArray!0 (select (arr!18165 a!2986) j!136)))))

(declare-fun res!404102 () Bool)

(assert (=> start!56510 (=> (not res!404102) (not e!358827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56510 (= res!404102 (validMask!0 mask!3053))))

(assert (=> start!56510 e!358827))

(assert (=> start!56510 true))

(declare-fun array_inv!13961 (array!37847) Bool)

(assert (=> start!56510 (array_inv!13961 a!2986)))

(declare-fun b!626251 () Bool)

(declare-fun res!404100 () Bool)

(assert (=> b!626251 (=> (not res!404100) (not e!358827))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626251 (= res!404100 (and (= (size!18529 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18529 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18529 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626252 () Bool)

(declare-fun res!404099 () Bool)

(assert (=> b!626252 (=> (not res!404099) (not e!358827))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626252 (= res!404099 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!626253 () Bool)

(declare-fun res!404101 () Bool)

(assert (=> b!626253 (=> (not res!404101) (not e!358825))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6605 0))(
  ( (MissingZero!6605 (index!28704 (_ BitVec 32))) (Found!6605 (index!28705 (_ BitVec 32))) (Intermediate!6605 (undefined!7417 Bool) (index!28706 (_ BitVec 32)) (x!57454 (_ BitVec 32))) (Undefined!6605) (MissingVacant!6605 (index!28707 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37847 (_ BitVec 32)) SeekEntryResult!6605)

(assert (=> b!626253 (= res!404101 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18165 a!2986) j!136) a!2986 mask!3053) (Found!6605 j!136)))))

(declare-fun b!626254 () Bool)

(declare-fun res!404094 () Bool)

(assert (=> b!626254 (=> (not res!404094) (not e!358825))))

(assert (=> b!626254 (= res!404094 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18165 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18165 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626255 () Bool)

(declare-fun res!404095 () Bool)

(assert (=> b!626255 (=> (not res!404095) (not e!358825))))

(declare-datatypes ((List!12206 0))(
  ( (Nil!12203) (Cons!12202 (h!13247 (_ BitVec 64)) (t!18434 List!12206)) )
))
(declare-fun arrayNoDuplicates!0 (array!37847 (_ BitVec 32) List!12206) Bool)

(assert (=> b!626255 (= res!404095 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12203))))

(declare-fun b!626256 () Bool)

(assert (=> b!626256 (= e!358825 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18165 a!2986) index!984) (select (arr!18165 a!2986) j!136))) (= (select (arr!18165 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626257 () Bool)

(assert (=> b!626257 (= e!358827 e!358825)))

(declare-fun res!404097 () Bool)

(assert (=> b!626257 (=> (not res!404097) (not e!358825))))

(declare-fun lt!290017 () SeekEntryResult!6605)

(assert (=> b!626257 (= res!404097 (or (= lt!290017 (MissingZero!6605 i!1108)) (= lt!290017 (MissingVacant!6605 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37847 (_ BitVec 32)) SeekEntryResult!6605)

(assert (=> b!626257 (= lt!290017 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!626258 () Bool)

(declare-fun res!404096 () Bool)

(assert (=> b!626258 (=> (not res!404096) (not e!358827))))

(assert (=> b!626258 (= res!404096 (validKeyInArray!0 k!1786))))

(assert (= (and start!56510 res!404102) b!626251))

(assert (= (and b!626251 res!404100) b!626250))

(assert (= (and b!626250 res!404093) b!626258))

(assert (= (and b!626258 res!404096) b!626252))

(assert (= (and b!626252 res!404099) b!626257))

(assert (= (and b!626257 res!404097) b!626249))

(assert (= (and b!626249 res!404098) b!626255))

(assert (= (and b!626255 res!404095) b!626254))

(assert (= (and b!626254 res!404094) b!626253))

(assert (= (and b!626253 res!404101) b!626256))

(declare-fun m!601713 () Bool)

(assert (=> start!56510 m!601713))

(declare-fun m!601715 () Bool)

(assert (=> start!56510 m!601715))

(declare-fun m!601717 () Bool)

(assert (=> b!626257 m!601717))

(declare-fun m!601719 () Bool)

(assert (=> b!626249 m!601719))

(declare-fun m!601721 () Bool)

(assert (=> b!626253 m!601721))

(assert (=> b!626253 m!601721))

(declare-fun m!601723 () Bool)

(assert (=> b!626253 m!601723))

(declare-fun m!601725 () Bool)

(assert (=> b!626256 m!601725))

(assert (=> b!626256 m!601721))

(declare-fun m!601727 () Bool)

(assert (=> b!626255 m!601727))

(declare-fun m!601729 () Bool)

(assert (=> b!626258 m!601729))

(declare-fun m!601731 () Bool)

(assert (=> b!626252 m!601731))

(declare-fun m!601733 () Bool)

(assert (=> b!626254 m!601733))

(declare-fun m!601735 () Bool)

(assert (=> b!626254 m!601735))

(declare-fun m!601737 () Bool)

(assert (=> b!626254 m!601737))

(assert (=> b!626250 m!601721))

(assert (=> b!626250 m!601721))

(declare-fun m!601739 () Bool)

(assert (=> b!626250 m!601739))

(push 1)

(assert (not b!626253))

(assert (not b!626258))

(assert (not b!626252))

(assert (not b!626255))

(assert (not b!626257))

(assert (not b!626250))

(assert (not start!56510))

(assert (not b!626249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!626376 () Bool)

(declare-fun e!358883 () SeekEntryResult!6605)

(assert (=> b!626376 (= e!358883 (Found!6605 index!984))))

(declare-fun b!626377 () Bool)

(declare-fun e!358882 () SeekEntryResult!6605)

(assert (=> b!626377 (= e!358882 Undefined!6605)))

(declare-fun b!626378 () Bool)

(assert (=> b!626378 (= e!358882 e!358883)))

(declare-fun lt!290044 () (_ BitVec 64))

(declare-fun c!71467 () Bool)

(assert (=> b!626378 (= c!71467 (= lt!290044 (select (arr!18165 a!2986) j!136)))))

(declare-fun b!626379 () Bool)

(declare-fun c!71466 () Bool)

(assert (=> b!626379 (= c!71466 (= lt!290044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358884 () SeekEntryResult!6605)

(assert (=> b!626379 (= e!358883 e!358884)))

(declare-fun lt!290043 () SeekEntryResult!6605)

(declare-fun d!88901 () Bool)

(assert (=> d!88901 (and (or (is-Undefined!6605 lt!290043) (not (is-Found!6605 lt!290043)) (and (bvsge (index!28705 lt!290043) #b00000000000000000000000000000000) (bvslt (index!28705 lt!290043) (size!18529 a!2986)))) (or (is-Undefined!6605 lt!290043) (is-Found!6605 lt!290043) (not (is-MissingVacant!6605 lt!290043)) (not (= (index!28707 lt!290043) vacantSpotIndex!68)) (and (bvsge (index!28707 lt!290043) #b00000000000000000000000000000000) (bvslt (index!28707 lt!290043) (size!18529 a!2986)))) (or (is-Undefined!6605 lt!290043) (ite (is-Found!6605 lt!290043) (= (select (arr!18165 a!2986) (index!28705 lt!290043)) (select (arr!18165 a!2986) j!136)) (and (is-MissingVacant!6605 lt!290043) (= (index!28707 lt!290043) vacantSpotIndex!68) (= (select (arr!18165 a!2986) (index!28707 lt!290043)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!88901 (= lt!290043 e!358882)))

(declare-fun c!71468 () Bool)

(assert (=> d!88901 (= c!71468 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!88901 (= lt!290044 (select (arr!18165 a!2986) index!984))))

(assert (=> d!88901 (validMask!0 mask!3053)))

(assert (=> d!88901 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18165 a!2986) j!136) a!2986 mask!3053) lt!290043)))

(declare-fun b!626380 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626380 (= e!358884 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18165 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!626381 () Bool)

(assert (=> b!626381 (= e!358884 (MissingVacant!6605 vacantSpotIndex!68))))

(assert (= (and d!88901 c!71468) b!626377))

(assert (= (and d!88901 (not c!71468)) b!626378))

(assert (= (and b!626378 c!71467) b!626376))

(assert (= (and b!626378 (not c!71467)) b!626379))

(assert (= (and b!626379 c!71466) b!626381))

(assert (= (and b!626379 (not c!71466)) b!626380))

(declare-fun m!601825 () Bool)

(assert (=> d!88901 m!601825))

(declare-fun m!601827 () Bool)

(assert (=> d!88901 m!601827))

(assert (=> d!88901 m!601725))

(assert (=> d!88901 m!601713))

(declare-fun m!601829 () Bool)

(assert (=> b!626380 m!601829))

(assert (=> b!626380 m!601829))

(assert (=> b!626380 m!601721))

(declare-fun m!601831 () Bool)

(assert (=> b!626380 m!601831))

(assert (=> b!626253 d!88901))

(declare-fun d!88909 () Bool)

(assert (=> d!88909 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!626258 d!88909))

(declare-fun b!626424 () Bool)

(declare-fun e!358913 () SeekEntryResult!6605)

(declare-fun lt!290066 () SeekEntryResult!6605)

(assert (=> b!626424 (= e!358913 (Found!6605 (index!28706 lt!290066)))))

(declare-fun b!626425 () Bool)

(declare-fun e!358914 () SeekEntryResult!6605)

(assert (=> b!626425 (= e!358914 (MissingZero!6605 (index!28706 lt!290066)))))

(declare-fun b!626426 () Bool)

(declare-fun e!358912 () SeekEntryResult!6605)

(assert (=> b!626426 (= e!358912 Undefined!6605)))

(declare-fun d!88911 () Bool)

(declare-fun lt!290064 () SeekEntryResult!6605)

(assert (=> d!88911 (and (or (is-Undefined!6605 lt!290064) (not (is-Found!6605 lt!290064)) (and (bvsge (index!28705 lt!290064) #b00000000000000000000000000000000) (bvslt (index!28705 lt!290064) (size!18529 a!2986)))) (or (is-Undefined!6605 lt!290064) (is-Found!6605 lt!290064) (not (is-MissingZero!6605 lt!290064)) (and (bvsge (index!28704 lt!290064) #b00000000000000000000000000000000) (bvslt (index!28704 lt!290064) (size!18529 a!2986)))) (or (is-Undefined!6605 lt!290064) (is-Found!6605 lt!290064) (is-MissingZero!6605 lt!290064) (not (is-MissingVacant!6605 lt!290064)) (and (bvsge (index!28707 lt!290064) #b00000000000000000000000000000000) (bvslt (index!28707 lt!290064) (size!18529 a!2986)))) (or (is-Undefined!6605 lt!290064) (ite (is-Found!6605 lt!290064) (= (select (arr!18165 a!2986) (index!28705 lt!290064)) k!1786) (ite (is-MissingZero!6605 lt!290064) (= (select (arr!18165 a!2986) (index!28704 lt!290064)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!6605 lt!290064) (= (select (arr!18165 a!2986) (index!28707 lt!290064)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88911 (= lt!290064 e!358912)))

(declare-fun c!71484 () Bool)

(assert (=> d!88911 (= c!71484 (and (is-Intermediate!6605 lt!290066) (undefined!7417 lt!290066)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37847 (_ BitVec 32)) SeekEntryResult!6605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88911 (= lt!290066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!88911 (validMask!0 mask!3053)))

(assert (=> d!88911 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!290064)))

(declare-fun b!626427 () Bool)

(assert (=> b!626427 (= e!358912 e!358913)))

(declare-fun lt!290065 () (_ BitVec 64))

(assert (=> b!626427 (= lt!290065 (select (arr!18165 a!2986) (index!28706 lt!290066)))))

(declare-fun c!71486 () Bool)

(assert (=> b!626427 (= c!71486 (= lt!290065 k!1786))))

(declare-fun b!626428 () Bool)

(declare-fun c!71485 () Bool)

(assert (=> b!626428 (= c!71485 (= lt!290065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!626428 (= e!358913 e!358914)))

(declare-fun b!626429 () Bool)

(assert (=> b!626429 (= e!358914 (seekKeyOrZeroReturnVacant!0 (x!57454 lt!290066) (index!28706 lt!290066) (index!28706 lt!290066) k!1786 a!2986 mask!3053))))

(assert (= (and d!88911 c!71484) b!626426))

(assert (= (and d!88911 (not c!71484)) b!626427))

(assert (= (and b!626427 c!71486) b!626424))

(assert (= (and b!626427 (not c!71486)) b!626428))

(assert (= (and b!626428 c!71485) b!626425))

(assert (= (and b!626428 (not c!71485)) b!626429))

(declare-fun m!601843 () Bool)

(assert (=> d!88911 m!601843))

(declare-fun m!601845 () Bool)

(assert (=> d!88911 m!601845))

(declare-fun m!601847 () Bool)

(assert (=> d!88911 m!601847))

(assert (=> d!88911 m!601713))

(assert (=> d!88911 m!601847))

(declare-fun m!601849 () Bool)

(assert (=> d!88911 m!601849))

(declare-fun m!601851 () Bool)

(assert (=> d!88911 m!601851))

(declare-fun m!601853 () Bool)

(assert (=> b!626427 m!601853))

(declare-fun m!601855 () Bool)

(assert (=> b!626429 m!601855))

(assert (=> b!626257 d!88911))

(declare-fun d!88929 () Bool)

(declare-fun res!404194 () Bool)

(declare-fun e!358922 () Bool)

(assert (=> d!88929 (=> res!404194 e!358922)))

(assert (=> d!88929 (= res!404194 (= (select (arr!18165 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!88929 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!358922)))

(declare-fun b!626440 () Bool)

(declare-fun e!358923 () Bool)

(assert (=> b!626440 (= e!358922 e!358923)))

(declare-fun res!404195 () Bool)

(assert (=> b!626440 (=> (not res!404195) (not e!358923))))

(assert (=> b!626440 (= res!404195 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18529 a!2986)))))

(declare-fun b!626441 () Bool)

(assert (=> b!626441 (= e!358923 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88929 (not res!404194)) b!626440))

(assert (= (and b!626440 res!404195) b!626441))

(declare-fun m!601865 () Bool)

(assert (=> d!88929 m!601865))

(declare-fun m!601867 () Bool)

(assert (=> b!626441 m!601867))

(assert (=> b!626252 d!88929))

(declare-fun d!88933 () Bool)

(assert (=> d!88933 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56510 