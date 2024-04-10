; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53562 () Bool)

(assert start!53562)

(declare-fun b!583137 () Bool)

(declare-fun res!370954 () Bool)

(declare-fun e!334220 () Bool)

(assert (=> b!583137 (=> (not res!370954) (not e!334220))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36463 0))(
  ( (array!36464 (arr!17506 (Array (_ BitVec 32) (_ BitVec 64))) (size!17870 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36463)

(assert (=> b!583137 (= res!370954 (and (= (size!17870 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17870 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17870 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!583138 () Bool)

(declare-fun res!370956 () Bool)

(declare-fun e!334221 () Bool)

(assert (=> b!583138 (=> (not res!370956) (not e!334221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36463 (_ BitVec 32)) Bool)

(assert (=> b!583138 (= res!370956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!583139 () Bool)

(declare-fun res!370957 () Bool)

(assert (=> b!583139 (=> (not res!370957) (not e!334221))))

(declare-datatypes ((List!11547 0))(
  ( (Nil!11544) (Cons!11543 (h!12588 (_ BitVec 64)) (t!17775 List!11547)) )
))
(declare-fun arrayNoDuplicates!0 (array!36463 (_ BitVec 32) List!11547) Bool)

(assert (=> b!583139 (= res!370957 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11544))))

(declare-fun b!583140 () Bool)

(assert (=> b!583140 (= e!334220 e!334221)))

(declare-fun res!370961 () Bool)

(assert (=> b!583140 (=> (not res!370961) (not e!334221))))

(declare-datatypes ((SeekEntryResult!5946 0))(
  ( (MissingZero!5946 (index!26011 (_ BitVec 32))) (Found!5946 (index!26012 (_ BitVec 32))) (Intermediate!5946 (undefined!6758 Bool) (index!26013 (_ BitVec 32)) (x!54855 (_ BitVec 32))) (Undefined!5946) (MissingVacant!5946 (index!26014 (_ BitVec 32))) )
))
(declare-fun lt!265269 () SeekEntryResult!5946)

(assert (=> b!583140 (= res!370961 (or (= lt!265269 (MissingZero!5946 i!1108)) (= lt!265269 (MissingVacant!5946 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36463 (_ BitVec 32)) SeekEntryResult!5946)

(assert (=> b!583140 (= lt!265269 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!583141 () Bool)

(declare-fun res!370960 () Bool)

(assert (=> b!583141 (=> (not res!370960) (not e!334220))))

(declare-fun arrayContainsKey!0 (array!36463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!583141 (= res!370960 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!583142 () Bool)

(assert (=> b!583142 (= e!334221 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!265270 () SeekEntryResult!5946)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36463 (_ BitVec 32)) SeekEntryResult!5946)

(assert (=> b!583142 (= lt!265270 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17506 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!583144 () Bool)

(declare-fun res!370959 () Bool)

(assert (=> b!583144 (=> (not res!370959) (not e!334221))))

(assert (=> b!583144 (= res!370959 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17506 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17506 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!583145 () Bool)

(declare-fun res!370953 () Bool)

(assert (=> b!583145 (=> (not res!370953) (not e!334220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!583145 (= res!370953 (validKeyInArray!0 (select (arr!17506 a!2986) j!136)))))

(declare-fun res!370958 () Bool)

(assert (=> start!53562 (=> (not res!370958) (not e!334220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53562 (= res!370958 (validMask!0 mask!3053))))

(assert (=> start!53562 e!334220))

(assert (=> start!53562 true))

(declare-fun array_inv!13302 (array!36463) Bool)

(assert (=> start!53562 (array_inv!13302 a!2986)))

(declare-fun b!583143 () Bool)

(declare-fun res!370955 () Bool)

(assert (=> b!583143 (=> (not res!370955) (not e!334220))))

(assert (=> b!583143 (= res!370955 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53562 res!370958) b!583137))

(assert (= (and b!583137 res!370954) b!583145))

(assert (= (and b!583145 res!370953) b!583143))

(assert (= (and b!583143 res!370955) b!583141))

(assert (= (and b!583141 res!370960) b!583140))

(assert (= (and b!583140 res!370961) b!583138))

(assert (= (and b!583138 res!370956) b!583139))

(assert (= (and b!583139 res!370957) b!583144))

(assert (= (and b!583144 res!370959) b!583142))

(declare-fun m!561615 () Bool)

(assert (=> b!583138 m!561615))

(declare-fun m!561617 () Bool)

(assert (=> start!53562 m!561617))

(declare-fun m!561619 () Bool)

(assert (=> start!53562 m!561619))

(declare-fun m!561621 () Bool)

(assert (=> b!583144 m!561621))

(declare-fun m!561623 () Bool)

(assert (=> b!583144 m!561623))

(declare-fun m!561625 () Bool)

(assert (=> b!583144 m!561625))

(declare-fun m!561627 () Bool)

(assert (=> b!583139 m!561627))

(declare-fun m!561629 () Bool)

(assert (=> b!583143 m!561629))

(declare-fun m!561631 () Bool)

(assert (=> b!583140 m!561631))

(declare-fun m!561633 () Bool)

(assert (=> b!583141 m!561633))

(declare-fun m!561635 () Bool)

(assert (=> b!583145 m!561635))

(assert (=> b!583145 m!561635))

(declare-fun m!561637 () Bool)

(assert (=> b!583145 m!561637))

(assert (=> b!583142 m!561635))

(assert (=> b!583142 m!561635))

(declare-fun m!561639 () Bool)

(assert (=> b!583142 m!561639))

(check-sat (not b!583143) (not b!583140) (not b!583139) (not b!583142) (not b!583138) (not start!53562) (not b!583145) (not b!583141))
(check-sat)
