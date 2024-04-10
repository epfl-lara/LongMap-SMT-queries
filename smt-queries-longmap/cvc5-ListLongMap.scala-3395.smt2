; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46842 () Bool)

(assert start!46842)

(declare-fun b!517057 () Bool)

(declare-fun res!316444 () Bool)

(declare-fun e!301739 () Bool)

(assert (=> b!517057 (=> (not res!316444) (not e!301739))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33097 0))(
  ( (array!33098 (arr!15915 (Array (_ BitVec 32) (_ BitVec 64))) (size!16279 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33097)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517057 (= res!316444 (and (= (size!16279 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16279 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16279 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517058 () Bool)

(declare-fun res!316447 () Bool)

(assert (=> b!517058 (=> (not res!316447) (not e!301739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517058 (= res!316447 (validKeyInArray!0 (select (arr!15915 a!3235) j!176)))))

(declare-fun b!517059 () Bool)

(declare-fun res!316443 () Bool)

(assert (=> b!517059 (=> (not res!316443) (not e!301739))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!517059 (= res!316443 (validKeyInArray!0 k!2280))))

(declare-fun b!517060 () Bool)

(declare-fun res!316448 () Bool)

(declare-fun e!301737 () Bool)

(assert (=> b!517060 (=> (not res!316448) (not e!301737))))

(declare-datatypes ((List!10073 0))(
  ( (Nil!10070) (Cons!10069 (h!10970 (_ BitVec 64)) (t!16301 List!10073)) )
))
(declare-fun arrayNoDuplicates!0 (array!33097 (_ BitVec 32) List!10073) Bool)

(assert (=> b!517060 (= res!316448 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10070))))

(declare-fun b!517061 () Bool)

(assert (=> b!517061 (= e!301739 e!301737)))

(declare-fun res!316438 () Bool)

(assert (=> b!517061 (=> (not res!316438) (not e!301737))))

(declare-datatypes ((SeekEntryResult!4382 0))(
  ( (MissingZero!4382 (index!19716 (_ BitVec 32))) (Found!4382 (index!19717 (_ BitVec 32))) (Intermediate!4382 (undefined!5194 Bool) (index!19718 (_ BitVec 32)) (x!48679 (_ BitVec 32))) (Undefined!4382) (MissingVacant!4382 (index!19719 (_ BitVec 32))) )
))
(declare-fun lt!236695 () SeekEntryResult!4382)

(assert (=> b!517061 (= res!316438 (or (= lt!236695 (MissingZero!4382 i!1204)) (= lt!236695 (MissingVacant!4382 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33097 (_ BitVec 32)) SeekEntryResult!4382)

(assert (=> b!517061 (= lt!236695 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!517062 () Bool)

(declare-fun e!301740 () Bool)

(assert (=> b!517062 (= e!301740 (= (seekEntryOrOpen!0 (select (arr!15915 a!3235) j!176) a!3235 mask!3524) (Found!4382 j!176)))))

(declare-fun b!517063 () Bool)

(declare-fun e!301738 () Bool)

(assert (=> b!517063 (= e!301737 (not e!301738))))

(declare-fun res!316441 () Bool)

(assert (=> b!517063 (=> res!316441 e!301738)))

(declare-fun lt!236698 () SeekEntryResult!4382)

(declare-fun lt!236696 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33097 (_ BitVec 32)) SeekEntryResult!4382)

(assert (=> b!517063 (= res!316441 (= lt!236698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236696 (select (store (arr!15915 a!3235) i!1204 k!2280) j!176) (array!33098 (store (arr!15915 a!3235) i!1204 k!2280) (size!16279 a!3235)) mask!3524)))))

(declare-fun lt!236694 () (_ BitVec 32))

(assert (=> b!517063 (= lt!236698 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236694 (select (arr!15915 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517063 (= lt!236696 (toIndex!0 (select (store (arr!15915 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517063 (= lt!236694 (toIndex!0 (select (arr!15915 a!3235) j!176) mask!3524))))

(assert (=> b!517063 e!301740))

(declare-fun res!316442 () Bool)

(assert (=> b!517063 (=> (not res!316442) (not e!301740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33097 (_ BitVec 32)) Bool)

(assert (=> b!517063 (= res!316442 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16022 0))(
  ( (Unit!16023) )
))
(declare-fun lt!236697 () Unit!16022)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33097 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16022)

(assert (=> b!517063 (= lt!236697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517064 () Bool)

(declare-fun res!316445 () Bool)

(assert (=> b!517064 (=> res!316445 e!301738)))

(assert (=> b!517064 (= res!316445 (or (undefined!5194 lt!236698) (not (is-Intermediate!4382 lt!236698))))))

(declare-fun b!517066 () Bool)

(declare-fun res!316440 () Bool)

(assert (=> b!517066 (=> (not res!316440) (not e!301737))))

(assert (=> b!517066 (= res!316440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517067 () Bool)

(declare-fun res!316439 () Bool)

(assert (=> b!517067 (=> (not res!316439) (not e!301739))))

(declare-fun arrayContainsKey!0 (array!33097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517067 (= res!316439 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517065 () Bool)

(assert (=> b!517065 (= e!301738 true)))

(assert (=> b!517065 (and (bvslt (x!48679 lt!236698) #b01111111111111111111111111111110) (or (= (select (arr!15915 a!3235) (index!19718 lt!236698)) (select (arr!15915 a!3235) j!176)) (= (select (arr!15915 a!3235) (index!19718 lt!236698)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15915 a!3235) (index!19718 lt!236698)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!316446 () Bool)

(assert (=> start!46842 (=> (not res!316446) (not e!301739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46842 (= res!316446 (validMask!0 mask!3524))))

(assert (=> start!46842 e!301739))

(assert (=> start!46842 true))

(declare-fun array_inv!11711 (array!33097) Bool)

(assert (=> start!46842 (array_inv!11711 a!3235)))

(assert (= (and start!46842 res!316446) b!517057))

(assert (= (and b!517057 res!316444) b!517058))

(assert (= (and b!517058 res!316447) b!517059))

(assert (= (and b!517059 res!316443) b!517067))

(assert (= (and b!517067 res!316439) b!517061))

(assert (= (and b!517061 res!316438) b!517066))

(assert (= (and b!517066 res!316440) b!517060))

(assert (= (and b!517060 res!316448) b!517063))

(assert (= (and b!517063 res!316442) b!517062))

(assert (= (and b!517063 (not res!316441)) b!517064))

(assert (= (and b!517064 (not res!316445)) b!517065))

(declare-fun m!498507 () Bool)

(assert (=> b!517066 m!498507))

(declare-fun m!498509 () Bool)

(assert (=> b!517059 m!498509))

(declare-fun m!498511 () Bool)

(assert (=> b!517058 m!498511))

(assert (=> b!517058 m!498511))

(declare-fun m!498513 () Bool)

(assert (=> b!517058 m!498513))

(declare-fun m!498515 () Bool)

(assert (=> b!517063 m!498515))

(declare-fun m!498517 () Bool)

(assert (=> b!517063 m!498517))

(declare-fun m!498519 () Bool)

(assert (=> b!517063 m!498519))

(assert (=> b!517063 m!498511))

(declare-fun m!498521 () Bool)

(assert (=> b!517063 m!498521))

(assert (=> b!517063 m!498511))

(declare-fun m!498523 () Bool)

(assert (=> b!517063 m!498523))

(assert (=> b!517063 m!498519))

(declare-fun m!498525 () Bool)

(assert (=> b!517063 m!498525))

(assert (=> b!517063 m!498511))

(declare-fun m!498527 () Bool)

(assert (=> b!517063 m!498527))

(assert (=> b!517063 m!498519))

(declare-fun m!498529 () Bool)

(assert (=> b!517063 m!498529))

(declare-fun m!498531 () Bool)

(assert (=> start!46842 m!498531))

(declare-fun m!498533 () Bool)

(assert (=> start!46842 m!498533))

(declare-fun m!498535 () Bool)

(assert (=> b!517067 m!498535))

(declare-fun m!498537 () Bool)

(assert (=> b!517060 m!498537))

(declare-fun m!498539 () Bool)

(assert (=> b!517061 m!498539))

(assert (=> b!517062 m!498511))

(assert (=> b!517062 m!498511))

(declare-fun m!498541 () Bool)

(assert (=> b!517062 m!498541))

(declare-fun m!498543 () Bool)

(assert (=> b!517065 m!498543))

(assert (=> b!517065 m!498511))

(push 1)

