; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64818 () Bool)

(assert start!64818)

(declare-fun b!730133 () Bool)

(declare-fun e!408721 () Bool)

(assert (=> b!730133 (= e!408721 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323450 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730133 (= lt!323450 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!730134 () Bool)

(declare-fun res!490102 () Bool)

(declare-fun e!408723 () Bool)

(assert (=> b!730134 (=> (not res!490102) (not e!408723))))

(declare-datatypes ((array!41137 0))(
  ( (array!41138 (arr!19684 (Array (_ BitVec 32) (_ BitVec 64))) (size!20104 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41137)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41137 (_ BitVec 32)) Bool)

(assert (=> b!730134 (= res!490102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!730135 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!408715 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7240 0))(
  ( (MissingZero!7240 (index!31328 (_ BitVec 32))) (Found!7240 (index!31329 (_ BitVec 32))) (Intermediate!7240 (undefined!8052 Bool) (index!31330 (_ BitVec 32)) (x!62474 (_ BitVec 32))) (Undefined!7240) (MissingVacant!7240 (index!31331 (_ BitVec 32))) )
))
(declare-fun lt!323449 () SeekEntryResult!7240)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!730135 (= e!408715 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323449))))

(declare-fun b!730136 () Bool)

(declare-fun e!408716 () Bool)

(assert (=> b!730136 (= e!408716 e!408723)))

(declare-fun res!490103 () Bool)

(assert (=> b!730136 (=> (not res!490103) (not e!408723))))

(declare-fun lt!323451 () SeekEntryResult!7240)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730136 (= res!490103 (or (= lt!323451 (MissingZero!7240 i!1173)) (= lt!323451 (MissingVacant!7240 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!730136 (= lt!323451 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730137 () Bool)

(declare-fun res!490115 () Bool)

(assert (=> b!730137 (=> (not res!490115) (not e!408723))))

(declare-datatypes ((List!13593 0))(
  ( (Nil!13590) (Cons!13589 (h!14655 (_ BitVec 64)) (t!19900 List!13593)) )
))
(declare-fun arrayNoDuplicates!0 (array!41137 (_ BitVec 32) List!13593) Bool)

(assert (=> b!730137 (= res!490115 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13590))))

(declare-fun b!730138 () Bool)

(declare-fun e!408722 () Bool)

(declare-fun e!408720 () Bool)

(assert (=> b!730138 (= e!408722 e!408720)))

(declare-fun res!490109 () Bool)

(assert (=> b!730138 (=> (not res!490109) (not e!408720))))

(declare-fun lt!323453 () SeekEntryResult!7240)

(declare-fun lt!323452 () SeekEntryResult!7240)

(assert (=> b!730138 (= res!490109 (= lt!323453 lt!323452))))

(declare-fun lt!323457 () array!41137)

(declare-fun lt!323454 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41137 (_ BitVec 32)) SeekEntryResult!7240)

(assert (=> b!730138 (= lt!323452 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323454 lt!323457 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730138 (= lt!323453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323454 mask!3328) lt!323454 lt!323457 mask!3328))))

(assert (=> b!730138 (= lt!323454 (select (store (arr!19684 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730138 (= lt!323457 (array!41138 (store (arr!19684 a!3186) i!1173 k0!2102) (size!20104 a!3186)))))

(declare-fun res!490112 () Bool)

(assert (=> start!64818 (=> (not res!490112) (not e!408716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64818 (= res!490112 (validMask!0 mask!3328))))

(assert (=> start!64818 e!408716))

(assert (=> start!64818 true))

(declare-fun array_inv!15543 (array!41137) Bool)

(assert (=> start!64818 (array_inv!15543 a!3186)))

(declare-fun b!730139 () Bool)

(declare-fun res!490105 () Bool)

(assert (=> b!730139 (=> (not res!490105) (not e!408722))))

(assert (=> b!730139 (= res!490105 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19684 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730140 () Bool)

(assert (=> b!730140 (= e!408720 (not e!408721))))

(declare-fun res!490110 () Bool)

(assert (=> b!730140 (=> res!490110 e!408721)))

(get-info :version)

(assert (=> b!730140 (= res!490110 (or (not ((_ is Intermediate!7240) lt!323452)) (bvsge x!1131 (x!62474 lt!323452))))))

(declare-fun e!408719 () Bool)

(assert (=> b!730140 e!408719))

(declare-fun res!490114 () Bool)

(assert (=> b!730140 (=> (not res!490114) (not e!408719))))

(assert (=> b!730140 (= res!490114 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24877 0))(
  ( (Unit!24878) )
))
(declare-fun lt!323455 () Unit!24877)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24877)

(assert (=> b!730140 (= lt!323455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730141 () Bool)

(declare-fun res!490111 () Bool)

(assert (=> b!730141 (=> (not res!490111) (not e!408716))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730141 (= res!490111 (validKeyInArray!0 k0!2102))))

(declare-fun lt!323456 () SeekEntryResult!7240)

(declare-fun b!730142 () Bool)

(declare-fun e!408717 () Bool)

(assert (=> b!730142 (= e!408717 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323456))))

(declare-fun b!730143 () Bool)

(declare-fun res!490116 () Bool)

(assert (=> b!730143 (=> (not res!490116) (not e!408716))))

(assert (=> b!730143 (= res!490116 (validKeyInArray!0 (select (arr!19684 a!3186) j!159)))))

(declare-fun b!730144 () Bool)

(declare-fun res!490117 () Bool)

(assert (=> b!730144 (=> (not res!490117) (not e!408723))))

(assert (=> b!730144 (= res!490117 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20104 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20104 a!3186))))))

(declare-fun b!730145 () Bool)

(declare-fun res!490113 () Bool)

(assert (=> b!730145 (=> (not res!490113) (not e!408716))))

(assert (=> b!730145 (= res!490113 (and (= (size!20104 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20104 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20104 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730146 () Bool)

(assert (=> b!730146 (= e!408717 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) (Found!7240 j!159)))))

(declare-fun b!730147 () Bool)

(assert (=> b!730147 (= e!408719 e!408715)))

(declare-fun res!490104 () Bool)

(assert (=> b!730147 (=> (not res!490104) (not e!408715))))

(assert (=> b!730147 (= res!490104 (= (seekEntryOrOpen!0 (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323449))))

(assert (=> b!730147 (= lt!323449 (Found!7240 j!159))))

(declare-fun b!730148 () Bool)

(declare-fun res!490107 () Bool)

(assert (=> b!730148 (=> (not res!490107) (not e!408716))))

(declare-fun arrayContainsKey!0 (array!41137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730148 (= res!490107 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730149 () Bool)

(declare-fun res!490108 () Bool)

(assert (=> b!730149 (=> (not res!490108) (not e!408722))))

(assert (=> b!730149 (= res!490108 e!408717)))

(declare-fun c!80393 () Bool)

(assert (=> b!730149 (= c!80393 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730150 () Bool)

(assert (=> b!730150 (= e!408723 e!408722)))

(declare-fun res!490106 () Bool)

(assert (=> b!730150 (=> (not res!490106) (not e!408722))))

(assert (=> b!730150 (= res!490106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19684 a!3186) j!159) mask!3328) (select (arr!19684 a!3186) j!159) a!3186 mask!3328) lt!323456))))

(assert (=> b!730150 (= lt!323456 (Intermediate!7240 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64818 res!490112) b!730145))

(assert (= (and b!730145 res!490113) b!730143))

(assert (= (and b!730143 res!490116) b!730141))

(assert (= (and b!730141 res!490111) b!730148))

(assert (= (and b!730148 res!490107) b!730136))

(assert (= (and b!730136 res!490103) b!730134))

(assert (= (and b!730134 res!490102) b!730137))

(assert (= (and b!730137 res!490115) b!730144))

(assert (= (and b!730144 res!490117) b!730150))

(assert (= (and b!730150 res!490106) b!730139))

(assert (= (and b!730139 res!490105) b!730149))

(assert (= (and b!730149 c!80393) b!730142))

(assert (= (and b!730149 (not c!80393)) b!730146))

(assert (= (and b!730149 res!490108) b!730138))

(assert (= (and b!730138 res!490109) b!730140))

(assert (= (and b!730140 res!490114) b!730147))

(assert (= (and b!730147 res!490104) b!730135))

(assert (= (and b!730140 (not res!490110)) b!730133))

(declare-fun m!684171 () Bool)

(assert (=> b!730146 m!684171))

(assert (=> b!730146 m!684171))

(declare-fun m!684173 () Bool)

(assert (=> b!730146 m!684173))

(declare-fun m!684175 () Bool)

(assert (=> b!730133 m!684175))

(declare-fun m!684177 () Bool)

(assert (=> b!730136 m!684177))

(declare-fun m!684179 () Bool)

(assert (=> start!64818 m!684179))

(declare-fun m!684181 () Bool)

(assert (=> start!64818 m!684181))

(declare-fun m!684183 () Bool)

(assert (=> b!730140 m!684183))

(declare-fun m!684185 () Bool)

(assert (=> b!730140 m!684185))

(assert (=> b!730135 m!684171))

(assert (=> b!730135 m!684171))

(declare-fun m!684187 () Bool)

(assert (=> b!730135 m!684187))

(declare-fun m!684189 () Bool)

(assert (=> b!730141 m!684189))

(declare-fun m!684191 () Bool)

(assert (=> b!730137 m!684191))

(declare-fun m!684193 () Bool)

(assert (=> b!730134 m!684193))

(declare-fun m!684195 () Bool)

(assert (=> b!730139 m!684195))

(declare-fun m!684197 () Bool)

(assert (=> b!730138 m!684197))

(declare-fun m!684199 () Bool)

(assert (=> b!730138 m!684199))

(assert (=> b!730138 m!684197))

(declare-fun m!684201 () Bool)

(assert (=> b!730138 m!684201))

(declare-fun m!684203 () Bool)

(assert (=> b!730138 m!684203))

(declare-fun m!684205 () Bool)

(assert (=> b!730138 m!684205))

(assert (=> b!730150 m!684171))

(assert (=> b!730150 m!684171))

(declare-fun m!684207 () Bool)

(assert (=> b!730150 m!684207))

(assert (=> b!730150 m!684207))

(assert (=> b!730150 m!684171))

(declare-fun m!684209 () Bool)

(assert (=> b!730150 m!684209))

(assert (=> b!730147 m!684171))

(assert (=> b!730147 m!684171))

(declare-fun m!684211 () Bool)

(assert (=> b!730147 m!684211))

(declare-fun m!684213 () Bool)

(assert (=> b!730148 m!684213))

(assert (=> b!730143 m!684171))

(assert (=> b!730143 m!684171))

(declare-fun m!684215 () Bool)

(assert (=> b!730143 m!684215))

(assert (=> b!730142 m!684171))

(assert (=> b!730142 m!684171))

(declare-fun m!684217 () Bool)

(assert (=> b!730142 m!684217))

(check-sat (not b!730136) (not b!730141) (not b!730134) (not b!730146) (not b!730143) (not b!730135) (not b!730142) (not b!730133) (not b!730137) (not b!730150) (not b!730138) (not b!730140) (not b!730148) (not b!730147) (not start!64818))
(check-sat)
