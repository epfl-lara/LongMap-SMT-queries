; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44638 () Bool)

(assert start!44638)

(declare-fun b!489705 () Bool)

(declare-fun res!292644 () Bool)

(declare-fun e!287980 () Bool)

(assert (=> b!489705 (=> (not res!292644) (not e!287980))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31697 0))(
  ( (array!31698 (arr!15236 (Array (_ BitVec 32) (_ BitVec 64))) (size!15600 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31697)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489705 (= res!292644 (and (= (size!15600 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15600 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15600 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489706 () Bool)

(declare-fun res!292642 () Bool)

(assert (=> b!489706 (=> (not res!292642) (not e!287980))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489706 (= res!292642 (validKeyInArray!0 k!2280))))

(declare-fun b!489707 () Bool)

(declare-fun res!292647 () Bool)

(assert (=> b!489707 (=> (not res!292647) (not e!287980))))

(declare-fun arrayContainsKey!0 (array!31697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489707 (= res!292647 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489708 () Bool)

(declare-fun res!292645 () Bool)

(declare-fun e!287982 () Bool)

(assert (=> b!489708 (=> (not res!292645) (not e!287982))))

(declare-datatypes ((List!9394 0))(
  ( (Nil!9391) (Cons!9390 (h!10252 (_ BitVec 64)) (t!15622 List!9394)) )
))
(declare-fun arrayNoDuplicates!0 (array!31697 (_ BitVec 32) List!9394) Bool)

(assert (=> b!489708 (= res!292645 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9391))))

(declare-fun res!292646 () Bool)

(assert (=> start!44638 (=> (not res!292646) (not e!287980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44638 (= res!292646 (validMask!0 mask!3524))))

(assert (=> start!44638 e!287980))

(assert (=> start!44638 true))

(declare-fun array_inv!11032 (array!31697) Bool)

(assert (=> start!44638 (array_inv!11032 a!3235)))

(declare-fun b!489709 () Bool)

(declare-fun res!292641 () Bool)

(assert (=> b!489709 (=> (not res!292641) (not e!287982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31697 (_ BitVec 32)) Bool)

(assert (=> b!489709 (= res!292641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489710 () Bool)

(declare-fun e!287981 () Bool)

(declare-datatypes ((SeekEntryResult!3703 0))(
  ( (MissingZero!3703 (index!16991 (_ BitVec 32))) (Found!3703 (index!16992 (_ BitVec 32))) (Intermediate!3703 (undefined!4515 Bool) (index!16993 (_ BitVec 32)) (x!46097 (_ BitVec 32))) (Undefined!3703) (MissingVacant!3703 (index!16994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31697 (_ BitVec 32)) SeekEntryResult!3703)

(assert (=> b!489710 (= e!287981 (= (seekEntryOrOpen!0 (select (arr!15236 a!3235) j!176) a!3235 mask!3524) (Found!3703 j!176)))))

(declare-fun b!489711 () Bool)

(assert (=> b!489711 (= e!287980 e!287982)))

(declare-fun res!292648 () Bool)

(assert (=> b!489711 (=> (not res!292648) (not e!287982))))

(declare-fun lt!221007 () SeekEntryResult!3703)

(assert (=> b!489711 (= res!292648 (or (= lt!221007 (MissingZero!3703 i!1204)) (= lt!221007 (MissingVacant!3703 i!1204))))))

(assert (=> b!489711 (= lt!221007 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489712 () Bool)

(declare-fun res!292649 () Bool)

(assert (=> b!489712 (=> (not res!292649) (not e!287980))))

(assert (=> b!489712 (= res!292649 (validKeyInArray!0 (select (arr!15236 a!3235) j!176)))))

(declare-fun b!489713 () Bool)

(assert (=> b!489713 (= e!287982 (not true))))

(declare-fun lt!221005 () SeekEntryResult!3703)

(declare-fun lt!221004 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31697 (_ BitVec 32)) SeekEntryResult!3703)

(assert (=> b!489713 (= lt!221005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221004 (select (store (arr!15236 a!3235) i!1204 k!2280) j!176) (array!31698 (store (arr!15236 a!3235) i!1204 k!2280) (size!15600 a!3235)) mask!3524))))

(declare-fun lt!221006 () (_ BitVec 32))

(declare-fun lt!221003 () SeekEntryResult!3703)

(assert (=> b!489713 (= lt!221003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221006 (select (arr!15236 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489713 (= lt!221004 (toIndex!0 (select (store (arr!15236 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489713 (= lt!221006 (toIndex!0 (select (arr!15236 a!3235) j!176) mask!3524))))

(assert (=> b!489713 e!287981))

(declare-fun res!292643 () Bool)

(assert (=> b!489713 (=> (not res!292643) (not e!287981))))

(assert (=> b!489713 (= res!292643 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14352 0))(
  ( (Unit!14353) )
))
(declare-fun lt!221008 () Unit!14352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14352)

(assert (=> b!489713 (= lt!221008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44638 res!292646) b!489705))

(assert (= (and b!489705 res!292644) b!489712))

(assert (= (and b!489712 res!292649) b!489706))

(assert (= (and b!489706 res!292642) b!489707))

(assert (= (and b!489707 res!292647) b!489711))

(assert (= (and b!489711 res!292648) b!489709))

(assert (= (and b!489709 res!292641) b!489708))

(assert (= (and b!489708 res!292645) b!489713))

(assert (= (and b!489713 res!292643) b!489710))

(declare-fun m!469569 () Bool)

(assert (=> b!489710 m!469569))

(assert (=> b!489710 m!469569))

(declare-fun m!469571 () Bool)

(assert (=> b!489710 m!469571))

(declare-fun m!469573 () Bool)

(assert (=> b!489709 m!469573))

(assert (=> b!489712 m!469569))

(assert (=> b!489712 m!469569))

(declare-fun m!469575 () Bool)

(assert (=> b!489712 m!469575))

(declare-fun m!469577 () Bool)

(assert (=> b!489706 m!469577))

(declare-fun m!469579 () Bool)

(assert (=> b!489713 m!469579))

(declare-fun m!469581 () Bool)

(assert (=> b!489713 m!469581))

(declare-fun m!469583 () Bool)

(assert (=> b!489713 m!469583))

(assert (=> b!489713 m!469569))

(declare-fun m!469585 () Bool)

(assert (=> b!489713 m!469585))

(assert (=> b!489713 m!469569))

(declare-fun m!469587 () Bool)

(assert (=> b!489713 m!469587))

(assert (=> b!489713 m!469583))

(declare-fun m!469589 () Bool)

(assert (=> b!489713 m!469589))

(assert (=> b!489713 m!469583))

(declare-fun m!469591 () Bool)

(assert (=> b!489713 m!469591))

(assert (=> b!489713 m!469569))

(declare-fun m!469593 () Bool)

(assert (=> b!489713 m!469593))

(declare-fun m!469595 () Bool)

(assert (=> start!44638 m!469595))

(declare-fun m!469597 () Bool)

(assert (=> start!44638 m!469597))

(declare-fun m!469599 () Bool)

(assert (=> b!489708 m!469599))

(declare-fun m!469601 () Bool)

(assert (=> b!489711 m!469601))

(declare-fun m!469603 () Bool)

(assert (=> b!489707 m!469603))

(push 1)

(assert (not b!489711))

(assert (not b!489707))

(assert (not b!489708))

(assert (not b!489713))

(assert (not b!489709))

(assert (not start!44638))

(assert (not b!489706))

(assert (not b!489712))

(assert (not b!489710))

(check-sat)

(pop 1)

(push 1)

