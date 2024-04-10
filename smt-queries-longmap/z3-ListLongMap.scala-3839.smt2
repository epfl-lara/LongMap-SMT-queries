; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52786 () Bool)

(assert start!52786)

(declare-fun b!575625 () Bool)

(declare-fun res!364049 () Bool)

(declare-fun e!331212 () Bool)

(assert (=> b!575625 (=> (not res!364049) (not e!331212))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575625 (= res!364049 (validKeyInArray!0 k0!1914))))

(declare-fun b!575626 () Bool)

(declare-fun res!364047 () Bool)

(declare-fun e!331211 () Bool)

(assert (=> b!575626 (=> (not res!364047) (not e!331211))))

(declare-datatypes ((array!35931 0))(
  ( (array!35932 (arr!17248 (Array (_ BitVec 32) (_ BitVec 64))) (size!17612 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35931)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35931 (_ BitVec 32)) Bool)

(assert (=> b!575626 (= res!364047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575627 () Bool)

(declare-fun e!331207 () Bool)

(assert (=> b!575627 (= e!331211 e!331207)))

(declare-fun res!364042 () Bool)

(assert (=> b!575627 (=> (not res!364042) (not e!331207))))

(declare-fun lt!263249 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5697 0))(
  ( (MissingZero!5697 (index!25015 (_ BitVec 32))) (Found!5697 (index!25016 (_ BitVec 32))) (Intermediate!5697 (undefined!6509 Bool) (index!25017 (_ BitVec 32)) (x!53906 (_ BitVec 32))) (Undefined!5697) (MissingVacant!5697 (index!25018 (_ BitVec 32))) )
))
(declare-fun lt!263241 () SeekEntryResult!5697)

(declare-fun lt!263246 () array!35931)

(declare-fun lt!263250 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35931 (_ BitVec 32)) SeekEntryResult!5697)

(assert (=> b!575627 (= res!364042 (= lt!263241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263249 lt!263250 lt!263246 mask!3119)))))

