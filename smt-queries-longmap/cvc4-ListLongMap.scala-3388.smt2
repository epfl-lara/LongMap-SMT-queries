; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46744 () Bool)

(assert start!46744)

(declare-fun b!516139 () Bool)

(declare-fun res!315709 () Bool)

(declare-fun e!301266 () Bool)

(assert (=> b!516139 (=> (not res!315709) (not e!301266))))

(declare-datatypes ((array!33056 0))(
  ( (array!33057 (arr!15896 (Array (_ BitVec 32) (_ BitVec 64))) (size!16260 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33056)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33056 (_ BitVec 32)) Bool)

(assert (=> b!516139 (= res!315709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516140 () Bool)

(declare-fun e!301267 () Bool)

(assert (=> b!516140 (= e!301266 (not e!301267))))

(declare-fun res!315711 () Bool)

(assert (=> b!516140 (=> res!315711 e!301267)))

(declare-datatypes ((SeekEntryResult!4363 0))(
  ( (MissingZero!4363 (index!19640 (_ BitVec 32))) (Found!4363 (index!19641 (_ BitVec 32))) (Intermediate!4363 (undefined!5175 Bool) (index!19642 (_ BitVec 32)) (x!48598 (_ BitVec 32))) (Undefined!4363) (MissingVacant!4363 (index!19643 (_ BitVec 32))) )
))
(declare-fun lt!236282 () SeekEntryResult!4363)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236280 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33056 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!516140 (= res!315711 (= lt!236282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236280 (select (store (arr!15896 a!3235) i!1204 k!2280) j!176) (array!33057 (store (arr!15896 a!3235) i!1204 k!2280) (size!16260 a!3235)) mask!3524)))))

(declare-fun lt!236284 () (_ BitVec 32))

(assert (=> b!516140 (= lt!236282 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236284 (select (arr!15896 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516140 (= lt!236280 (toIndex!0 (select (store (arr!15896 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516140 (= lt!236284 (toIndex!0 (select (arr!15896 a!3235) j!176) mask!3524))))

(declare-fun e!301265 () Bool)

(assert (=> b!516140 e!301265))

(declare-fun res!315708 () Bool)

(assert (=> b!516140 (=> (not res!315708) (not e!301265))))

(assert (=> b!516140 (= res!315708 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15984 0))(
  ( (Unit!15985) )
))
(declare-fun lt!236281 () Unit!15984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15984)

(assert (=> b!516140 (= lt!236281 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516141 () Bool)

(declare-fun res!315707 () Bool)

(declare-fun e!301269 () Bool)

(assert (=> b!516141 (=> (not res!315707) (not e!301269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516141 (= res!315707 (validKeyInArray!0 k!2280))))

(declare-fun b!516142 () Bool)

(declare-fun res!315704 () Bool)

(assert (=> b!516142 (=> (not res!315704) (not e!301269))))

(assert (=> b!516142 (= res!315704 (validKeyInArray!0 (select (arr!15896 a!3235) j!176)))))

(declare-fun b!516143 () Bool)

(declare-fun res!315705 () Bool)

(assert (=> b!516143 (=> (not res!315705) (not e!301269))))

(assert (=> b!516143 (= res!315705 (and (= (size!16260 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16260 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16260 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315712 () Bool)

(assert (=> start!46744 (=> (not res!315712) (not e!301269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46744 (= res!315712 (validMask!0 mask!3524))))

(assert (=> start!46744 e!301269))

(assert (=> start!46744 true))

(declare-fun array_inv!11692 (array!33056) Bool)

(assert (=> start!46744 (array_inv!11692 a!3235)))

(declare-fun b!516144 () Bool)

(declare-fun res!315703 () Bool)

(assert (=> b!516144 (=> (not res!315703) (not e!301269))))

(declare-fun arrayContainsKey!0 (array!33056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516144 (= res!315703 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516145 () Bool)

(declare-fun res!315706 () Bool)

(assert (=> b!516145 (=> (not res!315706) (not e!301266))))

(declare-datatypes ((List!10054 0))(
  ( (Nil!10051) (Cons!10050 (h!10948 (_ BitVec 64)) (t!16282 List!10054)) )
))
(declare-fun arrayNoDuplicates!0 (array!33056 (_ BitVec 32) List!10054) Bool)

(assert (=> b!516145 (= res!315706 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10051))))

(declare-fun b!516146 () Bool)

(assert (=> b!516146 (= e!301269 e!301266)))

(declare-fun res!315713 () Bool)

(assert (=> b!516146 (=> (not res!315713) (not e!301266))))

(declare-fun lt!236283 () SeekEntryResult!4363)

(assert (=> b!516146 (= res!315713 (or (= lt!236283 (MissingZero!4363 i!1204)) (= lt!236283 (MissingVacant!4363 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33056 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!516146 (= lt!236283 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516147 () Bool)

(assert (=> b!516147 (= e!301265 (= (seekEntryOrOpen!0 (select (arr!15896 a!3235) j!176) a!3235 mask!3524) (Found!4363 j!176)))))

(declare-fun b!516148 () Bool)

(assert (=> b!516148 (= e!301267 true)))

(assert (=> b!516148 (and (bvslt (x!48598 lt!236282) #b01111111111111111111111111111110) (or (= (select (arr!15896 a!3235) (index!19642 lt!236282)) (select (arr!15896 a!3235) j!176)) (= (select (arr!15896 a!3235) (index!19642 lt!236282)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15896 a!3235) (index!19642 lt!236282)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516149 () Bool)

(declare-fun res!315710 () Bool)

(assert (=> b!516149 (=> res!315710 e!301267)))

(assert (=> b!516149 (= res!315710 (or (undefined!5175 lt!236282) (not (is-Intermediate!4363 lt!236282))))))

(assert (= (and start!46744 res!315712) b!516143))

(assert (= (and b!516143 res!315705) b!516142))

(assert (= (and b!516142 res!315704) b!516141))

(assert (= (and b!516141 res!315707) b!516144))

(assert (= (and b!516144 res!315703) b!516146))

(assert (= (and b!516146 res!315713) b!516139))

(assert (= (and b!516139 res!315709) b!516145))

(assert (= (and b!516145 res!315706) b!516140))

(assert (= (and b!516140 res!315708) b!516147))

(assert (= (and b!516140 (not res!315711)) b!516149))

(assert (= (and b!516149 (not res!315710)) b!516148))

(declare-fun m!497581 () Bool)

(assert (=> b!516147 m!497581))

(assert (=> b!516147 m!497581))

(declare-fun m!497583 () Bool)

(assert (=> b!516147 m!497583))

(declare-fun m!497585 () Bool)

(assert (=> start!46744 m!497585))

(declare-fun m!497587 () Bool)

(assert (=> start!46744 m!497587))

(declare-fun m!497589 () Bool)

(assert (=> b!516146 m!497589))

(assert (=> b!516142 m!497581))

(assert (=> b!516142 m!497581))

(declare-fun m!497591 () Bool)

(assert (=> b!516142 m!497591))

(declare-fun m!497593 () Bool)

(assert (=> b!516139 m!497593))

(declare-fun m!497595 () Bool)

(assert (=> b!516148 m!497595))

(assert (=> b!516148 m!497581))

(declare-fun m!497597 () Bool)

(assert (=> b!516144 m!497597))

(declare-fun m!497599 () Bool)

(assert (=> b!516145 m!497599))

(declare-fun m!497601 () Bool)

(assert (=> b!516140 m!497601))

(declare-fun m!497603 () Bool)

(assert (=> b!516140 m!497603))

(assert (=> b!516140 m!497581))

(declare-fun m!497605 () Bool)

(assert (=> b!516140 m!497605))

(declare-fun m!497607 () Bool)

(assert (=> b!516140 m!497607))

(assert (=> b!516140 m!497603))

(declare-fun m!497609 () Bool)

(assert (=> b!516140 m!497609))

(declare-fun m!497611 () Bool)

(assert (=> b!516140 m!497611))

(assert (=> b!516140 m!497581))

(declare-fun m!497613 () Bool)

(assert (=> b!516140 m!497613))

(assert (=> b!516140 m!497603))

(declare-fun m!497615 () Bool)

(assert (=> b!516140 m!497615))

(assert (=> b!516140 m!497581))

(declare-fun m!497617 () Bool)

(assert (=> b!516141 m!497617))

(push 1)

