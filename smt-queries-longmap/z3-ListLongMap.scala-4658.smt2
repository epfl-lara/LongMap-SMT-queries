; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64722 () Bool)

(assert start!64722)

(declare-fun b!730252 () Bool)

(declare-fun e!408677 () Bool)

(declare-fun e!408673 () Bool)

(assert (=> b!730252 (= e!408677 (not e!408673))))

(declare-fun res!490573 () Bool)

(assert (=> b!730252 (=> res!490573 e!408673)))

(declare-datatypes ((SeekEntryResult!7305 0))(
  ( (MissingZero!7305 (index!31588 (_ BitVec 32))) (Found!7305 (index!31589 (_ BitVec 32))) (Intermediate!7305 (undefined!8117 Bool) (index!31590 (_ BitVec 32)) (x!62567 (_ BitVec 32))) (Undefined!7305) (MissingVacant!7305 (index!31591 (_ BitVec 32))) )
))
(declare-fun lt!323572 () SeekEntryResult!7305)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!730252 (= res!490573 (or (not ((_ is Intermediate!7305) lt!323572)) (bvsge x!1131 (x!62567 lt!323572))))))

(declare-fun e!408672 () Bool)

(assert (=> b!730252 e!408672))

(declare-fun res!490572 () Bool)

(assert (=> b!730252 (=> (not res!490572) (not e!408672))))

(declare-datatypes ((array!41171 0))(
  ( (array!41172 (arr!19705 (Array (_ BitVec 32) (_ BitVec 64))) (size!20126 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41171)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41171 (_ BitVec 32)) Bool)

(assert (=> b!730252 (= res!490572 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24928 0))(
  ( (Unit!24929) )
))
(declare-fun lt!323574 () Unit!24928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24928)

(assert (=> b!730252 (= lt!323574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730253 () Bool)

(declare-fun res!490570 () Bool)

(declare-fun e!408669 () Bool)

(assert (=> b!730253 (=> (not res!490570) (not e!408669))))

(declare-datatypes ((List!13707 0))(
  ( (Nil!13704) (Cons!13703 (h!14763 (_ BitVec 64)) (t!20022 List!13707)) )
))
(declare-fun arrayNoDuplicates!0 (array!41171 (_ BitVec 32) List!13707) Bool)

(assert (=> b!730253 (= res!490570 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13704))))

(declare-fun b!730254 () Bool)

(declare-fun res!490577 () Bool)

(declare-fun e!408670 () Bool)

(assert (=> b!730254 (=> (not res!490577) (not e!408670))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730254 (= res!490577 (validKeyInArray!0 k0!2102))))

(declare-fun b!730255 () Bool)

(declare-fun res!490568 () Bool)

(declare-fun e!408674 () Bool)

(assert (=> b!730255 (=> (not res!490568) (not e!408674))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!730255 (= res!490568 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19705 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730256 () Bool)

(declare-fun lt!323569 () SeekEntryResult!7305)

(declare-fun e!408675 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41171 (_ BitVec 32)) SeekEntryResult!7305)

(assert (=> b!730256 (= e!408675 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!323569))))

(declare-fun b!730258 () Bool)

(assert (=> b!730258 (= e!408669 e!408674)))

(declare-fun res!490567 () Bool)

(assert (=> b!730258 (=> (not res!490567) (not e!408674))))

(declare-fun lt!323575 () SeekEntryResult!7305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41171 (_ BitVec 32)) SeekEntryResult!7305)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730258 (= res!490567 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19705 a!3186) j!159) mask!3328) (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!323575))))

