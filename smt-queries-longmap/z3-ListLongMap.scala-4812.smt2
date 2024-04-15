; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66192 () Bool)

(assert start!66192)

(declare-fun b!762203 () Bool)

(declare-fun e!424847 () Bool)

(assert (=> b!762203 (= e!424847 false)))

(declare-datatypes ((array!42114 0))(
  ( (array!42115 (arr!20165 (Array (_ BitVec 32) (_ BitVec 64))) (size!20586 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42114)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7762 0))(
  ( (MissingZero!7762 (index!33416 (_ BitVec 32))) (Found!7762 (index!33417 (_ BitVec 32))) (Intermediate!7762 (undefined!8574 Bool) (index!33418 (_ BitVec 32)) (x!64337 (_ BitVec 32))) (Undefined!7762) (MissingVacant!7762 (index!33419 (_ BitVec 32))) )
))
(declare-fun lt!339334 () SeekEntryResult!7762)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42114 (_ BitVec 32)) SeekEntryResult!7762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762203 (= lt!339334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20165 a!3186) j!159) mask!3328) (select (arr!20165 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762204 () Bool)

(declare-fun res!515454 () Bool)

(declare-fun e!424846 () Bool)

(assert (=> b!762204 (=> (not res!515454) (not e!424846))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762204 (= res!515454 (validKeyInArray!0 k0!2102))))

(declare-fun b!762205 () Bool)

(declare-fun res!515461 () Bool)

(assert (=> b!762205 (=> (not res!515461) (not e!424846))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762205 (= res!515461 (and (= (size!20586 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20586 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20586 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762206 () Bool)

(declare-fun res!515460 () Bool)

(assert (=> b!762206 (=> (not res!515460) (not e!424847))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762206 (= res!515460 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20586 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20586 a!3186))))))

(declare-fun res!515456 () Bool)

(assert (=> start!66192 (=> (not res!515456) (not e!424846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66192 (= res!515456 (validMask!0 mask!3328))))

(assert (=> start!66192 e!424846))

(assert (=> start!66192 true))

(declare-fun array_inv!16048 (array!42114) Bool)

(assert (=> start!66192 (array_inv!16048 a!3186)))

(declare-fun b!762207 () Bool)

(declare-fun res!515459 () Bool)

(assert (=> b!762207 (=> (not res!515459) (not e!424847))))

(declare-datatypes ((List!14206 0))(
  ( (Nil!14203) (Cons!14202 (h!15286 (_ BitVec 64)) (t!20512 List!14206)) )
))
(declare-fun arrayNoDuplicates!0 (array!42114 (_ BitVec 32) List!14206) Bool)

(assert (=> b!762207 (= res!515459 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14203))))

(declare-fun b!762208 () Bool)

(assert (=> b!762208 (= e!424846 e!424847)))

(declare-fun res!515455 () Bool)

(assert (=> b!762208 (=> (not res!515455) (not e!424847))))

(declare-fun lt!339335 () SeekEntryResult!7762)

(assert (=> b!762208 (= res!515455 (or (= lt!339335 (MissingZero!7762 i!1173)) (= lt!339335 (MissingVacant!7762 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42114 (_ BitVec 32)) SeekEntryResult!7762)

(assert (=> b!762208 (= lt!339335 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762209 () Bool)

(declare-fun res!515458 () Bool)

(assert (=> b!762209 (=> (not res!515458) (not e!424846))))

(declare-fun arrayContainsKey!0 (array!42114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762209 (= res!515458 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762210 () Bool)

(declare-fun res!515462 () Bool)

(assert (=> b!762210 (=> (not res!515462) (not e!424846))))

(assert (=> b!762210 (= res!515462 (validKeyInArray!0 (select (arr!20165 a!3186) j!159)))))

(declare-fun b!762211 () Bool)

(declare-fun res!515457 () Bool)

(assert (=> b!762211 (=> (not res!515457) (not e!424847))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42114 (_ BitVec 32)) Bool)

(assert (=> b!762211 (= res!515457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66192 res!515456) b!762205))

(assert (= (and b!762205 res!515461) b!762210))

(assert (= (and b!762210 res!515462) b!762204))

(assert (= (and b!762204 res!515454) b!762209))

(assert (= (and b!762209 res!515458) b!762208))

(assert (= (and b!762208 res!515455) b!762211))

(assert (= (and b!762211 res!515457) b!762207))

(assert (= (and b!762207 res!515459) b!762206))

(assert (= (and b!762206 res!515460) b!762203))

(declare-fun m!708439 () Bool)

(assert (=> b!762210 m!708439))

(assert (=> b!762210 m!708439))

(declare-fun m!708441 () Bool)

(assert (=> b!762210 m!708441))

(declare-fun m!708443 () Bool)

(assert (=> b!762204 m!708443))

(declare-fun m!708445 () Bool)

(assert (=> b!762207 m!708445))

(assert (=> b!762203 m!708439))

(assert (=> b!762203 m!708439))

(declare-fun m!708447 () Bool)

(assert (=> b!762203 m!708447))

(assert (=> b!762203 m!708447))

(assert (=> b!762203 m!708439))

(declare-fun m!708449 () Bool)

(assert (=> b!762203 m!708449))

(declare-fun m!708451 () Bool)

(assert (=> b!762209 m!708451))

(declare-fun m!708453 () Bool)

(assert (=> start!66192 m!708453))

(declare-fun m!708455 () Bool)

(assert (=> start!66192 m!708455))

(declare-fun m!708457 () Bool)

(assert (=> b!762211 m!708457))

(declare-fun m!708459 () Bool)

(assert (=> b!762208 m!708459))

(check-sat (not b!762207) (not b!762211) (not b!762204) (not b!762209) (not b!762210) (not b!762203) (not start!66192) (not b!762208))
(check-sat)
