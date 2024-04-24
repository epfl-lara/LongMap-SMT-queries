; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56694 () Bool)

(assert start!56694)

(declare-fun b!627954 () Bool)

(declare-fun e!359468 () Bool)

(declare-fun e!359467 () Bool)

(assert (=> b!627954 (= e!359468 e!359467)))

(declare-fun res!405558 () Bool)

(assert (=> b!627954 (=> (not res!405558) (not e!359467))))

(declare-datatypes ((SeekEntryResult!6598 0))(
  ( (MissingZero!6598 (index!28676 (_ BitVec 32))) (Found!6598 (index!28677 (_ BitVec 32))) (Intermediate!6598 (undefined!7410 Bool) (index!28678 (_ BitVec 32)) (x!57565 (_ BitVec 32))) (Undefined!6598) (MissingVacant!6598 (index!28679 (_ BitVec 32))) )
))
(declare-fun lt!290437 () SeekEntryResult!6598)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627954 (= res!405558 (or (= lt!290437 (MissingZero!6598 i!1108)) (= lt!290437 (MissingVacant!6598 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37929 0))(
  ( (array!37930 (arr!18202 (Array (_ BitVec 32) (_ BitVec 64))) (size!18566 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37929)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37929 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!627954 (= lt!290437 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627955 () Bool)

(declare-fun res!405551 () Bool)

(assert (=> b!627955 (=> (not res!405551) (not e!359468))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!627955 (= res!405551 (and (= (size!18566 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18566 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18566 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!627956 () Bool)

(declare-fun res!405550 () Bool)

(assert (=> b!627956 (=> (not res!405550) (not e!359467))))

(declare-datatypes ((List!12150 0))(
  ( (Nil!12147) (Cons!12146 (h!13194 (_ BitVec 64)) (t!18370 List!12150)) )
))
(declare-fun arrayNoDuplicates!0 (array!37929 (_ BitVec 32) List!12150) Bool)

(assert (=> b!627956 (= res!405550 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12147))))

(declare-fun b!627957 () Bool)

(declare-fun res!405554 () Bool)

(assert (=> b!627957 (=> (not res!405554) (not e!359468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627957 (= res!405554 (validKeyInArray!0 k0!1786))))

(declare-fun b!627958 () Bool)

(declare-fun res!405559 () Bool)

(assert (=> b!627958 (=> (not res!405559) (not e!359467))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37929 (_ BitVec 32)) SeekEntryResult!6598)

(assert (=> b!627958 (= res!405559 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18202 a!2986) j!136) a!2986 mask!3053) (Found!6598 j!136)))))

(declare-fun b!627959 () Bool)

(declare-fun res!405549 () Bool)

(assert (=> b!627959 (=> (not res!405549) (not e!359468))))

(declare-fun arrayContainsKey!0 (array!37929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627959 (= res!405549 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627960 () Bool)

(assert (=> b!627960 (= e!359467 false)))

(declare-fun lt!290436 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627960 (= lt!290436 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!405555 () Bool)

(assert (=> start!56694 (=> (not res!405555) (not e!359468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56694 (= res!405555 (validMask!0 mask!3053))))

(assert (=> start!56694 e!359468))

(assert (=> start!56694 true))

(declare-fun array_inv!14061 (array!37929) Bool)

(assert (=> start!56694 (array_inv!14061 a!2986)))

(declare-fun b!627961 () Bool)

(declare-fun res!405557 () Bool)

(assert (=> b!627961 (=> (not res!405557) (not e!359468))))

(assert (=> b!627961 (= res!405557 (validKeyInArray!0 (select (arr!18202 a!2986) j!136)))))

(declare-fun b!627962 () Bool)

(declare-fun res!405556 () Bool)

(assert (=> b!627962 (=> (not res!405556) (not e!359467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37929 (_ BitVec 32)) Bool)

(assert (=> b!627962 (= res!405556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627963 () Bool)

(declare-fun res!405553 () Bool)

(assert (=> b!627963 (=> (not res!405553) (not e!359467))))

(assert (=> b!627963 (= res!405553 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18202 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18202 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627964 () Bool)

(declare-fun res!405552 () Bool)

(assert (=> b!627964 (=> (not res!405552) (not e!359467))))

(assert (=> b!627964 (= res!405552 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18202 a!2986) index!984) (select (arr!18202 a!2986) j!136))) (not (= (select (arr!18202 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (= (and start!56694 res!405555) b!627955))

(assert (= (and b!627955 res!405551) b!627961))

(assert (= (and b!627961 res!405557) b!627957))

(assert (= (and b!627957 res!405554) b!627959))

(assert (= (and b!627959 res!405549) b!627954))

(assert (= (and b!627954 res!405558) b!627962))

(assert (= (and b!627962 res!405556) b!627956))

(assert (= (and b!627956 res!405550) b!627963))

(assert (= (and b!627963 res!405553) b!627958))

(assert (= (and b!627958 res!405559) b!627964))

(assert (= (and b!627964 res!405552) b!627960))

(declare-fun m!603517 () Bool)

(assert (=> b!627962 m!603517))

(declare-fun m!603519 () Bool)

(assert (=> b!627954 m!603519))

(declare-fun m!603521 () Bool)

(assert (=> b!627956 m!603521))

(declare-fun m!603523 () Bool)

(assert (=> b!627957 m!603523))

(declare-fun m!603525 () Bool)

(assert (=> start!56694 m!603525))

(declare-fun m!603527 () Bool)

(assert (=> start!56694 m!603527))

(declare-fun m!603529 () Bool)

(assert (=> b!627959 m!603529))

(declare-fun m!603531 () Bool)

(assert (=> b!627963 m!603531))

(declare-fun m!603533 () Bool)

(assert (=> b!627963 m!603533))

(declare-fun m!603535 () Bool)

(assert (=> b!627963 m!603535))

(declare-fun m!603537 () Bool)

(assert (=> b!627964 m!603537))

(declare-fun m!603539 () Bool)

(assert (=> b!627964 m!603539))

(declare-fun m!603541 () Bool)

(assert (=> b!627960 m!603541))

(assert (=> b!627958 m!603539))

(assert (=> b!627958 m!603539))

(declare-fun m!603543 () Bool)

(assert (=> b!627958 m!603543))

(assert (=> b!627961 m!603539))

(assert (=> b!627961 m!603539))

(declare-fun m!603545 () Bool)

(assert (=> b!627961 m!603545))

(check-sat (not b!627957) (not b!627961) (not b!627956) (not b!627962) (not b!627959) (not b!627954) (not b!627960) (not start!56694) (not b!627958))
(check-sat)
