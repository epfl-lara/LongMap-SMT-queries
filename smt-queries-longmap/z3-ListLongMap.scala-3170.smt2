; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44634 () Bool)

(assert start!44634)

(declare-fun b!489542 () Bool)

(declare-fun e!287853 () Bool)

(assert (=> b!489542 (= e!287853 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31703 0))(
  ( (array!31704 (arr!15239 (Array (_ BitVec 32) (_ BitVec 64))) (size!15604 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31703)

(declare-fun lt!220843 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3703 0))(
  ( (MissingZero!3703 (index!16991 (_ BitVec 32))) (Found!3703 (index!16992 (_ BitVec 32))) (Intermediate!3703 (undefined!4515 Bool) (index!16993 (_ BitVec 32)) (x!46108 (_ BitVec 32))) (Undefined!3703) (MissingVacant!3703 (index!16994 (_ BitVec 32))) )
))
(declare-fun lt!220844 () SeekEntryResult!3703)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31703 (_ BitVec 32)) SeekEntryResult!3703)

(assert (=> b!489542 (= lt!220844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220843 (select (store (arr!15239 a!3235) i!1204 k0!2280) j!176) (array!31704 (store (arr!15239 a!3235) i!1204 k0!2280) (size!15604 a!3235)) mask!3524))))

(declare-fun lt!220846 () (_ BitVec 32))

(declare-fun lt!220842 () SeekEntryResult!3703)

(assert (=> b!489542 (= lt!220842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220846 (select (arr!15239 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489542 (= lt!220843 (toIndex!0 (select (store (arr!15239 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489542 (= lt!220846 (toIndex!0 (select (arr!15239 a!3235) j!176) mask!3524))))

(declare-fun e!287856 () Bool)

(assert (=> b!489542 e!287856))

(declare-fun res!292624 () Bool)

(assert (=> b!489542 (=> (not res!292624) (not e!287856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31703 (_ BitVec 32)) Bool)

(assert (=> b!489542 (= res!292624 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14338 0))(
  ( (Unit!14339) )
))
(declare-fun lt!220841 () Unit!14338)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14338)

(assert (=> b!489542 (= lt!220841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489543 () Bool)

(declare-fun res!292626 () Bool)

(assert (=> b!489543 (=> (not res!292626) (not e!287853))))

(assert (=> b!489543 (= res!292626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489544 () Bool)

(declare-fun res!292625 () Bool)

(assert (=> b!489544 (=> (not res!292625) (not e!287853))))

(declare-datatypes ((List!9436 0))(
  ( (Nil!9433) (Cons!9432 (h!10294 (_ BitVec 64)) (t!15655 List!9436)) )
))
(declare-fun arrayNoDuplicates!0 (array!31703 (_ BitVec 32) List!9436) Bool)

(assert (=> b!489544 (= res!292625 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9433))))

(declare-fun b!489545 () Bool)

(declare-fun res!292628 () Bool)

(declare-fun e!287854 () Bool)

(assert (=> b!489545 (=> (not res!292628) (not e!287854))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489545 (= res!292628 (validKeyInArray!0 k0!2280))))

(declare-fun b!489546 () Bool)

(assert (=> b!489546 (= e!287854 e!287853)))

(declare-fun res!292623 () Bool)

(assert (=> b!489546 (=> (not res!292623) (not e!287853))))

(declare-fun lt!220845 () SeekEntryResult!3703)

(assert (=> b!489546 (= res!292623 (or (= lt!220845 (MissingZero!3703 i!1204)) (= lt!220845 (MissingVacant!3703 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31703 (_ BitVec 32)) SeekEntryResult!3703)

(assert (=> b!489546 (= lt!220845 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!292621 () Bool)

(assert (=> start!44634 (=> (not res!292621) (not e!287854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44634 (= res!292621 (validMask!0 mask!3524))))

(assert (=> start!44634 e!287854))

(assert (=> start!44634 true))

(declare-fun array_inv!11122 (array!31703) Bool)

(assert (=> start!44634 (array_inv!11122 a!3235)))

(declare-fun b!489547 () Bool)

(assert (=> b!489547 (= e!287856 (= (seekEntryOrOpen!0 (select (arr!15239 a!3235) j!176) a!3235 mask!3524) (Found!3703 j!176)))))

(declare-fun b!489548 () Bool)

(declare-fun res!292627 () Bool)

(assert (=> b!489548 (=> (not res!292627) (not e!287854))))

(declare-fun arrayContainsKey!0 (array!31703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489548 (= res!292627 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489549 () Bool)

(declare-fun res!292622 () Bool)

(assert (=> b!489549 (=> (not res!292622) (not e!287854))))

(assert (=> b!489549 (= res!292622 (validKeyInArray!0 (select (arr!15239 a!3235) j!176)))))

(declare-fun b!489550 () Bool)

(declare-fun res!292620 () Bool)

(assert (=> b!489550 (=> (not res!292620) (not e!287854))))

(assert (=> b!489550 (= res!292620 (and (= (size!15604 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15604 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15604 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44634 res!292621) b!489550))

(assert (= (and b!489550 res!292620) b!489549))

(assert (= (and b!489549 res!292622) b!489545))

(assert (= (and b!489545 res!292628) b!489548))

(assert (= (and b!489548 res!292627) b!489546))

(assert (= (and b!489546 res!292623) b!489543))

(assert (= (and b!489543 res!292626) b!489544))

(assert (= (and b!489544 res!292625) b!489542))

(assert (= (and b!489542 res!292624) b!489547))

(declare-fun m!468961 () Bool)

(assert (=> b!489547 m!468961))

(assert (=> b!489547 m!468961))

(declare-fun m!468963 () Bool)

(assert (=> b!489547 m!468963))

(declare-fun m!468965 () Bool)

(assert (=> b!489546 m!468965))

(declare-fun m!468967 () Bool)

(assert (=> b!489548 m!468967))

(assert (=> b!489542 m!468961))

(declare-fun m!468969 () Bool)

(assert (=> b!489542 m!468969))

(declare-fun m!468971 () Bool)

(assert (=> b!489542 m!468971))

(declare-fun m!468973 () Bool)

(assert (=> b!489542 m!468973))

(declare-fun m!468975 () Bool)

(assert (=> b!489542 m!468975))

(declare-fun m!468977 () Bool)

(assert (=> b!489542 m!468977))

(assert (=> b!489542 m!468973))

(assert (=> b!489542 m!468961))

(declare-fun m!468979 () Bool)

(assert (=> b!489542 m!468979))

(assert (=> b!489542 m!468961))

(declare-fun m!468981 () Bool)

(assert (=> b!489542 m!468981))

(assert (=> b!489542 m!468973))

(declare-fun m!468983 () Bool)

(assert (=> b!489542 m!468983))

(declare-fun m!468985 () Bool)

(assert (=> b!489543 m!468985))

(assert (=> b!489549 m!468961))

(assert (=> b!489549 m!468961))

(declare-fun m!468987 () Bool)

(assert (=> b!489549 m!468987))

(declare-fun m!468989 () Bool)

(assert (=> b!489545 m!468989))

(declare-fun m!468991 () Bool)

(assert (=> start!44634 m!468991))

(declare-fun m!468993 () Bool)

(assert (=> start!44634 m!468993))

(declare-fun m!468995 () Bool)

(assert (=> b!489544 m!468995))

(check-sat (not b!489545) (not start!44634) (not b!489547) (not b!489549) (not b!489544) (not b!489543) (not b!489542) (not b!489546) (not b!489548))
(check-sat)
