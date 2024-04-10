; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64478 () Bool)

(assert start!64478)

(declare-fun b!725264 () Bool)

(declare-fun res!486395 () Bool)

(declare-fun e!406175 () Bool)

(assert (=> b!725264 (=> (not res!486395) (not e!406175))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40996 0))(
  ( (array!40997 (arr!19619 (Array (_ BitVec 32) (_ BitVec 64))) (size!20040 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40996)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725264 (= res!486395 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20040 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20040 a!3186))))))

(declare-fun b!725265 () Bool)

(declare-fun e!406173 () Bool)

(assert (=> b!725265 (= e!406173 (not true))))

(declare-fun e!406171 () Bool)

(assert (=> b!725265 e!406171))

(declare-fun res!486398 () Bool)

(assert (=> b!725265 (=> (not res!486398) (not e!406171))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40996 (_ BitVec 32)) Bool)

(assert (=> b!725265 (= res!486398 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24756 0))(
  ( (Unit!24757) )
))
(declare-fun lt!321283 () Unit!24756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24756)

(assert (=> b!725265 (= lt!321283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-datatypes ((SeekEntryResult!7219 0))(
  ( (MissingZero!7219 (index!31244 (_ BitVec 32))) (Found!7219 (index!31245 (_ BitVec 32))) (Intermediate!7219 (undefined!8031 Bool) (index!31246 (_ BitVec 32)) (x!62237 (_ BitVec 32))) (Undefined!7219) (MissingVacant!7219 (index!31247 (_ BitVec 32))) )
))
(declare-fun lt!321286 () SeekEntryResult!7219)

(declare-fun e!406168 () Bool)

(declare-fun b!725266 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40996 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!725266 (= e!406168 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321286))))

(declare-fun b!725267 () Bool)

(declare-fun res!486390 () Bool)

(assert (=> b!725267 (=> (not res!486390) (not e!406175))))

(declare-datatypes ((List!13621 0))(
  ( (Nil!13618) (Cons!13617 (h!14674 (_ BitVec 64)) (t!19936 List!13621)) )
))
(declare-fun arrayNoDuplicates!0 (array!40996 (_ BitVec 32) List!13621) Bool)

(assert (=> b!725267 (= res!486390 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13618))))

(declare-fun res!486384 () Bool)

(declare-fun e!406172 () Bool)

