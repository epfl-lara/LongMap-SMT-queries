; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44614 () Bool)

(assert start!44614)

(declare-fun b!489381 () Bool)

(declare-fun res!292324 () Bool)

(declare-fun e!287835 () Bool)

(assert (=> b!489381 (=> (not res!292324) (not e!287835))))

(declare-datatypes ((array!31673 0))(
  ( (array!31674 (arr!15224 (Array (_ BitVec 32) (_ BitVec 64))) (size!15588 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31673)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31673 (_ BitVec 32)) Bool)

(assert (=> b!489381 (= res!292324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489382 () Bool)

(declare-fun res!292319 () Bool)

(assert (=> b!489382 (=> (not res!292319) (not e!287835))))

(declare-datatypes ((List!9382 0))(
  ( (Nil!9379) (Cons!9378 (h!10240 (_ BitVec 64)) (t!15610 List!9382)) )
))
(declare-fun arrayNoDuplicates!0 (array!31673 (_ BitVec 32) List!9382) Bool)

(assert (=> b!489382 (= res!292319 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9379))))

(declare-fun b!489383 () Bool)

(declare-fun e!287838 () Bool)

(assert (=> b!489383 (= e!287838 e!287835)))

(declare-fun res!292321 () Bool)

(assert (=> b!489383 (=> (not res!292321) (not e!287835))))

(declare-datatypes ((SeekEntryResult!3691 0))(
  ( (MissingZero!3691 (index!16943 (_ BitVec 32))) (Found!3691 (index!16944 (_ BitVec 32))) (Intermediate!3691 (undefined!4503 Bool) (index!16945 (_ BitVec 32)) (x!46053 (_ BitVec 32))) (Undefined!3691) (MissingVacant!3691 (index!16946 (_ BitVec 32))) )
))
(declare-fun lt!220791 () SeekEntryResult!3691)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489383 (= res!292321 (or (= lt!220791 (MissingZero!3691 i!1204)) (= lt!220791 (MissingVacant!3691 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31673 (_ BitVec 32)) SeekEntryResult!3691)

(assert (=> b!489383 (= lt!220791 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489384 () Bool)

(declare-fun res!292323 () Bool)

(assert (=> b!489384 (=> (not res!292323) (not e!287838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489384 (= res!292323 (validKeyInArray!0 k!2280))))

(declare-fun b!489385 () Bool)

(declare-fun res!292318 () Bool)

(assert (=> b!489385 (=> (not res!292318) (not e!287838))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489385 (= res!292318 (and (= (size!15588 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15588 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15588 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!292317 () Bool)

(assert (=> start!44614 (=> (not res!292317) (not e!287838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44614 (= res!292317 (validMask!0 mask!3524))))

(assert (=> start!44614 e!287838))

(assert (=> start!44614 true))

(declare-fun array_inv!11020 (array!31673) Bool)

(assert (=> start!44614 (array_inv!11020 a!3235)))

(declare-fun b!489386 () Bool)

(assert (=> b!489386 (= e!287835 (not true))))

(declare-fun lt!220789 () (_ BitVec 32))

(declare-fun lt!220787 () SeekEntryResult!3691)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31673 (_ BitVec 32)) SeekEntryResult!3691)

(assert (=> b!489386 (= lt!220787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220789 (select (store (arr!15224 a!3235) i!1204 k!2280) j!176) (array!31674 (store (arr!15224 a!3235) i!1204 k!2280) (size!15588 a!3235)) mask!3524))))

(declare-fun lt!220790 () (_ BitVec 32))

(declare-fun lt!220788 () SeekEntryResult!3691)

(assert (=> b!489386 (= lt!220788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220790 (select (arr!15224 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489386 (= lt!220789 (toIndex!0 (select (store (arr!15224 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489386 (= lt!220790 (toIndex!0 (select (arr!15224 a!3235) j!176) mask!3524))))

(declare-fun e!287837 () Bool)

(assert (=> b!489386 e!287837))

(declare-fun res!292322 () Bool)

(assert (=> b!489386 (=> (not res!292322) (not e!287837))))

(assert (=> b!489386 (= res!292322 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14328 0))(
  ( (Unit!14329) )
))
(declare-fun lt!220792 () Unit!14328)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14328)

(assert (=> b!489386 (= lt!220792 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489387 () Bool)

(declare-fun res!292325 () Bool)

(assert (=> b!489387 (=> (not res!292325) (not e!287838))))

(declare-fun arrayContainsKey!0 (array!31673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489387 (= res!292325 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489388 () Bool)

(declare-fun res!292320 () Bool)

(assert (=> b!489388 (=> (not res!292320) (not e!287838))))

(assert (=> b!489388 (= res!292320 (validKeyInArray!0 (select (arr!15224 a!3235) j!176)))))

(declare-fun b!489389 () Bool)

(assert (=> b!489389 (= e!287837 (= (seekEntryOrOpen!0 (select (arr!15224 a!3235) j!176) a!3235 mask!3524) (Found!3691 j!176)))))

(assert (= (and start!44614 res!292317) b!489385))

(assert (= (and b!489385 res!292318) b!489388))

(assert (= (and b!489388 res!292320) b!489384))

(assert (= (and b!489384 res!292323) b!489387))

(assert (= (and b!489387 res!292325) b!489383))

(assert (= (and b!489383 res!292321) b!489381))

(assert (= (and b!489381 res!292324) b!489382))

(assert (= (and b!489382 res!292319) b!489386))

(assert (= (and b!489386 res!292322) b!489389))

(declare-fun m!469137 () Bool)

(assert (=> b!489389 m!469137))

(assert (=> b!489389 m!469137))

(declare-fun m!469139 () Bool)

(assert (=> b!489389 m!469139))

(declare-fun m!469141 () Bool)

(assert (=> b!489387 m!469141))

(assert (=> b!489386 m!469137))

(declare-fun m!469143 () Bool)

(assert (=> b!489386 m!469143))

(declare-fun m!469145 () Bool)

(assert (=> b!489386 m!469145))

(declare-fun m!469147 () Bool)

(assert (=> b!489386 m!469147))

(declare-fun m!469149 () Bool)

(assert (=> b!489386 m!469149))

(assert (=> b!489386 m!469137))

(declare-fun m!469151 () Bool)

(assert (=> b!489386 m!469151))

(assert (=> b!489386 m!469149))

(declare-fun m!469153 () Bool)

(assert (=> b!489386 m!469153))

(assert (=> b!489386 m!469149))

(declare-fun m!469155 () Bool)

(assert (=> b!489386 m!469155))

(assert (=> b!489386 m!469137))

(declare-fun m!469157 () Bool)

(assert (=> b!489386 m!469157))

(declare-fun m!469159 () Bool)

(assert (=> start!44614 m!469159))

(declare-fun m!469161 () Bool)

(assert (=> start!44614 m!469161))

(declare-fun m!469163 () Bool)

(assert (=> b!489383 m!469163))

(declare-fun m!469165 () Bool)

(assert (=> b!489382 m!469165))

(assert (=> b!489388 m!469137))

(assert (=> b!489388 m!469137))

(declare-fun m!469167 () Bool)

(assert (=> b!489388 m!469167))

(declare-fun m!469169 () Bool)

(assert (=> b!489381 m!469169))

(declare-fun m!469171 () Bool)

(assert (=> b!489384 m!469171))

(push 1)

(assert (not b!489388))

