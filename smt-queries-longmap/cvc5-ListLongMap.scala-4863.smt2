; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67020 () Bool)

(assert start!67020)

(declare-fun b!773606 () Bool)

(declare-datatypes ((Unit!26690 0))(
  ( (Unit!26691) )
))
(declare-fun e!430631 () Unit!26690)

(declare-fun Unit!26692 () Unit!26690)

(assert (=> b!773606 (= e!430631 Unit!26692)))

(declare-datatypes ((array!42444 0))(
  ( (array!42445 (arr!20319 (Array (_ BitVec 32) (_ BitVec 64))) (size!20740 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42444)

(declare-fun lt!344506 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7919 0))(
  ( (MissingZero!7919 (index!34044 (_ BitVec 32))) (Found!7919 (index!34045 (_ BitVec 32))) (Intermediate!7919 (undefined!8731 Bool) (index!34046 (_ BitVec 32)) (x!64986 (_ BitVec 32))) (Undefined!7919) (MissingVacant!7919 (index!34047 (_ BitVec 32))) )
))
(declare-fun lt!344510 () SeekEntryResult!7919)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42444 (_ BitVec 32)) SeekEntryResult!7919)

(assert (=> b!773606 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344506 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344510)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!773607 () Bool)

(declare-fun lt!344503 () SeekEntryResult!7919)

(declare-fun e!430635 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42444 (_ BitVec 32)) SeekEntryResult!7919)

(assert (=> b!773607 (= e!430635 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344506 resIntermediateIndex!5 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344503))))

(declare-fun b!773608 () Bool)

(declare-fun res!523225 () Bool)

(declare-fun e!430628 () Bool)

