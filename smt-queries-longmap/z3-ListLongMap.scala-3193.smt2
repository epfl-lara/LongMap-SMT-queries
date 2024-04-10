; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44786 () Bool)

(assert start!44786)

(declare-fun b!491718 () Bool)

(declare-fun res!294661 () Bool)

(declare-fun e!288883 () Bool)

(assert (=> b!491718 (=> (not res!294661) (not e!288883))))

(declare-datatypes ((array!31845 0))(
  ( (array!31846 (arr!15310 (Array (_ BitVec 32) (_ BitVec 64))) (size!15674 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31845)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491718 (= res!294661 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491719 () Bool)

(declare-fun e!288884 () Bool)

(declare-fun lt!222336 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491719 (= e!288884 (validKeyInArray!0 lt!222336))))

(declare-fun b!491720 () Bool)

(declare-fun e!288885 () Bool)

(assert (=> b!491720 (= e!288885 e!288884)))

(declare-fun res!294656 () Bool)

(assert (=> b!491720 (=> res!294656 e!288884)))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!491720 (= res!294656 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222335 () array!31845)

(declare-datatypes ((SeekEntryResult!3777 0))(
  ( (MissingZero!3777 (index!17287 (_ BitVec 32))) (Found!3777 (index!17288 (_ BitVec 32))) (Intermediate!3777 (undefined!4589 Bool) (index!17289 (_ BitVec 32)) (x!46371 (_ BitVec 32))) (Undefined!3777) (MissingVacant!3777 (index!17290 (_ BitVec 32))) )
))
(declare-fun lt!222337 () SeekEntryResult!3777)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31845 (_ BitVec 32)) SeekEntryResult!3777)

(assert (=> b!491720 (= lt!222337 (seekEntryOrOpen!0 lt!222336 lt!222335 mask!3524))))

(declare-datatypes ((Unit!14500 0))(
  ( (Unit!14501) )
))
(declare-fun lt!222339 () Unit!14500)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14500)

