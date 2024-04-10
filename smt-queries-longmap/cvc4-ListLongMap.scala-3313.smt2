; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45826 () Bool)

(assert start!45826)

(declare-fun b!507412 () Bool)

(declare-fun e!296951 () Bool)

(declare-fun e!296950 () Bool)

(assert (=> b!507412 (= e!296951 (not e!296950))))

(declare-fun res!308372 () Bool)

(assert (=> b!507412 (=> res!308372 e!296950)))

(declare-datatypes ((SeekEntryResult!4138 0))(
  ( (MissingZero!4138 (index!18740 (_ BitVec 32))) (Found!4138 (index!18741 (_ BitVec 32))) (Intermediate!4138 (undefined!4950 Bool) (index!18742 (_ BitVec 32)) (x!47731 (_ BitVec 32))) (Undefined!4138) (MissingVacant!4138 (index!18743 (_ BitVec 32))) )
))
(declare-fun lt!231704 () SeekEntryResult!4138)

(declare-fun lt!231705 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32582 0))(
  ( (array!32583 (arr!15671 (Array (_ BitVec 32) (_ BitVec 64))) (size!16035 (_ BitVec 32))) )
))
(declare-fun lt!231702 () array!32582)

(declare-fun lt!231701 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32582 (_ BitVec 32)) SeekEntryResult!4138)

(assert (=> b!507412 (= res!308372 (= lt!231704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231701 lt!231705 lt!231702 mask!3524)))))

(declare-fun lt!231708 () (_ BitVec 32))