(assert (=> start!64478 (=> (not res!486384) (not e!406172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64478 (= res!486384 (validMask!0 mask!3328))))

(assert (=> start!64478 e!406172))

(assert (=> start!64478 true))

(declare-fun array_inv!15415 (array!40996) Bool)

(assert (=> start!64478 (array_inv!15415 a!3186)))

(declare-fun b!725268 () Bool)

(declare-fun res!486394 () Bool)

(assert (=> b!725268 (=> (not res!486394) (not e!406172))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725268 (= res!486394 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725269 () Bool)

(assert (=> b!725269 (= e!406172 e!406175)))

(declare-fun res!486393 () Bool)

(assert (=> b!725269 (=> (not res!486393) (not e!406175))))

(declare-fun lt!321285 () SeekEntryResult!7219)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725269 (= res!486393 (or (= lt!321285 (MissingZero!7219 i!1173)) (= lt!321285 (MissingVacant!7219 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40996 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!725269 (= lt!321285 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!406169 () Bool)

(declare-fun b!725270 () Bool)

(declare-fun lt!321282 () SeekEntryResult!7219)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40996 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!725270 (= e!406169 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321282))))

(declare-fun b!725271 () Bool)

(declare-fun res!486387 () Bool)

(assert (=> b!725271 (=> (not res!486387) (not e!406172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725271 (= res!486387 (validKeyInArray!0 k!2102))))

(declare-fun b!725272 () Bool)

(declare-fun res!486389 () Bool)

(assert (=> b!725272 (=> (not res!486389) (not e!406172))))

(assert (=> b!725272 (= res!486389 (and (= (size!20040 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20040 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20040 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725273 () Bool)

(declare-fun res!486397 () Bool)

(assert (=> b!725273 (=> (not res!486397) (not e!406172))))

(assert (=> b!725273 (= res!486397 (validKeyInArray!0 (select (arr!19619 a!3186) j!159)))))

(declare-fun b!725274 () Bool)

(declare-fun e!406170 () Bool)

(assert (=> b!725274 (= e!406175 e!406170)))

(declare-fun res!486396 () Bool)

(assert (=> b!725274 (=> (not res!486396) (not e!406170))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725274 (= res!486396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19619 a!3186) j!159) mask!3328) (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321286))))

(assert (=> b!725274 (= lt!321286 (Intermediate!7219 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725275 () Bool)

(assert (=> b!725275 (= e!406171 e!406169)))

(declare-fun res!486386 () Bool)

(assert (=> b!725275 (=> (not res!486386) (not e!406169))))

(assert (=> b!725275 (= res!486386 (= (seekEntryOrOpen!0 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321282))))

(assert (=> b!725275 (= lt!321282 (Found!7219 j!159))))

(declare-fun b!725276 () Bool)

(declare-fun res!486388 () Bool)

(assert (=> b!725276 (=> (not res!486388) (not e!406175))))

(assert (=> b!725276 (= res!486388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725277 () Bool)

(declare-fun res!486385 () Bool)

(assert (=> b!725277 (=> (not res!486385) (not e!406170))))

(assert (=> b!725277 (= res!486385 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19619 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725278 () Bool)

(assert (=> b!725278 (= e!406170 e!406173)))

(declare-fun res!486392 () Bool)

(assert (=> b!725278 (=> (not res!486392) (not e!406173))))

(declare-fun lt!321284 () (_ BitVec 64))

(declare-fun lt!321287 () array!40996)

(assert (=> b!725278 (= res!486392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321284 mask!3328) lt!321284 lt!321287 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321284 lt!321287 mask!3328)))))

(assert (=> b!725278 (= lt!321284 (select (store (arr!19619 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725278 (= lt!321287 (array!40997 (store (arr!19619 a!3186) i!1173 k!2102) (size!20040 a!3186)))))

(declare-fun b!725279 () Bool)

(declare-fun res!486391 () Bool)

(assert (=> b!725279 (=> (not res!486391) (not e!406170))))

(assert (=> b!725279 (= res!486391 e!406168)))

(declare-fun c!79813 () Bool)

(assert (=> b!725279 (= c!79813 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725280 () Bool)

(assert (=> b!725280 (= e!406168 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) (Found!7219 j!159)))))

(assert (= (and start!64478 res!486384) b!725272))

(assert (= (and b!725272 res!486389) b!725273))

(assert (= (and b!725273 res!486397) b!725271))

(assert (= (and b!725271 res!486387) b!725268))

(assert (= (and b!725268 res!486394) b!725269))

(assert (= (and b!725269 res!486393) b!725276))

(assert (= (and b!725276 res!486388) b!725267))

(assert (= (and b!725267 res!486390) b!725264))

(assert (= (and b!725264 res!486395) b!725274))

(assert (= (and b!725274 res!486396) b!725277))

(assert (= (and b!725277 res!486385) b!725279))

(assert (= (and b!725279 c!79813) b!725266))

(assert (= (and b!725279 (not c!79813)) b!725280))

(assert (= (and b!725279 res!486391) b!725278))

(assert (= (and b!725278 res!486392) b!725265))

(assert (= (and b!725265 res!486398) b!725275))

(assert (= (and b!725275 res!486386) b!725270))

(declare-fun m!679443 () Bool)

(assert (=> b!725267 m!679443))

(declare-fun m!679445 () Bool)

(assert (=> b!725269 m!679445))

(declare-fun m!679447 () Bool)

(assert (=> start!64478 m!679447))

(declare-fun m!679449 () Bool)

(assert (=> start!64478 m!679449))

(declare-fun m!679451 () Bool)

(assert (=> b!725266 m!679451))

(assert (=> b!725266 m!679451))

(declare-fun m!679453 () Bool)

(assert (=> b!725266 m!679453))

(declare-fun m!679455 () Bool)

(assert (=> b!725277 m!679455))

(assert (=> b!725270 m!679451))

(assert (=> b!725270 m!679451))

(declare-fun m!679457 () Bool)

(assert (=> b!725270 m!679457))

(declare-fun m!679459 () Bool)

(assert (=> b!725276 m!679459))

(assert (=> b!725275 m!679451))

(assert (=> b!725275 m!679451))

(declare-fun m!679461 () Bool)

(assert (=> b!725275 m!679461))

(assert (=> b!725273 m!679451))

(assert (=> b!725273 m!679451))

(declare-fun m!679463 () Bool)

(assert (=> b!725273 m!679463))

(declare-fun m!679465 () Bool)

(assert (=> b!725265 m!679465))

(declare-fun m!679467 () Bool)

(assert (=> b!725265 m!679467))

(assert (=> b!725280 m!679451))

(assert (=> b!725280 m!679451))

(declare-fun m!679469 () Bool)

(assert (=> b!725280 m!679469))

(assert (=> b!725274 m!679451))

(assert (=> b!725274 m!679451))

(declare-fun m!679471 () Bool)

(assert (=> b!725274 m!679471))

(assert (=> b!725274 m!679471))

(assert (=> b!725274 m!679451))

(declare-fun m!679473 () Bool)

(assert (=> b!725274 m!679473))

(declare-fun m!679475 () Bool)

(assert (=> b!725271 m!679475))

(declare-fun m!679477 () Bool)

(assert (=> b!725278 m!679477))

(declare-fun m!679479 () Bool)

(assert (=> b!725278 m!679479))

(declare-fun m!679481 () Bool)

(assert (=> b!725278 m!679481))

(declare-fun m!679483 () Bool)

(assert (=> b!725278 m!679483))

(declare-fun m!679485 () Bool)

(assert (=> b!725278 m!679485))

(assert (=> b!725278 m!679477))

(declare-fun m!679487 () Bool)

(assert (=> b!725268 m!679487))

(push 1)

