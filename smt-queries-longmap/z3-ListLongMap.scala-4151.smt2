; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56596 () Bool)

(assert start!56596)

(declare-fun b!626986 () Bool)

(declare-fun e!359133 () Bool)

(declare-fun e!359132 () Bool)

(assert (=> b!626986 (= e!359133 e!359132)))

(declare-fun res!404688 () Bool)

(assert (=> b!626986 (=> (not res!404688) (not e!359132))))

(declare-datatypes ((SeekEntryResult!6624 0))(
  ( (MissingZero!6624 (index!28780 (_ BitVec 32))) (Found!6624 (index!28781 (_ BitVec 32))) (Intermediate!6624 (undefined!7436 Bool) (index!28782 (_ BitVec 32)) (x!57524 (_ BitVec 32))) (Undefined!6624) (MissingVacant!6624 (index!28783 (_ BitVec 32))) )
))
(declare-fun lt!290196 () SeekEntryResult!6624)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!626986 (= res!404688 (or (= lt!290196 (MissingZero!6624 i!1108)) (= lt!290196 (MissingVacant!6624 i!1108))))))

(declare-datatypes ((array!37888 0))(
  ( (array!37889 (arr!18184 (Array (_ BitVec 32) (_ BitVec 64))) (size!18548 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37888)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37888 (_ BitVec 32)) SeekEntryResult!6624)

(assert (=> b!626986 (= lt!290196 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!626987 () Bool)

(declare-fun res!404693 () Bool)

(assert (=> b!626987 (=> (not res!404693) (not e!359133))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!626987 (= res!404693 (and (= (size!18548 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18548 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18548 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!626988 () Bool)

(declare-fun res!404694 () Bool)

(assert (=> b!626988 (=> (not res!404694) (not e!359133))))

(declare-fun arrayContainsKey!0 (array!37888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!626988 (= res!404694 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!404691 () Bool)

(assert (=> start!56596 (=> (not res!404691) (not e!359133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56596 (= res!404691 (validMask!0 mask!3053))))

(assert (=> start!56596 e!359133))

(assert (=> start!56596 true))

(declare-fun array_inv!13980 (array!37888) Bool)

(assert (=> start!56596 (array_inv!13980 a!2986)))

(declare-fun b!626989 () Bool)

(assert (=> b!626989 (= e!359132 false)))

(declare-fun lt!290197 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!626989 (= lt!290197 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!626990 () Bool)

(declare-fun res!404695 () Bool)

(assert (=> b!626990 (=> (not res!404695) (not e!359132))))

(declare-datatypes ((List!12225 0))(
  ( (Nil!12222) (Cons!12221 (h!13266 (_ BitVec 64)) (t!18453 List!12225)) )
))
(declare-fun arrayNoDuplicates!0 (array!37888 (_ BitVec 32) List!12225) Bool)

(assert (=> b!626990 (= res!404695 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12222))))

(declare-fun b!626991 () Bool)

(declare-fun res!404687 () Bool)

(assert (=> b!626991 (=> (not res!404687) (not e!359133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!626991 (= res!404687 (validKeyInArray!0 (select (arr!18184 a!2986) j!136)))))

(declare-fun b!626992 () Bool)

(declare-fun res!404692 () Bool)

(assert (=> b!626992 (=> (not res!404692) (not e!359132))))

(assert (=> b!626992 (= res!404692 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18184 a!2986) index!984) (select (arr!18184 a!2986) j!136))) (not (= (select (arr!18184 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!626993 () Bool)

(declare-fun res!404696 () Bool)

(assert (=> b!626993 (=> (not res!404696) (not e!359132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37888 (_ BitVec 32)) Bool)

(assert (=> b!626993 (= res!404696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!626994 () Bool)

(declare-fun res!404686 () Bool)

(assert (=> b!626994 (=> (not res!404686) (not e!359132))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!626994 (= res!404686 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18184 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18184 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!626995 () Bool)

(declare-fun res!404690 () Bool)

(assert (=> b!626995 (=> (not res!404690) (not e!359132))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37888 (_ BitVec 32)) SeekEntryResult!6624)

(assert (=> b!626995 (= res!404690 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18184 a!2986) j!136) a!2986 mask!3053) (Found!6624 j!136)))))

(declare-fun b!626996 () Bool)

(declare-fun res!404689 () Bool)

(assert (=> b!626996 (=> (not res!404689) (not e!359133))))

(assert (=> b!626996 (= res!404689 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56596 res!404691) b!626987))

(assert (= (and b!626987 res!404693) b!626991))

(assert (= (and b!626991 res!404687) b!626996))

(assert (= (and b!626996 res!404689) b!626988))

(assert (= (and b!626988 res!404694) b!626986))

(assert (= (and b!626986 res!404688) b!626993))

(assert (= (and b!626993 res!404696) b!626990))

(assert (= (and b!626990 res!404695) b!626994))

(assert (= (and b!626994 res!404686) b!626995))

(assert (= (and b!626995 res!404690) b!626992))

(assert (= (and b!626992 res!404692) b!626989))

(declare-fun m!602337 () Bool)

(assert (=> b!626992 m!602337))

(declare-fun m!602339 () Bool)

(assert (=> b!626992 m!602339))

(declare-fun m!602341 () Bool)

(assert (=> start!56596 m!602341))

(declare-fun m!602343 () Bool)

(assert (=> start!56596 m!602343))

(declare-fun m!602345 () Bool)

(assert (=> b!626994 m!602345))

(declare-fun m!602347 () Bool)

(assert (=> b!626994 m!602347))

(declare-fun m!602349 () Bool)

(assert (=> b!626994 m!602349))

(assert (=> b!626995 m!602339))

(assert (=> b!626995 m!602339))

(declare-fun m!602351 () Bool)

(assert (=> b!626995 m!602351))

(declare-fun m!602353 () Bool)

(assert (=> b!626993 m!602353))

(assert (=> b!626991 m!602339))

(assert (=> b!626991 m!602339))

(declare-fun m!602355 () Bool)

(assert (=> b!626991 m!602355))

(declare-fun m!602357 () Bool)

(assert (=> b!626989 m!602357))

(declare-fun m!602359 () Bool)

(assert (=> b!626990 m!602359))

(declare-fun m!602361 () Bool)

(assert (=> b!626988 m!602361))

(declare-fun m!602363 () Bool)

(assert (=> b!626986 m!602363))

(declare-fun m!602365 () Bool)

(assert (=> b!626996 m!602365))

(check-sat (not start!56596) (not b!626990) (not b!626989) (not b!626996) (not b!626986) (not b!626995) (not b!626991) (not b!626993) (not b!626988))
(check-sat)
