; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65882 () Bool)

(assert start!65882)

(declare-fun b!759605 () Bool)

(declare-fun res!514092 () Bool)

(declare-fun e!423446 () Bool)

(assert (=> b!759605 (=> (not res!514092) (not e!423446))))

(declare-datatypes ((array!42055 0))(
  ( (array!42056 (arr!20141 (Array (_ BitVec 32) (_ BitVec 64))) (size!20562 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42055)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759605 (= res!514092 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759606 () Bool)

(declare-fun res!514096 () Bool)

(declare-fun e!423443 () Bool)

(assert (=> b!759606 (=> (not res!514096) (not e!423443))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759606 (= res!514096 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20562 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20562 a!3186))))))

(declare-fun b!759607 () Bool)

(declare-fun e!423442 () Bool)

(declare-fun e!423445 () Bool)

(assert (=> b!759607 (= e!423442 e!423445)))

(declare-fun res!514100 () Bool)

(assert (=> b!759607 (=> (not res!514100) (not e!423445))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7741 0))(
  ( (MissingZero!7741 (index!33332 (_ BitVec 32))) (Found!7741 (index!33333 (_ BitVec 32))) (Intermediate!7741 (undefined!8553 Bool) (index!33334 (_ BitVec 32)) (x!64211 (_ BitVec 32))) (Undefined!7741) (MissingVacant!7741 (index!33335 (_ BitVec 32))) )
))
(declare-fun lt!338464 () SeekEntryResult!7741)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!759607 (= res!514100 (= (seekEntryOrOpen!0 (select (arr!20141 a!3186) j!159) a!3186 mask!3328) lt!338464))))

(assert (=> b!759607 (= lt!338464 (Found!7741 j!159))))

(declare-fun b!759608 () Bool)

(declare-fun e!423441 () Bool)

(declare-fun e!423440 () Bool)

(assert (=> b!759608 (= e!423441 e!423440)))

(declare-fun res!514091 () Bool)

(assert (=> b!759608 (=> (not res!514091) (not e!423440))))

(declare-fun lt!338465 () array!42055)

