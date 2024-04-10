; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53228 () Bool)

(assert start!53228)

(declare-fun res!366401 () Bool)

(declare-fun e!332717 () Bool)

(assert (=> start!53228 (=> (not res!366401) (not e!332717))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53228 (= res!366401 (validMask!0 mask!3053))))

(assert (=> start!53228 e!332717))

(assert (=> start!53228 true))

(declare-datatypes ((array!36129 0))(
  ( (array!36130 (arr!17339 (Array (_ BitVec 32) (_ BitVec 64))) (size!17703 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36129)

(declare-fun array_inv!13135 (array!36129) Bool)

(assert (=> start!53228 (array_inv!13135 a!2986)))

(declare-fun b!578585 () Bool)

(declare-fun res!366404 () Bool)

(assert (=> b!578585 (=> (not res!366404) (not e!332717))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!578585 (= res!366404 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!578586 () Bool)

(declare-fun res!366405 () Bool)

(assert (=> b!578586 (=> (not res!366405) (not e!332717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!578586 (= res!366405 (validKeyInArray!0 k!1786))))

(declare-fun b!578587 () Bool)

(declare-fun res!366407 () Bool)

(declare-fun e!332718 () Bool)

(assert (=> b!578587 (=> (not res!366407) (not e!332718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36129 (_ BitVec 32)) Bool)

(assert (=> b!578587 (= res!366407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!578588 () Bool)

(declare-fun res!366402 () Bool)

(assert (=> b!578588 (=> (not res!366402) (not e!332717))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!578588 (= res!366402 (and (= (size!17703 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17703 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17703 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!578589 () Bool)

(declare-fun res!366403 () Bool)

(assert (=> b!578589 (=> (not res!366403) (not e!332717))))

(assert (=> b!578589 (= res!366403 (validKeyInArray!0 (select (arr!17339 a!2986) j!136)))))

(declare-fun b!578590 () Bool)

(assert (=> b!578590 (= e!332718 false)))

(declare-fun lt!264303 () Bool)

(declare-datatypes ((List!11380 0))(
  ( (Nil!11377) (Cons!11376 (h!12421 (_ BitVec 64)) (t!17608 List!11380)) )
))
(declare-fun arrayNoDuplicates!0 (array!36129 (_ BitVec 32) List!11380) Bool)

(assert (=> b!578590 (= lt!264303 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11377))))

(declare-fun b!578591 () Bool)

(assert (=> b!578591 (= e!332717 e!332718)))

(declare-fun res!366406 () Bool)

(assert (=> b!578591 (=> (not res!366406) (not e!332718))))

(declare-datatypes ((SeekEntryResult!5779 0))(
  ( (MissingZero!5779 (index!25343 (_ BitVec 32))) (Found!5779 (index!25344 (_ BitVec 32))) (Intermediate!5779 (undefined!6591 Bool) (index!25345 (_ BitVec 32)) (x!54240 (_ BitVec 32))) (Undefined!5779) (MissingVacant!5779 (index!25346 (_ BitVec 32))) )
))
(declare-fun lt!264304 () SeekEntryResult!5779)

(assert (=> b!578591 (= res!366406 (or (= lt!264304 (MissingZero!5779 i!1108)) (= lt!264304 (MissingVacant!5779 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36129 (_ BitVec 32)) SeekEntryResult!5779)

(assert (=> b!578591 (= lt!264304 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!53228 res!366401) b!578588))

(assert (= (and b!578588 res!366402) b!578589))

(assert (= (and b!578589 res!366403) b!578586))

(assert (= (and b!578586 res!366405) b!578585))

(assert (= (and b!578585 res!366404) b!578591))

(assert (= (and b!578591 res!366406) b!578587))

(assert (= (and b!578587 res!366407) b!578590))

(declare-fun m!557251 () Bool)

(assert (=> b!578590 m!557251))

(declare-fun m!557253 () Bool)

(assert (=> b!578585 m!557253))

(declare-fun m!557255 () Bool)

(assert (=> b!578591 m!557255))

(declare-fun m!557257 () Bool)

(assert (=> b!578589 m!557257))

(assert (=> b!578589 m!557257))

(declare-fun m!557259 () Bool)

(assert (=> b!578589 m!557259))

(declare-fun m!557261 () Bool)

(assert (=> b!578586 m!557261))

(declare-fun m!557263 () Bool)

(assert (=> b!578587 m!557263))

(declare-fun m!557265 () Bool)

(assert (=> start!53228 m!557265))

(declare-fun m!557267 () Bool)

(assert (=> start!53228 m!557267))

(push 1)

(assert (not b!578586))

(assert (not b!578589))

(assert (not b!578587))

(assert (not b!578590))

(assert (not b!578591))

(assert (not start!53228))

(assert (not b!578585))