(assert (=> b!730258 (= lt!323575 (Intermediate!7305 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730259 () Bool)

(declare-fun res!490575 () Bool)

(assert (=> b!730259 (=> (not res!490575) (not e!408669))))

(assert (=> b!730259 (= res!490575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730260 () Bool)

(assert (=> b!730260 (= e!408672 e!408675)))

(declare-fun res!490578 () Bool)

(assert (=> b!730260 (=> (not res!490578) (not e!408675))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41171 (_ BitVec 32)) SeekEntryResult!7305)

(assert (=> b!730260 (= res!490578 (= (seekEntryOrOpen!0 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!323569))))

(assert (=> b!730260 (= lt!323569 (Found!7305 j!159))))

(declare-fun b!730261 () Bool)

(declare-fun res!490576 () Bool)

(assert (=> b!730261 (=> (not res!490576) (not e!408670))))

(declare-fun arrayContainsKey!0 (array!41171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730261 (= res!490576 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730262 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!408676 () Bool)

(assert (=> b!730262 (= e!408676 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) lt!323575))))

(declare-fun b!730263 () Bool)

(declare-fun res!490565 () Bool)

(assert (=> b!730263 (=> (not res!490565) (not e!408669))))

(assert (=> b!730263 (= res!490565 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20126 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20126 a!3186))))))

(declare-fun b!730264 () Bool)

(assert (=> b!730264 (= e!408676 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19705 a!3186) j!159) a!3186 mask!3328) (Found!7305 j!159)))))

(declare-fun b!730265 () Bool)

(declare-fun res!490569 () Bool)

(assert (=> b!730265 (=> (not res!490569) (not e!408670))))

