; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66918 () Bool)

(assert start!66918)

(declare-fun b!772238 () Bool)

(declare-fun e!429896 () Bool)

(declare-fun e!429900 () Bool)

(assert (=> b!772238 (= e!429896 e!429900)))

(declare-fun res!522364 () Bool)

(assert (=> b!772238 (=> (not res!522364) (not e!429900))))

(declare-datatypes ((array!42411 0))(
  ( (array!42412 (arr!20304 (Array (_ BitVec 32) (_ BitVec 64))) (size!20725 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42411)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7904 0))(
  ( (MissingZero!7904 (index!33984 (_ BitVec 32))) (Found!7904 (index!33985 (_ BitVec 32))) (Intermediate!7904 (undefined!8716 Bool) (index!33986 (_ BitVec 32)) (x!64919 (_ BitVec 32))) (Undefined!7904) (MissingVacant!7904 (index!33987 (_ BitVec 32))) )
))
(declare-fun lt!343816 () SeekEntryResult!7904)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42411 (_ BitVec 32)) SeekEntryResult!7904)

(assert (=> b!772238 (= res!522364 (= (seekEntryOrOpen!0 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343816))))

(assert (=> b!772238 (= lt!343816 (Found!7904 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!772239 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42411 (_ BitVec 32)) SeekEntryResult!7904)

(assert (=> b!772239 (= e!429900 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343816))))

(declare-fun b!772240 () Bool)

(declare-fun res!522358 () Bool)

(declare-fun e!429899 () Bool)

(assert (=> b!772240 (=> (not res!522358) (not e!429899))))

(declare-datatypes ((List!14306 0))(
  ( (Nil!14303) (Cons!14302 (h!15404 (_ BitVec 64)) (t!20621 List!14306)) )
))
(declare-fun arrayNoDuplicates!0 (array!42411 (_ BitVec 32) List!14306) Bool)

(assert (=> b!772240 (= res!522358 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14303))))

(declare-fun b!772241 () Bool)

(declare-datatypes ((Unit!26630 0))(
  ( (Unit!26631) )
))
(declare-fun e!429903 () Unit!26630)

(declare-fun Unit!26632 () Unit!26630)

(assert (=> b!772241 (= e!429903 Unit!26632)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343821 () SeekEntryResult!7904)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!772241 (= lt!343821 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343818 () (_ BitVec 32))

(assert (=> b!772241 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343818 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) (Found!7904 j!159))))

(declare-fun b!772242 () Bool)

(declare-fun res!522371 () Bool)

(declare-fun e!429897 () Bool)

