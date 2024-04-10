; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64474 () Bool)

(assert start!64474)

(declare-fun b!725162 () Bool)

(declare-fun res!486304 () Bool)

(declare-fun e!406120 () Bool)

(assert (=> b!725162 (=> (not res!486304) (not e!406120))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725162 (= res!486304 (validKeyInArray!0 k!2102))))

(declare-fun b!725163 () Bool)

(declare-fun e!406126 () Bool)

(assert (=> b!725163 (= e!406120 e!406126)))

(declare-fun res!486300 () Bool)

(assert (=> b!725163 (=> (not res!486300) (not e!406126))))

(declare-datatypes ((SeekEntryResult!7217 0))(
  ( (MissingZero!7217 (index!31236 (_ BitVec 32))) (Found!7217 (index!31237 (_ BitVec 32))) (Intermediate!7217 (undefined!8029 Bool) (index!31238 (_ BitVec 32)) (x!62235 (_ BitVec 32))) (Undefined!7217) (MissingVacant!7217 (index!31239 (_ BitVec 32))) )
))
(declare-fun lt!321247 () SeekEntryResult!7217)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725163 (= res!486300 (or (= lt!321247 (MissingZero!7217 i!1173)) (= lt!321247 (MissingVacant!7217 i!1173))))))

(declare-datatypes ((array!40992 0))(
  ( (array!40993 (arr!19617 (Array (_ BitVec 32) (_ BitVec 64))) (size!20038 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40992)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40992 (_ BitVec 32)) SeekEntryResult!7217)

(assert (=> b!725163 (= lt!321247 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725164 () Bool)

(declare-fun res!486302 () Bool)

(assert (=> b!725164 (=> (not res!486302) (not e!406126))))

(declare-datatypes ((List!13619 0))(
  ( (Nil!13616) (Cons!13615 (h!14672 (_ BitVec 64)) (t!19934 List!13619)) )
))
(declare-fun arrayNoDuplicates!0 (array!40992 (_ BitVec 32) List!13619) Bool)

(assert (=> b!725164 (= res!486302 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13616))))

(declare-fun res!486306 () Bool)

(assert (=> start!64474 (=> (not res!486306) (not e!406120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64474 (= res!486306 (validMask!0 mask!3328))))

(assert (=> start!64474 e!406120))

(assert (=> start!64474 true))

(declare-fun array_inv!15413 (array!40992) Bool)

(assert (=> start!64474 (array_inv!15413 a!3186)))

(declare-fun b!725165 () Bool)

(declare-fun res!486307 () Bool)

(declare-fun e!406125 () Bool)

(assert (=> b!725165 (=> (not res!486307) (not e!406125))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!725165 (= res!486307 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19617 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725166 () Bool)

(assert (=> b!725166 (= e!406126 e!406125)))

(declare-fun res!486301 () Bool)

(assert (=> b!725166 (=> (not res!486301) (not e!406125))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!321251 () SeekEntryResult!7217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40992 (_ BitVec 32)) SeekEntryResult!7217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725166 (= res!486301 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19617 a!3186) j!159) mask!3328) (select (arr!19617 a!3186) j!159) a!3186 mask!3328) lt!321251))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725166 (= lt!321251 (Intermediate!7217 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725167 () Bool)

(declare-fun res!486296 () Bool)

(assert (=> b!725167 (=> (not res!486296) (not e!406120))))

(assert (=> b!725167 (= res!486296 (and (= (size!20038 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20038 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20038 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725168 () Bool)

(declare-fun res!486305 () Bool)

(assert (=> b!725168 (=> (not res!486305) (not e!406120))))

(assert (=> b!725168 (= res!486305 (validKeyInArray!0 (select (arr!19617 a!3186) j!159)))))

(declare-fun b!725169 () Bool)

(declare-fun res!486294 () Bool)

(assert (=> b!725169 (=> (not res!486294) (not e!406126))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40992 (_ BitVec 32)) Bool)

(assert (=> b!725169 (= res!486294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!406123 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!725170 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40992 (_ BitVec 32)) SeekEntryResult!7217)

(assert (=> b!725170 (= e!406123 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19617 a!3186) j!159) a!3186 mask!3328) (Found!7217 j!159)))))

(declare-fun b!725171 () Bool)

(assert (=> b!725171 (= e!406123 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19617 a!3186) j!159) a!3186 mask!3328) lt!321251))))

(declare-fun b!725172 () Bool)

(declare-fun res!486298 () Bool)

(assert (=> b!725172 (=> (not res!486298) (not e!406120))))

(declare-fun arrayContainsKey!0 (array!40992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725172 (= res!486298 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725173 () Bool)

(declare-fun res!486303 () Bool)

(assert (=> b!725173 (=> (not res!486303) (not e!406126))))

(assert (=> b!725173 (= res!486303 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20038 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20038 a!3186))))))

(declare-fun b!725174 () Bool)

(declare-fun e!406121 () Bool)

(assert (=> b!725174 (= e!406121 (not true))))

(declare-fun e!406124 () Bool)

(assert (=> b!725174 e!406124))

(declare-fun res!486308 () Bool)

(assert (=> b!725174 (=> (not res!486308) (not e!406124))))

(assert (=> b!725174 (= res!486308 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24752 0))(
  ( (Unit!24753) )
))
(declare-fun lt!321249 () Unit!24752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40992 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24752)

(assert (=> b!725174 (= lt!321249 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725175 () Bool)

(assert (=> b!725175 (= e!406125 e!406121)))

(declare-fun res!486295 () Bool)

(assert (=> b!725175 (=> (not res!486295) (not e!406121))))

(declare-fun lt!321250 () (_ BitVec 64))

(declare-fun lt!321248 () array!40992)

(assert (=> b!725175 (= res!486295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321250 mask!3328) lt!321250 lt!321248 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321250 lt!321248 mask!3328)))))

