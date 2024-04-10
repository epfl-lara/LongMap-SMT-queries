; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46986 () Bool)

(assert start!46986)

(declare-fun res!317058 () Bool)

(declare-fun e!302289 () Bool)

(assert (=> start!46986 (=> (not res!317058) (not e!302289))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46986 (= res!317058 (validMask!0 mask!3524))))

(assert (=> start!46986 e!302289))

(assert (=> start!46986 true))

(declare-datatypes ((array!33127 0))(
  ( (array!33128 (arr!15927 (Array (_ BitVec 32) (_ BitVec 64))) (size!16291 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33127)

(declare-fun array_inv!11723 (array!33127) Bool)

(assert (=> start!46986 (array_inv!11723 a!3235)))

(declare-fun b!518035 () Bool)

(declare-fun res!317053 () Bool)

(assert (=> b!518035 (=> (not res!317053) (not e!302289))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518035 (= res!317053 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518036 () Bool)

(declare-fun e!302290 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4394 0))(
  ( (MissingZero!4394 (index!19764 (_ BitVec 32))) (Found!4394 (index!19765 (_ BitVec 32))) (Intermediate!4394 (undefined!5206 Bool) (index!19766 (_ BitVec 32)) (x!48735 (_ BitVec 32))) (Undefined!4394) (MissingVacant!4394 (index!19767 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33127 (_ BitVec 32)) SeekEntryResult!4394)

(assert (=> b!518036 (= e!302290 (= (seekEntryOrOpen!0 (select (arr!15927 a!3235) j!176) a!3235 mask!3524) (Found!4394 j!176)))))

(declare-fun b!518037 () Bool)

(declare-fun res!317059 () Bool)

(assert (=> b!518037 (=> (not res!317059) (not e!302289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518037 (= res!317059 (validKeyInArray!0 k!2280))))

(declare-fun b!518038 () Bool)

(declare-fun res!317055 () Bool)

(declare-fun e!302288 () Bool)

(assert (=> b!518038 (=> (not res!317055) (not e!302288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33127 (_ BitVec 32)) Bool)

(assert (=> b!518038 (= res!317055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518039 () Bool)

(assert (=> b!518039 (= e!302289 e!302288)))

(declare-fun res!317054 () Bool)

(assert (=> b!518039 (=> (not res!317054) (not e!302288))))

(declare-fun lt!237136 () SeekEntryResult!4394)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518039 (= res!317054 (or (= lt!237136 (MissingZero!4394 i!1204)) (= lt!237136 (MissingVacant!4394 i!1204))))))

(assert (=> b!518039 (= lt!237136 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518040 () Bool)

(declare-fun res!317052 () Bool)

(assert (=> b!518040 (=> (not res!317052) (not e!302288))))

(declare-datatypes ((List!10085 0))(
  ( (Nil!10082) (Cons!10081 (h!10988 (_ BitVec 64)) (t!16313 List!10085)) )
))
(declare-fun arrayNoDuplicates!0 (array!33127 (_ BitVec 32) List!10085) Bool)

(assert (=> b!518040 (= res!317052 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10082))))

(declare-fun b!518041 () Bool)

(declare-fun res!317060 () Bool)

(assert (=> b!518041 (=> (not res!317060) (not e!302289))))

(assert (=> b!518041 (= res!317060 (and (= (size!16291 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16291 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16291 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518042 () Bool)

(declare-fun res!317056 () Bool)

(assert (=> b!518042 (=> (not res!317056) (not e!302289))))

(assert (=> b!518042 (= res!317056 (validKeyInArray!0 (select (arr!15927 a!3235) j!176)))))

(declare-fun b!518043 () Bool)

(declare-fun e!302292 () Bool)

(assert (=> b!518043 (= e!302288 (not e!302292))))

(declare-fun res!317050 () Bool)

(assert (=> b!518043 (=> res!317050 e!302292)))

(declare-fun lt!237134 () (_ BitVec 32))

(declare-fun lt!237135 () SeekEntryResult!4394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33127 (_ BitVec 32)) SeekEntryResult!4394)

(assert (=> b!518043 (= res!317050 (= lt!237135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237134 (select (store (arr!15927 a!3235) i!1204 k!2280) j!176) (array!33128 (store (arr!15927 a!3235) i!1204 k!2280) (size!16291 a!3235)) mask!3524)))))

(declare-fun lt!237133 () (_ BitVec 32))

(assert (=> b!518043 (= lt!237135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237133 (select (arr!15927 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518043 (= lt!237134 (toIndex!0 (select (store (arr!15927 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!518043 (= lt!237133 (toIndex!0 (select (arr!15927 a!3235) j!176) mask!3524))))

(assert (=> b!518043 e!302290))

(declare-fun res!317051 () Bool)

(assert (=> b!518043 (=> (not res!317051) (not e!302290))))

(assert (=> b!518043 (= res!317051 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16046 0))(
  ( (Unit!16047) )
))
(declare-fun lt!237132 () Unit!16046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16046)

(assert (=> b!518043 (= lt!237132 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518044 () Bool)

(declare-fun res!317057 () Bool)

(assert (=> b!518044 (=> res!317057 e!302292)))

(assert (=> b!518044 (= res!317057 (or (undefined!5206 lt!237135) (not (is-Intermediate!4394 lt!237135))))))

(declare-fun b!518045 () Bool)

(assert (=> b!518045 (= e!302292 (or (not (= (select (arr!15927 a!3235) (index!19766 lt!237135)) (select (arr!15927 a!3235) j!176))) (bvsgt (x!48735 lt!237135) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48735 lt!237135)) (bvslt lt!237133 #b00000000000000000000000000000000) (bvsge lt!237133 (size!16291 a!3235)) (bvslt (index!19766 lt!237135) #b00000000000000000000000000000000) (bvsge (index!19766 lt!237135) (size!16291 a!3235)) (= lt!237135 (Intermediate!4394 false (index!19766 lt!237135) (x!48735 lt!237135)))))))

(assert (=> b!518045 (and (bvslt (x!48735 lt!237135) #b01111111111111111111111111111110) (or (= (select (arr!15927 a!3235) (index!19766 lt!237135)) (select (arr!15927 a!3235) j!176)) (= (select (arr!15927 a!3235) (index!19766 lt!237135)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15927 a!3235) (index!19766 lt!237135)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46986 res!317058) b!518041))

(assert (= (and b!518041 res!317060) b!518042))

(assert (= (and b!518042 res!317056) b!518037))

(assert (= (and b!518037 res!317059) b!518035))

(assert (= (and b!518035 res!317053) b!518039))

(assert (= (and b!518039 res!317054) b!518038))

(assert (= (and b!518038 res!317055) b!518040))

(assert (= (and b!518040 res!317052) b!518043))

(assert (= (and b!518043 res!317051) b!518036))

(assert (= (and b!518043 (not res!317050)) b!518044))

(assert (= (and b!518044 (not res!317057)) b!518045))

(declare-fun m!499371 () Bool)

(assert (=> b!518039 m!499371))

(declare-fun m!499373 () Bool)

(assert (=> b!518035 m!499373))

(declare-fun m!499375 () Bool)

(assert (=> b!518040 m!499375))

(declare-fun m!499377 () Bool)

(assert (=> start!46986 m!499377))

(declare-fun m!499379 () Bool)

(assert (=> start!46986 m!499379))

(declare-fun m!499381 () Bool)

(assert (=> b!518037 m!499381))

(declare-fun m!499383 () Bool)

(assert (=> b!518042 m!499383))

(assert (=> b!518042 m!499383))

(declare-fun m!499385 () Bool)

(assert (=> b!518042 m!499385))

(declare-fun m!499387 () Bool)

(assert (=> b!518038 m!499387))

(declare-fun m!499389 () Bool)

(assert (=> b!518043 m!499389))

(declare-fun m!499391 () Bool)

(assert (=> b!518043 m!499391))

(declare-fun m!499393 () Bool)

(assert (=> b!518043 m!499393))

(assert (=> b!518043 m!499383))

(declare-fun m!499395 () Bool)

(assert (=> b!518043 m!499395))

(assert (=> b!518043 m!499383))

(declare-fun m!499397 () Bool)

(assert (=> b!518043 m!499397))

(assert (=> b!518043 m!499383))

(declare-fun m!499399 () Bool)

(assert (=> b!518043 m!499399))

(assert (=> b!518043 m!499393))

(declare-fun m!499401 () Bool)

(assert (=> b!518043 m!499401))

(assert (=> b!518043 m!499393))

(declare-fun m!499403 () Bool)

(assert (=> b!518043 m!499403))

(declare-fun m!499405 () Bool)

(assert (=> b!518045 m!499405))

(assert (=> b!518045 m!499383))

(assert (=> b!518036 m!499383))

(assert (=> b!518036 m!499383))

(declare-fun m!499407 () Bool)

(assert (=> b!518036 m!499407))

(push 1)

