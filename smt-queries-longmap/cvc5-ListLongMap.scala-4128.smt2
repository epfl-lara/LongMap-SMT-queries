; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56314 () Bool)

(assert start!56314)

(declare-fun b!624416 () Bool)

(declare-fun res!402570 () Bool)

(declare-fun e!358080 () Bool)

(assert (=> b!624416 (=> (not res!402570) (not e!358080))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624416 (= res!402570 (validKeyInArray!0 k!1786))))

(declare-fun b!624417 () Bool)

(declare-fun e!358078 () Bool)

(assert (=> b!624417 (= e!358078 false)))

(declare-fun lt!289591 () Bool)

(declare-datatypes ((array!37739 0))(
  ( (array!37740 (arr!18114 (Array (_ BitVec 32) (_ BitVec 64))) (size!18478 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37739)

(declare-datatypes ((List!12155 0))(
  ( (Nil!12152) (Cons!12151 (h!13196 (_ BitVec 64)) (t!18383 List!12155)) )
))
(declare-fun arrayNoDuplicates!0 (array!37739 (_ BitVec 32) List!12155) Bool)

(assert (=> b!624417 (= lt!289591 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12152))))

(declare-fun res!402572 () Bool)

(assert (=> start!56314 (=> (not res!402572) (not e!358080))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56314 (= res!402572 (validMask!0 mask!3053))))

(assert (=> start!56314 e!358080))

(assert (=> start!56314 true))

(declare-fun array_inv!13910 (array!37739) Bool)

(assert (=> start!56314 (array_inv!13910 a!2986)))

(declare-fun b!624418 () Bool)

(assert (=> b!624418 (= e!358080 e!358078)))

(declare-fun res!402568 () Bool)

(assert (=> b!624418 (=> (not res!402568) (not e!358078))))

(declare-datatypes ((SeekEntryResult!6554 0))(
  ( (MissingZero!6554 (index!28500 (_ BitVec 32))) (Found!6554 (index!28501 (_ BitVec 32))) (Intermediate!6554 (undefined!7366 Bool) (index!28502 (_ BitVec 32)) (x!57261 (_ BitVec 32))) (Undefined!6554) (MissingVacant!6554 (index!28503 (_ BitVec 32))) )
))
(declare-fun lt!289590 () SeekEntryResult!6554)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624418 (= res!402568 (or (= lt!289590 (MissingZero!6554 i!1108)) (= lt!289590 (MissingVacant!6554 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37739 (_ BitVec 32)) SeekEntryResult!6554)

(assert (=> b!624418 (= lt!289590 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!624419 () Bool)

(declare-fun res!402569 () Bool)

(assert (=> b!624419 (=> (not res!402569) (not e!358080))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624419 (= res!402569 (validKeyInArray!0 (select (arr!18114 a!2986) j!136)))))

(declare-fun b!624420 () Bool)

(declare-fun res!402567 () Bool)

(assert (=> b!624420 (=> (not res!402567) (not e!358080))))

(assert (=> b!624420 (= res!402567 (and (= (size!18478 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18478 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18478 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624421 () Bool)

(declare-fun res!402566 () Bool)

(assert (=> b!624421 (=> (not res!402566) (not e!358078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37739 (_ BitVec 32)) Bool)

(assert (=> b!624421 (= res!402566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624422 () Bool)

(declare-fun res!402571 () Bool)

(assert (=> b!624422 (=> (not res!402571) (not e!358080))))

(declare-fun arrayContainsKey!0 (array!37739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624422 (= res!402571 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!56314 res!402572) b!624420))

(assert (= (and b!624420 res!402567) b!624419))

(assert (= (and b!624419 res!402569) b!624416))

(assert (= (and b!624416 res!402570) b!624422))

(assert (= (and b!624422 res!402571) b!624418))

(assert (= (and b!624418 res!402568) b!624421))

(assert (= (and b!624421 res!402566) b!624417))

(declare-fun m!600125 () Bool)

(assert (=> b!624416 m!600125))

(declare-fun m!600127 () Bool)

(assert (=> b!624421 m!600127))

(declare-fun m!600129 () Bool)

(assert (=> b!624418 m!600129))

(declare-fun m!600131 () Bool)

(assert (=> start!56314 m!600131))

(declare-fun m!600133 () Bool)

(assert (=> start!56314 m!600133))

(declare-fun m!600135 () Bool)

(assert (=> b!624417 m!600135))

(declare-fun m!600137 () Bool)

(assert (=> b!624419 m!600137))

(assert (=> b!624419 m!600137))

(declare-fun m!600139 () Bool)

(assert (=> b!624419 m!600139))

(declare-fun m!600141 () Bool)

(assert (=> b!624422 m!600141))

(push 1)

