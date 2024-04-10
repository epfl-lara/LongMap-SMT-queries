; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123648 () Bool)

(assert start!123648)

(declare-fun e!809116 () Bool)

(declare-fun b!1433510 () Bool)

(declare-fun lt!631060 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97563 0))(
  ( (array!97564 (arr!47087 (Array (_ BitVec 32) (_ BitVec 64))) (size!47637 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97563)

(assert (=> b!1433510 (= e!809116 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (and (bvsge lt!631060 #b00000000000000000000000000000000) (bvslt lt!631060 (size!47637 a!2831)))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433510 (= lt!631060 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun e!809115 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun b!1433511 () Bool)

(declare-datatypes ((SeekEntryResult!11366 0))(
  ( (MissingZero!11366 (index!47856 (_ BitVec 32))) (Found!11366 (index!47857 (_ BitVec 32))) (Intermediate!11366 (undefined!12178 Bool) (index!47858 (_ BitVec 32)) (x!129505 (_ BitVec 32))) (Undefined!11366) (MissingVacant!11366 (index!47859 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97563 (_ BitVec 32)) SeekEntryResult!11366)

(assert (=> b!1433511 (= e!809115 (= (seekEntryOrOpen!0 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) (Found!11366 j!81)))))

(declare-fun b!1433512 () Bool)

(declare-fun res!967177 () Bool)

(declare-fun e!809119 () Bool)

(assert (=> b!1433512 (=> (not res!967177) (not e!809119))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1433512 (= res!967177 (and (= (size!47637 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47637 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47637 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1433513 () Bool)

(declare-fun res!967176 () Bool)

(assert (=> b!1433513 (=> (not res!967176) (not e!809119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97563 (_ BitVec 32)) Bool)

(assert (=> b!1433513 (= res!967176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1433514 () Bool)

(declare-fun res!967183 () Bool)

(assert (=> b!1433514 (=> (not res!967183) (not e!809119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1433514 (= res!967183 (validKeyInArray!0 (select (arr!47087 a!2831) i!982)))))

(declare-fun b!1433515 () Bool)

(declare-fun res!967179 () Bool)

(declare-fun e!809117 () Bool)

(assert (=> b!1433515 (=> (not res!967179) (not e!809117))))

(declare-fun lt!631061 () SeekEntryResult!11366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97563 (_ BitVec 32)) SeekEntryResult!11366)

(assert (=> b!1433515 (= res!967179 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631061))))

(declare-fun b!1433516 () Bool)

(declare-fun e!809118 () Bool)

(assert (=> b!1433516 (= e!809118 e!809117)))

(declare-fun res!967186 () Bool)

(assert (=> b!1433516 (=> (not res!967186) (not e!809117))))

(declare-fun lt!631063 () array!97563)

(declare-fun lt!631062 () SeekEntryResult!11366)

(declare-fun lt!631065 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1433516 (= res!967186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631065 mask!2608) lt!631065 lt!631063 mask!2608) lt!631062))))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(assert (=> b!1433516 (= lt!631062 (Intermediate!11366 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1433516 (= lt!631065 (select (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1433516 (= lt!631063 (array!97564 (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47637 a!2831)))))

(declare-fun res!967173 () Bool)

(assert (=> start!123648 (=> (not res!967173) (not e!809119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123648 (= res!967173 (validMask!0 mask!2608))))

(assert (=> start!123648 e!809119))

(assert (=> start!123648 true))

(declare-fun array_inv!36115 (array!97563) Bool)

(assert (=> start!123648 (array_inv!36115 a!2831)))

(declare-fun b!1433517 () Bool)

(declare-fun res!967175 () Bool)

(assert (=> b!1433517 (=> (not res!967175) (not e!809119))))

(assert (=> b!1433517 (= res!967175 (validKeyInArray!0 (select (arr!47087 a!2831) j!81)))))

(declare-fun b!1433518 () Bool)

(declare-fun res!967184 () Bool)

(assert (=> b!1433518 (=> (not res!967184) (not e!809117))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1433518 (= res!967184 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1433519 () Bool)

(assert (=> b!1433519 (= e!809119 e!809118)))

(declare-fun res!967185 () Bool)

(assert (=> b!1433519 (=> (not res!967185) (not e!809118))))

(assert (=> b!1433519 (= res!967185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631061))))

(assert (=> b!1433519 (= lt!631061 (Intermediate!11366 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1433520 () Bool)

(assert (=> b!1433520 (= e!809117 (not e!809116))))

(declare-fun res!967180 () Bool)

(assert (=> b!1433520 (=> res!967180 e!809116)))

(assert (=> b!1433520 (= res!967180 (or (= (select (arr!47087 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47087 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47087 a!2831) index!585) (select (arr!47087 a!2831) j!81)) (= (select (store (arr!47087 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1433520 e!809115))

(declare-fun res!967174 () Bool)

(assert (=> b!1433520 (=> (not res!967174) (not e!809115))))

(assert (=> b!1433520 (= res!967174 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48478 0))(
  ( (Unit!48479) )
))
(declare-fun lt!631064 () Unit!48478)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48478)

(assert (=> b!1433520 (= lt!631064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1433521 () Bool)

(declare-fun res!967178 () Bool)

(assert (=> b!1433521 (=> (not res!967178) (not e!809119))))

(declare-datatypes ((List!33597 0))(
  ( (Nil!33594) (Cons!33593 (h!34919 (_ BitVec 64)) (t!48291 List!33597)) )
))
(declare-fun arrayNoDuplicates!0 (array!97563 (_ BitVec 32) List!33597) Bool)

(assert (=> b!1433521 (= res!967178 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33594))))

(declare-fun b!1433522 () Bool)

(declare-fun res!967182 () Bool)

(assert (=> b!1433522 (=> (not res!967182) (not e!809119))))

(assert (=> b!1433522 (= res!967182 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47637 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47637 a!2831))))))

(declare-fun b!1433523 () Bool)

(declare-fun res!967181 () Bool)

(assert (=> b!1433523 (=> (not res!967181) (not e!809117))))

(assert (=> b!1433523 (= res!967181 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631065 lt!631063 mask!2608) lt!631062))))

(assert (= (and start!123648 res!967173) b!1433512))

(assert (= (and b!1433512 res!967177) b!1433514))

(assert (= (and b!1433514 res!967183) b!1433517))

(assert (= (and b!1433517 res!967175) b!1433513))

(assert (= (and b!1433513 res!967176) b!1433521))

(assert (= (and b!1433521 res!967178) b!1433522))

(assert (= (and b!1433522 res!967182) b!1433519))

(assert (= (and b!1433519 res!967185) b!1433516))

(assert (= (and b!1433516 res!967186) b!1433515))

(assert (= (and b!1433515 res!967179) b!1433523))

(assert (= (and b!1433523 res!967181) b!1433518))

(assert (= (and b!1433518 res!967184) b!1433520))

(assert (= (and b!1433520 res!967174) b!1433511))

(assert (= (and b!1433520 (not res!967180)) b!1433510))

(declare-fun m!1323231 () Bool)

(assert (=> b!1433516 m!1323231))

(assert (=> b!1433516 m!1323231))

(declare-fun m!1323233 () Bool)

(assert (=> b!1433516 m!1323233))

(declare-fun m!1323235 () Bool)

(assert (=> b!1433516 m!1323235))

(declare-fun m!1323237 () Bool)

(assert (=> b!1433516 m!1323237))

(declare-fun m!1323239 () Bool)

(assert (=> b!1433523 m!1323239))

(declare-fun m!1323241 () Bool)

(assert (=> b!1433519 m!1323241))

(assert (=> b!1433519 m!1323241))

(declare-fun m!1323243 () Bool)

(assert (=> b!1433519 m!1323243))

(assert (=> b!1433519 m!1323243))

(assert (=> b!1433519 m!1323241))

(declare-fun m!1323245 () Bool)

(assert (=> b!1433519 m!1323245))

(assert (=> b!1433511 m!1323241))

(assert (=> b!1433511 m!1323241))

(declare-fun m!1323247 () Bool)

(assert (=> b!1433511 m!1323247))

(declare-fun m!1323249 () Bool)

(assert (=> b!1433514 m!1323249))

(assert (=> b!1433514 m!1323249))

(declare-fun m!1323251 () Bool)

(assert (=> b!1433514 m!1323251))

(declare-fun m!1323253 () Bool)

(assert (=> start!123648 m!1323253))

(declare-fun m!1323255 () Bool)

(assert (=> start!123648 m!1323255))

(declare-fun m!1323257 () Bool)

(assert (=> b!1433510 m!1323257))

(assert (=> b!1433515 m!1323241))

(assert (=> b!1433515 m!1323241))

(declare-fun m!1323259 () Bool)

(assert (=> b!1433515 m!1323259))

(declare-fun m!1323261 () Bool)

(assert (=> b!1433513 m!1323261))

(assert (=> b!1433517 m!1323241))

(assert (=> b!1433517 m!1323241))

(declare-fun m!1323263 () Bool)

(assert (=> b!1433517 m!1323263))

(assert (=> b!1433520 m!1323235))

(declare-fun m!1323265 () Bool)

(assert (=> b!1433520 m!1323265))

(declare-fun m!1323267 () Bool)

(assert (=> b!1433520 m!1323267))

(declare-fun m!1323269 () Bool)

(assert (=> b!1433520 m!1323269))

(assert (=> b!1433520 m!1323241))

(declare-fun m!1323271 () Bool)

(assert (=> b!1433520 m!1323271))

(declare-fun m!1323273 () Bool)

(assert (=> b!1433521 m!1323273))

(push 1)

(assert (not b!1433513))

(assert (not b!1433516))

(assert (not b!1433521))

(assert (not b!1433510))

(assert (not start!123648))

(assert (not b!1433517))

(assert (not b!1433515))

(assert (not b!1433514))

(assert (not b!1433511))

(assert (not b!1433519))

(assert (not b!1433523))

(assert (not b!1433520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun e!809233 () SeekEntryResult!11366)

(declare-fun b!1433732 () Bool)

(declare-fun lt!631153 () SeekEntryResult!11366)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97563 (_ BitVec 32)) SeekEntryResult!11366)

(assert (=> b!1433732 (= e!809233 (seekKeyOrZeroReturnVacant!0 (x!129505 lt!631153) (index!47858 lt!631153) (index!47858 lt!631153) (select (arr!47087 a!2831) j!81) a!2831 mask!2608))))

(declare-fun d!154097 () Bool)

(declare-fun lt!631152 () SeekEntryResult!11366)

(assert (=> d!154097 (and (or (is-Undefined!11366 lt!631152) (not (is-Found!11366 lt!631152)) (and (bvsge (index!47857 lt!631152) #b00000000000000000000000000000000) (bvslt (index!47857 lt!631152) (size!47637 a!2831)))) (or (is-Undefined!11366 lt!631152) (is-Found!11366 lt!631152) (not (is-MissingZero!11366 lt!631152)) (and (bvsge (index!47856 lt!631152) #b00000000000000000000000000000000) (bvslt (index!47856 lt!631152) (size!47637 a!2831)))) (or (is-Undefined!11366 lt!631152) (is-Found!11366 lt!631152) (is-MissingZero!11366 lt!631152) (not (is-MissingVacant!11366 lt!631152)) (and (bvsge (index!47859 lt!631152) #b00000000000000000000000000000000) (bvslt (index!47859 lt!631152) (size!47637 a!2831)))) (or (is-Undefined!11366 lt!631152) (ite (is-Found!11366 lt!631152) (= (select (arr!47087 a!2831) (index!47857 lt!631152)) (select (arr!47087 a!2831) j!81)) (ite (is-MissingZero!11366 lt!631152) (= (select (arr!47087 a!2831) (index!47856 lt!631152)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11366 lt!631152) (= (select (arr!47087 a!2831) (index!47859 lt!631152)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!809234 () SeekEntryResult!11366)

(assert (=> d!154097 (= lt!631152 e!809234)))

(declare-fun c!132708 () Bool)

(assert (=> d!154097 (= c!132708 (and (is-Intermediate!11366 lt!631153) (undefined!12178 lt!631153)))))

(assert (=> d!154097 (= lt!631153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!154097 (validMask!0 mask!2608)))

(assert (=> d!154097 (= (seekEntryOrOpen!0 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631152)))

(declare-fun b!1433733 () Bool)

(declare-fun e!809232 () SeekEntryResult!11366)

(assert (=> b!1433733 (= e!809232 (Found!11366 (index!47858 lt!631153)))))

(declare-fun b!1433734 () Bool)

(declare-fun c!132709 () Bool)

(declare-fun lt!631154 () (_ BitVec 64))

(assert (=> b!1433734 (= c!132709 (= lt!631154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433734 (= e!809232 e!809233)))

(declare-fun b!1433735 () Bool)

(assert (=> b!1433735 (= e!809234 Undefined!11366)))

(declare-fun b!1433736 () Bool)

(assert (=> b!1433736 (= e!809233 (MissingZero!11366 (index!47858 lt!631153)))))

(declare-fun b!1433737 () Bool)

(assert (=> b!1433737 (= e!809234 e!809232)))

(assert (=> b!1433737 (= lt!631154 (select (arr!47087 a!2831) (index!47858 lt!631153)))))

(declare-fun c!132707 () Bool)

(assert (=> b!1433737 (= c!132707 (= lt!631154 (select (arr!47087 a!2831) j!81)))))

(assert (= (and d!154097 c!132708) b!1433735))

(assert (= (and d!154097 (not c!132708)) b!1433737))

(assert (= (and b!1433737 c!132707) b!1433733))

(assert (= (and b!1433737 (not c!132707)) b!1433734))

(assert (= (and b!1433734 c!132709) b!1433736))

(assert (= (and b!1433734 (not c!132709)) b!1433732))

(assert (=> b!1433732 m!1323241))

(declare-fun m!1323421 () Bool)

(assert (=> b!1433732 m!1323421))

(declare-fun m!1323423 () Bool)

(assert (=> d!154097 m!1323423))

(assert (=> d!154097 m!1323253))

(assert (=> d!154097 m!1323243))

(assert (=> d!154097 m!1323241))

(assert (=> d!154097 m!1323245))

(assert (=> d!154097 m!1323241))

(assert (=> d!154097 m!1323243))

(declare-fun m!1323425 () Bool)

(assert (=> d!154097 m!1323425))

(declare-fun m!1323427 () Bool)

(assert (=> d!154097 m!1323427))

(declare-fun m!1323429 () Bool)

(assert (=> b!1433737 m!1323429))

(assert (=> b!1433511 d!154097))

(declare-fun bm!67505 () Bool)

(declare-fun call!67508 () Bool)

(declare-fun c!132712 () Bool)

(assert (=> bm!67505 (= call!67508 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!132712 (Cons!33593 (select (arr!47087 a!2831) #b00000000000000000000000000000000) Nil!33594) Nil!33594)))))

(declare-fun b!1433748 () Bool)

(declare-fun e!809244 () Bool)

(declare-fun contains!9870 (List!33597 (_ BitVec 64)) Bool)

(assert (=> b!1433748 (= e!809244 (contains!9870 Nil!33594 (select (arr!47087 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433749 () Bool)

(declare-fun e!809245 () Bool)

(declare-fun e!809246 () Bool)

(assert (=> b!1433749 (= e!809245 e!809246)))

(assert (=> b!1433749 (= c!132712 (validKeyInArray!0 (select (arr!47087 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1433750 () Bool)

(assert (=> b!1433750 (= e!809246 call!67508)))

(declare-fun b!1433752 () Bool)

(assert (=> b!1433752 (= e!809246 call!67508)))

(declare-fun d!154117 () Bool)

(declare-fun res!967323 () Bool)

(declare-fun e!809243 () Bool)

(assert (=> d!154117 (=> res!967323 e!809243)))

(assert (=> d!154117 (= res!967323 (bvsge #b00000000000000000000000000000000 (size!47637 a!2831)))))

(assert (=> d!154117 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33594) e!809243)))

(declare-fun b!1433751 () Bool)

(assert (=> b!1433751 (= e!809243 e!809245)))

(declare-fun res!967322 () Bool)

(assert (=> b!1433751 (=> (not res!967322) (not e!809245))))

(assert (=> b!1433751 (= res!967322 (not e!809244))))

(declare-fun res!967324 () Bool)

(assert (=> b!1433751 (=> (not res!967324) (not e!809244))))

(assert (=> b!1433751 (= res!967324 (validKeyInArray!0 (select (arr!47087 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!154117 (not res!967323)) b!1433751))

(assert (= (and b!1433751 res!967324) b!1433748))

(assert (= (and b!1433751 res!967322) b!1433749))

(assert (= (and b!1433749 c!132712) b!1433750))

(assert (= (and b!1433749 (not c!132712)) b!1433752))

(assert (= (or b!1433750 b!1433752) bm!67505))

(declare-fun m!1323431 () Bool)

(assert (=> bm!67505 m!1323431))

(declare-fun m!1323433 () Bool)

(assert (=> bm!67505 m!1323433))

(assert (=> b!1433748 m!1323431))

(assert (=> b!1433748 m!1323431))

(declare-fun m!1323435 () Bool)

(assert (=> b!1433748 m!1323435))

(assert (=> b!1433749 m!1323431))

(assert (=> b!1433749 m!1323431))

(declare-fun m!1323437 () Bool)

(assert (=> b!1433749 m!1323437))

(assert (=> b!1433751 m!1323431))

(assert (=> b!1433751 m!1323431))

(assert (=> b!1433751 m!1323437))

(assert (=> b!1433521 d!154117))

(declare-fun b!1433822 () Bool)

(declare-fun e!809290 () Bool)

(declare-fun lt!631178 () SeekEntryResult!11366)

(assert (=> b!1433822 (= e!809290 (bvsge (x!129505 lt!631178) #b01111111111111111111111111111110))))

(declare-fun b!1433823 () Bool)

(assert (=> b!1433823 (and (bvsge (index!47858 lt!631178) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631178) (size!47637 lt!631063)))))

(declare-fun e!809289 () Bool)

(assert (=> b!1433823 (= e!809289 (= (select (arr!47087 lt!631063) (index!47858 lt!631178)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433824 () Bool)

(assert (=> b!1433824 (and (bvsge (index!47858 lt!631178) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631178) (size!47637 lt!631063)))))

(declare-fun res!967342 () Bool)

(assert (=> b!1433824 (= res!967342 (= (select (arr!47087 lt!631063) (index!47858 lt!631178)) lt!631065))))

(assert (=> b!1433824 (=> res!967342 e!809289)))

(declare-fun e!809288 () Bool)

(assert (=> b!1433824 (= e!809288 e!809289)))

(declare-fun b!1433825 () Bool)

(declare-fun e!809287 () SeekEntryResult!11366)

(assert (=> b!1433825 (= e!809287 (Intermediate!11366 false index!585 x!605))))

(declare-fun d!154125 () Bool)

(assert (=> d!154125 e!809290))

(declare-fun c!132742 () Bool)

(assert (=> d!154125 (= c!132742 (and (is-Intermediate!11366 lt!631178) (undefined!12178 lt!631178)))))

(declare-fun e!809291 () SeekEntryResult!11366)

(assert (=> d!154125 (= lt!631178 e!809291)))

(declare-fun c!132740 () Bool)

(assert (=> d!154125 (= c!132740 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631177 () (_ BitVec 64))

(assert (=> d!154125 (= lt!631177 (select (arr!47087 lt!631063) index!585))))

(assert (=> d!154125 (validMask!0 mask!2608)))

(assert (=> d!154125 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631065 lt!631063 mask!2608) lt!631178)))

(declare-fun b!1433826 () Bool)

(assert (=> b!1433826 (= e!809291 e!809287)))

(declare-fun c!132741 () Bool)

(assert (=> b!1433826 (= c!132741 (or (= lt!631177 lt!631065) (= (bvadd lt!631177 lt!631177) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433827 () Bool)

(assert (=> b!1433827 (= e!809287 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!631065 lt!631063 mask!2608))))

(declare-fun b!1433828 () Bool)

(assert (=> b!1433828 (= e!809291 (Intermediate!11366 true index!585 x!605))))

(declare-fun b!1433829 () Bool)

(assert (=> b!1433829 (= e!809290 e!809288)))

(declare-fun res!967341 () Bool)

(assert (=> b!1433829 (= res!967341 (and (is-Intermediate!11366 lt!631178) (not (undefined!12178 lt!631178)) (bvslt (x!129505 lt!631178) #b01111111111111111111111111111110) (bvsge (x!129505 lt!631178) #b00000000000000000000000000000000) (bvsge (x!129505 lt!631178) x!605)))))

(assert (=> b!1433829 (=> (not res!967341) (not e!809288))))

(declare-fun b!1433830 () Bool)

(assert (=> b!1433830 (and (bvsge (index!47858 lt!631178) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631178) (size!47637 lt!631063)))))

(declare-fun res!967340 () Bool)

(assert (=> b!1433830 (= res!967340 (= (select (arr!47087 lt!631063) (index!47858 lt!631178)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433830 (=> res!967340 e!809289)))

(assert (= (and d!154125 c!132740) b!1433828))

(assert (= (and d!154125 (not c!132740)) b!1433826))

(assert (= (and b!1433826 c!132741) b!1433825))

(assert (= (and b!1433826 (not c!132741)) b!1433827))

(assert (= (and d!154125 c!132742) b!1433822))

(assert (= (and d!154125 (not c!132742)) b!1433829))

(assert (= (and b!1433829 res!967341) b!1433824))

(assert (= (and b!1433824 (not res!967342)) b!1433830))

(assert (= (and b!1433830 (not res!967340)) b!1433823))

(declare-fun m!1323467 () Bool)

(assert (=> d!154125 m!1323467))

(assert (=> d!154125 m!1323253))

(declare-fun m!1323469 () Bool)

(assert (=> b!1433824 m!1323469))

(assert (=> b!1433823 m!1323469))

(assert (=> b!1433827 m!1323257))

(assert (=> b!1433827 m!1323257))

(declare-fun m!1323471 () Bool)

(assert (=> b!1433827 m!1323471))

(assert (=> b!1433830 m!1323469))

(assert (=> b!1433523 d!154125))

(declare-fun d!154131 () Bool)

(assert (=> d!154131 (= (validKeyInArray!0 (select (arr!47087 a!2831) i!982)) (and (not (= (select (arr!47087 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47087 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433514 d!154131))

(declare-fun b!1433860 () Bool)

(declare-fun e!809312 () Bool)

(declare-fun e!809314 () Bool)

(assert (=> b!1433860 (= e!809312 e!809314)))

(declare-fun c!132751 () Bool)

(assert (=> b!1433860 (= c!132751 (validKeyInArray!0 (select (arr!47087 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!154133 () Bool)

(declare-fun res!967357 () Bool)

(assert (=> d!154133 (=> res!967357 e!809312)))

(assert (=> d!154133 (= res!967357 (bvsge #b00000000000000000000000000000000 (size!47637 a!2831)))))

(assert (=> d!154133 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!809312)))

(declare-fun b!1433861 () Bool)

(declare-fun call!67517 () Bool)

(assert (=> b!1433861 (= e!809314 call!67517)))

(declare-fun b!1433862 () Bool)

(declare-fun e!809313 () Bool)

(assert (=> b!1433862 (= e!809313 call!67517)))

(declare-fun b!1433863 () Bool)

(assert (=> b!1433863 (= e!809314 e!809313)))

(declare-fun lt!631202 () (_ BitVec 64))

(assert (=> b!1433863 (= lt!631202 (select (arr!47087 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!631204 () Unit!48478)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97563 (_ BitVec 64) (_ BitVec 32)) Unit!48478)

(assert (=> b!1433863 (= lt!631204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!631202 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1433863 (arrayContainsKey!0 a!2831 lt!631202 #b00000000000000000000000000000000)))

(declare-fun lt!631203 () Unit!48478)

(assert (=> b!1433863 (= lt!631203 lt!631204)))

(declare-fun res!967358 () Bool)

(assert (=> b!1433863 (= res!967358 (= (seekEntryOrOpen!0 (select (arr!47087 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11366 #b00000000000000000000000000000000)))))

(assert (=> b!1433863 (=> (not res!967358) (not e!809313))))

(declare-fun bm!67514 () Bool)

(assert (=> bm!67514 (= call!67517 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!154133 (not res!967357)) b!1433860))

(assert (= (and b!1433860 c!132751) b!1433863))

(assert (= (and b!1433860 (not c!132751)) b!1433861))

(assert (= (and b!1433863 res!967358) b!1433862))

(assert (= (or b!1433862 b!1433861) bm!67514))

(assert (=> b!1433860 m!1323431))

(assert (=> b!1433860 m!1323431))

(assert (=> b!1433860 m!1323437))

(assert (=> b!1433863 m!1323431))

(declare-fun m!1323489 () Bool)

(assert (=> b!1433863 m!1323489))

(declare-fun m!1323491 () Bool)

(assert (=> b!1433863 m!1323491))

(assert (=> b!1433863 m!1323431))

(declare-fun m!1323493 () Bool)

(assert (=> b!1433863 m!1323493))

(declare-fun m!1323495 () Bool)

(assert (=> bm!67514 m!1323495))

(assert (=> b!1433513 d!154133))

(declare-fun b!1433864 () Bool)

(declare-fun e!809318 () Bool)

(declare-fun lt!631206 () SeekEntryResult!11366)

(assert (=> b!1433864 (= e!809318 (bvsge (x!129505 lt!631206) #b01111111111111111111111111111110))))

(declare-fun b!1433865 () Bool)

(assert (=> b!1433865 (and (bvsge (index!47858 lt!631206) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631206) (size!47637 a!2831)))))

(declare-fun e!809317 () Bool)

(assert (=> b!1433865 (= e!809317 (= (select (arr!47087 a!2831) (index!47858 lt!631206)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433866 () Bool)

(assert (=> b!1433866 (and (bvsge (index!47858 lt!631206) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631206) (size!47637 a!2831)))))

(declare-fun res!967361 () Bool)

(assert (=> b!1433866 (= res!967361 (= (select (arr!47087 a!2831) (index!47858 lt!631206)) (select (arr!47087 a!2831) j!81)))))

(assert (=> b!1433866 (=> res!967361 e!809317)))

(declare-fun e!809316 () Bool)

(assert (=> b!1433866 (= e!809316 e!809317)))

(declare-fun b!1433867 () Bool)

(declare-fun e!809315 () SeekEntryResult!11366)

(assert (=> b!1433867 (= e!809315 (Intermediate!11366 false index!585 x!605))))

(declare-fun d!154141 () Bool)

(assert (=> d!154141 e!809318))

(declare-fun c!132754 () Bool)

(assert (=> d!154141 (= c!132754 (and (is-Intermediate!11366 lt!631206) (undefined!12178 lt!631206)))))

(declare-fun e!809319 () SeekEntryResult!11366)

(assert (=> d!154141 (= lt!631206 e!809319)))

(declare-fun c!132752 () Bool)

(assert (=> d!154141 (= c!132752 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!631205 () (_ BitVec 64))

(assert (=> d!154141 (= lt!631205 (select (arr!47087 a!2831) index!585))))

(assert (=> d!154141 (validMask!0 mask!2608)))

(assert (=> d!154141 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631206)))

(declare-fun b!1433868 () Bool)

(assert (=> b!1433868 (= e!809319 e!809315)))

(declare-fun c!132753 () Bool)

(assert (=> b!1433868 (= c!132753 (or (= lt!631205 (select (arr!47087 a!2831) j!81)) (= (bvadd lt!631205 lt!631205) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433869 () Bool)

(assert (=> b!1433869 (= e!809315 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1433870 () Bool)

(assert (=> b!1433870 (= e!809319 (Intermediate!11366 true index!585 x!605))))

(declare-fun b!1433871 () Bool)

(assert (=> b!1433871 (= e!809318 e!809316)))

(declare-fun res!967360 () Bool)

(assert (=> b!1433871 (= res!967360 (and (is-Intermediate!11366 lt!631206) (not (undefined!12178 lt!631206)) (bvslt (x!129505 lt!631206) #b01111111111111111111111111111110) (bvsge (x!129505 lt!631206) #b00000000000000000000000000000000) (bvsge (x!129505 lt!631206) x!605)))))

(assert (=> b!1433871 (=> (not res!967360) (not e!809316))))

(declare-fun b!1433872 () Bool)

(assert (=> b!1433872 (and (bvsge (index!47858 lt!631206) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631206) (size!47637 a!2831)))))

(declare-fun res!967359 () Bool)

(assert (=> b!1433872 (= res!967359 (= (select (arr!47087 a!2831) (index!47858 lt!631206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433872 (=> res!967359 e!809317)))

(assert (= (and d!154141 c!132752) b!1433870))

(assert (= (and d!154141 (not c!132752)) b!1433868))

(assert (= (and b!1433868 c!132753) b!1433867))

(assert (= (and b!1433868 (not c!132753)) b!1433869))

(assert (= (and d!154141 c!132754) b!1433864))

(assert (= (and d!154141 (not c!132754)) b!1433871))

(assert (= (and b!1433871 res!967360) b!1433866))

(assert (= (and b!1433866 (not res!967361)) b!1433872))

(assert (= (and b!1433872 (not res!967359)) b!1433865))

(assert (=> d!154141 m!1323267))

(assert (=> d!154141 m!1323253))

(declare-fun m!1323497 () Bool)

(assert (=> b!1433866 m!1323497))

(assert (=> b!1433865 m!1323497))

(assert (=> b!1433869 m!1323257))

(assert (=> b!1433869 m!1323257))

(assert (=> b!1433869 m!1323241))

(declare-fun m!1323499 () Bool)

(assert (=> b!1433869 m!1323499))

(assert (=> b!1433872 m!1323497))

(assert (=> b!1433515 d!154141))

(declare-fun b!1433873 () Bool)

(declare-fun e!809323 () Bool)

(declare-fun lt!631208 () SeekEntryResult!11366)

(assert (=> b!1433873 (= e!809323 (bvsge (x!129505 lt!631208) #b01111111111111111111111111111110))))

(declare-fun b!1433874 () Bool)

(assert (=> b!1433874 (and (bvsge (index!47858 lt!631208) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631208) (size!47637 lt!631063)))))

(declare-fun e!809322 () Bool)

(assert (=> b!1433874 (= e!809322 (= (select (arr!47087 lt!631063) (index!47858 lt!631208)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433875 () Bool)

(assert (=> b!1433875 (and (bvsge (index!47858 lt!631208) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631208) (size!47637 lt!631063)))))

(declare-fun res!967364 () Bool)

(assert (=> b!1433875 (= res!967364 (= (select (arr!47087 lt!631063) (index!47858 lt!631208)) lt!631065))))

(assert (=> b!1433875 (=> res!967364 e!809322)))

(declare-fun e!809321 () Bool)

(assert (=> b!1433875 (= e!809321 e!809322)))

(declare-fun b!1433876 () Bool)

(declare-fun e!809320 () SeekEntryResult!11366)

(assert (=> b!1433876 (= e!809320 (Intermediate!11366 false (toIndex!0 lt!631065 mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154143 () Bool)

(assert (=> d!154143 e!809323))

(declare-fun c!132757 () Bool)

(assert (=> d!154143 (= c!132757 (and (is-Intermediate!11366 lt!631208) (undefined!12178 lt!631208)))))

(declare-fun e!809324 () SeekEntryResult!11366)

(assert (=> d!154143 (= lt!631208 e!809324)))

(declare-fun c!132755 () Bool)

(assert (=> d!154143 (= c!132755 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631207 () (_ BitVec 64))

(assert (=> d!154143 (= lt!631207 (select (arr!47087 lt!631063) (toIndex!0 lt!631065 mask!2608)))))

(assert (=> d!154143 (validMask!0 mask!2608)))

(assert (=> d!154143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631065 mask!2608) lt!631065 lt!631063 mask!2608) lt!631208)))

(declare-fun b!1433877 () Bool)

(assert (=> b!1433877 (= e!809324 e!809320)))

(declare-fun c!132756 () Bool)

(assert (=> b!1433877 (= c!132756 (or (= lt!631207 lt!631065) (= (bvadd lt!631207 lt!631207) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433878 () Bool)

(assert (=> b!1433878 (= e!809320 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!631065 mask!2608) #b00000000000000000000000000000000 mask!2608) lt!631065 lt!631063 mask!2608))))

(declare-fun b!1433879 () Bool)

(assert (=> b!1433879 (= e!809324 (Intermediate!11366 true (toIndex!0 lt!631065 mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1433880 () Bool)

(assert (=> b!1433880 (= e!809323 e!809321)))

(declare-fun res!967363 () Bool)

(assert (=> b!1433880 (= res!967363 (and (is-Intermediate!11366 lt!631208) (not (undefined!12178 lt!631208)) (bvslt (x!129505 lt!631208) #b01111111111111111111111111111110) (bvsge (x!129505 lt!631208) #b00000000000000000000000000000000) (bvsge (x!129505 lt!631208) #b00000000000000000000000000000000)))))

(assert (=> b!1433880 (=> (not res!967363) (not e!809321))))

(declare-fun b!1433881 () Bool)

(assert (=> b!1433881 (and (bvsge (index!47858 lt!631208) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631208) (size!47637 lt!631063)))))

(declare-fun res!967362 () Bool)

(assert (=> b!1433881 (= res!967362 (= (select (arr!47087 lt!631063) (index!47858 lt!631208)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1433881 (=> res!967362 e!809322)))

(assert (= (and d!154143 c!132755) b!1433879))

(assert (= (and d!154143 (not c!132755)) b!1433877))

(assert (= (and b!1433877 c!132756) b!1433876))

(assert (= (and b!1433877 (not c!132756)) b!1433878))

(assert (= (and d!154143 c!132757) b!1433873))

(assert (= (and d!154143 (not c!132757)) b!1433880))

(assert (= (and b!1433880 res!967363) b!1433875))

(assert (= (and b!1433875 (not res!967364)) b!1433881))

(assert (= (and b!1433881 (not res!967362)) b!1433874))

(assert (=> d!154143 m!1323231))

(declare-fun m!1323501 () Bool)

(assert (=> d!154143 m!1323501))

(assert (=> d!154143 m!1323253))

(declare-fun m!1323503 () Bool)

(assert (=> b!1433875 m!1323503))

(assert (=> b!1433874 m!1323503))

(assert (=> b!1433878 m!1323231))

(declare-fun m!1323505 () Bool)

(assert (=> b!1433878 m!1323505))

(assert (=> b!1433878 m!1323505))

(declare-fun m!1323507 () Bool)

(assert (=> b!1433878 m!1323507))

(assert (=> b!1433881 m!1323503))

(assert (=> b!1433516 d!154143))

(declare-fun d!154145 () Bool)

(declare-fun lt!631217 () (_ BitVec 32))

(declare-fun lt!631216 () (_ BitVec 32))

(assert (=> d!154145 (= lt!631217 (bvmul (bvxor lt!631216 (bvlshr lt!631216 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154145 (= lt!631216 ((_ extract 31 0) (bvand (bvxor lt!631065 (bvlshr lt!631065 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154145 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!967365 (let ((h!34924 ((_ extract 31 0) (bvand (bvxor lt!631065 (bvlshr lt!631065 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129514 (bvmul (bvxor h!34924 (bvlshr h!34924 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129514 (bvlshr x!129514 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!967365 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!967365 #b00000000000000000000000000000000))))))

(assert (=> d!154145 (= (toIndex!0 lt!631065 mask!2608) (bvand (bvxor lt!631217 (bvlshr lt!631217 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1433516 d!154145))

(declare-fun d!154155 () Bool)

(assert (=> d!154155 (= (validKeyInArray!0 (select (arr!47087 a!2831) j!81)) (and (not (= (select (arr!47087 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47087 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1433517 d!154155))

(declare-fun b!1433886 () Bool)

(declare-fun e!809331 () Bool)

(declare-fun lt!631219 () SeekEntryResult!11366)

(assert (=> b!1433886 (= e!809331 (bvsge (x!129505 lt!631219) #b01111111111111111111111111111110))))

(declare-fun b!1433887 () Bool)

(assert (=> b!1433887 (and (bvsge (index!47858 lt!631219) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631219) (size!47637 a!2831)))))

(declare-fun e!809330 () Bool)

(assert (=> b!1433887 (= e!809330 (= (select (arr!47087 a!2831) (index!47858 lt!631219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1433888 () Bool)

(assert (=> b!1433888 (and (bvsge (index!47858 lt!631219) #b00000000000000000000000000000000) (bvslt (index!47858 lt!631219) (size!47637 a!2831)))))

(declare-fun res!967370 () Bool)

(assert (=> b!1433888 (= res!967370 (= (select (arr!47087 a!2831) (index!47858 lt!631219)) (select (arr!47087 a!2831) j!81)))))

(assert (=> b!1433888 (=> res!967370 e!809330)))

(declare-fun e!809329 () Bool)

(assert (=> b!1433888 (= e!809329 e!809330)))

(declare-fun b!1433889 () Bool)

(declare-fun e!809328 () SeekEntryResult!11366)

(assert (=> b!1433889 (= e!809328 (Intermediate!11366 false (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!154157 () Bool)

(assert (=> d!154157 e!809331))

(declare-fun c!132761 () Bool)

(assert (=> d!154157 (= c!132761 (and (is-Intermediate!11366 lt!631219) (undefined!12178 lt!631219)))))

(declare-fun e!809332 () SeekEntryResult!11366)

(assert (=> d!154157 (= lt!631219 e!809332)))

(declare-fun c!132759 () Bool)

(assert (=> d!154157 (= c!132759 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!631218 () (_ BitVec 64))

(assert (=> d!154157 (= lt!631218 (select (arr!47087 a!2831) (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608)))))

(assert (=> d!154157 (validMask!0 mask!2608)))

(assert (=> d!154157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608) lt!631219)))

(declare-fun b!1433890 () Bool)

(assert (=> b!1433890 (= e!809332 e!809328)))

(declare-fun c!132760 () Bool)

(assert (=> b!1433890 (= c!132760 (or (= lt!631218 (select (arr!47087 a!2831) j!81)) (= (bvadd lt!631218 lt!631218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1433891 () Bool)

(assert (=> b!1433891 (= e!809328 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47087 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!47087 a!2831) j!81) a!2831 mask!2608))))

