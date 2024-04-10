; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51346 () Bool)

(assert start!51346)

(declare-fun b!560438 () Bool)

(declare-fun e!322908 () Bool)

(assert (=> b!560438 (= e!322908 (not true))))

(declare-fun e!322910 () Bool)

(assert (=> b!560438 e!322910))

(declare-fun res!351596 () Bool)

(assert (=> b!560438 (=> (not res!351596) (not e!322910))))

(declare-datatypes ((SeekEntryResult!5355 0))(
  ( (MissingZero!5355 (index!23647 (_ BitVec 32))) (Found!5355 (index!23648 (_ BitVec 32))) (Intermediate!5355 (undefined!6167 Bool) (index!23649 (_ BitVec 32)) (x!52562 (_ BitVec 32))) (Undefined!5355) (MissingVacant!5355 (index!23650 (_ BitVec 32))) )
))
(declare-fun lt!254818 () SeekEntryResult!5355)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560438 (= res!351596 (= lt!254818 (Found!5355 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35211 0))(
  ( (array!35212 (arr!16906 (Array (_ BitVec 32) (_ BitVec 64))) (size!17270 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35211)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35211 (_ BitVec 32)) SeekEntryResult!5355)

(assert (=> b!560438 (= lt!254818 (seekEntryOrOpen!0 (select (arr!16906 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35211 (_ BitVec 32)) Bool)

(assert (=> b!560438 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17484 0))(
  ( (Unit!17485) )
))
(declare-fun lt!254819 () Unit!17484)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17484)

(assert (=> b!560438 (= lt!254819 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560439 () Bool)

(declare-fun res!351593 () Bool)

(declare-fun e!322911 () Bool)

(assert (=> b!560439 (=> (not res!351593) (not e!322911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560439 (= res!351593 (validKeyInArray!0 (select (arr!16906 a!3118) j!142)))))

(declare-fun b!560440 () Bool)

(declare-fun res!351591 () Bool)

(assert (=> b!560440 (=> (not res!351591) (not e!322911))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560440 (= res!351591 (and (= (size!17270 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17270 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17270 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560441 () Bool)

(declare-fun e!322905 () Bool)

(assert (=> b!560441 (= e!322905 e!322908)))

(declare-fun res!351595 () Bool)

(assert (=> b!560441 (=> (not res!351595) (not e!322908))))

(declare-fun lt!254824 () SeekEntryResult!5355)

(declare-fun lt!254816 () (_ BitVec 32))

(declare-fun lt!254817 () array!35211)

(declare-fun lt!254822 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35211 (_ BitVec 32)) SeekEntryResult!5355)

(assert (=> b!560441 (= res!351595 (= lt!254824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254816 lt!254822 lt!254817 mask!3119)))))

(declare-fun lt!254821 () (_ BitVec 32))

(assert (=> b!560441 (= lt!254824 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254821 (select (arr!16906 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560441 (= lt!254816 (toIndex!0 lt!254822 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!560441 (= lt!254822 (select (store (arr!16906 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560441 (= lt!254821 (toIndex!0 (select (arr!16906 a!3118) j!142) mask!3119))))

(assert (=> b!560441 (= lt!254817 (array!35212 (store (arr!16906 a!3118) i!1132 k0!1914) (size!17270 a!3118)))))

(declare-fun b!560443 () Bool)

(declare-fun res!351597 () Bool)

(assert (=> b!560443 (=> (not res!351597) (not e!322911))))

(declare-fun arrayContainsKey!0 (array!35211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560443 (= res!351597 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560444 () Bool)

(declare-fun res!351599 () Bool)

(assert (=> b!560444 (=> (not res!351599) (not e!322911))))

(assert (=> b!560444 (= res!351599 (validKeyInArray!0 k0!1914))))

(declare-fun b!560445 () Bool)

(declare-fun e!322907 () Bool)

(assert (=> b!560445 (= e!322910 e!322907)))

(declare-fun res!351598 () Bool)

(assert (=> b!560445 (=> res!351598 e!322907)))

(get-info :version)

(assert (=> b!560445 (= res!351598 (or (undefined!6167 lt!254824) (not ((_ is Intermediate!5355) lt!254824))))))

(declare-fun b!560446 () Bool)

(declare-fun e!322904 () Bool)

(declare-fun e!322906 () Bool)

(assert (=> b!560446 (= e!322904 e!322906)))

(declare-fun res!351600 () Bool)

(assert (=> b!560446 (=> (not res!351600) (not e!322906))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35211 (_ BitVec 32)) SeekEntryResult!5355)

(assert (=> b!560446 (= res!351600 (= lt!254818 (seekKeyOrZeroReturnVacant!0 (x!52562 lt!254824) (index!23649 lt!254824) (index!23649 lt!254824) (select (arr!16906 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560447 () Bool)

(declare-fun res!351592 () Bool)

(assert (=> b!560447 (=> (not res!351592) (not e!322905))))

(declare-datatypes ((List!10986 0))(
  ( (Nil!10983) (Cons!10982 (h!11985 (_ BitVec 64)) (t!17214 List!10986)) )
))
(declare-fun arrayNoDuplicates!0 (array!35211 (_ BitVec 32) List!10986) Bool)

(assert (=> b!560447 (= res!351592 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10983))))

(declare-fun b!560448 () Bool)

(assert (=> b!560448 (= e!322907 e!322904)))

(declare-fun res!351594 () Bool)

(assert (=> b!560448 (=> res!351594 e!322904)))

(declare-fun lt!254823 () (_ BitVec 64))

(assert (=> b!560448 (= res!351594 (or (= lt!254823 (select (arr!16906 a!3118) j!142)) (= lt!254823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560448 (= lt!254823 (select (arr!16906 a!3118) (index!23649 lt!254824)))))

(declare-fun b!560449 () Bool)

(declare-fun res!351602 () Bool)

(assert (=> b!560449 (=> (not res!351602) (not e!322905))))

(assert (=> b!560449 (= res!351602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560450 () Bool)

(assert (=> b!560450 (= e!322911 e!322905)))

(declare-fun res!351601 () Bool)

(assert (=> b!560450 (=> (not res!351601) (not e!322905))))

(declare-fun lt!254820 () SeekEntryResult!5355)

(assert (=> b!560450 (= res!351601 (or (= lt!254820 (MissingZero!5355 i!1132)) (= lt!254820 (MissingVacant!5355 i!1132))))))

(assert (=> b!560450 (= lt!254820 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!351590 () Bool)

(assert (=> start!51346 (=> (not res!351590) (not e!322911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51346 (= res!351590 (validMask!0 mask!3119))))

(assert (=> start!51346 e!322911))

(assert (=> start!51346 true))

(declare-fun array_inv!12702 (array!35211) Bool)

(assert (=> start!51346 (array_inv!12702 a!3118)))

(declare-fun b!560442 () Bool)

(assert (=> b!560442 (= e!322906 (= (seekEntryOrOpen!0 lt!254822 lt!254817 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52562 lt!254824) (index!23649 lt!254824) (index!23649 lt!254824) lt!254822 lt!254817 mask!3119)))))

(assert (= (and start!51346 res!351590) b!560440))

(assert (= (and b!560440 res!351591) b!560439))

(assert (= (and b!560439 res!351593) b!560444))

(assert (= (and b!560444 res!351599) b!560443))

(assert (= (and b!560443 res!351597) b!560450))

(assert (= (and b!560450 res!351601) b!560449))

(assert (= (and b!560449 res!351602) b!560447))

(assert (= (and b!560447 res!351592) b!560441))

(assert (= (and b!560441 res!351595) b!560438))

(assert (= (and b!560438 res!351596) b!560445))

(assert (= (and b!560445 (not res!351598)) b!560448))

(assert (= (and b!560448 (not res!351594)) b!560446))

(assert (= (and b!560446 res!351600) b!560442))

(declare-fun m!538205 () Bool)

(assert (=> b!560438 m!538205))

(assert (=> b!560438 m!538205))

(declare-fun m!538207 () Bool)

(assert (=> b!560438 m!538207))

(declare-fun m!538209 () Bool)

(assert (=> b!560438 m!538209))

(declare-fun m!538211 () Bool)

(assert (=> b!560438 m!538211))

(declare-fun m!538213 () Bool)

(assert (=> b!560447 m!538213))

(declare-fun m!538215 () Bool)

(assert (=> b!560443 m!538215))

(assert (=> b!560441 m!538205))

(declare-fun m!538217 () Bool)

(assert (=> b!560441 m!538217))

(declare-fun m!538219 () Bool)

(assert (=> b!560441 m!538219))

(declare-fun m!538221 () Bool)

(assert (=> b!560441 m!538221))

(assert (=> b!560441 m!538205))

(declare-fun m!538223 () Bool)

(assert (=> b!560441 m!538223))

(declare-fun m!538225 () Bool)

(assert (=> b!560441 m!538225))

(assert (=> b!560441 m!538205))

(declare-fun m!538227 () Bool)

(assert (=> b!560441 m!538227))

(declare-fun m!538229 () Bool)

(assert (=> b!560450 m!538229))

(declare-fun m!538231 () Bool)

(assert (=> start!51346 m!538231))

(declare-fun m!538233 () Bool)

(assert (=> start!51346 m!538233))

(declare-fun m!538235 () Bool)

(assert (=> b!560444 m!538235))

(declare-fun m!538237 () Bool)

(assert (=> b!560442 m!538237))

(declare-fun m!538239 () Bool)

(assert (=> b!560442 m!538239))

(assert (=> b!560446 m!538205))

(assert (=> b!560446 m!538205))

(declare-fun m!538241 () Bool)

(assert (=> b!560446 m!538241))

(declare-fun m!538243 () Bool)

(assert (=> b!560449 m!538243))

(assert (=> b!560448 m!538205))

(declare-fun m!538245 () Bool)

(assert (=> b!560448 m!538245))

(assert (=> b!560439 m!538205))

(assert (=> b!560439 m!538205))

(declare-fun m!538247 () Bool)

(assert (=> b!560439 m!538247))

(check-sat (not b!560447) (not b!560442) (not b!560441) (not b!560438) (not b!560450) (not start!51346) (not b!560446) (not b!560444) (not b!560443) (not b!560449) (not b!560439))
(check-sat)
