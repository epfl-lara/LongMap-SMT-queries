; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64680 () Bool)

(assert start!64680)

(declare-fun b!729118 () Bool)

(declare-fun e!408105 () Bool)

(declare-fun e!408109 () Bool)

(assert (=> b!729118 (= e!408105 e!408109)))

(declare-fun res!489561 () Bool)

(assert (=> b!729118 (=> (not res!489561) (not e!408109))))

(declare-datatypes ((SeekEntryResult!7284 0))(
  ( (MissingZero!7284 (index!31504 (_ BitVec 32))) (Found!7284 (index!31505 (_ BitVec 32))) (Intermediate!7284 (undefined!8096 Bool) (index!31506 (_ BitVec 32)) (x!62490 (_ BitVec 32))) (Undefined!7284) (MissingVacant!7284 (index!31507 (_ BitVec 32))) )
))
(declare-fun lt!323004 () SeekEntryResult!7284)

(declare-fun lt!323001 () SeekEntryResult!7284)

(assert (=> b!729118 (= res!489561 (= lt!323004 lt!323001))))

(declare-fun lt!323006 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41129 0))(
  ( (array!41130 (arr!19684 (Array (_ BitVec 32) (_ BitVec 64))) (size!20105 (_ BitVec 32))) )
))
(declare-fun lt!323005 () array!41129)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41129 (_ BitVec 32)) SeekEntryResult!7284)

(assert (=> b!729118 (= lt!323001 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323006 lt!323005 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729118 (= lt!323004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323006 mask!3328) lt!323006 lt!323005 mask!3328))))

(declare-fun a!3186 () array!41129)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729118 (= lt!323006 (select (store (arr!19684 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729118 (= lt!323005 (array!41130 (store (arr!19684 a!3186) i!1173 k0!2102) (size!20105 a!3186)))))

(declare-fun b!729119 () Bool)

(declare-fun res!489565 () Bool)

(declare-fun e!408106 () Bool)

(assert (=> b!729119 (=> (not res!489565) (not e!408106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729119 (= res!489565 (validKeyInArray!0 (select (arr!19684 a!3186) j!159)))))

(declare-fun b!729120 () Bool)

(declare-fun res!489572 () Bool)

(declare-fun e!408108 () Bool)

(assert (=> b!729120 (=> (not res!489572) (not e!408108))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729120 (= res!489572 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20105 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20105 a!3186))))))

(declare-fun b!729121 () Bool)

(assert (=> b!729121 (= e!408108 e!408105)))

(declare-fun res!489560 () Bool)

(assert (=> b!729121 (=> (not res!489560) (not e!408105))))

(declare-fun lt!323009 () SeekEntryResult!7284)

(assert (=> b!729121 (= res!489560 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19684 a!3186) j!159) mask!3328) (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323009))))

