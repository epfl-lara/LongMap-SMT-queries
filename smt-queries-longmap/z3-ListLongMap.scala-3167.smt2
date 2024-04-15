; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44616 () Bool)

(assert start!44616)

(declare-fun b!489299 () Bool)

(declare-fun res!292381 () Bool)

(declare-fun e!287747 () Bool)

(assert (=> b!489299 (=> (not res!292381) (not e!287747))))

(declare-datatypes ((array!31685 0))(
  ( (array!31686 (arr!15230 (Array (_ BitVec 32) (_ BitVec 64))) (size!15595 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31685)

(declare-datatypes ((List!9427 0))(
  ( (Nil!9424) (Cons!9423 (h!10285 (_ BitVec 64)) (t!15646 List!9427)) )
))
(declare-fun arrayNoDuplicates!0 (array!31685 (_ BitVec 32) List!9427) Bool)

(assert (=> b!489299 (= res!292381 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9424))))

(declare-fun b!489300 () Bool)

(declare-fun res!292378 () Bool)

(declare-fun e!287745 () Bool)

(assert (=> b!489300 (=> (not res!292378) (not e!287745))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31685 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489300 (= res!292378 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489301 () Bool)

(assert (=> b!489301 (= e!287745 e!287747)))

(declare-fun res!292383 () Bool)

(assert (=> b!489301 (=> (not res!292383) (not e!287747))))

(declare-datatypes ((SeekEntryResult!3694 0))(
  ( (MissingZero!3694 (index!16955 (_ BitVec 32))) (Found!3694 (index!16956 (_ BitVec 32))) (Intermediate!3694 (undefined!4506 Bool) (index!16957 (_ BitVec 32)) (x!46075 (_ BitVec 32))) (Undefined!3694) (MissingVacant!3694 (index!16958 (_ BitVec 32))) )
))
(declare-fun lt!220680 () SeekEntryResult!3694)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489301 (= res!292383 (or (= lt!220680 (MissingZero!3694 i!1204)) (= lt!220680 (MissingVacant!3694 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31685 (_ BitVec 32)) SeekEntryResult!3694)

(assert (=> b!489301 (= lt!220680 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489302 () Bool)

(declare-fun res!292377 () Bool)

(assert (=> b!489302 (=> (not res!292377) (not e!287745))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489302 (= res!292377 (and (= (size!15595 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15595 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15595 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489303 () Bool)

(declare-fun res!292385 () Bool)

(assert (=> b!489303 (=> (not res!292385) (not e!287745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489303 (= res!292385 (validKeyInArray!0 k0!2280))))

(declare-fun b!489304 () Bool)

(assert (=> b!489304 (= e!287747 (not true))))

(declare-fun lt!220683 () (_ BitVec 32))

(declare-fun lt!220681 () SeekEntryResult!3694)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31685 (_ BitVec 32)) SeekEntryResult!3694)

(assert (=> b!489304 (= lt!220681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220683 (select (store (arr!15230 a!3235) i!1204 k0!2280) j!176) (array!31686 (store (arr!15230 a!3235) i!1204 k0!2280) (size!15595 a!3235)) mask!3524))))

(declare-fun lt!220682 () (_ BitVec 32))

(declare-fun lt!220684 () SeekEntryResult!3694)

(assert (=> b!489304 (= lt!220684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220682 (select (arr!15230 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489304 (= lt!220683 (toIndex!0 (select (store (arr!15230 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489304 (= lt!220682 (toIndex!0 (select (arr!15230 a!3235) j!176) mask!3524))))

(declare-fun e!287748 () Bool)

(assert (=> b!489304 e!287748))

(declare-fun res!292384 () Bool)

(assert (=> b!489304 (=> (not res!292384) (not e!287748))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31685 (_ BitVec 32)) Bool)

(assert (=> b!489304 (= res!292384 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14320 0))(
  ( (Unit!14321) )
))
(declare-fun lt!220679 () Unit!14320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31685 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14320)

(assert (=> b!489304 (= lt!220679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489305 () Bool)

(declare-fun res!292382 () Bool)

(assert (=> b!489305 (=> (not res!292382) (not e!287745))))

(assert (=> b!489305 (= res!292382 (validKeyInArray!0 (select (arr!15230 a!3235) j!176)))))

(declare-fun b!489306 () Bool)

(assert (=> b!489306 (= e!287748 (= (seekEntryOrOpen!0 (select (arr!15230 a!3235) j!176) a!3235 mask!3524) (Found!3694 j!176)))))

(declare-fun res!292380 () Bool)

(assert (=> start!44616 (=> (not res!292380) (not e!287745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44616 (= res!292380 (validMask!0 mask!3524))))

(assert (=> start!44616 e!287745))

(assert (=> start!44616 true))

(declare-fun array_inv!11113 (array!31685) Bool)

(assert (=> start!44616 (array_inv!11113 a!3235)))

(declare-fun b!489307 () Bool)

(declare-fun res!292379 () Bool)

(assert (=> b!489307 (=> (not res!292379) (not e!287747))))

(assert (=> b!489307 (= res!292379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44616 res!292380) b!489302))

(assert (= (and b!489302 res!292377) b!489305))

(assert (= (and b!489305 res!292382) b!489303))

(assert (= (and b!489303 res!292385) b!489300))

(assert (= (and b!489300 res!292378) b!489301))

(assert (= (and b!489301 res!292383) b!489307))

(assert (= (and b!489307 res!292379) b!489299))

(assert (= (and b!489299 res!292381) b!489304))

(assert (= (and b!489304 res!292384) b!489306))

(declare-fun m!468637 () Bool)

(assert (=> b!489307 m!468637))

(declare-fun m!468639 () Bool)

(assert (=> b!489299 m!468639))

(declare-fun m!468641 () Bool)

(assert (=> b!489301 m!468641))

(declare-fun m!468643 () Bool)

(assert (=> b!489300 m!468643))

(declare-fun m!468645 () Bool)

(assert (=> b!489305 m!468645))

(assert (=> b!489305 m!468645))

(declare-fun m!468647 () Bool)

(assert (=> b!489305 m!468647))

(assert (=> b!489306 m!468645))

(assert (=> b!489306 m!468645))

(declare-fun m!468649 () Bool)

(assert (=> b!489306 m!468649))

(declare-fun m!468651 () Bool)

(assert (=> b!489303 m!468651))

(declare-fun m!468653 () Bool)

(assert (=> b!489304 m!468653))

(declare-fun m!468655 () Bool)

(assert (=> b!489304 m!468655))

(declare-fun m!468657 () Bool)

(assert (=> b!489304 m!468657))

(declare-fun m!468659 () Bool)

(assert (=> b!489304 m!468659))

(assert (=> b!489304 m!468653))

(assert (=> b!489304 m!468645))

(declare-fun m!468661 () Bool)

(assert (=> b!489304 m!468661))

(assert (=> b!489304 m!468645))

(declare-fun m!468663 () Bool)

(assert (=> b!489304 m!468663))

(assert (=> b!489304 m!468645))

(declare-fun m!468665 () Bool)

(assert (=> b!489304 m!468665))

(assert (=> b!489304 m!468653))

(declare-fun m!468667 () Bool)

(assert (=> b!489304 m!468667))

(declare-fun m!468669 () Bool)

(assert (=> start!44616 m!468669))

(declare-fun m!468671 () Bool)

(assert (=> start!44616 m!468671))

(check-sat (not b!489303) (not b!489300) (not b!489299) (not start!44616) (not b!489305) (not b!489304) (not b!489301) (not b!489307) (not b!489306))
(check-sat)
