; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66444 () Bool)

(assert start!66444)

(declare-fun b!765555 () Bool)

(declare-fun res!517905 () Bool)

(declare-fun e!426337 () Bool)

(assert (=> b!765555 (=> (not res!517905) (not e!426337))))

(declare-datatypes ((array!42240 0))(
  ( (array!42241 (arr!20225 (Array (_ BitVec 32) (_ BitVec 64))) (size!20646 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42240)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42240 (_ BitVec 32)) Bool)

(assert (=> b!765555 (= res!517905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765556 () Bool)

(declare-fun res!517907 () Bool)

(declare-fun e!426338 () Bool)

(assert (=> b!765556 (=> (not res!517907) (not e!426338))))

(declare-fun e!426334 () Bool)

(assert (=> b!765556 (= res!517907 e!426334)))

(declare-fun c!84219 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765556 (= c!84219 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765557 () Bool)

(declare-fun res!517898 () Bool)

(declare-fun e!426332 () Bool)

(assert (=> b!765557 (=> (not res!517898) (not e!426332))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765557 (= res!517898 (validKeyInArray!0 k0!2102))))

(declare-fun b!765558 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7822 0))(
  ( (MissingZero!7822 (index!33656 (_ BitVec 32))) (Found!7822 (index!33657 (_ BitVec 32))) (Intermediate!7822 (undefined!8634 Bool) (index!33658 (_ BitVec 32)) (x!64575 (_ BitVec 32))) (Undefined!7822) (MissingVacant!7822 (index!33659 (_ BitVec 32))) )
))
(declare-fun lt!340427 () SeekEntryResult!7822)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42240 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!765558 (= e!426334 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340427))))

(declare-fun b!765559 () Bool)

(declare-fun e!426335 () Bool)

(declare-fun e!426333 () Bool)

(assert (=> b!765559 (= e!426335 e!426333)))

(declare-fun res!517897 () Bool)

(assert (=> b!765559 (=> (not res!517897) (not e!426333))))

(declare-fun lt!340426 () SeekEntryResult!7822)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42240 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!765559 (= res!517897 (= (seekEntryOrOpen!0 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340426))))

(assert (=> b!765559 (= lt!340426 (Found!7822 j!159))))

(declare-fun b!765560 () Bool)

(declare-fun res!517908 () Bool)

(assert (=> b!765560 (=> (not res!517908) (not e!426337))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!765560 (= res!517908 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20646 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20646 a!3186))))))

(declare-fun b!765561 () Bool)

(declare-fun res!517899 () Bool)

