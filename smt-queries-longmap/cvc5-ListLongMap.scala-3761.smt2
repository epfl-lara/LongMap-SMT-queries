; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51560 () Bool)

(assert start!51560)

(declare-fun b!564194 () Bool)

(declare-fun res!355346 () Bool)

(declare-fun e!325021 () Bool)

(assert (=> b!564194 (=> (not res!355346) (not e!325021))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35425 0))(
  ( (array!35426 (arr!17013 (Array (_ BitVec 32) (_ BitVec 64))) (size!17377 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35425)

(assert (=> b!564194 (= res!355346 (and (= (size!17377 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17377 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17377 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!355349 () Bool)

(assert (=> start!51560 (=> (not res!355349) (not e!325021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51560 (= res!355349 (validMask!0 mask!3119))))

(assert (=> start!51560 e!325021))

(assert (=> start!51560 true))

(declare-fun array_inv!12809 (array!35425) Bool)

(assert (=> start!51560 (array_inv!12809 a!3118)))

(declare-fun b!564195 () Bool)

(declare-fun res!355352 () Bool)

(declare-fun e!325022 () Bool)

(assert (=> b!564195 (=> (not res!355352) (not e!325022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35425 (_ BitVec 32)) Bool)

(assert (=> b!564195 (= res!355352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564196 () Bool)

(declare-fun res!355350 () Bool)

(assert (=> b!564196 (=> (not res!355350) (not e!325021))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564196 (= res!355350 (validKeyInArray!0 k!1914))))

(declare-fun b!564197 () Bool)

(declare-fun res!355351 () Bool)

(assert (=> b!564197 (=> (not res!355351) (not e!325021))))

(declare-fun arrayContainsKey!0 (array!35425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564197 (= res!355351 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564198 () Bool)

(assert (=> b!564198 (= e!325022 false)))

(declare-fun lt!257466 () Bool)

(declare-datatypes ((List!11093 0))(
  ( (Nil!11090) (Cons!11089 (h!12092 (_ BitVec 64)) (t!17321 List!11093)) )
))
(declare-fun arrayNoDuplicates!0 (array!35425 (_ BitVec 32) List!11093) Bool)

(assert (=> b!564198 (= lt!257466 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11090))))

(declare-fun b!564199 () Bool)

(assert (=> b!564199 (= e!325021 e!325022)))

(declare-fun res!355347 () Bool)

(assert (=> b!564199 (=> (not res!355347) (not e!325022))))

(declare-datatypes ((SeekEntryResult!5462 0))(
  ( (MissingZero!5462 (index!24075 (_ BitVec 32))) (Found!5462 (index!24076 (_ BitVec 32))) (Intermediate!5462 (undefined!6274 Bool) (index!24077 (_ BitVec 32)) (x!52957 (_ BitVec 32))) (Undefined!5462) (MissingVacant!5462 (index!24078 (_ BitVec 32))) )
))
(declare-fun lt!257467 () SeekEntryResult!5462)

(assert (=> b!564199 (= res!355347 (or (= lt!257467 (MissingZero!5462 i!1132)) (= lt!257467 (MissingVacant!5462 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35425 (_ BitVec 32)) SeekEntryResult!5462)

(assert (=> b!564199 (= lt!257467 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564200 () Bool)

(declare-fun res!355348 () Bool)

(assert (=> b!564200 (=> (not res!355348) (not e!325021))))

(assert (=> b!564200 (= res!355348 (validKeyInArray!0 (select (arr!17013 a!3118) j!142)))))

(assert (= (and start!51560 res!355349) b!564194))

(assert (= (and b!564194 res!355346) b!564200))

(assert (= (and b!564200 res!355348) b!564196))

(assert (= (and b!564196 res!355350) b!564197))

(assert (= (and b!564197 res!355351) b!564199))

(assert (= (and b!564199 res!355347) b!564195))

(assert (= (and b!564195 res!355352) b!564198))

(declare-fun m!542649 () Bool)

(assert (=> b!564199 m!542649))

(declare-fun m!542651 () Bool)

(assert (=> start!51560 m!542651))

(declare-fun m!542653 () Bool)

(assert (=> start!51560 m!542653))

(declare-fun m!542655 () Bool)

(assert (=> b!564200 m!542655))

(assert (=> b!564200 m!542655))

(declare-fun m!542657 () Bool)

(assert (=> b!564200 m!542657))

(declare-fun m!542659 () Bool)

(assert (=> b!564195 m!542659))

(declare-fun m!542661 () Bool)

(assert (=> b!564198 m!542661))

(declare-fun m!542663 () Bool)

(assert (=> b!564197 m!542663))

(declare-fun m!542665 () Bool)

(assert (=> b!564196 m!542665))

(push 1)

