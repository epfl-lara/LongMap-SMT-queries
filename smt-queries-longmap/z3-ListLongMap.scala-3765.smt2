; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51572 () Bool)

(assert start!51572)

(declare-fun b!564195 () Bool)

(declare-fun e!324956 () Bool)

(assert (=> b!564195 (= e!324956 false)))

(declare-fun lt!257304 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35446 0))(
  ( (array!35447 (arr!17024 (Array (_ BitVec 32) (_ BitVec 64))) (size!17389 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35446)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564195 (= lt!257304 (toIndex!0 (select (store (arr!17024 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!564196 () Bool)

(declare-fun res!355494 () Bool)

(declare-fun e!324957 () Bool)

(assert (=> b!564196 (=> (not res!355494) (not e!324957))))

(assert (=> b!564196 (= res!355494 (and (= (size!17389 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17389 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17389 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564197 () Bool)

(declare-fun res!355495 () Bool)

(assert (=> b!564197 (=> (not res!355495) (not e!324957))))

(declare-fun arrayContainsKey!0 (array!35446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564197 (= res!355495 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564198 () Bool)

(assert (=> b!564198 (= e!324957 e!324956)))

(declare-fun res!355489 () Bool)

(assert (=> b!564198 (=> (not res!355489) (not e!324956))))

(declare-datatypes ((SeekEntryResult!5470 0))(
  ( (MissingZero!5470 (index!24107 (_ BitVec 32))) (Found!5470 (index!24108 (_ BitVec 32))) (Intermediate!5470 (undefined!6282 Bool) (index!24109 (_ BitVec 32)) (x!52992 (_ BitVec 32))) (Undefined!5470) (MissingVacant!5470 (index!24110 (_ BitVec 32))) )
))
(declare-fun lt!257305 () SeekEntryResult!5470)

(assert (=> b!564198 (= res!355489 (or (= lt!257305 (MissingZero!5470 i!1132)) (= lt!257305 (MissingVacant!5470 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35446 (_ BitVec 32)) SeekEntryResult!5470)

(assert (=> b!564198 (= lt!257305 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564199 () Bool)

(declare-fun res!355496 () Bool)

(assert (=> b!564199 (=> (not res!355496) (not e!324956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35446 (_ BitVec 32)) Bool)

(assert (=> b!564199 (= res!355496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564200 () Bool)

(declare-fun res!355493 () Bool)

(assert (=> b!564200 (=> (not res!355493) (not e!324956))))

(declare-datatypes ((List!11143 0))(
  ( (Nil!11140) (Cons!11139 (h!12142 (_ BitVec 64)) (t!17362 List!11143)) )
))
(declare-fun arrayNoDuplicates!0 (array!35446 (_ BitVec 32) List!11143) Bool)

(assert (=> b!564200 (= res!355493 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11140))))

(declare-fun b!564201 () Bool)

(declare-fun res!355490 () Bool)

(assert (=> b!564201 (=> (not res!355490) (not e!324957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564201 (= res!355490 (validKeyInArray!0 (select (arr!17024 a!3118) j!142)))))

(declare-fun res!355491 () Bool)

(assert (=> start!51572 (=> (not res!355491) (not e!324957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51572 (= res!355491 (validMask!0 mask!3119))))

(assert (=> start!51572 e!324957))

(assert (=> start!51572 true))

(declare-fun array_inv!12907 (array!35446) Bool)

(assert (=> start!51572 (array_inv!12907 a!3118)))

(declare-fun b!564202 () Bool)

(declare-fun res!355492 () Bool)

(assert (=> b!564202 (=> (not res!355492) (not e!324957))))

(assert (=> b!564202 (= res!355492 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51572 res!355491) b!564196))

(assert (= (and b!564196 res!355494) b!564201))

(assert (= (and b!564201 res!355490) b!564202))

(assert (= (and b!564202 res!355492) b!564197))

(assert (= (and b!564197 res!355495) b!564198))

(assert (= (and b!564198 res!355489) b!564199))

(assert (= (and b!564199 res!355496) b!564200))

(assert (= (and b!564200 res!355493) b!564195))

(declare-fun m!542117 () Bool)

(assert (=> start!51572 m!542117))

(declare-fun m!542119 () Bool)

(assert (=> start!51572 m!542119))

(declare-fun m!542121 () Bool)

(assert (=> b!564198 m!542121))

(declare-fun m!542123 () Bool)

(assert (=> b!564202 m!542123))

(declare-fun m!542125 () Bool)

(assert (=> b!564195 m!542125))

(declare-fun m!542127 () Bool)

(assert (=> b!564195 m!542127))

(assert (=> b!564195 m!542127))

(declare-fun m!542129 () Bool)

(assert (=> b!564195 m!542129))

(declare-fun m!542131 () Bool)

(assert (=> b!564200 m!542131))

(declare-fun m!542133 () Bool)

(assert (=> b!564201 m!542133))

(assert (=> b!564201 m!542133))

(declare-fun m!542135 () Bool)

(assert (=> b!564201 m!542135))

(declare-fun m!542137 () Bool)

(assert (=> b!564197 m!542137))

(declare-fun m!542139 () Bool)

(assert (=> b!564199 m!542139))

(check-sat (not b!564195) (not b!564199) (not b!564200) (not b!564201) (not b!564198) (not start!51572) (not b!564197) (not b!564202))
(check-sat)
