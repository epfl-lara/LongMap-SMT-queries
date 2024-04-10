; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66204 () Bool)

(assert start!66204)

(declare-fun b!762345 () Bool)

(declare-fun res!515458 () Bool)

(declare-fun e!424963 () Bool)

(assert (=> b!762345 (=> (not res!515458) (not e!424963))))

(declare-datatypes ((array!42109 0))(
  ( (array!42110 (arr!20162 (Array (_ BitVec 32) (_ BitVec 64))) (size!20583 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42109)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762345 (= res!515458 (and (= (size!20583 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20583 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20583 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762346 () Bool)

(declare-fun e!424964 () Bool)

(assert (=> b!762346 (= e!424964 false)))

(declare-datatypes ((SeekEntryResult!7762 0))(
  ( (MissingZero!7762 (index!33416 (_ BitVec 32))) (Found!7762 (index!33417 (_ BitVec 32))) (Intermediate!7762 (undefined!8574 Bool) (index!33418 (_ BitVec 32)) (x!64326 (_ BitVec 32))) (Undefined!7762) (MissingVacant!7762 (index!33419 (_ BitVec 32))) )
))
(declare-fun lt!339550 () SeekEntryResult!7762)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42109 (_ BitVec 32)) SeekEntryResult!7762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762346 (= lt!339550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20162 a!3186) j!159) mask!3328) (select (arr!20162 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762347 () Bool)

(declare-fun res!515459 () Bool)

(assert (=> b!762347 (=> (not res!515459) (not e!424963))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762347 (= res!515459 (validKeyInArray!0 k!2102))))

(declare-fun res!515456 () Bool)

(assert (=> start!66204 (=> (not res!515456) (not e!424963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66204 (= res!515456 (validMask!0 mask!3328))))

(assert (=> start!66204 e!424963))

(assert (=> start!66204 true))

(declare-fun array_inv!15958 (array!42109) Bool)

(assert (=> start!66204 (array_inv!15958 a!3186)))

(declare-fun b!762348 () Bool)

(assert (=> b!762348 (= e!424963 e!424964)))

(declare-fun res!515464 () Bool)

(assert (=> b!762348 (=> (not res!515464) (not e!424964))))

(declare-fun lt!339551 () SeekEntryResult!7762)

(assert (=> b!762348 (= res!515464 (or (= lt!339551 (MissingZero!7762 i!1173)) (= lt!339551 (MissingVacant!7762 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42109 (_ BitVec 32)) SeekEntryResult!7762)

(assert (=> b!762348 (= lt!339551 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762349 () Bool)

(declare-fun res!515462 () Bool)

(assert (=> b!762349 (=> (not res!515462) (not e!424964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42109 (_ BitVec 32)) Bool)

(assert (=> b!762349 (= res!515462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762350 () Bool)

(declare-fun res!515463 () Bool)

(assert (=> b!762350 (=> (not res!515463) (not e!424963))))

(declare-fun arrayContainsKey!0 (array!42109 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762350 (= res!515463 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762351 () Bool)

(declare-fun res!515460 () Bool)

(assert (=> b!762351 (=> (not res!515460) (not e!424964))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762351 (= res!515460 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20583 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20583 a!3186))))))

(declare-fun b!762352 () Bool)

(declare-fun res!515461 () Bool)

(assert (=> b!762352 (=> (not res!515461) (not e!424963))))

(assert (=> b!762352 (= res!515461 (validKeyInArray!0 (select (arr!20162 a!3186) j!159)))))

(declare-fun b!762353 () Bool)

(declare-fun res!515457 () Bool)

(assert (=> b!762353 (=> (not res!515457) (not e!424964))))

(declare-datatypes ((List!14164 0))(
  ( (Nil!14161) (Cons!14160 (h!15244 (_ BitVec 64)) (t!20479 List!14164)) )
))
(declare-fun arrayNoDuplicates!0 (array!42109 (_ BitVec 32) List!14164) Bool)

(assert (=> b!762353 (= res!515457 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14161))))

(assert (= (and start!66204 res!515456) b!762345))

(assert (= (and b!762345 res!515458) b!762352))

(assert (= (and b!762352 res!515461) b!762347))

(assert (= (and b!762347 res!515459) b!762350))

(assert (= (and b!762350 res!515463) b!762348))

(assert (= (and b!762348 res!515464) b!762349))

(assert (= (and b!762349 res!515462) b!762353))

(assert (= (and b!762353 res!515457) b!762351))

(assert (= (and b!762351 res!515460) b!762346))

(declare-fun m!709109 () Bool)

(assert (=> b!762349 m!709109))

(declare-fun m!709111 () Bool)

(assert (=> b!762348 m!709111))

(declare-fun m!709113 () Bool)

(assert (=> b!762350 m!709113))

(declare-fun m!709115 () Bool)

(assert (=> b!762352 m!709115))

(assert (=> b!762352 m!709115))

(declare-fun m!709117 () Bool)

(assert (=> b!762352 m!709117))

(declare-fun m!709119 () Bool)

(assert (=> b!762353 m!709119))

(declare-fun m!709121 () Bool)

(assert (=> start!66204 m!709121))

(declare-fun m!709123 () Bool)

(assert (=> start!66204 m!709123))

(declare-fun m!709125 () Bool)

(assert (=> b!762347 m!709125))

(assert (=> b!762346 m!709115))

(assert (=> b!762346 m!709115))

(declare-fun m!709127 () Bool)

(assert (=> b!762346 m!709127))

(assert (=> b!762346 m!709127))

(assert (=> b!762346 m!709115))

(declare-fun m!709129 () Bool)

(assert (=> b!762346 m!709129))

(push 1)

