; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64706 () Bool)

(assert start!64706)

(declare-fun b!730110 () Bool)

(declare-fun res!490551 () Bool)

(declare-fun e!408572 () Bool)

(assert (=> b!730110 (=> (not res!490551) (not e!408572))))

(declare-datatypes ((array!41172 0))(
  ( (array!41173 (arr!19706 (Array (_ BitVec 32) (_ BitVec 64))) (size!20127 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41172)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41172 (_ BitVec 32)) Bool)

(assert (=> b!730110 (= res!490551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730111 () Bool)

(declare-fun res!490560 () Bool)

(assert (=> b!730111 (=> (not res!490560) (not e!408572))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!730111 (= res!490560 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20127 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20127 a!3186))))))

(declare-fun b!730112 () Bool)

(declare-fun e!408571 () Bool)

(assert (=> b!730112 (= e!408571 true)))

(declare-fun lt!323385 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730112 (= lt!323385 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730113 () Bool)

(declare-fun res!490562 () Bool)

(declare-fun e!408574 () Bool)

(assert (=> b!730113 (=> (not res!490562) (not e!408574))))

(declare-fun e!408577 () Bool)

(assert (=> b!730113 (= res!490562 e!408577)))

(declare-fun c!80154 () Bool)

(assert (=> b!730113 (= c!80154 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730114 () Bool)

(declare-fun res!490554 () Bool)

(declare-fun e!408573 () Bool)

(assert (=> b!730114 (=> (not res!490554) (not e!408573))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730114 (= res!490554 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730115 () Bool)

(declare-fun res!490559 () Bool)

(assert (=> b!730115 (=> (not res!490559) (not e!408573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730115 (= res!490559 (validKeyInArray!0 k0!2102))))

(declare-fun b!730116 () Bool)

(declare-fun res!490561 () Bool)

(assert (=> b!730116 (=> (not res!490561) (not e!408573))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!730116 (= res!490561 (and (= (size!20127 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20127 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20127 a!3186)) (not (= i!1173 j!159))))))

(declare-datatypes ((SeekEntryResult!7303 0))(
  ( (MissingZero!7303 (index!31580 (_ BitVec 32))) (Found!7303 (index!31581 (_ BitVec 32))) (Intermediate!7303 (undefined!8115 Bool) (index!31582 (_ BitVec 32)) (x!62568 (_ BitVec 32))) (Undefined!7303) (MissingVacant!7303 (index!31583 (_ BitVec 32))) )
))
(declare-fun lt!323388 () SeekEntryResult!7303)

(declare-fun e!408575 () Bool)

(declare-fun b!730117 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41172 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!730117 (= e!408575 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323388))))

(declare-fun b!730118 () Bool)

(declare-fun res!490566 () Bool)

(assert (=> b!730118 (=> (not res!490566) (not e!408572))))

(declare-datatypes ((List!13747 0))(
  ( (Nil!13744) (Cons!13743 (h!14803 (_ BitVec 64)) (t!20053 List!13747)) )
))
(declare-fun arrayNoDuplicates!0 (array!41172 (_ BitVec 32) List!13747) Bool)

(assert (=> b!730118 (= res!490566 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13744))))

(declare-fun res!490563 () Bool)

(assert (=> start!64706 (=> (not res!490563) (not e!408573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64706 (= res!490563 (validMask!0 mask!3328))))

(assert (=> start!64706 e!408573))

(assert (=> start!64706 true))

(declare-fun array_inv!15589 (array!41172) Bool)

(assert (=> start!64706 (array_inv!15589 a!3186)))

(declare-fun b!730119 () Bool)

(declare-fun res!490553 () Bool)

(assert (=> b!730119 (=> (not res!490553) (not e!408574))))

(assert (=> b!730119 (= res!490553 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19706 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730120 () Bool)

(declare-fun e!408570 () Bool)

(assert (=> b!730120 (= e!408570 e!408575)))

(declare-fun res!490557 () Bool)

(assert (=> b!730120 (=> (not res!490557) (not e!408575))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41172 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!730120 (= res!490557 (= (seekEntryOrOpen!0 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323388))))

(assert (=> b!730120 (= lt!323388 (Found!7303 j!159))))

(declare-fun b!730121 () Bool)

(declare-fun e!408569 () Bool)

(assert (=> b!730121 (= e!408574 e!408569)))

(declare-fun res!490556 () Bool)

(assert (=> b!730121 (=> (not res!490556) (not e!408569))))

(declare-fun lt!323387 () SeekEntryResult!7303)

(declare-fun lt!323389 () SeekEntryResult!7303)

(assert (=> b!730121 (= res!490556 (= lt!323387 lt!323389))))

(declare-fun lt!323382 () array!41172)

(declare-fun lt!323383 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41172 (_ BitVec 32)) SeekEntryResult!7303)

(assert (=> b!730121 (= lt!323389 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323383 lt!323382 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730121 (= lt!323387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323383 mask!3328) lt!323383 lt!323382 mask!3328))))

(assert (=> b!730121 (= lt!323383 (select (store (arr!19706 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730121 (= lt!323382 (array!41173 (store (arr!19706 a!3186) i!1173 k0!2102) (size!20127 a!3186)))))

(declare-fun b!730122 () Bool)

(declare-fun lt!323386 () SeekEntryResult!7303)

(assert (=> b!730122 (= e!408577 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323386))))

(declare-fun b!730123 () Bool)

(assert (=> b!730123 (= e!408572 e!408574)))

(declare-fun res!490555 () Bool)

(assert (=> b!730123 (=> (not res!490555) (not e!408574))))

(assert (=> b!730123 (= res!490555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19706 a!3186) j!159) mask!3328) (select (arr!19706 a!3186) j!159) a!3186 mask!3328) lt!323386))))

(assert (=> b!730123 (= lt!323386 (Intermediate!7303 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730124 () Bool)

(declare-fun res!490552 () Bool)

(assert (=> b!730124 (=> (not res!490552) (not e!408573))))

(assert (=> b!730124 (= res!490552 (validKeyInArray!0 (select (arr!19706 a!3186) j!159)))))

(declare-fun b!730125 () Bool)

(assert (=> b!730125 (= e!408577 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19706 a!3186) j!159) a!3186 mask!3328) (Found!7303 j!159)))))

(declare-fun b!730126 () Bool)

(assert (=> b!730126 (= e!408569 (not e!408571))))

(declare-fun res!490565 () Bool)

(assert (=> b!730126 (=> res!490565 e!408571)))

(get-info :version)

(assert (=> b!730126 (= res!490565 (or (not ((_ is Intermediate!7303) lt!323389)) (bvsge x!1131 (x!62568 lt!323389))))))

(assert (=> b!730126 e!408570))

(declare-fun res!490558 () Bool)

(assert (=> b!730126 (=> (not res!490558) (not e!408570))))

(assert (=> b!730126 (= res!490558 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24896 0))(
  ( (Unit!24897) )
))
(declare-fun lt!323384 () Unit!24896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41172 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24896)

(assert (=> b!730126 (= lt!323384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730127 () Bool)

(assert (=> b!730127 (= e!408573 e!408572)))

(declare-fun res!490564 () Bool)

(assert (=> b!730127 (=> (not res!490564) (not e!408572))))

(declare-fun lt!323390 () SeekEntryResult!7303)

(assert (=> b!730127 (= res!490564 (or (= lt!323390 (MissingZero!7303 i!1173)) (= lt!323390 (MissingVacant!7303 i!1173))))))

(assert (=> b!730127 (= lt!323390 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64706 res!490563) b!730116))

(assert (= (and b!730116 res!490561) b!730124))

(assert (= (and b!730124 res!490552) b!730115))

(assert (= (and b!730115 res!490559) b!730114))

(assert (= (and b!730114 res!490554) b!730127))

(assert (= (and b!730127 res!490564) b!730110))

(assert (= (and b!730110 res!490551) b!730118))

(assert (= (and b!730118 res!490566) b!730111))

(assert (= (and b!730111 res!490560) b!730123))

(assert (= (and b!730123 res!490555) b!730119))

(assert (= (and b!730119 res!490553) b!730113))

(assert (= (and b!730113 c!80154) b!730122))

(assert (= (and b!730113 (not c!80154)) b!730125))

(assert (= (and b!730113 res!490562) b!730121))

(assert (= (and b!730121 res!490556) b!730126))

(assert (= (and b!730126 res!490558) b!730120))

(assert (= (and b!730120 res!490557) b!730117))

(assert (= (and b!730126 (not res!490565)) b!730112))

(declare-fun m!683141 () Bool)

(assert (=> start!64706 m!683141))

(declare-fun m!683143 () Bool)

(assert (=> start!64706 m!683143))

(declare-fun m!683145 () Bool)

(assert (=> b!730118 m!683145))

(declare-fun m!683147 () Bool)

(assert (=> b!730123 m!683147))

(assert (=> b!730123 m!683147))

(declare-fun m!683149 () Bool)

(assert (=> b!730123 m!683149))

(assert (=> b!730123 m!683149))

(assert (=> b!730123 m!683147))

(declare-fun m!683151 () Bool)

(assert (=> b!730123 m!683151))

(declare-fun m!683153 () Bool)

(assert (=> b!730112 m!683153))

(declare-fun m!683155 () Bool)

(assert (=> b!730115 m!683155))

(assert (=> b!730120 m!683147))

(assert (=> b!730120 m!683147))

(declare-fun m!683157 () Bool)

(assert (=> b!730120 m!683157))

(assert (=> b!730117 m!683147))

(assert (=> b!730117 m!683147))

(declare-fun m!683159 () Bool)

(assert (=> b!730117 m!683159))

(declare-fun m!683161 () Bool)

(assert (=> b!730114 m!683161))

(declare-fun m!683163 () Bool)

(assert (=> b!730127 m!683163))

(assert (=> b!730122 m!683147))

(assert (=> b!730122 m!683147))

(declare-fun m!683165 () Bool)

(assert (=> b!730122 m!683165))

(declare-fun m!683167 () Bool)

(assert (=> b!730110 m!683167))

(assert (=> b!730125 m!683147))

(assert (=> b!730125 m!683147))

(declare-fun m!683169 () Bool)

(assert (=> b!730125 m!683169))

(declare-fun m!683171 () Bool)

(assert (=> b!730121 m!683171))

(declare-fun m!683173 () Bool)

(assert (=> b!730121 m!683173))

(declare-fun m!683175 () Bool)

(assert (=> b!730121 m!683175))

(assert (=> b!730121 m!683171))

(declare-fun m!683177 () Bool)

(assert (=> b!730121 m!683177))

(declare-fun m!683179 () Bool)

(assert (=> b!730121 m!683179))

(assert (=> b!730124 m!683147))

(assert (=> b!730124 m!683147))

(declare-fun m!683181 () Bool)

(assert (=> b!730124 m!683181))

(declare-fun m!683183 () Bool)

(assert (=> b!730126 m!683183))

(declare-fun m!683185 () Bool)

(assert (=> b!730126 m!683185))

(declare-fun m!683187 () Bool)

(assert (=> b!730119 m!683187))

(check-sat (not b!730114) (not b!730126) (not b!730127) (not b!730123) (not b!730122) (not b!730120) (not b!730118) (not b!730125) (not b!730112) (not b!730115) (not b!730117) (not b!730121) (not b!730110) (not b!730124) (not start!64706))
(check-sat)
