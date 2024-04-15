; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53892 () Bool)

(assert start!53892)

(declare-fun b!587938 () Bool)

(declare-fun res!375718 () Bool)

(declare-fun e!335745 () Bool)

(assert (=> b!587938 (=> (not res!375718) (not e!335745))))

(declare-datatypes ((array!36750 0))(
  ( (array!36751 (arr!17648 (Array (_ BitVec 32) (_ BitVec 64))) (size!18013 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36750)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36750 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587938 (= res!375718 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587939 () Bool)

(declare-fun res!375721 () Bool)

(assert (=> b!587939 (=> (not res!375721) (not e!335745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587939 (= res!375721 (validKeyInArray!0 k0!1786))))

(declare-fun b!587940 () Bool)

(declare-fun res!375723 () Bool)

(declare-fun e!335741 () Bool)

(assert (=> b!587940 (=> (not res!375723) (not e!335741))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36750 (_ BitVec 32)) Bool)

(assert (=> b!587940 (= res!375723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587941 () Bool)

(declare-fun e!335743 () Bool)

(assert (=> b!587941 (= e!335743 (not true))))

(declare-fun e!335742 () Bool)

(assert (=> b!587941 e!335742))

(declare-fun res!375717 () Bool)

(assert (=> b!587941 (=> (not res!375717) (not e!335742))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266453 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6085 0))(
  ( (MissingZero!6085 (index!26570 (_ BitVec 32))) (Found!6085 (index!26571 (_ BitVec 32))) (Intermediate!6085 (undefined!6897 Bool) (index!26572 (_ BitVec 32)) (x!55382 (_ BitVec 32))) (Undefined!6085) (MissingVacant!6085 (index!26573 (_ BitVec 32))) )
))
(declare-fun lt!266451 () SeekEntryResult!6085)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36750 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!587941 (= res!375717 (= lt!266451 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266453 vacantSpotIndex!68 (select (store (arr!17648 a!2986) i!1108 k0!1786) j!136) (array!36751 (store (arr!17648 a!2986) i!1108 k0!1786) (size!18013 a!2986)) mask!3053)))))

(assert (=> b!587941 (= lt!266451 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266453 vacantSpotIndex!68 (select (arr!17648 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18276 0))(
  ( (Unit!18277) )
))
(declare-fun lt!266455 () Unit!18276)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36750 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18276)

(assert (=> b!587941 (= lt!266455 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266453 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587941 (= lt!266453 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587942 () Bool)

(declare-fun res!375722 () Bool)

(assert (=> b!587942 (=> (not res!375722) (not e!335741))))

(assert (=> b!587942 (= res!375722 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17648 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17648 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587943 () Bool)

(declare-fun lt!266454 () SeekEntryResult!6085)

(assert (=> b!587943 (= e!335742 (= lt!266454 lt!266451))))

(declare-fun res!375725 () Bool)

(assert (=> start!53892 (=> (not res!375725) (not e!335745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53892 (= res!375725 (validMask!0 mask!3053))))

(assert (=> start!53892 e!335745))

(assert (=> start!53892 true))

(declare-fun array_inv!13531 (array!36750) Bool)

(assert (=> start!53892 (array_inv!13531 a!2986)))

(declare-fun b!587937 () Bool)

(assert (=> b!587937 (= e!335745 e!335741)))

(declare-fun res!375715 () Bool)

(assert (=> b!587937 (=> (not res!375715) (not e!335741))))

(declare-fun lt!266452 () SeekEntryResult!6085)

(assert (=> b!587937 (= res!375715 (or (= lt!266452 (MissingZero!6085 i!1108)) (= lt!266452 (MissingVacant!6085 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36750 (_ BitVec 32)) SeekEntryResult!6085)

(assert (=> b!587937 (= lt!266452 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!587944 () Bool)

(declare-fun res!375716 () Bool)

(assert (=> b!587944 (=> (not res!375716) (not e!335745))))

(assert (=> b!587944 (= res!375716 (and (= (size!18013 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18013 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18013 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587945 () Bool)

(assert (=> b!587945 (= e!335741 e!335743)))

(declare-fun res!375719 () Bool)

(assert (=> b!587945 (=> (not res!375719) (not e!335743))))

(assert (=> b!587945 (= res!375719 (and (= lt!266454 (Found!6085 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17648 a!2986) index!984) (select (arr!17648 a!2986) j!136))) (not (= (select (arr!17648 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!587945 (= lt!266454 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17648 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!587946 () Bool)

(declare-fun res!375724 () Bool)

(assert (=> b!587946 (=> (not res!375724) (not e!335745))))

(assert (=> b!587946 (= res!375724 (validKeyInArray!0 (select (arr!17648 a!2986) j!136)))))

(declare-fun b!587947 () Bool)

(declare-fun res!375720 () Bool)

(assert (=> b!587947 (=> (not res!375720) (not e!335741))))

(declare-datatypes ((List!11728 0))(
  ( (Nil!11725) (Cons!11724 (h!12769 (_ BitVec 64)) (t!17947 List!11728)) )
))
(declare-fun arrayNoDuplicates!0 (array!36750 (_ BitVec 32) List!11728) Bool)

(assert (=> b!587947 (= res!375720 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11725))))

(assert (= (and start!53892 res!375725) b!587944))

(assert (= (and b!587944 res!375716) b!587946))

(assert (= (and b!587946 res!375724) b!587939))

(assert (= (and b!587939 res!375721) b!587938))

(assert (= (and b!587938 res!375718) b!587937))

(assert (= (and b!587937 res!375715) b!587940))

(assert (= (and b!587940 res!375723) b!587947))

(assert (= (and b!587947 res!375720) b!587942))

(assert (= (and b!587942 res!375722) b!587945))

(assert (= (and b!587945 res!375719) b!587941))

(assert (= (and b!587941 res!375717) b!587943))

(declare-fun m!565939 () Bool)

(assert (=> b!587938 m!565939))

(declare-fun m!565941 () Bool)

(assert (=> b!587945 m!565941))

(declare-fun m!565943 () Bool)

(assert (=> b!587945 m!565943))

(assert (=> b!587945 m!565943))

(declare-fun m!565945 () Bool)

(assert (=> b!587945 m!565945))

(declare-fun m!565947 () Bool)

(assert (=> b!587941 m!565947))

(assert (=> b!587941 m!565943))

(declare-fun m!565949 () Bool)

(assert (=> b!587941 m!565949))

(declare-fun m!565951 () Bool)

(assert (=> b!587941 m!565951))

(declare-fun m!565953 () Bool)

(assert (=> b!587941 m!565953))

(declare-fun m!565955 () Bool)

(assert (=> b!587941 m!565955))

(assert (=> b!587941 m!565953))

(assert (=> b!587941 m!565943))

(declare-fun m!565957 () Bool)

(assert (=> b!587941 m!565957))

(assert (=> b!587946 m!565943))

(assert (=> b!587946 m!565943))

(declare-fun m!565959 () Bool)

(assert (=> b!587946 m!565959))

(declare-fun m!565961 () Bool)

(assert (=> start!53892 m!565961))

(declare-fun m!565963 () Bool)

(assert (=> start!53892 m!565963))

(declare-fun m!565965 () Bool)

(assert (=> b!587942 m!565965))

(assert (=> b!587942 m!565949))

(declare-fun m!565967 () Bool)

(assert (=> b!587942 m!565967))

(declare-fun m!565969 () Bool)

(assert (=> b!587940 m!565969))

(declare-fun m!565971 () Bool)

(assert (=> b!587947 m!565971))

(declare-fun m!565973 () Bool)

(assert (=> b!587937 m!565973))

(declare-fun m!565975 () Bool)

(assert (=> b!587939 m!565975))

(check-sat (not b!587945) (not b!587939) (not start!53892) (not b!587946) (not b!587938) (not b!587940) (not b!587947) (not b!587941) (not b!587937))
(check-sat)
