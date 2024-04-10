; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65816 () Bool)

(assert start!65816)

(declare-fun b!757565 () Bool)

(declare-fun res!512374 () Bool)

(declare-fun e!422382 () Bool)

(assert (=> b!757565 (=> (not res!512374) (not e!422382))))

(declare-datatypes ((array!41989 0))(
  ( (array!41990 (arr!20108 (Array (_ BitVec 32) (_ BitVec 64))) (size!20529 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41989)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!757565 (= res!512374 (and (= (size!20529 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20529 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20529 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7708 0))(
  ( (MissingZero!7708 (index!33200 (_ BitVec 32))) (Found!7708 (index!33201 (_ BitVec 32))) (Intermediate!7708 (undefined!8520 Bool) (index!33202 (_ BitVec 32)) (x!64090 (_ BitVec 32))) (Undefined!7708) (MissingVacant!7708 (index!33203 (_ BitVec 32))) )
))
(declare-fun lt!337385 () SeekEntryResult!7708)

(declare-fun b!757566 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!422393 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7708)

(assert (=> b!757566 (= e!422393 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337385))))

(declare-fun b!757567 () Bool)

(declare-fun res!512381 () Bool)

(declare-fun e!422392 () Bool)

(assert (=> b!757567 (=> (not res!512381) (not e!422392))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757567 (= res!512381 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20529 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20529 a!3186))))))

(declare-fun res!512373 () Bool)

(assert (=> start!65816 (=> (not res!512373) (not e!422382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65816 (= res!512373 (validMask!0 mask!3328))))

(assert (=> start!65816 e!422382))

(assert (=> start!65816 true))

(declare-fun array_inv!15904 (array!41989) Bool)

(assert (=> start!65816 (array_inv!15904 a!3186)))

(declare-fun b!757568 () Bool)

(declare-fun res!512379 () Bool)

(assert (=> b!757568 (=> (not res!512379) (not e!422382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757568 (= res!512379 (validKeyInArray!0 (select (arr!20108 a!3186) j!159)))))

(declare-fun b!757569 () Bool)

(declare-fun res!512388 () Bool)

(declare-fun e!422383 () Bool)

(assert (=> b!757569 (=> (not res!512388) (not e!422383))))

(declare-fun lt!337374 () (_ BitVec 64))

(declare-fun lt!337380 () array!41989)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7708)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7708)

(assert (=> b!757569 (= res!512388 (= (seekEntryOrOpen!0 lt!337374 lt!337380 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337374 lt!337380 mask!3328)))))

(declare-fun b!757570 () Bool)

(declare-fun lt!337382 () SeekEntryResult!7708)

(declare-fun e!422387 () Bool)

(assert (=> b!757570 (= e!422387 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337382))))

(declare-fun b!757571 () Bool)

(declare-fun e!422384 () Bool)

(assert (=> b!757571 (= e!422392 e!422384)))

(declare-fun res!512385 () Bool)

(assert (=> b!757571 (=> (not res!512385) (not e!422384))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757571 (= res!512385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20108 a!3186) j!159) mask!3328) (select (arr!20108 a!3186) j!159) a!3186 mask!3328) lt!337385))))

