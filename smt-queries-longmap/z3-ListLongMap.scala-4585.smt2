; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64086 () Bool)

(assert start!64086)

(declare-fun b!719272 () Bool)

(declare-fun res!481517 () Bool)

(declare-fun e!403770 () Bool)

(assert (=> b!719272 (=> (not res!481517) (not e!403770))))

(declare-datatypes ((array!40714 0))(
  ( (array!40715 (arr!19480 (Array (_ BitVec 32) (_ BitVec 64))) (size!19900 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40714)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40714 (_ BitVec 32)) Bool)

(assert (=> b!719272 (= res!481517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719273 () Bool)

(declare-fun res!481516 () Bool)

(declare-fun e!403769 () Bool)

(assert (=> b!719273 (=> (not res!481516) (not e!403769))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719273 (= res!481516 (and (= (size!19900 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19900 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19900 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719274 () Bool)

(assert (=> b!719274 (= e!403769 e!403770)))

(declare-fun res!481522 () Bool)

(assert (=> b!719274 (=> (not res!481522) (not e!403770))))

(declare-datatypes ((SeekEntryResult!7036 0))(
  ( (MissingZero!7036 (index!30512 (_ BitVec 32))) (Found!7036 (index!30513 (_ BitVec 32))) (Intermediate!7036 (undefined!7848 Bool) (index!30514 (_ BitVec 32)) (x!61678 (_ BitVec 32))) (Undefined!7036) (MissingVacant!7036 (index!30515 (_ BitVec 32))) )
))
(declare-fun lt!319641 () SeekEntryResult!7036)

(assert (=> b!719274 (= res!481522 (or (= lt!319641 (MissingZero!7036 i!1173)) (= lt!319641 (MissingVacant!7036 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40714 (_ BitVec 32)) SeekEntryResult!7036)

(assert (=> b!719274 (= lt!319641 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!719275 () Bool)

(declare-fun res!481521 () Bool)

(assert (=> b!719275 (=> (not res!481521) (not e!403769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719275 (= res!481521 (validKeyInArray!0 k0!2102))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!719276 () Bool)

(assert (=> b!719276 (= e!403770 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19480 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun res!481525 () Bool)

(assert (=> start!64086 (=> (not res!481525) (not e!403769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64086 (= res!481525 (validMask!0 mask!3328))))

(assert (=> start!64086 e!403769))

(assert (=> start!64086 true))

(declare-fun array_inv!15339 (array!40714) Bool)

(assert (=> start!64086 (array_inv!15339 a!3186)))

(declare-fun b!719277 () Bool)

(declare-fun res!481520 () Bool)

(assert (=> b!719277 (=> (not res!481520) (not e!403769))))

(assert (=> b!719277 (= res!481520 (validKeyInArray!0 (select (arr!19480 a!3186) j!159)))))

(declare-fun b!719278 () Bool)

(declare-fun res!481518 () Bool)

(assert (=> b!719278 (=> (not res!481518) (not e!403770))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40714 (_ BitVec 32)) SeekEntryResult!7036)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719278 (= res!481518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19480 a!3186) j!159) mask!3328) (select (arr!19480 a!3186) j!159) a!3186 mask!3328) (Intermediate!7036 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719279 () Bool)

(declare-fun res!481524 () Bool)

(assert (=> b!719279 (=> (not res!481524) (not e!403769))))

(declare-fun arrayContainsKey!0 (array!40714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719279 (= res!481524 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719280 () Bool)

(declare-fun res!481519 () Bool)

(assert (=> b!719280 (=> (not res!481519) (not e!403770))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!719280 (= res!481519 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19900 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19900 a!3186))))))

(declare-fun b!719281 () Bool)

(declare-fun res!481523 () Bool)

(assert (=> b!719281 (=> (not res!481523) (not e!403770))))

(declare-datatypes ((List!13389 0))(
  ( (Nil!13386) (Cons!13385 (h!14436 (_ BitVec 64)) (t!19696 List!13389)) )
))
(declare-fun arrayNoDuplicates!0 (array!40714 (_ BitVec 32) List!13389) Bool)

(assert (=> b!719281 (= res!481523 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13386))))

(assert (= (and start!64086 res!481525) b!719273))

(assert (= (and b!719273 res!481516) b!719277))

(assert (= (and b!719277 res!481520) b!719275))

(assert (= (and b!719275 res!481521) b!719279))

(assert (= (and b!719279 res!481524) b!719274))

(assert (= (and b!719274 res!481522) b!719272))

(assert (= (and b!719272 res!481517) b!719281))

(assert (= (and b!719281 res!481523) b!719280))

(assert (= (and b!719280 res!481519) b!719278))

(assert (= (and b!719278 res!481518) b!719276))

(declare-fun m!675291 () Bool)

(assert (=> b!719274 m!675291))

(declare-fun m!675293 () Bool)

(assert (=> b!719279 m!675293))

(declare-fun m!675295 () Bool)

(assert (=> b!719275 m!675295))

(declare-fun m!675297 () Bool)

(assert (=> start!64086 m!675297))

(declare-fun m!675299 () Bool)

(assert (=> start!64086 m!675299))

(declare-fun m!675301 () Bool)

(assert (=> b!719276 m!675301))

(declare-fun m!675303 () Bool)

(assert (=> b!719272 m!675303))

(declare-fun m!675305 () Bool)

(assert (=> b!719281 m!675305))

(declare-fun m!675307 () Bool)

(assert (=> b!719277 m!675307))

(assert (=> b!719277 m!675307))

(declare-fun m!675309 () Bool)

(assert (=> b!719277 m!675309))

(assert (=> b!719278 m!675307))

(assert (=> b!719278 m!675307))

(declare-fun m!675311 () Bool)

(assert (=> b!719278 m!675311))

(assert (=> b!719278 m!675311))

(assert (=> b!719278 m!675307))

(declare-fun m!675313 () Bool)

(assert (=> b!719278 m!675313))

(check-sat (not b!719277) (not start!64086) (not b!719272) (not b!719279) (not b!719274) (not b!719281) (not b!719278) (not b!719275))
(check-sat)
