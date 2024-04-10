; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65378 () Bool)

(assert start!65378)

(declare-fun b!743625 () Bool)

(declare-fun res!500700 () Bool)

(declare-fun e!415462 () Bool)

(assert (=> b!743625 (=> (not res!500700) (not e!415462))))

(declare-datatypes ((array!41551 0))(
  ( (array!41552 (arr!19889 (Array (_ BitVec 32) (_ BitVec 64))) (size!20310 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41551)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41551 (_ BitVec 32)) Bool)

(assert (=> b!743625 (= res!500700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743626 () Bool)

(declare-fun e!415460 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7489 0))(
  ( (MissingZero!7489 (index!32324 (_ BitVec 32))) (Found!7489 (index!32325 (_ BitVec 32))) (Intermediate!7489 (undefined!8301 Bool) (index!32326 (_ BitVec 32)) (x!63287 (_ BitVec 32))) (Undefined!7489) (MissingVacant!7489 (index!32327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!743626 (= e!415460 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) (Found!7489 j!159)))))

(declare-fun b!743627 () Bool)

(declare-fun res!500704 () Bool)

(assert (=> b!743627 (=> (not res!500704) (not e!415462))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743627 (= res!500704 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20310 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20310 a!3186))))))

(declare-fun b!743628 () Bool)

(declare-fun lt!330329 () SeekEntryResult!7489)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!743628 (= e!415460 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330329))))

(declare-fun b!743629 () Bool)

(declare-fun res!500702 () Bool)

(declare-fun e!415461 () Bool)

