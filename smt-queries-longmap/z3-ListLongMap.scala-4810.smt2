; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66202 () Bool)

(assert start!66202)

(declare-fun b!762318 () Bool)

(declare-fun res!515436 () Bool)

(declare-fun e!424955 () Bool)

(assert (=> b!762318 (=> (not res!515436) (not e!424955))))

(declare-datatypes ((array!42107 0))(
  ( (array!42108 (arr!20161 (Array (_ BitVec 32) (_ BitVec 64))) (size!20582 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42107)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762318 (= res!515436 (validKeyInArray!0 (select (arr!20161 a!3186) j!159)))))

(declare-fun b!762319 () Bool)

(declare-fun res!515429 () Bool)

(assert (=> b!762319 (=> (not res!515429) (not e!424955))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762319 (= res!515429 (and (= (size!20582 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20582 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20582 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515434 () Bool)

(assert (=> start!66202 (=> (not res!515434) (not e!424955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66202 (= res!515434 (validMask!0 mask!3328))))

(assert (=> start!66202 e!424955))

(assert (=> start!66202 true))

(declare-fun array_inv!15957 (array!42107) Bool)

(assert (=> start!66202 (array_inv!15957 a!3186)))

(declare-fun b!762320 () Bool)

(declare-fun res!515431 () Bool)

(assert (=> b!762320 (=> (not res!515431) (not e!424955))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762320 (= res!515431 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762321 () Bool)

(declare-fun res!515430 () Bool)

(declare-fun e!424954 () Bool)

(assert (=> b!762321 (=> (not res!515430) (not e!424954))))

(declare-datatypes ((List!14163 0))(
  ( (Nil!14160) (Cons!14159 (h!15243 (_ BitVec 64)) (t!20478 List!14163)) )
))
(declare-fun arrayNoDuplicates!0 (array!42107 (_ BitVec 32) List!14163) Bool)

(assert (=> b!762321 (= res!515430 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14160))))

(declare-fun b!762322 () Bool)

(declare-fun res!515435 () Bool)

(assert (=> b!762322 (=> (not res!515435) (not e!424954))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762322 (= res!515435 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20582 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20582 a!3186))))))

(declare-fun b!762323 () Bool)

(declare-fun res!515432 () Bool)

(assert (=> b!762323 (=> (not res!515432) (not e!424955))))

(assert (=> b!762323 (= res!515432 (validKeyInArray!0 k0!2102))))

(declare-fun b!762324 () Bool)

(assert (=> b!762324 (= e!424954 false)))

(declare-datatypes ((SeekEntryResult!7761 0))(
  ( (MissingZero!7761 (index!33412 (_ BitVec 32))) (Found!7761 (index!33413 (_ BitVec 32))) (Intermediate!7761 (undefined!8573 Bool) (index!33414 (_ BitVec 32)) (x!64325 (_ BitVec 32))) (Undefined!7761) (MissingVacant!7761 (index!33415 (_ BitVec 32))) )
))
(declare-fun lt!339545 () SeekEntryResult!7761)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42107 (_ BitVec 32)) SeekEntryResult!7761)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762324 (= lt!339545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20161 a!3186) j!159) mask!3328) (select (arr!20161 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!762325 () Bool)

(declare-fun res!515437 () Bool)

(assert (=> b!762325 (=> (not res!515437) (not e!424954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42107 (_ BitVec 32)) Bool)

(assert (=> b!762325 (= res!515437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762326 () Bool)

(assert (=> b!762326 (= e!424955 e!424954)))

(declare-fun res!515433 () Bool)

(assert (=> b!762326 (=> (not res!515433) (not e!424954))))

(declare-fun lt!339544 () SeekEntryResult!7761)

(assert (=> b!762326 (= res!515433 (or (= lt!339544 (MissingZero!7761 i!1173)) (= lt!339544 (MissingVacant!7761 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42107 (_ BitVec 32)) SeekEntryResult!7761)

(assert (=> b!762326 (= lt!339544 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66202 res!515434) b!762319))

(assert (= (and b!762319 res!515429) b!762318))

(assert (= (and b!762318 res!515436) b!762323))

(assert (= (and b!762323 res!515432) b!762320))

(assert (= (and b!762320 res!515431) b!762326))

(assert (= (and b!762326 res!515433) b!762325))

(assert (= (and b!762325 res!515437) b!762321))

(assert (= (and b!762321 res!515430) b!762322))

(assert (= (and b!762322 res!515435) b!762324))

(declare-fun m!709087 () Bool)

(assert (=> b!762321 m!709087))

(declare-fun m!709089 () Bool)

(assert (=> b!762320 m!709089))

(declare-fun m!709091 () Bool)

(assert (=> b!762324 m!709091))

(assert (=> b!762324 m!709091))

(declare-fun m!709093 () Bool)

(assert (=> b!762324 m!709093))

(assert (=> b!762324 m!709093))

(assert (=> b!762324 m!709091))

(declare-fun m!709095 () Bool)

(assert (=> b!762324 m!709095))

(declare-fun m!709097 () Bool)

(assert (=> start!66202 m!709097))

(declare-fun m!709099 () Bool)

(assert (=> start!66202 m!709099))

(assert (=> b!762318 m!709091))

(assert (=> b!762318 m!709091))

(declare-fun m!709101 () Bool)

(assert (=> b!762318 m!709101))

(declare-fun m!709103 () Bool)

(assert (=> b!762325 m!709103))

(declare-fun m!709105 () Bool)

(assert (=> b!762323 m!709105))

(declare-fun m!709107 () Bool)

(assert (=> b!762326 m!709107))

(check-sat (not start!66202) (not b!762320) (not b!762318) (not b!762323) (not b!762325) (not b!762321) (not b!762326) (not b!762324))
(check-sat)
