; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66258 () Bool)

(assert start!66258)

(declare-fun b!763340 () Bool)

(declare-fun res!516330 () Bool)

(declare-fun e!425333 () Bool)

(assert (=> b!763340 (=> (not res!516330) (not e!425333))))

(declare-datatypes ((array!42163 0))(
  ( (array!42164 (arr!20189 (Array (_ BitVec 32) (_ BitVec 64))) (size!20610 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42163)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763340 (= res!516330 (and (= (size!20610 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20610 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20610 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763341 () Bool)

(declare-fun e!425334 () Bool)

(assert (=> b!763341 (= e!425333 e!425334)))

(declare-fun res!516332 () Bool)

(assert (=> b!763341 (=> (not res!516332) (not e!425334))))

(declare-datatypes ((SeekEntryResult!7789 0))(
  ( (MissingZero!7789 (index!33524 (_ BitVec 32))) (Found!7789 (index!33525 (_ BitVec 32))) (Intermediate!7789 (undefined!8601 Bool) (index!33526 (_ BitVec 32)) (x!64425 (_ BitVec 32))) (Undefined!7789) (MissingVacant!7789 (index!33527 (_ BitVec 32))) )
))
(declare-fun lt!339776 () SeekEntryResult!7789)

(assert (=> b!763341 (= res!516332 (or (= lt!339776 (MissingZero!7789 i!1173)) (= lt!339776 (MissingVacant!7789 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763341 (= lt!339776 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763342 () Bool)

(declare-fun res!516337 () Bool)

(assert (=> b!763342 (=> (not res!516337) (not e!425334))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763342 (= res!516337 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20610 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20610 a!3186))))))

(declare-fun b!763343 () Bool)

(declare-fun e!425332 () Bool)

(assert (=> b!763343 (= e!425332 false)))

(declare-fun lt!339775 () Bool)

(declare-fun e!425330 () Bool)

(assert (=> b!763343 (= lt!339775 e!425330)))

(declare-fun c!83893 () Bool)

(assert (=> b!763343 (= c!83893 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763344 () Bool)

(declare-fun lt!339774 () SeekEntryResult!7789)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763344 (= e!425330 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20189 a!3186) j!159) a!3186 mask!3328) lt!339774)))))

(declare-fun b!763345 () Bool)

(declare-fun res!516334 () Bool)

(assert (=> b!763345 (=> (not res!516334) (not e!425333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763345 (= res!516334 (validKeyInArray!0 (select (arr!20189 a!3186) j!159)))))

(declare-fun b!763346 () Bool)

(declare-fun res!516335 () Bool)

(assert (=> b!763346 (=> (not res!516335) (not e!425333))))

(declare-fun arrayContainsKey!0 (array!42163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763346 (= res!516335 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763347 () Bool)

(declare-fun res!516331 () Bool)

(assert (=> b!763347 (=> (not res!516331) (not e!425333))))

(assert (=> b!763347 (= res!516331 (validKeyInArray!0 k!2102))))

(declare-fun res!516333 () Bool)

(assert (=> start!66258 (=> (not res!516333) (not e!425333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66258 (= res!516333 (validMask!0 mask!3328))))

(assert (=> start!66258 e!425333))

(assert (=> start!66258 true))

(declare-fun array_inv!15985 (array!42163) Bool)

(assert (=> start!66258 (array_inv!15985 a!3186)))

(declare-fun b!763348 () Bool)

(declare-fun res!516336 () Bool)

(assert (=> b!763348 (=> (not res!516336) (not e!425332))))

(assert (=> b!763348 (= res!516336 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20189 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763349 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7789)

(assert (=> b!763349 (= e!425330 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20189 a!3186) j!159) a!3186 mask!3328) (Found!7789 j!159))))))

(declare-fun b!763350 () Bool)

(declare-fun res!516328 () Bool)

(assert (=> b!763350 (=> (not res!516328) (not e!425334))))

(declare-datatypes ((List!14191 0))(
  ( (Nil!14188) (Cons!14187 (h!15271 (_ BitVec 64)) (t!20506 List!14191)) )
))
(declare-fun arrayNoDuplicates!0 (array!42163 (_ BitVec 32) List!14191) Bool)

(assert (=> b!763350 (= res!516328 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14188))))

(declare-fun b!763351 () Bool)

(declare-fun res!516327 () Bool)

(assert (=> b!763351 (=> (not res!516327) (not e!425334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42163 (_ BitVec 32)) Bool)

(assert (=> b!763351 (= res!516327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763352 () Bool)

(assert (=> b!763352 (= e!425334 e!425332)))

(declare-fun res!516329 () Bool)

(assert (=> b!763352 (=> (not res!516329) (not e!425332))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763352 (= res!516329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20189 a!3186) j!159) mask!3328) (select (arr!20189 a!3186) j!159) a!3186 mask!3328) lt!339774))))

(assert (=> b!763352 (= lt!339774 (Intermediate!7789 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66258 res!516333) b!763340))

(assert (= (and b!763340 res!516330) b!763345))

(assert (= (and b!763345 res!516334) b!763347))

(assert (= (and b!763347 res!516331) b!763346))

(assert (= (and b!763346 res!516335) b!763341))

(assert (= (and b!763341 res!516332) b!763351))

(assert (= (and b!763351 res!516327) b!763350))

(assert (= (and b!763350 res!516328) b!763342))

(assert (= (and b!763342 res!516337) b!763352))

(assert (= (and b!763352 res!516329) b!763348))

(assert (= (and b!763348 res!516336) b!763343))

(assert (= (and b!763343 c!83893) b!763344))

(assert (= (and b!763343 (not c!83893)) b!763349))

(declare-fun m!709859 () Bool)

(assert (=> b!763352 m!709859))

(assert (=> b!763352 m!709859))

(declare-fun m!709861 () Bool)

(assert (=> b!763352 m!709861))

(assert (=> b!763352 m!709861))

(assert (=> b!763352 m!709859))

(declare-fun m!709863 () Bool)

(assert (=> b!763352 m!709863))

(assert (=> b!763345 m!709859))

(assert (=> b!763345 m!709859))

(declare-fun m!709865 () Bool)

(assert (=> b!763345 m!709865))

(declare-fun m!709867 () Bool)

(assert (=> b!763348 m!709867))

(declare-fun m!709869 () Bool)

(assert (=> b!763350 m!709869))

(declare-fun m!709871 () Bool)

(assert (=> b!763341 m!709871))

(declare-fun m!709873 () Bool)

(assert (=> b!763346 m!709873))

(declare-fun m!709875 () Bool)

(assert (=> b!763347 m!709875))

(declare-fun m!709877 () Bool)

(assert (=> start!66258 m!709877))

(declare-fun m!709879 () Bool)

(assert (=> start!66258 m!709879))

(assert (=> b!763349 m!709859))

(assert (=> b!763349 m!709859))

(declare-fun m!709881 () Bool)

(assert (=> b!763349 m!709881))

(declare-fun m!709883 () Bool)

(assert (=> b!763351 m!709883))

(assert (=> b!763344 m!709859))

(assert (=> b!763344 m!709859))

(declare-fun m!709885 () Bool)

(assert (=> b!763344 m!709885))

(push 1)

(assert (not b!763351))

