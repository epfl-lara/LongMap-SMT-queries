; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65712 () Bool)

(assert start!65712)

(declare-fun b!750394 () Bool)

(declare-fun res!506169 () Bool)

(declare-fun e!418782 () Bool)

(assert (=> b!750394 (=> (not res!506169) (not e!418782))))

(declare-datatypes ((array!41755 0))(
  ( (array!41756 (arr!19987 (Array (_ BitVec 32) (_ BitVec 64))) (size!20407 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41755)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!750394 (= res!506169 (and (= (size!20407 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20407 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20407 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750395 () Bool)

(declare-fun res!506163 () Bool)

(declare-fun e!418780 () Bool)

(assert (=> b!750395 (=> (not res!506163) (not e!418780))))

(declare-fun e!418774 () Bool)

(assert (=> b!750395 (= res!506163 e!418774)))

(declare-fun c!82504 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750395 (= c!82504 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750396 () Bool)

(declare-fun res!506158 () Bool)

(declare-fun e!418781 () Bool)

(assert (=> b!750396 (=> (not res!506158) (not e!418781))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!750396 (= res!506158 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20407 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20407 a!3186))))))

(declare-fun b!750397 () Bool)

(declare-datatypes ((Unit!25729 0))(
  ( (Unit!25730) )
))
(declare-fun e!418772 () Unit!25729)

(declare-fun Unit!25731 () Unit!25729)

(assert (=> b!750397 (= e!418772 Unit!25731)))

(assert (=> b!750397 false))

(declare-fun e!418775 () Bool)

(declare-fun b!750398 () Bool)

(declare-datatypes ((SeekEntryResult!7543 0))(
  ( (MissingZero!7543 (index!32540 (_ BitVec 32))) (Found!7543 (index!32541 (_ BitVec 32))) (Intermediate!7543 (undefined!8355 Bool) (index!32542 (_ BitVec 32)) (x!63633 (_ BitVec 32))) (Undefined!7543) (MissingVacant!7543 (index!32543 (_ BitVec 32))) )
))
(declare-fun lt!333606 () SeekEntryResult!7543)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!750398 (= e!418775 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333606))))

(declare-fun res!506164 () Bool)

(assert (=> start!65712 (=> (not res!506164) (not e!418782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65712 (= res!506164 (validMask!0 mask!3328))))

(assert (=> start!65712 e!418782))

(assert (=> start!65712 true))

(declare-fun array_inv!15846 (array!41755) Bool)

(assert (=> start!65712 (array_inv!15846 a!3186)))

(declare-fun b!750399 () Bool)

(assert (=> b!750399 (= e!418781 e!418780)))

(declare-fun res!506155 () Bool)

(assert (=> b!750399 (=> (not res!506155) (not e!418780))))

(declare-fun lt!333602 () SeekEntryResult!7543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750399 (= res!506155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19987 a!3186) j!159) mask!3328) (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333602))))