(assert (=> b!730265 (= res!490569 (and (= (size!20126 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20126 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20126 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730257 () Bool)

(assert (=> b!730257 (= e!408670 e!408669)))

(declare-fun res!490566 () Bool)

(assert (=> b!730257 (=> (not res!490566) (not e!408669))))

(declare-fun lt!323573 () SeekEntryResult!7305)

(assert (=> b!730257 (= res!490566 (or (= lt!323573 (MissingZero!7305 i!1173)) (= lt!323573 (MissingVacant!7305 i!1173))))))

(assert (=> b!730257 (= lt!323573 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!490579 () Bool)

(assert (=> start!64722 (=> (not res!490579) (not e!408670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64722 (= res!490579 (validMask!0 mask!3328))))

(assert (=> start!64722 e!408670))

(assert (=> start!64722 true))

(declare-fun array_inv!15501 (array!41171) Bool)

(assert (=> start!64722 (array_inv!15501 a!3186)))

(declare-fun b!730266 () Bool)

(declare-fun res!490580 () Bool)

(assert (=> b!730266 (=> (not res!490580) (not e!408670))))

(assert (=> b!730266 (= res!490580 (validKeyInArray!0 (select (arr!19705 a!3186) j!159)))))

(declare-fun b!730267 () Bool)

(assert (=> b!730267 (= e!408673 (or (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun lt!323570 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730267 (= lt!323570 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730268 () Bool)

(declare-fun res!490574 () Bool)

(assert (=> b!730268 (=> (not res!490574) (not e!408674))))

(assert (=> b!730268 (= res!490574 e!408676)))

(declare-fun c!80218 () Bool)

(assert (=> b!730268 (= c!80218 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730269 () Bool)

(assert (=> b!730269 (= e!408674 e!408677)))

(declare-fun res!490571 () Bool)

(assert (=> b!730269 (=> (not res!490571) (not e!408677))))

(declare-fun lt!323568 () SeekEntryResult!7305)

(assert (=> b!730269 (= res!490571 (= lt!323568 lt!323572))))

(declare-fun lt!323571 () array!41171)

(declare-fun lt!323576 () (_ BitVec 64))

(assert (=> b!730269 (= lt!323572 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323576 lt!323571 mask!3328))))

(assert (=> b!730269 (= lt!323568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323576 mask!3328) lt!323576 lt!323571 mask!3328))))

(assert (=> b!730269 (= lt!323576 (select (store (arr!19705 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730269 (= lt!323571 (array!41172 (store (arr!19705 a!3186) i!1173 k0!2102) (size!20126 a!3186)))))

(assert (= (and start!64722 res!490579) b!730265))

(assert (= (and b!730265 res!490569) b!730266))

(assert (= (and b!730266 res!490580) b!730254))

(assert (= (and b!730254 res!490577) b!730261))

(assert (= (and b!730261 res!490576) b!730257))

(assert (= (and b!730257 res!490566) b!730259))

(assert (= (and b!730259 res!490575) b!730253))

(assert (= (and b!730253 res!490570) b!730263))

(assert (= (and b!730263 res!490565) b!730258))

(assert (= (and b!730258 res!490567) b!730255))

(assert (= (and b!730255 res!490568) b!730268))

(assert (= (and b!730268 c!80218) b!730262))

(assert (= (and b!730268 (not c!80218)) b!730264))

(assert (= (and b!730268 res!490574) b!730269))

(assert (= (and b!730269 res!490571) b!730252))

(assert (= (and b!730252 res!490572) b!730260))

(assert (= (and b!730260 res!490578) b!730256))

(assert (= (and b!730252 (not res!490573)) b!730267))

(declare-fun m!683803 () Bool)

(assert (=> b!730252 m!683803))

(declare-fun m!683805 () Bool)

(assert (=> b!730252 m!683805))

(declare-fun m!683807 () Bool)

(assert (=> b!730264 m!683807))

(assert (=> b!730264 m!683807))

(declare-fun m!683809 () Bool)

(assert (=> b!730264 m!683809))

(declare-fun m!683811 () Bool)

(assert (=> b!730267 m!683811))

(declare-fun m!683813 () Bool)

(assert (=> b!730255 m!683813))

(declare-fun m!683815 () Bool)

(assert (=> b!730269 m!683815))

(declare-fun m!683817 () Bool)

(assert (=> b!730269 m!683817))

(declare-fun m!683819 () Bool)

(assert (=> b!730269 m!683819))

(declare-fun m!683821 () Bool)

(assert (=> b!730269 m!683821))

(declare-fun m!683823 () Bool)

(assert (=> b!730269 m!683823))

(assert (=> b!730269 m!683821))

(assert (=> b!730256 m!683807))

(assert (=> b!730256 m!683807))

(declare-fun m!683825 () Bool)

(assert (=> b!730256 m!683825))

(assert (=> b!730262 m!683807))

(assert (=> b!730262 m!683807))

(declare-fun m!683827 () Bool)

(assert (=> b!730262 m!683827))

(declare-fun m!683829 () Bool)

(assert (=> b!730253 m!683829))

(declare-fun m!683831 () Bool)

(assert (=> b!730254 m!683831))

(assert (=> b!730266 m!683807))

(assert (=> b!730266 m!683807))

(declare-fun m!683833 () Bool)

(assert (=> b!730266 m!683833))

(declare-fun m!683835 () Bool)

(assert (=> b!730259 m!683835))

(assert (=> b!730260 m!683807))

(assert (=> b!730260 m!683807))

(declare-fun m!683837 () Bool)

(assert (=> b!730260 m!683837))

(declare-fun m!683839 () Bool)

(assert (=> b!730261 m!683839))

(assert (=> b!730258 m!683807))

(assert (=> b!730258 m!683807))

(declare-fun m!683841 () Bool)

(assert (=> b!730258 m!683841))

(assert (=> b!730258 m!683841))

(assert (=> b!730258 m!683807))

(declare-fun m!683843 () Bool)

(assert (=> b!730258 m!683843))

(declare-fun m!683845 () Bool)

(assert (=> start!64722 m!683845))

(declare-fun m!683847 () Bool)

(assert (=> start!64722 m!683847))

(declare-fun m!683849 () Bool)

(assert (=> b!730257 m!683849))

(check-sat (not b!730262) (not b!730258) (not b!730252) (not b!730259) (not b!730267) (not b!730269) (not b!730266) (not b!730264) (not b!730254) (not b!730253) (not b!730257) (not b!730261) (not start!64722) (not b!730260) (not b!730256))
(check-sat)
