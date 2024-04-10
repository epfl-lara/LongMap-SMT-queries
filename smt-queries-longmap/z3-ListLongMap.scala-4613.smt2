; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64314 () Bool)

(assert start!64314)

(declare-fun b!722603 () Bool)

(declare-fun res!484297 () Bool)

(declare-fun e!404989 () Bool)

(assert (=> b!722603 (=> (not res!484297) (not e!404989))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40895 0))(
  ( (array!40896 (arr!19570 (Array (_ BitVec 32) (_ BitVec 64))) (size!19991 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40895)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722603 (= res!484297 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19991 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19991 a!3186))))))

(declare-fun res!484294 () Bool)

(declare-fun e!404987 () Bool)

(assert (=> start!64314 (=> (not res!484294) (not e!404987))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64314 (= res!484294 (validMask!0 mask!3328))))

(assert (=> start!64314 e!404987))

(assert (=> start!64314 true))

(declare-fun array_inv!15366 (array!40895) Bool)

(assert (=> start!64314 (array_inv!15366 a!3186)))

(declare-fun b!722604 () Bool)

(declare-fun res!484295 () Bool)

(assert (=> b!722604 (=> (not res!484295) (not e!404989))))

(declare-datatypes ((List!13572 0))(
  ( (Nil!13569) (Cons!13568 (h!14622 (_ BitVec 64)) (t!19887 List!13572)) )
))
(declare-fun arrayNoDuplicates!0 (array!40895 (_ BitVec 32) List!13572) Bool)

(assert (=> b!722604 (= res!484295 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13569))))

(declare-fun b!722605 () Bool)

(declare-fun e!404988 () Bool)

(assert (=> b!722605 (= e!404988 false)))

(declare-fun lt!320352 () array!40895)

(declare-fun lt!320351 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7170 0))(
  ( (MissingZero!7170 (index!31048 (_ BitVec 32))) (Found!7170 (index!31049 (_ BitVec 32))) (Intermediate!7170 (undefined!7982 Bool) (index!31050 (_ BitVec 32)) (x!62051 (_ BitVec 32))) (Undefined!7170) (MissingVacant!7170 (index!31051 (_ BitVec 32))) )
))
(declare-fun lt!320354 () SeekEntryResult!7170)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40895 (_ BitVec 32)) SeekEntryResult!7170)

(assert (=> b!722605 (= lt!320354 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320351 lt!320352 mask!3328))))

(declare-fun lt!320349 () SeekEntryResult!7170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722605 (= lt!320349 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320351 mask!3328) lt!320351 lt!320352 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!722605 (= lt!320351 (select (store (arr!19570 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722605 (= lt!320352 (array!40896 (store (arr!19570 a!3186) i!1173 k0!2102) (size!19991 a!3186)))))

(declare-fun b!722606 () Bool)

(declare-fun res!484290 () Bool)

(assert (=> b!722606 (=> (not res!484290) (not e!404989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40895 (_ BitVec 32)) Bool)

(assert (=> b!722606 (= res!484290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722607 () Bool)

(assert (=> b!722607 (= e!404989 e!404988)))

(declare-fun res!484293 () Bool)

(assert (=> b!722607 (=> (not res!484293) (not e!404988))))

(declare-fun lt!320350 () SeekEntryResult!7170)

(assert (=> b!722607 (= res!484293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19570 a!3186) j!159) mask!3328) (select (arr!19570 a!3186) j!159) a!3186 mask!3328) lt!320350))))

(assert (=> b!722607 (= lt!320350 (Intermediate!7170 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!404986 () Bool)

(declare-fun b!722608 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40895 (_ BitVec 32)) SeekEntryResult!7170)

(assert (=> b!722608 (= e!404986 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19570 a!3186) j!159) a!3186 mask!3328) (Found!7170 j!159)))))

(declare-fun b!722609 () Bool)

(declare-fun res!484301 () Bool)

(assert (=> b!722609 (=> (not res!484301) (not e!404988))))

