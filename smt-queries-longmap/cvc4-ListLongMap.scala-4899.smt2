; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67576 () Bool)

(assert start!67576)

(declare-fun b!782455 () Bool)

(declare-fun res!529465 () Bool)

(declare-fun e!435084 () Bool)

(assert (=> b!782455 (=> (not res!529465) (not e!435084))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782455 (= res!529465 (validKeyInArray!0 k!2102))))

(declare-fun res!529468 () Bool)

(assert (=> start!67576 (=> (not res!529468) (not e!435084))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67576 (= res!529468 (validMask!0 mask!3328))))

(assert (=> start!67576 e!435084))

(assert (=> start!67576 true))

(declare-datatypes ((array!42679 0))(
  ( (array!42680 (arr!20429 (Array (_ BitVec 32) (_ BitVec 64))) (size!20850 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42679)

(declare-fun array_inv!16225 (array!42679) Bool)

(assert (=> start!67576 (array_inv!16225 a!3186)))

(declare-fun b!782456 () Bool)

(declare-fun res!529459 () Bool)

(assert (=> b!782456 (=> (not res!529459) (not e!435084))))

(declare-fun arrayContainsKey!0 (array!42679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782456 (= res!529459 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782457 () Bool)

(declare-datatypes ((Unit!27004 0))(
  ( (Unit!27005) )
))
(declare-fun e!435085 () Unit!27004)

(declare-fun Unit!27006 () Unit!27004)

(assert (=> b!782457 (= e!435085 Unit!27006)))

(assert (=> b!782457 false))

(declare-fun b!782458 () Bool)

(declare-fun res!529455 () Bool)

(declare-fun e!435081 () Bool)

(assert (=> b!782458 (=> res!529455 e!435081)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8029 0))(
  ( (MissingZero!8029 (index!34484 (_ BitVec 32))) (Found!8029 (index!34485 (_ BitVec 32))) (Intermediate!8029 (undefined!8841 Bool) (index!34486 (_ BitVec 32)) (x!65432 (_ BitVec 32))) (Undefined!8029) (MissingVacant!8029 (index!34487 (_ BitVec 32))) )
))
(declare-fun lt!348710 () SeekEntryResult!8029)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!782458 (= res!529455 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348710)))))

(declare-fun b!782459 () Bool)

(declare-fun e!435083 () Bool)

(declare-fun e!435080 () Bool)

(assert (=> b!782459 (= e!435083 e!435080)))

(declare-fun res!529463 () Bool)

(assert (=> b!782459 (=> (not res!529463) (not e!435080))))

(declare-fun lt!348719 () SeekEntryResult!8029)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!8029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782459 (= res!529463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20429 a!3186) j!159) mask!3328) (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348719))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782459 (= lt!348719 (Intermediate!8029 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782460 () Bool)

(assert (=> b!782460 (= e!435081 true)))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!782460 (= (select (store (arr!20429 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348714 () Unit!27004)

(assert (=> b!782460 (= lt!348714 e!435085)))

(declare-fun c!86908 () Bool)

(assert (=> b!782460 (= c!86908 (= (select (store (arr!20429 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782461 () Bool)

(declare-fun e!435082 () Bool)

(assert (=> b!782461 (= e!435082 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) (Found!8029 j!159)))))

(declare-fun b!782462 () Bool)

(declare-fun res!529466 () Bool)

(assert (=> b!782462 (=> (not res!529466) (not e!435083))))

(assert (=> b!782462 (= res!529466 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20850 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20850 a!3186))))))

(declare-fun b!782463 () Bool)

(declare-fun res!529458 () Bool)

(assert (=> b!782463 (=> res!529458 e!435081)))

(declare-fun lt!348718 () (_ BitVec 64))

(assert (=> b!782463 (= res!529458 (= (select (store (arr!20429 a!3186) i!1173 k!2102) index!1321) lt!348718))))

(declare-fun b!782464 () Bool)

(assert (=> b!782464 (= e!435084 e!435083)))

(declare-fun res!529457 () Bool)

(assert (=> b!782464 (=> (not res!529457) (not e!435083))))

(declare-fun lt!348713 () SeekEntryResult!8029)

(assert (=> b!782464 (= res!529457 (or (= lt!348713 (MissingZero!8029 i!1173)) (= lt!348713 (MissingVacant!8029 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42679 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!782464 (= lt!348713 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!782465 () Bool)

(declare-fun res!529456 () Bool)

(assert (=> b!782465 (=> (not res!529456) (not e!435083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42679 (_ BitVec 32)) Bool)

(assert (=> b!782465 (= res!529456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782466 () Bool)

(declare-fun res!529454 () Bool)

(assert (=> b!782466 (=> (not res!529454) (not e!435084))))

(assert (=> b!782466 (= res!529454 (and (= (size!20850 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20850 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20850 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782467 () Bool)

(declare-fun Unit!27007 () Unit!27004)

(assert (=> b!782467 (= e!435085 Unit!27007)))

(declare-fun b!782468 () Bool)

(assert (=> b!782468 (= e!435082 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348719))))

(declare-fun b!782469 () Bool)

(declare-fun res!529469 () Bool)

(assert (=> b!782469 (=> (not res!529469) (not e!435083))))

(declare-datatypes ((List!14431 0))(
  ( (Nil!14428) (Cons!14427 (h!15547 (_ BitVec 64)) (t!20746 List!14431)) )
))
(declare-fun arrayNoDuplicates!0 (array!42679 (_ BitVec 32) List!14431) Bool)

(assert (=> b!782469 (= res!529469 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14428))))

(declare-fun b!782470 () Bool)

(declare-fun e!435078 () Bool)

(assert (=> b!782470 (= e!435078 (not e!435081))))

(declare-fun res!529467 () Bool)

(assert (=> b!782470 (=> res!529467 e!435081)))

(declare-fun lt!348711 () SeekEntryResult!8029)

(assert (=> b!782470 (= res!529467 (or (not (is-Intermediate!8029 lt!348711)) (bvslt x!1131 (x!65432 lt!348711)) (not (= x!1131 (x!65432 lt!348711))) (not (= index!1321 (index!34486 lt!348711)))))))

(declare-fun e!435079 () Bool)

(assert (=> b!782470 e!435079))

(declare-fun res!529460 () Bool)

(assert (=> b!782470 (=> (not res!529460) (not e!435079))))

(declare-fun lt!348712 () SeekEntryResult!8029)

(assert (=> b!782470 (= res!529460 (= lt!348712 lt!348710))))

(assert (=> b!782470 (= lt!348710 (Found!8029 j!159))))

(assert (=> b!782470 (= lt!348712 (seekEntryOrOpen!0 (select (arr!20429 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782470 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348716 () Unit!27004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42679 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27004)

(assert (=> b!782470 (= lt!348716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782471 () Bool)

(assert (=> b!782471 (= e!435080 e!435078)))

(declare-fun res!529464 () Bool)

(assert (=> b!782471 (=> (not res!529464) (not e!435078))))

(declare-fun lt!348717 () SeekEntryResult!8029)

(assert (=> b!782471 (= res!529464 (= lt!348717 lt!348711))))

(declare-fun lt!348715 () array!42679)

(assert (=> b!782471 (= lt!348711 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348718 lt!348715 mask!3328))))

(assert (=> b!782471 (= lt!348717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348718 mask!3328) lt!348718 lt!348715 mask!3328))))

(assert (=> b!782471 (= lt!348718 (select (store (arr!20429 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782471 (= lt!348715 (array!42680 (store (arr!20429 a!3186) i!1173 k!2102) (size!20850 a!3186)))))

(declare-fun b!782472 () Bool)

(declare-fun res!529453 () Bool)

(assert (=> b!782472 (=> (not res!529453) (not e!435080))))

(assert (=> b!782472 (= res!529453 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20429 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782473 () Bool)

(declare-fun res!529461 () Bool)

(assert (=> b!782473 (=> (not res!529461) (not e!435084))))

(assert (=> b!782473 (= res!529461 (validKeyInArray!0 (select (arr!20429 a!3186) j!159)))))

(declare-fun b!782474 () Bool)

(declare-fun res!529462 () Bool)

(assert (=> b!782474 (=> (not res!529462) (not e!435080))))

(assert (=> b!782474 (= res!529462 e!435082)))

(declare-fun c!86907 () Bool)

(assert (=> b!782474 (= c!86907 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782475 () Bool)

(assert (=> b!782475 (= e!435079 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20429 a!3186) j!159) a!3186 mask!3328) lt!348710))))

(assert (= (and start!67576 res!529468) b!782466))

(assert (= (and b!782466 res!529454) b!782473))

(assert (= (and b!782473 res!529461) b!782455))

(assert (= (and b!782455 res!529465) b!782456))

(assert (= (and b!782456 res!529459) b!782464))

(assert (= (and b!782464 res!529457) b!782465))

(assert (= (and b!782465 res!529456) b!782469))

(assert (= (and b!782469 res!529469) b!782462))

(assert (= (and b!782462 res!529466) b!782459))

(assert (= (and b!782459 res!529463) b!782472))

(assert (= (and b!782472 res!529453) b!782474))

(assert (= (and b!782474 c!86907) b!782468))

(assert (= (and b!782474 (not c!86907)) b!782461))

(assert (= (and b!782474 res!529462) b!782471))

(assert (= (and b!782471 res!529464) b!782470))

(assert (= (and b!782470 res!529460) b!782475))

(assert (= (and b!782470 (not res!529467)) b!782458))

(assert (= (and b!782458 (not res!529455)) b!782463))

(assert (= (and b!782463 (not res!529458)) b!782460))

(assert (= (and b!782460 c!86908) b!782457))

(assert (= (and b!782460 (not c!86908)) b!782467))

(declare-fun m!725243 () Bool)

(assert (=> b!782459 m!725243))

(assert (=> b!782459 m!725243))

(declare-fun m!725245 () Bool)

(assert (=> b!782459 m!725245))

(assert (=> b!782459 m!725245))

(assert (=> b!782459 m!725243))

(declare-fun m!725247 () Bool)

(assert (=> b!782459 m!725247))

(assert (=> b!782461 m!725243))

(assert (=> b!782461 m!725243))

(declare-fun m!725249 () Bool)

(assert (=> b!782461 m!725249))

(declare-fun m!725251 () Bool)

(assert (=> b!782460 m!725251))

(declare-fun m!725253 () Bool)

(assert (=> b!782460 m!725253))

(declare-fun m!725255 () Bool)

(assert (=> b!782455 m!725255))

(assert (=> b!782470 m!725243))

(assert (=> b!782470 m!725243))

(declare-fun m!725257 () Bool)

(assert (=> b!782470 m!725257))

(declare-fun m!725259 () Bool)

(assert (=> b!782470 m!725259))

(declare-fun m!725261 () Bool)

(assert (=> b!782470 m!725261))

(assert (=> b!782473 m!725243))

(assert (=> b!782473 m!725243))

(declare-fun m!725263 () Bool)

(assert (=> b!782473 m!725263))

(declare-fun m!725265 () Bool)

(assert (=> b!782465 m!725265))

(assert (=> b!782475 m!725243))

(assert (=> b!782475 m!725243))

(declare-fun m!725267 () Bool)

(assert (=> b!782475 m!725267))

(declare-fun m!725269 () Bool)

(assert (=> b!782456 m!725269))

(assert (=> b!782468 m!725243))

(assert (=> b!782468 m!725243))

(declare-fun m!725271 () Bool)

(assert (=> b!782468 m!725271))

(declare-fun m!725273 () Bool)

(assert (=> b!782471 m!725273))

(assert (=> b!782471 m!725251))

(declare-fun m!725275 () Bool)

(assert (=> b!782471 m!725275))

(declare-fun m!725277 () Bool)

(assert (=> b!782471 m!725277))

(assert (=> b!782471 m!725273))

(declare-fun m!725279 () Bool)

(assert (=> b!782471 m!725279))

(declare-fun m!725281 () Bool)

(assert (=> b!782464 m!725281))

(declare-fun m!725283 () Bool)

(assert (=> b!782472 m!725283))

(assert (=> b!782463 m!725251))

(assert (=> b!782463 m!725253))

(assert (=> b!782458 m!725243))

(assert (=> b!782458 m!725243))

(assert (=> b!782458 m!725249))

(declare-fun m!725285 () Bool)

(assert (=> start!67576 m!725285))

(declare-fun m!725287 () Bool)

(assert (=> start!67576 m!725287))

(declare-fun m!725289 () Bool)

(assert (=> b!782469 m!725289))

(push 1)

