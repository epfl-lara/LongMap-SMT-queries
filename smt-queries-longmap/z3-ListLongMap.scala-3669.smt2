; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50632 () Bool)

(assert start!50632)

(declare-fun b!553399 () Bool)

(declare-fun res!345811 () Bool)

(declare-fun e!319233 () Bool)

(assert (=> b!553399 (=> (not res!345811) (not e!319233))))

(declare-datatypes ((array!34857 0))(
  ( (array!34858 (arr!16738 (Array (_ BitVec 32) (_ BitVec 64))) (size!17102 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34857)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34857 (_ BitVec 32)) Bool)

(assert (=> b!553399 (= res!345811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553400 () Bool)

(declare-fun res!345820 () Bool)

(declare-fun e!319231 () Bool)

(assert (=> b!553400 (=> (not res!345820) (not e!319231))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553400 (= res!345820 (validKeyInArray!0 (select (arr!16738 a!3118) j!142)))))

(declare-fun b!553402 () Bool)

(assert (=> b!553402 (= e!319231 e!319233)))

(declare-fun res!345814 () Bool)

(assert (=> b!553402 (=> (not res!345814) (not e!319233))))

(declare-datatypes ((SeekEntryResult!5187 0))(
  ( (MissingZero!5187 (index!22975 (_ BitVec 32))) (Found!5187 (index!22976 (_ BitVec 32))) (Intermediate!5187 (undefined!5999 Bool) (index!22977 (_ BitVec 32)) (x!51901 (_ BitVec 32))) (Undefined!5187) (MissingVacant!5187 (index!22978 (_ BitVec 32))) )
))
(declare-fun lt!251467 () SeekEntryResult!5187)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553402 (= res!345814 (or (= lt!251467 (MissingZero!5187 i!1132)) (= lt!251467 (MissingVacant!5187 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34857 (_ BitVec 32)) SeekEntryResult!5187)

(assert (=> b!553402 (= lt!251467 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553403 () Bool)

(declare-fun e!319234 () Bool)

(assert (=> b!553403 (= e!319234 (validKeyInArray!0 (select (store (arr!16738 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!553404 () Bool)

(declare-fun res!345816 () Bool)

(assert (=> b!553404 (=> (not res!345816) (not e!319231))))

(declare-fun arrayContainsKey!0 (array!34857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553404 (= res!345816 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553405 () Bool)

(declare-fun res!345819 () Bool)

(assert (=> b!553405 (=> (not res!345819) (not e!319231))))

(assert (=> b!553405 (= res!345819 (and (= (size!17102 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17102 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17102 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553406 () Bool)

(declare-fun res!345813 () Bool)

(assert (=> b!553406 (=> (not res!345813) (not e!319231))))

(assert (=> b!553406 (= res!345813 (validKeyInArray!0 k0!1914))))

(declare-fun b!553407 () Bool)

(declare-fun e!319232 () Bool)

(assert (=> b!553407 (= e!319233 e!319232)))

(declare-fun res!345812 () Bool)

(assert (=> b!553407 (=> (not res!345812) (not e!319232))))

(declare-fun lt!251469 () (_ BitVec 32))

(declare-fun lt!251470 () SeekEntryResult!5187)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34857 (_ BitVec 32)) SeekEntryResult!5187)

(assert (=> b!553407 (= res!345812 (= lt!251470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251469 (select (store (arr!16738 a!3118) i!1132 k0!1914) j!142) (array!34858 (store (arr!16738 a!3118) i!1132 k0!1914) (size!17102 a!3118)) mask!3119)))))

(declare-fun lt!251468 () (_ BitVec 32))

(assert (=> b!553407 (= lt!251470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251468 (select (arr!16738 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553407 (= lt!251469 (toIndex!0 (select (store (arr!16738 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553407 (= lt!251468 (toIndex!0 (select (arr!16738 a!3118) j!142) mask!3119))))

(declare-fun e!319236 () Bool)

(declare-fun b!553408 () Bool)

(assert (=> b!553408 (= e!319236 (= (seekEntryOrOpen!0 (select (arr!16738 a!3118) j!142) a!3118 mask!3119) (Found!5187 j!142)))))

(declare-fun b!553409 () Bool)

(assert (=> b!553409 (= e!319232 (not e!319234))))

(declare-fun res!345815 () Bool)

(assert (=> b!553409 (=> res!345815 e!319234)))

(get-info :version)

(assert (=> b!553409 (= res!345815 (or (not ((_ is Intermediate!5187) lt!251470)) (not (undefined!5999 lt!251470)) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!553409 e!319236))

(declare-fun res!345821 () Bool)

(assert (=> b!553409 (=> (not res!345821) (not e!319236))))

(assert (=> b!553409 (= res!345821 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17148 0))(
  ( (Unit!17149) )
))
(declare-fun lt!251466 () Unit!17148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17148)

(assert (=> b!553409 (= lt!251466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553401 () Bool)

(declare-fun res!345818 () Bool)

(assert (=> b!553401 (=> (not res!345818) (not e!319233))))

(declare-datatypes ((List!10818 0))(
  ( (Nil!10815) (Cons!10814 (h!11799 (_ BitVec 64)) (t!17046 List!10818)) )
))
(declare-fun arrayNoDuplicates!0 (array!34857 (_ BitVec 32) List!10818) Bool)

(assert (=> b!553401 (= res!345818 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10815))))

(declare-fun res!345817 () Bool)

(assert (=> start!50632 (=> (not res!345817) (not e!319231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50632 (= res!345817 (validMask!0 mask!3119))))

(assert (=> start!50632 e!319231))

(assert (=> start!50632 true))

(declare-fun array_inv!12534 (array!34857) Bool)

(assert (=> start!50632 (array_inv!12534 a!3118)))

(assert (= (and start!50632 res!345817) b!553405))

(assert (= (and b!553405 res!345819) b!553400))

(assert (= (and b!553400 res!345820) b!553406))

(assert (= (and b!553406 res!345813) b!553404))

(assert (= (and b!553404 res!345816) b!553402))

(assert (= (and b!553402 res!345814) b!553399))

(assert (= (and b!553399 res!345811) b!553401))

(assert (= (and b!553401 res!345818) b!553407))

(assert (= (and b!553407 res!345812) b!553409))

(assert (= (and b!553409 res!345821) b!553408))

(assert (= (and b!553409 (not res!345815)) b!553403))

(declare-fun m!530471 () Bool)

(assert (=> b!553402 m!530471))

(declare-fun m!530473 () Bool)

(assert (=> b!553403 m!530473))

(declare-fun m!530475 () Bool)

(assert (=> b!553403 m!530475))

(assert (=> b!553403 m!530475))

(declare-fun m!530477 () Bool)

(assert (=> b!553403 m!530477))

(declare-fun m!530479 () Bool)

(assert (=> b!553400 m!530479))

(assert (=> b!553400 m!530479))

(declare-fun m!530481 () Bool)

(assert (=> b!553400 m!530481))

(assert (=> b!553408 m!530479))

(assert (=> b!553408 m!530479))

(declare-fun m!530483 () Bool)

(assert (=> b!553408 m!530483))

(declare-fun m!530485 () Bool)

(assert (=> b!553404 m!530485))

(assert (=> b!553407 m!530479))

(declare-fun m!530487 () Bool)

(assert (=> b!553407 m!530487))

(assert (=> b!553407 m!530479))

(declare-fun m!530489 () Bool)

(assert (=> b!553407 m!530489))

(assert (=> b!553407 m!530479))

(assert (=> b!553407 m!530475))

(assert (=> b!553407 m!530475))

(declare-fun m!530491 () Bool)

(assert (=> b!553407 m!530491))

(assert (=> b!553407 m!530473))

(assert (=> b!553407 m!530475))

(declare-fun m!530493 () Bool)

(assert (=> b!553407 m!530493))

(declare-fun m!530495 () Bool)

(assert (=> b!553399 m!530495))

(declare-fun m!530497 () Bool)

(assert (=> b!553401 m!530497))

(declare-fun m!530499 () Bool)

(assert (=> b!553406 m!530499))

(declare-fun m!530501 () Bool)

(assert (=> start!50632 m!530501))

(declare-fun m!530503 () Bool)

(assert (=> start!50632 m!530503))

(declare-fun m!530505 () Bool)

(assert (=> b!553409 m!530505))

(declare-fun m!530507 () Bool)

(assert (=> b!553409 m!530507))

(check-sat (not b!553404) (not b!553403) (not b!553406) (not start!50632) (not b!553407) (not b!553399) (not b!553409) (not b!553400) (not b!553401) (not b!553408) (not b!553402))
(check-sat)
