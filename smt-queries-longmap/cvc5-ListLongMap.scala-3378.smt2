; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46680 () Bool)

(assert start!46680)

(declare-fun b!515083 () Bool)

(declare-fun res!314649 () Bool)

(declare-fun e!300786 () Bool)

(assert (=> b!515083 (=> (not res!314649) (not e!300786))))

(declare-datatypes ((array!32992 0))(
  ( (array!32993 (arr!15864 (Array (_ BitVec 32) (_ BitVec 64))) (size!16228 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32992)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515083 (= res!314649 (validKeyInArray!0 (select (arr!15864 a!3235) j!176)))))

(declare-fun b!515084 () Bool)

(declare-fun e!300788 () Bool)

(declare-fun e!300787 () Bool)

(assert (=> b!515084 (= e!300788 (not e!300787))))

(declare-fun res!314652 () Bool)

(assert (=> b!515084 (=> res!314652 e!300787)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4331 0))(
  ( (MissingZero!4331 (index!19512 (_ BitVec 32))) (Found!4331 (index!19513 (_ BitVec 32))) (Intermediate!4331 (undefined!5143 Bool) (index!19514 (_ BitVec 32)) (x!48486 (_ BitVec 32))) (Undefined!4331) (MissingVacant!4331 (index!19515 (_ BitVec 32))) )
))
(declare-fun lt!235802 () SeekEntryResult!4331)

(declare-fun lt!235801 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32992 (_ BitVec 32)) SeekEntryResult!4331)

(assert (=> b!515084 (= res!314652 (= lt!235802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235801 (select (store (arr!15864 a!3235) i!1204 k!2280) j!176) (array!32993 (store (arr!15864 a!3235) i!1204 k!2280) (size!16228 a!3235)) mask!3524)))))

(declare-fun lt!235800 () (_ BitVec 32))

