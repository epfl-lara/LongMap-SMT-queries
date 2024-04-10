; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64364 () Bool)

(assert start!64364)

(declare-datatypes ((array!40945 0))(
  ( (array!40946 (arr!19595 (Array (_ BitVec 32) (_ BitVec 64))) (size!20016 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40945)

(declare-fun b!723705 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!405416 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7195 0))(
  ( (MissingZero!7195 (index!31148 (_ BitVec 32))) (Found!7195 (index!31149 (_ BitVec 32))) (Intermediate!7195 (undefined!8007 Bool) (index!31150 (_ BitVec 32)) (x!62140 (_ BitVec 32))) (Undefined!7195) (MissingVacant!7195 (index!31151 (_ BitVec 32))) )
))
(declare-fun lt!320755 () SeekEntryResult!7195)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40945 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723705 (= e!405416 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) lt!320755))))

(declare-fun b!723706 () Bool)

(declare-fun res!485253 () Bool)

(declare-fun e!405418 () Bool)

(assert (=> b!723706 (=> (not res!485253) (not e!405418))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723706 (= res!485253 (validKeyInArray!0 k!2102))))

(declare-fun b!723707 () Bool)

(declare-fun res!485249 () Bool)

(assert (=> b!723707 (=> (not res!485249) (not e!405418))))

(assert (=> b!723707 (= res!485249 (validKeyInArray!0 (select (arr!19595 a!3186) j!159)))))

(declare-fun b!723708 () Bool)

(declare-fun e!405417 () Bool)

(declare-fun e!405413 () Bool)

(assert (=> b!723708 (= e!405417 e!405413)))

(declare-fun res!485248 () Bool)

(assert (=> b!723708 (=> (not res!485248) (not e!405413))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723708 (= res!485248 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19595 a!3186) j!159) mask!3328) (select (arr!19595 a!3186) j!159) a!3186 mask!3328) lt!320755))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723708 (= lt!320755 (Intermediate!7195 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723709 () Bool)

(declare-fun res!485242 () Bool)

(assert (=> b!723709 (=> (not res!485242) (not e!405417))))

(assert (=> b!723709 (= res!485242 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20016 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20016 a!3186))))))

(declare-fun b!723710 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40945 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723710 (= e!405416 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) (Found!7195 j!159)))))

(declare-fun b!723711 () Bool)

(declare-fun res!485255 () Bool)

