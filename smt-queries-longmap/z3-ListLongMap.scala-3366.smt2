; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46250 () Bool)

(assert start!46250)

(declare-fun b!512240 () Bool)

(declare-fun e!299185 () Bool)

(assert (=> b!512240 (= e!299185 true)))

(declare-datatypes ((SeekEntryResult!4296 0))(
  ( (MissingZero!4296 (index!19372 (_ BitVec 32))) (Found!4296 (index!19373 (_ BitVec 32))) (Intermediate!4296 (undefined!5108 Bool) (index!19374 (_ BitVec 32)) (x!48319 (_ BitVec 32))) (Undefined!4296) (MissingVacant!4296 (index!19375 (_ BitVec 32))) )
))
(declare-fun lt!234466 () SeekEntryResult!4296)

(assert (=> b!512240 (= lt!234466 Undefined!4296)))

(declare-fun b!512241 () Bool)

(declare-fun e!299186 () Bool)

(assert (=> b!512241 (= e!299186 (not e!299185))))

(declare-fun res!312902 () Bool)

(assert (=> b!512241 (=> res!312902 e!299185)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32904 0))(
  ( (array!32905 (arr!15829 (Array (_ BitVec 32) (_ BitVec 64))) (size!16193 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32904)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!234465 () (_ BitVec 32))

(declare-fun lt!234462 () SeekEntryResult!4296)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32904 (_ BitVec 32)) SeekEntryResult!4296)

(assert (=> b!512241 (= res!312902 (= lt!234462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234465 (select (store (arr!15829 a!3235) i!1204 k0!2280) j!176) (array!32905 (store (arr!15829 a!3235) i!1204 k0!2280) (size!16193 a!3235)) mask!3524)))))

(declare-fun lt!234463 () (_ BitVec 32))

