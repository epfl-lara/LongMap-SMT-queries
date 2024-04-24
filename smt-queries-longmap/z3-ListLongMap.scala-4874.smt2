; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67276 () Bool)

(assert start!67276)

(declare-fun b!776917 () Bool)

(declare-fun e!432405 () Bool)

(declare-fun e!432400 () Bool)

(assert (=> b!776917 (= e!432405 e!432400)))

(declare-fun res!525367 () Bool)

(assert (=> b!776917 (=> (not res!525367) (not e!432400))))

(declare-datatypes ((array!42511 0))(
  ( (array!42512 (arr!20347 (Array (_ BitVec 32) (_ BitVec 64))) (size!20767 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42511)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7903 0))(
  ( (MissingZero!7903 (index!33980 (_ BitVec 32))) (Found!7903 (index!33981 (_ BitVec 32))) (Intermediate!7903 (undefined!8715 Bool) (index!33982 (_ BitVec 32)) (x!65081 (_ BitVec 32))) (Undefined!7903) (MissingVacant!7903 (index!33983 (_ BitVec 32))) )
))
(declare-fun lt!346112 () SeekEntryResult!7903)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!776917 (= res!525367 (= (seekEntryOrOpen!0 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!346112))))

(assert (=> b!776917 (= lt!346112 (Found!7903 j!159))))

(declare-fun b!776918 () Bool)

(declare-fun res!525372 () Bool)

(declare-fun e!432404 () Bool)

(assert (=> b!776918 (=> (not res!525372) (not e!432404))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776918 (= res!525372 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20767 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20767 a!3186))))))

(declare-fun b!776919 () Bool)

(declare-fun res!525370 () Bool)

(declare-fun e!432406 () Bool)

(assert (=> b!776919 (=> (not res!525370) (not e!432406))))

(declare-fun e!432398 () Bool)

(assert (=> b!776919 (= res!525370 e!432398)))

(declare-fun c!86180 () Bool)

(assert (=> b!776919 (= c!86180 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776920 () Bool)

(declare-fun e!432401 () Bool)

(assert (=> b!776920 (= e!432401 true)))

(declare-fun lt!346111 () SeekEntryResult!7903)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!776920 (= lt!346111 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!346116 () SeekEntryResult!7903)

(declare-fun b!776921 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7903)

(assert (=> b!776921 (= e!432398 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!346116))))

(declare-fun b!776922 () Bool)

(assert (=> b!776922 (= e!432398 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) (Found!7903 j!159)))))

(declare-fun b!776923 () Bool)

(assert (=> b!776923 (= e!432400 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!346112))))

(declare-fun res!525368 () Bool)

(declare-fun e!432399 () Bool)

