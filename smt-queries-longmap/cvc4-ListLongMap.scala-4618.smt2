; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64346 () Bool)

(assert start!64346)

(declare-fun b!723292 () Bool)

(declare-fun res!484888 () Bool)

(declare-fun e!405244 () Bool)

(assert (=> b!723292 (=> (not res!484888) (not e!405244))))

(declare-fun e!405246 () Bool)

(assert (=> b!723292 (= res!484888 e!405246)))

(declare-fun c!79576 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723292 (= c!79576 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40927 0))(
  ( (array!40928 (arr!19586 (Array (_ BitVec 32) (_ BitVec 64))) (size!20007 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40927)

(declare-fun b!723293 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7186 0))(
  ( (MissingZero!7186 (index!31112 (_ BitVec 32))) (Found!7186 (index!31113 (_ BitVec 32))) (Intermediate!7186 (undefined!7998 Bool) (index!31114 (_ BitVec 32)) (x!62107 (_ BitVec 32))) (Undefined!7186) (MissingVacant!7186 (index!31115 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40927 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!723293 (= e!405246 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) (Found!7186 j!159)))))

(declare-fun b!723294 () Bool)

(declare-fun res!484890 () Bool)

(declare-fun e!405245 () Bool)

(assert (=> b!723294 (=> (not res!484890) (not e!405245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723294 (= res!484890 (validKeyInArray!0 (select (arr!19586 a!3186) j!159)))))

(declare-fun b!723295 () Bool)

(declare-fun res!484886 () Bool)

(assert (=> b!723295 (=> (not res!484886) (not e!405245))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!723295 (= res!484886 (validKeyInArray!0 k!2102))))

(declare-fun res!484885 () Bool)

(assert (=> start!64346 (=> (not res!484885) (not e!405245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64346 (= res!484885 (validMask!0 mask!3328))))

(assert (=> start!64346 e!405245))

(assert (=> start!64346 true))

(declare-fun array_inv!15382 (array!40927) Bool)

(assert (=> start!64346 (array_inv!15382 a!3186)))

(declare-fun b!723296 () Bool)

(declare-fun res!484893 () Bool)

(assert (=> b!723296 (=> (not res!484893) (not e!405245))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723296 (= res!484893 (and (= (size!20007 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20007 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20007 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723297 () Bool)

(declare-fun res!484884 () Bool)

(declare-fun e!405247 () Bool)

(assert (=> b!723297 (=> (not res!484884) (not e!405247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40927 (_ BitVec 32)) Bool)

(assert (=> b!723297 (= res!484884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723298 () Bool)

(assert (=> b!723298 (= e!405247 e!405244)))

(declare-fun res!484891 () Bool)

(assert (=> b!723298 (=> (not res!484891) (not e!405244))))

(declare-fun lt!320623 () SeekEntryResult!7186)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40927 (_ BitVec 32)) SeekEntryResult!7186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723298 (= res!484891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19586 a!3186) j!159) mask!3328) (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320623))))

(assert (=> b!723298 (= lt!320623 (Intermediate!7186 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723299 () Bool)

(declare-fun e!405243 () Bool)

(assert (=> b!723299 (= e!405243 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!723299 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24690 0))(
  ( (Unit!24691) )
))
(declare-fun lt!320620 () Unit!24690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24690)

(assert (=> b!723299 (= lt!320620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723300 () Bool)

(declare-fun res!484895 () Bool)

(assert (=> b!723300 (=> (not res!484895) (not e!405244))))

(assert (=> b!723300 (= res!484895 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19586 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723301 () Bool)

(declare-fun res!484883 () Bool)

(assert (=> b!723301 (=> (not res!484883) (not e!405247))))

(assert (=> b!723301 (= res!484883 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20007 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20007 a!3186))))))

(declare-fun b!723302 () Bool)

(declare-fun res!484894 () Bool)

(assert (=> b!723302 (=> (not res!484894) (not e!405245))))

(declare-fun arrayContainsKey!0 (array!40927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723302 (= res!484894 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723303 () Bool)

(assert (=> b!723303 (= e!405246 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19586 a!3186) j!159) a!3186 mask!3328) lt!320623))))

(declare-fun b!723304 () Bool)

(assert (=> b!723304 (= e!405244 e!405243)))

(declare-fun res!484887 () Bool)

(assert (=> b!723304 (=> (not res!484887) (not e!405243))))

(declare-fun lt!320622 () (_ BitVec 64))

(declare-fun lt!320624 () array!40927)

(assert (=> b!723304 (= res!484887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320622 mask!3328) lt!320622 lt!320624 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320622 lt!320624 mask!3328)))))

(assert (=> b!723304 (= lt!320622 (select (store (arr!19586 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723304 (= lt!320624 (array!40928 (store (arr!19586 a!3186) i!1173 k!2102) (size!20007 a!3186)))))

(declare-fun b!723305 () Bool)

(declare-fun res!484889 () Bool)

(assert (=> b!723305 (=> (not res!484889) (not e!405247))))

(declare-datatypes ((List!13588 0))(
  ( (Nil!13585) (Cons!13584 (h!14638 (_ BitVec 64)) (t!19903 List!13588)) )
))
(declare-fun arrayNoDuplicates!0 (array!40927 (_ BitVec 32) List!13588) Bool)

(assert (=> b!723305 (= res!484889 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13585))))

(declare-fun b!723306 () Bool)

(assert (=> b!723306 (= e!405245 e!405247)))

(declare-fun res!484892 () Bool)

(assert (=> b!723306 (=> (not res!484892) (not e!405247))))

(declare-fun lt!320621 () SeekEntryResult!7186)

(assert (=> b!723306 (= res!484892 (or (= lt!320621 (MissingZero!7186 i!1173)) (= lt!320621 (MissingVacant!7186 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40927 (_ BitVec 32)) SeekEntryResult!7186)

(assert (=> b!723306 (= lt!320621 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!64346 res!484885) b!723296))

(assert (= (and b!723296 res!484893) b!723294))

(assert (= (and b!723294 res!484890) b!723295))

(assert (= (and b!723295 res!484886) b!723302))

(assert (= (and b!723302 res!484894) b!723306))

(assert (= (and b!723306 res!484892) b!723297))

(assert (= (and b!723297 res!484884) b!723305))

(assert (= (and b!723305 res!484889) b!723301))

(assert (= (and b!723301 res!484883) b!723298))

(assert (= (and b!723298 res!484891) b!723300))

(assert (= (and b!723300 res!484895) b!723292))

(assert (= (and b!723292 c!79576) b!723303))

(assert (= (and b!723292 (not c!79576)) b!723293))

(assert (= (and b!723292 res!484888) b!723304))

(assert (= (and b!723304 res!484887) b!723299))

(declare-fun m!677743 () Bool)

(assert (=> b!723299 m!677743))

(declare-fun m!677745 () Bool)

(assert (=> b!723299 m!677745))

(declare-fun m!677747 () Bool)

(assert (=> b!723302 m!677747))

(declare-fun m!677749 () Bool)

(assert (=> b!723295 m!677749))

(declare-fun m!677751 () Bool)

(assert (=> start!64346 m!677751))

(declare-fun m!677753 () Bool)

(assert (=> start!64346 m!677753))

(declare-fun m!677755 () Bool)

(assert (=> b!723298 m!677755))

(assert (=> b!723298 m!677755))

(declare-fun m!677757 () Bool)

(assert (=> b!723298 m!677757))

(assert (=> b!723298 m!677757))

(assert (=> b!723298 m!677755))

(declare-fun m!677759 () Bool)

(assert (=> b!723298 m!677759))

(declare-fun m!677761 () Bool)

(assert (=> b!723300 m!677761))

(declare-fun m!677763 () Bool)

(assert (=> b!723304 m!677763))

(declare-fun m!677765 () Bool)

(assert (=> b!723304 m!677765))

(declare-fun m!677767 () Bool)

(assert (=> b!723304 m!677767))

(declare-fun m!677769 () Bool)

(assert (=> b!723304 m!677769))

(declare-fun m!677771 () Bool)

(assert (=> b!723304 m!677771))

(assert (=> b!723304 m!677769))

(declare-fun m!677773 () Bool)

(assert (=> b!723306 m!677773))

(assert (=> b!723293 m!677755))

(assert (=> b!723293 m!677755))

(declare-fun m!677775 () Bool)

(assert (=> b!723293 m!677775))

(assert (=> b!723303 m!677755))

(assert (=> b!723303 m!677755))

(declare-fun m!677777 () Bool)

(assert (=> b!723303 m!677777))

(declare-fun m!677779 () Bool)

(assert (=> b!723305 m!677779))

(declare-fun m!677781 () Bool)

(assert (=> b!723297 m!677781))

(assert (=> b!723294 m!677755))

(assert (=> b!723294 m!677755))

(declare-fun m!677783 () Bool)

(assert (=> b!723294 m!677783))

(push 1)

(assert (not b!723295))

(assert (not b!723304))

(assert (not b!723298))

(assert (not b!723293))

(assert (not b!723303))

(assert (not start!64346))

(assert (not b!723305))

(assert (not b!723302))

(assert (not b!723294))

(assert (not b!723299))