(assert (=> b!722609 (= res!484301 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19570 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722610 () Bool)

(declare-fun res!484296 () Bool)

(assert (=> b!722610 (=> (not res!484296) (not e!404987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722610 (= res!484296 (validKeyInArray!0 (select (arr!19570 a!3186) j!159)))))

(declare-fun b!722611 () Bool)

(declare-fun res!484299 () Bool)

(assert (=> b!722611 (=> (not res!484299) (not e!404988))))

(assert (=> b!722611 (= res!484299 e!404986)))

(declare-fun c!79528 () Bool)

(assert (=> b!722611 (= c!79528 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722612 () Bool)

(declare-fun res!484292 () Bool)

(assert (=> b!722612 (=> (not res!484292) (not e!404987))))

(assert (=> b!722612 (= res!484292 (validKeyInArray!0 k0!2102))))

(declare-fun b!722613 () Bool)

(assert (=> b!722613 (= e!404987 e!404989)))

(declare-fun res!484298 () Bool)

(assert (=> b!722613 (=> (not res!484298) (not e!404989))))

(declare-fun lt!320353 () SeekEntryResult!7170)

(assert (=> b!722613 (= res!484298 (or (= lt!320353 (MissingZero!7170 i!1173)) (= lt!320353 (MissingVacant!7170 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40895 (_ BitVec 32)) SeekEntryResult!7170)

(assert (=> b!722613 (= lt!320353 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722614 () Bool)

(declare-fun res!484291 () Bool)

(assert (=> b!722614 (=> (not res!484291) (not e!404987))))

(assert (=> b!722614 (= res!484291 (and (= (size!19991 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19991 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19991 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722615 () Bool)

(declare-fun res!484300 () Bool)

(assert (=> b!722615 (=> (not res!484300) (not e!404987))))

(declare-fun arrayContainsKey!0 (array!40895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722615 (= res!484300 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722616 () Bool)

(assert (=> b!722616 (= e!404986 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19570 a!3186) j!159) a!3186 mask!3328) lt!320350))))

(assert (= (and start!64314 res!484294) b!722614))

(assert (= (and b!722614 res!484291) b!722610))

(assert (= (and b!722610 res!484296) b!722612))

(assert (= (and b!722612 res!484292) b!722615))

(assert (= (and b!722615 res!484300) b!722613))

(assert (= (and b!722613 res!484298) b!722606))

(assert (= (and b!722606 res!484290) b!722604))

(assert (= (and b!722604 res!484295) b!722603))

(assert (= (and b!722603 res!484297) b!722607))

(assert (= (and b!722607 res!484293) b!722609))

(assert (= (and b!722609 res!484301) b!722611))

(assert (= (and b!722611 c!79528) b!722616))

(assert (= (and b!722611 (not c!79528)) b!722608))

(assert (= (and b!722611 res!484299) b!722605))

(declare-fun m!677115 () Bool)

(assert (=> b!722610 m!677115))

(assert (=> b!722610 m!677115))

(declare-fun m!677117 () Bool)

(assert (=> b!722610 m!677117))

(declare-fun m!677119 () Bool)

(assert (=> b!722609 m!677119))

(declare-fun m!677121 () Bool)

(assert (=> b!722613 m!677121))

(declare-fun m!677123 () Bool)

(assert (=> b!722606 m!677123))

(declare-fun m!677125 () Bool)

(assert (=> b!722612 m!677125))

(declare-fun m!677127 () Bool)

(assert (=> b!722605 m!677127))

(declare-fun m!677129 () Bool)

(assert (=> b!722605 m!677129))

(declare-fun m!677131 () Bool)

(assert (=> b!722605 m!677131))

(assert (=> b!722605 m!677127))

(declare-fun m!677133 () Bool)

(assert (=> b!722605 m!677133))

(declare-fun m!677135 () Bool)

(assert (=> b!722605 m!677135))

(assert (=> b!722616 m!677115))

(assert (=> b!722616 m!677115))

(declare-fun m!677137 () Bool)

(assert (=> b!722616 m!677137))

(declare-fun m!677139 () Bool)

(assert (=> b!722604 m!677139))

(assert (=> b!722608 m!677115))

(assert (=> b!722608 m!677115))

(declare-fun m!677141 () Bool)

(assert (=> b!722608 m!677141))

(assert (=> b!722607 m!677115))

(assert (=> b!722607 m!677115))

(declare-fun m!677143 () Bool)

(assert (=> b!722607 m!677143))

(assert (=> b!722607 m!677143))

(assert (=> b!722607 m!677115))

(declare-fun m!677145 () Bool)

(assert (=> b!722607 m!677145))

(declare-fun m!677147 () Bool)

(assert (=> b!722615 m!677147))

(declare-fun m!677149 () Bool)

(assert (=> start!64314 m!677149))

(declare-fun m!677151 () Bool)

(assert (=> start!64314 m!677151))

(check-sat (not b!722604) (not b!722613) (not b!722615) (not b!722605) (not b!722607) (not b!722616) (not b!722612) (not start!64314) (not b!722608) (not b!722610) (not b!722606))
(check-sat)
