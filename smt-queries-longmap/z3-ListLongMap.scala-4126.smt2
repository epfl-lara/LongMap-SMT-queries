; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56352 () Bool)

(assert start!56352)

(declare-fun b!624490 () Bool)

(declare-fun res!402540 () Bool)

(declare-fun e!358153 () Bool)

(assert (=> b!624490 (=> (not res!402540) (not e!358153))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624490 (= res!402540 (validKeyInArray!0 k0!1786))))

(declare-fun b!624491 () Bool)

(declare-fun res!402535 () Bool)

(assert (=> b!624491 (=> (not res!402535) (not e!358153))))

(declare-datatypes ((array!37722 0))(
  ( (array!37723 (arr!18103 (Array (_ BitVec 32) (_ BitVec 64))) (size!18467 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37722)

(declare-fun arrayContainsKey!0 (array!37722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624491 (= res!402535 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!402537 () Bool)

(assert (=> start!56352 (=> (not res!402537) (not e!358153))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56352 (= res!402537 (validMask!0 mask!3053))))

(assert (=> start!56352 e!358153))

(assert (=> start!56352 true))

(declare-fun array_inv!13962 (array!37722) Bool)

(assert (=> start!56352 (array_inv!13962 a!2986)))

(declare-fun b!624492 () Bool)

(declare-fun e!358154 () Bool)

(assert (=> b!624492 (= e!358154 false)))

(declare-fun lt!289665 () Bool)

(declare-datatypes ((List!12051 0))(
  ( (Nil!12048) (Cons!12047 (h!13095 (_ BitVec 64)) (t!18271 List!12051)) )
))
(declare-fun arrayNoDuplicates!0 (array!37722 (_ BitVec 32) List!12051) Bool)

(assert (=> b!624492 (= lt!289665 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12048))))

(declare-fun b!624493 () Bool)

(declare-fun res!402538 () Bool)

(assert (=> b!624493 (=> (not res!402538) (not e!358154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37722 (_ BitVec 32)) Bool)

(assert (=> b!624493 (= res!402538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624494 () Bool)

(assert (=> b!624494 (= e!358153 e!358154)))

(declare-fun res!402536 () Bool)

(assert (=> b!624494 (=> (not res!402536) (not e!358154))))

(declare-datatypes ((SeekEntryResult!6499 0))(
  ( (MissingZero!6499 (index!28280 (_ BitVec 32))) (Found!6499 (index!28281 (_ BitVec 32))) (Intermediate!6499 (undefined!7311 Bool) (index!28282 (_ BitVec 32)) (x!57193 (_ BitVec 32))) (Undefined!6499) (MissingVacant!6499 (index!28283 (_ BitVec 32))) )
))
(declare-fun lt!289666 () SeekEntryResult!6499)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624494 (= res!402536 (or (= lt!289666 (MissingZero!6499 i!1108)) (= lt!289666 (MissingVacant!6499 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37722 (_ BitVec 32)) SeekEntryResult!6499)

(assert (=> b!624494 (= lt!289666 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624495 () Bool)

(declare-fun res!402539 () Bool)

(assert (=> b!624495 (=> (not res!402539) (not e!358153))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624495 (= res!402539 (and (= (size!18467 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18467 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18467 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624496 () Bool)

(declare-fun res!402541 () Bool)

(assert (=> b!624496 (=> (not res!402541) (not e!358153))))

(assert (=> b!624496 (= res!402541 (validKeyInArray!0 (select (arr!18103 a!2986) j!136)))))

(assert (= (and start!56352 res!402537) b!624495))

(assert (= (and b!624495 res!402539) b!624496))

(assert (= (and b!624496 res!402541) b!624490))

(assert (= (and b!624490 res!402540) b!624491))

(assert (= (and b!624491 res!402535) b!624494))

(assert (= (and b!624494 res!402536) b!624493))

(assert (= (and b!624493 res!402538) b!624492))

(declare-fun m!600493 () Bool)

(assert (=> b!624494 m!600493))

(declare-fun m!600495 () Bool)

(assert (=> b!624490 m!600495))

(declare-fun m!600497 () Bool)

(assert (=> b!624496 m!600497))

(assert (=> b!624496 m!600497))

(declare-fun m!600499 () Bool)

(assert (=> b!624496 m!600499))

(declare-fun m!600501 () Bool)

(assert (=> b!624491 m!600501))

(declare-fun m!600503 () Bool)

(assert (=> b!624492 m!600503))

(declare-fun m!600505 () Bool)

(assert (=> b!624493 m!600505))

(declare-fun m!600507 () Bool)

(assert (=> start!56352 m!600507))

(declare-fun m!600509 () Bool)

(assert (=> start!56352 m!600509))

(check-sat (not b!624491) (not start!56352) (not b!624494) (not b!624496) (not b!624492) (not b!624490) (not b!624493))
(check-sat)
