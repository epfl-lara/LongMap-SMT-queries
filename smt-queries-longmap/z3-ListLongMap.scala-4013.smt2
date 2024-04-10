; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54552 () Bool)

(assert start!54552)

(declare-fun b!596413 () Bool)

(declare-fun res!382217 () Bool)

(declare-fun e!340758 () Bool)

(assert (=> b!596413 (=> (not res!382217) (not e!340758))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596413 (= res!382217 (validKeyInArray!0 k0!1786))))

(declare-fun b!596414 () Bool)

(declare-fun e!340753 () Bool)

(declare-fun e!340761 () Bool)

(assert (=> b!596414 (= e!340753 e!340761)))

(declare-fun res!382211 () Bool)

(assert (=> b!596414 (=> (not res!382211) (not e!340761))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37012 0))(
  ( (array!37013 (arr!17770 (Array (_ BitVec 32) (_ BitVec 64))) (size!18134 (_ BitVec 32))) )
))
(declare-fun lt!270883 () array!37012)

(declare-fun a!2986 () array!37012)

(declare-fun arrayContainsKey!0 (array!37012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596414 (= res!382211 (arrayContainsKey!0 lt!270883 (select (arr!17770 a!2986) j!136) j!136))))

(declare-fun b!596415 () Bool)

(declare-fun e!340763 () Bool)

(declare-fun e!340752 () Bool)

(assert (=> b!596415 (= e!340763 (not e!340752))))

(declare-fun res!382209 () Bool)

(assert (=> b!596415 (=> res!382209 e!340752)))

(declare-datatypes ((SeekEntryResult!6210 0))(
  ( (MissingZero!6210 (index!27088 (_ BitVec 32))) (Found!6210 (index!27089 (_ BitVec 32))) (Intermediate!6210 (undefined!7022 Bool) (index!27090 (_ BitVec 32)) (x!55886 (_ BitVec 32))) (Undefined!6210) (MissingVacant!6210 (index!27091 (_ BitVec 32))) )
))
(declare-fun lt!270886 () SeekEntryResult!6210)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596415 (= res!382209 (not (= lt!270886 (Found!6210 index!984))))))

(declare-datatypes ((Unit!18758 0))(
  ( (Unit!18759) )
))
(declare-fun lt!270879 () Unit!18758)

(declare-fun e!340756 () Unit!18758)

(assert (=> b!596415 (= lt!270879 e!340756)))

(declare-fun c!67472 () Bool)

(assert (=> b!596415 (= c!67472 (= lt!270886 Undefined!6210))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun lt!270888 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37012 (_ BitVec 32)) SeekEntryResult!6210)

(assert (=> b!596415 (= lt!270886 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270888 lt!270883 mask!3053))))

(declare-fun e!340760 () Bool)

(assert (=> b!596415 e!340760))

(declare-fun res!382221 () Bool)

(assert (=> b!596415 (=> (not res!382221) (not e!340760))))

(declare-fun lt!270881 () (_ BitVec 32))

(declare-fun lt!270887 () SeekEntryResult!6210)

(assert (=> b!596415 (= res!382221 (= lt!270887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270881 vacantSpotIndex!68 lt!270888 lt!270883 mask!3053)))))

