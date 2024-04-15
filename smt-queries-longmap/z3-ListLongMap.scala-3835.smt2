; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52748 () Bool)

(assert start!52748)

(declare-fun b!574886 () Bool)

(declare-fun res!363452 () Bool)

(declare-fun e!330764 () Bool)

(assert (=> b!574886 (=> (not res!363452) (not e!330764))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574886 (= res!363452 (validKeyInArray!0 k0!1914))))

(declare-fun b!574887 () Bool)

(declare-fun e!330765 () Bool)

(assert (=> b!574887 (= e!330764 e!330765)))

(declare-fun res!363449 () Bool)

(assert (=> b!574887 (=> (not res!363449) (not e!330765))))

(declare-datatypes ((SeekEntryResult!5680 0))(
  ( (MissingZero!5680 (index!24947 (_ BitVec 32))) (Found!5680 (index!24948 (_ BitVec 32))) (Intermediate!5680 (undefined!6492 Bool) (index!24949 (_ BitVec 32)) (x!53852 (_ BitVec 32))) (Undefined!5680) (MissingVacant!5680 (index!24950 (_ BitVec 32))) )
))
(declare-fun lt!262486 () SeekEntryResult!5680)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574887 (= res!363449 (or (= lt!262486 (MissingZero!5680 i!1132)) (= lt!262486 (MissingVacant!5680 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35902 0))(
  ( (array!35903 (arr!17234 (Array (_ BitVec 32) (_ BitVec 64))) (size!17599 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35902)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35902 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574887 (= lt!262486 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!363453 () Bool)

(assert (=> start!52748 (=> (not res!363453) (not e!330764))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52748 (= res!363453 (validMask!0 mask!3119))))

(assert (=> start!52748 e!330764))

(assert (=> start!52748 true))

(declare-fun array_inv!13117 (array!35902) Bool)

(assert (=> start!52748 (array_inv!13117 a!3118)))

(declare-fun b!574888 () Bool)

(declare-fun res!363445 () Bool)

(assert (=> b!574888 (=> (not res!363445) (not e!330764))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!574888 (= res!363445 (validKeyInArray!0 (select (arr!17234 a!3118) j!142)))))

(declare-fun b!574889 () Bool)

(declare-fun res!363444 () Bool)

(assert (=> b!574889 (=> (not res!363444) (not e!330764))))

(declare-fun arrayContainsKey!0 (array!35902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574889 (= res!363444 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!330761 () Bool)

(declare-fun lt!262492 () array!35902)

(declare-fun b!574890 () Bool)

(declare-fun lt!262485 () SeekEntryResult!5680)

(declare-fun lt!262491 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35902 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574890 (= e!330761 (= (seekEntryOrOpen!0 lt!262491 lt!262492 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53852 lt!262485) (index!24949 lt!262485) (index!24949 lt!262485) lt!262491 lt!262492 mask!3119)))))

(declare-fun lt!262484 () SeekEntryResult!5680)

(declare-fun b!574891 () Bool)

(declare-fun lt!262489 () (_ BitVec 64))

(declare-fun e!330760 () Bool)

(declare-fun lt!262482 () SeekEntryResult!5680)

(assert (=> b!574891 (= e!330760 (or (bvslt (index!24949 lt!262485) #b00000000000000000000000000000000) (bvsge (index!24949 lt!262485) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53852 lt!262485) #b01111111111111111111111111111110) (bvslt (x!53852 lt!262485) #b00000000000000000000000000000000) (not (= lt!262489 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17234 a!3118) i!1132 k0!1914) (index!24949 lt!262485)) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!262484 lt!262482)))))

(assert (=> b!574891 e!330761))

(declare-fun res!363455 () Bool)

(assert (=> b!574891 (=> (not res!363455) (not e!330761))))

(declare-fun lt!262488 () SeekEntryResult!5680)

(assert (=> b!574891 (= res!363455 (= lt!262488 lt!262484))))

(assert (=> b!574891 (= lt!262484 (seekKeyOrZeroReturnVacant!0 (x!53852 lt!262485) (index!24949 lt!262485) (index!24949 lt!262485) (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574892 () Bool)

(declare-fun res!363451 () Bool)

(assert (=> b!574892 (=> (not res!363451) (not e!330765))))

(declare-datatypes ((List!11353 0))(
  ( (Nil!11350) (Cons!11349 (h!12388 (_ BitVec 64)) (t!17572 List!11353)) )
))
(declare-fun arrayNoDuplicates!0 (array!35902 (_ BitVec 32) List!11353) Bool)

(assert (=> b!574892 (= res!363451 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11350))))

(declare-fun b!574893 () Bool)

(declare-fun res!363450 () Bool)

(assert (=> b!574893 (=> (not res!363450) (not e!330765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35902 (_ BitVec 32)) Bool)

(assert (=> b!574893 (= res!363450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574894 () Bool)

(declare-fun e!330763 () Bool)

(declare-fun e!330759 () Bool)

(assert (=> b!574894 (= e!330763 (not e!330759))))

(declare-fun res!363454 () Bool)

(assert (=> b!574894 (=> res!363454 e!330759)))

(get-info :version)

(assert (=> b!574894 (= res!363454 (or (undefined!6492 lt!262485) (not ((_ is Intermediate!5680) lt!262485))))))

(assert (=> b!574894 (= lt!262488 lt!262482)))

(assert (=> b!574894 (= lt!262482 (Found!5680 j!142))))

(assert (=> b!574894 (= lt!262488 (seekEntryOrOpen!0 (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!574894 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18048 0))(
  ( (Unit!18049) )
))
(declare-fun lt!262487 () Unit!18048)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18048)

(assert (=> b!574894 (= lt!262487 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574895 () Bool)

(declare-fun res!363446 () Bool)

(assert (=> b!574895 (=> (not res!363446) (not e!330764))))

(assert (=> b!574895 (= res!363446 (and (= (size!17599 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17599 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17599 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!574896 () Bool)

(assert (=> b!574896 (= e!330759 e!330760)))

(declare-fun res!363447 () Bool)

(assert (=> b!574896 (=> res!363447 e!330760)))

(assert (=> b!574896 (= res!363447 (or (= lt!262489 (select (arr!17234 a!3118) j!142)) (= lt!262489 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574896 (= lt!262489 (select (arr!17234 a!3118) (index!24949 lt!262485)))))

(declare-fun b!574897 () Bool)

(assert (=> b!574897 (= e!330765 e!330763)))

(declare-fun res!363448 () Bool)

(assert (=> b!574897 (=> (not res!363448) (not e!330763))))

(declare-fun lt!262483 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35902 (_ BitVec 32)) SeekEntryResult!5680)

(assert (=> b!574897 (= res!363448 (= lt!262485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262483 lt!262491 lt!262492 mask!3119)))))

(declare-fun lt!262490 () (_ BitVec 32))

(assert (=> b!574897 (= lt!262485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262490 (select (arr!17234 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574897 (= lt!262483 (toIndex!0 lt!262491 mask!3119))))

(assert (=> b!574897 (= lt!262491 (select (store (arr!17234 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!574897 (= lt!262490 (toIndex!0 (select (arr!17234 a!3118) j!142) mask!3119))))

(assert (=> b!574897 (= lt!262492 (array!35903 (store (arr!17234 a!3118) i!1132 k0!1914) (size!17599 a!3118)))))

(assert (= (and start!52748 res!363453) b!574895))

(assert (= (and b!574895 res!363446) b!574888))

(assert (= (and b!574888 res!363445) b!574886))

(assert (= (and b!574886 res!363452) b!574889))

(assert (= (and b!574889 res!363444) b!574887))

(assert (= (and b!574887 res!363449) b!574893))

(assert (= (and b!574893 res!363450) b!574892))

(assert (= (and b!574892 res!363451) b!574897))

(assert (= (and b!574897 res!363448) b!574894))

(assert (= (and b!574894 (not res!363454)) b!574896))

(assert (= (and b!574896 (not res!363447)) b!574891))

(assert (= (and b!574891 res!363455) b!574890))

(declare-fun m!553151 () Bool)

(assert (=> b!574892 m!553151))

(declare-fun m!553153 () Bool)

(assert (=> b!574891 m!553153))

(declare-fun m!553155 () Bool)

(assert (=> b!574891 m!553155))

(declare-fun m!553157 () Bool)

(assert (=> b!574891 m!553157))

(assert (=> b!574891 m!553157))

(declare-fun m!553159 () Bool)

(assert (=> b!574891 m!553159))

(declare-fun m!553161 () Bool)

(assert (=> b!574886 m!553161))

(assert (=> b!574894 m!553157))

(assert (=> b!574894 m!553157))

(declare-fun m!553163 () Bool)

(assert (=> b!574894 m!553163))

(declare-fun m!553165 () Bool)

(assert (=> b!574894 m!553165))

(declare-fun m!553167 () Bool)

(assert (=> b!574894 m!553167))

(declare-fun m!553169 () Bool)

(assert (=> start!52748 m!553169))

(declare-fun m!553171 () Bool)

(assert (=> start!52748 m!553171))

(assert (=> b!574897 m!553157))

(declare-fun m!553173 () Bool)

(assert (=> b!574897 m!553173))

(declare-fun m!553175 () Bool)

(assert (=> b!574897 m!553175))

(assert (=> b!574897 m!553157))

(assert (=> b!574897 m!553157))

(declare-fun m!553177 () Bool)

(assert (=> b!574897 m!553177))

(assert (=> b!574897 m!553153))

(declare-fun m!553179 () Bool)

(assert (=> b!574897 m!553179))

(declare-fun m!553181 () Bool)

(assert (=> b!574897 m!553181))

(declare-fun m!553183 () Bool)

(assert (=> b!574890 m!553183))

(declare-fun m!553185 () Bool)

(assert (=> b!574890 m!553185))

(declare-fun m!553187 () Bool)

(assert (=> b!574893 m!553187))

(declare-fun m!553189 () Bool)

(assert (=> b!574887 m!553189))

(assert (=> b!574896 m!553157))

(declare-fun m!553191 () Bool)

(assert (=> b!574896 m!553191))

(declare-fun m!553193 () Bool)

(assert (=> b!574889 m!553193))

(assert (=> b!574888 m!553157))

(assert (=> b!574888 m!553157))

(declare-fun m!553195 () Bool)

(assert (=> b!574888 m!553195))

(check-sat (not b!574886) (not b!574890) (not b!574893) (not b!574897) (not start!52748) (not b!574888) (not b!574887) (not b!574891) (not b!574892) (not b!574894) (not b!574889))
(check-sat)