(assert (=> b!725175 (= lt!321250 (select (store (arr!19617 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725175 (= lt!321248 (array!40993 (store (arr!19617 a!3186) i!1173 k!2102) (size!20038 a!3186)))))

(declare-fun b!725176 () Bool)

(declare-fun res!486299 () Bool)

(assert (=> b!725176 (=> (not res!486299) (not e!406125))))

(assert (=> b!725176 (= res!486299 e!406123)))

(declare-fun c!79807 () Bool)

(assert (=> b!725176 (= c!79807 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725177 () Bool)

(declare-fun e!406127 () Bool)

(assert (=> b!725177 (= e!406124 e!406127)))

(declare-fun res!486297 () Bool)

(assert (=> b!725177 (=> (not res!486297) (not e!406127))))

(declare-fun lt!321246 () SeekEntryResult!7217)

(assert (=> b!725177 (= res!486297 (= (seekEntryOrOpen!0 (select (arr!19617 a!3186) j!159) a!3186 mask!3328) lt!321246))))

(assert (=> b!725177 (= lt!321246 (Found!7217 j!159))))

(declare-fun b!725178 () Bool)

(assert (=> b!725178 (= e!406127 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19617 a!3186) j!159) a!3186 mask!3328) lt!321246))))

(assert (= (and start!64474 res!486306) b!725167))

(assert (= (and b!725167 res!486296) b!725168))

(assert (= (and b!725168 res!486305) b!725162))

(assert (= (and b!725162 res!486304) b!725172))

(assert (= (and b!725172 res!486298) b!725163))

(assert (= (and b!725163 res!486300) b!725169))

(assert (= (and b!725169 res!486294) b!725164))

(assert (= (and b!725164 res!486302) b!725173))

(assert (= (and b!725173 res!486303) b!725166))

(assert (= (and b!725166 res!486301) b!725165))

(assert (= (and b!725165 res!486307) b!725176))

(assert (= (and b!725176 c!79807) b!725171))

(assert (= (and b!725176 (not c!79807)) b!725170))

(assert (= (and b!725176 res!486299) b!725175))

(assert (= (and b!725175 res!486295) b!725174))

(assert (= (and b!725174 res!486308) b!725177))

(assert (= (and b!725177 res!486297) b!725178))

(declare-fun m!679351 () Bool)

(assert (=> b!725172 m!679351))

(declare-fun m!679353 () Bool)

(assert (=> b!725174 m!679353))

(declare-fun m!679355 () Bool)

(assert (=> b!725174 m!679355))

(declare-fun m!679357 () Bool)

(assert (=> start!64474 m!679357))

(declare-fun m!679359 () Bool)

(assert (=> start!64474 m!679359))

(declare-fun m!679361 () Bool)

(assert (=> b!725170 m!679361))

(assert (=> b!725170 m!679361))

(declare-fun m!679363 () Bool)

(assert (=> b!725170 m!679363))

(declare-fun m!679365 () Bool)

(assert (=> b!725162 m!679365))

(declare-fun m!679367 () Bool)

(assert (=> b!725163 m!679367))

(declare-fun m!679369 () Bool)

(assert (=> b!725169 m!679369))

(assert (=> b!725166 m!679361))

(assert (=> b!725166 m!679361))

(declare-fun m!679371 () Bool)

(assert (=> b!725166 m!679371))

(assert (=> b!725166 m!679371))

(assert (=> b!725166 m!679361))

(declare-fun m!679373 () Bool)

(assert (=> b!725166 m!679373))

(assert (=> b!725177 m!679361))

(assert (=> b!725177 m!679361))

(declare-fun m!679375 () Bool)

(assert (=> b!725177 m!679375))

(declare-fun m!679377 () Bool)

(assert (=> b!725165 m!679377))

(declare-fun m!679379 () Bool)

(assert (=> b!725175 m!679379))

(declare-fun m!679381 () Bool)

(assert (=> b!725175 m!679381))

(assert (=> b!725175 m!679379))

(declare-fun m!679383 () Bool)

(assert (=> b!725175 m!679383))

(declare-fun m!679385 () Bool)

(assert (=> b!725175 m!679385))

(declare-fun m!679387 () Bool)

(assert (=> b!725175 m!679387))

(assert (=> b!725171 m!679361))

(assert (=> b!725171 m!679361))

(declare-fun m!679389 () Bool)

(assert (=> b!725171 m!679389))

(assert (=> b!725168 m!679361))

(assert (=> b!725168 m!679361))

(declare-fun m!679391 () Bool)

(assert (=> b!725168 m!679391))

(declare-fun m!679393 () Bool)

(assert (=> b!725164 m!679393))

(assert (=> b!725178 m!679361))

(assert (=> b!725178 m!679361))

(declare-fun m!679395 () Bool)

(assert (=> b!725178 m!679395))

(push 1)

