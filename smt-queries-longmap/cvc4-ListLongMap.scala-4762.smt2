; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65636 () Bool)

(assert start!65636)

(declare-fun b!751365 () Bool)

(declare-fun e!419158 () Bool)

(declare-fun e!419157 () Bool)

(assert (=> b!751365 (= e!419158 e!419157)))

(declare-fun res!507253 () Bool)

(assert (=> b!751365 (=> (not res!507253) (not e!419157))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41809 0))(
  ( (array!41810 (arr!20018 (Array (_ BitVec 32) (_ BitVec 64))) (size!20439 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41809)

(declare-datatypes ((SeekEntryResult!7618 0))(
  ( (MissingZero!7618 (index!32840 (_ BitVec 32))) (Found!7618 (index!32841 (_ BitVec 32))) (Intermediate!7618 (undefined!8430 Bool) (index!32842 (_ BitVec 32)) (x!63760 (_ BitVec 32))) (Undefined!7618) (MissingVacant!7618 (index!32843 (_ BitVec 32))) )
))
(declare-fun lt!334144 () SeekEntryResult!7618)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7618)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751365 (= res!507253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20018 a!3186) j!159) mask!3328) (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!334144))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751365 (= lt!334144 (Intermediate!7618 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751366 () Bool)

(declare-datatypes ((Unit!25852 0))(
  ( (Unit!25853) )
))
(declare-fun e!419153 () Unit!25852)

(declare-fun Unit!25854 () Unit!25852)

(assert (=> b!751366 (= e!419153 Unit!25854)))

(declare-fun b!751367 () Bool)

(declare-fun res!507267 () Bool)

(assert (=> b!751367 (=> (not res!507267) (not e!419157))))

(declare-fun e!419161 () Bool)

(assert (=> b!751367 (= res!507267 e!419161)))

(declare-fun c!82438 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!751367 (= c!82438 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751368 () Bool)

(declare-fun res!507252 () Bool)

(assert (=> b!751368 (=> (not res!507252) (not e!419158))))

(declare-datatypes ((List!14020 0))(
  ( (Nil!14017) (Cons!14016 (h!15088 (_ BitVec 64)) (t!20335 List!14020)) )
))
(declare-fun arrayNoDuplicates!0 (array!41809 (_ BitVec 32) List!14020) Bool)

(assert (=> b!751368 (= res!507252 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14017))))

(declare-fun b!751369 () Bool)

(declare-fun e!419160 () Bool)

(declare-fun e!419156 () Bool)

(assert (=> b!751369 (= e!419160 (not e!419156))))

(declare-fun res!507264 () Bool)

(assert (=> b!751369 (=> res!507264 e!419156)))

(declare-fun lt!334150 () SeekEntryResult!7618)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751369 (= res!507264 (or (not (is-Intermediate!7618 lt!334150)) (bvslt x!1131 (x!63760 lt!334150)) (not (= x!1131 (x!63760 lt!334150))) (not (= index!1321 (index!32842 lt!334150)))))))

(declare-fun e!419154 () Bool)

(assert (=> b!751369 e!419154))

(declare-fun res!507258 () Bool)

(assert (=> b!751369 (=> (not res!507258) (not e!419154))))

(declare-fun lt!334153 () SeekEntryResult!7618)

(declare-fun lt!334147 () SeekEntryResult!7618)

(assert (=> b!751369 (= res!507258 (= lt!334153 lt!334147))))

