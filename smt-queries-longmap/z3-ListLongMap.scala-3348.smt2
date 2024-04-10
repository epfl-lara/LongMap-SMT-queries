; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46082 () Bool)

(assert start!46082)

(declare-fun b!510405 () Bool)

(declare-fun e!298350 () Bool)

(declare-fun e!298352 () Bool)

(assert (=> b!510405 (= e!298350 e!298352)))

(declare-fun res!311250 () Bool)

(assert (=> b!510405 (=> (not res!311250) (not e!298352))))

(declare-datatypes ((SeekEntryResult!4242 0))(
  ( (MissingZero!4242 (index!19156 (_ BitVec 32))) (Found!4242 (index!19157 (_ BitVec 32))) (Intermediate!4242 (undefined!5054 Bool) (index!19158 (_ BitVec 32)) (x!48115 (_ BitVec 32))) (Undefined!4242) (MissingVacant!4242 (index!19159 (_ BitVec 32))) )
))
(declare-fun lt!233361 () SeekEntryResult!4242)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510405 (= res!311250 (or (= lt!233361 (MissingZero!4242 i!1204)) (= lt!233361 (MissingVacant!4242 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32793 0))(
  ( (array!32794 (arr!15775 (Array (_ BitVec 32) (_ BitVec 64))) (size!16139 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32793)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32793 (_ BitVec 32)) SeekEntryResult!4242)

(assert (=> b!510405 (= lt!233361 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510406 () Bool)

(declare-fun res!311257 () Bool)

(assert (=> b!510406 (=> (not res!311257) (not e!298350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510406 (= res!311257 (validKeyInArray!0 k0!2280))))

(declare-fun b!510407 () Bool)

(declare-fun e!298353 () Bool)

(assert (=> b!510407 (= e!298353 true)))

(declare-fun lt!233363 () array!32793)

(declare-fun lt!233362 () SeekEntryResult!4242)

(declare-fun lt!233360 () (_ BitVec 64))

(assert (=> b!510407 (= lt!233362 (seekEntryOrOpen!0 lt!233360 lt!233363 mask!3524))))

(declare-datatypes ((Unit!15742 0))(
  ( (Unit!15743) )
))
(declare-fun lt!233365 () Unit!15742)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15742)

(assert (=> b!510407 (= lt!233365 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510409 () Bool)

(assert (=> b!510409 (= e!298352 (not e!298353))))

(declare-fun res!311254 () Bool)

(assert (=> b!510409 (=> res!311254 e!298353)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32793 (_ BitVec 32)) SeekEntryResult!4242)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510409 (= res!311254 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15775 a!3235) j!176) mask!3524) (select (arr!15775 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233360 mask!3524) lt!233360 lt!233363 mask!3524))))))

(assert (=> b!510409 (= lt!233360 (select (store (arr!15775 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510409 (= lt!233363 (array!32794 (store (arr!15775 a!3235) i!1204 k0!2280) (size!16139 a!3235)))))

(assert (=> b!510409 (= lt!233362 (Found!4242 j!176))))

(assert (=> b!510409 (= lt!233362 (seekEntryOrOpen!0 (select (arr!15775 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32793 (_ BitVec 32)) Bool)

(assert (=> b!510409 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233364 () Unit!15742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15742)

(assert (=> b!510409 (= lt!233364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510410 () Bool)

(declare-fun res!311258 () Bool)

(assert (=> b!510410 (=> (not res!311258) (not e!298352))))

(declare-datatypes ((List!9933 0))(
  ( (Nil!9930) (Cons!9929 (h!10806 (_ BitVec 64)) (t!16161 List!9933)) )
))
(declare-fun arrayNoDuplicates!0 (array!32793 (_ BitVec 32) List!9933) Bool)

(assert (=> b!510410 (= res!311258 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9930))))

(declare-fun b!510411 () Bool)

(declare-fun res!311251 () Bool)

(assert (=> b!510411 (=> (not res!311251) (not e!298350))))

(declare-fun arrayContainsKey!0 (array!32793 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510411 (= res!311251 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510408 () Bool)

(declare-fun res!311252 () Bool)

(assert (=> b!510408 (=> (not res!311252) (not e!298350))))

(assert (=> b!510408 (= res!311252 (and (= (size!16139 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16139 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16139 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311256 () Bool)

(assert (=> start!46082 (=> (not res!311256) (not e!298350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46082 (= res!311256 (validMask!0 mask!3524))))

(assert (=> start!46082 e!298350))

(assert (=> start!46082 true))

(declare-fun array_inv!11571 (array!32793) Bool)

(assert (=> start!46082 (array_inv!11571 a!3235)))

(declare-fun b!510412 () Bool)

(declare-fun res!311255 () Bool)

(assert (=> b!510412 (=> (not res!311255) (not e!298352))))

(assert (=> b!510412 (= res!311255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510413 () Bool)

(declare-fun res!311253 () Bool)

(assert (=> b!510413 (=> (not res!311253) (not e!298350))))

(assert (=> b!510413 (= res!311253 (validKeyInArray!0 (select (arr!15775 a!3235) j!176)))))

(assert (= (and start!46082 res!311256) b!510408))

(assert (= (and b!510408 res!311252) b!510413))

(assert (= (and b!510413 res!311253) b!510406))

(assert (= (and b!510406 res!311257) b!510411))

(assert (= (and b!510411 res!311251) b!510405))

(assert (= (and b!510405 res!311250) b!510412))

(assert (= (and b!510412 res!311255) b!510410))

(assert (= (and b!510410 res!311258) b!510409))

(assert (= (and b!510409 (not res!311254)) b!510407))

(declare-fun m!491653 () Bool)

(assert (=> b!510409 m!491653))

(declare-fun m!491655 () Bool)

(assert (=> b!510409 m!491655))

(declare-fun m!491657 () Bool)

(assert (=> b!510409 m!491657))

(declare-fun m!491659 () Bool)

(assert (=> b!510409 m!491659))

(declare-fun m!491661 () Bool)

(assert (=> b!510409 m!491661))

(declare-fun m!491663 () Bool)

(assert (=> b!510409 m!491663))

(declare-fun m!491665 () Bool)

(assert (=> b!510409 m!491665))

(assert (=> b!510409 m!491663))

(declare-fun m!491667 () Bool)

(assert (=> b!510409 m!491667))

(assert (=> b!510409 m!491663))

(declare-fun m!491669 () Bool)

(assert (=> b!510409 m!491669))

(assert (=> b!510409 m!491655))

(declare-fun m!491671 () Bool)

(assert (=> b!510409 m!491671))

(assert (=> b!510409 m!491663))

(assert (=> b!510409 m!491661))

(declare-fun m!491673 () Bool)

(assert (=> b!510411 m!491673))

(declare-fun m!491675 () Bool)

(assert (=> b!510406 m!491675))

(declare-fun m!491677 () Bool)

(assert (=> b!510412 m!491677))

(declare-fun m!491679 () Bool)

(assert (=> b!510405 m!491679))

(declare-fun m!491681 () Bool)

(assert (=> b!510410 m!491681))

(assert (=> b!510413 m!491663))

(assert (=> b!510413 m!491663))

(declare-fun m!491683 () Bool)

(assert (=> b!510413 m!491683))

(declare-fun m!491685 () Bool)

(assert (=> start!46082 m!491685))

(declare-fun m!491687 () Bool)

(assert (=> start!46082 m!491687))

(declare-fun m!491689 () Bool)

(assert (=> b!510407 m!491689))

(declare-fun m!491691 () Bool)

(assert (=> b!510407 m!491691))

(check-sat (not b!510412) (not b!510407) (not b!510409) (not b!510413) (not b!510410) (not b!510405) (not start!46082) (not b!510406) (not b!510411))
(check-sat)
