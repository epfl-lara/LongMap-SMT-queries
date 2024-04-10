; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65578 () Bool)

(assert start!65578)

(declare-fun b!749451 () Bool)

(declare-datatypes ((Unit!25736 0))(
  ( (Unit!25737) )
))
(declare-fun e!418195 () Unit!25736)

(declare-fun Unit!25738 () Unit!25736)

(assert (=> b!749451 (= e!418195 Unit!25738)))

(assert (=> b!749451 false))

(declare-fun b!749452 () Bool)

(declare-fun e!418197 () Bool)

(declare-fun e!418199 () Bool)

(assert (=> b!749452 (= e!418197 (not e!418199))))

(declare-fun res!505687 () Bool)

(assert (=> b!749452 (=> res!505687 e!418199)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7589 0))(
  ( (MissingZero!7589 (index!32724 (_ BitVec 32))) (Found!7589 (index!32725 (_ BitVec 32))) (Intermediate!7589 (undefined!8401 Bool) (index!32726 (_ BitVec 32)) (x!63659 (_ BitVec 32))) (Undefined!7589) (MissingVacant!7589 (index!32727 (_ BitVec 32))) )
))
(declare-fun lt!333189 () SeekEntryResult!7589)

(assert (=> b!749452 (= res!505687 (or (not (is-Intermediate!7589 lt!333189)) (bvslt x!1131 (x!63659 lt!333189)) (not (= x!1131 (x!63659 lt!333189))) (not (= index!1321 (index!32726 lt!333189)))))))

(declare-fun e!418205 () Bool)

(assert (=> b!749452 e!418205))

(declare-fun res!505690 () Bool)

(assert (=> b!749452 (=> (not res!505690) (not e!418205))))

(declare-fun lt!333191 () SeekEntryResult!7589)

(declare-fun lt!333190 () SeekEntryResult!7589)

(assert (=> b!749452 (= res!505690 (= lt!333191 lt!333190))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749452 (= lt!333190 (Found!7589 j!159))))

