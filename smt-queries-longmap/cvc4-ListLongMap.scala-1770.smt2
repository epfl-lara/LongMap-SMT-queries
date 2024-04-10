; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32270 () Bool)

(assert start!32270)

(declare-fun b!321495 () Bool)

(declare-fun res!175620 () Bool)

(declare-fun e!199195 () Bool)

(assert (=> b!321495 (=> (not res!175620) (not e!199195))))

(declare-datatypes ((array!16460 0))(
  ( (array!16461 (arr!7789 (Array (_ BitVec 32) (_ BitVec 64))) (size!8141 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16460)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321495 (= res!175620 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun b!321496 () Bool)

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun e!199193 () Bool)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!321496 (= e!199193 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7789 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7789 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7789 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun res!175623 () Bool)

(assert (=> start!32270 (=> (not res!175623) (not e!199195))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32270 (= res!175623 (validMask!0 mask!3777))))

(assert (=> start!32270 e!199195))

(declare-fun array_inv!5752 (array!16460) Bool)

(assert (=> start!32270 (array_inv!5752 a!3305)))

(assert (=> start!32270 true))

(declare-fun b!321497 () Bool)

(declare-fun res!175622 () Bool)

(assert (=> b!321497 (=> (not res!175622) (not e!199195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16460 (_ BitVec 32)) Bool)

(assert (=> b!321497 (= res!175622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321498 () Bool)

(declare-fun res!175618 () Bool)

(assert (=> b!321498 (=> (not res!175618) (not e!199195))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2920 0))(
  ( (MissingZero!2920 (index!13856 (_ BitVec 32))) (Found!2920 (index!13857 (_ BitVec 32))) (Intermediate!2920 (undefined!3732 Bool) (index!13858 (_ BitVec 32)) (x!32115 (_ BitVec 32))) (Undefined!2920) (MissingVacant!2920 (index!13859 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16460 (_ BitVec 32)) SeekEntryResult!2920)

(assert (=> b!321498 (= res!175618 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2920 i!1250)))))

(declare-fun b!321499 () Bool)

(assert (=> b!321499 (= e!199195 e!199193)))

(declare-fun res!175615 () Bool)

(assert (=> b!321499 (=> (not res!175615) (not e!199193))))

(declare-fun lt!156201 () SeekEntryResult!2920)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16460 (_ BitVec 32)) SeekEntryResult!2920)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321499 (= res!175615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156201))))

(assert (=> b!321499 (= lt!156201 (Intermediate!2920 false resIndex!58 resX!58))))

(declare-fun b!321500 () Bool)

(declare-fun res!175621 () Bool)

(assert (=> b!321500 (=> (not res!175621) (not e!199193))))

(assert (=> b!321500 (= res!175621 (and (= (select (arr!7789 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8141 a!3305))))))

(declare-fun b!321501 () Bool)

(declare-fun res!175617 () Bool)

(assert (=> b!321501 (=> (not res!175617) (not e!199195))))

(assert (=> b!321501 (= res!175617 (and (= (size!8141 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8141 a!3305))))))

(declare-fun b!321502 () Bool)

(declare-fun res!175616 () Bool)

(assert (=> b!321502 (=> (not res!175616) (not e!199193))))

(assert (=> b!321502 (= res!175616 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156201))))

(declare-fun b!321503 () Bool)

(declare-fun res!175619 () Bool)

(assert (=> b!321503 (=> (not res!175619) (not e!199195))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321503 (= res!175619 (validKeyInArray!0 k!2497))))

(assert (= (and start!32270 res!175623) b!321501))

(assert (= (and b!321501 res!175617) b!321503))

(assert (= (and b!321503 res!175619) b!321495))

(assert (= (and b!321495 res!175620) b!321498))

(assert (= (and b!321498 res!175618) b!321497))

(assert (= (and b!321497 res!175622) b!321499))

(assert (= (and b!321499 res!175615) b!321500))

(assert (= (and b!321500 res!175621) b!321502))

(assert (= (and b!321502 res!175616) b!321496))

(declare-fun m!329629 () Bool)

(assert (=> b!321495 m!329629))

(declare-fun m!329631 () Bool)

(assert (=> b!321502 m!329631))

(declare-fun m!329633 () Bool)

(assert (=> b!321496 m!329633))

(declare-fun m!329635 () Bool)

(assert (=> b!321500 m!329635))

(declare-fun m!329637 () Bool)

(assert (=> b!321503 m!329637))

(declare-fun m!329639 () Bool)

(assert (=> b!321498 m!329639))

(declare-fun m!329641 () Bool)

(assert (=> b!321497 m!329641))

(declare-fun m!329643 () Bool)

(assert (=> start!32270 m!329643))

(declare-fun m!329645 () Bool)

(assert (=> start!32270 m!329645))

(declare-fun m!329647 () Bool)

(assert (=> b!321499 m!329647))

(assert (=> b!321499 m!329647))

(declare-fun m!329649 () Bool)

(assert (=> b!321499 m!329649))

(push 1)

(assert (not start!32270))

(assert (not b!321497))

(assert (not b!321499))

(assert (not b!321502))

(assert (not b!321495))

(assert (not b!321498))

(assert (not b!321503))

(check-sat)