(assert (=> b!723711 (=> (not res!485255) (not e!405418))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723711 (= res!485255 (and (= (size!20016 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20016 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20016 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723712 () Bool)

(declare-fun res!485245 () Bool)

(assert (=> b!723712 (=> (not res!485245) (not e!405418))))

(declare-fun arrayContainsKey!0 (array!40945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723712 (= res!485245 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723713 () Bool)

(declare-fun e!405414 () Bool)

(assert (=> b!723713 (= e!405414 (not true))))

(declare-fun e!405419 () Bool)

(assert (=> b!723713 e!405419))

(declare-fun res!485250 () Bool)

(assert (=> b!723713 (=> (not res!485250) (not e!405419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40945 (_ BitVec 32)) Bool)

(assert (=> b!723713 (= res!485250 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24708 0))(
  ( (Unit!24709) )
))
(declare-fun lt!320756 () Unit!24708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24708)

(assert (=> b!723713 (= lt!320756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723714 () Bool)

(declare-fun res!485252 () Bool)

(assert (=> b!723714 (=> (not res!485252) (not e!405417))))

(declare-datatypes ((List!13597 0))(
  ( (Nil!13594) (Cons!13593 (h!14647 (_ BitVec 64)) (t!19912 List!13597)) )
))
(declare-fun arrayNoDuplicates!0 (array!40945 (_ BitVec 32) List!13597) Bool)

(assert (=> b!723714 (= res!485252 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13594))))

(declare-fun b!723715 () Bool)

(assert (=> b!723715 (= e!405418 e!405417)))

(declare-fun res!485244 () Bool)

(assert (=> b!723715 (=> (not res!485244) (not e!405417))))

(declare-fun lt!320758 () SeekEntryResult!7195)

(assert (=> b!723715 (= res!485244 (or (= lt!320758 (MissingZero!7195 i!1173)) (= lt!320758 (MissingVacant!7195 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40945 (_ BitVec 32)) SeekEntryResult!7195)

(assert (=> b!723715 (= lt!320758 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!485254 () Bool)

(assert (=> start!64364 (=> (not res!485254) (not e!405418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64364 (= res!485254 (validMask!0 mask!3328))))

(assert (=> start!64364 e!405418))

(assert (=> start!64364 true))

(declare-fun array_inv!15391 (array!40945) Bool)

(assert (=> start!64364 (array_inv!15391 a!3186)))

(declare-fun b!723716 () Bool)

(assert (=> b!723716 (= e!405419 (= (seekEntryOrOpen!0 (select (arr!19595 a!3186) j!159) a!3186 mask!3328) (Found!7195 j!159)))))

(declare-fun b!723717 () Bool)

(declare-fun res!485246 () Bool)

(assert (=> b!723717 (=> (not res!485246) (not e!405413))))

(assert (=> b!723717 (= res!485246 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19595 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723718 () Bool)

(declare-fun res!485243 () Bool)

(assert (=> b!723718 (=> (not res!485243) (not e!405413))))

(assert (=> b!723718 (= res!485243 e!405416)))

(declare-fun c!79603 () Bool)

(assert (=> b!723718 (= c!79603 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723719 () Bool)

(assert (=> b!723719 (= e!405413 e!405414)))

(declare-fun res!485251 () Bool)

(assert (=> b!723719 (=> (not res!485251) (not e!405414))))

(declare-fun lt!320757 () (_ BitVec 64))

(declare-fun lt!320759 () array!40945)

(assert (=> b!723719 (= res!485251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320757 mask!3328) lt!320757 lt!320759 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320757 lt!320759 mask!3328)))))

(assert (=> b!723719 (= lt!320757 (select (store (arr!19595 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723719 (= lt!320759 (array!40946 (store (arr!19595 a!3186) i!1173 k!2102) (size!20016 a!3186)))))

(declare-fun b!723720 () Bool)

(declare-fun res!485247 () Bool)

(assert (=> b!723720 (=> (not res!485247) (not e!405417))))

(assert (=> b!723720 (= res!485247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64364 res!485254) b!723711))

(assert (= (and b!723711 res!485255) b!723707))

(assert (= (and b!723707 res!485249) b!723706))

(assert (= (and b!723706 res!485253) b!723712))

(assert (= (and b!723712 res!485245) b!723715))

(assert (= (and b!723715 res!485244) b!723720))

(assert (= (and b!723720 res!485247) b!723714))

(assert (= (and b!723714 res!485252) b!723709))

(assert (= (and b!723709 res!485242) b!723708))

(assert (= (and b!723708 res!485248) b!723717))

(assert (= (and b!723717 res!485246) b!723718))

(assert (= (and b!723718 c!79603) b!723705))

(assert (= (and b!723718 (not c!79603)) b!723710))

(assert (= (and b!723718 res!485243) b!723719))

(assert (= (and b!723719 res!485251) b!723713))

(assert (= (and b!723713 res!485250) b!723716))

(declare-fun m!678125 () Bool)

(assert (=> b!723705 m!678125))

(assert (=> b!723705 m!678125))

(declare-fun m!678127 () Bool)

(assert (=> b!723705 m!678127))

(assert (=> b!723707 m!678125))

(assert (=> b!723707 m!678125))

(declare-fun m!678129 () Bool)

(assert (=> b!723707 m!678129))

(declare-fun m!678131 () Bool)

(assert (=> b!723715 m!678131))

(declare-fun m!678133 () Bool)

(assert (=> b!723713 m!678133))

(declare-fun m!678135 () Bool)

(assert (=> b!723713 m!678135))

(declare-fun m!678137 () Bool)

(assert (=> b!723717 m!678137))

(declare-fun m!678139 () Bool)

(assert (=> b!723714 m!678139))

(assert (=> b!723716 m!678125))

(assert (=> b!723716 m!678125))

(declare-fun m!678141 () Bool)

(assert (=> b!723716 m!678141))

(declare-fun m!678143 () Bool)

(assert (=> b!723719 m!678143))

(declare-fun m!678145 () Bool)

(assert (=> b!723719 m!678145))

(declare-fun m!678147 () Bool)

(assert (=> b!723719 m!678147))

(declare-fun m!678149 () Bool)

(assert (=> b!723719 m!678149))

(assert (=> b!723719 m!678143))

(declare-fun m!678151 () Bool)

(assert (=> b!723719 m!678151))

(assert (=> b!723708 m!678125))

(assert (=> b!723708 m!678125))

(declare-fun m!678153 () Bool)

(assert (=> b!723708 m!678153))

(assert (=> b!723708 m!678153))

(assert (=> b!723708 m!678125))

(declare-fun m!678155 () Bool)

(assert (=> b!723708 m!678155))

(assert (=> b!723710 m!678125))

(assert (=> b!723710 m!678125))

(declare-fun m!678157 () Bool)

(assert (=> b!723710 m!678157))

(declare-fun m!678159 () Bool)

(assert (=> start!64364 m!678159))

(declare-fun m!678161 () Bool)

(assert (=> start!64364 m!678161))

(declare-fun m!678163 () Bool)

(assert (=> b!723712 m!678163))

(declare-fun m!678165 () Bool)

(assert (=> b!723720 m!678165))

(declare-fun m!678167 () Bool)

(assert (=> b!723706 m!678167))

(push 1)

