; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45250 () Bool)

(assert start!45250)

(declare-fun b!496949 () Bool)

(declare-fun res!299341 () Bool)

(declare-fun e!291355 () Bool)

(assert (=> b!496949 (=> (not res!299341) (not e!291355))))

(declare-datatypes ((array!32138 0))(
  ( (array!32139 (arr!15452 (Array (_ BitVec 32) (_ BitVec 64))) (size!15816 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32138)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32138 (_ BitVec 32)) Bool)

(assert (=> b!496949 (= res!299341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496950 () Bool)

(declare-fun e!291353 () Bool)

(assert (=> b!496950 (= e!291355 (not e!291353))))

(declare-fun res!299335 () Bool)

(assert (=> b!496950 (=> res!299335 e!291353)))

(declare-datatypes ((SeekEntryResult!3919 0))(
  ( (MissingZero!3919 (index!17855 (_ BitVec 32))) (Found!3919 (index!17856 (_ BitVec 32))) (Intermediate!3919 (undefined!4731 Bool) (index!17857 (_ BitVec 32)) (x!46907 (_ BitVec 32))) (Undefined!3919) (MissingVacant!3919 (index!17858 (_ BitVec 32))) )
))
(declare-fun lt!224974 () SeekEntryResult!3919)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!224977 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32138 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!496950 (= res!299335 (= lt!224974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224977 (select (store (arr!15452 a!3235) i!1204 k!2280) j!176) (array!32139 (store (arr!15452 a!3235) i!1204 k!2280) (size!15816 a!3235)) mask!3524)))))

(declare-fun lt!224973 () (_ BitVec 32))

(assert (=> b!496950 (= lt!224974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224973 (select (arr!15452 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496950 (= lt!224977 (toIndex!0 (select (store (arr!15452 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496950 (= lt!224973 (toIndex!0 (select (arr!15452 a!3235) j!176) mask!3524))))

(declare-fun e!291354 () Bool)

(assert (=> b!496950 e!291354))

(declare-fun res!299345 () Bool)

(assert (=> b!496950 (=> (not res!299345) (not e!291354))))

(assert (=> b!496950 (= res!299345 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14784 0))(
  ( (Unit!14785) )
))
(declare-fun lt!224976 () Unit!14784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14784)

(assert (=> b!496950 (= lt!224976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496951 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32138 (_ BitVec 32)) SeekEntryResult!3919)

(assert (=> b!496951 (= e!291354 (= (seekEntryOrOpen!0 (select (arr!15452 a!3235) j!176) a!3235 mask!3524) (Found!3919 j!176)))))

(declare-fun b!496952 () Bool)

(declare-fun res!299337 () Bool)

(assert (=> b!496952 (=> res!299337 e!291353)))

(assert (=> b!496952 (= res!299337 (or (undefined!4731 lt!224974) (not (is-Intermediate!3919 lt!224974))))))

(declare-fun b!496953 () Bool)

(assert (=> b!496953 (= e!291353 true)))

(assert (=> b!496953 (and (bvslt (x!46907 lt!224974) #b01111111111111111111111111111110) (or (= (select (arr!15452 a!3235) (index!17857 lt!224974)) (select (arr!15452 a!3235) j!176)) (= (select (arr!15452 a!3235) (index!17857 lt!224974)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15452 a!3235) (index!17857 lt!224974)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496954 () Bool)

(declare-fun res!299342 () Bool)

(declare-fun e!291357 () Bool)

(assert (=> b!496954 (=> (not res!299342) (not e!291357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496954 (= res!299342 (validKeyInArray!0 k!2280))))

(declare-fun b!496955 () Bool)

(assert (=> b!496955 (= e!291357 e!291355)))

(declare-fun res!299343 () Bool)

(assert (=> b!496955 (=> (not res!299343) (not e!291355))))

(declare-fun lt!224975 () SeekEntryResult!3919)

(assert (=> b!496955 (= res!299343 (or (= lt!224975 (MissingZero!3919 i!1204)) (= lt!224975 (MissingVacant!3919 i!1204))))))

(assert (=> b!496955 (= lt!224975 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496956 () Bool)

(declare-fun res!299344 () Bool)

(assert (=> b!496956 (=> (not res!299344) (not e!291357))))

(assert (=> b!496956 (= res!299344 (validKeyInArray!0 (select (arr!15452 a!3235) j!176)))))

(declare-fun b!496957 () Bool)

(declare-fun res!299338 () Bool)

(assert (=> b!496957 (=> (not res!299338) (not e!291355))))

(declare-datatypes ((List!9610 0))(
  ( (Nil!9607) (Cons!9606 (h!10477 (_ BitVec 64)) (t!15838 List!9610)) )
))
(declare-fun arrayNoDuplicates!0 (array!32138 (_ BitVec 32) List!9610) Bool)

(assert (=> b!496957 (= res!299338 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9607))))

(declare-fun b!496958 () Bool)

(declare-fun res!299336 () Bool)

(assert (=> b!496958 (=> (not res!299336) (not e!291357))))

(assert (=> b!496958 (= res!299336 (and (= (size!15816 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15816 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15816 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299339 () Bool)

(assert (=> start!45250 (=> (not res!299339) (not e!291357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45250 (= res!299339 (validMask!0 mask!3524))))

(assert (=> start!45250 e!291357))

(assert (=> start!45250 true))

(declare-fun array_inv!11248 (array!32138) Bool)

(assert (=> start!45250 (array_inv!11248 a!3235)))

(declare-fun b!496948 () Bool)

(declare-fun res!299340 () Bool)

(assert (=> b!496948 (=> (not res!299340) (not e!291357))))

(declare-fun arrayContainsKey!0 (array!32138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496948 (= res!299340 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45250 res!299339) b!496958))

(assert (= (and b!496958 res!299336) b!496956))

(assert (= (and b!496956 res!299344) b!496954))

(assert (= (and b!496954 res!299342) b!496948))

(assert (= (and b!496948 res!299340) b!496955))

(assert (= (and b!496955 res!299343) b!496949))

(assert (= (and b!496949 res!299341) b!496957))

(assert (= (and b!496957 res!299338) b!496950))

(assert (= (and b!496950 res!299345) b!496951))

(assert (= (and b!496950 (not res!299335)) b!496952))

(assert (= (and b!496952 (not res!299337)) b!496953))

(declare-fun m!478261 () Bool)

(assert (=> b!496950 m!478261))

(declare-fun m!478263 () Bool)

(assert (=> b!496950 m!478263))

(declare-fun m!478265 () Bool)

(assert (=> b!496950 m!478265))

(declare-fun m!478267 () Bool)

(assert (=> b!496950 m!478267))

(declare-fun m!478269 () Bool)

(assert (=> b!496950 m!478269))

(assert (=> b!496950 m!478269))

(declare-fun m!478271 () Bool)

(assert (=> b!496950 m!478271))

(assert (=> b!496950 m!478261))

(declare-fun m!478273 () Bool)

(assert (=> b!496950 m!478273))

(assert (=> b!496950 m!478261))

(declare-fun m!478275 () Bool)

(assert (=> b!496950 m!478275))

(assert (=> b!496950 m!478269))

(declare-fun m!478277 () Bool)

(assert (=> b!496950 m!478277))

(assert (=> b!496951 m!478261))

(assert (=> b!496951 m!478261))

(declare-fun m!478279 () Bool)

(assert (=> b!496951 m!478279))

(declare-fun m!478281 () Bool)

(assert (=> b!496955 m!478281))

(declare-fun m!478283 () Bool)

(assert (=> start!45250 m!478283))

(declare-fun m!478285 () Bool)

(assert (=> start!45250 m!478285))

(declare-fun m!478287 () Bool)

(assert (=> b!496948 m!478287))

(declare-fun m!478289 () Bool)

(assert (=> b!496949 m!478289))

(declare-fun m!478291 () Bool)

(assert (=> b!496953 m!478291))

(assert (=> b!496953 m!478261))

(declare-fun m!478293 () Bool)

(assert (=> b!496954 m!478293))

(assert (=> b!496956 m!478261))

(assert (=> b!496956 m!478261))

(declare-fun m!478295 () Bool)

(assert (=> b!496956 m!478295))

(declare-fun m!478297 () Bool)

(assert (=> b!496957 m!478297))

(push 1)

(assert (not b!496951))

(assert (not b!496949))

(assert (not b!496956))

(assert (not b!496948))

(assert (not start!45250))

(assert (not b!496950))

(assert (not b!496954))

(assert (not b!496955))

(assert (not b!496957))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

