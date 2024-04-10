; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44948 () Bool)

(assert start!44948)

(declare-fun e!289548 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31893 0))(
  ( (array!31894 (arr!15331 (Array (_ BitVec 32) (_ BitVec 64))) (size!15695 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31893)

(declare-fun b!492906 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3798 0))(
  ( (MissingZero!3798 (index!17371 (_ BitVec 32))) (Found!3798 (index!17372 (_ BitVec 32))) (Intermediate!3798 (undefined!4610 Bool) (index!17373 (_ BitVec 32)) (x!46460 (_ BitVec 32))) (Undefined!3798) (MissingVacant!3798 (index!17374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31893 (_ BitVec 32)) SeekEntryResult!3798)

(assert (=> b!492906 (= e!289548 (= (seekEntryOrOpen!0 (select (arr!15331 a!3235) j!176) a!3235 mask!3524) (Found!3798 j!176)))))

(declare-fun b!492907 () Bool)

(declare-fun res!295480 () Bool)

(declare-fun e!289546 () Bool)

(assert (=> b!492907 (=> (not res!295480) (not e!289546))))

(declare-datatypes ((List!9489 0))(
  ( (Nil!9486) (Cons!9485 (h!10353 (_ BitVec 64)) (t!15717 List!9489)) )
))
(declare-fun arrayNoDuplicates!0 (array!31893 (_ BitVec 32) List!9489) Bool)

(assert (=> b!492907 (= res!295480 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9486))))

(declare-fun b!492909 () Bool)

(declare-fun res!295481 () Bool)

(declare-fun e!289545 () Bool)

(assert (=> b!492909 (=> (not res!295481) (not e!289545))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492909 (= res!295481 (validKeyInArray!0 k0!2280))))

(declare-fun b!492910 () Bool)

(declare-fun res!295477 () Bool)

(assert (=> b!492910 (=> (not res!295477) (not e!289545))))

(declare-fun arrayContainsKey!0 (array!31893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492910 (= res!295477 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492911 () Bool)

(declare-fun res!295482 () Bool)

(assert (=> b!492911 (=> (not res!295482) (not e!289545))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492911 (= res!295482 (and (= (size!15695 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15695 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15695 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492912 () Bool)

(assert (=> b!492912 (= e!289546 (not true))))

(declare-fun lt!222837 () (_ BitVec 32))

(declare-fun lt!222838 () SeekEntryResult!3798)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31893 (_ BitVec 32)) SeekEntryResult!3798)

(assert (=> b!492912 (= lt!222838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222837 (select (store (arr!15331 a!3235) i!1204 k0!2280) j!176) (array!31894 (store (arr!15331 a!3235) i!1204 k0!2280) (size!15695 a!3235)) mask!3524))))

(declare-fun lt!222841 () (_ BitVec 32))

(declare-fun lt!222840 () SeekEntryResult!3798)

(assert (=> b!492912 (= lt!222840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222841 (select (arr!15331 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492912 (= lt!222837 (toIndex!0 (select (store (arr!15331 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492912 (= lt!222841 (toIndex!0 (select (arr!15331 a!3235) j!176) mask!3524))))

(assert (=> b!492912 e!289548))

(declare-fun res!295476 () Bool)

(assert (=> b!492912 (=> (not res!295476) (not e!289548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31893 (_ BitVec 32)) Bool)

(assert (=> b!492912 (= res!295476 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14542 0))(
  ( (Unit!14543) )
))
(declare-fun lt!222836 () Unit!14542)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14542)

(assert (=> b!492912 (= lt!222836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492913 () Bool)

(declare-fun res!295478 () Bool)

(assert (=> b!492913 (=> (not res!295478) (not e!289546))))

(assert (=> b!492913 (= res!295478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492914 () Bool)

(declare-fun res!295479 () Bool)

(assert (=> b!492914 (=> (not res!295479) (not e!289545))))

(assert (=> b!492914 (= res!295479 (validKeyInArray!0 (select (arr!15331 a!3235) j!176)))))

(declare-fun b!492908 () Bool)

(assert (=> b!492908 (= e!289545 e!289546)))

(declare-fun res!295484 () Bool)

(assert (=> b!492908 (=> (not res!295484) (not e!289546))))

(declare-fun lt!222839 () SeekEntryResult!3798)

(assert (=> b!492908 (= res!295484 (or (= lt!222839 (MissingZero!3798 i!1204)) (= lt!222839 (MissingVacant!3798 i!1204))))))

(assert (=> b!492908 (= lt!222839 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!295483 () Bool)

(assert (=> start!44948 (=> (not res!295483) (not e!289545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44948 (= res!295483 (validMask!0 mask!3524))))

(assert (=> start!44948 e!289545))

(assert (=> start!44948 true))

(declare-fun array_inv!11127 (array!31893) Bool)

(assert (=> start!44948 (array_inv!11127 a!3235)))

(assert (= (and start!44948 res!295483) b!492911))

(assert (= (and b!492911 res!295482) b!492914))

(assert (= (and b!492914 res!295479) b!492909))

(assert (= (and b!492909 res!295481) b!492910))

(assert (= (and b!492910 res!295477) b!492908))

(assert (= (and b!492908 res!295484) b!492913))

(assert (= (and b!492913 res!295478) b!492907))

(assert (= (and b!492907 res!295480) b!492912))

(assert (= (and b!492912 res!295476) b!492906))

(declare-fun m!473595 () Bool)

(assert (=> b!492913 m!473595))

(declare-fun m!473597 () Bool)

(assert (=> b!492910 m!473597))

(declare-fun m!473599 () Bool)

(assert (=> b!492912 m!473599))

(declare-fun m!473601 () Bool)

(assert (=> b!492912 m!473601))

(declare-fun m!473603 () Bool)

(assert (=> b!492912 m!473603))

(declare-fun m!473605 () Bool)

(assert (=> b!492912 m!473605))

(declare-fun m!473607 () Bool)

(assert (=> b!492912 m!473607))

(assert (=> b!492912 m!473603))

(declare-fun m!473609 () Bool)

(assert (=> b!492912 m!473609))

(assert (=> b!492912 m!473605))

(declare-fun m!473611 () Bool)

(assert (=> b!492912 m!473611))

(assert (=> b!492912 m!473605))

(declare-fun m!473613 () Bool)

(assert (=> b!492912 m!473613))

(assert (=> b!492912 m!473603))

(declare-fun m!473615 () Bool)

(assert (=> b!492912 m!473615))

(assert (=> b!492906 m!473605))

(assert (=> b!492906 m!473605))

(declare-fun m!473617 () Bool)

(assert (=> b!492906 m!473617))

(declare-fun m!473619 () Bool)

(assert (=> start!44948 m!473619))

(declare-fun m!473621 () Bool)

(assert (=> start!44948 m!473621))

(assert (=> b!492914 m!473605))

(assert (=> b!492914 m!473605))

(declare-fun m!473623 () Bool)

(assert (=> b!492914 m!473623))

(declare-fun m!473625 () Bool)

(assert (=> b!492909 m!473625))

(declare-fun m!473627 () Bool)

(assert (=> b!492908 m!473627))

(declare-fun m!473629 () Bool)

(assert (=> b!492907 m!473629))

(check-sat (not b!492906) (not b!492910) (not b!492914) (not b!492912) (not b!492913) (not b!492907) (not start!44948) (not b!492908) (not b!492909))
(check-sat)
