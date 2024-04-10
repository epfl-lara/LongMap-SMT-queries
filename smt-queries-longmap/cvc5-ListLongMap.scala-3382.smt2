; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46704 () Bool)

(assert start!46704)

(declare-fun b!515479 () Bool)

(declare-fun e!300969 () Bool)

(declare-fun e!300968 () Bool)

(assert (=> b!515479 (= e!300969 e!300968)))

(declare-fun res!315053 () Bool)

(assert (=> b!515479 (=> (not res!315053) (not e!300968))))

(declare-datatypes ((SeekEntryResult!4343 0))(
  ( (MissingZero!4343 (index!19560 (_ BitVec 32))) (Found!4343 (index!19561 (_ BitVec 32))) (Intermediate!4343 (undefined!5155 Bool) (index!19562 (_ BitVec 32)) (x!48530 (_ BitVec 32))) (Undefined!4343) (MissingVacant!4343 (index!19563 (_ BitVec 32))) )
))
(declare-fun lt!235981 () SeekEntryResult!4343)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515479 (= res!315053 (or (= lt!235981 (MissingZero!4343 i!1204)) (= lt!235981 (MissingVacant!4343 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33016 0))(
  ( (array!33017 (arr!15876 (Array (_ BitVec 32) (_ BitVec 64))) (size!16240 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33016)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33016 (_ BitVec 32)) SeekEntryResult!4343)

(assert (=> b!515479 (= lt!235981 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515480 () Bool)

(declare-fun e!300967 () Bool)

(assert (=> b!515480 (= e!300967 true)))

(declare-fun lt!235980 () SeekEntryResult!4343)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515480 (and (bvslt (x!48530 lt!235980) #b01111111111111111111111111111110) (or (= (select (arr!15876 a!3235) (index!19562 lt!235980)) (select (arr!15876 a!3235) j!176)) (= (select (arr!15876 a!3235) (index!19562 lt!235980)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15876 a!3235) (index!19562 lt!235980)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!300966 () Bool)

(declare-fun b!515481 () Bool)

(assert (=> b!515481 (= e!300966 (= (seekEntryOrOpen!0 (select (arr!15876 a!3235) j!176) a!3235 mask!3524) (Found!4343 j!176)))))

(declare-fun b!515482 () Bool)

(declare-fun res!315050 () Bool)

(assert (=> b!515482 (=> (not res!315050) (not e!300969))))

(assert (=> b!515482 (= res!315050 (and (= (size!16240 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16240 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16240 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515483 () Bool)

(assert (=> b!515483 (= e!300968 (not e!300967))))

(declare-fun res!315045 () Bool)

(assert (=> b!515483 (=> res!315045 e!300967)))

(declare-fun lt!235982 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33016 (_ BitVec 32)) SeekEntryResult!4343)

(assert (=> b!515483 (= res!315045 (= lt!235980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235982 (select (store (arr!15876 a!3235) i!1204 k!2280) j!176) (array!33017 (store (arr!15876 a!3235) i!1204 k!2280) (size!16240 a!3235)) mask!3524)))))

(declare-fun lt!235984 () (_ BitVec 32))

(assert (=> b!515483 (= lt!235980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235984 (select (arr!15876 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515483 (= lt!235982 (toIndex!0 (select (store (arr!15876 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515483 (= lt!235984 (toIndex!0 (select (arr!15876 a!3235) j!176) mask!3524))))

(assert (=> b!515483 e!300966))

(declare-fun res!315051 () Bool)

(assert (=> b!515483 (=> (not res!315051) (not e!300966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33016 (_ BitVec 32)) Bool)

(assert (=> b!515483 (= res!315051 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15944 0))(
  ( (Unit!15945) )
))
(declare-fun lt!235983 () Unit!15944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15944)

(assert (=> b!515483 (= lt!235983 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515484 () Bool)

(declare-fun res!315046 () Bool)

(assert (=> b!515484 (=> res!315046 e!300967)))

(assert (=> b!515484 (= res!315046 (or (undefined!5155 lt!235980) (not (is-Intermediate!4343 lt!235980))))))

(declare-fun res!315044 () Bool)

(assert (=> start!46704 (=> (not res!315044) (not e!300969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46704 (= res!315044 (validMask!0 mask!3524))))

(assert (=> start!46704 e!300969))

(assert (=> start!46704 true))

(declare-fun array_inv!11672 (array!33016) Bool)

(assert (=> start!46704 (array_inv!11672 a!3235)))

(declare-fun b!515485 () Bool)

(declare-fun res!315049 () Bool)

(assert (=> b!515485 (=> (not res!315049) (not e!300968))))

(declare-datatypes ((List!10034 0))(
  ( (Nil!10031) (Cons!10030 (h!10928 (_ BitVec 64)) (t!16262 List!10034)) )
))
(declare-fun arrayNoDuplicates!0 (array!33016 (_ BitVec 32) List!10034) Bool)

(assert (=> b!515485 (= res!315049 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10031))))

(declare-fun b!515486 () Bool)

(declare-fun res!315048 () Bool)

(assert (=> b!515486 (=> (not res!315048) (not e!300969))))

(declare-fun arrayContainsKey!0 (array!33016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515486 (= res!315048 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515487 () Bool)

(declare-fun res!315052 () Bool)

(assert (=> b!515487 (=> (not res!315052) (not e!300968))))

(assert (=> b!515487 (= res!315052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515488 () Bool)

(declare-fun res!315043 () Bool)

(assert (=> b!515488 (=> (not res!315043) (not e!300969))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515488 (= res!315043 (validKeyInArray!0 k!2280))))

(declare-fun b!515489 () Bool)

(declare-fun res!315047 () Bool)

(assert (=> b!515489 (=> (not res!315047) (not e!300969))))

(assert (=> b!515489 (= res!315047 (validKeyInArray!0 (select (arr!15876 a!3235) j!176)))))

(assert (= (and start!46704 res!315044) b!515482))

(assert (= (and b!515482 res!315050) b!515489))

(assert (= (and b!515489 res!315047) b!515488))

(assert (= (and b!515488 res!315043) b!515486))

(assert (= (and b!515486 res!315048) b!515479))

(assert (= (and b!515479 res!315053) b!515487))

(assert (= (and b!515487 res!315052) b!515485))

(assert (= (and b!515485 res!315049) b!515483))

(assert (= (and b!515483 res!315051) b!515481))

(assert (= (and b!515483 (not res!315045)) b!515484))

(assert (= (and b!515484 (not res!315046)) b!515480))

(declare-fun m!496821 () Bool)

(assert (=> b!515486 m!496821))

(declare-fun m!496823 () Bool)

(assert (=> b!515485 m!496823))

(declare-fun m!496825 () Bool)

(assert (=> b!515483 m!496825))

(declare-fun m!496827 () Bool)

(assert (=> b!515483 m!496827))

(declare-fun m!496829 () Bool)

(assert (=> b!515483 m!496829))

(declare-fun m!496831 () Bool)

(assert (=> b!515483 m!496831))

(declare-fun m!496833 () Bool)

(assert (=> b!515483 m!496833))

(assert (=> b!515483 m!496831))

(declare-fun m!496835 () Bool)

(assert (=> b!515483 m!496835))

(assert (=> b!515483 m!496831))

(declare-fun m!496837 () Bool)

(assert (=> b!515483 m!496837))

(assert (=> b!515483 m!496829))

(declare-fun m!496839 () Bool)

(assert (=> b!515483 m!496839))

(assert (=> b!515483 m!496829))

(declare-fun m!496841 () Bool)

(assert (=> b!515483 m!496841))

(assert (=> b!515481 m!496831))

(assert (=> b!515481 m!496831))

(declare-fun m!496843 () Bool)

(assert (=> b!515481 m!496843))

(assert (=> b!515489 m!496831))

(assert (=> b!515489 m!496831))

(declare-fun m!496845 () Bool)

(assert (=> b!515489 m!496845))

(declare-fun m!496847 () Bool)

(assert (=> b!515479 m!496847))

(declare-fun m!496849 () Bool)

(assert (=> b!515488 m!496849))

(declare-fun m!496851 () Bool)

(assert (=> b!515487 m!496851))

(declare-fun m!496853 () Bool)

(assert (=> start!46704 m!496853))

(declare-fun m!496855 () Bool)

(assert (=> start!46704 m!496855))

(declare-fun m!496857 () Bool)

(assert (=> b!515480 m!496857))

(assert (=> b!515480 m!496831))

(push 1)