(declare-fun lt!338463 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759608 (= res!514091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338463 mask!3328) lt!338463 lt!338465 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338463 lt!338465 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!759608 (= lt!338463 (select (store (arr!20141 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759608 (= lt!338465 (array!42056 (store (arr!20141 a!3186) i!1173 k!2102) (size!20562 a!3186)))))

(declare-fun res!514095 () Bool)

(assert (=> start!65882 (=> (not res!514095) (not e!423446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65882 (= res!514095 (validMask!0 mask!3328))))

(assert (=> start!65882 e!423446))

(assert (=> start!65882 true))

(declare-fun array_inv!15937 (array!42055) Bool)

(assert (=> start!65882 (array_inv!15937 a!3186)))

(declare-fun b!759609 () Bool)

(declare-fun res!514086 () Bool)

(assert (=> b!759609 (=> (not res!514086) (not e!423441))))

(declare-fun e!423439 () Bool)

(assert (=> b!759609 (= res!514086 e!423439)))

(declare-fun c!83140 () Bool)

(assert (=> b!759609 (= c!83140 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759610 () Bool)

(assert (=> b!759610 (= e!423443 e!423441)))

(declare-fun res!514087 () Bool)

(assert (=> b!759610 (=> (not res!514087) (not e!423441))))

(declare-fun lt!338462 () SeekEntryResult!7741)

(assert (=> b!759610 (= res!514087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20141 a!3186) j!159) mask!3328) (select (arr!20141 a!3186) j!159) a!3186 mask!3328) lt!338462))))

(assert (=> b!759610 (= lt!338462 (Intermediate!7741 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759611 () Bool)

(declare-fun res!514094 () Bool)

(assert (=> b!759611 (=> (not res!514094) (not e!423446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759611 (= res!514094 (validKeyInArray!0 k!2102))))

(declare-fun b!759612 () Bool)

(declare-fun res!514089 () Bool)

(assert (=> b!759612 (=> (not res!514089) (not e!423443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42055 (_ BitVec 32)) Bool)

(assert (=> b!759612 (= res!514089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759613 () Bool)

(assert (=> b!759613 (= e!423446 e!423443)))

(declare-fun res!514093 () Bool)

(assert (=> b!759613 (=> (not res!514093) (not e!423443))))

(declare-fun lt!338460 () SeekEntryResult!7741)

(assert (=> b!759613 (= res!514093 (or (= lt!338460 (MissingZero!7741 i!1173)) (= lt!338460 (MissingVacant!7741 i!1173))))))

(assert (=> b!759613 (= lt!338460 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!759614 () Bool)

(assert (=> b!759614 (= e!423440 (not true))))

(assert (=> b!759614 e!423442))

(declare-fun res!514099 () Bool)

(assert (=> b!759614 (=> (not res!514099) (not e!423442))))

(assert (=> b!759614 (= res!514099 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26322 0))(
  ( (Unit!26323) )
))
(declare-fun lt!338461 () Unit!26322)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26322)

(assert (=> b!759614 (= lt!338461 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759615 () Bool)

(declare-fun res!514090 () Bool)

(assert (=> b!759615 (=> (not res!514090) (not e!423441))))

(assert (=> b!759615 (= res!514090 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20141 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759616 () Bool)

(assert (=> b!759616 (= e!423439 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20141 a!3186) j!159) a!3186 mask!3328) lt!338462))))

(declare-fun b!759617 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42055 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!759617 (= e!423445 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20141 a!3186) j!159) a!3186 mask!3328) lt!338464))))

(declare-fun b!759618 () Bool)

(declare-fun res!514098 () Bool)

(assert (=> b!759618 (=> (not res!514098) (not e!423446))))

(assert (=> b!759618 (= res!514098 (and (= (size!20562 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20562 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20562 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759619 () Bool)

(declare-fun res!514088 () Bool)

(assert (=> b!759619 (=> (not res!514088) (not e!423446))))

(assert (=> b!759619 (= res!514088 (validKeyInArray!0 (select (arr!20141 a!3186) j!159)))))

(declare-fun b!759620 () Bool)

(assert (=> b!759620 (= e!423439 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20141 a!3186) j!159) a!3186 mask!3328) (Found!7741 j!159)))))

(declare-fun b!759621 () Bool)

(declare-fun res!514097 () Bool)

(assert (=> b!759621 (=> (not res!514097) (not e!423443))))

(declare-datatypes ((List!14143 0))(
  ( (Nil!14140) (Cons!14139 (h!15211 (_ BitVec 64)) (t!20458 List!14143)) )
))
(declare-fun arrayNoDuplicates!0 (array!42055 (_ BitVec 32) List!14143) Bool)

(assert (=> b!759621 (= res!514097 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14140))))

(assert (= (and start!65882 res!514095) b!759618))

(assert (= (and b!759618 res!514098) b!759619))

(assert (= (and b!759619 res!514088) b!759611))

(assert (= (and b!759611 res!514094) b!759605))

(assert (= (and b!759605 res!514092) b!759613))

(assert (= (and b!759613 res!514093) b!759612))

(assert (= (and b!759612 res!514089) b!759621))

(assert (= (and b!759621 res!514097) b!759606))

(assert (= (and b!759606 res!514096) b!759610))

(assert (= (and b!759610 res!514087) b!759615))

(assert (= (and b!759615 res!514090) b!759609))

(assert (= (and b!759609 c!83140) b!759616))

(assert (= (and b!759609 (not c!83140)) b!759620))

(assert (= (and b!759609 res!514086) b!759608))

(assert (= (and b!759608 res!514091) b!759614))

(assert (= (and b!759614 res!514099) b!759607))

(assert (= (and b!759607 res!514100) b!759617))

(declare-fun m!706947 () Bool)

(assert (=> b!759621 m!706947))

(declare-fun m!706949 () Bool)

(assert (=> b!759615 m!706949))

(declare-fun m!706951 () Bool)

(assert (=> b!759616 m!706951))

(assert (=> b!759616 m!706951))

(declare-fun m!706953 () Bool)

(assert (=> b!759616 m!706953))

(assert (=> b!759620 m!706951))

(assert (=> b!759620 m!706951))

(declare-fun m!706955 () Bool)

(assert (=> b!759620 m!706955))

(assert (=> b!759610 m!706951))

(assert (=> b!759610 m!706951))

(declare-fun m!706957 () Bool)

(assert (=> b!759610 m!706957))

(assert (=> b!759610 m!706957))

(assert (=> b!759610 m!706951))

(declare-fun m!706959 () Bool)

(assert (=> b!759610 m!706959))

(declare-fun m!706961 () Bool)

(assert (=> b!759605 m!706961))

(assert (=> b!759619 m!706951))

(assert (=> b!759619 m!706951))

(declare-fun m!706963 () Bool)

(assert (=> b!759619 m!706963))

(assert (=> b!759607 m!706951))

(assert (=> b!759607 m!706951))

(declare-fun m!706965 () Bool)

(assert (=> b!759607 m!706965))

(declare-fun m!706967 () Bool)

(assert (=> b!759611 m!706967))

(assert (=> b!759617 m!706951))

(assert (=> b!759617 m!706951))

(declare-fun m!706969 () Bool)

(assert (=> b!759617 m!706969))

(declare-fun m!706971 () Bool)

(assert (=> b!759613 m!706971))

(declare-fun m!706973 () Bool)

(assert (=> b!759612 m!706973))

(declare-fun m!706975 () Bool)

(assert (=> start!65882 m!706975))

(declare-fun m!706977 () Bool)

(assert (=> start!65882 m!706977))

(declare-fun m!706979 () Bool)

(assert (=> b!759614 m!706979))

(declare-fun m!706981 () Bool)

(assert (=> b!759614 m!706981))

(declare-fun m!706983 () Bool)

(assert (=> b!759608 m!706983))

(declare-fun m!706985 () Bool)

(assert (=> b!759608 m!706985))

(declare-fun m!706987 () Bool)

(assert (=> b!759608 m!706987))

(declare-fun m!706989 () Bool)

(assert (=> b!759608 m!706989))

(declare-fun m!706991 () Bool)

(assert (=> b!759608 m!706991))

(assert (=> b!759608 m!706989))

(push 1)

