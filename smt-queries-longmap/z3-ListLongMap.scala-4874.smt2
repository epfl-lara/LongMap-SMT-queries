; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67160 () Bool)

(assert start!67160)

(declare-fun b!776326 () Bool)

(declare-fun res!525150 () Bool)

(declare-fun e!432010 () Bool)

(assert (=> b!776326 (=> (not res!525150) (not e!432010))))

(declare-datatypes ((array!42515 0))(
  ( (array!42516 (arr!20353 (Array (_ BitVec 32) (_ BitVec 64))) (size!20774 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42515)

(declare-datatypes ((List!14355 0))(
  ( (Nil!14352) (Cons!14351 (h!15459 (_ BitVec 64)) (t!20670 List!14355)) )
))
(declare-fun arrayNoDuplicates!0 (array!42515 (_ BitVec 32) List!14355) Bool)

(assert (=> b!776326 (= res!525150 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14352))))

(declare-fun b!776327 () Bool)

(declare-fun e!432014 () Bool)

(declare-fun e!432012 () Bool)

(assert (=> b!776327 (= e!432014 e!432012)))

(declare-fun res!525155 () Bool)

(assert (=> b!776327 (=> (not res!525155) (not e!432012))))

(declare-datatypes ((SeekEntryResult!7953 0))(
  ( (MissingZero!7953 (index!34180 (_ BitVec 32))) (Found!7953 (index!34181 (_ BitVec 32))) (Intermediate!7953 (undefined!8765 Bool) (index!34182 (_ BitVec 32)) (x!65120 (_ BitVec 32))) (Undefined!7953) (MissingVacant!7953 (index!34183 (_ BitVec 32))) )
))
(declare-fun lt!345869 () SeekEntryResult!7953)

(declare-fun lt!345872 () SeekEntryResult!7953)

(assert (=> b!776327 (= res!525155 (= lt!345869 lt!345872))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!345868 () array!42515)

(declare-fun lt!345864 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42515 (_ BitVec 32)) SeekEntryResult!7953)

(assert (=> b!776327 (= lt!345872 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345864 lt!345868 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776327 (= lt!345869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345864 mask!3328) lt!345864 lt!345868 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!776327 (= lt!345864 (select (store (arr!20353 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776327 (= lt!345868 (array!42516 (store (arr!20353 a!3186) i!1173 k0!2102) (size!20774 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!432015 () Bool)

(declare-fun b!776328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42515 (_ BitVec 32)) SeekEntryResult!7953)

(assert (=> b!776328 (= e!432015 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) (Found!7953 j!159)))))

(declare-fun b!776329 () Bool)

(declare-fun res!525152 () Bool)

(assert (=> b!776329 (=> (not res!525152) (not e!432014))))

(assert (=> b!776329 (= res!525152 e!432015)))

(declare-fun c!85993 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776329 (= c!85993 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!345865 () SeekEntryResult!7953)

(declare-fun b!776330 () Bool)

(assert (=> b!776330 (= e!432015 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!345865))))

(declare-fun b!776331 () Bool)

(declare-fun e!432013 () Bool)

(assert (=> b!776331 (= e!432012 (not e!432013))))

(declare-fun res!525148 () Bool)

(assert (=> b!776331 (=> res!525148 e!432013)))

(get-info :version)

(assert (=> b!776331 (= res!525148 (or (not ((_ is Intermediate!7953) lt!345872)) (bvslt x!1131 (x!65120 lt!345872)) (not (= x!1131 (x!65120 lt!345872))) (not (= index!1321 (index!34182 lt!345872)))))))

(declare-fun e!432017 () Bool)

(assert (=> b!776331 e!432017))

(declare-fun res!525141 () Bool)

(assert (=> b!776331 (=> (not res!525141) (not e!432017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42515 (_ BitVec 32)) Bool)

(assert (=> b!776331 (= res!525141 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26800 0))(
  ( (Unit!26801) )
))
(declare-fun lt!345867 () Unit!26800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26800)

(assert (=> b!776331 (= lt!345867 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776332 () Bool)

(declare-fun res!525153 () Bool)

(assert (=> b!776332 (=> (not res!525153) (not e!432014))))

(assert (=> b!776332 (= res!525153 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20353 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!525146 () Bool)

(declare-fun e!432009 () Bool)

(assert (=> start!67160 (=> (not res!525146) (not e!432009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67160 (= res!525146 (validMask!0 mask!3328))))

(assert (=> start!67160 e!432009))

(assert (=> start!67160 true))

(declare-fun array_inv!16149 (array!42515) Bool)

(assert (=> start!67160 (array_inv!16149 a!3186)))

(declare-fun b!776333 () Bool)

(declare-fun e!432016 () Bool)

(assert (=> b!776333 (= e!432017 e!432016)))

(declare-fun res!525144 () Bool)

(assert (=> b!776333 (=> (not res!525144) (not e!432016))))

(declare-fun lt!345871 () SeekEntryResult!7953)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42515 (_ BitVec 32)) SeekEntryResult!7953)

(assert (=> b!776333 (= res!525144 (= (seekEntryOrOpen!0 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!345871))))

(assert (=> b!776333 (= lt!345871 (Found!7953 j!159))))

(declare-fun b!776334 () Bool)

(declare-fun res!525142 () Bool)

(assert (=> b!776334 (=> (not res!525142) (not e!432009))))

(assert (=> b!776334 (= res!525142 (and (= (size!20774 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20774 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20774 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776335 () Bool)

(declare-fun res!525151 () Bool)

(assert (=> b!776335 (=> (not res!525151) (not e!432009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776335 (= res!525151 (validKeyInArray!0 (select (arr!20353 a!3186) j!159)))))

(declare-fun b!776336 () Bool)

(declare-fun res!525140 () Bool)

(assert (=> b!776336 (=> (not res!525140) (not e!432009))))

(declare-fun arrayContainsKey!0 (array!42515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776336 (= res!525140 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776337 () Bool)

(assert (=> b!776337 (= e!432009 e!432010)))

(declare-fun res!525143 () Bool)

(assert (=> b!776337 (=> (not res!525143) (not e!432010))))

(declare-fun lt!345866 () SeekEntryResult!7953)

(assert (=> b!776337 (= res!525143 (or (= lt!345866 (MissingZero!7953 i!1173)) (= lt!345866 (MissingVacant!7953 i!1173))))))

(assert (=> b!776337 (= lt!345866 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776338 () Bool)

(assert (=> b!776338 (= e!432016 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!345871))))

(declare-fun b!776339 () Bool)

(declare-fun res!525154 () Bool)

(assert (=> b!776339 (=> (not res!525154) (not e!432009))))

(assert (=> b!776339 (= res!525154 (validKeyInArray!0 k0!2102))))

(declare-fun b!776340 () Bool)

(assert (=> b!776340 (= e!432013 true)))

(declare-fun lt!345870 () SeekEntryResult!7953)

(assert (=> b!776340 (= lt!345870 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20353 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776341 () Bool)

(assert (=> b!776341 (= e!432010 e!432014)))

(declare-fun res!525149 () Bool)

(assert (=> b!776341 (=> (not res!525149) (not e!432014))))

(assert (=> b!776341 (= res!525149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20353 a!3186) j!159) mask!3328) (select (arr!20353 a!3186) j!159) a!3186 mask!3328) lt!345865))))

(assert (=> b!776341 (= lt!345865 (Intermediate!7953 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776342 () Bool)

(declare-fun res!525147 () Bool)

(assert (=> b!776342 (=> (not res!525147) (not e!432010))))

(assert (=> b!776342 (= res!525147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776343 () Bool)

(declare-fun res!525145 () Bool)

(assert (=> b!776343 (=> (not res!525145) (not e!432010))))

(assert (=> b!776343 (= res!525145 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20774 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20774 a!3186))))))

(assert (= (and start!67160 res!525146) b!776334))

(assert (= (and b!776334 res!525142) b!776335))

(assert (= (and b!776335 res!525151) b!776339))

(assert (= (and b!776339 res!525154) b!776336))

(assert (= (and b!776336 res!525140) b!776337))

(assert (= (and b!776337 res!525143) b!776342))

(assert (= (and b!776342 res!525147) b!776326))

(assert (= (and b!776326 res!525150) b!776343))

(assert (= (and b!776343 res!525145) b!776341))

(assert (= (and b!776341 res!525149) b!776332))

(assert (= (and b!776332 res!525153) b!776329))

(assert (= (and b!776329 c!85993) b!776330))

(assert (= (and b!776329 (not c!85993)) b!776328))

(assert (= (and b!776329 res!525152) b!776327))

(assert (= (and b!776327 res!525155) b!776331))

(assert (= (and b!776331 res!525141) b!776333))

(assert (= (and b!776333 res!525144) b!776338))

(assert (= (and b!776331 (not res!525148)) b!776340))

(declare-fun m!720423 () Bool)

(assert (=> b!776333 m!720423))

(assert (=> b!776333 m!720423))

(declare-fun m!720425 () Bool)

(assert (=> b!776333 m!720425))

(assert (=> b!776330 m!720423))

(assert (=> b!776330 m!720423))

(declare-fun m!720427 () Bool)

(assert (=> b!776330 m!720427))

(declare-fun m!720429 () Bool)

(assert (=> b!776336 m!720429))

(declare-fun m!720431 () Bool)

(assert (=> start!67160 m!720431))

(declare-fun m!720433 () Bool)

(assert (=> start!67160 m!720433))

(declare-fun m!720435 () Bool)

(assert (=> b!776332 m!720435))

(declare-fun m!720437 () Bool)

(assert (=> b!776342 m!720437))

(assert (=> b!776341 m!720423))

(assert (=> b!776341 m!720423))

(declare-fun m!720439 () Bool)

(assert (=> b!776341 m!720439))

(assert (=> b!776341 m!720439))

(assert (=> b!776341 m!720423))

(declare-fun m!720441 () Bool)

(assert (=> b!776341 m!720441))

(assert (=> b!776338 m!720423))

(assert (=> b!776338 m!720423))

(declare-fun m!720443 () Bool)

(assert (=> b!776338 m!720443))

(declare-fun m!720445 () Bool)

(assert (=> b!776331 m!720445))

(declare-fun m!720447 () Bool)

(assert (=> b!776331 m!720447))

(declare-fun m!720449 () Bool)

(assert (=> b!776337 m!720449))

(declare-fun m!720451 () Bool)

(assert (=> b!776326 m!720451))

(declare-fun m!720453 () Bool)

(assert (=> b!776327 m!720453))

(declare-fun m!720455 () Bool)

(assert (=> b!776327 m!720455))

(declare-fun m!720457 () Bool)

(assert (=> b!776327 m!720457))

(declare-fun m!720459 () Bool)

(assert (=> b!776327 m!720459))

(declare-fun m!720461 () Bool)

(assert (=> b!776327 m!720461))

(assert (=> b!776327 m!720459))

(assert (=> b!776328 m!720423))

(assert (=> b!776328 m!720423))

(declare-fun m!720463 () Bool)

(assert (=> b!776328 m!720463))

(assert (=> b!776335 m!720423))

(assert (=> b!776335 m!720423))

(declare-fun m!720465 () Bool)

(assert (=> b!776335 m!720465))

(assert (=> b!776340 m!720423))

(assert (=> b!776340 m!720423))

(assert (=> b!776340 m!720463))

(declare-fun m!720467 () Bool)

(assert (=> b!776339 m!720467))

(check-sat (not b!776331) (not b!776337) (not b!776339) (not b!776328) (not b!776342) (not b!776330) (not b!776327) (not b!776333) (not b!776336) (not b!776326) (not start!67160) (not b!776340) (not b!776341) (not b!776335) (not b!776338))
(check-sat)
