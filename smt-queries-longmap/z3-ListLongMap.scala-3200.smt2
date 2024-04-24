; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44936 () Bool)

(assert start!44936)

(declare-fun b!492818 () Bool)

(declare-fun res!295450 () Bool)

(declare-fun e!289495 () Bool)

(assert (=> b!492818 (=> (not res!295450) (not e!289495))))

(declare-datatypes ((array!31882 0))(
  ( (array!31883 (arr!15325 (Array (_ BitVec 32) (_ BitVec 64))) (size!15689 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31882)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492818 (= res!295450 (validKeyInArray!0 (select (arr!15325 a!3235) j!176)))))

(declare-fun b!492819 () Bool)

(declare-fun res!295446 () Bool)

(assert (=> b!492819 (=> (not res!295446) (not e!289495))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492819 (= res!295446 (and (= (size!15689 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15689 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15689 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492820 () Bool)

(declare-fun e!289496 () Bool)

(assert (=> b!492820 (= e!289496 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3748 0))(
  ( (MissingZero!3748 (index!17171 (_ BitVec 32))) (Found!3748 (index!17172 (_ BitVec 32))) (Intermediate!3748 (undefined!4560 Bool) (index!17173 (_ BitVec 32)) (x!46407 (_ BitVec 32))) (Undefined!3748) (MissingVacant!3748 (index!17174 (_ BitVec 32))) )
))
(declare-fun lt!222832 () SeekEntryResult!3748)

(declare-fun lt!222835 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31882 (_ BitVec 32)) SeekEntryResult!3748)

(assert (=> b!492820 (= lt!222832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222835 (select (store (arr!15325 a!3235) i!1204 k0!2280) j!176) (array!31883 (store (arr!15325 a!3235) i!1204 k0!2280) (size!15689 a!3235)) mask!3524))))

(declare-fun lt!222834 () (_ BitVec 32))

(declare-fun lt!222831 () SeekEntryResult!3748)

(assert (=> b!492820 (= lt!222831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222834 (select (arr!15325 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492820 (= lt!222835 (toIndex!0 (select (store (arr!15325 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492820 (= lt!222834 (toIndex!0 (select (arr!15325 a!3235) j!176) mask!3524))))

(declare-fun e!289494 () Bool)

(assert (=> b!492820 e!289494))

(declare-fun res!295447 () Bool)

(assert (=> b!492820 (=> (not res!295447) (not e!289494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31882 (_ BitVec 32)) Bool)

(assert (=> b!492820 (= res!295447 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14503 0))(
  ( (Unit!14504) )
))
(declare-fun lt!222833 () Unit!14503)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14503)

(assert (=> b!492820 (= lt!222833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492822 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31882 (_ BitVec 32)) SeekEntryResult!3748)

(assert (=> b!492822 (= e!289494 (= (seekEntryOrOpen!0 (select (arr!15325 a!3235) j!176) a!3235 mask!3524) (Found!3748 j!176)))))

(declare-fun b!492823 () Bool)

(declare-fun res!295448 () Bool)

(assert (=> b!492823 (=> (not res!295448) (not e!289495))))

(declare-fun arrayContainsKey!0 (array!31882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492823 (= res!295448 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492824 () Bool)

(declare-fun res!295445 () Bool)

(assert (=> b!492824 (=> (not res!295445) (not e!289496))))

(declare-datatypes ((List!9390 0))(
  ( (Nil!9387) (Cons!9386 (h!10254 (_ BitVec 64)) (t!15610 List!9390)) )
))
(declare-fun arrayNoDuplicates!0 (array!31882 (_ BitVec 32) List!9390) Bool)

(assert (=> b!492824 (= res!295445 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9387))))

(declare-fun b!492825 () Bool)

(declare-fun res!295449 () Bool)

(assert (=> b!492825 (=> (not res!295449) (not e!289495))))

(assert (=> b!492825 (= res!295449 (validKeyInArray!0 k0!2280))))

(declare-fun b!492826 () Bool)

(assert (=> b!492826 (= e!289495 e!289496)))

(declare-fun res!295444 () Bool)

(assert (=> b!492826 (=> (not res!295444) (not e!289496))))

(declare-fun lt!222830 () SeekEntryResult!3748)

(assert (=> b!492826 (= res!295444 (or (= lt!222830 (MissingZero!3748 i!1204)) (= lt!222830 (MissingVacant!3748 i!1204))))))

(assert (=> b!492826 (= lt!222830 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!295443 () Bool)

(assert (=> start!44936 (=> (not res!295443) (not e!289495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44936 (= res!295443 (validMask!0 mask!3524))))

(assert (=> start!44936 e!289495))

(assert (=> start!44936 true))

(declare-fun array_inv!11184 (array!31882) Bool)

(assert (=> start!44936 (array_inv!11184 a!3235)))

(declare-fun b!492821 () Bool)

(declare-fun res!295442 () Bool)

(assert (=> b!492821 (=> (not res!295442) (not e!289496))))

(assert (=> b!492821 (= res!295442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44936 res!295443) b!492819))

(assert (= (and b!492819 res!295446) b!492818))

(assert (= (and b!492818 res!295450) b!492825))

(assert (= (and b!492825 res!295449) b!492823))

(assert (= (and b!492823 res!295448) b!492826))

(assert (= (and b!492826 res!295444) b!492821))

(assert (= (and b!492821 res!295442) b!492824))

(assert (= (and b!492824 res!295445) b!492820))

(assert (= (and b!492820 res!295447) b!492822))

(declare-fun m!473743 () Bool)

(assert (=> b!492821 m!473743))

(declare-fun m!473745 () Bool)

(assert (=> b!492822 m!473745))

(assert (=> b!492822 m!473745))

(declare-fun m!473747 () Bool)

(assert (=> b!492822 m!473747))

(declare-fun m!473749 () Bool)

(assert (=> b!492825 m!473749))

(declare-fun m!473751 () Bool)

(assert (=> b!492823 m!473751))

(assert (=> b!492820 m!473745))

(declare-fun m!473753 () Bool)

(assert (=> b!492820 m!473753))

(declare-fun m!473755 () Bool)

(assert (=> b!492820 m!473755))

(declare-fun m!473757 () Bool)

(assert (=> b!492820 m!473757))

(declare-fun m!473759 () Bool)

(assert (=> b!492820 m!473759))

(assert (=> b!492820 m!473759))

(declare-fun m!473761 () Bool)

(assert (=> b!492820 m!473761))

(assert (=> b!492820 m!473745))

(declare-fun m!473763 () Bool)

(assert (=> b!492820 m!473763))

(assert (=> b!492820 m!473745))

(declare-fun m!473765 () Bool)

(assert (=> b!492820 m!473765))

(assert (=> b!492820 m!473759))

(declare-fun m!473767 () Bool)

(assert (=> b!492820 m!473767))

(declare-fun m!473769 () Bool)

(assert (=> b!492824 m!473769))

(assert (=> b!492818 m!473745))

(assert (=> b!492818 m!473745))

(declare-fun m!473771 () Bool)

(assert (=> b!492818 m!473771))

(declare-fun m!473773 () Bool)

(assert (=> start!44936 m!473773))

(declare-fun m!473775 () Bool)

(assert (=> start!44936 m!473775))

(declare-fun m!473777 () Bool)

(assert (=> b!492826 m!473777))

(check-sat (not b!492820) (not b!492824) (not b!492826) (not b!492825) (not b!492822) (not b!492821) (not b!492823) (not b!492818) (not start!44936))
(check-sat)
