; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66306 () Bool)

(assert start!66306)

(declare-fun b!764364 () Bool)

(declare-fun e!425719 () Bool)

(declare-fun e!425716 () Bool)

(assert (=> b!764364 (= e!425719 e!425716)))

(declare-fun res!517216 () Bool)

(assert (=> b!764364 (=> (not res!517216) (not e!425716))))

(declare-datatypes ((SeekEntryResult!7813 0))(
  ( (MissingZero!7813 (index!33620 (_ BitVec 32))) (Found!7813 (index!33621 (_ BitVec 32))) (Intermediate!7813 (undefined!8625 Bool) (index!33622 (_ BitVec 32)) (x!64513 (_ BitVec 32))) (Undefined!7813) (MissingVacant!7813 (index!33623 (_ BitVec 32))) )
))
(declare-fun lt!340133 () SeekEntryResult!7813)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764364 (= res!517216 (or (= lt!340133 (MissingZero!7813 i!1173)) (= lt!340133 (MissingVacant!7813 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42211 0))(
  ( (array!42212 (arr!20213 (Array (_ BitVec 32) (_ BitVec 64))) (size!20634 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42211)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!764364 (= lt!340133 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!340134 () SeekEntryResult!7813)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!764365 () Bool)

(declare-fun e!425718 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!764365 (= e!425718 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!340134))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!764366 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42211 (_ BitVec 32)) SeekEntryResult!7813)

(assert (=> b!764366 (= e!425718 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) (Found!7813 j!159)))))

(declare-fun b!764367 () Bool)

(declare-fun res!517217 () Bool)

