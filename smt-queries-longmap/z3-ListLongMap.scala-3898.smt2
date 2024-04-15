; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53382 () Bool)

(assert start!53382)

(declare-fun b!580625 () Bool)

(declare-fun res!368585 () Bool)

(declare-fun e!333309 () Bool)

(assert (=> b!580625 (=> (not res!368585) (not e!333309))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36297 0))(
  ( (array!36298 (arr!17423 (Array (_ BitVec 32) (_ BitVec 64))) (size!17788 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36297)

(assert (=> b!580625 (= res!368585 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17423 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17423 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580626 () Bool)

(declare-fun res!368586 () Bool)

(assert (=> b!580626 (=> (not res!368586) (not e!333309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36297 (_ BitVec 32)) Bool)

(assert (=> b!580626 (= res!368586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580627 () Bool)

(declare-fun res!368590 () Bool)

(assert (=> b!580627 (=> (not res!368590) (not e!333309))))

(declare-datatypes ((List!11503 0))(
  ( (Nil!11500) (Cons!11499 (h!12544 (_ BitVec 64)) (t!17722 List!11503)) )
))
(declare-fun arrayNoDuplicates!0 (array!36297 (_ BitVec 32) List!11503) Bool)

(assert (=> b!580627 (= res!368590 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11500))))

(declare-fun b!580628 () Bool)

(declare-fun e!333308 () Bool)

(assert (=> b!580628 (= e!333308 e!333309)))

(declare-fun res!368591 () Bool)

(assert (=> b!580628 (=> (not res!368591) (not e!333309))))

(declare-datatypes ((SeekEntryResult!5860 0))(
  ( (MissingZero!5860 (index!25667 (_ BitVec 32))) (Found!5860 (index!25668 (_ BitVec 32))) (Intermediate!5860 (undefined!6672 Bool) (index!25669 (_ BitVec 32)) (x!54548 (_ BitVec 32))) (Undefined!5860) (MissingVacant!5860 (index!25670 (_ BitVec 32))) )
))
(declare-fun lt!264562 () SeekEntryResult!5860)

(assert (=> b!580628 (= res!368591 (or (= lt!264562 (MissingZero!5860 i!1108)) (= lt!264562 (MissingVacant!5860 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36297 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!580628 (= lt!264562 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!580629 () Bool)

(declare-fun res!368583 () Bool)

(assert (=> b!580629 (=> (not res!368583) (not e!333308))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580629 (= res!368583 (validKeyInArray!0 (select (arr!17423 a!2986) j!136)))))

(declare-fun res!368589 () Bool)

(assert (=> start!53382 (=> (not res!368589) (not e!333308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53382 (= res!368589 (validMask!0 mask!3053))))

(assert (=> start!53382 e!333308))

(assert (=> start!53382 true))

(declare-fun array_inv!13306 (array!36297) Bool)

(assert (=> start!53382 (array_inv!13306 a!2986)))

(declare-fun b!580630 () Bool)

(declare-fun res!368588 () Bool)

(assert (=> b!580630 (=> (not res!368588) (not e!333308))))

(declare-fun arrayContainsKey!0 (array!36297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580630 (= res!368588 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580631 () Bool)

(declare-fun res!368584 () Bool)

(assert (=> b!580631 (=> (not res!368584) (not e!333308))))

(assert (=> b!580631 (= res!368584 (validKeyInArray!0 k0!1786))))

(declare-fun b!580632 () Bool)

(assert (=> b!580632 (= e!333309 false)))

(declare-fun lt!264561 () SeekEntryResult!5860)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36297 (_ BitVec 32)) SeekEntryResult!5860)

(assert (=> b!580632 (= lt!264561 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17423 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!580633 () Bool)

(declare-fun res!368587 () Bool)

(assert (=> b!580633 (=> (not res!368587) (not e!333308))))

(assert (=> b!580633 (= res!368587 (and (= (size!17788 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17788 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17788 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!53382 res!368589) b!580633))

(assert (= (and b!580633 res!368587) b!580629))

(assert (= (and b!580629 res!368583) b!580631))

(assert (= (and b!580631 res!368584) b!580630))

(assert (= (and b!580630 res!368588) b!580628))

(assert (= (and b!580628 res!368591) b!580626))

(assert (= (and b!580626 res!368586) b!580627))

(assert (= (and b!580627 res!368590) b!580625))

(assert (= (and b!580625 res!368585) b!580632))

(declare-fun m!558673 () Bool)

(assert (=> start!53382 m!558673))

(declare-fun m!558675 () Bool)

(assert (=> start!53382 m!558675))

(declare-fun m!558677 () Bool)

(assert (=> b!580629 m!558677))

(assert (=> b!580629 m!558677))

(declare-fun m!558679 () Bool)

(assert (=> b!580629 m!558679))

(declare-fun m!558681 () Bool)

(assert (=> b!580626 m!558681))

(declare-fun m!558683 () Bool)

(assert (=> b!580630 m!558683))

(declare-fun m!558685 () Bool)

(assert (=> b!580627 m!558685))

(declare-fun m!558687 () Bool)

(assert (=> b!580625 m!558687))

(declare-fun m!558689 () Bool)

(assert (=> b!580625 m!558689))

(declare-fun m!558691 () Bool)

(assert (=> b!580625 m!558691))

(assert (=> b!580632 m!558677))

(assert (=> b!580632 m!558677))

(declare-fun m!558693 () Bool)

(assert (=> b!580632 m!558693))

(declare-fun m!558695 () Bool)

(assert (=> b!580631 m!558695))

(declare-fun m!558697 () Bool)

(assert (=> b!580628 m!558697))

(check-sat (not b!580631) (not b!580627) (not b!580628) (not b!580632) (not b!580630) (not b!580626) (not b!580629) (not start!53382))
(check-sat)
