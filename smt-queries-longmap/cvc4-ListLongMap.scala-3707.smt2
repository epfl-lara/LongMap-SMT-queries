; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50922 () Bool)

(assert start!50922)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!320885 () Bool)

(declare-datatypes ((SeekEntryResult!5302 0))(
  ( (MissingZero!5302 (index!23435 (_ BitVec 32))) (Found!5302 (index!23436 (_ BitVec 32))) (Intermediate!5302 (undefined!6114 Bool) (index!23437 (_ BitVec 32)) (x!52326 (_ BitVec 32))) (Undefined!5302) (MissingVacant!5302 (index!23438 (_ BitVec 32))) )
))
(declare-fun lt!253122 () SeekEntryResult!5302)

(declare-fun b!557000 () Bool)

(declare-datatypes ((array!35090 0))(
  ( (array!35091 (arr!16853 (Array (_ BitVec 32) (_ BitVec 64))) (size!17217 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35090)

(assert (=> b!557000 (= e!320885 (not (or (not (is-Intermediate!5302 lt!253122)) (undefined!6114 lt!253122) (= (select (arr!16853 a!3118) (index!23437 lt!253122)) (select (arr!16853 a!3118) j!142)) (= (select (arr!16853 a!3118) (index!23437 lt!253122)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23437 lt!253122) #b00000000000000000000000000000000) (bvsge (index!23437 lt!253122) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52326 lt!253122) #b01111111111111111111111111111110) (bvsge (x!52326 lt!253122) #b00000000000000000000000000000000)))))))

(declare-fun e!320887 () Bool)

(assert (=> b!557000 e!320887))

(declare-fun res!349234 () Bool)

(assert (=> b!557000 (=> (not res!349234) (not e!320887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35090 (_ BitVec 32)) Bool)

(assert (=> b!557000 (= res!349234 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17378 0))(
  ( (Unit!17379) )
))
(declare-fun lt!253123 () Unit!17378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17378)

(assert (=> b!557000 (= lt!253123 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557001 () Bool)

(declare-fun e!320888 () Bool)

(declare-fun e!320889 () Bool)

(assert (=> b!557001 (= e!320888 e!320889)))

(declare-fun res!349235 () Bool)

(assert (=> b!557001 (=> (not res!349235) (not e!320889))))

(declare-fun lt!253125 () SeekEntryResult!5302)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557001 (= res!349235 (or (= lt!253125 (MissingZero!5302 i!1132)) (= lt!253125 (MissingVacant!5302 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35090 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557001 (= lt!253125 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557002 () Bool)

(declare-fun res!349236 () Bool)

(assert (=> b!557002 (=> (not res!349236) (not e!320889))))

(assert (=> b!557002 (= res!349236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557004 () Bool)

(assert (=> b!557004 (= e!320889 e!320885)))

(declare-fun res!349238 () Bool)

(assert (=> b!557004 (=> (not res!349238) (not e!320885))))

(declare-fun lt!253126 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35090 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557004 (= res!349238 (= lt!253122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253126 (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)) mask!3119)))))

(declare-fun lt!253124 () (_ BitVec 32))

(assert (=> b!557004 (= lt!253122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253124 (select (arr!16853 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557004 (= lt!253126 (toIndex!0 (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557004 (= lt!253124 (toIndex!0 (select (arr!16853 a!3118) j!142) mask!3119))))

(declare-fun b!557005 () Bool)

(declare-fun res!349237 () Bool)

(assert (=> b!557005 (=> (not res!349237) (not e!320888))))

(declare-fun arrayContainsKey!0 (array!35090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557005 (= res!349237 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557006 () Bool)

(declare-fun res!349232 () Bool)

(assert (=> b!557006 (=> (not res!349232) (not e!320889))))

(declare-datatypes ((List!10933 0))(
  ( (Nil!10930) (Cons!10929 (h!11917 (_ BitVec 64)) (t!17161 List!10933)) )
))
(declare-fun arrayNoDuplicates!0 (array!35090 (_ BitVec 32) List!10933) Bool)

(assert (=> b!557006 (= res!349232 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10930))))

(declare-fun b!557007 () Bool)

(declare-fun res!349231 () Bool)

(assert (=> b!557007 (=> (not res!349231) (not e!320888))))

(assert (=> b!557007 (= res!349231 (and (= (size!17217 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17217 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17217 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557008 () Bool)

(declare-fun res!349233 () Bool)

(assert (=> b!557008 (=> (not res!349233) (not e!320888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557008 (= res!349233 (validKeyInArray!0 (select (arr!16853 a!3118) j!142)))))

(declare-fun b!557009 () Bool)

(assert (=> b!557009 (= e!320887 (= (seekEntryOrOpen!0 (select (arr!16853 a!3118) j!142) a!3118 mask!3119) (Found!5302 j!142)))))

(declare-fun b!557003 () Bool)

(declare-fun res!349230 () Bool)

(assert (=> b!557003 (=> (not res!349230) (not e!320888))))

(assert (=> b!557003 (= res!349230 (validKeyInArray!0 k!1914))))

(declare-fun res!349229 () Bool)

(assert (=> start!50922 (=> (not res!349229) (not e!320888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50922 (= res!349229 (validMask!0 mask!3119))))

(assert (=> start!50922 e!320888))

(assert (=> start!50922 true))

(declare-fun array_inv!12649 (array!35090) Bool)

(assert (=> start!50922 (array_inv!12649 a!3118)))

(assert (= (and start!50922 res!349229) b!557007))

(assert (= (and b!557007 res!349231) b!557008))

(assert (= (and b!557008 res!349233) b!557003))

(assert (= (and b!557003 res!349230) b!557005))

(assert (= (and b!557005 res!349237) b!557001))

(assert (= (and b!557001 res!349235) b!557002))

(assert (= (and b!557002 res!349236) b!557006))

(assert (= (and b!557006 res!349232) b!557004))

(assert (= (and b!557004 res!349238) b!557000))

(assert (= (and b!557000 res!349234) b!557009))

(declare-fun m!534973 () Bool)

(assert (=> b!557003 m!534973))

(declare-fun m!534975 () Bool)

(assert (=> b!557006 m!534975))

(declare-fun m!534977 () Bool)

(assert (=> b!557002 m!534977))

(declare-fun m!534979 () Bool)

(assert (=> b!557008 m!534979))

(assert (=> b!557008 m!534979))

(declare-fun m!534981 () Bool)

(assert (=> b!557008 m!534981))

(declare-fun m!534983 () Bool)

(assert (=> b!557005 m!534983))

(assert (=> b!557004 m!534979))

(declare-fun m!534985 () Bool)

(assert (=> b!557004 m!534985))

(assert (=> b!557004 m!534979))

(declare-fun m!534987 () Bool)

(assert (=> b!557004 m!534987))

(declare-fun m!534989 () Bool)

(assert (=> b!557004 m!534989))

(assert (=> b!557004 m!534987))

(assert (=> b!557004 m!534979))

(declare-fun m!534991 () Bool)

(assert (=> b!557004 m!534991))

(declare-fun m!534993 () Bool)

(assert (=> b!557004 m!534993))

(assert (=> b!557004 m!534987))

(declare-fun m!534995 () Bool)

(assert (=> b!557004 m!534995))

(declare-fun m!534997 () Bool)

(assert (=> b!557001 m!534997))

(assert (=> b!557009 m!534979))

(assert (=> b!557009 m!534979))

(declare-fun m!534999 () Bool)

(assert (=> b!557009 m!534999))

(declare-fun m!535001 () Bool)

(assert (=> b!557000 m!535001))

(assert (=> b!557000 m!534979))

(declare-fun m!535003 () Bool)

(assert (=> b!557000 m!535003))

(declare-fun m!535005 () Bool)

(assert (=> b!557000 m!535005))

(declare-fun m!535007 () Bool)

(assert (=> start!50922 m!535007))

(declare-fun m!535009 () Bool)

(assert (=> start!50922 m!535009))

(push 1)

(assert (not start!50922))

(assert (not b!557006))

(assert (not b!557002))

(assert (not b!557008))

(assert (not b!557000))

(assert (not b!557003))

(assert (not b!557004))

(assert (not b!557001))

(assert (not b!557009))

(assert (not b!557005))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!557076 () Bool)

(declare-fun e!320933 () Bool)

(declare-fun e!320934 () Bool)

(assert (=> b!557076 (= e!320933 e!320934)))

(declare-fun c!64243 () Bool)

(assert (=> b!557076 (= c!64243 (validKeyInArray!0 (select (arr!16853 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83391 () Bool)

(declare-fun res!349269 () Bool)

(assert (=> d!83391 (=> res!349269 e!320933)))

(assert (=> d!83391 (= res!349269 (bvsge #b00000000000000000000000000000000 (size!17217 a!3118)))))

(assert (=> d!83391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320933)))

(declare-fun bm!32356 () Bool)

(declare-fun call!32359 () Bool)

(assert (=> bm!32356 (= call!32359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557077 () Bool)

(assert (=> b!557077 (= e!320934 call!32359)))

(declare-fun b!557078 () Bool)

(declare-fun e!320935 () Bool)

(assert (=> b!557078 (= e!320934 e!320935)))

(declare-fun lt!253158 () (_ BitVec 64))

(assert (=> b!557078 (= lt!253158 (select (arr!16853 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253159 () Unit!17378)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35090 (_ BitVec 64) (_ BitVec 32)) Unit!17378)

(assert (=> b!557078 (= lt!253159 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253158 #b00000000000000000000000000000000))))

(assert (=> b!557078 (arrayContainsKey!0 a!3118 lt!253158 #b00000000000000000000000000000000)))

(declare-fun lt!253160 () Unit!17378)

(assert (=> b!557078 (= lt!253160 lt!253159)))

(declare-fun res!349268 () Bool)

(assert (=> b!557078 (= res!349268 (= (seekEntryOrOpen!0 (select (arr!16853 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5302 #b00000000000000000000000000000000)))))

(assert (=> b!557078 (=> (not res!349268) (not e!320935))))

(declare-fun b!557079 () Bool)

(assert (=> b!557079 (= e!320935 call!32359)))

(assert (= (and d!83391 (not res!349269)) b!557076))

(assert (= (and b!557076 c!64243) b!557078))

(assert (= (and b!557076 (not c!64243)) b!557077))

(assert (= (and b!557078 res!349268) b!557079))

(assert (= (or b!557079 b!557077) bm!32356))

(declare-fun m!535039 () Bool)

(assert (=> b!557076 m!535039))

(assert (=> b!557076 m!535039))

(declare-fun m!535041 () Bool)

(assert (=> b!557076 m!535041))

(declare-fun m!535043 () Bool)

(assert (=> bm!32356 m!535043))

(assert (=> b!557078 m!535039))

(declare-fun m!535045 () Bool)

(assert (=> b!557078 m!535045))

(declare-fun m!535047 () Bool)

(assert (=> b!557078 m!535047))

(assert (=> b!557078 m!535039))

(declare-fun m!535049 () Bool)

(assert (=> b!557078 m!535049))

(assert (=> b!557002 d!83391))

(declare-fun b!557117 () Bool)

(declare-fun e!320962 () SeekEntryResult!5302)

(declare-fun lt!253186 () SeekEntryResult!5302)

(assert (=> b!557117 (= e!320962 (MissingZero!5302 (index!23437 lt!253186)))))

(declare-fun b!557118 () Bool)

(declare-fun e!320961 () SeekEntryResult!5302)

(assert (=> b!557118 (= e!320961 Undefined!5302)))

(declare-fun b!557119 () Bool)

(declare-fun c!64257 () Bool)

(declare-fun lt!253187 () (_ BitVec 64))

(assert (=> b!557119 (= c!64257 (= lt!253187 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!320963 () SeekEntryResult!5302)

(assert (=> b!557119 (= e!320963 e!320962)))

(declare-fun b!557120 () Bool)

(assert (=> b!557120 (= e!320961 e!320963)))

(assert (=> b!557120 (= lt!253187 (select (arr!16853 a!3118) (index!23437 lt!253186)))))

(declare-fun c!64256 () Bool)

(assert (=> b!557120 (= c!64256 (= lt!253187 k!1914))))

(declare-fun b!557122 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35090 (_ BitVec 32)) SeekEntryResult!5302)

(assert (=> b!557122 (= e!320962 (seekKeyOrZeroReturnVacant!0 (x!52326 lt!253186) (index!23437 lt!253186) (index!23437 lt!253186) k!1914 a!3118 mask!3119))))

(declare-fun d!83397 () Bool)

(declare-fun lt!253185 () SeekEntryResult!5302)

(assert (=> d!83397 (and (or (is-Undefined!5302 lt!253185) (not (is-Found!5302 lt!253185)) (and (bvsge (index!23436 lt!253185) #b00000000000000000000000000000000) (bvslt (index!23436 lt!253185) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253185) (is-Found!5302 lt!253185) (not (is-MissingZero!5302 lt!253185)) (and (bvsge (index!23435 lt!253185) #b00000000000000000000000000000000) (bvslt (index!23435 lt!253185) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253185) (is-Found!5302 lt!253185) (is-MissingZero!5302 lt!253185) (not (is-MissingVacant!5302 lt!253185)) (and (bvsge (index!23438 lt!253185) #b00000000000000000000000000000000) (bvslt (index!23438 lt!253185) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253185) (ite (is-Found!5302 lt!253185) (= (select (arr!16853 a!3118) (index!23436 lt!253185)) k!1914) (ite (is-MissingZero!5302 lt!253185) (= (select (arr!16853 a!3118) (index!23435 lt!253185)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5302 lt!253185) (= (select (arr!16853 a!3118) (index!23438 lt!253185)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83397 (= lt!253185 e!320961)))

(declare-fun c!64258 () Bool)

(assert (=> d!83397 (= c!64258 (and (is-Intermediate!5302 lt!253186) (undefined!6114 lt!253186)))))

(assert (=> d!83397 (= lt!253186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83397 (validMask!0 mask!3119)))

(assert (=> d!83397 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253185)))

(declare-fun b!557121 () Bool)

(assert (=> b!557121 (= e!320963 (Found!5302 (index!23437 lt!253186)))))

(assert (= (and d!83397 c!64258) b!557118))

(assert (= (and d!83397 (not c!64258)) b!557120))

(assert (= (and b!557120 c!64256) b!557121))

(assert (= (and b!557120 (not c!64256)) b!557119))

(assert (= (and b!557119 c!64257) b!557117))

(assert (= (and b!557119 (not c!64257)) b!557122))

(declare-fun m!535081 () Bool)

(assert (=> b!557120 m!535081))

(declare-fun m!535083 () Bool)

(assert (=> b!557122 m!535083))

(declare-fun m!535085 () Bool)

(assert (=> d!83397 m!535085))

(declare-fun m!535087 () Bool)

(assert (=> d!83397 m!535087))

(assert (=> d!83397 m!535085))

(assert (=> d!83397 m!535007))

(declare-fun m!535089 () Bool)

(assert (=> d!83397 m!535089))

(declare-fun m!535091 () Bool)

(assert (=> d!83397 m!535091))

(declare-fun m!535093 () Bool)

(assert (=> d!83397 m!535093))

(assert (=> b!557001 d!83397))

(declare-fun b!557133 () Bool)

(declare-fun e!320973 () Bool)

(declare-fun e!320975 () Bool)

(assert (=> b!557133 (= e!320973 e!320975)))

(declare-fun c!64261 () Bool)

(assert (=> b!557133 (= c!64261 (validKeyInArray!0 (select (arr!16853 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83415 () Bool)

(declare-fun res!349290 () Bool)

(declare-fun e!320972 () Bool)

(assert (=> d!83415 (=> res!349290 e!320972)))

(assert (=> d!83415 (= res!349290 (bvsge #b00000000000000000000000000000000 (size!17217 a!3118)))))

(assert (=> d!83415 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10930) e!320972)))

(declare-fun b!557134 () Bool)

(assert (=> b!557134 (= e!320972 e!320973)))

(declare-fun res!349291 () Bool)

(assert (=> b!557134 (=> (not res!349291) (not e!320973))))

(declare-fun e!320974 () Bool)

(assert (=> b!557134 (= res!349291 (not e!320974))))

(declare-fun res!349289 () Bool)

(assert (=> b!557134 (=> (not res!349289) (not e!320974))))

(assert (=> b!557134 (= res!349289 (validKeyInArray!0 (select (arr!16853 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557135 () Bool)

(declare-fun contains!2848 (List!10933 (_ BitVec 64)) Bool)

(assert (=> b!557135 (= e!320974 (contains!2848 Nil!10930 (select (arr!16853 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557136 () Bool)

(declare-fun call!32368 () Bool)

(assert (=> b!557136 (= e!320975 call!32368)))

(declare-fun bm!32365 () Bool)

(assert (=> bm!32365 (= call!32368 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64261 (Cons!10929 (select (arr!16853 a!3118) #b00000000000000000000000000000000) Nil!10930) Nil!10930)))))

(declare-fun b!557137 () Bool)

(assert (=> b!557137 (= e!320975 call!32368)))

(assert (= (and d!83415 (not res!349290)) b!557134))

(assert (= (and b!557134 res!349289) b!557135))

(assert (= (and b!557134 res!349291) b!557133))

(assert (= (and b!557133 c!64261) b!557136))

(assert (= (and b!557133 (not c!64261)) b!557137))

(assert (= (or b!557136 b!557137) bm!32365))

(assert (=> b!557133 m!535039))

(assert (=> b!557133 m!535039))

(assert (=> b!557133 m!535041))

(assert (=> b!557134 m!535039))

(assert (=> b!557134 m!535039))

(assert (=> b!557134 m!535041))

(assert (=> b!557135 m!535039))

(assert (=> b!557135 m!535039))

(declare-fun m!535097 () Bool)

(assert (=> b!557135 m!535097))

(assert (=> bm!32365 m!535039))

(declare-fun m!535099 () Bool)

(assert (=> bm!32365 m!535099))

(assert (=> b!557006 d!83415))

(declare-fun b!557138 () Bool)

(declare-fun e!320976 () Bool)

(declare-fun e!320977 () Bool)

(assert (=> b!557138 (= e!320976 e!320977)))

(declare-fun c!64262 () Bool)

(assert (=> b!557138 (= c!64262 (validKeyInArray!0 (select (arr!16853 a!3118) j!142)))))

(declare-fun d!83419 () Bool)

(declare-fun res!349293 () Bool)

(assert (=> d!83419 (=> res!349293 e!320976)))

(assert (=> d!83419 (= res!349293 (bvsge j!142 (size!17217 a!3118)))))

(assert (=> d!83419 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320976)))

(declare-fun bm!32366 () Bool)

(declare-fun call!32369 () Bool)

(assert (=> bm!32366 (= call!32369 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557139 () Bool)

(assert (=> b!557139 (= e!320977 call!32369)))

(declare-fun b!557140 () Bool)

(declare-fun e!320978 () Bool)

(assert (=> b!557140 (= e!320977 e!320978)))

(declare-fun lt!253191 () (_ BitVec 64))

(assert (=> b!557140 (= lt!253191 (select (arr!16853 a!3118) j!142))))

(declare-fun lt!253192 () Unit!17378)

(assert (=> b!557140 (= lt!253192 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253191 j!142))))

(assert (=> b!557140 (arrayContainsKey!0 a!3118 lt!253191 #b00000000000000000000000000000000)))

(declare-fun lt!253193 () Unit!17378)

(assert (=> b!557140 (= lt!253193 lt!253192)))

(declare-fun res!349292 () Bool)

(assert (=> b!557140 (= res!349292 (= (seekEntryOrOpen!0 (select (arr!16853 a!3118) j!142) a!3118 mask!3119) (Found!5302 j!142)))))

(assert (=> b!557140 (=> (not res!349292) (not e!320978))))

(declare-fun b!557141 () Bool)

(assert (=> b!557141 (= e!320978 call!32369)))

(assert (= (and d!83419 (not res!349293)) b!557138))

(assert (= (and b!557138 c!64262) b!557140))

(assert (= (and b!557138 (not c!64262)) b!557139))

(assert (= (and b!557140 res!349292) b!557141))

(assert (= (or b!557141 b!557139) bm!32366))

(assert (=> b!557138 m!534979))

(assert (=> b!557138 m!534979))

(assert (=> b!557138 m!534981))

(declare-fun m!535101 () Bool)

(assert (=> bm!32366 m!535101))

(assert (=> b!557140 m!534979))

(declare-fun m!535103 () Bool)

(assert (=> b!557140 m!535103))

(declare-fun m!535105 () Bool)

(assert (=> b!557140 m!535105))

(assert (=> b!557140 m!534979))

(assert (=> b!557140 m!534999))

(assert (=> b!557000 d!83419))

(declare-fun d!83421 () Bool)

(assert (=> d!83421 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253196 () Unit!17378)

(declare-fun choose!38 (array!35090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17378)

(assert (=> d!83421 (= lt!253196 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83421 (validMask!0 mask!3119)))

(assert (=> d!83421 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253196)))

(declare-fun bs!17349 () Bool)

(assert (= bs!17349 d!83421))

(assert (=> bs!17349 m!535003))

(declare-fun m!535107 () Bool)

(assert (=> bs!17349 m!535107))

(assert (=> bs!17349 m!535007))

(assert (=> b!557000 d!83421))

(declare-fun d!83423 () Bool)

(declare-fun res!349298 () Bool)

(declare-fun e!320983 () Bool)

(assert (=> d!83423 (=> res!349298 e!320983)))

(assert (=> d!83423 (= res!349298 (= (select (arr!16853 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83423 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!320983)))

(declare-fun b!557146 () Bool)

(declare-fun e!320984 () Bool)

(assert (=> b!557146 (= e!320983 e!320984)))

(declare-fun res!349299 () Bool)

(assert (=> b!557146 (=> (not res!349299) (not e!320984))))

(assert (=> b!557146 (= res!349299 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17217 a!3118)))))

(declare-fun b!557147 () Bool)

(assert (=> b!557147 (= e!320984 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83423 (not res!349298)) b!557146))

(assert (= (and b!557146 res!349299) b!557147))

(assert (=> d!83423 m!535039))

(declare-fun m!535109 () Bool)

(assert (=> b!557147 m!535109))

(assert (=> b!557005 d!83423))

(declare-fun d!83425 () Bool)

(assert (=> d!83425 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50922 d!83425))

(declare-fun d!83427 () Bool)

(assert (=> d!83427 (= (array_inv!12649 a!3118) (bvsge (size!17217 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50922 d!83427))

(declare-fun d!83429 () Bool)

(declare-fun e!321024 () Bool)

(assert (=> d!83429 e!321024))

(declare-fun c!64290 () Bool)

(declare-fun lt!253219 () SeekEntryResult!5302)

(assert (=> d!83429 (= c!64290 (and (is-Intermediate!5302 lt!253219) (undefined!6114 lt!253219)))))

(declare-fun e!321025 () SeekEntryResult!5302)

(assert (=> d!83429 (= lt!253219 e!321025)))

(declare-fun c!64291 () Bool)

(assert (=> d!83429 (= c!64291 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253218 () (_ BitVec 64))

(assert (=> d!83429 (= lt!253218 (select (arr!16853 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118))) lt!253126))))

(assert (=> d!83429 (validMask!0 mask!3119)))

(assert (=> d!83429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253126 (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)) mask!3119) lt!253219)))

(declare-fun b!557220 () Bool)

(assert (=> b!557220 (and (bvsge (index!23437 lt!253219) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253219) (size!17217 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)))))))

(declare-fun res!349319 () Bool)

(assert (=> b!557220 (= res!349319 (= (select (arr!16853 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118))) (index!23437 lt!253219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321026 () Bool)

(assert (=> b!557220 (=> res!349319 e!321026)))

(declare-fun b!557221 () Bool)

(assert (=> b!557221 (and (bvsge (index!23437 lt!253219) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253219) (size!17217 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)))))))

(assert (=> b!557221 (= e!321026 (= (select (arr!16853 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118))) (index!23437 lt!253219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557222 () Bool)

(declare-fun e!321027 () SeekEntryResult!5302)

(assert (=> b!557222 (= e!321027 (Intermediate!5302 false lt!253126 #b00000000000000000000000000000000))))

(declare-fun b!557223 () Bool)

(assert (=> b!557223 (= e!321025 (Intermediate!5302 true lt!253126 #b00000000000000000000000000000000))))

(declare-fun b!557224 () Bool)

(assert (=> b!557224 (= e!321025 e!321027)))

(declare-fun c!64292 () Bool)

(assert (=> b!557224 (= c!64292 (or (= lt!253218 (select (store (arr!16853 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253218 lt!253218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557225 () Bool)

(assert (=> b!557225 (= e!321024 (bvsge (x!52326 lt!253219) #b01111111111111111111111111111110))))

(declare-fun b!557226 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557226 (= e!321027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253126 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)) mask!3119))))

(declare-fun b!557227 () Bool)

(declare-fun e!321028 () Bool)

(assert (=> b!557227 (= e!321024 e!321028)))

(declare-fun res!349321 () Bool)

(assert (=> b!557227 (= res!349321 (and (is-Intermediate!5302 lt!253219) (not (undefined!6114 lt!253219)) (bvslt (x!52326 lt!253219) #b01111111111111111111111111111110) (bvsge (x!52326 lt!253219) #b00000000000000000000000000000000) (bvsge (x!52326 lt!253219) #b00000000000000000000000000000000)))))

(assert (=> b!557227 (=> (not res!349321) (not e!321028))))

(declare-fun b!557228 () Bool)

(assert (=> b!557228 (and (bvsge (index!23437 lt!253219) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253219) (size!17217 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118)))))))

(declare-fun res!349320 () Bool)

(assert (=> b!557228 (= res!349320 (= (select (arr!16853 (array!35091 (store (arr!16853 a!3118) i!1132 k!1914) (size!17217 a!3118))) (index!23437 lt!253219)) (select (store (arr!16853 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!557228 (=> res!349320 e!321026)))

(assert (=> b!557228 (= e!321028 e!321026)))

(assert (= (and d!83429 c!64291) b!557223))

(assert (= (and d!83429 (not c!64291)) b!557224))

(assert (= (and b!557224 c!64292) b!557222))

(assert (= (and b!557224 (not c!64292)) b!557226))

(assert (= (and d!83429 c!64290) b!557225))

(assert (= (and d!83429 (not c!64290)) b!557227))

(assert (= (and b!557227 res!349321) b!557228))

(assert (= (and b!557228 (not res!349320)) b!557220))

(assert (= (and b!557220 (not res!349319)) b!557221))

(declare-fun m!535141 () Bool)

(assert (=> b!557221 m!535141))

(declare-fun m!535143 () Bool)

(assert (=> b!557226 m!535143))

(assert (=> b!557226 m!535143))

(assert (=> b!557226 m!534987))

(declare-fun m!535145 () Bool)

(assert (=> b!557226 m!535145))

(assert (=> b!557220 m!535141))

(declare-fun m!535147 () Bool)

(assert (=> d!83429 m!535147))

(assert (=> d!83429 m!535007))

(assert (=> b!557228 m!535141))

(assert (=> b!557004 d!83429))

(declare-fun d!83439 () Bool)

(declare-fun e!321029 () Bool)

(assert (=> d!83439 e!321029))

(declare-fun c!64293 () Bool)

(declare-fun lt!253221 () SeekEntryResult!5302)

(assert (=> d!83439 (= c!64293 (and (is-Intermediate!5302 lt!253221) (undefined!6114 lt!253221)))))

(declare-fun e!321030 () SeekEntryResult!5302)

(assert (=> d!83439 (= lt!253221 e!321030)))

(declare-fun c!64294 () Bool)

(assert (=> d!83439 (= c!64294 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253220 () (_ BitVec 64))

(assert (=> d!83439 (= lt!253220 (select (arr!16853 a!3118) lt!253124))))

(assert (=> d!83439 (validMask!0 mask!3119)))

(assert (=> d!83439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253124 (select (arr!16853 a!3118) j!142) a!3118 mask!3119) lt!253221)))

(declare-fun b!557229 () Bool)

(assert (=> b!557229 (and (bvsge (index!23437 lt!253221) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253221) (size!17217 a!3118)))))

(declare-fun res!349322 () Bool)

(assert (=> b!557229 (= res!349322 (= (select (arr!16853 a!3118) (index!23437 lt!253221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321031 () Bool)

(assert (=> b!557229 (=> res!349322 e!321031)))

(declare-fun b!557230 () Bool)

(assert (=> b!557230 (and (bvsge (index!23437 lt!253221) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253221) (size!17217 a!3118)))))

(assert (=> b!557230 (= e!321031 (= (select (arr!16853 a!3118) (index!23437 lt!253221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557231 () Bool)

(declare-fun e!321032 () SeekEntryResult!5302)

(assert (=> b!557231 (= e!321032 (Intermediate!5302 false lt!253124 #b00000000000000000000000000000000))))

(declare-fun b!557232 () Bool)

(assert (=> b!557232 (= e!321030 (Intermediate!5302 true lt!253124 #b00000000000000000000000000000000))))

(declare-fun b!557233 () Bool)

(assert (=> b!557233 (= e!321030 e!321032)))

(declare-fun c!64295 () Bool)

(assert (=> b!557233 (= c!64295 (or (= lt!253220 (select (arr!16853 a!3118) j!142)) (= (bvadd lt!253220 lt!253220) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557234 () Bool)

(assert (=> b!557234 (= e!321029 (bvsge (x!52326 lt!253221) #b01111111111111111111111111111110))))

(declare-fun b!557235 () Bool)

(assert (=> b!557235 (= e!321032 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253124 #b00000000000000000000000000000000 mask!3119) (select (arr!16853 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557236 () Bool)

(declare-fun e!321033 () Bool)

(assert (=> b!557236 (= e!321029 e!321033)))

(declare-fun res!349324 () Bool)

(assert (=> b!557236 (= res!349324 (and (is-Intermediate!5302 lt!253221) (not (undefined!6114 lt!253221)) (bvslt (x!52326 lt!253221) #b01111111111111111111111111111110) (bvsge (x!52326 lt!253221) #b00000000000000000000000000000000) (bvsge (x!52326 lt!253221) #b00000000000000000000000000000000)))))

(assert (=> b!557236 (=> (not res!349324) (not e!321033))))

(declare-fun b!557237 () Bool)

(assert (=> b!557237 (and (bvsge (index!23437 lt!253221) #b00000000000000000000000000000000) (bvslt (index!23437 lt!253221) (size!17217 a!3118)))))

(declare-fun res!349323 () Bool)

(assert (=> b!557237 (= res!349323 (= (select (arr!16853 a!3118) (index!23437 lt!253221)) (select (arr!16853 a!3118) j!142)))))

(assert (=> b!557237 (=> res!349323 e!321031)))

(assert (=> b!557237 (= e!321033 e!321031)))

(assert (= (and d!83439 c!64294) b!557232))

(assert (= (and d!83439 (not c!64294)) b!557233))

(assert (= (and b!557233 c!64295) b!557231))

(assert (= (and b!557233 (not c!64295)) b!557235))

(assert (= (and d!83439 c!64293) b!557234))

(assert (= (and d!83439 (not c!64293)) b!557236))

(assert (= (and b!557236 res!349324) b!557237))

(assert (= (and b!557237 (not res!349323)) b!557229))

(assert (= (and b!557229 (not res!349322)) b!557230))

(declare-fun m!535149 () Bool)

(assert (=> b!557230 m!535149))

(declare-fun m!535151 () Bool)

(assert (=> b!557235 m!535151))

(assert (=> b!557235 m!535151))

(assert (=> b!557235 m!534979))

(declare-fun m!535153 () Bool)

(assert (=> b!557235 m!535153))

(assert (=> b!557229 m!535149))

(declare-fun m!535155 () Bool)

(assert (=> d!83439 m!535155))

(assert (=> d!83439 m!535007))

(assert (=> b!557237 m!535149))

(assert (=> b!557004 d!83439))

(declare-fun d!83443 () Bool)

(declare-fun lt!253235 () (_ BitVec 32))

(declare-fun lt!253234 () (_ BitVec 32))

(assert (=> d!83443 (= lt!253235 (bvmul (bvxor lt!253234 (bvlshr lt!253234 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83443 (= lt!253234 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83443 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349325 (let ((h!11920 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52332 (bvmul (bvxor h!11920 (bvlshr h!11920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52332 (bvlshr x!52332 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349325 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349325 #b00000000000000000000000000000000))))))

(assert (=> d!83443 (= (toIndex!0 (select (store (arr!16853 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!253235 (bvlshr lt!253235 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557004 d!83443))

(declare-fun d!83455 () Bool)

(declare-fun lt!253237 () (_ BitVec 32))

(declare-fun lt!253236 () (_ BitVec 32))

(assert (=> d!83455 (= lt!253237 (bvmul (bvxor lt!253236 (bvlshr lt!253236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83455 (= lt!253236 ((_ extract 31 0) (bvand (bvxor (select (arr!16853 a!3118) j!142) (bvlshr (select (arr!16853 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83455 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349325 (let ((h!11920 ((_ extract 31 0) (bvand (bvxor (select (arr!16853 a!3118) j!142) (bvlshr (select (arr!16853 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52332 (bvmul (bvxor h!11920 (bvlshr h!11920 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52332 (bvlshr x!52332 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349325 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349325 #b00000000000000000000000000000000))))))

(assert (=> d!83455 (= (toIndex!0 (select (arr!16853 a!3118) j!142) mask!3119) (bvand (bvxor lt!253237 (bvlshr lt!253237 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557004 d!83455))

(declare-fun b!557244 () Bool)

(declare-fun e!321041 () SeekEntryResult!5302)

(declare-fun lt!253239 () SeekEntryResult!5302)

(assert (=> b!557244 (= e!321041 (MissingZero!5302 (index!23437 lt!253239)))))

(declare-fun b!557245 () Bool)

(declare-fun e!321040 () SeekEntryResult!5302)

(assert (=> b!557245 (= e!321040 Undefined!5302)))

(declare-fun b!557246 () Bool)

(declare-fun c!64297 () Bool)

(declare-fun lt!253240 () (_ BitVec 64))

(assert (=> b!557246 (= c!64297 (= lt!253240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321042 () SeekEntryResult!5302)

(assert (=> b!557246 (= e!321042 e!321041)))

(declare-fun b!557247 () Bool)

(assert (=> b!557247 (= e!321040 e!321042)))

(assert (=> b!557247 (= lt!253240 (select (arr!16853 a!3118) (index!23437 lt!253239)))))

(declare-fun c!64296 () Bool)

(assert (=> b!557247 (= c!64296 (= lt!253240 (select (arr!16853 a!3118) j!142)))))

(declare-fun b!557249 () Bool)

(assert (=> b!557249 (= e!321041 (seekKeyOrZeroReturnVacant!0 (x!52326 lt!253239) (index!23437 lt!253239) (index!23437 lt!253239) (select (arr!16853 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83457 () Bool)

(declare-fun lt!253238 () SeekEntryResult!5302)

(assert (=> d!83457 (and (or (is-Undefined!5302 lt!253238) (not (is-Found!5302 lt!253238)) (and (bvsge (index!23436 lt!253238) #b00000000000000000000000000000000) (bvslt (index!23436 lt!253238) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253238) (is-Found!5302 lt!253238) (not (is-MissingZero!5302 lt!253238)) (and (bvsge (index!23435 lt!253238) #b00000000000000000000000000000000) (bvslt (index!23435 lt!253238) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253238) (is-Found!5302 lt!253238) (is-MissingZero!5302 lt!253238) (not (is-MissingVacant!5302 lt!253238)) (and (bvsge (index!23438 lt!253238) #b00000000000000000000000000000000) (bvslt (index!23438 lt!253238) (size!17217 a!3118)))) (or (is-Undefined!5302 lt!253238) (ite (is-Found!5302 lt!253238) (= (select (arr!16853 a!3118) (index!23436 lt!253238)) (select (arr!16853 a!3118) j!142)) (ite (is-MissingZero!5302 lt!253238) (= (select (arr!16853 a!3118) (index!23435 lt!253238)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5302 lt!253238) (= (select (arr!16853 a!3118) (index!23438 lt!253238)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83457 (= lt!253238 e!321040)))

(declare-fun c!64298 () Bool)

(assert (=> d!83457 (= c!64298 (and (is-Intermediate!5302 lt!253239) (undefined!6114 lt!253239)))))

(assert (=> d!83457 (= lt!253239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16853 a!3118) j!142) mask!3119) (select (arr!16853 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83457 (validMask!0 mask!3119)))

(assert (=> d!83457 (= (seekEntryOrOpen!0 (select (arr!16853 a!3118) j!142) a!3118 mask!3119) lt!253238)))

(declare-fun b!557248 () Bool)

(assert (=> b!557248 (= e!321042 (Found!5302 (index!23437 lt!253239)))))

(assert (= (and d!83457 c!64298) b!557245))

(assert (= (and d!83457 (not c!64298)) b!557247))

(assert (= (and b!557247 c!64296) b!557248))

(assert (= (and b!557247 (not c!64296)) b!557246))

(assert (= (and b!557246 c!64297) b!557244))

(assert (= (and b!557246 (not c!64297)) b!557249))

(declare-fun m!535159 () Bool)

(assert (=> b!557247 m!535159))

(assert (=> b!557249 m!534979))

(declare-fun m!535161 () Bool)

(assert (=> b!557249 m!535161))

(assert (=> d!83457 m!534985))

(assert (=> d!83457 m!534979))

(declare-fun m!535163 () Bool)

(assert (=> d!83457 m!535163))

(assert (=> d!83457 m!534979))

(assert (=> d!83457 m!534985))

(assert (=> d!83457 m!535007))

(declare-fun m!535165 () Bool)

(assert (=> d!83457 m!535165))

(declare-fun m!535167 () Bool)

(assert (=> d!83457 m!535167))

(declare-fun m!535169 () Bool)

(assert (=> d!83457 m!535169))

(assert (=> b!557009 d!83457))

(declare-fun d!83459 () Bool)

(assert (=> d!83459 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557003 d!83459))

(declare-fun d!83461 () Bool)

(assert (=> d!83461 (= (validKeyInArray!0 (select (arr!16853 a!3118) j!142)) (and (not (= (select (arr!16853 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16853 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557008 d!83461))

(push 1)