(declare-fun lt!263243 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!575627 (= lt!263241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263243 (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575627 (= lt!263249 (toIndex!0 lt!263250 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575627 (= lt!263250 (select (store (arr!17248 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575627 (= lt!263243 (toIndex!0 (select (arr!17248 a!3118) j!142) mask!3119))))

(assert (=> b!575627 (= lt!263246 (array!35932 (store (arr!17248 a!3118) i!1132 k0!1914) (size!17612 a!3118)))))

(declare-fun b!575628 () Bool)

(declare-fun e!331210 () Bool)

(assert (=> b!575628 (= e!331207 (not e!331210))))

(declare-fun res!364041 () Bool)

(assert (=> b!575628 (=> res!364041 e!331210)))

(get-info :version)

(assert (=> b!575628 (= res!364041 (or (undefined!6509 lt!263241) (not ((_ is Intermediate!5697) lt!263241))))))

(declare-fun lt!263254 () SeekEntryResult!5697)

(declare-fun lt!263245 () SeekEntryResult!5697)

(assert (=> b!575628 (= lt!263254 lt!263245)))

(assert (=> b!575628 (= lt!263245 (Found!5697 j!142))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35931 (_ BitVec 32)) SeekEntryResult!5697)

(assert (=> b!575628 (= lt!263254 (seekEntryOrOpen!0 (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575628 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18096 0))(
  ( (Unit!18097) )
))
(declare-fun lt!263251 () Unit!18096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18096)

(assert (=> b!575628 (= lt!263251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!364046 () Bool)

(assert (=> start!52786 (=> (not res!364046) (not e!331212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52786 (= res!364046 (validMask!0 mask!3119))))

(assert (=> start!52786 e!331212))

(assert (=> start!52786 true))

(declare-fun array_inv!13044 (array!35931) Bool)

(assert (=> start!52786 (array_inv!13044 a!3118)))

(declare-fun b!575629 () Bool)

(declare-fun res!364050 () Bool)

(assert (=> b!575629 (=> (not res!364050) (not e!331212))))

(assert (=> b!575629 (= res!364050 (and (= (size!17612 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17612 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17612 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575630 () Bool)

(declare-fun e!331206 () Bool)

(declare-fun e!331209 () Bool)

(assert (=> b!575630 (= e!331206 e!331209)))

(declare-fun res!364051 () Bool)

(assert (=> b!575630 (=> res!364051 e!331209)))

(declare-fun lt!263252 () SeekEntryResult!5697)

(declare-fun lt!263242 () (_ BitVec 64))

(assert (=> b!575630 (= res!364051 (or (bvslt (index!25017 lt!263241) #b00000000000000000000000000000000) (bvsge (index!25017 lt!263241) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53906 lt!263241) #b01111111111111111111111111111110) (bvslt (x!53906 lt!263241) #b00000000000000000000000000000000) (not (= lt!263242 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17248 a!3118) i!1132 k0!1914) (index!25017 lt!263241)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!263252 lt!263245))))))

(declare-fun lt!263253 () SeekEntryResult!5697)

(declare-fun lt!263244 () SeekEntryResult!5697)

(assert (=> b!575630 (= lt!263253 lt!263244)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35931 (_ BitVec 32)) SeekEntryResult!5697)

(assert (=> b!575630 (= lt!263244 (seekKeyOrZeroReturnVacant!0 (x!53906 lt!263241) (index!25017 lt!263241) (index!25017 lt!263241) lt!263250 lt!263246 mask!3119))))

(assert (=> b!575630 (= lt!263253 (seekEntryOrOpen!0 lt!263250 lt!263246 mask!3119))))

(assert (=> b!575630 (= lt!263254 lt!263252)))

(assert (=> b!575630 (= lt!263252 (seekKeyOrZeroReturnVacant!0 (x!53906 lt!263241) (index!25017 lt!263241) (index!25017 lt!263241) (select (arr!17248 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575631 () Bool)

(assert (=> b!575631 (= e!331209 true)))

(assert (=> b!575631 (= lt!263252 lt!263244)))

(declare-fun lt!263248 () Unit!18096)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35931 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18096)

(assert (=> b!575631 (= lt!263248 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!53906 lt!263241) (index!25017 lt!263241) (index!25017 lt!263241) mask!3119))))

(declare-fun b!575632 () Bool)

(declare-fun res!364043 () Bool)

(assert (=> b!575632 (=> (not res!364043) (not e!331212))))

(declare-fun arrayContainsKey!0 (array!35931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575632 (= res!364043 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575633 () Bool)

(declare-fun res!364044 () Bool)

(assert (=> b!575633 (=> (not res!364044) (not e!331211))))

(declare-datatypes ((List!11328 0))(
  ( (Nil!11325) (Cons!11324 (h!12363 (_ BitVec 64)) (t!17556 List!11328)) )
))
(declare-fun arrayNoDuplicates!0 (array!35931 (_ BitVec 32) List!11328) Bool)

(assert (=> b!575633 (= res!364044 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11325))))

(declare-fun b!575634 () Bool)

(assert (=> b!575634 (= e!331210 e!331206)))

(declare-fun res!364045 () Bool)

(assert (=> b!575634 (=> res!364045 e!331206)))

(assert (=> b!575634 (= res!364045 (or (= lt!263242 (select (arr!17248 a!3118) j!142)) (= lt!263242 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575634 (= lt!263242 (select (arr!17248 a!3118) (index!25017 lt!263241)))))

(declare-fun b!575635 () Bool)

(declare-fun res!364052 () Bool)

(assert (=> b!575635 (=> (not res!364052) (not e!331212))))

(assert (=> b!575635 (= res!364052 (validKeyInArray!0 (select (arr!17248 a!3118) j!142)))))

(declare-fun b!575636 () Bool)

(assert (=> b!575636 (= e!331212 e!331211)))

(declare-fun res!364048 () Bool)

(assert (=> b!575636 (=> (not res!364048) (not e!331211))))

(declare-fun lt!263247 () SeekEntryResult!5697)

(assert (=> b!575636 (= res!364048 (or (= lt!263247 (MissingZero!5697 i!1132)) (= lt!263247 (MissingVacant!5697 i!1132))))))

(assert (=> b!575636 (= lt!263247 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52786 res!364046) b!575629))

(assert (= (and b!575629 res!364050) b!575635))

(assert (= (and b!575635 res!364052) b!575625))

(assert (= (and b!575625 res!364049) b!575632))

(assert (= (and b!575632 res!364043) b!575636))

(assert (= (and b!575636 res!364048) b!575626))

(assert (= (and b!575626 res!364047) b!575633))

(assert (= (and b!575633 res!364044) b!575627))

(assert (= (and b!575627 res!364042) b!575628))

(assert (= (and b!575628 (not res!364041)) b!575634))

(assert (= (and b!575634 (not res!364045)) b!575630))

(assert (= (and b!575630 (not res!364051)) b!575631))

(declare-fun m!554541 () Bool)

(assert (=> b!575631 m!554541))

(declare-fun m!554543 () Bool)

(assert (=> b!575626 m!554543))

(declare-fun m!554545 () Bool)

(assert (=> b!575630 m!554545))

(declare-fun m!554547 () Bool)

(assert (=> b!575630 m!554547))

(assert (=> b!575630 m!554545))

(declare-fun m!554549 () Bool)

(assert (=> b!575630 m!554549))

(declare-fun m!554551 () Bool)

(assert (=> b!575630 m!554551))

(declare-fun m!554553 () Bool)

(assert (=> b!575630 m!554553))

(declare-fun m!554555 () Bool)

(assert (=> b!575630 m!554555))

(assert (=> b!575627 m!554545))

(declare-fun m!554557 () Bool)

(assert (=> b!575627 m!554557))

(declare-fun m!554559 () Bool)

(assert (=> b!575627 m!554559))

(assert (=> b!575627 m!554545))

(declare-fun m!554561 () Bool)

(assert (=> b!575627 m!554561))

(assert (=> b!575627 m!554545))

(declare-fun m!554563 () Bool)

(assert (=> b!575627 m!554563))

(declare-fun m!554565 () Bool)

(assert (=> b!575627 m!554565))

(assert (=> b!575627 m!554553))

(declare-fun m!554567 () Bool)

(assert (=> b!575625 m!554567))

(assert (=> b!575628 m!554545))

(assert (=> b!575628 m!554545))

(declare-fun m!554569 () Bool)

(assert (=> b!575628 m!554569))

(declare-fun m!554571 () Bool)

(assert (=> b!575628 m!554571))

(declare-fun m!554573 () Bool)

(assert (=> b!575628 m!554573))

(declare-fun m!554575 () Bool)

(assert (=> start!52786 m!554575))

(declare-fun m!554577 () Bool)

(assert (=> start!52786 m!554577))

(assert (=> b!575635 m!554545))

(assert (=> b!575635 m!554545))

(declare-fun m!554579 () Bool)

(assert (=> b!575635 m!554579))

(declare-fun m!554581 () Bool)

(assert (=> b!575633 m!554581))

(declare-fun m!554583 () Bool)

(assert (=> b!575632 m!554583))

(assert (=> b!575634 m!554545))

(declare-fun m!554585 () Bool)

(assert (=> b!575634 m!554585))

(declare-fun m!554587 () Bool)

(assert (=> b!575636 m!554587))

(check-sat (not b!575636) (not b!575628) (not b!575632) (not b!575631) (not start!52786) (not b!575630) (not b!575633) (not b!575627) (not b!575625) (not b!575635) (not b!575626))
(check-sat)
