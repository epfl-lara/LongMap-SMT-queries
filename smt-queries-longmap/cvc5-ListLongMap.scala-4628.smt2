; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64468 () Bool)

(assert start!64468)

(declare-fun b!725016 () Bool)

(declare-fun e!406057 () Bool)

(declare-fun e!406060 () Bool)

(assert (=> b!725016 (= e!406057 e!406060)))

(declare-fun res!486176 () Bool)

(assert (=> b!725016 (=> (not res!486176) (not e!406060))))

(declare-datatypes ((SeekEntryResult!7214 0))(
  ( (MissingZero!7214 (index!31224 (_ BitVec 32))) (Found!7214 (index!31225 (_ BitVec 32))) (Intermediate!7214 (undefined!8026 Bool) (index!31226 (_ BitVec 32)) (x!62224 (_ BitVec 32))) (Undefined!7214) (MissingVacant!7214 (index!31227 (_ BitVec 32))) )
))
(declare-fun lt!321203 () SeekEntryResult!7214)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725016 (= res!486176 (or (= lt!321203 (MissingZero!7214 i!1173)) (= lt!321203 (MissingVacant!7214 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-datatypes ((array!40986 0))(
  ( (array!40987 (arr!19614 (Array (_ BitVec 32) (_ BitVec 64))) (size!20035 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40986)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40986 (_ BitVec 32)) SeekEntryResult!7214)

(assert (=> b!725016 (= lt!321203 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725017 () Bool)

(declare-fun res!486167 () Bool)

(declare-fun e!406055 () Bool)

(assert (=> b!725017 (=> (not res!486167) (not e!406055))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725017 (= res!486167 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19614 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725018 () Bool)

(declare-fun res!486179 () Bool)

(assert (=> b!725018 (=> (not res!486179) (not e!406057))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!725018 (= res!486179 (and (= (size!20035 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20035 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20035 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725019 () Bool)

(assert (=> b!725019 (= e!406060 e!406055)))

(declare-fun res!486171 () Bool)

(assert (=> b!725019 (=> (not res!486171) (not e!406055))))

(declare-fun lt!321202 () SeekEntryResult!7214)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40986 (_ BitVec 32)) SeekEntryResult!7214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725019 (= res!486171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19614 a!3186) j!159) mask!3328) (select (arr!19614 a!3186) j!159) a!3186 mask!3328) lt!321202))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725019 (= lt!321202 (Intermediate!7214 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725020 () Bool)

(declare-fun e!406056 () Bool)

(assert (=> b!725020 (= e!406055 e!406056)))

(declare-fun res!486170 () Bool)

(assert (=> b!725020 (=> (not res!486170) (not e!406056))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321201 () (_ BitVec 64))

(declare-fun lt!321200 () array!40986)

(assert (=> b!725020 (= res!486170 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321201 mask!3328) lt!321201 lt!321200 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321201 lt!321200 mask!3328)))))

(assert (=> b!725020 (= lt!321201 (select (store (arr!19614 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725020 (= lt!321200 (array!40987 (store (arr!19614 a!3186) i!1173 k!2102) (size!20035 a!3186)))))

(declare-fun e!406058 () Bool)

(declare-fun b!725021 () Bool)

(assert (=> b!725021 (= e!406058 (= (seekEntryOrOpen!0 (select (arr!19614 a!3186) j!159) a!3186 mask!3328) (Found!7214 j!159)))))

(declare-fun b!725022 () Bool)

(declare-fun res!486173 () Bool)

(assert (=> b!725022 (=> (not res!486173) (not e!406060))))

(declare-datatypes ((List!13616 0))(
  ( (Nil!13613) (Cons!13612 (h!14669 (_ BitVec 64)) (t!19931 List!13616)) )
))
(declare-fun arrayNoDuplicates!0 (array!40986 (_ BitVec 32) List!13616) Bool)

(assert (=> b!725022 (= res!486173 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13613))))

(declare-fun e!406061 () Bool)

(declare-fun b!725023 () Bool)

(assert (=> b!725023 (= e!406061 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19614 a!3186) j!159) a!3186 mask!3328) lt!321202))))

(declare-fun b!725024 () Bool)

(declare-fun res!486178 () Bool)

(assert (=> b!725024 (=> (not res!486178) (not e!406055))))

(assert (=> b!725024 (= res!486178 e!406061)))

(declare-fun c!79798 () Bool)

(assert (=> b!725024 (= c!79798 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725025 () Bool)

(declare-fun res!486175 () Bool)

(assert (=> b!725025 (=> (not res!486175) (not e!406057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725025 (= res!486175 (validKeyInArray!0 (select (arr!19614 a!3186) j!159)))))

(declare-fun b!725026 () Bool)

(declare-fun res!486177 () Bool)

(assert (=> b!725026 (=> (not res!486177) (not e!406060))))

(assert (=> b!725026 (= res!486177 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20035 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20035 a!3186))))))

(declare-fun b!725027 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40986 (_ BitVec 32)) SeekEntryResult!7214)

(assert (=> b!725027 (= e!406061 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19614 a!3186) j!159) a!3186 mask!3328) (Found!7214 j!159)))))

(declare-fun res!486174 () Bool)

(assert (=> start!64468 (=> (not res!486174) (not e!406057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64468 (= res!486174 (validMask!0 mask!3328))))

(assert (=> start!64468 e!406057))

(assert (=> start!64468 true))

(declare-fun array_inv!15410 (array!40986) Bool)

(assert (=> start!64468 (array_inv!15410 a!3186)))

(declare-fun b!725028 () Bool)

(assert (=> b!725028 (= e!406056 (not true))))

(assert (=> b!725028 e!406058))

(declare-fun res!486168 () Bool)

(assert (=> b!725028 (=> (not res!486168) (not e!406058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40986 (_ BitVec 32)) Bool)

(assert (=> b!725028 (= res!486168 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24746 0))(
  ( (Unit!24747) )
))
(declare-fun lt!321199 () Unit!24746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40986 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24746)

(assert (=> b!725028 (= lt!321199 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725029 () Bool)

(declare-fun res!486166 () Bool)

(assert (=> b!725029 (=> (not res!486166) (not e!406057))))

(declare-fun arrayContainsKey!0 (array!40986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725029 (= res!486166 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725030 () Bool)

(declare-fun res!486172 () Bool)

(assert (=> b!725030 (=> (not res!486172) (not e!406057))))

(assert (=> b!725030 (= res!486172 (validKeyInArray!0 k!2102))))

(declare-fun b!725031 () Bool)

(declare-fun res!486169 () Bool)

(assert (=> b!725031 (=> (not res!486169) (not e!406060))))

(assert (=> b!725031 (= res!486169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64468 res!486174) b!725018))

(assert (= (and b!725018 res!486179) b!725025))

(assert (= (and b!725025 res!486175) b!725030))

(assert (= (and b!725030 res!486172) b!725029))

(assert (= (and b!725029 res!486166) b!725016))

(assert (= (and b!725016 res!486176) b!725031))

(assert (= (and b!725031 res!486169) b!725022))

(assert (= (and b!725022 res!486173) b!725026))

(assert (= (and b!725026 res!486177) b!725019))

(assert (= (and b!725019 res!486171) b!725017))

(assert (= (and b!725017 res!486167) b!725024))

(assert (= (and b!725024 c!79798) b!725023))

(assert (= (and b!725024 (not c!79798)) b!725027))

(assert (= (and b!725024 res!486178) b!725020))

(assert (= (and b!725020 res!486170) b!725028))

(assert (= (and b!725028 res!486168) b!725021))

(declare-fun m!679219 () Bool)

(assert (=> b!725029 m!679219))

(declare-fun m!679221 () Bool)

(assert (=> b!725025 m!679221))

(assert (=> b!725025 m!679221))

(declare-fun m!679223 () Bool)

(assert (=> b!725025 m!679223))

(declare-fun m!679225 () Bool)

(assert (=> b!725020 m!679225))

(declare-fun m!679227 () Bool)

(assert (=> b!725020 m!679227))

(declare-fun m!679229 () Bool)

(assert (=> b!725020 m!679229))

(declare-fun m!679231 () Bool)

(assert (=> b!725020 m!679231))

(assert (=> b!725020 m!679225))

(declare-fun m!679233 () Bool)

(assert (=> b!725020 m!679233))

(declare-fun m!679235 () Bool)

(assert (=> b!725028 m!679235))

(declare-fun m!679237 () Bool)

(assert (=> b!725028 m!679237))

(declare-fun m!679239 () Bool)

(assert (=> b!725031 m!679239))

(declare-fun m!679241 () Bool)

(assert (=> b!725030 m!679241))

(declare-fun m!679243 () Bool)

(assert (=> b!725016 m!679243))

(declare-fun m!679245 () Bool)

(assert (=> b!725017 m!679245))

(assert (=> b!725019 m!679221))

(assert (=> b!725019 m!679221))

(declare-fun m!679247 () Bool)

(assert (=> b!725019 m!679247))

(assert (=> b!725019 m!679247))

(assert (=> b!725019 m!679221))

(declare-fun m!679249 () Bool)

(assert (=> b!725019 m!679249))

(assert (=> b!725027 m!679221))

(assert (=> b!725027 m!679221))

(declare-fun m!679251 () Bool)

(assert (=> b!725027 m!679251))

(assert (=> b!725021 m!679221))

(assert (=> b!725021 m!679221))

(declare-fun m!679253 () Bool)

(assert (=> b!725021 m!679253))

(declare-fun m!679255 () Bool)

(assert (=> start!64468 m!679255))

(declare-fun m!679257 () Bool)

(assert (=> start!64468 m!679257))

(assert (=> b!725023 m!679221))

(assert (=> b!725023 m!679221))

(declare-fun m!679259 () Bool)

(assert (=> b!725023 m!679259))

(declare-fun m!679261 () Bool)

(assert (=> b!725022 m!679261))

(push 1)

