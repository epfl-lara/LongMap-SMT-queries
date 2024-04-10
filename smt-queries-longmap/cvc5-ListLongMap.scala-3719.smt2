; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51176 () Bool)

(assert start!51176)

(declare-fun b!559032 () Bool)

(declare-fun e!322048 () Bool)

(declare-fun e!322050 () Bool)

(assert (=> b!559032 (= e!322048 e!322050)))

(declare-fun res!350668 () Bool)

(assert (=> b!559032 (=> (not res!350668) (not e!322050))))

(declare-datatypes ((SeekEntryResult!5336 0))(
  ( (MissingZero!5336 (index!23571 (_ BitVec 32))) (Found!5336 (index!23572 (_ BitVec 32))) (Intermediate!5336 (undefined!6148 Bool) (index!23573 (_ BitVec 32)) (x!52477 (_ BitVec 32))) (Undefined!5336) (MissingVacant!5336 (index!23574 (_ BitVec 32))) )
))
(declare-fun lt!254060 () SeekEntryResult!5336)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!254063 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35167 0))(
  ( (array!35168 (arr!16887 (Array (_ BitVec 32) (_ BitVec 64))) (size!17251 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35167 (_ BitVec 32)) SeekEntryResult!5336)

(assert (=> b!559032 (= res!350668 (= lt!254060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254063 (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)) mask!3119)))))

(declare-fun lt!254059 () (_ BitVec 32))

