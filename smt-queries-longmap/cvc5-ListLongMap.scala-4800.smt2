; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65860 () Bool)

(assert start!65860)

(declare-fun b!759044 () Bool)

(declare-fun res!513597 () Bool)

(declare-fun e!423177 () Bool)

(assert (=> b!759044 (=> (not res!513597) (not e!423177))))

(declare-datatypes ((array!42033 0))(
  ( (array!42034 (arr!20130 (Array (_ BitVec 32) (_ BitVec 64))) (size!20551 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42033)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759044 (= res!513597 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759045 () Bool)

(declare-fun res!513591 () Bool)

(assert (=> b!759045 (=> (not res!513591) (not e!423177))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759045 (= res!513591 (validKeyInArray!0 (select (arr!20130 a!3186) j!159)))))

(declare-fun b!759046 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!423181 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7730 0))(
  ( (MissingZero!7730 (index!33288 (_ BitVec 32))) (Found!7730 (index!33289 (_ BitVec 32))) (Intermediate!7730 (undefined!8542 Bool) (index!33290 (_ BitVec 32)) (x!64176 (_ BitVec 32))) (Undefined!7730) (MissingVacant!7730 (index!33291 (_ BitVec 32))) )
))
(declare-fun lt!338266 () SeekEntryResult!7730)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42033 (_ BitVec 32)) SeekEntryResult!7730)

(assert (=> b!759046 (= e!423181 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20130 a!3186) j!159) a!3186 mask!3328) lt!338266))))

(declare-fun b!759047 () Bool)

(declare-fun e!423179 () Bool)

(assert (=> b!759047 (= e!423179 (not true))))

(declare-fun e!423180 () Bool)

(assert (=> b!759047 e!423180))

(declare-fun res!513598 () Bool)

(assert (=> b!759047 (=> (not res!513598) (not e!423180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42033 (_ BitVec 32)) Bool)

(assert (=> b!759047 (= res!513598 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26300 0))(
  ( (Unit!26301) )
))
(declare-fun lt!338267 () Unit!26300)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42033 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26300)

(assert (=> b!759047 (= lt!338267 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759048 () Bool)

(declare-fun e!423176 () Bool)

(assert (=> b!759048 (= e!423180 e!423176)))

(declare-fun res!513602 () Bool)

(assert (=> b!759048 (=> (not res!513602) (not e!423176))))

(declare-fun lt!338262 () SeekEntryResult!7730)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42033 (_ BitVec 32)) SeekEntryResult!7730)

(assert (=> b!759048 (= res!513602 (= (seekEntryOrOpen!0 (select (arr!20130 a!3186) j!159) a!3186 mask!3328) lt!338262))))

(assert (=> b!759048 (= lt!338262 (Found!7730 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!759049 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42033 (_ BitVec 32)) SeekEntryResult!7730)

(assert (=> b!759049 (= e!423181 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20130 a!3186) j!159) a!3186 mask!3328) (Found!7730 j!159)))))

(declare-fun b!759050 () Bool)

(declare-fun e!423175 () Bool)

(declare-fun e!423182 () Bool)

(assert (=> b!759050 (= e!423175 e!423182)))

(declare-fun res!513594 () Bool)

(assert (=> b!759050 (=> (not res!513594) (not e!423182))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759050 (= res!513594 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20130 a!3186) j!159) mask!3328) (select (arr!20130 a!3186) j!159) a!3186 mask!3328) lt!338266))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759050 (= lt!338266 (Intermediate!7730 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759051 () Bool)

(assert (=> b!759051 (= e!423176 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20130 a!3186) j!159) a!3186 mask!3328) lt!338262))))

(declare-fun b!759052 () Bool)

(assert (=> b!759052 (= e!423182 e!423179)))

(declare-fun res!513596 () Bool)

(assert (=> b!759052 (=> (not res!513596) (not e!423179))))

(declare-fun lt!338263 () array!42033)

(declare-fun lt!338265 () (_ BitVec 64))