(assert (=> b!764367 (=> (not res!517217) (not e!425719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764367 (= res!517217 (validKeyInArray!0 k!2102))))

(declare-fun b!764368 () Bool)

(declare-fun res!517208 () Bool)

(assert (=> b!764368 (=> (not res!517208) (not e!425719))))

(assert (=> b!764368 (= res!517208 (validKeyInArray!0 (select (arr!20213 a!3186) j!159)))))

(declare-fun b!764369 () Bool)

(declare-fun res!517211 () Bool)

(declare-fun e!425720 () Bool)

(assert (=> b!764369 (=> (not res!517211) (not e!425720))))

(assert (=> b!764369 (= res!517211 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20213 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764370 () Bool)

(declare-fun res!517219 () Bool)

(assert (=> b!764370 (=> (not res!517219) (not e!425716))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764370 (= res!517219 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20634 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20634 a!3186))))))

(declare-fun b!764371 () Bool)

(declare-fun res!517214 () Bool)

(assert (=> b!764371 (=> (not res!517214) (not e!425719))))

(assert (=> b!764371 (= res!517214 (and (= (size!20634 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20634 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20634 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764372 () Bool)

(declare-fun res!517209 () Bool)

(assert (=> b!764372 (=> (not res!517209) (not e!425720))))

(assert (=> b!764372 (= res!517209 e!425718)))

(declare-fun c!83965 () Bool)

(assert (=> b!764372 (= c!83965 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!517207 () Bool)

(assert (=> start!66306 (=> (not res!517207) (not e!425719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66306 (= res!517207 (validMask!0 mask!3328))))

(assert (=> start!66306 e!425719))

(assert (=> start!66306 true))

(declare-fun array_inv!16009 (array!42211) Bool)

(assert (=> start!66306 (array_inv!16009 a!3186)))

(declare-fun b!764373 () Bool)

(declare-fun e!425721 () Bool)

(assert (=> b!764373 (= e!425720 e!425721)))

(declare-fun res!517218 () Bool)

(assert (=> b!764373 (=> (not res!517218) (not e!425721))))

(declare-fun lt!340135 () array!42211)

(declare-fun lt!340132 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764373 (= res!517218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340132 mask!3328) lt!340132 lt!340135 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340132 lt!340135 mask!3328)))))

(assert (=> b!764373 (= lt!340132 (select (store (arr!20213 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764373 (= lt!340135 (array!42212 (store (arr!20213 a!3186) i!1173 k!2102) (size!20634 a!3186)))))

(declare-fun b!764374 () Bool)

(declare-fun res!517212 () Bool)

(assert (=> b!764374 (=> (not res!517212) (not e!425716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42211 (_ BitVec 32)) Bool)

(assert (=> b!764374 (= res!517212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764375 () Bool)

(assert (=> b!764375 (= e!425716 e!425720)))

(declare-fun res!517213 () Bool)

(assert (=> b!764375 (=> (not res!517213) (not e!425720))))

(assert (=> b!764375 (= res!517213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!340134))))

(assert (=> b!764375 (= lt!340134 (Intermediate!7813 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764376 () Bool)

(assert (=> b!764376 (= e!425721 (not true))))

(assert (=> b!764376 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26352 0))(
  ( (Unit!26353) )
))
(declare-fun lt!340136 () Unit!26352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42211 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26352)

(assert (=> b!764376 (= lt!340136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764377 () Bool)

(declare-fun res!517215 () Bool)

(assert (=> b!764377 (=> (not res!517215) (not e!425719))))

(declare-fun arrayContainsKey!0 (array!42211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764377 (= res!517215 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764378 () Bool)

(declare-fun res!517210 () Bool)

(assert (=> b!764378 (=> (not res!517210) (not e!425716))))

(declare-datatypes ((List!14215 0))(
  ( (Nil!14212) (Cons!14211 (h!15295 (_ BitVec 64)) (t!20530 List!14215)) )
))
(declare-fun arrayNoDuplicates!0 (array!42211 (_ BitVec 32) List!14215) Bool)

(assert (=> b!764378 (= res!517210 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14212))))

(assert (= (and start!66306 res!517207) b!764371))

(assert (= (and b!764371 res!517214) b!764368))

(assert (= (and b!764368 res!517208) b!764367))

(assert (= (and b!764367 res!517217) b!764377))

(assert (= (and b!764377 res!517215) b!764364))

(assert (= (and b!764364 res!517216) b!764374))

(assert (= (and b!764374 res!517212) b!764378))

(assert (= (and b!764378 res!517210) b!764370))

(assert (= (and b!764370 res!517219) b!764375))

(assert (= (and b!764375 res!517213) b!764369))

(assert (= (and b!764369 res!517211) b!764372))

(assert (= (and b!764372 c!83965) b!764365))

(assert (= (and b!764372 (not c!83965)) b!764366))

(assert (= (and b!764372 res!517209) b!764373))

(assert (= (and b!764373 res!517218) b!764376))

(declare-fun m!710739 () Bool)

(assert (=> b!764369 m!710739))

(declare-fun m!710741 () Bool)

(assert (=> b!764364 m!710741))

(declare-fun m!710743 () Bool)

(assert (=> start!66306 m!710743))

(declare-fun m!710745 () Bool)

(assert (=> start!66306 m!710745))

(declare-fun m!710747 () Bool)

(assert (=> b!764365 m!710747))

(assert (=> b!764365 m!710747))

(declare-fun m!710749 () Bool)

(assert (=> b!764365 m!710749))

(declare-fun m!710751 () Bool)

(assert (=> b!764373 m!710751))

(declare-fun m!710753 () Bool)

(assert (=> b!764373 m!710753))

(assert (=> b!764373 m!710751))

(declare-fun m!710755 () Bool)

(assert (=> b!764373 m!710755))

(declare-fun m!710757 () Bool)

(assert (=> b!764373 m!710757))

(declare-fun m!710759 () Bool)

(assert (=> b!764373 m!710759))

(declare-fun m!710761 () Bool)

(assert (=> b!764374 m!710761))

(assert (=> b!764368 m!710747))

(assert (=> b!764368 m!710747))

(declare-fun m!710763 () Bool)

(assert (=> b!764368 m!710763))

(declare-fun m!710765 () Bool)

(assert (=> b!764367 m!710765))

(declare-fun m!710767 () Bool)

(assert (=> b!764377 m!710767))

(assert (=> b!764366 m!710747))

(assert (=> b!764366 m!710747))

(declare-fun m!710769 () Bool)

(assert (=> b!764366 m!710769))

(declare-fun m!710771 () Bool)

(assert (=> b!764376 m!710771))

(declare-fun m!710773 () Bool)

(assert (=> b!764376 m!710773))

(declare-fun m!710775 () Bool)

(assert (=> b!764378 m!710775))

(assert (=> b!764375 m!710747))

(assert (=> b!764375 m!710747))

(declare-fun m!710777 () Bool)

(assert (=> b!764375 m!710777))

(assert (=> b!764375 m!710777))

(assert (=> b!764375 m!710747))

(declare-fun m!710779 () Bool)

(assert (=> b!764375 m!710779))

(push 1)

(assert (not b!764374))

