; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45462 () Bool)

(assert start!45462)

(declare-fun b!500358 () Bool)

(declare-fun e!293161 () Bool)

(assert (=> b!500358 (= e!293161 true)))

(declare-fun lt!227068 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3992 0))(
  ( (MissingZero!3992 (index!18150 (_ BitVec 32))) (Found!3992 (index!18151 (_ BitVec 32))) (Intermediate!3992 (undefined!4804 Bool) (index!18152 (_ BitVec 32)) (x!47189 (_ BitVec 32))) (Undefined!3992) (MissingVacant!3992 (index!18153 (_ BitVec 32))) )
))
(declare-fun lt!227063 () SeekEntryResult!3992)

(declare-fun lt!227066 () (_ BitVec 64))

(declare-datatypes ((array!32287 0))(
  ( (array!32288 (arr!15525 (Array (_ BitVec 32) (_ BitVec 64))) (size!15889 (_ BitVec 32))) )
))
(declare-fun lt!227061 () array!32287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32287 (_ BitVec 32)) SeekEntryResult!3992)

(assert (=> b!500358 (= lt!227063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227068 lt!227066 lt!227061 mask!3524))))

(declare-fun b!500359 () Bool)

(declare-fun e!293160 () Bool)

(assert (=> b!500359 (= e!293160 false)))

(declare-fun res!302201 () Bool)

(declare-fun e!293166 () Bool)