(declare-fun a!3235 () array!32582)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507412 (= lt!231704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231708 (select (arr!15671 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507412 (= lt!231701 (toIndex!0 lt!231705 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507412 (= lt!231705 (select (store (arr!15671 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507412 (= lt!231708 (toIndex!0 (select (arr!15671 a!3235) j!176) mask!3524))))

(assert (=> b!507412 (= lt!231702 (array!32583 (store (arr!15671 a!3235) i!1204 k!2280) (size!16035 a!3235)))))

(declare-fun e!296949 () Bool)

(assert (=> b!507412 e!296949))

(declare-fun res!308380 () Bool)

(assert (=> b!507412 (=> (not res!308380) (not e!296949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32582 (_ BitVec 32)) Bool)

(assert (=> b!507412 (= res!308380 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15564 0))(
  ( (Unit!15565) )
))
(declare-fun lt!231703 () Unit!15564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15564)

(assert (=> b!507412 (= lt!231703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507413 () Bool)

(declare-fun res!308376 () Bool)

(declare-fun e!296952 () Bool)

(assert (=> b!507413 (=> (not res!308376) (not e!296952))))

(assert (=> b!507413 (= res!308376 (and (= (size!16035 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16035 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16035 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507414 () Bool)

(declare-fun res!308375 () Bool)

(assert (=> b!507414 (=> (not res!308375) (not e!296952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507414 (= res!308375 (validKeyInArray!0 k!2280))))

(declare-fun b!507415 () Bool)

(declare-fun e!296948 () Bool)

(assert (=> b!507415 (= e!296950 e!296948)))

(declare-fun res!308371 () Bool)

(assert (=> b!507415 (=> res!308371 e!296948)))

(declare-fun lt!231707 () Bool)

(assert (=> b!507415 (= res!308371 (or (and (not lt!231707) (undefined!4950 lt!231704)) (and (not lt!231707) (not (undefined!4950 lt!231704)))))))

(assert (=> b!507415 (= lt!231707 (not (is-Intermediate!4138 lt!231704)))))

(declare-fun b!507416 () Bool)

(assert (=> b!507416 (= e!296948 true)))

(declare-fun lt!231709 () SeekEntryResult!4138)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32582 (_ BitVec 32)) SeekEntryResult!4138)

(assert (=> b!507416 (= lt!231709 (seekEntryOrOpen!0 lt!231705 lt!231702 mask!3524))))

(assert (=> b!507416 false))

(declare-fun b!507417 () Bool)

(assert (=> b!507417 (= e!296949 (= (seekEntryOrOpen!0 (select (arr!15671 a!3235) j!176) a!3235 mask!3524) (Found!4138 j!176)))))

(declare-fun res!308379 () Bool)

(assert (=> start!45826 (=> (not res!308379) (not e!296952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45826 (= res!308379 (validMask!0 mask!3524))))

(assert (=> start!45826 e!296952))

(assert (=> start!45826 true))

(declare-fun array_inv!11467 (array!32582) Bool)

(assert (=> start!45826 (array_inv!11467 a!3235)))

(declare-fun b!507418 () Bool)

(declare-fun res!308381 () Bool)

(assert (=> b!507418 (=> (not res!308381) (not e!296951))))

(assert (=> b!507418 (= res!308381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507419 () Bool)

(declare-fun res!308378 () Bool)

(assert (=> b!507419 (=> (not res!308378) (not e!296951))))

(declare-datatypes ((List!9829 0))(
  ( (Nil!9826) (Cons!9825 (h!10702 (_ BitVec 64)) (t!16057 List!9829)) )
))
(declare-fun arrayNoDuplicates!0 (array!32582 (_ BitVec 32) List!9829) Bool)

(assert (=> b!507419 (= res!308378 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9826))))

(declare-fun b!507420 () Bool)

(declare-fun res!308373 () Bool)

(assert (=> b!507420 (=> (not res!308373) (not e!296952))))

(declare-fun arrayContainsKey!0 (array!32582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507420 (= res!308373 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507421 () Bool)

(declare-fun res!308374 () Bool)

(assert (=> b!507421 (=> (not res!308374) (not e!296952))))

(assert (=> b!507421 (= res!308374 (validKeyInArray!0 (select (arr!15671 a!3235) j!176)))))

(declare-fun b!507422 () Bool)

(assert (=> b!507422 (= e!296952 e!296951)))

(declare-fun res!308377 () Bool)

(assert (=> b!507422 (=> (not res!308377) (not e!296951))))

(declare-fun lt!231706 () SeekEntryResult!4138)

(assert (=> b!507422 (= res!308377 (or (= lt!231706 (MissingZero!4138 i!1204)) (= lt!231706 (MissingVacant!4138 i!1204))))))

(assert (=> b!507422 (= lt!231706 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45826 res!308379) b!507413))

(assert (= (and b!507413 res!308376) b!507421))

(assert (= (and b!507421 res!308374) b!507414))

(assert (= (and b!507414 res!308375) b!507420))

(assert (= (and b!507420 res!308373) b!507422))

(assert (= (and b!507422 res!308377) b!507418))

(assert (= (and b!507418 res!308381) b!507419))

(assert (= (and b!507419 res!308378) b!507412))

(assert (= (and b!507412 res!308380) b!507417))

(assert (= (and b!507412 (not res!308372)) b!507415))

(assert (= (and b!507415 (not res!308371)) b!507416))

(declare-fun m!488179 () Bool)

(assert (=> b!507421 m!488179))

(assert (=> b!507421 m!488179))

(declare-fun m!488181 () Bool)

(assert (=> b!507421 m!488181))

(declare-fun m!488183 () Bool)

(assert (=> b!507414 m!488183))

(declare-fun m!488185 () Bool)

(assert (=> b!507412 m!488185))

(declare-fun m!488187 () Bool)

(assert (=> b!507412 m!488187))

(declare-fun m!488189 () Bool)

(assert (=> b!507412 m!488189))

(assert (=> b!507412 m!488179))

(declare-fun m!488191 () Bool)

(assert (=> b!507412 m!488191))

(declare-fun m!488193 () Bool)

(assert (=> b!507412 m!488193))

(declare-fun m!488195 () Bool)

(assert (=> b!507412 m!488195))

(declare-fun m!488197 () Bool)

(assert (=> b!507412 m!488197))

(assert (=> b!507412 m!488179))

(declare-fun m!488199 () Bool)

(assert (=> b!507412 m!488199))

(assert (=> b!507412 m!488179))

(assert (=> b!507417 m!488179))

(assert (=> b!507417 m!488179))

(declare-fun m!488201 () Bool)

(assert (=> b!507417 m!488201))

(declare-fun m!488203 () Bool)

(assert (=> b!507420 m!488203))

(declare-fun m!488205 () Bool)

(assert (=> b!507416 m!488205))

(declare-fun m!488207 () Bool)

(assert (=> b!507419 m!488207))

(declare-fun m!488209 () Bool)

(assert (=> b!507422 m!488209))

(declare-fun m!488211 () Bool)

(assert (=> start!45826 m!488211))

(declare-fun m!488213 () Bool)

(assert (=> start!45826 m!488213))

(declare-fun m!488215 () Bool)

(assert (=> b!507418 m!488215))

(push 1)

