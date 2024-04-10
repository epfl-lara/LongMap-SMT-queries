; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32896 () Bool)

(assert start!32896)

(declare-fun b!328142 () Bool)

(declare-fun res!180733 () Bool)

(declare-fun e!201751 () Bool)

(assert (=> b!328142 (=> (not res!180733) (not e!201751))))

(declare-datatypes ((array!16792 0))(
  ( (array!16793 (arr!7946 (Array (_ BitVec 32) (_ BitVec 64))) (size!8298 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16792)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16792 (_ BitVec 32)) Bool)

(assert (=> b!328142 (= res!180733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!180734 () Bool)

(assert (=> start!32896 (=> (not res!180734) (not e!201751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32896 (= res!180734 (validMask!0 mask!3777))))

(assert (=> start!32896 e!201751))

(declare-fun array_inv!5909 (array!16792) Bool)

(assert (=> start!32896 (array_inv!5909 a!3305)))

(assert (=> start!32896 true))

(declare-fun b!328143 () Bool)

(declare-fun res!180738 () Bool)

(assert (=> b!328143 (=> (not res!180738) (not e!201751))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328143 (= res!180738 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328144 () Bool)

(declare-fun res!180736 () Bool)

(assert (=> b!328144 (=> (not res!180736) (not e!201751))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3077 0))(
  ( (MissingZero!3077 (index!14484 (_ BitVec 32))) (Found!3077 (index!14485 (_ BitVec 32))) (Intermediate!3077 (undefined!3889 Bool) (index!14486 (_ BitVec 32)) (x!32744 (_ BitVec 32))) (Undefined!3077) (MissingVacant!3077 (index!14487 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16792 (_ BitVec 32)) SeekEntryResult!3077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328144 (= res!180736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!3077 false resIndex!58 resX!58)))))

(declare-fun b!328145 () Bool)

(declare-fun res!180737 () Bool)

(assert (=> b!328145 (=> (not res!180737) (not e!201751))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328145 (= res!180737 (and (= (size!8298 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8298 a!3305))))))

(declare-fun b!328146 () Bool)

(declare-fun res!180735 () Bool)

(assert (=> b!328146 (=> (not res!180735) (not e!201751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328146 (= res!180735 (validKeyInArray!0 k!2497))))

(declare-fun b!328147 () Bool)

(declare-fun res!180732 () Bool)

(assert (=> b!328147 (=> (not res!180732) (not e!201751))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16792 (_ BitVec 32)) SeekEntryResult!3077)

(assert (=> b!328147 (= res!180732 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3077 i!1250)))))

(declare-fun b!328148 () Bool)

(assert (=> b!328148 (= e!201751 (or (bvslt resIndex!58 #b00000000000000000000000000000000) (bvsge resIndex!58 (size!8298 a!3305))))))

(assert (= (and start!32896 res!180734) b!328145))

(assert (= (and b!328145 res!180737) b!328146))

(assert (= (and b!328146 res!180735) b!328143))

(assert (= (and b!328143 res!180738) b!328147))

(assert (= (and b!328147 res!180732) b!328142))

(assert (= (and b!328142 res!180733) b!328144))

(assert (= (and b!328144 res!180736) b!328148))

(declare-fun m!334241 () Bool)

(assert (=> b!328144 m!334241))

(assert (=> b!328144 m!334241))

(declare-fun m!334243 () Bool)

(assert (=> b!328144 m!334243))

(declare-fun m!334245 () Bool)

(assert (=> b!328146 m!334245))

(declare-fun m!334247 () Bool)

(assert (=> b!328147 m!334247))

(declare-fun m!334249 () Bool)

(assert (=> start!32896 m!334249))

(declare-fun m!334251 () Bool)

(assert (=> start!32896 m!334251))

(declare-fun m!334253 () Bool)

(assert (=> b!328143 m!334253))

(declare-fun m!334255 () Bool)

(assert (=> b!328142 m!334255))

(push 1)

(assert (not start!32896))

(assert (not b!328142))

(assert (not b!328144))

(assert (not b!328147))

(assert (not b!328146))

(assert (not b!328143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!328209 () Bool)

(declare-fun e!201775 () Bool)

(declare-fun call!26119 () Bool)

(assert (=> b!328209 (= e!201775 call!26119)))

(declare-fun d!69983 () Bool)

(declare-fun res!180786 () Bool)

(declare-fun e!201776 () Bool)

(assert (=> d!69983 (=> res!180786 e!201776)))

(assert (=> d!69983 (= res!180786 (bvsge #b00000000000000000000000000000000 (size!8298 a!3305)))))

(assert (=> d!69983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201776)))

(declare-fun b!328210 () Bool)

(declare-fun e!201774 () Bool)

(assert (=> b!328210 (= e!201774 call!26119)))

(declare-fun bm!26116 () Bool)

(assert (=> bm!26116 (= call!26119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328211 () Bool)

(assert (=> b!328211 (= e!201776 e!201774)))

(declare-fun c!51346 () Bool)

(assert (=> b!328211 (= c!51346 (validKeyInArray!0 (select (arr!7946 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328212 () Bool)

(assert (=> b!328212 (= e!201774 e!201775)))

(declare-fun lt!157826 () (_ BitVec 64))

(assert (=> b!328212 (= lt!157826 (select (arr!7946 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10188 0))(
  ( (Unit!10189) )
))
(declare-fun lt!157828 () Unit!10188)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16792 (_ BitVec 64) (_ BitVec 32)) Unit!10188)

(assert (=> b!328212 (= lt!157828 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157826 #b00000000000000000000000000000000))))

(assert (=> b!328212 (arrayContainsKey!0 a!3305 lt!157826 #b00000000000000000000000000000000)))

(declare-fun lt!157827 () Unit!10188)

(assert (=> b!328212 (= lt!157827 lt!157828)))

(declare-fun res!180785 () Bool)

(assert (=> b!328212 (= res!180785 (= (seekEntryOrOpen!0 (select (arr!7946 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3077 #b00000000000000000000000000000000)))))

(assert (=> b!328212 (=> (not res!180785) (not e!201775))))

(assert (= (and d!69983 (not res!180786)) b!328211))

(assert (= (and b!328211 c!51346) b!328212))

(assert (= (and b!328211 (not c!51346)) b!328210))

(assert (= (and b!328212 res!180785) b!328209))

(assert (= (or b!328209 b!328210) bm!26116))

(declare-fun m!334289 () Bool)

(assert (=> bm!26116 m!334289))

(declare-fun m!334291 () Bool)

(assert (=> b!328211 m!334291))

(assert (=> b!328211 m!334291))

(declare-fun m!334293 () Bool)

(assert (=> b!328211 m!334293))

(assert (=> b!328212 m!334291))

(declare-fun m!334295 () Bool)

(assert (=> b!328212 m!334295))

(declare-fun m!334297 () Bool)

(assert (=> b!328212 m!334297))

(assert (=> b!328212 m!334291))

(declare-fun m!334299 () Bool)

(assert (=> b!328212 m!334299))

(assert (=> b!328142 d!69983))

(declare-fun d!69987 () Bool)

(assert (=> d!69987 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32896 d!69987))

(declare-fun d!69999 () Bool)

(assert (=> d!69999 (= (array_inv!5909 a!3305) (bvsge (size!8298 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32896 d!69999))

(declare-fun b!328311 () Bool)

(declare-fun e!201835 () SeekEntryResult!3077)

(declare-fun e!201833 () SeekEntryResult!3077)

(assert (=> b!328311 (= e!201835 e!201833)))

(declare-fun lt!157875 () (_ BitVec 64))

(declare-fun lt!157874 () SeekEntryResult!3077)

(assert (=> b!328311 (= lt!157875 (select (arr!7946 a!3305) (index!14486 lt!157874)))))

(declare-fun c!51385 () Bool)

(assert (=> b!328311 (= c!51385 (= lt!157875 k!2497))))

(declare-fun b!328312 () Bool)

(declare-fun e!201834 () SeekEntryResult!3077)

(assert (=> b!328312 (= e!201834 (MissingZero!3077 (index!14486 lt!157874)))))

(declare-fun b!328313 () Bool)

(assert (=> b!328313 (= e!201833 (Found!3077 (index!14486 lt!157874)))))

(declare-fun b!328314 () Bool)

(assert (=> b!328314 (= e!201835 Undefined!3077)))

(declare-fun b!328315 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16792 (_ BitVec 32)) SeekEntryResult!3077)

(assert (=> b!328315 (= e!201834 (seekKeyOrZeroReturnVacant!0 (x!32744 lt!157874) (index!14486 lt!157874) (index!14486 lt!157874) k!2497 a!3305 mask!3777))))

(declare-fun b!328316 () Bool)

(declare-fun c!51387 () Bool)

(assert (=> b!328316 (= c!51387 (= lt!157875 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328316 (= e!201833 e!201834)))

(declare-fun d!70001 () Bool)

(declare-fun lt!157873 () SeekEntryResult!3077)

(assert (=> d!70001 (and (or (is-Undefined!3077 lt!157873) (not (is-Found!3077 lt!157873)) (and (bvsge (index!14485 lt!157873) #b00000000000000000000000000000000) (bvslt (index!14485 lt!157873) (size!8298 a!3305)))) (or (is-Undefined!3077 lt!157873) (is-Found!3077 lt!157873) (not (is-MissingZero!3077 lt!157873)) (and (bvsge (index!14484 lt!157873) #b00000000000000000000000000000000) (bvslt (index!14484 lt!157873) (size!8298 a!3305)))) (or (is-Undefined!3077 lt!157873) (is-Found!3077 lt!157873) (is-MissingZero!3077 lt!157873) (not (is-MissingVacant!3077 lt!157873)) (and (bvsge (index!14487 lt!157873) #b00000000000000000000000000000000) (bvslt (index!14487 lt!157873) (size!8298 a!3305)))) (or (is-Undefined!3077 lt!157873) (ite (is-Found!3077 lt!157873) (= (select (arr!7946 a!3305) (index!14485 lt!157873)) k!2497) (ite (is-MissingZero!3077 lt!157873) (= (select (arr!7946 a!3305) (index!14484 lt!157873)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3077 lt!157873) (= (select (arr!7946 a!3305) (index!14487 lt!157873)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70001 (= lt!157873 e!201835)))

(declare-fun c!51386 () Bool)

(assert (=> d!70001 (= c!51386 (and (is-Intermediate!3077 lt!157874) (undefined!3889 lt!157874)))))

(assert (=> d!70001 (= lt!157874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777))))

(assert (=> d!70001 (validMask!0 mask!3777)))

(assert (=> d!70001 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) lt!157873)))

(assert (= (and d!70001 c!51386) b!328314))

(assert (= (and d!70001 (not c!51386)) b!328311))

(assert (= (and b!328311 c!51385) b!328313))

(assert (= (and b!328311 (not c!51385)) b!328316))

(assert (= (and b!328316 c!51387) b!328312))

(assert (= (and b!328316 (not c!51387)) b!328315))

(declare-fun m!334341 () Bool)

(assert (=> b!328311 m!334341))

(declare-fun m!334343 () Bool)

(assert (=> b!328315 m!334343))

(assert (=> d!70001 m!334241))

(assert (=> d!70001 m!334243))

(declare-fun m!334345 () Bool)

(assert (=> d!70001 m!334345))

(declare-fun m!334347 () Bool)

(assert (=> d!70001 m!334347))

(declare-fun m!334349 () Bool)

(assert (=> d!70001 m!334349))

(assert (=> d!70001 m!334241))

(assert (=> d!70001 m!334249))

(assert (=> b!328147 d!70001))

(declare-fun d!70009 () Bool)

(declare-fun res!180817 () Bool)

(declare-fun e!201840 () Bool)

(assert (=> d!70009 (=> res!180817 e!201840)))

(assert (=> d!70009 (= res!180817 (= (select (arr!7946 a!3305) #b00000000000000000000000000000000) k!2497))))

(assert (=> d!70009 (= (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000) e!201840)))

(declare-fun b!328321 () Bool)

(declare-fun e!201841 () Bool)

(assert (=> b!328321 (= e!201840 e!201841)))

(declare-fun res!180818 () Bool)

(assert (=> b!328321 (=> (not res!180818) (not e!201841))))

(assert (=> b!328321 (= res!180818 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8298 a!3305)))))

(declare-fun b!328322 () Bool)

(assert (=> b!328322 (= e!201841 (arrayContainsKey!0 a!3305 k!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70009 (not res!180817)) b!328321))

(assert (= (and b!328321 res!180818) b!328322))

(assert (=> d!70009 m!334291))

(declare-fun m!334351 () Bool)

(assert (=> b!328322 m!334351))

(assert (=> b!328143 d!70009))

(declare-fun b!328371 () Bool)

(declare-fun e!201876 () SeekEntryResult!3077)

(assert (=> b!328371 (= e!201876 (Intermediate!3077 true (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328372 () Bool)

(declare-fun e!201879 () Bool)

(declare-fun lt!157899 () SeekEntryResult!3077)

(assert (=> b!328372 (= e!201879 (bvsge (x!32744 lt!157899) #b01111111111111111111111111111110))))

(declare-fun b!328373 () Bool)

(assert (=> b!328373 (and (bvsge (index!14486 lt!157899) #b00000000000000000000000000000000) (bvslt (index!14486 lt!157899) (size!8298 a!3305)))))

(declare-fun e!201877 () Bool)

(assert (=> b!328373 (= e!201877 (= (select (arr!7946 a!3305) (index!14486 lt!157899)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!70015 () Bool)

(assert (=> d!70015 e!201879))

(declare-fun c!51401 () Bool)

(assert (=> d!70015 (= c!51401 (and (is-Intermediate!3077 lt!157899) (undefined!3889 lt!157899)))))

(assert (=> d!70015 (= lt!157899 e!201876)))

(declare-fun c!51402 () Bool)

(assert (=> d!70015 (= c!51402 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!157898 () (_ BitVec 64))

(assert (=> d!70015 (= lt!157898 (select (arr!7946 a!3305) (toIndex!0 k!2497 mask!3777)))))

(assert (=> d!70015 (validMask!0 mask!3777)))

(assert (=> d!70015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157899)))

(declare-fun e!201878 () SeekEntryResult!3077)

(declare-fun b!328374 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328374 (= e!201878 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k!2497 a!3305 mask!3777))))

(declare-fun b!328375 () Bool)

(assert (=> b!328375 (and (bvsge (index!14486 lt!157899) #b00000000000000000000000000000000) (bvslt (index!14486 lt!157899) (size!8298 a!3305)))))

(declare-fun res!180844 () Bool)

(assert (=> b!328375 (= res!180844 (= (select (arr!7946 a!3305) (index!14486 lt!157899)) k!2497))))

(assert (=> b!328375 (=> res!180844 e!201877)))

(declare-fun e!201880 () Bool)

(assert (=> b!328375 (= e!201880 e!201877)))

(declare-fun b!328376 () Bool)

(assert (=> b!328376 (= e!201878 (Intermediate!3077 false (toIndex!0 k!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328377 () Bool)

(assert (=> b!328377 (and (bvsge (index!14486 lt!157899) #b00000000000000000000000000000000) (bvslt (index!14486 lt!157899) (size!8298 a!3305)))))

(declare-fun res!180843 () Bool)

(assert (=> b!328377 (= res!180843 (= (select (arr!7946 a!3305) (index!14486 lt!157899)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328377 (=> res!180843 e!201877)))

(declare-fun b!328378 () Bool)

(assert (=> b!328378 (= e!201879 e!201880)))

(declare-fun res!180845 () Bool)

(assert (=> b!328378 (= res!180845 (and (is-Intermediate!3077 lt!157899) (not (undefined!3889 lt!157899)) (bvslt (x!32744 lt!157899) #b01111111111111111111111111111110) (bvsge (x!32744 lt!157899) #b00000000000000000000000000000000) (bvsge (x!32744 lt!157899) #b00000000000000000000000000000000)))))

(assert (=> b!328378 (=> (not res!180845) (not e!201880))))

(declare-fun b!328379 () Bool)

(assert (=> b!328379 (= e!201876 e!201878)))

(declare-fun c!51400 () Bool)

(assert (=> b!328379 (= c!51400 (or (= lt!157898 k!2497) (= (bvadd lt!157898 lt!157898) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!70015 c!51402) b!328371))

(assert (= (and d!70015 (not c!51402)) b!328379))

(assert (= (and b!328379 c!51400) b!328376))

(assert (= (and b!328379 (not c!51400)) b!328374))

(assert (= (and d!70015 c!51401) b!328372))

(assert (= (and d!70015 (not c!51401)) b!328378))

(assert (= (and b!328378 res!180845) b!328375))

(assert (= (and b!328375 (not res!180844)) b!328377))

(assert (= (and b!328377 (not res!180843)) b!328373))

(assert (=> d!70015 m!334241))

(declare-fun m!334377 () Bool)

(assert (=> d!70015 m!334377))

(assert (=> d!70015 m!334249))

(declare-fun m!334379 () Bool)

(assert (=> b!328375 m!334379))

(assert (=> b!328377 m!334379))

(assert (=> b!328374 m!334241))

(declare-fun m!334381 () Bool)

(assert (=> b!328374 m!334381))

(assert (=> b!328374 m!334381))

(declare-fun m!334383 () Bool)

(assert (=> b!328374 m!334383))

(assert (=> b!328373 m!334379))

(assert (=> b!328144 d!70015))

(declare-fun d!70025 () Bool)

(declare-fun lt!157905 () (_ BitVec 32))

(declare-fun lt!157904 () (_ BitVec 32))

(assert (=> d!70025 (= lt!157905 (bvmul (bvxor lt!157904 (bvlshr lt!157904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70025 (= lt!157904 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70025 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180846 (let ((h!5408 ((_ extract 31 0) (bvand (bvxor k!2497 (bvlshr k!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32752 (bvmul (bvxor h!5408 (bvlshr h!5408 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32752 (bvlshr x!32752 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180846 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180846 #b00000000000000000000000000000000))))))

(assert (=> d!70025 (= (toIndex!0 k!2497 mask!3777) (bvand (bvxor lt!157905 (bvlshr lt!157905 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328144 d!70025))

(declare-fun d!70027 () Bool)

(assert (=> d!70027 (= (validKeyInArray!0 k!2497) (and (not (= k!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328146 d!70027))

(push 1)

(assert (not d!70001))

(assert (not d!70015))

(assert (not b!328374))

(assert (not b!328212))

(assert (not bm!26116))

(assert (not b!328322))

(assert (not b!328315))

(assert (not b!328211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