(assert (=> b!743629 (=> (not res!500702) (not e!415461))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743629 (= res!500702 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19889 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743630 () Bool)

(declare-fun res!500716 () Bool)

(declare-fun e!415463 () Bool)

(assert (=> b!743630 (=> (not res!500716) (not e!415463))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743630 (= res!500716 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743631 () Bool)

(declare-fun res!500706 () Bool)

(assert (=> b!743631 (=> (not res!500706) (not e!415462))))

(declare-datatypes ((List!13891 0))(
  ( (Nil!13888) (Cons!13887 (h!14959 (_ BitVec 64)) (t!20206 List!13891)) )
))
(declare-fun arrayNoDuplicates!0 (array!41551 (_ BitVec 32) List!13891) Bool)

(assert (=> b!743631 (= res!500706 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13888))))

(declare-fun b!743632 () Bool)

(declare-fun res!500709 () Bool)

(assert (=> b!743632 (=> (not res!500709) (not e!415463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743632 (= res!500709 (validKeyInArray!0 k!2102))))

(declare-fun b!743634 () Bool)

(assert (=> b!743634 (= e!415463 e!415462)))

(declare-fun res!500712 () Bool)

(assert (=> b!743634 (=> (not res!500712) (not e!415462))))

(declare-fun lt!330325 () SeekEntryResult!7489)

(assert (=> b!743634 (= res!500712 (or (= lt!330325 (MissingZero!7489 i!1173)) (= lt!330325 (MissingVacant!7489 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41551 (_ BitVec 32)) SeekEntryResult!7489)

(assert (=> b!743634 (= lt!330325 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743635 () Bool)

(declare-fun res!500713 () Bool)

(declare-fun e!415455 () Bool)

(assert (=> b!743635 (=> res!500713 e!415455)))

(declare-fun lt!330322 () (_ BitVec 64))

(declare-fun lt!330327 () array!41551)

(assert (=> b!743635 (= res!500713 (not (= (seekEntryOrOpen!0 lt!330322 lt!330327 mask!3328) (Found!7489 index!1321))))))

(declare-fun b!743636 () Bool)

(declare-fun res!500698 () Bool)

(assert (=> b!743636 (=> (not res!500698) (not e!415461))))

(assert (=> b!743636 (= res!500698 e!415460)))

(declare-fun c!81844 () Bool)

(assert (=> b!743636 (= c!81844 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743637 () Bool)

(declare-fun res!500707 () Bool)

(assert (=> b!743637 (=> res!500707 e!415455)))

(declare-fun lt!330326 () SeekEntryResult!7489)

(assert (=> b!743637 (= res!500707 (or (not (= (select (store (arr!19889 a!3186) i!1173 k!2102) index!1321) lt!330322)) (undefined!8301 lt!330326)))))

(declare-fun b!743638 () Bool)

(declare-fun res!500701 () Bool)

(assert (=> b!743638 (=> res!500701 e!415455)))

(assert (=> b!743638 (= res!500701 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!743639 () Bool)

(declare-fun res!500705 () Bool)

(assert (=> b!743639 (=> res!500705 e!415455)))

(assert (=> b!743639 (= res!500705 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) (Found!7489 j!159))))))

(declare-fun b!743640 () Bool)

(declare-fun e!415457 () Bool)

(assert (=> b!743640 (= e!415457 (not e!415455))))

(declare-fun res!500717 () Bool)

(assert (=> b!743640 (=> res!500717 e!415455)))

(assert (=> b!743640 (= res!500717 (or (not (is-Intermediate!7489 lt!330326)) (bvslt x!1131 (x!63287 lt!330326)) (not (= x!1131 (x!63287 lt!330326))) (not (= index!1321 (index!32326 lt!330326)))))))

(declare-fun e!415458 () Bool)

(assert (=> b!743640 e!415458))

(declare-fun res!500699 () Bool)

(assert (=> b!743640 (=> (not res!500699) (not e!415458))))

(assert (=> b!743640 (= res!500699 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25458 0))(
  ( (Unit!25459) )
))
(declare-fun lt!330323 () Unit!25458)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25458)

(assert (=> b!743640 (= lt!330323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743633 () Bool)

(declare-fun res!500714 () Bool)

(assert (=> b!743633 (=> (not res!500714) (not e!415463))))

(assert (=> b!743633 (= res!500714 (and (= (size!20310 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20310 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20310 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!500711 () Bool)

(assert (=> start!65378 (=> (not res!500711) (not e!415463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65378 (= res!500711 (validMask!0 mask!3328))))

(assert (=> start!65378 e!415463))

(assert (=> start!65378 true))

(declare-fun array_inv!15685 (array!41551) Bool)

(assert (=> start!65378 (array_inv!15685 a!3186)))

(declare-fun b!743641 () Bool)

(assert (=> b!743641 (= e!415455 (validKeyInArray!0 lt!330322))))

(declare-fun b!743642 () Bool)

(assert (=> b!743642 (= e!415462 e!415461)))

(declare-fun res!500710 () Bool)

(assert (=> b!743642 (=> (not res!500710) (not e!415461))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743642 (= res!500710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19889 a!3186) j!159) mask!3328) (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330329))))

(assert (=> b!743642 (= lt!330329 (Intermediate!7489 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743643 () Bool)

(assert (=> b!743643 (= e!415461 e!415457)))

(declare-fun res!500715 () Bool)

(assert (=> b!743643 (=> (not res!500715) (not e!415457))))

(declare-fun lt!330324 () SeekEntryResult!7489)

(assert (=> b!743643 (= res!500715 (= lt!330324 lt!330326))))

(assert (=> b!743643 (= lt!330326 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330322 lt!330327 mask!3328))))

(assert (=> b!743643 (= lt!330324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330322 mask!3328) lt!330322 lt!330327 mask!3328))))

(assert (=> b!743643 (= lt!330322 (select (store (arr!19889 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743643 (= lt!330327 (array!41552 (store (arr!19889 a!3186) i!1173 k!2102) (size!20310 a!3186)))))

(declare-fun b!743644 () Bool)

(declare-fun res!500708 () Bool)

(assert (=> b!743644 (=> (not res!500708) (not e!415463))))

(assert (=> b!743644 (= res!500708 (validKeyInArray!0 (select (arr!19889 a!3186) j!159)))))

(declare-fun b!743645 () Bool)

(declare-fun lt!330328 () SeekEntryResult!7489)

(declare-fun e!415459 () Bool)

(assert (=> b!743645 (= e!415459 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330328))))

(declare-fun b!743646 () Bool)

(assert (=> b!743646 (= e!415458 e!415459)))

(declare-fun res!500703 () Bool)

(assert (=> b!743646 (=> (not res!500703) (not e!415459))))

(assert (=> b!743646 (= res!500703 (= (seekEntryOrOpen!0 (select (arr!19889 a!3186) j!159) a!3186 mask!3328) lt!330328))))

(assert (=> b!743646 (= lt!330328 (Found!7489 j!159))))

(assert (= (and start!65378 res!500711) b!743633))

(assert (= (and b!743633 res!500714) b!743644))

(assert (= (and b!743644 res!500708) b!743632))

(assert (= (and b!743632 res!500709) b!743630))

(assert (= (and b!743630 res!500716) b!743634))

(assert (= (and b!743634 res!500712) b!743625))

(assert (= (and b!743625 res!500700) b!743631))

(assert (= (and b!743631 res!500706) b!743627))

(assert (= (and b!743627 res!500704) b!743642))

(assert (= (and b!743642 res!500710) b!743629))

(assert (= (and b!743629 res!500702) b!743636))

(assert (= (and b!743636 c!81844) b!743628))

(assert (= (and b!743636 (not c!81844)) b!743626))

(assert (= (and b!743636 res!500698) b!743643))

(assert (= (and b!743643 res!500715) b!743640))

(assert (= (and b!743640 res!500699) b!743646))

(assert (= (and b!743646 res!500703) b!743645))

(assert (= (and b!743640 (not res!500717)) b!743639))

(assert (= (and b!743639 (not res!500705)) b!743637))

(assert (= (and b!743637 (not res!500707)) b!743635))

(assert (= (and b!743635 (not res!500713)) b!743638))

(assert (= (and b!743638 (not res!500701)) b!743641))

(declare-fun m!694275 () Bool)

(assert (=> b!743643 m!694275))

(assert (=> b!743643 m!694275))

(declare-fun m!694277 () Bool)

(assert (=> b!743643 m!694277))

(declare-fun m!694279 () Bool)

(assert (=> b!743643 m!694279))

(declare-fun m!694281 () Bool)

(assert (=> b!743643 m!694281))

(declare-fun m!694283 () Bool)

(assert (=> b!743643 m!694283))

(declare-fun m!694285 () Bool)

(assert (=> b!743629 m!694285))

(declare-fun m!694287 () Bool)

(assert (=> b!743641 m!694287))

(declare-fun m!694289 () Bool)

(assert (=> start!65378 m!694289))

(declare-fun m!694291 () Bool)

(assert (=> start!65378 m!694291))

(assert (=> b!743637 m!694279))

(declare-fun m!694293 () Bool)

(assert (=> b!743637 m!694293))

(declare-fun m!694295 () Bool)

(assert (=> b!743645 m!694295))

(assert (=> b!743645 m!694295))

(declare-fun m!694297 () Bool)

(assert (=> b!743645 m!694297))

(assert (=> b!743639 m!694295))

(assert (=> b!743639 m!694295))

(declare-fun m!694299 () Bool)

(assert (=> b!743639 m!694299))

(declare-fun m!694301 () Bool)

(assert (=> b!743635 m!694301))

(assert (=> b!743626 m!694295))

(assert (=> b!743626 m!694295))

(assert (=> b!743626 m!694299))

(declare-fun m!694303 () Bool)

(assert (=> b!743632 m!694303))

(declare-fun m!694305 () Bool)

(assert (=> b!743634 m!694305))

(declare-fun m!694307 () Bool)

(assert (=> b!743630 m!694307))

(assert (=> b!743642 m!694295))

(assert (=> b!743642 m!694295))

(declare-fun m!694309 () Bool)

(assert (=> b!743642 m!694309))

(assert (=> b!743642 m!694309))

(assert (=> b!743642 m!694295))

(declare-fun m!694311 () Bool)

(assert (=> b!743642 m!694311))

(declare-fun m!694313 () Bool)

(assert (=> b!743625 m!694313))

(assert (=> b!743644 m!694295))

(assert (=> b!743644 m!694295))

(declare-fun m!694315 () Bool)

(assert (=> b!743644 m!694315))

(declare-fun m!694317 () Bool)

(assert (=> b!743631 m!694317))

(assert (=> b!743628 m!694295))

(assert (=> b!743628 m!694295))

(declare-fun m!694319 () Bool)

(assert (=> b!743628 m!694319))

(assert (=> b!743646 m!694295))

(assert (=> b!743646 m!694295))

(declare-fun m!694321 () Bool)

(assert (=> b!743646 m!694321))

(declare-fun m!694323 () Bool)

(assert (=> b!743640 m!694323))

(declare-fun m!694325 () Bool)

(assert (=> b!743640 m!694325))

(push 1)

(assert (not b!743644))

(assert (not b!743642))

(assert (not b!743639))

(assert (not b!743628))

(assert (not b!743643))

(assert (not b!743625))

(assert (not b!743630))

(assert (not b!743646))

(assert (not b!743640))

(assert (not b!743645))

(assert (not b!743632))

(assert (not b!743635))

(assert (not b!743626))

(assert (not start!65378))

(assert (not b!743641))

(assert (not b!743634))

(assert (not b!743631))

(check-sat)

(pop 1)

