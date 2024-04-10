; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53338 () Bool)

(assert start!53338)

(declare-fun res!367897 () Bool)

(declare-fun e!333211 () Bool)

(assert (=> start!53338 (=> (not res!367897) (not e!333211))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53338 (= res!367897 (validMask!0 mask!3053))))

(assert (=> start!53338 e!333211))

(assert (=> start!53338 true))

(declare-datatypes ((array!36239 0))(
  ( (array!36240 (arr!17394 (Array (_ BitVec 32) (_ BitVec 64))) (size!17758 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36239)

(declare-fun array_inv!13190 (array!36239) Bool)

(assert (=> start!53338 (array_inv!13190 a!2986)))

(declare-fun b!580077 () Bool)

(declare-fun e!333213 () Bool)

(assert (=> b!580077 (= e!333211 e!333213)))

(declare-fun res!367899 () Bool)

(assert (=> b!580077 (=> (not res!367899) (not e!333213))))

(declare-datatypes ((SeekEntryResult!5834 0))(
  ( (MissingZero!5834 (index!25563 (_ BitVec 32))) (Found!5834 (index!25564 (_ BitVec 32))) (Intermediate!5834 (undefined!6646 Bool) (index!25565 (_ BitVec 32)) (x!54447 (_ BitVec 32))) (Undefined!5834) (MissingVacant!5834 (index!25566 (_ BitVec 32))) )
))
(declare-fun lt!264624 () SeekEntryResult!5834)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!580077 (= res!367899 (or (= lt!264624 (MissingZero!5834 i!1108)) (= lt!264624 (MissingVacant!5834 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36239 (_ BitVec 32)) SeekEntryResult!5834)

(assert (=> b!580077 (= lt!264624 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!580078 () Bool)

(declare-fun res!367895 () Bool)

(assert (=> b!580078 (=> (not res!367895) (not e!333213))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!580078 (= res!367895 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17394 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17394 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!580079 () Bool)

(declare-fun res!367893 () Bool)

(assert (=> b!580079 (=> (not res!367893) (not e!333211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!580079 (= res!367893 (validKeyInArray!0 k!1786))))

(declare-fun b!580080 () Bool)

(declare-fun res!367900 () Bool)

(assert (=> b!580080 (=> (not res!367900) (not e!333213))))

(declare-datatypes ((List!11435 0))(
  ( (Nil!11432) (Cons!11431 (h!12476 (_ BitVec 64)) (t!17663 List!11435)) )
))
(declare-fun arrayNoDuplicates!0 (array!36239 (_ BitVec 32) List!11435) Bool)

(assert (=> b!580080 (= res!367900 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11432))))

(declare-fun b!580081 () Bool)

(declare-fun res!367896 () Bool)

(assert (=> b!580081 (=> (not res!367896) (not e!333211))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!580081 (= res!367896 (validKeyInArray!0 (select (arr!17394 a!2986) j!136)))))

(declare-fun b!580082 () Bool)

(declare-fun res!367898 () Bool)

(assert (=> b!580082 (=> (not res!367898) (not e!333213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36239 (_ BitVec 32)) Bool)

(assert (=> b!580082 (= res!367898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!580083 () Bool)

(declare-fun res!367894 () Bool)

(assert (=> b!580083 (=> (not res!367894) (not e!333211))))

(assert (=> b!580083 (= res!367894 (and (= (size!17758 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17758 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17758 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!580084 () Bool)

(declare-fun res!367901 () Bool)

(assert (=> b!580084 (=> (not res!367901) (not e!333211))))

(declare-fun arrayContainsKey!0 (array!36239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!580084 (= res!367901 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!580085 () Bool)

(assert (=> b!580085 (= e!333213 false)))

(declare-fun lt!264625 () SeekEntryResult!5834)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36239 (_ BitVec 32)) SeekEntryResult!5834)

(assert (=> b!580085 (= lt!264625 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17394 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!53338 res!367897) b!580083))

(assert (= (and b!580083 res!367894) b!580081))

(assert (= (and b!580081 res!367896) b!580079))

(assert (= (and b!580079 res!367893) b!580084))

(assert (= (and b!580084 res!367901) b!580077))

(assert (= (and b!580077 res!367899) b!580082))

(assert (= (and b!580082 res!367898) b!580080))

(assert (= (and b!580080 res!367900) b!580078))

(assert (= (and b!580078 res!367895) b!580085))

(declare-fun m!558673 () Bool)

(assert (=> b!580080 m!558673))

(declare-fun m!558675 () Bool)

(assert (=> b!580082 m!558675))

(declare-fun m!558677 () Bool)

(assert (=> b!580085 m!558677))

(assert (=> b!580085 m!558677))

(declare-fun m!558679 () Bool)

(assert (=> b!580085 m!558679))

(declare-fun m!558681 () Bool)

(assert (=> b!580079 m!558681))

(declare-fun m!558683 () Bool)

(assert (=> start!53338 m!558683))

(declare-fun m!558685 () Bool)

(assert (=> start!53338 m!558685))

(declare-fun m!558687 () Bool)

(assert (=> b!580077 m!558687))

(assert (=> b!580081 m!558677))

(assert (=> b!580081 m!558677))

(declare-fun m!558689 () Bool)

(assert (=> b!580081 m!558689))

(declare-fun m!558691 () Bool)

(assert (=> b!580084 m!558691))

(declare-fun m!558693 () Bool)

(assert (=> b!580078 m!558693))

(declare-fun m!558695 () Bool)

(assert (=> b!580078 m!558695))

(declare-fun m!558697 () Bool)

(assert (=> b!580078 m!558697))

(push 1)

(assert (not b!580080))

(assert (not b!580082))

(assert (not b!580084))

(assert (not b!580085))

(assert (not start!53338))

(assert (not b!580077))

(assert (not b!580081))

(assert (not b!580079))

(check-sat)

