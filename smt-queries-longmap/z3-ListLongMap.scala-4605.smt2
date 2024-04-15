; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64244 () Bool)

(assert start!64244)

(declare-fun b!721314 () Bool)

(declare-fun res!483299 () Bool)

(declare-fun e!404455 () Bool)

(assert (=> b!721314 (=> (not res!483299) (not e!404455))))

(declare-datatypes ((array!40842 0))(
  ( (array!40843 (arr!19544 (Array (_ BitVec 32) (_ BitVec 64))) (size!19965 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40842)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!721314 (= res!483299 (and (= (size!19965 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19965 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19965 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721315 () Bool)

(declare-fun res!483297 () Bool)

(assert (=> b!721315 (=> (not res!483297) (not e!404455))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721315 (= res!483297 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!404452 () Bool)

(declare-fun b!721316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721316 (= e!404452 (not (validKeyInArray!0 (select (store (arr!19544 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!721317 () Bool)

(declare-fun res!483303 () Bool)

(assert (=> b!721317 (=> (not res!483303) (not e!404455))))

(assert (=> b!721317 (= res!483303 (validKeyInArray!0 (select (arr!19544 a!3186) j!159)))))

(declare-fun b!721318 () Bool)

(declare-fun e!404453 () Bool)

(assert (=> b!721318 (= e!404453 e!404452)))

(declare-fun res!483292 () Bool)

(assert (=> b!721318 (=> (not res!483292) (not e!404452))))

(declare-fun lt!319870 () (_ BitVec 32))

(assert (=> b!721318 (= res!483292 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge lt!319870 #b00000000000000000000000000000000) (bvslt lt!319870 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721318 (= lt!319870 (toIndex!0 (select (store (arr!19544 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun res!483301 () Bool)

(assert (=> start!64244 (=> (not res!483301) (not e!404455))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64244 (= res!483301 (validMask!0 mask!3328))))

(assert (=> start!64244 e!404455))

(assert (=> start!64244 true))

(declare-fun array_inv!15427 (array!40842) Bool)

(assert (=> start!64244 (array_inv!15427 a!3186)))

(declare-fun b!721319 () Bool)

(declare-fun e!404454 () Bool)

(assert (=> b!721319 (= e!404455 e!404454)))

(declare-fun res!483295 () Bool)

(assert (=> b!721319 (=> (not res!483295) (not e!404454))))

(declare-datatypes ((SeekEntryResult!7141 0))(
  ( (MissingZero!7141 (index!30932 (_ BitVec 32))) (Found!7141 (index!30933 (_ BitVec 32))) (Intermediate!7141 (undefined!7953 Bool) (index!30934 (_ BitVec 32)) (x!61953 (_ BitVec 32))) (Undefined!7141) (MissingVacant!7141 (index!30935 (_ BitVec 32))) )
))
(declare-fun lt!319871 () SeekEntryResult!7141)

(assert (=> b!721319 (= res!483295 (or (= lt!319871 (MissingZero!7141 i!1173)) (= lt!319871 (MissingVacant!7141 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40842 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721319 (= lt!319871 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721320 () Bool)

(declare-fun res!483302 () Bool)

(assert (=> b!721320 (=> (not res!483302) (not e!404455))))

(assert (=> b!721320 (= res!483302 (validKeyInArray!0 k0!2102))))

(declare-fun b!721321 () Bool)

(declare-fun res!483291 () Bool)

(assert (=> b!721321 (=> (not res!483291) (not e!404454))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721321 (= res!483291 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19965 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19965 a!3186))))))

(declare-fun b!721322 () Bool)

(declare-fun res!483296 () Bool)

(assert (=> b!721322 (=> (not res!483296) (not e!404453))))

(declare-fun e!404451 () Bool)

(assert (=> b!721322 (= res!483296 e!404451)))

(declare-fun c!79383 () Bool)

(assert (=> b!721322 (= c!79383 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721323 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40842 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721323 (= e!404451 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19544 a!3186) j!159) a!3186 mask!3328) (Found!7141 j!159)))))

(declare-fun b!721324 () Bool)

(assert (=> b!721324 (= e!404454 e!404453)))

(declare-fun res!483300 () Bool)

(assert (=> b!721324 (=> (not res!483300) (not e!404453))))

(declare-fun lt!319869 () SeekEntryResult!7141)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40842 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721324 (= res!483300 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19544 a!3186) j!159) mask!3328) (select (arr!19544 a!3186) j!159) a!3186 mask!3328) lt!319869))))

(assert (=> b!721324 (= lt!319869 (Intermediate!7141 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721325 () Bool)

(declare-fun res!483294 () Bool)

(assert (=> b!721325 (=> (not res!483294) (not e!404453))))

(assert (=> b!721325 (= res!483294 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19544 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721326 () Bool)

(declare-fun res!483298 () Bool)

(assert (=> b!721326 (=> (not res!483298) (not e!404454))))

(declare-datatypes ((List!13585 0))(
  ( (Nil!13582) (Cons!13581 (h!14635 (_ BitVec 64)) (t!19891 List!13585)) )
))
(declare-fun arrayNoDuplicates!0 (array!40842 (_ BitVec 32) List!13585) Bool)

(assert (=> b!721326 (= res!483298 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13582))))

(declare-fun b!721327 () Bool)

(declare-fun res!483293 () Bool)

(assert (=> b!721327 (=> (not res!483293) (not e!404454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40842 (_ BitVec 32)) Bool)

(assert (=> b!721327 (= res!483293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721328 () Bool)

(assert (=> b!721328 (= e!404451 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19544 a!3186) j!159) a!3186 mask!3328) lt!319869))))

(assert (= (and start!64244 res!483301) b!721314))

(assert (= (and b!721314 res!483299) b!721317))

(assert (= (and b!721317 res!483303) b!721320))

(assert (= (and b!721320 res!483302) b!721315))

(assert (= (and b!721315 res!483297) b!721319))

(assert (= (and b!721319 res!483295) b!721327))

(assert (= (and b!721327 res!483293) b!721326))

(assert (= (and b!721326 res!483298) b!721321))

(assert (= (and b!721321 res!483291) b!721324))

(assert (= (and b!721324 res!483300) b!721325))

(assert (= (and b!721325 res!483294) b!721322))

(assert (= (and b!721322 c!79383) b!721328))

(assert (= (and b!721322 (not c!79383)) b!721323))

(assert (= (and b!721322 res!483296) b!721318))

(assert (= (and b!721318 res!483292) b!721316))

(declare-fun m!675575 () Bool)

(assert (=> b!721324 m!675575))

(assert (=> b!721324 m!675575))

(declare-fun m!675577 () Bool)

(assert (=> b!721324 m!675577))

(assert (=> b!721324 m!675577))

(assert (=> b!721324 m!675575))

(declare-fun m!675579 () Bool)

(assert (=> b!721324 m!675579))

(declare-fun m!675581 () Bool)

(assert (=> b!721320 m!675581))

(declare-fun m!675583 () Bool)

(assert (=> b!721326 m!675583))

(declare-fun m!675585 () Bool)

(assert (=> b!721315 m!675585))

(declare-fun m!675587 () Bool)

(assert (=> b!721319 m!675587))

(assert (=> b!721317 m!675575))

(assert (=> b!721317 m!675575))

(declare-fun m!675589 () Bool)

(assert (=> b!721317 m!675589))

(declare-fun m!675591 () Bool)

(assert (=> b!721316 m!675591))

(declare-fun m!675593 () Bool)

(assert (=> b!721316 m!675593))

(assert (=> b!721316 m!675593))

(declare-fun m!675595 () Bool)

(assert (=> b!721316 m!675595))

(assert (=> b!721328 m!675575))

(assert (=> b!721328 m!675575))

(declare-fun m!675597 () Bool)

(assert (=> b!721328 m!675597))

(declare-fun m!675599 () Bool)

(assert (=> b!721327 m!675599))

(assert (=> b!721323 m!675575))

(assert (=> b!721323 m!675575))

(declare-fun m!675601 () Bool)

(assert (=> b!721323 m!675601))

(declare-fun m!675603 () Bool)

(assert (=> start!64244 m!675603))

(declare-fun m!675605 () Bool)

(assert (=> start!64244 m!675605))

(declare-fun m!675607 () Bool)

(assert (=> b!721325 m!675607))

(assert (=> b!721318 m!675591))

(assert (=> b!721318 m!675593))

(assert (=> b!721318 m!675593))

(declare-fun m!675609 () Bool)

(assert (=> b!721318 m!675609))

(check-sat (not start!64244) (not b!721317) (not b!721327) (not b!721326) (not b!721328) (not b!721316) (not b!721318) (not b!721323) (not b!721324) (not b!721319) (not b!721315) (not b!721320))
(check-sat)
