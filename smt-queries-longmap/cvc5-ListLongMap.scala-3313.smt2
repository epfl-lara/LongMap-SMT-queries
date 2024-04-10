; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45822 () Bool)

(assert start!45822)

(declare-fun b!507346 () Bool)

(declare-fun res!308314 () Bool)

(declare-fun e!296915 () Bool)

(assert (=> b!507346 (=> (not res!308314) (not e!296915))))

(declare-datatypes ((array!32578 0))(
  ( (array!32579 (arr!15669 (Array (_ BitVec 32) (_ BitVec 64))) (size!16033 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32578)

(declare-datatypes ((List!9827 0))(
  ( (Nil!9824) (Cons!9823 (h!10700 (_ BitVec 64)) (t!16055 List!9827)) )
))
(declare-fun arrayNoDuplicates!0 (array!32578 (_ BitVec 32) List!9827) Bool)

(assert (=> b!507346 (= res!308314 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9824))))

(declare-fun res!308308 () Bool)

(declare-fun e!296914 () Bool)

(assert (=> start!45822 (=> (not res!308308) (not e!296914))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45822 (= res!308308 (validMask!0 mask!3524))))

(assert (=> start!45822 e!296914))

(assert (=> start!45822 true))

(declare-fun array_inv!11465 (array!32578) Bool)

(assert (=> start!45822 (array_inv!11465 a!3235)))

(declare-fun b!507347 () Bool)

(declare-fun e!296913 () Bool)

(assert (=> b!507347 (= e!296915 (not e!296913))))

(declare-fun res!308315 () Bool)

(assert (=> b!507347 (=> res!308315 e!296913)))

(declare-datatypes ((SeekEntryResult!4136 0))(
  ( (MissingZero!4136 (index!18732 (_ BitVec 32))) (Found!4136 (index!18733 (_ BitVec 32))) (Intermediate!4136 (undefined!4948 Bool) (index!18734 (_ BitVec 32)) (x!47729 (_ BitVec 32))) (Undefined!4136) (MissingVacant!4136 (index!18735 (_ BitVec 32))) )
))
(declare-fun lt!231647 () SeekEntryResult!4136)

(declare-fun lt!231649 () (_ BitVec 32))

(declare-fun lt!231650 () array!32578)

(declare-fun lt!231651 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32578 (_ BitVec 32)) SeekEntryResult!4136)

(assert (=> b!507347 (= res!308315 (= lt!231647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231649 lt!231651 lt!231650 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231648 () (_ BitVec 32))

(assert (=> b!507347 (= lt!231647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231648 (select (arr!15669 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507347 (= lt!231649 (toIndex!0 lt!231651 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507347 (= lt!231651 (select (store (arr!15669 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507347 (= lt!231648 (toIndex!0 (select (arr!15669 a!3235) j!176) mask!3524))))

(assert (=> b!507347 (= lt!231650 (array!32579 (store (arr!15669 a!3235) i!1204 k!2280) (size!16033 a!3235)))))

(declare-fun e!296912 () Bool)

(assert (=> b!507347 e!296912))

(declare-fun res!308311 () Bool)

(assert (=> b!507347 (=> (not res!308311) (not e!296912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32578 (_ BitVec 32)) Bool)

(assert (=> b!507347 (= res!308311 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15560 0))(
  ( (Unit!15561) )
))
(declare-fun lt!231653 () Unit!15560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15560)

(assert (=> b!507347 (= lt!231653 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507348 () Bool)

(declare-fun res!308312 () Bool)

(assert (=> b!507348 (=> (not res!308312) (not e!296915))))

(assert (=> b!507348 (= res!308312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507349 () Bool)

(declare-fun res!308313 () Bool)

(assert (=> b!507349 (=> (not res!308313) (not e!296914))))

(assert (=> b!507349 (= res!308313 (and (= (size!16033 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16033 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16033 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507350 () Bool)

(declare-fun e!296911 () Bool)

(assert (=> b!507350 (= e!296911 true)))

(declare-fun lt!231655 () SeekEntryResult!4136)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32578 (_ BitVec 32)) SeekEntryResult!4136)

(assert (=> b!507350 (= lt!231655 (seekEntryOrOpen!0 lt!231651 lt!231650 mask!3524))))

(assert (=> b!507350 false))

(declare-fun b!507351 () Bool)

(declare-fun res!308305 () Bool)

(assert (=> b!507351 (=> (not res!308305) (not e!296914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507351 (= res!308305 (validKeyInArray!0 (select (arr!15669 a!3235) j!176)))))

(declare-fun b!507352 () Bool)

(declare-fun res!308307 () Bool)

(assert (=> b!507352 (=> (not res!308307) (not e!296914))))

(assert (=> b!507352 (= res!308307 (validKeyInArray!0 k!2280))))

(declare-fun b!507353 () Bool)

(assert (=> b!507353 (= e!296913 e!296911)))

(declare-fun res!308309 () Bool)

(assert (=> b!507353 (=> res!308309 e!296911)))

(declare-fun lt!231654 () Bool)

(assert (=> b!507353 (= res!308309 (or (and (not lt!231654) (undefined!4948 lt!231647)) (and (not lt!231654) (not (undefined!4948 lt!231647)))))))

(assert (=> b!507353 (= lt!231654 (not (is-Intermediate!4136 lt!231647)))))

(declare-fun b!507354 () Bool)

(declare-fun res!308306 () Bool)

(assert (=> b!507354 (=> (not res!308306) (not e!296914))))

(declare-fun arrayContainsKey!0 (array!32578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507354 (= res!308306 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507355 () Bool)

(assert (=> b!507355 (= e!296914 e!296915)))

(declare-fun res!308310 () Bool)

(assert (=> b!507355 (=> (not res!308310) (not e!296915))))

(declare-fun lt!231652 () SeekEntryResult!4136)

(assert (=> b!507355 (= res!308310 (or (= lt!231652 (MissingZero!4136 i!1204)) (= lt!231652 (MissingVacant!4136 i!1204))))))

(assert (=> b!507355 (= lt!231652 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507356 () Bool)

(assert (=> b!507356 (= e!296912 (= (seekEntryOrOpen!0 (select (arr!15669 a!3235) j!176) a!3235 mask!3524) (Found!4136 j!176)))))

(assert (= (and start!45822 res!308308) b!507349))

(assert (= (and b!507349 res!308313) b!507351))

(assert (= (and b!507351 res!308305) b!507352))

(assert (= (and b!507352 res!308307) b!507354))

(assert (= (and b!507354 res!308306) b!507355))

(assert (= (and b!507355 res!308310) b!507348))

(assert (= (and b!507348 res!308312) b!507346))

(assert (= (and b!507346 res!308314) b!507347))

(assert (= (and b!507347 res!308311) b!507356))

(assert (= (and b!507347 (not res!308315)) b!507353))

(assert (= (and b!507353 (not res!308309)) b!507350))

(declare-fun m!488103 () Bool)

(assert (=> b!507351 m!488103))

(assert (=> b!507351 m!488103))

(declare-fun m!488105 () Bool)

(assert (=> b!507351 m!488105))

(declare-fun m!488107 () Bool)

(assert (=> b!507350 m!488107))

(declare-fun m!488109 () Bool)

(assert (=> b!507355 m!488109))

(declare-fun m!488111 () Bool)

(assert (=> b!507347 m!488111))

(declare-fun m!488113 () Bool)

(assert (=> b!507347 m!488113))

(declare-fun m!488115 () Bool)

(assert (=> b!507347 m!488115))

(declare-fun m!488117 () Bool)

(assert (=> b!507347 m!488117))

(assert (=> b!507347 m!488103))

(declare-fun m!488119 () Bool)

(assert (=> b!507347 m!488119))

(assert (=> b!507347 m!488103))

(declare-fun m!488121 () Bool)

(assert (=> b!507347 m!488121))

(assert (=> b!507347 m!488103))

(declare-fun m!488123 () Bool)

(assert (=> b!507347 m!488123))

(declare-fun m!488125 () Bool)

(assert (=> b!507347 m!488125))

(declare-fun m!488127 () Bool)

(assert (=> b!507352 m!488127))

(declare-fun m!488129 () Bool)

(assert (=> start!45822 m!488129))

(declare-fun m!488131 () Bool)

(assert (=> start!45822 m!488131))

(declare-fun m!488133 () Bool)

(assert (=> b!507354 m!488133))

(assert (=> b!507356 m!488103))

(assert (=> b!507356 m!488103))

(declare-fun m!488135 () Bool)

(assert (=> b!507356 m!488135))

(declare-fun m!488137 () Bool)

(assert (=> b!507348 m!488137))

(declare-fun m!488139 () Bool)

(assert (=> b!507346 m!488139))

(push 1)