(assert (=> b!512241 (= lt!234462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234463 (select (arr!15829 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512241 (= lt!234465 (toIndex!0 (select (store (arr!15829 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512241 (= lt!234463 (toIndex!0 (select (arr!15829 a!3235) j!176) mask!3524))))

(assert (=> b!512241 (= lt!234466 (Found!4296 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32904 (_ BitVec 32)) SeekEntryResult!4296)

(assert (=> b!512241 (= lt!234466 (seekEntryOrOpen!0 (select (arr!15829 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32904 (_ BitVec 32)) Bool)

(assert (=> b!512241 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15850 0))(
  ( (Unit!15851) )
))
(declare-fun lt!234464 () Unit!15850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15850)

(assert (=> b!512241 (= lt!234464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!312908 () Bool)

(declare-fun e!299184 () Bool)

(assert (=> start!46250 (=> (not res!312908) (not e!299184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46250 (= res!312908 (validMask!0 mask!3524))))

(assert (=> start!46250 e!299184))

(assert (=> start!46250 true))

(declare-fun array_inv!11625 (array!32904) Bool)

(assert (=> start!46250 (array_inv!11625 a!3235)))

(declare-fun b!512242 () Bool)

(declare-fun res!312911 () Bool)

(assert (=> b!512242 (=> (not res!312911) (not e!299184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512242 (= res!312911 (validKeyInArray!0 k0!2280))))

(declare-fun b!512243 () Bool)

(declare-fun res!312910 () Bool)

(assert (=> b!512243 (=> (not res!312910) (not e!299186))))

(assert (=> b!512243 (= res!312910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512244 () Bool)

(declare-fun res!312904 () Bool)

(assert (=> b!512244 (=> (not res!312904) (not e!299186))))

(declare-datatypes ((List!9987 0))(
  ( (Nil!9984) (Cons!9983 (h!10863 (_ BitVec 64)) (t!16215 List!9987)) )
))
(declare-fun arrayNoDuplicates!0 (array!32904 (_ BitVec 32) List!9987) Bool)

(assert (=> b!512244 (= res!312904 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9984))))

(declare-fun b!512245 () Bool)

(declare-fun res!312909 () Bool)

(assert (=> b!512245 (=> res!312909 e!299185)))

(get-info :version)

(assert (=> b!512245 (= res!312909 (or (not ((_ is Intermediate!4296) lt!234462)) (not (undefined!5108 lt!234462))))))

(declare-fun b!512246 () Bool)

(declare-fun res!312907 () Bool)

(assert (=> b!512246 (=> (not res!312907) (not e!299184))))

(assert (=> b!512246 (= res!312907 (validKeyInArray!0 (select (arr!15829 a!3235) j!176)))))

(declare-fun b!512247 () Bool)

(declare-fun res!312903 () Bool)

(assert (=> b!512247 (=> (not res!312903) (not e!299184))))

(declare-fun arrayContainsKey!0 (array!32904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512247 (= res!312903 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512248 () Bool)

(declare-fun res!312905 () Bool)

(assert (=> b!512248 (=> (not res!312905) (not e!299184))))

(assert (=> b!512248 (= res!312905 (and (= (size!16193 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16193 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16193 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512249 () Bool)

(assert (=> b!512249 (= e!299184 e!299186)))

(declare-fun res!312906 () Bool)

(assert (=> b!512249 (=> (not res!312906) (not e!299186))))

(declare-fun lt!234461 () SeekEntryResult!4296)

(assert (=> b!512249 (= res!312906 (or (= lt!234461 (MissingZero!4296 i!1204)) (= lt!234461 (MissingVacant!4296 i!1204))))))

(assert (=> b!512249 (= lt!234461 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!46250 res!312908) b!512248))

(assert (= (and b!512248 res!312905) b!512246))

(assert (= (and b!512246 res!312907) b!512242))

(assert (= (and b!512242 res!312911) b!512247))

(assert (= (and b!512247 res!312903) b!512249))

(assert (= (and b!512249 res!312906) b!512243))

(assert (= (and b!512243 res!312910) b!512244))

(assert (= (and b!512244 res!312904) b!512241))

(assert (= (and b!512241 (not res!312902)) b!512245))

(assert (= (and b!512245 (not res!312909)) b!512240))

(declare-fun m!493857 () Bool)

(assert (=> b!512249 m!493857))

(declare-fun m!493859 () Bool)

(assert (=> b!512244 m!493859))

(declare-fun m!493861 () Bool)

(assert (=> b!512246 m!493861))

(assert (=> b!512246 m!493861))

(declare-fun m!493863 () Bool)

(assert (=> b!512246 m!493863))

(declare-fun m!493865 () Bool)

(assert (=> b!512247 m!493865))

(declare-fun m!493867 () Bool)

(assert (=> b!512243 m!493867))

(declare-fun m!493869 () Bool)

(assert (=> b!512242 m!493869))

(declare-fun m!493871 () Bool)

(assert (=> start!46250 m!493871))

(declare-fun m!493873 () Bool)

(assert (=> start!46250 m!493873))

(declare-fun m!493875 () Bool)

(assert (=> b!512241 m!493875))

(declare-fun m!493877 () Bool)

(assert (=> b!512241 m!493877))

(declare-fun m!493879 () Bool)

(assert (=> b!512241 m!493879))

(declare-fun m!493881 () Bool)

(assert (=> b!512241 m!493881))

(assert (=> b!512241 m!493875))

(assert (=> b!512241 m!493861))

(declare-fun m!493883 () Bool)

(assert (=> b!512241 m!493883))

(assert (=> b!512241 m!493861))

(declare-fun m!493885 () Bool)

(assert (=> b!512241 m!493885))

(assert (=> b!512241 m!493861))

(declare-fun m!493887 () Bool)

(assert (=> b!512241 m!493887))

(assert (=> b!512241 m!493875))

(declare-fun m!493889 () Bool)

(assert (=> b!512241 m!493889))

(assert (=> b!512241 m!493861))

(declare-fun m!493891 () Bool)

(assert (=> b!512241 m!493891))

(check-sat (not start!46250) (not b!512247) (not b!512246) (not b!512242) (not b!512249) (not b!512244) (not b!512241) (not b!512243))
(check-sat)
