; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64502 () Bool)

(assert start!64502)

(declare-fun b!726145 () Bool)

(declare-fun e!406557 () Bool)

(declare-fun e!406554 () Bool)

(assert (=> b!726145 (= e!406557 e!406554)))

(declare-fun res!487279 () Bool)

(assert (=> b!726145 (=> (not res!487279) (not e!406554))))

(declare-datatypes ((array!41037 0))(
  ( (array!41038 (arr!19640 (Array (_ BitVec 32) (_ BitVec 64))) (size!20061 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41037)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7237 0))(
  ( (MissingZero!7237 (index!31316 (_ BitVec 32))) (Found!7237 (index!31317 (_ BitVec 32))) (Intermediate!7237 (undefined!8049 Bool) (index!31318 (_ BitVec 32)) (x!62314 (_ BitVec 32))) (Undefined!7237) (MissingVacant!7237 (index!31319 (_ BitVec 32))) )
))
(declare-fun lt!321464 () SeekEntryResult!7237)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41037 (_ BitVec 32)) SeekEntryResult!7237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726145 (= res!487279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19640 a!3186) j!159) mask!3328) (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321464))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726145 (= lt!321464 (Intermediate!7237 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726146 () Bool)

(declare-fun res!487276 () Bool)

(assert (=> b!726146 (=> (not res!487276) (not e!406554))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726146 (= res!487276 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19640 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726147 () Bool)

(declare-fun e!406553 () Bool)

(assert (=> b!726147 (= e!406553 e!406557)))

(declare-fun res!487280 () Bool)

(assert (=> b!726147 (=> (not res!487280) (not e!406557))))

(declare-fun lt!321467 () SeekEntryResult!7237)

(assert (=> b!726147 (= res!487280 (or (= lt!321467 (MissingZero!7237 i!1173)) (= lt!321467 (MissingVacant!7237 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41037 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!726147 (= lt!321467 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726148 () Bool)

(declare-fun e!406555 () Bool)

(assert (=> b!726148 (= e!406554 e!406555)))

(declare-fun res!487281 () Bool)

(assert (=> b!726148 (=> (not res!487281) (not e!406555))))

(declare-fun lt!321461 () SeekEntryResult!7237)

(declare-fun lt!321465 () SeekEntryResult!7237)

(assert (=> b!726148 (= res!487281 (= lt!321461 lt!321465))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321462 () array!41037)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321460 () (_ BitVec 64))

(assert (=> b!726148 (= lt!321465 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321460 lt!321462 mask!3328))))

(assert (=> b!726148 (= lt!321461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321460 mask!3328) lt!321460 lt!321462 mask!3328))))

(assert (=> b!726148 (= lt!321460 (select (store (arr!19640 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726148 (= lt!321462 (array!41038 (store (arr!19640 a!3186) i!1173 k0!2102) (size!20061 a!3186)))))

(declare-fun b!726150 () Bool)

(declare-fun res!487287 () Bool)

(assert (=> b!726150 (=> (not res!487287) (not e!406553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726150 (= res!487287 (validKeyInArray!0 (select (arr!19640 a!3186) j!159)))))

(declare-fun b!726151 () Bool)

(declare-fun res!487275 () Bool)

(assert (=> b!726151 (=> (not res!487275) (not e!406557))))

(assert (=> b!726151 (= res!487275 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20061 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20061 a!3186))))))

(declare-fun b!726152 () Bool)

(declare-fun res!487285 () Bool)

(assert (=> b!726152 (=> (not res!487285) (not e!406557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41037 (_ BitVec 32)) Bool)

(assert (=> b!726152 (= res!487285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726153 () Bool)

(declare-fun res!487278 () Bool)

(assert (=> b!726153 (=> (not res!487278) (not e!406553))))

(declare-fun arrayContainsKey!0 (array!41037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726153 (= res!487278 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726154 () Bool)

(declare-fun e!406551 () Bool)

(declare-fun e!406558 () Bool)

(assert (=> b!726154 (= e!406551 e!406558)))

(declare-fun res!487286 () Bool)

(assert (=> b!726154 (=> (not res!487286) (not e!406558))))

(declare-fun lt!321463 () SeekEntryResult!7237)

(assert (=> b!726154 (= res!487286 (= (seekEntryOrOpen!0 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321463))))

(assert (=> b!726154 (= lt!321463 (Found!7237 j!159))))

(declare-fun b!726155 () Bool)

(declare-fun res!487277 () Bool)

(assert (=> b!726155 (=> (not res!487277) (not e!406553))))

(assert (=> b!726155 (= res!487277 (and (= (size!20061 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20061 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20061 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726156 () Bool)

(declare-fun res!487282 () Bool)

(assert (=> b!726156 (=> (not res!487282) (not e!406557))))

(declare-datatypes ((List!13681 0))(
  ( (Nil!13678) (Cons!13677 (h!14734 (_ BitVec 64)) (t!19987 List!13681)) )
))
(declare-fun arrayNoDuplicates!0 (array!41037 (_ BitVec 32) List!13681) Bool)

(assert (=> b!726156 (= res!487282 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13678))))

(declare-fun b!726149 () Bool)

(declare-fun e!406552 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41037 (_ BitVec 32)) SeekEntryResult!7237)

(assert (=> b!726149 (= e!406552 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) (Found!7237 j!159)))))

(declare-fun res!487274 () Bool)

(assert (=> start!64502 (=> (not res!487274) (not e!406553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64502 (= res!487274 (validMask!0 mask!3328))))

(assert (=> start!64502 e!406553))

(assert (=> start!64502 true))

(declare-fun array_inv!15523 (array!41037) Bool)

(assert (=> start!64502 (array_inv!15523 a!3186)))

(declare-fun b!726157 () Bool)

(assert (=> b!726157 (= e!406558 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321463))))

(declare-fun b!726158 () Bool)

(assert (=> b!726158 (= e!406552 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19640 a!3186) j!159) a!3186 mask!3328) lt!321464))))

(declare-fun b!726159 () Bool)

(get-info :version)

(assert (=> b!726159 (= e!406555 (not (or (not ((_ is Intermediate!7237) lt!321465)) (bvsge x!1131 (x!62314 lt!321465)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!726159 e!406551))

(declare-fun res!487283 () Bool)

(assert (=> b!726159 (=> (not res!487283) (not e!406551))))

(assert (=> b!726159 (= res!487283 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24764 0))(
  ( (Unit!24765) )
))
(declare-fun lt!321466 () Unit!24764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24764)

(assert (=> b!726159 (= lt!321466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726160 () Bool)

(declare-fun res!487273 () Bool)

(assert (=> b!726160 (=> (not res!487273) (not e!406554))))

(assert (=> b!726160 (= res!487273 e!406552)))

(declare-fun c!79809 () Bool)

(assert (=> b!726160 (= c!79809 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726161 () Bool)

(declare-fun res!487284 () Bool)

(assert (=> b!726161 (=> (not res!487284) (not e!406553))))

(assert (=> b!726161 (= res!487284 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64502 res!487274) b!726155))

(assert (= (and b!726155 res!487277) b!726150))

(assert (= (and b!726150 res!487287) b!726161))

(assert (= (and b!726161 res!487284) b!726153))

(assert (= (and b!726153 res!487278) b!726147))

(assert (= (and b!726147 res!487280) b!726152))

(assert (= (and b!726152 res!487285) b!726156))

(assert (= (and b!726156 res!487282) b!726151))

(assert (= (and b!726151 res!487275) b!726145))

(assert (= (and b!726145 res!487279) b!726146))

(assert (= (and b!726146 res!487276) b!726160))

(assert (= (and b!726160 c!79809) b!726158))

(assert (= (and b!726160 (not c!79809)) b!726149))

(assert (= (and b!726160 res!487273) b!726148))

(assert (= (and b!726148 res!487281) b!726159))

(assert (= (and b!726159 res!487283) b!726154))

(assert (= (and b!726154 res!487286) b!726157))

(declare-fun m!679703 () Bool)

(assert (=> b!726153 m!679703))

(declare-fun m!679705 () Bool)

(assert (=> b!726146 m!679705))

(declare-fun m!679707 () Bool)

(assert (=> b!726156 m!679707))

(declare-fun m!679709 () Bool)

(assert (=> b!726150 m!679709))

(assert (=> b!726150 m!679709))

(declare-fun m!679711 () Bool)

(assert (=> b!726150 m!679711))

(declare-fun m!679713 () Bool)

(assert (=> b!726152 m!679713))

(assert (=> b!726149 m!679709))

(assert (=> b!726149 m!679709))

(declare-fun m!679715 () Bool)

(assert (=> b!726149 m!679715))

(assert (=> b!726157 m!679709))

(assert (=> b!726157 m!679709))

(declare-fun m!679717 () Bool)

(assert (=> b!726157 m!679717))

(assert (=> b!726154 m!679709))

(assert (=> b!726154 m!679709))

(declare-fun m!679719 () Bool)

(assert (=> b!726154 m!679719))

(declare-fun m!679721 () Bool)

(assert (=> b!726147 m!679721))

(assert (=> b!726158 m!679709))

(assert (=> b!726158 m!679709))

(declare-fun m!679723 () Bool)

(assert (=> b!726158 m!679723))

(declare-fun m!679725 () Bool)

(assert (=> start!64502 m!679725))

(declare-fun m!679727 () Bool)

(assert (=> start!64502 m!679727))

(declare-fun m!679729 () Bool)

(assert (=> b!726161 m!679729))

(assert (=> b!726145 m!679709))

(assert (=> b!726145 m!679709))

(declare-fun m!679731 () Bool)

(assert (=> b!726145 m!679731))

(assert (=> b!726145 m!679731))

(assert (=> b!726145 m!679709))

(declare-fun m!679733 () Bool)

(assert (=> b!726145 m!679733))

(declare-fun m!679735 () Bool)

(assert (=> b!726159 m!679735))

(declare-fun m!679737 () Bool)

(assert (=> b!726159 m!679737))

(declare-fun m!679739 () Bool)

(assert (=> b!726148 m!679739))

(declare-fun m!679741 () Bool)

(assert (=> b!726148 m!679741))

(declare-fun m!679743 () Bool)

(assert (=> b!726148 m!679743))

(assert (=> b!726148 m!679741))

(declare-fun m!679745 () Bool)

(assert (=> b!726148 m!679745))

(declare-fun m!679747 () Bool)

(assert (=> b!726148 m!679747))

(check-sat (not start!64502) (not b!726156) (not b!726159) (not b!726161) (not b!726148) (not b!726152) (not b!726147) (not b!726149) (not b!726154) (not b!726150) (not b!726158) (not b!726153) (not b!726145) (not b!726157))
(check-sat)