(assert (=> b!757571 (= lt!337385 (Intermediate!7708 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757572 () Bool)

(declare-fun res!512380 () Bool)

(assert (=> b!757572 (=> (not res!512380) (not e!422392))))

(declare-datatypes ((List!14110 0))(
  ( (Nil!14107) (Cons!14106 (h!15178 (_ BitVec 64)) (t!20425 List!14110)) )
))
(declare-fun arrayNoDuplicates!0 (array!41989 (_ BitVec 32) List!14110) Bool)

(assert (=> b!757572 (= res!512380 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14107))))

(declare-fun b!757573 () Bool)

(declare-fun res!512386 () Bool)

(assert (=> b!757573 (=> (not res!512386) (not e!422384))))

(assert (=> b!757573 (= res!512386 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20108 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757574 () Bool)

(declare-fun res!512384 () Bool)

(assert (=> b!757574 (=> (not res!512384) (not e!422382))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757574 (= res!512384 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757575 () Bool)

(declare-fun res!512375 () Bool)

(assert (=> b!757575 (=> (not res!512375) (not e!422392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41989 (_ BitVec 32)) Bool)

(assert (=> b!757575 (= res!512375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757576 () Bool)

(declare-fun e!422388 () Bool)

(assert (=> b!757576 (= e!422384 e!422388)))

(declare-fun res!512378 () Bool)

(assert (=> b!757576 (=> (not res!512378) (not e!422388))))

(declare-fun lt!337384 () SeekEntryResult!7708)

(declare-fun lt!337376 () SeekEntryResult!7708)

(assert (=> b!757576 (= res!512378 (= lt!337384 lt!337376))))

(assert (=> b!757576 (= lt!337376 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337374 lt!337380 mask!3328))))

(assert (=> b!757576 (= lt!337384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337374 mask!3328) lt!337374 lt!337380 mask!3328))))

(assert (=> b!757576 (= lt!337374 (select (store (arr!20108 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757576 (= lt!337380 (array!41990 (store (arr!20108 a!3186) i!1173 k!2102) (size!20529 a!3186)))))

(declare-fun b!757577 () Bool)

(assert (=> b!757577 (= e!422382 e!422392)))

(declare-fun res!512376 () Bool)

(assert (=> b!757577 (=> (not res!512376) (not e!422392))))

(declare-fun lt!337379 () SeekEntryResult!7708)

(assert (=> b!757577 (= res!512376 (or (= lt!337379 (MissingZero!7708 i!1173)) (= lt!337379 (MissingVacant!7708 i!1173))))))

(assert (=> b!757577 (= lt!337379 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757578 () Bool)

(declare-datatypes ((Unit!26212 0))(
  ( (Unit!26213) )
))
(declare-fun e!422389 () Unit!26212)

(declare-fun Unit!26214 () Unit!26212)

(assert (=> b!757578 (= e!422389 Unit!26214)))

(assert (=> b!757578 false))

(declare-fun b!757579 () Bool)

(declare-fun e!422385 () Bool)

(assert (=> b!757579 (= e!422388 (not e!422385))))

(declare-fun res!512390 () Bool)

(assert (=> b!757579 (=> res!512390 e!422385)))

(assert (=> b!757579 (= res!512390 (or (not (is-Intermediate!7708 lt!337376)) (bvslt x!1131 (x!64090 lt!337376)) (not (= x!1131 (x!64090 lt!337376))) (not (= index!1321 (index!33202 lt!337376)))))))

(assert (=> b!757579 e!422387))

(declare-fun res!512377 () Bool)

(assert (=> b!757579 (=> (not res!512377) (not e!422387))))

(declare-fun lt!337383 () SeekEntryResult!7708)

(assert (=> b!757579 (= res!512377 (= lt!337383 lt!337382))))

(assert (=> b!757579 (= lt!337382 (Found!7708 j!159))))

(assert (=> b!757579 (= lt!337383 (seekEntryOrOpen!0 (select (arr!20108 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757579 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337381 () Unit!26212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26212)

(assert (=> b!757579 (= lt!337381 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757580 () Bool)

(declare-fun e!422386 () Bool)

(assert (=> b!757580 (= e!422385 e!422386)))

(declare-fun res!512372 () Bool)

(assert (=> b!757580 (=> res!512372 e!422386)))

(declare-fun lt!337377 () SeekEntryResult!7708)

(assert (=> b!757580 (= res!512372 (not (= lt!337377 lt!337382)))))

(assert (=> b!757580 (= lt!337377 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757581 () Bool)

(declare-fun Unit!26215 () Unit!26212)

(assert (=> b!757581 (= e!422389 Unit!26215)))

(declare-fun b!757582 () Bool)

(assert (=> b!757582 (= e!422383 (= lt!337383 lt!337377))))

(declare-fun b!757583 () Bool)

(declare-fun e!422390 () Bool)

(assert (=> b!757583 (= e!422386 e!422390)))

(declare-fun res!512382 () Bool)

(assert (=> b!757583 (=> res!512382 e!422390)))

(declare-fun lt!337378 () (_ BitVec 64))

(assert (=> b!757583 (= res!512382 (= lt!337378 lt!337374))))

(assert (=> b!757583 (= lt!337378 (select (store (arr!20108 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757584 () Bool)

(declare-fun res!512387 () Bool)

(assert (=> b!757584 (=> (not res!512387) (not e!422382))))

(assert (=> b!757584 (= res!512387 (validKeyInArray!0 k!2102))))

(declare-fun b!757585 () Bool)

(assert (=> b!757585 (= e!422390 true)))

(assert (=> b!757585 e!422383))

(declare-fun res!512383 () Bool)

(assert (=> b!757585 (=> (not res!512383) (not e!422383))))

(assert (=> b!757585 (= res!512383 (= lt!337378 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337375 () Unit!26212)

(assert (=> b!757585 (= lt!337375 e!422389)))

(declare-fun c!82977 () Bool)

(assert (=> b!757585 (= c!82977 (= lt!337378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757586 () Bool)

(assert (=> b!757586 (= e!422393 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20108 a!3186) j!159) a!3186 mask!3328) (Found!7708 j!159)))))

(declare-fun b!757587 () Bool)

(declare-fun res!512389 () Bool)

(assert (=> b!757587 (=> (not res!512389) (not e!422384))))

(assert (=> b!757587 (= res!512389 e!422393)))

(declare-fun c!82978 () Bool)

(assert (=> b!757587 (= c!82978 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65816 res!512373) b!757565))

(assert (= (and b!757565 res!512374) b!757568))

(assert (= (and b!757568 res!512379) b!757584))

(assert (= (and b!757584 res!512387) b!757574))

(assert (= (and b!757574 res!512384) b!757577))

(assert (= (and b!757577 res!512376) b!757575))

(assert (= (and b!757575 res!512375) b!757572))

(assert (= (and b!757572 res!512380) b!757567))

(assert (= (and b!757567 res!512381) b!757571))

(assert (= (and b!757571 res!512385) b!757573))

(assert (= (and b!757573 res!512386) b!757587))

(assert (= (and b!757587 c!82978) b!757566))

(assert (= (and b!757587 (not c!82978)) b!757586))

(assert (= (and b!757587 res!512389) b!757576))

(assert (= (and b!757576 res!512378) b!757579))

(assert (= (and b!757579 res!512377) b!757570))

(assert (= (and b!757579 (not res!512390)) b!757580))

(assert (= (and b!757580 (not res!512372)) b!757583))

(assert (= (and b!757583 (not res!512382)) b!757585))

(assert (= (and b!757585 c!82977) b!757578))

(assert (= (and b!757585 (not c!82977)) b!757581))

(assert (= (and b!757585 res!512383) b!757569))

(assert (= (and b!757569 res!512388) b!757582))

(declare-fun m!705243 () Bool)

(assert (=> b!757584 m!705243))

(declare-fun m!705245 () Bool)

(assert (=> b!757572 m!705245))

(declare-fun m!705247 () Bool)

(assert (=> b!757569 m!705247))

(declare-fun m!705249 () Bool)

(assert (=> b!757569 m!705249))

(declare-fun m!705251 () Bool)

(assert (=> b!757575 m!705251))

(declare-fun m!705253 () Bool)

(assert (=> b!757571 m!705253))

(assert (=> b!757571 m!705253))

(declare-fun m!705255 () Bool)

(assert (=> b!757571 m!705255))

(assert (=> b!757571 m!705255))

(assert (=> b!757571 m!705253))

(declare-fun m!705257 () Bool)

(assert (=> b!757571 m!705257))

(assert (=> b!757568 m!705253))

(assert (=> b!757568 m!705253))

(declare-fun m!705259 () Bool)

(assert (=> b!757568 m!705259))

(assert (=> b!757579 m!705253))

(assert (=> b!757579 m!705253))

(declare-fun m!705261 () Bool)

(assert (=> b!757579 m!705261))

(declare-fun m!705263 () Bool)

(assert (=> b!757579 m!705263))

(declare-fun m!705265 () Bool)

(assert (=> b!757579 m!705265))

(declare-fun m!705267 () Bool)

(assert (=> b!757574 m!705267))

(assert (=> b!757580 m!705253))

(assert (=> b!757580 m!705253))

(declare-fun m!705269 () Bool)

(assert (=> b!757580 m!705269))

(declare-fun m!705271 () Bool)

(assert (=> start!65816 m!705271))

(declare-fun m!705273 () Bool)

(assert (=> start!65816 m!705273))

(assert (=> b!757566 m!705253))

(assert (=> b!757566 m!705253))

(declare-fun m!705275 () Bool)

(assert (=> b!757566 m!705275))

(declare-fun m!705277 () Bool)

(assert (=> b!757577 m!705277))

(assert (=> b!757586 m!705253))

(assert (=> b!757586 m!705253))

(assert (=> b!757586 m!705269))

(declare-fun m!705279 () Bool)

(assert (=> b!757583 m!705279))

(declare-fun m!705281 () Bool)

(assert (=> b!757583 m!705281))

(assert (=> b!757570 m!705253))

(assert (=> b!757570 m!705253))

(declare-fun m!705283 () Bool)

(assert (=> b!757570 m!705283))

(declare-fun m!705285 () Bool)

(assert (=> b!757576 m!705285))

(declare-fun m!705287 () Bool)

(assert (=> b!757576 m!705287))

(assert (=> b!757576 m!705285))

(assert (=> b!757576 m!705279))

(declare-fun m!705289 () Bool)

(assert (=> b!757576 m!705289))

(declare-fun m!705291 () Bool)

(assert (=> b!757576 m!705291))

(declare-fun m!705293 () Bool)

(assert (=> b!757573 m!705293))

(push 1)

(assert (not b!757572))

(assert (not b!757584))

(assert (not b!757570))

(assert (not start!65816))

(assert (not b!757571))

(assert (not b!757574))

(assert (not b!757577))

(assert (not b!757566))

(assert (not b!757568))

(assert (not b!757576))

(assert (not b!757579))

(assert (not b!757580))

(assert (not b!757575))

