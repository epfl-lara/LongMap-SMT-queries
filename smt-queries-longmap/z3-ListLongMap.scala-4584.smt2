; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64020 () Bool)

(assert start!64020)

(declare-fun b!718888 () Bool)

(declare-fun e!403526 () Bool)

(assert (=> b!718888 (= e!403526 false)))

(declare-datatypes ((array!40715 0))(
  ( (array!40716 (arr!19483 (Array (_ BitVec 32) (_ BitVec 64))) (size!19904 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40715)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7083 0))(
  ( (MissingZero!7083 (index!30700 (_ BitVec 32))) (Found!7083 (index!30701 (_ BitVec 32))) (Intermediate!7083 (undefined!7895 Bool) (index!30702 (_ BitVec 32)) (x!61714 (_ BitVec 32))) (Undefined!7083) (MissingVacant!7083 (index!30703 (_ BitVec 32))) )
))
(declare-fun lt!319502 () SeekEntryResult!7083)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40715 (_ BitVec 32)) SeekEntryResult!7083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718888 (= lt!319502 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19483 a!3186) j!159) mask!3328) (select (arr!19483 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!718889 () Bool)

(declare-fun res!481285 () Bool)

(declare-fun e!403524 () Bool)

(assert (=> b!718889 (=> (not res!481285) (not e!403524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718889 (= res!481285 (validKeyInArray!0 (select (arr!19483 a!3186) j!159)))))

(declare-fun b!718890 () Bool)

(declare-fun res!481289 () Bool)

(assert (=> b!718890 (=> (not res!481289) (not e!403526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40715 (_ BitVec 32)) Bool)

(assert (=> b!718890 (= res!481289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718891 () Bool)

(declare-fun res!481284 () Bool)

(assert (=> b!718891 (=> (not res!481284) (not e!403524))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!718891 (= res!481284 (validKeyInArray!0 k0!2102))))

(declare-fun b!718892 () Bool)

(declare-fun res!481286 () Bool)

(assert (=> b!718892 (=> (not res!481286) (not e!403526))))

(declare-datatypes ((List!13485 0))(
  ( (Nil!13482) (Cons!13481 (h!14529 (_ BitVec 64)) (t!19800 List!13485)) )
))
(declare-fun arrayNoDuplicates!0 (array!40715 (_ BitVec 32) List!13485) Bool)

(assert (=> b!718892 (= res!481286 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13482))))

(declare-fun b!718893 () Bool)

(assert (=> b!718893 (= e!403524 e!403526)))

(declare-fun res!481282 () Bool)

(assert (=> b!718893 (=> (not res!481282) (not e!403526))))

(declare-fun lt!319501 () SeekEntryResult!7083)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718893 (= res!481282 (or (= lt!319501 (MissingZero!7083 i!1173)) (= lt!319501 (MissingVacant!7083 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40715 (_ BitVec 32)) SeekEntryResult!7083)

(assert (=> b!718893 (= lt!319501 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718894 () Bool)

(declare-fun res!481287 () Bool)

(assert (=> b!718894 (=> (not res!481287) (not e!403526))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718894 (= res!481287 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19904 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19904 a!3186))))))

(declare-fun b!718895 () Bool)

(declare-fun res!481283 () Bool)

(assert (=> b!718895 (=> (not res!481283) (not e!403524))))

(assert (=> b!718895 (= res!481283 (and (= (size!19904 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19904 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19904 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718896 () Bool)

(declare-fun res!481288 () Bool)

(assert (=> b!718896 (=> (not res!481288) (not e!403524))))

(declare-fun arrayContainsKey!0 (array!40715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718896 (= res!481288 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!481281 () Bool)

(assert (=> start!64020 (=> (not res!481281) (not e!403524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64020 (= res!481281 (validMask!0 mask!3328))))

(assert (=> start!64020 e!403524))

(assert (=> start!64020 true))

(declare-fun array_inv!15279 (array!40715) Bool)

(assert (=> start!64020 (array_inv!15279 a!3186)))

(assert (= (and start!64020 res!481281) b!718895))

(assert (= (and b!718895 res!481283) b!718889))

(assert (= (and b!718889 res!481285) b!718891))

(assert (= (and b!718891 res!481284) b!718896))

(assert (= (and b!718896 res!481288) b!718893))

(assert (= (and b!718893 res!481282) b!718890))

(assert (= (and b!718890 res!481289) b!718892))

(assert (= (and b!718892 res!481286) b!718894))

(assert (= (and b!718894 res!481287) b!718888))

(declare-fun m!674399 () Bool)

(assert (=> b!718888 m!674399))

(assert (=> b!718888 m!674399))

(declare-fun m!674401 () Bool)

(assert (=> b!718888 m!674401))

(assert (=> b!718888 m!674401))

(assert (=> b!718888 m!674399))

(declare-fun m!674403 () Bool)

(assert (=> b!718888 m!674403))

(declare-fun m!674405 () Bool)

(assert (=> b!718892 m!674405))

(declare-fun m!674407 () Bool)

(assert (=> b!718890 m!674407))

(declare-fun m!674409 () Bool)

(assert (=> b!718891 m!674409))

(declare-fun m!674411 () Bool)

(assert (=> b!718896 m!674411))

(declare-fun m!674413 () Bool)

(assert (=> b!718893 m!674413))

(declare-fun m!674415 () Bool)

(assert (=> start!64020 m!674415))

(declare-fun m!674417 () Bool)

(assert (=> start!64020 m!674417))

(assert (=> b!718889 m!674399))

(assert (=> b!718889 m!674399))

(declare-fun m!674419 () Bool)

(assert (=> b!718889 m!674419))

(check-sat (not b!718888) (not b!718893) (not b!718890) (not b!718892) (not b!718889) (not start!64020) (not b!718891) (not b!718896))
(check-sat)
