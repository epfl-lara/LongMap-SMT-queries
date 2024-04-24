; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44696 () Bool)

(assert start!44696)

(declare-fun b!490562 () Bool)

(declare-fun res!293555 () Bool)

(declare-fun e!288349 () Bool)

(assert (=> b!490562 (=> (not res!293555) (not e!288349))))

(declare-datatypes ((array!31756 0))(
  ( (array!31757 (arr!15265 (Array (_ BitVec 32) (_ BitVec 64))) (size!15629 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31756)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490562 (= res!293555 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490563 () Bool)

(declare-fun res!293554 () Bool)

(assert (=> b!490563 (=> (not res!293554) (not e!288349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490563 (= res!293554 (validKeyInArray!0 k0!2280))))

(declare-fun b!490564 () Bool)

(declare-fun res!293556 () Bool)

(assert (=> b!490564 (=> (not res!293556) (not e!288349))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490564 (= res!293556 (and (= (size!15629 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15629 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15629 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490565 () Bool)

(declare-fun res!293559 () Bool)

(assert (=> b!490565 (=> (not res!293559) (not e!288349))))

(assert (=> b!490565 (= res!293559 (validKeyInArray!0 (select (arr!15265 a!3235) j!176)))))

(declare-fun b!490566 () Bool)

(declare-fun e!288348 () Bool)

(declare-fun e!288351 () Bool)

(assert (=> b!490566 (= e!288348 (not e!288351))))

(declare-fun res!293558 () Bool)

(assert (=> b!490566 (=> res!293558 e!288351)))

(declare-fun lt!221631 () (_ BitVec 64))

(declare-fun lt!221630 () array!31756)

(declare-datatypes ((SeekEntryResult!3688 0))(
  ( (MissingZero!3688 (index!16931 (_ BitVec 32))) (Found!3688 (index!16932 (_ BitVec 32))) (Intermediate!3688 (undefined!4500 Bool) (index!16933 (_ BitVec 32)) (x!46175 (_ BitVec 32))) (Undefined!3688) (MissingVacant!3688 (index!16934 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31756 (_ BitVec 32)) SeekEntryResult!3688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490566 (= res!293558 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15265 a!3235) j!176) mask!3524) (select (arr!15265 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221631 mask!3524) lt!221631 lt!221630 mask!3524))))))

(assert (=> b!490566 (= lt!221631 (select (store (arr!15265 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490566 (= lt!221630 (array!31757 (store (arr!15265 a!3235) i!1204 k0!2280) (size!15629 a!3235)))))

(declare-fun lt!221628 () SeekEntryResult!3688)

(assert (=> b!490566 (= lt!221628 (Found!3688 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31756 (_ BitVec 32)) SeekEntryResult!3688)

(assert (=> b!490566 (= lt!221628 (seekEntryOrOpen!0 (select (arr!15265 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31756 (_ BitVec 32)) Bool)

(assert (=> b!490566 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14383 0))(
  ( (Unit!14384) )
))
(declare-fun lt!221629 () Unit!14383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14383)

(assert (=> b!490566 (= lt!221629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490568 () Bool)

(assert (=> b!490568 (= e!288351 true)))

(assert (=> b!490568 (= lt!221628 (seekEntryOrOpen!0 lt!221631 lt!221630 mask!3524))))

(declare-fun lt!221627 () Unit!14383)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31756 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14383)

(assert (=> b!490568 (= lt!221627 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490569 () Bool)

(declare-fun res!293552 () Bool)

(assert (=> b!490569 (=> (not res!293552) (not e!288348))))

(assert (=> b!490569 (= res!293552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490570 () Bool)

(assert (=> b!490570 (= e!288349 e!288348)))

(declare-fun res!293557 () Bool)

(assert (=> b!490570 (=> (not res!293557) (not e!288348))))

(declare-fun lt!221632 () SeekEntryResult!3688)

(assert (=> b!490570 (= res!293557 (or (= lt!221632 (MissingZero!3688 i!1204)) (= lt!221632 (MissingVacant!3688 i!1204))))))

(assert (=> b!490570 (= lt!221632 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!293560 () Bool)

(assert (=> start!44696 (=> (not res!293560) (not e!288349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44696 (= res!293560 (validMask!0 mask!3524))))

(assert (=> start!44696 e!288349))

(assert (=> start!44696 true))

(declare-fun array_inv!11124 (array!31756) Bool)

(assert (=> start!44696 (array_inv!11124 a!3235)))

(declare-fun b!490567 () Bool)

(declare-fun res!293553 () Bool)

(assert (=> b!490567 (=> (not res!293553) (not e!288348))))

(declare-datatypes ((List!9330 0))(
  ( (Nil!9327) (Cons!9326 (h!10188 (_ BitVec 64)) (t!15550 List!9330)) )
))
(declare-fun arrayNoDuplicates!0 (array!31756 (_ BitVec 32) List!9330) Bool)

(assert (=> b!490567 (= res!293553 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9327))))

(assert (= (and start!44696 res!293560) b!490564))

(assert (= (and b!490564 res!293556) b!490565))

(assert (= (and b!490565 res!293559) b!490563))

(assert (= (and b!490563 res!293554) b!490562))

(assert (= (and b!490562 res!293555) b!490570))

(assert (= (and b!490570 res!293557) b!490569))

(assert (= (and b!490569 res!293552) b!490567))

(assert (= (and b!490567 res!293553) b!490566))

(assert (= (and b!490566 (not res!293558)) b!490568))

(declare-fun m!471001 () Bool)

(assert (=> b!490570 m!471001))

(declare-fun m!471003 () Bool)

(assert (=> start!44696 m!471003))

(declare-fun m!471005 () Bool)

(assert (=> start!44696 m!471005))

(declare-fun m!471007 () Bool)

(assert (=> b!490566 m!471007))

(declare-fun m!471009 () Bool)

(assert (=> b!490566 m!471009))

(declare-fun m!471011 () Bool)

(assert (=> b!490566 m!471011))

(declare-fun m!471013 () Bool)

(assert (=> b!490566 m!471013))

(declare-fun m!471015 () Bool)

(assert (=> b!490566 m!471015))

(assert (=> b!490566 m!471013))

(assert (=> b!490566 m!471011))

(assert (=> b!490566 m!471013))

(declare-fun m!471017 () Bool)

(assert (=> b!490566 m!471017))

(assert (=> b!490566 m!471013))

(declare-fun m!471019 () Bool)

(assert (=> b!490566 m!471019))

(declare-fun m!471021 () Bool)

(assert (=> b!490566 m!471021))

(declare-fun m!471023 () Bool)

(assert (=> b!490566 m!471023))

(assert (=> b!490566 m!471021))

(declare-fun m!471025 () Bool)

(assert (=> b!490566 m!471025))

(declare-fun m!471027 () Bool)

(assert (=> b!490563 m!471027))

(declare-fun m!471029 () Bool)

(assert (=> b!490562 m!471029))

(declare-fun m!471031 () Bool)

(assert (=> b!490567 m!471031))

(declare-fun m!471033 () Bool)

(assert (=> b!490568 m!471033))

(declare-fun m!471035 () Bool)

(assert (=> b!490568 m!471035))

(assert (=> b!490565 m!471013))

(assert (=> b!490565 m!471013))

(declare-fun m!471037 () Bool)

(assert (=> b!490565 m!471037))

(declare-fun m!471039 () Bool)

(assert (=> b!490569 m!471039))

(check-sat (not b!490562) (not b!490563) (not b!490566) (not b!490569) (not start!44696) (not b!490565) (not b!490567) (not b!490570) (not b!490568))
(check-sat)
