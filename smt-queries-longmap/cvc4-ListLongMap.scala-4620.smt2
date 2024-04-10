; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64358 () Bool)

(assert start!64358)

(declare-fun b!723562 () Bool)

(declare-fun e!405352 () Bool)

(declare-fun e!405351 () Bool)

(assert (=> b!723562 (= e!405352 e!405351)))

(declare-fun res!485124 () Bool)

(assert (=> b!723562 (=> (not res!485124) (not e!405351))))

(declare-datatypes ((array!40939 0))(
  ( (array!40940 (arr!19592 (Array (_ BitVec 32) (_ BitVec 64))) (size!20013 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40939)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7192 0))(
  ( (MissingZero!7192 (index!31136 (_ BitVec 32))) (Found!7192 (index!31137 (_ BitVec 32))) (Intermediate!7192 (undefined!8004 Bool) (index!31138 (_ BitVec 32)) (x!62129 (_ BitVec 32))) (Undefined!7192) (MissingVacant!7192 (index!31139 (_ BitVec 32))) )
))
(declare-fun lt!320710 () SeekEntryResult!7192)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40939 (_ BitVec 32)) SeekEntryResult!7192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723562 (= res!485124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19592 a!3186) j!159) mask!3328) (select (arr!19592 a!3186) j!159) a!3186 mask!3328) lt!320710))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723562 (= lt!320710 (Intermediate!7192 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723563 () Bool)

(declare-fun res!485128 () Bool)

(assert (=> b!723563 (=> (not res!485128) (not e!405352))))

(declare-datatypes ((List!13594 0))(
  ( (Nil!13591) (Cons!13590 (h!14644 (_ BitVec 64)) (t!19909 List!13594)) )
))
(declare-fun arrayNoDuplicates!0 (array!40939 (_ BitVec 32) List!13594) Bool)

(assert (=> b!723563 (= res!485128 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13591))))

(declare-fun b!723564 () Bool)

(declare-fun res!485126 () Bool)

