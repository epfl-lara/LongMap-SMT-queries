; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51574 () Bool)

(assert start!51574)

(declare-fun b!564350 () Bool)

(declare-fun e!325086 () Bool)

(declare-fun e!325084 () Bool)

(assert (=> b!564350 (= e!325086 e!325084)))

(declare-fun res!355503 () Bool)

(assert (=> b!564350 (=> (not res!355503) (not e!325084))))

(declare-datatypes ((SeekEntryResult!5469 0))(
  ( (MissingZero!5469 (index!24103 (_ BitVec 32))) (Found!5469 (index!24104 (_ BitVec 32))) (Intermediate!5469 (undefined!6281 Bool) (index!24105 (_ BitVec 32)) (x!52980 (_ BitVec 32))) (Undefined!5469) (MissingVacant!5469 (index!24106 (_ BitVec 32))) )
))
(declare-fun lt!257508 () SeekEntryResult!5469)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564350 (= res!355503 (or (= lt!257508 (MissingZero!5469 i!1132)) (= lt!257508 (MissingVacant!5469 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35439 0))(
  ( (array!35440 (arr!17020 (Array (_ BitVec 32) (_ BitVec 64))) (size!17384 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35439)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35439 (_ BitVec 32)) SeekEntryResult!5469)

(assert (=> b!564350 (= lt!257508 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564351 () Bool)

(declare-fun res!355505 () Bool)

(assert (=> b!564351 (=> (not res!355505) (not e!325086))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564351 (= res!355505 (validKeyInArray!0 (select (arr!17020 a!3118) j!142)))))

(declare-fun b!564352 () Bool)

(declare-fun res!355504 () Bool)

(assert (=> b!564352 (=> (not res!355504) (not e!325084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35439 (_ BitVec 32)) Bool)

(assert (=> b!564352 (= res!355504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564353 () Bool)

(declare-fun res!355502 () Bool)

(assert (=> b!564353 (=> (not res!355502) (not e!325086))))

(assert (=> b!564353 (= res!355502 (validKeyInArray!0 k0!1914))))

(declare-fun res!355506 () Bool)

(assert (=> start!51574 (=> (not res!355506) (not e!325086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51574 (= res!355506 (validMask!0 mask!3119))))

(assert (=> start!51574 e!325086))

(assert (=> start!51574 true))

(declare-fun array_inv!12816 (array!35439) Bool)

(assert (=> start!51574 (array_inv!12816 a!3118)))

(declare-fun b!564354 () Bool)

(declare-fun res!355507 () Bool)

(assert (=> b!564354 (=> (not res!355507) (not e!325086))))

(assert (=> b!564354 (= res!355507 (and (= (size!17384 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17384 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17384 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564355 () Bool)

(assert (=> b!564355 (= e!325084 false)))

(declare-fun lt!257509 () Bool)

(declare-datatypes ((List!11100 0))(
  ( (Nil!11097) (Cons!11096 (h!12099 (_ BitVec 64)) (t!17328 List!11100)) )
))
(declare-fun arrayNoDuplicates!0 (array!35439 (_ BitVec 32) List!11100) Bool)

(assert (=> b!564355 (= lt!257509 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11097))))

(declare-fun b!564356 () Bool)

(declare-fun res!355508 () Bool)

(assert (=> b!564356 (=> (not res!355508) (not e!325086))))

(declare-fun arrayContainsKey!0 (array!35439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564356 (= res!355508 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51574 res!355506) b!564354))

(assert (= (and b!564354 res!355507) b!564351))

(assert (= (and b!564351 res!355505) b!564353))

(assert (= (and b!564353 res!355502) b!564356))

(assert (= (and b!564356 res!355508) b!564350))

(assert (= (and b!564350 res!355503) b!564352))

(assert (= (and b!564352 res!355504) b!564355))

(declare-fun m!542781 () Bool)

(assert (=> b!564352 m!542781))

(declare-fun m!542783 () Bool)

(assert (=> b!564356 m!542783))

(declare-fun m!542785 () Bool)

(assert (=> b!564353 m!542785))

(declare-fun m!542787 () Bool)

(assert (=> b!564355 m!542787))

(declare-fun m!542789 () Bool)

(assert (=> b!564351 m!542789))

(assert (=> b!564351 m!542789))

(declare-fun m!542791 () Bool)

(assert (=> b!564351 m!542791))

(declare-fun m!542793 () Bool)

(assert (=> start!51574 m!542793))

(declare-fun m!542795 () Bool)

(assert (=> start!51574 m!542795))

(declare-fun m!542797 () Bool)

(assert (=> b!564350 m!542797))

(check-sat (not b!564353) (not b!564352) (not start!51574) (not b!564356) (not b!564355) (not b!564351) (not b!564350))
(check-sat)
