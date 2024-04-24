; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45446 () Bool)

(assert start!45446)

(declare-fun b!500162 () Bool)

(declare-fun res!302081 () Bool)

(declare-fun e!293053 () Bool)

(assert (=> b!500162 (=> (not res!302081) (not e!293053))))

(declare-datatypes ((array!32272 0))(
  ( (array!32273 (arr!15517 (Array (_ BitVec 32) (_ BitVec 64))) (size!15881 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32272)

(declare-datatypes ((List!9582 0))(
  ( (Nil!9579) (Cons!9578 (h!10452 (_ BitVec 64)) (t!15802 List!9582)) )
))
(declare-fun arrayNoDuplicates!0 (array!32272 (_ BitVec 32) List!9582) Bool)

(assert (=> b!500162 (= res!302081 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9579))))

(declare-fun b!500163 () Bool)

(declare-fun e!293050 () Bool)

(assert (=> b!500163 (= e!293050 true)))

(declare-fun lt!226982 () array!32272)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3940 0))(
  ( (MissingZero!3940 (index!17942 (_ BitVec 32))) (Found!3940 (index!17943 (_ BitVec 32))) (Intermediate!3940 (undefined!4752 Bool) (index!17944 (_ BitVec 32)) (x!47126 (_ BitVec 32))) (Undefined!3940) (MissingVacant!3940 (index!17945 (_ BitVec 32))) )
))
(declare-fun lt!226987 () SeekEntryResult!3940)

(declare-fun lt!226981 () (_ BitVec 64))

(declare-fun lt!226989 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32272 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!500163 (= lt!226987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226989 lt!226981 lt!226982 mask!3524))))

(declare-fun b!500164 () Bool)

(declare-datatypes ((Unit!14995 0))(
  ( (Unit!14996) )
))
(declare-fun e!293052 () Unit!14995)

(declare-fun Unit!14997 () Unit!14995)

(assert (=> b!500164 (= e!293052 Unit!14997)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226986 () Unit!14995)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226985 () SeekEntryResult!3940)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32272 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14995)

