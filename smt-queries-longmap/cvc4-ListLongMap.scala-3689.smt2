; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50754 () Bool)

(assert start!50754)

(declare-fun b!555171 () Bool)

(declare-fun res!347583 () Bool)

(declare-fun e!320017 () Bool)

(assert (=> b!555171 (=> (not res!347583) (not e!320017))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34979 0))(
  ( (array!34980 (arr!16799 (Array (_ BitVec 32) (_ BitVec 64))) (size!17163 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34979)

(assert (=> b!555171 (= res!347583 (and (= (size!17163 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17163 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17163 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555172 () Bool)

(declare-fun res!347585 () Bool)

(assert (=> b!555172 (=> (not res!347585) (not e!320017))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555172 (= res!347585 (validKeyInArray!0 k!1914))))

(declare-fun b!555173 () Bool)

(declare-fun res!347586 () Bool)

(declare-fun e!320016 () Bool)

(assert (=> b!555173 (=> (not res!347586) (not e!320016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34979 (_ BitVec 32)) Bool)

(assert (=> b!555173 (= res!347586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555174 () Bool)

(declare-fun res!347588 () Bool)

(assert (=> b!555174 (=> (not res!347588) (not e!320017))))

(assert (=> b!555174 (= res!347588 (validKeyInArray!0 (select (arr!16799 a!3118) j!142)))))

(declare-fun b!555175 () Bool)

(assert (=> b!555175 (= e!320017 e!320016)))

(declare-fun res!347587 () Bool)

(assert (=> b!555175 (=> (not res!347587) (not e!320016))))

(declare-datatypes ((SeekEntryResult!5248 0))(
  ( (MissingZero!5248 (index!23219 (_ BitVec 32))) (Found!5248 (index!23220 (_ BitVec 32))) (Intermediate!5248 (undefined!6060 Bool) (index!23221 (_ BitVec 32)) (x!52122 (_ BitVec 32))) (Undefined!5248) (MissingVacant!5248 (index!23222 (_ BitVec 32))) )
))
(declare-fun lt!252237 () SeekEntryResult!5248)

(assert (=> b!555175 (= res!347587 (or (= lt!252237 (MissingZero!5248 i!1132)) (= lt!252237 (MissingVacant!5248 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34979 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!555175 (= lt!252237 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!347589 () Bool)

(assert (=> start!50754 (=> (not res!347589) (not e!320017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50754 (= res!347589 (validMask!0 mask!3119))))

(assert (=> start!50754 e!320017))

(assert (=> start!50754 true))

(declare-fun array_inv!12595 (array!34979) Bool)

(assert (=> start!50754 (array_inv!12595 a!3118)))

(declare-fun b!555176 () Bool)

(declare-fun res!347590 () Bool)

(assert (=> b!555176 (=> (not res!347590) (not e!320016))))

(declare-datatypes ((List!10879 0))(
  ( (Nil!10876) (Cons!10875 (h!11860 (_ BitVec 64)) (t!17107 List!10879)) )
))
(declare-fun arrayNoDuplicates!0 (array!34979 (_ BitVec 32) List!10879) Bool)

(assert (=> b!555176 (= res!347590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10876))))

(declare-fun b!555177 () Bool)

(declare-fun res!347591 () Bool)

(assert (=> b!555177 (=> (not res!347591) (not e!320017))))

(declare-fun arrayContainsKey!0 (array!34979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555177 (= res!347591 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555178 () Bool)

(declare-fun e!320018 () Bool)

(assert (=> b!555178 (= e!320018 (not true))))

(declare-fun lt!252240 () SeekEntryResult!5248)

(declare-fun lt!252236 () SeekEntryResult!5248)

(assert (=> b!555178 (and (= lt!252236 (Found!5248 j!142)) (or (undefined!6060 lt!252240) (not (is-Intermediate!5248 lt!252240)) (= (select (arr!16799 a!3118) (index!23221 lt!252240)) (select (arr!16799 a!3118) j!142)) (not (= (select (arr!16799 a!3118) (index!23221 lt!252240)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252236 (MissingZero!5248 (index!23221 lt!252240)))))))

(assert (=> b!555178 (= lt!252236 (seekEntryOrOpen!0 (select (arr!16799 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!555178 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17270 0))(
  ( (Unit!17271) )
))
(declare-fun lt!252238 () Unit!17270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17270)

(assert (=> b!555178 (= lt!252238 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555179 () Bool)

(assert (=> b!555179 (= e!320016 e!320018)))

(declare-fun res!347584 () Bool)

(assert (=> b!555179 (=> (not res!347584) (not e!320018))))

(declare-fun lt!252241 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34979 (_ BitVec 32)) SeekEntryResult!5248)

(assert (=> b!555179 (= res!347584 (= lt!252240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252241 (select (store (arr!16799 a!3118) i!1132 k!1914) j!142) (array!34980 (store (arr!16799 a!3118) i!1132 k!1914) (size!17163 a!3118)) mask!3119)))))

(declare-fun lt!252239 () (_ BitVec 32))

(assert (=> b!555179 (= lt!252240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252239 (select (arr!16799 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555179 (= lt!252241 (toIndex!0 (select (store (arr!16799 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!555179 (= lt!252239 (toIndex!0 (select (arr!16799 a!3118) j!142) mask!3119))))

(assert (= (and start!50754 res!347589) b!555171))

(assert (= (and b!555171 res!347583) b!555174))

(assert (= (and b!555174 res!347588) b!555172))

(assert (= (and b!555172 res!347585) b!555177))

(assert (= (and b!555177 res!347591) b!555175))

(assert (= (and b!555175 res!347587) b!555173))

(assert (= (and b!555173 res!347586) b!555176))

(assert (= (and b!555176 res!347590) b!555179))

(assert (= (and b!555179 res!347584) b!555178))

(declare-fun m!532747 () Bool)

(assert (=> b!555179 m!532747))

(declare-fun m!532749 () Bool)

(assert (=> b!555179 m!532749))

(declare-fun m!532751 () Bool)

(assert (=> b!555179 m!532751))

(declare-fun m!532753 () Bool)

(assert (=> b!555179 m!532753))

(assert (=> b!555179 m!532747))

(declare-fun m!532755 () Bool)

(assert (=> b!555179 m!532755))

(assert (=> b!555179 m!532747))

(assert (=> b!555179 m!532751))

(declare-fun m!532757 () Bool)

(assert (=> b!555179 m!532757))

(assert (=> b!555179 m!532751))

(declare-fun m!532759 () Bool)

(assert (=> b!555179 m!532759))

(declare-fun m!532761 () Bool)

(assert (=> start!50754 m!532761))

(declare-fun m!532763 () Bool)

(assert (=> start!50754 m!532763))

(assert (=> b!555174 m!532747))

(assert (=> b!555174 m!532747))

(declare-fun m!532765 () Bool)

(assert (=> b!555174 m!532765))

(assert (=> b!555178 m!532747))

(declare-fun m!532767 () Bool)

(assert (=> b!555178 m!532767))

(declare-fun m!532769 () Bool)

(assert (=> b!555178 m!532769))

(declare-fun m!532771 () Bool)

(assert (=> b!555178 m!532771))

(assert (=> b!555178 m!532747))

(declare-fun m!532773 () Bool)

(assert (=> b!555178 m!532773))

(declare-fun m!532775 () Bool)

(assert (=> b!555177 m!532775))

(declare-fun m!532777 () Bool)

(assert (=> b!555176 m!532777))

(declare-fun m!532779 () Bool)

(assert (=> b!555172 m!532779))

(declare-fun m!532781 () Bool)

(assert (=> b!555173 m!532781))

(declare-fun m!532783 () Bool)

(assert (=> b!555175 m!532783))

(push 1)

(assert (not b!555177))

(assert (not b!555178))

(assert (not b!555179))

(assert (not b!555175))

(assert (not b!555173))

(assert (not b!555172))

(assert (not b!555176))

(assert (not b!555174))

