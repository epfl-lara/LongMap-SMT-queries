; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51564 () Bool)

(assert start!51564)

(declare-fun b!564236 () Bool)

(declare-fun res!355389 () Bool)

(declare-fun e!325040 () Bool)

(assert (=> b!564236 (=> (not res!355389) (not e!325040))))

(declare-datatypes ((array!35429 0))(
  ( (array!35430 (arr!17015 (Array (_ BitVec 32) (_ BitVec 64))) (size!17379 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35429)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564236 (= res!355389 (validKeyInArray!0 (select (arr!17015 a!3118) j!142)))))

(declare-fun b!564237 () Bool)

(declare-fun res!355393 () Bool)

(assert (=> b!564237 (=> (not res!355393) (not e!325040))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!564237 (= res!355393 (validKeyInArray!0 k!1914))))

(declare-fun b!564238 () Bool)

(declare-fun e!325041 () Bool)

(assert (=> b!564238 (= e!325040 e!325041)))

(declare-fun res!355390 () Bool)

(assert (=> b!564238 (=> (not res!355390) (not e!325041))))

(declare-datatypes ((SeekEntryResult!5464 0))(
  ( (MissingZero!5464 (index!24083 (_ BitVec 32))) (Found!5464 (index!24084 (_ BitVec 32))) (Intermediate!5464 (undefined!6276 Bool) (index!24085 (_ BitVec 32)) (x!52959 (_ BitVec 32))) (Undefined!5464) (MissingVacant!5464 (index!24086 (_ BitVec 32))) )
))
(declare-fun lt!257479 () SeekEntryResult!5464)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564238 (= res!355390 (or (= lt!257479 (MissingZero!5464 i!1132)) (= lt!257479 (MissingVacant!5464 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35429 (_ BitVec 32)) SeekEntryResult!5464)

(assert (=> b!564238 (= lt!257479 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564239 () Bool)

(declare-fun res!355391 () Bool)

(assert (=> b!564239 (=> (not res!355391) (not e!325040))))

(declare-fun arrayContainsKey!0 (array!35429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564239 (= res!355391 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564240 () Bool)

(declare-fun res!355388 () Bool)

(assert (=> b!564240 (=> (not res!355388) (not e!325041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35429 (_ BitVec 32)) Bool)

(assert (=> b!564240 (= res!355388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564242 () Bool)

(assert (=> b!564242 (= e!325041 false)))

(declare-fun lt!257478 () Bool)

(declare-datatypes ((List!11095 0))(
  ( (Nil!11092) (Cons!11091 (h!12094 (_ BitVec 64)) (t!17323 List!11095)) )
))
(declare-fun arrayNoDuplicates!0 (array!35429 (_ BitVec 32) List!11095) Bool)

(assert (=> b!564242 (= lt!257478 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11092))))

(declare-fun res!355394 () Bool)

(assert (=> start!51564 (=> (not res!355394) (not e!325040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51564 (= res!355394 (validMask!0 mask!3119))))

(assert (=> start!51564 e!325040))

(assert (=> start!51564 true))

(declare-fun array_inv!12811 (array!35429) Bool)

(assert (=> start!51564 (array_inv!12811 a!3118)))

(declare-fun b!564241 () Bool)

(declare-fun res!355392 () Bool)

(assert (=> b!564241 (=> (not res!355392) (not e!325040))))

(assert (=> b!564241 (= res!355392 (and (= (size!17379 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17379 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17379 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51564 res!355394) b!564241))

(assert (= (and b!564241 res!355392) b!564236))

(assert (= (and b!564236 res!355389) b!564237))

(assert (= (and b!564237 res!355393) b!564239))

(assert (= (and b!564239 res!355391) b!564238))

(assert (= (and b!564238 res!355390) b!564240))

(assert (= (and b!564240 res!355388) b!564242))

(declare-fun m!542685 () Bool)

(assert (=> b!564239 m!542685))

(declare-fun m!542687 () Bool)

(assert (=> b!564240 m!542687))

(declare-fun m!542689 () Bool)

(assert (=> b!564242 m!542689))

(declare-fun m!542691 () Bool)

(assert (=> b!564237 m!542691))

(declare-fun m!542693 () Bool)

(assert (=> start!51564 m!542693))

(declare-fun m!542695 () Bool)

(assert (=> start!51564 m!542695))

(declare-fun m!542697 () Bool)

(assert (=> b!564236 m!542697))

(assert (=> b!564236 m!542697))

(declare-fun m!542699 () Bool)

(assert (=> b!564236 m!542699))

(declare-fun m!542701 () Bool)

(assert (=> b!564238 m!542701))

(push 1)

(assert (not b!564239))

(assert (not b!564236))

(assert (not b!564242))

(assert (not b!564238))

(assert (not b!564240))

(assert (not b!564237))