(assert (=> b!500164 (= lt!226986 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226989 #b00000000000000000000000000000000 (index!17944 lt!226985) (x!47126 lt!226985) mask!3524))))

(declare-fun res!302085 () Bool)

(assert (=> b!500164 (= res!302085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226989 lt!226981 lt!226982 mask!3524) (Intermediate!3940 false (index!17944 lt!226985) (x!47126 lt!226985))))))

(declare-fun e!293054 () Bool)

(assert (=> b!500164 (=> (not res!302085) (not e!293054))))

(assert (=> b!500164 e!293054))

(declare-fun b!500165 () Bool)

(declare-fun e!293048 () Bool)

(assert (=> b!500165 (= e!293048 e!293053)))

(declare-fun res!302079 () Bool)

(assert (=> b!500165 (=> (not res!302079) (not e!293053))))

(declare-fun lt!226984 () SeekEntryResult!3940)

(assert (=> b!500165 (= res!302079 (or (= lt!226984 (MissingZero!3940 i!1204)) (= lt!226984 (MissingVacant!3940 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32272 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!500165 (= lt!226984 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500166 () Bool)

(declare-fun Unit!14998 () Unit!14995)

(assert (=> b!500166 (= e!293052 Unit!14998)))

(declare-fun b!500167 () Bool)

(declare-fun res!302077 () Bool)

(assert (=> b!500167 (=> (not res!302077) (not e!293053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32272 (_ BitVec 32)) Bool)

(assert (=> b!500167 (= res!302077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500168 () Bool)

(declare-fun res!302084 () Bool)

(assert (=> b!500168 (=> (not res!302084) (not e!293048))))

(declare-fun arrayContainsKey!0 (array!32272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500168 (= res!302084 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500169 () Bool)

(declare-fun e!293051 () Bool)

(assert (=> b!500169 (= e!293053 (not e!293051))))

(declare-fun res!302086 () Bool)

(assert (=> b!500169 (=> res!302086 e!293051)))

(declare-fun lt!226983 () (_ BitVec 32))

(assert (=> b!500169 (= res!302086 (= lt!226985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226983 lt!226981 lt!226982 mask!3524)))))

(assert (=> b!500169 (= lt!226985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226989 (select (arr!15517 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500169 (= lt!226983 (toIndex!0 lt!226981 mask!3524))))

(assert (=> b!500169 (= lt!226981 (select (store (arr!15517 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500169 (= lt!226989 (toIndex!0 (select (arr!15517 a!3235) j!176) mask!3524))))

(assert (=> b!500169 (= lt!226982 (array!32273 (store (arr!15517 a!3235) i!1204 k0!2280) (size!15881 a!3235)))))

(declare-fun e!293049 () Bool)

(assert (=> b!500169 e!293049))

(declare-fun res!302074 () Bool)

(assert (=> b!500169 (=> (not res!302074) (not e!293049))))

(assert (=> b!500169 (= res!302074 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226988 () Unit!14995)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14995)

(assert (=> b!500169 (= lt!226988 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500171 () Bool)

(assert (=> b!500171 (= e!293054 false)))

(declare-fun b!500172 () Bool)

(assert (=> b!500172 (= e!293051 e!293050)))

(declare-fun res!302075 () Bool)

(assert (=> b!500172 (=> res!302075 e!293050)))

(assert (=> b!500172 (= res!302075 (or (bvsgt #b00000000000000000000000000000000 (x!47126 lt!226985)) (bvsgt (x!47126 lt!226985) #b01111111111111111111111111111110) (bvslt lt!226989 #b00000000000000000000000000000000) (bvsge lt!226989 (size!15881 a!3235)) (bvslt (index!17944 lt!226985) #b00000000000000000000000000000000) (bvsge (index!17944 lt!226985) (size!15881 a!3235)) (not (= lt!226985 (Intermediate!3940 false (index!17944 lt!226985) (x!47126 lt!226985))))))))

(assert (=> b!500172 (and (or (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226990 () Unit!14995)

(assert (=> b!500172 (= lt!226990 e!293052)))

(declare-fun c!59321 () Bool)

(assert (=> b!500172 (= c!59321 (= (select (arr!15517 a!3235) (index!17944 lt!226985)) (select (arr!15517 a!3235) j!176)))))

(assert (=> b!500172 (and (bvslt (x!47126 lt!226985) #b01111111111111111111111111111110) (or (= (select (arr!15517 a!3235) (index!17944 lt!226985)) (select (arr!15517 a!3235) j!176)) (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15517 a!3235) (index!17944 lt!226985)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500173 () Bool)

(declare-fun res!302082 () Bool)

(assert (=> b!500173 (=> (not res!302082) (not e!293048))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500173 (= res!302082 (validKeyInArray!0 (select (arr!15517 a!3235) j!176)))))

(declare-fun b!500174 () Bool)

(assert (=> b!500174 (= e!293049 (= (seekEntryOrOpen!0 (select (arr!15517 a!3235) j!176) a!3235 mask!3524) (Found!3940 j!176)))))

(declare-fun b!500175 () Bool)

(declare-fun res!302078 () Bool)

(assert (=> b!500175 (=> res!302078 e!293051)))

(get-info :version)

(assert (=> b!500175 (= res!302078 (or (undefined!4752 lt!226985) (not ((_ is Intermediate!3940) lt!226985))))))

(declare-fun b!500176 () Bool)

(declare-fun res!302076 () Bool)

(assert (=> b!500176 (=> (not res!302076) (not e!293048))))

(assert (=> b!500176 (= res!302076 (validKeyInArray!0 k0!2280))))

(declare-fun res!302080 () Bool)

(assert (=> start!45446 (=> (not res!302080) (not e!293048))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45446 (= res!302080 (validMask!0 mask!3524))))

(assert (=> start!45446 e!293048))

(assert (=> start!45446 true))

(declare-fun array_inv!11376 (array!32272) Bool)

(assert (=> start!45446 (array_inv!11376 a!3235)))

(declare-fun b!500170 () Bool)

(declare-fun res!302083 () Bool)

(assert (=> b!500170 (=> (not res!302083) (not e!293048))))

(assert (=> b!500170 (= res!302083 (and (= (size!15881 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15881 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15881 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45446 res!302080) b!500170))

(assert (= (and b!500170 res!302083) b!500173))

(assert (= (and b!500173 res!302082) b!500176))

(assert (= (and b!500176 res!302076) b!500168))

(assert (= (and b!500168 res!302084) b!500165))

(assert (= (and b!500165 res!302079) b!500167))

(assert (= (and b!500167 res!302077) b!500162))

(assert (= (and b!500162 res!302081) b!500169))

(assert (= (and b!500169 res!302074) b!500174))

(assert (= (and b!500169 (not res!302086)) b!500175))

(assert (= (and b!500175 (not res!302078)) b!500172))

(assert (= (and b!500172 c!59321) b!500164))

(assert (= (and b!500172 (not c!59321)) b!500166))

(assert (= (and b!500164 res!302085) b!500171))

(assert (= (and b!500172 (not res!302075)) b!500163))

(declare-fun m!481555 () Bool)

(assert (=> b!500165 m!481555))

(declare-fun m!481557 () Bool)

(assert (=> b!500176 m!481557))

(declare-fun m!481559 () Bool)

(assert (=> b!500168 m!481559))

(declare-fun m!481561 () Bool)

(assert (=> b!500162 m!481561))

(declare-fun m!481563 () Bool)

(assert (=> b!500167 m!481563))

(declare-fun m!481565 () Bool)

(assert (=> start!45446 m!481565))

(declare-fun m!481567 () Bool)

(assert (=> start!45446 m!481567))

(declare-fun m!481569 () Bool)

(assert (=> b!500169 m!481569))

(declare-fun m!481571 () Bool)

(assert (=> b!500169 m!481571))

(declare-fun m!481573 () Bool)

(assert (=> b!500169 m!481573))

(declare-fun m!481575 () Bool)

(assert (=> b!500169 m!481575))

(declare-fun m!481577 () Bool)

(assert (=> b!500169 m!481577))

(assert (=> b!500169 m!481575))

(declare-fun m!481579 () Bool)

(assert (=> b!500169 m!481579))

(assert (=> b!500169 m!481575))

(declare-fun m!481581 () Bool)

(assert (=> b!500169 m!481581))

(declare-fun m!481583 () Bool)

(assert (=> b!500169 m!481583))

(declare-fun m!481585 () Bool)

(assert (=> b!500169 m!481585))

(declare-fun m!481587 () Bool)

(assert (=> b!500163 m!481587))

(assert (=> b!500173 m!481575))

(assert (=> b!500173 m!481575))

(declare-fun m!481589 () Bool)

(assert (=> b!500173 m!481589))

(declare-fun m!481591 () Bool)

(assert (=> b!500164 m!481591))

(assert (=> b!500164 m!481587))

(assert (=> b!500174 m!481575))

(assert (=> b!500174 m!481575))

(declare-fun m!481593 () Bool)

(assert (=> b!500174 m!481593))

(declare-fun m!481595 () Bool)

(assert (=> b!500172 m!481595))

(assert (=> b!500172 m!481575))

(check-sat (not b!500173) (not b!500168) (not b!500174) (not b!500165) (not start!45446) (not b!500176) (not b!500164) (not b!500163) (not b!500167) (not b!500169) (not b!500162))
(check-sat)