(assert (=> b!723564 (=> (not res!485126) (not e!405352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40939 (_ BitVec 32)) Bool)

(assert (=> b!723564 (= res!485126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723565 () Bool)

(declare-fun res!485117 () Bool)

(assert (=> b!723565 (=> (not res!485117) (not e!405351))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723565 (= res!485117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19592 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!405354 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!723566 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!723566 (= e!405354 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19592 a!3186) j!159) a!3186 mask!3328) lt!320710))))

(declare-fun res!485120 () Bool)

(declare-fun e!405355 () Bool)

(assert (=> start!64358 (=> (not res!485120) (not e!405355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64358 (= res!485120 (validMask!0 mask!3328))))

(assert (=> start!64358 e!405355))

(assert (=> start!64358 true))

(declare-fun array_inv!15388 (array!40939) Bool)

(assert (=> start!64358 (array_inv!15388 a!3186)))

(declare-fun b!723567 () Bool)

(declare-fun res!485127 () Bool)

(assert (=> b!723567 (=> (not res!485127) (not e!405355))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723567 (= res!485127 (validKeyInArray!0 k!2102))))

(declare-fun b!723568 () Bool)

(assert (=> b!723568 (= e!405355 e!405352)))

(declare-fun res!485129 () Bool)

(assert (=> b!723568 (=> (not res!485129) (not e!405352))))

(declare-fun lt!320713 () SeekEntryResult!7192)

(assert (=> b!723568 (= res!485129 (or (= lt!320713 (MissingZero!7192 i!1173)) (= lt!320713 (MissingVacant!7192 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40939 (_ BitVec 32)) SeekEntryResult!7192)

(assert (=> b!723568 (= lt!320713 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!723569 () Bool)

(declare-fun res!485119 () Bool)

(assert (=> b!723569 (=> (not res!485119) (not e!405352))))

(assert (=> b!723569 (= res!485119 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20013 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20013 a!3186))))))

(declare-fun b!723570 () Bool)

(declare-fun res!485123 () Bool)

(assert (=> b!723570 (=> (not res!485123) (not e!405351))))

(assert (=> b!723570 (= res!485123 e!405354)))

(declare-fun c!79594 () Bool)

(assert (=> b!723570 (= c!79594 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723571 () Bool)

(declare-fun e!405356 () Bool)

(assert (=> b!723571 (= e!405351 e!405356)))

(declare-fun res!485125 () Bool)

(assert (=> b!723571 (=> (not res!485125) (not e!405356))))

(declare-fun lt!320711 () (_ BitVec 64))

(declare-fun lt!320714 () array!40939)

(assert (=> b!723571 (= res!485125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320711 mask!3328) lt!320711 lt!320714 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320711 lt!320714 mask!3328)))))

(assert (=> b!723571 (= lt!320711 (select (store (arr!19592 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723571 (= lt!320714 (array!40940 (store (arr!19592 a!3186) i!1173 k!2102) (size!20013 a!3186)))))

(declare-fun b!723572 () Bool)

(declare-fun res!485122 () Bool)

(assert (=> b!723572 (=> (not res!485122) (not e!405355))))

(declare-fun arrayContainsKey!0 (array!40939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723572 (= res!485122 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723573 () Bool)

(declare-fun res!485118 () Bool)

(assert (=> b!723573 (=> (not res!485118) (not e!405355))))

(assert (=> b!723573 (= res!485118 (and (= (size!20013 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20013 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20013 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723574 () Bool)

(assert (=> b!723574 (= e!405356 (not true))))

(assert (=> b!723574 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24702 0))(
  ( (Unit!24703) )
))
(declare-fun lt!320712 () Unit!24702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24702)

(assert (=> b!723574 (= lt!320712 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723575 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40939 (_ BitVec 32)) SeekEntryResult!7192)

(assert (=> b!723575 (= e!405354 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19592 a!3186) j!159) a!3186 mask!3328) (Found!7192 j!159)))))

(declare-fun b!723576 () Bool)

(declare-fun res!485121 () Bool)

(assert (=> b!723576 (=> (not res!485121) (not e!405355))))

(assert (=> b!723576 (= res!485121 (validKeyInArray!0 (select (arr!19592 a!3186) j!159)))))

(assert (= (and start!64358 res!485120) b!723573))

(assert (= (and b!723573 res!485118) b!723576))

(assert (= (and b!723576 res!485121) b!723567))

(assert (= (and b!723567 res!485127) b!723572))

(assert (= (and b!723572 res!485122) b!723568))

(assert (= (and b!723568 res!485129) b!723564))

(assert (= (and b!723564 res!485126) b!723563))

(assert (= (and b!723563 res!485128) b!723569))

(assert (= (and b!723569 res!485119) b!723562))

(assert (= (and b!723562 res!485124) b!723565))

(assert (= (and b!723565 res!485117) b!723570))

(assert (= (and b!723570 c!79594) b!723566))

(assert (= (and b!723570 (not c!79594)) b!723575))

(assert (= (and b!723570 res!485123) b!723571))

(assert (= (and b!723571 res!485125) b!723574))

(declare-fun m!677995 () Bool)

(assert (=> b!723567 m!677995))

(declare-fun m!677997 () Bool)

(assert (=> b!723565 m!677997))

(declare-fun m!677999 () Bool)

(assert (=> b!723576 m!677999))

(assert (=> b!723576 m!677999))

(declare-fun m!678001 () Bool)

(assert (=> b!723576 m!678001))

(declare-fun m!678003 () Bool)

(assert (=> b!723568 m!678003))

(declare-fun m!678005 () Bool)

(assert (=> b!723564 m!678005))

(declare-fun m!678007 () Bool)

(assert (=> b!723572 m!678007))

(assert (=> b!723562 m!677999))

(assert (=> b!723562 m!677999))

(declare-fun m!678009 () Bool)

(assert (=> b!723562 m!678009))

(assert (=> b!723562 m!678009))

(assert (=> b!723562 m!677999))

(declare-fun m!678011 () Bool)

(assert (=> b!723562 m!678011))

(assert (=> b!723575 m!677999))

(assert (=> b!723575 m!677999))

(declare-fun m!678013 () Bool)

(assert (=> b!723575 m!678013))

(declare-fun m!678015 () Bool)

(assert (=> b!723571 m!678015))

(declare-fun m!678017 () Bool)

(assert (=> b!723571 m!678017))

(declare-fun m!678019 () Bool)

(assert (=> b!723571 m!678019))

(assert (=> b!723571 m!678015))

(declare-fun m!678021 () Bool)

(assert (=> b!723571 m!678021))

(declare-fun m!678023 () Bool)

(assert (=> b!723571 m!678023))

(declare-fun m!678025 () Bool)

(assert (=> b!723574 m!678025))

(declare-fun m!678027 () Bool)

(assert (=> b!723574 m!678027))

(declare-fun m!678029 () Bool)

(assert (=> b!723563 m!678029))

(declare-fun m!678031 () Bool)

(assert (=> start!64358 m!678031))

(declare-fun m!678033 () Bool)

(assert (=> start!64358 m!678033))

(assert (=> b!723566 m!677999))

(assert (=> b!723566 m!677999))

(declare-fun m!678035 () Bool)

(assert (=> b!723566 m!678035))

(push 1)

