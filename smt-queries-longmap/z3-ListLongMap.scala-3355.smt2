; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46124 () Bool)

(assert start!46124)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32835 0))(
  ( (array!32836 (arr!15796 (Array (_ BitVec 32) (_ BitVec 64))) (size!16160 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32835)

(declare-fun b!510972 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!298602 () Bool)

(declare-datatypes ((SeekEntryResult!4263 0))(
  ( (MissingZero!4263 (index!19240 (_ BitVec 32))) (Found!4263 (index!19241 (_ BitVec 32))) (Intermediate!4263 (undefined!5075 Bool) (index!19242 (_ BitVec 32)) (x!48192 (_ BitVec 32))) (Undefined!4263) (MissingVacant!4263 (index!19243 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32835 (_ BitVec 32)) SeekEntryResult!4263)

(assert (=> b!510972 (= e!298602 (= (seekEntryOrOpen!0 (select (arr!15796 a!3235) j!176) a!3235 mask!3524) (Found!4263 j!176)))))

(declare-fun res!311818 () Bool)

(declare-fun e!298605 () Bool)

(assert (=> start!46124 (=> (not res!311818) (not e!298605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46124 (= res!311818 (validMask!0 mask!3524))))

(assert (=> start!46124 e!298605))

(assert (=> start!46124 true))

(declare-fun array_inv!11592 (array!32835) Bool)

(assert (=> start!46124 (array_inv!11592 a!3235)))

(declare-fun b!510973 () Bool)

(declare-fun res!311819 () Bool)

(assert (=> b!510973 (=> (not res!311819) (not e!298605))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510973 (= res!311819 (and (= (size!16160 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16160 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16160 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510974 () Bool)

(declare-fun res!311820 () Bool)

(declare-fun e!298604 () Bool)

(assert (=> b!510974 (=> (not res!311820) (not e!298604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32835 (_ BitVec 32)) Bool)

(assert (=> b!510974 (= res!311820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510975 () Bool)

(declare-fun res!311817 () Bool)

(assert (=> b!510975 (=> (not res!311817) (not e!298605))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510975 (= res!311817 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510976 () Bool)

(assert (=> b!510976 (= e!298604 (not true))))

(declare-fun lt!233740 () (_ BitVec 32))

(declare-fun lt!233742 () SeekEntryResult!4263)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32835 (_ BitVec 32)) SeekEntryResult!4263)

(assert (=> b!510976 (= lt!233742 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233740 (select (store (arr!15796 a!3235) i!1204 k0!2280) j!176) (array!32836 (store (arr!15796 a!3235) i!1204 k0!2280) (size!16160 a!3235)) mask!3524))))

(declare-fun lt!233743 () (_ BitVec 32))

(declare-fun lt!233741 () SeekEntryResult!4263)

(assert (=> b!510976 (= lt!233741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233743 (select (arr!15796 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510976 (= lt!233740 (toIndex!0 (select (store (arr!15796 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510976 (= lt!233743 (toIndex!0 (select (arr!15796 a!3235) j!176) mask!3524))))

(assert (=> b!510976 e!298602))

(declare-fun res!311821 () Bool)

(assert (=> b!510976 (=> (not res!311821) (not e!298602))))

(assert (=> b!510976 (= res!311821 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15784 0))(
  ( (Unit!15785) )
))
(declare-fun lt!233739 () Unit!15784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15784)

(assert (=> b!510976 (= lt!233739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510977 () Bool)

(declare-fun res!311824 () Bool)

(assert (=> b!510977 (=> (not res!311824) (not e!298604))))

(declare-datatypes ((List!9954 0))(
  ( (Nil!9951) (Cons!9950 (h!10827 (_ BitVec 64)) (t!16182 List!9954)) )
))
(declare-fun arrayNoDuplicates!0 (array!32835 (_ BitVec 32) List!9954) Bool)

(assert (=> b!510977 (= res!311824 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9951))))

(declare-fun b!510978 () Bool)

(assert (=> b!510978 (= e!298605 e!298604)))

(declare-fun res!311822 () Bool)

(assert (=> b!510978 (=> (not res!311822) (not e!298604))))

(declare-fun lt!233738 () SeekEntryResult!4263)

(assert (=> b!510978 (= res!311822 (or (= lt!233738 (MissingZero!4263 i!1204)) (= lt!233738 (MissingVacant!4263 i!1204))))))

(assert (=> b!510978 (= lt!233738 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510979 () Bool)

(declare-fun res!311823 () Bool)

(assert (=> b!510979 (=> (not res!311823) (not e!298605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510979 (= res!311823 (validKeyInArray!0 (select (arr!15796 a!3235) j!176)))))

(declare-fun b!510980 () Bool)

(declare-fun res!311825 () Bool)

(assert (=> b!510980 (=> (not res!311825) (not e!298605))))

(assert (=> b!510980 (= res!311825 (validKeyInArray!0 k0!2280))))

(assert (= (and start!46124 res!311818) b!510973))

(assert (= (and b!510973 res!311819) b!510979))

(assert (= (and b!510979 res!311823) b!510980))

(assert (= (and b!510980 res!311825) b!510975))

(assert (= (and b!510975 res!311817) b!510978))

(assert (= (and b!510978 res!311822) b!510974))

(assert (= (and b!510974 res!311820) b!510977))

(assert (= (and b!510977 res!311824) b!510976))

(assert (= (and b!510976 res!311821) b!510972))

(declare-fun m!492465 () Bool)

(assert (=> b!510980 m!492465))

(declare-fun m!492467 () Bool)

(assert (=> b!510974 m!492467))

(declare-fun m!492469 () Bool)

(assert (=> b!510978 m!492469))

(declare-fun m!492471 () Bool)

(assert (=> b!510972 m!492471))

(assert (=> b!510972 m!492471))

(declare-fun m!492473 () Bool)

(assert (=> b!510972 m!492473))

(declare-fun m!492475 () Bool)

(assert (=> start!46124 m!492475))

(declare-fun m!492477 () Bool)

(assert (=> start!46124 m!492477))

(declare-fun m!492479 () Bool)

(assert (=> b!510976 m!492479))

(declare-fun m!492481 () Bool)

(assert (=> b!510976 m!492481))

(declare-fun m!492483 () Bool)

(assert (=> b!510976 m!492483))

(assert (=> b!510976 m!492471))

(declare-fun m!492485 () Bool)

(assert (=> b!510976 m!492485))

(assert (=> b!510976 m!492483))

(declare-fun m!492487 () Bool)

(assert (=> b!510976 m!492487))

(assert (=> b!510976 m!492471))

(declare-fun m!492489 () Bool)

(assert (=> b!510976 m!492489))

(assert (=> b!510976 m!492483))

(declare-fun m!492491 () Bool)

(assert (=> b!510976 m!492491))

(assert (=> b!510976 m!492471))

(declare-fun m!492493 () Bool)

(assert (=> b!510976 m!492493))

(declare-fun m!492495 () Bool)

(assert (=> b!510977 m!492495))

(assert (=> b!510979 m!492471))

(assert (=> b!510979 m!492471))

(declare-fun m!492497 () Bool)

(assert (=> b!510979 m!492497))

(declare-fun m!492499 () Bool)

(assert (=> b!510975 m!492499))

(check-sat (not b!510974) (not b!510975) (not b!510980) (not b!510977) (not b!510979) (not b!510978) (not b!510972) (not b!510976) (not start!46124))
(check-sat)
