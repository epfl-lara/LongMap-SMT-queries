; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66590 () Bool)

(assert start!66590)

(declare-fun b!766603 () Bool)

(declare-fun res!518419 () Bool)

(declare-fun e!426973 () Bool)

(assert (=> b!766603 (=> (not res!518419) (not e!426973))))

(declare-datatypes ((array!42247 0))(
  ( (array!42248 (arr!20224 (Array (_ BitVec 32) (_ BitVec 64))) (size!20644 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42247)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!766603 (= res!518419 (and (= (size!20644 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20644 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20644 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766604 () Bool)

(declare-fun res!518421 () Bool)

(declare-fun e!426975 () Bool)

(assert (=> b!766604 (=> (not res!518421) (not e!426975))))

(declare-datatypes ((List!14133 0))(
  ( (Nil!14130) (Cons!14129 (h!15225 (_ BitVec 64)) (t!20440 List!14133)) )
))
(declare-fun arrayNoDuplicates!0 (array!42247 (_ BitVec 32) List!14133) Bool)

(assert (=> b!766604 (= res!518421 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14130))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426980 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7780 0))(
  ( (MissingZero!7780 (index!33488 (_ BitVec 32))) (Found!7780 (index!33489 (_ BitVec 32))) (Intermediate!7780 (undefined!8592 Bool) (index!33490 (_ BitVec 32)) (x!64557 (_ BitVec 32))) (Undefined!7780) (MissingVacant!7780 (index!33491 (_ BitVec 32))) )
))
(declare-fun lt!340992 () SeekEntryResult!7780)

(declare-fun b!766605 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!766605 (= e!426980 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340992))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!766606 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!766606 (= e!426980 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) (Found!7780 j!159)))))

(declare-fun b!766607 () Bool)

(declare-fun res!518416 () Bool)

(declare-fun e!426976 () Bool)

(assert (=> b!766607 (=> (not res!518416) (not e!426976))))

(assert (=> b!766607 (= res!518416 e!426980)))

(declare-fun c!84488 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766607 (= c!84488 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766609 () Bool)

(assert (=> b!766609 (= e!426975 e!426976)))

(declare-fun res!518425 () Bool)

(assert (=> b!766609 (=> (not res!518425) (not e!426976))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766609 (= res!518425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20224 a!3186) j!159) mask!3328) (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340992))))

