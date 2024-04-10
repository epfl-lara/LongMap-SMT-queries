; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46764 () Bool)

(assert start!46764)

(declare-fun b!516469 () Bool)

(declare-fun e!301416 () Bool)

(declare-fun e!301419 () Bool)

(assert (=> b!516469 (= e!301416 e!301419)))

(declare-fun res!316035 () Bool)

(assert (=> b!516469 (=> (not res!316035) (not e!301419))))

(declare-datatypes ((SeekEntryResult!4373 0))(
  ( (MissingZero!4373 (index!19680 (_ BitVec 32))) (Found!4373 (index!19681 (_ BitVec 32))) (Intermediate!4373 (undefined!5185 Bool) (index!19682 (_ BitVec 32)) (x!48640 (_ BitVec 32))) (Undefined!4373) (MissingVacant!4373 (index!19683 (_ BitVec 32))) )
))
(declare-fun lt!236433 () SeekEntryResult!4373)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516469 (= res!316035 (or (= lt!236433 (MissingZero!4373 i!1204)) (= lt!236433 (MissingVacant!4373 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33076 0))(
  ( (array!33077 (arr!15906 (Array (_ BitVec 32) (_ BitVec 64))) (size!16270 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33076)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33076 (_ BitVec 32)) SeekEntryResult!4373)

(assert (=> b!516469 (= lt!236433 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!316040 () Bool)

(assert (=> start!46764 (=> (not res!316040) (not e!301416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46764 (= res!316040 (validMask!0 mask!3524))))

(assert (=> start!46764 e!301416))

(assert (=> start!46764 true))

(declare-fun array_inv!11702 (array!33076) Bool)

(assert (=> start!46764 (array_inv!11702 a!3235)))

(declare-fun b!516470 () Bool)

(declare-fun res!316036 () Bool)

(assert (=> b!516470 (=> (not res!316036) (not e!301419))))

(declare-datatypes ((List!10064 0))(
  ( (Nil!10061) (Cons!10060 (h!10958 (_ BitVec 64)) (t!16292 List!10064)) )
))
(declare-fun arrayNoDuplicates!0 (array!33076 (_ BitVec 32) List!10064) Bool)

(assert (=> b!516470 (= res!316036 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10061))))

(declare-fun b!516471 () Bool)

(declare-fun res!316039 () Bool)

(assert (=> b!516471 (=> (not res!316039) (not e!301419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33076 (_ BitVec 32)) Bool)

(assert (=> b!516471 (= res!316039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516472 () Bool)

(declare-fun res!316033 () Bool)

(assert (=> b!516472 (=> (not res!316033) (not e!301416))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516472 (= res!316033 (and (= (size!16270 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16270 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16270 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516473 () Bool)

(declare-fun res!316034 () Bool)

(declare-fun e!301418 () Bool)

(assert (=> b!516473 (=> res!316034 e!301418)))

(declare-fun lt!236434 () SeekEntryResult!4373)

(assert (=> b!516473 (= res!316034 (or (undefined!5185 lt!236434) (not (is-Intermediate!4373 lt!236434))))))

(declare-fun b!516474 () Bool)

(declare-fun res!316042 () Bool)

(assert (=> b!516474 (=> (not res!316042) (not e!301416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516474 (= res!316042 (validKeyInArray!0 (select (arr!15906 a!3235) j!176)))))

(declare-fun b!516475 () Bool)

(declare-fun res!316041 () Bool)

(assert (=> b!516475 (=> (not res!316041) (not e!301416))))

(assert (=> b!516475 (= res!316041 (validKeyInArray!0 k!2280))))

(declare-fun b!516476 () Bool)

(assert (=> b!516476 (= e!301419 (not e!301418))))

(declare-fun res!316038 () Bool)

(assert (=> b!516476 (=> res!316038 e!301418)))

(declare-fun lt!236432 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33076 (_ BitVec 32)) SeekEntryResult!4373)

(assert (=> b!516476 (= res!316038 (= lt!236434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236432 (select (store (arr!15906 a!3235) i!1204 k!2280) j!176) (array!33077 (store (arr!15906 a!3235) i!1204 k!2280) (size!16270 a!3235)) mask!3524)))))

(declare-fun lt!236431 () (_ BitVec 32))

(assert (=> b!516476 (= lt!236434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236431 (select (arr!15906 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516476 (= lt!236432 (toIndex!0 (select (store (arr!15906 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516476 (= lt!236431 (toIndex!0 (select (arr!15906 a!3235) j!176) mask!3524))))

(declare-fun e!301415 () Bool)

(assert (=> b!516476 e!301415))

(declare-fun res!316043 () Bool)

(assert (=> b!516476 (=> (not res!316043) (not e!301415))))

(assert (=> b!516476 (= res!316043 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16004 0))(
  ( (Unit!16005) )
))
(declare-fun lt!236430 () Unit!16004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16004)

(assert (=> b!516476 (= lt!236430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516477 () Bool)

(declare-fun res!316037 () Bool)

(assert (=> b!516477 (=> (not res!316037) (not e!301416))))

(declare-fun arrayContainsKey!0 (array!33076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516477 (= res!316037 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516478 () Bool)

(assert (=> b!516478 (= e!301418 true)))

(assert (=> b!516478 (and (bvslt (x!48640 lt!236434) #b01111111111111111111111111111110) (or (= (select (arr!15906 a!3235) (index!19682 lt!236434)) (select (arr!15906 a!3235) j!176)) (= (select (arr!15906 a!3235) (index!19682 lt!236434)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15906 a!3235) (index!19682 lt!236434)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516479 () Bool)

(assert (=> b!516479 (= e!301415 (= (seekEntryOrOpen!0 (select (arr!15906 a!3235) j!176) a!3235 mask!3524) (Found!4373 j!176)))))

(assert (= (and start!46764 res!316040) b!516472))

(assert (= (and b!516472 res!316033) b!516474))

(assert (= (and b!516474 res!316042) b!516475))

(assert (= (and b!516475 res!316041) b!516477))

(assert (= (and b!516477 res!316037) b!516469))

(assert (= (and b!516469 res!316035) b!516471))

(assert (= (and b!516471 res!316039) b!516470))

(assert (= (and b!516470 res!316036) b!516476))

(assert (= (and b!516476 res!316043) b!516479))

(assert (= (and b!516476 (not res!316038)) b!516473))

(assert (= (and b!516473 (not res!316034)) b!516478))

(declare-fun m!497961 () Bool)

(assert (=> b!516471 m!497961))

(declare-fun m!497963 () Bool)

(assert (=> b!516469 m!497963))

(declare-fun m!497965 () Bool)

(assert (=> b!516477 m!497965))

(declare-fun m!497967 () Bool)

(assert (=> start!46764 m!497967))

(declare-fun m!497969 () Bool)

(assert (=> start!46764 m!497969))

(declare-fun m!497971 () Bool)

(assert (=> b!516476 m!497971))

(declare-fun m!497973 () Bool)

(assert (=> b!516476 m!497973))

(declare-fun m!497975 () Bool)

(assert (=> b!516476 m!497975))

(declare-fun m!497977 () Bool)

(assert (=> b!516476 m!497977))

(declare-fun m!497979 () Bool)

(assert (=> b!516476 m!497979))

(assert (=> b!516476 m!497977))

(declare-fun m!497981 () Bool)

(assert (=> b!516476 m!497981))

(assert (=> b!516476 m!497975))

(declare-fun m!497983 () Bool)

(assert (=> b!516476 m!497983))

(assert (=> b!516476 m!497977))

(declare-fun m!497985 () Bool)

(assert (=> b!516476 m!497985))

(assert (=> b!516476 m!497975))

(declare-fun m!497987 () Bool)

(assert (=> b!516476 m!497987))

(declare-fun m!497989 () Bool)

(assert (=> b!516475 m!497989))

(assert (=> b!516479 m!497977))

(assert (=> b!516479 m!497977))

(declare-fun m!497991 () Bool)

(assert (=> b!516479 m!497991))

(declare-fun m!497993 () Bool)

(assert (=> b!516478 m!497993))

(assert (=> b!516478 m!497977))

(assert (=> b!516474 m!497977))

(assert (=> b!516474 m!497977))

(declare-fun m!497995 () Bool)

(assert (=> b!516474 m!497995))

(declare-fun m!497997 () Bool)

(assert (=> b!516470 m!497997))

(push 1)

