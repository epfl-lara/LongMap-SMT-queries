; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53298 () Bool)

(assert start!53298)

(declare-fun b!579482 () Bool)

(declare-fun res!367447 () Bool)

(declare-fun e!332930 () Bool)

(assert (=> b!579482 (=> (not res!367447) (not e!332930))))

(declare-datatypes ((array!36213 0))(
  ( (array!36214 (arr!17381 (Array (_ BitVec 32) (_ BitVec 64))) (size!17746 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36213)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!579482 (= res!367447 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!579483 () Bool)

(declare-fun res!367442 () Bool)

(declare-fun e!332931 () Bool)

(assert (=> b!579483 (=> (not res!367442) (not e!332931))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36213 (_ BitVec 32)) Bool)

(assert (=> b!579483 (= res!367442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!367446 () Bool)

(assert (=> start!53298 (=> (not res!367446) (not e!332930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53298 (= res!367446 (validMask!0 mask!3053))))

(assert (=> start!53298 e!332930))

(assert (=> start!53298 true))

(declare-fun array_inv!13264 (array!36213) Bool)

(assert (=> start!53298 (array_inv!13264 a!2986)))

(declare-fun b!579484 () Bool)

(declare-fun res!367445 () Bool)

(assert (=> b!579484 (=> (not res!367445) (not e!332931))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!579484 (= res!367445 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17381 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17381 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!579485 () Bool)

(declare-fun res!367443 () Bool)

(assert (=> b!579485 (=> (not res!367443) (not e!332931))))

(declare-datatypes ((List!11461 0))(
  ( (Nil!11458) (Cons!11457 (h!12502 (_ BitVec 64)) (t!17680 List!11461)) )
))
(declare-fun arrayNoDuplicates!0 (array!36213 (_ BitVec 32) List!11461) Bool)

(assert (=> b!579485 (= res!367443 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11458))))

(declare-fun b!579486 () Bool)

(declare-fun res!367441 () Bool)

(assert (=> b!579486 (=> (not res!367441) (not e!332930))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!579486 (= res!367441 (and (= (size!17746 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17746 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17746 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!579487 () Bool)

(assert (=> b!579487 (= e!332931 false)))

(declare-datatypes ((SeekEntryResult!5818 0))(
  ( (MissingZero!5818 (index!25499 (_ BitVec 32))) (Found!5818 (index!25500 (_ BitVec 32))) (Intermediate!5818 (undefined!6630 Bool) (index!25501 (_ BitVec 32)) (x!54394 (_ BitVec 32))) (Undefined!5818) (MissingVacant!5818 (index!25502 (_ BitVec 32))) )
))
(declare-fun lt!264319 () SeekEntryResult!5818)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36213 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!579487 (= lt!264319 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17381 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!579488 () Bool)

(declare-fun res!367444 () Bool)

(assert (=> b!579488 (=> (not res!367444) (not e!332930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!579488 (= res!367444 (validKeyInArray!0 k0!1786))))

(declare-fun b!579489 () Bool)

(assert (=> b!579489 (= e!332930 e!332931)))

(declare-fun res!367448 () Bool)

(assert (=> b!579489 (=> (not res!367448) (not e!332931))))

(declare-fun lt!264318 () SeekEntryResult!5818)

(assert (=> b!579489 (= res!367448 (or (= lt!264318 (MissingZero!5818 i!1108)) (= lt!264318 (MissingVacant!5818 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36213 (_ BitVec 32)) SeekEntryResult!5818)

(assert (=> b!579489 (= lt!264318 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!579490 () Bool)

(declare-fun res!367440 () Bool)

(assert (=> b!579490 (=> (not res!367440) (not e!332930))))

(assert (=> b!579490 (= res!367440 (validKeyInArray!0 (select (arr!17381 a!2986) j!136)))))

(assert (= (and start!53298 res!367446) b!579486))

(assert (= (and b!579486 res!367441) b!579490))

(assert (= (and b!579490 res!367440) b!579488))

(assert (= (and b!579488 res!367444) b!579482))

(assert (= (and b!579482 res!367447) b!579489))

(assert (= (and b!579489 res!367448) b!579483))

(assert (= (and b!579483 res!367442) b!579485))

(assert (= (and b!579485 res!367443) b!579484))

(assert (= (and b!579484 res!367445) b!579487))

(declare-fun m!557575 () Bool)

(assert (=> start!53298 m!557575))

(declare-fun m!557577 () Bool)

(assert (=> start!53298 m!557577))

(declare-fun m!557579 () Bool)

(assert (=> b!579487 m!557579))

(assert (=> b!579487 m!557579))

(declare-fun m!557581 () Bool)

(assert (=> b!579487 m!557581))

(declare-fun m!557583 () Bool)

(assert (=> b!579488 m!557583))

(declare-fun m!557585 () Bool)

(assert (=> b!579482 m!557585))

(declare-fun m!557587 () Bool)

(assert (=> b!579483 m!557587))

(declare-fun m!557589 () Bool)

(assert (=> b!579489 m!557589))

(declare-fun m!557591 () Bool)

(assert (=> b!579484 m!557591))

(declare-fun m!557593 () Bool)

(assert (=> b!579484 m!557593))

(declare-fun m!557595 () Bool)

(assert (=> b!579484 m!557595))

(declare-fun m!557597 () Bool)

(assert (=> b!579485 m!557597))

(assert (=> b!579490 m!557579))

(assert (=> b!579490 m!557579))

(declare-fun m!557599 () Bool)

(assert (=> b!579490 m!557599))

(check-sat (not b!579488) (not b!579485) (not b!579483) (not b!579487) (not b!579482) (not b!579489) (not b!579490) (not start!53298))
(check-sat)