(assert (=> b!766609 (= lt!340992 (Intermediate!7780 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766610 () Bool)

(assert (=> b!766610 (= e!426973 e!426975)))

(declare-fun res!518422 () Bool)

(assert (=> b!766610 (=> (not res!518422) (not e!426975))))

(declare-fun lt!340987 () SeekEntryResult!7780)

(assert (=> b!766610 (= res!518422 (or (= lt!340987 (MissingZero!7780 i!1173)) (= lt!340987 (MissingVacant!7780 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42247 (_ BitVec 32)) SeekEntryResult!7780)

(assert (=> b!766610 (= lt!340987 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766611 () Bool)

(declare-fun e!426977 () Bool)

(assert (=> b!766611 (= e!426976 e!426977)))

(declare-fun res!518417 () Bool)

(assert (=> b!766611 (=> (not res!518417) (not e!426977))))

(declare-fun lt!340988 () array!42247)

(declare-fun lt!340989 () (_ BitVec 64))

(assert (=> b!766611 (= res!518417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340989 mask!3328) lt!340989 lt!340988 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340989 lt!340988 mask!3328)))))

(assert (=> b!766611 (= lt!340989 (select (store (arr!20224 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766611 (= lt!340988 (array!42248 (store (arr!20224 a!3186) i!1173 k0!2102) (size!20644 a!3186)))))

(declare-fun b!766612 () Bool)

(declare-fun res!518423 () Bool)

(assert (=> b!766612 (=> (not res!518423) (not e!426973))))

(declare-fun arrayContainsKey!0 (array!42247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766612 (= res!518423 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766613 () Bool)

(declare-fun res!518414 () Bool)

(assert (=> b!766613 (=> (not res!518414) (not e!426973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766613 (= res!518414 (validKeyInArray!0 (select (arr!20224 a!3186) j!159)))))

(declare-fun b!766614 () Bool)

(declare-fun res!518412 () Bool)

(assert (=> b!766614 (=> (not res!518412) (not e!426975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42247 (_ BitVec 32)) Bool)

(assert (=> b!766614 (= res!518412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766615 () Bool)

(declare-fun res!518426 () Bool)

(assert (=> b!766615 (=> (not res!518426) (not e!426975))))

(assert (=> b!766615 (= res!518426 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20644 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20644 a!3186))))))

(declare-fun b!766616 () Bool)

(declare-fun e!426978 () Bool)

(declare-fun e!426979 () Bool)

(assert (=> b!766616 (= e!426978 e!426979)))

(declare-fun res!518415 () Bool)

(assert (=> b!766616 (=> (not res!518415) (not e!426979))))

(declare-fun lt!340991 () SeekEntryResult!7780)

(assert (=> b!766616 (= res!518415 (= (seekEntryOrOpen!0 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340991))))

(assert (=> b!766616 (= lt!340991 (Found!7780 j!159))))

(declare-fun b!766617 () Bool)

(declare-fun res!518424 () Bool)

(assert (=> b!766617 (=> (not res!518424) (not e!426976))))

(assert (=> b!766617 (= res!518424 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20224 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766608 () Bool)

(assert (=> b!766608 (= e!426977 (not true))))

(assert (=> b!766608 e!426978))

(declare-fun res!518413 () Bool)

(assert (=> b!766608 (=> (not res!518413) (not e!426978))))

(assert (=> b!766608 (= res!518413 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26365 0))(
  ( (Unit!26366) )
))
(declare-fun lt!340990 () Unit!26365)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26365)

(assert (=> b!766608 (= lt!340990 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!518418 () Bool)

(assert (=> start!66590 (=> (not res!518418) (not e!426973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66590 (= res!518418 (validMask!0 mask!3328))))

(assert (=> start!66590 e!426973))

(assert (=> start!66590 true))

(declare-fun array_inv!16083 (array!42247) Bool)

(assert (=> start!66590 (array_inv!16083 a!3186)))

(declare-fun b!766618 () Bool)

(declare-fun res!518420 () Bool)

(assert (=> b!766618 (=> (not res!518420) (not e!426973))))

(assert (=> b!766618 (= res!518420 (validKeyInArray!0 k0!2102))))

(declare-fun b!766619 () Bool)

(assert (=> b!766619 (= e!426979 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20224 a!3186) j!159) a!3186 mask!3328) lt!340991))))

(assert (= (and start!66590 res!518418) b!766603))

(assert (= (and b!766603 res!518419) b!766613))

(assert (= (and b!766613 res!518414) b!766618))

(assert (= (and b!766618 res!518420) b!766612))

(assert (= (and b!766612 res!518423) b!766610))

(assert (= (and b!766610 res!518422) b!766614))

(assert (= (and b!766614 res!518412) b!766604))

(assert (= (and b!766604 res!518421) b!766615))

(assert (= (and b!766615 res!518426) b!766609))

(assert (= (and b!766609 res!518425) b!766617))

(assert (= (and b!766617 res!518424) b!766607))

(assert (= (and b!766607 c!84488) b!766605))

(assert (= (and b!766607 (not c!84488)) b!766606))

(assert (= (and b!766607 res!518416) b!766611))

(assert (= (and b!766611 res!518417) b!766608))

(assert (= (and b!766608 res!518413) b!766616))

(assert (= (and b!766616 res!518415) b!766619))

(declare-fun m!713023 () Bool)

(assert (=> b!766610 m!713023))

(declare-fun m!713025 () Bool)

(assert (=> b!766611 m!713025))

(declare-fun m!713027 () Bool)

(assert (=> b!766611 m!713027))

(declare-fun m!713029 () Bool)

(assert (=> b!766611 m!713029))

(declare-fun m!713031 () Bool)

(assert (=> b!766611 m!713031))

(assert (=> b!766611 m!713025))

(declare-fun m!713033 () Bool)

(assert (=> b!766611 m!713033))

(declare-fun m!713035 () Bool)

(assert (=> start!66590 m!713035))

(declare-fun m!713037 () Bool)

(assert (=> start!66590 m!713037))

(declare-fun m!713039 () Bool)

(assert (=> b!766609 m!713039))

(assert (=> b!766609 m!713039))

(declare-fun m!713041 () Bool)

(assert (=> b!766609 m!713041))

(assert (=> b!766609 m!713041))

(assert (=> b!766609 m!713039))

(declare-fun m!713043 () Bool)

(assert (=> b!766609 m!713043))

(declare-fun m!713045 () Bool)

(assert (=> b!766604 m!713045))

(assert (=> b!766606 m!713039))

(assert (=> b!766606 m!713039))

(declare-fun m!713047 () Bool)

(assert (=> b!766606 m!713047))

(declare-fun m!713049 () Bool)

(assert (=> b!766612 m!713049))

(assert (=> b!766613 m!713039))

(assert (=> b!766613 m!713039))

(declare-fun m!713051 () Bool)

(assert (=> b!766613 m!713051))

(declare-fun m!713053 () Bool)

(assert (=> b!766608 m!713053))

(declare-fun m!713055 () Bool)

(assert (=> b!766608 m!713055))

(declare-fun m!713057 () Bool)

(assert (=> b!766618 m!713057))

(assert (=> b!766616 m!713039))

(assert (=> b!766616 m!713039))

(declare-fun m!713059 () Bool)

(assert (=> b!766616 m!713059))

(declare-fun m!713061 () Bool)

(assert (=> b!766617 m!713061))

(assert (=> b!766619 m!713039))

(assert (=> b!766619 m!713039))

(declare-fun m!713063 () Bool)

(assert (=> b!766619 m!713063))

(assert (=> b!766605 m!713039))

(assert (=> b!766605 m!713039))

(declare-fun m!713065 () Bool)

(assert (=> b!766605 m!713065))

(declare-fun m!713067 () Bool)

(assert (=> b!766614 m!713067))

(check-sat (not b!766613) (not start!66590) (not b!766610) (not b!766618) (not b!766611) (not b!766614) (not b!766612) (not b!766605) (not b!766609) (not b!766616) (not b!766606) (not b!766619) (not b!766608) (not b!766604))
(check-sat)
