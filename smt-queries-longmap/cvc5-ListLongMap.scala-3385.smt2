; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46722 () Bool)

(assert start!46722)

(declare-fun b!515776 () Bool)

(declare-fun res!315344 () Bool)

(declare-fun e!301102 () Bool)

(assert (=> b!515776 (=> (not res!315344) (not e!301102))))

(declare-datatypes ((array!33034 0))(
  ( (array!33035 (arr!15885 (Array (_ BitVec 32) (_ BitVec 64))) (size!16249 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33034)

(declare-datatypes ((List!10043 0))(
  ( (Nil!10040) (Cons!10039 (h!10937 (_ BitVec 64)) (t!16271 List!10043)) )
))
(declare-fun arrayNoDuplicates!0 (array!33034 (_ BitVec 32) List!10043) Bool)

(assert (=> b!515776 (= res!315344 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10040))))

(declare-fun b!515777 () Bool)

(declare-fun e!301101 () Bool)

(assert (=> b!515777 (= e!301102 (not e!301101))))

(declare-fun res!315340 () Bool)

(assert (=> b!515777 (=> res!315340 e!301101)))

(declare-datatypes ((SeekEntryResult!4352 0))(
  ( (MissingZero!4352 (index!19596 (_ BitVec 32))) (Found!4352 (index!19597 (_ BitVec 32))) (Intermediate!4352 (undefined!5164 Bool) (index!19598 (_ BitVec 32)) (x!48563 (_ BitVec 32))) (Undefined!4352) (MissingVacant!4352 (index!19599 (_ BitVec 32))) )
))
(declare-fun lt!236115 () SeekEntryResult!4352)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!236117 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33034 (_ BitVec 32)) SeekEntryResult!4352)

(assert (=> b!515777 (= res!315340 (= lt!236115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236117 (select (store (arr!15885 a!3235) i!1204 k!2280) j!176) (array!33035 (store (arr!15885 a!3235) i!1204 k!2280) (size!16249 a!3235)) mask!3524)))))

(declare-fun lt!236118 () (_ BitVec 32))

