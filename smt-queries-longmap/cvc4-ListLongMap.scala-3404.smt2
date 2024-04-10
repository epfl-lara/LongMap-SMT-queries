; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47152 () Bool)

(assert start!47152)

(declare-fun b!519337 () Bool)

(declare-fun res!317908 () Bool)

(declare-fun e!303024 () Bool)

(assert (=> b!519337 (=> (not res!317908) (not e!303024))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519337 (= res!317908 (validKeyInArray!0 k!2280))))

(declare-fun b!519338 () Bool)

(declare-fun res!317901 () Bool)

(assert (=> b!519338 (=> (not res!317901) (not e!303024))))

(declare-datatypes ((array!33167 0))(
  ( (array!33168 (arr!15944 (Array (_ BitVec 32) (_ BitVec 64))) (size!16308 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33167)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519338 (= res!317901 (validKeyInArray!0 (select (arr!15944 a!3235) j!176)))))

(declare-fun b!519339 () Bool)

(declare-fun res!317905 () Bool)

(assert (=> b!519339 (=> (not res!317905) (not e!303024))))

(declare-fun arrayContainsKey!0 (array!33167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519339 (= res!317905 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519340 () Bool)

(declare-fun res!317898 () Bool)

(declare-fun e!303030 () Bool)

(assert (=> b!519340 (=> (not res!317898) (not e!303030))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33167 (_ BitVec 32)) Bool)

(assert (=> b!519340 (= res!317898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519341 () Bool)

(declare-datatypes ((Unit!16096 0))(
  ( (Unit!16097) )
))
(declare-fun e!303026 () Unit!16096)

(declare-fun Unit!16098 () Unit!16096)

(assert (=> b!519341 (= e!303026 Unit!16098)))

(declare-fun b!519342 () Bool)

(declare-fun e!303027 () Bool)

(assert (=> b!519342 (= e!303027 false)))

(declare-fun b!519343 () Bool)

(declare-fun res!317904 () Bool)

(assert (=> b!519343 (=> (not res!317904) (not e!303024))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519343 (= res!317904 (and (= (size!16308 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16308 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16308 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519344 () Bool)

(declare-fun e!303028 () Bool)

(declare-datatypes ((SeekEntryResult!4411 0))(
  ( (MissingZero!4411 (index!19838 (_ BitVec 32))) (Found!4411 (index!19839 (_ BitVec 32))) (Intermediate!4411 (undefined!5223 Bool) (index!19840 (_ BitVec 32)) (x!48810 (_ BitVec 32))) (Undefined!4411) (MissingVacant!4411 (index!19841 (_ BitVec 32))) )
))
(declare-fun lt!237813 () SeekEntryResult!4411)

(assert (=> b!519344 (= e!303028 (or (= (select (arr!15944 a!3235) (index!19840 lt!237813)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15944 a!3235) (index!19840 lt!237813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!237812 () Unit!16096)

(assert (=> b!519344 (= lt!237812 e!303026)))

(declare-fun c!61016 () Bool)

(assert (=> b!519344 (= c!61016 (= (select (arr!15944 a!3235) (index!19840 lt!237813)) (select (arr!15944 a!3235) j!176)))))

(assert (=> b!519344 (and (bvslt (x!48810 lt!237813) #b01111111111111111111111111111110) (or (= (select (arr!15944 a!3235) (index!19840 lt!237813)) (select (arr!15944 a!3235) j!176)) (= (select (arr!15944 a!3235) (index!19840 lt!237813)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15944 a!3235) (index!19840 lt!237813)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519345 () Bool)

(assert (=> b!519345 (= e!303024 e!303030)))

(declare-fun res!317907 () Bool)

(assert (=> b!519345 (=> (not res!317907) (not e!303030))))

(declare-fun lt!237809 () SeekEntryResult!4411)

(assert (=> b!519345 (= res!317907 (or (= lt!237809 (MissingZero!4411 i!1204)) (= lt!237809 (MissingVacant!4411 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33167 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!519345 (= lt!237809 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!519346 () Bool)

(declare-fun res!317906 () Bool)

(assert (=> b!519346 (=> res!317906 e!303028)))

(assert (=> b!519346 (= res!317906 (or (undefined!5223 lt!237813) (not (is-Intermediate!4411 lt!237813))))))

(declare-fun b!519347 () Bool)

(assert (=> b!519347 (= e!303030 (not e!303028))))

(declare-fun res!317909 () Bool)

(assert (=> b!519347 (=> res!317909 e!303028)))

(declare-fun lt!237810 () array!33167)

(declare-fun lt!237806 () (_ BitVec 64))

(declare-fun lt!237807 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33167 (_ BitVec 32)) SeekEntryResult!4411)

(assert (=> b!519347 (= res!317909 (= lt!237813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237807 lt!237806 lt!237810 mask!3524)))))

(declare-fun lt!237808 () (_ BitVec 32))

(assert (=> b!519347 (= lt!237813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237808 (select (arr!15944 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519347 (= lt!237807 (toIndex!0 lt!237806 mask!3524))))

(assert (=> b!519347 (= lt!237806 (select (store (arr!15944 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519347 (= lt!237808 (toIndex!0 (select (arr!15944 a!3235) j!176) mask!3524))))

(assert (=> b!519347 (= lt!237810 (array!33168 (store (arr!15944 a!3235) i!1204 k!2280) (size!16308 a!3235)))))

(declare-fun e!303025 () Bool)

(assert (=> b!519347 e!303025))

(declare-fun res!317902 () Bool)

(assert (=> b!519347 (=> (not res!317902) (not e!303025))))

(assert (=> b!519347 (= res!317902 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237814 () Unit!16096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16096)

(assert (=> b!519347 (= lt!237814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519348 () Bool)

(declare-fun Unit!16099 () Unit!16096)

(assert (=> b!519348 (= e!303026 Unit!16099)))

(declare-fun lt!237811 () Unit!16096)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33167 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16096)

(assert (=> b!519348 (= lt!237811 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237808 #b00000000000000000000000000000000 (index!19840 lt!237813) (x!48810 lt!237813) mask!3524))))

(declare-fun res!317899 () Bool)

(assert (=> b!519348 (= res!317899 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237808 lt!237806 lt!237810 mask!3524) (Intermediate!4411 false (index!19840 lt!237813) (x!48810 lt!237813))))))

(assert (=> b!519348 (=> (not res!317899) (not e!303027))))

(assert (=> b!519348 e!303027))

(declare-fun b!519349 () Bool)

(declare-fun res!317900 () Bool)

(assert (=> b!519349 (=> (not res!317900) (not e!303030))))

(declare-datatypes ((List!10102 0))(
  ( (Nil!10099) (Cons!10098 (h!11011 (_ BitVec 64)) (t!16330 List!10102)) )
))
(declare-fun arrayNoDuplicates!0 (array!33167 (_ BitVec 32) List!10102) Bool)

(assert (=> b!519349 (= res!317900 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10099))))

(declare-fun b!519350 () Bool)

(assert (=> b!519350 (= e!303025 (= (seekEntryOrOpen!0 (select (arr!15944 a!3235) j!176) a!3235 mask!3524) (Found!4411 j!176)))))

(declare-fun res!317903 () Bool)

(assert (=> start!47152 (=> (not res!317903) (not e!303024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47152 (= res!317903 (validMask!0 mask!3524))))

(assert (=> start!47152 e!303024))

(assert (=> start!47152 true))

(declare-fun array_inv!11740 (array!33167) Bool)

(assert (=> start!47152 (array_inv!11740 a!3235)))

(assert (= (and start!47152 res!317903) b!519343))

(assert (= (and b!519343 res!317904) b!519338))

(assert (= (and b!519338 res!317901) b!519337))

(assert (= (and b!519337 res!317908) b!519339))

(assert (= (and b!519339 res!317905) b!519345))

(assert (= (and b!519345 res!317907) b!519340))

(assert (= (and b!519340 res!317898) b!519349))

(assert (= (and b!519349 res!317900) b!519347))

(assert (= (and b!519347 res!317902) b!519350))

(assert (= (and b!519347 (not res!317909)) b!519346))

(assert (= (and b!519346 (not res!317906)) b!519344))

(assert (= (and b!519344 c!61016) b!519348))

(assert (= (and b!519344 (not c!61016)) b!519341))

(assert (= (and b!519348 res!317899) b!519342))

(declare-fun m!500529 () Bool)

(assert (=> start!47152 m!500529))

(declare-fun m!500531 () Bool)

(assert (=> start!47152 m!500531))

(declare-fun m!500533 () Bool)

(assert (=> b!519338 m!500533))

(assert (=> b!519338 m!500533))

(declare-fun m!500535 () Bool)

(assert (=> b!519338 m!500535))

(declare-fun m!500537 () Bool)

(assert (=> b!519348 m!500537))

(declare-fun m!500539 () Bool)

(assert (=> b!519348 m!500539))

(declare-fun m!500541 () Bool)

(assert (=> b!519344 m!500541))

(assert (=> b!519344 m!500533))

(assert (=> b!519347 m!500533))

(declare-fun m!500543 () Bool)

(assert (=> b!519347 m!500543))

(declare-fun m!500545 () Bool)

(assert (=> b!519347 m!500545))

(declare-fun m!500547 () Bool)

(assert (=> b!519347 m!500547))

(declare-fun m!500549 () Bool)

(assert (=> b!519347 m!500549))

(declare-fun m!500551 () Bool)

(assert (=> b!519347 m!500551))

(declare-fun m!500553 () Bool)

(assert (=> b!519347 m!500553))

(assert (=> b!519347 m!500533))

(declare-fun m!500555 () Bool)

(assert (=> b!519347 m!500555))

(assert (=> b!519347 m!500533))

(declare-fun m!500557 () Bool)

(assert (=> b!519347 m!500557))

(declare-fun m!500559 () Bool)

(assert (=> b!519349 m!500559))

(declare-fun m!500561 () Bool)

(assert (=> b!519345 m!500561))

(assert (=> b!519350 m!500533))

(assert (=> b!519350 m!500533))

(declare-fun m!500563 () Bool)

(assert (=> b!519350 m!500563))

(declare-fun m!500565 () Bool)

(assert (=> b!519340 m!500565))

(declare-fun m!500567 () Bool)

(assert (=> b!519339 m!500567))

(declare-fun m!500569 () Bool)

(assert (=> b!519337 m!500569))

(push 1)

(assert (not b!519340))

(assert (not b!519347))

(assert (not b!519338))

(assert (not b!519345))

(assert (not b!519350))

(assert (not b!519339))

(assert (not b!519349))

(assert (not b!519337))

(assert (not start!47152))

