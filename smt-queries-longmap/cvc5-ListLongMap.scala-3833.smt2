; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52616 () Bool)

(assert start!52616)

(declare-fun b!574163 () Bool)

(declare-fun res!363128 () Bool)

(declare-fun e!330336 () Bool)

(assert (=> b!574163 (=> (not res!363128) (not e!330336))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!574163 (= res!363128 (validKeyInArray!0 k!1914))))

(declare-fun b!574164 () Bool)

(declare-fun res!363132 () Bool)

(assert (=> b!574164 (=> (not res!363132) (not e!330336))))

(declare-datatypes ((array!35887 0))(
  ( (array!35888 (arr!17229 (Array (_ BitVec 32) (_ BitVec 64))) (size!17593 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35887)

(declare-fun arrayContainsKey!0 (array!35887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!574164 (= res!363132 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun lt!262231 () array!35887)

(declare-datatypes ((SeekEntryResult!5678 0))(
  ( (MissingZero!5678 (index!24939 (_ BitVec 32))) (Found!5678 (index!24940 (_ BitVec 32))) (Intermediate!5678 (undefined!6490 Bool) (index!24941 (_ BitVec 32)) (x!53821 (_ BitVec 32))) (Undefined!5678) (MissingVacant!5678 (index!24942 (_ BitVec 32))) )
))
(declare-fun lt!262228 () SeekEntryResult!5678)

(declare-fun e!330330 () Bool)

(declare-fun lt!262226 () (_ BitVec 64))

(declare-fun b!574165 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35887 (_ BitVec 32)) SeekEntryResult!5678)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35887 (_ BitVec 32)) SeekEntryResult!5678)

(assert (=> b!574165 (= e!330330 (= (seekEntryOrOpen!0 lt!262226 lt!262231 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262228) (index!24941 lt!262228) (index!24941 lt!262228) lt!262226 lt!262231 mask!3119)))))

(declare-fun b!574166 () Bool)

(declare-fun e!330335 () Bool)

(assert (=> b!574166 (= e!330336 e!330335)))

(declare-fun res!363134 () Bool)

(assert (=> b!574166 (=> (not res!363134) (not e!330335))))

(declare-fun lt!262233 () SeekEntryResult!5678)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!574166 (= res!363134 (or (= lt!262233 (MissingZero!5678 i!1132)) (= lt!262233 (MissingVacant!5678 i!1132))))))

