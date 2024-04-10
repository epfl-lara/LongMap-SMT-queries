; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51580 () Bool)

(assert start!51580)

(declare-fun b!564418 () Bool)

(declare-fun res!355573 () Bool)

(declare-fun e!325112 () Bool)

(assert (=> b!564418 (=> (not res!355573) (not e!325112))))

(declare-datatypes ((array!35445 0))(
  ( (array!35446 (arr!17023 (Array (_ BitVec 32) (_ BitVec 64))) (size!17387 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35445)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564418 (= res!355573 (validKeyInArray!0 (select (arr!17023 a!3118) j!142)))))

(declare-fun b!564419 () Bool)

(declare-fun res!355572 () Bool)

(assert (=> b!564419 (=> (not res!355572) (not e!325112))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!564419 (= res!355572 (validKeyInArray!0 k0!1914))))

(declare-fun b!564420 () Bool)

(declare-fun res!355571 () Bool)

(assert (=> b!564420 (=> (not res!355571) (not e!325112))))

(declare-fun arrayContainsKey!0 (array!35445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564420 (= res!355571 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564421 () Bool)

(declare-fun res!355570 () Bool)

(declare-fun e!325111 () Bool)

(assert (=> b!564421 (=> (not res!355570) (not e!325111))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35445 (_ BitVec 32)) Bool)

(assert (=> b!564421 (= res!355570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564422 () Bool)

(declare-fun res!355574 () Bool)

(assert (=> b!564422 (=> (not res!355574) (not e!325112))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564422 (= res!355574 (and (= (size!17387 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17387 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17387 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564423 () Bool)

(assert (=> b!564423 (= e!325111 false)))

(declare-fun lt!257527 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564423 (= lt!257527 (toIndex!0 (select (store (arr!17023 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!564425 () Bool)

(assert (=> b!564425 (= e!325112 e!325111)))

(declare-fun res!355575 () Bool)

(assert (=> b!564425 (=> (not res!355575) (not e!325111))))

(declare-datatypes ((SeekEntryResult!5472 0))(
  ( (MissingZero!5472 (index!24115 (_ BitVec 32))) (Found!5472 (index!24116 (_ BitVec 32))) (Intermediate!5472 (undefined!6284 Bool) (index!24117 (_ BitVec 32)) (x!52991 (_ BitVec 32))) (Undefined!5472) (MissingVacant!5472 (index!24118 (_ BitVec 32))) )
))
(declare-fun lt!257526 () SeekEntryResult!5472)

(assert (=> b!564425 (= res!355575 (or (= lt!257526 (MissingZero!5472 i!1132)) (= lt!257526 (MissingVacant!5472 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35445 (_ BitVec 32)) SeekEntryResult!5472)

(assert (=> b!564425 (= lt!257526 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!355576 () Bool)

(assert (=> start!51580 (=> (not res!355576) (not e!325112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51580 (= res!355576 (validMask!0 mask!3119))))

(assert (=> start!51580 e!325112))

(assert (=> start!51580 true))

(declare-fun array_inv!12819 (array!35445) Bool)

(assert (=> start!51580 (array_inv!12819 a!3118)))

(declare-fun b!564424 () Bool)

(declare-fun res!355577 () Bool)

(assert (=> b!564424 (=> (not res!355577) (not e!325111))))

(declare-datatypes ((List!11103 0))(
  ( (Nil!11100) (Cons!11099 (h!12102 (_ BitVec 64)) (t!17331 List!11103)) )
))
(declare-fun arrayNoDuplicates!0 (array!35445 (_ BitVec 32) List!11103) Bool)

(assert (=> b!564424 (= res!355577 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11100))))

(assert (= (and start!51580 res!355576) b!564422))

(assert (= (and b!564422 res!355574) b!564418))

(assert (= (and b!564418 res!355573) b!564419))

(assert (= (and b!564419 res!355572) b!564420))

(assert (= (and b!564420 res!355571) b!564425))

(assert (= (and b!564425 res!355575) b!564421))

(assert (= (and b!564421 res!355570) b!564424))

(assert (= (and b!564424 res!355577) b!564423))

(declare-fun m!542841 () Bool)

(assert (=> b!564425 m!542841))

(declare-fun m!542843 () Bool)

(assert (=> b!564418 m!542843))

(assert (=> b!564418 m!542843))

(declare-fun m!542845 () Bool)

(assert (=> b!564418 m!542845))

(declare-fun m!542847 () Bool)

(assert (=> b!564419 m!542847))

(declare-fun m!542849 () Bool)

(assert (=> start!51580 m!542849))

(declare-fun m!542851 () Bool)

(assert (=> start!51580 m!542851))

(declare-fun m!542853 () Bool)

(assert (=> b!564420 m!542853))

(declare-fun m!542855 () Bool)

(assert (=> b!564421 m!542855))

(declare-fun m!542857 () Bool)

(assert (=> b!564423 m!542857))

(declare-fun m!542859 () Bool)

(assert (=> b!564423 m!542859))

(assert (=> b!564423 m!542859))

(declare-fun m!542861 () Bool)

(assert (=> b!564423 m!542861))

(declare-fun m!542863 () Bool)

(assert (=> b!564424 m!542863))

(check-sat (not b!564424) (not b!564425) (not b!564420) (not start!51580) (not b!564421) (not b!564419) (not b!564418) (not b!564423))
(check-sat)
