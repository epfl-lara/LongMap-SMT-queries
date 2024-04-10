; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52150 () Bool)

(assert start!52150)

(declare-fun b!569184 () Bool)

(declare-fun res!359205 () Bool)

(declare-fun e!327468 () Bool)

(assert (=> b!569184 (=> (not res!359205) (not e!327468))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569184 (= res!359205 (validKeyInArray!0 k0!1914))))

(declare-fun b!569185 () Bool)

(declare-fun res!359209 () Bool)

(declare-fun e!327466 () Bool)

(assert (=> b!569185 (=> (not res!359209) (not e!327466))))

(declare-datatypes ((array!35673 0))(
  ( (array!35674 (arr!17128 (Array (_ BitVec 32) (_ BitVec 64))) (size!17492 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35673)

(declare-datatypes ((List!11208 0))(
  ( (Nil!11205) (Cons!11204 (h!12225 (_ BitVec 64)) (t!17436 List!11208)) )
))
(declare-fun arrayNoDuplicates!0 (array!35673 (_ BitVec 32) List!11208) Bool)

(assert (=> b!569185 (= res!359209 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11205))))

(declare-fun res!359208 () Bool)

(assert (=> start!52150 (=> (not res!359208) (not e!327468))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52150 (= res!359208 (validMask!0 mask!3119))))

(assert (=> start!52150 e!327468))

(assert (=> start!52150 true))

(declare-fun array_inv!12924 (array!35673) Bool)

(assert (=> start!52150 (array_inv!12924 a!3118)))

(declare-fun e!327467 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5577 0))(
  ( (MissingZero!5577 (index!24535 (_ BitVec 32))) (Found!5577 (index!24536 (_ BitVec 32))) (Intermediate!5577 (undefined!6389 Bool) (index!24537 (_ BitVec 32)) (x!53412 (_ BitVec 32))) (Undefined!5577) (MissingVacant!5577 (index!24538 (_ BitVec 32))) )
))
(declare-fun lt!259374 () SeekEntryResult!5577)

(declare-fun b!569186 () Bool)

(get-info :version)

(assert (=> b!569186 (= e!327467 (not (or (undefined!6389 lt!259374) (not ((_ is Intermediate!5577) lt!259374)) (= (select (arr!17128 a!3118) (index!24537 lt!259374)) (select (arr!17128 a!3118) j!142)) (not (= (select (arr!17128 a!3118) (index!24537 lt!259374)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!17492 a!3118)) (bvsle j!142 (size!17492 a!3118)))))))

(declare-fun lt!259373 () SeekEntryResult!5577)

(assert (=> b!569186 (and (= lt!259373 (Found!5577 j!142)) (or (undefined!6389 lt!259374) (not ((_ is Intermediate!5577) lt!259374)) (= (select (arr!17128 a!3118) (index!24537 lt!259374)) (select (arr!17128 a!3118) j!142)) (not (= (select (arr!17128 a!3118) (index!24537 lt!259374)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259373 (MissingZero!5577 (index!24537 lt!259374)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35673 (_ BitVec 32)) SeekEntryResult!5577)

(assert (=> b!569186 (= lt!259373 (seekEntryOrOpen!0 (select (arr!17128 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35673 (_ BitVec 32)) Bool)

(assert (=> b!569186 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17856 0))(
  ( (Unit!17857) )
))
(declare-fun lt!259377 () Unit!17856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17856)

(assert (=> b!569186 (= lt!259377 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569187 () Bool)

(assert (=> b!569187 (= e!327466 e!327467)))

(declare-fun res!359206 () Bool)

(assert (=> b!569187 (=> (not res!359206) (not e!327467))))

(declare-fun lt!259375 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35673 (_ BitVec 32)) SeekEntryResult!5577)

(assert (=> b!569187 (= res!359206 (= lt!259374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259375 (select (store (arr!17128 a!3118) i!1132 k0!1914) j!142) (array!35674 (store (arr!17128 a!3118) i!1132 k0!1914) (size!17492 a!3118)) mask!3119)))))

(declare-fun lt!259376 () (_ BitVec 32))

(assert (=> b!569187 (= lt!259374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259376 (select (arr!17128 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569187 (= lt!259375 (toIndex!0 (select (store (arr!17128 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!569187 (= lt!259376 (toIndex!0 (select (arr!17128 a!3118) j!142) mask!3119))))

(declare-fun b!569188 () Bool)

(declare-fun res!359207 () Bool)

(assert (=> b!569188 (=> (not res!359207) (not e!327468))))

(declare-fun arrayContainsKey!0 (array!35673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569188 (= res!359207 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569189 () Bool)

(declare-fun res!359210 () Bool)

(assert (=> b!569189 (=> (not res!359210) (not e!327468))))

(assert (=> b!569189 (= res!359210 (and (= (size!17492 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17492 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17492 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569190 () Bool)

(assert (=> b!569190 (= e!327468 e!327466)))

(declare-fun res!359203 () Bool)

(assert (=> b!569190 (=> (not res!359203) (not e!327466))))

(declare-fun lt!259378 () SeekEntryResult!5577)

(assert (=> b!569190 (= res!359203 (or (= lt!259378 (MissingZero!5577 i!1132)) (= lt!259378 (MissingVacant!5577 i!1132))))))

(assert (=> b!569190 (= lt!259378 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!569191 () Bool)

(declare-fun res!359202 () Bool)

(assert (=> b!569191 (=> (not res!359202) (not e!327468))))

(assert (=> b!569191 (= res!359202 (validKeyInArray!0 (select (arr!17128 a!3118) j!142)))))

(declare-fun b!569192 () Bool)

(declare-fun res!359204 () Bool)

(assert (=> b!569192 (=> (not res!359204) (not e!327466))))

(assert (=> b!569192 (= res!359204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52150 res!359208) b!569189))

(assert (= (and b!569189 res!359210) b!569191))

(assert (= (and b!569191 res!359202) b!569184))

(assert (= (and b!569184 res!359205) b!569188))

(assert (= (and b!569188 res!359207) b!569190))

(assert (= (and b!569190 res!359203) b!569192))

(assert (= (and b!569192 res!359204) b!569185))

(assert (= (and b!569185 res!359209) b!569187))

(assert (= (and b!569187 res!359206) b!569186))

(declare-fun m!547811 () Bool)

(assert (=> b!569188 m!547811))

(declare-fun m!547813 () Bool)

(assert (=> b!569191 m!547813))

(assert (=> b!569191 m!547813))

(declare-fun m!547815 () Bool)

(assert (=> b!569191 m!547815))

(declare-fun m!547817 () Bool)

(assert (=> b!569192 m!547817))

(assert (=> b!569186 m!547813))

(declare-fun m!547819 () Bool)

(assert (=> b!569186 m!547819))

(declare-fun m!547821 () Bool)

(assert (=> b!569186 m!547821))

(declare-fun m!547823 () Bool)

(assert (=> b!569186 m!547823))

(assert (=> b!569186 m!547813))

(declare-fun m!547825 () Bool)

(assert (=> b!569186 m!547825))

(declare-fun m!547827 () Bool)

(assert (=> b!569185 m!547827))

(declare-fun m!547829 () Bool)

(assert (=> b!569190 m!547829))

(declare-fun m!547831 () Bool)

(assert (=> b!569184 m!547831))

(declare-fun m!547833 () Bool)

(assert (=> start!52150 m!547833))

(declare-fun m!547835 () Bool)

(assert (=> start!52150 m!547835))

(assert (=> b!569187 m!547813))

(declare-fun m!547837 () Bool)

(assert (=> b!569187 m!547837))

(assert (=> b!569187 m!547813))

(declare-fun m!547839 () Bool)

(assert (=> b!569187 m!547839))

(assert (=> b!569187 m!547813))

(declare-fun m!547841 () Bool)

(assert (=> b!569187 m!547841))

(assert (=> b!569187 m!547841))

(declare-fun m!547843 () Bool)

(assert (=> b!569187 m!547843))

(declare-fun m!547845 () Bool)

(assert (=> b!569187 m!547845))

(assert (=> b!569187 m!547841))

(declare-fun m!547847 () Bool)

(assert (=> b!569187 m!547847))

(check-sat (not b!569184) (not b!569192) (not b!569188) (not b!569190) (not b!569185) (not start!52150) (not b!569191) (not b!569186) (not b!569187))
(check-sat)