(assert (=> start!45462 (=> (not res!302201) (not e!293166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45462 (= res!302201 (validMask!0 mask!3524))))

(assert (=> start!45462 e!293166))

(assert (=> start!45462 true))

(declare-fun a!3235 () array!32287)

(declare-fun array_inv!11321 (array!32287) Bool)

(assert (=> start!45462 (array_inv!11321 a!3235)))

(declare-fun b!500360 () Bool)

(declare-fun res!302200 () Bool)

(declare-fun e!293162 () Bool)

(assert (=> b!500360 (=> (not res!302200) (not e!293162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32287 (_ BitVec 32)) Bool)

(assert (=> b!500360 (= res!302200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500361 () Bool)

(declare-fun res!302209 () Bool)

(assert (=> b!500361 (=> (not res!302209) (not e!293166))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500361 (= res!302209 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500362 () Bool)

(assert (=> b!500362 (= e!293166 e!293162)))

(declare-fun res!302207 () Bool)

(assert (=> b!500362 (=> (not res!302207) (not e!293162))))

(declare-fun lt!227064 () SeekEntryResult!3992)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500362 (= res!302207 (or (= lt!227064 (MissingZero!3992 i!1204)) (= lt!227064 (MissingVacant!3992 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32287 (_ BitVec 32)) SeekEntryResult!3992)

(assert (=> b!500362 (= lt!227064 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!500363 () Bool)

(declare-datatypes ((Unit!15044 0))(
  ( (Unit!15045) )
))
(declare-fun e!293164 () Unit!15044)

(declare-fun Unit!15046 () Unit!15044)

(assert (=> b!500363 (= e!293164 Unit!15046)))

(declare-fun b!500364 () Bool)

(declare-fun res!302199 () Bool)

(assert (=> b!500364 (=> (not res!302199) (not e!293162))))

(declare-datatypes ((List!9683 0))(
  ( (Nil!9680) (Cons!9679 (h!10553 (_ BitVec 64)) (t!15911 List!9683)) )
))
(declare-fun arrayNoDuplicates!0 (array!32287 (_ BitVec 32) List!9683) Bool)

(assert (=> b!500364 (= res!302199 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9680))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!500365 () Bool)

(declare-fun e!293165 () Bool)

(assert (=> b!500365 (= e!293165 (= (seekEntryOrOpen!0 (select (arr!15525 a!3235) j!176) a!3235 mask!3524) (Found!3992 j!176)))))

(declare-fun b!500366 () Bool)

(declare-fun Unit!15047 () Unit!15044)

(assert (=> b!500366 (= e!293164 Unit!15047)))

(declare-fun lt!227060 () Unit!15044)

(declare-fun lt!227062 () SeekEntryResult!3992)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32287 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15044)

(assert (=> b!500366 (= lt!227060 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227068 #b00000000000000000000000000000000 (index!18152 lt!227062) (x!47189 lt!227062) mask!3524))))

(declare-fun res!302202 () Bool)

(assert (=> b!500366 (= res!302202 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227068 lt!227066 lt!227061 mask!3524) (Intermediate!3992 false (index!18152 lt!227062) (x!47189 lt!227062))))))

(assert (=> b!500366 (=> (not res!302202) (not e!293160))))

(assert (=> b!500366 e!293160))

(declare-fun b!500367 () Bool)

(declare-fun e!293163 () Bool)

(assert (=> b!500367 (= e!293162 (not e!293163))))

(declare-fun res!302204 () Bool)

(assert (=> b!500367 (=> res!302204 e!293163)))

(declare-fun lt!227059 () (_ BitVec 32))

(assert (=> b!500367 (= res!302204 (= lt!227062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227059 lt!227066 lt!227061 mask!3524)))))

(assert (=> b!500367 (= lt!227062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227068 (select (arr!15525 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500367 (= lt!227059 (toIndex!0 lt!227066 mask!3524))))

(assert (=> b!500367 (= lt!227066 (select (store (arr!15525 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!500367 (= lt!227068 (toIndex!0 (select (arr!15525 a!3235) j!176) mask!3524))))

(assert (=> b!500367 (= lt!227061 (array!32288 (store (arr!15525 a!3235) i!1204 k!2280) (size!15889 a!3235)))))

(assert (=> b!500367 e!293165))

(declare-fun res!302205 () Bool)

(assert (=> b!500367 (=> (not res!302205) (not e!293165))))

(assert (=> b!500367 (= res!302205 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227065 () Unit!15044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15044)

(assert (=> b!500367 (= lt!227065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500368 () Bool)

(declare-fun res!302210 () Bool)

(assert (=> b!500368 (=> res!302210 e!293163)))

(assert (=> b!500368 (= res!302210 (or (undefined!4804 lt!227062) (not (is-Intermediate!3992 lt!227062))))))

(declare-fun b!500369 () Bool)

(declare-fun res!302203 () Bool)

(assert (=> b!500369 (=> (not res!302203) (not e!293166))))

(assert (=> b!500369 (= res!302203 (and (= (size!15889 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15889 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15889 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500370 () Bool)

(declare-fun res!302208 () Bool)

(assert (=> b!500370 (=> (not res!302208) (not e!293166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500370 (= res!302208 (validKeyInArray!0 k!2280))))

(declare-fun b!500371 () Bool)

(assert (=> b!500371 (= e!293163 e!293161)))

(declare-fun res!302198 () Bool)

(assert (=> b!500371 (=> res!302198 e!293161)))

(assert (=> b!500371 (= res!302198 (or (bvsgt #b00000000000000000000000000000000 (x!47189 lt!227062)) (bvsgt (x!47189 lt!227062) #b01111111111111111111111111111110) (bvslt lt!227068 #b00000000000000000000000000000000) (bvsge lt!227068 (size!15889 a!3235)) (bvslt (index!18152 lt!227062) #b00000000000000000000000000000000) (bvsge (index!18152 lt!227062) (size!15889 a!3235)) (not (= lt!227062 (Intermediate!3992 false (index!18152 lt!227062) (x!47189 lt!227062))))))))

(assert (=> b!500371 (and (or (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227067 () Unit!15044)

(assert (=> b!500371 (= lt!227067 e!293164)))

(declare-fun c!59357 () Bool)

(assert (=> b!500371 (= c!59357 (= (select (arr!15525 a!3235) (index!18152 lt!227062)) (select (arr!15525 a!3235) j!176)))))

(assert (=> b!500371 (and (bvslt (x!47189 lt!227062) #b01111111111111111111111111111110) (or (= (select (arr!15525 a!3235) (index!18152 lt!227062)) (select (arr!15525 a!3235) j!176)) (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15525 a!3235) (index!18152 lt!227062)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500372 () Bool)

(declare-fun res!302206 () Bool)

(assert (=> b!500372 (=> (not res!302206) (not e!293166))))

(assert (=> b!500372 (= res!302206 (validKeyInArray!0 (select (arr!15525 a!3235) j!176)))))

(assert (= (and start!45462 res!302201) b!500369))

(assert (= (and b!500369 res!302203) b!500372))

(assert (= (and b!500372 res!302206) b!500370))

(assert (= (and b!500370 res!302208) b!500361))

(assert (= (and b!500361 res!302209) b!500362))

(assert (= (and b!500362 res!302207) b!500360))

(assert (= (and b!500360 res!302200) b!500364))

(assert (= (and b!500364 res!302199) b!500367))

(assert (= (and b!500367 res!302205) b!500365))

(assert (= (and b!500367 (not res!302204)) b!500368))

(assert (= (and b!500368 (not res!302210)) b!500371))

(assert (= (and b!500371 c!59357) b!500366))

(assert (= (and b!500371 (not c!59357)) b!500363))

(assert (= (and b!500366 res!302202) b!500359))

(assert (= (and b!500371 (not res!302198)) b!500358))

(declare-fun m!481497 () Bool)

(assert (=> b!500358 m!481497))

(declare-fun m!481499 () Bool)

(assert (=> b!500365 m!481499))

(assert (=> b!500365 m!481499))

(declare-fun m!481501 () Bool)

(assert (=> b!500365 m!481501))

(declare-fun m!481503 () Bool)

(assert (=> b!500364 m!481503))

(declare-fun m!481505 () Bool)

(assert (=> b!500366 m!481505))

(assert (=> b!500366 m!481497))

(declare-fun m!481507 () Bool)

(assert (=> b!500361 m!481507))

(declare-fun m!481509 () Bool)

(assert (=> b!500367 m!481509))

(declare-fun m!481511 () Bool)

(assert (=> b!500367 m!481511))

(declare-fun m!481513 () Bool)

(assert (=> b!500367 m!481513))

(assert (=> b!500367 m!481499))

(declare-fun m!481515 () Bool)

(assert (=> b!500367 m!481515))

(assert (=> b!500367 m!481499))

(declare-fun m!481517 () Bool)

(assert (=> b!500367 m!481517))

(assert (=> b!500367 m!481499))

(declare-fun m!481519 () Bool)

(assert (=> b!500367 m!481519))

(declare-fun m!481521 () Bool)

(assert (=> b!500367 m!481521))

(declare-fun m!481523 () Bool)

(assert (=> b!500367 m!481523))

(declare-fun m!481525 () Bool)

(assert (=> start!45462 m!481525))

(declare-fun m!481527 () Bool)

(assert (=> start!45462 m!481527))

(declare-fun m!481529 () Bool)

(assert (=> b!500371 m!481529))

(assert (=> b!500371 m!481499))

(declare-fun m!481531 () Bool)

(assert (=> b!500360 m!481531))

(declare-fun m!481533 () Bool)

(assert (=> b!500370 m!481533))

(declare-fun m!481535 () Bool)

(assert (=> b!500362 m!481535))

(assert (=> b!500372 m!481499))

(assert (=> b!500372 m!481499))

(declare-fun m!481537 () Bool)

(assert (=> b!500372 m!481537))

(push 1)

