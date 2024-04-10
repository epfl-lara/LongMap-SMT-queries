; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54258 () Bool)

(assert start!54258)

(declare-fun b!592886 () Bool)

(declare-fun res!379508 () Bool)

(declare-fun e!338619 () Bool)

(assert (=> b!592886 (=> (not res!379508) (not e!338619))))

(declare-datatypes ((array!36925 0))(
  ( (array!36926 (arr!17731 (Array (_ BitVec 32) (_ BitVec 64))) (size!18095 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36925)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!592886 (= res!379508 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!592887 () Bool)

(declare-datatypes ((Unit!18602 0))(
  ( (Unit!18603) )
))
(declare-fun e!338616 () Unit!18602)

(declare-fun Unit!18604 () Unit!18602)

(assert (=> b!592887 (= e!338616 Unit!18604)))

(declare-fun b!592888 () Bool)

(declare-fun res!379517 () Bool)

(declare-fun e!338615 () Bool)

(assert (=> b!592888 (=> (not res!379517) (not e!338615))))

(declare-datatypes ((List!11772 0))(
  ( (Nil!11769) (Cons!11768 (h!12813 (_ BitVec 64)) (t!18000 List!11772)) )
))
(declare-fun arrayNoDuplicates!0 (array!36925 (_ BitVec 32) List!11772) Bool)

(assert (=> b!592888 (= res!379517 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11769))))

(declare-fun b!592889 () Bool)

(declare-fun e!338610 () Bool)

(declare-fun e!338617 () Bool)

(assert (=> b!592889 (= e!338610 e!338617)))

(declare-fun res!379510 () Bool)

(assert (=> b!592889 (=> (not res!379510) (not e!338617))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!269144 () array!36925)

(assert (=> b!592889 (= res!379510 (arrayContainsKey!0 lt!269144 (select (arr!17731 a!2986) j!136) j!136))))

(declare-fun b!592890 () Bool)

(declare-fun e!338614 () Bool)

(declare-fun e!338609 () Bool)

(assert (=> b!592890 (= e!338614 (not e!338609))))

(declare-fun res!379519 () Bool)

(assert (=> b!592890 (=> res!379519 e!338609)))

(declare-datatypes ((SeekEntryResult!6171 0))(
  ( (MissingZero!6171 (index!26923 (_ BitVec 32))) (Found!6171 (index!26924 (_ BitVec 32))) (Intermediate!6171 (undefined!6983 Bool) (index!26925 (_ BitVec 32)) (x!55716 (_ BitVec 32))) (Undefined!6171) (MissingVacant!6171 (index!26926 (_ BitVec 32))) )
))
(declare-fun lt!269145 () SeekEntryResult!6171)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!592890 (= res!379519 (not (= lt!269145 (Found!6171 index!984))))))

(declare-fun lt!269150 () Unit!18602)

(assert (=> b!592890 (= lt!269150 e!338616)))

(declare-fun c!67058 () Bool)

(assert (=> b!592890 (= c!67058 (= lt!269145 Undefined!6171))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!269148 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36925 (_ BitVec 32)) SeekEntryResult!6171)

(assert (=> b!592890 (= lt!269145 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!269148 lt!269144 mask!3053))))

(declare-fun e!338611 () Bool)

(assert (=> b!592890 e!338611))

(declare-fun res!379509 () Bool)

(assert (=> b!592890 (=> (not res!379509) (not e!338611))))

(declare-fun lt!269146 () (_ BitVec 32))

(declare-fun lt!269147 () SeekEntryResult!6171)

(assert (=> b!592890 (= res!379509 (= lt!269147 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269146 vacantSpotIndex!68 lt!269148 lt!269144 mask!3053)))))

