; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44994 () Bool)

(assert start!44994)

(declare-fun b!493465 () Bool)

(declare-fun res!296180 () Bool)

(declare-fun e!289729 () Bool)

(assert (=> b!493465 (=> (not res!296180) (not e!289729))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493465 (= res!296180 (validKeyInArray!0 k0!2280))))

(declare-fun b!493466 () Bool)

(declare-fun res!296182 () Bool)

(assert (=> b!493466 (=> (not res!296182) (not e!289729))))

(declare-datatypes ((array!31949 0))(
  ( (array!31950 (arr!15359 (Array (_ BitVec 32) (_ BitVec 64))) (size!15724 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31949)

(declare-fun arrayContainsKey!0 (array!31949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493466 (= res!296182 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296185 () Bool)

(assert (=> start!44994 (=> (not res!296185) (not e!289729))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44994 (= res!296185 (validMask!0 mask!3524))))

(assert (=> start!44994 e!289729))

(assert (=> start!44994 true))

(declare-fun array_inv!11242 (array!31949) Bool)

(assert (=> start!44994 (array_inv!11242 a!3235)))

(declare-fun b!493467 () Bool)

(declare-fun res!296181 () Bool)

(declare-fun e!289730 () Bool)

(assert (=> b!493467 (=> (not res!296181) (not e!289730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31949 (_ BitVec 32)) Bool)

(assert (=> b!493467 (= res!296181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493468 () Bool)

(declare-fun e!289728 () Bool)

(assert (=> b!493468 (= e!289730 (not e!289728))))

(declare-fun res!296184 () Bool)

(assert (=> b!493468 (=> res!296184 e!289728)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3823 0))(
  ( (MissingZero!3823 (index!17471 (_ BitVec 32))) (Found!3823 (index!17472 (_ BitVec 32))) (Intermediate!3823 (undefined!4635 Bool) (index!17473 (_ BitVec 32)) (x!46560 (_ BitVec 32))) (Undefined!3823) (MissingVacant!3823 (index!17474 (_ BitVec 32))) )
))
(declare-fun lt!223119 () SeekEntryResult!3823)

(declare-fun lt!223118 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31949 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!493468 (= res!296184 (= lt!223119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223118 (select (store (arr!15359 a!3235) i!1204 k0!2280) j!176) (array!31950 (store (arr!15359 a!3235) i!1204 k0!2280) (size!15724 a!3235)) mask!3524)))))

(declare-fun lt!223120 () (_ BitVec 32))

(assert (=> b!493468 (= lt!223119 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223120 (select (arr!15359 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493468 (= lt!223118 (toIndex!0 (select (store (arr!15359 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493468 (= lt!223120 (toIndex!0 (select (arr!15359 a!3235) j!176) mask!3524))))

(declare-fun lt!223117 () SeekEntryResult!3823)

(assert (=> b!493468 (= lt!223117 (Found!3823 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31949 (_ BitVec 32)) SeekEntryResult!3823)

(assert (=> b!493468 (= lt!223117 (seekEntryOrOpen!0 (select (arr!15359 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493468 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14578 0))(
  ( (Unit!14579) )
))
(declare-fun lt!223116 () Unit!14578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14578)

(assert (=> b!493468 (= lt!223116 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493469 () Bool)

(declare-fun res!296178 () Bool)

(assert (=> b!493469 (=> (not res!296178) (not e!289729))))

(assert (=> b!493469 (= res!296178 (validKeyInArray!0 (select (arr!15359 a!3235) j!176)))))

(declare-fun b!493470 () Bool)

(declare-fun res!296179 () Bool)

(assert (=> b!493470 (=> (not res!296179) (not e!289730))))

(declare-datatypes ((List!9556 0))(
  ( (Nil!9553) (Cons!9552 (h!10420 (_ BitVec 64)) (t!15775 List!9556)) )
))
(declare-fun arrayNoDuplicates!0 (array!31949 (_ BitVec 32) List!9556) Bool)

(assert (=> b!493470 (= res!296179 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9553))))

(declare-fun b!493471 () Bool)

(declare-fun res!296183 () Bool)

(assert (=> b!493471 (=> (not res!296183) (not e!289729))))

(assert (=> b!493471 (= res!296183 (and (= (size!15724 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15724 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15724 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493472 () Bool)

(assert (=> b!493472 (= e!289728 true)))

(assert (=> b!493472 (= lt!223117 Undefined!3823)))

(declare-fun b!493473 () Bool)

(declare-fun res!296177 () Bool)

(assert (=> b!493473 (=> res!296177 e!289728)))

(get-info :version)

(assert (=> b!493473 (= res!296177 (or (not ((_ is Intermediate!3823) lt!223119)) (not (undefined!4635 lt!223119))))))

(declare-fun b!493474 () Bool)

(assert (=> b!493474 (= e!289729 e!289730)))

(declare-fun res!296186 () Bool)

(assert (=> b!493474 (=> (not res!296186) (not e!289730))))

(declare-fun lt!223115 () SeekEntryResult!3823)

(assert (=> b!493474 (= res!296186 (or (= lt!223115 (MissingZero!3823 i!1204)) (= lt!223115 (MissingVacant!3823 i!1204))))))

(assert (=> b!493474 (= lt!223115 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44994 res!296185) b!493471))

(assert (= (and b!493471 res!296183) b!493469))

(assert (= (and b!493469 res!296178) b!493465))

(assert (= (and b!493465 res!296180) b!493466))

(assert (= (and b!493466 res!296182) b!493474))

(assert (= (and b!493474 res!296186) b!493467))

(assert (= (and b!493467 res!296181) b!493470))

(assert (= (and b!493470 res!296179) b!493468))

(assert (= (and b!493468 (not res!296184)) b!493473))

(assert (= (and b!493473 (not res!296177)) b!493472))

(declare-fun m!473887 () Bool)

(assert (=> b!493465 m!473887))

(declare-fun m!473889 () Bool)

(assert (=> b!493468 m!473889))

(declare-fun m!473891 () Bool)

(assert (=> b!493468 m!473891))

(declare-fun m!473893 () Bool)

(assert (=> b!493468 m!473893))

(declare-fun m!473895 () Bool)

(assert (=> b!493468 m!473895))

(declare-fun m!473897 () Bool)

(assert (=> b!493468 m!473897))

(declare-fun m!473899 () Bool)

(assert (=> b!493468 m!473899))

(assert (=> b!493468 m!473897))

(declare-fun m!473901 () Bool)

(assert (=> b!493468 m!473901))

(assert (=> b!493468 m!473897))

(declare-fun m!473903 () Bool)

(assert (=> b!493468 m!473903))

(assert (=> b!493468 m!473889))

(declare-fun m!473905 () Bool)

(assert (=> b!493468 m!473905))

(assert (=> b!493468 m!473889))

(assert (=> b!493468 m!473897))

(declare-fun m!473907 () Bool)

(assert (=> b!493468 m!473907))

(assert (=> b!493469 m!473897))

(assert (=> b!493469 m!473897))

(declare-fun m!473909 () Bool)

(assert (=> b!493469 m!473909))

(declare-fun m!473911 () Bool)

(assert (=> b!493467 m!473911))

(declare-fun m!473913 () Bool)

(assert (=> b!493474 m!473913))

(declare-fun m!473915 () Bool)

(assert (=> b!493470 m!473915))

(declare-fun m!473917 () Bool)

(assert (=> b!493466 m!473917))

(declare-fun m!473919 () Bool)

(assert (=> start!44994 m!473919))

(declare-fun m!473921 () Bool)

(assert (=> start!44994 m!473921))

(check-sat (not b!493468) (not b!493467) (not b!493470) (not start!44994) (not b!493466) (not b!493465) (not b!493469) (not b!493474))
(check-sat)
