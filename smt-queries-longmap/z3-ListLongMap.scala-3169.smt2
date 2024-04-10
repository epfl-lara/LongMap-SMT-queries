; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44642 () Bool)

(assert start!44642)

(declare-fun b!489759 () Bool)

(declare-fun res!292701 () Bool)

(declare-fun e!288003 () Bool)

(assert (=> b!489759 (=> (not res!292701) (not e!288003))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31701 0))(
  ( (array!31702 (arr!15238 (Array (_ BitVec 32) (_ BitVec 64))) (size!15602 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31701)

(assert (=> b!489759 (= res!292701 (and (= (size!15602 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15602 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15602 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489760 () Bool)

(declare-fun res!292697 () Bool)

(declare-fun e!288004 () Bool)

(assert (=> b!489760 (=> (not res!292697) (not e!288004))))

(declare-datatypes ((List!9396 0))(
  ( (Nil!9393) (Cons!9392 (h!10254 (_ BitVec 64)) (t!15624 List!9396)) )
))
(declare-fun arrayNoDuplicates!0 (array!31701 (_ BitVec 32) List!9396) Bool)

(assert (=> b!489760 (= res!292697 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9393))))

(declare-fun b!489761 () Bool)

(declare-fun res!292695 () Bool)

(assert (=> b!489761 (=> (not res!292695) (not e!288003))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489761 (= res!292695 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489762 () Bool)

(assert (=> b!489762 (= e!288004 (not true))))

(declare-fun lt!221042 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3705 0))(
  ( (MissingZero!3705 (index!16999 (_ BitVec 32))) (Found!3705 (index!17000 (_ BitVec 32))) (Intermediate!3705 (undefined!4517 Bool) (index!17001 (_ BitVec 32)) (x!46107 (_ BitVec 32))) (Undefined!3705) (MissingVacant!3705 (index!17002 (_ BitVec 32))) )
))
(declare-fun lt!221040 () SeekEntryResult!3705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31701 (_ BitVec 32)) SeekEntryResult!3705)

(assert (=> b!489762 (= lt!221040 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221042 (select (store (arr!15238 a!3235) i!1204 k0!2280) j!176) (array!31702 (store (arr!15238 a!3235) i!1204 k0!2280) (size!15602 a!3235)) mask!3524))))

(declare-fun lt!221041 () SeekEntryResult!3705)

(declare-fun lt!221044 () (_ BitVec 32))

(assert (=> b!489762 (= lt!221041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221044 (select (arr!15238 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489762 (= lt!221042 (toIndex!0 (select (store (arr!15238 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489762 (= lt!221044 (toIndex!0 (select (arr!15238 a!3235) j!176) mask!3524))))

(declare-fun e!288005 () Bool)

(assert (=> b!489762 e!288005))

(declare-fun res!292702 () Bool)

(assert (=> b!489762 (=> (not res!292702) (not e!288005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31701 (_ BitVec 32)) Bool)

(assert (=> b!489762 (= res!292702 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14356 0))(
  ( (Unit!14357) )
))
(declare-fun lt!221039 () Unit!14356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14356)

(assert (=> b!489762 (= lt!221039 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!292703 () Bool)

(assert (=> start!44642 (=> (not res!292703) (not e!288003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44642 (= res!292703 (validMask!0 mask!3524))))

(assert (=> start!44642 e!288003))

(assert (=> start!44642 true))

(declare-fun array_inv!11034 (array!31701) Bool)

(assert (=> start!44642 (array_inv!11034 a!3235)))

(declare-fun b!489763 () Bool)

(declare-fun res!292696 () Bool)

(assert (=> b!489763 (=> (not res!292696) (not e!288003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489763 (= res!292696 (validKeyInArray!0 k0!2280))))

(declare-fun b!489764 () Bool)

(declare-fun res!292698 () Bool)

(assert (=> b!489764 (=> (not res!292698) (not e!288004))))

(assert (=> b!489764 (= res!292698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489765 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31701 (_ BitVec 32)) SeekEntryResult!3705)

(assert (=> b!489765 (= e!288005 (= (seekEntryOrOpen!0 (select (arr!15238 a!3235) j!176) a!3235 mask!3524) (Found!3705 j!176)))))

(declare-fun b!489766 () Bool)

(declare-fun res!292700 () Bool)

(assert (=> b!489766 (=> (not res!292700) (not e!288003))))

(assert (=> b!489766 (= res!292700 (validKeyInArray!0 (select (arr!15238 a!3235) j!176)))))

(declare-fun b!489767 () Bool)

(assert (=> b!489767 (= e!288003 e!288004)))

(declare-fun res!292699 () Bool)

(assert (=> b!489767 (=> (not res!292699) (not e!288004))))

(declare-fun lt!221043 () SeekEntryResult!3705)

(assert (=> b!489767 (= res!292699 (or (= lt!221043 (MissingZero!3705 i!1204)) (= lt!221043 (MissingVacant!3705 i!1204))))))

(assert (=> b!489767 (= lt!221043 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44642 res!292703) b!489759))

(assert (= (and b!489759 res!292701) b!489766))

(assert (= (and b!489766 res!292700) b!489763))

(assert (= (and b!489763 res!292696) b!489761))

(assert (= (and b!489761 res!292695) b!489767))

(assert (= (and b!489767 res!292699) b!489764))

(assert (= (and b!489764 res!292698) b!489760))

(assert (= (and b!489760 res!292697) b!489762))

(assert (= (and b!489762 res!292702) b!489765))

(declare-fun m!469641 () Bool)

(assert (=> start!44642 m!469641))

(declare-fun m!469643 () Bool)

(assert (=> start!44642 m!469643))

(declare-fun m!469645 () Bool)

(assert (=> b!489764 m!469645))

(declare-fun m!469647 () Bool)

(assert (=> b!489766 m!469647))

(assert (=> b!489766 m!469647))

(declare-fun m!469649 () Bool)

(assert (=> b!489766 m!469649))

(declare-fun m!469651 () Bool)

(assert (=> b!489760 m!469651))

(assert (=> b!489765 m!469647))

(assert (=> b!489765 m!469647))

(declare-fun m!469653 () Bool)

(assert (=> b!489765 m!469653))

(declare-fun m!469655 () Bool)

(assert (=> b!489763 m!469655))

(declare-fun m!469657 () Bool)

(assert (=> b!489767 m!469657))

(declare-fun m!469659 () Bool)

(assert (=> b!489762 m!469659))

(declare-fun m!469661 () Bool)

(assert (=> b!489762 m!469661))

(assert (=> b!489762 m!469661))

(declare-fun m!469663 () Bool)

(assert (=> b!489762 m!469663))

(assert (=> b!489762 m!469647))

(declare-fun m!469665 () Bool)

(assert (=> b!489762 m!469665))

(assert (=> b!489762 m!469647))

(declare-fun m!469667 () Bool)

(assert (=> b!489762 m!469667))

(assert (=> b!489762 m!469661))

(declare-fun m!469669 () Bool)

(assert (=> b!489762 m!469669))

(declare-fun m!469671 () Bool)

(assert (=> b!489762 m!469671))

(assert (=> b!489762 m!469647))

(declare-fun m!469673 () Bool)

(assert (=> b!489762 m!469673))

(declare-fun m!469675 () Bool)

(assert (=> b!489761 m!469675))

(check-sat (not b!489766) (not b!489762) (not start!44642) (not b!489765) (not b!489763) (not b!489761) (not b!489760) (not b!489764) (not b!489767))
(check-sat)