(assert (=> b!592890 (= lt!269147 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!269146 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!592890 (= lt!269148 (select (store (arr!17731 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!269149 () Unit!18602)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18602)

(assert (=> b!592890 (= lt!269149 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!269146 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!592890 (= lt!269146 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!592892 () Bool)

(declare-fun res!379515 () Bool)

(assert (=> b!592892 (=> (not res!379515) (not e!338615))))

(assert (=> b!592892 (= res!379515 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17731 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!592893 () Bool)

(declare-fun e!338612 () Bool)

(assert (=> b!592893 (= e!338612 e!338614)))

(declare-fun res!379513 () Bool)

(assert (=> b!592893 (=> (not res!379513) (not e!338614))))

(declare-fun lt!269143 () SeekEntryResult!6171)

(assert (=> b!592893 (= res!379513 (and (= lt!269143 (Found!6171 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17731 a!2986) index!984) (select (arr!17731 a!2986) j!136))) (not (= (select (arr!17731 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!592893 (= lt!269143 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17731 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!592894 () Bool)

(declare-fun e!338608 () Bool)

(assert (=> b!592894 (= e!338609 e!338608)))

(declare-fun res!379518 () Bool)

(assert (=> b!592894 (=> res!379518 e!338608)))

(declare-fun lt!269151 () (_ BitVec 64))

(assert (=> b!592894 (= res!379518 (or (not (= (select (arr!17731 a!2986) j!136) lt!269148)) (not (= (select (arr!17731 a!2986) j!136) lt!269151)) (bvsge j!136 index!984)))))

(declare-fun e!338613 () Bool)

(assert (=> b!592894 e!338613))

(declare-fun res!379512 () Bool)

(assert (=> b!592894 (=> (not res!379512) (not e!338613))))

(assert (=> b!592894 (= res!379512 (= lt!269151 (select (arr!17731 a!2986) j!136)))))

(assert (=> b!592894 (= lt!269151 (select (store (arr!17731 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!592895 () Bool)

(assert (=> b!592895 (= e!338608 (bvsle #b00000000000000000000000000000000 (size!18095 a!2986)))))

(assert (=> b!592895 (arrayContainsKey!0 lt!269144 (select (arr!17731 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!269142 () Unit!18602)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!36925 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18602)

(assert (=> b!592895 (= lt!269142 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!269144 (select (arr!17731 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!592896 () Bool)

(assert (=> b!592896 (= e!338619 e!338615)))

(declare-fun res!379516 () Bool)

(assert (=> b!592896 (=> (not res!379516) (not e!338615))))

(declare-fun lt!269152 () SeekEntryResult!6171)

(assert (=> b!592896 (= res!379516 (or (= lt!269152 (MissingZero!6171 i!1108)) (= lt!269152 (MissingVacant!6171 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36925 (_ BitVec 32)) SeekEntryResult!6171)

(assert (=> b!592896 (= lt!269152 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!592897 () Bool)

(declare-fun res!379504 () Bool)

(assert (=> b!592897 (=> (not res!379504) (not e!338619))))

(assert (=> b!592897 (= res!379504 (and (= (size!18095 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18095 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18095 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!592898 () Bool)

(declare-fun Unit!18605 () Unit!18602)

(assert (=> b!592898 (= e!338616 Unit!18605)))

(assert (=> b!592898 false))

(declare-fun b!592899 () Bool)

(declare-fun res!379507 () Bool)

(assert (=> b!592899 (=> (not res!379507) (not e!338619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!592899 (= res!379507 (validKeyInArray!0 k0!1786))))

(declare-fun b!592900 () Bool)

(assert (=> b!592900 (= e!338611 (= lt!269143 lt!269147))))

(declare-fun b!592901 () Bool)

(assert (=> b!592901 (= e!338617 (arrayContainsKey!0 lt!269144 (select (arr!17731 a!2986) j!136) index!984))))

(declare-fun b!592902 () Bool)

(declare-fun res!379505 () Bool)

(assert (=> b!592902 (=> (not res!379505) (not e!338619))))

(assert (=> b!592902 (= res!379505 (validKeyInArray!0 (select (arr!17731 a!2986) j!136)))))

(declare-fun b!592903 () Bool)

(assert (=> b!592903 (= e!338615 e!338612)))

(declare-fun res!379511 () Bool)

(assert (=> b!592903 (=> (not res!379511) (not e!338612))))

(assert (=> b!592903 (= res!379511 (= (select (store (arr!17731 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!592903 (= lt!269144 (array!36926 (store (arr!17731 a!2986) i!1108 k0!1786) (size!18095 a!2986)))))

(declare-fun b!592904 () Bool)

(assert (=> b!592904 (= e!338613 e!338610)))

(declare-fun res!379514 () Bool)

(assert (=> b!592904 (=> res!379514 e!338610)))

(assert (=> b!592904 (= res!379514 (or (not (= (select (arr!17731 a!2986) j!136) lt!269148)) (not (= (select (arr!17731 a!2986) j!136) lt!269151)) (bvsge j!136 index!984)))))

(declare-fun b!592891 () Bool)

(declare-fun res!379520 () Bool)

(assert (=> b!592891 (=> (not res!379520) (not e!338615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36925 (_ BitVec 32)) Bool)

(assert (=> b!592891 (= res!379520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!379506 () Bool)

(assert (=> start!54258 (=> (not res!379506) (not e!338619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54258 (= res!379506 (validMask!0 mask!3053))))

(assert (=> start!54258 e!338619))

(assert (=> start!54258 true))

(declare-fun array_inv!13527 (array!36925) Bool)

(assert (=> start!54258 (array_inv!13527 a!2986)))

(assert (= (and start!54258 res!379506) b!592897))

(assert (= (and b!592897 res!379504) b!592902))

(assert (= (and b!592902 res!379505) b!592899))

(assert (= (and b!592899 res!379507) b!592886))

(assert (= (and b!592886 res!379508) b!592896))

(assert (= (and b!592896 res!379516) b!592891))

(assert (= (and b!592891 res!379520) b!592888))

(assert (= (and b!592888 res!379517) b!592892))

(assert (= (and b!592892 res!379515) b!592903))

(assert (= (and b!592903 res!379511) b!592893))

(assert (= (and b!592893 res!379513) b!592890))

(assert (= (and b!592890 res!379509) b!592900))

(assert (= (and b!592890 c!67058) b!592898))

(assert (= (and b!592890 (not c!67058)) b!592887))

(assert (= (and b!592890 (not res!379519)) b!592894))

(assert (= (and b!592894 res!379512) b!592904))

(assert (= (and b!592904 (not res!379514)) b!592889))

(assert (= (and b!592889 res!379510) b!592901))

(assert (= (and b!592894 (not res!379518)) b!592895))

(declare-fun m!570933 () Bool)

(assert (=> b!592886 m!570933))

(declare-fun m!570935 () Bool)

(assert (=> b!592891 m!570935))

(declare-fun m!570937 () Bool)

(assert (=> b!592889 m!570937))

(assert (=> b!592889 m!570937))

(declare-fun m!570939 () Bool)

(assert (=> b!592889 m!570939))

(declare-fun m!570941 () Bool)

(assert (=> b!592888 m!570941))

(assert (=> b!592901 m!570937))

(assert (=> b!592901 m!570937))

(declare-fun m!570943 () Bool)

(assert (=> b!592901 m!570943))

(declare-fun m!570945 () Bool)

(assert (=> b!592899 m!570945))

(assert (=> b!592895 m!570937))

(assert (=> b!592895 m!570937))

(declare-fun m!570947 () Bool)

(assert (=> b!592895 m!570947))

(assert (=> b!592895 m!570937))

(declare-fun m!570949 () Bool)

(assert (=> b!592895 m!570949))

(declare-fun m!570951 () Bool)

(assert (=> b!592892 m!570951))

(assert (=> b!592902 m!570937))

(assert (=> b!592902 m!570937))

(declare-fun m!570953 () Bool)

(assert (=> b!592902 m!570953))

(assert (=> b!592904 m!570937))

(declare-fun m!570955 () Bool)

(assert (=> b!592896 m!570955))

(declare-fun m!570957 () Bool)

(assert (=> start!54258 m!570957))

(declare-fun m!570959 () Bool)

(assert (=> start!54258 m!570959))

(assert (=> b!592894 m!570937))

(declare-fun m!570961 () Bool)

(assert (=> b!592894 m!570961))

(declare-fun m!570963 () Bool)

(assert (=> b!592894 m!570963))

(declare-fun m!570965 () Bool)

(assert (=> b!592893 m!570965))

(assert (=> b!592893 m!570937))

(assert (=> b!592893 m!570937))

(declare-fun m!570967 () Bool)

(assert (=> b!592893 m!570967))

(assert (=> b!592903 m!570961))

(declare-fun m!570969 () Bool)

(assert (=> b!592903 m!570969))

(assert (=> b!592890 m!570937))

(declare-fun m!570971 () Bool)

(assert (=> b!592890 m!570971))

(declare-fun m!570973 () Bool)

(assert (=> b!592890 m!570973))

(assert (=> b!592890 m!570961))

(declare-fun m!570975 () Bool)

(assert (=> b!592890 m!570975))

(declare-fun m!570977 () Bool)

(assert (=> b!592890 m!570977))

(declare-fun m!570979 () Bool)

(assert (=> b!592890 m!570979))

(declare-fun m!570981 () Bool)

(assert (=> b!592890 m!570981))

(assert (=> b!592890 m!570937))

(check-sat (not b!592902) (not b!592891) (not b!592888) (not b!592901) (not start!54258) (not b!592896) (not b!592889) (not b!592893) (not b!592886) (not b!592899) (not b!592895) (not b!592890))
(check-sat)
