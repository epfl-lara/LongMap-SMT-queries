; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46276 () Bool)

(assert start!46276)

(declare-fun b!512622 () Bool)

(declare-fun res!313292 () Bool)

(declare-fun e!299340 () Bool)

(assert (=> b!512622 (=> (not res!313292) (not e!299340))))

(declare-datatypes ((array!32930 0))(
  ( (array!32931 (arr!15842 (Array (_ BitVec 32) (_ BitVec 64))) (size!16206 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32930)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512622 (= res!313292 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512623 () Bool)

(declare-fun res!313284 () Bool)

(declare-fun e!299343 () Bool)

(assert (=> b!512623 (=> (not res!313284) (not e!299343))))

(declare-datatypes ((List!10000 0))(
  ( (Nil!9997) (Cons!9996 (h!10876 (_ BitVec 64)) (t!16228 List!10000)) )
))
(declare-fun arrayNoDuplicates!0 (array!32930 (_ BitVec 32) List!10000) Bool)

(assert (=> b!512623 (= res!313284 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9997))))

(declare-fun b!512624 () Bool)

(declare-fun res!313290 () Bool)

(assert (=> b!512624 (=> (not res!313290) (not e!299343))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32930 (_ BitVec 32)) Bool)

(assert (=> b!512624 (= res!313290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512625 () Bool)

(assert (=> b!512625 (= e!299343 (not true))))

(declare-datatypes ((SeekEntryResult!4309 0))(
  ( (MissingZero!4309 (index!19424 (_ BitVec 32))) (Found!4309 (index!19425 (_ BitVec 32))) (Intermediate!4309 (undefined!5121 Bool) (index!19426 (_ BitVec 32)) (x!48364 (_ BitVec 32))) (Undefined!4309) (MissingVacant!4309 (index!19427 (_ BitVec 32))) )
))
(declare-fun lt!234700 () SeekEntryResult!4309)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!234695 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32930 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!512625 (= lt!234700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234695 (select (store (arr!15842 a!3235) i!1204 k!2280) j!176) (array!32931 (store (arr!15842 a!3235) i!1204 k!2280) (size!16206 a!3235)) mask!3524))))

(declare-fun lt!234696 () SeekEntryResult!4309)

(declare-fun lt!234699 () (_ BitVec 32))

(assert (=> b!512625 (= lt!234696 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234699 (select (arr!15842 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512625 (= lt!234695 (toIndex!0 (select (store (arr!15842 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512625 (= lt!234699 (toIndex!0 (select (arr!15842 a!3235) j!176) mask!3524))))

(declare-fun e!299341 () Bool)

(assert (=> b!512625 e!299341))

(declare-fun res!313285 () Bool)

(assert (=> b!512625 (=> (not res!313285) (not e!299341))))

(assert (=> b!512625 (= res!313285 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15876 0))(
  ( (Unit!15877) )
))
(declare-fun lt!234698 () Unit!15876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15876)

(assert (=> b!512625 (= lt!234698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512626 () Bool)

(assert (=> b!512626 (= e!299340 e!299343)))

(declare-fun res!313287 () Bool)

(assert (=> b!512626 (=> (not res!313287) (not e!299343))))

(declare-fun lt!234697 () SeekEntryResult!4309)

(assert (=> b!512626 (= res!313287 (or (= lt!234697 (MissingZero!4309 i!1204)) (= lt!234697 (MissingVacant!4309 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32930 (_ BitVec 32)) SeekEntryResult!4309)

(assert (=> b!512626 (= lt!234697 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!313289 () Bool)

(assert (=> start!46276 (=> (not res!313289) (not e!299340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46276 (= res!313289 (validMask!0 mask!3524))))

(assert (=> start!46276 e!299340))

(assert (=> start!46276 true))

(declare-fun array_inv!11638 (array!32930) Bool)

(assert (=> start!46276 (array_inv!11638 a!3235)))

(declare-fun b!512627 () Bool)

(declare-fun res!313286 () Bool)

(assert (=> b!512627 (=> (not res!313286) (not e!299340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512627 (= res!313286 (validKeyInArray!0 (select (arr!15842 a!3235) j!176)))))

(declare-fun b!512628 () Bool)

(declare-fun res!313288 () Bool)

(assert (=> b!512628 (=> (not res!313288) (not e!299340))))

(assert (=> b!512628 (= res!313288 (and (= (size!16206 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16206 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16206 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512629 () Bool)

(declare-fun res!313291 () Bool)

(assert (=> b!512629 (=> (not res!313291) (not e!299340))))

(assert (=> b!512629 (= res!313291 (validKeyInArray!0 k!2280))))

(declare-fun b!512630 () Bool)

(assert (=> b!512630 (= e!299341 (= (seekEntryOrOpen!0 (select (arr!15842 a!3235) j!176) a!3235 mask!3524) (Found!4309 j!176)))))

(assert (= (and start!46276 res!313289) b!512628))

(assert (= (and b!512628 res!313288) b!512627))

(assert (= (and b!512627 res!313286) b!512629))

(assert (= (and b!512629 res!313291) b!512622))

(assert (= (and b!512622 res!313292) b!512626))

(assert (= (and b!512626 res!313287) b!512624))

(assert (= (and b!512624 res!313290) b!512623))

(assert (= (and b!512623 res!313284) b!512625))

(assert (= (and b!512625 res!313285) b!512630))

(declare-fun m!494325 () Bool)

(assert (=> b!512626 m!494325))

(declare-fun m!494327 () Bool)

(assert (=> start!46276 m!494327))

(declare-fun m!494329 () Bool)

(assert (=> start!46276 m!494329))

(declare-fun m!494331 () Bool)

(assert (=> b!512622 m!494331))

(declare-fun m!494333 () Bool)

(assert (=> b!512623 m!494333))

(declare-fun m!494335 () Bool)

(assert (=> b!512629 m!494335))

(declare-fun m!494337 () Bool)

(assert (=> b!512630 m!494337))

(assert (=> b!512630 m!494337))

(declare-fun m!494339 () Bool)

(assert (=> b!512630 m!494339))

(declare-fun m!494341 () Bool)

(assert (=> b!512624 m!494341))

(assert (=> b!512627 m!494337))

(assert (=> b!512627 m!494337))

(declare-fun m!494343 () Bool)

(assert (=> b!512627 m!494343))

(declare-fun m!494345 () Bool)

(assert (=> b!512625 m!494345))

(declare-fun m!494347 () Bool)

(assert (=> b!512625 m!494347))

(declare-fun m!494349 () Bool)

(assert (=> b!512625 m!494349))

(declare-fun m!494351 () Bool)

(assert (=> b!512625 m!494351))

(assert (=> b!512625 m!494345))

(assert (=> b!512625 m!494337))

(declare-fun m!494353 () Bool)

(assert (=> b!512625 m!494353))

(assert (=> b!512625 m!494337))

(declare-fun m!494355 () Bool)

(assert (=> b!512625 m!494355))

(assert (=> b!512625 m!494345))

(declare-fun m!494357 () Bool)

(assert (=> b!512625 m!494357))

(assert (=> b!512625 m!494337))

(declare-fun m!494359 () Bool)

(assert (=> b!512625 m!494359))

(push 1)

