; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53898 () Bool)

(assert start!53898)

(declare-fun b!588043 () Bool)

(declare-fun e!335843 () Bool)

(declare-datatypes ((SeekEntryResult!6084 0))(
  ( (MissingZero!6084 (index!26566 (_ BitVec 32))) (Found!6084 (index!26567 (_ BitVec 32))) (Intermediate!6084 (undefined!6896 Bool) (index!26568 (_ BitVec 32)) (x!55370 (_ BitVec 32))) (Undefined!6084) (MissingVacant!6084 (index!26569 (_ BitVec 32))) )
))
(declare-fun lt!266612 () SeekEntryResult!6084)

(declare-fun lt!266614 () SeekEntryResult!6084)

(assert (=> b!588043 (= e!335843 (= lt!266612 lt!266614))))

(declare-fun res!375683 () Bool)

(declare-fun e!335841 () Bool)

(assert (=> start!53898 (=> (not res!375683) (not e!335841))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53898 (= res!375683 (validMask!0 mask!3053))))

(assert (=> start!53898 e!335841))

(assert (=> start!53898 true))

(declare-datatypes ((array!36742 0))(
  ( (array!36743 (arr!17644 (Array (_ BitVec 32) (_ BitVec 64))) (size!18008 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36742)

(declare-fun array_inv!13440 (array!36742) Bool)

(assert (=> start!53898 (array_inv!13440 a!2986)))

(declare-fun b!588044 () Bool)

(declare-fun res!375688 () Bool)

(declare-fun e!335844 () Bool)

(assert (=> b!588044 (=> (not res!375688) (not e!335844))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588044 (= res!375688 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17644 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17644 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588045 () Bool)

(declare-fun res!375679 () Bool)

(assert (=> b!588045 (=> (not res!375679) (not e!335841))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588045 (= res!375679 (validKeyInArray!0 (select (arr!17644 a!2986) j!136)))))

(declare-fun b!588046 () Bool)

(declare-fun e!335840 () Bool)

(assert (=> b!588046 (= e!335840 (not true))))

(assert (=> b!588046 e!335843))

(declare-fun res!375686 () Bool)

(assert (=> b!588046 (=> (not res!375686) (not e!335843))))

(declare-fun lt!266613 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36742 (_ BitVec 32)) SeekEntryResult!6084)

(assert (=> b!588046 (= res!375686 (= lt!266614 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266613 vacantSpotIndex!68 (select (store (arr!17644 a!2986) i!1108 k0!1786) j!136) (array!36743 (store (arr!17644 a!2986) i!1108 k0!1786) (size!18008 a!2986)) mask!3053)))))

(assert (=> b!588046 (= lt!266614 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266613 vacantSpotIndex!68 (select (arr!17644 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18288 0))(
  ( (Unit!18289) )
))
(declare-fun lt!266610 () Unit!18288)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36742 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18288)

(assert (=> b!588046 (= lt!266610 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266613 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588046 (= lt!266613 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!588047 () Bool)

(assert (=> b!588047 (= e!335841 e!335844)))

(declare-fun res!375685 () Bool)

(assert (=> b!588047 (=> (not res!375685) (not e!335844))))

(declare-fun lt!266611 () SeekEntryResult!6084)

(assert (=> b!588047 (= res!375685 (or (= lt!266611 (MissingZero!6084 i!1108)) (= lt!266611 (MissingVacant!6084 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36742 (_ BitVec 32)) SeekEntryResult!6084)

(assert (=> b!588047 (= lt!266611 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588048 () Bool)

(declare-fun res!375681 () Bool)

(assert (=> b!588048 (=> (not res!375681) (not e!335841))))

(assert (=> b!588048 (= res!375681 (validKeyInArray!0 k0!1786))))

(declare-fun b!588049 () Bool)

(declare-fun res!375687 () Bool)

(assert (=> b!588049 (=> (not res!375687) (not e!335841))))

(assert (=> b!588049 (= res!375687 (and (= (size!18008 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18008 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18008 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588050 () Bool)

(assert (=> b!588050 (= e!335844 e!335840)))

(declare-fun res!375689 () Bool)

(assert (=> b!588050 (=> (not res!375689) (not e!335840))))

(assert (=> b!588050 (= res!375689 (and (= lt!266612 (Found!6084 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17644 a!2986) index!984) (select (arr!17644 a!2986) j!136))) (not (= (select (arr!17644 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588050 (= lt!266612 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17644 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588051 () Bool)

(declare-fun res!375684 () Bool)

(assert (=> b!588051 (=> (not res!375684) (not e!335844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36742 (_ BitVec 32)) Bool)

(assert (=> b!588051 (= res!375684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588052 () Bool)

(declare-fun res!375682 () Bool)

(assert (=> b!588052 (=> (not res!375682) (not e!335841))))

(declare-fun arrayContainsKey!0 (array!36742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588052 (= res!375682 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588053 () Bool)

(declare-fun res!375680 () Bool)

(assert (=> b!588053 (=> (not res!375680) (not e!335844))))

(declare-datatypes ((List!11685 0))(
  ( (Nil!11682) (Cons!11681 (h!12726 (_ BitVec 64)) (t!17913 List!11685)) )
))
(declare-fun arrayNoDuplicates!0 (array!36742 (_ BitVec 32) List!11685) Bool)

(assert (=> b!588053 (= res!375680 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11682))))

(assert (= (and start!53898 res!375683) b!588049))

(assert (= (and b!588049 res!375687) b!588045))

(assert (= (and b!588045 res!375679) b!588048))

(assert (= (and b!588048 res!375681) b!588052))

(assert (= (and b!588052 res!375682) b!588047))

(assert (= (and b!588047 res!375685) b!588051))

(assert (= (and b!588051 res!375684) b!588053))

(assert (= (and b!588053 res!375680) b!588044))

(assert (= (and b!588044 res!375688) b!588050))

(assert (= (and b!588050 res!375689) b!588046))

(assert (= (and b!588046 res!375686) b!588043))

(declare-fun m!566535 () Bool)

(assert (=> b!588051 m!566535))

(declare-fun m!566537 () Bool)

(assert (=> b!588053 m!566537))

(declare-fun m!566539 () Bool)

(assert (=> start!53898 m!566539))

(declare-fun m!566541 () Bool)

(assert (=> start!53898 m!566541))

(declare-fun m!566543 () Bool)

(assert (=> b!588050 m!566543))

(declare-fun m!566545 () Bool)

(assert (=> b!588050 m!566545))

(assert (=> b!588050 m!566545))

(declare-fun m!566547 () Bool)

(assert (=> b!588050 m!566547))

(declare-fun m!566549 () Bool)

(assert (=> b!588044 m!566549))

(declare-fun m!566551 () Bool)

(assert (=> b!588044 m!566551))

(declare-fun m!566553 () Bool)

(assert (=> b!588044 m!566553))

(declare-fun m!566555 () Bool)

(assert (=> b!588052 m!566555))

(declare-fun m!566557 () Bool)

(assert (=> b!588046 m!566557))

(declare-fun m!566559 () Bool)

(assert (=> b!588046 m!566559))

(assert (=> b!588046 m!566545))

(assert (=> b!588046 m!566551))

(declare-fun m!566561 () Bool)

(assert (=> b!588046 m!566561))

(assert (=> b!588046 m!566545))

(declare-fun m!566563 () Bool)

(assert (=> b!588046 m!566563))

(assert (=> b!588046 m!566559))

(declare-fun m!566565 () Bool)

(assert (=> b!588046 m!566565))

(assert (=> b!588045 m!566545))

(assert (=> b!588045 m!566545))

(declare-fun m!566567 () Bool)

(assert (=> b!588045 m!566567))

(declare-fun m!566569 () Bool)

(assert (=> b!588048 m!566569))

(declare-fun m!566571 () Bool)

(assert (=> b!588047 m!566571))

(check-sat (not b!588047) (not b!588046) (not start!53898) (not b!588045) (not b!588048) (not b!588051) (not b!588050) (not b!588052) (not b!588053))
(check-sat)
