; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64104 () Bool)

(assert start!64104)

(declare-fun b!720092 () Bool)

(declare-fun e!403916 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!720092 (= e!403916 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!720093 () Bool)

(declare-fun res!482475 () Bool)

(declare-fun e!403912 () Bool)

(assert (=> b!720093 (=> (not res!482475) (not e!403912))))

(declare-datatypes ((array!40799 0))(
  ( (array!40800 (arr!19525 (Array (_ BitVec 32) (_ BitVec 64))) (size!19946 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40799)

(declare-datatypes ((List!13527 0))(
  ( (Nil!13524) (Cons!13523 (h!14571 (_ BitVec 64)) (t!19842 List!13527)) )
))
(declare-fun arrayNoDuplicates!0 (array!40799 (_ BitVec 32) List!13527) Bool)

(assert (=> b!720093 (= res!482475 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13524))))

(declare-fun e!403913 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720094 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7125 0))(
  ( (MissingZero!7125 (index!30868 (_ BitVec 32))) (Found!7125 (index!30869 (_ BitVec 32))) (Intermediate!7125 (undefined!7937 Bool) (index!30870 (_ BitVec 32)) (x!61868 (_ BitVec 32))) (Undefined!7125) (MissingVacant!7125 (index!30871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40799 (_ BitVec 32)) SeekEntryResult!7125)

(assert (=> b!720094 (= e!403913 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19525 a!3186) j!159) a!3186 mask!3328) (Found!7125 j!159)))))

(declare-fun b!720095 () Bool)

(declare-fun res!482483 () Bool)

(assert (=> b!720095 (=> (not res!482483) (not e!403916))))

(assert (=> b!720095 (= res!482483 e!403913)))

(declare-fun c!79177 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720095 (= c!79177 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720096 () Bool)

(declare-fun res!482477 () Bool)

(assert (=> b!720096 (=> (not res!482477) (not e!403912))))

(assert (=> b!720096 (= res!482477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19946 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19946 a!3186))))))

(declare-fun b!720097 () Bool)

(assert (=> b!720097 (= e!403912 e!403916)))

(declare-fun res!482480 () Bool)

(assert (=> b!720097 (=> (not res!482480) (not e!403916))))

(declare-fun lt!319709 () SeekEntryResult!7125)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40799 (_ BitVec 32)) SeekEntryResult!7125)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720097 (= res!482480 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19525 a!3186) j!159) mask!3328) (select (arr!19525 a!3186) j!159) a!3186 mask!3328) lt!319709))))

(assert (=> b!720097 (= lt!319709 (Intermediate!7125 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720098 () Bool)

(declare-fun res!482479 () Bool)

(declare-fun e!403915 () Bool)

(assert (=> b!720098 (=> (not res!482479) (not e!403915))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720098 (= res!482479 (validKeyInArray!0 k0!2102))))

(declare-fun b!720099 () Bool)

(assert (=> b!720099 (= e!403913 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19525 a!3186) j!159) a!3186 mask!3328) lt!319709))))

(declare-fun b!720100 () Bool)

(declare-fun res!482484 () Bool)

(assert (=> b!720100 (=> (not res!482484) (not e!403912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40799 (_ BitVec 32)) Bool)

(assert (=> b!720100 (= res!482484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720101 () Bool)

(declare-fun res!482481 () Bool)

(assert (=> b!720101 (=> (not res!482481) (not e!403916))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720101 (= res!482481 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19525 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720102 () Bool)

(declare-fun res!482486 () Bool)

(assert (=> b!720102 (=> (not res!482486) (not e!403915))))

(declare-fun arrayContainsKey!0 (array!40799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720102 (= res!482486 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720103 () Bool)

(declare-fun res!482478 () Bool)

(assert (=> b!720103 (=> (not res!482478) (not e!403915))))

(assert (=> b!720103 (= res!482478 (and (= (size!19946 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19946 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19946 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!482476 () Bool)

(assert (=> start!64104 (=> (not res!482476) (not e!403915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64104 (= res!482476 (validMask!0 mask!3328))))

(assert (=> start!64104 e!403915))

(assert (=> start!64104 true))

(declare-fun array_inv!15321 (array!40799) Bool)

(assert (=> start!64104 (array_inv!15321 a!3186)))

(declare-fun b!720104 () Bool)

(declare-fun res!482482 () Bool)

(assert (=> b!720104 (=> (not res!482482) (not e!403915))))

(assert (=> b!720104 (= res!482482 (validKeyInArray!0 (select (arr!19525 a!3186) j!159)))))

(declare-fun b!720105 () Bool)

(assert (=> b!720105 (= e!403915 e!403912)))

(declare-fun res!482485 () Bool)

(assert (=> b!720105 (=> (not res!482485) (not e!403912))))

(declare-fun lt!319708 () SeekEntryResult!7125)

(assert (=> b!720105 (= res!482485 (or (= lt!319708 (MissingZero!7125 i!1173)) (= lt!319708 (MissingVacant!7125 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40799 (_ BitVec 32)) SeekEntryResult!7125)

(assert (=> b!720105 (= lt!319708 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64104 res!482476) b!720103))

(assert (= (and b!720103 res!482478) b!720104))

(assert (= (and b!720104 res!482482) b!720098))

(assert (= (and b!720098 res!482479) b!720102))

(assert (= (and b!720102 res!482486) b!720105))

(assert (= (and b!720105 res!482485) b!720100))

(assert (= (and b!720100 res!482484) b!720093))

(assert (= (and b!720093 res!482475) b!720096))

(assert (= (and b!720096 res!482477) b!720097))

(assert (= (and b!720097 res!482480) b!720101))

(assert (= (and b!720101 res!482481) b!720095))

(assert (= (and b!720095 c!79177) b!720099))

(assert (= (and b!720095 (not c!79177)) b!720094))

(assert (= (and b!720095 res!482483) b!720092))

(declare-fun m!675359 () Bool)

(assert (=> b!720105 m!675359))

(declare-fun m!675361 () Bool)

(assert (=> b!720102 m!675361))

(declare-fun m!675363 () Bool)

(assert (=> b!720101 m!675363))

(declare-fun m!675365 () Bool)

(assert (=> b!720104 m!675365))

(assert (=> b!720104 m!675365))

(declare-fun m!675367 () Bool)

(assert (=> b!720104 m!675367))

(declare-fun m!675369 () Bool)

(assert (=> b!720093 m!675369))

(declare-fun m!675371 () Bool)

(assert (=> b!720098 m!675371))

(assert (=> b!720099 m!675365))

(assert (=> b!720099 m!675365))

(declare-fun m!675373 () Bool)

(assert (=> b!720099 m!675373))

(declare-fun m!675375 () Bool)

(assert (=> b!720100 m!675375))

(assert (=> b!720097 m!675365))

(assert (=> b!720097 m!675365))

(declare-fun m!675377 () Bool)

(assert (=> b!720097 m!675377))

(assert (=> b!720097 m!675377))

(assert (=> b!720097 m!675365))

(declare-fun m!675379 () Bool)

(assert (=> b!720097 m!675379))

(assert (=> b!720094 m!675365))

(assert (=> b!720094 m!675365))

(declare-fun m!675381 () Bool)

(assert (=> b!720094 m!675381))

(declare-fun m!675383 () Bool)

(assert (=> start!64104 m!675383))

(declare-fun m!675385 () Bool)

(assert (=> start!64104 m!675385))

(check-sat (not b!720097) (not b!720105) (not b!720099) (not b!720104) (not b!720100) (not b!720102) (not b!720098) (not start!64104) (not b!720094) (not b!720093))
(check-sat)
