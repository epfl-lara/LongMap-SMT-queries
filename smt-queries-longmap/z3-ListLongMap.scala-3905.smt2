; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53442 () Bool)

(assert start!53442)

(declare-fun b!581499 () Bool)

(declare-fun res!369316 () Bool)

(declare-fun e!333681 () Bool)

(assert (=> b!581499 (=> (not res!369316) (not e!333681))))

(declare-datatypes ((array!36343 0))(
  ( (array!36344 (arr!17446 (Array (_ BitVec 32) (_ BitVec 64))) (size!17810 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36343)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!581499 (= res!369316 (validKeyInArray!0 (select (arr!17446 a!2986) j!136)))))

(declare-fun b!581500 () Bool)

(declare-fun e!333679 () Bool)

(assert (=> b!581500 (= e!333679 false)))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5886 0))(
  ( (MissingZero!5886 (index!25771 (_ BitVec 32))) (Found!5886 (index!25772 (_ BitVec 32))) (Intermediate!5886 (undefined!6698 Bool) (index!25773 (_ BitVec 32)) (x!54635 (_ BitVec 32))) (Undefined!5886) (MissingVacant!5886 (index!25774 (_ BitVec 32))) )
))
(declare-fun lt!264918 () SeekEntryResult!5886)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36343 (_ BitVec 32)) SeekEntryResult!5886)

(assert (=> b!581500 (= lt!264918 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17446 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!581501 () Bool)

(declare-fun res!369319 () Bool)

(assert (=> b!581501 (=> (not res!369319) (not e!333681))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!581501 (= res!369319 (validKeyInArray!0 k0!1786))))

(declare-fun b!581502 () Bool)

(declare-fun res!369318 () Bool)

(assert (=> b!581502 (=> (not res!369318) (not e!333679))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!581502 (= res!369318 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17446 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17446 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!581503 () Bool)

(declare-fun res!369322 () Bool)

(assert (=> b!581503 (=> (not res!369322) (not e!333681))))

(assert (=> b!581503 (= res!369322 (and (= (size!17810 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17810 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17810 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!581504 () Bool)

(declare-fun res!369323 () Bool)

(assert (=> b!581504 (=> (not res!369323) (not e!333681))))

(declare-fun arrayContainsKey!0 (array!36343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!581504 (= res!369323 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!581505 () Bool)

(assert (=> b!581505 (= e!333681 e!333679)))

(declare-fun res!369317 () Bool)

(assert (=> b!581505 (=> (not res!369317) (not e!333679))))

(declare-fun lt!264919 () SeekEntryResult!5886)

(assert (=> b!581505 (= res!369317 (or (= lt!264919 (MissingZero!5886 i!1108)) (= lt!264919 (MissingVacant!5886 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36343 (_ BitVec 32)) SeekEntryResult!5886)

(assert (=> b!581505 (= lt!264919 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!581506 () Bool)

(declare-fun res!369321 () Bool)

(assert (=> b!581506 (=> (not res!369321) (not e!333679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36343 (_ BitVec 32)) Bool)

(assert (=> b!581506 (= res!369321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!369315 () Bool)

(assert (=> start!53442 (=> (not res!369315) (not e!333681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53442 (= res!369315 (validMask!0 mask!3053))))

(assert (=> start!53442 e!333681))

(assert (=> start!53442 true))

(declare-fun array_inv!13242 (array!36343) Bool)

(assert (=> start!53442 (array_inv!13242 a!2986)))

(declare-fun b!581507 () Bool)

(declare-fun res!369320 () Bool)

(assert (=> b!581507 (=> (not res!369320) (not e!333679))))

(declare-datatypes ((List!11487 0))(
  ( (Nil!11484) (Cons!11483 (h!12528 (_ BitVec 64)) (t!17715 List!11487)) )
))
(declare-fun arrayNoDuplicates!0 (array!36343 (_ BitVec 32) List!11487) Bool)

(assert (=> b!581507 (= res!369320 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11484))))

(assert (= (and start!53442 res!369315) b!581503))

(assert (= (and b!581503 res!369322) b!581499))

(assert (= (and b!581499 res!369316) b!581501))

(assert (= (and b!581501 res!369319) b!581504))

(assert (= (and b!581504 res!369323) b!581505))

(assert (= (and b!581505 res!369317) b!581506))

(assert (= (and b!581506 res!369321) b!581507))

(assert (= (and b!581507 res!369320) b!581502))

(assert (= (and b!581502 res!369318) b!581500))

(declare-fun m!560037 () Bool)

(assert (=> b!581499 m!560037))

(assert (=> b!581499 m!560037))

(declare-fun m!560039 () Bool)

(assert (=> b!581499 m!560039))

(declare-fun m!560041 () Bool)

(assert (=> b!581506 m!560041))

(declare-fun m!560043 () Bool)

(assert (=> b!581507 m!560043))

(declare-fun m!560045 () Bool)

(assert (=> b!581502 m!560045))

(declare-fun m!560047 () Bool)

(assert (=> b!581502 m!560047))

(declare-fun m!560049 () Bool)

(assert (=> b!581502 m!560049))

(declare-fun m!560051 () Bool)

(assert (=> start!53442 m!560051))

(declare-fun m!560053 () Bool)

(assert (=> start!53442 m!560053))

(declare-fun m!560055 () Bool)

(assert (=> b!581501 m!560055))

(declare-fun m!560057 () Bool)

(assert (=> b!581505 m!560057))

(declare-fun m!560059 () Bool)

(assert (=> b!581504 m!560059))

(assert (=> b!581500 m!560037))

(assert (=> b!581500 m!560037))

(declare-fun m!560061 () Bool)

(assert (=> b!581500 m!560061))

(check-sat (not b!581506) (not b!581501) (not b!581500) (not b!581505) (not b!581504) (not b!581499) (not b!581507) (not start!53442))
