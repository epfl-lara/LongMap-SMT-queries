; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46976 () Bool)

(assert start!46976)

(declare-fun b!517974 () Bool)

(declare-fun e!302252 () Bool)

(declare-fun e!302250 () Bool)

(assert (=> b!517974 (= e!302252 e!302250)))

(declare-fun res!317048 () Bool)

(assert (=> b!517974 (=> (not res!317048) (not e!302250))))

(declare-datatypes ((SeekEntryResult!4345 0))(
  ( (MissingZero!4345 (index!19568 (_ BitVec 32))) (Found!4345 (index!19569 (_ BitVec 32))) (Intermediate!4345 (undefined!5157 Bool) (index!19570 (_ BitVec 32)) (x!48683 (_ BitVec 32))) (Undefined!4345) (MissingVacant!4345 (index!19571 (_ BitVec 32))) )
))
(declare-fun lt!237144 () SeekEntryResult!4345)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517974 (= res!317048 (or (= lt!237144 (MissingZero!4345 i!1204)) (= lt!237144 (MissingVacant!4345 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33118 0))(
  ( (array!33119 (arr!15922 (Array (_ BitVec 32) (_ BitVec 64))) (size!16286 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33118)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33118 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!517974 (= lt!237144 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!317045 () Bool)

(assert (=> start!46976 (=> (not res!317045) (not e!302252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46976 (= res!317045 (validMask!0 mask!3524))))

(assert (=> start!46976 e!302252))

(assert (=> start!46976 true))

(declare-fun array_inv!11781 (array!33118) Bool)

(assert (=> start!46976 (array_inv!11781 a!3235)))

(declare-fun b!517975 () Bool)

(declare-fun res!317052 () Bool)

(assert (=> b!517975 (=> (not res!317052) (not e!302250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33118 (_ BitVec 32)) Bool)

(assert (=> b!517975 (= res!317052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun lt!237146 () (_ BitVec 32))

(declare-fun e!302253 () Bool)

(declare-fun b!517976 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!237148 () SeekEntryResult!4345)

(assert (=> b!517976 (= e!302253 (or (not (= (select (arr!15922 a!3235) (index!19570 lt!237148)) (select (arr!15922 a!3235) j!176))) (bvsgt (x!48683 lt!237148) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48683 lt!237148)) (bvslt lt!237146 #b00000000000000000000000000000000) (bvsge lt!237146 (size!16286 a!3235)) (bvslt (index!19570 lt!237148) #b00000000000000000000000000000000) (bvsge (index!19570 lt!237148) (size!16286 a!3235)) (= lt!237148 (Intermediate!4345 false (index!19570 lt!237148) (x!48683 lt!237148)))))))

(assert (=> b!517976 (and (bvslt (x!48683 lt!237148) #b01111111111111111111111111111110) (or (= (select (arr!15922 a!3235) (index!19570 lt!237148)) (select (arr!15922 a!3235) j!176)) (= (select (arr!15922 a!3235) (index!19570 lt!237148)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15922 a!3235) (index!19570 lt!237148)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517977 () Bool)

(assert (=> b!517977 (= e!302250 (not e!302253))))

(declare-fun res!317050 () Bool)

(assert (=> b!517977 (=> res!317050 e!302253)))

(declare-fun lt!237147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33118 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!517977 (= res!317050 (= lt!237148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237147 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) (array!33119 (store (arr!15922 a!3235) i!1204 k0!2280) (size!16286 a!3235)) mask!3524)))))

(assert (=> b!517977 (= lt!237148 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237146 (select (arr!15922 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517977 (= lt!237147 (toIndex!0 (select (store (arr!15922 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517977 (= lt!237146 (toIndex!0 (select (arr!15922 a!3235) j!176) mask!3524))))

(declare-fun e!302249 () Bool)

(assert (=> b!517977 e!302249))

(declare-fun res!317051 () Bool)

(assert (=> b!517977 (=> (not res!317051) (not e!302249))))

(assert (=> b!517977 (= res!317051 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16009 0))(
  ( (Unit!16010) )
))
(declare-fun lt!237145 () Unit!16009)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16009)

(assert (=> b!517977 (= lt!237145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517978 () Bool)

(declare-fun res!317044 () Bool)

(assert (=> b!517978 (=> (not res!317044) (not e!302250))))

(declare-datatypes ((List!9987 0))(
  ( (Nil!9984) (Cons!9983 (h!10890 (_ BitVec 64)) (t!16207 List!9987)) )
))
(declare-fun arrayNoDuplicates!0 (array!33118 (_ BitVec 32) List!9987) Bool)

(assert (=> b!517978 (= res!317044 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9984))))

(declare-fun b!517979 () Bool)

(assert (=> b!517979 (= e!302249 (= (seekEntryOrOpen!0 (select (arr!15922 a!3235) j!176) a!3235 mask!3524) (Found!4345 j!176)))))

(declare-fun b!517980 () Bool)

(declare-fun res!317043 () Bool)

(assert (=> b!517980 (=> (not res!317043) (not e!302252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517980 (= res!317043 (validKeyInArray!0 k0!2280))))

(declare-fun b!517981 () Bool)

(declare-fun res!317049 () Bool)

(assert (=> b!517981 (=> (not res!317049) (not e!302252))))

(declare-fun arrayContainsKey!0 (array!33118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517981 (= res!317049 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517982 () Bool)

(declare-fun res!317053 () Bool)

(assert (=> b!517982 (=> res!317053 e!302253)))

(get-info :version)

(assert (=> b!517982 (= res!317053 (or (undefined!5157 lt!237148) (not ((_ is Intermediate!4345) lt!237148))))))

(declare-fun b!517983 () Bool)

(declare-fun res!317047 () Bool)

(assert (=> b!517983 (=> (not res!317047) (not e!302252))))

(assert (=> b!517983 (= res!317047 (and (= (size!16286 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16286 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16286 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517984 () Bool)

(declare-fun res!317046 () Bool)

(assert (=> b!517984 (=> (not res!317046) (not e!302252))))

(assert (=> b!517984 (= res!317046 (validKeyInArray!0 (select (arr!15922 a!3235) j!176)))))

(assert (= (and start!46976 res!317045) b!517983))

(assert (= (and b!517983 res!317047) b!517984))

(assert (= (and b!517984 res!317046) b!517980))

(assert (= (and b!517980 res!317043) b!517981))

(assert (= (and b!517981 res!317049) b!517974))

(assert (= (and b!517974 res!317048) b!517975))

(assert (= (and b!517975 res!317052) b!517978))

(assert (= (and b!517978 res!317044) b!517977))

(assert (= (and b!517977 res!317051) b!517979))

(assert (= (and b!517977 (not res!317050)) b!517982))

(assert (= (and b!517982 (not res!317053)) b!517976))

(declare-fun m!499555 () Bool)

(assert (=> b!517976 m!499555))

(declare-fun m!499557 () Bool)

(assert (=> b!517976 m!499557))

(declare-fun m!499559 () Bool)

(assert (=> b!517981 m!499559))

(declare-fun m!499561 () Bool)

(assert (=> b!517974 m!499561))

(declare-fun m!499563 () Bool)

(assert (=> b!517977 m!499563))

(declare-fun m!499565 () Bool)

(assert (=> b!517977 m!499565))

(declare-fun m!499567 () Bool)

(assert (=> b!517977 m!499567))

(declare-fun m!499569 () Bool)

(assert (=> b!517977 m!499569))

(assert (=> b!517977 m!499565))

(assert (=> b!517977 m!499557))

(declare-fun m!499571 () Bool)

(assert (=> b!517977 m!499571))

(assert (=> b!517977 m!499557))

(declare-fun m!499573 () Bool)

(assert (=> b!517977 m!499573))

(assert (=> b!517977 m!499557))

(declare-fun m!499575 () Bool)

(assert (=> b!517977 m!499575))

(assert (=> b!517977 m!499565))

(declare-fun m!499577 () Bool)

(assert (=> b!517977 m!499577))

(declare-fun m!499579 () Bool)

(assert (=> b!517975 m!499579))

(declare-fun m!499581 () Bool)

(assert (=> b!517978 m!499581))

(declare-fun m!499583 () Bool)

(assert (=> b!517980 m!499583))

(declare-fun m!499585 () Bool)

(assert (=> start!46976 m!499585))

(declare-fun m!499587 () Bool)

(assert (=> start!46976 m!499587))

(assert (=> b!517979 m!499557))

(assert (=> b!517979 m!499557))

(declare-fun m!499589 () Bool)

(assert (=> b!517979 m!499589))

(assert (=> b!517984 m!499557))

(assert (=> b!517984 m!499557))

(declare-fun m!499591 () Bool)

(assert (=> b!517984 m!499591))

(check-sat (not b!517975) (not b!517981) (not b!517984) (not b!517977) (not b!517979) (not b!517978) (not start!46976) (not b!517980) (not b!517974))
(check-sat)
