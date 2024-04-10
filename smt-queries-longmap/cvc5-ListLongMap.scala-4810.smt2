; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66200 () Bool)

(assert start!66200)

(declare-fun b!762291 () Bool)

(declare-fun res!515408 () Bool)

(declare-fun e!424945 () Bool)

(assert (=> b!762291 (=> (not res!515408) (not e!424945))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42105 0))(
  ( (array!42106 (arr!20160 (Array (_ BitVec 32) (_ BitVec 64))) (size!20581 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42105)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762291 (= res!515408 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20581 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20581 a!3186))))))

(declare-fun b!762292 () Bool)

(declare-fun res!515404 () Bool)

(assert (=> b!762292 (=> (not res!515404) (not e!424945))))

(declare-datatypes ((List!14162 0))(
  ( (Nil!14159) (Cons!14158 (h!15242 (_ BitVec 64)) (t!20477 List!14162)) )
))
(declare-fun arrayNoDuplicates!0 (array!42105 (_ BitVec 32) List!14162) Bool)

(assert (=> b!762292 (= res!515404 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14159))))

(declare-fun b!762293 () Bool)

(declare-fun res!515403 () Bool)

(declare-fun e!424947 () Bool)

(assert (=> b!762293 (=> (not res!515403) (not e!424947))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762293 (= res!515403 (validKeyInArray!0 k!2102))))

(declare-fun b!762295 () Bool)

(declare-fun res!515405 () Bool)

(assert (=> b!762295 (=> (not res!515405) (not e!424945))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42105 (_ BitVec 32)) Bool)

(assert (=> b!762295 (= res!515405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762296 () Bool)

(assert (=> b!762296 (= e!424947 e!424945)))

(declare-fun res!515406 () Bool)

(assert (=> b!762296 (=> (not res!515406) (not e!424945))))

(declare-datatypes ((SeekEntryResult!7760 0))(
  ( (MissingZero!7760 (index!33408 (_ BitVec 32))) (Found!7760 (index!33409 (_ BitVec 32))) (Intermediate!7760 (undefined!8572 Bool) (index!33410 (_ BitVec 32)) (x!64324 (_ BitVec 32))) (Undefined!7760) (MissingVacant!7760 (index!33411 (_ BitVec 32))) )
))
(declare-fun lt!339539 () SeekEntryResult!7760)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762296 (= res!515406 (or (= lt!339539 (MissingZero!7760 i!1173)) (= lt!339539 (MissingVacant!7760 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42105 (_ BitVec 32)) SeekEntryResult!7760)

(assert (=> b!762296 (= lt!339539 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762297 () Bool)

(assert (=> b!762297 (= e!424945 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!339538 () SeekEntryResult!7760)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42105 (_ BitVec 32)) SeekEntryResult!7760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762297 (= lt!339538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20160 a!3186) j!159) mask!3328) (select (arr!20160 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762294 () Bool)

(declare-fun res!515407 () Bool)

(assert (=> b!762294 (=> (not res!515407) (not e!424947))))

(assert (=> b!762294 (= res!515407 (and (= (size!20581 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20581 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20581 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515410 () Bool)

(assert (=> start!66200 (=> (not res!515410) (not e!424947))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66200 (= res!515410 (validMask!0 mask!3328))))

(assert (=> start!66200 e!424947))

(assert (=> start!66200 true))

(declare-fun array_inv!15956 (array!42105) Bool)

(assert (=> start!66200 (array_inv!15956 a!3186)))

(declare-fun b!762298 () Bool)

(declare-fun res!515409 () Bool)

(assert (=> b!762298 (=> (not res!515409) (not e!424947))))

(assert (=> b!762298 (= res!515409 (validKeyInArray!0 (select (arr!20160 a!3186) j!159)))))

(declare-fun b!762299 () Bool)

(declare-fun res!515402 () Bool)

(assert (=> b!762299 (=> (not res!515402) (not e!424947))))

(declare-fun arrayContainsKey!0 (array!42105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762299 (= res!515402 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66200 res!515410) b!762294))

(assert (= (and b!762294 res!515407) b!762298))

(assert (= (and b!762298 res!515409) b!762293))

(assert (= (and b!762293 res!515403) b!762299))

(assert (= (and b!762299 res!515402) b!762296))

(assert (= (and b!762296 res!515406) b!762295))

(assert (= (and b!762295 res!515405) b!762292))

(assert (= (and b!762292 res!515404) b!762291))

(assert (= (and b!762291 res!515408) b!762297))

(declare-fun m!709065 () Bool)

(assert (=> start!66200 m!709065))

(declare-fun m!709067 () Bool)

(assert (=> start!66200 m!709067))

(declare-fun m!709069 () Bool)

(assert (=> b!762298 m!709069))

(assert (=> b!762298 m!709069))

(declare-fun m!709071 () Bool)

(assert (=> b!762298 m!709071))

(declare-fun m!709073 () Bool)

(assert (=> b!762299 m!709073))

(declare-fun m!709075 () Bool)

(assert (=> b!762295 m!709075))

(declare-fun m!709077 () Bool)

(assert (=> b!762293 m!709077))

(assert (=> b!762297 m!709069))

(assert (=> b!762297 m!709069))

(declare-fun m!709079 () Bool)

(assert (=> b!762297 m!709079))

(assert (=> b!762297 m!709079))

(assert (=> b!762297 m!709069))

(declare-fun m!709081 () Bool)

(assert (=> b!762297 m!709081))

(declare-fun m!709083 () Bool)

(assert (=> b!762292 m!709083))

(declare-fun m!709085 () Bool)

(assert (=> b!762296 m!709085))

(push 1)