(assert (=> b!765561 (=> (not res!517899) (not e!426332))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765561 (= res!517899 (and (= (size!20646 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20646 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20646 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765562 () Bool)

(declare-fun res!517902 () Bool)

(assert (=> b!765562 (=> (not res!517902) (not e!426332))))

(assert (=> b!765562 (= res!517902 (validKeyInArray!0 (select (arr!20225 a!3186) j!159)))))

(declare-fun res!517901 () Bool)

(assert (=> start!66444 (=> (not res!517901) (not e!426332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66444 (= res!517901 (validMask!0 mask!3328))))

(assert (=> start!66444 e!426332))

(assert (=> start!66444 true))

(declare-fun array_inv!16108 (array!42240) Bool)

(assert (=> start!66444 (array_inv!16108 a!3186)))

(declare-fun b!765563 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42240 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!765563 (= e!426333 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340426))))

(declare-fun b!765564 () Bool)

(declare-fun res!517906 () Bool)

(assert (=> b!765564 (=> (not res!517906) (not e!426332))))

(declare-fun arrayContainsKey!0 (array!42240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765564 (= res!517906 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765565 () Bool)

(declare-fun res!517909 () Bool)

(assert (=> b!765565 (=> (not res!517909) (not e!426338))))

(assert (=> b!765565 (= res!517909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20225 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765566 () Bool)

(declare-fun res!517903 () Bool)

(assert (=> b!765566 (=> (not res!517903) (not e!426337))))

(declare-datatypes ((List!14266 0))(
  ( (Nil!14263) (Cons!14262 (h!15352 (_ BitVec 64)) (t!20572 List!14266)) )
))
(declare-fun arrayNoDuplicates!0 (array!42240 (_ BitVec 32) List!14266) Bool)

(assert (=> b!765566 (= res!517903 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14263))))

(declare-fun b!765567 () Bool)

(assert (=> b!765567 (= e!426332 e!426337)))

(declare-fun res!517896 () Bool)

(assert (=> b!765567 (=> (not res!517896) (not e!426337))))

(declare-fun lt!340424 () SeekEntryResult!7822)

(assert (=> b!765567 (= res!517896 (or (= lt!340424 (MissingZero!7822 i!1173)) (= lt!340424 (MissingVacant!7822 i!1173))))))

(assert (=> b!765567 (= lt!340424 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!765568 () Bool)

(declare-fun e!426331 () Bool)

(assert (=> b!765568 (= e!426338 e!426331)))

(declare-fun res!517900 () Bool)

(assert (=> b!765568 (=> (not res!517900) (not e!426331))))

(declare-fun lt!340422 () (_ BitVec 64))

(declare-fun lt!340425 () array!42240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765568 (= res!517900 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340422 mask!3328) lt!340422 lt!340425 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340422 lt!340425 mask!3328)))))

(assert (=> b!765568 (= lt!340422 (select (store (arr!20225 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!765568 (= lt!340425 (array!42241 (store (arr!20225 a!3186) i!1173 k0!2102) (size!20646 a!3186)))))

(declare-fun b!765569 () Bool)

(assert (=> b!765569 (= e!426334 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20225 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159)))))

(declare-fun b!765570 () Bool)

(assert (=> b!765570 (= e!426331 (not true))))

(assert (=> b!765570 e!426335))

(declare-fun res!517910 () Bool)

(assert (=> b!765570 (=> (not res!517910) (not e!426335))))

(assert (=> b!765570 (= res!517910 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26342 0))(
  ( (Unit!26343) )
))
(declare-fun lt!340423 () Unit!26342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26342)

(assert (=> b!765570 (= lt!340423 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765571 () Bool)

(assert (=> b!765571 (= e!426337 e!426338)))

(declare-fun res!517904 () Bool)

(assert (=> b!765571 (=> (not res!517904) (not e!426338))))

(assert (=> b!765571 (= res!517904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20225 a!3186) j!159) mask!3328) (select (arr!20225 a!3186) j!159) a!3186 mask!3328) lt!340427))))

(assert (=> b!765571 (= lt!340427 (Intermediate!7822 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66444 res!517901) b!765561))

(assert (= (and b!765561 res!517899) b!765562))

(assert (= (and b!765562 res!517902) b!765557))

(assert (= (and b!765557 res!517898) b!765564))

(assert (= (and b!765564 res!517906) b!765567))

(assert (= (and b!765567 res!517896) b!765555))

(assert (= (and b!765555 res!517905) b!765566))

(assert (= (and b!765566 res!517903) b!765560))

(assert (= (and b!765560 res!517908) b!765571))

(assert (= (and b!765571 res!517904) b!765565))

(assert (= (and b!765565 res!517909) b!765556))

(assert (= (and b!765556 c!84219) b!765558))

(assert (= (and b!765556 (not c!84219)) b!765569))

(assert (= (and b!765556 res!517907) b!765568))

(assert (= (and b!765568 res!517900) b!765570))

(assert (= (and b!765570 res!517910) b!765559))

(assert (= (and b!765559 res!517897) b!765563))

(declare-fun m!711103 () Bool)

(assert (=> b!765564 m!711103))

(declare-fun m!711105 () Bool)

(assert (=> start!66444 m!711105))

(declare-fun m!711107 () Bool)

(assert (=> start!66444 m!711107))

(declare-fun m!711109 () Bool)

(assert (=> b!765568 m!711109))

(declare-fun m!711111 () Bool)

(assert (=> b!765568 m!711111))

(declare-fun m!711113 () Bool)

(assert (=> b!765568 m!711113))

(declare-fun m!711115 () Bool)

(assert (=> b!765568 m!711115))

(declare-fun m!711117 () Bool)

(assert (=> b!765568 m!711117))

(assert (=> b!765568 m!711111))

(declare-fun m!711119 () Bool)

(assert (=> b!765555 m!711119))

(declare-fun m!711121 () Bool)

(assert (=> b!765563 m!711121))

(assert (=> b!765563 m!711121))

(declare-fun m!711123 () Bool)

(assert (=> b!765563 m!711123))

(assert (=> b!765569 m!711121))

(assert (=> b!765569 m!711121))

(declare-fun m!711125 () Bool)

(assert (=> b!765569 m!711125))

(assert (=> b!765559 m!711121))

(assert (=> b!765559 m!711121))

(declare-fun m!711127 () Bool)

(assert (=> b!765559 m!711127))

(declare-fun m!711129 () Bool)

(assert (=> b!765570 m!711129))

(declare-fun m!711131 () Bool)

(assert (=> b!765570 m!711131))

(declare-fun m!711133 () Bool)

(assert (=> b!765567 m!711133))

(declare-fun m!711135 () Bool)

(assert (=> b!765557 m!711135))

(assert (=> b!765571 m!711121))

(assert (=> b!765571 m!711121))

(declare-fun m!711137 () Bool)

(assert (=> b!765571 m!711137))

(assert (=> b!765571 m!711137))

(assert (=> b!765571 m!711121))

(declare-fun m!711139 () Bool)

(assert (=> b!765571 m!711139))

(declare-fun m!711141 () Bool)

(assert (=> b!765566 m!711141))

(assert (=> b!765562 m!711121))

(assert (=> b!765562 m!711121))

(declare-fun m!711143 () Bool)

(assert (=> b!765562 m!711143))

(assert (=> b!765558 m!711121))

(assert (=> b!765558 m!711121))

(declare-fun m!711145 () Bool)

(assert (=> b!765558 m!711145))

(declare-fun m!711147 () Bool)

(assert (=> b!765565 m!711147))

(check-sat (not b!765564) (not b!765570) (not b!765567) (not b!765571) (not b!765566) (not b!765557) (not b!765555) (not b!765569) (not start!66444) (not b!765559) (not b!765562) (not b!765558) (not b!765568) (not b!765563))
(check-sat)
