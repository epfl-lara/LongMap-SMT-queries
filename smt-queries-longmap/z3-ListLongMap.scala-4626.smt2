; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64436 () Bool)

(assert start!64436)

(declare-datatypes ((array!40971 0))(
  ( (array!40972 (arr!19607 (Array (_ BitVec 32) (_ BitVec 64))) (size!20028 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40971)

(declare-fun e!405780 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7204 0))(
  ( (MissingZero!7204 (index!31184 (_ BitVec 32))) (Found!7204 (index!31185 (_ BitVec 32))) (Intermediate!7204 (undefined!8016 Bool) (index!31186 (_ BitVec 32)) (x!62193 (_ BitVec 32))) (Undefined!7204) (MissingVacant!7204 (index!31187 (_ BitVec 32))) )
))
(declare-fun lt!320869 () SeekEntryResult!7204)

(declare-fun b!724478 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40971 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724478 (= e!405780 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!320869))))

(declare-fun b!724479 () Bool)

(declare-fun res!485807 () Bool)

(declare-fun e!405777 () Bool)

(assert (=> b!724479 (=> (not res!485807) (not e!405777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724479 (= res!485807 (validKeyInArray!0 (select (arr!19607 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!724480 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40971 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724480 (= e!405780 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) (Found!7204 j!159)))))

(declare-fun b!724482 () Bool)

(declare-fun res!485805 () Bool)

(declare-fun e!405781 () Bool)

(assert (=> b!724482 (=> (not res!485805) (not e!405781))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724482 (= res!485805 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20028 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20028 a!3186))))))

(declare-fun b!724483 () Bool)

(declare-fun res!485812 () Bool)

(assert (=> b!724483 (=> (not res!485812) (not e!405777))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!724483 (= res!485812 (and (= (size!20028 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20028 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20028 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724484 () Bool)

(declare-fun res!485808 () Bool)

(declare-fun e!405776 () Bool)

(assert (=> b!724484 (=> (not res!485808) (not e!405776))))

(assert (=> b!724484 (= res!485808 e!405780)))

(declare-fun c!79710 () Bool)

(assert (=> b!724484 (= c!79710 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724485 () Bool)

(assert (=> b!724485 (= e!405781 e!405776)))

(declare-fun res!485810 () Bool)

(assert (=> b!724485 (=> (not res!485810) (not e!405776))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724485 (= res!485810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19607 a!3186) j!159) mask!3328) (select (arr!19607 a!3186) j!159) a!3186 mask!3328) lt!320869))))

(assert (=> b!724485 (= lt!320869 (Intermediate!7204 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!724486 () Bool)

(declare-fun res!485813 () Bool)

(assert (=> b!724486 (=> (not res!485813) (not e!405777))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!724486 (= res!485813 (validKeyInArray!0 k0!2102))))

(declare-fun b!724487 () Bool)

(declare-fun res!485806 () Bool)

(assert (=> b!724487 (=> (not res!485806) (not e!405776))))

(assert (=> b!724487 (= res!485806 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19607 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724488 () Bool)

(declare-fun res!485817 () Bool)

(assert (=> b!724488 (=> (not res!485817) (not e!405777))))

(declare-fun arrayContainsKey!0 (array!40971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724488 (= res!485817 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724489 () Bool)

(assert (=> b!724489 (= e!405777 e!405781)))

(declare-fun res!485809 () Bool)

(assert (=> b!724489 (=> (not res!485809) (not e!405781))))

(declare-fun lt!320870 () SeekEntryResult!7204)

(assert (=> b!724489 (= res!485809 (or (= lt!320870 (MissingZero!7204 i!1173)) (= lt!320870 (MissingVacant!7204 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40971 (_ BitVec 32)) SeekEntryResult!7204)

(assert (=> b!724489 (= lt!320870 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!485816 () Bool)

(assert (=> start!64436 (=> (not res!485816) (not e!405777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64436 (= res!485816 (validMask!0 mask!3328))))

(assert (=> start!64436 e!405777))

(assert (=> start!64436 true))

(declare-fun array_inv!15490 (array!40971) Bool)

(assert (=> start!64436 (array_inv!15490 a!3186)))

(declare-fun b!724481 () Bool)

(declare-fun res!485804 () Bool)

(assert (=> b!724481 (=> (not res!485804) (not e!405781))))

(declare-datatypes ((List!13648 0))(
  ( (Nil!13645) (Cons!13644 (h!14701 (_ BitVec 64)) (t!19954 List!13648)) )
))
(declare-fun arrayNoDuplicates!0 (array!40971 (_ BitVec 32) List!13648) Bool)

(assert (=> b!724481 (= res!485804 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13645))))

(declare-fun b!724490 () Bool)

(declare-fun res!485815 () Bool)

(assert (=> b!724490 (=> (not res!485815) (not e!405781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40971 (_ BitVec 32)) Bool)

(assert (=> b!724490 (= res!485815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724491 () Bool)

(declare-fun e!405778 () Bool)

(assert (=> b!724491 (= e!405776 e!405778)))

(declare-fun res!485814 () Bool)

(assert (=> b!724491 (=> (not res!485814) (not e!405778))))

(declare-fun lt!320873 () array!40971)

(declare-fun lt!320871 () (_ BitVec 64))

(assert (=> b!724491 (= res!485814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320871 mask!3328) lt!320871 lt!320873 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320871 lt!320873 mask!3328)))))

(assert (=> b!724491 (= lt!320871 (select (store (arr!19607 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!724491 (= lt!320873 (array!40972 (store (arr!19607 a!3186) i!1173 k0!2102) (size!20028 a!3186)))))

(declare-fun e!405775 () Bool)

(declare-fun b!724492 () Bool)

(assert (=> b!724492 (= e!405775 (= (seekEntryOrOpen!0 (select (arr!19607 a!3186) j!159) a!3186 mask!3328) (Found!7204 j!159)))))

(declare-fun b!724493 () Bool)

(assert (=> b!724493 (= e!405778 (not true))))

(assert (=> b!724493 e!405775))

(declare-fun res!485811 () Bool)

(assert (=> b!724493 (=> (not res!485811) (not e!405775))))

(assert (=> b!724493 (= res!485811 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24698 0))(
  ( (Unit!24699) )
))
(declare-fun lt!320872 () Unit!24698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24698)

(assert (=> b!724493 (= lt!320872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64436 res!485816) b!724483))

(assert (= (and b!724483 res!485812) b!724479))

(assert (= (and b!724479 res!485807) b!724486))

(assert (= (and b!724486 res!485813) b!724488))

(assert (= (and b!724488 res!485817) b!724489))

(assert (= (and b!724489 res!485809) b!724490))

(assert (= (and b!724490 res!485815) b!724481))

(assert (= (and b!724481 res!485804) b!724482))

(assert (= (and b!724482 res!485805) b!724485))

(assert (= (and b!724485 res!485810) b!724487))

(assert (= (and b!724487 res!485806) b!724484))

(assert (= (and b!724484 c!79710) b!724478))

(assert (= (and b!724484 (not c!79710)) b!724480))

(assert (= (and b!724484 res!485808) b!724491))

(assert (= (and b!724491 res!485814) b!724493))

(assert (= (and b!724493 res!485811) b!724492))

(declare-fun m!678197 () Bool)

(assert (=> b!724481 m!678197))

(declare-fun m!678199 () Bool)

(assert (=> b!724479 m!678199))

(assert (=> b!724479 m!678199))

(declare-fun m!678201 () Bool)

(assert (=> b!724479 m!678201))

(declare-fun m!678203 () Bool)

(assert (=> b!724490 m!678203))

(declare-fun m!678205 () Bool)

(assert (=> b!724491 m!678205))

(declare-fun m!678207 () Bool)

(assert (=> b!724491 m!678207))

(declare-fun m!678209 () Bool)

(assert (=> b!724491 m!678209))

(assert (=> b!724491 m!678207))

(declare-fun m!678211 () Bool)

(assert (=> b!724491 m!678211))

(declare-fun m!678213 () Bool)

(assert (=> b!724491 m!678213))

(declare-fun m!678215 () Bool)

(assert (=> b!724489 m!678215))

(declare-fun m!678217 () Bool)

(assert (=> start!64436 m!678217))

(declare-fun m!678219 () Bool)

(assert (=> start!64436 m!678219))

(declare-fun m!678221 () Bool)

(assert (=> b!724486 m!678221))

(declare-fun m!678223 () Bool)

(assert (=> b!724488 m!678223))

(assert (=> b!724480 m!678199))

(assert (=> b!724480 m!678199))

(declare-fun m!678225 () Bool)

(assert (=> b!724480 m!678225))

(assert (=> b!724478 m!678199))

(assert (=> b!724478 m!678199))

(declare-fun m!678227 () Bool)

(assert (=> b!724478 m!678227))

(assert (=> b!724485 m!678199))

(assert (=> b!724485 m!678199))

(declare-fun m!678229 () Bool)

(assert (=> b!724485 m!678229))

(assert (=> b!724485 m!678229))

(assert (=> b!724485 m!678199))

(declare-fun m!678231 () Bool)

(assert (=> b!724485 m!678231))

(assert (=> b!724492 m!678199))

(assert (=> b!724492 m!678199))

(declare-fun m!678233 () Bool)

(assert (=> b!724492 m!678233))

(declare-fun m!678235 () Bool)

(assert (=> b!724493 m!678235))

(declare-fun m!678237 () Bool)

(assert (=> b!724493 m!678237))

(declare-fun m!678239 () Bool)

(assert (=> b!724487 m!678239))

(check-sat (not b!724491) (not b!724485) (not b!724478) (not b!724479) (not start!64436) (not b!724480) (not b!724493) (not b!724488) (not b!724489) (not b!724490) (not b!724481) (not b!724492) (not b!724486))
(check-sat)