(assert (=> b!773608 (=> (not res!523225) (not e!430628))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773608 (= res!523225 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20319 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773609 () Bool)

(declare-fun res!523223 () Bool)

(declare-fun e!430627 () Bool)

(assert (=> b!773609 (=> (not res!523223) (not e!430627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773609 (= res!523223 (validKeyInArray!0 (select (arr!20319 a!3186) j!159)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!430634 () Bool)

(declare-fun b!773610 () Bool)

(assert (=> b!773610 (= e!430634 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344510))))

(declare-fun b!773611 () Bool)

(declare-fun e!430630 () Bool)

(assert (=> b!773611 (= e!430630 e!430628)))

(declare-fun res!523229 () Bool)

(assert (=> b!773611 (=> (not res!523229) (not e!430628))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773611 (= res!523229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20319 a!3186) j!159) mask!3328) (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344510))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773611 (= lt!344510 (Intermediate!7919 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773612 () Bool)

(assert (=> b!773612 (= e!430627 e!430630)))

(declare-fun res!523220 () Bool)

(assert (=> b!773612 (=> (not res!523220) (not e!430630))))

(declare-fun lt!344513 () SeekEntryResult!7919)

(assert (=> b!773612 (= res!523220 (or (= lt!344513 (MissingZero!7919 i!1173)) (= lt!344513 (MissingVacant!7919 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42444 (_ BitVec 32)) SeekEntryResult!7919)

(assert (=> b!773612 (= lt!344513 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773613 () Bool)

(declare-fun res!523216 () Bool)

(assert (=> b!773613 (=> (not res!523216) (not e!430627))))

(assert (=> b!773613 (= res!523216 (and (= (size!20740 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20740 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20740 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773614 () Bool)

(declare-fun e!430629 () Bool)

(assert (=> b!773614 (= e!430628 e!430629)))

(declare-fun res!523215 () Bool)

(assert (=> b!773614 (=> (not res!523215) (not e!430629))))

(declare-fun lt!344509 () SeekEntryResult!7919)

(declare-fun lt!344507 () SeekEntryResult!7919)

(assert (=> b!773614 (= res!523215 (= lt!344509 lt!344507))))

(declare-fun lt!344501 () array!42444)

(declare-fun lt!344508 () (_ BitVec 64))

(assert (=> b!773614 (= lt!344507 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344508 lt!344501 mask!3328))))

(assert (=> b!773614 (= lt!344509 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344508 mask!3328) lt!344508 lt!344501 mask!3328))))

(assert (=> b!773614 (= lt!344508 (select (store (arr!20319 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773614 (= lt!344501 (array!42445 (store (arr!20319 a!3186) i!1173 k!2102) (size!20740 a!3186)))))

(declare-fun b!773615 () Bool)

(declare-fun res!523214 () Bool)

(assert (=> b!773615 (=> (not res!523214) (not e!430630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42444 (_ BitVec 32)) Bool)

(assert (=> b!773615 (= res!523214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!430633 () Bool)

(declare-fun b!773616 () Bool)

(declare-fun lt!344502 () SeekEntryResult!7919)

(assert (=> b!773616 (= e!430633 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344502))))

(declare-fun b!773618 () Bool)

(assert (=> b!773618 (= e!430634 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) (Found!7919 j!159)))))

(declare-fun b!773619 () Bool)

(assert (=> b!773619 (= e!430635 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344506 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344510))))

(declare-fun b!773620 () Bool)

(declare-fun e!430636 () Bool)

(assert (=> b!773620 (= e!430636 e!430633)))

(declare-fun res!523222 () Bool)

(assert (=> b!773620 (=> (not res!523222) (not e!430633))))

(assert (=> b!773620 (= res!523222 (= (seekEntryOrOpen!0 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344502))))

(assert (=> b!773620 (= lt!344502 (Found!7919 j!159))))

(declare-fun b!773621 () Bool)

(declare-fun Unit!26693 () Unit!26690)

(assert (=> b!773621 (= e!430631 Unit!26693)))

(declare-fun lt!344511 () SeekEntryResult!7919)

(assert (=> b!773621 (= lt!344511 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20319 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773621 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344506 resIntermediateIndex!5 (select (arr!20319 a!3186) j!159) a!3186 mask!3328) lt!344503)))

(declare-fun b!773622 () Bool)

(declare-fun e!430632 () Bool)

(assert (=> b!773622 (= e!430629 (not e!430632))))

(declare-fun res!523228 () Bool)

(assert (=> b!773622 (=> res!523228 e!430632)))

(assert (=> b!773622 (= res!523228 (or (not (is-Intermediate!7919 lt!344507)) (bvsge x!1131 (x!64986 lt!344507))))))

(assert (=> b!773622 (= lt!344503 (Found!7919 j!159))))

(assert (=> b!773622 e!430636))

(declare-fun res!523226 () Bool)

(assert (=> b!773622 (=> (not res!523226) (not e!430636))))

(assert (=> b!773622 (= res!523226 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344505 () Unit!26690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26690)

(assert (=> b!773622 (= lt!344505 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773623 () Bool)

(declare-fun res!523213 () Bool)

(assert (=> b!773623 (=> (not res!523213) (not e!430627))))

(declare-fun arrayContainsKey!0 (array!42444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773623 (= res!523213 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773624 () Bool)

(declare-fun res!523219 () Bool)

(assert (=> b!773624 (=> (not res!523219) (not e!430630))))

(assert (=> b!773624 (= res!523219 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20740 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20740 a!3186))))))

(declare-fun b!773625 () Bool)

(declare-fun res!523224 () Bool)

(assert (=> b!773625 (=> (not res!523224) (not e!430627))))

(assert (=> b!773625 (= res!523224 (validKeyInArray!0 k!2102))))

(declare-fun b!773626 () Bool)

(declare-fun res!523218 () Bool)

(assert (=> b!773626 (=> (not res!523218) (not e!430630))))

(declare-datatypes ((List!14321 0))(
  ( (Nil!14318) (Cons!14317 (h!15422 (_ BitVec 64)) (t!20636 List!14321)) )
))
(declare-fun arrayNoDuplicates!0 (array!42444 (_ BitVec 32) List!14321) Bool)

(assert (=> b!773626 (= res!523218 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14318))))

(declare-fun b!773627 () Bool)

(declare-fun e!430637 () Bool)

(assert (=> b!773627 (= e!430637 e!430635)))

(declare-fun c!85597 () Bool)

(declare-fun lt!344512 () Bool)

(assert (=> b!773627 (= c!85597 lt!344512)))

(declare-fun b!773628 () Bool)

(declare-fun res!523221 () Bool)

(assert (=> b!773628 (=> (not res!523221) (not e!430628))))

(assert (=> b!773628 (= res!523221 e!430634)))

(declare-fun c!85596 () Bool)

(assert (=> b!773628 (= c!85596 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773617 () Bool)

(assert (=> b!773617 (= e!430632 e!430637)))

(declare-fun res!523227 () Bool)

(assert (=> b!773617 (=> res!523227 e!430637)))

(assert (=> b!773617 (= res!523227 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344506 #b00000000000000000000000000000000) (bvsge lt!344506 (size!20740 a!3186))))))

(declare-fun lt!344504 () Unit!26690)

(assert (=> b!773617 (= lt!344504 e!430631)))

(declare-fun c!85595 () Bool)

(assert (=> b!773617 (= c!85595 lt!344512)))

(assert (=> b!773617 (= lt!344512 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773617 (= lt!344506 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!523217 () Bool)

(assert (=> start!67020 (=> (not res!523217) (not e!430627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67020 (= res!523217 (validMask!0 mask!3328))))

(assert (=> start!67020 e!430627))

(assert (=> start!67020 true))

(declare-fun array_inv!16115 (array!42444) Bool)

(assert (=> start!67020 (array_inv!16115 a!3186)))

(assert (= (and start!67020 res!523217) b!773613))

(assert (= (and b!773613 res!523216) b!773609))

(assert (= (and b!773609 res!523223) b!773625))

(assert (= (and b!773625 res!523224) b!773623))

(assert (= (and b!773623 res!523213) b!773612))

(assert (= (and b!773612 res!523220) b!773615))

(assert (= (and b!773615 res!523214) b!773626))

(assert (= (and b!773626 res!523218) b!773624))

(assert (= (and b!773624 res!523219) b!773611))

(assert (= (and b!773611 res!523229) b!773608))

(assert (= (and b!773608 res!523225) b!773628))

(assert (= (and b!773628 c!85596) b!773610))

(assert (= (and b!773628 (not c!85596)) b!773618))

(assert (= (and b!773628 res!523221) b!773614))

(assert (= (and b!773614 res!523215) b!773622))

(assert (= (and b!773622 res!523226) b!773620))

(assert (= (and b!773620 res!523222) b!773616))

(assert (= (and b!773622 (not res!523228)) b!773617))

(assert (= (and b!773617 c!85595) b!773606))

(assert (= (and b!773617 (not c!85595)) b!773621))

(assert (= (and b!773617 (not res!523227)) b!773627))

(assert (= (and b!773627 c!85597) b!773619))

(assert (= (and b!773627 (not c!85597)) b!773607))

(declare-fun m!718307 () Bool)

(assert (=> b!773619 m!718307))

(assert (=> b!773619 m!718307))

(declare-fun m!718309 () Bool)

(assert (=> b!773619 m!718309))

(declare-fun m!718311 () Bool)

(assert (=> b!773614 m!718311))

(declare-fun m!718313 () Bool)

(assert (=> b!773614 m!718313))

(declare-fun m!718315 () Bool)

(assert (=> b!773614 m!718315))

(declare-fun m!718317 () Bool)

(assert (=> b!773614 m!718317))

(assert (=> b!773614 m!718313))

(declare-fun m!718319 () Bool)

(assert (=> b!773614 m!718319))

(declare-fun m!718321 () Bool)

(assert (=> b!773617 m!718321))

(declare-fun m!718323 () Bool)

(assert (=> b!773612 m!718323))

(declare-fun m!718325 () Bool)

(assert (=> b!773625 m!718325))

(assert (=> b!773607 m!718307))

(assert (=> b!773607 m!718307))

(declare-fun m!718327 () Bool)

(assert (=> b!773607 m!718327))

(declare-fun m!718329 () Bool)

(assert (=> b!773622 m!718329))

(declare-fun m!718331 () Bool)

(assert (=> b!773622 m!718331))

(assert (=> b!773616 m!718307))

(assert (=> b!773616 m!718307))

(declare-fun m!718333 () Bool)

(assert (=> b!773616 m!718333))

(declare-fun m!718335 () Bool)

(assert (=> b!773623 m!718335))

(declare-fun m!718337 () Bool)

(assert (=> b!773626 m!718337))

(assert (=> b!773620 m!718307))

(assert (=> b!773620 m!718307))

(declare-fun m!718339 () Bool)

(assert (=> b!773620 m!718339))

(declare-fun m!718341 () Bool)

(assert (=> start!67020 m!718341))

(declare-fun m!718343 () Bool)

(assert (=> start!67020 m!718343))

(declare-fun m!718345 () Bool)

(assert (=> b!773608 m!718345))

(assert (=> b!773606 m!718307))

(assert (=> b!773606 m!718307))

(assert (=> b!773606 m!718309))

(assert (=> b!773618 m!718307))

(assert (=> b!773618 m!718307))

(declare-fun m!718347 () Bool)

(assert (=> b!773618 m!718347))

(assert (=> b!773621 m!718307))

(assert (=> b!773621 m!718307))

(assert (=> b!773621 m!718347))

(assert (=> b!773621 m!718307))

(assert (=> b!773621 m!718327))

(assert (=> b!773609 m!718307))

(assert (=> b!773609 m!718307))

(declare-fun m!718349 () Bool)

(assert (=> b!773609 m!718349))

(assert (=> b!773611 m!718307))

(assert (=> b!773611 m!718307))

(declare-fun m!718351 () Bool)

(assert (=> b!773611 m!718351))

(assert (=> b!773611 m!718351))

(assert (=> b!773611 m!718307))

(declare-fun m!718353 () Bool)

(assert (=> b!773611 m!718353))

(declare-fun m!718355 () Bool)

(assert (=> b!773615 m!718355))

(assert (=> b!773610 m!718307))

(assert (=> b!773610 m!718307))

(declare-fun m!718357 () Bool)

(assert (=> b!773610 m!718357))

(push 1)

