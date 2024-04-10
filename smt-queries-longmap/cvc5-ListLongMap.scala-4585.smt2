; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64024 () Bool)

(assert start!64024)

(declare-fun b!718945 () Bool)

(declare-fun res!481341 () Bool)

(declare-fun e!403543 () Bool)

(assert (=> b!718945 (=> (not res!481341) (not e!403543))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40719 0))(
  ( (array!40720 (arr!19485 (Array (_ BitVec 32) (_ BitVec 64))) (size!19906 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40719)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!718945 (= res!481341 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19906 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19906 a!3186))))))

(declare-fun b!718946 () Bool)

(declare-fun res!481340 () Bool)

(assert (=> b!718946 (=> (not res!481340) (not e!403543))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40719 (_ BitVec 32)) Bool)

(assert (=> b!718946 (= res!481340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718947 () Bool)

(declare-fun res!481342 () Bool)

(declare-fun e!403542 () Bool)

(assert (=> b!718947 (=> (not res!481342) (not e!403542))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718947 (= res!481342 (validKeyInArray!0 (select (arr!19485 a!3186) j!159)))))

(declare-fun b!718948 () Bool)

(declare-fun res!481338 () Bool)

(assert (=> b!718948 (=> (not res!481338) (not e!403542))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718948 (= res!481338 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718949 () Bool)

(declare-fun res!481346 () Bool)

(assert (=> b!718949 (=> (not res!481346) (not e!403543))))

(declare-datatypes ((List!13487 0))(
  ( (Nil!13484) (Cons!13483 (h!14531 (_ BitVec 64)) (t!19802 List!13487)) )
))
(declare-fun arrayNoDuplicates!0 (array!40719 (_ BitVec 32) List!13487) Bool)

(assert (=> b!718949 (= res!481346 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13484))))

(declare-fun b!718950 () Bool)

(assert (=> b!718950 (= e!403542 e!403543)))

(declare-fun res!481343 () Bool)

(assert (=> b!718950 (=> (not res!481343) (not e!403543))))

(declare-datatypes ((SeekEntryResult!7085 0))(
  ( (MissingZero!7085 (index!30708 (_ BitVec 32))) (Found!7085 (index!30709 (_ BitVec 32))) (Intermediate!7085 (undefined!7897 Bool) (index!30710 (_ BitVec 32)) (x!61724 (_ BitVec 32))) (Undefined!7085) (MissingVacant!7085 (index!30711 (_ BitVec 32))) )
))
(declare-fun lt!319511 () SeekEntryResult!7085)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718950 (= res!481343 (or (= lt!319511 (MissingZero!7085 i!1173)) (= lt!319511 (MissingVacant!7085 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40719 (_ BitVec 32)) SeekEntryResult!7085)

(assert (=> b!718950 (= lt!319511 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!718951 () Bool)

(assert (=> b!718951 (= e!403543 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19485 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsle x!1131 resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!718952 () Bool)

(declare-fun res!481345 () Bool)

(assert (=> b!718952 (=> (not res!481345) (not e!403542))))

(assert (=> b!718952 (= res!481345 (validKeyInArray!0 k!2102))))

(declare-fun b!718953 () Bool)

(declare-fun res!481344 () Bool)

(assert (=> b!718953 (=> (not res!481344) (not e!403542))))

(assert (=> b!718953 (= res!481344 (and (= (size!19906 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19906 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19906 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718944 () Bool)

(declare-fun res!481337 () Bool)

(assert (=> b!718944 (=> (not res!481337) (not e!403543))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40719 (_ BitVec 32)) SeekEntryResult!7085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718944 (= res!481337 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19485 a!3186) j!159) mask!3328) (select (arr!19485 a!3186) j!159) a!3186 mask!3328) (Intermediate!7085 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun res!481339 () Bool)

(assert (=> start!64024 (=> (not res!481339) (not e!403542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64024 (= res!481339 (validMask!0 mask!3328))))

(assert (=> start!64024 e!403542))

(assert (=> start!64024 true))

(declare-fun array_inv!15281 (array!40719) Bool)

(assert (=> start!64024 (array_inv!15281 a!3186)))

(assert (= (and start!64024 res!481339) b!718953))

(assert (= (and b!718953 res!481344) b!718947))

(assert (= (and b!718947 res!481342) b!718952))

(assert (= (and b!718952 res!481345) b!718948))

(assert (= (and b!718948 res!481338) b!718950))

(assert (= (and b!718950 res!481343) b!718946))

(assert (= (and b!718946 res!481340) b!718949))

(assert (= (and b!718949 res!481346) b!718945))

(assert (= (and b!718945 res!481341) b!718944))

(assert (= (and b!718944 res!481337) b!718951))

(declare-fun m!674443 () Bool)

(assert (=> b!718946 m!674443))

(declare-fun m!674445 () Bool)

(assert (=> b!718944 m!674445))

(assert (=> b!718944 m!674445))

(declare-fun m!674447 () Bool)

(assert (=> b!718944 m!674447))

(assert (=> b!718944 m!674447))

(assert (=> b!718944 m!674445))

(declare-fun m!674449 () Bool)

(assert (=> b!718944 m!674449))

(declare-fun m!674451 () Bool)

(assert (=> b!718952 m!674451))

(declare-fun m!674453 () Bool)

(assert (=> b!718951 m!674453))

(declare-fun m!674455 () Bool)

(assert (=> b!718950 m!674455))

(declare-fun m!674457 () Bool)

(assert (=> b!718949 m!674457))

(declare-fun m!674459 () Bool)

(assert (=> b!718948 m!674459))

(assert (=> b!718947 m!674445))

(assert (=> b!718947 m!674445))

(declare-fun m!674461 () Bool)

(assert (=> b!718947 m!674461))

(declare-fun m!674463 () Bool)

(assert (=> start!64024 m!674463))

(declare-fun m!674465 () Bool)

(assert (=> start!64024 m!674465))

(push 1)

(assert (not b!718946))

