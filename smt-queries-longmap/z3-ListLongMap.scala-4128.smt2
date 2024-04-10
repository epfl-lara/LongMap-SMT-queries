; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56316 () Bool)

(assert start!56316)

(declare-fun res!402591 () Bool)

(declare-fun e!358088 () Bool)

(assert (=> start!56316 (=> (not res!402591) (not e!358088))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56316 (= res!402591 (validMask!0 mask!3053))))

(assert (=> start!56316 e!358088))

(assert (=> start!56316 true))

(declare-datatypes ((array!37741 0))(
  ( (array!37742 (arr!18115 (Array (_ BitVec 32) (_ BitVec 64))) (size!18479 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37741)

(declare-fun array_inv!13911 (array!37741) Bool)

(assert (=> start!56316 (array_inv!13911 a!2986)))

(declare-fun b!624437 () Bool)

(declare-fun res!402587 () Bool)

(declare-fun e!358089 () Bool)

(assert (=> b!624437 (=> (not res!402587) (not e!358089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37741 (_ BitVec 32)) Bool)

(assert (=> b!624437 (= res!402587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624438 () Bool)

(declare-fun res!402592 () Bool)

(assert (=> b!624438 (=> (not res!402592) (not e!358088))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624438 (= res!402592 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624439 () Bool)

(declare-fun res!402589 () Bool)

(assert (=> b!624439 (=> (not res!402589) (not e!358088))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624439 (= res!402589 (validKeyInArray!0 (select (arr!18115 a!2986) j!136)))))

(declare-fun b!624440 () Bool)

(assert (=> b!624440 (= e!358089 false)))

(declare-fun lt!289597 () Bool)

(declare-datatypes ((List!12156 0))(
  ( (Nil!12153) (Cons!12152 (h!13197 (_ BitVec 64)) (t!18384 List!12156)) )
))
(declare-fun arrayNoDuplicates!0 (array!37741 (_ BitVec 32) List!12156) Bool)

(assert (=> b!624440 (= lt!289597 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12153))))

(declare-fun b!624441 () Bool)

(declare-fun res!402588 () Bool)

(assert (=> b!624441 (=> (not res!402588) (not e!358088))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624441 (= res!402588 (and (= (size!18479 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18479 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18479 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624442 () Bool)

(assert (=> b!624442 (= e!358088 e!358089)))

(declare-fun res!402593 () Bool)

(assert (=> b!624442 (=> (not res!402593) (not e!358089))))

(declare-datatypes ((SeekEntryResult!6555 0))(
  ( (MissingZero!6555 (index!28504 (_ BitVec 32))) (Found!6555 (index!28505 (_ BitVec 32))) (Intermediate!6555 (undefined!7367 Bool) (index!28506 (_ BitVec 32)) (x!57262 (_ BitVec 32))) (Undefined!6555) (MissingVacant!6555 (index!28507 (_ BitVec 32))) )
))
(declare-fun lt!289596 () SeekEntryResult!6555)

(assert (=> b!624442 (= res!402593 (or (= lt!289596 (MissingZero!6555 i!1108)) (= lt!289596 (MissingVacant!6555 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37741 (_ BitVec 32)) SeekEntryResult!6555)

(assert (=> b!624442 (= lt!289596 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624443 () Bool)

(declare-fun res!402590 () Bool)

(assert (=> b!624443 (=> (not res!402590) (not e!358088))))

(assert (=> b!624443 (= res!402590 (validKeyInArray!0 k0!1786))))

(assert (= (and start!56316 res!402591) b!624441))

(assert (= (and b!624441 res!402588) b!624439))

(assert (= (and b!624439 res!402589) b!624443))

(assert (= (and b!624443 res!402590) b!624438))

(assert (= (and b!624438 res!402592) b!624442))

(assert (= (and b!624442 res!402593) b!624437))

(assert (= (and b!624437 res!402587) b!624440))

(declare-fun m!600143 () Bool)

(assert (=> b!624438 m!600143))

(declare-fun m!600145 () Bool)

(assert (=> b!624439 m!600145))

(assert (=> b!624439 m!600145))

(declare-fun m!600147 () Bool)

(assert (=> b!624439 m!600147))

(declare-fun m!600149 () Bool)

(assert (=> b!624437 m!600149))

(declare-fun m!600151 () Bool)

(assert (=> b!624443 m!600151))

(declare-fun m!600153 () Bool)

(assert (=> start!56316 m!600153))

(declare-fun m!600155 () Bool)

(assert (=> start!56316 m!600155))

(declare-fun m!600157 () Bool)

(assert (=> b!624440 m!600157))

(declare-fun m!600159 () Bool)

(assert (=> b!624442 m!600159))

(check-sat (not b!624442) (not b!624437) (not b!624440) (not b!624443) (not start!56316) (not b!624438) (not b!624439))
(check-sat)
