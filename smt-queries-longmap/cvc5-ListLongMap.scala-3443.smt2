; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47778 () Bool)

(assert start!47778)

(declare-fun b!526138 () Bool)

(declare-fun res!322807 () Bool)

(declare-fun e!306714 () Bool)

(assert (=> b!526138 (=> (not res!322807) (not e!306714))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33415 0))(
  ( (array!33416 (arr!16059 (Array (_ BitVec 32) (_ BitVec 64))) (size!16423 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33415)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526138 (= res!322807 (and (= (size!16423 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16423 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16423 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526139 () Bool)

(declare-fun res!322811 () Bool)

(assert (=> b!526139 (=> (not res!322811) (not e!306714))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526139 (= res!322811 (validKeyInArray!0 k!2280))))

(declare-fun b!526140 () Bool)

(declare-datatypes ((Unit!16556 0))(
  ( (Unit!16557) )
))
(declare-fun e!306712 () Unit!16556)

(declare-fun Unit!16558 () Unit!16556)

(assert (=> b!526140 (= e!306712 Unit!16558)))

(declare-fun lt!241901 () Unit!16556)

(declare-datatypes ((SeekEntryResult!4526 0))(
  ( (MissingZero!4526 (index!20316 (_ BitVec 32))) (Found!4526 (index!20317 (_ BitVec 32))) (Intermediate!4526 (undefined!5338 Bool) (index!20318 (_ BitVec 32)) (x!49291 (_ BitVec 32))) (Undefined!4526) (MissingVacant!4526 (index!20319 (_ BitVec 32))) )
))
(declare-fun lt!241898 () SeekEntryResult!4526)

(declare-fun lt!241895 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16556)

(assert (=> b!526140 (= lt!241901 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241895 #b00000000000000000000000000000000 (index!20318 lt!241898) (x!49291 lt!241898) mask!3524))))

(declare-fun res!322813 () Bool)

(declare-fun lt!241903 () array!33415)

(declare-fun lt!241902 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33415 (_ BitVec 32)) SeekEntryResult!4526)

(assert (=> b!526140 (= res!322813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241895 lt!241902 lt!241903 mask!3524) (Intermediate!4526 false (index!20318 lt!241898) (x!49291 lt!241898))))))

(declare-fun e!306711 () Bool)

(assert (=> b!526140 (=> (not res!322813) (not e!306711))))

(assert (=> b!526140 e!306711))

(declare-fun b!526141 () Bool)

(declare-fun res!322812 () Bool)

(assert (=> b!526141 (=> (not res!322812) (not e!306714))))

(assert (=> b!526141 (= res!322812 (validKeyInArray!0 (select (arr!16059 a!3235) j!176)))))

(declare-fun b!526142 () Bool)

(assert (=> b!526142 (= e!306711 false)))

(declare-fun b!526143 () Bool)

(declare-fun e!306708 () Bool)

(assert (=> b!526143 (= e!306714 e!306708)))

(declare-fun res!322808 () Bool)

(assert (=> b!526143 (=> (not res!322808) (not e!306708))))

(declare-fun lt!241897 () SeekEntryResult!4526)

(assert (=> b!526143 (= res!322808 (or (= lt!241897 (MissingZero!4526 i!1204)) (= lt!241897 (MissingVacant!4526 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33415 (_ BitVec 32)) SeekEntryResult!4526)

(assert (=> b!526143 (= lt!241897 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!306710 () Bool)

(declare-fun b!526144 () Bool)

(assert (=> b!526144 (= e!306710 (= (seekEntryOrOpen!0 (select (arr!16059 a!3235) j!176) a!3235 mask!3524) (Found!4526 j!176)))))

(declare-fun b!526145 () Bool)

(declare-fun Unit!16559 () Unit!16556)

(assert (=> b!526145 (= e!306712 Unit!16559)))

(declare-fun b!526146 () Bool)

(declare-fun e!306713 () Bool)

(assert (=> b!526146 (= e!306713 true)))

(assert (=> b!526146 (= (index!20318 lt!241898) i!1204)))

(declare-fun lt!241900 () Unit!16556)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33415 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16556)

(assert (=> b!526146 (= lt!241900 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241895 #b00000000000000000000000000000000 (index!20318 lt!241898) (x!49291 lt!241898) mask!3524))))

(assert (=> b!526146 (and (or (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241899 () Unit!16556)

(assert (=> b!526146 (= lt!241899 e!306712)))

(declare-fun c!61973 () Bool)

(assert (=> b!526146 (= c!61973 (= (select (arr!16059 a!3235) (index!20318 lt!241898)) (select (arr!16059 a!3235) j!176)))))

(assert (=> b!526146 (and (bvslt (x!49291 lt!241898) #b01111111111111111111111111111110) (or (= (select (arr!16059 a!3235) (index!20318 lt!241898)) (select (arr!16059 a!3235) j!176)) (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16059 a!3235) (index!20318 lt!241898)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526147 () Bool)

(declare-fun res!322805 () Bool)

(assert (=> b!526147 (=> (not res!322805) (not e!306708))))

(declare-datatypes ((List!10217 0))(
  ( (Nil!10214) (Cons!10213 (h!11144 (_ BitVec 64)) (t!16445 List!10217)) )
))
(declare-fun arrayNoDuplicates!0 (array!33415 (_ BitVec 32) List!10217) Bool)

(assert (=> b!526147 (= res!322805 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10214))))

(declare-fun b!526148 () Bool)

(declare-fun res!322803 () Bool)

(assert (=> b!526148 (=> (not res!322803) (not e!306714))))

(declare-fun arrayContainsKey!0 (array!33415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526148 (= res!322803 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526149 () Bool)

(declare-fun res!322806 () Bool)

(assert (=> b!526149 (=> (not res!322806) (not e!306708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33415 (_ BitVec 32)) Bool)

(assert (=> b!526149 (= res!322806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526150 () Bool)

(declare-fun res!322814 () Bool)

(assert (=> b!526150 (=> res!322814 e!306713)))

(assert (=> b!526150 (= res!322814 (or (undefined!5338 lt!241898) (not (is-Intermediate!4526 lt!241898))))))

(declare-fun res!322804 () Bool)

(assert (=> start!47778 (=> (not res!322804) (not e!306714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47778 (= res!322804 (validMask!0 mask!3524))))

(assert (=> start!47778 e!306714))

(assert (=> start!47778 true))

(declare-fun array_inv!11855 (array!33415) Bool)

(assert (=> start!47778 (array_inv!11855 a!3235)))

(declare-fun b!526151 () Bool)

(assert (=> b!526151 (= e!306708 (not e!306713))))

(declare-fun res!322809 () Bool)

(assert (=> b!526151 (=> res!322809 e!306713)))

(declare-fun lt!241896 () (_ BitVec 32))

(assert (=> b!526151 (= res!322809 (= lt!241898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241896 lt!241902 lt!241903 mask!3524)))))

(assert (=> b!526151 (= lt!241898 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241895 (select (arr!16059 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526151 (= lt!241896 (toIndex!0 lt!241902 mask!3524))))

(assert (=> b!526151 (= lt!241902 (select (store (arr!16059 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526151 (= lt!241895 (toIndex!0 (select (arr!16059 a!3235) j!176) mask!3524))))

(assert (=> b!526151 (= lt!241903 (array!33416 (store (arr!16059 a!3235) i!1204 k!2280) (size!16423 a!3235)))))

(assert (=> b!526151 e!306710))

(declare-fun res!322810 () Bool)

(assert (=> b!526151 (=> (not res!322810) (not e!306710))))

(assert (=> b!526151 (= res!322810 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241894 () Unit!16556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33415 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16556)

(assert (=> b!526151 (= lt!241894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47778 res!322804) b!526138))

(assert (= (and b!526138 res!322807) b!526141))

(assert (= (and b!526141 res!322812) b!526139))

(assert (= (and b!526139 res!322811) b!526148))

(assert (= (and b!526148 res!322803) b!526143))

(assert (= (and b!526143 res!322808) b!526149))

(assert (= (and b!526149 res!322806) b!526147))

(assert (= (and b!526147 res!322805) b!526151))

(assert (= (and b!526151 res!322810) b!526144))

(assert (= (and b!526151 (not res!322809)) b!526150))

(assert (= (and b!526150 (not res!322814)) b!526146))

(assert (= (and b!526146 c!61973) b!526140))

(assert (= (and b!526146 (not c!61973)) b!526145))

(assert (= (and b!526140 res!322813) b!526142))

(declare-fun m!506829 () Bool)

(assert (=> b!526149 m!506829))

(declare-fun m!506831 () Bool)

(assert (=> b!526147 m!506831))

(declare-fun m!506833 () Bool)

(assert (=> b!526146 m!506833))

(declare-fun m!506835 () Bool)

(assert (=> b!526146 m!506835))

(declare-fun m!506837 () Bool)

(assert (=> b!526146 m!506837))

(assert (=> b!526144 m!506837))

(assert (=> b!526144 m!506837))

(declare-fun m!506839 () Bool)

(assert (=> b!526144 m!506839))

(declare-fun m!506841 () Bool)

(assert (=> b!526139 m!506841))

(declare-fun m!506843 () Bool)

(assert (=> b!526148 m!506843))

(assert (=> b!526141 m!506837))

(assert (=> b!526141 m!506837))

(declare-fun m!506845 () Bool)

(assert (=> b!526141 m!506845))

(declare-fun m!506847 () Bool)

(assert (=> b!526143 m!506847))

(declare-fun m!506849 () Bool)

(assert (=> start!47778 m!506849))

(declare-fun m!506851 () Bool)

(assert (=> start!47778 m!506851))

(declare-fun m!506853 () Bool)

(assert (=> b!526151 m!506853))

(declare-fun m!506855 () Bool)

(assert (=> b!526151 m!506855))

(declare-fun m!506857 () Bool)

(assert (=> b!526151 m!506857))

(declare-fun m!506859 () Bool)

(assert (=> b!526151 m!506859))

(assert (=> b!526151 m!506837))

(declare-fun m!506861 () Bool)

(assert (=> b!526151 m!506861))

(assert (=> b!526151 m!506837))

(declare-fun m!506863 () Bool)

(assert (=> b!526151 m!506863))

(assert (=> b!526151 m!506837))

(declare-fun m!506865 () Bool)

(assert (=> b!526151 m!506865))

(declare-fun m!506867 () Bool)

(assert (=> b!526151 m!506867))

(declare-fun m!506869 () Bool)

(assert (=> b!526140 m!506869))

(declare-fun m!506871 () Bool)

(assert (=> b!526140 m!506871))

(push 1)

