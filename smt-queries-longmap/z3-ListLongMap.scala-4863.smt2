; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67138 () Bool)

(assert start!67138)

(declare-fun b!774251 () Bool)

(declare-fun res!523498 () Bool)

(declare-fun e!431049 () Bool)

(assert (=> b!774251 (=> (not res!523498) (not e!431049))))

(declare-datatypes ((array!42442 0))(
  ( (array!42443 (arr!20314 (Array (_ BitVec 32) (_ BitVec 64))) (size!20734 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42442)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!774251 (= res!523498 (and (= (size!20734 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20734 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20734 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!774253 () Bool)

(declare-fun res!523486 () Bool)

(assert (=> b!774253 (=> (not res!523486) (not e!431049))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!774253 (= res!523486 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7870 0))(
  ( (MissingZero!7870 (index!33848 (_ BitVec 32))) (Found!7870 (index!33849 (_ BitVec 32))) (Intermediate!7870 (undefined!8682 Bool) (index!33850 (_ BitVec 32)) (x!64948 (_ BitVec 32))) (Undefined!7870) (MissingVacant!7870 (index!33851 (_ BitVec 32))) )
))
(declare-fun lt!344781 () SeekEntryResult!7870)

(declare-fun b!774254 () Bool)

(declare-fun lt!344783 () (_ BitVec 32))

(declare-fun e!431050 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!774254 (= e!431050 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344783 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344781))))

(declare-fun b!774255 () Bool)

(declare-fun res!523489 () Bool)

(declare-fun e!431053 () Bool)

(assert (=> b!774255 (=> (not res!523489) (not e!431053))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!774255 (= res!523489 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20314 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!774256 () Bool)

(declare-fun e!431047 () Bool)

(assert (=> b!774256 (= e!431047 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344781))))

(declare-fun b!774257 () Bool)

(declare-fun res!523500 () Bool)

(declare-fun e!431052 () Bool)

(assert (=> b!774257 (=> (not res!523500) (not e!431052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42442 (_ BitVec 32)) Bool)

(assert (=> b!774257 (= res!523500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!774258 () Bool)

(declare-fun res!523490 () Bool)

(assert (=> b!774258 (=> (not res!523490) (not e!431049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!774258 (= res!523490 (validKeyInArray!0 (select (arr!20314 a!3186) j!159)))))

(declare-fun b!774259 () Bool)

(declare-fun e!431042 () Bool)

(declare-fun e!431045 () Bool)

(assert (=> b!774259 (= e!431042 (not e!431045))))

(declare-fun res!523484 () Bool)

(assert (=> b!774259 (=> res!523484 e!431045)))

(declare-fun lt!344780 () SeekEntryResult!7870)

(get-info :version)

(assert (=> b!774259 (= res!523484 (or (not ((_ is Intermediate!7870) lt!344780)) (bvsge x!1131 (x!64948 lt!344780))))))

(declare-fun lt!344776 () SeekEntryResult!7870)

(assert (=> b!774259 (= lt!344776 (Found!7870 j!159))))

(declare-fun e!431043 () Bool)

(assert (=> b!774259 e!431043))

(declare-fun res!523495 () Bool)

(assert (=> b!774259 (=> (not res!523495) (not e!431043))))

(assert (=> b!774259 (= res!523495 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26671 0))(
  ( (Unit!26672) )
))
(declare-fun lt!344775 () Unit!26671)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26671)

(assert (=> b!774259 (= lt!344775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!774260 () Bool)

(assert (=> b!774260 (= e!431049 e!431052)))

(declare-fun res!523492 () Bool)

(assert (=> b!774260 (=> (not res!523492) (not e!431052))))

(declare-fun lt!344778 () SeekEntryResult!7870)

(assert (=> b!774260 (= res!523492 (or (= lt!344778 (MissingZero!7870 i!1173)) (= lt!344778 (MissingVacant!7870 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!774260 (= lt!344778 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!774261 () Bool)

(declare-fun res!523496 () Bool)

(assert (=> b!774261 (=> (not res!523496) (not e!431049))))

(assert (=> b!774261 (= res!523496 (validKeyInArray!0 k0!2102))))

(declare-fun b!774262 () Bool)

(declare-fun e!431046 () Bool)

(assert (=> b!774262 (= e!431043 e!431046)))

(declare-fun res!523493 () Bool)

(assert (=> b!774262 (=> (not res!523493) (not e!431046))))

(declare-fun lt!344774 () SeekEntryResult!7870)

(assert (=> b!774262 (= res!523493 (= (seekEntryOrOpen!0 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344774))))

(assert (=> b!774262 (= lt!344774 (Found!7870 j!159))))

(declare-fun b!774263 () Bool)

(declare-fun e!431044 () Bool)

(assert (=> b!774263 (= e!431044 e!431050)))

(declare-fun c!85786 () Bool)

(declare-fun lt!344784 () Bool)

(assert (=> b!774263 (= c!85786 lt!344784)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!774264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7870)

(assert (=> b!774264 (= e!431046 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344774))))

(declare-fun b!774265 () Bool)

(declare-fun e!431051 () Unit!26671)

(declare-fun Unit!26673 () Unit!26671)

(assert (=> b!774265 (= e!431051 Unit!26673)))

(declare-fun lt!344782 () SeekEntryResult!7870)

(assert (=> b!774265 (= lt!344782 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!774265 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344783 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344776)))

(declare-fun b!774266 () Bool)

(assert (=> b!774266 (= e!431047 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) (Found!7870 j!159)))))

(declare-fun res!523494 () Bool)

(assert (=> start!67138 (=> (not res!523494) (not e!431049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67138 (= res!523494 (validMask!0 mask!3328))))

(assert (=> start!67138 e!431049))

(assert (=> start!67138 true))

(declare-fun array_inv!16173 (array!42442) Bool)

(assert (=> start!67138 (array_inv!16173 a!3186)))

(declare-fun b!774252 () Bool)

(assert (=> b!774252 (= e!431052 e!431053)))

(declare-fun res!523499 () Bool)

(assert (=> b!774252 (=> (not res!523499) (not e!431053))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774252 (= res!523499 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20314 a!3186) j!159) mask!3328) (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344781))))

(assert (=> b!774252 (= lt!344781 (Intermediate!7870 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!774267 () Bool)

(assert (=> b!774267 (= e!431045 e!431044)))

(declare-fun res!523497 () Bool)

(assert (=> b!774267 (=> res!523497 e!431044)))

(assert (=> b!774267 (= res!523497 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344783 #b00000000000000000000000000000000) (bvsge lt!344783 (size!20734 a!3186))))))

(declare-fun lt!344785 () Unit!26671)

(assert (=> b!774267 (= lt!344785 e!431051)))

(declare-fun c!85787 () Bool)

(assert (=> b!774267 (= c!85787 lt!344784)))

(assert (=> b!774267 (= lt!344784 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!774267 (= lt!344783 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!774268 () Bool)

(assert (=> b!774268 (= e!431050 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344783 resIntermediateIndex!5 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344776))))

(declare-fun b!774269 () Bool)

(declare-fun res!523491 () Bool)

(assert (=> b!774269 (=> (not res!523491) (not e!431052))))

(assert (=> b!774269 (= res!523491 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20734 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20734 a!3186))))))

(declare-fun b!774270 () Bool)

(declare-fun res!523488 () Bool)

(assert (=> b!774270 (=> (not res!523488) (not e!431052))))

(declare-datatypes ((List!14223 0))(
  ( (Nil!14220) (Cons!14219 (h!15330 (_ BitVec 64)) (t!20530 List!14223)) )
))
(declare-fun arrayNoDuplicates!0 (array!42442 (_ BitVec 32) List!14223) Bool)

(assert (=> b!774270 (= res!523488 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14220))))

(declare-fun b!774271 () Bool)

(assert (=> b!774271 (= e!431053 e!431042)))

(declare-fun res!523485 () Bool)

(assert (=> b!774271 (=> (not res!523485) (not e!431042))))

(declare-fun lt!344773 () SeekEntryResult!7870)

(assert (=> b!774271 (= res!523485 (= lt!344773 lt!344780))))

(declare-fun lt!344779 () (_ BitVec 64))

(declare-fun lt!344777 () array!42442)

(assert (=> b!774271 (= lt!344780 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344779 lt!344777 mask!3328))))

(assert (=> b!774271 (= lt!344773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344779 mask!3328) lt!344779 lt!344777 mask!3328))))

(assert (=> b!774271 (= lt!344779 (select (store (arr!20314 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!774271 (= lt!344777 (array!42443 (store (arr!20314 a!3186) i!1173 k0!2102) (size!20734 a!3186)))))

(declare-fun b!774272 () Bool)

(declare-fun res!523487 () Bool)

(assert (=> b!774272 (=> (not res!523487) (not e!431053))))

(assert (=> b!774272 (= res!523487 e!431047)))

(declare-fun c!85785 () Bool)

(assert (=> b!774272 (= c!85785 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!774273 () Bool)

(declare-fun Unit!26674 () Unit!26671)

(assert (=> b!774273 (= e!431051 Unit!26674)))

(assert (=> b!774273 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344783 (select (arr!20314 a!3186) j!159) a!3186 mask!3328) lt!344781)))

(assert (= (and start!67138 res!523494) b!774251))

(assert (= (and b!774251 res!523498) b!774258))

(assert (= (and b!774258 res!523490) b!774261))

(assert (= (and b!774261 res!523496) b!774253))

(assert (= (and b!774253 res!523486) b!774260))

(assert (= (and b!774260 res!523492) b!774257))

(assert (= (and b!774257 res!523500) b!774270))

(assert (= (and b!774270 res!523488) b!774269))

(assert (= (and b!774269 res!523491) b!774252))

(assert (= (and b!774252 res!523499) b!774255))

(assert (= (and b!774255 res!523489) b!774272))

(assert (= (and b!774272 c!85785) b!774256))

(assert (= (and b!774272 (not c!85785)) b!774266))

(assert (= (and b!774272 res!523487) b!774271))

(assert (= (and b!774271 res!523485) b!774259))

(assert (= (and b!774259 res!523495) b!774262))

(assert (= (and b!774262 res!523493) b!774264))

(assert (= (and b!774259 (not res!523484)) b!774267))

(assert (= (and b!774267 c!85787) b!774273))

(assert (= (and b!774267 (not c!85787)) b!774265))

(assert (= (and b!774267 (not res!523497)) b!774263))

(assert (= (and b!774263 c!85786) b!774254))

(assert (= (and b!774263 (not c!85786)) b!774268))

(declare-fun m!719363 () Bool)

(assert (=> b!774252 m!719363))

(assert (=> b!774252 m!719363))

(declare-fun m!719365 () Bool)

(assert (=> b!774252 m!719365))

(assert (=> b!774252 m!719365))

(assert (=> b!774252 m!719363))

(declare-fun m!719367 () Bool)

(assert (=> b!774252 m!719367))

(declare-fun m!719369 () Bool)

(assert (=> b!774267 m!719369))

(declare-fun m!719371 () Bool)

(assert (=> b!774255 m!719371))

(declare-fun m!719373 () Bool)

(assert (=> b!774257 m!719373))

(declare-fun m!719375 () Bool)

(assert (=> b!774253 m!719375))

(assert (=> b!774258 m!719363))

(assert (=> b!774258 m!719363))

(declare-fun m!719377 () Bool)

(assert (=> b!774258 m!719377))

(declare-fun m!719379 () Bool)

(assert (=> b!774270 m!719379))

(declare-fun m!719381 () Bool)

(assert (=> start!67138 m!719381))

(declare-fun m!719383 () Bool)

(assert (=> start!67138 m!719383))

(declare-fun m!719385 () Bool)

(assert (=> b!774271 m!719385))

(declare-fun m!719387 () Bool)

(assert (=> b!774271 m!719387))

(declare-fun m!719389 () Bool)

(assert (=> b!774271 m!719389))

(declare-fun m!719391 () Bool)

(assert (=> b!774271 m!719391))

(assert (=> b!774271 m!719385))

(declare-fun m!719393 () Bool)

(assert (=> b!774271 m!719393))

(assert (=> b!774265 m!719363))

(assert (=> b!774265 m!719363))

(declare-fun m!719395 () Bool)

(assert (=> b!774265 m!719395))

(assert (=> b!774265 m!719363))

(declare-fun m!719397 () Bool)

(assert (=> b!774265 m!719397))

(assert (=> b!774254 m!719363))

(assert (=> b!774254 m!719363))

(declare-fun m!719399 () Bool)

(assert (=> b!774254 m!719399))

(assert (=> b!774262 m!719363))

(assert (=> b!774262 m!719363))

(declare-fun m!719401 () Bool)

(assert (=> b!774262 m!719401))

(assert (=> b!774266 m!719363))

(assert (=> b!774266 m!719363))

(assert (=> b!774266 m!719395))

(assert (=> b!774273 m!719363))

(assert (=> b!774273 m!719363))

(assert (=> b!774273 m!719399))

(assert (=> b!774264 m!719363))

(assert (=> b!774264 m!719363))

(declare-fun m!719403 () Bool)

(assert (=> b!774264 m!719403))

(assert (=> b!774256 m!719363))

(assert (=> b!774256 m!719363))

(declare-fun m!719405 () Bool)

(assert (=> b!774256 m!719405))

(declare-fun m!719407 () Bool)

(assert (=> b!774261 m!719407))

(declare-fun m!719409 () Bool)

(assert (=> b!774259 m!719409))

(declare-fun m!719411 () Bool)

(assert (=> b!774259 m!719411))

(declare-fun m!719413 () Bool)

(assert (=> b!774260 m!719413))

(assert (=> b!774268 m!719363))

(assert (=> b!774268 m!719363))

(assert (=> b!774268 m!719397))

(check-sat (not start!67138) (not b!774258) (not b!774266) (not b!774268) (not b!774256) (not b!774257) (not b!774253) (not b!774267) (not b!774265) (not b!774252) (not b!774270) (not b!774273) (not b!774254) (not b!774264) (not b!774262) (not b!774261) (not b!774260) (not b!774271) (not b!774259))
(check-sat)
