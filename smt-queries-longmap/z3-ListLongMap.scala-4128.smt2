; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56364 () Bool)

(assert start!56364)

(declare-fun b!624625 () Bool)

(declare-fun e!358209 () Bool)

(declare-fun e!358207 () Bool)

(assert (=> b!624625 (= e!358209 e!358207)))

(declare-fun res!402671 () Bool)

(assert (=> b!624625 (=> (not res!402671) (not e!358207))))

(declare-datatypes ((SeekEntryResult!6505 0))(
  ( (MissingZero!6505 (index!28304 (_ BitVec 32))) (Found!6505 (index!28305 (_ BitVec 32))) (Intermediate!6505 (undefined!7317 Bool) (index!28306 (_ BitVec 32)) (x!57215 (_ BitVec 32))) (Undefined!6505) (MissingVacant!6505 (index!28307 (_ BitVec 32))) )
))
(declare-fun lt!289693 () SeekEntryResult!6505)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624625 (= res!402671 (or (= lt!289693 (MissingZero!6505 i!1108)) (= lt!289693 (MissingVacant!6505 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!37734 0))(
  ( (array!37735 (arr!18109 (Array (_ BitVec 32) (_ BitVec 64))) (size!18473 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37734)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37734 (_ BitVec 32)) SeekEntryResult!6505)

(assert (=> b!624625 (= lt!289693 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624626 () Bool)

(assert (=> b!624626 (= e!358207 false)))

(declare-fun lt!289692 () Bool)

(declare-datatypes ((List!12057 0))(
  ( (Nil!12054) (Cons!12053 (h!13101 (_ BitVec 64)) (t!18277 List!12057)) )
))
(declare-fun arrayNoDuplicates!0 (array!37734 (_ BitVec 32) List!12057) Bool)

(assert (=> b!624626 (= lt!289692 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12054))))

(declare-fun b!624627 () Bool)

(declare-fun res!402673 () Bool)

(assert (=> b!624627 (=> (not res!402673) (not e!358207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37734 (_ BitVec 32)) Bool)

(assert (=> b!624627 (= res!402673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402672 () Bool)

(assert (=> start!56364 (=> (not res!402672) (not e!358209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56364 (= res!402672 (validMask!0 mask!3053))))

(assert (=> start!56364 e!358209))

(assert (=> start!56364 true))

(declare-fun array_inv!13968 (array!37734) Bool)

(assert (=> start!56364 (array_inv!13968 a!2986)))

(declare-fun b!624628 () Bool)

(declare-fun res!402670 () Bool)

(assert (=> b!624628 (=> (not res!402670) (not e!358209))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624628 (= res!402670 (validKeyInArray!0 (select (arr!18109 a!2986) j!136)))))

(declare-fun b!624629 () Bool)

(declare-fun res!402675 () Bool)

(assert (=> b!624629 (=> (not res!402675) (not e!358209))))

(assert (=> b!624629 (= res!402675 (validKeyInArray!0 k0!1786))))

(declare-fun b!624630 () Bool)

(declare-fun res!402676 () Bool)

(assert (=> b!624630 (=> (not res!402676) (not e!358209))))

(assert (=> b!624630 (= res!402676 (and (= (size!18473 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18473 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18473 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624631 () Bool)

(declare-fun res!402674 () Bool)

(assert (=> b!624631 (=> (not res!402674) (not e!358209))))

(declare-fun arrayContainsKey!0 (array!37734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624631 (= res!402674 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56364 res!402672) b!624630))

(assert (= (and b!624630 res!402676) b!624628))

(assert (= (and b!624628 res!402670) b!624629))

(assert (= (and b!624629 res!402675) b!624631))

(assert (= (and b!624631 res!402674) b!624625))

(assert (= (and b!624625 res!402671) b!624627))

(assert (= (and b!624627 res!402673) b!624626))

(declare-fun m!600607 () Bool)

(assert (=> b!624631 m!600607))

(declare-fun m!600609 () Bool)

(assert (=> start!56364 m!600609))

(declare-fun m!600611 () Bool)

(assert (=> start!56364 m!600611))

(declare-fun m!600613 () Bool)

(assert (=> b!624626 m!600613))

(declare-fun m!600615 () Bool)

(assert (=> b!624625 m!600615))

(declare-fun m!600617 () Bool)

(assert (=> b!624628 m!600617))

(assert (=> b!624628 m!600617))

(declare-fun m!600619 () Bool)

(assert (=> b!624628 m!600619))

(declare-fun m!600621 () Bool)

(assert (=> b!624629 m!600621))

(declare-fun m!600623 () Bool)

(assert (=> b!624627 m!600623))

(check-sat (not b!624629) (not b!624625) (not b!624631) (not b!624626) (not start!56364) (not b!624628) (not b!624627))
(check-sat)
