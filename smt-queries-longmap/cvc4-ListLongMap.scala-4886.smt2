; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67366 () Bool)

(assert start!67366)

(declare-fun b!779284 () Bool)

(declare-fun res!527263 () Bool)

(declare-fun e!433532 () Bool)

(assert (=> b!779284 (=> (not res!527263) (not e!433532))))

(declare-fun e!433537 () Bool)

(assert (=> b!779284 (= res!527263 e!433537)))

(declare-fun c!86416 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779284 (= c!86416 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!42595 0))(
  ( (array!42596 (arr!20390 (Array (_ BitVec 32) (_ BitVec 64))) (size!20811 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42595)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!779285 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7990 0))(
  ( (MissingZero!7990 (index!34328 (_ BitVec 32))) (Found!7990 (index!34329 (_ BitVec 32))) (Intermediate!7990 (undefined!8802 Bool) (index!34330 (_ BitVec 32)) (x!65271 (_ BitVec 32))) (Undefined!7990) (MissingVacant!7990 (index!34331 (_ BitVec 32))) )
))
(declare-fun lt!347217 () SeekEntryResult!7990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!779285 (= e!433537 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347217))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!779286 () Bool)

(declare-fun lt!347211 () SeekEntryResult!7990)

(declare-fun e!433538 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!779286 (= e!433538 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347211))))

(declare-fun b!779287 () Bool)

(declare-fun e!433536 () Bool)

(assert (=> b!779287 (= e!433532 e!433536)))

(declare-fun res!527273 () Bool)

(assert (=> b!779287 (=> (not res!527273) (not e!433536))))

(declare-fun lt!347214 () SeekEntryResult!7990)

(declare-fun lt!347212 () SeekEntryResult!7990)

(assert (=> b!779287 (= res!527273 (= lt!347214 lt!347212))))

(declare-fun lt!347219 () array!42595)

(declare-fun lt!347216 () (_ BitVec 64))

