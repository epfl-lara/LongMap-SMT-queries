; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53916 () Bool)

(assert start!53916)

(declare-fun b!588340 () Bool)

(declare-fun res!375980 () Bool)

(declare-fun e!335978 () Bool)

(assert (=> b!588340 (=> (not res!375980) (not e!335978))))

(declare-datatypes ((array!36760 0))(
  ( (array!36761 (arr!17653 (Array (_ BitVec 32) (_ BitVec 64))) (size!18017 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36760)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36760 (_ BitVec 32)) Bool)

(assert (=> b!588340 (= res!375980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588341 () Bool)

(declare-fun res!375984 () Bool)

(declare-fun e!335977 () Bool)

(assert (=> b!588341 (=> (not res!375984) (not e!335977))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588341 (= res!375984 (validKeyInArray!0 (select (arr!17653 a!2986) j!136)))))

(declare-fun b!588342 () Bool)

(declare-fun e!335979 () Bool)

(assert (=> b!588342 (= e!335978 e!335979)))

(declare-fun res!375986 () Bool)

(assert (=> b!588342 (=> (not res!375986) (not e!335979))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6093 0))(
  ( (MissingZero!6093 (index!26602 (_ BitVec 32))) (Found!6093 (index!26603 (_ BitVec 32))) (Intermediate!6093 (undefined!6905 Bool) (index!26604 (_ BitVec 32)) (x!55403 (_ BitVec 32))) (Undefined!6093) (MissingVacant!6093 (index!26605 (_ BitVec 32))) )
))
(declare-fun lt!266749 () SeekEntryResult!6093)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588342 (= res!375986 (and (= lt!266749 (Found!6093 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17653 a!2986) index!984) (select (arr!17653 a!2986) j!136))) (not (= (select (arr!17653 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36760 (_ BitVec 32)) SeekEntryResult!6093)

(assert (=> b!588342 (= lt!266749 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17653 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588343 () Bool)

(declare-fun res!375979 () Bool)

(assert (=> b!588343 (=> (not res!375979) (not e!335977))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588343 (= res!375979 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!375983 () Bool)

(assert (=> start!53916 (=> (not res!375983) (not e!335977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53916 (= res!375983 (validMask!0 mask!3053))))

(assert (=> start!53916 e!335977))

(assert (=> start!53916 true))

(declare-fun array_inv!13449 (array!36760) Bool)

(assert (=> start!53916 (array_inv!13449 a!2986)))

(declare-fun b!588344 () Bool)

(declare-fun res!375976 () Bool)

(assert (=> b!588344 (=> (not res!375976) (not e!335978))))

(declare-datatypes ((List!11694 0))(
  ( (Nil!11691) (Cons!11690 (h!12735 (_ BitVec 64)) (t!17922 List!11694)) )
))
(declare-fun arrayNoDuplicates!0 (array!36760 (_ BitVec 32) List!11694) Bool)

(assert (=> b!588344 (= res!375976 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11691))))

(declare-fun b!588345 () Bool)

(assert (=> b!588345 (= e!335979 (not true))))

(declare-fun e!335976 () Bool)

(assert (=> b!588345 e!335976))

(declare-fun res!375977 () Bool)

(assert (=> b!588345 (=> (not res!375977) (not e!335976))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun lt!266745 () (_ BitVec 32))

(declare-fun lt!266747 () SeekEntryResult!6093)

(assert (=> b!588345 (= res!375977 (= lt!266747 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266745 vacantSpotIndex!68 (select (store (arr!17653 a!2986) i!1108 k0!1786) j!136) (array!36761 (store (arr!17653 a!2986) i!1108 k0!1786) (size!18017 a!2986)) mask!3053)))))

(assert (=> b!588345 (= lt!266747 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266745 vacantSpotIndex!68 (select (arr!17653 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18306 0))(
  ( (Unit!18307) )
))
(declare-fun lt!266746 () Unit!18306)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36760 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18306)

(assert (=> b!588345 (= lt!266746 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266745 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588345 (= lt!266745 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588346 () Bool)

(assert (=> b!588346 (= e!335976 (= lt!266749 lt!266747))))

(declare-fun b!588347 () Bool)

(declare-fun res!375978 () Bool)

(assert (=> b!588347 (=> (not res!375978) (not e!335977))))

(assert (=> b!588347 (= res!375978 (validKeyInArray!0 k0!1786))))

(declare-fun b!588348 () Bool)

(declare-fun res!375982 () Bool)

(assert (=> b!588348 (=> (not res!375982) (not e!335978))))

(assert (=> b!588348 (= res!375982 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17653 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17653 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588349 () Bool)

(assert (=> b!588349 (= e!335977 e!335978)))

(declare-fun res!375981 () Bool)

(assert (=> b!588349 (=> (not res!375981) (not e!335978))))

(declare-fun lt!266748 () SeekEntryResult!6093)

(assert (=> b!588349 (= res!375981 (or (= lt!266748 (MissingZero!6093 i!1108)) (= lt!266748 (MissingVacant!6093 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36760 (_ BitVec 32)) SeekEntryResult!6093)

(assert (=> b!588349 (= lt!266748 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588350 () Bool)

(declare-fun res!375985 () Bool)

(assert (=> b!588350 (=> (not res!375985) (not e!335977))))

(assert (=> b!588350 (= res!375985 (and (= (size!18017 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18017 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18017 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53916 res!375983) b!588350))

(assert (= (and b!588350 res!375985) b!588341))

(assert (= (and b!588341 res!375984) b!588347))

(assert (= (and b!588347 res!375978) b!588343))

(assert (= (and b!588343 res!375979) b!588349))

(assert (= (and b!588349 res!375981) b!588340))

(assert (= (and b!588340 res!375980) b!588344))

(assert (= (and b!588344 res!375976) b!588348))

(assert (= (and b!588348 res!375982) b!588342))

(assert (= (and b!588342 res!375986) b!588345))

(assert (= (and b!588345 res!375977) b!588346))

(declare-fun m!566877 () Bool)

(assert (=> start!53916 m!566877))

(declare-fun m!566879 () Bool)

(assert (=> start!53916 m!566879))

(declare-fun m!566881 () Bool)

(assert (=> b!588345 m!566881))

(declare-fun m!566883 () Bool)

(assert (=> b!588345 m!566883))

(declare-fun m!566885 () Bool)

(assert (=> b!588345 m!566885))

(declare-fun m!566887 () Bool)

(assert (=> b!588345 m!566887))

(assert (=> b!588345 m!566885))

(declare-fun m!566889 () Bool)

(assert (=> b!588345 m!566889))

(declare-fun m!566891 () Bool)

(assert (=> b!588345 m!566891))

(assert (=> b!588345 m!566891))

(declare-fun m!566893 () Bool)

(assert (=> b!588345 m!566893))

(declare-fun m!566895 () Bool)

(assert (=> b!588342 m!566895))

(assert (=> b!588342 m!566885))

(assert (=> b!588342 m!566885))

(declare-fun m!566897 () Bool)

(assert (=> b!588342 m!566897))

(declare-fun m!566899 () Bool)

(assert (=> b!588348 m!566899))

(assert (=> b!588348 m!566887))

(declare-fun m!566901 () Bool)

(assert (=> b!588348 m!566901))

(declare-fun m!566903 () Bool)

(assert (=> b!588349 m!566903))

(assert (=> b!588341 m!566885))

(assert (=> b!588341 m!566885))

(declare-fun m!566905 () Bool)

(assert (=> b!588341 m!566905))

(declare-fun m!566907 () Bool)

(assert (=> b!588343 m!566907))

(declare-fun m!566909 () Bool)

(assert (=> b!588347 m!566909))

(declare-fun m!566911 () Bool)

(assert (=> b!588340 m!566911))

(declare-fun m!566913 () Bool)

(assert (=> b!588344 m!566913))

(check-sat (not b!588344) (not b!588342) (not b!588340) (not b!588341) (not b!588347) (not b!588345) (not start!53916) (not b!588343) (not b!588349))
(check-sat)
