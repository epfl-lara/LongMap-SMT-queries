; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53586 () Bool)

(assert start!53586)

(declare-fun b!582986 () Bool)

(declare-fun e!334232 () Bool)

(assert (=> b!582986 (= e!334232 false)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5884 0))(
  ( (MissingZero!5884 (index!25763 (_ BitVec 32))) (Found!5884 (index!25764 (_ BitVec 32))) (Intermediate!5884 (undefined!6696 Bool) (index!25765 (_ BitVec 32)) (x!54764 (_ BitVec 32))) (Undefined!5884) (MissingVacant!5884 (index!25766 (_ BitVec 32))) )
))
(declare-fun lt!265303 () SeekEntryResult!5884)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36432 0))(
  ( (array!36433 (arr!17488 (Array (_ BitVec 32) (_ BitVec 64))) (size!17852 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36432)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36432 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!582986 (= lt!265303 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17488 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!582987 () Bool)

(declare-fun e!334233 () Bool)

(assert (=> b!582987 (= e!334233 e!334232)))

(declare-fun res!370699 () Bool)

(assert (=> b!582987 (=> (not res!370699) (not e!334232))))

(declare-fun lt!265302 () SeekEntryResult!5884)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!582987 (= res!370699 (or (= lt!265302 (MissingZero!5884 i!1108)) (= lt!265302 (MissingVacant!5884 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36432 (_ BitVec 32)) SeekEntryResult!5884)

(assert (=> b!582987 (= lt!265302 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!582988 () Bool)

(declare-fun res!370697 () Bool)

(assert (=> b!582988 (=> (not res!370697) (not e!334233))))

(declare-fun arrayContainsKey!0 (array!36432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!582988 (= res!370697 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!582989 () Bool)

(declare-fun res!370704 () Bool)

(assert (=> b!582989 (=> (not res!370704) (not e!334233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!582989 (= res!370704 (validKeyInArray!0 (select (arr!17488 a!2986) j!136)))))

(declare-fun b!582990 () Bool)

(declare-fun res!370700 () Bool)

(assert (=> b!582990 (=> (not res!370700) (not e!334232))))

(assert (=> b!582990 (= res!370700 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17488 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17488 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!582991 () Bool)

(declare-fun res!370698 () Bool)

(assert (=> b!582991 (=> (not res!370698) (not e!334232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36432 (_ BitVec 32)) Bool)

(assert (=> b!582991 (= res!370698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!370702 () Bool)

(assert (=> start!53586 (=> (not res!370702) (not e!334233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53586 (= res!370702 (validMask!0 mask!3053))))

(assert (=> start!53586 e!334233))

(assert (=> start!53586 true))

(declare-fun array_inv!13347 (array!36432) Bool)

(assert (=> start!53586 (array_inv!13347 a!2986)))

(declare-fun b!582992 () Bool)

(declare-fun res!370703 () Bool)

(assert (=> b!582992 (=> (not res!370703) (not e!334233))))

(assert (=> b!582992 (= res!370703 (and (= (size!17852 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17852 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17852 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!582993 () Bool)

(declare-fun res!370701 () Bool)

(assert (=> b!582993 (=> (not res!370701) (not e!334233))))

(assert (=> b!582993 (= res!370701 (validKeyInArray!0 k0!1786))))

(declare-fun b!582994 () Bool)

(declare-fun res!370705 () Bool)

(assert (=> b!582994 (=> (not res!370705) (not e!334232))))

(declare-datatypes ((List!11436 0))(
  ( (Nil!11433) (Cons!11432 (h!12480 (_ BitVec 64)) (t!17656 List!11436)) )
))
(declare-fun arrayNoDuplicates!0 (array!36432 (_ BitVec 32) List!11436) Bool)

(assert (=> b!582994 (= res!370705 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11433))))

(assert (= (and start!53586 res!370702) b!582992))

(assert (= (and b!582992 res!370703) b!582989))

(assert (= (and b!582989 res!370704) b!582993))

(assert (= (and b!582993 res!370701) b!582988))

(assert (= (and b!582988 res!370697) b!582987))

(assert (= (and b!582987 res!370699) b!582991))

(assert (= (and b!582991 res!370698) b!582994))

(assert (= (and b!582994 res!370705) b!582990))

(assert (= (and b!582990 res!370700) b!582986))

(declare-fun m!561629 () Bool)

(assert (=> b!582993 m!561629))

(declare-fun m!561631 () Bool)

(assert (=> b!582987 m!561631))

(declare-fun m!561633 () Bool)

(assert (=> b!582989 m!561633))

(assert (=> b!582989 m!561633))

(declare-fun m!561635 () Bool)

(assert (=> b!582989 m!561635))

(declare-fun m!561637 () Bool)

(assert (=> start!53586 m!561637))

(declare-fun m!561639 () Bool)

(assert (=> start!53586 m!561639))

(declare-fun m!561641 () Bool)

(assert (=> b!582988 m!561641))

(declare-fun m!561643 () Bool)

(assert (=> b!582994 m!561643))

(declare-fun m!561645 () Bool)

(assert (=> b!582991 m!561645))

(assert (=> b!582986 m!561633))

(assert (=> b!582986 m!561633))

(declare-fun m!561647 () Bool)

(assert (=> b!582986 m!561647))

(declare-fun m!561649 () Bool)

(assert (=> b!582990 m!561649))

(declare-fun m!561651 () Bool)

(assert (=> b!582990 m!561651))

(declare-fun m!561653 () Bool)

(assert (=> b!582990 m!561653))

(check-sat (not b!582986) (not start!53586) (not b!582994) (not b!582991) (not b!582988) (not b!582989) (not b!582987) (not b!582993))
(check-sat)
