; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67666 () Bool)

(assert start!67666)

(declare-fun b!782218 () Bool)

(declare-fun res!529012 () Bool)

(declare-fun e!435116 () Bool)

(assert (=> b!782218 (=> (not res!529012) (not e!435116))))

(declare-datatypes ((array!42649 0))(
  ( (array!42650 (arr!20410 (Array (_ BitVec 32) (_ BitVec 64))) (size!20830 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42649)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782218 (= res!529012 (validKeyInArray!0 (select (arr!20410 a!3186) j!159)))))

(declare-fun b!782219 () Bool)

(declare-fun res!529018 () Bool)

(declare-fun e!435124 () Bool)

(assert (=> b!782219 (=> (not res!529018) (not e!435124))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42649 (_ BitVec 32)) Bool)

(assert (=> b!782219 (= res!529018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!782220 () Bool)

(declare-fun e!435122 () Bool)

(assert (=> b!782220 (= e!435122 true)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!782220 (= (select (store (arr!20410 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!26929 0))(
  ( (Unit!26930) )
))
(declare-fun lt!348562 () Unit!26929)

(declare-fun e!435120 () Unit!26929)

(assert (=> b!782220 (= lt!348562 e!435120)))

(declare-fun c!87013 () Bool)

(assert (=> b!782220 (= c!87013 (= (select (store (arr!20410 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782221 () Bool)

(declare-fun e!435123 () Bool)

(assert (=> b!782221 (= e!435123 (not e!435122))))

(declare-fun res!529026 () Bool)

(assert (=> b!782221 (=> res!529026 e!435122)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7966 0))(
  ( (MissingZero!7966 (index!34232 (_ BitVec 32))) (Found!7966 (index!34233 (_ BitVec 32))) (Intermediate!7966 (undefined!8778 Bool) (index!34234 (_ BitVec 32)) (x!65348 (_ BitVec 32))) (Undefined!7966) (MissingVacant!7966 (index!34235 (_ BitVec 32))) )
))
(declare-fun lt!348570 () SeekEntryResult!7966)

(get-info :version)

(assert (=> b!782221 (= res!529026 (or (not ((_ is Intermediate!7966) lt!348570)) (bvslt x!1131 (x!65348 lt!348570)) (not (= x!1131 (x!65348 lt!348570))) (not (= index!1321 (index!34234 lt!348570)))))))

(declare-fun e!435118 () Bool)

(assert (=> b!782221 e!435118))

(declare-fun res!529022 () Bool)

(assert (=> b!782221 (=> (not res!529022) (not e!435118))))

(declare-fun lt!348563 () SeekEntryResult!7966)

(declare-fun lt!348567 () SeekEntryResult!7966)

(assert (=> b!782221 (= res!529022 (= lt!348563 lt!348567))))

(assert (=> b!782221 (= lt!348567 (Found!7966 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!782221 (= lt!348563 (seekEntryOrOpen!0 (select (arr!20410 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!782221 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348571 () Unit!26929)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42649 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26929)

(assert (=> b!782221 (= lt!348571 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782222 () Bool)

(declare-fun res!529014 () Bool)

(assert (=> b!782222 (=> res!529014 e!435122)))

(declare-fun lt!348568 () (_ BitVec 64))

(assert (=> b!782222 (= res!529014 (= (select (store (arr!20410 a!3186) i!1173 k0!2102) index!1321) lt!348568))))

(declare-fun lt!348564 () SeekEntryResult!7966)

(declare-fun e!435121 () Bool)

(declare-fun b!782224 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!782224 (= e!435121 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20410 a!3186) j!159) a!3186 mask!3328) lt!348564))))

(declare-fun b!782225 () Bool)

(declare-fun e!435119 () Bool)

(assert (=> b!782225 (= e!435119 e!435123)))

(declare-fun res!529013 () Bool)

(assert (=> b!782225 (=> (not res!529013) (not e!435123))))

(declare-fun lt!348565 () SeekEntryResult!7966)

(assert (=> b!782225 (= res!529013 (= lt!348565 lt!348570))))

(declare-fun lt!348566 () array!42649)

(assert (=> b!782225 (= lt!348570 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348568 lt!348566 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782225 (= lt!348565 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348568 mask!3328) lt!348568 lt!348566 mask!3328))))

(assert (=> b!782225 (= lt!348568 (select (store (arr!20410 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!782225 (= lt!348566 (array!42650 (store (arr!20410 a!3186) i!1173 k0!2102) (size!20830 a!3186)))))

(declare-fun b!782226 () Bool)

(declare-fun res!529025 () Bool)

(assert (=> b!782226 (=> res!529025 e!435122)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42649 (_ BitVec 32)) SeekEntryResult!7966)

(assert (=> b!782226 (= res!529025 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20410 a!3186) j!159) a!3186 mask!3328) lt!348567)))))

(declare-fun b!782227 () Bool)

(declare-fun res!529024 () Bool)

(assert (=> b!782227 (=> (not res!529024) (not e!435119))))

(assert (=> b!782227 (= res!529024 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20410 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782228 () Bool)

(declare-fun res!529015 () Bool)

(assert (=> b!782228 (=> (not res!529015) (not e!435124))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!782228 (= res!529015 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20830 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20830 a!3186))))))

(declare-fun b!782229 () Bool)

(declare-fun res!529016 () Bool)

(assert (=> b!782229 (=> (not res!529016) (not e!435124))))

(declare-datatypes ((List!14319 0))(
  ( (Nil!14316) (Cons!14315 (h!15441 (_ BitVec 64)) (t!20626 List!14319)) )
))
(declare-fun arrayNoDuplicates!0 (array!42649 (_ BitVec 32) List!14319) Bool)

(assert (=> b!782229 (= res!529016 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14316))))

(declare-fun b!782230 () Bool)

(assert (=> b!782230 (= e!435121 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20410 a!3186) j!159) a!3186 mask!3328) (Found!7966 j!159)))))

(declare-fun b!782223 () Bool)

(assert (=> b!782223 (= e!435124 e!435119)))

(declare-fun res!529017 () Bool)

(assert (=> b!782223 (=> (not res!529017) (not e!435119))))

(assert (=> b!782223 (= res!529017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20410 a!3186) j!159) mask!3328) (select (arr!20410 a!3186) j!159) a!3186 mask!3328) lt!348564))))

(assert (=> b!782223 (= lt!348564 (Intermediate!7966 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!529019 () Bool)

(assert (=> start!67666 (=> (not res!529019) (not e!435116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67666 (= res!529019 (validMask!0 mask!3328))))

(assert (=> start!67666 e!435116))

(assert (=> start!67666 true))

(declare-fun array_inv!16269 (array!42649) Bool)

(assert (=> start!67666 (array_inv!16269 a!3186)))

(declare-fun b!782231 () Bool)

(declare-fun Unit!26931 () Unit!26929)

(assert (=> b!782231 (= e!435120 Unit!26931)))

(declare-fun b!782232 () Bool)

(assert (=> b!782232 (= e!435118 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20410 a!3186) j!159) a!3186 mask!3328) lt!348567))))

(declare-fun b!782233 () Bool)

(declare-fun res!529021 () Bool)

(assert (=> b!782233 (=> (not res!529021) (not e!435116))))

(assert (=> b!782233 (= res!529021 (and (= (size!20830 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20830 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20830 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782234 () Bool)

(assert (=> b!782234 (= e!435116 e!435124)))

(declare-fun res!529011 () Bool)

(assert (=> b!782234 (=> (not res!529011) (not e!435124))))

(declare-fun lt!348569 () SeekEntryResult!7966)

(assert (=> b!782234 (= res!529011 (or (= lt!348569 (MissingZero!7966 i!1173)) (= lt!348569 (MissingVacant!7966 i!1173))))))

(assert (=> b!782234 (= lt!348569 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!782235 () Bool)

(declare-fun res!529020 () Bool)

(assert (=> b!782235 (=> (not res!529020) (not e!435119))))

(assert (=> b!782235 (= res!529020 e!435121)))

(declare-fun c!87014 () Bool)

(assert (=> b!782235 (= c!87014 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782236 () Bool)

(declare-fun res!529023 () Bool)

(assert (=> b!782236 (=> (not res!529023) (not e!435116))))

(declare-fun arrayContainsKey!0 (array!42649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782236 (= res!529023 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782237 () Bool)

(declare-fun Unit!26932 () Unit!26929)

(assert (=> b!782237 (= e!435120 Unit!26932)))

(assert (=> b!782237 false))

(declare-fun b!782238 () Bool)

(declare-fun res!529010 () Bool)

(assert (=> b!782238 (=> (not res!529010) (not e!435116))))

(assert (=> b!782238 (= res!529010 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67666 res!529019) b!782233))

(assert (= (and b!782233 res!529021) b!782218))

(assert (= (and b!782218 res!529012) b!782238))

(assert (= (and b!782238 res!529010) b!782236))

(assert (= (and b!782236 res!529023) b!782234))

(assert (= (and b!782234 res!529011) b!782219))

(assert (= (and b!782219 res!529018) b!782229))

(assert (= (and b!782229 res!529016) b!782228))

(assert (= (and b!782228 res!529015) b!782223))

(assert (= (and b!782223 res!529017) b!782227))

(assert (= (and b!782227 res!529024) b!782235))

(assert (= (and b!782235 c!87014) b!782224))

(assert (= (and b!782235 (not c!87014)) b!782230))

(assert (= (and b!782235 res!529020) b!782225))

(assert (= (and b!782225 res!529013) b!782221))

(assert (= (and b!782221 res!529022) b!782232))

(assert (= (and b!782221 (not res!529026)) b!782226))

(assert (= (and b!782226 (not res!529025)) b!782222))

(assert (= (and b!782222 (not res!529014)) b!782220))

(assert (= (and b!782220 c!87013) b!782237))

(assert (= (and b!782220 (not c!87013)) b!782231))

(declare-fun m!725633 () Bool)

(assert (=> b!782218 m!725633))

(assert (=> b!782218 m!725633))

(declare-fun m!725635 () Bool)

(assert (=> b!782218 m!725635))

(declare-fun m!725637 () Bool)

(assert (=> b!782229 m!725637))

(declare-fun m!725639 () Bool)

(assert (=> b!782238 m!725639))

(assert (=> b!782221 m!725633))

(assert (=> b!782221 m!725633))

(declare-fun m!725641 () Bool)

(assert (=> b!782221 m!725641))

(declare-fun m!725643 () Bool)

(assert (=> b!782221 m!725643))

(declare-fun m!725645 () Bool)

(assert (=> b!782221 m!725645))

(declare-fun m!725647 () Bool)

(assert (=> b!782225 m!725647))

(declare-fun m!725649 () Bool)

(assert (=> b!782225 m!725649))

(assert (=> b!782225 m!725647))

(declare-fun m!725651 () Bool)

(assert (=> b!782225 m!725651))

(declare-fun m!725653 () Bool)

(assert (=> b!782225 m!725653))

(declare-fun m!725655 () Bool)

(assert (=> b!782225 m!725655))

(declare-fun m!725657 () Bool)

(assert (=> start!67666 m!725657))

(declare-fun m!725659 () Bool)

(assert (=> start!67666 m!725659))

(declare-fun m!725661 () Bool)

(assert (=> b!782219 m!725661))

(assert (=> b!782223 m!725633))

(assert (=> b!782223 m!725633))

(declare-fun m!725663 () Bool)

(assert (=> b!782223 m!725663))

(assert (=> b!782223 m!725663))

(assert (=> b!782223 m!725633))

(declare-fun m!725665 () Bool)

(assert (=> b!782223 m!725665))

(declare-fun m!725667 () Bool)

(assert (=> b!782227 m!725667))

(assert (=> b!782224 m!725633))

(assert (=> b!782224 m!725633))

(declare-fun m!725669 () Bool)

(assert (=> b!782224 m!725669))

(declare-fun m!725671 () Bool)

(assert (=> b!782234 m!725671))

(declare-fun m!725673 () Bool)

(assert (=> b!782236 m!725673))

(assert (=> b!782226 m!725633))

(assert (=> b!782226 m!725633))

(declare-fun m!725675 () Bool)

(assert (=> b!782226 m!725675))

(assert (=> b!782222 m!725649))

(declare-fun m!725677 () Bool)

(assert (=> b!782222 m!725677))

(assert (=> b!782220 m!725649))

(assert (=> b!782220 m!725677))

(assert (=> b!782230 m!725633))

(assert (=> b!782230 m!725633))

(assert (=> b!782230 m!725675))

(assert (=> b!782232 m!725633))

(assert (=> b!782232 m!725633))

(declare-fun m!725679 () Bool)

(assert (=> b!782232 m!725679))

(check-sat (not start!67666) (not b!782238) (not b!782223) (not b!782234) (not b!782230) (not b!782221) (not b!782236) (not b!782224) (not b!782219) (not b!782218) (not b!782225) (not b!782229) (not b!782226) (not b!782232))
(check-sat)
