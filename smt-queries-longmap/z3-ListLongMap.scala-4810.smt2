; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66320 () Bool)

(assert start!66320)

(declare-fun b!762936 () Bool)

(declare-fun res!515677 () Bool)

(declare-fun e!425363 () Bool)

(assert (=> b!762936 (=> (not res!515677) (not e!425363))))

(declare-datatypes ((array!42103 0))(
  ( (array!42104 (arr!20155 (Array (_ BitVec 32) (_ BitVec 64))) (size!20575 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42103)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762936 (= res!515677 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762937 () Bool)

(declare-fun res!515676 () Bool)

(assert (=> b!762937 (=> (not res!515676) (not e!425363))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762937 (= res!515676 (and (= (size!20575 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20575 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20575 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762938 () Bool)

(declare-fun res!515674 () Bool)

(declare-fun e!425362 () Bool)

(assert (=> b!762938 (=> (not res!515674) (not e!425362))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42103 (_ BitVec 32)) Bool)

(assert (=> b!762938 (= res!515674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762939 () Bool)

(declare-fun res!515673 () Bool)

(assert (=> b!762939 (=> (not res!515673) (not e!425363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762939 (= res!515673 (validKeyInArray!0 k0!2102))))

(declare-fun res!515679 () Bool)

(assert (=> start!66320 (=> (not res!515679) (not e!425363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66320 (= res!515679 (validMask!0 mask!3328))))

(assert (=> start!66320 e!425363))

(assert (=> start!66320 true))

(declare-fun array_inv!16014 (array!42103) Bool)

(assert (=> start!66320 (array_inv!16014 a!3186)))

(declare-fun b!762940 () Bool)

(declare-fun res!515675 () Bool)

(assert (=> b!762940 (=> (not res!515675) (not e!425363))))

(assert (=> b!762940 (= res!515675 (validKeyInArray!0 (select (arr!20155 a!3186) j!159)))))

(declare-fun b!762941 () Bool)

(assert (=> b!762941 (= e!425363 e!425362)))

(declare-fun res!515680 () Bool)

(assert (=> b!762941 (=> (not res!515680) (not e!425362))))

(declare-datatypes ((SeekEntryResult!7711 0))(
  ( (MissingZero!7711 (index!33212 (_ BitVec 32))) (Found!7711 (index!33213 (_ BitVec 32))) (Intermediate!7711 (undefined!8523 Bool) (index!33214 (_ BitVec 32)) (x!64286 (_ BitVec 32))) (Undefined!7711) (MissingVacant!7711 (index!33215 (_ BitVec 32))) )
))
(declare-fun lt!339810 () SeekEntryResult!7711)

(assert (=> b!762941 (= res!515680 (or (= lt!339810 (MissingZero!7711 i!1173)) (= lt!339810 (MissingVacant!7711 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42103 (_ BitVec 32)) SeekEntryResult!7711)

(assert (=> b!762941 (= lt!339810 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762942 () Bool)

(assert (=> b!762942 (= e!425362 false)))

(declare-fun lt!339809 () SeekEntryResult!7711)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42103 (_ BitVec 32)) SeekEntryResult!7711)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762942 (= lt!339809 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20155 a!3186) j!159) mask!3328) (select (arr!20155 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762943 () Bool)

(declare-fun res!515678 () Bool)

(assert (=> b!762943 (=> (not res!515678) (not e!425362))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762943 (= res!515678 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20575 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20575 a!3186))))))

(declare-fun b!762944 () Bool)

(declare-fun res!515681 () Bool)

(assert (=> b!762944 (=> (not res!515681) (not e!425362))))

(declare-datatypes ((List!14064 0))(
  ( (Nil!14061) (Cons!14060 (h!15150 (_ BitVec 64)) (t!20371 List!14064)) )
))
(declare-fun arrayNoDuplicates!0 (array!42103 (_ BitVec 32) List!14064) Bool)

(assert (=> b!762944 (= res!515681 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14061))))

(assert (= (and start!66320 res!515679) b!762937))

(assert (= (and b!762937 res!515676) b!762940))

(assert (= (and b!762940 res!515675) b!762939))

(assert (= (and b!762939 res!515673) b!762936))

(assert (= (and b!762936 res!515677) b!762941))

(assert (= (and b!762941 res!515680) b!762938))

(assert (= (and b!762938 res!515674) b!762944))

(assert (= (and b!762944 res!515681) b!762943))

(assert (= (and b!762943 res!515678) b!762942))

(declare-fun m!710089 () Bool)

(assert (=> b!762938 m!710089))

(declare-fun m!710091 () Bool)

(assert (=> b!762936 m!710091))

(declare-fun m!710093 () Bool)

(assert (=> b!762940 m!710093))

(assert (=> b!762940 m!710093))

(declare-fun m!710095 () Bool)

(assert (=> b!762940 m!710095))

(assert (=> b!762942 m!710093))

(assert (=> b!762942 m!710093))

(declare-fun m!710097 () Bool)

(assert (=> b!762942 m!710097))

(assert (=> b!762942 m!710097))

(assert (=> b!762942 m!710093))

(declare-fun m!710099 () Bool)

(assert (=> b!762942 m!710099))

(declare-fun m!710101 () Bool)

(assert (=> b!762941 m!710101))

(declare-fun m!710103 () Bool)

(assert (=> start!66320 m!710103))

(declare-fun m!710105 () Bool)

(assert (=> start!66320 m!710105))

(declare-fun m!710107 () Bool)

(assert (=> b!762939 m!710107))

(declare-fun m!710109 () Bool)

(assert (=> b!762944 m!710109))

(check-sat (not b!762944) (not b!762936) (not b!762941) (not b!762940) (not start!66320) (not b!762939) (not b!762942) (not b!762938))
(check-sat)