(assert (=> b!515084 (= lt!235802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235800 (select (arr!15864 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515084 (= lt!235801 (toIndex!0 (select (store (arr!15864 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515084 (= lt!235800 (toIndex!0 (select (arr!15864 a!3235) j!176) mask!3524))))

(declare-fun e!300785 () Bool)

(assert (=> b!515084 e!300785))

(declare-fun res!314655 () Bool)

(assert (=> b!515084 (=> (not res!314655) (not e!300785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32992 (_ BitVec 32)) Bool)

(assert (=> b!515084 (= res!314655 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15920 0))(
  ( (Unit!15921) )
))
(declare-fun lt!235803 () Unit!15920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15920)

(assert (=> b!515084 (= lt!235803 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515085 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32992 (_ BitVec 32)) SeekEntryResult!4331)

(assert (=> b!515085 (= e!300785 (= (seekEntryOrOpen!0 (select (arr!15864 a!3235) j!176) a!3235 mask!3524) (Found!4331 j!176)))))

(declare-fun b!515086 () Bool)

(declare-fun res!314656 () Bool)

(assert (=> b!515086 (=> (not res!314656) (not e!300786))))

(assert (=> b!515086 (= res!314656 (and (= (size!16228 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16228 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16228 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515087 () Bool)

(declare-fun res!314654 () Bool)

(assert (=> b!515087 (=> res!314654 e!300787)))

(assert (=> b!515087 (= res!314654 (or (undefined!5143 lt!235802) (not (is-Intermediate!4331 lt!235802))))))

(declare-fun b!515088 () Bool)

(declare-fun res!314650 () Bool)

(assert (=> b!515088 (=> (not res!314650) (not e!300786))))

(declare-fun arrayContainsKey!0 (array!32992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515088 (= res!314650 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!314647 () Bool)

(assert (=> start!46680 (=> (not res!314647) (not e!300786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46680 (= res!314647 (validMask!0 mask!3524))))

(assert (=> start!46680 e!300786))

(assert (=> start!46680 true))

(declare-fun array_inv!11660 (array!32992) Bool)

(assert (=> start!46680 (array_inv!11660 a!3235)))

(declare-fun b!515089 () Bool)

(assert (=> b!515089 (= e!300786 e!300788)))

(declare-fun res!314651 () Bool)

(assert (=> b!515089 (=> (not res!314651) (not e!300788))))

(declare-fun lt!235804 () SeekEntryResult!4331)

(assert (=> b!515089 (= res!314651 (or (= lt!235804 (MissingZero!4331 i!1204)) (= lt!235804 (MissingVacant!4331 i!1204))))))

(assert (=> b!515089 (= lt!235804 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515090 () Bool)

(assert (=> b!515090 (= e!300787 true)))

(assert (=> b!515090 (and (bvslt (x!48486 lt!235802) #b01111111111111111111111111111110) (or (= (select (arr!15864 a!3235) (index!19514 lt!235802)) (select (arr!15864 a!3235) j!176)) (= (select (arr!15864 a!3235) (index!19514 lt!235802)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15864 a!3235) (index!19514 lt!235802)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515091 () Bool)

(declare-fun res!314653 () Bool)

(assert (=> b!515091 (=> (not res!314653) (not e!300788))))

(assert (=> b!515091 (= res!314653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515092 () Bool)

(declare-fun res!314657 () Bool)

(assert (=> b!515092 (=> (not res!314657) (not e!300786))))

(assert (=> b!515092 (= res!314657 (validKeyInArray!0 k!2280))))

(declare-fun b!515093 () Bool)

(declare-fun res!314648 () Bool)

(assert (=> b!515093 (=> (not res!314648) (not e!300788))))

(declare-datatypes ((List!10022 0))(
  ( (Nil!10019) (Cons!10018 (h!10916 (_ BitVec 64)) (t!16250 List!10022)) )
))
(declare-fun arrayNoDuplicates!0 (array!32992 (_ BitVec 32) List!10022) Bool)

(assert (=> b!515093 (= res!314648 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10019))))

(assert (= (and start!46680 res!314647) b!515086))

(assert (= (and b!515086 res!314656) b!515083))

(assert (= (and b!515083 res!314649) b!515092))

(assert (= (and b!515092 res!314657) b!515088))

(assert (= (and b!515088 res!314650) b!515089))

(assert (= (and b!515089 res!314651) b!515091))

(assert (= (and b!515091 res!314653) b!515093))

(assert (= (and b!515093 res!314648) b!515084))

(assert (= (and b!515084 res!314655) b!515085))

(assert (= (and b!515084 (not res!314652)) b!515087))

(assert (= (and b!515087 (not res!314654)) b!515090))

(declare-fun m!496365 () Bool)

(assert (=> b!515093 m!496365))

(declare-fun m!496367 () Bool)

(assert (=> b!515091 m!496367))

(declare-fun m!496369 () Bool)

(assert (=> b!515090 m!496369))

(declare-fun m!496371 () Bool)

(assert (=> b!515090 m!496371))

(assert (=> b!515085 m!496371))

(assert (=> b!515085 m!496371))

(declare-fun m!496373 () Bool)

(assert (=> b!515085 m!496373))

(declare-fun m!496375 () Bool)

(assert (=> start!46680 m!496375))

(declare-fun m!496377 () Bool)

(assert (=> start!46680 m!496377))

(assert (=> b!515083 m!496371))

(assert (=> b!515083 m!496371))

(declare-fun m!496379 () Bool)

(assert (=> b!515083 m!496379))

(declare-fun m!496381 () Bool)

(assert (=> b!515084 m!496381))

(declare-fun m!496383 () Bool)

(assert (=> b!515084 m!496383))

(declare-fun m!496385 () Bool)

(assert (=> b!515084 m!496385))

(assert (=> b!515084 m!496371))

(declare-fun m!496387 () Bool)

(assert (=> b!515084 m!496387))

(assert (=> b!515084 m!496371))

(declare-fun m!496389 () Bool)

(assert (=> b!515084 m!496389))

(assert (=> b!515084 m!496385))

(declare-fun m!496391 () Bool)

(assert (=> b!515084 m!496391))

(assert (=> b!515084 m!496371))

(declare-fun m!496393 () Bool)

(assert (=> b!515084 m!496393))

(assert (=> b!515084 m!496385))

(declare-fun m!496395 () Bool)

(assert (=> b!515084 m!496395))

(declare-fun m!496397 () Bool)

(assert (=> b!515088 m!496397))

(declare-fun m!496399 () Bool)

(assert (=> b!515092 m!496399))

(declare-fun m!496401 () Bool)

(assert (=> b!515089 m!496401))

(push 1)

