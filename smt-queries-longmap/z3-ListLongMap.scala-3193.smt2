; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44772 () Bool)

(assert start!44772)

(declare-fun b!491416 () Bool)

(declare-fun res!294496 () Bool)

(declare-fun e!288696 () Bool)

(assert (=> b!491416 (=> (not res!294496) (not e!288696))))

(declare-datatypes ((array!31841 0))(
  ( (array!31842 (arr!15308 (Array (_ BitVec 32) (_ BitVec 64))) (size!15673 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31841)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491416 (= res!294496 (validKeyInArray!0 (select (arr!15308 a!3235) j!176)))))

(declare-fun b!491417 () Bool)

(declare-fun res!294500 () Bool)

(declare-fun e!288694 () Bool)

(assert (=> b!491417 (=> (not res!294500) (not e!288694))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31841 (_ BitVec 32)) Bool)

(assert (=> b!491417 (= res!294500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491418 () Bool)

(declare-fun res!294495 () Bool)

(assert (=> b!491418 (=> (not res!294495) (not e!288696))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491418 (= res!294495 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491419 () Bool)

(declare-fun e!288693 () Bool)

(declare-fun e!288692 () Bool)

(assert (=> b!491419 (= e!288693 e!288692)))

(declare-fun res!294498 () Bool)

(assert (=> b!491419 (=> res!294498 e!288692)))

(assert (=> b!491419 (= res!294498 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222086 () array!31841)

(declare-fun lt!222083 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3772 0))(
  ( (MissingZero!3772 (index!17267 (_ BitVec 32))) (Found!3772 (index!17268 (_ BitVec 32))) (Intermediate!3772 (undefined!4584 Bool) (index!17269 (_ BitVec 32)) (x!46361 (_ BitVec 32))) (Undefined!3772) (MissingVacant!3772 (index!17270 (_ BitVec 32))) )
))
(declare-fun lt!222088 () SeekEntryResult!3772)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31841 (_ BitVec 32)) SeekEntryResult!3772)

(assert (=> b!491419 (= lt!222088 (seekEntryOrOpen!0 lt!222083 lt!222086 mask!3524))))

(declare-datatypes ((Unit!14476 0))(
  ( (Unit!14477) )
))
(declare-fun lt!222084 () Unit!14476)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14476)

(assert (=> b!491419 (= lt!222084 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!491420 () Bool)

(declare-fun res!294497 () Bool)

(assert (=> b!491420 (=> (not res!294497) (not e!288694))))

(declare-datatypes ((List!9505 0))(
  ( (Nil!9502) (Cons!9501 (h!10363 (_ BitVec 64)) (t!15724 List!9505)) )
))
(declare-fun arrayNoDuplicates!0 (array!31841 (_ BitVec 32) List!9505) Bool)

(assert (=> b!491420 (= res!294497 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9502))))

(declare-fun b!491421 () Bool)

(declare-fun res!294499 () Bool)

(assert (=> b!491421 (=> (not res!294499) (not e!288696))))

(assert (=> b!491421 (= res!294499 (and (= (size!15673 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15673 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15673 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491422 () Bool)

(assert (=> b!491422 (= e!288692 (validKeyInArray!0 lt!222083))))

(declare-fun b!491423 () Bool)

(assert (=> b!491423 (= e!288694 (not e!288693))))

(declare-fun res!294494 () Bool)

(assert (=> b!491423 (=> res!294494 e!288693)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31841 (_ BitVec 32)) SeekEntryResult!3772)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491423 (= res!294494 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15308 a!3235) j!176) mask!3524) (select (arr!15308 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222083 mask!3524) lt!222083 lt!222086 mask!3524))))))

(assert (=> b!491423 (= lt!222083 (select (store (arr!15308 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!491423 (= lt!222086 (array!31842 (store (arr!15308 a!3235) i!1204 k0!2280) (size!15673 a!3235)))))

(assert (=> b!491423 (= lt!222088 (Found!3772 j!176))))

(assert (=> b!491423 (= lt!222088 (seekEntryOrOpen!0 (select (arr!15308 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491423 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222087 () Unit!14476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14476)

(assert (=> b!491423 (= lt!222087 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491424 () Bool)

(assert (=> b!491424 (= e!288696 e!288694)))

(declare-fun res!294503 () Bool)

(assert (=> b!491424 (=> (not res!294503) (not e!288694))))

(declare-fun lt!222085 () SeekEntryResult!3772)

(assert (=> b!491424 (= res!294503 (or (= lt!222085 (MissingZero!3772 i!1204)) (= lt!222085 (MissingVacant!3772 i!1204))))))

(assert (=> b!491424 (= lt!222085 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!294501 () Bool)

(assert (=> start!44772 (=> (not res!294501) (not e!288696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44772 (= res!294501 (validMask!0 mask!3524))))

(assert (=> start!44772 e!288696))

(assert (=> start!44772 true))

(declare-fun array_inv!11191 (array!31841) Bool)

(assert (=> start!44772 (array_inv!11191 a!3235)))

(declare-fun b!491425 () Bool)

(declare-fun res!294502 () Bool)

(assert (=> b!491425 (=> (not res!294502) (not e!288696))))

(assert (=> b!491425 (= res!294502 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44772 res!294501) b!491421))

(assert (= (and b!491421 res!294499) b!491416))

(assert (= (and b!491416 res!294496) b!491425))

(assert (= (and b!491425 res!294502) b!491418))

(assert (= (and b!491418 res!294495) b!491424))

(assert (= (and b!491424 res!294503) b!491417))

(assert (= (and b!491417 res!294500) b!491420))

(assert (= (and b!491420 res!294497) b!491423))

(assert (= (and b!491423 (not res!294494)) b!491419))

(assert (= (and b!491419 (not res!294498)) b!491422))

(declare-fun m!471631 () Bool)

(assert (=> b!491423 m!471631))

(declare-fun m!471633 () Bool)

(assert (=> b!491423 m!471633))

(declare-fun m!471635 () Bool)

(assert (=> b!491423 m!471635))

(declare-fun m!471637 () Bool)

(assert (=> b!491423 m!471637))

(declare-fun m!471639 () Bool)

(assert (=> b!491423 m!471639))

(declare-fun m!471641 () Bool)

(assert (=> b!491423 m!471641))

(declare-fun m!471643 () Bool)

(assert (=> b!491423 m!471643))

(declare-fun m!471645 () Bool)

(assert (=> b!491423 m!471645))

(assert (=> b!491423 m!471643))

(assert (=> b!491423 m!471641))

(assert (=> b!491423 m!471643))

(declare-fun m!471647 () Bool)

(assert (=> b!491423 m!471647))

(assert (=> b!491423 m!471631))

(assert (=> b!491423 m!471643))

(declare-fun m!471649 () Bool)

(assert (=> b!491423 m!471649))

(declare-fun m!471651 () Bool)

(assert (=> b!491418 m!471651))

(declare-fun m!471653 () Bool)

(assert (=> b!491424 m!471653))

(declare-fun m!471655 () Bool)

(assert (=> b!491425 m!471655))

(declare-fun m!471657 () Bool)

(assert (=> b!491420 m!471657))

(declare-fun m!471659 () Bool)

(assert (=> b!491417 m!471659))

(assert (=> b!491416 m!471643))

(assert (=> b!491416 m!471643))

(declare-fun m!471661 () Bool)

(assert (=> b!491416 m!471661))

(declare-fun m!471663 () Bool)

(assert (=> start!44772 m!471663))

(declare-fun m!471665 () Bool)

(assert (=> start!44772 m!471665))

(declare-fun m!471667 () Bool)

(assert (=> b!491422 m!471667))

(declare-fun m!471669 () Bool)

(assert (=> b!491419 m!471669))

(declare-fun m!471671 () Bool)

(assert (=> b!491419 m!471671))

(check-sat (not b!491417) (not b!491419) (not b!491416) (not b!491424) (not b!491418) (not b!491420) (not start!44772) (not b!491422) (not b!491425) (not b!491423))
(check-sat)
