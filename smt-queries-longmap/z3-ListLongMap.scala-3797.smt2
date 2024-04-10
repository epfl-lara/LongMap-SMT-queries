; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52138 () Bool)

(assert start!52138)

(declare-fun b!569022 () Bool)

(declare-fun res!359047 () Bool)

(declare-fun e!327394 () Bool)

(assert (=> b!569022 (=> (not res!359047) (not e!327394))))

(declare-datatypes ((array!35661 0))(
  ( (array!35662 (arr!17122 (Array (_ BitVec 32) (_ BitVec 64))) (size!17486 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35661)

(declare-datatypes ((List!11202 0))(
  ( (Nil!11199) (Cons!11198 (h!12219 (_ BitVec 64)) (t!17430 List!11202)) )
))
(declare-fun arrayNoDuplicates!0 (array!35661 (_ BitVec 32) List!11202) Bool)

(assert (=> b!569022 (= res!359047 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11199))))

(declare-fun b!569023 () Bool)

(declare-fun e!327395 () Bool)

(assert (=> b!569023 (= e!327395 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5571 0))(
  ( (MissingZero!5571 (index!24511 (_ BitVec 32))) (Found!5571 (index!24512 (_ BitVec 32))) (Intermediate!5571 (undefined!6383 Bool) (index!24513 (_ BitVec 32)) (x!53390 (_ BitVec 32))) (Undefined!5571) (MissingVacant!5571 (index!24514 (_ BitVec 32))) )
))
(declare-fun lt!259269 () SeekEntryResult!5571)

(declare-fun lt!259268 () SeekEntryResult!5571)

(get-info :version)

(assert (=> b!569023 (and (= lt!259269 (Found!5571 j!142)) (or (undefined!6383 lt!259268) (not ((_ is Intermediate!5571) lt!259268)) (= (select (arr!17122 a!3118) (index!24513 lt!259268)) (select (arr!17122 a!3118) j!142)) (not (= (select (arr!17122 a!3118) (index!24513 lt!259268)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259269 (MissingZero!5571 (index!24513 lt!259268)))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35661 (_ BitVec 32)) SeekEntryResult!5571)

(assert (=> b!569023 (= lt!259269 (seekEntryOrOpen!0 (select (arr!17122 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35661 (_ BitVec 32)) Bool)

(assert (=> b!569023 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17844 0))(
  ( (Unit!17845) )
))
(declare-fun lt!259265 () Unit!17844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17844)

(assert (=> b!569023 (= lt!259265 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569024 () Bool)

(declare-fun res!359045 () Bool)

(declare-fun e!327393 () Bool)

(assert (=> b!569024 (=> (not res!359045) (not e!327393))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569024 (= res!359045 (and (= (size!17486 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17486 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17486 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569026 () Bool)

(assert (=> b!569026 (= e!327393 e!327394)))

(declare-fun res!359048 () Bool)

(assert (=> b!569026 (=> (not res!359048) (not e!327394))))

(declare-fun lt!259266 () SeekEntryResult!5571)

(assert (=> b!569026 (= res!359048 (or (= lt!259266 (MissingZero!5571 i!1132)) (= lt!259266 (MissingVacant!5571 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!569026 (= lt!259266 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569027 () Bool)

(declare-fun res!359040 () Bool)

(assert (=> b!569027 (=> (not res!359040) (not e!327393))))

(declare-fun arrayContainsKey!0 (array!35661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569027 (= res!359040 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569028 () Bool)

(assert (=> b!569028 (= e!327394 e!327395)))

(declare-fun res!359044 () Bool)

(assert (=> b!569028 (=> (not res!359044) (not e!327395))))

(declare-fun lt!259270 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35661 (_ BitVec 32)) SeekEntryResult!5571)

(assert (=> b!569028 (= res!359044 (= lt!259268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259270 (select (store (arr!17122 a!3118) i!1132 k0!1914) j!142) (array!35662 (store (arr!17122 a!3118) i!1132 k0!1914) (size!17486 a!3118)) mask!3119)))))

(declare-fun lt!259267 () (_ BitVec 32))

(assert (=> b!569028 (= lt!259268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259267 (select (arr!17122 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569028 (= lt!259270 (toIndex!0 (select (store (arr!17122 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569028 (= lt!259267 (toIndex!0 (select (arr!17122 a!3118) j!142) mask!3119))))

(declare-fun b!569029 () Bool)

(declare-fun res!359046 () Bool)

(assert (=> b!569029 (=> (not res!359046) (not e!327393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569029 (= res!359046 (validKeyInArray!0 (select (arr!17122 a!3118) j!142)))))

(declare-fun b!569030 () Bool)

(declare-fun res!359043 () Bool)

(assert (=> b!569030 (=> (not res!359043) (not e!327393))))

(assert (=> b!569030 (= res!359043 (validKeyInArray!0 k0!1914))))

(declare-fun b!569025 () Bool)

(declare-fun res!359042 () Bool)

(assert (=> b!569025 (=> (not res!359042) (not e!327394))))

(assert (=> b!569025 (= res!359042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!359041 () Bool)

(assert (=> start!52138 (=> (not res!359041) (not e!327393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52138 (= res!359041 (validMask!0 mask!3119))))

(assert (=> start!52138 e!327393))

(assert (=> start!52138 true))

(declare-fun array_inv!12918 (array!35661) Bool)

(assert (=> start!52138 (array_inv!12918 a!3118)))

(assert (= (and start!52138 res!359041) b!569024))

(assert (= (and b!569024 res!359045) b!569029))

(assert (= (and b!569029 res!359046) b!569030))

(assert (= (and b!569030 res!359043) b!569027))

(assert (= (and b!569027 res!359040) b!569026))

(assert (= (and b!569026 res!359048) b!569025))

(assert (= (and b!569025 res!359042) b!569022))

(assert (= (and b!569022 res!359047) b!569028))

(assert (= (and b!569028 res!359044) b!569023))

(declare-fun m!547583 () Bool)

(assert (=> b!569022 m!547583))

(declare-fun m!547585 () Bool)

(assert (=> b!569023 m!547585))

(declare-fun m!547587 () Bool)

(assert (=> b!569023 m!547587))

(declare-fun m!547589 () Bool)

(assert (=> b!569023 m!547589))

(declare-fun m!547591 () Bool)

(assert (=> b!569023 m!547591))

(assert (=> b!569023 m!547585))

(declare-fun m!547593 () Bool)

(assert (=> b!569023 m!547593))

(declare-fun m!547595 () Bool)

(assert (=> b!569030 m!547595))

(assert (=> b!569029 m!547585))

(assert (=> b!569029 m!547585))

(declare-fun m!547597 () Bool)

(assert (=> b!569029 m!547597))

(assert (=> b!569028 m!547585))

(declare-fun m!547599 () Bool)

(assert (=> b!569028 m!547599))

(assert (=> b!569028 m!547585))

(declare-fun m!547601 () Bool)

(assert (=> b!569028 m!547601))

(assert (=> b!569028 m!547585))

(declare-fun m!547603 () Bool)

(assert (=> b!569028 m!547603))

(assert (=> b!569028 m!547601))

(declare-fun m!547605 () Bool)

(assert (=> b!569028 m!547605))

(declare-fun m!547607 () Bool)

(assert (=> b!569028 m!547607))

(assert (=> b!569028 m!547601))

(declare-fun m!547609 () Bool)

(assert (=> b!569028 m!547609))

(declare-fun m!547611 () Bool)

(assert (=> b!569025 m!547611))

(declare-fun m!547613 () Bool)

(assert (=> start!52138 m!547613))

(declare-fun m!547615 () Bool)

(assert (=> start!52138 m!547615))

(declare-fun m!547617 () Bool)

(assert (=> b!569027 m!547617))

(declare-fun m!547619 () Bool)

(assert (=> b!569026 m!547619))

(check-sat (not b!569025) (not b!569030) (not b!569023) (not b!569026) (not b!569022) (not b!569028) (not b!569027) (not start!52138) (not b!569029))
(check-sat)
