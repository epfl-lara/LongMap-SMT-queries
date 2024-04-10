; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53034 () Bool)

(assert start!53034)

(declare-fun b!577443 () Bool)

(declare-fun res!365479 () Bool)

(declare-fun e!332126 () Bool)

(assert (=> b!577443 (=> (not res!365479) (not e!332126))))

(declare-datatypes ((array!36052 0))(
  ( (array!36053 (arr!17305 (Array (_ BitVec 32) (_ BitVec 64))) (size!17669 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36052)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36052 (_ BitVec 32)) Bool)

(assert (=> b!577443 (= res!365479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577444 () Bool)

(declare-fun e!332125 () Bool)

(assert (=> b!577444 (= e!332125 e!332126)))

(declare-fun res!365480 () Bool)

(assert (=> b!577444 (=> (not res!365480) (not e!332126))))

(declare-datatypes ((SeekEntryResult!5745 0))(
  ( (MissingZero!5745 (index!25207 (_ BitVec 32))) (Found!5745 (index!25208 (_ BitVec 32))) (Intermediate!5745 (undefined!6557 Bool) (index!25209 (_ BitVec 32)) (x!54118 (_ BitVec 32))) (Undefined!5745) (MissingVacant!5745 (index!25210 (_ BitVec 32))) )
))
(declare-fun lt!263965 () SeekEntryResult!5745)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577444 (= res!365480 (or (= lt!263965 (MissingZero!5745 i!1108)) (= lt!263965 (MissingVacant!5745 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36052 (_ BitVec 32)) SeekEntryResult!5745)

(assert (=> b!577444 (= lt!263965 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577445 () Bool)

(assert (=> b!577445 (= e!332126 (bvsgt #b00000000000000000000000000000000 (size!17669 a!2986)))))

(declare-fun b!577446 () Bool)

(declare-fun res!365477 () Bool)

(assert (=> b!577446 (=> (not res!365477) (not e!332125))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577446 (= res!365477 (and (= (size!17669 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17669 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17669 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577442 () Bool)

(declare-fun res!365476 () Bool)

(assert (=> b!577442 (=> (not res!365476) (not e!332125))))

(declare-fun arrayContainsKey!0 (array!36052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577442 (= res!365476 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365475 () Bool)

(assert (=> start!53034 (=> (not res!365475) (not e!332125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53034 (= res!365475 (validMask!0 mask!3053))))

(assert (=> start!53034 e!332125))

(assert (=> start!53034 true))

(declare-fun array_inv!13101 (array!36052) Bool)

(assert (=> start!53034 (array_inv!13101 a!2986)))

(declare-fun b!577447 () Bool)

(declare-fun res!365478 () Bool)

(assert (=> b!577447 (=> (not res!365478) (not e!332125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577447 (= res!365478 (validKeyInArray!0 (select (arr!17305 a!2986) j!136)))))

(declare-fun b!577448 () Bool)

(declare-fun res!365474 () Bool)

(assert (=> b!577448 (=> (not res!365474) (not e!332125))))

(assert (=> b!577448 (= res!365474 (validKeyInArray!0 k0!1786))))

(assert (= (and start!53034 res!365475) b!577446))

(assert (= (and b!577446 res!365477) b!577447))

(assert (= (and b!577447 res!365478) b!577448))

(assert (= (and b!577448 res!365474) b!577442))

(assert (= (and b!577442 res!365476) b!577444))

(assert (= (and b!577444 res!365480) b!577443))

(assert (= (and b!577443 res!365479) b!577445))

(declare-fun m!556327 () Bool)

(assert (=> b!577442 m!556327))

(declare-fun m!556329 () Bool)

(assert (=> b!577444 m!556329))

(declare-fun m!556331 () Bool)

(assert (=> b!577448 m!556331))

(declare-fun m!556333 () Bool)

(assert (=> b!577447 m!556333))

(assert (=> b!577447 m!556333))

(declare-fun m!556335 () Bool)

(assert (=> b!577447 m!556335))

(declare-fun m!556337 () Bool)

(assert (=> start!53034 m!556337))

(declare-fun m!556339 () Bool)

(assert (=> start!53034 m!556339))

(declare-fun m!556341 () Bool)

(assert (=> b!577443 m!556341))

(check-sat (not b!577448) (not b!577443) (not b!577447) (not b!577444) (not b!577442) (not start!53034))
(check-sat)
