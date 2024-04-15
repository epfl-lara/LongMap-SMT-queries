; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56640 () Bool)

(assert start!56640)

(declare-fun b!627672 () Bool)

(declare-fun res!405520 () Bool)

(declare-fun e!359220 () Bool)

(assert (=> b!627672 (=> (not res!405520) (not e!359220))))

(declare-datatypes ((array!37944 0))(
  ( (array!37945 (arr!18212 (Array (_ BitVec 32) (_ BitVec 64))) (size!18577 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37944)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627672 (= res!405520 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627673 () Bool)

(declare-fun e!359218 () Bool)

(assert (=> b!627673 (= e!359220 e!359218)))

(declare-fun res!405524 () Bool)

(assert (=> b!627673 (=> (not res!405524) (not e!359218))))

(declare-datatypes ((SeekEntryResult!6649 0))(
  ( (MissingZero!6649 (index!28880 (_ BitVec 32))) (Found!6649 (index!28881 (_ BitVec 32))) (Intermediate!6649 (undefined!7461 Bool) (index!28882 (_ BitVec 32)) (x!57624 (_ BitVec 32))) (Undefined!6649) (MissingVacant!6649 (index!28883 (_ BitVec 32))) )
))
(declare-fun lt!290137 () SeekEntryResult!6649)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627673 (= res!405524 (or (= lt!290137 (MissingZero!6649 i!1108)) (= lt!290137 (MissingVacant!6649 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37944 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!627673 (= lt!290137 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627674 () Bool)

(declare-fun res!405523 () Bool)

(assert (=> b!627674 (=> (not res!405523) (not e!359220))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627674 (= res!405523 (validKeyInArray!0 k0!1786))))

(declare-fun b!627675 () Bool)

(declare-fun res!405517 () Bool)

(assert (=> b!627675 (=> (not res!405517) (not e!359220))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627675 (= res!405517 (and (= (size!18577 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18577 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18577 a!2986)) (not (= i!1108 j!136))))))

(declare-fun res!405519 () Bool)

(assert (=> start!56640 (=> (not res!405519) (not e!359220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56640 (= res!405519 (validMask!0 mask!3053))))

(assert (=> start!56640 e!359220))

(assert (=> start!56640 true))

(declare-fun array_inv!14095 (array!37944) Bool)

(assert (=> start!56640 (array_inv!14095 a!2986)))

(declare-fun b!627676 () Bool)

(assert (=> b!627676 (= e!359218 false)))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!290136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627676 (= lt!290136 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!627677 () Bool)

(declare-fun res!405521 () Bool)

(assert (=> b!627677 (=> (not res!405521) (not e!359220))))

(assert (=> b!627677 (= res!405521 (validKeyInArray!0 (select (arr!18212 a!2986) j!136)))))

(declare-fun b!627678 () Bool)

(declare-fun res!405516 () Bool)

(assert (=> b!627678 (=> (not res!405516) (not e!359218))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!627678 (= res!405516 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18212 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18212 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627679 () Bool)

(declare-fun res!405515 () Bool)

(assert (=> b!627679 (=> (not res!405515) (not e!359218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37944 (_ BitVec 32)) Bool)

(assert (=> b!627679 (= res!405515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627680 () Bool)

(declare-fun res!405518 () Bool)

(assert (=> b!627680 (=> (not res!405518) (not e!359218))))

(declare-datatypes ((List!12292 0))(
  ( (Nil!12289) (Cons!12288 (h!13333 (_ BitVec 64)) (t!18511 List!12292)) )
))
(declare-fun arrayNoDuplicates!0 (array!37944 (_ BitVec 32) List!12292) Bool)

(assert (=> b!627680 (= res!405518 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12289))))

(declare-fun b!627681 () Bool)

(declare-fun res!405522 () Bool)

(assert (=> b!627681 (=> (not res!405522) (not e!359218))))

(assert (=> b!627681 (= res!405522 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18212 a!2986) index!984) (select (arr!18212 a!2986) j!136))) (not (= (select (arr!18212 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627682 () Bool)

(declare-fun res!405514 () Bool)

(assert (=> b!627682 (=> (not res!405514) (not e!359218))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37944 (_ BitVec 32)) SeekEntryResult!6649)

(assert (=> b!627682 (= res!405514 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18212 a!2986) j!136) a!2986 mask!3053) (Found!6649 j!136)))))

(assert (= (and start!56640 res!405519) b!627675))

(assert (= (and b!627675 res!405517) b!627677))

(assert (= (and b!627677 res!405521) b!627674))

(assert (= (and b!627674 res!405523) b!627672))

(assert (= (and b!627672 res!405520) b!627673))

(assert (= (and b!627673 res!405524) b!627679))

(assert (= (and b!627679 res!405515) b!627680))

(assert (= (and b!627680 res!405518) b!627678))

(assert (= (and b!627678 res!405516) b!627682))

(assert (= (and b!627682 res!405514) b!627681))

(assert (= (and b!627681 res!405522) b!627676))

(declare-fun m!602443 () Bool)

(assert (=> b!627676 m!602443))

(declare-fun m!602445 () Bool)

(assert (=> b!627674 m!602445))

(declare-fun m!602447 () Bool)

(assert (=> b!627673 m!602447))

(declare-fun m!602449 () Bool)

(assert (=> b!627682 m!602449))

(assert (=> b!627682 m!602449))

(declare-fun m!602451 () Bool)

(assert (=> b!627682 m!602451))

(declare-fun m!602453 () Bool)

(assert (=> start!56640 m!602453))

(declare-fun m!602455 () Bool)

(assert (=> start!56640 m!602455))

(declare-fun m!602457 () Bool)

(assert (=> b!627678 m!602457))

(declare-fun m!602459 () Bool)

(assert (=> b!627678 m!602459))

(declare-fun m!602461 () Bool)

(assert (=> b!627678 m!602461))

(declare-fun m!602463 () Bool)

(assert (=> b!627681 m!602463))

(assert (=> b!627681 m!602449))

(declare-fun m!602465 () Bool)

(assert (=> b!627679 m!602465))

(declare-fun m!602467 () Bool)

(assert (=> b!627680 m!602467))

(assert (=> b!627677 m!602449))

(assert (=> b!627677 m!602449))

(declare-fun m!602469 () Bool)

(assert (=> b!627677 m!602469))

(declare-fun m!602471 () Bool)

(assert (=> b!627672 m!602471))

(check-sat (not b!627673) (not b!627679) (not b!627676) (not b!627677) (not b!627672) (not b!627680) (not b!627682) (not start!56640) (not b!627674))
(check-sat)
