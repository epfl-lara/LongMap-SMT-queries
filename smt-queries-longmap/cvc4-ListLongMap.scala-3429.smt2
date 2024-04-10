; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47698 () Bool)

(assert start!47698)

(declare-fun b!524449 () Bool)

(declare-fun e!305862 () Bool)

(assert (=> b!524449 (= e!305862 false)))

(declare-fun b!524450 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!305864 () Bool)

(declare-datatypes ((array!33335 0))(
  ( (array!33336 (arr!16019 (Array (_ BitVec 32) (_ BitVec 64))) (size!16383 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33335)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4486 0))(
  ( (MissingZero!4486 (index!20156 (_ BitVec 32))) (Found!4486 (index!20157 (_ BitVec 32))) (Intermediate!4486 (undefined!5298 Bool) (index!20158 (_ BitVec 32)) (x!49139 (_ BitVec 32))) (Undefined!4486) (MissingVacant!4486 (index!20159 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33335 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!524450 (= e!305864 (= (seekEntryOrOpen!0 (select (arr!16019 a!3235) j!176) a!3235 mask!3524) (Found!4486 j!176)))))

(declare-fun b!524451 () Bool)

(declare-fun e!305865 () Bool)

(declare-fun e!305860 () Bool)

(assert (=> b!524451 (= e!305865 e!305860)))

(declare-fun res!321365 () Bool)

(assert (=> b!524451 (=> (not res!321365) (not e!305860))))

(declare-fun lt!240695 () SeekEntryResult!4486)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524451 (= res!321365 (or (= lt!240695 (MissingZero!4486 i!1204)) (= lt!240695 (MissingVacant!4486 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!524451 (= lt!240695 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524452 () Bool)

(declare-datatypes ((Unit!16396 0))(
  ( (Unit!16397) )
))
(declare-fun e!305861 () Unit!16396)

(declare-fun Unit!16398 () Unit!16396)

(assert (=> b!524452 (= e!305861 Unit!16398)))

(declare-fun lt!240701 () SeekEntryResult!4486)

(declare-fun lt!240699 () (_ BitVec 32))

(declare-fun lt!240702 () Unit!16396)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16396)

(assert (=> b!524452 (= lt!240702 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240699 #b00000000000000000000000000000000 (index!20158 lt!240701) (x!49139 lt!240701) mask!3524))))

(declare-fun lt!240696 () array!33335)

(declare-fun res!321361 () Bool)

(declare-fun lt!240698 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33335 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!524452 (= res!321361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240699 lt!240698 lt!240696 mask!3524) (Intermediate!4486 false (index!20158 lt!240701) (x!49139 lt!240701))))))

(assert (=> b!524452 (=> (not res!321361) (not e!305862))))

(assert (=> b!524452 e!305862))

(declare-fun b!524453 () Bool)

(declare-fun res!321364 () Bool)

(declare-fun e!305863 () Bool)

(assert (=> b!524453 (=> res!321364 e!305863)))

(assert (=> b!524453 (= res!321364 (or (undefined!5298 lt!240701) (not (is-Intermediate!4486 lt!240701))))))

(declare-fun res!321354 () Bool)

(assert (=> start!47698 (=> (not res!321354) (not e!305865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47698 (= res!321354 (validMask!0 mask!3524))))

(assert (=> start!47698 e!305865))

(assert (=> start!47698 true))

(declare-fun array_inv!11815 (array!33335) Bool)

(assert (=> start!47698 (array_inv!11815 a!3235)))

(declare-fun b!524454 () Bool)

(declare-fun res!321359 () Bool)

(assert (=> b!524454 (=> (not res!321359) (not e!305865))))

(declare-fun arrayContainsKey!0 (array!33335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524454 (= res!321359 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524455 () Bool)

(declare-fun res!321355 () Bool)

(assert (=> b!524455 (=> (not res!321355) (not e!305860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33335 (_ BitVec 32)) Bool)

(assert (=> b!524455 (= res!321355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524456 () Bool)

(declare-fun res!321356 () Bool)

(assert (=> b!524456 (=> (not res!321356) (not e!305865))))

(assert (=> b!524456 (= res!321356 (and (= (size!16383 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16383 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16383 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524457 () Bool)

(declare-fun res!321362 () Bool)

(assert (=> b!524457 (=> (not res!321362) (not e!305865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524457 (= res!321362 (validKeyInArray!0 (select (arr!16019 a!3235) j!176)))))

(declare-fun b!524458 () Bool)

(assert (=> b!524458 (= e!305863 true)))

(assert (=> b!524458 (and (or (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240703 () Unit!16396)

(assert (=> b!524458 (= lt!240703 e!305861)))

(declare-fun c!61853 () Bool)

(assert (=> b!524458 (= c!61853 (= (select (arr!16019 a!3235) (index!20158 lt!240701)) (select (arr!16019 a!3235) j!176)))))

(assert (=> b!524458 (and (bvslt (x!49139 lt!240701) #b01111111111111111111111111111110) (or (= (select (arr!16019 a!3235) (index!20158 lt!240701)) (select (arr!16019 a!3235) j!176)) (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16019 a!3235) (index!20158 lt!240701)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524459 () Bool)

(declare-fun Unit!16399 () Unit!16396)

(assert (=> b!524459 (= e!305861 Unit!16399)))

(declare-fun b!524460 () Bool)

(declare-fun res!321358 () Bool)

(assert (=> b!524460 (=> (not res!321358) (not e!305865))))

(assert (=> b!524460 (= res!321358 (validKeyInArray!0 k!2280))))

(declare-fun b!524461 () Bool)

(declare-fun res!321357 () Bool)

(assert (=> b!524461 (=> (not res!321357) (not e!305860))))

(declare-datatypes ((List!10177 0))(
  ( (Nil!10174) (Cons!10173 (h!11104 (_ BitVec 64)) (t!16405 List!10177)) )
))
(declare-fun arrayNoDuplicates!0 (array!33335 (_ BitVec 32) List!10177) Bool)

(assert (=> b!524461 (= res!321357 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10174))))

(declare-fun b!524462 () Bool)

(assert (=> b!524462 (= e!305860 (not e!305863))))

(declare-fun res!321363 () Bool)

(assert (=> b!524462 (=> res!321363 e!305863)))

(declare-fun lt!240700 () (_ BitVec 32))

(assert (=> b!524462 (= res!321363 (= lt!240701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240700 lt!240698 lt!240696 mask!3524)))))

(assert (=> b!524462 (= lt!240701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240699 (select (arr!16019 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524462 (= lt!240700 (toIndex!0 lt!240698 mask!3524))))

(assert (=> b!524462 (= lt!240698 (select (store (arr!16019 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524462 (= lt!240699 (toIndex!0 (select (arr!16019 a!3235) j!176) mask!3524))))

(assert (=> b!524462 (= lt!240696 (array!33336 (store (arr!16019 a!3235) i!1204 k!2280) (size!16383 a!3235)))))

(assert (=> b!524462 e!305864))

(declare-fun res!321360 () Bool)

(assert (=> b!524462 (=> (not res!321360) (not e!305864))))

(assert (=> b!524462 (= res!321360 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240697 () Unit!16396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16396)

(assert (=> b!524462 (= lt!240697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47698 res!321354) b!524456))

(assert (= (and b!524456 res!321356) b!524457))

(assert (= (and b!524457 res!321362) b!524460))

(assert (= (and b!524460 res!321358) b!524454))

(assert (= (and b!524454 res!321359) b!524451))

(assert (= (and b!524451 res!321365) b!524455))

(assert (= (and b!524455 res!321355) b!524461))

(assert (= (and b!524461 res!321357) b!524462))

(assert (= (and b!524462 res!321360) b!524450))

(assert (= (and b!524462 (not res!321363)) b!524453))

(assert (= (and b!524453 (not res!321364)) b!524458))

(assert (= (and b!524458 c!61853) b!524452))

(assert (= (and b!524458 (not c!61853)) b!524459))

(assert (= (and b!524452 res!321361) b!524449))

(declare-fun m!505083 () Bool)

(assert (=> b!524461 m!505083))

(declare-fun m!505085 () Bool)

(assert (=> b!524450 m!505085))

(assert (=> b!524450 m!505085))

(declare-fun m!505087 () Bool)

(assert (=> b!524450 m!505087))

(declare-fun m!505089 () Bool)

(assert (=> b!524452 m!505089))

(declare-fun m!505091 () Bool)

(assert (=> b!524452 m!505091))

(declare-fun m!505093 () Bool)

(assert (=> b!524460 m!505093))

(declare-fun m!505095 () Bool)

(assert (=> b!524458 m!505095))

(assert (=> b!524458 m!505085))

(declare-fun m!505097 () Bool)

(assert (=> b!524462 m!505097))

(assert (=> b!524462 m!505085))

(declare-fun m!505099 () Bool)

(assert (=> b!524462 m!505099))

(declare-fun m!505101 () Bool)

(assert (=> b!524462 m!505101))

(declare-fun m!505103 () Bool)

(assert (=> b!524462 m!505103))

(declare-fun m!505105 () Bool)

(assert (=> b!524462 m!505105))

(assert (=> b!524462 m!505085))

(declare-fun m!505107 () Bool)

(assert (=> b!524462 m!505107))

(assert (=> b!524462 m!505085))

(declare-fun m!505109 () Bool)

(assert (=> b!524462 m!505109))

(declare-fun m!505111 () Bool)

(assert (=> b!524462 m!505111))

(declare-fun m!505113 () Bool)

(assert (=> b!524451 m!505113))

(declare-fun m!505115 () Bool)

(assert (=> b!524455 m!505115))

(declare-fun m!505117 () Bool)

(assert (=> start!47698 m!505117))

(declare-fun m!505119 () Bool)

(assert (=> start!47698 m!505119))

(assert (=> b!524457 m!505085))

(assert (=> b!524457 m!505085))

(declare-fun m!505121 () Bool)

(assert (=> b!524457 m!505121))

(declare-fun m!505123 () Bool)

(assert (=> b!524454 m!505123))

(push 1)

