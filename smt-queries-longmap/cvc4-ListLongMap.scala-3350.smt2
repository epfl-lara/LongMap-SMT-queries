; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46096 () Bool)

(assert start!46096)

(declare-fun b!510594 () Bool)

(declare-fun e!298434 () Bool)

(declare-fun e!298437 () Bool)

(assert (=> b!510594 (= e!298434 e!298437)))

(declare-fun res!311440 () Bool)

(assert (=> b!510594 (=> (not res!311440) (not e!298437))))

(declare-datatypes ((SeekEntryResult!4249 0))(
  ( (MissingZero!4249 (index!19184 (_ BitVec 32))) (Found!4249 (index!19185 (_ BitVec 32))) (Intermediate!4249 (undefined!5061 Bool) (index!19186 (_ BitVec 32)) (x!48138 (_ BitVec 32))) (Undefined!4249) (MissingVacant!4249 (index!19187 (_ BitVec 32))) )
))
(declare-fun lt!233490 () SeekEntryResult!4249)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510594 (= res!311440 (or (= lt!233490 (MissingZero!4249 i!1204)) (= lt!233490 (MissingVacant!4249 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32807 0))(
  ( (array!32808 (arr!15782 (Array (_ BitVec 32) (_ BitVec 64))) (size!16146 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32807)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32807 (_ BitVec 32)) SeekEntryResult!4249)

(assert (=> b!510594 (= lt!233490 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510595 () Bool)

(declare-fun res!311446 () Bool)

(assert (=> b!510595 (=> (not res!311446) (not e!298437))))

(declare-datatypes ((List!9940 0))(
  ( (Nil!9937) (Cons!9936 (h!10813 (_ BitVec 64)) (t!16168 List!9940)) )
))
(declare-fun arrayNoDuplicates!0 (array!32807 (_ BitVec 32) List!9940) Bool)

(assert (=> b!510595 (= res!311446 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9937))))

(declare-fun b!510596 () Bool)

(declare-fun res!311444 () Bool)

(assert (=> b!510596 (=> (not res!311444) (not e!298437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32807 (_ BitVec 32)) Bool)

(assert (=> b!510596 (= res!311444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!311441 () Bool)

(assert (=> start!46096 (=> (not res!311441) (not e!298434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46096 (= res!311441 (validMask!0 mask!3524))))

(assert (=> start!46096 e!298434))

(assert (=> start!46096 true))

(declare-fun array_inv!11578 (array!32807) Bool)

(assert (=> start!46096 (array_inv!11578 a!3235)))

(declare-fun b!510597 () Bool)

(declare-fun res!311445 () Bool)

(assert (=> b!510597 (=> (not res!311445) (not e!298434))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510597 (= res!311445 (validKeyInArray!0 (select (arr!15782 a!3235) j!176)))))

(declare-fun b!510598 () Bool)

(declare-fun res!311439 () Bool)

(assert (=> b!510598 (=> (not res!311439) (not e!298434))))

(assert (=> b!510598 (= res!311439 (and (= (size!16146 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16146 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16146 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510599 () Bool)

(declare-fun e!298436 () Bool)

(assert (=> b!510599 (= e!298437 (not e!298436))))

(declare-fun res!311442 () Bool)

(assert (=> b!510599 (=> res!311442 e!298436)))

(declare-fun lt!233489 () array!32807)

(declare-fun lt!233487 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32807 (_ BitVec 32)) SeekEntryResult!4249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510599 (= res!311442 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15782 a!3235) j!176) mask!3524) (select (arr!15782 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233487 mask!3524) lt!233487 lt!233489 mask!3524))))))

(assert (=> b!510599 (= lt!233487 (select (store (arr!15782 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510599 (= lt!233489 (array!32808 (store (arr!15782 a!3235) i!1204 k!2280) (size!16146 a!3235)))))

(declare-fun lt!233488 () SeekEntryResult!4249)

(assert (=> b!510599 (= lt!233488 (Found!4249 j!176))))

(assert (=> b!510599 (= lt!233488 (seekEntryOrOpen!0 (select (arr!15782 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510599 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15756 0))(
  ( (Unit!15757) )
))
(declare-fun lt!233486 () Unit!15756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15756)

(assert (=> b!510599 (= lt!233486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510600 () Bool)

(assert (=> b!510600 (= e!298436 true)))

(assert (=> b!510600 (= lt!233488 (seekEntryOrOpen!0 lt!233487 lt!233489 mask!3524))))

(declare-fun lt!233491 () Unit!15756)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32807 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15756)

(assert (=> b!510600 (= lt!233491 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510601 () Bool)

(declare-fun res!311443 () Bool)

(assert (=> b!510601 (=> (not res!311443) (not e!298434))))

(assert (=> b!510601 (= res!311443 (validKeyInArray!0 k!2280))))

(declare-fun b!510602 () Bool)

(declare-fun res!311447 () Bool)

(assert (=> b!510602 (=> (not res!311447) (not e!298434))))

(declare-fun arrayContainsKey!0 (array!32807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510602 (= res!311447 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46096 res!311441) b!510598))

(assert (= (and b!510598 res!311439) b!510597))

(assert (= (and b!510597 res!311445) b!510601))

(assert (= (and b!510601 res!311443) b!510602))

(assert (= (and b!510602 res!311447) b!510594))

(assert (= (and b!510594 res!311440) b!510596))

(assert (= (and b!510596 res!311444) b!510595))

(assert (= (and b!510595 res!311446) b!510599))

(assert (= (and b!510599 (not res!311442)) b!510600))

(declare-fun m!491933 () Bool)

(assert (=> b!510601 m!491933))

(declare-fun m!491935 () Bool)

(assert (=> b!510596 m!491935))

(declare-fun m!491937 () Bool)

(assert (=> b!510595 m!491937))

(declare-fun m!491939 () Bool)

(assert (=> b!510602 m!491939))

(declare-fun m!491941 () Bool)

(assert (=> b!510600 m!491941))

(declare-fun m!491943 () Bool)

(assert (=> b!510600 m!491943))

(declare-fun m!491945 () Bool)

(assert (=> start!46096 m!491945))

(declare-fun m!491947 () Bool)

(assert (=> start!46096 m!491947))

(declare-fun m!491949 () Bool)

(assert (=> b!510599 m!491949))

(declare-fun m!491951 () Bool)

(assert (=> b!510599 m!491951))

(declare-fun m!491953 () Bool)

(assert (=> b!510599 m!491953))

(declare-fun m!491955 () Bool)

(assert (=> b!510599 m!491955))

(declare-fun m!491957 () Bool)

(assert (=> b!510599 m!491957))

(declare-fun m!491959 () Bool)

(assert (=> b!510599 m!491959))

(declare-fun m!491961 () Bool)

(assert (=> b!510599 m!491961))

(declare-fun m!491963 () Bool)

(assert (=> b!510599 m!491963))

(assert (=> b!510599 m!491961))

(assert (=> b!510599 m!491959))

(assert (=> b!510599 m!491961))

(declare-fun m!491965 () Bool)

(assert (=> b!510599 m!491965))

(assert (=> b!510599 m!491961))

(declare-fun m!491967 () Bool)

(assert (=> b!510599 m!491967))

(assert (=> b!510599 m!491949))

(declare-fun m!491969 () Bool)

(assert (=> b!510594 m!491969))

(assert (=> b!510597 m!491961))

(assert (=> b!510597 m!491961))

(declare-fun m!491971 () Bool)

(assert (=> b!510597 m!491971))

(push 1)

