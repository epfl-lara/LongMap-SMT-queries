; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53690 () Bool)

(assert start!53690)

(declare-fun b!585330 () Bool)

(declare-fun e!334949 () Bool)

(assert (=> b!585330 (= e!334949 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6010 0))(
  ( (MissingZero!6010 (index!26267 (_ BitVec 32))) (Found!6010 (index!26268 (_ BitVec 32))) (Intermediate!6010 (undefined!6822 Bool) (index!26269 (_ BitVec 32)) (x!55087 (_ BitVec 32))) (Undefined!6010) (MissingVacant!6010 (index!26270 (_ BitVec 32))) )
))
(declare-fun lt!265797 () SeekEntryResult!6010)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!36591 0))(
  ( (array!36592 (arr!17570 (Array (_ BitVec 32) (_ BitVec 64))) (size!17934 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36591)

(declare-fun lt!265796 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36591 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!585330 (= lt!265797 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!265796 vacantSpotIndex!68 (select (arr!17570 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!585331 () Bool)

(declare-fun res!373147 () Bool)

(declare-fun e!334948 () Bool)

(assert (=> b!585331 (=> (not res!373147) (not e!334948))))

(declare-datatypes ((List!11611 0))(
  ( (Nil!11608) (Cons!11607 (h!12652 (_ BitVec 64)) (t!17839 List!11611)) )
))
(declare-fun arrayNoDuplicates!0 (array!36591 (_ BitVec 32) List!11611) Bool)

(assert (=> b!585331 (= res!373147 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11608))))

(declare-fun b!585332 () Bool)

(assert (=> b!585332 (= e!334948 e!334949)))

(declare-fun res!373151 () Bool)

(assert (=> b!585332 (=> (not res!373151) (not e!334949))))

(assert (=> b!585332 (= res!373151 (and (bvsge lt!265796 #b00000000000000000000000000000000) (bvslt lt!265796 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b00000000000000000000000000000000)))))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!585332 (= lt!265796 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!585333 () Bool)

(declare-fun res!373150 () Bool)

(declare-fun e!334947 () Bool)

(assert (=> b!585333 (=> (not res!373150) (not e!334947))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!585333 (= res!373150 (validKeyInArray!0 k!1786))))

(declare-fun res!373149 () Bool)

(assert (=> start!53690 (=> (not res!373149) (not e!334947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53690 (= res!373149 (validMask!0 mask!3053))))

(assert (=> start!53690 e!334947))

(assert (=> start!53690 true))

(declare-fun array_inv!13366 (array!36591) Bool)

(assert (=> start!53690 (array_inv!13366 a!2986)))

(declare-fun b!585334 () Bool)

(assert (=> b!585334 (= e!334947 e!334948)))

(declare-fun res!373148 () Bool)

(assert (=> b!585334 (=> (not res!373148) (not e!334948))))

(declare-fun lt!265798 () SeekEntryResult!6010)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!585334 (= res!373148 (or (= lt!265798 (MissingZero!6010 i!1108)) (= lt!265798 (MissingVacant!6010 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36591 (_ BitVec 32)) SeekEntryResult!6010)

(assert (=> b!585334 (= lt!265798 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!585335 () Bool)

(declare-fun res!373146 () Bool)

(assert (=> b!585335 (=> (not res!373146) (not e!334948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36591 (_ BitVec 32)) Bool)

(assert (=> b!585335 (= res!373146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!585336 () Bool)

(declare-fun res!373156 () Bool)

(assert (=> b!585336 (=> (not res!373156) (not e!334947))))

(assert (=> b!585336 (= res!373156 (validKeyInArray!0 (select (arr!17570 a!2986) j!136)))))

(declare-fun b!585337 () Bool)

(declare-fun res!373154 () Bool)

(assert (=> b!585337 (=> (not res!373154) (not e!334948))))

(assert (=> b!585337 (= res!373154 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17570 a!2986) j!136) a!2986 mask!3053) (Found!6010 j!136)))))

(declare-fun b!585338 () Bool)

(declare-fun res!373152 () Bool)

(assert (=> b!585338 (=> (not res!373152) (not e!334948))))

(assert (=> b!585338 (= res!373152 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17570 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17570 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!585339 () Bool)

(declare-fun res!373155 () Bool)

(assert (=> b!585339 (=> (not res!373155) (not e!334948))))

(assert (=> b!585339 (= res!373155 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17570 a!2986) index!984) (select (arr!17570 a!2986) j!136))) (not (= (select (arr!17570 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!585340 () Bool)

(declare-fun res!373153 () Bool)

(assert (=> b!585340 (=> (not res!373153) (not e!334947))))

(declare-fun arrayContainsKey!0 (array!36591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!585340 (= res!373153 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!585341 () Bool)

(declare-fun res!373157 () Bool)

(assert (=> b!585341 (=> (not res!373157) (not e!334947))))

(assert (=> b!585341 (= res!373157 (and (= (size!17934 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17934 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17934 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53690 res!373149) b!585341))

(assert (= (and b!585341 res!373157) b!585336))

(assert (= (and b!585336 res!373156) b!585333))

(assert (= (and b!585333 res!373150) b!585340))

(assert (= (and b!585340 res!373153) b!585334))

(assert (= (and b!585334 res!373148) b!585335))

(assert (= (and b!585335 res!373146) b!585331))

(assert (= (and b!585331 res!373147) b!585338))

(assert (= (and b!585338 res!373152) b!585337))

(assert (= (and b!585337 res!373154) b!585339))

(assert (= (and b!585339 res!373155) b!585332))

(assert (= (and b!585332 res!373151) b!585330))

(declare-fun m!563585 () Bool)

(assert (=> b!585334 m!563585))

(declare-fun m!563587 () Bool)

(assert (=> b!585331 m!563587))

(declare-fun m!563589 () Bool)

(assert (=> b!585332 m!563589))

(declare-fun m!563591 () Bool)

(assert (=> b!585338 m!563591))

(declare-fun m!563593 () Bool)

(assert (=> b!585338 m!563593))

(declare-fun m!563595 () Bool)

(assert (=> b!585338 m!563595))

(declare-fun m!563597 () Bool)

(assert (=> start!53690 m!563597))

(declare-fun m!563599 () Bool)

(assert (=> start!53690 m!563599))

(declare-fun m!563601 () Bool)

(assert (=> b!585335 m!563601))

(declare-fun m!563603 () Bool)

(assert (=> b!585333 m!563603))

(declare-fun m!563605 () Bool)

(assert (=> b!585337 m!563605))

(assert (=> b!585337 m!563605))

(declare-fun m!563607 () Bool)

(assert (=> b!585337 m!563607))

(declare-fun m!563609 () Bool)

(assert (=> b!585340 m!563609))

(assert (=> b!585330 m!563605))

(assert (=> b!585330 m!563605))

(declare-fun m!563611 () Bool)

(assert (=> b!585330 m!563611))

(assert (=> b!585336 m!563605))

(assert (=> b!585336 m!563605))

(declare-fun m!563613 () Bool)

(assert (=> b!585336 m!563613))

(declare-fun m!563615 () Bool)

(assert (=> b!585339 m!563615))

(assert (=> b!585339 m!563605))

(push 1)

(assert (not b!585331))

(assert (not b!585336))

(assert (not b!585334))

(assert (not b!585330))

(assert (not b!585333))

(assert (not start!53690))