(assert (=> b!751369 (= lt!334147 (Found!7618 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!751369 (= lt!334153 (seekEntryOrOpen!0 (select (arr!20018 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41809 (_ BitVec 32)) Bool)

(assert (=> b!751369 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334149 () Unit!25852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41809 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25852)

(assert (=> b!751369 (= lt!334149 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751370 () Bool)

(declare-fun res!507255 () Bool)

(declare-fun e!419155 () Bool)

(assert (=> b!751370 (=> (not res!507255) (not e!419155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751370 (= res!507255 (validKeyInArray!0 (select (arr!20018 a!3186) j!159)))))

(declare-fun b!751371 () Bool)

(declare-fun res!507254 () Bool)

(assert (=> b!751371 (=> (not res!507254) (not e!419155))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!751371 (= res!507254 (validKeyInArray!0 k!2102))))

(declare-fun b!751372 () Bool)

(declare-fun res!507257 () Bool)

(assert (=> b!751372 (=> (not res!507257) (not e!419158))))

(assert (=> b!751372 (= res!507257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751373 () Bool)

(declare-fun res!507263 () Bool)

(assert (=> b!751373 (=> (not res!507263) (not e!419155))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751373 (= res!507263 (and (= (size!20439 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20439 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20439 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751375 () Bool)

(declare-fun e!419152 () Bool)

(assert (=> b!751375 (= e!419156 e!419152)))

(declare-fun res!507266 () Bool)

(assert (=> b!751375 (=> res!507266 e!419152)))

(declare-fun lt!334154 () (_ BitVec 64))

(declare-fun lt!334145 () (_ BitVec 64))

(assert (=> b!751375 (= res!507266 (= lt!334154 lt!334145))))

(assert (=> b!751375 (= lt!334154 (select (store (arr!20018 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751376 () Bool)

(assert (=> b!751376 (= e!419152 true)))

(declare-fun e!419162 () Bool)

(assert (=> b!751376 e!419162))

(declare-fun res!507256 () Bool)

(assert (=> b!751376 (=> (not res!507256) (not e!419162))))

(assert (=> b!751376 (= res!507256 (= lt!334154 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334146 () Unit!25852)

(assert (=> b!751376 (= lt!334146 e!419153)))

(declare-fun c!82437 () Bool)

(assert (=> b!751376 (= c!82437 (= lt!334154 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751377 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41809 (_ BitVec 32)) SeekEntryResult!7618)

(assert (=> b!751377 (= e!419161 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) (Found!7618 j!159)))))

(declare-fun b!751378 () Bool)

(declare-fun res!507260 () Bool)

(assert (=> b!751378 (=> (not res!507260) (not e!419157))))

(assert (=> b!751378 (= res!507260 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20018 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751379 () Bool)

(assert (=> b!751379 (= e!419154 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!334147))))

(declare-fun b!751380 () Bool)

(assert (=> b!751380 (= e!419161 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!334144))))

(declare-fun lt!334148 () array!41809)

(declare-fun b!751381 () Bool)

(assert (=> b!751381 (= e!419162 (= (seekEntryOrOpen!0 lt!334145 lt!334148 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334145 lt!334148 mask!3328)))))

(declare-fun b!751382 () Bool)

(declare-fun res!507262 () Bool)

(assert (=> b!751382 (=> (not res!507262) (not e!419158))))

(assert (=> b!751382 (= res!507262 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20439 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20439 a!3186))))))

(declare-fun b!751383 () Bool)

(declare-fun res!507269 () Bool)

(assert (=> b!751383 (=> (not res!507269) (not e!419155))))

(declare-fun arrayContainsKey!0 (array!41809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751383 (= res!507269 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!507265 () Bool)

(assert (=> start!65636 (=> (not res!507265) (not e!419155))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65636 (= res!507265 (validMask!0 mask!3328))))

(assert (=> start!65636 e!419155))

(assert (=> start!65636 true))

(declare-fun array_inv!15814 (array!41809) Bool)

(assert (=> start!65636 (array_inv!15814 a!3186)))

(declare-fun b!751374 () Bool)

(declare-fun Unit!25855 () Unit!25852)

(assert (=> b!751374 (= e!419153 Unit!25855)))

(assert (=> b!751374 false))

(declare-fun b!751384 () Bool)

(assert (=> b!751384 (= e!419155 e!419158)))

(declare-fun res!507268 () Bool)

(assert (=> b!751384 (=> (not res!507268) (not e!419158))))

(declare-fun lt!334151 () SeekEntryResult!7618)

(assert (=> b!751384 (= res!507268 (or (= lt!334151 (MissingZero!7618 i!1173)) (= lt!334151 (MissingVacant!7618 i!1173))))))

(assert (=> b!751384 (= lt!334151 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!751385 () Bool)

(declare-fun res!507259 () Bool)

(assert (=> b!751385 (=> res!507259 e!419156)))

(assert (=> b!751385 (= res!507259 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20018 a!3186) j!159) a!3186 mask!3328) lt!334147)))))

(declare-fun b!751386 () Bool)

(assert (=> b!751386 (= e!419157 e!419160)))

(declare-fun res!507261 () Bool)

(assert (=> b!751386 (=> (not res!507261) (not e!419160))))

(declare-fun lt!334152 () SeekEntryResult!7618)

(assert (=> b!751386 (= res!507261 (= lt!334152 lt!334150))))

(assert (=> b!751386 (= lt!334150 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334145 lt!334148 mask!3328))))

(assert (=> b!751386 (= lt!334152 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334145 mask!3328) lt!334145 lt!334148 mask!3328))))

(assert (=> b!751386 (= lt!334145 (select (store (arr!20018 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751386 (= lt!334148 (array!41810 (store (arr!20018 a!3186) i!1173 k!2102) (size!20439 a!3186)))))

(assert (= (and start!65636 res!507265) b!751373))

(assert (= (and b!751373 res!507263) b!751370))

(assert (= (and b!751370 res!507255) b!751371))

(assert (= (and b!751371 res!507254) b!751383))

(assert (= (and b!751383 res!507269) b!751384))

(assert (= (and b!751384 res!507268) b!751372))

(assert (= (and b!751372 res!507257) b!751368))

(assert (= (and b!751368 res!507252) b!751382))

(assert (= (and b!751382 res!507262) b!751365))

(assert (= (and b!751365 res!507253) b!751378))

(assert (= (and b!751378 res!507260) b!751367))

(assert (= (and b!751367 c!82438) b!751380))

(assert (= (and b!751367 (not c!82438)) b!751377))

(assert (= (and b!751367 res!507267) b!751386))

(assert (= (and b!751386 res!507261) b!751369))

(assert (= (and b!751369 res!507258) b!751379))

(assert (= (and b!751369 (not res!507264)) b!751385))

(assert (= (and b!751385 (not res!507259)) b!751375))

(assert (= (and b!751375 (not res!507266)) b!751376))

(assert (= (and b!751376 c!82437) b!751374))

(assert (= (and b!751376 (not c!82437)) b!751366))

(assert (= (and b!751376 res!507256) b!751381))

(declare-fun m!700563 () Bool)

(assert (=> b!751370 m!700563))

(assert (=> b!751370 m!700563))

(declare-fun m!700565 () Bool)

(assert (=> b!751370 m!700565))

(assert (=> b!751377 m!700563))

(assert (=> b!751377 m!700563))

(declare-fun m!700567 () Bool)

(assert (=> b!751377 m!700567))

(assert (=> b!751385 m!700563))

(assert (=> b!751385 m!700563))

(assert (=> b!751385 m!700567))

(declare-fun m!700569 () Bool)

(assert (=> b!751368 m!700569))

(declare-fun m!700571 () Bool)

(assert (=> b!751383 m!700571))

(assert (=> b!751379 m!700563))

(assert (=> b!751379 m!700563))

(declare-fun m!700573 () Bool)

(assert (=> b!751379 m!700573))

(declare-fun m!700575 () Bool)

(assert (=> b!751378 m!700575))

(declare-fun m!700577 () Bool)

(assert (=> b!751381 m!700577))

(declare-fun m!700579 () Bool)

(assert (=> b!751381 m!700579))

(declare-fun m!700581 () Bool)

(assert (=> b!751371 m!700581))

(declare-fun m!700583 () Bool)

(assert (=> b!751384 m!700583))

(declare-fun m!700585 () Bool)

(assert (=> b!751375 m!700585))

(declare-fun m!700587 () Bool)

(assert (=> b!751375 m!700587))

(assert (=> b!751369 m!700563))

(assert (=> b!751369 m!700563))

(declare-fun m!700589 () Bool)

(assert (=> b!751369 m!700589))

(declare-fun m!700591 () Bool)

(assert (=> b!751369 m!700591))

(declare-fun m!700593 () Bool)

(assert (=> b!751369 m!700593))

(declare-fun m!700595 () Bool)

(assert (=> b!751372 m!700595))

(assert (=> b!751365 m!700563))

(assert (=> b!751365 m!700563))

(declare-fun m!700597 () Bool)

(assert (=> b!751365 m!700597))

(assert (=> b!751365 m!700597))

(assert (=> b!751365 m!700563))

(declare-fun m!700599 () Bool)

(assert (=> b!751365 m!700599))

(declare-fun m!700601 () Bool)

(assert (=> b!751386 m!700601))

(declare-fun m!700603 () Bool)

(assert (=> b!751386 m!700603))

(declare-fun m!700605 () Bool)

(assert (=> b!751386 m!700605))

(assert (=> b!751386 m!700603))

(assert (=> b!751386 m!700585))

(declare-fun m!700607 () Bool)

(assert (=> b!751386 m!700607))

(declare-fun m!700609 () Bool)

(assert (=> start!65636 m!700609))

(declare-fun m!700611 () Bool)

(assert (=> start!65636 m!700611))

(assert (=> b!751380 m!700563))

(assert (=> b!751380 m!700563))

(declare-fun m!700613 () Bool)

(assert (=> b!751380 m!700613))

(push 1)

