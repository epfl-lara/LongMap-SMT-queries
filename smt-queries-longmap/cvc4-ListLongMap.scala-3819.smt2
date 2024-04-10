; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52404 () Bool)

(assert start!52404)

(declare-fun b!571841 () Bool)

(declare-fun e!328912 () Bool)

(declare-fun e!328909 () Bool)

(assert (=> b!571841 (= e!328912 e!328909)))

(declare-fun res!361361 () Bool)

(assert (=> b!571841 (=> (not res!361361) (not e!328909))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5638 0))(
  ( (MissingZero!5638 (index!24779 (_ BitVec 32))) (Found!5638 (index!24780 (_ BitVec 32))) (Intermediate!5638 (undefined!6450 Bool) (index!24781 (_ BitVec 32)) (x!53651 (_ BitVec 32))) (Undefined!5638) (MissingVacant!5638 (index!24782 (_ BitVec 32))) )
))
(declare-fun lt!260827 () SeekEntryResult!5638)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260824 () SeekEntryResult!5638)

(declare-datatypes ((array!35801 0))(
  ( (array!35802 (arr!17189 (Array (_ BitVec 32) (_ BitVec 64))) (size!17553 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35801)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35801 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!571841 (= res!361361 (= lt!260824 (seekKeyOrZeroReturnVacant!0 (x!53651 lt!260827) (index!24781 lt!260827) (index!24781 lt!260827) (select (arr!17189 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571842 () Bool)

(declare-fun lt!260830 () (_ BitVec 64))

(declare-fun lt!260828 () array!35801)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35801 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!571842 (= e!328909 (= (seekEntryOrOpen!0 lt!260830 lt!260828 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53651 lt!260827) (index!24781 lt!260827) (index!24781 lt!260827) lt!260830 lt!260828 mask!3119)))))

(declare-fun b!571843 () Bool)

(declare-fun e!328913 () Bool)

(declare-fun e!328911 () Bool)

(assert (=> b!571843 (= e!328913 e!328911)))

(declare-fun res!361350 () Bool)

(assert (=> b!571843 (=> res!361350 e!328911)))

(assert (=> b!571843 (= res!361350 (or (undefined!6450 lt!260827) (not (is-Intermediate!5638 lt!260827))))))

(declare-fun res!361357 () Bool)

(declare-fun e!328908 () Bool)

(assert (=> start!52404 (=> (not res!361357) (not e!328908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52404 (= res!361357 (validMask!0 mask!3119))))

(assert (=> start!52404 e!328908))

(assert (=> start!52404 true))

(declare-fun array_inv!12985 (array!35801) Bool)

(assert (=> start!52404 (array_inv!12985 a!3118)))

(declare-fun b!571844 () Bool)

(declare-fun res!361352 () Bool)

(assert (=> b!571844 (=> (not res!361352) (not e!328908))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571844 (= res!361352 (validKeyInArray!0 k!1914))))

(declare-fun b!571845 () Bool)

(assert (=> b!571845 (= e!328911 e!328912)))

(declare-fun res!361349 () Bool)

(assert (=> b!571845 (=> res!361349 e!328912)))

(declare-fun lt!260825 () (_ BitVec 64))

(assert (=> b!571845 (= res!361349 (or (= lt!260825 (select (arr!17189 a!3118) j!142)) (= lt!260825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571845 (= lt!260825 (select (arr!17189 a!3118) (index!24781 lt!260827)))))

(declare-fun b!571846 () Bool)

(declare-fun res!361359 () Bool)

(declare-fun e!328914 () Bool)

(assert (=> b!571846 (=> (not res!361359) (not e!328914))))

(declare-datatypes ((List!11269 0))(
  ( (Nil!11266) (Cons!11265 (h!12292 (_ BitVec 64)) (t!17497 List!11269)) )
))
(declare-fun arrayNoDuplicates!0 (array!35801 (_ BitVec 32) List!11269) Bool)

(assert (=> b!571846 (= res!361359 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11266))))

(declare-fun b!571847 () Bool)

(assert (=> b!571847 (= e!328908 e!328914)))

(declare-fun res!361360 () Bool)

(assert (=> b!571847 (=> (not res!361360) (not e!328914))))

(declare-fun lt!260829 () SeekEntryResult!5638)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571847 (= res!361360 (or (= lt!260829 (MissingZero!5638 i!1132)) (= lt!260829 (MissingVacant!5638 i!1132))))))

(assert (=> b!571847 (= lt!260829 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571848 () Bool)

(declare-fun res!361358 () Bool)

(assert (=> b!571848 (=> (not res!361358) (not e!328908))))

(declare-fun arrayContainsKey!0 (array!35801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571848 (= res!361358 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571849 () Bool)

(declare-fun e!328907 () Bool)

(assert (=> b!571849 (= e!328914 e!328907)))

(declare-fun res!361356 () Bool)

(assert (=> b!571849 (=> (not res!361356) (not e!328907))))

(declare-fun lt!260822 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35801 (_ BitVec 32)) SeekEntryResult!5638)

(assert (=> b!571849 (= res!361356 (= lt!260827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260822 lt!260830 lt!260828 mask!3119)))))

(declare-fun lt!260826 () (_ BitVec 32))

(assert (=> b!571849 (= lt!260827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260826 (select (arr!17189 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571849 (= lt!260822 (toIndex!0 lt!260830 mask!3119))))

(assert (=> b!571849 (= lt!260830 (select (store (arr!17189 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571849 (= lt!260826 (toIndex!0 (select (arr!17189 a!3118) j!142) mask!3119))))

(assert (=> b!571849 (= lt!260828 (array!35802 (store (arr!17189 a!3118) i!1132 k!1914) (size!17553 a!3118)))))

(declare-fun b!571850 () Bool)

(declare-fun res!361355 () Bool)

(assert (=> b!571850 (=> (not res!361355) (not e!328914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35801 (_ BitVec 32)) Bool)

(assert (=> b!571850 (= res!361355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571851 () Bool)

(assert (=> b!571851 (= e!328907 (not true))))

(assert (=> b!571851 e!328913))

(declare-fun res!361354 () Bool)

(assert (=> b!571851 (=> (not res!361354) (not e!328913))))

(assert (=> b!571851 (= res!361354 (= lt!260824 (Found!5638 j!142)))))

(assert (=> b!571851 (= lt!260824 (seekEntryOrOpen!0 (select (arr!17189 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571851 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17978 0))(
  ( (Unit!17979) )
))
(declare-fun lt!260823 () Unit!17978)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17978)

(assert (=> b!571851 (= lt!260823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571852 () Bool)

(declare-fun res!361351 () Bool)

(assert (=> b!571852 (=> (not res!361351) (not e!328908))))

(assert (=> b!571852 (= res!361351 (validKeyInArray!0 (select (arr!17189 a!3118) j!142)))))

(declare-fun b!571853 () Bool)

(declare-fun res!361353 () Bool)

(assert (=> b!571853 (=> (not res!361353) (not e!328908))))

(assert (=> b!571853 (= res!361353 (and (= (size!17553 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17553 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17553 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52404 res!361357) b!571853))

(assert (= (and b!571853 res!361353) b!571852))

(assert (= (and b!571852 res!361351) b!571844))

(assert (= (and b!571844 res!361352) b!571848))

(assert (= (and b!571848 res!361358) b!571847))

(assert (= (and b!571847 res!361360) b!571850))

(assert (= (and b!571850 res!361355) b!571846))

(assert (= (and b!571846 res!361359) b!571849))

(assert (= (and b!571849 res!361356) b!571851))

(assert (= (and b!571851 res!361354) b!571843))

(assert (= (and b!571843 (not res!361350)) b!571845))

(assert (= (and b!571845 (not res!361349)) b!571841))

(assert (= (and b!571841 res!361361) b!571842))

(declare-fun m!550741 () Bool)

(assert (=> b!571841 m!550741))

(assert (=> b!571841 m!550741))

(declare-fun m!550743 () Bool)

(assert (=> b!571841 m!550743))

(assert (=> b!571851 m!550741))

(assert (=> b!571851 m!550741))

(declare-fun m!550745 () Bool)

(assert (=> b!571851 m!550745))

(declare-fun m!550747 () Bool)

(assert (=> b!571851 m!550747))

(declare-fun m!550749 () Bool)

(assert (=> b!571851 m!550749))

(declare-fun m!550751 () Bool)

(assert (=> b!571844 m!550751))

(assert (=> b!571845 m!550741))

(declare-fun m!550753 () Bool)

(assert (=> b!571845 m!550753))

(assert (=> b!571849 m!550741))

(declare-fun m!550755 () Bool)

(assert (=> b!571849 m!550755))

(declare-fun m!550757 () Bool)

(assert (=> b!571849 m!550757))

(assert (=> b!571849 m!550741))

(declare-fun m!550759 () Bool)

(assert (=> b!571849 m!550759))

(declare-fun m!550761 () Bool)

(assert (=> b!571849 m!550761))

(declare-fun m!550763 () Bool)

(assert (=> b!571849 m!550763))

(assert (=> b!571849 m!550741))

(declare-fun m!550765 () Bool)

(assert (=> b!571849 m!550765))

(declare-fun m!550767 () Bool)

(assert (=> start!52404 m!550767))

(declare-fun m!550769 () Bool)

(assert (=> start!52404 m!550769))

(declare-fun m!550771 () Bool)

(assert (=> b!571842 m!550771))

(declare-fun m!550773 () Bool)

(assert (=> b!571842 m!550773))

(assert (=> b!571852 m!550741))

(assert (=> b!571852 m!550741))

(declare-fun m!550775 () Bool)

(assert (=> b!571852 m!550775))

(declare-fun m!550777 () Bool)

(assert (=> b!571848 m!550777))

(declare-fun m!550779 () Bool)

(assert (=> b!571846 m!550779))

(declare-fun m!550781 () Bool)

(assert (=> b!571847 m!550781))

(declare-fun m!550783 () Bool)

(assert (=> b!571850 m!550783))

(push 1)

(assert (not b!571846))

(assert (not b!571852))

(assert (not b!571848))

(assert (not b!571844))

(assert (not b!571847))

(assert (not b!571849))

(assert (not b!571841))

(assert (not start!52404))

(assert (not b!571850))

(assert (not b!571842))

(assert (not b!571851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

