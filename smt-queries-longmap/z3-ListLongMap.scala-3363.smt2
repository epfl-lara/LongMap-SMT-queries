; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46232 () Bool)

(assert start!46232)

(declare-fun b!511971 () Bool)

(declare-fun res!312637 () Bool)

(declare-fun e!299079 () Bool)

(assert (=> b!511971 (=> (not res!312637) (not e!299079))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32886 0))(
  ( (array!32887 (arr!15820 (Array (_ BitVec 32) (_ BitVec 64))) (size!16184 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32886)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511971 (= res!312637 (and (= (size!16184 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16184 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16184 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511972 () Bool)

(declare-fun res!312638 () Bool)

(assert (=> b!511972 (=> (not res!312638) (not e!299079))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511972 (= res!312638 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511973 () Bool)

(declare-fun e!299078 () Bool)

(assert (=> b!511973 (= e!299079 e!299078)))

(declare-fun res!312636 () Bool)

(assert (=> b!511973 (=> (not res!312636) (not e!299078))))

(declare-datatypes ((SeekEntryResult!4287 0))(
  ( (MissingZero!4287 (index!19336 (_ BitVec 32))) (Found!4287 (index!19337 (_ BitVec 32))) (Intermediate!4287 (undefined!5099 Bool) (index!19338 (_ BitVec 32)) (x!48286 (_ BitVec 32))) (Undefined!4287) (MissingVacant!4287 (index!19339 (_ BitVec 32))) )
))
(declare-fun lt!234303 () SeekEntryResult!4287)

(assert (=> b!511973 (= res!312636 (or (= lt!234303 (MissingZero!4287 i!1204)) (= lt!234303 (MissingVacant!4287 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32886 (_ BitVec 32)) SeekEntryResult!4287)

(assert (=> b!511973 (= lt!234303 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511974 () Bool)

(declare-fun e!299076 () Bool)

(assert (=> b!511974 (= e!299076 true)))

(declare-fun lt!234302 () SeekEntryResult!4287)

(assert (=> b!511974 (= lt!234302 Undefined!4287)))

(declare-fun b!511975 () Bool)

(declare-fun res!312635 () Bool)

(assert (=> b!511975 (=> (not res!312635) (not e!299079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511975 (= res!312635 (validKeyInArray!0 (select (arr!15820 a!3235) j!176)))))

(declare-fun b!511976 () Bool)

(declare-fun res!312633 () Bool)

(assert (=> b!511976 (=> (not res!312633) (not e!299078))))

(declare-datatypes ((List!9978 0))(
  ( (Nil!9975) (Cons!9974 (h!10854 (_ BitVec 64)) (t!16206 List!9978)) )
))
(declare-fun arrayNoDuplicates!0 (array!32886 (_ BitVec 32) List!9978) Bool)

(assert (=> b!511976 (= res!312633 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9975))))

(declare-fun b!511977 () Bool)

(declare-fun res!312640 () Bool)

(assert (=> b!511977 (=> res!312640 e!299076)))

(declare-fun lt!234300 () SeekEntryResult!4287)

(get-info :version)

(assert (=> b!511977 (= res!312640 (or (not ((_ is Intermediate!4287) lt!234300)) (not (undefined!5099 lt!234300))))))

(declare-fun b!511978 () Bool)

(declare-fun res!312641 () Bool)

(assert (=> b!511978 (=> (not res!312641) (not e!299078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32886 (_ BitVec 32)) Bool)

(assert (=> b!511978 (= res!312641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511979 () Bool)

(assert (=> b!511979 (= e!299078 (not e!299076))))

(declare-fun res!312639 () Bool)

(assert (=> b!511979 (=> res!312639 e!299076)))

(declare-fun lt!234299 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32886 (_ BitVec 32)) SeekEntryResult!4287)

(assert (=> b!511979 (= res!312639 (= lt!234300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234299 (select (store (arr!15820 a!3235) i!1204 k0!2280) j!176) (array!32887 (store (arr!15820 a!3235) i!1204 k0!2280) (size!16184 a!3235)) mask!3524)))))

(declare-fun lt!234304 () (_ BitVec 32))

(assert (=> b!511979 (= lt!234300 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234304 (select (arr!15820 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511979 (= lt!234299 (toIndex!0 (select (store (arr!15820 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511979 (= lt!234304 (toIndex!0 (select (arr!15820 a!3235) j!176) mask!3524))))

(assert (=> b!511979 (= lt!234302 (Found!4287 j!176))))

(assert (=> b!511979 (= lt!234302 (seekEntryOrOpen!0 (select (arr!15820 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511979 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15832 0))(
  ( (Unit!15833) )
))
(declare-fun lt!234301 () Unit!15832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15832)

(assert (=> b!511979 (= lt!234301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511970 () Bool)

(declare-fun res!312634 () Bool)

(assert (=> b!511970 (=> (not res!312634) (not e!299079))))

(assert (=> b!511970 (= res!312634 (validKeyInArray!0 k0!2280))))

(declare-fun res!312632 () Bool)

(assert (=> start!46232 (=> (not res!312632) (not e!299079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46232 (= res!312632 (validMask!0 mask!3524))))

(assert (=> start!46232 e!299079))

(assert (=> start!46232 true))

(declare-fun array_inv!11616 (array!32886) Bool)

(assert (=> start!46232 (array_inv!11616 a!3235)))

(assert (= (and start!46232 res!312632) b!511971))

(assert (= (and b!511971 res!312637) b!511975))

(assert (= (and b!511975 res!312635) b!511970))

(assert (= (and b!511970 res!312634) b!511972))

(assert (= (and b!511972 res!312638) b!511973))

(assert (= (and b!511973 res!312636) b!511978))

(assert (= (and b!511978 res!312641) b!511976))

(assert (= (and b!511976 res!312633) b!511979))

(assert (= (and b!511979 (not res!312639)) b!511977))

(assert (= (and b!511977 (not res!312640)) b!511974))

(declare-fun m!493533 () Bool)

(assert (=> b!511975 m!493533))

(assert (=> b!511975 m!493533))

(declare-fun m!493535 () Bool)

(assert (=> b!511975 m!493535))

(declare-fun m!493537 () Bool)

(assert (=> b!511979 m!493537))

(declare-fun m!493539 () Bool)

(assert (=> b!511979 m!493539))

(declare-fun m!493541 () Bool)

(assert (=> b!511979 m!493541))

(declare-fun m!493543 () Bool)

(assert (=> b!511979 m!493543))

(assert (=> b!511979 m!493539))

(assert (=> b!511979 m!493533))

(declare-fun m!493545 () Bool)

(assert (=> b!511979 m!493545))

(assert (=> b!511979 m!493533))

(declare-fun m!493547 () Bool)

(assert (=> b!511979 m!493547))

(assert (=> b!511979 m!493533))

(declare-fun m!493549 () Bool)

(assert (=> b!511979 m!493549))

(assert (=> b!511979 m!493533))

(declare-fun m!493551 () Bool)

(assert (=> b!511979 m!493551))

(assert (=> b!511979 m!493539))

(declare-fun m!493553 () Bool)

(assert (=> b!511979 m!493553))

(declare-fun m!493555 () Bool)

(assert (=> b!511978 m!493555))

(declare-fun m!493557 () Bool)

(assert (=> b!511970 m!493557))

(declare-fun m!493559 () Bool)

(assert (=> start!46232 m!493559))

(declare-fun m!493561 () Bool)

(assert (=> start!46232 m!493561))

(declare-fun m!493563 () Bool)

(assert (=> b!511972 m!493563))

(declare-fun m!493565 () Bool)

(assert (=> b!511973 m!493565))

(declare-fun m!493567 () Bool)

(assert (=> b!511976 m!493567))

(check-sat (not b!511979) (not b!511972) (not b!511976) (not start!46232) (not b!511970) (not b!511973) (not b!511978) (not b!511975))
(check-sat)