(assert (=> b!596415 (= lt!270887 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270881 vacantSpotIndex!68 (select (arr!17770 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!596415 (= lt!270888 (select (store (arr!17770 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!270882 () Unit!18758)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37012 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18758)

(assert (=> b!596415 (= lt!270882 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270881 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596415 (= lt!270881 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596416 () Bool)

(declare-fun res!382203 () Bool)

(assert (=> b!596416 (=> (not res!382203) (not e!340758))))

(assert (=> b!596416 (= res!382203 (and (= (size!18134 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18134 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18134 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596417 () Bool)

(declare-fun e!340762 () Bool)

(declare-fun e!340764 () Bool)

(assert (=> b!596417 (= e!340762 e!340764)))

(declare-fun res!382208 () Bool)

(assert (=> b!596417 (=> res!382208 e!340764)))

(assert (=> b!596417 (= res!382208 (or (bvsge (size!18134 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18134 a!2986))))))

(assert (=> b!596417 (arrayContainsKey!0 lt!270883 (select (arr!17770 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270878 () Unit!18758)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37012 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18758)

(assert (=> b!596417 (= lt!270878 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270883 (select (arr!17770 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596419 () Bool)

(declare-fun res!382210 () Bool)

(assert (=> b!596419 (=> res!382210 e!340764)))

(declare-datatypes ((List!11811 0))(
  ( (Nil!11808) (Cons!11807 (h!12852 (_ BitVec 64)) (t!18039 List!11811)) )
))
(declare-fun contains!2946 (List!11811 (_ BitVec 64)) Bool)

(assert (=> b!596419 (= res!382210 (contains!2946 Nil!11808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596420 () Bool)

(declare-fun Unit!18760 () Unit!18758)

(assert (=> b!596420 (= e!340756 Unit!18760)))

(declare-fun b!596421 () Bool)

(declare-fun res!382219 () Bool)

(declare-fun e!340755 () Bool)

(assert (=> b!596421 (=> (not res!382219) (not e!340755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37012 (_ BitVec 32)) Bool)

(assert (=> b!596421 (= res!382219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!596422 () Bool)

(assert (=> b!596422 (= e!340752 e!340762)))

(declare-fun res!382213 () Bool)

(assert (=> b!596422 (=> res!382213 e!340762)))

(declare-fun lt!270889 () (_ BitVec 64))

(assert (=> b!596422 (= res!382213 (or (not (= (select (arr!17770 a!2986) j!136) lt!270888)) (not (= (select (arr!17770 a!2986) j!136) lt!270889)) (bvsge j!136 index!984)))))

(declare-fun e!340759 () Bool)

(assert (=> b!596422 e!340759))

(declare-fun res!382207 () Bool)

(assert (=> b!596422 (=> (not res!382207) (not e!340759))))

(assert (=> b!596422 (= res!382207 (= lt!270889 (select (arr!17770 a!2986) j!136)))))

(assert (=> b!596422 (= lt!270889 (select (store (arr!17770 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!596423 () Bool)

(declare-fun res!382222 () Bool)

(assert (=> b!596423 (=> res!382222 e!340764)))

(declare-fun noDuplicate!265 (List!11811) Bool)

(assert (=> b!596423 (= res!382222 (not (noDuplicate!265 Nil!11808)))))

(declare-fun b!596424 () Bool)

(declare-fun res!382214 () Bool)

(assert (=> b!596424 (=> (not res!382214) (not e!340758))))

(assert (=> b!596424 (= res!382214 (validKeyInArray!0 (select (arr!17770 a!2986) j!136)))))

(declare-fun b!596425 () Bool)

(declare-fun e!340757 () Bool)

(assert (=> b!596425 (= e!340757 e!340763)))

(declare-fun res!382216 () Bool)

(assert (=> b!596425 (=> (not res!382216) (not e!340763))))

(declare-fun lt!270884 () SeekEntryResult!6210)

(assert (=> b!596425 (= res!382216 (and (= lt!270884 (Found!6210 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17770 a!2986) index!984) (select (arr!17770 a!2986) j!136))) (not (= (select (arr!17770 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596425 (= lt!270884 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17770 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596426 () Bool)

(assert (=> b!596426 (= e!340758 e!340755)))

(declare-fun res!382212 () Bool)

(assert (=> b!596426 (=> (not res!382212) (not e!340755))))

(declare-fun lt!270880 () SeekEntryResult!6210)

(assert (=> b!596426 (= res!382212 (or (= lt!270880 (MissingZero!6210 i!1108)) (= lt!270880 (MissingVacant!6210 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37012 (_ BitVec 32)) SeekEntryResult!6210)

(assert (=> b!596426 (= lt!270880 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!596427 () Bool)

(assert (=> b!596427 (= e!340760 (= lt!270884 lt!270887))))

(declare-fun b!596428 () Bool)

(declare-fun res!382218 () Bool)

(assert (=> b!596428 (=> res!382218 e!340764)))

(assert (=> b!596428 (= res!382218 (contains!2946 Nil!11808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596418 () Bool)

(assert (=> b!596418 (= e!340761 (arrayContainsKey!0 lt!270883 (select (arr!17770 a!2986) j!136) index!984))))

(declare-fun res!382220 () Bool)

(assert (=> start!54552 (=> (not res!382220) (not e!340758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54552 (= res!382220 (validMask!0 mask!3053))))

(assert (=> start!54552 e!340758))

(assert (=> start!54552 true))

(declare-fun array_inv!13566 (array!37012) Bool)

(assert (=> start!54552 (array_inv!13566 a!2986)))

(declare-fun b!596429 () Bool)

(declare-fun res!382223 () Bool)

(assert (=> b!596429 (=> (not res!382223) (not e!340758))))

(assert (=> b!596429 (= res!382223 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596430 () Bool)

(assert (=> b!596430 (= e!340755 e!340757)))

(declare-fun res!382206 () Bool)

(assert (=> b!596430 (=> (not res!382206) (not e!340757))))

(assert (=> b!596430 (= res!382206 (= (select (store (arr!17770 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!596430 (= lt!270883 (array!37013 (store (arr!17770 a!2986) i!1108 k0!1786) (size!18134 a!2986)))))

(declare-fun b!596431 () Bool)

(declare-fun res!382205 () Bool)

(assert (=> b!596431 (=> (not res!382205) (not e!340755))))

(declare-fun arrayNoDuplicates!0 (array!37012 (_ BitVec 32) List!11811) Bool)

(assert (=> b!596431 (= res!382205 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11808))))

(declare-fun b!596432 () Bool)

(declare-fun Unit!18761 () Unit!18758)

(assert (=> b!596432 (= e!340756 Unit!18761)))

(assert (=> b!596432 false))

(declare-fun b!596433 () Bool)

(assert (=> b!596433 (= e!340759 e!340753)))

(declare-fun res!382215 () Bool)

(assert (=> b!596433 (=> res!382215 e!340753)))

(assert (=> b!596433 (= res!382215 (or (not (= (select (arr!17770 a!2986) j!136) lt!270888)) (not (= (select (arr!17770 a!2986) j!136) lt!270889)) (bvsge j!136 index!984)))))

(declare-fun b!596434 () Bool)

(declare-fun res!382204 () Bool)

(assert (=> b!596434 (=> (not res!382204) (not e!340755))))

(assert (=> b!596434 (= res!382204 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17770 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596435 () Bool)

(assert (=> b!596435 (= e!340764 true)))

(declare-fun lt!270885 () Bool)

(assert (=> b!596435 (= lt!270885 (contains!2946 Nil!11808 k0!1786))))

(assert (= (and start!54552 res!382220) b!596416))

(assert (= (and b!596416 res!382203) b!596424))

(assert (= (and b!596424 res!382214) b!596413))

(assert (= (and b!596413 res!382217) b!596429))

(assert (= (and b!596429 res!382223) b!596426))

(assert (= (and b!596426 res!382212) b!596421))

(assert (= (and b!596421 res!382219) b!596431))

(assert (= (and b!596431 res!382205) b!596434))

(assert (= (and b!596434 res!382204) b!596430))

(assert (= (and b!596430 res!382206) b!596425))

(assert (= (and b!596425 res!382216) b!596415))

(assert (= (and b!596415 res!382221) b!596427))

(assert (= (and b!596415 c!67472) b!596432))

(assert (= (and b!596415 (not c!67472)) b!596420))

(assert (= (and b!596415 (not res!382209)) b!596422))

(assert (= (and b!596422 res!382207) b!596433))

(assert (= (and b!596433 (not res!382215)) b!596414))

(assert (= (and b!596414 res!382211) b!596418))

(assert (= (and b!596422 (not res!382213)) b!596417))

(assert (= (and b!596417 (not res!382208)) b!596423))

(assert (= (and b!596423 (not res!382222)) b!596428))

(assert (= (and b!596428 (not res!382218)) b!596419))

(assert (= (and b!596419 (not res!382210)) b!596435))

(declare-fun m!573909 () Bool)

(assert (=> b!596417 m!573909))

(assert (=> b!596417 m!573909))

(declare-fun m!573911 () Bool)

(assert (=> b!596417 m!573911))

(assert (=> b!596417 m!573909))

(declare-fun m!573913 () Bool)

(assert (=> b!596417 m!573913))

(assert (=> b!596424 m!573909))

(assert (=> b!596424 m!573909))

(declare-fun m!573915 () Bool)

(assert (=> b!596424 m!573915))

(declare-fun m!573917 () Bool)

(assert (=> b!596435 m!573917))

(declare-fun m!573919 () Bool)

(assert (=> b!596434 m!573919))

(declare-fun m!573921 () Bool)

(assert (=> b!596431 m!573921))

(declare-fun m!573923 () Bool)

(assert (=> start!54552 m!573923))

(declare-fun m!573925 () Bool)

(assert (=> start!54552 m!573925))

(declare-fun m!573927 () Bool)

(assert (=> b!596426 m!573927))

(declare-fun m!573929 () Bool)

(assert (=> b!596419 m!573929))

(declare-fun m!573931 () Bool)

(assert (=> b!596428 m!573931))

(declare-fun m!573933 () Bool)

(assert (=> b!596425 m!573933))

(assert (=> b!596425 m!573909))

(assert (=> b!596425 m!573909))

(declare-fun m!573935 () Bool)

(assert (=> b!596425 m!573935))

(declare-fun m!573937 () Bool)

(assert (=> b!596415 m!573937))

(declare-fun m!573939 () Bool)

(assert (=> b!596415 m!573939))

(assert (=> b!596415 m!573909))

(declare-fun m!573941 () Bool)

(assert (=> b!596415 m!573941))

(declare-fun m!573943 () Bool)

(assert (=> b!596415 m!573943))

(assert (=> b!596415 m!573909))

(declare-fun m!573945 () Bool)

(assert (=> b!596415 m!573945))

(declare-fun m!573947 () Bool)

(assert (=> b!596415 m!573947))

(declare-fun m!573949 () Bool)

(assert (=> b!596415 m!573949))

(assert (=> b!596433 m!573909))

(assert (=> b!596422 m!573909))

(assert (=> b!596422 m!573941))

(declare-fun m!573951 () Bool)

(assert (=> b!596422 m!573951))

(declare-fun m!573953 () Bool)

(assert (=> b!596423 m!573953))

(declare-fun m!573955 () Bool)

(assert (=> b!596421 m!573955))

(declare-fun m!573957 () Bool)

(assert (=> b!596413 m!573957))

(declare-fun m!573959 () Bool)

(assert (=> b!596429 m!573959))

(assert (=> b!596430 m!573941))

(declare-fun m!573961 () Bool)

(assert (=> b!596430 m!573961))

(assert (=> b!596414 m!573909))

(assert (=> b!596414 m!573909))

(declare-fun m!573963 () Bool)

(assert (=> b!596414 m!573963))

(assert (=> b!596418 m!573909))

(assert (=> b!596418 m!573909))

(declare-fun m!573965 () Bool)

(assert (=> b!596418 m!573965))

(check-sat (not b!596425) (not b!596428) (not b!596426) (not b!596413) (not b!596423) (not start!54552) (not b!596414) (not b!596431) (not b!596424) (not b!596435) (not b!596429) (not b!596417) (not b!596415) (not b!596421) (not b!596419) (not b!596418))
(check-sat)
