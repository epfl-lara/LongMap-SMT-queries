; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56304 () Bool)

(assert start!56304)

(declare-fun b!624302 () Bool)

(declare-fun e!358034 () Bool)

(assert (=> b!624302 (= e!358034 false)))

(declare-fun lt!289570 () Bool)

(declare-datatypes ((array!37729 0))(
  ( (array!37730 (arr!18109 (Array (_ BitVec 32) (_ BitVec 64))) (size!18473 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37729)

(declare-datatypes ((List!12150 0))(
  ( (Nil!12147) (Cons!12146 (h!13191 (_ BitVec 64)) (t!18378 List!12150)) )
))
(declare-fun arrayNoDuplicates!0 (array!37729 (_ BitVec 32) List!12150) Bool)

(assert (=> b!624302 (= lt!289570 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12147))))

(declare-fun b!624303 () Bool)

(declare-fun res!402455 () Bool)

(declare-fun e!358035 () Bool)

(assert (=> b!624303 (=> (not res!402455) (not e!358035))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624303 (= res!402455 (validKeyInArray!0 (select (arr!18109 a!2986) j!136)))))

(declare-fun res!402457 () Bool)

(assert (=> start!56304 (=> (not res!402457) (not e!358035))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56304 (= res!402457 (validMask!0 mask!3053))))

(assert (=> start!56304 e!358035))

(assert (=> start!56304 true))

(declare-fun array_inv!13905 (array!37729) Bool)

(assert (=> start!56304 (array_inv!13905 a!2986)))

(declare-fun b!624304 () Bool)

(declare-fun res!402458 () Bool)

(assert (=> b!624304 (=> (not res!402458) (not e!358034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37729 (_ BitVec 32)) Bool)

(assert (=> b!624304 (= res!402458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624305 () Bool)

(declare-fun res!402454 () Bool)

(assert (=> b!624305 (=> (not res!402454) (not e!358035))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624305 (= res!402454 (and (= (size!18473 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18473 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18473 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624306 () Bool)

(assert (=> b!624306 (= e!358035 e!358034)))

(declare-fun res!402456 () Bool)

(assert (=> b!624306 (=> (not res!402456) (not e!358034))))

(declare-datatypes ((SeekEntryResult!6549 0))(
  ( (MissingZero!6549 (index!28480 (_ BitVec 32))) (Found!6549 (index!28481 (_ BitVec 32))) (Intermediate!6549 (undefined!7361 Bool) (index!28482 (_ BitVec 32)) (x!57240 (_ BitVec 32))) (Undefined!6549) (MissingVacant!6549 (index!28483 (_ BitVec 32))) )
))
(declare-fun lt!289569 () SeekEntryResult!6549)

(assert (=> b!624306 (= res!402456 (or (= lt!289569 (MissingZero!6549 i!1108)) (= lt!289569 (MissingVacant!6549 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37729 (_ BitVec 32)) SeekEntryResult!6549)

(assert (=> b!624306 (= lt!289569 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624307 () Bool)

(declare-fun res!402453 () Bool)

(assert (=> b!624307 (=> (not res!402453) (not e!358035))))

(assert (=> b!624307 (= res!402453 (validKeyInArray!0 k0!1786))))

(declare-fun b!624308 () Bool)

(declare-fun res!402452 () Bool)

(assert (=> b!624308 (=> (not res!402452) (not e!358035))))

(declare-fun arrayContainsKey!0 (array!37729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624308 (= res!402452 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56304 res!402457) b!624305))

(assert (= (and b!624305 res!402454) b!624303))

(assert (= (and b!624303 res!402455) b!624307))

(assert (= (and b!624307 res!402453) b!624308))

(assert (= (and b!624308 res!402452) b!624306))

(assert (= (and b!624306 res!402456) b!624304))

(assert (= (and b!624304 res!402458) b!624302))

(declare-fun m!600029 () Bool)

(assert (=> b!624306 m!600029))

(declare-fun m!600031 () Bool)

(assert (=> start!56304 m!600031))

(declare-fun m!600033 () Bool)

(assert (=> start!56304 m!600033))

(declare-fun m!600035 () Bool)

(assert (=> b!624302 m!600035))

(declare-fun m!600037 () Bool)

(assert (=> b!624308 m!600037))

(declare-fun m!600039 () Bool)

(assert (=> b!624304 m!600039))

(declare-fun m!600041 () Bool)

(assert (=> b!624303 m!600041))

(assert (=> b!624303 m!600041))

(declare-fun m!600043 () Bool)

(assert (=> b!624303 m!600043))

(declare-fun m!600045 () Bool)

(assert (=> b!624307 m!600045))

(check-sat (not b!624308) (not b!624304) (not b!624303) (not start!56304) (not b!624302) (not b!624307) (not b!624306))
(check-sat)
