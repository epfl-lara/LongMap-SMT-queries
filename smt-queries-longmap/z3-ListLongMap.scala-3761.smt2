; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51606 () Bool)

(assert start!51606)

(declare-fun b!564394 () Bool)

(declare-fun res!355445 () Bool)

(declare-fun e!325150 () Bool)

(assert (=> b!564394 (=> (not res!355445) (not e!325150))))

(declare-datatypes ((array!35418 0))(
  ( (array!35419 (arr!17008 (Array (_ BitVec 32) (_ BitVec 64))) (size!17372 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35418)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35418 (_ BitVec 32)) Bool)

(assert (=> b!564394 (= res!355445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564395 () Bool)

(declare-fun e!325152 () Bool)

(assert (=> b!564395 (= e!325152 e!325150)))

(declare-fun res!355442 () Bool)

(assert (=> b!564395 (=> (not res!355442) (not e!325150))))

(declare-datatypes ((SeekEntryResult!5413 0))(
  ( (MissingZero!5413 (index!23879 (_ BitVec 32))) (Found!5413 (index!23880 (_ BitVec 32))) (Intermediate!5413 (undefined!6225 Bool) (index!23881 (_ BitVec 32)) (x!52911 (_ BitVec 32))) (Undefined!5413) (MissingVacant!5413 (index!23882 (_ BitVec 32))) )
))
(declare-fun lt!257578 () SeekEntryResult!5413)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564395 (= res!355442 (or (= lt!257578 (MissingZero!5413 i!1132)) (= lt!257578 (MissingVacant!5413 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35418 (_ BitVec 32)) SeekEntryResult!5413)

(assert (=> b!564395 (= lt!257578 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564396 () Bool)

(assert (=> b!564396 (= e!325150 false)))

(declare-fun lt!257577 () Bool)

(declare-datatypes ((List!10995 0))(
  ( (Nil!10992) (Cons!10991 (h!11997 (_ BitVec 64)) (t!17215 List!10995)) )
))
(declare-fun arrayNoDuplicates!0 (array!35418 (_ BitVec 32) List!10995) Bool)

(assert (=> b!564396 (= lt!257577 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10992))))

(declare-fun b!564398 () Bool)

(declare-fun res!355443 () Bool)

(assert (=> b!564398 (=> (not res!355443) (not e!325152))))

(declare-fun arrayContainsKey!0 (array!35418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564398 (= res!355443 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564399 () Bool)

(declare-fun res!355444 () Bool)

(assert (=> b!564399 (=> (not res!355444) (not e!325152))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564399 (= res!355444 (and (= (size!17372 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17372 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17372 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564400 () Bool)

(declare-fun res!355447 () Bool)

(assert (=> b!564400 (=> (not res!355447) (not e!325152))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564400 (= res!355447 (validKeyInArray!0 (select (arr!17008 a!3118) j!142)))))

(declare-fun b!564397 () Bool)

(declare-fun res!355446 () Bool)

(assert (=> b!564397 (=> (not res!355446) (not e!325152))))

(assert (=> b!564397 (= res!355446 (validKeyInArray!0 k0!1914))))

(declare-fun res!355441 () Bool)

(assert (=> start!51606 (=> (not res!355441) (not e!325152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51606 (= res!355441 (validMask!0 mask!3119))))

(assert (=> start!51606 e!325152))

(assert (=> start!51606 true))

(declare-fun array_inv!12867 (array!35418) Bool)

(assert (=> start!51606 (array_inv!12867 a!3118)))

(assert (= (and start!51606 res!355441) b!564399))

(assert (= (and b!564399 res!355444) b!564400))

(assert (= (and b!564400 res!355447) b!564397))

(assert (= (and b!564397 res!355446) b!564398))

(assert (= (and b!564398 res!355443) b!564395))

(assert (= (and b!564395 res!355442) b!564394))

(assert (= (and b!564394 res!355445) b!564396))

(declare-fun m!542987 () Bool)

(assert (=> b!564396 m!542987))

(declare-fun m!542989 () Bool)

(assert (=> b!564395 m!542989))

(declare-fun m!542991 () Bool)

(assert (=> start!51606 m!542991))

(declare-fun m!542993 () Bool)

(assert (=> start!51606 m!542993))

(declare-fun m!542995 () Bool)

(assert (=> b!564394 m!542995))

(declare-fun m!542997 () Bool)

(assert (=> b!564400 m!542997))

(assert (=> b!564400 m!542997))

(declare-fun m!542999 () Bool)

(assert (=> b!564400 m!542999))

(declare-fun m!543001 () Bool)

(assert (=> b!564398 m!543001))

(declare-fun m!543003 () Bool)

(assert (=> b!564397 m!543003))

(check-sat (not b!564394) (not b!564400) (not b!564396) (not start!51606) (not b!564395) (not b!564398) (not b!564397))
(check-sat)
