; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51568 () Bool)

(assert start!51568)

(declare-fun b!564283 () Bool)

(declare-fun res!355439 () Bool)

(declare-fun e!325058 () Bool)

(assert (=> b!564283 (=> (not res!355439) (not e!325058))))

(declare-datatypes ((array!35433 0))(
  ( (array!35434 (arr!17017 (Array (_ BitVec 32) (_ BitVec 64))) (size!17381 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35433)

(declare-datatypes ((List!11097 0))(
  ( (Nil!11094) (Cons!11093 (h!12096 (_ BitVec 64)) (t!17325 List!11097)) )
))
(declare-fun arrayNoDuplicates!0 (array!35433 (_ BitVec 32) List!11097) Bool)

(assert (=> b!564283 (= res!355439 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11094))))

(declare-fun b!564284 () Bool)

(declare-fun res!355441 () Bool)

(assert (=> b!564284 (=> (not res!355441) (not e!325058))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35433 (_ BitVec 32)) Bool)

(assert (=> b!564284 (= res!355441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!355436 () Bool)

(declare-fun e!325059 () Bool)

(assert (=> start!51568 (=> (not res!355436) (not e!325059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51568 (= res!355436 (validMask!0 mask!3119))))

(assert (=> start!51568 e!325059))

(assert (=> start!51568 true))

(declare-fun array_inv!12813 (array!35433) Bool)

(assert (=> start!51568 (array_inv!12813 a!3118)))

(declare-fun b!564285 () Bool)

(declare-fun res!355435 () Bool)

(assert (=> b!564285 (=> (not res!355435) (not e!325059))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564285 (= res!355435 (and (= (size!17381 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17381 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17381 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564286 () Bool)

(declare-fun res!355438 () Bool)

(assert (=> b!564286 (=> (not res!355438) (not e!325059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564286 (= res!355438 (validKeyInArray!0 (select (arr!17017 a!3118) j!142)))))

(declare-fun b!564287 () Bool)

(declare-fun res!355440 () Bool)

(assert (=> b!564287 (=> (not res!355440) (not e!325059))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!564287 (= res!355440 (validKeyInArray!0 k0!1914))))

(declare-fun b!564288 () Bool)

(assert (=> b!564288 (= e!325059 e!325058)))

(declare-fun res!355442 () Bool)

(assert (=> b!564288 (=> (not res!355442) (not e!325058))))

(declare-datatypes ((SeekEntryResult!5466 0))(
  ( (MissingZero!5466 (index!24091 (_ BitVec 32))) (Found!5466 (index!24092 (_ BitVec 32))) (Intermediate!5466 (undefined!6278 Bool) (index!24093 (_ BitVec 32)) (x!52969 (_ BitVec 32))) (Undefined!5466) (MissingVacant!5466 (index!24094 (_ BitVec 32))) )
))
(declare-fun lt!257491 () SeekEntryResult!5466)

(assert (=> b!564288 (= res!355442 (or (= lt!257491 (MissingZero!5466 i!1132)) (= lt!257491 (MissingVacant!5466 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35433 (_ BitVec 32)) SeekEntryResult!5466)

(assert (=> b!564288 (= lt!257491 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564289 () Bool)

(assert (=> b!564289 (= e!325058 false)))

(declare-fun lt!257490 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564289 (= lt!257490 (toIndex!0 (select (arr!17017 a!3118) j!142) mask!3119))))

(declare-fun b!564290 () Bool)

(declare-fun res!355437 () Bool)

(assert (=> b!564290 (=> (not res!355437) (not e!325059))))

(declare-fun arrayContainsKey!0 (array!35433 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564290 (= res!355437 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51568 res!355436) b!564285))

(assert (= (and b!564285 res!355435) b!564286))

(assert (= (and b!564286 res!355438) b!564287))

(assert (= (and b!564287 res!355440) b!564290))

(assert (= (and b!564290 res!355437) b!564288))

(assert (= (and b!564288 res!355442) b!564284))

(assert (= (and b!564284 res!355441) b!564283))

(assert (= (and b!564283 res!355439) b!564289))

(declare-fun m!542723 () Bool)

(assert (=> b!564286 m!542723))

(assert (=> b!564286 m!542723))

(declare-fun m!542725 () Bool)

(assert (=> b!564286 m!542725))

(declare-fun m!542727 () Bool)

(assert (=> b!564288 m!542727))

(declare-fun m!542729 () Bool)

(assert (=> b!564284 m!542729))

(declare-fun m!542731 () Bool)

(assert (=> b!564287 m!542731))

(declare-fun m!542733 () Bool)

(assert (=> start!51568 m!542733))

(declare-fun m!542735 () Bool)

(assert (=> start!51568 m!542735))

(assert (=> b!564289 m!542723))

(assert (=> b!564289 m!542723))

(declare-fun m!542737 () Bool)

(assert (=> b!564289 m!542737))

(declare-fun m!542739 () Bool)

(assert (=> b!564283 m!542739))

(declare-fun m!542741 () Bool)

(assert (=> b!564290 m!542741))

(check-sat (not b!564286) (not b!564288) (not start!51568) (not b!564287) (not b!564284) (not b!564290) (not b!564289) (not b!564283))
(check-sat)