(declare-datatypes ((array!41751 0))(
  ( (array!41752 (arr!19989 (Array (_ BitVec 32) (_ BitVec 64))) (size!20410 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41751)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41751 (_ BitVec 32)) SeekEntryResult!7589)

(assert (=> b!749452 (= lt!333191 (seekEntryOrOpen!0 (select (arr!19989 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41751 (_ BitVec 32)) Bool)

(assert (=> b!749452 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333193 () Unit!25736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41751 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25736)

(assert (=> b!749452 (= lt!333193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749453 () Bool)

(declare-fun res!505703 () Bool)

(declare-fun e!418196 () Bool)

(assert (=> b!749453 (=> (not res!505703) (not e!418196))))

(assert (=> b!749453 (= res!505703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749454 () Bool)

(declare-fun res!505688 () Bool)

(declare-fun e!418201 () Bool)

(assert (=> b!749454 (=> (not res!505688) (not e!418201))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749454 (= res!505688 (and (= (size!20410 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20410 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20410 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749456 () Bool)

(declare-fun res!505693 () Bool)

(assert (=> b!749456 (=> (not res!505693) (not e!418196))))

(declare-datatypes ((List!13991 0))(
  ( (Nil!13988) (Cons!13987 (h!15059 (_ BitVec 64)) (t!20306 List!13991)) )
))
(declare-fun arrayNoDuplicates!0 (array!41751 (_ BitVec 32) List!13991) Bool)

(assert (=> b!749456 (= res!505693 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13988))))

(declare-fun lt!333197 () array!41751)

(declare-fun b!749457 () Bool)

(declare-fun e!418198 () Bool)

(declare-fun lt!333192 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41751 (_ BitVec 32)) SeekEntryResult!7589)

(assert (=> b!749457 (= e!418198 (= (seekEntryOrOpen!0 lt!333192 lt!333197 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333192 lt!333197 mask!3328)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!749458 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749458 (= e!418205 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19989 a!3186) j!159) a!3186 mask!3328) lt!333190))))

(declare-fun b!749459 () Bool)

(declare-fun res!505698 () Bool)

(assert (=> b!749459 (=> (not res!505698) (not e!418196))))

(assert (=> b!749459 (= res!505698 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20410 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20410 a!3186))))))

(declare-fun b!749460 () Bool)

(declare-fun e!418203 () Bool)

(assert (=> b!749460 (= e!418203 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!749460 e!418198))

(declare-fun res!505697 () Bool)

(assert (=> b!749460 (=> (not res!505697) (not e!418198))))

(declare-fun lt!333194 () (_ BitVec 64))

(assert (=> b!749460 (= res!505697 (= lt!333194 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333195 () Unit!25736)

(assert (=> b!749460 (= lt!333195 e!418195)))

(declare-fun c!82264 () Bool)

(assert (=> b!749460 (= c!82264 (= lt!333194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!418200 () Bool)

(declare-fun b!749461 () Bool)

(assert (=> b!749461 (= e!418200 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19989 a!3186) j!159) a!3186 mask!3328) (Found!7589 j!159)))))

(declare-fun b!749462 () Bool)

(declare-fun res!505699 () Bool)

(assert (=> b!749462 (=> (not res!505699) (not e!418201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749462 (= res!505699 (validKeyInArray!0 (select (arr!19989 a!3186) j!159)))))

(declare-fun b!749463 () Bool)

(declare-fun lt!333187 () SeekEntryResult!7589)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41751 (_ BitVec 32)) SeekEntryResult!7589)

(assert (=> b!749463 (= e!418200 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19989 a!3186) j!159) a!3186 mask!3328) lt!333187))))

(declare-fun b!749455 () Bool)

(declare-fun Unit!25739 () Unit!25736)

(assert (=> b!749455 (= e!418195 Unit!25739)))

(declare-fun res!505691 () Bool)

(assert (=> start!65578 (=> (not res!505691) (not e!418201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65578 (= res!505691 (validMask!0 mask!3328))))

(assert (=> start!65578 e!418201))

(assert (=> start!65578 true))

(declare-fun array_inv!15785 (array!41751) Bool)

(assert (=> start!65578 (array_inv!15785 a!3186)))

(declare-fun b!749464 () Bool)

(declare-fun res!505700 () Bool)

(assert (=> b!749464 (=> (not res!505700) (not e!418201))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749464 (= res!505700 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749465 () Bool)

(declare-fun res!505686 () Bool)

(declare-fun e!418204 () Bool)

(assert (=> b!749465 (=> (not res!505686) (not e!418204))))

(assert (=> b!749465 (= res!505686 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19989 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749466 () Bool)

(assert (=> b!749466 (= e!418201 e!418196)))

(declare-fun res!505689 () Bool)

(assert (=> b!749466 (=> (not res!505689) (not e!418196))))

(declare-fun lt!333196 () SeekEntryResult!7589)

(assert (=> b!749466 (= res!505689 (or (= lt!333196 (MissingZero!7589 i!1173)) (= lt!333196 (MissingVacant!7589 i!1173))))))

(assert (=> b!749466 (= lt!333196 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749467 () Bool)

(assert (=> b!749467 (= e!418196 e!418204)))

(declare-fun res!505696 () Bool)

(assert (=> b!749467 (=> (not res!505696) (not e!418204))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749467 (= res!505696 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19989 a!3186) j!159) mask!3328) (select (arr!19989 a!3186) j!159) a!3186 mask!3328) lt!333187))))

(assert (=> b!749467 (= lt!333187 (Intermediate!7589 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749468 () Bool)

(declare-fun res!505692 () Bool)

(assert (=> b!749468 (=> (not res!505692) (not e!418201))))

(assert (=> b!749468 (= res!505692 (validKeyInArray!0 k!2102))))

(declare-fun b!749469 () Bool)

(declare-fun res!505695 () Bool)

(assert (=> b!749469 (=> (not res!505695) (not e!418204))))

(assert (=> b!749469 (= res!505695 e!418200)))

(declare-fun c!82263 () Bool)

(assert (=> b!749469 (= c!82263 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749470 () Bool)

(declare-fun res!505701 () Bool)

(assert (=> b!749470 (=> res!505701 e!418199)))

(assert (=> b!749470 (= res!505701 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19989 a!3186) j!159) a!3186 mask!3328) lt!333190)))))

(declare-fun b!749471 () Bool)

(assert (=> b!749471 (= e!418199 e!418203)))

(declare-fun res!505694 () Bool)

(assert (=> b!749471 (=> res!505694 e!418203)))

(assert (=> b!749471 (= res!505694 (= lt!333194 lt!333192))))

(assert (=> b!749471 (= lt!333194 (select (store (arr!19989 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!749472 () Bool)

(assert (=> b!749472 (= e!418204 e!418197)))

(declare-fun res!505702 () Bool)

(assert (=> b!749472 (=> (not res!505702) (not e!418197))))

(declare-fun lt!333188 () SeekEntryResult!7589)

(assert (=> b!749472 (= res!505702 (= lt!333188 lt!333189))))

(assert (=> b!749472 (= lt!333189 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333192 lt!333197 mask!3328))))

(assert (=> b!749472 (= lt!333188 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333192 mask!3328) lt!333192 lt!333197 mask!3328))))

(assert (=> b!749472 (= lt!333192 (select (store (arr!19989 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749472 (= lt!333197 (array!41752 (store (arr!19989 a!3186) i!1173 k!2102) (size!20410 a!3186)))))

(assert (= (and start!65578 res!505691) b!749454))

(assert (= (and b!749454 res!505688) b!749462))

(assert (= (and b!749462 res!505699) b!749468))

(assert (= (and b!749468 res!505692) b!749464))

(assert (= (and b!749464 res!505700) b!749466))

(assert (= (and b!749466 res!505689) b!749453))

(assert (= (and b!749453 res!505703) b!749456))

(assert (= (and b!749456 res!505693) b!749459))

(assert (= (and b!749459 res!505698) b!749467))

(assert (= (and b!749467 res!505696) b!749465))

(assert (= (and b!749465 res!505686) b!749469))

(assert (= (and b!749469 c!82263) b!749463))

(assert (= (and b!749469 (not c!82263)) b!749461))

(assert (= (and b!749469 res!505695) b!749472))

(assert (= (and b!749472 res!505702) b!749452))

(assert (= (and b!749452 res!505690) b!749458))

(assert (= (and b!749452 (not res!505687)) b!749470))

(assert (= (and b!749470 (not res!505701)) b!749471))

(assert (= (and b!749471 (not res!505694)) b!749460))

(assert (= (and b!749460 c!82264) b!749451))

(assert (= (and b!749460 (not c!82264)) b!749455))

(assert (= (and b!749460 res!505697) b!749457))

(declare-fun m!699055 () Bool)

(assert (=> start!65578 m!699055))

(declare-fun m!699057 () Bool)

(assert (=> start!65578 m!699057))

(declare-fun m!699059 () Bool)

(assert (=> b!749468 m!699059))

(declare-fun m!699061 () Bool)

(assert (=> b!749466 m!699061))

(declare-fun m!699063 () Bool)

(assert (=> b!749457 m!699063))

(declare-fun m!699065 () Bool)

(assert (=> b!749457 m!699065))

(declare-fun m!699067 () Bool)

(assert (=> b!749470 m!699067))

(assert (=> b!749470 m!699067))

(declare-fun m!699069 () Bool)

(assert (=> b!749470 m!699069))

(declare-fun m!699071 () Bool)

(assert (=> b!749453 m!699071))

(declare-fun m!699073 () Bool)

(assert (=> b!749456 m!699073))

(declare-fun m!699075 () Bool)

(assert (=> b!749464 m!699075))

(assert (=> b!749461 m!699067))

(assert (=> b!749461 m!699067))

(assert (=> b!749461 m!699069))

(assert (=> b!749463 m!699067))

(assert (=> b!749463 m!699067))

(declare-fun m!699077 () Bool)

(assert (=> b!749463 m!699077))

(declare-fun m!699079 () Bool)

(assert (=> b!749471 m!699079))

(declare-fun m!699081 () Bool)

(assert (=> b!749471 m!699081))

(assert (=> b!749462 m!699067))

(assert (=> b!749462 m!699067))

(declare-fun m!699083 () Bool)

(assert (=> b!749462 m!699083))

(declare-fun m!699085 () Bool)

(assert (=> b!749465 m!699085))

(declare-fun m!699087 () Bool)

(assert (=> b!749472 m!699087))

(declare-fun m!699089 () Bool)

(assert (=> b!749472 m!699089))

(assert (=> b!749472 m!699087))

(assert (=> b!749472 m!699079))

(declare-fun m!699091 () Bool)

(assert (=> b!749472 m!699091))

(declare-fun m!699093 () Bool)

(assert (=> b!749472 m!699093))

(assert (=> b!749452 m!699067))

(assert (=> b!749452 m!699067))

(declare-fun m!699095 () Bool)

(assert (=> b!749452 m!699095))

(declare-fun m!699097 () Bool)

(assert (=> b!749452 m!699097))

(declare-fun m!699099 () Bool)

(assert (=> b!749452 m!699099))

(assert (=> b!749467 m!699067))

(assert (=> b!749467 m!699067))

(declare-fun m!699101 () Bool)

(assert (=> b!749467 m!699101))

(assert (=> b!749467 m!699101))

(assert (=> b!749467 m!699067))

(declare-fun m!699103 () Bool)

(assert (=> b!749467 m!699103))

(assert (=> b!749458 m!699067))

(assert (=> b!749458 m!699067))

(declare-fun m!699105 () Bool)

(assert (=> b!749458 m!699105))

(push 1)

(assert (not b!749458))

(assert (not start!65578))

(assert (not b!749466))

(assert (not b!749461))

(assert (not b!749472))

(assert (not b!749453))

