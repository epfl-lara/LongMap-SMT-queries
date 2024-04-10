; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50920 () Bool)

(assert start!50920)

(declare-fun b!556970 () Bool)

(declare-fun res!349207 () Bool)

(declare-fun e!320873 () Bool)

(assert (=> b!556970 (=> (not res!349207) (not e!320873))))

(declare-datatypes ((array!35088 0))(
  ( (array!35089 (arr!16852 (Array (_ BitVec 32) (_ BitVec 64))) (size!17216 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35088)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35088 (_ BitVec 32)) Bool)

(assert (=> b!556970 (= res!349207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556971 () Bool)

(declare-fun e!320870 () Bool)

(assert (=> b!556971 (= e!320873 e!320870)))

(declare-fun res!349201 () Bool)

(assert (=> b!556971 (=> (not res!349201) (not e!320870))))

(declare-datatypes ((SeekEntryResult!5301 0))(
  ( (MissingZero!5301 (index!23431 (_ BitVec 32))) (Found!5301 (index!23432 (_ BitVec 32))) (Intermediate!5301 (undefined!6113 Bool) (index!23433 (_ BitVec 32)) (x!52325 (_ BitVec 32))) (Undefined!5301) (MissingVacant!5301 (index!23434 (_ BitVec 32))) )
))
(declare-fun lt!253111 () SeekEntryResult!5301)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!253110 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35088 (_ BitVec 32)) SeekEntryResult!5301)

(assert (=> b!556971 (= res!349201 (= lt!253111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253110 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119)))))

(declare-fun lt!253107 () (_ BitVec 32))

(assert (=> b!556971 (= lt!253111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253107 (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556971 (= lt!253110 (toIndex!0 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556971 (= lt!253107 (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119))))

(declare-fun b!556972 () Bool)

(declare-fun res!349202 () Bool)

(assert (=> b!556972 (=> (not res!349202) (not e!320873))))

(declare-datatypes ((List!10932 0))(
  ( (Nil!10929) (Cons!10928 (h!11916 (_ BitVec 64)) (t!17160 List!10932)) )
))
(declare-fun arrayNoDuplicates!0 (array!35088 (_ BitVec 32) List!10932) Bool)

(assert (=> b!556972 (= res!349202 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10929))))

(declare-fun b!556973 () Bool)

(declare-fun res!349199 () Bool)

(declare-fun e!320871 () Bool)

(assert (=> b!556973 (=> (not res!349199) (not e!320871))))

(assert (=> b!556973 (= res!349199 (and (= (size!17216 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17216 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17216 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!349200 () Bool)

(assert (=> start!50920 (=> (not res!349200) (not e!320871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50920 (= res!349200 (validMask!0 mask!3119))))

(assert (=> start!50920 e!320871))

(assert (=> start!50920 true))

(declare-fun array_inv!12648 (array!35088) Bool)

(assert (=> start!50920 (array_inv!12648 a!3118)))

(declare-fun b!556974 () Bool)

(declare-fun res!349208 () Bool)

(assert (=> b!556974 (=> (not res!349208) (not e!320871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556974 (= res!349208 (validKeyInArray!0 (select (arr!16852 a!3118) j!142)))))

(declare-fun b!556975 () Bool)

(assert (=> b!556975 (= e!320871 e!320873)))

(declare-fun res!349204 () Bool)

(assert (=> b!556975 (=> (not res!349204) (not e!320873))))

(declare-fun lt!253109 () SeekEntryResult!5301)

(assert (=> b!556975 (= res!349204 (or (= lt!253109 (MissingZero!5301 i!1132)) (= lt!253109 (MissingVacant!5301 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35088 (_ BitVec 32)) SeekEntryResult!5301)

(assert (=> b!556975 (= lt!253109 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556976 () Bool)

(get-info :version)

(assert (=> b!556976 (= e!320870 (not (or (not ((_ is Intermediate!5301) lt!253111)) (undefined!6113 lt!253111) (= (select (arr!16852 a!3118) (index!23433 lt!253111)) (select (arr!16852 a!3118) j!142)) (= (select (arr!16852 a!3118) (index!23433 lt!253111)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23433 lt!253111) #b00000000000000000000000000000000) (bvsge (index!23433 lt!253111) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52325 lt!253111) #b01111111111111111111111111111110) (bvsge (x!52325 lt!253111) #b00000000000000000000000000000000)))))))

(declare-fun e!320874 () Bool)

(assert (=> b!556976 e!320874))

(declare-fun res!349203 () Bool)

(assert (=> b!556976 (=> (not res!349203) (not e!320874))))

(assert (=> b!556976 (= res!349203 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17376 0))(
  ( (Unit!17377) )
))
(declare-fun lt!253108 () Unit!17376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17376)

(assert (=> b!556976 (= lt!253108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556977 () Bool)

(assert (=> b!556977 (= e!320874 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) (Found!5301 j!142)))))

(declare-fun b!556978 () Bool)

(declare-fun res!349205 () Bool)

(assert (=> b!556978 (=> (not res!349205) (not e!320871))))

(declare-fun arrayContainsKey!0 (array!35088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556978 (= res!349205 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556979 () Bool)

(declare-fun res!349206 () Bool)

(assert (=> b!556979 (=> (not res!349206) (not e!320871))))

(assert (=> b!556979 (= res!349206 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50920 res!349200) b!556973))

(assert (= (and b!556973 res!349199) b!556974))

(assert (= (and b!556974 res!349208) b!556979))

(assert (= (and b!556979 res!349206) b!556978))

(assert (= (and b!556978 res!349205) b!556975))

(assert (= (and b!556975 res!349204) b!556970))

(assert (= (and b!556970 res!349207) b!556972))

(assert (= (and b!556972 res!349202) b!556971))

(assert (= (and b!556971 res!349201) b!556976))

(assert (= (and b!556976 res!349203) b!556977))

(declare-fun m!534935 () Bool)

(assert (=> b!556972 m!534935))

(declare-fun m!534937 () Bool)

(assert (=> b!556974 m!534937))

(assert (=> b!556974 m!534937))

(declare-fun m!534939 () Bool)

(assert (=> b!556974 m!534939))

(assert (=> b!556977 m!534937))

(assert (=> b!556977 m!534937))

(declare-fun m!534941 () Bool)

(assert (=> b!556977 m!534941))

(assert (=> b!556971 m!534937))

(declare-fun m!534943 () Bool)

(assert (=> b!556971 m!534943))

(assert (=> b!556971 m!534937))

(declare-fun m!534945 () Bool)

(assert (=> b!556971 m!534945))

(assert (=> b!556971 m!534937))

(declare-fun m!534947 () Bool)

(assert (=> b!556971 m!534947))

(assert (=> b!556971 m!534947))

(declare-fun m!534949 () Bool)

(assert (=> b!556971 m!534949))

(declare-fun m!534951 () Bool)

(assert (=> b!556971 m!534951))

(assert (=> b!556971 m!534947))

(declare-fun m!534953 () Bool)

(assert (=> b!556971 m!534953))

(declare-fun m!534955 () Bool)

(assert (=> b!556979 m!534955))

(declare-fun m!534957 () Bool)

(assert (=> b!556970 m!534957))

(declare-fun m!534959 () Bool)

(assert (=> b!556978 m!534959))

(declare-fun m!534961 () Bool)

(assert (=> b!556976 m!534961))

(assert (=> b!556976 m!534937))

(declare-fun m!534963 () Bool)

(assert (=> b!556976 m!534963))

(declare-fun m!534965 () Bool)

(assert (=> b!556976 m!534965))

(declare-fun m!534967 () Bool)

(assert (=> b!556975 m!534967))

(declare-fun m!534969 () Bool)

(assert (=> start!50920 m!534969))

(declare-fun m!534971 () Bool)

(assert (=> start!50920 m!534971))

(check-sat (not b!556976) (not b!556974) (not b!556978) (not b!556970) (not b!556977) (not b!556979) (not start!50920) (not b!556971) (not b!556972) (not b!556975))
(check-sat)
(get-model)

(declare-fun b!557030 () Bool)

(declare-fun e!320905 () Bool)

(declare-fun lt!253132 () SeekEntryResult!5301)

(assert (=> b!557030 (= e!320905 (bvsge (x!52325 lt!253132) #b01111111111111111111111111111110))))

(declare-fun b!557031 () Bool)

(declare-fun e!320904 () Bool)

(assert (=> b!557031 (= e!320905 e!320904)))

(declare-fun res!349247 () Bool)

(assert (=> b!557031 (= res!349247 (and ((_ is Intermediate!5301) lt!253132) (not (undefined!6113 lt!253132)) (bvslt (x!52325 lt!253132) #b01111111111111111111111111111110) (bvsge (x!52325 lt!253132) #b00000000000000000000000000000000) (bvsge (x!52325 lt!253132) #b00000000000000000000000000000000)))))

(assert (=> b!557031 (=> (not res!349247) (not e!320904))))

(declare-fun b!557032 () Bool)

(assert (=> b!557032 (and (bvsge (index!23433 lt!253132) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253132) (size!17216 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(declare-fun res!349249 () Bool)

(assert (=> b!557032 (= res!349249 (= (select (arr!16852 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23433 lt!253132)) (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!320902 () Bool)

(assert (=> b!557032 (=> res!349249 e!320902)))

(assert (=> b!557032 (= e!320904 e!320902)))

(declare-fun b!557033 () Bool)

(assert (=> b!557033 (and (bvsge (index!23433 lt!253132) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253132) (size!17216 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(assert (=> b!557033 (= e!320902 (= (select (arr!16852 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23433 lt!253132)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557034 () Bool)

(assert (=> b!557034 (and (bvsge (index!23433 lt!253132) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253132) (size!17216 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)))))))

(declare-fun res!349248 () Bool)

(assert (=> b!557034 (= res!349248 (= (select (arr!16852 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) (index!23433 lt!253132)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557034 (=> res!349248 e!320902)))

(declare-fun b!557035 () Bool)

(declare-fun e!320903 () SeekEntryResult!5301)

(assert (=> b!557035 (= e!320903 (Intermediate!5301 false lt!253110 #b00000000000000000000000000000000))))

(declare-fun b!557036 () Bool)

(declare-fun e!320906 () SeekEntryResult!5301)

(assert (=> b!557036 (= e!320906 e!320903)))

(declare-fun lt!253131 () (_ BitVec 64))

(declare-fun c!64231 () Bool)

(assert (=> b!557036 (= c!64231 (or (= lt!253131 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253131 lt!253131) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83379 () Bool)

(assert (=> d!83379 e!320905))

(declare-fun c!64230 () Bool)

(assert (=> d!83379 (= c!64230 (and ((_ is Intermediate!5301) lt!253132) (undefined!6113 lt!253132)))))

(assert (=> d!83379 (= lt!253132 e!320906)))

(declare-fun c!64232 () Bool)

(assert (=> d!83379 (= c!64232 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83379 (= lt!253131 (select (arr!16852 (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118))) lt!253110))))

(assert (=> d!83379 (validMask!0 mask!3119)))

(assert (=> d!83379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253110 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119) lt!253132)))

(declare-fun b!557037 () Bool)

(assert (=> b!557037 (= e!320906 (Intermediate!5301 true lt!253110 #b00000000000000000000000000000000))))

(declare-fun b!557038 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557038 (= e!320903 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253110 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (array!35089 (store (arr!16852 a!3118) i!1132 k0!1914) (size!17216 a!3118)) mask!3119))))

(assert (= (and d!83379 c!64232) b!557037))

(assert (= (and d!83379 (not c!64232)) b!557036))

(assert (= (and b!557036 c!64231) b!557035))

(assert (= (and b!557036 (not c!64231)) b!557038))

(assert (= (and d!83379 c!64230) b!557030))

(assert (= (and d!83379 (not c!64230)) b!557031))

(assert (= (and b!557031 res!349247) b!557032))

(assert (= (and b!557032 (not res!349249)) b!557034))

(assert (= (and b!557034 (not res!349248)) b!557033))

(declare-fun m!535011 () Bool)

(assert (=> b!557033 m!535011))

(declare-fun m!535013 () Bool)

(assert (=> d!83379 m!535013))

(assert (=> d!83379 m!534969))

(assert (=> b!557034 m!535011))

(assert (=> b!557032 m!535011))

(declare-fun m!535015 () Bool)

(assert (=> b!557038 m!535015))

(assert (=> b!557038 m!535015))

(assert (=> b!557038 m!534947))

(declare-fun m!535017 () Bool)

(assert (=> b!557038 m!535017))

(assert (=> b!556971 d!83379))

(declare-fun b!557045 () Bool)

(declare-fun e!320914 () Bool)

(declare-fun lt!253140 () SeekEntryResult!5301)

(assert (=> b!557045 (= e!320914 (bvsge (x!52325 lt!253140) #b01111111111111111111111111111110))))

(declare-fun b!557046 () Bool)

(declare-fun e!320913 () Bool)

(assert (=> b!557046 (= e!320914 e!320913)))

(declare-fun res!349252 () Bool)

(assert (=> b!557046 (= res!349252 (and ((_ is Intermediate!5301) lt!253140) (not (undefined!6113 lt!253140)) (bvslt (x!52325 lt!253140) #b01111111111111111111111111111110) (bvsge (x!52325 lt!253140) #b00000000000000000000000000000000) (bvsge (x!52325 lt!253140) #b00000000000000000000000000000000)))))

(assert (=> b!557046 (=> (not res!349252) (not e!320913))))

(declare-fun b!557047 () Bool)

(assert (=> b!557047 (and (bvsge (index!23433 lt!253140) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253140) (size!17216 a!3118)))))

(declare-fun res!349254 () Bool)

(assert (=> b!557047 (= res!349254 (= (select (arr!16852 a!3118) (index!23433 lt!253140)) (select (arr!16852 a!3118) j!142)))))

(declare-fun e!320911 () Bool)

(assert (=> b!557047 (=> res!349254 e!320911)))

(assert (=> b!557047 (= e!320913 e!320911)))

(declare-fun b!557048 () Bool)

(assert (=> b!557048 (and (bvsge (index!23433 lt!253140) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253140) (size!17216 a!3118)))))

(assert (=> b!557048 (= e!320911 (= (select (arr!16852 a!3118) (index!23433 lt!253140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557049 () Bool)

(assert (=> b!557049 (and (bvsge (index!23433 lt!253140) #b00000000000000000000000000000000) (bvslt (index!23433 lt!253140) (size!17216 a!3118)))))

(declare-fun res!349253 () Bool)

(assert (=> b!557049 (= res!349253 (= (select (arr!16852 a!3118) (index!23433 lt!253140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557049 (=> res!349253 e!320911)))

(declare-fun b!557050 () Bool)

(declare-fun e!320912 () SeekEntryResult!5301)

(assert (=> b!557050 (= e!320912 (Intermediate!5301 false lt!253107 #b00000000000000000000000000000000))))

(declare-fun b!557051 () Bool)

(declare-fun e!320915 () SeekEntryResult!5301)

(assert (=> b!557051 (= e!320915 e!320912)))

(declare-fun c!64236 () Bool)

(declare-fun lt!253139 () (_ BitVec 64))

(assert (=> b!557051 (= c!64236 (or (= lt!253139 (select (arr!16852 a!3118) j!142)) (= (bvadd lt!253139 lt!253139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83383 () Bool)

(assert (=> d!83383 e!320914))

(declare-fun c!64235 () Bool)

(assert (=> d!83383 (= c!64235 (and ((_ is Intermediate!5301) lt!253140) (undefined!6113 lt!253140)))))

(assert (=> d!83383 (= lt!253140 e!320915)))

(declare-fun c!64237 () Bool)

(assert (=> d!83383 (= c!64237 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83383 (= lt!253139 (select (arr!16852 a!3118) lt!253107))))

(assert (=> d!83383 (validMask!0 mask!3119)))

(assert (=> d!83383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253107 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) lt!253140)))

(declare-fun b!557052 () Bool)

(assert (=> b!557052 (= e!320915 (Intermediate!5301 true lt!253107 #b00000000000000000000000000000000))))

(declare-fun b!557053 () Bool)

(assert (=> b!557053 (= e!320912 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253107 #b00000000000000000000000000000000 mask!3119) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83383 c!64237) b!557052))

(assert (= (and d!83383 (not c!64237)) b!557051))

(assert (= (and b!557051 c!64236) b!557050))

(assert (= (and b!557051 (not c!64236)) b!557053))

(assert (= (and d!83383 c!64235) b!557045))

(assert (= (and d!83383 (not c!64235)) b!557046))

(assert (= (and b!557046 res!349252) b!557047))

(assert (= (and b!557047 (not res!349254)) b!557049))

(assert (= (and b!557049 (not res!349253)) b!557048))

(declare-fun m!535019 () Bool)

(assert (=> b!557048 m!535019))

(declare-fun m!535021 () Bool)

(assert (=> d!83383 m!535021))

(assert (=> d!83383 m!534969))

(assert (=> b!557049 m!535019))

(assert (=> b!557047 m!535019))

(declare-fun m!535023 () Bool)

(assert (=> b!557053 m!535023))

(assert (=> b!557053 m!535023))

(assert (=> b!557053 m!534937))

(declare-fun m!535025 () Bool)

(assert (=> b!557053 m!535025))

(assert (=> b!556971 d!83383))

(declare-fun d!83385 () Bool)

(declare-fun lt!253149 () (_ BitVec 32))

(declare-fun lt!253148 () (_ BitVec 32))

(assert (=> d!83385 (= lt!253149 (bvmul (bvxor lt!253148 (bvlshr lt!253148 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83385 (= lt!253148 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83385 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349255 (let ((h!11918 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52328 (bvmul (bvxor h!11918 (bvlshr h!11918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52328 (bvlshr x!52328 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349255 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349255 #b00000000000000000000000000000000))))))

(assert (=> d!83385 (= (toIndex!0 (select (store (arr!16852 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253149 (bvlshr lt!253149 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556971 d!83385))

(declare-fun d!83393 () Bool)

(declare-fun lt!253151 () (_ BitVec 32))

(declare-fun lt!253150 () (_ BitVec 32))

(assert (=> d!83393 (= lt!253151 (bvmul (bvxor lt!253150 (bvlshr lt!253150 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83393 (= lt!253150 ((_ extract 31 0) (bvand (bvxor (select (arr!16852 a!3118) j!142) (bvlshr (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83393 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349255 (let ((h!11918 ((_ extract 31 0) (bvand (bvxor (select (arr!16852 a!3118) j!142) (bvlshr (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52328 (bvmul (bvxor h!11918 (bvlshr h!11918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52328 (bvlshr x!52328 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349255 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349255 #b00000000000000000000000000000000))))))

(assert (=> d!83393 (= (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119) (bvand (bvxor lt!253151 (bvlshr lt!253151 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556971 d!83393))

(declare-fun b!557093 () Bool)

(declare-fun e!320948 () Bool)

(declare-fun call!32363 () Bool)

(assert (=> b!557093 (= e!320948 call!32363)))

(declare-fun b!557094 () Bool)

(declare-fun e!320947 () Bool)

(assert (=> b!557094 (= e!320947 call!32363)))

(declare-fun b!557095 () Bool)

(assert (=> b!557095 (= e!320947 e!320948)))

(declare-fun lt!253169 () (_ BitVec 64))

(assert (=> b!557095 (= lt!253169 (select (arr!16852 a!3118) j!142))))

(declare-fun lt!253167 () Unit!17376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35088 (_ BitVec 64) (_ BitVec 32)) Unit!17376)

(assert (=> b!557095 (= lt!253167 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253169 j!142))))

(assert (=> b!557095 (arrayContainsKey!0 a!3118 lt!253169 #b00000000000000000000000000000000)))

(declare-fun lt!253168 () Unit!17376)

(assert (=> b!557095 (= lt!253168 lt!253167)))

(declare-fun res!349277 () Bool)

(assert (=> b!557095 (= res!349277 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) (Found!5301 j!142)))))

(assert (=> b!557095 (=> (not res!349277) (not e!320948))))

(declare-fun bm!32360 () Bool)

(assert (=> bm!32360 (= call!32363 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83395 () Bool)

(declare-fun res!349278 () Bool)

(declare-fun e!320946 () Bool)

(assert (=> d!83395 (=> res!349278 e!320946)))

(assert (=> d!83395 (= res!349278 (bvsge j!142 (size!17216 a!3118)))))

(assert (=> d!83395 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320946)))

(declare-fun b!557096 () Bool)

(assert (=> b!557096 (= e!320946 e!320947)))

(declare-fun c!64247 () Bool)

(assert (=> b!557096 (= c!64247 (validKeyInArray!0 (select (arr!16852 a!3118) j!142)))))

(assert (= (and d!83395 (not res!349278)) b!557096))

(assert (= (and b!557096 c!64247) b!557095))

(assert (= (and b!557096 (not c!64247)) b!557094))

(assert (= (and b!557095 res!349277) b!557093))

(assert (= (or b!557093 b!557094) bm!32360))

(assert (=> b!557095 m!534937))

(declare-fun m!535055 () Bool)

(assert (=> b!557095 m!535055))

(declare-fun m!535057 () Bool)

(assert (=> b!557095 m!535057))

(assert (=> b!557095 m!534937))

(assert (=> b!557095 m!534941))

(declare-fun m!535059 () Bool)

(assert (=> bm!32360 m!535059))

(assert (=> b!557096 m!534937))

(assert (=> b!557096 m!534937))

(assert (=> b!557096 m!534939))

(assert (=> b!556976 d!83395))

(declare-fun d!83401 () Bool)

(assert (=> d!83401 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253178 () Unit!17376)

(declare-fun choose!38 (array!35088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17376)

(assert (=> d!83401 (= lt!253178 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83401 (validMask!0 mask!3119)))

(assert (=> d!83401 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253178)))

(declare-fun bs!17347 () Bool)

(assert (= bs!17347 d!83401))

(assert (=> bs!17347 m!534963))

(declare-fun m!535061 () Bool)

(assert (=> bs!17347 m!535061))

(assert (=> bs!17347 m!534969))

(assert (=> b!556976 d!83401))

(declare-fun b!557109 () Bool)

(declare-fun e!320957 () Bool)

(declare-fun call!32364 () Bool)

(assert (=> b!557109 (= e!320957 call!32364)))

(declare-fun b!557110 () Bool)

(declare-fun e!320956 () Bool)

(assert (=> b!557110 (= e!320956 call!32364)))

(declare-fun b!557111 () Bool)

(assert (=> b!557111 (= e!320956 e!320957)))

(declare-fun lt!253181 () (_ BitVec 64))

(assert (=> b!557111 (= lt!253181 (select (arr!16852 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253179 () Unit!17376)

(assert (=> b!557111 (= lt!253179 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253181 #b00000000000000000000000000000000))))

(assert (=> b!557111 (arrayContainsKey!0 a!3118 lt!253181 #b00000000000000000000000000000000)))

(declare-fun lt!253180 () Unit!17376)

(assert (=> b!557111 (= lt!253180 lt!253179)))

(declare-fun res!349279 () Bool)

(assert (=> b!557111 (= res!349279 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5301 #b00000000000000000000000000000000)))))

(assert (=> b!557111 (=> (not res!349279) (not e!320957))))

(declare-fun bm!32361 () Bool)

(assert (=> bm!32361 (= call!32364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83403 () Bool)

(declare-fun res!349280 () Bool)

(declare-fun e!320955 () Bool)

(assert (=> d!83403 (=> res!349280 e!320955)))

(assert (=> d!83403 (= res!349280 (bvsge #b00000000000000000000000000000000 (size!17216 a!3118)))))

(assert (=> d!83403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320955)))

(declare-fun b!557112 () Bool)

(assert (=> b!557112 (= e!320955 e!320956)))

(declare-fun c!64254 () Bool)

(assert (=> b!557112 (= c!64254 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83403 (not res!349280)) b!557112))

(assert (= (and b!557112 c!64254) b!557111))

(assert (= (and b!557112 (not c!64254)) b!557110))

(assert (= (and b!557111 res!349279) b!557109))

(assert (= (or b!557109 b!557110) bm!32361))

(declare-fun m!535063 () Bool)

(assert (=> b!557111 m!535063))

(declare-fun m!535065 () Bool)

(assert (=> b!557111 m!535065))

(declare-fun m!535067 () Bool)

(assert (=> b!557111 m!535067))

(assert (=> b!557111 m!535063))

(declare-fun m!535069 () Bool)

(assert (=> b!557111 m!535069))

(declare-fun m!535071 () Bool)

(assert (=> bm!32361 m!535071))

(assert (=> b!557112 m!535063))

(assert (=> b!557112 m!535063))

(declare-fun m!535073 () Bool)

(assert (=> b!557112 m!535073))

(assert (=> b!556970 d!83403))

(declare-fun lt!253203 () SeekEntryResult!5301)

(declare-fun e!320991 () SeekEntryResult!5301)

(declare-fun b!557160 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35088 (_ BitVec 32)) SeekEntryResult!5301)

(assert (=> b!557160 (= e!320991 (seekKeyOrZeroReturnVacant!0 (x!52325 lt!253203) (index!23433 lt!253203) (index!23433 lt!253203) k0!1914 a!3118 mask!3119))))

(declare-fun b!557161 () Bool)

(declare-fun e!320993 () SeekEntryResult!5301)

(assert (=> b!557161 (= e!320993 Undefined!5301)))

(declare-fun b!557163 () Bool)

(assert (=> b!557163 (= e!320991 (MissingZero!5301 (index!23433 lt!253203)))))

(declare-fun b!557164 () Bool)

(declare-fun e!320992 () SeekEntryResult!5301)

(assert (=> b!557164 (= e!320992 (Found!5301 (index!23433 lt!253203)))))

(declare-fun b!557165 () Bool)

(assert (=> b!557165 (= e!320993 e!320992)))

(declare-fun lt!253204 () (_ BitVec 64))

(assert (=> b!557165 (= lt!253204 (select (arr!16852 a!3118) (index!23433 lt!253203)))))

(declare-fun c!64269 () Bool)

(assert (=> b!557165 (= c!64269 (= lt!253204 k0!1914))))

(declare-fun d!83405 () Bool)

(declare-fun lt!253205 () SeekEntryResult!5301)

(assert (=> d!83405 (and (or ((_ is Undefined!5301) lt!253205) (not ((_ is Found!5301) lt!253205)) (and (bvsge (index!23432 lt!253205) #b00000000000000000000000000000000) (bvslt (index!23432 lt!253205) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253205) ((_ is Found!5301) lt!253205) (not ((_ is MissingZero!5301) lt!253205)) (and (bvsge (index!23431 lt!253205) #b00000000000000000000000000000000) (bvslt (index!23431 lt!253205) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253205) ((_ is Found!5301) lt!253205) ((_ is MissingZero!5301) lt!253205) (not ((_ is MissingVacant!5301) lt!253205)) (and (bvsge (index!23434 lt!253205) #b00000000000000000000000000000000) (bvslt (index!23434 lt!253205) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253205) (ite ((_ is Found!5301) lt!253205) (= (select (arr!16852 a!3118) (index!23432 lt!253205)) k0!1914) (ite ((_ is MissingZero!5301) lt!253205) (= (select (arr!16852 a!3118) (index!23431 lt!253205)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5301) lt!253205) (= (select (arr!16852 a!3118) (index!23434 lt!253205)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83405 (= lt!253205 e!320993)))

(declare-fun c!64271 () Bool)

(assert (=> d!83405 (= c!64271 (and ((_ is Intermediate!5301) lt!253203) (undefined!6113 lt!253203)))))

(assert (=> d!83405 (= lt!253203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83405 (validMask!0 mask!3119)))

(assert (=> d!83405 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253205)))

(declare-fun b!557162 () Bool)

(declare-fun c!64270 () Bool)

(assert (=> b!557162 (= c!64270 (= lt!253204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557162 (= e!320992 e!320991)))

(assert (= (and d!83405 c!64271) b!557161))

(assert (= (and d!83405 (not c!64271)) b!557165))

(assert (= (and b!557165 c!64269) b!557164))

(assert (= (and b!557165 (not c!64269)) b!557162))

(assert (= (and b!557162 c!64270) b!557163))

(assert (= (and b!557162 (not c!64270)) b!557160))

(declare-fun m!535111 () Bool)

(assert (=> b!557160 m!535111))

(declare-fun m!535113 () Bool)

(assert (=> b!557165 m!535113))

(declare-fun m!535115 () Bool)

(assert (=> d!83405 m!535115))

(declare-fun m!535117 () Bool)

(assert (=> d!83405 m!535117))

(declare-fun m!535119 () Bool)

(assert (=> d!83405 m!535119))

(assert (=> d!83405 m!534969))

(declare-fun m!535121 () Bool)

(assert (=> d!83405 m!535121))

(declare-fun m!535123 () Bool)

(assert (=> d!83405 m!535123))

(assert (=> d!83405 m!535115))

(assert (=> b!556975 d!83405))

(declare-fun d!83431 () Bool)

(assert (=> d!83431 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50920 d!83431))

(declare-fun d!83437 () Bool)

(assert (=> d!83437 (= (array_inv!12648 a!3118) (bvsge (size!17216 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50920 d!83437))

(declare-fun d!83441 () Bool)

(assert (=> d!83441 (= (validKeyInArray!0 (select (arr!16852 a!3118) j!142)) (and (not (= (select (arr!16852 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16852 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556974 d!83441))

(declare-fun d!83445 () Bool)

(assert (=> d!83445 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556979 d!83445))

(declare-fun d!83447 () Bool)

(declare-fun res!349330 () Bool)

(declare-fun e!321038 () Bool)

(assert (=> d!83447 (=> res!349330 e!321038)))

(assert (=> d!83447 (= res!349330 (= (select (arr!16852 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83447 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321038)))

(declare-fun b!557242 () Bool)

(declare-fun e!321039 () Bool)

(assert (=> b!557242 (= e!321038 e!321039)))

(declare-fun res!349331 () Bool)

(assert (=> b!557242 (=> (not res!349331) (not e!321039))))

(assert (=> b!557242 (= res!349331 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17216 a!3118)))))

(declare-fun b!557243 () Bool)

(assert (=> b!557243 (= e!321039 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83447 (not res!349330)) b!557242))

(assert (= (and b!557242 res!349331) b!557243))

(assert (=> d!83447 m!535063))

(declare-fun m!535157 () Bool)

(assert (=> b!557243 m!535157))

(assert (=> b!556978 d!83447))

(declare-fun b!557260 () Bool)

(declare-fun e!321053 () Bool)

(declare-fun contains!2850 (List!10932 (_ BitVec 64)) Bool)

(assert (=> b!557260 (= e!321053 (contains!2850 Nil!10929 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557261 () Bool)

(declare-fun e!321051 () Bool)

(declare-fun e!321052 () Bool)

(assert (=> b!557261 (= e!321051 e!321052)))

(declare-fun c!64301 () Bool)

(assert (=> b!557261 (= c!64301 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557262 () Bool)

(declare-fun call!32372 () Bool)

(assert (=> b!557262 (= e!321052 call!32372)))

(declare-fun d!83453 () Bool)

(declare-fun res!349339 () Bool)

(declare-fun e!321054 () Bool)

(assert (=> d!83453 (=> res!349339 e!321054)))

(assert (=> d!83453 (= res!349339 (bvsge #b00000000000000000000000000000000 (size!17216 a!3118)))))

(assert (=> d!83453 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10929) e!321054)))

(declare-fun b!557263 () Bool)

(assert (=> b!557263 (= e!321052 call!32372)))

(declare-fun b!557264 () Bool)

(assert (=> b!557264 (= e!321054 e!321051)))

(declare-fun res!349340 () Bool)

(assert (=> b!557264 (=> (not res!349340) (not e!321051))))

(assert (=> b!557264 (= res!349340 (not e!321053))))

(declare-fun res!349338 () Bool)

(assert (=> b!557264 (=> (not res!349338) (not e!321053))))

(assert (=> b!557264 (= res!349338 (validKeyInArray!0 (select (arr!16852 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32369 () Bool)

(assert (=> bm!32369 (= call!32372 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64301 (Cons!10928 (select (arr!16852 a!3118) #b00000000000000000000000000000000) Nil!10929) Nil!10929)))))

(assert (= (and d!83453 (not res!349339)) b!557264))

(assert (= (and b!557264 res!349338) b!557260))

(assert (= (and b!557264 res!349340) b!557261))

(assert (= (and b!557261 c!64301) b!557263))

(assert (= (and b!557261 (not c!64301)) b!557262))

(assert (= (or b!557263 b!557262) bm!32369))

(assert (=> b!557260 m!535063))

(assert (=> b!557260 m!535063))

(declare-fun m!535171 () Bool)

(assert (=> b!557260 m!535171))

(assert (=> b!557261 m!535063))

(assert (=> b!557261 m!535063))

(assert (=> b!557261 m!535073))

(assert (=> b!557264 m!535063))

(assert (=> b!557264 m!535063))

(assert (=> b!557264 m!535073))

(assert (=> bm!32369 m!535063))

(declare-fun m!535173 () Bool)

(assert (=> bm!32369 m!535173))

(assert (=> b!556972 d!83453))

(declare-fun b!557265 () Bool)

(declare-fun e!321055 () SeekEntryResult!5301)

(declare-fun lt!253241 () SeekEntryResult!5301)

(assert (=> b!557265 (= e!321055 (seekKeyOrZeroReturnVacant!0 (x!52325 lt!253241) (index!23433 lt!253241) (index!23433 lt!253241) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557266 () Bool)

(declare-fun e!321057 () SeekEntryResult!5301)

(assert (=> b!557266 (= e!321057 Undefined!5301)))

(declare-fun b!557268 () Bool)

(assert (=> b!557268 (= e!321055 (MissingZero!5301 (index!23433 lt!253241)))))

(declare-fun b!557269 () Bool)

(declare-fun e!321056 () SeekEntryResult!5301)

(assert (=> b!557269 (= e!321056 (Found!5301 (index!23433 lt!253241)))))

(declare-fun b!557270 () Bool)

(assert (=> b!557270 (= e!321057 e!321056)))

(declare-fun lt!253242 () (_ BitVec 64))

(assert (=> b!557270 (= lt!253242 (select (arr!16852 a!3118) (index!23433 lt!253241)))))

(declare-fun c!64302 () Bool)

(assert (=> b!557270 (= c!64302 (= lt!253242 (select (arr!16852 a!3118) j!142)))))

(declare-fun d!83463 () Bool)

(declare-fun lt!253243 () SeekEntryResult!5301)

(assert (=> d!83463 (and (or ((_ is Undefined!5301) lt!253243) (not ((_ is Found!5301) lt!253243)) (and (bvsge (index!23432 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23432 lt!253243) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253243) ((_ is Found!5301) lt!253243) (not ((_ is MissingZero!5301) lt!253243)) (and (bvsge (index!23431 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23431 lt!253243) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253243) ((_ is Found!5301) lt!253243) ((_ is MissingZero!5301) lt!253243) (not ((_ is MissingVacant!5301) lt!253243)) (and (bvsge (index!23434 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23434 lt!253243) (size!17216 a!3118)))) (or ((_ is Undefined!5301) lt!253243) (ite ((_ is Found!5301) lt!253243) (= (select (arr!16852 a!3118) (index!23432 lt!253243)) (select (arr!16852 a!3118) j!142)) (ite ((_ is MissingZero!5301) lt!253243) (= (select (arr!16852 a!3118) (index!23431 lt!253243)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5301) lt!253243) (= (select (arr!16852 a!3118) (index!23434 lt!253243)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83463 (= lt!253243 e!321057)))

(declare-fun c!64304 () Bool)

(assert (=> d!83463 (= c!64304 (and ((_ is Intermediate!5301) lt!253241) (undefined!6113 lt!253241)))))

(assert (=> d!83463 (= lt!253241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16852 a!3118) j!142) mask!3119) (select (arr!16852 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83463 (validMask!0 mask!3119)))

(assert (=> d!83463 (= (seekEntryOrOpen!0 (select (arr!16852 a!3118) j!142) a!3118 mask!3119) lt!253243)))

(declare-fun b!557267 () Bool)

(declare-fun c!64303 () Bool)

(assert (=> b!557267 (= c!64303 (= lt!253242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557267 (= e!321056 e!321055)))

(assert (= (and d!83463 c!64304) b!557266))

(assert (= (and d!83463 (not c!64304)) b!557270))

(assert (= (and b!557270 c!64302) b!557269))

(assert (= (and b!557270 (not c!64302)) b!557267))

(assert (= (and b!557267 c!64303) b!557268))

(assert (= (and b!557267 (not c!64303)) b!557265))

(assert (=> b!557265 m!534937))

(declare-fun m!535175 () Bool)

(assert (=> b!557265 m!535175))

(declare-fun m!535177 () Bool)

(assert (=> b!557270 m!535177))

(assert (=> d!83463 m!534943))

(assert (=> d!83463 m!534937))

(declare-fun m!535179 () Bool)

(assert (=> d!83463 m!535179))

(declare-fun m!535181 () Bool)

(assert (=> d!83463 m!535181))

(assert (=> d!83463 m!534969))

(declare-fun m!535183 () Bool)

(assert (=> d!83463 m!535183))

(declare-fun m!535185 () Bool)

(assert (=> d!83463 m!535185))

(assert (=> d!83463 m!534937))

(assert (=> d!83463 m!534943))

(assert (=> b!556977 d!83463))

(check-sat (not bm!32361) (not b!557038) (not b!557243) (not b!557264) (not b!557053) (not b!557261) (not d!83405) (not d!83401) (not b!557265) (not b!557095) (not bm!32369) (not b!557111) (not b!557160) (not bm!32360) (not b!557096) (not d!83383) (not b!557112) (not d!83379) (not b!557260) (not d!83463))
(check-sat)
