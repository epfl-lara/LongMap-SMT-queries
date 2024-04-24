; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64140 () Bool)

(assert start!64140)

(declare-fun b!720035 () Bool)

(declare-fun res!482281 () Bool)

(declare-fun e!404011 () Bool)

(assert (=> b!720035 (=> (not res!482281) (not e!404011))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720035 (= res!482281 (validKeyInArray!0 k0!2102))))

(declare-fun b!720036 () Bool)

(declare-fun res!482287 () Bool)

(declare-fun e!404012 () Bool)

(assert (=> b!720036 (=> (not res!482287) (not e!404012))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40768 0))(
  ( (array!40769 (arr!19507 (Array (_ BitVec 32) (_ BitVec 64))) (size!19927 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40768)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720036 (= res!482287 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19927 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19927 a!3186))))))

(declare-fun res!482282 () Bool)

(assert (=> start!64140 (=> (not res!482282) (not e!404011))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64140 (= res!482282 (validMask!0 mask!3328))))

(assert (=> start!64140 e!404011))

(assert (=> start!64140 true))

(declare-fun array_inv!15366 (array!40768) Bool)

(assert (=> start!64140 (array_inv!15366 a!3186)))

(declare-fun b!720037 () Bool)

(declare-fun res!482280 () Bool)

(assert (=> b!720037 (=> (not res!482280) (not e!404012))))

(declare-datatypes ((List!13416 0))(
  ( (Nil!13413) (Cons!13412 (h!14463 (_ BitVec 64)) (t!19723 List!13416)) )
))
(declare-fun arrayNoDuplicates!0 (array!40768 (_ BitVec 32) List!13416) Bool)

(assert (=> b!720037 (= res!482280 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13413))))

(declare-fun b!720038 () Bool)

(declare-fun res!482285 () Bool)

(assert (=> b!720038 (=> (not res!482285) (not e!404011))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!720038 (= res!482285 (validKeyInArray!0 (select (arr!19507 a!3186) j!159)))))

(declare-fun b!720039 () Bool)

(declare-fun res!482283 () Bool)

(assert (=> b!720039 (=> (not res!482283) (not e!404011))))

(declare-fun arrayContainsKey!0 (array!40768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720039 (= res!482283 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720040 () Bool)

(declare-fun res!482279 () Bool)

(assert (=> b!720040 (=> (not res!482279) (not e!404012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40768 (_ BitVec 32)) Bool)

(assert (=> b!720040 (= res!482279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720041 () Bool)

(declare-fun res!482284 () Bool)

(assert (=> b!720041 (=> (not res!482284) (not e!404011))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720041 (= res!482284 (and (= (size!19927 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19927 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19927 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720042 () Bool)

(assert (=> b!720042 (= e!404011 e!404012)))

(declare-fun res!482286 () Bool)

(assert (=> b!720042 (=> (not res!482286) (not e!404012))))

(declare-datatypes ((SeekEntryResult!7063 0))(
  ( (MissingZero!7063 (index!30620 (_ BitVec 32))) (Found!7063 (index!30621 (_ BitVec 32))) (Intermediate!7063 (undefined!7875 Bool) (index!30622 (_ BitVec 32)) (x!61777 (_ BitVec 32))) (Undefined!7063) (MissingVacant!7063 (index!30623 (_ BitVec 32))) )
))
(declare-fun lt!319769 () SeekEntryResult!7063)

(assert (=> b!720042 (= res!482286 (or (= lt!319769 (MissingZero!7063 i!1173)) (= lt!319769 (MissingVacant!7063 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40768 (_ BitVec 32)) SeekEntryResult!7063)

(assert (=> b!720042 (= lt!319769 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720043 () Bool)

(assert (=> b!720043 (= e!404012 false)))

(declare-fun lt!319770 () SeekEntryResult!7063)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40768 (_ BitVec 32)) SeekEntryResult!7063)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720043 (= lt!319770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19507 a!3186) j!159) mask!3328) (select (arr!19507 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!64140 res!482282) b!720041))

(assert (= (and b!720041 res!482284) b!720038))

(assert (= (and b!720038 res!482285) b!720035))

(assert (= (and b!720035 res!482281) b!720039))

(assert (= (and b!720039 res!482283) b!720042))

(assert (= (and b!720042 res!482286) b!720040))

(assert (= (and b!720040 res!482279) b!720037))

(assert (= (and b!720037 res!482280) b!720036))

(assert (= (and b!720036 res!482287) b!720043))

(declare-fun m!675909 () Bool)

(assert (=> b!720037 m!675909))

(declare-fun m!675911 () Bool)

(assert (=> b!720035 m!675911))

(declare-fun m!675913 () Bool)

(assert (=> b!720038 m!675913))

(assert (=> b!720038 m!675913))

(declare-fun m!675915 () Bool)

(assert (=> b!720038 m!675915))

(declare-fun m!675917 () Bool)

(assert (=> b!720040 m!675917))

(assert (=> b!720043 m!675913))

(assert (=> b!720043 m!675913))

(declare-fun m!675919 () Bool)

(assert (=> b!720043 m!675919))

(assert (=> b!720043 m!675919))

(assert (=> b!720043 m!675913))

(declare-fun m!675921 () Bool)

(assert (=> b!720043 m!675921))

(declare-fun m!675923 () Bool)

(assert (=> b!720039 m!675923))

(declare-fun m!675925 () Bool)

(assert (=> b!720042 m!675925))

(declare-fun m!675927 () Bool)

(assert (=> start!64140 m!675927))

(declare-fun m!675929 () Bool)

(assert (=> start!64140 m!675929))

(check-sat (not b!720039) (not b!720043) (not b!720035) (not b!720040) (not b!720042) (not b!720037) (not start!64140) (not b!720038))
(check-sat)