(assert (=> b!779287 (= lt!347212 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347216 lt!347219 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779287 (= lt!347214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347216 mask!3328) lt!347216 lt!347219 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!779287 (= lt!347216 (select (store (arr!20390 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!779287 (= lt!347219 (array!42596 (store (arr!20390 a!3186) i!1173 k!2102) (size!20811 a!3186)))))

(declare-fun b!779288 () Bool)

(declare-fun res!527261 () Bool)

(declare-fun e!433530 () Bool)

(assert (=> b!779288 (=> (not res!527261) (not e!433530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779288 (= res!527261 (validKeyInArray!0 (select (arr!20390 a!3186) j!159)))))

(declare-fun b!779289 () Bool)

(declare-fun e!433534 () Bool)

(assert (=> b!779289 (= e!433536 (not e!433534))))

(declare-fun res!527270 () Bool)

(assert (=> b!779289 (=> res!527270 e!433534)))

(assert (=> b!779289 (= res!527270 (or (not (is-Intermediate!7990 lt!347212)) (bvslt x!1131 (x!65271 lt!347212)) (not (= x!1131 (x!65271 lt!347212))) (not (= index!1321 (index!34330 lt!347212)))))))

(declare-fun e!433531 () Bool)

(assert (=> b!779289 e!433531))

(declare-fun res!527258 () Bool)

(assert (=> b!779289 (=> (not res!527258) (not e!433531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42595 (_ BitVec 32)) Bool)

(assert (=> b!779289 (= res!527258 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26874 0))(
  ( (Unit!26875) )
))
(declare-fun lt!347213 () Unit!26874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26874)

(assert (=> b!779289 (= lt!347213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779291 () Bool)

(declare-fun res!527262 () Bool)

(assert (=> b!779291 (=> (not res!527262) (not e!433530))))

(assert (=> b!779291 (= res!527262 (and (= (size!20811 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20811 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20811 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779292 () Bool)

(declare-fun res!527268 () Bool)

(declare-fun e!433533 () Bool)

(assert (=> b!779292 (=> (not res!527268) (not e!433533))))

(assert (=> b!779292 (= res!527268 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20811 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20811 a!3186))))))

(declare-fun b!779293 () Bool)

(declare-fun res!527267 () Bool)

(assert (=> b!779293 (=> (not res!527267) (not e!433530))))

(declare-fun arrayContainsKey!0 (array!42595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779293 (= res!527267 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779294 () Bool)

(declare-fun res!527260 () Bool)

(assert (=> b!779294 (=> (not res!527260) (not e!433530))))

(assert (=> b!779294 (= res!527260 (validKeyInArray!0 k!2102))))

(declare-fun b!779295 () Bool)

(assert (=> b!779295 (= e!433537 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) (Found!7990 j!159)))))

(declare-fun b!779296 () Bool)

(declare-fun res!527272 () Bool)

(assert (=> b!779296 (=> (not res!527272) (not e!433533))))

(assert (=> b!779296 (= res!527272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779297 () Bool)

(assert (=> b!779297 (= e!433534 true)))

(declare-fun lt!347218 () SeekEntryResult!7990)

(assert (=> b!779297 (= lt!347218 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779290 () Bool)

(assert (=> b!779290 (= e!433533 e!433532)))

(declare-fun res!527259 () Bool)

(assert (=> b!779290 (=> (not res!527259) (not e!433532))))

(assert (=> b!779290 (= res!527259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20390 a!3186) j!159) mask!3328) (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347217))))

(assert (=> b!779290 (= lt!347217 (Intermediate!7990 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!527271 () Bool)

(assert (=> start!67366 (=> (not res!527271) (not e!433530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67366 (= res!527271 (validMask!0 mask!3328))))

(assert (=> start!67366 e!433530))

(assert (=> start!67366 true))

(declare-fun array_inv!16186 (array!42595) Bool)

(assert (=> start!67366 (array_inv!16186 a!3186)))

(declare-fun b!779298 () Bool)

(assert (=> b!779298 (= e!433531 e!433538)))

(declare-fun res!527265 () Bool)

(assert (=> b!779298 (=> (not res!527265) (not e!433538))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42595 (_ BitVec 32)) SeekEntryResult!7990)

(assert (=> b!779298 (= res!527265 (= (seekEntryOrOpen!0 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347211))))

(assert (=> b!779298 (= lt!347211 (Found!7990 j!159))))

(declare-fun b!779299 () Bool)

(declare-fun res!527266 () Bool)

(assert (=> b!779299 (=> (not res!527266) (not e!433532))))

(assert (=> b!779299 (= res!527266 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20390 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779300 () Bool)

(declare-fun res!527269 () Bool)

(assert (=> b!779300 (=> (not res!527269) (not e!433533))))

(declare-datatypes ((List!14392 0))(
  ( (Nil!14389) (Cons!14388 (h!15502 (_ BitVec 64)) (t!20707 List!14392)) )
))
(declare-fun arrayNoDuplicates!0 (array!42595 (_ BitVec 32) List!14392) Bool)

(assert (=> b!779300 (= res!527269 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14389))))

(declare-fun b!779301 () Bool)

(assert (=> b!779301 (= e!433530 e!433533)))

(declare-fun res!527264 () Bool)

(assert (=> b!779301 (=> (not res!527264) (not e!433533))))

(declare-fun lt!347215 () SeekEntryResult!7990)

(assert (=> b!779301 (= res!527264 (or (= lt!347215 (MissingZero!7990 i!1173)) (= lt!347215 (MissingVacant!7990 i!1173))))))

(assert (=> b!779301 (= lt!347215 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!67366 res!527271) b!779291))

(assert (= (and b!779291 res!527262) b!779288))

(assert (= (and b!779288 res!527261) b!779294))

(assert (= (and b!779294 res!527260) b!779293))

(assert (= (and b!779293 res!527267) b!779301))

(assert (= (and b!779301 res!527264) b!779296))

(assert (= (and b!779296 res!527272) b!779300))

(assert (= (and b!779300 res!527269) b!779292))

(assert (= (and b!779292 res!527268) b!779290))

(assert (= (and b!779290 res!527259) b!779299))

(assert (= (and b!779299 res!527266) b!779284))

(assert (= (and b!779284 c!86416) b!779285))

(assert (= (and b!779284 (not c!86416)) b!779295))

(assert (= (and b!779284 res!527263) b!779287))

(assert (= (and b!779287 res!527273) b!779289))

(assert (= (and b!779289 res!527258) b!779298))

(assert (= (and b!779298 res!527265) b!779286))

(assert (= (and b!779289 (not res!527270)) b!779297))

(declare-fun m!722809 () Bool)

(assert (=> b!779299 m!722809))

(declare-fun m!722811 () Bool)

(assert (=> b!779297 m!722811))

(assert (=> b!779297 m!722811))

(declare-fun m!722813 () Bool)

(assert (=> b!779297 m!722813))

(declare-fun m!722815 () Bool)

(assert (=> b!779300 m!722815))

(assert (=> b!779295 m!722811))

(assert (=> b!779295 m!722811))

(assert (=> b!779295 m!722813))

(assert (=> b!779290 m!722811))

(assert (=> b!779290 m!722811))

(declare-fun m!722817 () Bool)

(assert (=> b!779290 m!722817))

(assert (=> b!779290 m!722817))

(assert (=> b!779290 m!722811))

(declare-fun m!722819 () Bool)

(assert (=> b!779290 m!722819))

(declare-fun m!722821 () Bool)

(assert (=> b!779289 m!722821))

(declare-fun m!722823 () Bool)

(assert (=> b!779289 m!722823))

(assert (=> b!779298 m!722811))

(assert (=> b!779298 m!722811))

(declare-fun m!722825 () Bool)

(assert (=> b!779298 m!722825))

(declare-fun m!722827 () Bool)

(assert (=> b!779294 m!722827))

(declare-fun m!722829 () Bool)

(assert (=> b!779301 m!722829))

(declare-fun m!722831 () Bool)

(assert (=> b!779296 m!722831))

(declare-fun m!722833 () Bool)

(assert (=> b!779293 m!722833))

(assert (=> b!779288 m!722811))

(assert (=> b!779288 m!722811))

(declare-fun m!722835 () Bool)

(assert (=> b!779288 m!722835))

(assert (=> b!779286 m!722811))

(assert (=> b!779286 m!722811))

(declare-fun m!722837 () Bool)

(assert (=> b!779286 m!722837))

(declare-fun m!722839 () Bool)

(assert (=> start!67366 m!722839))

(declare-fun m!722841 () Bool)

(assert (=> start!67366 m!722841))

(declare-fun m!722843 () Bool)

(assert (=> b!779287 m!722843))

(declare-fun m!722845 () Bool)

(assert (=> b!779287 m!722845))

(declare-fun m!722847 () Bool)

(assert (=> b!779287 m!722847))

(declare-fun m!722849 () Bool)

(assert (=> b!779287 m!722849))

(assert (=> b!779287 m!722845))

(declare-fun m!722851 () Bool)

(assert (=> b!779287 m!722851))

(assert (=> b!779285 m!722811))

(assert (=> b!779285 m!722811))

(declare-fun m!722853 () Bool)

(assert (=> b!779285 m!722853))

(push 1)