(assert (=> b!515777 (= lt!236115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236118 (select (arr!15885 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515777 (= lt!236117 (toIndex!0 (select (store (arr!15885 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515777 (= lt!236118 (toIndex!0 (select (arr!15885 a!3235) j!176) mask!3524))))

(declare-fun e!301103 () Bool)

(assert (=> b!515777 e!301103))

(declare-fun res!315347 () Bool)

(assert (=> b!515777 (=> (not res!315347) (not e!301103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33034 (_ BitVec 32)) Bool)

(assert (=> b!515777 (= res!315347 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15962 0))(
  ( (Unit!15963) )
))
(declare-fun lt!236116 () Unit!15962)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15962)

(assert (=> b!515777 (= lt!236116 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515778 () Bool)

(declare-fun res!315343 () Bool)

(declare-fun e!301100 () Bool)

(assert (=> b!515778 (=> (not res!315343) (not e!301100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515778 (= res!315343 (validKeyInArray!0 (select (arr!15885 a!3235) j!176)))))

(declare-fun b!515779 () Bool)

(declare-fun res!315345 () Bool)

(assert (=> b!515779 (=> (not res!315345) (not e!301100))))

(assert (=> b!515779 (= res!315345 (and (= (size!16249 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16249 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16249 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515780 () Bool)

(declare-fun res!315350 () Bool)

(assert (=> b!515780 (=> (not res!315350) (not e!301100))))

(declare-fun arrayContainsKey!0 (array!33034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515780 (= res!315350 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515781 () Bool)

(assert (=> b!515781 (= e!301100 e!301102)))

(declare-fun res!315342 () Bool)

(assert (=> b!515781 (=> (not res!315342) (not e!301102))))

(declare-fun lt!236119 () SeekEntryResult!4352)

(assert (=> b!515781 (= res!315342 (or (= lt!236119 (MissingZero!4352 i!1204)) (= lt!236119 (MissingVacant!4352 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33034 (_ BitVec 32)) SeekEntryResult!4352)

(assert (=> b!515781 (= lt!236119 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515782 () Bool)

(declare-fun res!315341 () Bool)

(assert (=> b!515782 (=> (not res!315341) (not e!301100))))

(assert (=> b!515782 (= res!315341 (validKeyInArray!0 k!2280))))

(declare-fun b!515783 () Bool)

(declare-fun res!315346 () Bool)

(assert (=> b!515783 (=> res!315346 e!301101)))

(assert (=> b!515783 (= res!315346 (or (undefined!5164 lt!236115) (not (is-Intermediate!4352 lt!236115))))))

(declare-fun b!515784 () Bool)

(assert (=> b!515784 (= e!301103 (= (seekEntryOrOpen!0 (select (arr!15885 a!3235) j!176) a!3235 mask!3524) (Found!4352 j!176)))))

(declare-fun res!315348 () Bool)

(assert (=> start!46722 (=> (not res!315348) (not e!301100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46722 (= res!315348 (validMask!0 mask!3524))))

(assert (=> start!46722 e!301100))

(assert (=> start!46722 true))

(declare-fun array_inv!11681 (array!33034) Bool)

(assert (=> start!46722 (array_inv!11681 a!3235)))

(declare-fun b!515785 () Bool)

(assert (=> b!515785 (= e!301101 true)))

(assert (=> b!515785 (and (bvslt (x!48563 lt!236115) #b01111111111111111111111111111110) (or (= (select (arr!15885 a!3235) (index!19598 lt!236115)) (select (arr!15885 a!3235) j!176)) (= (select (arr!15885 a!3235) (index!19598 lt!236115)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15885 a!3235) (index!19598 lt!236115)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515786 () Bool)

(declare-fun res!315349 () Bool)

(assert (=> b!515786 (=> (not res!315349) (not e!301102))))

(assert (=> b!515786 (= res!315349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46722 res!315348) b!515779))

(assert (= (and b!515779 res!315345) b!515778))

(assert (= (and b!515778 res!315343) b!515782))

(assert (= (and b!515782 res!315341) b!515780))

(assert (= (and b!515780 res!315350) b!515781))

(assert (= (and b!515781 res!315342) b!515786))

(assert (= (and b!515786 res!315349) b!515776))

(assert (= (and b!515776 res!315344) b!515777))

(assert (= (and b!515777 res!315347) b!515784))

(assert (= (and b!515777 (not res!315340)) b!515783))

(assert (= (and b!515783 (not res!315346)) b!515785))

(declare-fun m!497163 () Bool)

(assert (=> b!515785 m!497163))

(declare-fun m!497165 () Bool)

(assert (=> b!515785 m!497165))

(assert (=> b!515784 m!497165))

(assert (=> b!515784 m!497165))

(declare-fun m!497167 () Bool)

(assert (=> b!515784 m!497167))

(declare-fun m!497169 () Bool)

(assert (=> b!515782 m!497169))

(declare-fun m!497171 () Bool)

(assert (=> b!515780 m!497171))

(declare-fun m!497173 () Bool)

(assert (=> b!515776 m!497173))

(declare-fun m!497175 () Bool)

(assert (=> b!515781 m!497175))

(declare-fun m!497177 () Bool)

(assert (=> start!46722 m!497177))

(declare-fun m!497179 () Bool)

(assert (=> start!46722 m!497179))

(declare-fun m!497181 () Bool)

(assert (=> b!515777 m!497181))

(declare-fun m!497183 () Bool)

(assert (=> b!515777 m!497183))

(assert (=> b!515777 m!497165))

(declare-fun m!497185 () Bool)

(assert (=> b!515777 m!497185))

(assert (=> b!515777 m!497165))

(declare-fun m!497187 () Bool)

(assert (=> b!515777 m!497187))

(assert (=> b!515777 m!497165))

(declare-fun m!497189 () Bool)

(assert (=> b!515777 m!497189))

(declare-fun m!497191 () Bool)

(assert (=> b!515777 m!497191))

(declare-fun m!497193 () Bool)

(assert (=> b!515777 m!497193))

(assert (=> b!515777 m!497191))

(declare-fun m!497195 () Bool)

(assert (=> b!515777 m!497195))

(assert (=> b!515777 m!497191))

(declare-fun m!497197 () Bool)

(assert (=> b!515786 m!497197))

(assert (=> b!515778 m!497165))

(assert (=> b!515778 m!497165))

(declare-fun m!497199 () Bool)

(assert (=> b!515778 m!497199))

(push 1)

