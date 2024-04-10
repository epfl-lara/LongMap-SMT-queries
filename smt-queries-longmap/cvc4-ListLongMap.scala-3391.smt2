; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46762 () Bool)

(assert start!46762)

(declare-fun b!516436 () Bool)

(declare-fun res!316002 () Bool)

(declare-fun e!301403 () Bool)

(assert (=> b!516436 (=> (not res!316002) (not e!301403))))

(declare-datatypes ((array!33074 0))(
  ( (array!33075 (arr!15905 (Array (_ BitVec 32) (_ BitVec 64))) (size!16269 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33074)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516436 (= res!316002 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316005 () Bool)

(assert (=> start!46762 (=> (not res!316005) (not e!301403))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46762 (= res!316005 (validMask!0 mask!3524))))

(assert (=> start!46762 e!301403))

(assert (=> start!46762 true))

(declare-fun array_inv!11701 (array!33074) Bool)

(assert (=> start!46762 (array_inv!11701 a!3235)))

(declare-fun b!516437 () Bool)

(declare-fun res!316009 () Bool)

(declare-fun e!301401 () Bool)

(assert (=> b!516437 (=> res!316009 e!301401)))

(declare-datatypes ((SeekEntryResult!4372 0))(
  ( (MissingZero!4372 (index!19676 (_ BitVec 32))) (Found!4372 (index!19677 (_ BitVec 32))) (Intermediate!4372 (undefined!5184 Bool) (index!19678 (_ BitVec 32)) (x!48631 (_ BitVec 32))) (Undefined!4372) (MissingVacant!4372 (index!19679 (_ BitVec 32))) )
))
(declare-fun lt!236418 () SeekEntryResult!4372)

(assert (=> b!516437 (= res!316009 (or (undefined!5184 lt!236418) (not (is-Intermediate!4372 lt!236418))))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!516438 () Bool)

(declare-fun e!301404 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33074 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!516438 (= e!301404 (= (seekEntryOrOpen!0 (select (arr!15905 a!3235) j!176) a!3235 mask!3524) (Found!4372 j!176)))))

(declare-fun b!516439 () Bool)

(declare-fun res!316001 () Bool)

(assert (=> b!516439 (=> (not res!316001) (not e!301403))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516439 (= res!316001 (and (= (size!16269 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16269 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16269 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516440 () Bool)

(declare-fun res!316010 () Bool)

(declare-fun e!301402 () Bool)

(assert (=> b!516440 (=> (not res!316010) (not e!301402))))

(declare-datatypes ((List!10063 0))(
  ( (Nil!10060) (Cons!10059 (h!10957 (_ BitVec 64)) (t!16291 List!10063)) )
))
(declare-fun arrayNoDuplicates!0 (array!33074 (_ BitVec 32) List!10063) Bool)

(assert (=> b!516440 (= res!316010 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10060))))

(declare-fun b!516441 () Bool)

(declare-fun res!316008 () Bool)

(assert (=> b!516441 (=> (not res!316008) (not e!301403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516441 (= res!316008 (validKeyInArray!0 k!2280))))

(declare-fun b!516442 () Bool)

(declare-fun res!316004 () Bool)

(assert (=> b!516442 (=> (not res!316004) (not e!301403))))

(assert (=> b!516442 (= res!316004 (validKeyInArray!0 (select (arr!15905 a!3235) j!176)))))

(declare-fun b!516443 () Bool)

(declare-fun res!316000 () Bool)

(assert (=> b!516443 (=> (not res!316000) (not e!301402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33074 (_ BitVec 32)) Bool)

(assert (=> b!516443 (= res!316000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516444 () Bool)

(assert (=> b!516444 (= e!301401 true)))

(assert (=> b!516444 (and (bvslt (x!48631 lt!236418) #b01111111111111111111111111111110) (or (= (select (arr!15905 a!3235) (index!19678 lt!236418)) (select (arr!15905 a!3235) j!176)) (= (select (arr!15905 a!3235) (index!19678 lt!236418)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15905 a!3235) (index!19678 lt!236418)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516445 () Bool)

(assert (=> b!516445 (= e!301403 e!301402)))

(declare-fun res!316003 () Bool)

(assert (=> b!516445 (=> (not res!316003) (not e!301402))))

(declare-fun lt!236419 () SeekEntryResult!4372)

(assert (=> b!516445 (= res!316003 (or (= lt!236419 (MissingZero!4372 i!1204)) (= lt!236419 (MissingVacant!4372 i!1204))))))

(assert (=> b!516445 (= lt!236419 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516446 () Bool)

(assert (=> b!516446 (= e!301402 (not e!301401))))

(declare-fun res!316006 () Bool)

(assert (=> b!516446 (=> res!316006 e!301401)))

(declare-fun lt!236416 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33074 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!516446 (= res!316006 (= lt!236418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236416 (select (store (arr!15905 a!3235) i!1204 k!2280) j!176) (array!33075 (store (arr!15905 a!3235) i!1204 k!2280) (size!16269 a!3235)) mask!3524)))))

(declare-fun lt!236415 () (_ BitVec 32))

(assert (=> b!516446 (= lt!236418 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236415 (select (arr!15905 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516446 (= lt!236416 (toIndex!0 (select (store (arr!15905 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516446 (= lt!236415 (toIndex!0 (select (arr!15905 a!3235) j!176) mask!3524))))

(assert (=> b!516446 e!301404))

(declare-fun res!316007 () Bool)

(assert (=> b!516446 (=> (not res!316007) (not e!301404))))

(assert (=> b!516446 (= res!316007 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16002 0))(
  ( (Unit!16003) )
))
(declare-fun lt!236417 () Unit!16002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16002)

(assert (=> b!516446 (= lt!236417 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46762 res!316005) b!516439))

(assert (= (and b!516439 res!316001) b!516442))

(assert (= (and b!516442 res!316004) b!516441))

(assert (= (and b!516441 res!316008) b!516436))

(assert (= (and b!516436 res!316002) b!516445))

(assert (= (and b!516445 res!316003) b!516443))

(assert (= (and b!516443 res!316000) b!516440))

(assert (= (and b!516440 res!316010) b!516446))

(assert (= (and b!516446 res!316007) b!516438))

(assert (= (and b!516446 (not res!316006)) b!516437))

(assert (= (and b!516437 (not res!316009)) b!516444))

(declare-fun m!497923 () Bool)

(assert (=> b!516436 m!497923))

(declare-fun m!497925 () Bool)

(assert (=> b!516440 m!497925))

(declare-fun m!497927 () Bool)

(assert (=> b!516441 m!497927))

(declare-fun m!497929 () Bool)

(assert (=> b!516444 m!497929))

(declare-fun m!497931 () Bool)

(assert (=> b!516444 m!497931))

(declare-fun m!497933 () Bool)

(assert (=> b!516446 m!497933))

(declare-fun m!497935 () Bool)

(assert (=> b!516446 m!497935))

(declare-fun m!497937 () Bool)

(assert (=> b!516446 m!497937))

(assert (=> b!516446 m!497931))

(declare-fun m!497939 () Bool)

(assert (=> b!516446 m!497939))

(assert (=> b!516446 m!497937))

(declare-fun m!497941 () Bool)

(assert (=> b!516446 m!497941))

(assert (=> b!516446 m!497931))

(declare-fun m!497943 () Bool)

(assert (=> b!516446 m!497943))

(assert (=> b!516446 m!497931))

(declare-fun m!497945 () Bool)

(assert (=> b!516446 m!497945))

(assert (=> b!516446 m!497937))

(declare-fun m!497947 () Bool)

(assert (=> b!516446 m!497947))

(assert (=> b!516442 m!497931))

(assert (=> b!516442 m!497931))

(declare-fun m!497949 () Bool)

(assert (=> b!516442 m!497949))

(assert (=> b!516438 m!497931))

(assert (=> b!516438 m!497931))

(declare-fun m!497951 () Bool)

(assert (=> b!516438 m!497951))

(declare-fun m!497953 () Bool)

(assert (=> b!516443 m!497953))

(declare-fun m!497955 () Bool)

(assert (=> start!46762 m!497955))

(declare-fun m!497957 () Bool)

(assert (=> start!46762 m!497957))

(declare-fun m!497959 () Bool)

(assert (=> b!516445 m!497959))

(push 1)

