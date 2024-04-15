; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53454 () Bool)

(assert start!53454)

(declare-fun res!369586 () Bool)

(declare-fun e!333633 () Bool)

(assert (=> start!53454 (=> (not res!369586) (not e!333633))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53454 (= res!369586 (validMask!0 mask!3053))))

(assert (=> start!53454 e!333633))

(assert (=> start!53454 true))

(declare-datatypes ((array!36369 0))(
  ( (array!36370 (arr!17459 (Array (_ BitVec 32) (_ BitVec 64))) (size!17824 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36369)

(declare-fun array_inv!13342 (array!36369) Bool)

(assert (=> start!53454 (array_inv!13342 a!2986)))

(declare-fun b!581624 () Bool)

(declare-fun res!369590 () Bool)

(assert (=> b!581624 (=> (not res!369590) (not e!333633))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581624 (= res!369590 (validKeyInArray!0 k0!1786))))

(declare-fun b!581625 () Bool)

(declare-fun res!369582 () Bool)

(assert (=> b!581625 (=> (not res!369582) (not e!333633))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581625 (= res!369582 (and (= (size!17824 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17824 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17824 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581626 () Bool)

(declare-fun res!369587 () Bool)

(declare-fun e!333631 () Bool)

(assert (=> b!581626 (=> (not res!369587) (not e!333631))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!581626 (= res!369587 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17459 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17459 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581627 () Bool)

(assert (=> b!581627 (= e!333633 e!333631)))

(declare-fun res!369583 () Bool)

(assert (=> b!581627 (=> (not res!369583) (not e!333631))))

(declare-datatypes ((SeekEntryResult!5896 0))(
  ( (MissingZero!5896 (index!25811 (_ BitVec 32))) (Found!5896 (index!25812 (_ BitVec 32))) (Intermediate!5896 (undefined!6708 Bool) (index!25813 (_ BitVec 32)) (x!54680 (_ BitVec 32))) (Undefined!5896) (MissingVacant!5896 (index!25814 (_ BitVec 32))) )
))
(declare-fun lt!264760 () SeekEntryResult!5896)

(assert (=> b!581627 (= res!369583 (or (= lt!264760 (MissingZero!5896 i!1108)) (= lt!264760 (MissingVacant!5896 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36369 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!581627 (= lt!264760 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581628 () Bool)

(declare-fun res!369584 () Bool)

(assert (=> b!581628 (=> (not res!369584) (not e!333633))))

(assert (=> b!581628 (= res!369584 (validKeyInArray!0 (select (arr!17459 a!2986) j!136)))))

(declare-fun b!581629 () Bool)

(declare-fun res!369589 () Bool)

(assert (=> b!581629 (=> (not res!369589) (not e!333631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36369 (_ BitVec 32)) Bool)

(assert (=> b!581629 (= res!369589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!581630 () Bool)

(assert (=> b!581630 (= e!333631 false)))

(declare-fun lt!264759 () SeekEntryResult!5896)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36369 (_ BitVec 32)) SeekEntryResult!5896)

(assert (=> b!581630 (= lt!264759 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17459 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581631 () Bool)

(declare-fun res!369585 () Bool)

(assert (=> b!581631 (=> (not res!369585) (not e!333633))))

(declare-fun arrayContainsKey!0 (array!36369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581631 (= res!369585 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581632 () Bool)

(declare-fun res!369588 () Bool)

(assert (=> b!581632 (=> (not res!369588) (not e!333631))))

(declare-datatypes ((List!11539 0))(
  ( (Nil!11536) (Cons!11535 (h!12580 (_ BitVec 64)) (t!17758 List!11539)) )
))
(declare-fun arrayNoDuplicates!0 (array!36369 (_ BitVec 32) List!11539) Bool)

(assert (=> b!581632 (= res!369588 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11536))))

(assert (= (and start!53454 res!369586) b!581625))

(assert (= (and b!581625 res!369582) b!581628))

(assert (= (and b!581628 res!369584) b!581624))

(assert (= (and b!581624 res!369590) b!581631))

(assert (= (and b!581631 res!369585) b!581627))

(assert (= (and b!581627 res!369583) b!581629))

(assert (= (and b!581629 res!369589) b!581632))

(assert (= (and b!581632 res!369588) b!581626))

(assert (= (and b!581626 res!369587) b!581630))

(declare-fun m!559633 () Bool)

(assert (=> start!53454 m!559633))

(declare-fun m!559635 () Bool)

(assert (=> start!53454 m!559635))

(declare-fun m!559637 () Bool)

(assert (=> b!581626 m!559637))

(declare-fun m!559639 () Bool)

(assert (=> b!581626 m!559639))

(declare-fun m!559641 () Bool)

(assert (=> b!581626 m!559641))

(declare-fun m!559643 () Bool)

(assert (=> b!581632 m!559643))

(declare-fun m!559645 () Bool)

(assert (=> b!581630 m!559645))

(assert (=> b!581630 m!559645))

(declare-fun m!559647 () Bool)

(assert (=> b!581630 m!559647))

(declare-fun m!559649 () Bool)

(assert (=> b!581631 m!559649))

(declare-fun m!559651 () Bool)

(assert (=> b!581629 m!559651))

(declare-fun m!559653 () Bool)

(assert (=> b!581624 m!559653))

(declare-fun m!559655 () Bool)

(assert (=> b!581627 m!559655))

(assert (=> b!581628 m!559645))

(assert (=> b!581628 m!559645))

(declare-fun m!559657 () Bool)

(assert (=> b!581628 m!559657))

(check-sat (not b!581627) (not b!581629) (not b!581632) (not b!581628) (not b!581630) (not b!581624) (not b!581631) (not start!53454))
(check-sat)