(assert (=> start!67276 (=> (not res!525368) (not e!432399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67276 (= res!525368 (validMask!0 mask!3328))))

(assert (=> start!67276 e!432399))

(assert (=> start!67276 true))

(declare-fun array_inv!16206 (array!42511) Bool)

(assert (=> start!67276 (array_inv!16206 a!3186)))

(declare-fun b!776924 () Bool)

(declare-fun res!525363 () Bool)

(assert (=> b!776924 (=> (not res!525363) (not e!432399))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776924 (= res!525363 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776925 () Bool)

(declare-fun res!525375 () Bool)

(assert (=> b!776925 (=> (not res!525375) (not e!432406))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776925 (= res!525375 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20347 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776926 () Bool)

(declare-fun res!525364 () Bool)

(assert (=> b!776926 (=> (not res!525364) (not e!432399))))

(assert (=> b!776926 (= res!525364 (and (= (size!20767 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20767 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20767 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776927 () Bool)

(declare-fun res!525371 () Bool)

(assert (=> b!776927 (=> (not res!525371) (not e!432399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776927 (= res!525371 (validKeyInArray!0 (select (arr!20347 a!3186) j!159)))))

(declare-fun b!776928 () Bool)

(assert (=> b!776928 (= e!432404 e!432406)))

(declare-fun res!525374 () Bool)

(assert (=> b!776928 (=> (not res!525374) (not e!432406))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776928 (= res!525374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20347 a!3186) j!159) mask!3328) (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!346116))))

(assert (=> b!776928 (= lt!346116 (Intermediate!7903 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776929 () Bool)

(assert (=> b!776929 (= e!432399 e!432404)))

(declare-fun res!525365 () Bool)

(assert (=> b!776929 (=> (not res!525365) (not e!432404))))

(declare-fun lt!346110 () SeekEntryResult!7903)

(assert (=> b!776929 (= res!525365 (or (= lt!346110 (MissingZero!7903 i!1173)) (= lt!346110 (MissingVacant!7903 i!1173))))))

(assert (=> b!776929 (= lt!346110 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776930 () Bool)

(declare-fun res!525369 () Bool)

(assert (=> b!776930 (=> (not res!525369) (not e!432404))))

(declare-datatypes ((List!14256 0))(
  ( (Nil!14253) (Cons!14252 (h!15366 (_ BitVec 64)) (t!20563 List!14256)) )
))
(declare-fun arrayNoDuplicates!0 (array!42511 (_ BitVec 32) List!14256) Bool)

(assert (=> b!776930 (= res!525369 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14253))))

(declare-fun b!776931 () Bool)

(declare-fun e!432403 () Bool)

(assert (=> b!776931 (= e!432403 (not e!432401))))

(declare-fun res!525366 () Bool)

(assert (=> b!776931 (=> res!525366 e!432401)))

(declare-fun lt!346114 () SeekEntryResult!7903)

(get-info :version)

(assert (=> b!776931 (= res!525366 (or (not ((_ is Intermediate!7903) lt!346114)) (bvslt x!1131 (x!65081 lt!346114)) (not (= x!1131 (x!65081 lt!346114))) (not (= index!1321 (index!33982 lt!346114)))))))

(assert (=> b!776931 e!432405))

(declare-fun res!525378 () Bool)

(assert (=> b!776931 (=> (not res!525378) (not e!432405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42511 (_ BitVec 32)) Bool)

(assert (=> b!776931 (= res!525378 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26779 0))(
  ( (Unit!26780) )
))
(declare-fun lt!346113 () Unit!26779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26779)

(assert (=> b!776931 (= lt!346113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776932 () Bool)

(assert (=> b!776932 (= e!432406 e!432403)))

(declare-fun res!525377 () Bool)

(assert (=> b!776932 (=> (not res!525377) (not e!432403))))

(declare-fun lt!346117 () SeekEntryResult!7903)

(assert (=> b!776932 (= res!525377 (= lt!346117 lt!346114))))

(declare-fun lt!346115 () array!42511)

(declare-fun lt!346109 () (_ BitVec 64))

(assert (=> b!776932 (= lt!346114 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346109 lt!346115 mask!3328))))

(assert (=> b!776932 (= lt!346117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346109 mask!3328) lt!346109 lt!346115 mask!3328))))

(assert (=> b!776932 (= lt!346109 (select (store (arr!20347 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776932 (= lt!346115 (array!42512 (store (arr!20347 a!3186) i!1173 k0!2102) (size!20767 a!3186)))))

(declare-fun b!776933 () Bool)

(declare-fun res!525376 () Bool)

(assert (=> b!776933 (=> (not res!525376) (not e!432399))))

(assert (=> b!776933 (= res!525376 (validKeyInArray!0 k0!2102))))

(declare-fun b!776934 () Bool)

(declare-fun res!525373 () Bool)

(assert (=> b!776934 (=> (not res!525373) (not e!432404))))

(assert (=> b!776934 (= res!525373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67276 res!525368) b!776926))

(assert (= (and b!776926 res!525364) b!776927))

(assert (= (and b!776927 res!525371) b!776933))

(assert (= (and b!776933 res!525376) b!776924))

(assert (= (and b!776924 res!525363) b!776929))

(assert (= (and b!776929 res!525365) b!776934))

(assert (= (and b!776934 res!525373) b!776930))

(assert (= (and b!776930 res!525369) b!776918))

(assert (= (and b!776918 res!525372) b!776928))

(assert (= (and b!776928 res!525374) b!776925))

(assert (= (and b!776925 res!525375) b!776919))

(assert (= (and b!776919 c!86180) b!776921))

(assert (= (and b!776919 (not c!86180)) b!776922))

(assert (= (and b!776919 res!525370) b!776932))

(assert (= (and b!776932 res!525377) b!776931))

(assert (= (and b!776931 res!525378) b!776917))

(assert (= (and b!776917 res!525367) b!776923))

(assert (= (and b!776931 (not res!525366)) b!776920))

(declare-fun m!721439 () Bool)

(assert (=> b!776929 m!721439))

(declare-fun m!721441 () Bool)

(assert (=> b!776925 m!721441))

(declare-fun m!721443 () Bool)

(assert (=> b!776930 m!721443))

(declare-fun m!721445 () Bool)

(assert (=> b!776917 m!721445))

(assert (=> b!776917 m!721445))

(declare-fun m!721447 () Bool)

(assert (=> b!776917 m!721447))

(declare-fun m!721449 () Bool)

(assert (=> b!776932 m!721449))

(declare-fun m!721451 () Bool)

(assert (=> b!776932 m!721451))

(declare-fun m!721453 () Bool)

(assert (=> b!776932 m!721453))

(assert (=> b!776932 m!721449))

(declare-fun m!721455 () Bool)

(assert (=> b!776932 m!721455))

(declare-fun m!721457 () Bool)

(assert (=> b!776932 m!721457))

(declare-fun m!721459 () Bool)

(assert (=> b!776933 m!721459))

(assert (=> b!776920 m!721445))

(assert (=> b!776920 m!721445))

(declare-fun m!721461 () Bool)

(assert (=> b!776920 m!721461))

(declare-fun m!721463 () Bool)

(assert (=> b!776931 m!721463))

(declare-fun m!721465 () Bool)

(assert (=> b!776931 m!721465))

(declare-fun m!721467 () Bool)

(assert (=> b!776924 m!721467))

(declare-fun m!721469 () Bool)

(assert (=> b!776934 m!721469))

(assert (=> b!776923 m!721445))

(assert (=> b!776923 m!721445))

(declare-fun m!721471 () Bool)

(assert (=> b!776923 m!721471))

(assert (=> b!776922 m!721445))

(assert (=> b!776922 m!721445))

(assert (=> b!776922 m!721461))

(declare-fun m!721473 () Bool)

(assert (=> start!67276 m!721473))

(declare-fun m!721475 () Bool)

(assert (=> start!67276 m!721475))

(assert (=> b!776927 m!721445))

(assert (=> b!776927 m!721445))

(declare-fun m!721477 () Bool)

(assert (=> b!776927 m!721477))

(assert (=> b!776921 m!721445))

(assert (=> b!776921 m!721445))

(declare-fun m!721479 () Bool)

(assert (=> b!776921 m!721479))

(assert (=> b!776928 m!721445))

(assert (=> b!776928 m!721445))

(declare-fun m!721481 () Bool)

(assert (=> b!776928 m!721481))

(assert (=> b!776928 m!721481))

(assert (=> b!776928 m!721445))

(declare-fun m!721483 () Bool)

(assert (=> b!776928 m!721483))

(check-sat (not b!776922) (not b!776927) (not b!776934) (not b!776921) (not b!776917) (not b!776932) (not b!776933) (not b!776930) (not b!776923) (not b!776928) (not b!776929) (not b!776931) (not b!776924) (not b!776920) (not start!67276))
(check-sat)