(assert (=> b!559032 (= lt!254060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254059 (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559032 (= lt!254063 (toIndex!0 (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!559032 (= lt!254059 (toIndex!0 (select (arr!16887 a!3118) j!142) mask!3119))))

(declare-fun b!559033 () Bool)

(declare-fun res!350660 () Bool)

(declare-fun e!322051 () Bool)

(assert (=> b!559033 (=> (not res!350660) (not e!322051))))

(declare-fun arrayContainsKey!0 (array!35167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559033 (= res!350660 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559034 () Bool)

(assert (=> b!559034 (= e!322050 (not (or (undefined!6148 lt!254060) (not (is-Intermediate!5336 lt!254060)) (let ((bdg!16952 (select (arr!16887 a!3118) (index!23573 lt!254060)))) (or (= bdg!16952 (select (arr!16887 a!3118) j!142)) (= bdg!16952 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23573 lt!254060) #b00000000000000000000000000000000) (bvsge (index!23573 lt!254060) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52477 lt!254060) #b01111111111111111111111111111110) (bvsge (x!52477 lt!254060) #b00000000000000000000000000000000)))))))))

(declare-fun e!322053 () Bool)

(assert (=> b!559034 e!322053))

(declare-fun res!350667 () Bool)

(assert (=> b!559034 (=> (not res!350667) (not e!322053))))

(declare-fun lt!254061 () SeekEntryResult!5336)

(assert (=> b!559034 (= res!350667 (= lt!254061 (Found!5336 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35167 (_ BitVec 32)) SeekEntryResult!5336)

(assert (=> b!559034 (= lt!254061 (seekEntryOrOpen!0 (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35167 (_ BitVec 32)) Bool)

(assert (=> b!559034 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17446 0))(
  ( (Unit!17447) )
))
(declare-fun lt!254062 () Unit!17446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17446)

(assert (=> b!559034 (= lt!254062 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559036 () Bool)

(declare-fun res!350663 () Bool)

(assert (=> b!559036 (=> (not res!350663) (not e!322048))))

(declare-datatypes ((List!10967 0))(
  ( (Nil!10964) (Cons!10963 (h!11960 (_ BitVec 64)) (t!17195 List!10967)) )
))
(declare-fun arrayNoDuplicates!0 (array!35167 (_ BitVec 32) List!10967) Bool)

(assert (=> b!559036 (= res!350663 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10964))))

(declare-fun b!559037 () Bool)

(declare-fun res!350664 () Bool)

(assert (=> b!559037 (=> (not res!350664) (not e!322051))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559037 (= res!350664 (validKeyInArray!0 (select (arr!16887 a!3118) j!142)))))

(declare-fun b!559038 () Bool)

(declare-fun res!350659 () Bool)

(assert (=> b!559038 (=> (not res!350659) (not e!322048))))

(assert (=> b!559038 (= res!350659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559039 () Bool)

(declare-fun res!350661 () Bool)

(assert (=> b!559039 (=> (not res!350661) (not e!322051))))

(assert (=> b!559039 (= res!350661 (and (= (size!17251 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17251 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17251 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559040 () Bool)

(declare-fun e!322047 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35167 (_ BitVec 32)) SeekEntryResult!5336)

(assert (=> b!559040 (= e!322047 (= lt!254061 (seekKeyOrZeroReturnVacant!0 (x!52477 lt!254060) (index!23573 lt!254060) (index!23573 lt!254060) (select (arr!16887 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559041 () Bool)

(declare-fun res!350662 () Bool)

(assert (=> b!559041 (=> (not res!350662) (not e!322051))))

(assert (=> b!559041 (= res!350662 (validKeyInArray!0 k!1914))))

(declare-fun res!350669 () Bool)

(assert (=> start!51176 (=> (not res!350669) (not e!322051))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51176 (= res!350669 (validMask!0 mask!3119))))

(assert (=> start!51176 e!322051))

(assert (=> start!51176 true))

(declare-fun array_inv!12683 (array!35167) Bool)

(assert (=> start!51176 (array_inv!12683 a!3118)))

(declare-fun b!559035 () Bool)

(declare-fun e!322049 () Bool)

(assert (=> b!559035 (= e!322049 e!322047)))

(declare-fun res!350658 () Bool)

(assert (=> b!559035 (=> res!350658 e!322047)))

(declare-fun lt!254065 () (_ BitVec 64))

(assert (=> b!559035 (= res!350658 (or (= lt!254065 (select (arr!16887 a!3118) j!142)) (= lt!254065 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559035 (= lt!254065 (select (arr!16887 a!3118) (index!23573 lt!254060)))))

(declare-fun b!559042 () Bool)

(assert (=> b!559042 (= e!322051 e!322048)))

(declare-fun res!350665 () Bool)

(assert (=> b!559042 (=> (not res!350665) (not e!322048))))

(declare-fun lt!254064 () SeekEntryResult!5336)

(assert (=> b!559042 (= res!350665 (or (= lt!254064 (MissingZero!5336 i!1132)) (= lt!254064 (MissingVacant!5336 i!1132))))))

(assert (=> b!559042 (= lt!254064 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!559043 () Bool)

(assert (=> b!559043 (= e!322053 e!322049)))

(declare-fun res!350666 () Bool)

(assert (=> b!559043 (=> res!350666 e!322049)))

(assert (=> b!559043 (= res!350666 (or (undefined!6148 lt!254060) (not (is-Intermediate!5336 lt!254060))))))

(assert (= (and start!51176 res!350669) b!559039))

(assert (= (and b!559039 res!350661) b!559037))

(assert (= (and b!559037 res!350664) b!559041))

(assert (= (and b!559041 res!350662) b!559033))

(assert (= (and b!559033 res!350660) b!559042))

(assert (= (and b!559042 res!350665) b!559038))

(assert (= (and b!559038 res!350659) b!559036))

(assert (= (and b!559036 res!350663) b!559032))

(assert (= (and b!559032 res!350668) b!559034))

(assert (= (and b!559034 res!350667) b!559043))

(assert (= (and b!559043 (not res!350666)) b!559035))

(assert (= (and b!559035 (not res!350658)) b!559040))

(declare-fun m!536943 () Bool)

(assert (=> b!559036 m!536943))

(declare-fun m!536945 () Bool)

(assert (=> start!51176 m!536945))

(declare-fun m!536947 () Bool)

(assert (=> start!51176 m!536947))

(declare-fun m!536949 () Bool)

(assert (=> b!559034 m!536949))

(declare-fun m!536951 () Bool)

(assert (=> b!559034 m!536951))

(declare-fun m!536953 () Bool)

(assert (=> b!559034 m!536953))

(declare-fun m!536955 () Bool)

(assert (=> b!559034 m!536955))

(assert (=> b!559034 m!536949))

(declare-fun m!536957 () Bool)

(assert (=> b!559034 m!536957))

(declare-fun m!536959 () Bool)

(assert (=> b!559042 m!536959))

(assert (=> b!559040 m!536949))

(assert (=> b!559040 m!536949))

(declare-fun m!536961 () Bool)

(assert (=> b!559040 m!536961))

(assert (=> b!559035 m!536949))

(assert (=> b!559035 m!536953))

(declare-fun m!536963 () Bool)

(assert (=> b!559038 m!536963))

(declare-fun m!536965 () Bool)

(assert (=> b!559033 m!536965))

(assert (=> b!559037 m!536949))

(assert (=> b!559037 m!536949))

(declare-fun m!536967 () Bool)

(assert (=> b!559037 m!536967))

(declare-fun m!536969 () Bool)

(assert (=> b!559041 m!536969))

(assert (=> b!559032 m!536949))

(declare-fun m!536971 () Bool)

(assert (=> b!559032 m!536971))

(assert (=> b!559032 m!536949))

(declare-fun m!536973 () Bool)

(assert (=> b!559032 m!536973))

(assert (=> b!559032 m!536949))

(declare-fun m!536975 () Bool)

(assert (=> b!559032 m!536975))

(assert (=> b!559032 m!536975))

(declare-fun m!536977 () Bool)

(assert (=> b!559032 m!536977))

(assert (=> b!559032 m!536975))

(declare-fun m!536979 () Bool)

(assert (=> b!559032 m!536979))

(declare-fun m!536981 () Bool)

(assert (=> b!559032 m!536981))

(push 1)

(assert (not b!559040))

(assert (not b!559042))

(assert (not b!559032))

(assert (not b!559034))

(assert (not b!559037))

(assert (not start!51176))

(assert (not b!559033))

(assert (not b!559036))

(assert (not b!559038))

(assert (not b!559041))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!559200 () Bool)

(declare-fun c!64563 () Bool)

(declare-fun lt!254156 () (_ BitVec 64))

(assert (=> b!559200 (= c!64563 (= lt!254156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322146 () SeekEntryResult!5336)

(declare-fun e!322145 () SeekEntryResult!5336)

(assert (=> b!559200 (= e!322146 e!322145)))

(declare-fun d!83691 () Bool)

(declare-fun lt!254155 () SeekEntryResult!5336)

(assert (=> d!83691 (and (or (is-Undefined!5336 lt!254155) (not (is-Found!5336 lt!254155)) (and (bvsge (index!23572 lt!254155) #b00000000000000000000000000000000) (bvslt (index!23572 lt!254155) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254155) (is-Found!5336 lt!254155) (not (is-MissingZero!5336 lt!254155)) (and (bvsge (index!23571 lt!254155) #b00000000000000000000000000000000) (bvslt (index!23571 lt!254155) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254155) (is-Found!5336 lt!254155) (is-MissingZero!5336 lt!254155) (not (is-MissingVacant!5336 lt!254155)) (and (bvsge (index!23574 lt!254155) #b00000000000000000000000000000000) (bvslt (index!23574 lt!254155) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254155) (ite (is-Found!5336 lt!254155) (= (select (arr!16887 a!3118) (index!23572 lt!254155)) k!1914) (ite (is-MissingZero!5336 lt!254155) (= (select (arr!16887 a!3118) (index!23571 lt!254155)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5336 lt!254155) (= (select (arr!16887 a!3118) (index!23574 lt!254155)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322147 () SeekEntryResult!5336)

(assert (=> d!83691 (= lt!254155 e!322147)))

(declare-fun c!64561 () Bool)

(declare-fun lt!254154 () SeekEntryResult!5336)

(assert (=> d!83691 (= c!64561 (and (is-Intermediate!5336 lt!254154) (undefined!6148 lt!254154)))))

(assert (=> d!83691 (= lt!254154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83691 (validMask!0 mask!3119)))

(assert (=> d!83691 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!254155)))

(declare-fun b!559201 () Bool)

(assert (=> b!559201 (= e!322147 e!322146)))

(assert (=> b!559201 (= lt!254156 (select (arr!16887 a!3118) (index!23573 lt!254154)))))

(declare-fun c!64562 () Bool)

(assert (=> b!559201 (= c!64562 (= lt!254156 k!1914))))

(declare-fun b!559202 () Bool)

(assert (=> b!559202 (= e!322145 (seekKeyOrZeroReturnVacant!0 (x!52477 lt!254154) (index!23573 lt!254154) (index!23573 lt!254154) k!1914 a!3118 mask!3119))))

(declare-fun b!559203 () Bool)

(assert (=> b!559203 (= e!322146 (Found!5336 (index!23573 lt!254154)))))

(declare-fun b!559204 () Bool)

(assert (=> b!559204 (= e!322147 Undefined!5336)))

(declare-fun b!559205 () Bool)

(assert (=> b!559205 (= e!322145 (MissingZero!5336 (index!23573 lt!254154)))))

(assert (= (and d!83691 c!64561) b!559204))

(assert (= (and d!83691 (not c!64561)) b!559201))

(assert (= (and b!559201 c!64562) b!559203))

(assert (= (and b!559201 (not c!64562)) b!559200))

(assert (= (and b!559200 c!64563) b!559205))

(assert (= (and b!559200 (not c!64563)) b!559202))

(declare-fun m!537111 () Bool)

(assert (=> d!83691 m!537111))

(declare-fun m!537113 () Bool)

(assert (=> d!83691 m!537113))

(declare-fun m!537115 () Bool)

(assert (=> d!83691 m!537115))

(assert (=> d!83691 m!536945))

(declare-fun m!537117 () Bool)

(assert (=> d!83691 m!537117))

(assert (=> d!83691 m!537111))

(declare-fun m!537119 () Bool)

(assert (=> d!83691 m!537119))

(declare-fun m!537121 () Bool)

(assert (=> b!559201 m!537121))

(declare-fun m!537123 () Bool)

(assert (=> b!559202 m!537123))

(assert (=> b!559042 d!83691))

(declare-fun d!83705 () Bool)

(assert (=> d!83705 (= (validKeyInArray!0 (select (arr!16887 a!3118) j!142)) (and (not (= (select (arr!16887 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16887 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559037 d!83705))

(declare-fun b!559240 () Bool)

(declare-fun e!322172 () Bool)

(declare-fun e!322175 () Bool)

(assert (=> b!559240 (= e!322172 e!322175)))

(declare-fun res!350782 () Bool)

(declare-fun lt!254170 () SeekEntryResult!5336)

(assert (=> b!559240 (= res!350782 (and (is-Intermediate!5336 lt!254170) (not (undefined!6148 lt!254170)) (bvslt (x!52477 lt!254170) #b01111111111111111111111111111110) (bvsge (x!52477 lt!254170) #b00000000000000000000000000000000) (bvsge (x!52477 lt!254170) #b00000000000000000000000000000000)))))

(assert (=> b!559240 (=> (not res!350782) (not e!322175))))

(declare-fun b!559242 () Bool)

(declare-fun e!322173 () SeekEntryResult!5336)

(assert (=> b!559242 (= e!322173 (Intermediate!5336 false lt!254063 #b00000000000000000000000000000000))))

(declare-fun b!559243 () Bool)

(assert (=> b!559243 (= e!322172 (bvsge (x!52477 lt!254170) #b01111111111111111111111111111110))))

(declare-fun b!559244 () Bool)

(assert (=> b!559244 (and (bvsge (index!23573 lt!254170) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254170) (size!17251 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)))))))

(declare-fun res!350781 () Bool)

(assert (=> b!559244 (= res!350781 (= (select (arr!16887 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118))) (index!23573 lt!254170)) (select (store (arr!16887 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!322171 () Bool)

(assert (=> b!559244 (=> res!350781 e!322171)))

(assert (=> b!559244 (= e!322175 e!322171)))

(declare-fun b!559245 () Bool)

(declare-fun e!322174 () SeekEntryResult!5336)

(assert (=> b!559245 (= e!322174 (Intermediate!5336 true lt!254063 #b00000000000000000000000000000000))))

(declare-fun b!559246 () Bool)

(assert (=> b!559246 (and (bvsge (index!23573 lt!254170) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254170) (size!17251 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)))))))

(assert (=> b!559246 (= e!322171 (= (select (arr!16887 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118))) (index!23573 lt!254170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559247 () Bool)

(assert (=> b!559247 (= e!322174 e!322173)))

(declare-fun lt!254171 () (_ BitVec 64))

(declare-fun c!64575 () Bool)

(assert (=> b!559247 (= c!64575 (or (= lt!254171 (select (store (arr!16887 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!254171 lt!254171) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559248 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559248 (= e!322173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254063 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)) mask!3119))))

(declare-fun d!83709 () Bool)

(assert (=> d!83709 e!322172))

(declare-fun c!64573 () Bool)

(assert (=> d!83709 (= c!64573 (and (is-Intermediate!5336 lt!254170) (undefined!6148 lt!254170)))))

(assert (=> d!83709 (= lt!254170 e!322174)))

(declare-fun c!64574 () Bool)

(assert (=> d!83709 (= c!64574 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83709 (= lt!254171 (select (arr!16887 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118))) lt!254063))))

(assert (=> d!83709 (validMask!0 mask!3119)))

(assert (=> d!83709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254063 (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)) mask!3119) lt!254170)))

(declare-fun b!559241 () Bool)

(assert (=> b!559241 (and (bvsge (index!23573 lt!254170) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254170) (size!17251 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118)))))))

(declare-fun res!350783 () Bool)

(assert (=> b!559241 (= res!350783 (= (select (arr!16887 (array!35168 (store (arr!16887 a!3118) i!1132 k!1914) (size!17251 a!3118))) (index!23573 lt!254170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559241 (=> res!350783 e!322171)))

(assert (= (and d!83709 c!64574) b!559245))

(assert (= (and d!83709 (not c!64574)) b!559247))

(assert (= (and b!559247 c!64575) b!559242))

(assert (= (and b!559247 (not c!64575)) b!559248))

(assert (= (and d!83709 c!64573) b!559243))

(assert (= (and d!83709 (not c!64573)) b!559240))

(assert (= (and b!559240 res!350782) b!559244))

(assert (= (and b!559244 (not res!350781)) b!559241))

(assert (= (and b!559241 (not res!350783)) b!559246))

(declare-fun m!537139 () Bool)

(assert (=> b!559246 m!537139))

(assert (=> b!559244 m!537139))

(declare-fun m!537141 () Bool)

(assert (=> b!559248 m!537141))

(assert (=> b!559248 m!537141))

(assert (=> b!559248 m!536975))

(declare-fun m!537143 () Bool)

(assert (=> b!559248 m!537143))

(assert (=> b!559241 m!537139))

(declare-fun m!537145 () Bool)

(assert (=> d!83709 m!537145))

(assert (=> d!83709 m!536945))

(assert (=> b!559032 d!83709))

(declare-fun b!559253 () Bool)

(declare-fun e!322179 () Bool)

(declare-fun e!322182 () Bool)

(assert (=> b!559253 (= e!322179 e!322182)))

(declare-fun res!350785 () Bool)

(declare-fun lt!254176 () SeekEntryResult!5336)

(assert (=> b!559253 (= res!350785 (and (is-Intermediate!5336 lt!254176) (not (undefined!6148 lt!254176)) (bvslt (x!52477 lt!254176) #b01111111111111111111111111111110) (bvsge (x!52477 lt!254176) #b00000000000000000000000000000000) (bvsge (x!52477 lt!254176) #b00000000000000000000000000000000)))))

(assert (=> b!559253 (=> (not res!350785) (not e!322182))))

(declare-fun b!559255 () Bool)

(declare-fun e!322180 () SeekEntryResult!5336)

(assert (=> b!559255 (= e!322180 (Intermediate!5336 false lt!254059 #b00000000000000000000000000000000))))

(declare-fun b!559256 () Bool)

(assert (=> b!559256 (= e!322179 (bvsge (x!52477 lt!254176) #b01111111111111111111111111111110))))

(declare-fun b!559257 () Bool)

(assert (=> b!559257 (and (bvsge (index!23573 lt!254176) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254176) (size!17251 a!3118)))))

(declare-fun res!350784 () Bool)

(assert (=> b!559257 (= res!350784 (= (select (arr!16887 a!3118) (index!23573 lt!254176)) (select (arr!16887 a!3118) j!142)))))

(declare-fun e!322177 () Bool)

(assert (=> b!559257 (=> res!350784 e!322177)))

(assert (=> b!559257 (= e!322182 e!322177)))

(declare-fun b!559258 () Bool)

(declare-fun e!322181 () SeekEntryResult!5336)

(assert (=> b!559258 (= e!322181 (Intermediate!5336 true lt!254059 #b00000000000000000000000000000000))))

(declare-fun b!559259 () Bool)

(assert (=> b!559259 (and (bvsge (index!23573 lt!254176) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254176) (size!17251 a!3118)))))

(assert (=> b!559259 (= e!322177 (= (select (arr!16887 a!3118) (index!23573 lt!254176)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559260 () Bool)

(assert (=> b!559260 (= e!322181 e!322180)))

(declare-fun lt!254177 () (_ BitVec 64))

(declare-fun c!64579 () Bool)

(assert (=> b!559260 (= c!64579 (or (= lt!254177 (select (arr!16887 a!3118) j!142)) (= (bvadd lt!254177 lt!254177) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559261 () Bool)

(assert (=> b!559261 (= e!322180 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254059 #b00000000000000000000000000000000 mask!3119) (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83721 () Bool)

(assert (=> d!83721 e!322179))

(declare-fun c!64576 () Bool)

(assert (=> d!83721 (= c!64576 (and (is-Intermediate!5336 lt!254176) (undefined!6148 lt!254176)))))

(assert (=> d!83721 (= lt!254176 e!322181)))

(declare-fun c!64577 () Bool)

(assert (=> d!83721 (= c!64577 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83721 (= lt!254177 (select (arr!16887 a!3118) lt!254059))))

(assert (=> d!83721 (validMask!0 mask!3119)))

(assert (=> d!83721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254059 (select (arr!16887 a!3118) j!142) a!3118 mask!3119) lt!254176)))

(declare-fun b!559254 () Bool)

(assert (=> b!559254 (and (bvsge (index!23573 lt!254176) #b00000000000000000000000000000000) (bvslt (index!23573 lt!254176) (size!17251 a!3118)))))

(declare-fun res!350786 () Bool)

(assert (=> b!559254 (= res!350786 (= (select (arr!16887 a!3118) (index!23573 lt!254176)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559254 (=> res!350786 e!322177)))

(assert (= (and d!83721 c!64577) b!559258))

(assert (= (and d!83721 (not c!64577)) b!559260))

(assert (= (and b!559260 c!64579) b!559255))

(assert (= (and b!559260 (not c!64579)) b!559261))

(assert (= (and d!83721 c!64576) b!559256))

(assert (= (and d!83721 (not c!64576)) b!559253))

(assert (= (and b!559253 res!350785) b!559257))

(assert (= (and b!559257 (not res!350784)) b!559254))

(assert (= (and b!559254 (not res!350786)) b!559259))

(declare-fun m!537147 () Bool)

(assert (=> b!559259 m!537147))

(assert (=> b!559257 m!537147))

(declare-fun m!537149 () Bool)

(assert (=> b!559261 m!537149))

(assert (=> b!559261 m!537149))

(assert (=> b!559261 m!536949))

(declare-fun m!537151 () Bool)

(assert (=> b!559261 m!537151))

(assert (=> b!559254 m!537147))

(declare-fun m!537153 () Bool)

(assert (=> d!83721 m!537153))

(assert (=> d!83721 m!536945))

(assert (=> b!559032 d!83721))

(declare-fun d!83723 () Bool)

(declare-fun lt!254185 () (_ BitVec 32))

(declare-fun lt!254184 () (_ BitVec 32))

(assert (=> d!83723 (= lt!254185 (bvmul (bvxor lt!254184 (bvlshr lt!254184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83723 (= lt!254184 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83723 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350787 (let ((h!11964 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52484 (bvmul (bvxor h!11964 (bvlshr h!11964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52484 (bvlshr x!52484 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350787 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350787 #b00000000000000000000000000000000))))))

(assert (=> d!83723 (= (toIndex!0 (select (store (arr!16887 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!254185 (bvlshr lt!254185 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559032 d!83723))

(declare-fun d!83729 () Bool)

(declare-fun lt!254187 () (_ BitVec 32))

(declare-fun lt!254186 () (_ BitVec 32))

(assert (=> d!83729 (= lt!254187 (bvmul (bvxor lt!254186 (bvlshr lt!254186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83729 (= lt!254186 ((_ extract 31 0) (bvand (bvxor (select (arr!16887 a!3118) j!142) (bvlshr (select (arr!16887 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83729 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350787 (let ((h!11964 ((_ extract 31 0) (bvand (bvxor (select (arr!16887 a!3118) j!142) (bvlshr (select (arr!16887 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52484 (bvmul (bvxor h!11964 (bvlshr h!11964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52484 (bvlshr x!52484 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350787 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350787 #b00000000000000000000000000000000))))))

(assert (=> d!83729 (= (toIndex!0 (select (arr!16887 a!3118) j!142) mask!3119) (bvand (bvxor lt!254187 (bvlshr lt!254187 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559032 d!83729))

(declare-fun d!83731 () Bool)

(assert (=> d!83731 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559041 d!83731))

(declare-fun b!559325 () Bool)

(declare-fun e!322224 () Bool)

(declare-fun e!322225 () Bool)

(assert (=> b!559325 (= e!322224 e!322225)))

(declare-fun res!350810 () Bool)

(assert (=> b!559325 (=> (not res!350810) (not e!322225))))

(declare-fun e!322223 () Bool)

(assert (=> b!559325 (= res!350810 (not e!322223))))

(declare-fun res!350811 () Bool)

(assert (=> b!559325 (=> (not res!350811) (not e!322223))))

(assert (=> b!559325 (= res!350811 (validKeyInArray!0 (select (arr!16887 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559327 () Bool)

(declare-fun e!322226 () Bool)

(declare-fun call!32427 () Bool)

(assert (=> b!559327 (= e!322226 call!32427)))

(declare-fun b!559328 () Bool)

(assert (=> b!559328 (= e!322225 e!322226)))

(declare-fun c!64602 () Bool)

(assert (=> b!559328 (= c!64602 (validKeyInArray!0 (select (arr!16887 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559329 () Bool)

(assert (=> b!559329 (= e!322226 call!32427)))

(declare-fun bm!32424 () Bool)

(assert (=> bm!32424 (= call!32427 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64602 (Cons!10963 (select (arr!16887 a!3118) #b00000000000000000000000000000000) Nil!10964) Nil!10964)))))

(declare-fun d!83733 () Bool)

(declare-fun res!350809 () Bool)

(assert (=> d!83733 (=> res!350809 e!322224)))

(assert (=> d!83733 (= res!350809 (bvsge #b00000000000000000000000000000000 (size!17251 a!3118)))))

(assert (=> d!83733 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10964) e!322224)))

(declare-fun b!559326 () Bool)

(declare-fun contains!2858 (List!10967 (_ BitVec 64)) Bool)

(assert (=> b!559326 (= e!322223 (contains!2858 Nil!10964 (select (arr!16887 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83733 (not res!350809)) b!559325))

(assert (= (and b!559325 res!350811) b!559326))

(assert (= (and b!559325 res!350810) b!559328))

(assert (= (and b!559328 c!64602) b!559329))

(assert (= (and b!559328 (not c!64602)) b!559327))

(assert (= (or b!559329 b!559327) bm!32424))

(declare-fun m!537181 () Bool)

(assert (=> b!559325 m!537181))

(assert (=> b!559325 m!537181))

(declare-fun m!537183 () Bool)

(assert (=> b!559325 m!537183))

(assert (=> b!559328 m!537181))

(assert (=> b!559328 m!537181))

(assert (=> b!559328 m!537183))

(assert (=> bm!32424 m!537181))

(declare-fun m!537185 () Bool)

(assert (=> bm!32424 m!537185))

(assert (=> b!559326 m!537181))

(assert (=> b!559326 m!537181))

(declare-fun m!537187 () Bool)

(assert (=> b!559326 m!537187))

(assert (=> b!559036 d!83733))

(declare-fun d!83737 () Bool)

(assert (=> d!83737 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51176 d!83737))

(declare-fun d!83745 () Bool)

(assert (=> d!83745 (= (array_inv!12683 a!3118) (bvsge (size!17251 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51176 d!83745))

(declare-fun b!559348 () Bool)

(declare-fun c!64611 () Bool)

(declare-fun lt!254209 () (_ BitVec 64))

(assert (=> b!559348 (= c!64611 (= lt!254209 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322238 () SeekEntryResult!5336)

(declare-fun e!322237 () SeekEntryResult!5336)

(assert (=> b!559348 (= e!322238 e!322237)))

(declare-fun d!83749 () Bool)

(declare-fun lt!254208 () SeekEntryResult!5336)

(assert (=> d!83749 (and (or (is-Undefined!5336 lt!254208) (not (is-Found!5336 lt!254208)) (and (bvsge (index!23572 lt!254208) #b00000000000000000000000000000000) (bvslt (index!23572 lt!254208) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254208) (is-Found!5336 lt!254208) (not (is-MissingZero!5336 lt!254208)) (and (bvsge (index!23571 lt!254208) #b00000000000000000000000000000000) (bvslt (index!23571 lt!254208) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254208) (is-Found!5336 lt!254208) (is-MissingZero!5336 lt!254208) (not (is-MissingVacant!5336 lt!254208)) (and (bvsge (index!23574 lt!254208) #b00000000000000000000000000000000) (bvslt (index!23574 lt!254208) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254208) (ite (is-Found!5336 lt!254208) (= (select (arr!16887 a!3118) (index!23572 lt!254208)) (select (arr!16887 a!3118) j!142)) (ite (is-MissingZero!5336 lt!254208) (= (select (arr!16887 a!3118) (index!23571 lt!254208)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5336 lt!254208) (= (select (arr!16887 a!3118) (index!23574 lt!254208)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322239 () SeekEntryResult!5336)

(assert (=> d!83749 (= lt!254208 e!322239)))

(declare-fun c!64609 () Bool)

(declare-fun lt!254207 () SeekEntryResult!5336)

(assert (=> d!83749 (= c!64609 (and (is-Intermediate!5336 lt!254207) (undefined!6148 lt!254207)))))

(assert (=> d!83749 (= lt!254207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16887 a!3118) j!142) mask!3119) (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83749 (validMask!0 mask!3119)))

(assert (=> d!83749 (= (seekEntryOrOpen!0 (select (arr!16887 a!3118) j!142) a!3118 mask!3119) lt!254208)))

(declare-fun b!559349 () Bool)

(assert (=> b!559349 (= e!322239 e!322238)))

(assert (=> b!559349 (= lt!254209 (select (arr!16887 a!3118) (index!23573 lt!254207)))))

(declare-fun c!64610 () Bool)

(assert (=> b!559349 (= c!64610 (= lt!254209 (select (arr!16887 a!3118) j!142)))))

(declare-fun b!559350 () Bool)

(assert (=> b!559350 (= e!322237 (seekKeyOrZeroReturnVacant!0 (x!52477 lt!254207) (index!23573 lt!254207) (index!23573 lt!254207) (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559351 () Bool)

(assert (=> b!559351 (= e!322238 (Found!5336 (index!23573 lt!254207)))))

(declare-fun b!559352 () Bool)

(assert (=> b!559352 (= e!322239 Undefined!5336)))

(declare-fun b!559353 () Bool)

(assert (=> b!559353 (= e!322237 (MissingZero!5336 (index!23573 lt!254207)))))

(assert (= (and d!83749 c!64609) b!559352))

(assert (= (and d!83749 (not c!64609)) b!559349))

(assert (= (and b!559349 c!64610) b!559351))

(assert (= (and b!559349 (not c!64610)) b!559348))

(assert (= (and b!559348 c!64611) b!559353))

(assert (= (and b!559348 (not c!64611)) b!559350))

(assert (=> d!83749 m!536971))

(assert (=> d!83749 m!536949))

(declare-fun m!537205 () Bool)

(assert (=> d!83749 m!537205))

(declare-fun m!537207 () Bool)

(assert (=> d!83749 m!537207))

(assert (=> d!83749 m!536945))

(declare-fun m!537209 () Bool)

(assert (=> d!83749 m!537209))

(assert (=> d!83749 m!536949))

(assert (=> d!83749 m!536971))

(declare-fun m!537211 () Bool)

(assert (=> d!83749 m!537211))

(declare-fun m!537213 () Bool)

(assert (=> b!559349 m!537213))

(assert (=> b!559350 m!536949))

(declare-fun m!537215 () Bool)

(assert (=> b!559350 m!537215))

(assert (=> b!559034 d!83749))

(declare-fun d!83751 () Bool)

(declare-fun res!350838 () Bool)

(declare-fun e!322264 () Bool)

(assert (=> d!83751 (=> res!350838 e!322264)))

(assert (=> d!83751 (= res!350838 (bvsge j!142 (size!17251 a!3118)))))

(assert (=> d!83751 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322264)))

(declare-fun b!559383 () Bool)

(declare-fun e!322265 () Bool)

(assert (=> b!559383 (= e!322264 e!322265)))

(declare-fun c!64617 () Bool)

(assert (=> b!559383 (= c!64617 (validKeyInArray!0 (select (arr!16887 a!3118) j!142)))))

(declare-fun b!559384 () Bool)

(declare-fun e!322266 () Bool)

(declare-fun call!32433 () Bool)

(assert (=> b!559384 (= e!322266 call!32433)))

(declare-fun b!559385 () Bool)

(assert (=> b!559385 (= e!322265 e!322266)))

(declare-fun lt!254217 () (_ BitVec 64))

(assert (=> b!559385 (= lt!254217 (select (arr!16887 a!3118) j!142))))

(declare-fun lt!254216 () Unit!17446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35167 (_ BitVec 64) (_ BitVec 32)) Unit!17446)

(assert (=> b!559385 (= lt!254216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254217 j!142))))

(assert (=> b!559385 (arrayContainsKey!0 a!3118 lt!254217 #b00000000000000000000000000000000)))

(declare-fun lt!254218 () Unit!17446)

(assert (=> b!559385 (= lt!254218 lt!254216)))

(declare-fun res!350839 () Bool)

(assert (=> b!559385 (= res!350839 (= (seekEntryOrOpen!0 (select (arr!16887 a!3118) j!142) a!3118 mask!3119) (Found!5336 j!142)))))

(assert (=> b!559385 (=> (not res!350839) (not e!322266))))

(declare-fun bm!32430 () Bool)

(assert (=> bm!32430 (= call!32433 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559386 () Bool)

(assert (=> b!559386 (= e!322265 call!32433)))

(assert (= (and d!83751 (not res!350838)) b!559383))

(assert (= (and b!559383 c!64617) b!559385))

(assert (= (and b!559383 (not c!64617)) b!559386))

(assert (= (and b!559385 res!350839) b!559384))

(assert (= (or b!559384 b!559386) bm!32430))

(assert (=> b!559383 m!536949))

(assert (=> b!559383 m!536949))

(assert (=> b!559383 m!536967))

(assert (=> b!559385 m!536949))

(declare-fun m!537223 () Bool)

(assert (=> b!559385 m!537223))

(declare-fun m!537225 () Bool)

(assert (=> b!559385 m!537225))

(assert (=> b!559385 m!536949))

(assert (=> b!559385 m!536957))

(declare-fun m!537227 () Bool)

(assert (=> bm!32430 m!537227))

(assert (=> b!559034 d!83751))

(declare-fun d!83759 () Bool)

(assert (=> d!83759 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254221 () Unit!17446)

(declare-fun choose!38 (array!35167 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17446)

(assert (=> d!83759 (= lt!254221 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83759 (validMask!0 mask!3119)))

(assert (=> d!83759 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254221)))

(declare-fun bs!17393 () Bool)

(assert (= bs!17393 d!83759))

(assert (=> bs!17393 m!536951))

(declare-fun m!537229 () Bool)

(assert (=> bs!17393 m!537229))

(assert (=> bs!17393 m!536945))

(assert (=> b!559034 d!83759))

(declare-fun b!559421 () Bool)

(declare-fun c!64635 () Bool)

(declare-fun lt!254238 () (_ BitVec 64))

(assert (=> b!559421 (= c!64635 (= lt!254238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322285 () SeekEntryResult!5336)

(declare-fun e!322287 () SeekEntryResult!5336)

(assert (=> b!559421 (= e!322285 e!322287)))

(declare-fun d!83761 () Bool)

(declare-fun lt!254239 () SeekEntryResult!5336)

(assert (=> d!83761 (and (or (is-Undefined!5336 lt!254239) (not (is-Found!5336 lt!254239)) (and (bvsge (index!23572 lt!254239) #b00000000000000000000000000000000) (bvslt (index!23572 lt!254239) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254239) (is-Found!5336 lt!254239) (not (is-MissingVacant!5336 lt!254239)) (not (= (index!23574 lt!254239) (index!23573 lt!254060))) (and (bvsge (index!23574 lt!254239) #b00000000000000000000000000000000) (bvslt (index!23574 lt!254239) (size!17251 a!3118)))) (or (is-Undefined!5336 lt!254239) (ite (is-Found!5336 lt!254239) (= (select (arr!16887 a!3118) (index!23572 lt!254239)) (select (arr!16887 a!3118) j!142)) (and (is-MissingVacant!5336 lt!254239) (= (index!23574 lt!254239) (index!23573 lt!254060)) (= (select (arr!16887 a!3118) (index!23574 lt!254239)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!322286 () SeekEntryResult!5336)

(assert (=> d!83761 (= lt!254239 e!322286)))

(declare-fun c!64634 () Bool)

(assert (=> d!83761 (= c!64634 (bvsge (x!52477 lt!254060) #b01111111111111111111111111111110))))

(assert (=> d!83761 (= lt!254238 (select (arr!16887 a!3118) (index!23573 lt!254060)))))

(assert (=> d!83761 (validMask!0 mask!3119)))

(assert (=> d!83761 (= (seekKeyOrZeroReturnVacant!0 (x!52477 lt!254060) (index!23573 lt!254060) (index!23573 lt!254060) (select (arr!16887 a!3118) j!142) a!3118 mask!3119) lt!254239)))

(declare-fun b!559422 () Bool)

(assert (=> b!559422 (= e!322286 Undefined!5336)))

(declare-fun b!559423 () Bool)

(assert (=> b!559423 (= e!322287 (MissingVacant!5336 (index!23573 lt!254060)))))

(declare-fun b!559424 () Bool)

(assert (=> b!559424 (= e!322286 e!322285)))

(declare-fun c!64636 () Bool)

(assert (=> b!559424 (= c!64636 (= lt!254238 (select (arr!16887 a!3118) j!142)))))

(declare-fun b!559425 () Bool)

(assert (=> b!559425 (= e!322285 (Found!5336 (index!23573 lt!254060)))))

(declare-fun b!559426 () Bool)

(assert (=> b!559426 (= e!322287 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52477 lt!254060) #b00000000000000000000000000000001) (nextIndex!0 (index!23573 lt!254060) (x!52477 lt!254060) mask!3119) (index!23573 lt!254060) (select (arr!16887 a!3118) j!142) a!3118 mask!3119))))

