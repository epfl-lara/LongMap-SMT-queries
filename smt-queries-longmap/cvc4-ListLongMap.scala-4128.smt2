; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56318 () Bool)

(assert start!56318)

(declare-fun res!402608 () Bool)

(declare-fun e!358097 () Bool)

(assert (=> start!56318 (=> (not res!402608) (not e!358097))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56318 (= res!402608 (validMask!0 mask!3053))))

(assert (=> start!56318 e!358097))

(assert (=> start!56318 true))

(declare-datatypes ((array!37743 0))(
  ( (array!37744 (arr!18116 (Array (_ BitVec 32) (_ BitVec 64))) (size!18480 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37743)

(declare-fun array_inv!13912 (array!37743) Bool)

(assert (=> start!56318 (array_inv!13912 a!2986)))

(declare-fun b!624458 () Bool)

(declare-fun res!402614 () Bool)

(assert (=> b!624458 (=> (not res!402614) (not e!358097))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624458 (= res!402614 (and (= (size!18480 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18480 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18480 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624459 () Bool)

(declare-fun res!402609 () Bool)

(assert (=> b!624459 (=> (not res!402609) (not e!358097))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624459 (= res!402609 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624460 () Bool)

(declare-fun res!402612 () Bool)

(assert (=> b!624460 (=> (not res!402612) (not e!358097))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624460 (= res!402612 (validKeyInArray!0 k!1786))))

(declare-fun b!624461 () Bool)

(declare-fun e!358098 () Bool)

(assert (=> b!624461 (= e!358097 e!358098)))

(declare-fun res!402611 () Bool)

(assert (=> b!624461 (=> (not res!402611) (not e!358098))))

(declare-datatypes ((SeekEntryResult!6556 0))(
  ( (MissingZero!6556 (index!28508 (_ BitVec 32))) (Found!6556 (index!28509 (_ BitVec 32))) (Intermediate!6556 (undefined!7368 Bool) (index!28510 (_ BitVec 32)) (x!57263 (_ BitVec 32))) (Undefined!6556) (MissingVacant!6556 (index!28511 (_ BitVec 32))) )
))
(declare-fun lt!289603 () SeekEntryResult!6556)

(assert (=> b!624461 (= res!402611 (or (= lt!289603 (MissingZero!6556 i!1108)) (= lt!289603 (MissingVacant!6556 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37743 (_ BitVec 32)) SeekEntryResult!6556)

(assert (=> b!624461 (= lt!289603 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624462 () Bool)

(declare-fun res!402613 () Bool)

(assert (=> b!624462 (=> (not res!402613) (not e!358098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37743 (_ BitVec 32)) Bool)

(assert (=> b!624462 (= res!402613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624463 () Bool)

(assert (=> b!624463 (= e!358098 false)))

(declare-fun lt!289602 () Bool)

(declare-datatypes ((List!12157 0))(
  ( (Nil!12154) (Cons!12153 (h!13198 (_ BitVec 64)) (t!18385 List!12157)) )
))
(declare-fun arrayNoDuplicates!0 (array!37743 (_ BitVec 32) List!12157) Bool)

(assert (=> b!624463 (= lt!289602 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12154))))

(declare-fun b!624464 () Bool)

(declare-fun res!402610 () Bool)

(assert (=> b!624464 (=> (not res!402610) (not e!358097))))

(assert (=> b!624464 (= res!402610 (validKeyInArray!0 (select (arr!18116 a!2986) j!136)))))

(assert (= (and start!56318 res!402608) b!624458))

(assert (= (and b!624458 res!402614) b!624464))

(assert (= (and b!624464 res!402610) b!624460))

(assert (= (and b!624460 res!402612) b!624459))

(assert (= (and b!624459 res!402609) b!624461))

(assert (= (and b!624461 res!402611) b!624462))

(assert (= (and b!624462 res!402613) b!624463))

(declare-fun m!600161 () Bool)

(assert (=> start!56318 m!600161))

(declare-fun m!600163 () Bool)

(assert (=> start!56318 m!600163))

(declare-fun m!600165 () Bool)

(assert (=> b!624464 m!600165))

(assert (=> b!624464 m!600165))

(declare-fun m!600167 () Bool)

(assert (=> b!624464 m!600167))

(declare-fun m!600169 () Bool)

(assert (=> b!624459 m!600169))

(declare-fun m!600171 () Bool)

(assert (=> b!624463 m!600171))

(declare-fun m!600173 () Bool)

(assert (=> b!624462 m!600173))

(declare-fun m!600175 () Bool)

(assert (=> b!624461 m!600175))

(declare-fun m!600177 () Bool)

(assert (=> b!624460 m!600177))

(push 1)

(assert (not b!624463))

(assert (not b!624460))

(assert (not b!624464))

