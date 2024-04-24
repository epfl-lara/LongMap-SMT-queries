; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51558 () Bool)

(assert start!51558)

(declare-fun b!563725 () Bool)

(declare-fun res!354778 () Bool)

(declare-fun e!324855 () Bool)

(assert (=> b!563725 (=> (not res!354778) (not e!324855))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35370 0))(
  ( (array!35371 (arr!16984 (Array (_ BitVec 32) (_ BitVec 64))) (size!17348 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35370)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5389 0))(
  ( (MissingZero!5389 (index!23783 (_ BitVec 32))) (Found!5389 (index!23784 (_ BitVec 32))) (Intermediate!5389 (undefined!6201 Bool) (index!23785 (_ BitVec 32)) (x!52823 (_ BitVec 32))) (Undefined!5389) (MissingVacant!5389 (index!23786 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35370 (_ BitVec 32)) SeekEntryResult!5389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563725 (= res!354778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16984 a!3118) j!142) mask!3119) (select (arr!16984 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16984 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16984 a!3118) i!1132 k0!1914) j!142) (array!35371 (store (arr!16984 a!3118) i!1132 k0!1914) (size!17348 a!3118)) mask!3119)))))

(declare-fun res!354779 () Bool)

(declare-fun e!324857 () Bool)

(assert (=> start!51558 (=> (not res!354779) (not e!324857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51558 (= res!354779 (validMask!0 mask!3119))))

(assert (=> start!51558 e!324857))

(assert (=> start!51558 true))

(declare-fun array_inv!12843 (array!35370) Bool)

(assert (=> start!51558 (array_inv!12843 a!3118)))

(declare-fun e!324858 () Bool)

(declare-fun b!563726 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35370 (_ BitVec 32)) SeekEntryResult!5389)

(assert (=> b!563726 (= e!324858 (= (seekEntryOrOpen!0 (select (arr!16984 a!3118) j!142) a!3118 mask!3119) (Found!5389 j!142)))))

(declare-fun b!563727 () Bool)

(declare-fun res!354781 () Bool)

(assert (=> b!563727 (=> (not res!354781) (not e!324855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35370 (_ BitVec 32)) Bool)

(assert (=> b!563727 (= res!354781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563728 () Bool)

(declare-fun res!354777 () Bool)

(assert (=> b!563728 (=> (not res!354777) (not e!324857))))

(assert (=> b!563728 (= res!354777 (and (= (size!17348 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17348 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17348 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563729 () Bool)

(assert (=> b!563729 (= e!324857 e!324855)))

(declare-fun res!354775 () Bool)

(assert (=> b!563729 (=> (not res!354775) (not e!324855))))

(declare-fun lt!257361 () SeekEntryResult!5389)

(assert (=> b!563729 (= res!354775 (or (= lt!257361 (MissingZero!5389 i!1132)) (= lt!257361 (MissingVacant!5389 i!1132))))))

(assert (=> b!563729 (= lt!257361 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563730 () Bool)

(declare-fun res!354772 () Bool)

(assert (=> b!563730 (=> (not res!354772) (not e!324857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563730 (= res!354772 (validKeyInArray!0 k0!1914))))

(declare-fun b!563731 () Bool)

(declare-fun res!354776 () Bool)

(assert (=> b!563731 (=> (not res!354776) (not e!324855))))

(declare-datatypes ((List!10971 0))(
  ( (Nil!10968) (Cons!10967 (h!11973 (_ BitVec 64)) (t!17191 List!10971)) )
))
(declare-fun arrayNoDuplicates!0 (array!35370 (_ BitVec 32) List!10971) Bool)

(assert (=> b!563731 (= res!354776 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10968))))

(declare-fun b!563732 () Bool)

(declare-fun res!354774 () Bool)

(assert (=> b!563732 (=> (not res!354774) (not e!324857))))

(assert (=> b!563732 (= res!354774 (validKeyInArray!0 (select (arr!16984 a!3118) j!142)))))

(declare-fun b!563733 () Bool)

(declare-fun res!354773 () Bool)

(assert (=> b!563733 (=> (not res!354773) (not e!324857))))

(declare-fun arrayContainsKey!0 (array!35370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563733 (= res!354773 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563734 () Bool)

(assert (=> b!563734 (= e!324855 (not true))))

(assert (=> b!563734 e!324858))

(declare-fun res!354780 () Bool)

(assert (=> b!563734 (=> (not res!354780) (not e!324858))))

(assert (=> b!563734 (= res!354780 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17623 0))(
  ( (Unit!17624) )
))
(declare-fun lt!257362 () Unit!17623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17623)

(assert (=> b!563734 (= lt!257362 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51558 res!354779) b!563728))

(assert (= (and b!563728 res!354777) b!563732))

(assert (= (and b!563732 res!354774) b!563730))

(assert (= (and b!563730 res!354772) b!563733))

(assert (= (and b!563733 res!354773) b!563729))

(assert (= (and b!563729 res!354775) b!563727))

(assert (= (and b!563727 res!354781) b!563731))

(assert (= (and b!563731 res!354776) b!563725))

(assert (= (and b!563725 res!354778) b!563734))

(assert (= (and b!563734 res!354780) b!563726))

(declare-fun m!542225 () Bool)

(assert (=> b!563725 m!542225))

(declare-fun m!542227 () Bool)

(assert (=> b!563725 m!542227))

(assert (=> b!563725 m!542225))

(declare-fun m!542229 () Bool)

(assert (=> b!563725 m!542229))

(declare-fun m!542231 () Bool)

(assert (=> b!563725 m!542231))

(assert (=> b!563725 m!542229))

(declare-fun m!542233 () Bool)

(assert (=> b!563725 m!542233))

(assert (=> b!563725 m!542227))

(assert (=> b!563725 m!542225))

(declare-fun m!542235 () Bool)

(assert (=> b!563725 m!542235))

(declare-fun m!542237 () Bool)

(assert (=> b!563725 m!542237))

(assert (=> b!563725 m!542229))

(assert (=> b!563725 m!542231))

(declare-fun m!542239 () Bool)

(assert (=> b!563734 m!542239))

(declare-fun m!542241 () Bool)

(assert (=> b!563734 m!542241))

(declare-fun m!542243 () Bool)

(assert (=> b!563727 m!542243))

(declare-fun m!542245 () Bool)

(assert (=> b!563729 m!542245))

(declare-fun m!542247 () Bool)

(assert (=> b!563733 m!542247))

(declare-fun m!542249 () Bool)

(assert (=> start!51558 m!542249))

(declare-fun m!542251 () Bool)

(assert (=> start!51558 m!542251))

(declare-fun m!542253 () Bool)

(assert (=> b!563731 m!542253))

(declare-fun m!542255 () Bool)

(assert (=> b!563730 m!542255))

(assert (=> b!563732 m!542225))

(assert (=> b!563732 m!542225))

(declare-fun m!542257 () Bool)

(assert (=> b!563732 m!542257))

(assert (=> b!563726 m!542225))

(assert (=> b!563726 m!542225))

(declare-fun m!542259 () Bool)

(assert (=> b!563726 m!542259))

(check-sat (not b!563730) (not start!51558) (not b!563725) (not b!563727) (not b!563734) (not b!563732) (not b!563733) (not b!563729) (not b!563726) (not b!563731))
(check-sat)
