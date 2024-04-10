; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64074 () Bool)

(assert start!64074)

(declare-fun b!719649 () Bool)

(declare-fun res!482050 () Bool)

(declare-fun e!403767 () Bool)

(assert (=> b!719649 (=> (not res!482050) (not e!403767))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40769 0))(
  ( (array!40770 (arr!19510 (Array (_ BitVec 32) (_ BitVec 64))) (size!19931 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40769)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7110 0))(
  ( (MissingZero!7110 (index!30808 (_ BitVec 32))) (Found!7110 (index!30809 (_ BitVec 32))) (Intermediate!7110 (undefined!7922 Bool) (index!30810 (_ BitVec 32)) (x!61813 (_ BitVec 32))) (Undefined!7110) (MissingVacant!7110 (index!30811 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40769 (_ BitVec 32)) SeekEntryResult!7110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!719649 (= res!482050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19510 a!3186) j!159) mask!3328) (select (arr!19510 a!3186) j!159) a!3186 mask!3328) (Intermediate!7110 false resIntermediateIndex!5 resIntermediateX!5)))))

(declare-fun b!719650 () Bool)

(declare-fun res!482043 () Bool)

(assert (=> b!719650 (=> (not res!482043) (not e!403767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40769 (_ BitVec 32)) Bool)

(assert (=> b!719650 (= res!482043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!719651 () Bool)

(declare-fun res!482042 () Bool)

(declare-fun e!403768 () Bool)

(assert (=> b!719651 (=> (not res!482042) (not e!403768))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!719651 (= res!482042 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!719652 () Bool)

(declare-fun res!482048 () Bool)

(assert (=> b!719652 (=> (not res!482048) (not e!403767))))

(declare-datatypes ((List!13512 0))(
  ( (Nil!13509) (Cons!13508 (h!14556 (_ BitVec 64)) (t!19827 List!13512)) )
))
(declare-fun arrayNoDuplicates!0 (array!40769 (_ BitVec 32) List!13512) Bool)

(assert (=> b!719652 (= res!482048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13509))))

(declare-fun res!482046 () Bool)

(assert (=> start!64074 (=> (not res!482046) (not e!403768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64074 (= res!482046 (validMask!0 mask!3328))))

(assert (=> start!64074 e!403768))

(assert (=> start!64074 true))

(declare-fun array_inv!15306 (array!40769) Bool)

(assert (=> start!64074 (array_inv!15306 a!3186)))

(declare-fun b!719653 () Bool)

(declare-fun res!482049 () Bool)

(assert (=> b!719653 (=> (not res!482049) (not e!403768))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!719653 (= res!482049 (and (= (size!19931 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19931 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19931 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!719654 () Bool)

(declare-fun res!482047 () Bool)

(assert (=> b!719654 (=> (not res!482047) (not e!403768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!719654 (= res!482047 (validKeyInArray!0 k0!2102))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!719655 () Bool)

(assert (=> b!719655 (= e!403767 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19510 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsgt x!1131 resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!719656 () Bool)

(declare-fun res!482045 () Bool)

(assert (=> b!719656 (=> (not res!482045) (not e!403767))))

(assert (=> b!719656 (= res!482045 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19931 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19931 a!3186))))))

(declare-fun b!719657 () Bool)

(declare-fun res!482051 () Bool)

(assert (=> b!719657 (=> (not res!482051) (not e!403768))))

(assert (=> b!719657 (= res!482051 (validKeyInArray!0 (select (arr!19510 a!3186) j!159)))))

(declare-fun b!719658 () Bool)

(assert (=> b!719658 (= e!403768 e!403767)))

(declare-fun res!482044 () Bool)

(assert (=> b!719658 (=> (not res!482044) (not e!403767))))

(declare-fun lt!319631 () SeekEntryResult!7110)

(assert (=> b!719658 (= res!482044 (or (= lt!319631 (MissingZero!7110 i!1173)) (= lt!319631 (MissingVacant!7110 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40769 (_ BitVec 32)) SeekEntryResult!7110)

(assert (=> b!719658 (= lt!319631 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64074 res!482046) b!719653))

(assert (= (and b!719653 res!482049) b!719657))

(assert (= (and b!719657 res!482051) b!719654))

(assert (= (and b!719654 res!482047) b!719651))

(assert (= (and b!719651 res!482042) b!719658))

(assert (= (and b!719658 res!482044) b!719650))

(assert (= (and b!719650 res!482043) b!719652))

(assert (= (and b!719652 res!482048) b!719656))

(assert (= (and b!719656 res!482045) b!719649))

(assert (= (and b!719649 res!482050) b!719655))

(declare-fun m!675013 () Bool)

(assert (=> b!719651 m!675013))

(declare-fun m!675015 () Bool)

(assert (=> b!719657 m!675015))

(assert (=> b!719657 m!675015))

(declare-fun m!675017 () Bool)

(assert (=> b!719657 m!675017))

(declare-fun m!675019 () Bool)

(assert (=> b!719655 m!675019))

(declare-fun m!675021 () Bool)

(assert (=> start!64074 m!675021))

(declare-fun m!675023 () Bool)

(assert (=> start!64074 m!675023))

(declare-fun m!675025 () Bool)

(assert (=> b!719652 m!675025))

(assert (=> b!719649 m!675015))

(assert (=> b!719649 m!675015))

(declare-fun m!675027 () Bool)

(assert (=> b!719649 m!675027))

(assert (=> b!719649 m!675027))

(assert (=> b!719649 m!675015))

(declare-fun m!675029 () Bool)

(assert (=> b!719649 m!675029))

(declare-fun m!675031 () Bool)

(assert (=> b!719658 m!675031))

(declare-fun m!675033 () Bool)

(assert (=> b!719650 m!675033))

(declare-fun m!675035 () Bool)

(assert (=> b!719654 m!675035))

(check-sat (not b!719649) (not b!719652) (not b!719658) (not b!719654) (not b!719657) (not b!719651) (not start!64074) (not b!719650))
(check-sat)
