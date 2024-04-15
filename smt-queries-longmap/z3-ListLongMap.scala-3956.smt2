; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53730 () Bool)

(assert start!53730)

(declare-fun b!586002 () Bool)

(declare-fun e!335045 () Bool)

(assert (=> b!586002 (= e!335045 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265815 () (_ BitVec 32))

(declare-datatypes ((array!36645 0))(
  ( (array!36646 (arr!17597 (Array (_ BitVec 32) (_ BitVec 64))) (size!17962 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36645)

(declare-datatypes ((SeekEntryResult!6034 0))(
  ( (MissingZero!6034 (index!26363 (_ BitVec 32))) (Found!6034 (index!26364 (_ BitVec 32))) (Intermediate!6034 (undefined!6846 Bool) (index!26365 (_ BitVec 32)) (x!55186 (_ BitVec 32))) (Undefined!6034) (MissingVacant!6034 (index!26366 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36645 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!586002 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265815 vacantSpotIndex!68 (select (arr!17597 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265815 vacantSpotIndex!68 (select (store (arr!17597 a!2986) i!1108 k0!1786) j!136) (array!36646 (store (arr!17597 a!2986) i!1108 k0!1786) (size!17962 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18174 0))(
  ( (Unit!18175) )
))
(declare-fun lt!265816 () Unit!18174)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36645 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18174)

(assert (=> b!586002 (= lt!265816 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!265815 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!586002 (= lt!265815 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!586003 () Bool)

(declare-fun res!373966 () Bool)

(assert (=> b!586003 (=> (not res!373966) (not e!335045))))

(assert (=> b!586003 (= res!373966 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17597 a!2986) index!984) (select (arr!17597 a!2986) j!136))) (not (= (select (arr!17597 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!586004 () Bool)

(declare-fun e!335046 () Bool)

(assert (=> b!586004 (= e!335046 e!335045)))

(declare-fun res!373964 () Bool)

(assert (=> b!586004 (=> (not res!373964) (not e!335045))))

(declare-fun lt!265814 () SeekEntryResult!6034)

(assert (=> b!586004 (= res!373964 (or (= lt!265814 (MissingZero!6034 i!1108)) (= lt!265814 (MissingVacant!6034 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36645 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!586004 (= lt!265814 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!373960 () Bool)

(assert (=> start!53730 (=> (not res!373960) (not e!335046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53730 (= res!373960 (validMask!0 mask!3053))))

(assert (=> start!53730 e!335046))

(assert (=> start!53730 true))

(declare-fun array_inv!13480 (array!36645) Bool)

(assert (=> start!53730 (array_inv!13480 a!2986)))

(declare-fun b!586005 () Bool)

(declare-fun res!373962 () Bool)

(assert (=> b!586005 (=> (not res!373962) (not e!335045))))

(assert (=> b!586005 (= res!373962 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17597 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17597 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!586006 () Bool)

(declare-fun res!373961 () Bool)

(assert (=> b!586006 (=> (not res!373961) (not e!335046))))

(assert (=> b!586006 (= res!373961 (and (= (size!17962 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17962 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17962 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!586007 () Bool)

(declare-fun res!373968 () Bool)

(assert (=> b!586007 (=> (not res!373968) (not e!335045))))

(assert (=> b!586007 (= res!373968 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17597 a!2986) j!136) a!2986 mask!3053) (Found!6034 j!136)))))

(declare-fun b!586008 () Bool)

(declare-fun res!373969 () Bool)

(assert (=> b!586008 (=> (not res!373969) (not e!335045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36645 (_ BitVec 32)) Bool)

(assert (=> b!586008 (= res!373969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!586009 () Bool)

(declare-fun res!373967 () Bool)

(assert (=> b!586009 (=> (not res!373967) (not e!335045))))

(declare-datatypes ((List!11677 0))(
  ( (Nil!11674) (Cons!11673 (h!12718 (_ BitVec 64)) (t!17896 List!11677)) )
))
(declare-fun arrayNoDuplicates!0 (array!36645 (_ BitVec 32) List!11677) Bool)

(assert (=> b!586009 (= res!373967 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11674))))

(declare-fun b!586010 () Bool)

(declare-fun res!373970 () Bool)

(assert (=> b!586010 (=> (not res!373970) (not e!335046))))

(declare-fun arrayContainsKey!0 (array!36645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!586010 (= res!373970 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!586011 () Bool)

(declare-fun res!373965 () Bool)

(assert (=> b!586011 (=> (not res!373965) (not e!335046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!586011 (= res!373965 (validKeyInArray!0 k0!1786))))

(declare-fun b!586012 () Bool)

(declare-fun res!373963 () Bool)

(assert (=> b!586012 (=> (not res!373963) (not e!335046))))

(assert (=> b!586012 (= res!373963 (validKeyInArray!0 (select (arr!17597 a!2986) j!136)))))

(assert (= (and start!53730 res!373960) b!586006))

(assert (= (and b!586006 res!373961) b!586012))

(assert (= (and b!586012 res!373963) b!586011))

(assert (= (and b!586011 res!373965) b!586010))

(assert (= (and b!586010 res!373970) b!586004))

(assert (= (and b!586004 res!373964) b!586008))

(assert (= (and b!586008 res!373969) b!586009))

(assert (= (and b!586009 res!373967) b!586005))

(assert (= (and b!586005 res!373962) b!586007))

(assert (= (and b!586007 res!373968) b!586003))

(assert (= (and b!586003 res!373966) b!586002))

(declare-fun m!563821 () Bool)

(assert (=> b!586002 m!563821))

(declare-fun m!563823 () Bool)

(assert (=> b!586002 m!563823))

(declare-fun m!563825 () Bool)

(assert (=> b!586002 m!563825))

(assert (=> b!586002 m!563823))

(declare-fun m!563827 () Bool)

(assert (=> b!586002 m!563827))

(assert (=> b!586002 m!563821))

(declare-fun m!563829 () Bool)

(assert (=> b!586002 m!563829))

(declare-fun m!563831 () Bool)

(assert (=> b!586002 m!563831))

(declare-fun m!563833 () Bool)

(assert (=> b!586002 m!563833))

(declare-fun m!563835 () Bool)

(assert (=> b!586003 m!563835))

(assert (=> b!586003 m!563823))

(declare-fun m!563837 () Bool)

(assert (=> b!586009 m!563837))

(declare-fun m!563839 () Bool)

(assert (=> b!586005 m!563839))

(assert (=> b!586005 m!563825))

(declare-fun m!563841 () Bool)

(assert (=> b!586005 m!563841))

(declare-fun m!563843 () Bool)

(assert (=> b!586008 m!563843))

(declare-fun m!563845 () Bool)

(assert (=> b!586011 m!563845))

(assert (=> b!586012 m!563823))

(assert (=> b!586012 m!563823))

(declare-fun m!563847 () Bool)

(assert (=> b!586012 m!563847))

(declare-fun m!563849 () Bool)

(assert (=> start!53730 m!563849))

(declare-fun m!563851 () Bool)

(assert (=> start!53730 m!563851))

(declare-fun m!563853 () Bool)

(assert (=> b!586010 m!563853))

(assert (=> b!586007 m!563823))

(assert (=> b!586007 m!563823))

(declare-fun m!563855 () Bool)

(assert (=> b!586007 m!563855))

(declare-fun m!563857 () Bool)

(assert (=> b!586004 m!563857))

(check-sat (not b!586009) (not b!586004) (not b!586012) (not b!586010) (not start!53730) (not b!586007) (not b!586008) (not b!586011) (not b!586002))
(check-sat)