(assert (=> b!772242 (=> (not res!522371) (not e!429897))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772242 (= res!522371 (and (= (size!20725 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20725 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20725 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772243 () Bool)

(declare-fun res!522362 () Bool)

(assert (=> b!772243 (=> (not res!522362) (not e!429899))))

(assert (=> b!772243 (= res!522362 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20725 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20725 a!3186))))))

(declare-fun b!772244 () Bool)

(declare-fun e!429901 () Bool)

(declare-fun e!429904 () Bool)

(assert (=> b!772244 (= e!429901 (not e!429904))))

(declare-fun res!522363 () Bool)

(assert (=> b!772244 (=> res!522363 e!429904)))

(declare-fun lt!343819 () SeekEntryResult!7904)

(assert (=> b!772244 (= res!522363 (or (not (is-Intermediate!7904 lt!343819)) (bvsge x!1131 (x!64919 lt!343819))))))

(assert (=> b!772244 e!429896))

(declare-fun res!522361 () Bool)

(assert (=> b!772244 (=> (not res!522361) (not e!429896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42411 (_ BitVec 32)) Bool)

(assert (=> b!772244 (= res!522361 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343825 () Unit!26630)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26630)

(assert (=> b!772244 (= lt!343825 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772245 () Bool)

(declare-fun res!522366 () Bool)

(declare-fun e!429898 () Bool)

(assert (=> b!772245 (=> (not res!522366) (not e!429898))))

(declare-fun e!429902 () Bool)

(assert (=> b!772245 (= res!522366 e!429902)))

(declare-fun c!85338 () Bool)

(assert (=> b!772245 (= c!85338 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772246 () Bool)

(assert (=> b!772246 (= e!429897 e!429899)))

(declare-fun res!522367 () Bool)

(assert (=> b!772246 (=> (not res!522367) (not e!429899))))

(declare-fun lt!343822 () SeekEntryResult!7904)

(assert (=> b!772246 (= res!522367 (or (= lt!343822 (MissingZero!7904 i!1173)) (= lt!343822 (MissingVacant!7904 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!772246 (= lt!343822 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!772247 () Bool)

(declare-fun res!522357 () Bool)

(assert (=> b!772247 (=> (not res!522357) (not e!429897))))

(declare-fun arrayContainsKey!0 (array!42411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772247 (= res!522357 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772248 () Bool)

(declare-fun Unit!26633 () Unit!26630)

(assert (=> b!772248 (= e!429903 Unit!26633)))

(declare-fun lt!343824 () SeekEntryResult!7904)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42411 (_ BitVec 32)) SeekEntryResult!7904)

(assert (=> b!772248 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343818 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343824)))

(declare-fun b!772249 () Bool)

(declare-fun res!522360 () Bool)

(assert (=> b!772249 (=> (not res!522360) (not e!429898))))

(assert (=> b!772249 (= res!522360 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20304 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772251 () Bool)

(declare-fun res!522369 () Bool)

(assert (=> b!772251 (=> (not res!522369) (not e!429899))))

(assert (=> b!772251 (= res!522369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772252 () Bool)

(assert (=> b!772252 (= e!429902 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) (Found!7904 j!159)))))

(declare-fun b!772253 () Bool)

(declare-fun res!522356 () Bool)

(assert (=> b!772253 (=> (not res!522356) (not e!429897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772253 (= res!522356 (validKeyInArray!0 (select (arr!20304 a!3186) j!159)))))

(declare-fun b!772254 () Bool)

(assert (=> b!772254 (= e!429904 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (and (bvsge lt!343818 #b00000000000000000000000000000000) (bvslt lt!343818 (size!20725 a!3186)))))))

(declare-fun lt!343823 () Unit!26630)

(assert (=> b!772254 (= lt!343823 e!429903)))

(declare-fun c!85339 () Bool)

(assert (=> b!772254 (= c!85339 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772254 (= lt!343818 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772255 () Bool)

(assert (=> b!772255 (= e!429898 e!429901)))

(declare-fun res!522365 () Bool)

(assert (=> b!772255 (=> (not res!522365) (not e!429901))))

(declare-fun lt!343826 () SeekEntryResult!7904)

(assert (=> b!772255 (= res!522365 (= lt!343826 lt!343819))))

(declare-fun lt!343817 () array!42411)

(declare-fun lt!343820 () (_ BitVec 64))

(assert (=> b!772255 (= lt!343819 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343820 lt!343817 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772255 (= lt!343826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343820 mask!3328) lt!343820 lt!343817 mask!3328))))

(assert (=> b!772255 (= lt!343820 (select (store (arr!20304 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772255 (= lt!343817 (array!42412 (store (arr!20304 a!3186) i!1173 k!2102) (size!20725 a!3186)))))

(declare-fun b!772256 () Bool)

(declare-fun res!522368 () Bool)

(assert (=> b!772256 (=> (not res!522368) (not e!429897))))

(assert (=> b!772256 (= res!522368 (validKeyInArray!0 k!2102))))

(declare-fun b!772257 () Bool)

(assert (=> b!772257 (= e!429902 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343824))))

(declare-fun b!772250 () Bool)

(assert (=> b!772250 (= e!429899 e!429898)))

(declare-fun res!522359 () Bool)

(assert (=> b!772250 (=> (not res!522359) (not e!429898))))

(assert (=> b!772250 (= res!522359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343824))))

(assert (=> b!772250 (= lt!343824 (Intermediate!7904 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!522370 () Bool)

(assert (=> start!66918 (=> (not res!522370) (not e!429897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66918 (= res!522370 (validMask!0 mask!3328))))

(assert (=> start!66918 e!429897))

(assert (=> start!66918 true))

(declare-fun array_inv!16100 (array!42411) Bool)

(assert (=> start!66918 (array_inv!16100 a!3186)))

(assert (= (and start!66918 res!522370) b!772242))

(assert (= (and b!772242 res!522371) b!772253))

(assert (= (and b!772253 res!522356) b!772256))

(assert (= (and b!772256 res!522368) b!772247))

(assert (= (and b!772247 res!522357) b!772246))

(assert (= (and b!772246 res!522367) b!772251))

(assert (= (and b!772251 res!522369) b!772240))

(assert (= (and b!772240 res!522358) b!772243))

(assert (= (and b!772243 res!522362) b!772250))

(assert (= (and b!772250 res!522359) b!772249))

(assert (= (and b!772249 res!522360) b!772245))

(assert (= (and b!772245 c!85338) b!772257))

(assert (= (and b!772245 (not c!85338)) b!772252))

(assert (= (and b!772245 res!522366) b!772255))

(assert (= (and b!772255 res!522365) b!772244))

(assert (= (and b!772244 res!522361) b!772238))

(assert (= (and b!772238 res!522364) b!772239))

(assert (= (and b!772244 (not res!522363)) b!772254))

(assert (= (and b!772254 c!85339) b!772248))

(assert (= (and b!772254 (not c!85339)) b!772241))

(declare-fun m!717203 () Bool)

(assert (=> b!772250 m!717203))

(assert (=> b!772250 m!717203))

(declare-fun m!717205 () Bool)

(assert (=> b!772250 m!717205))

(assert (=> b!772250 m!717205))

(assert (=> b!772250 m!717203))

(declare-fun m!717207 () Bool)

(assert (=> b!772250 m!717207))

(declare-fun m!717209 () Bool)

(assert (=> b!772256 m!717209))

(declare-fun m!717211 () Bool)

(assert (=> b!772255 m!717211))

(declare-fun m!717213 () Bool)

(assert (=> b!772255 m!717213))

(declare-fun m!717215 () Bool)

(assert (=> b!772255 m!717215))

(declare-fun m!717217 () Bool)

(assert (=> b!772255 m!717217))

(assert (=> b!772255 m!717217))

(declare-fun m!717219 () Bool)

(assert (=> b!772255 m!717219))

(declare-fun m!717221 () Bool)

(assert (=> start!66918 m!717221))

(declare-fun m!717223 () Bool)

(assert (=> start!66918 m!717223))

(assert (=> b!772252 m!717203))

(assert (=> b!772252 m!717203))

(declare-fun m!717225 () Bool)

(assert (=> b!772252 m!717225))

(assert (=> b!772238 m!717203))

(assert (=> b!772238 m!717203))

(declare-fun m!717227 () Bool)

(assert (=> b!772238 m!717227))

(assert (=> b!772253 m!717203))

(assert (=> b!772253 m!717203))

(declare-fun m!717229 () Bool)

(assert (=> b!772253 m!717229))

(assert (=> b!772241 m!717203))

(assert (=> b!772241 m!717203))

(assert (=> b!772241 m!717225))

(assert (=> b!772241 m!717203))

(declare-fun m!717231 () Bool)

(assert (=> b!772241 m!717231))

(assert (=> b!772257 m!717203))

(assert (=> b!772257 m!717203))

(declare-fun m!717233 () Bool)

(assert (=> b!772257 m!717233))

(declare-fun m!717235 () Bool)

(assert (=> b!772249 m!717235))

(assert (=> b!772239 m!717203))

(assert (=> b!772239 m!717203))

(declare-fun m!717237 () Bool)

(assert (=> b!772239 m!717237))

(declare-fun m!717239 () Bool)

(assert (=> b!772251 m!717239))

(assert (=> b!772248 m!717203))

(assert (=> b!772248 m!717203))

(declare-fun m!717241 () Bool)

(assert (=> b!772248 m!717241))

(declare-fun m!717243 () Bool)

(assert (=> b!772246 m!717243))

(declare-fun m!717245 () Bool)

(assert (=> b!772240 m!717245))

(declare-fun m!717247 () Bool)

(assert (=> b!772254 m!717247))

(declare-fun m!717249 () Bool)

(assert (=> b!772244 m!717249))

(declare-fun m!717251 () Bool)

(assert (=> b!772244 m!717251))

(declare-fun m!717253 () Bool)

(assert (=> b!772247 m!717253))

(push 1)

(assert (not b!772252))

(assert (not b!772255))

(assert (not b!772254))

(assert (not b!772247))

(assert (not b!772244))

(assert (not b!772238))

(assert (not b!772239))

(assert (not b!772251))

(assert (not b!772253))

(assert (not b!772248))

(assert (not start!66918))

(assert (not b!772256))

(assert (not b!772240))

(assert (not b!772250))

(assert (not b!772241))

(assert (not b!772257))

(assert (not b!772246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!772468 () Bool)

(declare-fun lt!343931 () SeekEntryResult!7904)

(assert (=> b!772468 (and (bvsge (index!33986 lt!343931) #b00000000000000000000000000000000) (bvslt (index!33986 lt!343931) (size!20725 a!3186)))))

(declare-fun res!522494 () Bool)

(assert (=> b!772468 (= res!522494 (= (select (arr!20304 a!3186) (index!33986 lt!343931)) (select (arr!20304 a!3186) j!159)))))

(declare-fun e!430018 () Bool)

(assert (=> b!772468 (=> res!522494 e!430018)))

(declare-fun e!430019 () Bool)

(assert (=> b!772468 (= e!430019 e!430018)))

(declare-fun b!772469 () Bool)

(declare-fun e!430021 () SeekEntryResult!7904)

(assert (=> b!772469 (= e!430021 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772470 () Bool)

(assert (=> b!772470 (= e!430021 (Intermediate!7904 false (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101839 () Bool)

(declare-fun e!430020 () Bool)

(assert (=> d!101839 e!430020))

(declare-fun c!85385 () Bool)

(assert (=> d!101839 (= c!85385 (and (is-Intermediate!7904 lt!343931) (undefined!8716 lt!343931)))))

(declare-fun e!430017 () SeekEntryResult!7904)

(assert (=> d!101839 (= lt!343931 e!430017)))

(declare-fun c!85387 () Bool)

(assert (=> d!101839 (= c!85387 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!343932 () (_ BitVec 64))

(assert (=> d!101839 (= lt!343932 (select (arr!20304 a!3186) (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328)))))

(assert (=> d!101839 (validMask!0 mask!3328)))

(assert (=> d!101839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343931)))

(declare-fun b!772471 () Bool)

(assert (=> b!772471 (= e!430020 (bvsge (x!64919 lt!343931) #b01111111111111111111111111111110))))

(declare-fun b!772472 () Bool)

(assert (=> b!772472 (= e!430020 e!430019)))

(declare-fun res!522493 () Bool)

(assert (=> b!772472 (= res!522493 (and (is-Intermediate!7904 lt!343931) (not (undefined!8716 lt!343931)) (bvslt (x!64919 lt!343931) #b01111111111111111111111111111110) (bvsge (x!64919 lt!343931) #b00000000000000000000000000000000) (bvsge (x!64919 lt!343931) #b00000000000000000000000000000000)))))

(assert (=> b!772472 (=> (not res!522493) (not e!430019))))

(declare-fun b!772473 () Bool)

(assert (=> b!772473 (and (bvsge (index!33986 lt!343931) #b00000000000000000000000000000000) (bvslt (index!33986 lt!343931) (size!20725 a!3186)))))

(declare-fun res!522495 () Bool)

(assert (=> b!772473 (= res!522495 (= (select (arr!20304 a!3186) (index!33986 lt!343931)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772473 (=> res!522495 e!430018)))

(declare-fun b!772474 () Bool)

(assert (=> b!772474 (= e!430017 e!430021)))

(declare-fun c!85386 () Bool)

(assert (=> b!772474 (= c!85386 (or (= lt!343932 (select (arr!20304 a!3186) j!159)) (= (bvadd lt!343932 lt!343932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772475 () Bool)

(assert (=> b!772475 (and (bvsge (index!33986 lt!343931) #b00000000000000000000000000000000) (bvslt (index!33986 lt!343931) (size!20725 a!3186)))))

(assert (=> b!772475 (= e!430018 (= (select (arr!20304 a!3186) (index!33986 lt!343931)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772476 () Bool)

(assert (=> b!772476 (= e!430017 (Intermediate!7904 true (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101839 c!85387) b!772476))

(assert (= (and d!101839 (not c!85387)) b!772474))

(assert (= (and b!772474 c!85386) b!772470))

(assert (= (and b!772474 (not c!85386)) b!772469))

(assert (= (and d!101839 c!85385) b!772471))

(assert (= (and d!101839 (not c!85385)) b!772472))

(assert (= (and b!772472 res!522493) b!772468))

(assert (= (and b!772468 (not res!522494)) b!772473))

(assert (= (and b!772473 (not res!522495)) b!772475))

(declare-fun m!717401 () Bool)

(assert (=> b!772473 m!717401))

(assert (=> b!772475 m!717401))

(assert (=> b!772469 m!717205))

(declare-fun m!717403 () Bool)

(assert (=> b!772469 m!717403))

(assert (=> b!772469 m!717403))

(assert (=> b!772469 m!717203))

(declare-fun m!717405 () Bool)

(assert (=> b!772469 m!717405))

(assert (=> b!772468 m!717401))

(assert (=> d!101839 m!717205))

(declare-fun m!717407 () Bool)

(assert (=> d!101839 m!717407))

(assert (=> d!101839 m!717221))

(assert (=> b!772250 d!101839))

(declare-fun d!101853 () Bool)

(declare-fun lt!343944 () (_ BitVec 32))

(declare-fun lt!343943 () (_ BitVec 32))

(assert (=> d!101853 (= lt!343944 (bvmul (bvxor lt!343943 (bvlshr lt!343943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101853 (= lt!343943 ((_ extract 31 0) (bvand (bvxor (select (arr!20304 a!3186) j!159) (bvlshr (select (arr!20304 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101853 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522496 (let ((h!15408 ((_ extract 31 0) (bvand (bvxor (select (arr!20304 a!3186) j!159) (bvlshr (select (arr!20304 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64927 (bvmul (bvxor h!15408 (bvlshr h!15408 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64927 (bvlshr x!64927 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522496 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522496 #b00000000000000000000000000000000))))))

(assert (=> d!101853 (= (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) (bvand (bvxor lt!343944 (bvlshr lt!343944 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772250 d!101853))

(declare-fun bm!35139 () Bool)

(declare-fun call!35142 () Bool)

(declare-fun c!85405 () Bool)

(assert (=> bm!35139 (= call!35142 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85405 (Cons!14302 (select (arr!20304 a!3186) #b00000000000000000000000000000000) Nil!14303) Nil!14303)))))

(declare-fun b!772535 () Bool)

(declare-fun e!430063 () Bool)

(assert (=> b!772535 (= e!430063 call!35142)))

(declare-fun b!772536 () Bool)

(assert (=> b!772536 (= e!430063 call!35142)))

(declare-fun b!772537 () Bool)

(declare-fun e!430065 () Bool)

(declare-fun e!430066 () Bool)

(assert (=> b!772537 (= e!430065 e!430066)))

(declare-fun res!522523 () Bool)

(assert (=> b!772537 (=> (not res!522523) (not e!430066))))

(declare-fun e!430064 () Bool)

(assert (=> b!772537 (= res!522523 (not e!430064))))

(declare-fun res!522521 () Bool)

(assert (=> b!772537 (=> (not res!522521) (not e!430064))))

(assert (=> b!772537 (= res!522521 (validKeyInArray!0 (select (arr!20304 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772538 () Bool)

(assert (=> b!772538 (= e!430066 e!430063)))

(assert (=> b!772538 (= c!85405 (validKeyInArray!0 (select (arr!20304 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!772539 () Bool)

(declare-fun contains!4093 (List!14306 (_ BitVec 64)) Bool)

(assert (=> b!772539 (= e!430064 (contains!4093 Nil!14303 (select (arr!20304 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101857 () Bool)

(declare-fun res!522522 () Bool)

(assert (=> d!101857 (=> res!522522 e!430065)))

(assert (=> d!101857 (= res!522522 (bvsge #b00000000000000000000000000000000 (size!20725 a!3186)))))

(assert (=> d!101857 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14303) e!430065)))

(assert (= (and d!101857 (not res!522522)) b!772537))

(assert (= (and b!772537 res!522521) b!772539))

(assert (= (and b!772537 res!522523) b!772538))

(assert (= (and b!772538 c!85405) b!772535))

(assert (= (and b!772538 (not c!85405)) b!772536))

(assert (= (or b!772535 b!772536) bm!35139))

(declare-fun m!717433 () Bool)

(assert (=> bm!35139 m!717433))

(declare-fun m!717435 () Bool)

(assert (=> bm!35139 m!717435))

(assert (=> b!772537 m!717433))

(assert (=> b!772537 m!717433))

(declare-fun m!717437 () Bool)

(assert (=> b!772537 m!717437))

(assert (=> b!772538 m!717433))

(assert (=> b!772538 m!717433))

(assert (=> b!772538 m!717437))

(assert (=> b!772539 m!717433))

(assert (=> b!772539 m!717433))

(declare-fun m!717439 () Bool)

(assert (=> b!772539 m!717439))

(assert (=> b!772240 d!101857))

(declare-fun d!101863 () Bool)

(declare-fun res!522540 () Bool)

(declare-fun e!430098 () Bool)

(assert (=> d!101863 (=> res!522540 e!430098)))

(assert (=> d!101863 (= res!522540 (bvsge #b00000000000000000000000000000000 (size!20725 a!3186)))))

(assert (=> d!101863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430098)))

(declare-fun b!772587 () Bool)

(declare-fun e!430097 () Bool)

(assert (=> b!772587 (= e!430098 e!430097)))

(declare-fun c!85420 () Bool)

(assert (=> b!772587 (= c!85420 (validKeyInArray!0 (select (arr!20304 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!35143 () Bool)

(declare-fun call!35146 () Bool)

(assert (=> bm!35143 (= call!35146 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772588 () Bool)

(assert (=> b!772588 (= e!430097 call!35146)))

(declare-fun b!772589 () Bool)

(declare-fun e!430096 () Bool)

(assert (=> b!772589 (= e!430097 e!430096)))

(declare-fun lt!343967 () (_ BitVec 64))

(assert (=> b!772589 (= lt!343967 (select (arr!20304 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!343968 () Unit!26630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42411 (_ BitVec 64) (_ BitVec 32)) Unit!26630)

(assert (=> b!772589 (= lt!343968 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!343967 #b00000000000000000000000000000000))))

(assert (=> b!772589 (arrayContainsKey!0 a!3186 lt!343967 #b00000000000000000000000000000000)))

(declare-fun lt!343969 () Unit!26630)

(assert (=> b!772589 (= lt!343969 lt!343968)))

(declare-fun res!522539 () Bool)

(assert (=> b!772589 (= res!522539 (= (seekEntryOrOpen!0 (select (arr!20304 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7904 #b00000000000000000000000000000000)))))

(assert (=> b!772589 (=> (not res!522539) (not e!430096))))

(declare-fun b!772590 () Bool)

(assert (=> b!772590 (= e!430096 call!35146)))

(assert (= (and d!101863 (not res!522540)) b!772587))

(assert (= (and b!772587 c!85420) b!772589))

(assert (= (and b!772587 (not c!85420)) b!772588))

(assert (= (and b!772589 res!522539) b!772590))

(assert (= (or b!772590 b!772588) bm!35143))

(assert (=> b!772587 m!717433))

(assert (=> b!772587 m!717433))

(assert (=> b!772587 m!717437))

(declare-fun m!717469 () Bool)

(assert (=> bm!35143 m!717469))

(assert (=> b!772589 m!717433))

(declare-fun m!717473 () Bool)

(assert (=> b!772589 m!717473))

(declare-fun m!717475 () Bool)

(assert (=> b!772589 m!717475))

(assert (=> b!772589 m!717433))

(declare-fun m!717477 () Bool)

(assert (=> b!772589 m!717477))

(assert (=> b!772251 d!101863))

(declare-fun e!430130 () SeekEntryResult!7904)

(declare-fun b!772644 () Bool)

(assert (=> b!772644 (= e!430130 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772645 () Bool)

(declare-fun c!85442 () Bool)

(declare-fun lt!343990 () (_ BitVec 64))

(assert (=> b!772645 (= c!85442 (= lt!343990 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430129 () SeekEntryResult!7904)

(assert (=> b!772645 (= e!430129 e!430130)))

(declare-fun b!772646 () Bool)

(declare-fun e!430131 () SeekEntryResult!7904)

(assert (=> b!772646 (= e!430131 e!430129)))

(declare-fun c!85443 () Bool)

(assert (=> b!772646 (= c!85443 (= lt!343990 (select (arr!20304 a!3186) j!159)))))

(declare-fun d!101881 () Bool)

(declare-fun lt!343991 () SeekEntryResult!7904)

(assert (=> d!101881 (and (or (is-Undefined!7904 lt!343991) (not (is-Found!7904 lt!343991)) (and (bvsge (index!33985 lt!343991) #b00000000000000000000000000000000) (bvslt (index!33985 lt!343991) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!343991) (is-Found!7904 lt!343991) (not (is-MissingVacant!7904 lt!343991)) (not (= (index!33987 lt!343991) resIntermediateIndex!5)) (and (bvsge (index!33987 lt!343991) #b00000000000000000000000000000000) (bvslt (index!33987 lt!343991) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!343991) (ite (is-Found!7904 lt!343991) (= (select (arr!20304 a!3186) (index!33985 lt!343991)) (select (arr!20304 a!3186) j!159)) (and (is-MissingVacant!7904 lt!343991) (= (index!33987 lt!343991) resIntermediateIndex!5) (= (select (arr!20304 a!3186) (index!33987 lt!343991)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101881 (= lt!343991 e!430131)))

(declare-fun c!85444 () Bool)

(assert (=> d!101881 (= c!85444 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101881 (= lt!343990 (select (arr!20304 a!3186) index!1321))))

(assert (=> d!101881 (validMask!0 mask!3328)))

(assert (=> d!101881 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343991)))

(declare-fun b!772647 () Bool)

(assert (=> b!772647 (= e!430129 (Found!7904 index!1321))))

(declare-fun b!772648 () Bool)

(assert (=> b!772648 (= e!430130 (MissingVacant!7904 resIntermediateIndex!5))))

(declare-fun b!772649 () Bool)

(assert (=> b!772649 (= e!430131 Undefined!7904)))

(assert (= (and d!101881 c!85444) b!772649))

(assert (= (and d!101881 (not c!85444)) b!772646))

(assert (= (and b!772646 c!85443) b!772647))

(assert (= (and b!772646 (not c!85443)) b!772645))

(assert (= (and b!772645 c!85442) b!772648))

(assert (= (and b!772645 (not c!85442)) b!772644))

(assert (=> b!772644 m!717247))

(assert (=> b!772644 m!717247))

(assert (=> b!772644 m!717203))

(declare-fun m!717497 () Bool)

(assert (=> b!772644 m!717497))

(declare-fun m!717499 () Bool)

(assert (=> d!101881 m!717499))

(declare-fun m!717501 () Bool)

(assert (=> d!101881 m!717501))

(declare-fun m!717503 () Bool)

(assert (=> d!101881 m!717503))

(assert (=> d!101881 m!717221))

(assert (=> b!772241 d!101881))

(declare-fun b!772658 () Bool)

(declare-fun e!430137 () SeekEntryResult!7904)

(assert (=> b!772658 (= e!430137 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343818 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772659 () Bool)

(declare-fun c!85449 () Bool)

(declare-fun lt!343994 () (_ BitVec 64))

(assert (=> b!772659 (= c!85449 (= lt!343994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430136 () SeekEntryResult!7904)

(assert (=> b!772659 (= e!430136 e!430137)))

(declare-fun b!772660 () Bool)

(declare-fun e!430138 () SeekEntryResult!7904)

(assert (=> b!772660 (= e!430138 e!430136)))

(declare-fun c!85450 () Bool)

(assert (=> b!772660 (= c!85450 (= lt!343994 (select (arr!20304 a!3186) j!159)))))

(declare-fun lt!343995 () SeekEntryResult!7904)

(declare-fun d!101891 () Bool)

(assert (=> d!101891 (and (or (is-Undefined!7904 lt!343995) (not (is-Found!7904 lt!343995)) (and (bvsge (index!33985 lt!343995) #b00000000000000000000000000000000) (bvslt (index!33985 lt!343995) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!343995) (is-Found!7904 lt!343995) (not (is-MissingVacant!7904 lt!343995)) (not (= (index!33987 lt!343995) resIntermediateIndex!5)) (and (bvsge (index!33987 lt!343995) #b00000000000000000000000000000000) (bvslt (index!33987 lt!343995) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!343995) (ite (is-Found!7904 lt!343995) (= (select (arr!20304 a!3186) (index!33985 lt!343995)) (select (arr!20304 a!3186) j!159)) (and (is-MissingVacant!7904 lt!343995) (= (index!33987 lt!343995) resIntermediateIndex!5) (= (select (arr!20304 a!3186) (index!33987 lt!343995)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101891 (= lt!343995 e!430138)))

(declare-fun c!85451 () Bool)

(assert (=> d!101891 (= c!85451 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101891 (= lt!343994 (select (arr!20304 a!3186) lt!343818))))

(assert (=> d!101891 (validMask!0 mask!3328)))

(assert (=> d!101891 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343818 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!343995)))

(declare-fun b!772661 () Bool)

(assert (=> b!772661 (= e!430136 (Found!7904 lt!343818))))

(declare-fun b!772662 () Bool)

(assert (=> b!772662 (= e!430137 (MissingVacant!7904 resIntermediateIndex!5))))

(declare-fun b!772663 () Bool)

(assert (=> b!772663 (= e!430138 Undefined!7904)))

(assert (= (and d!101891 c!85451) b!772663))

(assert (= (and d!101891 (not c!85451)) b!772660))

(assert (= (and b!772660 c!85450) b!772661))

(assert (= (and b!772660 (not c!85450)) b!772659))

(assert (= (and b!772659 c!85449) b!772662))

(assert (= (and b!772659 (not c!85449)) b!772658))

(declare-fun m!717505 () Bool)

(assert (=> b!772658 m!717505))

(assert (=> b!772658 m!717505))

(assert (=> b!772658 m!717203))

(declare-fun m!717507 () Bool)

(assert (=> b!772658 m!717507))

(declare-fun m!717509 () Bool)

(assert (=> d!101891 m!717509))

(declare-fun m!717511 () Bool)

(assert (=> d!101891 m!717511))

(declare-fun m!717513 () Bool)

(assert (=> d!101891 m!717513))

(assert (=> d!101891 m!717221))

(assert (=> b!772241 d!101891))

(assert (=> b!772252 d!101881))

(declare-fun d!101893 () Bool)

(assert (=> d!101893 (= (validKeyInArray!0 (select (arr!20304 a!3186) j!159)) (and (not (= (select (arr!20304 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20304 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772253 d!101893))

(declare-fun d!101895 () Bool)

(declare-fun lt!344007 () (_ BitVec 32))

(assert (=> d!101895 (and (bvsge lt!344007 #b00000000000000000000000000000000) (bvslt lt!344007 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101895 (= lt!344007 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101895 (validMask!0 mask!3328)))

(assert (=> d!101895 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344007)))

(declare-fun bs!21606 () Bool)

(assert (= bs!21606 d!101895))

(declare-fun m!717523 () Bool)

(assert (=> bs!21606 m!717523))

(assert (=> bs!21606 m!717221))

(assert (=> b!772254 d!101895))

(declare-fun d!101897 () Bool)

(declare-fun res!522562 () Bool)

(declare-fun e!430150 () Bool)

(assert (=> d!101897 (=> res!522562 e!430150)))

(assert (=> d!101897 (= res!522562 (bvsge j!159 (size!20725 a!3186)))))

(assert (=> d!101897 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430150)))

(declare-fun b!772678 () Bool)

(declare-fun e!430149 () Bool)

(assert (=> b!772678 (= e!430150 e!430149)))

(declare-fun c!85457 () Bool)

(assert (=> b!772678 (= c!85457 (validKeyInArray!0 (select (arr!20304 a!3186) j!159)))))

(declare-fun call!35149 () Bool)

(declare-fun bm!35146 () Bool)

(assert (=> bm!35146 (= call!35149 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!772679 () Bool)

(assert (=> b!772679 (= e!430149 call!35149)))

(declare-fun b!772680 () Bool)

(declare-fun e!430148 () Bool)

(assert (=> b!772680 (= e!430149 e!430148)))

(declare-fun lt!344008 () (_ BitVec 64))

(assert (=> b!772680 (= lt!344008 (select (arr!20304 a!3186) j!159))))

(declare-fun lt!344009 () Unit!26630)

(assert (=> b!772680 (= lt!344009 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344008 j!159))))

(assert (=> b!772680 (arrayContainsKey!0 a!3186 lt!344008 #b00000000000000000000000000000000)))

(declare-fun lt!344010 () Unit!26630)

(assert (=> b!772680 (= lt!344010 lt!344009)))

(declare-fun res!522561 () Bool)

(assert (=> b!772680 (= res!522561 (= (seekEntryOrOpen!0 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) (Found!7904 j!159)))))

(assert (=> b!772680 (=> (not res!522561) (not e!430148))))

(declare-fun b!772681 () Bool)

(assert (=> b!772681 (= e!430148 call!35149)))

(assert (= (and d!101897 (not res!522562)) b!772678))

(assert (= (and b!772678 c!85457) b!772680))

(assert (= (and b!772678 (not c!85457)) b!772679))

(assert (= (and b!772680 res!522561) b!772681))

(assert (= (or b!772681 b!772679) bm!35146))

(assert (=> b!772678 m!717203))

(assert (=> b!772678 m!717203))

(assert (=> b!772678 m!717229))

(declare-fun m!717531 () Bool)

(assert (=> bm!35146 m!717531))

(assert (=> b!772680 m!717203))

(declare-fun m!717533 () Bool)

(assert (=> b!772680 m!717533))

(declare-fun m!717535 () Bool)

(assert (=> b!772680 m!717535))

(assert (=> b!772680 m!717203))

(assert (=> b!772680 m!717227))

(assert (=> b!772244 d!101897))

(declare-fun d!101901 () Bool)

(assert (=> d!101901 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344025 () Unit!26630)

(declare-fun choose!38 (array!42411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26630)

(assert (=> d!101901 (= lt!344025 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101901 (validMask!0 mask!3328)))

(assert (=> d!101901 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344025)))

(declare-fun bs!21607 () Bool)

(assert (= bs!21607 d!101901))

(assert (=> bs!21607 m!717249))

(declare-fun m!717569 () Bool)

(assert (=> bs!21607 m!717569))

(assert (=> bs!21607 m!717221))

(assert (=> b!772244 d!101901))

(declare-fun b!772710 () Bool)

(declare-fun lt!344028 () SeekEntryResult!7904)

(assert (=> b!772710 (and (bvsge (index!33986 lt!344028) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344028) (size!20725 lt!343817)))))

(declare-fun res!522572 () Bool)

(assert (=> b!772710 (= res!522572 (= (select (arr!20304 lt!343817) (index!33986 lt!344028)) lt!343820))))

(declare-fun e!430168 () Bool)

(assert (=> b!772710 (=> res!522572 e!430168)))

(declare-fun e!430169 () Bool)

(assert (=> b!772710 (= e!430169 e!430168)))

(declare-fun e!430171 () SeekEntryResult!7904)

(declare-fun b!772711 () Bool)

(assert (=> b!772711 (= e!430171 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!343820 lt!343817 mask!3328))))

(declare-fun b!772712 () Bool)

(assert (=> b!772712 (= e!430171 (Intermediate!7904 false index!1321 x!1131))))

(declare-fun d!101913 () Bool)

(declare-fun e!430170 () Bool)

(assert (=> d!101913 e!430170))

(declare-fun c!85468 () Bool)

(assert (=> d!101913 (= c!85468 (and (is-Intermediate!7904 lt!344028) (undefined!8716 lt!344028)))))

(declare-fun e!430167 () SeekEntryResult!7904)

(assert (=> d!101913 (= lt!344028 e!430167)))

(declare-fun c!85470 () Bool)

(assert (=> d!101913 (= c!85470 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344029 () (_ BitVec 64))

(assert (=> d!101913 (= lt!344029 (select (arr!20304 lt!343817) index!1321))))

(assert (=> d!101913 (validMask!0 mask!3328)))

(assert (=> d!101913 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343820 lt!343817 mask!3328) lt!344028)))

(declare-fun b!772713 () Bool)

(assert (=> b!772713 (= e!430170 (bvsge (x!64919 lt!344028) #b01111111111111111111111111111110))))

(declare-fun b!772714 () Bool)

(assert (=> b!772714 (= e!430170 e!430169)))

(declare-fun res!522571 () Bool)

(assert (=> b!772714 (= res!522571 (and (is-Intermediate!7904 lt!344028) (not (undefined!8716 lt!344028)) (bvslt (x!64919 lt!344028) #b01111111111111111111111111111110) (bvsge (x!64919 lt!344028) #b00000000000000000000000000000000) (bvsge (x!64919 lt!344028) x!1131)))))

(assert (=> b!772714 (=> (not res!522571) (not e!430169))))

(declare-fun b!772715 () Bool)

(assert (=> b!772715 (and (bvsge (index!33986 lt!344028) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344028) (size!20725 lt!343817)))))

(declare-fun res!522573 () Bool)

(assert (=> b!772715 (= res!522573 (= (select (arr!20304 lt!343817) (index!33986 lt!344028)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772715 (=> res!522573 e!430168)))

(declare-fun b!772716 () Bool)

(assert (=> b!772716 (= e!430167 e!430171)))

(declare-fun c!85469 () Bool)

(assert (=> b!772716 (= c!85469 (or (= lt!344029 lt!343820) (= (bvadd lt!344029 lt!344029) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772717 () Bool)

(assert (=> b!772717 (and (bvsge (index!33986 lt!344028) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344028) (size!20725 lt!343817)))))

(assert (=> b!772717 (= e!430168 (= (select (arr!20304 lt!343817) (index!33986 lt!344028)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772718 () Bool)

(assert (=> b!772718 (= e!430167 (Intermediate!7904 true index!1321 x!1131))))

(assert (= (and d!101913 c!85470) b!772718))

(assert (= (and d!101913 (not c!85470)) b!772716))

(assert (= (and b!772716 c!85469) b!772712))

(assert (= (and b!772716 (not c!85469)) b!772711))

(assert (= (and d!101913 c!85468) b!772713))

(assert (= (and d!101913 (not c!85468)) b!772714))

(assert (= (and b!772714 res!522571) b!772710))

(assert (= (and b!772710 (not res!522572)) b!772715))

(assert (= (and b!772715 (not res!522573)) b!772717))

(declare-fun m!717573 () Bool)

(assert (=> b!772715 m!717573))

(assert (=> b!772717 m!717573))

(assert (=> b!772711 m!717247))

(assert (=> b!772711 m!717247))

(declare-fun m!717575 () Bool)

(assert (=> b!772711 m!717575))

(assert (=> b!772710 m!717573))

(declare-fun m!717577 () Bool)

(assert (=> d!101913 m!717577))

(assert (=> d!101913 m!717221))

(assert (=> b!772255 d!101913))

(declare-fun b!772719 () Bool)

(declare-fun lt!344031 () SeekEntryResult!7904)

(assert (=> b!772719 (and (bvsge (index!33986 lt!344031) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344031) (size!20725 lt!343817)))))

(declare-fun res!522575 () Bool)

(assert (=> b!772719 (= res!522575 (= (select (arr!20304 lt!343817) (index!33986 lt!344031)) lt!343820))))

(declare-fun e!430173 () Bool)

(assert (=> b!772719 (=> res!522575 e!430173)))

(declare-fun e!430174 () Bool)

(assert (=> b!772719 (= e!430174 e!430173)))

(declare-fun e!430176 () SeekEntryResult!7904)

(declare-fun b!772720 () Bool)

(assert (=> b!772720 (= e!430176 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!343820 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!343820 lt!343817 mask!3328))))

(declare-fun b!772721 () Bool)

(assert (=> b!772721 (= e!430176 (Intermediate!7904 false (toIndex!0 lt!343820 mask!3328) #b00000000000000000000000000000000))))

(declare-fun d!101917 () Bool)

(declare-fun e!430175 () Bool)

(assert (=> d!101917 e!430175))

(declare-fun c!85471 () Bool)

(assert (=> d!101917 (= c!85471 (and (is-Intermediate!7904 lt!344031) (undefined!8716 lt!344031)))))

(declare-fun e!430172 () SeekEntryResult!7904)

(assert (=> d!101917 (= lt!344031 e!430172)))

(declare-fun c!85473 () Bool)

(assert (=> d!101917 (= c!85473 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!344032 () (_ BitVec 64))

(assert (=> d!101917 (= lt!344032 (select (arr!20304 lt!343817) (toIndex!0 lt!343820 mask!3328)))))

(assert (=> d!101917 (validMask!0 mask!3328)))

(assert (=> d!101917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343820 mask!3328) lt!343820 lt!343817 mask!3328) lt!344031)))

(declare-fun b!772722 () Bool)

(assert (=> b!772722 (= e!430175 (bvsge (x!64919 lt!344031) #b01111111111111111111111111111110))))

(declare-fun b!772723 () Bool)

(assert (=> b!772723 (= e!430175 e!430174)))

(declare-fun res!522574 () Bool)

(assert (=> b!772723 (= res!522574 (and (is-Intermediate!7904 lt!344031) (not (undefined!8716 lt!344031)) (bvslt (x!64919 lt!344031) #b01111111111111111111111111111110) (bvsge (x!64919 lt!344031) #b00000000000000000000000000000000) (bvsge (x!64919 lt!344031) #b00000000000000000000000000000000)))))

(assert (=> b!772723 (=> (not res!522574) (not e!430174))))

(declare-fun b!772724 () Bool)

(assert (=> b!772724 (and (bvsge (index!33986 lt!344031) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344031) (size!20725 lt!343817)))))

(declare-fun res!522576 () Bool)

(assert (=> b!772724 (= res!522576 (= (select (arr!20304 lt!343817) (index!33986 lt!344031)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772724 (=> res!522576 e!430173)))

(declare-fun b!772725 () Bool)

(assert (=> b!772725 (= e!430172 e!430176)))

(declare-fun c!85472 () Bool)

(assert (=> b!772725 (= c!85472 (or (= lt!344032 lt!343820) (= (bvadd lt!344032 lt!344032) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772726 () Bool)

(assert (=> b!772726 (and (bvsge (index!33986 lt!344031) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344031) (size!20725 lt!343817)))))

(assert (=> b!772726 (= e!430173 (= (select (arr!20304 lt!343817) (index!33986 lt!344031)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772727 () Bool)

(assert (=> b!772727 (= e!430172 (Intermediate!7904 true (toIndex!0 lt!343820 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!101917 c!85473) b!772727))

(assert (= (and d!101917 (not c!85473)) b!772725))

(assert (= (and b!772725 c!85472) b!772721))

(assert (= (and b!772725 (not c!85472)) b!772720))

(assert (= (and d!101917 c!85471) b!772722))

(assert (= (and d!101917 (not c!85471)) b!772723))

(assert (= (and b!772723 res!522574) b!772719))

(assert (= (and b!772719 (not res!522575)) b!772724))

(assert (= (and b!772724 (not res!522576)) b!772726))

(declare-fun m!717579 () Bool)

(assert (=> b!772724 m!717579))

(assert (=> b!772726 m!717579))

(assert (=> b!772720 m!717217))

(declare-fun m!717581 () Bool)

(assert (=> b!772720 m!717581))

(assert (=> b!772720 m!717581))

(declare-fun m!717583 () Bool)

(assert (=> b!772720 m!717583))

(assert (=> b!772719 m!717579))

(assert (=> d!101917 m!717217))

(declare-fun m!717585 () Bool)

(assert (=> d!101917 m!717585))

(assert (=> d!101917 m!717221))

(assert (=> b!772255 d!101917))

(declare-fun d!101919 () Bool)

(declare-fun lt!344034 () (_ BitVec 32))

(declare-fun lt!344033 () (_ BitVec 32))

(assert (=> d!101919 (= lt!344034 (bvmul (bvxor lt!344033 (bvlshr lt!344033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101919 (= lt!344033 ((_ extract 31 0) (bvand (bvxor lt!343820 (bvlshr lt!343820 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101919 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!522496 (let ((h!15408 ((_ extract 31 0) (bvand (bvxor lt!343820 (bvlshr lt!343820 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64927 (bvmul (bvxor h!15408 (bvlshr h!15408 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64927 (bvlshr x!64927 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!522496 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!522496 #b00000000000000000000000000000000))))))

(assert (=> d!101919 (= (toIndex!0 lt!343820 mask!3328) (bvand (bvxor lt!344034 (bvlshr lt!344034 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!772255 d!101919))

(declare-fun d!101921 () Bool)

(assert (=> d!101921 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!772256 d!101921))

(declare-fun e!430205 () SeekEntryResult!7904)

(declare-fun lt!344053 () SeekEntryResult!7904)

(declare-fun b!772773 () Bool)

(assert (=> b!772773 (= e!430205 (seekKeyOrZeroReturnVacant!0 (x!64919 lt!344053) (index!33986 lt!344053) (index!33986 lt!344053) k!2102 a!3186 mask!3328))))

(declare-fun b!772774 () Bool)

(declare-fun c!85494 () Bool)

(declare-fun lt!344054 () (_ BitVec 64))

(assert (=> b!772774 (= c!85494 (= lt!344054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430203 () SeekEntryResult!7904)

(assert (=> b!772774 (= e!430203 e!430205)))

(declare-fun b!772776 () Bool)

(assert (=> b!772776 (= e!430203 (Found!7904 (index!33986 lt!344053)))))

(declare-fun b!772777 () Bool)

(declare-fun e!430204 () SeekEntryResult!7904)

(assert (=> b!772777 (= e!430204 e!430203)))

(assert (=> b!772777 (= lt!344054 (select (arr!20304 a!3186) (index!33986 lt!344053)))))

(declare-fun c!85493 () Bool)

(assert (=> b!772777 (= c!85493 (= lt!344054 k!2102))))

(declare-fun b!772778 () Bool)

(assert (=> b!772778 (= e!430205 (MissingZero!7904 (index!33986 lt!344053)))))

(declare-fun b!772775 () Bool)

(assert (=> b!772775 (= e!430204 Undefined!7904)))

(declare-fun d!101923 () Bool)

(declare-fun lt!344052 () SeekEntryResult!7904)

(assert (=> d!101923 (and (or (is-Undefined!7904 lt!344052) (not (is-Found!7904 lt!344052)) (and (bvsge (index!33985 lt!344052) #b00000000000000000000000000000000) (bvslt (index!33985 lt!344052) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344052) (is-Found!7904 lt!344052) (not (is-MissingZero!7904 lt!344052)) (and (bvsge (index!33984 lt!344052) #b00000000000000000000000000000000) (bvslt (index!33984 lt!344052) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344052) (is-Found!7904 lt!344052) (is-MissingZero!7904 lt!344052) (not (is-MissingVacant!7904 lt!344052)) (and (bvsge (index!33987 lt!344052) #b00000000000000000000000000000000) (bvslt (index!33987 lt!344052) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344052) (ite (is-Found!7904 lt!344052) (= (select (arr!20304 a!3186) (index!33985 lt!344052)) k!2102) (ite (is-MissingZero!7904 lt!344052) (= (select (arr!20304 a!3186) (index!33984 lt!344052)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7904 lt!344052) (= (select (arr!20304 a!3186) (index!33987 lt!344052)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101923 (= lt!344052 e!430204)))

(declare-fun c!85492 () Bool)

(assert (=> d!101923 (= c!85492 (and (is-Intermediate!7904 lt!344053) (undefined!8716 lt!344053)))))

(assert (=> d!101923 (= lt!344053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101923 (validMask!0 mask!3328)))

(assert (=> d!101923 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!344052)))

(assert (= (and d!101923 c!85492) b!772775))

(assert (= (and d!101923 (not c!85492)) b!772777))

(assert (= (and b!772777 c!85493) b!772776))

(assert (= (and b!772777 (not c!85493)) b!772774))

(assert (= (and b!772774 c!85494) b!772778))

(assert (= (and b!772774 (not c!85494)) b!772773))

(declare-fun m!717607 () Bool)

(assert (=> b!772773 m!717607))

(declare-fun m!717609 () Bool)

(assert (=> b!772777 m!717609))

(declare-fun m!717611 () Bool)

(assert (=> d!101923 m!717611))

(declare-fun m!717613 () Bool)

(assert (=> d!101923 m!717613))

(assert (=> d!101923 m!717221))

(declare-fun m!717615 () Bool)

(assert (=> d!101923 m!717615))

(declare-fun m!717617 () Bool)

(assert (=> d!101923 m!717617))

(assert (=> d!101923 m!717615))

(declare-fun m!717619 () Bool)

(assert (=> d!101923 m!717619))

(assert (=> b!772246 d!101923))

(declare-fun b!772779 () Bool)

(declare-fun lt!344055 () SeekEntryResult!7904)

(assert (=> b!772779 (and (bvsge (index!33986 lt!344055) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344055) (size!20725 a!3186)))))

(declare-fun res!522587 () Bool)

(assert (=> b!772779 (= res!522587 (= (select (arr!20304 a!3186) (index!33986 lt!344055)) (select (arr!20304 a!3186) j!159)))))

(declare-fun e!430207 () Bool)

(assert (=> b!772779 (=> res!522587 e!430207)))

(declare-fun e!430208 () Bool)

(assert (=> b!772779 (= e!430208 e!430207)))

(declare-fun b!772780 () Bool)

(declare-fun e!430210 () SeekEntryResult!7904)

(assert (=> b!772780 (= e!430210 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772781 () Bool)

(assert (=> b!772781 (= e!430210 (Intermediate!7904 false index!1321 x!1131))))

(declare-fun d!101931 () Bool)

(declare-fun e!430209 () Bool)

(assert (=> d!101931 e!430209))

(declare-fun c!85495 () Bool)

(assert (=> d!101931 (= c!85495 (and (is-Intermediate!7904 lt!344055) (undefined!8716 lt!344055)))))

(declare-fun e!430206 () SeekEntryResult!7904)

(assert (=> d!101931 (= lt!344055 e!430206)))

(declare-fun c!85497 () Bool)

(assert (=> d!101931 (= c!85497 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!344056 () (_ BitVec 64))

(assert (=> d!101931 (= lt!344056 (select (arr!20304 a!3186) index!1321))))

(assert (=> d!101931 (validMask!0 mask!3328)))

(assert (=> d!101931 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!344055)))

(declare-fun b!772782 () Bool)

(assert (=> b!772782 (= e!430209 (bvsge (x!64919 lt!344055) #b01111111111111111111111111111110))))

(declare-fun b!772783 () Bool)

(assert (=> b!772783 (= e!430209 e!430208)))

(declare-fun res!522586 () Bool)

(assert (=> b!772783 (= res!522586 (and (is-Intermediate!7904 lt!344055) (not (undefined!8716 lt!344055)) (bvslt (x!64919 lt!344055) #b01111111111111111111111111111110) (bvsge (x!64919 lt!344055) #b00000000000000000000000000000000) (bvsge (x!64919 lt!344055) x!1131)))))

(assert (=> b!772783 (=> (not res!522586) (not e!430208))))

(declare-fun b!772784 () Bool)

(assert (=> b!772784 (and (bvsge (index!33986 lt!344055) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344055) (size!20725 a!3186)))))

(declare-fun res!522588 () Bool)

(assert (=> b!772784 (= res!522588 (= (select (arr!20304 a!3186) (index!33986 lt!344055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772784 (=> res!522588 e!430207)))

(declare-fun b!772785 () Bool)

(assert (=> b!772785 (= e!430206 e!430210)))

(declare-fun c!85496 () Bool)

(assert (=> b!772785 (= c!85496 (or (= lt!344056 (select (arr!20304 a!3186) j!159)) (= (bvadd lt!344056 lt!344056) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772786 () Bool)

(assert (=> b!772786 (and (bvsge (index!33986 lt!344055) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344055) (size!20725 a!3186)))))

(assert (=> b!772786 (= e!430207 (= (select (arr!20304 a!3186) (index!33986 lt!344055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772787 () Bool)

(assert (=> b!772787 (= e!430206 (Intermediate!7904 true index!1321 x!1131))))

(assert (= (and d!101931 c!85497) b!772787))

(assert (= (and d!101931 (not c!85497)) b!772785))

(assert (= (and b!772785 c!85496) b!772781))

(assert (= (and b!772785 (not c!85496)) b!772780))

(assert (= (and d!101931 c!85495) b!772782))

(assert (= (and d!101931 (not c!85495)) b!772783))

(assert (= (and b!772783 res!522586) b!772779))

(assert (= (and b!772779 (not res!522587)) b!772784))

(assert (= (and b!772784 (not res!522588)) b!772786))

(declare-fun m!717621 () Bool)

(assert (=> b!772784 m!717621))

(assert (=> b!772786 m!717621))

(assert (=> b!772780 m!717247))

(assert (=> b!772780 m!717247))

(assert (=> b!772780 m!717203))

(declare-fun m!717623 () Bool)

(assert (=> b!772780 m!717623))

(assert (=> b!772779 m!717621))

(assert (=> d!101931 m!717503))

(assert (=> d!101931 m!717221))

(assert (=> b!772257 d!101931))

(declare-fun d!101933 () Bool)

(declare-fun res!522593 () Bool)

(declare-fun e!430215 () Bool)

(assert (=> d!101933 (=> res!522593 e!430215)))

(assert (=> d!101933 (= res!522593 (= (select (arr!20304 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101933 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!430215)))

(declare-fun b!772792 () Bool)

(declare-fun e!430216 () Bool)

(assert (=> b!772792 (= e!430215 e!430216)))

(declare-fun res!522594 () Bool)

(assert (=> b!772792 (=> (not res!522594) (not e!430216))))

(assert (=> b!772792 (= res!522594 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20725 a!3186)))))

(declare-fun b!772793 () Bool)

(assert (=> b!772793 (= e!430216 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101933 (not res!522593)) b!772792))

(assert (= (and b!772792 res!522594) b!772793))

(assert (=> d!101933 m!717433))

(declare-fun m!717625 () Bool)

(assert (=> b!772793 m!717625))

(assert (=> b!772247 d!101933))

(declare-fun b!772794 () Bool)

(declare-fun lt!344057 () SeekEntryResult!7904)

(assert (=> b!772794 (and (bvsge (index!33986 lt!344057) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344057) (size!20725 a!3186)))))

(declare-fun res!522596 () Bool)

(assert (=> b!772794 (= res!522596 (= (select (arr!20304 a!3186) (index!33986 lt!344057)) (select (arr!20304 a!3186) j!159)))))

(declare-fun e!430218 () Bool)

(assert (=> b!772794 (=> res!522596 e!430218)))

(declare-fun e!430219 () Bool)

(assert (=> b!772794 (= e!430219 e!430218)))

(declare-fun b!772795 () Bool)

(declare-fun e!430221 () SeekEntryResult!7904)

(assert (=> b!772795 (= e!430221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!343818 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772796 () Bool)

(assert (=> b!772796 (= e!430221 (Intermediate!7904 false lt!343818 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun d!101937 () Bool)

(declare-fun e!430220 () Bool)

(assert (=> d!101937 e!430220))

(declare-fun c!85498 () Bool)

(assert (=> d!101937 (= c!85498 (and (is-Intermediate!7904 lt!344057) (undefined!8716 lt!344057)))))

(declare-fun e!430217 () SeekEntryResult!7904)

(assert (=> d!101937 (= lt!344057 e!430217)))

(declare-fun c!85500 () Bool)

(assert (=> d!101937 (= c!85500 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(declare-fun lt!344058 () (_ BitVec 64))

(assert (=> d!101937 (= lt!344058 (select (arr!20304 a!3186) lt!343818))))

(assert (=> d!101937 (validMask!0 mask!3328)))

(assert (=> d!101937 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343818 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!344057)))

(declare-fun b!772797 () Bool)

(assert (=> b!772797 (= e!430220 (bvsge (x!64919 lt!344057) #b01111111111111111111111111111110))))

(declare-fun b!772798 () Bool)

(assert (=> b!772798 (= e!430220 e!430219)))

(declare-fun res!522595 () Bool)

(assert (=> b!772798 (= res!522595 (and (is-Intermediate!7904 lt!344057) (not (undefined!8716 lt!344057)) (bvslt (x!64919 lt!344057) #b01111111111111111111111111111110) (bvsge (x!64919 lt!344057) #b00000000000000000000000000000000) (bvsge (x!64919 lt!344057) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!772798 (=> (not res!522595) (not e!430219))))

(declare-fun b!772799 () Bool)

(assert (=> b!772799 (and (bvsge (index!33986 lt!344057) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344057) (size!20725 a!3186)))))

(declare-fun res!522597 () Bool)

(assert (=> b!772799 (= res!522597 (= (select (arr!20304 a!3186) (index!33986 lt!344057)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!772799 (=> res!522597 e!430218)))

(declare-fun b!772800 () Bool)

(assert (=> b!772800 (= e!430217 e!430221)))

(declare-fun c!85499 () Bool)

(assert (=> b!772800 (= c!85499 (or (= lt!344058 (select (arr!20304 a!3186) j!159)) (= (bvadd lt!344058 lt!344058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772801 () Bool)

(assert (=> b!772801 (and (bvsge (index!33986 lt!344057) #b00000000000000000000000000000000) (bvslt (index!33986 lt!344057) (size!20725 a!3186)))))

(assert (=> b!772801 (= e!430218 (= (select (arr!20304 a!3186) (index!33986 lt!344057)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!772802 () Bool)

(assert (=> b!772802 (= e!430217 (Intermediate!7904 true lt!343818 (bvadd #b00000000000000000000000000000001 x!1131)))))

(assert (= (and d!101937 c!85500) b!772802))

(assert (= (and d!101937 (not c!85500)) b!772800))

(assert (= (and b!772800 c!85499) b!772796))

(assert (= (and b!772800 (not c!85499)) b!772795))

(assert (= (and d!101937 c!85498) b!772797))

(assert (= (and d!101937 (not c!85498)) b!772798))

(assert (= (and b!772798 res!522595) b!772794))

(assert (= (and b!772794 (not res!522596)) b!772799))

(assert (= (and b!772799 (not res!522597)) b!772801))

(declare-fun m!717627 () Bool)

(assert (=> b!772799 m!717627))

(assert (=> b!772801 m!717627))

(assert (=> b!772795 m!717505))

(assert (=> b!772795 m!717505))

(assert (=> b!772795 m!717203))

(declare-fun m!717637 () Bool)

(assert (=> b!772795 m!717637))

(assert (=> b!772794 m!717627))

(assert (=> d!101937 m!717513))

(assert (=> d!101937 m!717221))

(assert (=> b!772248 d!101937))

(declare-fun lt!344063 () SeekEntryResult!7904)

(declare-fun b!772809 () Bool)

(declare-fun e!430227 () SeekEntryResult!7904)

(assert (=> b!772809 (= e!430227 (seekKeyOrZeroReturnVacant!0 (x!64919 lt!344063) (index!33986 lt!344063) (index!33986 lt!344063) (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772810 () Bool)

(declare-fun c!85506 () Bool)

(declare-fun lt!344064 () (_ BitVec 64))

(assert (=> b!772810 (= c!85506 (= lt!344064 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430225 () SeekEntryResult!7904)

(assert (=> b!772810 (= e!430225 e!430227)))

(declare-fun b!772812 () Bool)

(assert (=> b!772812 (= e!430225 (Found!7904 (index!33986 lt!344063)))))

(declare-fun b!772813 () Bool)

(declare-fun e!430226 () SeekEntryResult!7904)

(assert (=> b!772813 (= e!430226 e!430225)))

(assert (=> b!772813 (= lt!344064 (select (arr!20304 a!3186) (index!33986 lt!344063)))))

(declare-fun c!85505 () Bool)

(assert (=> b!772813 (= c!85505 (= lt!344064 (select (arr!20304 a!3186) j!159)))))

(declare-fun b!772814 () Bool)

(assert (=> b!772814 (= e!430227 (MissingZero!7904 (index!33986 lt!344063)))))

(declare-fun b!772811 () Bool)

(assert (=> b!772811 (= e!430226 Undefined!7904)))

(declare-fun d!101941 () Bool)

(declare-fun lt!344062 () SeekEntryResult!7904)

(assert (=> d!101941 (and (or (is-Undefined!7904 lt!344062) (not (is-Found!7904 lt!344062)) (and (bvsge (index!33985 lt!344062) #b00000000000000000000000000000000) (bvslt (index!33985 lt!344062) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344062) (is-Found!7904 lt!344062) (not (is-MissingZero!7904 lt!344062)) (and (bvsge (index!33984 lt!344062) #b00000000000000000000000000000000) (bvslt (index!33984 lt!344062) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344062) (is-Found!7904 lt!344062) (is-MissingZero!7904 lt!344062) (not (is-MissingVacant!7904 lt!344062)) (and (bvsge (index!33987 lt!344062) #b00000000000000000000000000000000) (bvslt (index!33987 lt!344062) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344062) (ite (is-Found!7904 lt!344062) (= (select (arr!20304 a!3186) (index!33985 lt!344062)) (select (arr!20304 a!3186) j!159)) (ite (is-MissingZero!7904 lt!344062) (= (select (arr!20304 a!3186) (index!33984 lt!344062)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7904 lt!344062) (= (select (arr!20304 a!3186) (index!33987 lt!344062)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101941 (= lt!344062 e!430226)))

(declare-fun c!85504 () Bool)

(assert (=> d!101941 (= c!85504 (and (is-Intermediate!7904 lt!344063) (undefined!8716 lt!344063)))))

(assert (=> d!101941 (= lt!344063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20304 a!3186) j!159) mask!3328) (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101941 (validMask!0 mask!3328)))

(assert (=> d!101941 (= (seekEntryOrOpen!0 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!344062)))

(assert (= (and d!101941 c!85504) b!772811))

(assert (= (and d!101941 (not c!85504)) b!772813))

(assert (= (and b!772813 c!85505) b!772812))

(assert (= (and b!772813 (not c!85505)) b!772810))

(assert (= (and b!772810 c!85506) b!772814))

(assert (= (and b!772810 (not c!85506)) b!772809))

(assert (=> b!772809 m!717203))

(declare-fun m!717647 () Bool)

(assert (=> b!772809 m!717647))

(declare-fun m!717649 () Bool)

(assert (=> b!772813 m!717649))

(declare-fun m!717651 () Bool)

(assert (=> d!101941 m!717651))

(declare-fun m!717653 () Bool)

(assert (=> d!101941 m!717653))

(assert (=> d!101941 m!717221))

(assert (=> d!101941 m!717203))

(assert (=> d!101941 m!717205))

(declare-fun m!717655 () Bool)

(assert (=> d!101941 m!717655))

(assert (=> d!101941 m!717205))

(assert (=> d!101941 m!717203))

(assert (=> d!101941 m!717207))

(assert (=> b!772238 d!101941))

(declare-fun b!772819 () Bool)

(declare-fun e!430232 () SeekEntryResult!7904)

(assert (=> b!772819 (= e!430232 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!772820 () Bool)

(declare-fun c!85508 () Bool)

(declare-fun lt!344068 () (_ BitVec 64))

(assert (=> b!772820 (= c!85508 (= lt!344068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430231 () SeekEntryResult!7904)

(assert (=> b!772820 (= e!430231 e!430232)))

(declare-fun b!772821 () Bool)

(declare-fun e!430233 () SeekEntryResult!7904)

(assert (=> b!772821 (= e!430233 e!430231)))

(declare-fun c!85509 () Bool)

(assert (=> b!772821 (= c!85509 (= lt!344068 (select (arr!20304 a!3186) j!159)))))

(declare-fun d!101947 () Bool)

(declare-fun lt!344069 () SeekEntryResult!7904)

(assert (=> d!101947 (and (or (is-Undefined!7904 lt!344069) (not (is-Found!7904 lt!344069)) (and (bvsge (index!33985 lt!344069) #b00000000000000000000000000000000) (bvslt (index!33985 lt!344069) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344069) (is-Found!7904 lt!344069) (not (is-MissingVacant!7904 lt!344069)) (not (= (index!33987 lt!344069) resIntermediateIndex!5)) (and (bvsge (index!33987 lt!344069) #b00000000000000000000000000000000) (bvslt (index!33987 lt!344069) (size!20725 a!3186)))) (or (is-Undefined!7904 lt!344069) (ite (is-Found!7904 lt!344069) (= (select (arr!20304 a!3186) (index!33985 lt!344069)) (select (arr!20304 a!3186) j!159)) (and (is-MissingVacant!7904 lt!344069) (= (index!33987 lt!344069) resIntermediateIndex!5) (= (select (arr!20304 a!3186) (index!33987 lt!344069)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101947 (= lt!344069 e!430233)))

(declare-fun c!85510 () Bool)

(assert (=> d!101947 (= c!85510 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101947 (= lt!344068 (select (arr!20304 a!3186) resIntermediateIndex!5))))

(assert (=> d!101947 (validMask!0 mask!3328)))

(assert (=> d!101947 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20304 a!3186) j!159) a!3186 mask!3328) lt!344069)))

(declare-fun b!772822 () Bool)

(assert (=> b!772822 (= e!430231 (Found!7904 resIntermediateIndex!5))))

(declare-fun b!772823 () Bool)

(assert (=> b!772823 (= e!430232 (MissingVacant!7904 resIntermediateIndex!5))))

(declare-fun b!772824 () Bool)

(assert (=> b!772824 (= e!430233 Undefined!7904)))

(assert (= (and d!101947 c!85510) b!772824))

(assert (= (and d!101947 (not c!85510)) b!772821))

(assert (= (and b!772821 c!85509) b!772822))

(assert (= (and b!772821 (not c!85509)) b!772820))

(assert (= (and b!772820 c!85508) b!772823))

(assert (= (and b!772820 (not c!85508)) b!772819))

(declare-fun m!717657 () Bool)

(assert (=> b!772819 m!717657))

(assert (=> b!772819 m!717657))

(assert (=> b!772819 m!717203))

(declare-fun m!717659 () Bool)

(assert (=> b!772819 m!717659))

(declare-fun m!717661 () Bool)

(assert (=> d!101947 m!717661))

(declare-fun m!717663 () Bool)

(assert (=> d!101947 m!717663))

(assert (=> d!101947 m!717235))

(assert (=> d!101947 m!717221))

(assert (=> b!772239 d!101947))

(declare-fun d!101949 () Bool)

(assert (=> d!101949 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66918 d!101949))

(declare-fun d!101959 () Bool)

(assert (=> d!101959 (= (array_inv!16100 a!3186) (bvsge (size!20725 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66918 d!101959))

(push 1)

(assert (not bm!35139))

(assert (not b!772658))

(assert (not d!101881))

(assert (not b!772795))

(assert (not d!101917))

(assert (not d!101895))

(assert (not b!772780))

(assert (not b!772720))

(assert (not b!772538))

(assert (not d!101937))

(assert (not d!101913))

(assert (not d!101941))

(assert (not b!772537))

(assert (not b!772678))

(assert (not d!101931))

(assert (not bm!35143))

(assert (not d!101891))

(assert (not bm!35146))

(assert (not b!772469))

(assert (not d!101947))

(assert (not b!772819))

(assert (not d!101839))

(assert (not b!772711))

(assert (not b!772680))

(assert (not d!101901))

(assert (not b!772589))

(assert (not b!772644))

(assert (not b!772773))

(assert (not b!772793))

(assert (not d!101923))

(assert (not b!772809))

(assert (not b!772539))

(assert (not b!772587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

