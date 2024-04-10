; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66276 () Bool)

(assert start!66276)

(declare-fun b!763708 () Bool)

(declare-fun res!516645 () Bool)

(declare-fun e!425467 () Bool)

(assert (=> b!763708 (=> (not res!516645) (not e!425467))))

(declare-fun e!425469 () Bool)

(assert (=> b!763708 (= res!516645 e!425469)))

(declare-fun c!83920 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763708 (= c!83920 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763709 () Bool)

(declare-fun res!516650 () Bool)

(declare-fun e!425468 () Bool)

(assert (=> b!763709 (=> (not res!516650) (not e!425468))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42181 0))(
  ( (array!42182 (arr!20198 (Array (_ BitVec 32) (_ BitVec 64))) (size!20619 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42181)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763709 (= res!516650 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20619 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20619 a!3186))))))

(declare-fun b!763710 () Bool)

(declare-fun e!425466 () Bool)

(assert (=> b!763710 (= e!425466 e!425468)))

(declare-fun res!516642 () Bool)

(assert (=> b!763710 (=> (not res!516642) (not e!425468))))

(declare-datatypes ((SeekEntryResult!7798 0))(
  ( (MissingZero!7798 (index!33560 (_ BitVec 32))) (Found!7798 (index!33561 (_ BitVec 32))) (Intermediate!7798 (undefined!8610 Bool) (index!33562 (_ BitVec 32)) (x!64458 (_ BitVec 32))) (Undefined!7798) (MissingVacant!7798 (index!33563 (_ BitVec 32))) )
))
(declare-fun lt!339911 () SeekEntryResult!7798)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763710 (= res!516642 (or (= lt!339911 (MissingZero!7798 i!1173)) (= lt!339911 (MissingVacant!7798 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!763710 (= lt!339911 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!339908 () SeekEntryResult!7798)

(declare-fun b!763711 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!763711 (= e!425469 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20198 a!3186) j!159) a!3186 mask!3328) lt!339908))))

(declare-fun b!763712 () Bool)

(declare-fun res!516644 () Bool)

(assert (=> b!763712 (=> (not res!516644) (not e!425466))))

(declare-fun arrayContainsKey!0 (array!42181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763712 (= res!516644 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763713 () Bool)

(assert (=> b!763713 (= e!425468 e!425467)))

(declare-fun res!516652 () Bool)

(assert (=> b!763713 (=> (not res!516652) (not e!425467))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763713 (= res!516652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20198 a!3186) j!159) mask!3328) (select (arr!20198 a!3186) j!159) a!3186 mask!3328) lt!339908))))

