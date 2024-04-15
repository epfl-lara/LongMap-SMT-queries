; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46056 () Bool)

(assert start!46056)

(declare-fun b!509945 () Bool)

(declare-fun res!310935 () Bool)

(declare-fun e!298092 () Bool)

(assert (=> b!509945 (=> (not res!310935) (not e!298092))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509945 (= res!310935 (validKeyInArray!0 k0!2280))))

(declare-fun b!509946 () Bool)

(declare-fun e!298093 () Bool)

(assert (=> b!509946 (= e!298092 e!298093)))

(declare-fun res!310937 () Bool)

(assert (=> b!509946 (=> (not res!310937) (not e!298093))))

(declare-datatypes ((SeekEntryResult!4231 0))(
  ( (MissingZero!4231 (index!19112 (_ BitVec 32))) (Found!4231 (index!19113 (_ BitVec 32))) (Intermediate!4231 (undefined!5043 Bool) (index!19114 (_ BitVec 32)) (x!48083 (_ BitVec 32))) (Undefined!4231) (MissingVacant!4231 (index!19115 (_ BitVec 32))) )
))
(declare-fun lt!233002 () SeekEntryResult!4231)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509946 (= res!310937 (or (= lt!233002 (MissingZero!4231 i!1204)) (= lt!233002 (MissingVacant!4231 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32777 0))(
  ( (array!32778 (arr!15767 (Array (_ BitVec 32) (_ BitVec 64))) (size!16132 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32777)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32777 (_ BitVec 32)) SeekEntryResult!4231)

(assert (=> b!509946 (= lt!233002 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!310936 () Bool)

(assert (=> start!46056 (=> (not res!310936) (not e!298092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46056 (= res!310936 (validMask!0 mask!3524))))

(assert (=> start!46056 e!298092))

(assert (=> start!46056 true))

(declare-fun array_inv!11650 (array!32777) Bool)

(assert (=> start!46056 (array_inv!11650 a!3235)))

(declare-fun b!509947 () Bool)

(declare-fun e!298094 () Bool)

(assert (=> b!509947 (= e!298094 true)))

(declare-fun lt!233003 () (_ BitVec 64))

(declare-fun lt!233001 () array!32777)

(declare-fun lt!233000 () SeekEntryResult!4231)

(assert (=> b!509947 (= lt!233000 (seekEntryOrOpen!0 lt!233003 lt!233001 mask!3524))))

(declare-datatypes ((Unit!15706 0))(
  ( (Unit!15707) )
))
(declare-fun lt!233005 () Unit!15706)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15706)

(assert (=> b!509947 (= lt!233005 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!509948 () Bool)

(declare-fun res!310932 () Bool)

(assert (=> b!509948 (=> (not res!310932) (not e!298093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32777 (_ BitVec 32)) Bool)

(assert (=> b!509948 (= res!310932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509949 () Bool)

(declare-fun res!310933 () Bool)

(assert (=> b!509949 (=> (not res!310933) (not e!298092))))

(assert (=> b!509949 (= res!310933 (validKeyInArray!0 (select (arr!15767 a!3235) j!176)))))

(declare-fun b!509950 () Bool)

(declare-fun res!310934 () Bool)

(assert (=> b!509950 (=> (not res!310934) (not e!298092))))

(assert (=> b!509950 (= res!310934 (and (= (size!16132 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16132 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16132 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509951 () Bool)

(declare-fun res!310939 () Bool)

(assert (=> b!509951 (=> (not res!310939) (not e!298093))))

(declare-datatypes ((List!9964 0))(
  ( (Nil!9961) (Cons!9960 (h!10837 (_ BitVec 64)) (t!16183 List!9964)) )
))
(declare-fun arrayNoDuplicates!0 (array!32777 (_ BitVec 32) List!9964) Bool)

(assert (=> b!509951 (= res!310939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9961))))

(declare-fun b!509952 () Bool)

(declare-fun res!310940 () Bool)

(assert (=> b!509952 (=> (not res!310940) (not e!298092))))

(declare-fun arrayContainsKey!0 (array!32777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509952 (= res!310940 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509953 () Bool)

(assert (=> b!509953 (= e!298093 (not e!298094))))

(declare-fun res!310938 () Bool)

(assert (=> b!509953 (=> res!310938 e!298094)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32777 (_ BitVec 32)) SeekEntryResult!4231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509953 (= res!310938 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15767 a!3235) j!176) mask!3524) (select (arr!15767 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233003 mask!3524) lt!233003 lt!233001 mask!3524))))))

(assert (=> b!509953 (= lt!233003 (select (store (arr!15767 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!509953 (= lt!233001 (array!32778 (store (arr!15767 a!3235) i!1204 k0!2280) (size!16132 a!3235)))))

(assert (=> b!509953 (= lt!233000 (Found!4231 j!176))))

(assert (=> b!509953 (= lt!233000 (seekEntryOrOpen!0 (select (arr!15767 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!509953 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233004 () Unit!15706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15706)

(assert (=> b!509953 (= lt!233004 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46056 res!310936) b!509950))

(assert (= (and b!509950 res!310934) b!509949))

(assert (= (and b!509949 res!310933) b!509945))

(assert (= (and b!509945 res!310935) b!509952))

(assert (= (and b!509952 res!310940) b!509946))

(assert (= (and b!509946 res!310937) b!509948))

(assert (= (and b!509948 res!310932) b!509951))

(assert (= (and b!509951 res!310939) b!509953))

(assert (= (and b!509953 (not res!310938)) b!509947))

(declare-fun m!490621 () Bool)

(assert (=> b!509953 m!490621))

(declare-fun m!490623 () Bool)

(assert (=> b!509953 m!490623))

(declare-fun m!490625 () Bool)

(assert (=> b!509953 m!490625))

(declare-fun m!490627 () Bool)

(assert (=> b!509953 m!490627))

(declare-fun m!490629 () Bool)

(assert (=> b!509953 m!490629))

(assert (=> b!509953 m!490627))

(assert (=> b!509953 m!490625))

(assert (=> b!509953 m!490627))

(declare-fun m!490631 () Bool)

(assert (=> b!509953 m!490631))

(assert (=> b!509953 m!490627))

(declare-fun m!490633 () Bool)

(assert (=> b!509953 m!490633))

(declare-fun m!490635 () Bool)

(assert (=> b!509953 m!490635))

(assert (=> b!509953 m!490635))

(declare-fun m!490637 () Bool)

(assert (=> b!509953 m!490637))

(declare-fun m!490639 () Bool)

(assert (=> b!509953 m!490639))

(declare-fun m!490641 () Bool)

(assert (=> b!509948 m!490641))

(declare-fun m!490643 () Bool)

(assert (=> start!46056 m!490643))

(declare-fun m!490645 () Bool)

(assert (=> start!46056 m!490645))

(declare-fun m!490647 () Bool)

(assert (=> b!509952 m!490647))

(assert (=> b!509949 m!490627))

(assert (=> b!509949 m!490627))

(declare-fun m!490649 () Bool)

(assert (=> b!509949 m!490649))

(declare-fun m!490651 () Bool)

(assert (=> b!509951 m!490651))

(declare-fun m!490653 () Bool)

(assert (=> b!509947 m!490653))

(declare-fun m!490655 () Bool)

(assert (=> b!509947 m!490655))

(declare-fun m!490657 () Bool)

(assert (=> b!509946 m!490657))

(declare-fun m!490659 () Bool)

(assert (=> b!509945 m!490659))

(check-sat (not b!509949) (not b!509948) (not b!509952) (not b!509953) (not b!509947) (not b!509945) (not b!509946) (not b!509951) (not start!46056))
(check-sat)
