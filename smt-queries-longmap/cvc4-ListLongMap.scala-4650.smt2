; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64676 () Bool)

(assert start!64676)

(declare-fun b!729010 () Bool)

(declare-fun res!489469 () Bool)

(declare-fun e!408051 () Bool)

(assert (=> b!729010 (=> (not res!489469) (not e!408051))))

(declare-fun e!408052 () Bool)

(assert (=> b!729010 (= res!489469 e!408052)))

(declare-fun c!80149 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729010 (= c!80149 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729011 () Bool)

(declare-fun res!489473 () Bool)

(assert (=> b!729011 (=> (not res!489473) (not e!408051))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-datatypes ((array!41125 0))(
  ( (array!41126 (arr!19682 (Array (_ BitVec 32) (_ BitVec 64))) (size!20103 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41125)

(assert (=> b!729011 (= res!489473 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19682 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!489471 () Bool)

(declare-fun e!408054 () Bool)

(assert (=> start!64676 (=> (not res!489471) (not e!408054))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64676 (= res!489471 (validMask!0 mask!3328))))

(assert (=> start!64676 e!408054))

(assert (=> start!64676 true))

(declare-fun array_inv!15478 (array!41125) Bool)

(assert (=> start!64676 (array_inv!15478 a!3186)))

(declare-fun b!729012 () Bool)

(declare-fun e!408053 () Bool)

(assert (=> b!729012 (= e!408051 e!408053)))

(declare-fun res!489470 () Bool)

(assert (=> b!729012 (=> (not res!489470) (not e!408053))))

(declare-datatypes ((SeekEntryResult!7282 0))(
  ( (MissingZero!7282 (index!31496 (_ BitVec 32))) (Found!7282 (index!31497 (_ BitVec 32))) (Intermediate!7282 (undefined!8094 Bool) (index!31498 (_ BitVec 32)) (x!62480 (_ BitVec 32))) (Undefined!7282) (MissingVacant!7282 (index!31499 (_ BitVec 32))) )
))
(declare-fun lt!322953 () SeekEntryResult!7282)

(declare-fun lt!322954 () SeekEntryResult!7282)

(assert (=> b!729012 (= res!489470 (= lt!322953 lt!322954))))

(declare-fun lt!322955 () array!41125)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322951 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!729012 (= lt!322954 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322951 lt!322955 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729012 (= lt!322953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322951 mask!3328) lt!322951 lt!322955 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!729012 (= lt!322951 (select (store (arr!19682 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729012 (= lt!322955 (array!41126 (store (arr!19682 a!3186) i!1173 k!2102) (size!20103 a!3186)))))

(declare-fun b!729013 () Bool)

(declare-fun lt!322950 () SeekEntryResult!7282)

(assert (=> b!729013 (= e!408052 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322950))))

(declare-fun b!729014 () Bool)

(declare-fun e!408050 () Bool)

(assert (=> b!729014 (= e!408050 true)))

(declare-fun lt!322948 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729014 (= lt!322948 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729015 () Bool)

(declare-fun e!408048 () Bool)

(declare-fun e!408049 () Bool)

(assert (=> b!729015 (= e!408048 e!408049)))

(declare-fun res!489465 () Bool)

(assert (=> b!729015 (=> (not res!489465) (not e!408049))))

(declare-fun lt!322949 () SeekEntryResult!7282)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!729015 (= res!489465 (= (seekEntryOrOpen!0 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322949))))

(assert (=> b!729015 (= lt!322949 (Found!7282 j!159))))

(declare-fun b!729016 () Bool)

(declare-fun res!489475 () Bool)

(declare-fun e!408055 () Bool)

(assert (=> b!729016 (=> (not res!489475) (not e!408055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41125 (_ BitVec 32)) Bool)

(assert (=> b!729016 (= res!489475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729017 () Bool)

(declare-fun res!489464 () Bool)

(assert (=> b!729017 (=> (not res!489464) (not e!408054))))

(assert (=> b!729017 (= res!489464 (and (= (size!20103 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20103 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20103 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729018 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41125 (_ BitVec 32)) SeekEntryResult!7282)

(assert (=> b!729018 (= e!408049 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322949))))

(declare-fun b!729019 () Bool)

(declare-fun res!489476 () Bool)

(assert (=> b!729019 (=> (not res!489476) (not e!408055))))

(declare-datatypes ((List!13684 0))(
  ( (Nil!13681) (Cons!13680 (h!14740 (_ BitVec 64)) (t!19999 List!13684)) )
))
(declare-fun arrayNoDuplicates!0 (array!41125 (_ BitVec 32) List!13684) Bool)

(assert (=> b!729019 (= res!489476 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13681))))

(declare-fun b!729020 () Bool)

(assert (=> b!729020 (= e!408054 e!408055)))

(declare-fun res!489461 () Bool)

(assert (=> b!729020 (=> (not res!489461) (not e!408055))))

(declare-fun lt!322952 () SeekEntryResult!7282)

(assert (=> b!729020 (= res!489461 (or (= lt!322952 (MissingZero!7282 i!1173)) (= lt!322952 (MissingVacant!7282 i!1173))))))

(assert (=> b!729020 (= lt!322952 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729021 () Bool)

(assert (=> b!729021 (= e!408052 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19682 a!3186) j!159) a!3186 mask!3328) (Found!7282 j!159)))))

(declare-fun b!729022 () Bool)

(declare-fun res!489468 () Bool)

(assert (=> b!729022 (=> (not res!489468) (not e!408055))))

(assert (=> b!729022 (= res!489468 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20103 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20103 a!3186))))))

(declare-fun b!729023 () Bool)

(declare-fun res!489472 () Bool)

(assert (=> b!729023 (=> (not res!489472) (not e!408054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729023 (= res!489472 (validKeyInArray!0 k!2102))))

(declare-fun b!729024 () Bool)

(assert (=> b!729024 (= e!408053 (not e!408050))))

(declare-fun res!489466 () Bool)

(assert (=> b!729024 (=> res!489466 e!408050)))

(assert (=> b!729024 (= res!489466 (or (not (is-Intermediate!7282 lt!322954)) (bvsge x!1131 (x!62480 lt!322954))))))

(assert (=> b!729024 e!408048))

(declare-fun res!489474 () Bool)

(assert (=> b!729024 (=> (not res!489474) (not e!408048))))

(assert (=> b!729024 (= res!489474 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24882 0))(
  ( (Unit!24883) )
))
(declare-fun lt!322947 () Unit!24882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24882)

(assert (=> b!729024 (= lt!322947 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729025 () Bool)

(declare-fun res!489467 () Bool)

(assert (=> b!729025 (=> (not res!489467) (not e!408054))))

(declare-fun arrayContainsKey!0 (array!41125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729025 (= res!489467 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729026 () Bool)

(assert (=> b!729026 (= e!408055 e!408051)))

(declare-fun res!489462 () Bool)

(assert (=> b!729026 (=> (not res!489462) (not e!408051))))

(assert (=> b!729026 (= res!489462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19682 a!3186) j!159) mask!3328) (select (arr!19682 a!3186) j!159) a!3186 mask!3328) lt!322950))))

(assert (=> b!729026 (= lt!322950 (Intermediate!7282 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729027 () Bool)

(declare-fun res!489463 () Bool)

(assert (=> b!729027 (=> (not res!489463) (not e!408054))))

(assert (=> b!729027 (= res!489463 (validKeyInArray!0 (select (arr!19682 a!3186) j!159)))))

(assert (= (and start!64676 res!489471) b!729017))

(assert (= (and b!729017 res!489464) b!729027))

(assert (= (and b!729027 res!489463) b!729023))

(assert (= (and b!729023 res!489472) b!729025))

(assert (= (and b!729025 res!489467) b!729020))

(assert (= (and b!729020 res!489461) b!729016))

(assert (= (and b!729016 res!489475) b!729019))

(assert (= (and b!729019 res!489476) b!729022))

(assert (= (and b!729022 res!489468) b!729026))

(assert (= (and b!729026 res!489462) b!729011))

(assert (= (and b!729011 res!489473) b!729010))

(assert (= (and b!729010 c!80149) b!729013))

(assert (= (and b!729010 (not c!80149)) b!729021))

(assert (= (and b!729010 res!489469) b!729012))

(assert (= (and b!729012 res!489470) b!729024))

(assert (= (and b!729024 res!489474) b!729015))

(assert (= (and b!729015 res!489465) b!729018))

(assert (= (and b!729024 (not res!489466)) b!729014))

(declare-fun m!682699 () Bool)

(assert (=> b!729023 m!682699))

(declare-fun m!682701 () Bool)

(assert (=> b!729019 m!682701))

(declare-fun m!682703 () Bool)

(assert (=> b!729026 m!682703))

(assert (=> b!729026 m!682703))

(declare-fun m!682705 () Bool)

(assert (=> b!729026 m!682705))

(assert (=> b!729026 m!682705))

(assert (=> b!729026 m!682703))

(declare-fun m!682707 () Bool)

(assert (=> b!729026 m!682707))

(assert (=> b!729021 m!682703))

(assert (=> b!729021 m!682703))

(declare-fun m!682709 () Bool)

(assert (=> b!729021 m!682709))

(declare-fun m!682711 () Bool)

(assert (=> b!729020 m!682711))

(declare-fun m!682713 () Bool)

(assert (=> b!729016 m!682713))

(assert (=> b!729027 m!682703))

(assert (=> b!729027 m!682703))

(declare-fun m!682715 () Bool)

(assert (=> b!729027 m!682715))

(declare-fun m!682717 () Bool)

(assert (=> b!729014 m!682717))

(assert (=> b!729018 m!682703))

(assert (=> b!729018 m!682703))

(declare-fun m!682719 () Bool)

(assert (=> b!729018 m!682719))

(declare-fun m!682721 () Bool)

(assert (=> start!64676 m!682721))

(declare-fun m!682723 () Bool)

(assert (=> start!64676 m!682723))

(declare-fun m!682725 () Bool)

(assert (=> b!729012 m!682725))

(declare-fun m!682727 () Bool)

(assert (=> b!729012 m!682727))

(assert (=> b!729012 m!682725))

(declare-fun m!682729 () Bool)

(assert (=> b!729012 m!682729))

(declare-fun m!682731 () Bool)

(assert (=> b!729012 m!682731))

(declare-fun m!682733 () Bool)

(assert (=> b!729012 m!682733))

(declare-fun m!682735 () Bool)

(assert (=> b!729024 m!682735))

(declare-fun m!682737 () Bool)

(assert (=> b!729024 m!682737))

(declare-fun m!682739 () Bool)

(assert (=> b!729025 m!682739))

(assert (=> b!729015 m!682703))

(assert (=> b!729015 m!682703))

(declare-fun m!682741 () Bool)

(assert (=> b!729015 m!682741))

(assert (=> b!729013 m!682703))

(assert (=> b!729013 m!682703))

(declare-fun m!682743 () Bool)

(assert (=> b!729013 m!682743))

(declare-fun m!682745 () Bool)

(assert (=> b!729011 m!682745))

(push 1)