(assert (=> b!750399 (= lt!333602 (Intermediate!7543 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750400 () Bool)

(declare-fun res!506165 () Bool)

(assert (=> b!750400 (=> (not res!506165) (not e!418782))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750400 (= res!506165 (validKeyInArray!0 k0!2102))))

(declare-fun b!750401 () Bool)

(assert (=> b!750401 (= e!418782 e!418781)))

(declare-fun res!506162 () Bool)

(assert (=> b!750401 (=> (not res!506162) (not e!418781))))

(declare-fun lt!333599 () SeekEntryResult!7543)

(assert (=> b!750401 (= res!506162 (or (= lt!333599 (MissingZero!7543 i!1173)) (= lt!333599 (MissingVacant!7543 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41755 (_ BitVec 32)) SeekEntryResult!7543)

(assert (=> b!750401 (= lt!333599 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750402 () Bool)

(declare-fun Unit!25732 () Unit!25729)

(assert (=> b!750402 (= e!418772 Unit!25732)))

(declare-fun b!750403 () Bool)

(assert (=> b!750403 (= e!418774 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333602))))

(declare-fun b!750404 () Bool)

(declare-fun e!418773 () Bool)

(declare-fun e!418776 () Bool)

(assert (=> b!750404 (= e!418773 (not e!418776))))

(declare-fun res!506170 () Bool)

(assert (=> b!750404 (=> res!506170 e!418776)))

(declare-fun lt!333603 () SeekEntryResult!7543)

(get-info :version)

(assert (=> b!750404 (= res!506170 (or (not ((_ is Intermediate!7543) lt!333603)) (bvslt x!1131 (x!63633 lt!333603)) (not (= x!1131 (x!63633 lt!333603))) (not (= index!1321 (index!32542 lt!333603)))))))

(assert (=> b!750404 e!418775))

(declare-fun res!506166 () Bool)

(assert (=> b!750404 (=> (not res!506166) (not e!418775))))

(declare-fun lt!333609 () SeekEntryResult!7543)

(assert (=> b!750404 (= res!506166 (= lt!333609 lt!333606))))

(assert (=> b!750404 (= lt!333606 (Found!7543 j!159))))

(assert (=> b!750404 (= lt!333609 (seekEntryOrOpen!0 (select (arr!19987 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41755 (_ BitVec 32)) Bool)

(assert (=> b!750404 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333601 () Unit!25729)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25729)

(assert (=> b!750404 (= lt!333601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750405 () Bool)

(assert (=> b!750405 (= e!418774 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) (Found!7543 j!159)))))

(declare-fun b!750406 () Bool)

(declare-fun res!506153 () Bool)

(assert (=> b!750406 (=> (not res!506153) (not e!418781))))

(assert (=> b!750406 (= res!506153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750407 () Bool)

(declare-fun res!506167 () Bool)

(assert (=> b!750407 (=> (not res!506167) (not e!418782))))

(declare-fun arrayContainsKey!0 (array!41755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750407 (= res!506167 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750408 () Bool)

(declare-fun res!506154 () Bool)

(assert (=> b!750408 (=> (not res!506154) (not e!418781))))

(declare-datatypes ((List!13896 0))(
  ( (Nil!13893) (Cons!13892 (h!14970 (_ BitVec 64)) (t!20203 List!13896)) )
))
(declare-fun arrayNoDuplicates!0 (array!41755 (_ BitVec 32) List!13896) Bool)

(assert (=> b!750408 (= res!506154 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13893))))

(declare-fun b!750409 () Bool)

(assert (=> b!750409 (= e!418780 e!418773)))

(declare-fun res!506156 () Bool)

(assert (=> b!750409 (=> (not res!506156) (not e!418773))))

(declare-fun lt!333608 () SeekEntryResult!7543)

(assert (=> b!750409 (= res!506156 (= lt!333608 lt!333603))))

(declare-fun lt!333604 () (_ BitVec 64))

(declare-fun lt!333600 () array!41755)

(assert (=> b!750409 (= lt!333603 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333604 lt!333600 mask!3328))))

(assert (=> b!750409 (= lt!333608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333604 mask!3328) lt!333604 lt!333600 mask!3328))))

(assert (=> b!750409 (= lt!333604 (select (store (arr!19987 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750409 (= lt!333600 (array!41756 (store (arr!19987 a!3186) i!1173 k0!2102) (size!20407 a!3186)))))

(declare-fun b!750410 () Bool)

(declare-fun e!418779 () Bool)

(assert (=> b!750410 (= e!418779 true)))

(declare-fun e!418777 () Bool)

(assert (=> b!750410 e!418777))

(declare-fun res!506159 () Bool)

(assert (=> b!750410 (=> (not res!506159) (not e!418777))))

(declare-fun lt!333607 () (_ BitVec 64))

(assert (=> b!750410 (= res!506159 (= lt!333607 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333605 () Unit!25729)

(assert (=> b!750410 (= lt!333605 e!418772)))

(declare-fun c!82505 () Bool)

(assert (=> b!750410 (= c!82505 (= lt!333607 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750411 () Bool)

(declare-fun res!506160 () Bool)

(assert (=> b!750411 (=> (not res!506160) (not e!418780))))

(assert (=> b!750411 (= res!506160 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19987 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750412 () Bool)

(assert (=> b!750412 (= e!418777 (= (seekEntryOrOpen!0 lt!333604 lt!333600 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333604 lt!333600 mask!3328)))))

(declare-fun b!750413 () Bool)

(declare-fun res!506157 () Bool)

(assert (=> b!750413 (=> (not res!506157) (not e!418782))))

(assert (=> b!750413 (= res!506157 (validKeyInArray!0 (select (arr!19987 a!3186) j!159)))))

(declare-fun b!750414 () Bool)

(assert (=> b!750414 (= e!418776 e!418779)))

(declare-fun res!506168 () Bool)

(assert (=> b!750414 (=> res!506168 e!418779)))

(assert (=> b!750414 (= res!506168 (= lt!333607 lt!333604))))

(assert (=> b!750414 (= lt!333607 (select (store (arr!19987 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750415 () Bool)

(declare-fun res!506161 () Bool)

(assert (=> b!750415 (=> res!506161 e!418776)))

(assert (=> b!750415 (= res!506161 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333606)))))

(assert (= (and start!65712 res!506164) b!750394))

(assert (= (and b!750394 res!506169) b!750413))

(assert (= (and b!750413 res!506157) b!750400))

(assert (= (and b!750400 res!506165) b!750407))

(assert (= (and b!750407 res!506167) b!750401))

(assert (= (and b!750401 res!506162) b!750406))

(assert (= (and b!750406 res!506153) b!750408))

(assert (= (and b!750408 res!506154) b!750396))

(assert (= (and b!750396 res!506158) b!750399))

(assert (= (and b!750399 res!506155) b!750411))

(assert (= (and b!750411 res!506160) b!750395))

(assert (= (and b!750395 c!82504) b!750403))

(assert (= (and b!750395 (not c!82504)) b!750405))

(assert (= (and b!750395 res!506163) b!750409))

(assert (= (and b!750409 res!506156) b!750404))

(assert (= (and b!750404 res!506166) b!750398))

(assert (= (and b!750404 (not res!506170)) b!750415))

(assert (= (and b!750415 (not res!506161)) b!750414))

(assert (= (and b!750414 (not res!506168)) b!750410))

(assert (= (and b!750410 c!82505) b!750397))

(assert (= (and b!750410 (not c!82505)) b!750402))

(assert (= (and b!750410 res!506159) b!750412))

(declare-fun m!700371 () Bool)

(assert (=> b!750408 m!700371))

(declare-fun m!700373 () Bool)

(assert (=> b!750414 m!700373))

(declare-fun m!700375 () Bool)

(assert (=> b!750414 m!700375))

(declare-fun m!700377 () Bool)

(assert (=> b!750401 m!700377))

(declare-fun m!700379 () Bool)

(assert (=> b!750415 m!700379))

(assert (=> b!750415 m!700379))

(declare-fun m!700381 () Bool)

(assert (=> b!750415 m!700381))

(assert (=> b!750413 m!700379))

(assert (=> b!750413 m!700379))

(declare-fun m!700383 () Bool)

(assert (=> b!750413 m!700383))

(assert (=> b!750404 m!700379))

(assert (=> b!750404 m!700379))

(declare-fun m!700385 () Bool)

(assert (=> b!750404 m!700385))

(declare-fun m!700387 () Bool)

(assert (=> b!750404 m!700387))

(declare-fun m!700389 () Bool)

(assert (=> b!750404 m!700389))

(declare-fun m!700391 () Bool)

(assert (=> b!750400 m!700391))

(assert (=> b!750398 m!700379))

(assert (=> b!750398 m!700379))

(declare-fun m!700393 () Bool)

(assert (=> b!750398 m!700393))

(declare-fun m!700395 () Bool)

(assert (=> start!65712 m!700395))

(declare-fun m!700397 () Bool)

(assert (=> start!65712 m!700397))

(declare-fun m!700399 () Bool)

(assert (=> b!750409 m!700399))

(declare-fun m!700401 () Bool)

(assert (=> b!750409 m!700401))

(declare-fun m!700403 () Bool)

(assert (=> b!750409 m!700403))

(assert (=> b!750409 m!700373))

(assert (=> b!750409 m!700401))

(declare-fun m!700405 () Bool)

(assert (=> b!750409 m!700405))

(declare-fun m!700407 () Bool)

(assert (=> b!750406 m!700407))

(assert (=> b!750403 m!700379))

(assert (=> b!750403 m!700379))

(declare-fun m!700409 () Bool)

(assert (=> b!750403 m!700409))

(declare-fun m!700411 () Bool)

(assert (=> b!750407 m!700411))

(assert (=> b!750399 m!700379))

(assert (=> b!750399 m!700379))

(declare-fun m!700413 () Bool)

(assert (=> b!750399 m!700413))

(assert (=> b!750399 m!700413))

(assert (=> b!750399 m!700379))

(declare-fun m!700415 () Bool)

(assert (=> b!750399 m!700415))

(declare-fun m!700417 () Bool)

(assert (=> b!750411 m!700417))

(declare-fun m!700419 () Bool)

(assert (=> b!750412 m!700419))

(declare-fun m!700421 () Bool)

(assert (=> b!750412 m!700421))

(assert (=> b!750405 m!700379))

(assert (=> b!750405 m!700379))

(assert (=> b!750405 m!700381))

(check-sat (not b!750412) (not b!750398) (not b!750413) (not b!750407) (not b!750404) (not start!65712) (not b!750400) (not b!750401) (not b!750409) (not b!750399) (not b!750415) (not b!750406) (not b!750405) (not b!750403) (not b!750408))
(check-sat)
