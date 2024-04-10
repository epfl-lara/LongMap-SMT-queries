; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64022 () Bool)

(assert start!64022)

(declare-fun b!718915 () Bool)

(declare-fun res!481308 () Bool)

(declare-fun e!403534 () Bool)

(assert (=> b!718915 (=> (not res!481308) (not e!403534))))

(declare-datatypes ((array!40717 0))(
  ( (array!40718 (arr!19484 (Array (_ BitVec 32) (_ BitVec 64))) (size!19905 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40717)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40717 (_ BitVec 32)) Bool)

(assert (=> b!718915 (= res!481308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718916 () Bool)

(declare-fun res!481314 () Bool)

(assert (=> b!718916 (=> (not res!481314) (not e!403534))))

(declare-datatypes ((List!13486 0))(
  ( (Nil!13483) (Cons!13482 (h!14530 (_ BitVec 64)) (t!19801 List!13486)) )
))
(declare-fun arrayNoDuplicates!0 (array!40717 (_ BitVec 32) List!13486) Bool)

(assert (=> b!718916 (= res!481314 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13483))))

(declare-fun b!718917 () Bool)

(declare-fun res!481309 () Bool)

(assert (=> b!718917 (=> (not res!481309) (not e!403534))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718917 (= res!481309 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19905 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19905 a!3186))))))

(declare-fun res!481315 () Bool)

(declare-fun e!403535 () Bool)

(assert (=> start!64022 (=> (not res!481315) (not e!403535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64022 (= res!481315 (validMask!0 mask!3328))))

(assert (=> start!64022 e!403535))

(assert (=> start!64022 true))

(declare-fun array_inv!15280 (array!40717) Bool)

(assert (=> start!64022 (array_inv!15280 a!3186)))

(declare-fun b!718918 () Bool)

(declare-fun res!481313 () Bool)

(assert (=> b!718918 (=> (not res!481313) (not e!403535))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718918 (= res!481313 (and (= (size!19905 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19905 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19905 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718919 () Bool)

(declare-fun res!481312 () Bool)

(assert (=> b!718919 (=> (not res!481312) (not e!403535))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718919 (= res!481312 (validKeyInArray!0 k!2102))))

(declare-fun b!718920 () Bool)

(declare-fun res!481316 () Bool)

(assert (=> b!718920 (=> (not res!481316) (not e!403535))))

(declare-fun arrayContainsKey!0 (array!40717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718920 (= res!481316 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718921 () Bool)

(assert (=> b!718921 (= e!403535 e!403534)))

(declare-fun res!481311 () Bool)

(assert (=> b!718921 (=> (not res!481311) (not e!403534))))

(declare-datatypes ((SeekEntryResult!7084 0))(
  ( (MissingZero!7084 (index!30704 (_ BitVec 32))) (Found!7084 (index!30705 (_ BitVec 32))) (Intermediate!7084 (undefined!7896 Bool) (index!30706 (_ BitVec 32)) (x!61715 (_ BitVec 32))) (Undefined!7084) (MissingVacant!7084 (index!30707 (_ BitVec 32))) )
))
(declare-fun lt!319507 () SeekEntryResult!7084)

(assert (=> b!718921 (= res!481311 (or (= lt!319507 (MissingZero!7084 i!1173)) (= lt!319507 (MissingVacant!7084 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40717 (_ BitVec 32)) SeekEntryResult!7084)

(assert (=> b!718921 (= lt!319507 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718922 () Bool)

(assert (=> b!718922 (= e!403534 false)))

(declare-fun lt!319508 () SeekEntryResult!7084)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40717 (_ BitVec 32)) SeekEntryResult!7084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718922 (= lt!319508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19484 a!3186) j!159) mask!3328) (select (arr!19484 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!718923 () Bool)

(declare-fun res!481310 () Bool)

(assert (=> b!718923 (=> (not res!481310) (not e!403535))))

(assert (=> b!718923 (= res!481310 (validKeyInArray!0 (select (arr!19484 a!3186) j!159)))))

(assert (= (and start!64022 res!481315) b!718918))

(assert (= (and b!718918 res!481313) b!718923))

(assert (= (and b!718923 res!481310) b!718919))

(assert (= (and b!718919 res!481312) b!718920))

(assert (= (and b!718920 res!481316) b!718921))

(assert (= (and b!718921 res!481311) b!718915))

(assert (= (and b!718915 res!481308) b!718916))

(assert (= (and b!718916 res!481314) b!718917))

(assert (= (and b!718917 res!481309) b!718922))

(declare-fun m!674421 () Bool)

(assert (=> b!718916 m!674421))

(declare-fun m!674423 () Bool)

(assert (=> b!718921 m!674423))

(declare-fun m!674425 () Bool)

(assert (=> b!718915 m!674425))

(declare-fun m!674427 () Bool)

(assert (=> b!718920 m!674427))

(declare-fun m!674429 () Bool)

(assert (=> b!718919 m!674429))

(declare-fun m!674431 () Bool)

(assert (=> b!718922 m!674431))

(assert (=> b!718922 m!674431))

(declare-fun m!674433 () Bool)

(assert (=> b!718922 m!674433))

(assert (=> b!718922 m!674433))

(assert (=> b!718922 m!674431))

(declare-fun m!674435 () Bool)

(assert (=> b!718922 m!674435))

(declare-fun m!674437 () Bool)

(assert (=> start!64022 m!674437))

(declare-fun m!674439 () Bool)

(assert (=> start!64022 m!674439))

(assert (=> b!718923 m!674431))

(assert (=> b!718923 m!674431))

(declare-fun m!674441 () Bool)

(assert (=> b!718923 m!674441))

(push 1)

(assert (not start!64022))

(assert (not b!718922))

(assert (not b!718915))

(assert (not b!718923))

(assert (not b!718920))

(assert (not b!718921))

(assert (not b!718919))

(assert (not b!718916))

(check-sat)

