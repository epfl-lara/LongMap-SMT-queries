; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51736 () Bool)

(assert start!51736)

(declare-fun b!566033 () Bool)

(declare-fun res!357005 () Bool)

(declare-fun e!325799 () Bool)

(assert (=> b!566033 (=> (not res!357005) (not e!325799))))

(declare-datatypes ((array!35544 0))(
  ( (array!35545 (arr!17071 (Array (_ BitVec 32) (_ BitVec 64))) (size!17435 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35544)

(declare-datatypes ((List!11151 0))(
  ( (Nil!11148) (Cons!11147 (h!12153 (_ BitVec 64)) (t!17379 List!11151)) )
))
(declare-fun arrayNoDuplicates!0 (array!35544 (_ BitVec 32) List!11151) Bool)

(assert (=> b!566033 (= res!357005 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11148))))

(declare-fun res!357007 () Bool)

(declare-fun e!325800 () Bool)

(assert (=> start!51736 (=> (not res!357007) (not e!325800))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51736 (= res!357007 (validMask!0 mask!3119))))

(assert (=> start!51736 e!325800))

(assert (=> start!51736 true))

(declare-fun array_inv!12867 (array!35544) Bool)

(assert (=> start!51736 (array_inv!12867 a!3118)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!325798 () Bool)

(declare-fun b!566034 () Bool)

(declare-datatypes ((SeekEntryResult!5520 0))(
  ( (MissingZero!5520 (index!24307 (_ BitVec 32))) (Found!5520 (index!24308 (_ BitVec 32))) (Intermediate!5520 (undefined!6332 Bool) (index!24309 (_ BitVec 32)) (x!53173 (_ BitVec 32))) (Undefined!5520) (MissingVacant!5520 (index!24310 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35544 (_ BitVec 32)) SeekEntryResult!5520)

(assert (=> b!566034 (= e!325798 (= (seekEntryOrOpen!0 (select (arr!17071 a!3118) j!142) a!3118 mask!3119) (Found!5520 j!142)))))

(declare-fun b!566035 () Bool)

(assert (=> b!566035 (= e!325799 (not true))))

(assert (=> b!566035 e!325798))

(declare-fun res!357003 () Bool)

(assert (=> b!566035 (=> (not res!357003) (not e!325798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35544 (_ BitVec 32)) Bool)

(assert (=> b!566035 (= res!357003 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17742 0))(
  ( (Unit!17743) )
))
(declare-fun lt!258006 () Unit!17742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17742)

(assert (=> b!566035 (= lt!258006 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566036 () Bool)

(declare-fun res!357008 () Bool)

(assert (=> b!566036 (=> (not res!357008) (not e!325800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566036 (= res!357008 (validKeyInArray!0 (select (arr!17071 a!3118) j!142)))))

(declare-fun b!566037 () Bool)

(declare-fun res!357011 () Bool)

(assert (=> b!566037 (=> (not res!357011) (not e!325800))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566037 (= res!357011 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566038 () Bool)

(declare-fun res!357006 () Bool)

(assert (=> b!566038 (=> (not res!357006) (not e!325799))))

(assert (=> b!566038 (= res!357006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566039 () Bool)

(declare-fun res!357004 () Bool)

(assert (=> b!566039 (=> (not res!357004) (not e!325800))))

(assert (=> b!566039 (= res!357004 (validKeyInArray!0 k0!1914))))

(declare-fun b!566040 () Bool)

(assert (=> b!566040 (= e!325800 e!325799)))

(declare-fun res!357002 () Bool)

(assert (=> b!566040 (=> (not res!357002) (not e!325799))))

(declare-fun lt!258007 () SeekEntryResult!5520)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566040 (= res!357002 (or (= lt!258007 (MissingZero!5520 i!1132)) (= lt!258007 (MissingVacant!5520 i!1132))))))

(assert (=> b!566040 (= lt!258007 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566041 () Bool)

(declare-fun res!357010 () Bool)

(assert (=> b!566041 (=> (not res!357010) (not e!325800))))

(assert (=> b!566041 (= res!357010 (and (= (size!17435 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17435 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17435 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566042 () Bool)

(declare-fun res!357009 () Bool)

(assert (=> b!566042 (=> (not res!357009) (not e!325799))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35544 (_ BitVec 32)) SeekEntryResult!5520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566042 (= res!357009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17071 a!3118) j!142) mask!3119) (select (arr!17071 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17071 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17071 a!3118) i!1132 k0!1914) j!142) (array!35545 (store (arr!17071 a!3118) i!1132 k0!1914) (size!17435 a!3118)) mask!3119)))))

(assert (= (and start!51736 res!357007) b!566041))

(assert (= (and b!566041 res!357010) b!566036))

(assert (= (and b!566036 res!357008) b!566039))

(assert (= (and b!566039 res!357004) b!566037))

(assert (= (and b!566037 res!357011) b!566040))

(assert (= (and b!566040 res!357002) b!566038))

(assert (= (and b!566038 res!357006) b!566033))

(assert (= (and b!566033 res!357005) b!566042))

(assert (= (and b!566042 res!357009) b!566035))

(assert (= (and b!566035 res!357003) b!566034))

(declare-fun m!544611 () Bool)

(assert (=> b!566033 m!544611))

(declare-fun m!544613 () Bool)

(assert (=> b!566034 m!544613))

(assert (=> b!566034 m!544613))

(declare-fun m!544615 () Bool)

(assert (=> b!566034 m!544615))

(declare-fun m!544617 () Bool)

(assert (=> b!566040 m!544617))

(declare-fun m!544619 () Bool)

(assert (=> b!566037 m!544619))

(declare-fun m!544621 () Bool)

(assert (=> b!566038 m!544621))

(declare-fun m!544623 () Bool)

(assert (=> b!566039 m!544623))

(assert (=> b!566036 m!544613))

(assert (=> b!566036 m!544613))

(declare-fun m!544625 () Bool)

(assert (=> b!566036 m!544625))

(declare-fun m!544627 () Bool)

(assert (=> start!51736 m!544627))

(declare-fun m!544629 () Bool)

(assert (=> start!51736 m!544629))

(declare-fun m!544631 () Bool)

(assert (=> b!566035 m!544631))

(declare-fun m!544633 () Bool)

(assert (=> b!566035 m!544633))

(assert (=> b!566042 m!544613))

(declare-fun m!544635 () Bool)

(assert (=> b!566042 m!544635))

(assert (=> b!566042 m!544613))

(declare-fun m!544637 () Bool)

(assert (=> b!566042 m!544637))

(declare-fun m!544639 () Bool)

(assert (=> b!566042 m!544639))

(assert (=> b!566042 m!544637))

(declare-fun m!544641 () Bool)

(assert (=> b!566042 m!544641))

(assert (=> b!566042 m!544635))

(assert (=> b!566042 m!544613))

(declare-fun m!544643 () Bool)

(assert (=> b!566042 m!544643))

(declare-fun m!544645 () Bool)

(assert (=> b!566042 m!544645))

(assert (=> b!566042 m!544637))

(assert (=> b!566042 m!544639))

(check-sat (not b!566037) (not start!51736) (not b!566040) (not b!566035) (not b!566039) (not b!566042) (not b!566034) (not b!566038) (not b!566033) (not b!566036))
(check-sat)