(assert (=> b!763713 (= lt!339908 (Intermediate!7798 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763714 () Bool)

(declare-fun res!516651 () Bool)

(assert (=> b!763714 (=> (not res!516651) (not e!425468))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42181 (_ BitVec 32)) Bool)

(assert (=> b!763714 (= res!516651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!516649 () Bool)

(assert (=> start!66276 (=> (not res!516649) (not e!425466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66276 (= res!516649 (validMask!0 mask!3328))))

(assert (=> start!66276 e!425466))

(assert (=> start!66276 true))

(declare-fun array_inv!15994 (array!42181) Bool)

(assert (=> start!66276 (array_inv!15994 a!3186)))

(declare-fun b!763715 () Bool)

(declare-fun res!516643 () Bool)

(assert (=> b!763715 (=> (not res!516643) (not e!425468))))

(declare-datatypes ((List!14200 0))(
  ( (Nil!14197) (Cons!14196 (h!15280 (_ BitVec 64)) (t!20515 List!14200)) )
))
(declare-fun arrayNoDuplicates!0 (array!42181 (_ BitVec 32) List!14200) Bool)

(assert (=> b!763715 (= res!516643 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14197))))

(declare-fun b!763716 () Bool)

(assert (=> b!763716 (= e!425467 false)))

(declare-fun lt!339907 () SeekEntryResult!7798)

(declare-fun lt!339910 () array!42181)

(declare-fun lt!339906 () (_ BitVec 64))

(assert (=> b!763716 (= lt!339907 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339906 lt!339910 mask!3328))))

(declare-fun lt!339909 () SeekEntryResult!7798)

(assert (=> b!763716 (= lt!339909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339906 mask!3328) lt!339906 lt!339910 mask!3328))))

(assert (=> b!763716 (= lt!339906 (select (store (arr!20198 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763716 (= lt!339910 (array!42182 (store (arr!20198 a!3186) i!1173 k!2102) (size!20619 a!3186)))))

(declare-fun b!763717 () Bool)

(declare-fun res!516646 () Bool)

(assert (=> b!763717 (=> (not res!516646) (not e!425466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763717 (= res!516646 (validKeyInArray!0 k!2102))))

(declare-fun b!763718 () Bool)

(declare-fun res!516641 () Bool)

(assert (=> b!763718 (=> (not res!516641) (not e!425466))))

(assert (=> b!763718 (= res!516641 (and (= (size!20619 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20619 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20619 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763719 () Bool)

(declare-fun res!516647 () Bool)

(assert (=> b!763719 (=> (not res!516647) (not e!425466))))

(assert (=> b!763719 (= res!516647 (validKeyInArray!0 (select (arr!20198 a!3186) j!159)))))

(declare-fun b!763720 () Bool)

(declare-fun res!516648 () Bool)

(assert (=> b!763720 (=> (not res!516648) (not e!425467))))

(assert (=> b!763720 (= res!516648 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20198 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763721 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42181 (_ BitVec 32)) SeekEntryResult!7798)

(assert (=> b!763721 (= e!425469 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20198 a!3186) j!159) a!3186 mask!3328) (Found!7798 j!159)))))

(assert (= (and start!66276 res!516649) b!763718))

(assert (= (and b!763718 res!516641) b!763719))

(assert (= (and b!763719 res!516647) b!763717))

(assert (= (and b!763717 res!516646) b!763712))

(assert (= (and b!763712 res!516644) b!763710))

(assert (= (and b!763710 res!516642) b!763714))

(assert (= (and b!763714 res!516651) b!763715))

(assert (= (and b!763715 res!516643) b!763709))

(assert (= (and b!763709 res!516650) b!763713))

(assert (= (and b!763713 res!516652) b!763720))

(assert (= (and b!763720 res!516648) b!763708))

(assert (= (and b!763708 c!83920) b!763711))

(assert (= (and b!763708 (not c!83920)) b!763721))

(assert (= (and b!763708 res!516645) b!763716))

(declare-fun m!710161 () Bool)

(assert (=> b!763710 m!710161))

(declare-fun m!710163 () Bool)

(assert (=> b!763712 m!710163))

(declare-fun m!710165 () Bool)

(assert (=> b!763713 m!710165))

(assert (=> b!763713 m!710165))

(declare-fun m!710167 () Bool)

(assert (=> b!763713 m!710167))

(assert (=> b!763713 m!710167))

(assert (=> b!763713 m!710165))

(declare-fun m!710169 () Bool)

(assert (=> b!763713 m!710169))

(declare-fun m!710171 () Bool)

(assert (=> b!763715 m!710171))

(declare-fun m!710173 () Bool)

(assert (=> b!763714 m!710173))

(assert (=> b!763711 m!710165))

(assert (=> b!763711 m!710165))

(declare-fun m!710175 () Bool)

(assert (=> b!763711 m!710175))

(declare-fun m!710177 () Bool)

(assert (=> b!763720 m!710177))

(declare-fun m!710179 () Bool)

(assert (=> b!763716 m!710179))

(declare-fun m!710181 () Bool)

(assert (=> b!763716 m!710181))

(assert (=> b!763716 m!710179))

(declare-fun m!710183 () Bool)

(assert (=> b!763716 m!710183))

(declare-fun m!710185 () Bool)

(assert (=> b!763716 m!710185))

(declare-fun m!710187 () Bool)

(assert (=> b!763716 m!710187))

(assert (=> b!763721 m!710165))

(assert (=> b!763721 m!710165))

(declare-fun m!710189 () Bool)

(assert (=> b!763721 m!710189))

(declare-fun m!710191 () Bool)

(assert (=> start!66276 m!710191))

(declare-fun m!710193 () Bool)

(assert (=> start!66276 m!710193))

(assert (=> b!763719 m!710165))

(assert (=> b!763719 m!710165))

(declare-fun m!710195 () Bool)

(assert (=> b!763719 m!710195))

(declare-fun m!710197 () Bool)

(assert (=> b!763717 m!710197))

(push 1)