(assert (=> b!759052 (= res!513596 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338265 mask!3328) lt!338265 lt!338263 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338265 lt!338263 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759052 (= lt!338265 (select (store (arr!20130 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759052 (= lt!338263 (array!42034 (store (arr!20130 a!3186) i!1173 k!2102) (size!20551 a!3186)))))

(declare-fun b!759054 () Bool)

(declare-fun res!513600 () Bool)

(assert (=> b!759054 (=> (not res!513600) (not e!423182))))

(assert (=> b!759054 (= res!513600 e!423181)))

(declare-fun c!83107 () Bool)

(assert (=> b!759054 (= c!83107 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759055 () Bool)

(declare-fun res!513601 () Bool)

(assert (=> b!759055 (=> (not res!513601) (not e!423177))))

(assert (=> b!759055 (= res!513601 (and (= (size!20551 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20551 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20551 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759056 () Bool)

(declare-fun res!513604 () Bool)

(assert (=> b!759056 (=> (not res!513604) (not e!423175))))

(assert (=> b!759056 (= res!513604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759057 () Bool)

(declare-fun res!513603 () Bool)

(assert (=> b!759057 (=> (not res!513603) (not e!423175))))

(assert (=> b!759057 (= res!513603 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20551 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20551 a!3186))))))

(declare-fun b!759058 () Bool)

(declare-fun res!513595 () Bool)

(assert (=> b!759058 (=> (not res!513595) (not e!423182))))

(assert (=> b!759058 (= res!513595 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20130 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759059 () Bool)

(declare-fun res!513592 () Bool)

(assert (=> b!759059 (=> (not res!513592) (not e!423177))))

(assert (=> b!759059 (= res!513592 (validKeyInArray!0 k!2102))))

(declare-fun b!759060 () Bool)

(declare-fun res!513599 () Bool)

(assert (=> b!759060 (=> (not res!513599) (not e!423175))))

(declare-datatypes ((List!14132 0))(
  ( (Nil!14129) (Cons!14128 (h!15200 (_ BitVec 64)) (t!20447 List!14132)) )
))
(declare-fun arrayNoDuplicates!0 (array!42033 (_ BitVec 32) List!14132) Bool)

(assert (=> b!759060 (= res!513599 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14129))))

(declare-fun res!513593 () Bool)

(assert (=> start!65860 (=> (not res!513593) (not e!423177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65860 (= res!513593 (validMask!0 mask!3328))))

(assert (=> start!65860 e!423177))

(assert (=> start!65860 true))

(declare-fun array_inv!15926 (array!42033) Bool)

(assert (=> start!65860 (array_inv!15926 a!3186)))

(declare-fun b!759053 () Bool)

(assert (=> b!759053 (= e!423177 e!423175)))

(declare-fun res!513605 () Bool)

(assert (=> b!759053 (=> (not res!513605) (not e!423175))))

(declare-fun lt!338264 () SeekEntryResult!7730)

(assert (=> b!759053 (= res!513605 (or (= lt!338264 (MissingZero!7730 i!1173)) (= lt!338264 (MissingVacant!7730 i!1173))))))

(assert (=> b!759053 (= lt!338264 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65860 res!513593) b!759055))

(assert (= (and b!759055 res!513601) b!759045))

(assert (= (and b!759045 res!513591) b!759059))

(assert (= (and b!759059 res!513592) b!759044))

(assert (= (and b!759044 res!513597) b!759053))

(assert (= (and b!759053 res!513605) b!759056))

(assert (= (and b!759056 res!513604) b!759060))

(assert (= (and b!759060 res!513599) b!759057))

(assert (= (and b!759057 res!513603) b!759050))

(assert (= (and b!759050 res!513594) b!759058))

(assert (= (and b!759058 res!513595) b!759054))

(assert (= (and b!759054 c!83107) b!759046))

(assert (= (and b!759054 (not c!83107)) b!759049))

(assert (= (and b!759054 res!513600) b!759052))

(assert (= (and b!759052 res!513596) b!759047))

(assert (= (and b!759047 res!513598) b!759048))

(assert (= (and b!759048 res!513602) b!759051))

(declare-fun m!706441 () Bool)

(assert (=> b!759060 m!706441))

(declare-fun m!706443 () Bool)

(assert (=> b!759059 m!706443))

(declare-fun m!706445 () Bool)

(assert (=> b!759047 m!706445))

(declare-fun m!706447 () Bool)

(assert (=> b!759047 m!706447))

(declare-fun m!706449 () Bool)

(assert (=> start!65860 m!706449))

(declare-fun m!706451 () Bool)

(assert (=> start!65860 m!706451))

(declare-fun m!706453 () Bool)

(assert (=> b!759044 m!706453))

(declare-fun m!706455 () Bool)

(assert (=> b!759056 m!706455))

(declare-fun m!706457 () Bool)

(assert (=> b!759049 m!706457))

(assert (=> b!759049 m!706457))

(declare-fun m!706459 () Bool)

(assert (=> b!759049 m!706459))

(declare-fun m!706461 () Bool)

(assert (=> b!759052 m!706461))

(declare-fun m!706463 () Bool)

(assert (=> b!759052 m!706463))

(declare-fun m!706465 () Bool)

(assert (=> b!759052 m!706465))

(assert (=> b!759052 m!706461))

(declare-fun m!706467 () Bool)

(assert (=> b!759052 m!706467))

(declare-fun m!706469 () Bool)

(assert (=> b!759052 m!706469))

(declare-fun m!706471 () Bool)

(assert (=> b!759058 m!706471))

(assert (=> b!759048 m!706457))

(assert (=> b!759048 m!706457))

(declare-fun m!706473 () Bool)

(assert (=> b!759048 m!706473))

(assert (=> b!759046 m!706457))

(assert (=> b!759046 m!706457))

(declare-fun m!706475 () Bool)

(assert (=> b!759046 m!706475))

(assert (=> b!759050 m!706457))

(assert (=> b!759050 m!706457))

(declare-fun m!706477 () Bool)

(assert (=> b!759050 m!706477))

(assert (=> b!759050 m!706477))

(assert (=> b!759050 m!706457))

(declare-fun m!706479 () Bool)

(assert (=> b!759050 m!706479))

(assert (=> b!759051 m!706457))

(assert (=> b!759051 m!706457))

(declare-fun m!706481 () Bool)

(assert (=> b!759051 m!706481))

(declare-fun m!706483 () Bool)

(assert (=> b!759053 m!706483))

(assert (=> b!759045 m!706457))

(assert (=> b!759045 m!706457))

(declare-fun m!706485 () Bool)

(assert (=> b!759045 m!706485))

(push 1)