(assert (=> b!491720 (= lt!222339 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491721 () Bool)

(declare-fun res!294657 () Bool)

(assert (=> b!491721 (=> (not res!294657) (not e!288883))))

(assert (=> b!491721 (= res!294657 (validKeyInArray!0 (select (arr!15310 a!3235) j!176)))))

(declare-fun b!491722 () Bool)

(declare-fun res!294654 () Bool)

(declare-fun e!288882 () Bool)

(assert (=> b!491722 (=> (not res!294654) (not e!288882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31845 (_ BitVec 32)) Bool)

(assert (=> b!491722 (= res!294654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491723 () Bool)

(assert (=> b!491723 (= e!288882 (not e!288885))))

(declare-fun res!294653 () Bool)

(assert (=> b!491723 (=> res!294653 e!288885)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31845 (_ BitVec 32)) SeekEntryResult!3777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491723 (= res!294653 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (select (arr!15310 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222336 mask!3524) lt!222336 lt!222335 mask!3524))))))

(assert (=> b!491723 (= lt!222336 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491723 (= lt!222335 (array!31846 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)))))

(assert (=> b!491723 (= lt!222337 (Found!3777 j!176))))

(assert (=> b!491723 (= lt!222337 (seekEntryOrOpen!0 (select (arr!15310 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491723 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222340 () Unit!14500)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14500)

(assert (=> b!491723 (= lt!222340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491724 () Bool)

(declare-fun res!294658 () Bool)

(assert (=> b!491724 (=> (not res!294658) (not e!288883))))

(assert (=> b!491724 (= res!294658 (and (= (size!15674 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15674 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15674 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491725 () Bool)

(assert (=> b!491725 (= e!288883 e!288882)))

(declare-fun res!294655 () Bool)

(assert (=> b!491725 (=> (not res!294655) (not e!288882))))

(declare-fun lt!222338 () SeekEntryResult!3777)

(assert (=> b!491725 (= res!294655 (or (= lt!222338 (MissingZero!3777 i!1204)) (= lt!222338 (MissingVacant!3777 i!1204))))))

(assert (=> b!491725 (= lt!222338 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491726 () Bool)

(declare-fun res!294660 () Bool)

(assert (=> b!491726 (=> (not res!294660) (not e!288882))))

(declare-datatypes ((List!9468 0))(
  ( (Nil!9465) (Cons!9464 (h!10326 (_ BitVec 64)) (t!15696 List!9468)) )
))
(declare-fun arrayNoDuplicates!0 (array!31845 (_ BitVec 32) List!9468) Bool)

(assert (=> b!491726 (= res!294660 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9465))))

(declare-fun b!491717 () Bool)

(declare-fun res!294659 () Bool)

(assert (=> b!491717 (=> (not res!294659) (not e!288883))))

(assert (=> b!491717 (= res!294659 (validKeyInArray!0 k0!2280))))

(declare-fun res!294662 () Bool)

(assert (=> start!44786 (=> (not res!294662) (not e!288883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44786 (= res!294662 (validMask!0 mask!3524))))

(assert (=> start!44786 e!288883))

(assert (=> start!44786 true))

(declare-fun array_inv!11106 (array!31845) Bool)

(assert (=> start!44786 (array_inv!11106 a!3235)))

(assert (= (and start!44786 res!294662) b!491724))

(assert (= (and b!491724 res!294658) b!491721))

(assert (= (and b!491721 res!294657) b!491717))

(assert (= (and b!491717 res!294659) b!491718))

(assert (= (and b!491718 res!294661) b!491725))

(assert (= (and b!491725 res!294655) b!491722))

(assert (= (and b!491722 res!294654) b!491726))

(assert (= (and b!491726 res!294660) b!491723))

(assert (= (and b!491723 (not res!294653)) b!491720))

(assert (= (and b!491720 (not res!294656)) b!491719))

(declare-fun m!472425 () Bool)

(assert (=> b!491723 m!472425))

(declare-fun m!472427 () Bool)

(assert (=> b!491723 m!472427))

(declare-fun m!472429 () Bool)

(assert (=> b!491723 m!472429))

(declare-fun m!472431 () Bool)

(assert (=> b!491723 m!472431))

(declare-fun m!472433 () Bool)

(assert (=> b!491723 m!472433))

(declare-fun m!472435 () Bool)

(assert (=> b!491723 m!472435))

(assert (=> b!491723 m!472433))

(assert (=> b!491723 m!472431))

(assert (=> b!491723 m!472433))

(declare-fun m!472437 () Bool)

(assert (=> b!491723 m!472437))

(assert (=> b!491723 m!472433))

(declare-fun m!472439 () Bool)

(assert (=> b!491723 m!472439))

(assert (=> b!491723 m!472437))

(declare-fun m!472441 () Bool)

(assert (=> b!491723 m!472441))

(declare-fun m!472443 () Bool)

(assert (=> b!491723 m!472443))

(declare-fun m!472445 () Bool)

(assert (=> b!491718 m!472445))

(assert (=> b!491721 m!472433))

(assert (=> b!491721 m!472433))

(declare-fun m!472447 () Bool)

(assert (=> b!491721 m!472447))

(declare-fun m!472449 () Bool)

(assert (=> start!44786 m!472449))

(declare-fun m!472451 () Bool)

(assert (=> start!44786 m!472451))

(declare-fun m!472453 () Bool)

(assert (=> b!491722 m!472453))

(declare-fun m!472455 () Bool)

(assert (=> b!491726 m!472455))

(declare-fun m!472457 () Bool)

(assert (=> b!491719 m!472457))

(declare-fun m!472459 () Bool)

(assert (=> b!491717 m!472459))

(declare-fun m!472461 () Bool)

(assert (=> b!491720 m!472461))

(declare-fun m!472463 () Bool)

(assert (=> b!491720 m!472463))

(declare-fun m!472465 () Bool)

(assert (=> b!491725 m!472465))

(check-sat (not b!491722) (not b!491717) (not b!491721) (not b!491723) (not b!491718) (not b!491719) (not b!491726) (not start!44786) (not b!491720) (not b!491725))
(check-sat)
