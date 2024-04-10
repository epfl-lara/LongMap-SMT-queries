; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51570 () Bool)

(assert start!51570)

(declare-fun res!355461 () Bool)

(declare-fun e!325067 () Bool)

(assert (=> start!51570 (=> (not res!355461) (not e!325067))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51570 (= res!355461 (validMask!0 mask!3119))))

(assert (=> start!51570 e!325067))

(assert (=> start!51570 true))

(declare-datatypes ((array!35435 0))(
  ( (array!35436 (arr!17018 (Array (_ BitVec 32) (_ BitVec 64))) (size!17382 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35435)

(declare-fun array_inv!12814 (array!35435) Bool)

(assert (=> start!51570 (array_inv!12814 a!3118)))

(declare-fun b!564307 () Bool)

(declare-fun res!355463 () Bool)

(assert (=> b!564307 (=> (not res!355463) (not e!325067))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564307 (= res!355463 (validKeyInArray!0 k!1914))))

(declare-fun b!564308 () Bool)

(declare-fun res!355459 () Bool)

(declare-fun e!325066 () Bool)

(assert (=> b!564308 (=> (not res!355459) (not e!325066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35435 (_ BitVec 32)) Bool)

(assert (=> b!564308 (= res!355459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564309 () Bool)

(assert (=> b!564309 (= e!325066 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257496 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564309 (= lt!257496 (toIndex!0 (select (arr!17018 a!3118) j!142) mask!3119))))

(declare-fun b!564310 () Bool)

(declare-fun res!355466 () Bool)

(assert (=> b!564310 (=> (not res!355466) (not e!325067))))

(assert (=> b!564310 (= res!355466 (validKeyInArray!0 (select (arr!17018 a!3118) j!142)))))

(declare-fun b!564311 () Bool)

(declare-fun res!355462 () Bool)

(assert (=> b!564311 (=> (not res!355462) (not e!325067))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564311 (= res!355462 (and (= (size!17382 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17382 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17382 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564312 () Bool)

(declare-fun res!355460 () Bool)

(assert (=> b!564312 (=> (not res!355460) (not e!325067))))

(declare-fun arrayContainsKey!0 (array!35435 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564312 (= res!355460 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564313 () Bool)

(assert (=> b!564313 (= e!325067 e!325066)))

(declare-fun res!355464 () Bool)

(assert (=> b!564313 (=> (not res!355464) (not e!325066))))

(declare-datatypes ((SeekEntryResult!5467 0))(
  ( (MissingZero!5467 (index!24095 (_ BitVec 32))) (Found!5467 (index!24096 (_ BitVec 32))) (Intermediate!5467 (undefined!6279 Bool) (index!24097 (_ BitVec 32)) (x!52970 (_ BitVec 32))) (Undefined!5467) (MissingVacant!5467 (index!24098 (_ BitVec 32))) )
))
(declare-fun lt!257497 () SeekEntryResult!5467)

(assert (=> b!564313 (= res!355464 (or (= lt!257497 (MissingZero!5467 i!1132)) (= lt!257497 (MissingVacant!5467 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35435 (_ BitVec 32)) SeekEntryResult!5467)

(assert (=> b!564313 (= lt!257497 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564314 () Bool)

(declare-fun res!355465 () Bool)

(assert (=> b!564314 (=> (not res!355465) (not e!325066))))

(declare-datatypes ((List!11098 0))(
  ( (Nil!11095) (Cons!11094 (h!12097 (_ BitVec 64)) (t!17326 List!11098)) )
))
(declare-fun arrayNoDuplicates!0 (array!35435 (_ BitVec 32) List!11098) Bool)

(assert (=> b!564314 (= res!355465 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11095))))

(assert (= (and start!51570 res!355461) b!564311))

(assert (= (and b!564311 res!355462) b!564310))

(assert (= (and b!564310 res!355466) b!564307))

(assert (= (and b!564307 res!355463) b!564312))

(assert (= (and b!564312 res!355460) b!564313))

(assert (= (and b!564313 res!355464) b!564308))

(assert (= (and b!564308 res!355459) b!564314))

(assert (= (and b!564314 res!355465) b!564309))

(declare-fun m!542743 () Bool)

(assert (=> b!564313 m!542743))

(declare-fun m!542745 () Bool)

(assert (=> b!564310 m!542745))

(assert (=> b!564310 m!542745))

(declare-fun m!542747 () Bool)

(assert (=> b!564310 m!542747))

(declare-fun m!542749 () Bool)

(assert (=> b!564314 m!542749))

(assert (=> b!564309 m!542745))

(assert (=> b!564309 m!542745))

(declare-fun m!542751 () Bool)

(assert (=> b!564309 m!542751))

(declare-fun m!542753 () Bool)

(assert (=> b!564307 m!542753))

(declare-fun m!542755 () Bool)

(assert (=> b!564312 m!542755))

(declare-fun m!542757 () Bool)

(assert (=> start!51570 m!542757))

(declare-fun m!542759 () Bool)

(assert (=> start!51570 m!542759))

(declare-fun m!542761 () Bool)

(assert (=> b!564308 m!542761))

(push 1)

(assert (not b!564314))

(assert (not b!564310))

(assert (not b!564312))

(assert (not b!564308))

