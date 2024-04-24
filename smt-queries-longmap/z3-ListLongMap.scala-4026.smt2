; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54912 () Bool)

(assert start!54912)

(declare-fun b!599932 () Bool)

(declare-datatypes ((Unit!18889 0))(
  ( (Unit!18890) )
))
(declare-fun e!343008 () Unit!18889)

(declare-fun Unit!18891 () Unit!18889)

(assert (=> b!599932 (= e!343008 Unit!18891)))

(assert (=> b!599932 false))

(declare-fun b!599933 () Bool)

(declare-fun e!343011 () Bool)

(declare-fun e!343010 () Bool)

(assert (=> b!599933 (= e!343011 e!343010)))

(declare-fun res!384794 () Bool)

(assert (=> b!599933 (=> res!384794 e!343010)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!272782 () (_ BitVec 64))

(declare-fun lt!272788 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37092 0))(
  ( (array!37093 (arr!17803 (Array (_ BitVec 32) (_ BitVec 64))) (size!18167 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37092)

(assert (=> b!599933 (= res!384794 (or (not (= (select (arr!17803 a!2986) j!136) lt!272782)) (not (= (select (arr!17803 a!2986) j!136) lt!272788)) (bvsge j!136 index!984)))))

(declare-fun e!343004 () Bool)

(assert (=> b!599933 e!343004))

(declare-fun res!384779 () Bool)

(assert (=> b!599933 (=> (not res!384779) (not e!343004))))

(assert (=> b!599933 (= res!384779 (= lt!272788 (select (arr!17803 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!599933 (= lt!272788 (select (store (arr!17803 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!599934 () Bool)

(declare-fun e!343003 () Bool)

(declare-fun e!343007 () Bool)

(assert (=> b!599934 (= e!343003 e!343007)))

(declare-fun res!384785 () Bool)

(assert (=> b!599934 (=> (not res!384785) (not e!343007))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!599934 (= res!384785 (= (select (store (arr!17803 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!272781 () array!37092)

(assert (=> b!599934 (= lt!272781 (array!37093 (store (arr!17803 a!2986) i!1108 k0!1786) (size!18167 a!2986)))))

(declare-fun b!599935 () Bool)

(declare-fun res!384784 () Bool)

(declare-fun e!343005 () Bool)

(assert (=> b!599935 (=> (not res!384784) (not e!343005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!599935 (= res!384784 (validKeyInArray!0 k0!1786))))

(declare-fun b!599937 () Bool)

(declare-fun e!343009 () Bool)

(declare-fun e!343002 () Bool)

(assert (=> b!599937 (= e!343009 e!343002)))

(declare-fun res!384788 () Bool)

(assert (=> b!599937 (=> (not res!384788) (not e!343002))))

(declare-fun arrayContainsKey!0 (array!37092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!599937 (= res!384788 (arrayContainsKey!0 lt!272781 (select (arr!17803 a!2986) j!136) j!136))))

(declare-fun b!599938 () Bool)

(declare-fun res!384787 () Bool)

(assert (=> b!599938 (=> (not res!384787) (not e!343003))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!599938 (= res!384787 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17803 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!599939 () Bool)

(declare-fun e!343006 () Bool)

(assert (=> b!599939 (= e!343006 true)))

(declare-fun lt!272780 () Bool)

(declare-datatypes ((List!11751 0))(
  ( (Nil!11748) (Cons!11747 (h!12795 (_ BitVec 64)) (t!17971 List!11751)) )
))
(declare-fun contains!2941 (List!11751 (_ BitVec 64)) Bool)

(assert (=> b!599939 (= lt!272780 (contains!2941 Nil!11748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599940 () Bool)

(declare-fun res!384786 () Bool)

(assert (=> b!599940 (=> (not res!384786) (not e!343003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37092 (_ BitVec 32)) Bool)

(assert (=> b!599940 (= res!384786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!599941 () Bool)

(declare-fun Unit!18892 () Unit!18889)

(assert (=> b!599941 (= e!343008 Unit!18892)))

(declare-fun b!599942 () Bool)

(declare-fun res!384778 () Bool)

(assert (=> b!599942 (=> (not res!384778) (not e!343003))))

(declare-fun arrayNoDuplicates!0 (array!37092 (_ BitVec 32) List!11751) Bool)

(assert (=> b!599942 (= res!384778 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11748))))

(declare-fun b!599943 () Bool)

(assert (=> b!599943 (= e!343005 e!343003)))

(declare-fun res!384792 () Bool)

(assert (=> b!599943 (=> (not res!384792) (not e!343003))))

(declare-datatypes ((SeekEntryResult!6199 0))(
  ( (MissingZero!6199 (index!27053 (_ BitVec 32))) (Found!6199 (index!27054 (_ BitVec 32))) (Intermediate!6199 (undefined!7011 Bool) (index!27055 (_ BitVec 32)) (x!56009 (_ BitVec 32))) (Undefined!6199) (MissingVacant!6199 (index!27056 (_ BitVec 32))) )
))
(declare-fun lt!272791 () SeekEntryResult!6199)

(assert (=> b!599943 (= res!384792 (or (= lt!272791 (MissingZero!6199 i!1108)) (= lt!272791 (MissingVacant!6199 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37092 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!599943 (= lt!272791 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!599944 () Bool)

(declare-fun e!342999 () Bool)

(assert (=> b!599944 (= e!342999 (not e!343011))))

(declare-fun res!384793 () Bool)

(assert (=> b!599944 (=> res!384793 e!343011)))

(declare-fun lt!272789 () SeekEntryResult!6199)

(assert (=> b!599944 (= res!384793 (not (= lt!272789 (Found!6199 index!984))))))

(declare-fun lt!272790 () Unit!18889)

(assert (=> b!599944 (= lt!272790 e!343008)))

(declare-fun c!67946 () Bool)

(assert (=> b!599944 (= c!67946 (= lt!272789 Undefined!6199))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37092 (_ BitVec 32)) SeekEntryResult!6199)

(assert (=> b!599944 (= lt!272789 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!272782 lt!272781 mask!3053))))

(declare-fun e!343000 () Bool)

(assert (=> b!599944 e!343000))

(declare-fun res!384782 () Bool)

(assert (=> b!599944 (=> (not res!384782) (not e!343000))))

(declare-fun lt!272785 () (_ BitVec 32))

(declare-fun lt!272783 () SeekEntryResult!6199)

(assert (=> b!599944 (= res!384782 (= lt!272783 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272785 vacantSpotIndex!68 lt!272782 lt!272781 mask!3053)))))

(assert (=> b!599944 (= lt!272783 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!272785 vacantSpotIndex!68 (select (arr!17803 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!599944 (= lt!272782 (select (store (arr!17803 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!272786 () Unit!18889)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18889)

(assert (=> b!599944 (= lt!272786 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!272785 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!599944 (= lt!272785 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!599945 () Bool)

(declare-fun lt!272779 () SeekEntryResult!6199)

(assert (=> b!599945 (= e!343000 (= lt!272779 lt!272783))))

(declare-fun b!599946 () Bool)

(declare-fun res!384781 () Bool)

(assert (=> b!599946 (=> res!384781 e!343006)))

(assert (=> b!599946 (= res!384781 (contains!2941 Nil!11748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!599947 () Bool)

(declare-fun res!384783 () Bool)

(assert (=> b!599947 (=> res!384783 e!343006)))

(declare-fun noDuplicate!286 (List!11751) Bool)

(assert (=> b!599947 (= res!384783 (not (noDuplicate!286 Nil!11748)))))

(declare-fun b!599936 () Bool)

(declare-fun res!384790 () Bool)

(assert (=> b!599936 (=> (not res!384790) (not e!343005))))

(assert (=> b!599936 (= res!384790 (and (= (size!18167 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18167 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18167 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!384777 () Bool)

(assert (=> start!54912 (=> (not res!384777) (not e!343005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54912 (= res!384777 (validMask!0 mask!3053))))

(assert (=> start!54912 e!343005))

(assert (=> start!54912 true))

(declare-fun array_inv!13662 (array!37092) Bool)

(assert (=> start!54912 (array_inv!13662 a!2986)))

(declare-fun b!599948 () Bool)

(assert (=> b!599948 (= e!343010 e!343006)))

(declare-fun res!384780 () Bool)

(assert (=> b!599948 (=> res!384780 e!343006)))

(assert (=> b!599948 (= res!384780 (or (bvsge (size!18167 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18167 a!2986))))))

(assert (=> b!599948 (arrayNoDuplicates!0 lt!272781 j!136 Nil!11748)))

(declare-fun lt!272787 () Unit!18889)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37092 (_ BitVec 32) (_ BitVec 32)) Unit!18889)

(assert (=> b!599948 (= lt!272787 (lemmaNoDuplicateFromThenFromBigger!0 lt!272781 #b00000000000000000000000000000000 j!136))))

(assert (=> b!599948 (arrayNoDuplicates!0 lt!272781 #b00000000000000000000000000000000 Nil!11748)))

(declare-fun lt!272778 () Unit!18889)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37092 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11751) Unit!18889)

(assert (=> b!599948 (= lt!272778 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11748))))

(assert (=> b!599948 (arrayContainsKey!0 lt!272781 (select (arr!17803 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!272784 () Unit!18889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37092 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18889)

(assert (=> b!599948 (= lt!272784 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!272781 (select (arr!17803 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!599949 () Bool)

(assert (=> b!599949 (= e!343007 e!342999)))

(declare-fun res!384795 () Bool)

(assert (=> b!599949 (=> (not res!384795) (not e!342999))))

(assert (=> b!599949 (= res!384795 (and (= lt!272779 (Found!6199 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17803 a!2986) index!984) (select (arr!17803 a!2986) j!136))) (not (= (select (arr!17803 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!599949 (= lt!272779 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17803 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!599950 () Bool)

(assert (=> b!599950 (= e!343004 e!343009)))

(declare-fun res!384791 () Bool)

(assert (=> b!599950 (=> res!384791 e!343009)))

(assert (=> b!599950 (= res!384791 (or (not (= (select (arr!17803 a!2986) j!136) lt!272782)) (not (= (select (arr!17803 a!2986) j!136) lt!272788)) (bvsge j!136 index!984)))))

(declare-fun b!599951 () Bool)

(assert (=> b!599951 (= e!343002 (arrayContainsKey!0 lt!272781 (select (arr!17803 a!2986) j!136) index!984))))

(declare-fun b!599952 () Bool)

(declare-fun res!384789 () Bool)

(assert (=> b!599952 (=> (not res!384789) (not e!343005))))

(assert (=> b!599952 (= res!384789 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!599953 () Bool)

(declare-fun res!384796 () Bool)

(assert (=> b!599953 (=> (not res!384796) (not e!343005))))

(assert (=> b!599953 (= res!384796 (validKeyInArray!0 (select (arr!17803 a!2986) j!136)))))

(assert (= (and start!54912 res!384777) b!599936))

(assert (= (and b!599936 res!384790) b!599953))

(assert (= (and b!599953 res!384796) b!599935))

(assert (= (and b!599935 res!384784) b!599952))

(assert (= (and b!599952 res!384789) b!599943))

(assert (= (and b!599943 res!384792) b!599940))

(assert (= (and b!599940 res!384786) b!599942))

(assert (= (and b!599942 res!384778) b!599938))

(assert (= (and b!599938 res!384787) b!599934))

(assert (= (and b!599934 res!384785) b!599949))

(assert (= (and b!599949 res!384795) b!599944))

(assert (= (and b!599944 res!384782) b!599945))

(assert (= (and b!599944 c!67946) b!599932))

(assert (= (and b!599944 (not c!67946)) b!599941))

(assert (= (and b!599944 (not res!384793)) b!599933))

(assert (= (and b!599933 res!384779) b!599950))

(assert (= (and b!599950 (not res!384791)) b!599937))

(assert (= (and b!599937 res!384788) b!599951))

(assert (= (and b!599933 (not res!384794)) b!599948))

(assert (= (and b!599948 (not res!384780)) b!599947))

(assert (= (and b!599947 (not res!384783)) b!599946))

(assert (= (and b!599946 (not res!384781)) b!599939))

(declare-fun m!577397 () Bool)

(assert (=> b!599952 m!577397))

(declare-fun m!577399 () Bool)

(assert (=> b!599947 m!577399))

(declare-fun m!577401 () Bool)

(assert (=> b!599951 m!577401))

(assert (=> b!599951 m!577401))

(declare-fun m!577403 () Bool)

(assert (=> b!599951 m!577403))

(declare-fun m!577405 () Bool)

(assert (=> b!599940 m!577405))

(declare-fun m!577407 () Bool)

(assert (=> b!599934 m!577407))

(declare-fun m!577409 () Bool)

(assert (=> b!599934 m!577409))

(declare-fun m!577411 () Bool)

(assert (=> b!599943 m!577411))

(declare-fun m!577413 () Bool)

(assert (=> b!599942 m!577413))

(assert (=> b!599933 m!577401))

(assert (=> b!599933 m!577407))

(declare-fun m!577415 () Bool)

(assert (=> b!599933 m!577415))

(declare-fun m!577417 () Bool)

(assert (=> b!599949 m!577417))

(assert (=> b!599949 m!577401))

(assert (=> b!599949 m!577401))

(declare-fun m!577419 () Bool)

(assert (=> b!599949 m!577419))

(declare-fun m!577421 () Bool)

(assert (=> start!54912 m!577421))

(declare-fun m!577423 () Bool)

(assert (=> start!54912 m!577423))

(declare-fun m!577425 () Bool)

(assert (=> b!599948 m!577425))

(assert (=> b!599948 m!577401))

(declare-fun m!577427 () Bool)

(assert (=> b!599948 m!577427))

(declare-fun m!577429 () Bool)

(assert (=> b!599948 m!577429))

(declare-fun m!577431 () Bool)

(assert (=> b!599948 m!577431))

(assert (=> b!599948 m!577401))

(assert (=> b!599948 m!577401))

(declare-fun m!577433 () Bool)

(assert (=> b!599948 m!577433))

(declare-fun m!577435 () Bool)

(assert (=> b!599948 m!577435))

(assert (=> b!599950 m!577401))

(assert (=> b!599937 m!577401))

(assert (=> b!599937 m!577401))

(declare-fun m!577437 () Bool)

(assert (=> b!599937 m!577437))

(declare-fun m!577439 () Bool)

(assert (=> b!599939 m!577439))

(assert (=> b!599953 m!577401))

(assert (=> b!599953 m!577401))

(declare-fun m!577441 () Bool)

(assert (=> b!599953 m!577441))

(declare-fun m!577443 () Bool)

(assert (=> b!599946 m!577443))

(declare-fun m!577445 () Bool)

(assert (=> b!599944 m!577445))

(declare-fun m!577447 () Bool)

(assert (=> b!599944 m!577447))

(assert (=> b!599944 m!577401))

(assert (=> b!599944 m!577407))

(assert (=> b!599944 m!577401))

(declare-fun m!577449 () Bool)

(assert (=> b!599944 m!577449))

(declare-fun m!577451 () Bool)

(assert (=> b!599944 m!577451))

(declare-fun m!577453 () Bool)

(assert (=> b!599944 m!577453))

(declare-fun m!577455 () Bool)

(assert (=> b!599944 m!577455))

(declare-fun m!577457 () Bool)

(assert (=> b!599935 m!577457))

(declare-fun m!577459 () Bool)

(assert (=> b!599938 m!577459))

(check-sat (not b!599952) (not b!599951) (not b!599935) (not b!599947) (not b!599953) (not b!599942) (not b!599946) (not b!599944) (not start!54912) (not b!599949) (not b!599940) (not b!599943) (not b!599937) (not b!599948) (not b!599939))
(check-sat)