(assert (=> b!729121 (= lt!323009 (Intermediate!7284 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729122 () Bool)

(declare-fun res!489571 () Bool)

(assert (=> b!729122 (=> (not res!489571) (not e!408105))))

(assert (=> b!729122 (= res!489571 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19684 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729123 () Bool)

(declare-fun res!489567 () Bool)

(assert (=> b!729123 (=> (not res!489567) (not e!408106))))

(assert (=> b!729123 (= res!489567 (and (= (size!20105 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20105 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20105 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!323002 () SeekEntryResult!7284)

(declare-fun e!408107 () Bool)

(declare-fun b!729124 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41129 (_ BitVec 32)) SeekEntryResult!7284)

(assert (=> b!729124 (= e!408107 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323002))))

(declare-fun e!408110 () Bool)

(declare-fun b!729125 () Bool)

(assert (=> b!729125 (= e!408110 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323009))))

(declare-fun b!729126 () Bool)

(declare-fun res!489568 () Bool)

(assert (=> b!729126 (=> (not res!489568) (not e!408108))))

(declare-datatypes ((List!13686 0))(
  ( (Nil!13683) (Cons!13682 (h!14742 (_ BitVec 64)) (t!20001 List!13686)) )
))
(declare-fun arrayNoDuplicates!0 (array!41129 (_ BitVec 32) List!13686) Bool)

(assert (=> b!729126 (= res!489568 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13683))))

(declare-fun b!729128 () Bool)

(declare-fun res!489566 () Bool)

(assert (=> b!729128 (=> (not res!489566) (not e!408108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41129 (_ BitVec 32)) Bool)

(assert (=> b!729128 (= res!489566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729129 () Bool)

(declare-fun e!408103 () Bool)

(assert (=> b!729129 (= e!408103 e!408107)))

(declare-fun res!489563 () Bool)

(assert (=> b!729129 (=> (not res!489563) (not e!408107))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41129 (_ BitVec 32)) SeekEntryResult!7284)

(assert (=> b!729129 (= res!489563 (= (seekEntryOrOpen!0 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323002))))

(assert (=> b!729129 (= lt!323002 (Found!7284 j!159))))

(declare-fun b!729130 () Bool)

(declare-fun res!489562 () Bool)

(assert (=> b!729130 (=> (not res!489562) (not e!408106))))

(declare-fun arrayContainsKey!0 (array!41129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729130 (= res!489562 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729131 () Bool)

(assert (=> b!729131 (= e!408110 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) (Found!7284 j!159)))))

(declare-fun b!729132 () Bool)

(declare-fun res!489557 () Bool)

(assert (=> b!729132 (=> (not res!489557) (not e!408105))))

(assert (=> b!729132 (= res!489557 e!408110)))

(declare-fun c!80155 () Bool)

(assert (=> b!729132 (= c!80155 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729133 () Bool)

(declare-fun res!489558 () Bool)

(assert (=> b!729133 (=> (not res!489558) (not e!408106))))

(assert (=> b!729133 (= res!489558 (validKeyInArray!0 k0!2102))))

(declare-fun b!729134 () Bool)

(assert (=> b!729134 (= e!408106 e!408108)))

(declare-fun res!489570 () Bool)

(assert (=> b!729134 (=> (not res!489570) (not e!408108))))

(declare-fun lt!323008 () SeekEntryResult!7284)

(assert (=> b!729134 (= res!489570 (or (= lt!323008 (MissingZero!7284 i!1173)) (= lt!323008 (MissingVacant!7284 i!1173))))))

(assert (=> b!729134 (= lt!323008 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729135 () Bool)

(declare-fun e!408104 () Bool)

(assert (=> b!729135 (= e!408109 (not e!408104))))

(declare-fun res!489564 () Bool)

(assert (=> b!729135 (=> res!489564 e!408104)))

(get-info :version)

(assert (=> b!729135 (= res!489564 (or (not ((_ is Intermediate!7284) lt!323001)) (bvsge x!1131 (x!62490 lt!323001))))))

(assert (=> b!729135 e!408103))

(declare-fun res!489569 () Bool)

(assert (=> b!729135 (=> (not res!489569) (not e!408103))))

(assert (=> b!729135 (= res!489569 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24886 0))(
  ( (Unit!24887) )
))
(declare-fun lt!323007 () Unit!24886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41129 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24886)

(assert (=> b!729135 (= lt!323007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729127 () Bool)

(assert (=> b!729127 (= e!408104 true)))

(declare-fun lt!323003 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729127 (= lt!323003 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!489559 () Bool)

(assert (=> start!64680 (=> (not res!489559) (not e!408106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64680 (= res!489559 (validMask!0 mask!3328))))

(assert (=> start!64680 e!408106))

(assert (=> start!64680 true))

(declare-fun array_inv!15480 (array!41129) Bool)

(assert (=> start!64680 (array_inv!15480 a!3186)))

(assert (= (and start!64680 res!489559) b!729123))

(assert (= (and b!729123 res!489567) b!729119))

(assert (= (and b!729119 res!489565) b!729133))

(assert (= (and b!729133 res!489558) b!729130))

(assert (= (and b!729130 res!489562) b!729134))

(assert (= (and b!729134 res!489570) b!729128))

(assert (= (and b!729128 res!489566) b!729126))

(assert (= (and b!729126 res!489568) b!729120))

(assert (= (and b!729120 res!489572) b!729121))

(assert (= (and b!729121 res!489560) b!729122))

(assert (= (and b!729122 res!489571) b!729132))

(assert (= (and b!729132 c!80155) b!729125))

(assert (= (and b!729132 (not c!80155)) b!729131))

(assert (= (and b!729132 res!489557) b!729118))

(assert (= (and b!729118 res!489561) b!729135))

(assert (= (and b!729135 res!489569) b!729129))

(assert (= (and b!729129 res!489563) b!729124))

(assert (= (and b!729135 (not res!489564)) b!729127))

(declare-fun m!682795 () Bool)

(assert (=> b!729134 m!682795))

(declare-fun m!682797 () Bool)

(assert (=> start!64680 m!682797))

(declare-fun m!682799 () Bool)

(assert (=> start!64680 m!682799))

(declare-fun m!682801 () Bool)

(assert (=> b!729119 m!682801))

(assert (=> b!729119 m!682801))

(declare-fun m!682803 () Bool)

(assert (=> b!729119 m!682803))

(declare-fun m!682805 () Bool)

(assert (=> b!729128 m!682805))

(declare-fun m!682807 () Bool)

(assert (=> b!729122 m!682807))

(declare-fun m!682809 () Bool)

(assert (=> b!729130 m!682809))

(assert (=> b!729124 m!682801))

(assert (=> b!729124 m!682801))

(declare-fun m!682811 () Bool)

(assert (=> b!729124 m!682811))

(declare-fun m!682813 () Bool)

(assert (=> b!729127 m!682813))

(declare-fun m!682815 () Bool)

(assert (=> b!729126 m!682815))

(declare-fun m!682817 () Bool)

(assert (=> b!729133 m!682817))

(declare-fun m!682819 () Bool)

(assert (=> b!729135 m!682819))

(declare-fun m!682821 () Bool)

(assert (=> b!729135 m!682821))

(assert (=> b!729131 m!682801))

(assert (=> b!729131 m!682801))

(declare-fun m!682823 () Bool)

(assert (=> b!729131 m!682823))

(declare-fun m!682825 () Bool)

(assert (=> b!729118 m!682825))

(declare-fun m!682827 () Bool)

(assert (=> b!729118 m!682827))

(assert (=> b!729118 m!682825))

(declare-fun m!682829 () Bool)

(assert (=> b!729118 m!682829))

(declare-fun m!682831 () Bool)

(assert (=> b!729118 m!682831))

(declare-fun m!682833 () Bool)

(assert (=> b!729118 m!682833))

(assert (=> b!729129 m!682801))

(assert (=> b!729129 m!682801))

(declare-fun m!682835 () Bool)

(assert (=> b!729129 m!682835))

(assert (=> b!729125 m!682801))

(assert (=> b!729125 m!682801))

(declare-fun m!682837 () Bool)

(assert (=> b!729125 m!682837))

(assert (=> b!729121 m!682801))

(assert (=> b!729121 m!682801))

(declare-fun m!682839 () Bool)

(assert (=> b!729121 m!682839))

(assert (=> b!729121 m!682839))

(assert (=> b!729121 m!682801))

(declare-fun m!682841 () Bool)

(assert (=> b!729121 m!682841))

(check-sat (not b!729124) (not b!729127) (not b!729130) (not b!729134) (not b!729119) (not b!729128) (not b!729125) (not b!729133) (not b!729135) (not b!729118) (not b!729126) (not b!729121) (not b!729129) (not b!729131) (not start!64680))
(check-sat)
