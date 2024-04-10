; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52212 () Bool)

(assert start!52212)

(declare-fun b!570047 () Bool)

(declare-fun res!360069 () Bool)

(declare-fun e!327846 () Bool)

(assert (=> b!570047 (=> (not res!360069) (not e!327846))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570047 (= res!360069 (validKeyInArray!0 k!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5608 0))(
  ( (MissingZero!5608 (index!24659 (_ BitVec 32))) (Found!5608 (index!24660 (_ BitVec 32))) (Intermediate!5608 (undefined!6420 Bool) (index!24661 (_ BitVec 32)) (x!53523 (_ BitVec 32))) (Undefined!5608) (MissingVacant!5608 (index!24662 (_ BitVec 32))) )
))
(declare-fun lt!259859 () SeekEntryResult!5608)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!259863 () SeekEntryResult!5608)

(declare-datatypes ((array!35735 0))(
  ( (array!35736 (arr!17159 (Array (_ BitVec 32) (_ BitVec 64))) (size!17523 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35735)

(declare-fun e!327848 () Bool)

(declare-fun b!570049 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35735 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570049 (= e!327848 (= lt!259863 (seekKeyOrZeroReturnVacant!0 (x!53523 lt!259859) (index!24661 lt!259859) (index!24661 lt!259859) (select (arr!17159 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570050 () Bool)

(declare-fun e!327849 () Bool)

(assert (=> b!570050 (= e!327846 e!327849)))

(declare-fun res!360068 () Bool)

(assert (=> b!570050 (=> (not res!360068) (not e!327849))))

(declare-fun lt!259862 () SeekEntryResult!5608)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570050 (= res!360068 (or (= lt!259862 (MissingZero!5608 i!1132)) (= lt!259862 (MissingVacant!5608 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35735 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570050 (= lt!259862 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570051 () Bool)

(declare-fun res!360072 () Bool)

(assert (=> b!570051 (=> (not res!360072) (not e!327846))))

(assert (=> b!570051 (= res!360072 (and (= (size!17523 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17523 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17523 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570052 () Bool)

(declare-fun res!360067 () Bool)

(assert (=> b!570052 (=> (not res!360067) (not e!327846))))

(declare-fun arrayContainsKey!0 (array!35735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570052 (= res!360067 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570053 () Bool)

(declare-fun res!360074 () Bool)

(assert (=> b!570053 (=> (not res!360074) (not e!327846))))

(assert (=> b!570053 (= res!360074 (validKeyInArray!0 (select (arr!17159 a!3118) j!142)))))

(declare-fun res!360073 () Bool)

(assert (=> start!52212 (=> (not res!360073) (not e!327846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52212 (= res!360073 (validMask!0 mask!3119))))

(assert (=> start!52212 e!327846))

(assert (=> start!52212 true))

(declare-fun array_inv!12955 (array!35735) Bool)

(assert (=> start!52212 (array_inv!12955 a!3118)))

(declare-fun b!570048 () Bool)

(declare-fun res!360070 () Bool)

(assert (=> b!570048 (=> (not res!360070) (not e!327849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35735 (_ BitVec 32)) Bool)

(assert (=> b!570048 (= res!360070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570054 () Bool)

(declare-fun res!360065 () Bool)

(assert (=> b!570054 (=> (not res!360065) (not e!327849))))

(declare-datatypes ((List!11239 0))(
  ( (Nil!11236) (Cons!11235 (h!12256 (_ BitVec 64)) (t!17467 List!11239)) )
))
(declare-fun arrayNoDuplicates!0 (array!35735 (_ BitVec 32) List!11239) Bool)

(assert (=> b!570054 (= res!360065 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11236))))

(declare-fun b!570055 () Bool)

(declare-fun e!327845 () Bool)

(assert (=> b!570055 (= e!327845 (not e!327848))))

(declare-fun res!360071 () Bool)

(assert (=> b!570055 (=> res!360071 e!327848)))

(assert (=> b!570055 (= res!360071 (or (undefined!6420 lt!259859) (not (is-Intermediate!5608 lt!259859)) (= (select (arr!17159 a!3118) (index!24661 lt!259859)) (select (arr!17159 a!3118) j!142)) (= (select (arr!17159 a!3118) (index!24661 lt!259859)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!570055 (= lt!259863 (Found!5608 j!142))))

(assert (=> b!570055 (= lt!259863 (seekEntryOrOpen!0 (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570055 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17918 0))(
  ( (Unit!17919) )
))
(declare-fun lt!259861 () Unit!17918)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17918)

(assert (=> b!570055 (= lt!259861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570056 () Bool)

(assert (=> b!570056 (= e!327849 e!327845)))

(declare-fun res!360066 () Bool)

(assert (=> b!570056 (=> (not res!360066) (not e!327845))))

(declare-fun lt!259860 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35735 (_ BitVec 32)) SeekEntryResult!5608)

(assert (=> b!570056 (= res!360066 (= lt!259859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259860 (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)) mask!3119)))))

(declare-fun lt!259864 () (_ BitVec 32))

(assert (=> b!570056 (= lt!259859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259864 (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570056 (= lt!259860 (toIndex!0 (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570056 (= lt!259864 (toIndex!0 (select (arr!17159 a!3118) j!142) mask!3119))))

(assert (= (and start!52212 res!360073) b!570051))

(assert (= (and b!570051 res!360072) b!570053))

(assert (= (and b!570053 res!360074) b!570047))

(assert (= (and b!570047 res!360069) b!570052))

(assert (= (and b!570052 res!360067) b!570050))

(assert (= (and b!570050 res!360068) b!570048))

(assert (= (and b!570048 res!360070) b!570054))

(assert (= (and b!570054 res!360065) b!570056))

(assert (= (and b!570056 res!360066) b!570055))

(assert (= (and b!570055 (not res!360071)) b!570049))

(declare-fun m!548981 () Bool)

(assert (=> b!570047 m!548981))

(declare-fun m!548983 () Bool)

(assert (=> b!570048 m!548983))

(declare-fun m!548985 () Bool)

(assert (=> b!570052 m!548985))

(declare-fun m!548987 () Bool)

(assert (=> b!570056 m!548987))

(declare-fun m!548989 () Bool)

(assert (=> b!570056 m!548989))

(declare-fun m!548991 () Bool)

(assert (=> b!570056 m!548991))

(declare-fun m!548993 () Bool)

(assert (=> b!570056 m!548993))

(assert (=> b!570056 m!548987))

(assert (=> b!570056 m!548991))

(declare-fun m!548995 () Bool)

(assert (=> b!570056 m!548995))

(assert (=> b!570056 m!548987))

(declare-fun m!548997 () Bool)

(assert (=> b!570056 m!548997))

(assert (=> b!570056 m!548991))

(declare-fun m!548999 () Bool)

(assert (=> b!570056 m!548999))

(declare-fun m!549001 () Bool)

(assert (=> start!52212 m!549001))

(declare-fun m!549003 () Bool)

(assert (=> start!52212 m!549003))

(assert (=> b!570053 m!548987))

(assert (=> b!570053 m!548987))

(declare-fun m!549005 () Bool)

(assert (=> b!570053 m!549005))

(declare-fun m!549007 () Bool)

(assert (=> b!570054 m!549007))

(assert (=> b!570049 m!548987))

(assert (=> b!570049 m!548987))

(declare-fun m!549009 () Bool)

(assert (=> b!570049 m!549009))

(declare-fun m!549011 () Bool)

(assert (=> b!570050 m!549011))

(declare-fun m!549013 () Bool)

(assert (=> b!570055 m!549013))

(assert (=> b!570055 m!548987))

(declare-fun m!549015 () Bool)

(assert (=> b!570055 m!549015))

(declare-fun m!549017 () Bool)

(assert (=> b!570055 m!549017))

(assert (=> b!570055 m!548987))

(declare-fun m!549019 () Bool)

(assert (=> b!570055 m!549019))

(push 1)

(assert (not b!570056))

(assert (not start!52212))

(assert (not b!570054))

(assert (not b!570052))

(assert (not b!570055))

(assert (not b!570047))

(assert (not b!570050))

(assert (not b!570049))

(assert (not b!570053))

(assert (not b!570048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84613 () Bool)

(assert (=> d!84613 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!570047 d!84613))

(declare-fun d!84615 () Bool)

(declare-fun res!360107 () Bool)

(declare-fun e!327892 () Bool)

(assert (=> d!84615 (=> res!360107 e!327892)))

(assert (=> d!84615 (= res!360107 (= (select (arr!17159 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84615 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!327892)))

(declare-fun b!570118 () Bool)

(declare-fun e!327893 () Bool)

(assert (=> b!570118 (= e!327892 e!327893)))

(declare-fun res!360108 () Bool)

(assert (=> b!570118 (=> (not res!360108) (not e!327893))))

(assert (=> b!570118 (= res!360108 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17523 a!3118)))))

(declare-fun b!570119 () Bool)

(assert (=> b!570119 (= e!327893 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84615 (not res!360107)) b!570118))

(assert (= (and b!570118 res!360108) b!570119))

(declare-fun m!549049 () Bool)

(assert (=> d!84615 m!549049))

(declare-fun m!549051 () Bool)

(assert (=> b!570119 m!549051))

(assert (=> b!570052 d!84615))

(declare-fun lt!259897 () SeekEntryResult!5608)

(declare-fun b!570168 () Bool)

(assert (=> b!570168 (and (bvsge (index!24661 lt!259897) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259897) (size!17523 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)))))))

(declare-fun e!327921 () Bool)

(assert (=> b!570168 (= e!327921 (= (select (arr!17159 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118))) (index!24661 lt!259897)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570169 () Bool)

(declare-fun e!327920 () Bool)

(declare-fun e!327923 () Bool)

(assert (=> b!570169 (= e!327920 e!327923)))

(declare-fun res!360115 () Bool)

(assert (=> b!570169 (= res!360115 (and (is-Intermediate!5608 lt!259897) (not (undefined!6420 lt!259897)) (bvslt (x!53523 lt!259897) #b01111111111111111111111111111110) (bvsge (x!53523 lt!259897) #b00000000000000000000000000000000) (bvsge (x!53523 lt!259897) #b00000000000000000000000000000000)))))

(assert (=> b!570169 (=> (not res!360115) (not e!327923))))

(declare-fun b!570170 () Bool)

(declare-fun e!327922 () SeekEntryResult!5608)

(assert (=> b!570170 (= e!327922 (Intermediate!5608 true lt!259860 #b00000000000000000000000000000000))))

(declare-fun b!570171 () Bool)

(declare-fun e!327919 () SeekEntryResult!5608)

(assert (=> b!570171 (= e!327922 e!327919)))

(declare-fun c!65383 () Bool)

(declare-fun lt!259898 () (_ BitVec 64))

(assert (=> b!570171 (= c!65383 (or (= lt!259898 (select (store (arr!17159 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!259898 lt!259898) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570172 () Bool)

(assert (=> b!570172 (= e!327919 (Intermediate!5608 false lt!259860 #b00000000000000000000000000000000))))

(declare-fun d!84621 () Bool)

(assert (=> d!84621 e!327920))

(declare-fun c!65384 () Bool)

(assert (=> d!84621 (= c!65384 (and (is-Intermediate!5608 lt!259897) (undefined!6420 lt!259897)))))

(assert (=> d!84621 (= lt!259897 e!327922)))

(declare-fun c!65382 () Bool)

(assert (=> d!84621 (= c!65382 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84621 (= lt!259898 (select (arr!17159 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118))) lt!259860))))

(assert (=> d!84621 (validMask!0 mask!3119)))

(assert (=> d!84621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259860 (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)) mask!3119) lt!259897)))

(declare-fun b!570173 () Bool)

(assert (=> b!570173 (and (bvsge (index!24661 lt!259897) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259897) (size!17523 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)))))))

(declare-fun res!360116 () Bool)

(assert (=> b!570173 (= res!360116 (= (select (arr!17159 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118))) (index!24661 lt!259897)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570173 (=> res!360116 e!327921)))

(declare-fun b!570174 () Bool)

(assert (=> b!570174 (and (bvsge (index!24661 lt!259897) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259897) (size!17523 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)))))))

(declare-fun res!360117 () Bool)

(assert (=> b!570174 (= res!360117 (= (select (arr!17159 (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118))) (index!24661 lt!259897)) (select (store (arr!17159 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!570174 (=> res!360117 e!327921)))

(assert (=> b!570174 (= e!327923 e!327921)))

(declare-fun b!570175 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570175 (= e!327919 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259860 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) (array!35736 (store (arr!17159 a!3118) i!1132 k!1914) (size!17523 a!3118)) mask!3119))))

(declare-fun b!570176 () Bool)

(assert (=> b!570176 (= e!327920 (bvsge (x!53523 lt!259897) #b01111111111111111111111111111110))))

(assert (= (and d!84621 c!65382) b!570170))

(assert (= (and d!84621 (not c!65382)) b!570171))

(assert (= (and b!570171 c!65383) b!570172))

(assert (= (and b!570171 (not c!65383)) b!570175))

(assert (= (and d!84621 c!65384) b!570176))

(assert (= (and d!84621 (not c!65384)) b!570169))

(assert (= (and b!570169 res!360115) b!570174))

(assert (= (and b!570174 (not res!360117)) b!570173))

(assert (= (and b!570173 (not res!360116)) b!570168))

(declare-fun m!549061 () Bool)

(assert (=> b!570168 m!549061))

(assert (=> b!570174 m!549061))

(declare-fun m!549063 () Bool)

(assert (=> d!84621 m!549063))

(assert (=> d!84621 m!549001))

(assert (=> b!570173 m!549061))

(declare-fun m!549065 () Bool)

(assert (=> b!570175 m!549065))

(assert (=> b!570175 m!549065))

(assert (=> b!570175 m!548991))

(declare-fun m!549067 () Bool)

(assert (=> b!570175 m!549067))

(assert (=> b!570056 d!84621))

(declare-fun b!570177 () Bool)

(declare-fun lt!259899 () SeekEntryResult!5608)

(assert (=> b!570177 (and (bvsge (index!24661 lt!259899) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259899) (size!17523 a!3118)))))

(declare-fun e!327926 () Bool)

(assert (=> b!570177 (= e!327926 (= (select (arr!17159 a!3118) (index!24661 lt!259899)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!570178 () Bool)

(declare-fun e!327925 () Bool)

(declare-fun e!327928 () Bool)

(assert (=> b!570178 (= e!327925 e!327928)))

(declare-fun res!360118 () Bool)

(assert (=> b!570178 (= res!360118 (and (is-Intermediate!5608 lt!259899) (not (undefined!6420 lt!259899)) (bvslt (x!53523 lt!259899) #b01111111111111111111111111111110) (bvsge (x!53523 lt!259899) #b00000000000000000000000000000000) (bvsge (x!53523 lt!259899) #b00000000000000000000000000000000)))))

(assert (=> b!570178 (=> (not res!360118) (not e!327928))))

(declare-fun b!570179 () Bool)

(declare-fun e!327927 () SeekEntryResult!5608)

(assert (=> b!570179 (= e!327927 (Intermediate!5608 true lt!259864 #b00000000000000000000000000000000))))

(declare-fun b!570180 () Bool)

(declare-fun e!327924 () SeekEntryResult!5608)

(assert (=> b!570180 (= e!327927 e!327924)))

(declare-fun c!65386 () Bool)

(declare-fun lt!259900 () (_ BitVec 64))

(assert (=> b!570180 (= c!65386 (or (= lt!259900 (select (arr!17159 a!3118) j!142)) (= (bvadd lt!259900 lt!259900) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570181 () Bool)

(assert (=> b!570181 (= e!327924 (Intermediate!5608 false lt!259864 #b00000000000000000000000000000000))))

(declare-fun d!84631 () Bool)

(assert (=> d!84631 e!327925))

(declare-fun c!65387 () Bool)

(assert (=> d!84631 (= c!65387 (and (is-Intermediate!5608 lt!259899) (undefined!6420 lt!259899)))))

(assert (=> d!84631 (= lt!259899 e!327927)))

(declare-fun c!65385 () Bool)

(assert (=> d!84631 (= c!65385 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84631 (= lt!259900 (select (arr!17159 a!3118) lt!259864))))

(assert (=> d!84631 (validMask!0 mask!3119)))

(assert (=> d!84631 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259864 (select (arr!17159 a!3118) j!142) a!3118 mask!3119) lt!259899)))

(declare-fun b!570182 () Bool)

(assert (=> b!570182 (and (bvsge (index!24661 lt!259899) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259899) (size!17523 a!3118)))))

(declare-fun res!360119 () Bool)

(assert (=> b!570182 (= res!360119 (= (select (arr!17159 a!3118) (index!24661 lt!259899)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!570182 (=> res!360119 e!327926)))

(declare-fun b!570183 () Bool)

(assert (=> b!570183 (and (bvsge (index!24661 lt!259899) #b00000000000000000000000000000000) (bvslt (index!24661 lt!259899) (size!17523 a!3118)))))

(declare-fun res!360120 () Bool)

(assert (=> b!570183 (= res!360120 (= (select (arr!17159 a!3118) (index!24661 lt!259899)) (select (arr!17159 a!3118) j!142)))))

(assert (=> b!570183 (=> res!360120 e!327926)))

(assert (=> b!570183 (= e!327928 e!327926)))

(declare-fun b!570184 () Bool)

(assert (=> b!570184 (= e!327924 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!259864 #b00000000000000000000000000000000 mask!3119) (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570185 () Bool)

(assert (=> b!570185 (= e!327925 (bvsge (x!53523 lt!259899) #b01111111111111111111111111111110))))

(assert (= (and d!84631 c!65385) b!570179))

(assert (= (and d!84631 (not c!65385)) b!570180))

(assert (= (and b!570180 c!65386) b!570181))

(assert (= (and b!570180 (not c!65386)) b!570184))

(assert (= (and d!84631 c!65387) b!570185))

(assert (= (and d!84631 (not c!65387)) b!570178))

(assert (= (and b!570178 res!360118) b!570183))

(assert (= (and b!570183 (not res!360120)) b!570182))

(assert (= (and b!570182 (not res!360119)) b!570177))

(declare-fun m!549069 () Bool)

(assert (=> b!570177 m!549069))

(assert (=> b!570183 m!549069))

(declare-fun m!549071 () Bool)

(assert (=> d!84631 m!549071))

(assert (=> d!84631 m!549001))

(assert (=> b!570182 m!549069))

(declare-fun m!549073 () Bool)

(assert (=> b!570184 m!549073))

(assert (=> b!570184 m!549073))

(assert (=> b!570184 m!548987))

(declare-fun m!549075 () Bool)

(assert (=> b!570184 m!549075))

(assert (=> b!570056 d!84631))

(declare-fun d!84633 () Bool)

(declare-fun lt!259913 () (_ BitVec 32))

(declare-fun lt!259912 () (_ BitVec 32))

(assert (=> d!84633 (= lt!259913 (bvmul (bvxor lt!259912 (bvlshr lt!259912 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84633 (= lt!259912 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84633 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360121 (let ((h!12258 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53529 (bvmul (bvxor h!12258 (bvlshr h!12258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53529 (bvlshr x!53529 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360121 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360121 #b00000000000000000000000000000000))))))

(assert (=> d!84633 (= (toIndex!0 (select (store (arr!17159 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!259913 (bvlshr lt!259913 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570056 d!84633))

(declare-fun d!84637 () Bool)

(declare-fun lt!259915 () (_ BitVec 32))

(declare-fun lt!259914 () (_ BitVec 32))

(assert (=> d!84637 (= lt!259915 (bvmul (bvxor lt!259914 (bvlshr lt!259914 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84637 (= lt!259914 ((_ extract 31 0) (bvand (bvxor (select (arr!17159 a!3118) j!142) (bvlshr (select (arr!17159 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84637 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!360121 (let ((h!12258 ((_ extract 31 0) (bvand (bvxor (select (arr!17159 a!3118) j!142) (bvlshr (select (arr!17159 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53529 (bvmul (bvxor h!12258 (bvlshr h!12258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53529 (bvlshr x!53529 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!360121 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!360121 #b00000000000000000000000000000000))))))

(assert (=> d!84637 (= (toIndex!0 (select (arr!17159 a!3118) j!142) mask!3119) (bvand (bvxor lt!259915 (bvlshr lt!259915 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!570056 d!84637))

(declare-fun b!570267 () Bool)

(declare-fun c!65416 () Bool)

(declare-fun lt!259943 () (_ BitVec 64))

(assert (=> b!570267 (= c!65416 (= lt!259943 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327979 () SeekEntryResult!5608)

(declare-fun e!327980 () SeekEntryResult!5608)

(assert (=> b!570267 (= e!327979 e!327980)))

(declare-fun b!570268 () Bool)

(declare-fun lt!259945 () SeekEntryResult!5608)

(assert (=> b!570268 (= e!327979 (Found!5608 (index!24661 lt!259945)))))

(declare-fun b!570269 () Bool)

(assert (=> b!570269 (= e!327980 (MissingZero!5608 (index!24661 lt!259945)))))

(declare-fun b!570270 () Bool)

(declare-fun e!327981 () SeekEntryResult!5608)

(assert (=> b!570270 (= e!327981 e!327979)))

(assert (=> b!570270 (= lt!259943 (select (arr!17159 a!3118) (index!24661 lt!259945)))))

(declare-fun c!65417 () Bool)

(assert (=> b!570270 (= c!65417 (= lt!259943 (select (arr!17159 a!3118) j!142)))))

(declare-fun b!570272 () Bool)

(assert (=> b!570272 (= e!327981 Undefined!5608)))

(declare-fun b!570271 () Bool)

(assert (=> b!570271 (= e!327980 (seekKeyOrZeroReturnVacant!0 (x!53523 lt!259945) (index!24661 lt!259945) (index!24661 lt!259945) (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84639 () Bool)

(declare-fun lt!259944 () SeekEntryResult!5608)

(assert (=> d!84639 (and (or (is-Undefined!5608 lt!259944) (not (is-Found!5608 lt!259944)) (and (bvsge (index!24660 lt!259944) #b00000000000000000000000000000000) (bvslt (index!24660 lt!259944) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259944) (is-Found!5608 lt!259944) (not (is-MissingZero!5608 lt!259944)) (and (bvsge (index!24659 lt!259944) #b00000000000000000000000000000000) (bvslt (index!24659 lt!259944) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259944) (is-Found!5608 lt!259944) (is-MissingZero!5608 lt!259944) (not (is-MissingVacant!5608 lt!259944)) (and (bvsge (index!24662 lt!259944) #b00000000000000000000000000000000) (bvslt (index!24662 lt!259944) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259944) (ite (is-Found!5608 lt!259944) (= (select (arr!17159 a!3118) (index!24660 lt!259944)) (select (arr!17159 a!3118) j!142)) (ite (is-MissingZero!5608 lt!259944) (= (select (arr!17159 a!3118) (index!24659 lt!259944)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5608 lt!259944) (= (select (arr!17159 a!3118) (index!24662 lt!259944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84639 (= lt!259944 e!327981)))

(declare-fun c!65415 () Bool)

(assert (=> d!84639 (= c!65415 (and (is-Intermediate!5608 lt!259945) (undefined!6420 lt!259945)))))

(assert (=> d!84639 (= lt!259945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17159 a!3118) j!142) mask!3119) (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84639 (validMask!0 mask!3119)))

(assert (=> d!84639 (= (seekEntryOrOpen!0 (select (arr!17159 a!3118) j!142) a!3118 mask!3119) lt!259944)))

(assert (= (and d!84639 c!65415) b!570272))

(assert (= (and d!84639 (not c!65415)) b!570270))

(assert (= (and b!570270 c!65417) b!570268))

(assert (= (and b!570270 (not c!65417)) b!570267))

(assert (= (and b!570267 c!65416) b!570269))

(assert (= (and b!570267 (not c!65416)) b!570271))

(declare-fun m!549121 () Bool)

(assert (=> b!570270 m!549121))

(assert (=> b!570271 m!548987))

(declare-fun m!549123 () Bool)

(assert (=> b!570271 m!549123))

(assert (=> d!84639 m!548989))

(assert (=> d!84639 m!548987))

(declare-fun m!549125 () Bool)

(assert (=> d!84639 m!549125))

(assert (=> d!84639 m!548987))

(assert (=> d!84639 m!548989))

(assert (=> d!84639 m!549001))

(declare-fun m!549127 () Bool)

(assert (=> d!84639 m!549127))

(declare-fun m!549129 () Bool)

(assert (=> d!84639 m!549129))

(declare-fun m!549131 () Bool)

(assert (=> d!84639 m!549131))

(assert (=> b!570055 d!84639))

(declare-fun call!32594 () Bool)

(declare-fun bm!32591 () Bool)

(assert (=> bm!32591 (= call!32594 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!570281 () Bool)

(declare-fun e!327988 () Bool)

(declare-fun e!327990 () Bool)

(assert (=> b!570281 (= e!327988 e!327990)))

(declare-fun c!65420 () Bool)

(assert (=> b!570281 (= c!65420 (validKeyInArray!0 (select (arr!17159 a!3118) j!142)))))

(declare-fun b!570282 () Bool)

(declare-fun e!327989 () Bool)

(assert (=> b!570282 (= e!327990 e!327989)))

(declare-fun lt!259954 () (_ BitVec 64))

(assert (=> b!570282 (= lt!259954 (select (arr!17159 a!3118) j!142))))

(declare-fun lt!259953 () Unit!17918)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35735 (_ BitVec 64) (_ BitVec 32)) Unit!17918)

(assert (=> b!570282 (= lt!259953 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!259954 j!142))))

(assert (=> b!570282 (arrayContainsKey!0 a!3118 lt!259954 #b00000000000000000000000000000000)))

(declare-fun lt!259952 () Unit!17918)

(assert (=> b!570282 (= lt!259952 lt!259953)))

(declare-fun res!360155 () Bool)

(assert (=> b!570282 (= res!360155 (= (seekEntryOrOpen!0 (select (arr!17159 a!3118) j!142) a!3118 mask!3119) (Found!5608 j!142)))))

(assert (=> b!570282 (=> (not res!360155) (not e!327989))))

(declare-fun b!570283 () Bool)

(assert (=> b!570283 (= e!327990 call!32594)))

(declare-fun d!84659 () Bool)

(declare-fun res!360154 () Bool)

(assert (=> d!84659 (=> res!360154 e!327988)))

(assert (=> d!84659 (= res!360154 (bvsge j!142 (size!17523 a!3118)))))

(assert (=> d!84659 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327988)))

(declare-fun b!570284 () Bool)

(assert (=> b!570284 (= e!327989 call!32594)))

(assert (= (and d!84659 (not res!360154)) b!570281))

(assert (= (and b!570281 c!65420) b!570282))

(assert (= (and b!570281 (not c!65420)) b!570283))

(assert (= (and b!570282 res!360155) b!570284))

(assert (= (or b!570284 b!570283) bm!32591))

(declare-fun m!549133 () Bool)

(assert (=> bm!32591 m!549133))

(assert (=> b!570281 m!548987))

(assert (=> b!570281 m!548987))

(assert (=> b!570281 m!549005))

(assert (=> b!570282 m!548987))

(declare-fun m!549135 () Bool)

(assert (=> b!570282 m!549135))

(declare-fun m!549137 () Bool)

(assert (=> b!570282 m!549137))

(assert (=> b!570282 m!548987))

(assert (=> b!570282 m!549019))

(assert (=> b!570055 d!84659))

(declare-fun d!84665 () Bool)

(assert (=> d!84665 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!259963 () Unit!17918)

(declare-fun choose!38 (array!35735 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17918)

(assert (=> d!84665 (= lt!259963 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84665 (validMask!0 mask!3119)))

(assert (=> d!84665 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!259963)))

(declare-fun bs!17686 () Bool)

(assert (= bs!17686 d!84665))

(assert (=> bs!17686 m!549015))

(declare-fun m!549139 () Bool)

(assert (=> bs!17686 m!549139))

(assert (=> bs!17686 m!549001))

(assert (=> b!570055 d!84665))

(declare-fun b!570297 () Bool)

(declare-fun c!65428 () Bool)

(declare-fun lt!259968 () (_ BitVec 64))

(assert (=> b!570297 (= c!65428 (= lt!259968 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327997 () SeekEntryResult!5608)

(declare-fun e!327998 () SeekEntryResult!5608)

(assert (=> b!570297 (= e!327997 e!327998)))

(declare-fun b!570298 () Bool)

(declare-fun lt!259970 () SeekEntryResult!5608)

(assert (=> b!570298 (= e!327997 (Found!5608 (index!24661 lt!259970)))))

(declare-fun b!570299 () Bool)

(assert (=> b!570299 (= e!327998 (MissingZero!5608 (index!24661 lt!259970)))))

(declare-fun b!570300 () Bool)

(declare-fun e!327999 () SeekEntryResult!5608)

(assert (=> b!570300 (= e!327999 e!327997)))

(assert (=> b!570300 (= lt!259968 (select (arr!17159 a!3118) (index!24661 lt!259970)))))

(declare-fun c!65429 () Bool)

(assert (=> b!570300 (= c!65429 (= lt!259968 k!1914))))

(declare-fun b!570302 () Bool)

(assert (=> b!570302 (= e!327999 Undefined!5608)))

(declare-fun b!570301 () Bool)

(assert (=> b!570301 (= e!327998 (seekKeyOrZeroReturnVacant!0 (x!53523 lt!259970) (index!24661 lt!259970) (index!24661 lt!259970) k!1914 a!3118 mask!3119))))

(declare-fun d!84667 () Bool)

(declare-fun lt!259969 () SeekEntryResult!5608)

(assert (=> d!84667 (and (or (is-Undefined!5608 lt!259969) (not (is-Found!5608 lt!259969)) (and (bvsge (index!24660 lt!259969) #b00000000000000000000000000000000) (bvslt (index!24660 lt!259969) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259969) (is-Found!5608 lt!259969) (not (is-MissingZero!5608 lt!259969)) (and (bvsge (index!24659 lt!259969) #b00000000000000000000000000000000) (bvslt (index!24659 lt!259969) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259969) (is-Found!5608 lt!259969) (is-MissingZero!5608 lt!259969) (not (is-MissingVacant!5608 lt!259969)) (and (bvsge (index!24662 lt!259969) #b00000000000000000000000000000000) (bvslt (index!24662 lt!259969) (size!17523 a!3118)))) (or (is-Undefined!5608 lt!259969) (ite (is-Found!5608 lt!259969) (= (select (arr!17159 a!3118) (index!24660 lt!259969)) k!1914) (ite (is-MissingZero!5608 lt!259969) (= (select (arr!17159 a!3118) (index!24659 lt!259969)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5608 lt!259969) (= (select (arr!17159 a!3118) (index!24662 lt!259969)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84667 (= lt!259969 e!327999)))

(declare-fun c!65427 () Bool)

(assert (=> d!84667 (= c!65427 (and (is-Intermediate!5608 lt!259970) (undefined!6420 lt!259970)))))

(assert (=> d!84667 (= lt!259970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84667 (validMask!0 mask!3119)))

(assert (=> d!84667 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!259969)))

(assert (= (and d!84667 c!65427) b!570302))

(assert (= (and d!84667 (not c!65427)) b!570300))

(assert (= (and b!570300 c!65429) b!570298))

(assert (= (and b!570300 (not c!65429)) b!570297))

(assert (= (and b!570297 c!65428) b!570299))

(assert (= (and b!570297 (not c!65428)) b!570301))

(declare-fun m!549141 () Bool)

(assert (=> b!570300 m!549141))

(declare-fun m!549143 () Bool)

(assert (=> b!570301 m!549143))

(declare-fun m!549145 () Bool)

(assert (=> d!84667 m!549145))

(declare-fun m!549147 () Bool)

(assert (=> d!84667 m!549147))

(assert (=> d!84667 m!549145))

(assert (=> d!84667 m!549001))

(declare-fun m!549149 () Bool)

(assert (=> d!84667 m!549149))

(declare-fun m!549151 () Bool)

(assert (=> d!84667 m!549151))

(declare-fun m!549153 () Bool)

(assert (=> d!84667 m!549153))

(assert (=> b!570050 d!84667))

(declare-fun b!570361 () Bool)

(declare-fun e!328035 () SeekEntryResult!5608)

(assert (=> b!570361 (= e!328035 (MissingVacant!5608 (index!24661 lt!259859)))))

(declare-fun b!570362 () Bool)

(declare-fun e!328034 () SeekEntryResult!5608)

(assert (=> b!570362 (= e!328034 Undefined!5608)))

(declare-fun b!570363 () Bool)

(assert (=> b!570363 (= e!328035 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53523 lt!259859) #b00000000000000000000000000000001) (nextIndex!0 (index!24661 lt!259859) (x!53523 lt!259859) mask!3119) (index!24661 lt!259859) (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!570364 () Bool)

(declare-fun c!65456 () Bool)

(declare-fun lt!259999 () (_ BitVec 64))

(assert (=> b!570364 (= c!65456 (= lt!259999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!328033 () SeekEntryResult!5608)

(assert (=> b!570364 (= e!328033 e!328035)))

(declare-fun d!84669 () Bool)

(declare-fun lt!259998 () SeekEntryResult!5608)

