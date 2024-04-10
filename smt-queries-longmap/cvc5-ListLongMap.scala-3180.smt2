; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44706 () Bool)

(assert start!44706)

(declare-fun b!490623 () Bool)

(declare-fun e!288388 () Bool)

(declare-fun e!288389 () Bool)

(assert (=> b!490623 (= e!288388 e!288389)))

(declare-fun res!293567 () Bool)

(assert (=> b!490623 (=> (not res!293567) (not e!288389))))

(declare-datatypes ((SeekEntryResult!3737 0))(
  ( (MissingZero!3737 (index!17127 (_ BitVec 32))) (Found!3737 (index!17128 (_ BitVec 32))) (Intermediate!3737 (undefined!4549 Bool) (index!17129 (_ BitVec 32)) (x!46227 (_ BitVec 32))) (Undefined!3737) (MissingVacant!3737 (index!17130 (_ BitVec 32))) )
))
(declare-fun lt!221620 () SeekEntryResult!3737)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490623 (= res!293567 (or (= lt!221620 (MissingZero!3737 i!1204)) (= lt!221620 (MissingVacant!3737 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31765 0))(
  ( (array!31766 (arr!15270 (Array (_ BitVec 32) (_ BitVec 64))) (size!15634 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31765)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31765 (_ BitVec 32)) SeekEntryResult!3737)

(assert (=> b!490623 (= lt!221620 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!293561 () Bool)

(assert (=> start!44706 (=> (not res!293561) (not e!288388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44706 (= res!293561 (validMask!0 mask!3524))))

(assert (=> start!44706 e!288388))

(assert (=> start!44706 true))

(declare-fun array_inv!11066 (array!31765) Bool)

(assert (=> start!44706 (array_inv!11066 a!3235)))

(declare-fun b!490624 () Bool)

(declare-fun res!293562 () Bool)

(assert (=> b!490624 (=> (not res!293562) (not e!288388))))

(declare-fun arrayContainsKey!0 (array!31765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490624 (= res!293562 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490625 () Bool)

(declare-fun res!293560 () Bool)

(assert (=> b!490625 (=> (not res!293560) (not e!288388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490625 (= res!293560 (validKeyInArray!0 k!2280))))

(declare-fun b!490626 () Bool)

(declare-fun res!293566 () Bool)

(assert (=> b!490626 (=> (not res!293566) (not e!288388))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490626 (= res!293566 (validKeyInArray!0 (select (arr!15270 a!3235) j!176)))))

(declare-fun b!490627 () Bool)

(declare-fun e!288387 () Bool)

(assert (=> b!490627 (= e!288389 (not e!288387))))

(declare-fun res!293565 () Bool)

(assert (=> b!490627 (=> res!293565 e!288387)))

(declare-fun lt!221617 () array!31765)

(declare-fun lt!221616 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31765 (_ BitVec 32)) SeekEntryResult!3737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490627 (= res!293565 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15270 a!3235) j!176) mask!3524) (select (arr!15270 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221616 mask!3524) lt!221616 lt!221617 mask!3524))))))

(assert (=> b!490627 (= lt!221616 (select (store (arr!15270 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490627 (= lt!221617 (array!31766 (store (arr!15270 a!3235) i!1204 k!2280) (size!15634 a!3235)))))

(declare-fun lt!221618 () SeekEntryResult!3737)

(assert (=> b!490627 (= lt!221618 (Found!3737 j!176))))

(assert (=> b!490627 (= lt!221618 (seekEntryOrOpen!0 (select (arr!15270 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31765 (_ BitVec 32)) Bool)

(assert (=> b!490627 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14420 0))(
  ( (Unit!14421) )
))
(declare-fun lt!221615 () Unit!14420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14420)

(assert (=> b!490627 (= lt!221615 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490628 () Bool)

(assert (=> b!490628 (= e!288387 true)))

(assert (=> b!490628 (= lt!221618 (seekEntryOrOpen!0 lt!221616 lt!221617 mask!3524))))

(declare-fun lt!221619 () Unit!14420)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31765 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14420)

(assert (=> b!490628 (= lt!221619 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490629 () Bool)

(declare-fun res!293564 () Bool)

(assert (=> b!490629 (=> (not res!293564) (not e!288388))))

(assert (=> b!490629 (= res!293564 (and (= (size!15634 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15634 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15634 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490630 () Bool)

(declare-fun res!293559 () Bool)

(assert (=> b!490630 (=> (not res!293559) (not e!288389))))

(assert (=> b!490630 (= res!293559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490631 () Bool)

(declare-fun res!293563 () Bool)

(assert (=> b!490631 (=> (not res!293563) (not e!288389))))

(declare-datatypes ((List!9428 0))(
  ( (Nil!9425) (Cons!9424 (h!10286 (_ BitVec 64)) (t!15656 List!9428)) )
))
(declare-fun arrayNoDuplicates!0 (array!31765 (_ BitVec 32) List!9428) Bool)

(assert (=> b!490631 (= res!293563 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9425))))

(assert (= (and start!44706 res!293561) b!490629))

(assert (= (and b!490629 res!293564) b!490626))

(assert (= (and b!490626 res!293566) b!490625))

(assert (= (and b!490625 res!293560) b!490624))

(assert (= (and b!490624 res!293562) b!490623))

(assert (= (and b!490623 res!293567) b!490630))

(assert (= (and b!490630 res!293559) b!490631))

(assert (= (and b!490631 res!293563) b!490627))

(assert (= (and b!490627 (not res!293565)) b!490628))

(declare-fun m!470817 () Bool)

(assert (=> b!490625 m!470817))

(declare-fun m!470819 () Bool)

(assert (=> start!44706 m!470819))

(declare-fun m!470821 () Bool)

(assert (=> start!44706 m!470821))

(declare-fun m!470823 () Bool)

(assert (=> b!490628 m!470823))

(declare-fun m!470825 () Bool)

(assert (=> b!490628 m!470825))

(declare-fun m!470827 () Bool)

(assert (=> b!490631 m!470827))

(declare-fun m!470829 () Bool)

(assert (=> b!490624 m!470829))

(declare-fun m!470831 () Bool)

(assert (=> b!490623 m!470831))

(declare-fun m!470833 () Bool)

(assert (=> b!490627 m!470833))

(declare-fun m!470835 () Bool)

(assert (=> b!490627 m!470835))

(declare-fun m!470837 () Bool)

(assert (=> b!490627 m!470837))

(declare-fun m!470839 () Bool)

(assert (=> b!490627 m!470839))

(declare-fun m!470841 () Bool)

(assert (=> b!490627 m!470841))

(declare-fun m!470843 () Bool)

(assert (=> b!490627 m!470843))

(declare-fun m!470845 () Bool)

(assert (=> b!490627 m!470845))

(declare-fun m!470847 () Bool)

(assert (=> b!490627 m!470847))

(assert (=> b!490627 m!470833))

(assert (=> b!490627 m!470845))

(assert (=> b!490627 m!470843))

(assert (=> b!490627 m!470845))

(declare-fun m!470849 () Bool)

(assert (=> b!490627 m!470849))

(assert (=> b!490627 m!470845))

(declare-fun m!470851 () Bool)

(assert (=> b!490627 m!470851))

(declare-fun m!470853 () Bool)

(assert (=> b!490630 m!470853))

(assert (=> b!490626 m!470845))

(assert (=> b!490626 m!470845))

(declare-fun m!470855 () Bool)

(assert (=> b!490626 m!470855))

(push 1)

