; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53866 () Bool)

(assert start!53866)

(declare-fun b!587515 () Bool)

(declare-fun res!375160 () Bool)

(declare-fun e!335651 () Bool)

(assert (=> b!587515 (=> (not res!375160) (not e!335651))))

(declare-datatypes ((array!36710 0))(
  ( (array!36711 (arr!17628 (Array (_ BitVec 32) (_ BitVec 64))) (size!17992 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36710)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587515 (= res!375160 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587516 () Bool)

(declare-fun e!335652 () Bool)

(assert (=> b!587516 (= e!335652 (not true))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!266421 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6068 0))(
  ( (MissingZero!6068 (index!26502 (_ BitVec 32))) (Found!6068 (index!26503 (_ BitVec 32))) (Intermediate!6068 (undefined!6880 Bool) (index!26504 (_ BitVec 32)) (x!55314 (_ BitVec 32))) (Undefined!6068) (MissingVacant!6068 (index!26505 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36710 (_ BitVec 32)) SeekEntryResult!6068)

(assert (=> b!587516 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266421 vacantSpotIndex!68 (select (arr!17628 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266421 vacantSpotIndex!68 (select (store (arr!17628 a!2986) i!1108 k!1786) j!136) (array!36711 (store (arr!17628 a!2986) i!1108 k!1786) (size!17992 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18256 0))(
  ( (Unit!18257) )
))
(declare-fun lt!266422 () Unit!18256)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36710 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18256)

(assert (=> b!587516 (= lt!266422 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266421 vacantSpotIndex!68 mask!3053))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587516 (= lt!266421 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!587517 () Bool)

(assert (=> b!587517 (= e!335651 e!335652)))

(declare-fun res!375152 () Bool)

(assert (=> b!587517 (=> (not res!375152) (not e!335652))))

(declare-fun lt!266420 () SeekEntryResult!6068)

(assert (=> b!587517 (= res!375152 (or (= lt!266420 (MissingZero!6068 i!1108)) (= lt!266420 (MissingVacant!6068 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36710 (_ BitVec 32)) SeekEntryResult!6068)

(assert (=> b!587517 (= lt!266420 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!587518 () Bool)

(declare-fun res!375161 () Bool)

(assert (=> b!587518 (=> (not res!375161) (not e!335652))))

(assert (=> b!587518 (= res!375161 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17628 a!2986) j!136) a!2986 mask!3053) (Found!6068 j!136)))))

(declare-fun b!587519 () Bool)

(declare-fun res!375156 () Bool)

(assert (=> b!587519 (=> (not res!375156) (not e!335651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587519 (= res!375156 (validKeyInArray!0 (select (arr!17628 a!2986) j!136)))))

(declare-fun b!587520 () Bool)

(declare-fun res!375158 () Bool)

(assert (=> b!587520 (=> (not res!375158) (not e!335652))))

(assert (=> b!587520 (= res!375158 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17628 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17628 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!375154 () Bool)

(assert (=> start!53866 (=> (not res!375154) (not e!335651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53866 (= res!375154 (validMask!0 mask!3053))))

(assert (=> start!53866 e!335651))

(assert (=> start!53866 true))

(declare-fun array_inv!13424 (array!36710) Bool)

(assert (=> start!53866 (array_inv!13424 a!2986)))

(declare-fun b!587521 () Bool)

(declare-fun res!375155 () Bool)

(assert (=> b!587521 (=> (not res!375155) (not e!335652))))

(assert (=> b!587521 (= res!375155 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17628 a!2986) index!984) (select (arr!17628 a!2986) j!136))) (not (= (select (arr!17628 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587522 () Bool)

(declare-fun res!375159 () Bool)

(assert (=> b!587522 (=> (not res!375159) (not e!335651))))

(assert (=> b!587522 (= res!375159 (and (= (size!17992 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17992 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17992 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587523 () Bool)

(declare-fun res!375157 () Bool)

(assert (=> b!587523 (=> (not res!375157) (not e!335652))))

(declare-datatypes ((List!11669 0))(
  ( (Nil!11666) (Cons!11665 (h!12710 (_ BitVec 64)) (t!17897 List!11669)) )
))
(declare-fun arrayNoDuplicates!0 (array!36710 (_ BitVec 32) List!11669) Bool)

(assert (=> b!587523 (= res!375157 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11666))))

(declare-fun b!587524 () Bool)

(declare-fun res!375151 () Bool)

(assert (=> b!587524 (=> (not res!375151) (not e!335651))))

(assert (=> b!587524 (= res!375151 (validKeyInArray!0 k!1786))))

(declare-fun b!587525 () Bool)

(declare-fun res!375153 () Bool)

(assert (=> b!587525 (=> (not res!375153) (not e!335652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36710 (_ BitVec 32)) Bool)

(assert (=> b!587525 (= res!375153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53866 res!375154) b!587522))

(assert (= (and b!587522 res!375159) b!587519))

(assert (= (and b!587519 res!375156) b!587524))

(assert (= (and b!587524 res!375151) b!587515))

(assert (= (and b!587515 res!375160) b!587517))

(assert (= (and b!587517 res!375152) b!587525))

(assert (= (and b!587525 res!375153) b!587523))

(assert (= (and b!587523 res!375157) b!587520))

(assert (= (and b!587520 res!375158) b!587518))

(assert (= (and b!587518 res!375161) b!587521))

(assert (= (and b!587521 res!375155) b!587516))

(declare-fun m!565927 () Bool)

(assert (=> b!587525 m!565927))

(declare-fun m!565929 () Bool)

(assert (=> b!587524 m!565929))

(declare-fun m!565931 () Bool)

(assert (=> b!587516 m!565931))

(declare-fun m!565933 () Bool)

(assert (=> b!587516 m!565933))

(declare-fun m!565935 () Bool)

(assert (=> b!587516 m!565935))

(declare-fun m!565937 () Bool)

(assert (=> b!587516 m!565937))

(assert (=> b!587516 m!565933))

(declare-fun m!565939 () Bool)

(assert (=> b!587516 m!565939))

(declare-fun m!565941 () Bool)

(assert (=> b!587516 m!565941))

(assert (=> b!587516 m!565937))

(declare-fun m!565943 () Bool)

(assert (=> b!587516 m!565943))

(declare-fun m!565945 () Bool)

(assert (=> b!587517 m!565945))

(declare-fun m!565947 () Bool)

(assert (=> b!587523 m!565947))

(declare-fun m!565949 () Bool)

(assert (=> start!53866 m!565949))

(declare-fun m!565951 () Bool)

(assert (=> start!53866 m!565951))

(declare-fun m!565953 () Bool)

(assert (=> b!587521 m!565953))

(assert (=> b!587521 m!565937))

(declare-fun m!565955 () Bool)

(assert (=> b!587515 m!565955))

(declare-fun m!565957 () Bool)

(assert (=> b!587520 m!565957))

(assert (=> b!587520 m!565941))

(declare-fun m!565959 () Bool)

(assert (=> b!587520 m!565959))

(assert (=> b!587519 m!565937))

(assert (=> b!587519 m!565937))

(declare-fun m!565961 () Bool)

(assert (=> b!587519 m!565961))

(assert (=> b!587518 m!565937))

(assert (=> b!587518 m!565937))

(declare-fun m!565963 () Bool)

(assert (=> b!587518 m!565963))

(push 1)

(assert (not b!587524))

(assert (not start!53866))

(assert (not b!587518))

(assert (not b!587515))

(assert (not b!587519))

(assert (not b!587523))

(assert (not b!587516))

