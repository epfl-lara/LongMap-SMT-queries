; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50964 () Bool)

(assert start!50964)

(declare-fun b!557140 () Bool)

(declare-fun res!349272 () Bool)

(declare-fun e!320985 () Bool)

(assert (=> b!557140 (=> (not res!349272) (not e!320985))))

(declare-datatypes ((array!35079 0))(
  ( (array!35080 (arr!16846 (Array (_ BitVec 32) (_ BitVec 64))) (size!17210 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35079)

(declare-datatypes ((List!10833 0))(
  ( (Nil!10830) (Cons!10829 (h!11820 (_ BitVec 64)) (t!17053 List!10833)) )
))
(declare-fun arrayNoDuplicates!0 (array!35079 (_ BitVec 32) List!10833) Bool)

(assert (=> b!557140 (= res!349272 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10830))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!557141 () Bool)

(declare-datatypes ((SeekEntryResult!5251 0))(
  ( (MissingZero!5251 (index!23231 (_ BitVec 32))) (Found!5251 (index!23232 (_ BitVec 32))) (Intermediate!5251 (undefined!6063 Bool) (index!23233 (_ BitVec 32)) (x!52278 (_ BitVec 32))) (Undefined!5251) (MissingVacant!5251 (index!23234 (_ BitVec 32))) )
))
(declare-fun lt!253205 () SeekEntryResult!5251)

(declare-fun e!320986 () Bool)

(get-info :version)

(assert (=> b!557141 (= e!320986 (not (or (not ((_ is Intermediate!5251) lt!253205)) (undefined!6063 lt!253205) (= (select (arr!16846 a!3118) (index!23233 lt!253205)) (select (arr!16846 a!3118) j!142)) (= (select (arr!16846 a!3118) (index!23233 lt!253205)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23233 lt!253205) #b00000000000000000000000000000000) (bvsge (index!23233 lt!253205) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52278 lt!253205) #b01111111111111111111111111111110) (bvsge (x!52278 lt!253205) #b00000000000000000000000000000000)))))))

(declare-fun e!320988 () Bool)

(assert (=> b!557141 e!320988))

(declare-fun res!349264 () Bool)

(assert (=> b!557141 (=> (not res!349264) (not e!320988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35079 (_ BitVec 32)) Bool)

(assert (=> b!557141 (= res!349264 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17347 0))(
  ( (Unit!17348) )
))
(declare-fun lt!253207 () Unit!17347)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17347)

(assert (=> b!557141 (= lt!253207 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557142 () Bool)

(declare-fun res!349271 () Bool)

(declare-fun e!320984 () Bool)

(assert (=> b!557142 (=> (not res!349271) (not e!320984))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557142 (= res!349271 (and (= (size!17210 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17210 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17210 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557144 () Bool)

(declare-fun res!349268 () Bool)

(assert (=> b!557144 (=> (not res!349268) (not e!320984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557144 (= res!349268 (validKeyInArray!0 (select (arr!16846 a!3118) j!142)))))

(declare-fun b!557145 () Bool)

(assert (=> b!557145 (= e!320984 e!320985)))

(declare-fun res!349265 () Bool)

(assert (=> b!557145 (=> (not res!349265) (not e!320985))))

(declare-fun lt!253203 () SeekEntryResult!5251)

(assert (=> b!557145 (= res!349265 (or (= lt!253203 (MissingZero!5251 i!1132)) (= lt!253203 (MissingVacant!5251 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!557145 (= lt!253203 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!557146 () Bool)

(declare-fun res!349266 () Bool)

(assert (=> b!557146 (=> (not res!349266) (not e!320984))))

(declare-fun arrayContainsKey!0 (array!35079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557146 (= res!349266 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557147 () Bool)

(assert (=> b!557147 (= e!320985 e!320986)))

(declare-fun res!349269 () Bool)

(assert (=> b!557147 (=> (not res!349269) (not e!320986))))

(declare-fun lt!253204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!557147 (= res!349269 (= lt!253205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253204 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)) mask!3119)))))

(declare-fun lt!253206 () (_ BitVec 32))

(assert (=> b!557147 (= lt!253205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253206 (select (arr!16846 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557147 (= lt!253204 (toIndex!0 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!557147 (= lt!253206 (toIndex!0 (select (arr!16846 a!3118) j!142) mask!3119))))

(declare-fun b!557148 () Bool)

(assert (=> b!557148 (= e!320988 (= (seekEntryOrOpen!0 (select (arr!16846 a!3118) j!142) a!3118 mask!3119) (Found!5251 j!142)))))

(declare-fun b!557149 () Bool)

(declare-fun res!349267 () Bool)

(assert (=> b!557149 (=> (not res!349267) (not e!320985))))

(assert (=> b!557149 (= res!349267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!349273 () Bool)

(assert (=> start!50964 (=> (not res!349273) (not e!320984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50964 (= res!349273 (validMask!0 mask!3119))))

(assert (=> start!50964 e!320984))

(assert (=> start!50964 true))

(declare-fun array_inv!12705 (array!35079) Bool)

(assert (=> start!50964 (array_inv!12705 a!3118)))

(declare-fun b!557143 () Bool)

(declare-fun res!349270 () Bool)

(assert (=> b!557143 (=> (not res!349270) (not e!320984))))

(assert (=> b!557143 (= res!349270 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50964 res!349273) b!557142))

(assert (= (and b!557142 res!349271) b!557144))

(assert (= (and b!557144 res!349268) b!557143))

(assert (= (and b!557143 res!349270) b!557146))

(assert (= (and b!557146 res!349266) b!557145))

(assert (= (and b!557145 res!349265) b!557149))

(assert (= (and b!557149 res!349267) b!557140))

(assert (= (and b!557140 res!349272) b!557147))

(assert (= (and b!557147 res!349269) b!557141))

(assert (= (and b!557141 res!349264) b!557148))

(declare-fun m!535235 () Bool)

(assert (=> b!557143 m!535235))

(declare-fun m!535237 () Bool)

(assert (=> b!557146 m!535237))

(declare-fun m!535239 () Bool)

(assert (=> b!557148 m!535239))

(assert (=> b!557148 m!535239))

(declare-fun m!535241 () Bool)

(assert (=> b!557148 m!535241))

(declare-fun m!535243 () Bool)

(assert (=> b!557149 m!535243))

(assert (=> b!557147 m!535239))

(declare-fun m!535245 () Bool)

(assert (=> b!557147 m!535245))

(assert (=> b!557147 m!535239))

(declare-fun m!535247 () Bool)

(assert (=> b!557147 m!535247))

(assert (=> b!557147 m!535239))

(declare-fun m!535249 () Bool)

(assert (=> b!557147 m!535249))

(declare-fun m!535251 () Bool)

(assert (=> b!557147 m!535251))

(assert (=> b!557147 m!535247))

(declare-fun m!535253 () Bool)

(assert (=> b!557147 m!535253))

(assert (=> b!557147 m!535247))

(declare-fun m!535255 () Bool)

(assert (=> b!557147 m!535255))

(declare-fun m!535257 () Bool)

(assert (=> b!557140 m!535257))

(declare-fun m!535259 () Bool)

(assert (=> b!557141 m!535259))

(assert (=> b!557141 m!535239))

(declare-fun m!535261 () Bool)

(assert (=> b!557141 m!535261))

(declare-fun m!535263 () Bool)

(assert (=> b!557141 m!535263))

(declare-fun m!535265 () Bool)

(assert (=> start!50964 m!535265))

(declare-fun m!535267 () Bool)

(assert (=> start!50964 m!535267))

(assert (=> b!557144 m!535239))

(assert (=> b!557144 m!535239))

(declare-fun m!535269 () Bool)

(assert (=> b!557144 m!535269))

(declare-fun m!535271 () Bool)

(assert (=> b!557145 m!535271))

(check-sat (not b!557149) (not b!557143) (not b!557147) (not b!557145) (not b!557148) (not b!557144) (not b!557146) (not b!557140) (not b!557141) (not start!50964))
(check-sat)
(get-model)

(declare-fun b!557228 () Bool)

(declare-fun e!321033 () SeekEntryResult!5251)

(assert (=> b!557228 (= e!321033 (Intermediate!5251 true lt!253204 #b00000000000000000000000000000000))))

(declare-fun lt!253243 () SeekEntryResult!5251)

(declare-fun b!557229 () Bool)

(assert (=> b!557229 (and (bvsge (index!23233 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253243) (size!17210 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)))))))

(declare-fun res!349340 () Bool)

(assert (=> b!557229 (= res!349340 (= (select (arr!16846 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118))) (index!23233 lt!253243)) (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!321031 () Bool)

(assert (=> b!557229 (=> res!349340 e!321031)))

(declare-fun e!321029 () Bool)

(assert (=> b!557229 (= e!321029 e!321031)))

(declare-fun b!557230 () Bool)

(assert (=> b!557230 (and (bvsge (index!23233 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253243) (size!17210 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)))))))

(declare-fun res!349342 () Bool)

(assert (=> b!557230 (= res!349342 (= (select (arr!16846 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118))) (index!23233 lt!253243)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557230 (=> res!349342 e!321031)))

(declare-fun b!557231 () Bool)

(declare-fun e!321032 () Bool)

(assert (=> b!557231 (= e!321032 (bvsge (x!52278 lt!253243) #b01111111111111111111111111111110))))

(declare-fun d!83489 () Bool)

(assert (=> d!83489 e!321032))

(declare-fun c!64286 () Bool)

(assert (=> d!83489 (= c!64286 (and ((_ is Intermediate!5251) lt!253243) (undefined!6063 lt!253243)))))

(assert (=> d!83489 (= lt!253243 e!321033)))

(declare-fun c!64284 () Bool)

(assert (=> d!83489 (= c!64284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253242 () (_ BitVec 64))

(assert (=> d!83489 (= lt!253242 (select (arr!16846 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118))) lt!253204))))

(assert (=> d!83489 (validMask!0 mask!3119)))

(assert (=> d!83489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253204 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)) mask!3119) lt!253243)))

(declare-fun b!557232 () Bool)

(assert (=> b!557232 (and (bvsge (index!23233 lt!253243) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253243) (size!17210 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)))))))

(assert (=> b!557232 (= e!321031 (= (select (arr!16846 (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118))) (index!23233 lt!253243)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557233 () Bool)

(declare-fun e!321030 () SeekEntryResult!5251)

(assert (=> b!557233 (= e!321033 e!321030)))

(declare-fun c!64285 () Bool)

(assert (=> b!557233 (= c!64285 (or (= lt!253242 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!253242 lt!253242) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557234 () Bool)

(assert (=> b!557234 (= e!321030 (Intermediate!5251 false lt!253204 #b00000000000000000000000000000000))))

(declare-fun b!557235 () Bool)

(assert (=> b!557235 (= e!321032 e!321029)))

(declare-fun res!349341 () Bool)

(assert (=> b!557235 (= res!349341 (and ((_ is Intermediate!5251) lt!253243) (not (undefined!6063 lt!253243)) (bvslt (x!52278 lt!253243) #b01111111111111111111111111111110) (bvsge (x!52278 lt!253243) #b00000000000000000000000000000000) (bvsge (x!52278 lt!253243) #b00000000000000000000000000000000)))))

(assert (=> b!557235 (=> (not res!349341) (not e!321029))))

(declare-fun b!557236 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557236 (= e!321030 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253204 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (array!35080 (store (arr!16846 a!3118) i!1132 k0!1914) (size!17210 a!3118)) mask!3119))))

(assert (= (and d!83489 c!64284) b!557228))

(assert (= (and d!83489 (not c!64284)) b!557233))

(assert (= (and b!557233 c!64285) b!557234))

(assert (= (and b!557233 (not c!64285)) b!557236))

(assert (= (and d!83489 c!64286) b!557231))

(assert (= (and d!83489 (not c!64286)) b!557235))

(assert (= (and b!557235 res!349341) b!557229))

(assert (= (and b!557229 (not res!349340)) b!557230))

(assert (= (and b!557230 (not res!349342)) b!557232))

(declare-fun m!535349 () Bool)

(assert (=> b!557232 m!535349))

(assert (=> b!557229 m!535349))

(assert (=> b!557230 m!535349))

(declare-fun m!535351 () Bool)

(assert (=> b!557236 m!535351))

(assert (=> b!557236 m!535351))

(assert (=> b!557236 m!535247))

(declare-fun m!535353 () Bool)

(assert (=> b!557236 m!535353))

(declare-fun m!535355 () Bool)

(assert (=> d!83489 m!535355))

(assert (=> d!83489 m!535265))

(assert (=> b!557147 d!83489))

(declare-fun b!557237 () Bool)

(declare-fun e!321038 () SeekEntryResult!5251)

(assert (=> b!557237 (= e!321038 (Intermediate!5251 true lt!253206 #b00000000000000000000000000000000))))

(declare-fun b!557238 () Bool)

(declare-fun lt!253245 () SeekEntryResult!5251)

(assert (=> b!557238 (and (bvsge (index!23233 lt!253245) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253245) (size!17210 a!3118)))))

(declare-fun res!349343 () Bool)

(assert (=> b!557238 (= res!349343 (= (select (arr!16846 a!3118) (index!23233 lt!253245)) (select (arr!16846 a!3118) j!142)))))

(declare-fun e!321036 () Bool)

(assert (=> b!557238 (=> res!349343 e!321036)))

(declare-fun e!321034 () Bool)

(assert (=> b!557238 (= e!321034 e!321036)))

(declare-fun b!557239 () Bool)

(assert (=> b!557239 (and (bvsge (index!23233 lt!253245) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253245) (size!17210 a!3118)))))

(declare-fun res!349345 () Bool)

(assert (=> b!557239 (= res!349345 (= (select (arr!16846 a!3118) (index!23233 lt!253245)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557239 (=> res!349345 e!321036)))

(declare-fun b!557240 () Bool)

(declare-fun e!321037 () Bool)

(assert (=> b!557240 (= e!321037 (bvsge (x!52278 lt!253245) #b01111111111111111111111111111110))))

(declare-fun d!83495 () Bool)

(assert (=> d!83495 e!321037))

(declare-fun c!64289 () Bool)

(assert (=> d!83495 (= c!64289 (and ((_ is Intermediate!5251) lt!253245) (undefined!6063 lt!253245)))))

(assert (=> d!83495 (= lt!253245 e!321038)))

(declare-fun c!64287 () Bool)

(assert (=> d!83495 (= c!64287 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!253244 () (_ BitVec 64))

(assert (=> d!83495 (= lt!253244 (select (arr!16846 a!3118) lt!253206))))

(assert (=> d!83495 (validMask!0 mask!3119)))

(assert (=> d!83495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253206 (select (arr!16846 a!3118) j!142) a!3118 mask!3119) lt!253245)))

(declare-fun b!557241 () Bool)

(assert (=> b!557241 (and (bvsge (index!23233 lt!253245) #b00000000000000000000000000000000) (bvslt (index!23233 lt!253245) (size!17210 a!3118)))))

(assert (=> b!557241 (= e!321036 (= (select (arr!16846 a!3118) (index!23233 lt!253245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!557242 () Bool)

(declare-fun e!321035 () SeekEntryResult!5251)

(assert (=> b!557242 (= e!321038 e!321035)))

(declare-fun c!64288 () Bool)

(assert (=> b!557242 (= c!64288 (or (= lt!253244 (select (arr!16846 a!3118) j!142)) (= (bvadd lt!253244 lt!253244) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557243 () Bool)

(assert (=> b!557243 (= e!321035 (Intermediate!5251 false lt!253206 #b00000000000000000000000000000000))))

(declare-fun b!557244 () Bool)

(assert (=> b!557244 (= e!321037 e!321034)))

(declare-fun res!349344 () Bool)

(assert (=> b!557244 (= res!349344 (and ((_ is Intermediate!5251) lt!253245) (not (undefined!6063 lt!253245)) (bvslt (x!52278 lt!253245) #b01111111111111111111111111111110) (bvsge (x!52278 lt!253245) #b00000000000000000000000000000000) (bvsge (x!52278 lt!253245) #b00000000000000000000000000000000)))))

(assert (=> b!557244 (=> (not res!349344) (not e!321034))))

(declare-fun b!557245 () Bool)

(assert (=> b!557245 (= e!321035 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16846 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83495 c!64287) b!557237))

(assert (= (and d!83495 (not c!64287)) b!557242))

(assert (= (and b!557242 c!64288) b!557243))

(assert (= (and b!557242 (not c!64288)) b!557245))

(assert (= (and d!83495 c!64289) b!557240))

(assert (= (and d!83495 (not c!64289)) b!557244))

(assert (= (and b!557244 res!349344) b!557238))

(assert (= (and b!557238 (not res!349343)) b!557239))

(assert (= (and b!557239 (not res!349345)) b!557241))

(declare-fun m!535357 () Bool)

(assert (=> b!557241 m!535357))

(assert (=> b!557238 m!535357))

(assert (=> b!557239 m!535357))

(declare-fun m!535359 () Bool)

(assert (=> b!557245 m!535359))

(assert (=> b!557245 m!535359))

(assert (=> b!557245 m!535239))

(declare-fun m!535361 () Bool)

(assert (=> b!557245 m!535361))

(declare-fun m!535363 () Bool)

(assert (=> d!83495 m!535363))

(assert (=> d!83495 m!535265))

(assert (=> b!557147 d!83495))

(declare-fun d!83497 () Bool)

(declare-fun lt!253251 () (_ BitVec 32))

(declare-fun lt!253250 () (_ BitVec 32))

(assert (=> d!83497 (= lt!253251 (bvmul (bvxor lt!253250 (bvlshr lt!253250 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83497 (= lt!253250 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83497 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349346 (let ((h!11823 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52282 (bvmul (bvxor h!11823 (bvlshr h!11823 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52282 (bvlshr x!52282 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349346 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349346 #b00000000000000000000000000000000))))))

(assert (=> d!83497 (= (toIndex!0 (select (store (arr!16846 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!253251 (bvlshr lt!253251 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557147 d!83497))

(declare-fun d!83499 () Bool)

(declare-fun lt!253253 () (_ BitVec 32))

(declare-fun lt!253252 () (_ BitVec 32))

(assert (=> d!83499 (= lt!253253 (bvmul (bvxor lt!253252 (bvlshr lt!253252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83499 (= lt!253252 ((_ extract 31 0) (bvand (bvxor (select (arr!16846 a!3118) j!142) (bvlshr (select (arr!16846 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83499 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349346 (let ((h!11823 ((_ extract 31 0) (bvand (bvxor (select (arr!16846 a!3118) j!142) (bvlshr (select (arr!16846 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52282 (bvmul (bvxor h!11823 (bvlshr h!11823 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52282 (bvlshr x!52282 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349346 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349346 #b00000000000000000000000000000000))))))

(assert (=> d!83499 (= (toIndex!0 (select (arr!16846 a!3118) j!142) mask!3119) (bvand (bvxor lt!253253 (bvlshr lt!253253 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!557147 d!83499))

(declare-fun b!557315 () Bool)

(declare-fun e!321082 () SeekEntryResult!5251)

(declare-fun lt!253279 () SeekEntryResult!5251)

(assert (=> b!557315 (= e!321082 (MissingZero!5251 (index!23233 lt!253279)))))

(declare-fun b!557316 () Bool)

(declare-fun c!64317 () Bool)

(declare-fun lt!253278 () (_ BitVec 64))

(assert (=> b!557316 (= c!64317 (= lt!253278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321081 () SeekEntryResult!5251)

(assert (=> b!557316 (= e!321081 e!321082)))

(declare-fun d!83501 () Bool)

(declare-fun lt!253280 () SeekEntryResult!5251)

(assert (=> d!83501 (and (or ((_ is Undefined!5251) lt!253280) (not ((_ is Found!5251) lt!253280)) (and (bvsge (index!23232 lt!253280) #b00000000000000000000000000000000) (bvslt (index!23232 lt!253280) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253280) ((_ is Found!5251) lt!253280) (not ((_ is MissingZero!5251) lt!253280)) (and (bvsge (index!23231 lt!253280) #b00000000000000000000000000000000) (bvslt (index!23231 lt!253280) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253280) ((_ is Found!5251) lt!253280) ((_ is MissingZero!5251) lt!253280) (not ((_ is MissingVacant!5251) lt!253280)) (and (bvsge (index!23234 lt!253280) #b00000000000000000000000000000000) (bvslt (index!23234 lt!253280) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253280) (ite ((_ is Found!5251) lt!253280) (= (select (arr!16846 a!3118) (index!23232 lt!253280)) (select (arr!16846 a!3118) j!142)) (ite ((_ is MissingZero!5251) lt!253280) (= (select (arr!16846 a!3118) (index!23231 lt!253280)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5251) lt!253280) (= (select (arr!16846 a!3118) (index!23234 lt!253280)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321083 () SeekEntryResult!5251)

(assert (=> d!83501 (= lt!253280 e!321083)))

(declare-fun c!64319 () Bool)

(assert (=> d!83501 (= c!64319 (and ((_ is Intermediate!5251) lt!253279) (undefined!6063 lt!253279)))))

(assert (=> d!83501 (= lt!253279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16846 a!3118) j!142) mask!3119) (select (arr!16846 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83501 (validMask!0 mask!3119)))

(assert (=> d!83501 (= (seekEntryOrOpen!0 (select (arr!16846 a!3118) j!142) a!3118 mask!3119) lt!253280)))

(declare-fun b!557317 () Bool)

(assert (=> b!557317 (= e!321083 Undefined!5251)))

(declare-fun b!557318 () Bool)

(assert (=> b!557318 (= e!321083 e!321081)))

(assert (=> b!557318 (= lt!253278 (select (arr!16846 a!3118) (index!23233 lt!253279)))))

(declare-fun c!64318 () Bool)

(assert (=> b!557318 (= c!64318 (= lt!253278 (select (arr!16846 a!3118) j!142)))))

(declare-fun b!557319 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35079 (_ BitVec 32)) SeekEntryResult!5251)

(assert (=> b!557319 (= e!321082 (seekKeyOrZeroReturnVacant!0 (x!52278 lt!253279) (index!23233 lt!253279) (index!23233 lt!253279) (select (arr!16846 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557320 () Bool)

(assert (=> b!557320 (= e!321081 (Found!5251 (index!23233 lt!253279)))))

(assert (= (and d!83501 c!64319) b!557317))

(assert (= (and d!83501 (not c!64319)) b!557318))

(assert (= (and b!557318 c!64318) b!557320))

(assert (= (and b!557318 (not c!64318)) b!557316))

(assert (= (and b!557316 c!64317) b!557315))

(assert (= (and b!557316 (not c!64317)) b!557319))

(assert (=> d!83501 m!535245))

(assert (=> d!83501 m!535239))

(declare-fun m!535401 () Bool)

(assert (=> d!83501 m!535401))

(assert (=> d!83501 m!535239))

(assert (=> d!83501 m!535245))

(declare-fun m!535403 () Bool)

(assert (=> d!83501 m!535403))

(assert (=> d!83501 m!535265))

(declare-fun m!535405 () Bool)

(assert (=> d!83501 m!535405))

(declare-fun m!535407 () Bool)

(assert (=> d!83501 m!535407))

(declare-fun m!535409 () Bool)

(assert (=> b!557318 m!535409))

(assert (=> b!557319 m!535239))

(declare-fun m!535411 () Bool)

(assert (=> b!557319 m!535411))

(assert (=> b!557148 d!83501))

(declare-fun d!83515 () Bool)

(assert (=> d!83515 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557143 d!83515))

(declare-fun d!83519 () Bool)

(declare-fun res!349366 () Bool)

(declare-fun e!321097 () Bool)

(assert (=> d!83519 (=> res!349366 e!321097)))

(assert (=> d!83519 (= res!349366 (bvsge #b00000000000000000000000000000000 (size!17210 a!3118)))))

(assert (=> d!83519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321097)))

(declare-fun b!557341 () Bool)

(declare-fun e!321098 () Bool)

(assert (=> b!557341 (= e!321097 e!321098)))

(declare-fun c!64328 () Bool)

(assert (=> b!557341 (= c!64328 (validKeyInArray!0 (select (arr!16846 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32358 () Bool)

(declare-fun call!32361 () Bool)

(assert (=> bm!32358 (= call!32361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557342 () Bool)

(declare-fun e!321096 () Bool)

(assert (=> b!557342 (= e!321096 call!32361)))

(declare-fun b!557343 () Bool)

(assert (=> b!557343 (= e!321098 call!32361)))

(declare-fun b!557344 () Bool)

(assert (=> b!557344 (= e!321098 e!321096)))

(declare-fun lt!253293 () (_ BitVec 64))

(assert (=> b!557344 (= lt!253293 (select (arr!16846 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253294 () Unit!17347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35079 (_ BitVec 64) (_ BitVec 32)) Unit!17347)

(assert (=> b!557344 (= lt!253294 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253293 #b00000000000000000000000000000000))))

(assert (=> b!557344 (arrayContainsKey!0 a!3118 lt!253293 #b00000000000000000000000000000000)))

(declare-fun lt!253295 () Unit!17347)

(assert (=> b!557344 (= lt!253295 lt!253294)))

(declare-fun res!349367 () Bool)

(assert (=> b!557344 (= res!349367 (= (seekEntryOrOpen!0 (select (arr!16846 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5251 #b00000000000000000000000000000000)))))

(assert (=> b!557344 (=> (not res!349367) (not e!321096))))

(assert (= (and d!83519 (not res!349366)) b!557341))

(assert (= (and b!557341 c!64328) b!557344))

(assert (= (and b!557341 (not c!64328)) b!557343))

(assert (= (and b!557344 res!349367) b!557342))

(assert (= (or b!557342 b!557343) bm!32358))

(declare-fun m!535439 () Bool)

(assert (=> b!557341 m!535439))

(assert (=> b!557341 m!535439))

(declare-fun m!535441 () Bool)

(assert (=> b!557341 m!535441))

(declare-fun m!535443 () Bool)

(assert (=> bm!32358 m!535443))

(assert (=> b!557344 m!535439))

(declare-fun m!535445 () Bool)

(assert (=> b!557344 m!535445))

(declare-fun m!535447 () Bool)

(assert (=> b!557344 m!535447))

(assert (=> b!557344 m!535439))

(declare-fun m!535449 () Bool)

(assert (=> b!557344 m!535449))

(assert (=> b!557149 d!83519))

(declare-fun d!83529 () Bool)

(assert (=> d!83529 (= (validKeyInArray!0 (select (arr!16846 a!3118) j!142)) (and (not (= (select (arr!16846 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16846 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!557144 d!83529))

(declare-fun d!83531 () Bool)

(assert (=> d!83531 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50964 d!83531))

(declare-fun d!83539 () Bool)

(assert (=> d!83539 (= (array_inv!12705 a!3118) (bvsge (size!17210 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50964 d!83539))

(declare-fun b!557357 () Bool)

(declare-fun e!321109 () SeekEntryResult!5251)

(declare-fun lt!253306 () SeekEntryResult!5251)

(assert (=> b!557357 (= e!321109 (MissingZero!5251 (index!23233 lt!253306)))))

(declare-fun b!557358 () Bool)

(declare-fun c!64332 () Bool)

(declare-fun lt!253305 () (_ BitVec 64))

(assert (=> b!557358 (= c!64332 (= lt!253305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321108 () SeekEntryResult!5251)

(assert (=> b!557358 (= e!321108 e!321109)))

(declare-fun d!83541 () Bool)

(declare-fun lt!253307 () SeekEntryResult!5251)

(assert (=> d!83541 (and (or ((_ is Undefined!5251) lt!253307) (not ((_ is Found!5251) lt!253307)) (and (bvsge (index!23232 lt!253307) #b00000000000000000000000000000000) (bvslt (index!23232 lt!253307) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253307) ((_ is Found!5251) lt!253307) (not ((_ is MissingZero!5251) lt!253307)) (and (bvsge (index!23231 lt!253307) #b00000000000000000000000000000000) (bvslt (index!23231 lt!253307) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253307) ((_ is Found!5251) lt!253307) ((_ is MissingZero!5251) lt!253307) (not ((_ is MissingVacant!5251) lt!253307)) (and (bvsge (index!23234 lt!253307) #b00000000000000000000000000000000) (bvslt (index!23234 lt!253307) (size!17210 a!3118)))) (or ((_ is Undefined!5251) lt!253307) (ite ((_ is Found!5251) lt!253307) (= (select (arr!16846 a!3118) (index!23232 lt!253307)) k0!1914) (ite ((_ is MissingZero!5251) lt!253307) (= (select (arr!16846 a!3118) (index!23231 lt!253307)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5251) lt!253307) (= (select (arr!16846 a!3118) (index!23234 lt!253307)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!321110 () SeekEntryResult!5251)

(assert (=> d!83541 (= lt!253307 e!321110)))

(declare-fun c!64334 () Bool)

(assert (=> d!83541 (= c!64334 (and ((_ is Intermediate!5251) lt!253306) (undefined!6063 lt!253306)))))

(assert (=> d!83541 (= lt!253306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83541 (validMask!0 mask!3119)))

(assert (=> d!83541 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!253307)))

(declare-fun b!557359 () Bool)

(assert (=> b!557359 (= e!321110 Undefined!5251)))

(declare-fun b!557360 () Bool)

(assert (=> b!557360 (= e!321110 e!321108)))

(assert (=> b!557360 (= lt!253305 (select (arr!16846 a!3118) (index!23233 lt!253306)))))

(declare-fun c!64333 () Bool)

(assert (=> b!557360 (= c!64333 (= lt!253305 k0!1914))))

(declare-fun b!557361 () Bool)

(assert (=> b!557361 (= e!321109 (seekKeyOrZeroReturnVacant!0 (x!52278 lt!253306) (index!23233 lt!253306) (index!23233 lt!253306) k0!1914 a!3118 mask!3119))))

(declare-fun b!557362 () Bool)

(assert (=> b!557362 (= e!321108 (Found!5251 (index!23233 lt!253306)))))

(assert (= (and d!83541 c!64334) b!557359))

(assert (= (and d!83541 (not c!64334)) b!557360))

(assert (= (and b!557360 c!64333) b!557362))

(assert (= (and b!557360 (not c!64333)) b!557358))

(assert (= (and b!557358 c!64332) b!557357))

(assert (= (and b!557358 (not c!64332)) b!557361))

(declare-fun m!535457 () Bool)

(assert (=> d!83541 m!535457))

(declare-fun m!535459 () Bool)

(assert (=> d!83541 m!535459))

(assert (=> d!83541 m!535457))

(declare-fun m!535461 () Bool)

(assert (=> d!83541 m!535461))

(assert (=> d!83541 m!535265))

(declare-fun m!535463 () Bool)

(assert (=> d!83541 m!535463))

(declare-fun m!535465 () Bool)

(assert (=> d!83541 m!535465))

(declare-fun m!535467 () Bool)

(assert (=> b!557360 m!535467))

(declare-fun m!535469 () Bool)

(assert (=> b!557361 m!535469))

(assert (=> b!557145 d!83541))

(declare-fun b!557381 () Bool)

(declare-fun e!321125 () Bool)

(declare-fun e!321126 () Bool)

(assert (=> b!557381 (= e!321125 e!321126)))

(declare-fun res!349381 () Bool)

(assert (=> b!557381 (=> (not res!349381) (not e!321126))))

(declare-fun e!321124 () Bool)

(assert (=> b!557381 (= res!349381 (not e!321124))))

(declare-fun res!349382 () Bool)

(assert (=> b!557381 (=> (not res!349382) (not e!321124))))

(assert (=> b!557381 (= res!349382 (validKeyInArray!0 (select (arr!16846 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557382 () Bool)

(declare-fun e!321123 () Bool)

(assert (=> b!557382 (= e!321126 e!321123)))

(declare-fun c!64341 () Bool)

(assert (=> b!557382 (= c!64341 (validKeyInArray!0 (select (arr!16846 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557383 () Bool)

(declare-fun contains!2824 (List!10833 (_ BitVec 64)) Bool)

(assert (=> b!557383 (= e!321124 (contains!2824 Nil!10830 (select (arr!16846 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83543 () Bool)

(declare-fun res!349380 () Bool)

(assert (=> d!83543 (=> res!349380 e!321125)))

(assert (=> d!83543 (= res!349380 (bvsge #b00000000000000000000000000000000 (size!17210 a!3118)))))

(assert (=> d!83543 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10830) e!321125)))

(declare-fun b!557384 () Bool)

(declare-fun call!32367 () Bool)

(assert (=> b!557384 (= e!321123 call!32367)))

(declare-fun bm!32364 () Bool)

(assert (=> bm!32364 (= call!32367 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64341 (Cons!10829 (select (arr!16846 a!3118) #b00000000000000000000000000000000) Nil!10830) Nil!10830)))))

(declare-fun b!557385 () Bool)

(assert (=> b!557385 (= e!321123 call!32367)))

(assert (= (and d!83543 (not res!349380)) b!557381))

(assert (= (and b!557381 res!349382) b!557383))

(assert (= (and b!557381 res!349381) b!557382))

(assert (= (and b!557382 c!64341) b!557385))

(assert (= (and b!557382 (not c!64341)) b!557384))

(assert (= (or b!557385 b!557384) bm!32364))

(assert (=> b!557381 m!535439))

(assert (=> b!557381 m!535439))

(assert (=> b!557381 m!535441))

(assert (=> b!557382 m!535439))

(assert (=> b!557382 m!535439))

(assert (=> b!557382 m!535441))

(assert (=> b!557383 m!535439))

(assert (=> b!557383 m!535439))

(declare-fun m!535473 () Bool)

(assert (=> b!557383 m!535473))

(assert (=> bm!32364 m!535439))

(declare-fun m!535475 () Bool)

(assert (=> bm!32364 m!535475))

(assert (=> b!557140 d!83543))

(declare-fun d!83547 () Bool)

(declare-fun res!349393 () Bool)

(declare-fun e!321137 () Bool)

(assert (=> d!83547 (=> res!349393 e!321137)))

(assert (=> d!83547 (= res!349393 (= (select (arr!16846 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83547 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!321137)))

(declare-fun b!557400 () Bool)

(declare-fun e!321138 () Bool)

(assert (=> b!557400 (= e!321137 e!321138)))

(declare-fun res!349394 () Bool)

(assert (=> b!557400 (=> (not res!349394) (not e!321138))))

(assert (=> b!557400 (= res!349394 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17210 a!3118)))))

(declare-fun b!557401 () Bool)

(assert (=> b!557401 (= e!321138 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83547 (not res!349393)) b!557400))

(assert (= (and b!557400 res!349394) b!557401))

(assert (=> d!83547 m!535439))

(declare-fun m!535477 () Bool)

(assert (=> b!557401 m!535477))

(assert (=> b!557146 d!83547))

(declare-fun d!83549 () Bool)

(declare-fun res!349395 () Bool)

(declare-fun e!321140 () Bool)

(assert (=> d!83549 (=> res!349395 e!321140)))

(assert (=> d!83549 (= res!349395 (bvsge j!142 (size!17210 a!3118)))))

(assert (=> d!83549 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321140)))

(declare-fun b!557402 () Bool)

(declare-fun e!321141 () Bool)

(assert (=> b!557402 (= e!321140 e!321141)))

(declare-fun c!64344 () Bool)

(assert (=> b!557402 (= c!64344 (validKeyInArray!0 (select (arr!16846 a!3118) j!142)))))

(declare-fun call!32368 () Bool)

(declare-fun bm!32365 () Bool)

(assert (=> bm!32365 (= call!32368 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557403 () Bool)

(declare-fun e!321139 () Bool)

(assert (=> b!557403 (= e!321139 call!32368)))

(declare-fun b!557404 () Bool)

(assert (=> b!557404 (= e!321141 call!32368)))

(declare-fun b!557405 () Bool)

(assert (=> b!557405 (= e!321141 e!321139)))

(declare-fun lt!253315 () (_ BitVec 64))

(assert (=> b!557405 (= lt!253315 (select (arr!16846 a!3118) j!142))))

(declare-fun lt!253316 () Unit!17347)

(assert (=> b!557405 (= lt!253316 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253315 j!142))))

(assert (=> b!557405 (arrayContainsKey!0 a!3118 lt!253315 #b00000000000000000000000000000000)))

(declare-fun lt!253317 () Unit!17347)

(assert (=> b!557405 (= lt!253317 lt!253316)))

(declare-fun res!349396 () Bool)

(assert (=> b!557405 (= res!349396 (= (seekEntryOrOpen!0 (select (arr!16846 a!3118) j!142) a!3118 mask!3119) (Found!5251 j!142)))))

(assert (=> b!557405 (=> (not res!349396) (not e!321139))))

(assert (= (and d!83549 (not res!349395)) b!557402))

(assert (= (and b!557402 c!64344) b!557405))

(assert (= (and b!557402 (not c!64344)) b!557404))

(assert (= (and b!557405 res!349396) b!557403))

(assert (= (or b!557403 b!557404) bm!32365))

(assert (=> b!557402 m!535239))

(assert (=> b!557402 m!535239))

(assert (=> b!557402 m!535269))

(declare-fun m!535479 () Bool)

(assert (=> bm!32365 m!535479))

(assert (=> b!557405 m!535239))

(declare-fun m!535481 () Bool)

(assert (=> b!557405 m!535481))

(declare-fun m!535483 () Bool)

(assert (=> b!557405 m!535483))

(assert (=> b!557405 m!535239))

(assert (=> b!557405 m!535241))

(assert (=> b!557141 d!83549))

(declare-fun d!83551 () Bool)

(assert (=> d!83551 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253328 () Unit!17347)

(declare-fun choose!38 (array!35079 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17347)

(assert (=> d!83551 (= lt!253328 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83551 (validMask!0 mask!3119)))

(assert (=> d!83551 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253328)))

(declare-fun bs!17367 () Bool)

(assert (= bs!17367 d!83551))

(assert (=> bs!17367 m!535261))

(declare-fun m!535501 () Bool)

(assert (=> bs!17367 m!535501))

(assert (=> bs!17367 m!535265))

(assert (=> b!557141 d!83551))

(check-sat (not d!83489) (not d!83495) (not d!83501) (not b!557319) (not b!557381) (not b!557344) (not bm!32365) (not b!557245) (not b!557402) (not b!557401) (not b!557341) (not d!83551) (not b!557382) (not b!557383) (not b!557361) (not d!83541) (not bm!32358) (not bm!32364) (not b!557405) (not b!557236))
(check-sat)