(assert (=> b!574166 (= lt!262233 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!574167 () Bool)

(declare-fun e!330333 () Bool)

(declare-fun e!330329 () Bool)

(assert (=> b!574167 (= e!330333 e!330329)))

(declare-fun res!363137 () Bool)

(assert (=> b!574167 (=> res!363137 e!330329)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262234 () (_ BitVec 64))

(assert (=> b!574167 (= res!363137 (or (= lt!262234 (select (arr!17229 a!3118) j!142)) (= lt!262234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!574167 (= lt!262234 (select (arr!17229 a!3118) (index!24941 lt!262228)))))

(declare-fun b!574168 () Bool)

(declare-fun res!363136 () Bool)

(assert (=> b!574168 (=> (not res!363136) (not e!330335))))

(declare-datatypes ((List!11309 0))(
  ( (Nil!11306) (Cons!11305 (h!12338 (_ BitVec 64)) (t!17537 List!11309)) )
))
(declare-fun arrayNoDuplicates!0 (array!35887 (_ BitVec 32) List!11309) Bool)

(assert (=> b!574168 (= res!363136 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11306))))

(declare-fun b!574169 () Bool)

(declare-fun e!330331 () Bool)

(assert (=> b!574169 (= e!330331 (not (or (undefined!6490 lt!262228) (not (is-Intermediate!5678 lt!262228)) (let ((bdg!18009 (select (arr!17229 a!3118) (index!24941 lt!262228)))) (or (= bdg!18009 (select (arr!17229 a!3118) j!142)) (= bdg!18009 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24941 lt!262228) #b00000000000000000000000000000000) (bvsge (index!24941 lt!262228) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53821 lt!262228) #b01111111111111111111111111111110) (bvslt (x!53821 lt!262228) #b00000000000000000000000000000000) (= bdg!18009 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330332 () Bool)

(assert (=> b!574169 e!330332))

(declare-fun res!363135 () Bool)

(assert (=> b!574169 (=> (not res!363135) (not e!330332))))

(declare-fun lt!262230 () SeekEntryResult!5678)

(assert (=> b!574169 (= res!363135 (= lt!262230 (Found!5678 j!142)))))

(assert (=> b!574169 (= lt!262230 (seekEntryOrOpen!0 (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35887 (_ BitVec 32)) Bool)

(assert (=> b!574169 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18058 0))(
  ( (Unit!18059) )
))
(declare-fun lt!262227 () Unit!18058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18058)

(assert (=> b!574169 (= lt!262227 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!574170 () Bool)

(declare-fun res!363125 () Bool)

(assert (=> b!574170 (=> (not res!363125) (not e!330335))))

(assert (=> b!574170 (= res!363125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!574171 () Bool)

(assert (=> b!574171 (= e!330335 e!330331)))

(declare-fun res!363130 () Bool)

(assert (=> b!574171 (=> (not res!363130) (not e!330331))))

(declare-fun lt!262229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35887 (_ BitVec 32)) SeekEntryResult!5678)

(assert (=> b!574171 (= res!363130 (= lt!262228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262229 lt!262226 lt!262231 mask!3119)))))

(declare-fun lt!262232 () (_ BitVec 32))

(assert (=> b!574171 (= lt!262228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262232 (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574171 (= lt!262229 (toIndex!0 lt!262226 mask!3119))))

(assert (=> b!574171 (= lt!262226 (select (store (arr!17229 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!574171 (= lt!262232 (toIndex!0 (select (arr!17229 a!3118) j!142) mask!3119))))

(assert (=> b!574171 (= lt!262231 (array!35888 (store (arr!17229 a!3118) i!1132 k!1914) (size!17593 a!3118)))))

(declare-fun b!574172 () Bool)

(assert (=> b!574172 (= e!330329 e!330330)))

(declare-fun res!363133 () Bool)

(assert (=> b!574172 (=> (not res!363133) (not e!330330))))

(assert (=> b!574172 (= res!363133 (= lt!262230 (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262228) (index!24941 lt!262228) (index!24941 lt!262228) (select (arr!17229 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!574173 () Bool)

(declare-fun res!363131 () Bool)

(assert (=> b!574173 (=> (not res!363131) (not e!330336))))

(assert (=> b!574173 (= res!363131 (validKeyInArray!0 (select (arr!17229 a!3118) j!142)))))

(declare-fun res!363127 () Bool)

(assert (=> start!52616 (=> (not res!363127) (not e!330336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52616 (= res!363127 (validMask!0 mask!3119))))

(assert (=> start!52616 e!330336))

(assert (=> start!52616 true))

(declare-fun array_inv!13025 (array!35887) Bool)

(assert (=> start!52616 (array_inv!13025 a!3118)))

(declare-fun b!574174 () Bool)

(assert (=> b!574174 (= e!330332 e!330333)))

(declare-fun res!363126 () Bool)

(assert (=> b!574174 (=> res!363126 e!330333)))

(assert (=> b!574174 (= res!363126 (or (undefined!6490 lt!262228) (not (is-Intermediate!5678 lt!262228))))))

(declare-fun b!574175 () Bool)

(declare-fun res!363129 () Bool)

(assert (=> b!574175 (=> (not res!363129) (not e!330336))))

(assert (=> b!574175 (= res!363129 (and (= (size!17593 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17593 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17593 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52616 res!363127) b!574175))

(assert (= (and b!574175 res!363129) b!574173))

(assert (= (and b!574173 res!363131) b!574163))

(assert (= (and b!574163 res!363128) b!574164))

(assert (= (and b!574164 res!363132) b!574166))

(assert (= (and b!574166 res!363134) b!574170))

(assert (= (and b!574170 res!363125) b!574168))

(assert (= (and b!574168 res!363136) b!574171))

(assert (= (and b!574171 res!363130) b!574169))

(assert (= (and b!574169 res!363135) b!574174))

(assert (= (and b!574174 (not res!363126)) b!574167))

(assert (= (and b!574167 (not res!363137)) b!574172))

(assert (= (and b!574172 res!363133) b!574165))

(declare-fun m!553077 () Bool)

(assert (=> b!574168 m!553077))

(declare-fun m!553079 () Bool)

(assert (=> b!574165 m!553079))

(declare-fun m!553081 () Bool)

(assert (=> b!574165 m!553081))

(declare-fun m!553083 () Bool)

(assert (=> b!574173 m!553083))

(assert (=> b!574173 m!553083))

(declare-fun m!553085 () Bool)

(assert (=> b!574173 m!553085))

(assert (=> b!574167 m!553083))

(declare-fun m!553087 () Bool)

(assert (=> b!574167 m!553087))

(declare-fun m!553089 () Bool)

(assert (=> start!52616 m!553089))

(declare-fun m!553091 () Bool)

(assert (=> start!52616 m!553091))

(declare-fun m!553093 () Bool)

(assert (=> b!574166 m!553093))

(assert (=> b!574172 m!553083))

(assert (=> b!574172 m!553083))

(declare-fun m!553095 () Bool)

(assert (=> b!574172 m!553095))

(declare-fun m!553097 () Bool)

(assert (=> b!574163 m!553097))

(assert (=> b!574169 m!553083))

(declare-fun m!553099 () Bool)

(assert (=> b!574169 m!553099))

(assert (=> b!574169 m!553087))

(declare-fun m!553101 () Bool)

(assert (=> b!574169 m!553101))

(assert (=> b!574169 m!553083))

(declare-fun m!553103 () Bool)

(assert (=> b!574169 m!553103))

(declare-fun m!553105 () Bool)

(assert (=> b!574171 m!553105))

(assert (=> b!574171 m!553083))

(declare-fun m!553107 () Bool)

(assert (=> b!574171 m!553107))

(assert (=> b!574171 m!553083))

(declare-fun m!553109 () Bool)

(assert (=> b!574171 m!553109))

(assert (=> b!574171 m!553083))

(declare-fun m!553111 () Bool)

(assert (=> b!574171 m!553111))

(declare-fun m!553113 () Bool)

(assert (=> b!574171 m!553113))

(declare-fun m!553115 () Bool)

(assert (=> b!574171 m!553115))

(declare-fun m!553117 () Bool)

(assert (=> b!574170 m!553117))

(declare-fun m!553119 () Bool)

(assert (=> b!574164 m!553119))

(push 1)

(assert (not b!574168))

(assert (not b!574172))

(assert (not b!574165))

(assert (not b!574171))

(assert (not b!574173))

(assert (not start!52616))

(assert (not b!574163))

(assert (not b!574169))

(assert (not b!574170))

(assert (not b!574164))

(assert (not b!574166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85077 () Bool)

(declare-fun lt!262326 () SeekEntryResult!5678)

(assert (=> d!85077 (and (or (is-Undefined!5678 lt!262326) (not (is-Found!5678 lt!262326)) (and (bvsge (index!24940 lt!262326) #b00000000000000000000000000000000) (bvslt (index!24940 lt!262326) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262326) (is-Found!5678 lt!262326) (not (is-MissingVacant!5678 lt!262326)) (not (= (index!24942 lt!262326) (index!24941 lt!262228))) (and (bvsge (index!24942 lt!262326) #b00000000000000000000000000000000) (bvslt (index!24942 lt!262326) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262326) (ite (is-Found!5678 lt!262326) (= (select (arr!17229 a!3118) (index!24940 lt!262326)) (select (arr!17229 a!3118) j!142)) (and (is-MissingVacant!5678 lt!262326) (= (index!24942 lt!262326) (index!24941 lt!262228)) (= (select (arr!17229 a!3118) (index!24942 lt!262326)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330422 () SeekEntryResult!5678)

(assert (=> d!85077 (= lt!262326 e!330422)))

(declare-fun c!65909 () Bool)

(assert (=> d!85077 (= c!65909 (bvsge (x!53821 lt!262228) #b01111111111111111111111111111110))))

(declare-fun lt!262327 () (_ BitVec 64))

(assert (=> d!85077 (= lt!262327 (select (arr!17229 a!3118) (index!24941 lt!262228)))))

(assert (=> d!85077 (validMask!0 mask!3119)))

(assert (=> d!85077 (= (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262228) (index!24941 lt!262228) (index!24941 lt!262228) (select (arr!17229 a!3118) j!142) a!3118 mask!3119) lt!262326)))

(declare-fun b!574318 () Bool)

(declare-fun c!65910 () Bool)

(assert (=> b!574318 (= c!65910 (= lt!262327 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330421 () SeekEntryResult!5678)

(declare-fun e!330423 () SeekEntryResult!5678)

(assert (=> b!574318 (= e!330421 e!330423)))

(declare-fun b!574319 () Bool)

(assert (=> b!574319 (= e!330423 (MissingVacant!5678 (index!24941 lt!262228)))))

(declare-fun b!574320 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!574320 (= e!330423 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53821 lt!262228) #b00000000000000000000000000000001) (nextIndex!0 (index!24941 lt!262228) (x!53821 lt!262228) mask!3119) (index!24941 lt!262228) (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574321 () Bool)

(assert (=> b!574321 (= e!330422 Undefined!5678)))

(declare-fun b!574322 () Bool)

(assert (=> b!574322 (= e!330422 e!330421)))

(declare-fun c!65908 () Bool)

(assert (=> b!574322 (= c!65908 (= lt!262327 (select (arr!17229 a!3118) j!142)))))

(declare-fun b!574323 () Bool)

(assert (=> b!574323 (= e!330421 (Found!5678 (index!24941 lt!262228)))))

(assert (= (and d!85077 c!65909) b!574321))

(assert (= (and d!85077 (not c!65909)) b!574322))

(assert (= (and b!574322 c!65908) b!574323))

(assert (= (and b!574322 (not c!65908)) b!574318))

(assert (= (and b!574318 c!65910) b!574319))

(assert (= (and b!574318 (not c!65910)) b!574320))

(declare-fun m!553253 () Bool)

(assert (=> d!85077 m!553253))

(declare-fun m!553255 () Bool)

(assert (=> d!85077 m!553255))

(assert (=> d!85077 m!553087))

(assert (=> d!85077 m!553089))

(declare-fun m!553257 () Bool)

(assert (=> b!574320 m!553257))

(assert (=> b!574320 m!553257))

(assert (=> b!574320 m!553083))

(declare-fun m!553259 () Bool)

(assert (=> b!574320 m!553259))

(assert (=> b!574172 d!85077))

(declare-fun d!85087 () Bool)

(assert (=> d!85087 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52616 d!85087))

(declare-fun d!85089 () Bool)

(assert (=> d!85089 (= (array_inv!13025 a!3118) (bvsge (size!17593 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52616 d!85089))

(declare-fun d!85093 () Bool)

(assert (=> d!85093 (= (validKeyInArray!0 (select (arr!17229 a!3118) j!142)) (and (not (= (select (arr!17229 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17229 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574173 d!85093))

(declare-fun d!85097 () Bool)

(assert (=> d!85097 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!574163 d!85097))

(declare-fun e!330480 () SeekEntryResult!5678)

(declare-fun b!574420 () Bool)

(declare-fun lt!262374 () SeekEntryResult!5678)

(assert (=> b!574420 (= e!330480 (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262374) (index!24941 lt!262374) (index!24941 lt!262374) (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85099 () Bool)

(declare-fun lt!262375 () SeekEntryResult!5678)

(assert (=> d!85099 (and (or (is-Undefined!5678 lt!262375) (not (is-Found!5678 lt!262375)) (and (bvsge (index!24940 lt!262375) #b00000000000000000000000000000000) (bvslt (index!24940 lt!262375) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262375) (is-Found!5678 lt!262375) (not (is-MissingZero!5678 lt!262375)) (and (bvsge (index!24939 lt!262375) #b00000000000000000000000000000000) (bvslt (index!24939 lt!262375) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262375) (is-Found!5678 lt!262375) (is-MissingZero!5678 lt!262375) (not (is-MissingVacant!5678 lt!262375)) (and (bvsge (index!24942 lt!262375) #b00000000000000000000000000000000) (bvslt (index!24942 lt!262375) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262375) (ite (is-Found!5678 lt!262375) (= (select (arr!17229 a!3118) (index!24940 lt!262375)) (select (arr!17229 a!3118) j!142)) (ite (is-MissingZero!5678 lt!262375) (= (select (arr!17229 a!3118) (index!24939 lt!262375)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5678 lt!262375) (= (select (arr!17229 a!3118) (index!24942 lt!262375)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330482 () SeekEntryResult!5678)

(assert (=> d!85099 (= lt!262375 e!330482)))

(declare-fun c!65949 () Bool)

(assert (=> d!85099 (= c!65949 (and (is-Intermediate!5678 lt!262374) (undefined!6490 lt!262374)))))

(assert (=> d!85099 (= lt!262374 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17229 a!3118) j!142) mask!3119) (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85099 (validMask!0 mask!3119)))

(assert (=> d!85099 (= (seekEntryOrOpen!0 (select (arr!17229 a!3118) j!142) a!3118 mask!3119) lt!262375)))

(declare-fun b!574421 () Bool)

(assert (=> b!574421 (= e!330482 Undefined!5678)))

(declare-fun b!574422 () Bool)

(declare-fun e!330481 () SeekEntryResult!5678)

(assert (=> b!574422 (= e!330482 e!330481)))

(declare-fun lt!262376 () (_ BitVec 64))

(assert (=> b!574422 (= lt!262376 (select (arr!17229 a!3118) (index!24941 lt!262374)))))

(declare-fun c!65948 () Bool)

(assert (=> b!574422 (= c!65948 (= lt!262376 (select (arr!17229 a!3118) j!142)))))

(declare-fun b!574423 () Bool)

(assert (=> b!574423 (= e!330481 (Found!5678 (index!24941 lt!262374)))))

(declare-fun b!574424 () Bool)

(declare-fun c!65947 () Bool)

(assert (=> b!574424 (= c!65947 (= lt!262376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574424 (= e!330481 e!330480)))

(declare-fun b!574425 () Bool)

(assert (=> b!574425 (= e!330480 (MissingZero!5678 (index!24941 lt!262374)))))

(assert (= (and d!85099 c!65949) b!574421))

(assert (= (and d!85099 (not c!65949)) b!574422))

(assert (= (and b!574422 c!65948) b!574423))

(assert (= (and b!574422 (not c!65948)) b!574424))

(assert (= (and b!574424 c!65947) b!574425))

(assert (= (and b!574424 (not c!65947)) b!574420))

(assert (=> b!574420 m!553083))

(declare-fun m!553321 () Bool)

(assert (=> b!574420 m!553321))

(declare-fun m!553323 () Bool)

(assert (=> d!85099 m!553323))

(assert (=> d!85099 m!553107))

(assert (=> d!85099 m!553083))

(declare-fun m!553325 () Bool)

(assert (=> d!85099 m!553325))

(declare-fun m!553327 () Bool)

(assert (=> d!85099 m!553327))

(declare-fun m!553329 () Bool)

(assert (=> d!85099 m!553329))

(assert (=> d!85099 m!553083))

(assert (=> d!85099 m!553107))

(assert (=> d!85099 m!553089))

(declare-fun m!553331 () Bool)

(assert (=> b!574422 m!553331))

(assert (=> b!574169 d!85099))

(declare-fun b!574442 () Bool)

(declare-fun e!330494 () Bool)

(declare-fun e!330493 () Bool)

(assert (=> b!574442 (= e!330494 e!330493)))

(declare-fun lt!262390 () (_ BitVec 64))

(assert (=> b!574442 (= lt!262390 (select (arr!17229 a!3118) j!142))))

(declare-fun lt!262389 () Unit!18058)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35887 (_ BitVec 64) (_ BitVec 32)) Unit!18058)

(assert (=> b!574442 (= lt!262389 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262390 j!142))))

(assert (=> b!574442 (arrayContainsKey!0 a!3118 lt!262390 #b00000000000000000000000000000000)))

(declare-fun lt!262391 () Unit!18058)

(assert (=> b!574442 (= lt!262391 lt!262389)))

(declare-fun res!363253 () Bool)

(assert (=> b!574442 (= res!363253 (= (seekEntryOrOpen!0 (select (arr!17229 a!3118) j!142) a!3118 mask!3119) (Found!5678 j!142)))))

(assert (=> b!574442 (=> (not res!363253) (not e!330493))))

(declare-fun call!32676 () Bool)

(declare-fun bm!32673 () Bool)

(assert (=> bm!32673 (= call!32676 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574443 () Bool)

(assert (=> b!574443 (= e!330493 call!32676)))

(declare-fun b!574444 () Bool)

(assert (=> b!574444 (= e!330494 call!32676)))

(declare-fun b!574445 () Bool)

(declare-fun e!330492 () Bool)

(assert (=> b!574445 (= e!330492 e!330494)))

(declare-fun c!65955 () Bool)

(assert (=> b!574445 (= c!65955 (validKeyInArray!0 (select (arr!17229 a!3118) j!142)))))

(declare-fun d!85123 () Bool)

(declare-fun res!363254 () Bool)

(assert (=> d!85123 (=> res!363254 e!330492)))

(assert (=> d!85123 (= res!363254 (bvsge j!142 (size!17593 a!3118)))))

(assert (=> d!85123 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!330492)))

(assert (= (and d!85123 (not res!363254)) b!574445))

(assert (= (and b!574445 c!65955) b!574442))

(assert (= (and b!574445 (not c!65955)) b!574444))

(assert (= (and b!574442 res!363253) b!574443))

(assert (= (or b!574443 b!574444) bm!32673))

(assert (=> b!574442 m!553083))

(declare-fun m!553339 () Bool)

(assert (=> b!574442 m!553339))

(declare-fun m!553341 () Bool)

(assert (=> b!574442 m!553341))

(assert (=> b!574442 m!553083))

(assert (=> b!574442 m!553103))

(declare-fun m!553343 () Bool)

(assert (=> bm!32673 m!553343))

(assert (=> b!574445 m!553083))

(assert (=> b!574445 m!553083))

(assert (=> b!574445 m!553085))

(assert (=> b!574169 d!85123))

(declare-fun d!85131 () Bool)

(assert (=> d!85131 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!262398 () Unit!18058)

(declare-fun choose!38 (array!35887 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18058)

(assert (=> d!85131 (= lt!262398 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85131 (validMask!0 mask!3119)))

(assert (=> d!85131 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!262398)))

(declare-fun bs!17772 () Bool)

(assert (= bs!17772 d!85131))

(assert (=> bs!17772 m!553099))

(declare-fun m!553355 () Bool)

(assert (=> bs!17772 m!553355))

(assert (=> bs!17772 m!553089))

(assert (=> b!574169 d!85131))

(declare-fun b!574468 () Bool)

(declare-fun e!330509 () Bool)

(declare-fun e!330508 () Bool)

(assert (=> b!574468 (= e!330509 e!330508)))

(declare-fun lt!262400 () (_ BitVec 64))

(assert (=> b!574468 (= lt!262400 (select (arr!17229 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262399 () Unit!18058)

(assert (=> b!574468 (= lt!262399 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!262400 #b00000000000000000000000000000000))))

(assert (=> b!574468 (arrayContainsKey!0 a!3118 lt!262400 #b00000000000000000000000000000000)))

(declare-fun lt!262401 () Unit!18058)

(assert (=> b!574468 (= lt!262401 lt!262399)))

(declare-fun res!363255 () Bool)

(assert (=> b!574468 (= res!363255 (= (seekEntryOrOpen!0 (select (arr!17229 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5678 #b00000000000000000000000000000000)))))

(assert (=> b!574468 (=> (not res!363255) (not e!330508))))

(declare-fun bm!32674 () Bool)

(declare-fun call!32677 () Bool)

(assert (=> bm!32674 (= call!32677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!574469 () Bool)

(assert (=> b!574469 (= e!330508 call!32677)))

(declare-fun b!574470 () Bool)

(assert (=> b!574470 (= e!330509 call!32677)))

(declare-fun b!574471 () Bool)

(declare-fun e!330507 () Bool)

(assert (=> b!574471 (= e!330507 e!330509)))

(declare-fun c!65968 () Bool)

(assert (=> b!574471 (= c!65968 (validKeyInArray!0 (select (arr!17229 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85135 () Bool)

(declare-fun res!363256 () Bool)

(assert (=> d!85135 (=> res!363256 e!330507)))

(assert (=> d!85135 (= res!363256 (bvsge #b00000000000000000000000000000000 (size!17593 a!3118)))))

(assert (=> d!85135 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330507)))

(assert (= (and d!85135 (not res!363256)) b!574471))

(assert (= (and b!574471 c!65968) b!574468))

(assert (= (and b!574471 (not c!65968)) b!574470))

(assert (= (and b!574468 res!363255) b!574469))

(assert (= (or b!574469 b!574470) bm!32674))

(declare-fun m!553363 () Bool)

(assert (=> b!574468 m!553363))

(declare-fun m!553365 () Bool)

(assert (=> b!574468 m!553365))

(declare-fun m!553367 () Bool)

(assert (=> b!574468 m!553367))

(assert (=> b!574468 m!553363))

(declare-fun m!553369 () Bool)

(assert (=> b!574468 m!553369))

(declare-fun m!553371 () Bool)

(assert (=> bm!32674 m!553371))

(assert (=> b!574471 m!553363))

(assert (=> b!574471 m!553363))

(declare-fun m!553373 () Bool)

(assert (=> b!574471 m!553373))

(assert (=> b!574170 d!85135))

(declare-fun b!574553 () Bool)

(declare-fun e!330560 () SeekEntryResult!5678)

(assert (=> b!574553 (= e!330560 (Intermediate!5678 true lt!262229 #b00000000000000000000000000000000))))

(declare-fun b!574554 () Bool)

(declare-fun e!330561 () SeekEntryResult!5678)

(assert (=> b!574554 (= e!330561 (Intermediate!5678 false lt!262229 #b00000000000000000000000000000000))))

(declare-fun b!574555 () Bool)

(declare-fun e!330559 () Bool)

(declare-fun e!330562 () Bool)

(assert (=> b!574555 (= e!330559 e!330562)))

(declare-fun res!363287 () Bool)

(declare-fun lt!262428 () SeekEntryResult!5678)

(assert (=> b!574555 (= res!363287 (and (is-Intermediate!5678 lt!262428) (not (undefined!6490 lt!262428)) (bvslt (x!53821 lt!262428) #b01111111111111111111111111111110) (bvsge (x!53821 lt!262428) #b00000000000000000000000000000000) (bvsge (x!53821 lt!262428) #b00000000000000000000000000000000)))))

(assert (=> b!574555 (=> (not res!363287) (not e!330562))))

(declare-fun d!85139 () Bool)

(assert (=> d!85139 e!330559))

(declare-fun c!65998 () Bool)

(assert (=> d!85139 (= c!65998 (and (is-Intermediate!5678 lt!262428) (undefined!6490 lt!262428)))))

(assert (=> d!85139 (= lt!262428 e!330560)))

(declare-fun c!65996 () Bool)

(assert (=> d!85139 (= c!65996 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262429 () (_ BitVec 64))

(assert (=> d!85139 (= lt!262429 (select (arr!17229 lt!262231) lt!262229))))

(assert (=> d!85139 (validMask!0 mask!3119)))

(assert (=> d!85139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262229 lt!262226 lt!262231 mask!3119) lt!262428)))

(declare-fun b!574556 () Bool)

(assert (=> b!574556 (= e!330559 (bvsge (x!53821 lt!262428) #b01111111111111111111111111111110))))

(declare-fun b!574557 () Bool)

(assert (=> b!574557 (and (bvsge (index!24941 lt!262428) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262428) (size!17593 lt!262231)))))

(declare-fun res!363285 () Bool)

(assert (=> b!574557 (= res!363285 (= (select (arr!17229 lt!262231) (index!24941 lt!262428)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330558 () Bool)

(assert (=> b!574557 (=> res!363285 e!330558)))

(declare-fun b!574558 () Bool)

(assert (=> b!574558 (= e!330561 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262229 #b00000000000000000000000000000000 mask!3119) lt!262226 lt!262231 mask!3119))))

(declare-fun b!574559 () Bool)

(assert (=> b!574559 (= e!330560 e!330561)))

(declare-fun c!65997 () Bool)

(assert (=> b!574559 (= c!65997 (or (= lt!262429 lt!262226) (= (bvadd lt!262429 lt!262429) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574560 () Bool)

(assert (=> b!574560 (and (bvsge (index!24941 lt!262428) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262428) (size!17593 lt!262231)))))

(assert (=> b!574560 (= e!330558 (= (select (arr!17229 lt!262231) (index!24941 lt!262428)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574561 () Bool)

(assert (=> b!574561 (and (bvsge (index!24941 lt!262428) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262428) (size!17593 lt!262231)))))

(declare-fun res!363286 () Bool)

(assert (=> b!574561 (= res!363286 (= (select (arr!17229 lt!262231) (index!24941 lt!262428)) lt!262226))))

(assert (=> b!574561 (=> res!363286 e!330558)))

(assert (=> b!574561 (= e!330562 e!330558)))

(assert (= (and d!85139 c!65996) b!574553))

(assert (= (and d!85139 (not c!65996)) b!574559))

(assert (= (and b!574559 c!65997) b!574554))

(assert (= (and b!574559 (not c!65997)) b!574558))

(assert (= (and d!85139 c!65998) b!574556))

(assert (= (and d!85139 (not c!65998)) b!574555))

(assert (= (and b!574555 res!363287) b!574561))

(assert (= (and b!574561 (not res!363286)) b!574557))

(assert (= (and b!574557 (not res!363285)) b!574560))

(declare-fun m!553423 () Bool)

(assert (=> b!574558 m!553423))

(assert (=> b!574558 m!553423))

(declare-fun m!553425 () Bool)

(assert (=> b!574558 m!553425))

(declare-fun m!553427 () Bool)

(assert (=> b!574561 m!553427))

(assert (=> b!574560 m!553427))

(assert (=> b!574557 m!553427))

(declare-fun m!553429 () Bool)

(assert (=> d!85139 m!553429))

(assert (=> d!85139 m!553089))

(assert (=> b!574171 d!85139))

(declare-fun b!574566 () Bool)

(declare-fun e!330569 () SeekEntryResult!5678)

(assert (=> b!574566 (= e!330569 (Intermediate!5678 true lt!262232 #b00000000000000000000000000000000))))

(declare-fun b!574567 () Bool)

(declare-fun e!330570 () SeekEntryResult!5678)

(assert (=> b!574567 (= e!330570 (Intermediate!5678 false lt!262232 #b00000000000000000000000000000000))))

(declare-fun b!574568 () Bool)

(declare-fun e!330568 () Bool)

(declare-fun e!330571 () Bool)

(assert (=> b!574568 (= e!330568 e!330571)))

(declare-fun res!363294 () Bool)

(declare-fun lt!262430 () SeekEntryResult!5678)

(assert (=> b!574568 (= res!363294 (and (is-Intermediate!5678 lt!262430) (not (undefined!6490 lt!262430)) (bvslt (x!53821 lt!262430) #b01111111111111111111111111111110) (bvsge (x!53821 lt!262430) #b00000000000000000000000000000000) (bvsge (x!53821 lt!262430) #b00000000000000000000000000000000)))))

(assert (=> b!574568 (=> (not res!363294) (not e!330571))))

(declare-fun d!85157 () Bool)

(assert (=> d!85157 e!330568))

(declare-fun c!66001 () Bool)

(assert (=> d!85157 (= c!66001 (and (is-Intermediate!5678 lt!262430) (undefined!6490 lt!262430)))))

(assert (=> d!85157 (= lt!262430 e!330569)))

(declare-fun c!65999 () Bool)

(assert (=> d!85157 (= c!65999 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262431 () (_ BitVec 64))

(assert (=> d!85157 (= lt!262431 (select (arr!17229 a!3118) lt!262232))))

(assert (=> d!85157 (validMask!0 mask!3119)))

(assert (=> d!85157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262232 (select (arr!17229 a!3118) j!142) a!3118 mask!3119) lt!262430)))

(declare-fun b!574569 () Bool)

(assert (=> b!574569 (= e!330568 (bvsge (x!53821 lt!262430) #b01111111111111111111111111111110))))

(declare-fun b!574570 () Bool)

(assert (=> b!574570 (and (bvsge (index!24941 lt!262430) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262430) (size!17593 a!3118)))))

(declare-fun res!363292 () Bool)

(assert (=> b!574570 (= res!363292 (= (select (arr!17229 a!3118) (index!24941 lt!262430)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330567 () Bool)

(assert (=> b!574570 (=> res!363292 e!330567)))

(declare-fun b!574571 () Bool)

(assert (=> b!574571 (= e!330570 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!262232 #b00000000000000000000000000000000 mask!3119) (select (arr!17229 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574572 () Bool)

(assert (=> b!574572 (= e!330569 e!330570)))

(declare-fun c!66000 () Bool)

(assert (=> b!574572 (= c!66000 (or (= lt!262431 (select (arr!17229 a!3118) j!142)) (= (bvadd lt!262431 lt!262431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!574573 () Bool)

(assert (=> b!574573 (and (bvsge (index!24941 lt!262430) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262430) (size!17593 a!3118)))))

(assert (=> b!574573 (= e!330567 (= (select (arr!17229 a!3118) (index!24941 lt!262430)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!574574 () Bool)

(assert (=> b!574574 (and (bvsge (index!24941 lt!262430) #b00000000000000000000000000000000) (bvslt (index!24941 lt!262430) (size!17593 a!3118)))))

(declare-fun res!363293 () Bool)

(assert (=> b!574574 (= res!363293 (= (select (arr!17229 a!3118) (index!24941 lt!262430)) (select (arr!17229 a!3118) j!142)))))

(assert (=> b!574574 (=> res!363293 e!330567)))

(assert (=> b!574574 (= e!330571 e!330567)))

(assert (= (and d!85157 c!65999) b!574566))

(assert (= (and d!85157 (not c!65999)) b!574572))

(assert (= (and b!574572 c!66000) b!574567))

(assert (= (and b!574572 (not c!66000)) b!574571))

(assert (= (and d!85157 c!66001) b!574569))

(assert (= (and d!85157 (not c!66001)) b!574568))

(assert (= (and b!574568 res!363294) b!574574))

(assert (= (and b!574574 (not res!363293)) b!574570))

(assert (= (and b!574570 (not res!363292)) b!574573))

(declare-fun m!553435 () Bool)

(assert (=> b!574571 m!553435))

(assert (=> b!574571 m!553435))

(assert (=> b!574571 m!553083))

(declare-fun m!553437 () Bool)

(assert (=> b!574571 m!553437))

(declare-fun m!553439 () Bool)

(assert (=> b!574574 m!553439))

(assert (=> b!574573 m!553439))

(assert (=> b!574570 m!553439))

(declare-fun m!553441 () Bool)

(assert (=> d!85157 m!553441))

(assert (=> d!85157 m!553089))

(assert (=> b!574171 d!85157))

(declare-fun d!85161 () Bool)

(declare-fun lt!262437 () (_ BitVec 32))

(declare-fun lt!262436 () (_ BitVec 32))

(assert (=> d!85161 (= lt!262437 (bvmul (bvxor lt!262436 (bvlshr lt!262436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85161 (= lt!262436 ((_ extract 31 0) (bvand (bvxor lt!262226 (bvlshr lt!262226 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85161 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363297 (let ((h!12343 ((_ extract 31 0) (bvand (bvxor lt!262226 (bvlshr lt!262226 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53832 (bvmul (bvxor h!12343 (bvlshr h!12343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53832 (bvlshr x!53832 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363297 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363297 #b00000000000000000000000000000000))))))

(assert (=> d!85161 (= (toIndex!0 lt!262226 mask!3119) (bvand (bvxor lt!262437 (bvlshr lt!262437 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574171 d!85161))

(declare-fun d!85163 () Bool)

(declare-fun lt!262439 () (_ BitVec 32))

(declare-fun lt!262438 () (_ BitVec 32))

(assert (=> d!85163 (= lt!262439 (bvmul (bvxor lt!262438 (bvlshr lt!262438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85163 (= lt!262438 ((_ extract 31 0) (bvand (bvxor (select (arr!17229 a!3118) j!142) (bvlshr (select (arr!17229 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85163 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!363297 (let ((h!12343 ((_ extract 31 0) (bvand (bvxor (select (arr!17229 a!3118) j!142) (bvlshr (select (arr!17229 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53832 (bvmul (bvxor h!12343 (bvlshr h!12343 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53832 (bvlshr x!53832 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!363297 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!363297 #b00000000000000000000000000000000))))))

(assert (=> d!85163 (= (toIndex!0 (select (arr!17229 a!3118) j!142) mask!3119) (bvand (bvxor lt!262439 (bvlshr lt!262439 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!574171 d!85163))

(declare-fun e!330582 () SeekEntryResult!5678)

(declare-fun b!574587 () Bool)

(declare-fun lt!262440 () SeekEntryResult!5678)

(assert (=> b!574587 (= e!330582 (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262440) (index!24941 lt!262440) (index!24941 lt!262440) k!1914 a!3118 mask!3119))))

(declare-fun d!85165 () Bool)

(declare-fun lt!262441 () SeekEntryResult!5678)

(assert (=> d!85165 (and (or (is-Undefined!5678 lt!262441) (not (is-Found!5678 lt!262441)) (and (bvsge (index!24940 lt!262441) #b00000000000000000000000000000000) (bvslt (index!24940 lt!262441) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262441) (is-Found!5678 lt!262441) (not (is-MissingZero!5678 lt!262441)) (and (bvsge (index!24939 lt!262441) #b00000000000000000000000000000000) (bvslt (index!24939 lt!262441) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262441) (is-Found!5678 lt!262441) (is-MissingZero!5678 lt!262441) (not (is-MissingVacant!5678 lt!262441)) (and (bvsge (index!24942 lt!262441) #b00000000000000000000000000000000) (bvslt (index!24942 lt!262441) (size!17593 a!3118)))) (or (is-Undefined!5678 lt!262441) (ite (is-Found!5678 lt!262441) (= (select (arr!17229 a!3118) (index!24940 lt!262441)) k!1914) (ite (is-MissingZero!5678 lt!262441) (= (select (arr!17229 a!3118) (index!24939 lt!262441)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5678 lt!262441) (= (select (arr!17229 a!3118) (index!24942 lt!262441)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330584 () SeekEntryResult!5678)

(assert (=> d!85165 (= lt!262441 e!330584)))

(declare-fun c!66006 () Bool)

(assert (=> d!85165 (= c!66006 (and (is-Intermediate!5678 lt!262440) (undefined!6490 lt!262440)))))

(assert (=> d!85165 (= lt!262440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!85165 (validMask!0 mask!3119)))

(assert (=> d!85165 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!262441)))

(declare-fun b!574588 () Bool)

(assert (=> b!574588 (= e!330584 Undefined!5678)))

(declare-fun b!574589 () Bool)

(declare-fun e!330583 () SeekEntryResult!5678)

(assert (=> b!574589 (= e!330584 e!330583)))

(declare-fun lt!262442 () (_ BitVec 64))

(assert (=> b!574589 (= lt!262442 (select (arr!17229 a!3118) (index!24941 lt!262440)))))

(declare-fun c!66005 () Bool)

(assert (=> b!574589 (= c!66005 (= lt!262442 k!1914))))

(declare-fun b!574590 () Bool)

(assert (=> b!574590 (= e!330583 (Found!5678 (index!24941 lt!262440)))))

(declare-fun b!574591 () Bool)

(declare-fun c!66004 () Bool)

(assert (=> b!574591 (= c!66004 (= lt!262442 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574591 (= e!330583 e!330582)))

(declare-fun b!574592 () Bool)

(assert (=> b!574592 (= e!330582 (MissingZero!5678 (index!24941 lt!262440)))))

(assert (= (and d!85165 c!66006) b!574588))

(assert (= (and d!85165 (not c!66006)) b!574589))

(assert (= (and b!574589 c!66005) b!574590))

(assert (= (and b!574589 (not c!66005)) b!574591))

(assert (= (and b!574591 c!66004) b!574592))

(assert (= (and b!574591 (not c!66004)) b!574587))

(declare-fun m!553443 () Bool)

(assert (=> b!574587 m!553443))

(declare-fun m!553445 () Bool)

(assert (=> d!85165 m!553445))

(declare-fun m!553447 () Bool)

(assert (=> d!85165 m!553447))

(declare-fun m!553449 () Bool)

(assert (=> d!85165 m!553449))

(declare-fun m!553451 () Bool)

(assert (=> d!85165 m!553451))

(declare-fun m!553453 () Bool)

(assert (=> d!85165 m!553453))

(assert (=> d!85165 m!553447))

(assert (=> d!85165 m!553089))

(declare-fun m!553457 () Bool)

(assert (=> b!574589 m!553457))

(assert (=> b!574166 d!85165))

(declare-fun d!85167 () Bool)

(declare-fun res!363315 () Bool)

(declare-fun e!330602 () Bool)

(assert (=> d!85167 (=> res!363315 e!330602)))

(assert (=> d!85167 (= res!363315 (bvsge #b00000000000000000000000000000000 (size!17593 a!3118)))))

(assert (=> d!85167 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11306) e!330602)))

(declare-fun b!574612 () Bool)

(declare-fun e!330603 () Bool)

(declare-fun contains!2890 (List!11309 (_ BitVec 64)) Bool)

(assert (=> b!574612 (= e!330603 (contains!2890 Nil!11306 (select (arr!17229 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574613 () Bool)

(declare-fun e!330601 () Bool)

(declare-fun call!32687 () Bool)

(assert (=> b!574613 (= e!330601 call!32687)))

(declare-fun b!574614 () Bool)

(declare-fun e!330600 () Bool)

(assert (=> b!574614 (= e!330600 e!330601)))

(declare-fun c!66011 () Bool)

(assert (=> b!574614 (= c!66011 (validKeyInArray!0 (select (arr!17229 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574615 () Bool)

(assert (=> b!574615 (= e!330602 e!330600)))

(declare-fun res!363316 () Bool)

(assert (=> b!574615 (=> (not res!363316) (not e!330600))))

(assert (=> b!574615 (= res!363316 (not e!330603))))

(declare-fun res!363317 () Bool)

(assert (=> b!574615 (=> (not res!363317) (not e!330603))))

(assert (=> b!574615 (= res!363317 (validKeyInArray!0 (select (arr!17229 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!574616 () Bool)

(assert (=> b!574616 (= e!330601 call!32687)))

(declare-fun bm!32684 () Bool)

(assert (=> bm!32684 (= call!32687 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66011 (Cons!11305 (select (arr!17229 a!3118) #b00000000000000000000000000000000) Nil!11306) Nil!11306)))))

(assert (= (and d!85167 (not res!363315)) b!574615))

(assert (= (and b!574615 res!363317) b!574612))

(assert (= (and b!574615 res!363316) b!574614))

(assert (= (and b!574614 c!66011) b!574616))

(assert (= (and b!574614 (not c!66011)) b!574613))

(assert (= (or b!574616 b!574613) bm!32684))

(assert (=> b!574612 m!553363))

(assert (=> b!574612 m!553363))

(declare-fun m!553471 () Bool)

(assert (=> b!574612 m!553471))

(assert (=> b!574614 m!553363))

(assert (=> b!574614 m!553363))

(assert (=> b!574614 m!553373))

(assert (=> b!574615 m!553363))

(assert (=> b!574615 m!553363))

(assert (=> b!574615 m!553373))

(assert (=> bm!32684 m!553363))

(declare-fun m!553473 () Bool)

(assert (=> bm!32684 m!553473))

(assert (=> b!574168 d!85167))

(declare-fun d!85173 () Bool)

(declare-fun res!363322 () Bool)

(declare-fun e!330608 () Bool)

(assert (=> d!85173 (=> res!363322 e!330608)))

(assert (=> d!85173 (= res!363322 (= (select (arr!17229 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85173 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!330608)))

(declare-fun b!574621 () Bool)

(declare-fun e!330609 () Bool)

(assert (=> b!574621 (= e!330608 e!330609)))

(declare-fun res!363323 () Bool)

(assert (=> b!574621 (=> (not res!363323) (not e!330609))))

(assert (=> b!574621 (= res!363323 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17593 a!3118)))))

(declare-fun b!574622 () Bool)

(assert (=> b!574622 (= e!330609 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85173 (not res!363322)) b!574621))

(assert (= (and b!574621 res!363323) b!574622))

(assert (=> d!85173 m!553363))

(declare-fun m!553475 () Bool)

(assert (=> b!574622 m!553475))

(assert (=> b!574164 d!85173))

(declare-fun lt!262446 () SeekEntryResult!5678)

(declare-fun e!330610 () SeekEntryResult!5678)

(declare-fun b!574623 () Bool)

(assert (=> b!574623 (= e!330610 (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262446) (index!24941 lt!262446) (index!24941 lt!262446) lt!262226 lt!262231 mask!3119))))

(declare-fun d!85175 () Bool)

(declare-fun lt!262447 () SeekEntryResult!5678)

(assert (=> d!85175 (and (or (is-Undefined!5678 lt!262447) (not (is-Found!5678 lt!262447)) (and (bvsge (index!24940 lt!262447) #b00000000000000000000000000000000) (bvslt (index!24940 lt!262447) (size!17593 lt!262231)))) (or (is-Undefined!5678 lt!262447) (is-Found!5678 lt!262447) (not (is-MissingZero!5678 lt!262447)) (and (bvsge (index!24939 lt!262447) #b00000000000000000000000000000000) (bvslt (index!24939 lt!262447) (size!17593 lt!262231)))) (or (is-Undefined!5678 lt!262447) (is-Found!5678 lt!262447) (is-MissingZero!5678 lt!262447) (not (is-MissingVacant!5678 lt!262447)) (and (bvsge (index!24942 lt!262447) #b00000000000000000000000000000000) (bvslt (index!24942 lt!262447) (size!17593 lt!262231)))) (or (is-Undefined!5678 lt!262447) (ite (is-Found!5678 lt!262447) (= (select (arr!17229 lt!262231) (index!24940 lt!262447)) lt!262226) (ite (is-MissingZero!5678 lt!262447) (= (select (arr!17229 lt!262231) (index!24939 lt!262447)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5678 lt!262447) (= (select (arr!17229 lt!262231) (index!24942 lt!262447)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!330612 () SeekEntryResult!5678)

(assert (=> d!85175 (= lt!262447 e!330612)))

(declare-fun c!66014 () Bool)

(assert (=> d!85175 (= c!66014 (and (is-Intermediate!5678 lt!262446) (undefined!6490 lt!262446)))))

(assert (=> d!85175 (= lt!262446 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!262226 mask!3119) lt!262226 lt!262231 mask!3119))))

(assert (=> d!85175 (validMask!0 mask!3119)))

(assert (=> d!85175 (= (seekEntryOrOpen!0 lt!262226 lt!262231 mask!3119) lt!262447)))

(declare-fun b!574624 () Bool)

(assert (=> b!574624 (= e!330612 Undefined!5678)))

(declare-fun b!574625 () Bool)

(declare-fun e!330611 () SeekEntryResult!5678)

(assert (=> b!574625 (= e!330612 e!330611)))

(declare-fun lt!262448 () (_ BitVec 64))

(assert (=> b!574625 (= lt!262448 (select (arr!17229 lt!262231) (index!24941 lt!262446)))))

(declare-fun c!66013 () Bool)

(assert (=> b!574625 (= c!66013 (= lt!262448 lt!262226))))

(declare-fun b!574626 () Bool)

(assert (=> b!574626 (= e!330611 (Found!5678 (index!24941 lt!262446)))))

(declare-fun b!574627 () Bool)

(declare-fun c!66012 () Bool)

(assert (=> b!574627 (= c!66012 (= lt!262448 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!574627 (= e!330611 e!330610)))

(declare-fun b!574628 () Bool)

(assert (=> b!574628 (= e!330610 (MissingZero!5678 (index!24941 lt!262446)))))

(assert (= (and d!85175 c!66014) b!574624))

(assert (= (and d!85175 (not c!66014)) b!574625))

(assert (= (and b!574625 c!66013) b!574626))

(assert (= (and b!574625 (not c!66013)) b!574627))

(assert (= (and b!574627 c!66012) b!574628))

(assert (= (and b!574627 (not c!66012)) b!574623))

(declare-fun m!553477 () Bool)

(assert (=> b!574623 m!553477))

(declare-fun m!553479 () Bool)

(assert (=> d!85175 m!553479))

(assert (=> d!85175 m!553105))

(declare-fun m!553481 () Bool)

(assert (=> d!85175 m!553481))

(declare-fun m!553483 () Bool)

(assert (=> d!85175 m!553483))

(declare-fun m!553485 () Bool)

(assert (=> d!85175 m!553485))

(assert (=> d!85175 m!553105))

(assert (=> d!85175 m!553089))

(declare-fun m!553487 () Bool)

(assert (=> b!574625 m!553487))

(assert (=> b!574165 d!85175))

(declare-fun lt!262449 () SeekEntryResult!5678)

(declare-fun d!85177 () Bool)

(assert (=> d!85177 (and (or (is-Undefined!5678 lt!262449) (not (is-Found!5678 lt!262449)) (and (bvsge (index!24940 lt!262449) #b00000000000000000000000000000000) (bvslt (index!24940 lt!262449) (size!17593 lt!262231)))) (or (is-Undefined!5678 lt!262449) (is-Found!5678 lt!262449) (not (is-MissingVacant!5678 lt!262449)) (not (= (index!24942 lt!262449) (index!24941 lt!262228))) (and (bvsge (index!24942 lt!262449) #b00000000000000000000000000000000) (bvslt (index!24942 lt!262449) (size!17593 lt!262231)))) (or (is-Undefined!5678 lt!262449) (ite (is-Found!5678 lt!262449) (= (select (arr!17229 lt!262231) (index!24940 lt!262449)) lt!262226) (and (is-MissingVacant!5678 lt!262449) (= (index!24942 lt!262449) (index!24941 lt!262228)) (= (select (arr!17229 lt!262231) (index!24942 lt!262449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!330614 () SeekEntryResult!5678)

(assert (=> d!85177 (= lt!262449 e!330614)))

(declare-fun c!66016 () Bool)

(assert (=> d!85177 (= c!66016 (bvsge (x!53821 lt!262228) #b01111111111111111111111111111110))))

(declare-fun lt!262450 () (_ BitVec 64))

(assert (=> d!85177 (= lt!262450 (select (arr!17229 lt!262231) (index!24941 lt!262228)))))

(assert (=> d!85177 (validMask!0 mask!3119)))

(assert (=> d!85177 (= (seekKeyOrZeroReturnVacant!0 (x!53821 lt!262228) (index!24941 lt!262228) (index!24941 lt!262228) lt!262226 lt!262231 mask!3119) lt!262449)))

(declare-fun b!574629 () Bool)

(declare-fun c!66017 () Bool)

(assert (=> b!574629 (= c!66017 (= lt!262450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330613 () SeekEntryResult!5678)

(declare-fun e!330615 () SeekEntryResult!5678)

(assert (=> b!574629 (= e!330613 e!330615)))

(declare-fun b!574630 () Bool)

(assert (=> b!574630 (= e!330615 (MissingVacant!5678 (index!24941 lt!262228)))))

(declare-fun b!574631 () Bool)

(assert (=> b!574631 (= e!330615 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53821 lt!262228) #b00000000000000000000000000000001) (nextIndex!0 (index!24941 lt!262228) (x!53821 lt!262228) mask!3119) (index!24941 lt!262228) lt!262226 lt!262231 mask!3119))))

(declare-fun b!574632 () Bool)

(assert (=> b!574632 (= e!330614 Undefined!5678)))

(declare-fun b!574633 () Bool)

(assert (=> b!574633 (= e!330614 e!330613)))

(declare-fun c!66015 () Bool)

(assert (=> b!574633 (= c!66015 (= lt!262450 lt!262226))))

(declare-fun b!574634 () Bool)

(assert (=> b!574634 (= e!330613 (Found!5678 (index!24941 lt!262228)))))

(assert (= (and d!85177 c!66016) b!574632))

(assert (= (and d!85177 (not c!66016)) b!574633))

(assert (= (and b!574633 c!66015) b!574634))

(assert (= (and b!574633 (not c!66015)) b!574629))

(assert (= (and b!574629 c!66017) b!574630))

(assert (= (and b!574629 (not c!66017)) b!574631))

(declare-fun m!553489 () Bool)

(assert (=> d!85177 m!553489))

(declare-fun m!553491 () Bool)

(assert (=> d!85177 m!553491))

(declare-fun m!553493 () Bool)

(assert (=> d!85177 m!553493))

(assert (=> d!85177 m!553089))

(assert (=> b!574631 m!553257))

(assert (=> b!574631 m!553257))

(declare-fun m!553495 () Bool)

(assert (=> b!574631 m!553495))

(assert (=> b!574165 d!85177))

(push 1)

